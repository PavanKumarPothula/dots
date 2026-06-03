return {
  {
    'mfussenegger/nvim-dap',
    dependencies = {
      'rcarriga/nvim-dap-ui',
      'nvim-neotest/nvim-nio',
    },
    keys = {
      { '<F5>',       function() require('dap').continue()          end, desc = 'DAP: Continue / Start' },
      { '<F10>',      function() require('dap').step_over()         end, desc = 'DAP: Step Over' },
      { '<F11>',      function() require('dap').step_into()         end, desc = 'DAP: Step Into' },
      { '<S-F11>',    function() require('dap').step_out()          end, desc = 'DAP: Step Out' },
      { '<leader>db', function() require('dap').toggle_breakpoint() end, desc = 'DAP: Toggle Breakpoint' },
      { '<leader>dB', function()
          require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))
        end, desc = 'DAP: Conditional Breakpoint' },
      { '<leader>dr', function() require('dap').repl.open() end, desc = 'DAP: Open REPL' },
      { '<leader>du', function() require('dapui').toggle() end, desc = 'DAP: Toggle UI' },
    },
    config = function()
      local dap   = require('dap')
      local dapui = require('dapui')

      dapui.setup()

      dap.listeners.before.attach.dapui_config           = function() dapui.open()  end
      dap.listeners.before.launch.dapui_config           = function() dapui.open()  end
      dap.listeners.before.event_terminated.dapui_config = function() dapui.close() end
      dap.listeners.before.event_exited.dapui_config     = function() dapui.close() end

      vim.fn.sign_define('DapBreakpoint',          { text = '●', texthl = 'DiagnosticError' })
      vim.fn.sign_define('DapBreakpointCondition', { text = '◆', texthl = 'DiagnosticWarn'  })
      vim.fn.sign_define('DapStopped',             { text = '▶', texthl = 'DiagnosticInfo', linehl = 'Visual' })

      dap.adapters['probe-rs-debug'] = {
        type = 'server',
        port = '${port}',
        executable = {
          command = vim.fn.expand('~/.cargo/bin/probe-rs'),
          args    = { 'dap-server', '--port', '${port}' },
        },
      }

      require('dap.ext.vscode').type_to_filetypes['probe-rs-debug'] = { 'rust' }

      dap.configurations.rust = {
        {
          type    = 'probe-rs-debug',
          request = 'launch',
          name    = 'probe-rs Test',
          cwd     = '${workspaceFolder}',
          connectUnderReset = true,
          chip              = 'esp32s3',
          consoleLogLevel   = 'Console',
          flashingConfig = {
            flashingEnabled      = true,
            verifyBeforeFlashing = true,
            verifyAfterFlashing  = true,
            haltAfterReset       = true,
          },
          coreConfigs = {
            {
              coreIndex      = 0,
              programBinary  = './target/xtensa-esp32s3-none-elf/debug/okja',
              rttEnabled     = true,
              catchHardfault = true,
              catchReset     = false,
            },
          },
        },
      }
    end,
  },
}
