import router from '@ohos.router'

@Entry
@Component
struct VideoMusic {
  @State isLoading: boolean = false
  @State isGenerated: boolean = false
  @State videoSelected: boolean = false

  simulateGenerate() {
    this.isLoading = true
    this.isGenerated = false
    setTimeout(() => {
      this.isLoading = false
      this.isGenerated = true
    }, 3000)
  }

  build() {
    Column() {

      // ── 顶部导航 ──
      Row() {
        Text('←')
          .fontSize(24)
          .fontColor('#FFFFFF')
          .onClick(() => router.back())
        Text('🎬 视频自动配乐')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .fontColor('#FFFFFF')
          .margin({ left: 16 })
      }
      .width('100%')
      .padding({ top: 60, bottom: 20, left: 24, right: 24 })

      Column() {

        // ── 视频上传区域 ──
        Column() {
          Text(this.videoSelected ? '✅ 视频已选择' : '📁')
            .fontSize(this.videoSelected ? 16 : 48)
            .fontColor(this.videoSelected ? '#6C63FF' : '#555555')
          if (!this.videoSelected) {
            Text('点击上传视频')
              .fontSize(16)
              .fontColor('#888888')
              .margin({ top: 12 })
            Text('支持 MP4 / MOV 格式')
              .fontSize(12)
              .fontColor('#555555')
              .margin({ top: 4 })
          }
        }
        .width('100%')
        .height(180)
        .backgroundColor('#1C1C1C')
        .borderRadius(16)
        .justifyContent(FlexAlign.Center)
        .alignItems(HorizontalAlign.Center)
        .onClick(() => {
          // 后面接入真实文件选择器
          this.videoSelected = true
        })

        // ── AI 分析说明 ──
        Column() {
          Text('AI 将自动分析：')
            .fontSize(14)
            .fontColor('#AAAAAA')
            .alignSelf(ItemAlign.Start)
            .margin({ bottom: 12 })

          ForEach([
            '🎭  画面情绪（欢快 / 悲伤 / 紧张）',
            '⏱  视频节奏与剪辑频率',
            '🎵  匹配对应风格的背景音乐'
          ], (item: string) => {
            Text(item)
              .fontSize(13)
              .fontColor('#777777')
              .margin({ bottom: 8 })
              .alignSelf(ItemAlign.Start)
          })
        }
        .width('100%')
        .padding(16)
        .backgroundColor('#1A1A1A')
        .borderRadius(12)
        .margin({ top: 20 })

        // 生成按钮
        Button(this.isLoading ? 'AI 分析中...' : '🎬 开始自动配乐')
          .width('100%')
          .height(50)
          .fontSize(16)
          .fontColor('#FFFFFF')
          .backgroundColor(this.videoSelected ? '#6C63FF' : '#444444')
          .borderRadius(12)
          .margin({ top: 20 })
          .enabled(this.videoSelected && !this.isLoading)
          .onClick(() => this.simulateGenerate())

        // ── 生成结果 ──
        if (this.isGenerated) {
          Column() {
            Text('配乐完成 🎶')
              .fontSize(14)
              .fontColor('#AAAAAA')
              .margin({ bottom: 12 })

            Row() {
              Column() {
                Text('视频配乐 · AI 生成')
                  .fontSize(16)
                  .fontWeight(FontWeight.Bold)
                  .fontColor('#FFFFFF')
                Text('情绪匹配 · 免版权')
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
          .margin({ top: 24 })
          .alignItems(HorizontalAlign.Start)
        }

      }
      .width('100%')
      .padding({ left: 24, right: 24 })

    }
    .width('100%')
    .height('100%')
    .backgroundColor('#0D0D0D')
    .alignItems(HorizontalAlign.Start)
  }
}