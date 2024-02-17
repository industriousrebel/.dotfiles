local function split(direction, file)
    local vscode_action = direction == 'h' and 'workbench.action.splitEditorDown' or 'workbench.action.splitEditorRight'
    VSCodeCall(vscode_action)
    if file ~= '' then
        VSCodeExtensionNotify('open-file', expand(file), 'all')
    end
end

local function splitNew(direction, file)
    local filename = file == '' and '__vscode_new__' or file
    split(direction, filename)
end

local function closeOtherEditors()
    VSCodeNotify('workbench.action.closeEditorsInOtherGroups')
    VSCodeNotify('workbench.action.closeOtherEditors')
end

local function manageEditorSize(count, to)
    count = count or 1
    for _ = 1, count do
        local vscode_action = to == 'increase' and 'workbench.action.increaseViewSize' or 'workbench.action.decreaseViewSize'
        VSCodeNotify(vscode_action)
    end
end

command! -complete=file -nargs=? Split lua split('h', <q-args>)
command! -complete=file -nargs=? Vsplit lua split('v', <q-args>)
command! -complete=file -nargs=? New lua split('h', '__vscode_new__')
command! -complete=file -nargs=? Vnew lua split('v', '__vscode_new__')
command! -bang Only if <q-bang> == '!' | lua closeOtherEditors() | else | VSCodeNotify('workbench.action.joinAllGroups') | endif

nnoremap('<silent>', '<C-w>s', '<cmd>lua split("h")<CR>')
xnoremap('<silent>', '<C-w>s', '<cmd>lua split("h")<CR>')

nnoremap('<silent>', '<C-w>v', '<cmd>lua split("v")<CR>')
xnoremap('<silent>', '<C-w>v', '<cmd>lua split("v")<CR>')

nnoremap('<silent>', '<C-w>n', '<cmd>lua splitNew("h", "__vscode_new__")<CR>')
xnoremap('<silent>', '<C-w>n', '<cmd>lua splitNew("h", "__vscode_new__")<CR>')

nnoremap('<silent>', '<C-w>=', '<cmd>lua VSCodeNotify("workbench.action.evenEditorWidths")<CR>')
xnoremap('<silent>', '<C-w>=', '<cmd>lua VSCodeNotify("workbench.action.evenEditorWidths")<CR>')

nnoremap('<silent>', '<C-w>>', '<cmd>lua manageEditorSize(vim.v.count, "increase")<CR>')
xnoremap('<silent>', '<C-w>>', '<cmd>lua manageEditorSize(vim.v.count, "increase")<CR>')
nnoremap('<silent>', '<C-w>+', '<cmd>lua manageEditorSize(vim.v.count, "increase")<CR>')
xnoremap('<silent>', '<C-w>+', '<cmd>lua manageEditorSize(vim.v.count, "increase")<CR>')
nnoremap('<silent>', '<C-w><', '<cmd>lua manageEditorSize(vim.v.count, "decrease")<CR>')
xnoremap('<silent>', '<C-w><', '<cmd>lua manageEditorSize(vim.v.count, "decrease")<CR>')
nnoremap('<silent>', '<C-w>-', '<cmd>lua manageEditorSize(vim.v.count, "decrease")<CR>')
xnoremap('<silent>', '<C-w>-', '<cmd>lua manageEditorSize(vim.v.count, "decrease")<CR>')

-- Better Navigation
nnoremap('<silent>', '<C-j>', '<cmd>lua VSCodeNotify("workbench.action.navigateDown")<CR>')
xnoremap('<silent>', '<C-j>', '<cmd>lua VSCodeNotify("workbench.action.navigateDown")<CR>')
nnoremap('<silent>', '<C-k>', '<cmd>lua VSCodeNotify("workbench.action.navigateUp")<CR>')
xnoremap('<silent>', '<C-k>', '<cmd>lua VSCodeNotify("workbench.action.navigateUp")<CR>')
nnoremap('<silent>', '<C-h>', '<cmd>lua VSCodeNotify("workbench.action.navigateLeft")<CR>')
xnoremap('<silent>', '<C-h>', '<cmd>lua VSCodeNotify("workbench.action.navigateLeft")<CR>')
nnoremap('<silent>', '<C-l>', '<cmd>lua VSCodeNotify("workbench.action.navigateRight")<CR>')
xnoremap('<silent>', '<C-l>', '<cmd>lua VSCodeNotify("workbench.action.navigateRight")<CR>')

-- Bind C-/ to vscode commentary since calling from vscode produces double comments due to multiple cursors
xnoremap('<silent>', '<C-/>', '<cmd>lua Comment()<CR>')
nnoremap('<silent>', '<C-/>', '<cmd>lua Comment()<CR>')

nnoremap('<silent>', '<C-w>_', '<cmd>lua VSCodeNotify("workbench.action.toggleEditorWidths")<CR>')

nnoremap('<silent>', '<Space>', '<cmd>lua VSCodeNotify("whichkey.show")<CR>')
xnoremap('<silent>', '<Space>', '<cmd>lua VSCodeNotify("whichkey.show")<CR>')
local function split(direction, file)
    local vscode_action = direction == 'h' and 'workbench.action.splitEditorDown' or 'workbench.action.splitEditorRight'
    VSCodeCall(vscode_action)
    if file ~= '' then
        VSCodeExtensionNotify('open-file', expand(file), 'all')
    end
end

local function splitNew(direction, file)
    local filename = file == '' and '__vscode_new__' or file
    split(direction, filename)
end

local function closeOtherEditors()
    VSCodeNotify('workbench.action.closeEditorsInOtherGroups')
    VSCodeNotify('workbench.action.closeOtherEditors')
end

local function manageEditorSize(count, to)
    count = count or 1
    for _ = 1, count do
        local vscode_action = to == 'increase' and 'workbench.action.increaseViewSize' or 'workbench.action.decreaseViewSize'
        VSCodeNotify(vscode_action)
    end
end

command! -complete=file -nargs=? Split lua split('h', <q-args>)
command! -complete=file -nargs=? Vsplit lua split('v', <q-args>)
command! -complete=file -nargs=? New lua split('h', '__vscode_new__')
command! -complete=file -nargs=? Vnew lua split('v', '__vscode_new__')
command! -bang Only if <q-bang> == '!' | lua closeOtherEditors() | else | VSCodeNotify('workbench.action.joinAllGroups') | endif

nnoremap('<silent>', '<C-w>s', '<cmd>lua split("h")<CR>')
xnoremap('<silent>', '<C-w>s', '<cmd>lua split("h")<CR>')

nnoremap('<silent>', '<C-w>v', '<cmd>lua split("v")<CR>')
xnoremap('<silent>', '<C-w>v', '<cmd>lua split("v")<CR>')

nnoremap('<silent>', '<C-w>n', '<cmd>lua splitNew("h", "__vscode_new__")<CR>')
xnoremap('<silent>', '<C-w>n', '<cmd>lua splitNew("h", "__vscode_new__")<CR>')

nnoremap('<silent>', '<C-w>=', '<cmd>lua VSCodeNotify("workbench.action.evenEditorWidths")<CR>')
xnoremap('<silent>', '<C-w>=', '<cmd>lua VSCodeNotify("workbench.action.evenEditorWidths")<CR>')

nnoremap('<silent>', '<C-w>>', '<cmd>lua manageEditorSize(vim.v.count, "increase")<CR>')
xnoremap('<silent>', '<C-w>>', '<cmd>lua manageEditorSize(vim.v.count, "increase")<CR>')
nnoremap('<silent>', '<C-w>+', '<cmd>lua manageEditorSize(vim.v.count, "increase")<CR>')
xnoremap('<silent>', '<C-w>+', '<cmd>lua manageEditorSize(vim.v.count, "increase")<CR>')
nnoremap('<silent>', '<C-w><', '<cmd>lua manageEditorSize(vim.v.count, "decrease")<CR>')
xnoremap('<silent>', '<C-w><', '<cmd>lua manageEditorSize(vim.v.count, "decrease")<CR>')
nnoremap('<silent>', '<C-w>-', '<cmd>lua manageEditorSize(vim.v.count, "decrease")<CR>')
xnoremap('<silent>', '<C-w>-', '<cmd>lua manageEditorSize(vim.v.count, "decrease")<CR>')

-- Better Navigation
nnoremap('<silent>', '<C-j>', '<cmd>lua VSCodeNotify("workbench.action.navigateDown")<CR>')
xnoremap('<silent>', '<C-j>', '<cmd>lua VSCodeNotify("workbench.action.navigateDown")<CR>')
nnoremap('<silent>', '<C-k>', '<cmd>lua VSCodeNotify("workbench.action.navigateUp")<CR>')
xnoremap('<silent>', '<C-k>', '<cmd>lua VSCodeNotify("workbench.action.navigateUp")<CR>')
nnoremap('<silent>', '<C-h>', '<cmd>lua VSCodeNotify("workbench.action.navigateLeft")<CR>')
xnoremap('<silent>', '<C-h>', '<cmd>lua VSCodeNotify("workbench.action.navigateLeft")<CR>')
nnoremap('<silent>', '<C-l>', '<cmd>lua VSCodeNotify("workbench.action.navigateRight")<CR>')
xnoremap('<silent>', '<C-l>', '<cmd>lua VSCodeNotify("workbench.action.navigateRight")<CR>')

-- Bind C-/ to vscode commentary since calling from vscode produces double comments due to multiple cursors
xnoremap('<silent>', '<C-/>', '<cmd>lua Comment()<CR>')
nnoremap('<silent>', '<C-/>', '<cmd>lua Comment()<CR>')

nnoremap('<silent>', '<C-w>_', '<cmd>lua VSCodeNotify("workbench.action.toggleEditorWidths")<CR>')

nnoremap('<silent>', '<Space>', '<cmd>lua VSCodeNotify("whichkey.show")<CR>')
xnoremap('<silent>', '<Space>', '<cmd>lua VSCodeNotify("whichkey.show")<CR>')

