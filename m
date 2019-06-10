Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 54A613AE92
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2019 07:13:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728344AbfFJFNj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 10 Jun 2019 01:13:39 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:57810 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725320AbfFJFNj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 10 Jun 2019 01:13:39 -0400
X-UUID: db56086f7fe445359d4389e35d45ff21-20190610
X-UUID: db56086f7fe445359d4389e35d45ff21-20190610
Received: from mtkcas08.mediatek.inc [(172.21.101.126)] by mailgw01.mediatek.com
        (envelope-from <ck.hu@mediatek.com>)
        (mhqrelay.mediatek.com ESMTP with TLS)
        with ESMTP id 1115522466; Mon, 10 Jun 2019 13:13:25 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 10 Jun 2019 13:13:17 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Mon, 10 Jun 2019 13:13:17 +0800
Message-ID: <1560143597.11435.2.camel@mtksdaap41>
Subject: Re: [RFC PATCH V3 3/4] dt-bindings: mt8183: Add sensor interface
 dt-bindings
From:   CK Hu <ck.hu@mediatek.com>
To:     Louis Kuo =?UTF-8?Q?=28=E9=83=AD=E5=BE=B7=E5=AF=A7=29?= 
        <louis.kuo@mediatek.com>
CC:     "hans.verkuil@cisco.com" <hans.verkuil@cisco.com>,
        "laurent.pinchart+renesas@ideasonboard.com" 
        <laurent.pinchart+renesas@ideasonboard.com>,
        "tfiga@chromium.org" <tfiga@chromium.org>,
        "keiichiw@chromium.org" <keiichiw@chromium.org>,
        "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Sean Cheng =?UTF-8?Q?=28=E9=84=AD=E6=98=87=E5=BC=98=29?= 
        <Sean.Cheng@mediatek.com>,
        "Rynn Wu =?UTF-8?Q?=28=E5=90=B3=E8=82=B2=E6=81=A9=29?=" 
        <Rynn.Wu@mediatek.com>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        Holmes Chiou =?UTF-8?Q?=28=E9=82=B1=E6=8C=BA=29?= 
        <holmes.chiou@mediatek.com>,
        "Jerry-ch Chen =?UTF-8?Q?=28=E9=99=B3=E6=95=AC=E6=86=B2=29?=" 
        <Jerry-ch.Chen@mediatek.com>,
        Jungo Lin =?UTF-8?Q?=28=E6=9E=97=E6=98=8E=E4=BF=8A=29?= 
        <jungo.lin@mediatek.com>,
        "Sj Huang =?UTF-8?Q?=28=E9=BB=83=E4=BF=A1=E7=92=8B=29?=" 
        <sj.huang@mediatek.com>,
        "yuzhao@chromium.org" <yuzhao@chromium.org>,
        "linux-mediatek@lists.infradead.org" 
        <linux-mediatek@lists.infradead.org>,
        "zwisler@chromium.org" <zwisler@chromium.org>,
        Christie Yu =?UTF-8?Q?=28=E6=B8=B8=E9=9B=85=E6=83=A0=29?= 
        <christie.yu@mediatek.com>,
        Frederic Chen =?UTF-8?Q?=28=E9=99=B3=E4=BF=8A=E5=85=83=29?= 
        <Frederic.Chen@mediatek.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        Stu Hsieh =?UTF-8?Q?=28=E8=AC=9D=E5=8D=9A=E9=88=9E=29?= 
        <Stu.Hsieh@mediatek.com>
Date:   Mon, 10 Jun 2019 13:13:17 +0800
In-Reply-To: <f6c423612aec46ca8e3aa217fffe4897@mtkmbs07n1.mediatek.inc>
References: <1559815233-24796-1-git-send-email-louis.kuo@mediatek.com>
         <1559815233-24796-4-git-send-email-louis.kuo@mediatek.com>
         <1560133417.15622.14.camel@mtksdaap41>
          <f6c423612aec46ca8e3aa217fffe4897@mtkmbs07n1.mediatek.inc>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MTK:  N
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi, Louis:

Please translate your Chinese reply into English. I think not all member
in the mail list understand Chinese.

Regards,
CK

On Mon, 2019-06-10 at 12:11 +0800, Louis Kuo (郭德寧) wrote:
> Hi CK,
> 
> 剛才有跟Stu討論過了, 基本上mt8183 sensor interface driver和MT2712 MIPI-CSI2 driver是兩套不一樣的架構
> 
> 1. mt8183 sensor interface driver處理raw sensor, mt2712 mipi-csi2 driver處理yuv sensor, register設定不相同.
> 2. mt8183 sensor interface driver是獨立的v4l2 sub device, 單純處理phy和mipi-csi2設定, 沒有buffer概念. 後接另外一個isp cam v4l2 driver用來處理及輸出raw image.
> 3. mt2712 mipi-csi2 driver則是合併了mipi-csi2和camsv成一個video device, 需要做query buf/request buf/qbuf/dqbuf輸出yuv buffer, 架構設計上不同,
>   Binding document也無法共用.
> 
> 結論:
> 目前這兩套driver無法共用, 請悉知.
> 
> 
> In MIPI-CSI2 dt-binding for Mediatek MT2712 SoC
> > +Example:
> > +mipicsi0: mipicsi@10217000 {
> > +compatible = "mediatek,mt2712-mipicsi";
> > +mediatek,mipicsi = <&mipicsi>;
> > +iommus = <&iommu0 M4U_PORT_CAM_DMA0>,    <= mt8183 sensor interface driver單獨做phy和mipi-csi2設定, 沒dma output port
> > + <&iommu0 M4U_PORT_CAM_DMA1>;
> > +mediatek,larb = <&larb2>;
> > +power-domains = <&scpsys MT2712_POWER_DOMAIN_ISP>;
> > +
> > +mediatek,seninf_mux_camsv = <&seninf1_mux_camsv0  <=mt8183 sensor driver沒有綁camsv driver
> > +     &seninf2_mux_camsv1
> > +     &seninf3_mux_camsv2
> > +     &seninf4_mux_camsv3>;
> > +reg = <0 0x10217000 0 0x60>,
> > +      <0 0x15002100 0 0x4>,
> > +      <0 0x15002300 0 0x100>;
> > +mediatek,mipicsiid = <0>;
> > +mediatek,mipicsi_max_vc = <4>; <=mt8183 sensor driver不支持vc settings
> > +mediatek,serdes_link_reg = <0x49>;
> > +};
> 
> BRs
> Louis
> 
> -----Original Message-----
> From: Louis Kuo (郭德寧)
> Sent: Monday, June 10, 2019 10:57 AM
> To: 'CK Hu' <ck.hu@mediatek.com>
> Cc: hans.verkuil@cisco.com; laurent.pinchart+renesas@ideasonboard.com; tfiga@chromium.org; keiichiw@chromium.org; matthias.bgg@gmail.com; mchehab@kernel.org; devicetree@vger.kernel.org; Sean Cheng (鄭昇弘) <Sean.Cheng@mediatek.com>; Rynn Wu (吳育恩) <Rynn.Wu@mediatek.com>; srv_heupstream <srv_heupstream@mediatek.com>; Holmes Chiou (邱挺) <holmes.chiou@mediatek.com>; Jerry-ch Chen (陳敬憲) <Jerry-ch.Chen@mediatek.com>; Jungo Lin (林明俊) <jungo.lin@mediatek.com>; Sj Huang (黃信璋) <sj.huang@mediatek.com>; yuzhao@chromium.org; linux-mediatek@lists.infradead.org; zwisler@chromium.org; Christie Yu (游雅惠) <christie.yu@mediatek.com>; Frederic Chen (陳俊元) <frederic.chen@mediatek.com>; linux-arm-kernel@lists.infradead.org; linux-media@vger.kernel.org; Stu Hsieh (謝博鈞) <Stu.Hsieh@mediatek.com>
> Subject: RE: [RFC PATCH V3 3/4] dt-bindings: mt8183: Add sensor interface dt-bindings
> 
> Loop more
> 
> -----Original Message-----
> From: CK Hu [mailto:ck.hu@mediatek.com]
> Sent: Monday, June 10, 2019 10:24 AM
> To: Louis Kuo (郭德寧) <louis.kuo@mediatek.com>
> Cc: hans.verkuil@cisco.com; laurent.pinchart+renesas@ideasonboard.com; tfiga@chromium.org; keiichiw@chromium.org; matthias.bgg@gmail.com; mchehab@kernel.org; devicetree@vger.kernel.org; Sean Cheng (鄭昇弘) <Sean.Cheng@mediatek.com>; Rynn Wu (吳育恩) <Rynn.Wu@mediatek.com>; srv_heupstream <srv_heupstream@mediatek.com>; Holmes Chiou (邱挺) <holmes.chiou@mediatek.com>; Jerry-ch Chen (陳敬憲) <Jerry-ch.Chen@mediatek.com>; Jungo Lin (林明俊) <jungo.lin@mediatek.com>; Sj Huang (黃信璋) <sj.huang@mediatek.com>; yuzhao@chromium.org; linux-mediatek@lists.infradead.org; zwisler@chromium.org; Christie Yu (游雅惠) <christie.yu@mediatek.com>; Frederic Chen (陳俊元) <Frederic.Chen@mediatek.com>; linux-arm-kernel@lists.infradead.org; linux-media@vger.kernel.org
> Subject: Re: [RFC PATCH V3 3/4] dt-bindings: mt8183: Add sensor interface dt-bindings
> 
> Hi, Louis:
> 
> It looks like that "mediatek,mt8183-seninf" has many common part with "mediatek,mt2712-mipicsi" [1] and "mediatek,mt2712-mipicsi-common" [2].
> 
> The evidence comes from each driver.
> 
> The register definition of mipi_rx phy is
> 
> "mediatek,mt2712-mipicsi"
> 
> +#define MIPI_RX_ANA00_CSI0x00
> +#define MIPI_RX_ANA04_CSI0x04
> +#define MIPI_RX_ANA08_CSI0x08
> +#define MIPI_RX_ANA0C_CSI0x0c
> +#define MIPI_RX_ANA10_CSI0x10
> +#define MIPI_RX_ANA20_CSI0x20
> +#define MIPI_RX_ANA24_CSI0x24
> 
> "mediatek,mt8183-seninf"
> 
> +#define MIPI_RX_ANA00_CSI0A           0x0000
> +#define MIPI_RX_ANA04_CSI0A           0x0004
> +#define MIPI_RX_ANA08_CSI0A           0x0008
> +#define MIPI_RX_ANA0C_CSI0A           0x000C
> +#define MIPI_RX_ANA10_CSI0A           0x0010
> +#define MIPI_RX_ANA20_CSI0A           0x0020
> +#define MIPI_RX_ANA24_CSI0A           0x0024
> 
> The register definition of sensor interface top is
> 
> "mediatek,mt2712-mipicsi-common"
> 
> +#define SENINF_TOP_CTRL0x00
> +#define SENINF_TOP_CMODEL_PAR0x04
> +#define SENINF_TOP_MUX0x08
> +
> +#define SENINF_MUX_CTRL0x00
> 
> "mediatek,mt8183-seninf"
> 
> +#define SENINF_TOP_CTRL                        0x0000
> +#define SENINF_TOP_CMODEL_PAR                  0x0004
> +#define SENINF_TOP_MUX_CTRL                    0x0008
> +#define rsv_000C                               0x000C
> +#define SENINF_TOP_CAM_MUX_CTRL                0x0010
> 
> The register definition of csi is
> 
> "mediatek,mt2712-mipicsi"
> 
> +#define SENINF_NCSI2_CTL0xA0
> +#define SENINF_NCSI2_LNRD_TIMING0xA8
> +#define SENINF_NCSI2_INT_EN0xB0
> +#define SENINF_NCSI2_INT_STATUS0xB4
> +#define SENINF_NCSI2_DBG_SEL0xB8
> +#define SENINF_NCSI2_HSRX_DBG0xD8
> +#define SENINF_NCSI2_DI0xDC
> +#define SENINF_NCSI2_DI_CTRL0xE4
> 
> "mediatek,mt8183-seninf"
> 
> +#define SENINF1_CSI2_CTL                       0x0A00
> +#define SENINF1_CSI2_LNRD_TIMING               0x0A08
> +#define SENINF1_CSI2_INT_EN                    0x0A10
> +#define SENINF1_CSI2_INT_STATUS                0x0A14
> +#define SENINF1_CSI2_DGB_SEL                   0x0A18
> +#define SENINF1_CSI2_HSRX_DBG                  0x0A38
> +#define SENINF1_CSI2_DI                        0x0A3C
> +#define SENINF1_CSI2_DI_CTRL                   0x0A44
> 
> Because they have many common part, the common part should be merged and keep the different part for each SoC. Here is an example for common part and different part.
> 
> Mtk_hdmi_phy (Common part)
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpu/drm/mediatek/mtk_hdmi_phy.c?h=v5.2-rc4
> Mtk_hdmi_phy (MT2701 part)
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpu/drm/mediatek/mtk_mt2701_hdmi_phy.c?h=v5.2-rc4
> Mtk_hdmi_phy (MT8173 part)
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpu/drm/mediatek/mtk_mt8173_hdmi_phy.c?h=v5.2-rc4
> 
> So the first step is to common the binding document. Maybe you should discuss with Stu to achieve this target.
> 
> [1] https://patchwork.kernel.org/patch/10974567/
> [2] https://patchwork.kernel.org/patch/10974559/
> 
> Regards,
> CK
> 
> On Thu, 2019-06-06 at 18:00 +0800, Louis Kuo wrote:
> > This patch adds the DT binding documentation for the sensor interface
> > module in Mediatek SoCs.
> >
> > Signed-off-by: Louis Kuo <louis.kuo@mediatek.com>
> > ---
> >  .../devicetree/bindings/media/mediatek-seninf.txt  | 31
> > ++++++++++++++++++++++
> >  1 file changed, 31 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/media/mediatek-seninf.txt
> >
> > diff --git
> > a/Documentation/devicetree/bindings/media/mediatek-seninf.txt
> > b/Documentation/devicetree/bindings/media/mediatek-seninf.txt
> > new file mode 100644
> > index 0000000..979063a
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/mediatek-seninf.txt
> > @@ -0,0 +1,31 @@
> > +* Mediatek seninf MIPI-CSI2 host driver
> > +
> > +Seninf MIPI-CSI2 host driver is a HW camera interface controller. It
> > +support a widely adopted, simple, high-speed protocol primarily
> > +intended for point-to-point image and video transmission between cameras and host devices.
> > +
> > +Required properties:
> > +  - compatible: "mediatek,mt8183-seninf"
> > +  - reg: Must contain an entry for each entry in reg-names.
> > +  - reg-names: Must include the following entries:
> > +    "base_reg": seninf registers base
> > +    "rx_reg": Rx analog registers base
> > +  - interrupts: interrupt number to the cpu.
> > +  - clocks : clock name from clock manager
> > +  - clock-names: must be CLK_CAM_SENINF and CLK_TOP_MUX_SENINF.
> > +    It is the clocks of seninf
> > +
> > +Example:
> > +seninf: seninf@1a040000 {
> > +compatible = "mediatek,mt8183-seninf";
> > +reg = <0 0x1a040000 0 0x8000>,
> > +      <0 0x11C80000 0 0x6000>;
> > +reg-names = "base_reg", "rx_reg";
> > +interrupts = <GIC_SPI 251 IRQ_TYPE_LEVEL_LOW>;
> > +power-domains = <&scpsys MT8183_POWER_DOMAIN_CAM>;
> > +clocks =
> > +<&camsys CLK_CAM_SENINF>, <&topckgen CLK_TOP_MUX_SENINF>;
> > +clock-names =
> > +"CLK_CAM_SENINF", "CLK_TOP_MUX_SENINF";
> > +}
> > +
> 
> 
> *********************MEDIATEK Confidential/Internal Use*********************


