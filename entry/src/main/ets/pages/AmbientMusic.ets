import router from '@ohos.router'

@Entry
@Component
struct AmbientMusic {
  @State inputText: string = ''
  @State isLoading: boolean = false
  @State generatedList:Array<string>=[]

  // 模拟生成（后面替换成真实 API）
  simulateGenerate() {
    if (this.inputText === '') return

    this.isLoading = true


    // 模拟 2 秒网络请求
    setTimeout(() => {
      this.isLoading = false
      this.generatedList.unshift('「' + this.inputText + '」氛围曲')
    }, 2000)
  }

  build() {
    Column() {

      // ── 顶部导航 ──
      Row() {
        Text('←')
          .fontSize(24)
          .fontColor('#FFFFFF')
          .onClick(() => router.back())
        Text('🎵 氛围音乐生成')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .fontColor('#FFFFFF')
          .margin({ left: 16 })
      }
      .width('100%')
      .padding({
        top: 60,
        bottom: 20,
        left: 24,
        right: 24
      })

      // ── 输入区域 ──
      Column() {
        Text('描述你想要的氛围')
          .fontSize(14)
          .fontColor('#AAAAAA')
          .alignSelf(ItemAlign.Start)
          .margin({ bottom: 8 })

        TextArea({ placeholder: '例如：雨天咖啡厅，安静放松，钢琴轻音乐...' })
          .width('100%')
          .height(120)
          .fontSize(15)
          .fontColor('#FFFFFF')
          .placeholderColor('#555555')
          .backgroundColor('#1C1C1C')
          .borderRadius(12)
          .padding(12)
          .onChange((val) => {
            this.inputText = val
          })

        // 快捷标签
        Row() {
          ForEach(['🌧 雨天', '☕ 咖啡厅', '🌙 深夜', '🎮 游戏'], (tag: string) => {
            Text(tag)
              .fontSize(12)
              .fontColor('#AAAAAA')
              .padding({
                left: 10,
                right: 10,
                top: 6,
                bottom: 6
              })
              .backgroundColor('#2A2A2A')
              .borderRadius(20)
              .margin({ right: 8 })
              .onClick(() => {
                this.inputText = tag.substring(2)
              })
          })
        }
        .margin({ top: 12 })

        // 生成按钮
        Button(this.isLoading ? '生成中...' : '✨ 开始生成')
          .width('100%')
          .height(50)
          .fontSize(16)
          .fontColor('#FFFFFF')
          .backgroundColor(this.isLoading ? '#444444' : '#6C63FF')
          .borderRadius(12)
          .margin({ top: 20 })
          .enabled(!this.isLoading)
          .onClick(() => this.simulateGenerate())
      }
      .width('100%')
      .padding({ left: 24, right: 24 })

      // ── 生成结果区域 ──
      // 替换掉原来的 if (this.isGenerated) 整段
      if (this.generatedList.length > 0) {
        Column() {
          Text('生成记录')
            .fontSize(14)
            .fontColor('#AAAAAA')
            .alignSelf(ItemAlign.Start)
            .margin({ bottom: 12 })

          ForEach(this.generatedList, (title: string) => {
            Row() {
              Column() {
                Text(title)
                  .fontSize(16)
                  .fontWeight(FontWeight.Bold)
                  .fontColor('#FFFFFF')
                Text('AI 生成 · 免版权')
                  .fontSize(12)
                  .fontColor('#888888')
                  .margin({ top: 4 })
              }
              .layoutWeight(1)
              .alignItems(HorizontalAlign.Start)

              Text('▶')
                .fontSize(24)
                .fontColor('#6C63FF')
            }
            .width('100%')
            .padding(16)
            .backgroundColor('#1C1C1C')
            .borderRadius(12)
            .margin({ bottom: 10 })
          })       // ← ForEach 结束
        }          // ← Column 结束
        .width('100%')
        .padding({ left: 24, right: 24, top: 24 })
        .alignItems(HorizontalAlign.Start)
      }            // ← if 结束

    }              // ← build() 里的最外层 Column 结束
    .width('100%')
    .height('100%')
    .backgroundColor('#0D0D0D')
    .alignItems(HorizontalAlign.Start)
  }                // ← build() 结束
}                // ← struct 结束