Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7A6BF1CFDB
	for <lists+linux-media@lfdr.de>; Tue, 14 May 2019 21:28:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726148AbfENT2J (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 May 2019 15:28:09 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:46564 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726013AbfENT2I (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 May 2019 15:28:08 -0400
Received: by mail-ot1-f67.google.com with SMTP id j49so8708387otc.13;
        Tue, 14 May 2019 12:28:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=6guL+gsRRdFgD/vbMcouXTpctp515ym8MFo367/IsYI=;
        b=XCkZaxwULDPYRZb067kbo6f1iOGhzy8TDqEJszrAL8+UQYZm5LIvIOjAMkJvw7ugiw
         DCFM42XxTaa6T8Wbj9ppFxR//WXl/Jt0AkXY9v9mIN+2rkYe1AkUKzn3sBNBVOuT7UiF
         B2YNFV4niXF6mOzIoNCvZzb60KsS0ESJ9aYX0gYFdN/ubmK7kZ77/GmVD+QK2cY78iJ/
         KryAzhdflfNQ0Iuzu0Tw3CWbpAahkPTzF1JrFIau0yyfrw9gL/wc+CuFtMVPMZB81dZ7
         R+J2H9NCF/ic4p2Yr9t48Yf2lKtQareOY/p4CzL7mVuBQp5kxIMUCb5ECxf2K0iKFdiS
         CvFA==
X-Gm-Message-State: APjAAAVXnp48g5wlMEY3Eh/u82Pt/IkRjjAxW7oGz0Qt8eUptb5/VhfQ
        J2MNaXMfdmbnn8BE6n3Z1w==
X-Google-Smtp-Source: APXvYqzyZC245V0LNnDn7RBEDPgVXsCYD9n7cuZSuXUT9DCdxNCo/SfksSuwpVn2D9oIv/Gggi50ng==
X-Received: by 2002:a9d:4d02:: with SMTP id n2mr169374otf.332.1557862087618;
        Tue, 14 May 2019 12:28:07 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id a2sm3731953otf.50.2019.05.14.12.28.06
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 May 2019 12:28:06 -0700 (PDT)
Date:   Tue, 14 May 2019 14:28:06 -0500
From:   Rob Herring <robh@kernel.org>
To:     Stu Hsieh <stu.hsieh@mediatek.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        CK Hu <ck.hu@mediatek.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com
Subject: Re: [PATCH v3 01/13] dt-bindings: media: Add binding for MT2712
 MIPI-CSI2
Message-ID: <20190514192806.GA13654@bogus>
References: <1557814430-9675-1-git-send-email-stu.hsieh@mediatek.com>
 <1557814430-9675-2-git-send-email-stu.hsieh@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1557814430-9675-2-git-send-email-stu.hsieh@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, May 14, 2019 at 02:13:38PM +0800, Stu Hsieh wrote:
> Add MIPI-CSI2 dt-binding for Mediatek MT2712 SoC
> 
> Signed-off-by: Stu Hsieh <stu.hsieh@mediatek.com>
> ---
>  .../bindings/media/mediatek-mipicsi-camsv.txt | 53 ++++++++++++++++++
>  .../media/mediatek-mipicsi-common.txt         | 19 +++++++
>  .../bindings/media/mediatek-mipicsi.txt       | 54 +++++++++++++++++++
>  3 files changed, 126 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek-mipicsi-camsv.txt
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek-mipicsi-common.txt
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek-mipicsi.txt
> 
> diff --git a/Documentation/devicetree/bindings/media/mediatek-mipicsi-camsv.txt b/Documentation/devicetree/bindings/media/mediatek-mipicsi-camsv.txt
> new file mode 100644
> index 000000000000..5f34974f12ac
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/mediatek-mipicsi-camsv.txt
> @@ -0,0 +1,53 @@
> +* Mediatek MIPI-CSI2 receiver camsv
> +
> +Mediatek MIPI-CSI2 receiver camsv transfer data to DRAM in Mediatek SoCs
> +
> +Required properties:

compatible?

> +- reg : physical base address of the mipicsi receiver registers and length of
> +  memory mapped region.

How many regions? Looks like 2.

> +- clocks: device clocks, see
> +  Documentation/devicetree/bindings/clock/clock-bindings.txt for details.
> +- interrupts : interrupt number to the interrupt controller.
> +
> +Example:
> +	seninf1_mux_camsv0: seninf_mux_camsv@15002100 {

Node names should be generic.

mipi-csi@...

Or maybe not as that's the last block...

> +		reg = <0 0x15002120 0 0x40>,
> +		      <0 0x15004000 0 0x1000>;
> +		clocks = <&imgsys CLK_IMG_CAM_SV_EN>;
> +		interrupts = <GIC_SPI 222 IRQ_TYPE_LEVEL_LOW>;
> +	};
> +
> +	seninf2_mux_camsv1: seninf_mux_camsv@15002500 {
> +		reg = <0 0x15002520 0 0x40>,
> +		      <0 0x15005000 0 0x1000>;
> +		clocks = <&imgsys CLK_IMG_CAM_SV_EN>;
> +		interrupts = <GIC_SPI 223 IRQ_TYPE_LEVEL_LOW>;
> +	};
> +
> +	seninf3_mux_camsv2: seninf_mux_camsv@15002900 {
> +		reg = <0 0x15002920 0 0x40>,
> +		      <0 0x15006000 0 0x1000>;
> +		clocks = <&imgsys CLK_IMG_CAM_SV1_EN>;
> +		interrupts = <GIC_SPI 268 IRQ_TYPE_LEVEL_LOW>;
> +	};
> +
> +	seninf4_mux_camsv3: seninf_mux_camsv@15002D00 {
> +		reg = <0 0x15002D20 0 0x40>,
> +		      <0 0x15007000 0 0x1000>;
> +		clocks = <&imgsys CLK_IMG_CAM_SV1_EN>;
> +		interrupts = <GIC_SPI 269 IRQ_TYPE_LEVEL_LOW>;
> +	};
> +
> +	seninf5_mux_camsv4: seninf_mux_camsv@15003100 {
> +		reg = <0 0x15003120 0 0x40>,
> +		      <0 0x15008000 0 0x1000>;
> +		clocks = <&imgsys CLK_IMG_CAM_SV2_EN>;
> +		interrupts = <GIC_SPI 270 IRQ_TYPE_LEVEL_LOW>;
> +	};
> +
> +	seninf6_mux_camsv5: seninf_mux_camsv@15003500 {
> +		reg = <0 0x15003520 0 0x40>,
> +		      <0 0x15009000 0 0x1000>;
> +		clocks = <&imgsys CLK_IMG_CAM_SV2_EN>;
> +		interrupts = <GIC_SPI 271 IRQ_TYPE_LEVEL_LOW>;
> +	};
> diff --git a/Documentation/devicetree/bindings/media/mediatek-mipicsi-common.txt b/Documentation/devicetree/bindings/media/mediatek-mipicsi-common.txt
> new file mode 100644
> index 000000000000..a67c744b75f0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/mediatek-mipicsi-common.txt
> @@ -0,0 +1,19 @@
> +* Mediatek MIPI-CSI2 receiver common
> +
> +Mediatek MIPI-CSI2 receiver is the MIPI Signal capture hardware present in Mediatek SoCs
> +
> +Required properties:
> +- compatible: should be "mediatek,mt2712-mipicsi-common"
> +- reg : physical base address of the mipicsi receiver registers and length of
> +  memory mapped region.
> +- clocks: device clocks, see
> +  Documentation/devicetree/bindings/clock/clock-bindings.txt for details.
> +
> +
> +Example:
> +	mipicsi: mipicsi@15002000 {
> +		compatible = "mediatek,mt2712-mipicsi-common", "syscon";
> +		reg = <0 0x15002000 0 0x10>;
> +		clocks = <&imgsys CLK_IMG_SENINF_CAM_EN>,
> +			 <&imgsys CLK_IMG_SENINF_SCAM_EN>;
> +	};
> diff --git a/Documentation/devicetree/bindings/media/mediatek-mipicsi.txt b/Documentation/devicetree/bindings/media/mediatek-mipicsi.txt
> new file mode 100644
> index 000000000000..24741ed62b25
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/mediatek-mipicsi.txt
> @@ -0,0 +1,54 @@
> +* Mediatek MIPI-CSI2 receiver
> +
> +Mediatek MIPI-CSI2 receiver is the MIPI Signal capture hardware present in Mediatek SoCs

What's the difference with this and the prior block? Same text...

> +
> +Required properties:
> +- compatible: should be "mediatek,mt2712-mipicsi"
> +- reg : physical base address of the mipicsi receiver registers and length of
> +  memory mapped region.
> +- power-domains: a phandle to the power domain, see
> +  Documentation/devicetree/bindings/power/power_domain.txt for details.
> +- mediatek,larb: must contain the local arbiters in the current Socs, see
> +  Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.txt
> +  for details.
> +- iommus: should point to the respective IOMMU block with master port as
> +  argument, see Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
> +  for details.
> +- mediatek,seninf_mux_camsv: seninf_mux_camsv the data go through of the mipicsi port

s/_/-/

How many entries? Needs a reference to the binding doc. 

> +- mediatek,mipicsiid: the id of the mipicsi port

If this is for the 'mediatek,mipicsi' block, then just make the id a 
cell value in the 'mediatek,mipicsi' prop.

> +- mediatek,mipicsi: the common component of the two mipicsi port
> +
> +Example:

I'd prefer one complete example showing all 3 components in this file 
rather than piecemeal.

> +	mipicsi0: mipicsi@10217000 {
> +		compatible = "mediatek,mt2712-mipicsi";
> +		mediatek,mipicsi = <&mipicsi>;
> +		iommus = <&iommu0 M4U_PORT_CAM_DMA0>,
> +			 <&iommu0 M4U_PORT_CAM_DMA1>;
> +		mediatek,larb = <&larb2>;
> +		power-domains = <&scpsys MT2712_POWER_DOMAIN_ISP>;
> +
> +		mediatek,seninf_mux_camsv = <&seninf1_mux_camsv0
> +					     &seninf2_mux_camsv1
> +					     &seninf3_mux_camsv2
> +					     &seninf4_mux_camsv3>;
> +		reg = <0 0x10217000 0 0x60>,
> +		      <0 0x15002100 0 0x4>,
> +		      <0 0x15002300 0 0x100>;
> +		mediatek,mipicsiid = <0>;
> +		status="disabled";

Don't should status in examples.

> +	};
> +
> +	mipicsi1: mipicsi@10218000 {

This example doesn't add anything.

> +		compatible = "mediatek,mt2712-mipicsi";
> +		mediatek,mipicsi = <&mipicsi>;
> +		iommus = <&iommu0 M4U_PORT_CAM_DMA2>;
> +		mediatek,larb = <&larb2>;
> +		power-domains = <&scpsys MT2712_POWER_DOMAIN_ISP>;
> +		mediatek,seninf_mux_camsv = <&seninf5_mux_camsv4
> +					     &seninf6_mux_camsv5>;
> +		reg = <0 0x10218000 0 0x60>,
> +		      <0 0x15002500 0 0x4>,
> +		      <0 0x15002700 0 0x100>;
> +		mediatek,mipicsiid = <1>;
> +		status="disabled";
> +	};
> \ No newline at end of file

Fix this...

> -- 
> 2.18.0
> 
