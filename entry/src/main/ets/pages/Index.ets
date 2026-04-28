// Index.ets - MuseAI 首页
import { router } from '@kit.ArkUI'
@Entry
@Component
struct Index {
  @State selectedTab: number = 0
  build() {
    Column() {
      // ── 顶部标题区 ──
      Column() {
        Text('MUSE 暮色')
          .fontSize(32)
          .fontWeight(FontWeight.Bold)
          .fontColor('#FFFFFF')
        Text('你的 AI 声音创作引擎')
          .fontSize(14)
          .fontColor('#AAAAAA')
          .margin({ top: 4 })
      }
      .width('100%')
      .padding({ top: 60, bottom: 30, left: 24, right: 24 })
      .alignItems(HorizontalAlign.Start)

      // ── 功能卡片区 ──
      Column() {

        // 使用Grid布局
        Row() {
          FeatureCard({
            emoji: '🎵',
            title: '氛围音乐',
            subtitle: '描述场景，生成专属音乐',
            bgColor: '#1A1A2E',
            onTap: () => router.pushUrl({ url: 'pages/AmbientMusic' })
          })
            .layoutWeight(1)
            .margin({ right: 8 })

          FeatureCard({
            emoji: '🎮',
            title: '游戏音效',
            subtitle: 'AI 一键生成音效包',
            bgColor: '#16213E',
            onTap: () => router.pushUrl({ url: 'pages/GameSound' })
          })
            .layoutWeight(1)
            .margin({ left: 8 })
        }
        .width('100%')
        .margin({ bottom: 16 })

        FeatureCard({
          emoji: '🎬',
          title: '视频自动配乐',
          subtitle: '上传视频，AI 分析情绪自动配乐',
          bgColor: '#0F3460',
          onTap: () => router.pushUrl({ url: 'pages/VideoMusic' })
        })
          .width('100%')

      }
      .width('100%')
      .padding({ left: 24, right: 24 })
      // ── 素材库入口 ──
      Button() {
        Row() {
          Text('📁')
            .fontSize(20)
          Column() {
            Text('我的素材库')
              .fontSize(16)
              .fontWeight(FontWeight.Medium)
              .fontColor('#FFFFFF')
            Text('查看所有生成的音频')
              .fontSize(12)
              .fontColor('#888888')
          }
          .alignItems(HorizontalAlign.Start)
          .margin({ left: 12 })
          .layoutWeight(1)

          Text('›')
            .fontSize(20)
            .fontColor('#888888')
        }
        .width('100%')
      }
      .onClick(() => {
        router.pushUrl({ url: 'pages/Library' })
      })
      .width('100%')
      .padding(16)
      .margin({ top: 24, left: 24, right: 24 })
      .backgroundColor('#1C1C1C')
      .borderRadius(12)
      .border({ width: 0 })
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#0D0D0D')
  }
}

//── 可复用的功能卡片组件 ──
@Component
struct FeatureCard {
  emoji: string = ''
  title: string = ''
  subtitle: string = ''
  bgColor: string = '#1A1A2E'
  onTap: () => void = () => {}

  build() {
    Button() {
      Column() {
        Text(this.emoji)
          .fontSize(36)
          .margin({ bottom: 8 })
        Text(this.title)
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
          .fontColor('#FFFFFF')
          .margin({ top: 6 })
        Text(this.subtitle)
          .fontSize(12)
          .fontColor('#AAAAAA')
          .margin({ top: 4 })
          .textAlign(TextAlign.Center)
      }
      .padding(20)
      .backgroundColor(this.bgColor)
      .borderRadius(16)
      .alignItems(HorizontalAlign.Center)
      .justifyContent(FlexAlign.Center)
      .width('100%')
    }
    .onClick(() => this.onTap())
    .border({ width: 0 })
    .backgroundColor(this.bgColor)
  }
}