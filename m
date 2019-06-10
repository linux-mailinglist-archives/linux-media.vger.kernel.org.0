Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1E3563ACF1
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2019 04:23:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387459AbfFJCXy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 9 Jun 2019 22:23:54 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:41198 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S2387400AbfFJCXy (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 9 Jun 2019 22:23:54 -0400
X-UUID: 6f576301f671450b9832cd4ea88ba5a2-20190610
X-UUID: 6f576301f671450b9832cd4ea88ba5a2-20190610
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw02.mediatek.com
        (envelope-from <ck.hu@mediatek.com>)
        (mhqrelay.mediatek.com ESMTP with TLS)
        with ESMTP id 1154122596; Mon, 10 Jun 2019 10:23:45 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 10 Jun 2019 10:23:37 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Mon, 10 Jun 2019 10:23:37 +0800
Message-ID: <1560133417.15622.14.camel@mtksdaap41>
Subject: Re: [RFC PATCH V3 3/4] dt-bindings: mt8183: Add sensor interface
 dt-bindings
From:   CK Hu <ck.hu@mediatek.com>
To:     Louis Kuo <louis.kuo@mediatek.com>
CC:     <hans.verkuil@cisco.com>,
        <laurent.pinchart+renesas@ideasonboard.com>, <tfiga@chromium.org>,
        <keiichiw@chromium.org>, <matthias.bgg@gmail.com>,
        <mchehab@kernel.org>, <devicetree@vger.kernel.org>,
        <Sean.Cheng@mediatek.com>, <Rynn.Wu@mediatek.com>,
        <srv_heupstream@mediatek.com>, <holmes.chiou@mediatek.com>,
        <Jerry-ch.Chen@mediatek.com>, <jungo.lin@mediatek.com>,
        <sj.huang@mediatek.com>, <yuzhao@chromium.org>,
        <linux-mediatek@lists.infradead.org>, <zwisler@chromium.org>,
        <christie.yu@mediatek.com>, <frederic.chen@mediatek.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-media@vger.kernel.org>
Date:   Mon, 10 Jun 2019 10:23:37 +0800
In-Reply-To: <1559815233-24796-4-git-send-email-louis.kuo@mediatek.com>
References: <1559815233-24796-1-git-send-email-louis.kuo@mediatek.com>
         <1559815233-24796-4-git-send-email-louis.kuo@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-SNTS-SMTP: 02FDE1C27A1448A250FA92903D2991FB87D4028A23E49B3CE3A1556C5DBB5EC42000:8
X-MTK:  N
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi, Louis:

It looks like that "mediatek,mt8183-seninf" has many common part with
"mediatek,mt2712-mipicsi" [1] and "mediatek,mt2712-mipicsi-common" [2].

The evidence comes from each driver.

The register definition of mipi_rx phy is

"mediatek,mt2712-mipicsi"

+#define MIPI_RX_ANA00_CSI				0x00
+#define MIPI_RX_ANA04_CSI				0x04
+#define MIPI_RX_ANA08_CSI				0x08
+#define MIPI_RX_ANA0C_CSI				0x0c
+#define MIPI_RX_ANA10_CSI				0x10
+#define MIPI_RX_ANA20_CSI				0x20
+#define MIPI_RX_ANA24_CSI				0x24

"mediatek,mt8183-seninf"

+#define MIPI_RX_ANA00_CSI0A           0x0000
+#define MIPI_RX_ANA04_CSI0A           0x0004
+#define MIPI_RX_ANA08_CSI0A           0x0008
+#define MIPI_RX_ANA0C_CSI0A           0x000C
+#define MIPI_RX_ANA10_CSI0A           0x0010
+#define MIPI_RX_ANA20_CSI0A           0x0020
+#define MIPI_RX_ANA24_CSI0A           0x0024

The register definition of sensor interface top is

"mediatek,mt2712-mipicsi-common"

+#define SENINF_TOP_CTRL					0x00
+#define SENINF_TOP_CMODEL_PAR				0x04
+#define SENINF_TOP_MUX					0x08
+
+#define SENINF_MUX_CTRL					0x00

"mediatek,mt8183-seninf"

+#define SENINF_TOP_CTRL                        0x0000
+#define SENINF_TOP_CMODEL_PAR                  0x0004
+#define SENINF_TOP_MUX_CTRL                    0x0008
+#define rsv_000C                               0x000C
+#define SENINF_TOP_CAM_MUX_CTRL                0x0010

The register definition of csi is

"mediatek,mt2712-mipicsi"

+#define SENINF_NCSI2_CTL				0xA0
+#define SENINF_NCSI2_LNRD_TIMING			0xA8
+#define SENINF_NCSI2_INT_EN				0xB0
+#define SENINF_NCSI2_INT_STATUS				0xB4
+#define SENINF_NCSI2_DBG_SEL				0xB8
+#define SENINF_NCSI2_HSRX_DBG				0xD8
+#define SENINF_NCSI2_DI					0xDC
+#define SENINF_NCSI2_DI_CTRL				0xE4

"mediatek,mt8183-seninf"

+#define SENINF1_CSI2_CTL                       0x0A00
+#define SENINF1_CSI2_LNRD_TIMING               0x0A08
+#define SENINF1_CSI2_INT_EN                    0x0A10
+#define SENINF1_CSI2_INT_STATUS                0x0A14
+#define SENINF1_CSI2_DGB_SEL                   0x0A18
+#define SENINF1_CSI2_HSRX_DBG                  0x0A38
+#define SENINF1_CSI2_DI                        0x0A3C
+#define SENINF1_CSI2_DI_CTRL                   0x0A44

Because they have many common part, the common part should be merged and
keep the different part for each SoC. Here is an example for common part
and different part.

Mtk_hdmi_phy (Common part)
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpu/drm/mediatek/mtk_hdmi_phy.c?h=v5.2-rc4
Mtk_hdmi_phy (MT2701 part)
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpu/drm/mediatek/mtk_mt2701_hdmi_phy.c?h=v5.2-rc4
Mtk_hdmi_phy (MT8173 part)
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpu/drm/mediatek/mtk_mt8173_hdmi_phy.c?h=v5.2-rc4

So the first step is to common the binding document. Maybe you should
discuss with Stu to achieve this target.

[1] https://patchwork.kernel.org/patch/10974567/
[2] https://patchwork.kernel.org/patch/10974559/

Regards,
CK

On Thu, 2019-06-06 at 18:00 +0800, Louis Kuo wrote:
> This patch adds the DT binding documentation for the sensor interface
> module in Mediatek SoCs.
> 
> Signed-off-by: Louis Kuo <louis.kuo@mediatek.com>
> ---
>  .../devicetree/bindings/media/mediatek-seninf.txt  | 31 ++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek-seninf.txt
> 
> diff --git a/Documentation/devicetree/bindings/media/mediatek-seninf.txt b/Documentation/devicetree/bindings/media/mediatek-seninf.txt
> new file mode 100644
> index 0000000..979063a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/mediatek-seninf.txt
> @@ -0,0 +1,31 @@
> +* Mediatek seninf MIPI-CSI2 host driver
> +
> +Seninf MIPI-CSI2 host driver is a HW camera interface controller. It support a widely adopted,
> +simple, high-speed protocol primarily intended for point-to-point image and video
> +transmission between cameras and host devices.
> +
> +Required properties:
> +  - compatible: "mediatek,mt8183-seninf"
> +  - reg: Must contain an entry for each entry in reg-names.
> +  - reg-names: Must include the following entries:
> +    "base_reg": seninf registers base
> +    "rx_reg": Rx analog registers base
> +  - interrupts: interrupt number to the cpu.
> +  - clocks : clock name from clock manager
> +  - clock-names: must be CLK_CAM_SENINF and CLK_TOP_MUX_SENINF.
> +    It is the clocks of seninf
> +
> +Example:
> +	seninf: seninf@1a040000 {
> +		compatible = "mediatek,mt8183-seninf";
> +		reg = <0 0x1a040000 0 0x8000>,
> +		      <0 0x11C80000 0 0x6000>;
> +		reg-names = "base_reg", "rx_reg";
> +		interrupts = <GIC_SPI 251 IRQ_TYPE_LEVEL_LOW>;
> +		power-domains = <&scpsys MT8183_POWER_DOMAIN_CAM>;
> +		clocks =
> +				<&camsys CLK_CAM_SENINF>, <&topckgen CLK_TOP_MUX_SENINF>;
> +		clock-names =
> +			"CLK_CAM_SENINF", "CLK_TOP_MUX_SENINF";
> +	}
> +


