#!/bin/sh

# 定义多行字符串 a 和 b，并去除其中的换行符
string_a="WYSIWYG:\"WYSIWYG\",Write:\"Write\",
Preview:\"Preview\",Headings:\"Headings\",
Paragraph:\"Paragraph\",Bold:\"Bold\",
Italic:\"Italic\",Strike:\"Strike\",
Code:\"Inline code\",Line:\"Line\",
Blockquote:\"Blockquote\",\"Unordered list\":\"Unordered list\",
\"Ordered list\":\"Ordered list\",
Task:\"Task\",Indent:\"Indent\",
Outdent:\"Outdent\",\"Insert link\":\"Insert link\",
\"Insert CodeBlock\":\"Insert codeBlock\",
\"Insert table\":\"Insert table\",
\"Insert image\":\"Insert image\",
Heading:\"Heading\",\"Image URL\":\"Image URL\",
\"Select image file\":\"Select image file\",
\"Choose a file\":\"Choose a file\",\"No file\":\"No file\",
Description:\"Description\",OK:\"OK\",More:\"More\",
Cancel:\"Cancel\",File:\"File\",URL:\"URL\",
\"Link text\":\"Link text\",\"Add row to up\":\"Add row to up\",
\"Add row to down\":\"Add row to down\",
\"Add column to left\":\"Add column to left\",
\"Add column to right\":\"Add column to right\",
\"Remove row\":\"Remove row\",\"Remove column\":\"Remove column\",
\"Align column to left\":\"Align column to left\",
\"Align column to center\":\"Align column to center\",
\"Align column to right\":\"Align column to right\",
\"Remove table\":\"Remove table\",
\"Would you like to paste as table?\":\"Would you like to paste as table?\",
\"Text color\":\"Text color\",
\"Auto scroll enabled\":\"Auto scroll enabled\",
\"Auto scroll disabled\":\"Auto scroll disabled\",
\"Choose language\":\"Choose language\""

string_b="WYSIWYG:\"所见即所得\",Write:\"编辑\",
Preview:\"预览\",Headings:\"标题\",
Paragraph:\"段落\",Bold:\"加粗\",
Italic:\"斜体\",Strike:\"删除线\",
Code:\"行内代码\",Line:\"分割线\",
Blockquote:\"引用块\",\"Unordered list\":\"无序列表\",
\"Ordered list\":\"有序列表\",
Task:\"待办\",Indent:\"缩进\",
Outdent:\"减少缩进\",\"Insert link\":\"插入链接\",
\"Insert CodeBlock\":\"插入代码块\",
\"Insert table\":\"插入表格\",
\"Insert image\":\"插入图片\",
Heading:\"标题\",\"Image URL\":\"图片链接\",
\"Select image file\":\"选择图片文件\",
\"Choose a file\":\"选择文件\",\"No file\":\"无文件\",
Description:\"描述\",OK:\"确定\",More:\"更多\",
Cancel:\"取消\",File:\"文件\",URL:\"链接\",
\"Link text\":\"链接文本\",\"Add row to up\":\"在上方添加行\",
\"Add row to down\":\"在下方添加行\",
\"Add column to left\":\"在左侧添加列\",
\"Add column to right\":\"在右侧添加列\",
\"Remove row\":\"删除行\",\"Remove column\":\"删除列\",
\"Align column to left\":\"左对齐列\",
\"Align column to center\":\"居中对齐列\",
\"Align column to right\":\"右对齐列\",
\"Remove table\":\"删除表格\",
\"Would you like to paste as table?\":\"是否要粘贴为表格？\",
\"Text color\":\"文字颜色\",
\"Auto scroll enabled\":\"自动滚动已启用\",
\"Auto scroll disabled\":\"自动滚动已禁用\",
\"Choose language\":\"选择语言\""

# 使用 tr 删除换行符
string_a=$(echo "$string_a" | tr -d '\n')
string_b=$(echo "$string_b" | tr -d '\n')

# 从脚本参数中获取路径
if [ $# -eq 0 ]; then
  echo "请提供路径作为参数"
  exit 1
fi

search_path="$1"

# 查找指定路径下所有匹配 Note-*.js 的文件
files=""
count=0
first_file=""

for file in "$search_path"/Note-*.js; do
  # 判断是否匹配成功（防止原样输出 *.js）
  if [ -e "$file" ]; then
    count=$((count + 1))
    files="$files$file
"
    if [ -z "$first_file" ]; then
      first_file="$file"
    fi
  fi
done

# 检查是否有匹配的文件
if [ "$count" -eq 0 ]; then
  echo "未找到匹配的文件"
  exit 1
fi

# 输出统计信息
echo "总共匹配到 $count 个文件"
echo ""
echo "所有文件的名称:"
echo "  $files" | sed '/^\s*$/d'
echo ""
# 对第一个文件执行操作
echo "第一个文件的名称: $first_file"
echo "  正在处理文件: $first_file"
sed -i "s|$string_a|$string_b|g" "$first_file"
echo ""
echo "替换完成"
echo ""
