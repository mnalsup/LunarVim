-- Javascript settings

vim.g.javascript_plugin_jsdoc = 1
vim.g.javascript_plugin_ngdoc = 0
vim.g.javascript_plugin_flow = 0
vim.g.closetag_filenames = '*.html,*.xhtml,*.phtml,*.tsx,*.jsx'
vim.g.closetag_xhtml_filenames = '*.xhtml,*.jsx,*.tsx'
vim.g.closetag_filetypes = 'html,xhtml,phtml'
vim.g.closetag_xhtml_filetypes = 'xhtml,jsx'
vim.g.closetag_emptyTags_caseSensitive = 1

-- dict
-- Disables auto-close if not in a "valid" region (based on filetype)
vim.g.closetag_regions = {
  ['typescript.tsx'] = 'jsxRegion,tsxRegion',
  ['javascript.jsx'] = 'jsxRegion',
}

vim.g.coverage_sign_covered = '⦿'
vim.g.coverage_interval = 5000
vim.g.coverage_show_covered = 0
vim.g.coverage_show_uncovered = 1
vim.g.closetag_shortcut = '>'
vim.g.closetag_close_shortcut = '<leader>>'
