import router from '@ohos.router'

@Entry
@Component
struct GameSound {
  @State selectedType: string = ''
  @State inputText: string = ''
  @State isLoading: boolean = false
  @State isGenerated: boolean = false

  simulateGenerate() {
    if (this.selectedType === '') return
    this.isLoading = true
    this.isGenerated = false
    setTimeout(() => {
      this.isLoading = false
      this.isGenerated = true
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
        Text('🎮 游戏音效生成')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .fontColor('#FFFFFF')
          .margin({ left: 16 })
      }
      .width('100%')
      .padding({ top: 60, bottom: 20, left: 24, right: 24 })

      // ── 音效类型选择 ──
      Column() {
        Text('选择音效类型')
          .fontSize(14)
          .fontColor('#AAAAAA')
          .alignSelf(ItemAlign.Start)
          .margin({ bottom: 12 })

        // 第一排
        Row() {
          ForEach(['💥 爆炸', '👣 脚步', '⚔️ 武器', '🌟 魔法'], (tag: string) => {
            Text(tag)
              .fontSize(13)
              .fontColor(this.selectedType === tag ? '#FFFFFF' : '#AAAAAA')
              .padding({ left: 12, right: 12, top: 8, bottom: 8 })
              .backgroundColor(this.selectedType === tag ? '#6C63FF' : '#2A2A2A')
              .borderRadius(20)
              .margin({ right: 8 })
              .onClick(() => { this.selectedType = tag })
          })
        }
        .margin({ bottom: 10 })

        // 第二排
        Row() {
          ForEach(['🌧 环境音', '🎵 背景乐', '🔔 UI音效', '❤️ 回血'], (tag: string) => {
            Text(tag)
              .fontSize(13)
              .fontColor(this.selectedType === tag ? '#FFFFFF' : '#AAAAAA')
              .padding({ left: 12, right: 12, top: 8, bottom: 8 })
              .backgroundColor(this.selectedType === tag ? '#6C63FF' : '#2A2A2A')
              .borderRadius(20)
              .margin({ right: 8 })
              .onClick(() => { this.selectedType = tag })
          })
        }

        // 补充描述
        Text('补充描述（可选）')
          .fontSize(14)
          .fontColor('#AAAAAA')
          .alignSelf(ItemAlign.Start)
          .margin({ top: 20, bottom: 8 })

        TextArea({ placeholder: '例如：沉重的金属碰撞声，带有回响...' })
          .width('100%')
          .height(100)
          .fontSize(15)
          .fontColor('#FFFFFF')
          .placeholderColor('#555555')
          .backgroundColor('#1C1C1C')
          .borderRadius(12)
          .padding(12)
          .onChange((val) => { this.inputText = val })
        // 生成按钮
        Button(this.isLoading ? '生成中...' : '✨ 一键生成音效')
          .width('100%')
          .height(50)
          .fontSize(16)
          .fontColor('#FFFFFF')
          .backgroundColor(this.selectedType === '' ? '#444444' : '#6C63FF')
          .borderRadius(12)
          .margin({ top: 20 })
          .enabled(!this.isLoading && this.selectedType !== '')
          .onClick(() => this.simulateGenerate())
      }
      .width('100%')
      .padding({ left: 24, right: 24 })

      // ── 生成结果 ──
      if (this.isGenerated) {
        Column() {
          Text('生成完成 🎶')
            .fontSize(14)
            .fontColor('#AAAAAA')
            .margin({ bottom: 12 })

          Row() {
            Column() {
              Text(this.selectedType + ' 音效包')
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
        }
        .width('100%')
        .padding({ left: 24, right: 24, top: 32 })
        .alignItems(HorizontalAlign.Start)
      }

    }
    .width('100%')
    .height('100%')
    .backgroundColor('#0D0D0D')
    .alignItems(HorizontalAlign.Start)
  }
}