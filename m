Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C9A340A71F
	for <lists+linux-media@lfdr.de>; Tue, 14 Sep 2021 09:11:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240530AbhINHMe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Sep 2021 03:12:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240341AbhINHMd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Sep 2021 03:12:33 -0400
Received: from lb1-smtp-cloud8.xs4all.net (lb1-smtp-cloud8.xs4all.net [IPv6:2001:888:0:108::1b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B346C061574;
        Tue, 14 Sep 2021 00:11:15 -0700 (PDT)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id Q2b1mLTPxeJ0cQ2b2mnA5X; Tue, 14 Sep 2021 09:11:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1631603474; bh=JPQZgSS72PjvktvWuD+u+PSyd7cFf3S/v1dIeczmFr8=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=XcWe6D4FUFu0DcmTSi8cWXlgdMM/vEKsN7bAKtr8l+1PL8ShXYHUadZX0RMGS5xSq
         JubiW/LLnHUgvzGdtJhRJG4bV9VFN3NLvlG9ytBn8agPnhTg9vwGsD2kNNHdbMoZiY
         aXOI/cnW5cf3jWbze18sGu60cnUv5hHXNPskS/hRwVn+DSoPaSw7Ltsm4zlbh2YIYN
         jjtu5BGaJ8BFWZrECs/nFlq7Md0w/sK9zLPc5rZgsFefBcCA08BGYz6bd3mwwJJ8pI
         7qHg4oFuGRPOZTxjoeJ95izaK3Z6eMcJvJvmFMDhxmcZNEdN1p6NCAEGdSjUuFwzwS
         BVsVv/8yYW8Ww==
Subject: Re: [PATCH v14 2/2] arm64: dts: imx8: Add jpeg encoder/decoder nodes
To:     "Mirela Rabulea (OSS)" <mirela.rabulea@oss.nxp.com>,
        robh+dt@kernel.org, shawnguo@kernel.org, aisheng.dong@nxp.com,
        guoniu.zhou@nxp.com, linux-arm-kernel@lists.infradead.org,
        mchehab@kernel.org
Cc:     peng.fan@nxp.com, s.hauer@pengutronix.de, linux-imx@nxp.com,
        devicetree@vger.kernel.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, paul.kocialkowski@bootlin.com,
        daniel.baluta@nxp.com, robert.chiras@nxp.com,
        laurentiu.palcu@nxp.com, p.zabel@pengutronix.de,
        ezequiel@collabora.com, kernel@pengutronix.de,
        Mirela Rabulea <mirela.rabulea@nxp.com>
References: <20210619143611.17280-1-mirela.rabulea@oss.nxp.com>
 <20210619143611.17280-3-mirela.rabulea@oss.nxp.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <234f9d23-466d-18e5-e28b-c5e472c3c29c@xs4all.nl>
Date:   Tue, 14 Sep 2021 09:11:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210619143611.17280-3-mirela.rabulea@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfEKmejbbk5FYA3Xg/ggV6LATwhCgP03jePp/LVUlKhyfZkmPA59iE/PS/tUjIGw6Al/9Io/H6lVRMOgtgwppI/vayLSrNES0JnLmw7dMqC1sSvYH4Jzi
 mecxroRRMVAM2Cr+vJtP8AkpUqM9gNbXWlhSdS5xFW+ABFNuRJ3oamshjblh/uz3ysmaFLGeHo9LWU3aH3116/HTybVxha1Tm3yJcJd44qzbJJd+t9hWmW+L
 wlIinPe4GgQ5rxz574RJK34RRGHS/8myRxzEfSC/07d//QW9l6L8NSAYoexT6xBpb9F9ruvOuLfPY29OsTsqOlHWDLReG6zGjgRRDT6tK2c9nILCW3+uLe/h
 tQ2n0UMaL1LSAscmUGkDIAp+DGOs4+ktDuKkdktL0eimnIt1r5TPNchUUZHLVl2z5pB4rg5E4TQvKAhR8MBoY7dOOfZib+oOCdRBz2VigEzAqYGgNJgTpI+W
 1hlxk1LsCOdMtnbZmT8QFovSboHo5pkaG51HYb3PqacOEI72VvMUDhMzVQV8s9seKCE3qM3dI3Rb+jmT+ADPsRehNAJ6dnddOhzVoiVioSohWhTzvp2LVkmU
 z+njrMS/RfaaSHors+2nA+LV92H/iRXrZmipS3BaCzBlwzyTpno5Ktt5vA8MoLbeFsqHvDgv4rmwlZdK7QS8G73OBp0lqR+IOb0S6XTyITrlMFKaG4OwVm7Y
 1C1TEbTtKqwhyHD9ROSv65QtSS1gLHGKIp7iqdlBfiYRkvWWP7MnwZyu+bPe97X+mCF8V4i+7BRD/aWqCAE7ZX4zqVHuKRwCyYs4wghThFkthbIU/2p7Lv5a
 JOH8tUVpxcdYi61MadgtlFrfTBlYmlGhGWmjhXt9oabqxhQ6Aj0wSUPQc5jShbxyqDEje34jG7AQiBjj+KOrfv2Ku+MyQ0NFd2fc0rPCht8bopxkbxoUdc8Q
 03mYfC92RuqiNV7helN4J0E6pqIpUXP3wULMyJPap8LPc850
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mirela,

On 19/06/2021 16:36, Mirela Rabulea (OSS) wrote:
> From: Mirela Rabulea <mirela.rabulea@nxp.com>
> 
> Add dts for imaging subsytem, include jpeg nodes here.
> Tested on imx8qxp/qm.

I've posted a pull request for the first bindings patch for v5.16, so this dts patch can be merged
through whatever tree takes such dts patches.

Regards,

	Hans

> 
> Signed-off-by: Mirela Rabulea <mirela.rabulea@nxp.com>
> ---
> Changes in v14:
>   Address feedback from Aisheng Dong and Ezequiel Garcia:
>     - use imx8 instead of imx in patch subject
>     - keep jpeg and LPCGs used by jpeg enabled by default in platform dts (no change here)
> 
>  .../arm64/boot/dts/freescale/imx8-ss-img.dtsi | 80 +++++++++++++++++++
>  .../boot/dts/freescale/imx8qm-ss-img.dtsi     | 12 +++
>  arch/arm64/boot/dts/freescale/imx8qm.dtsi     |  2 +
>  .../boot/dts/freescale/imx8qxp-ss-img.dtsi    | 13 +++
>  arch/arm64/boot/dts/freescale/imx8qxp.dtsi    |  2 +
>  5 files changed, 109 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi
>  create mode 100644 arch/arm64/boot/dts/freescale/imx8qm-ss-img.dtsi
>  create mode 100644 arch/arm64/boot/dts/freescale/imx8qxp-ss-img.dtsi
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi b/arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi
> new file mode 100644
> index 000000000000..a90654155a88
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi
> @@ -0,0 +1,80 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright 2019-2021 NXP
> + * Zhou Guoniu <guoniu.zhou@nxp.com>
> + */
> +img_subsys: bus@58000000 {
> +	compatible = "simple-bus";
> +	#address-cells = <1>;
> +	#size-cells = <1>;
> +	ranges = <0x58000000 0x0 0x58000000 0x1000000>;
> +
> +	img_ipg_clk: clock-img-ipg {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <200000000>;
> +		clock-output-names = "img_ipg_clk";
> +	};
> +
> +	jpegdec: jpegdec@58400000 {
> +		reg = <0x58400000 0x00050000>;
> +		interrupts = <GIC_SPI 309 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 310 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 311 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 312 IRQ_TYPE_LEVEL_HIGH>;
> +		clocks = <&img_jpeg_dec_lpcg IMX_LPCG_CLK_0>,
> +			 <&img_jpeg_dec_lpcg IMX_LPCG_CLK_4>;
> +		clock-names = "per", "ipg";
> +		assigned-clocks = <&img_jpeg_dec_lpcg IMX_LPCG_CLK_0>,
> +				  <&img_jpeg_dec_lpcg IMX_LPCG_CLK_4>;
> +		assigned-clock-rates = <200000000>, <200000000>;
> +		power-domains = <&pd IMX_SC_R_MJPEG_DEC_MP>,
> +				<&pd IMX_SC_R_MJPEG_DEC_S0>,
> +				<&pd IMX_SC_R_MJPEG_DEC_S1>,
> +				<&pd IMX_SC_R_MJPEG_DEC_S2>,
> +				<&pd IMX_SC_R_MJPEG_DEC_S3>;
> +	};
> +
> +	jpegenc: jpegenc@58450000 {
> +		reg = <0x58450000 0x00050000>;
> +		interrupts = <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 306 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 307 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 308 IRQ_TYPE_LEVEL_HIGH>;
> +		clocks = <&img_jpeg_enc_lpcg IMX_LPC[GIT PULL FOR v5.16]G_CLK_0>,
> +			 <&img_jpeg_enc_lpcg IMX_LPCG_CLK_4>;
> +		clock-names = "per", "ipg";
> +		assigned-clocks = <&img_jpeg_enc_lpcg IMX_LPCG_CLK_0>,
> +				  <&img_jpeg_enc_lpcg IMX_LPCG_CLK_4>;
> +		assigned-clock-rates = <200000000>, <200000000>;
> +		power-domains = <&pd IMX_SC_R_MJPEG_ENC_MP>,
> +				<&pd IMX_SC_R_MJPEG_ENC_S0>,
> +				<&pd IMX_SC_R_MJPEG_ENC_S1>,
> +				<&pd IMX_SC_R_MJPEG_ENC_S2>,
> +				<&pd IMX_SC_R_MJPEG_ENC_S3>;
> +	};
> +
> +	img_jpeg_dec_lpcg: clock-controller@585d0000 {
> +		compatible = "fsl,imx8qxp-lpcg";
> +		reg = <0x585d0000 0x10000>;
> +		#clock-cells = <1>;
> +		clocks = <&img_ipg_clk>, <&img_ipg_clk>;
> +		clock-indices = <IMX_LPCG_CLK_0>,
> +				<IMX_LPCG_CLK_4>;
> +		clock-output-names = "img_jpeg_dec_lpcg_clk",
> +				     "img_jpeg_dec_lpcg_ipg_clk";
> +		power-domains = <&pd IMX_SC_R_MJPEG_DEC_MP>;
> +	};
> +
> +	img_jpeg_enc_lpcg: clock-controller@585f0000 {
> +		compatible = "fsl,imx8qxp-lpcg";
> +		reg = <0x585f0000 0x10000>;
> +		#clock-cells = <1>;
> +		clocks = <&img_ipg_clk>, <&img_ipg_clk>;
> +		clock-indices = <IMX_LPCG_CLK_0>,
> +				<IMX_LPCG_CLK_4>;
> +		clock-output-names = "img_jpeg_enc_lpcg_clk",
> +				     "img_jpeg_enc_lpcg_ipg_clk";
> +		power-domains = <&pd IMX_SC_R_MJPEG_ENC_MP>;
> +	};
> +};
> diff --git a/arch/arm64/boot/dts/freescale/imx8qm-ss-img.dtsi b/arch/arm64/boot/dts/freescale/imx8qm-ss-img.dtsi
> new file mode 100644
> index 000000000000..7764b4146e0a
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8qm-ss-img.dtsi
> @@ -0,0 +1,12 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright 2021 NXP
> + */
> +
> +&jpegdec {
> +	compatible = "nxp,imx8qm-jpgdec", "nxp,imx8qxp-jpgdec";
> +};
> +
> +&jpegenc {
> +	compatible = "nxp,imx8qm-jpgdec", "nxp,imx8qxp-jpgenc";
> +};
> diff --git a/arch/arm64/boot/dts/freescale/imx8qm.dtsi b/arch/arm64/boot/dts/freescale/imx8qm.dtsi
> index 12cd059b339b..aebbe2b84aa1 100644
> --- a/arch/arm64/boot/dts/freescale/imx8qm.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8qm.dtsi
> @@ -166,11 +166,13 @@
>  	};
>  
>  	/* sorted in register address */
> +	#include "imx8-ss-img.dtsi"
>  	#include "imx8-ss-dma.dtsi"
>  	#include "imx8-ss-conn.dtsi"
>  	#include "imx8-ss-lsio.dtsi"
>  };
>  
> +#include "imx8qm-ss-img.dtsi"
>  #include "imx8qm-ss-dma.dtsi"
>  #include "imx8qm-ss-conn.dtsi"
>  #include "imx8qm-ss-lsio.dtsi"
> diff --git a/arch/arm64/boot/dts/freescale/imx8qxp-ss-img.dtsi b/arch/arm64/boot/dts/freescale/imx8qxp-ss-img.dtsi
> new file mode 100644
> index 000000000000..3a087317591d
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8qxp-ss-img.dtsi
> @@ -0,0 +1,13 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright 2021 NXP
> + *	Dong Aisheng <aisheng.dong@nxp.com>
> + */
> +
> +&jpegdec {
> +	compatible = "nxp,imx8qxp-jpgdec";
> +};
> +
> +&jpegenc {
> +	compatible = "nxp,imx8qxp-jpgenc";
> +};
> diff --git a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
> index 1e6b4995091e..a625fb6bdc62 100644
> --- a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
> @@ -258,12 +258,14 @@
>  	};
>  
>  	/* sorted in register address */
> +	#include "imx8-ss-img.dtsi"
>  	#include "imx8-ss-adma.dtsi"
>  	#include "imx8-ss-conn.dtsi"
>  	#include "imx8-ss-ddr.dtsi"
>  	#include "imx8-ss-lsio.dtsi"
>  };
>  
> +#include "imx8qxp-ss-img.dtsi"
>  #include "imx8qxp-ss-adma.dtsi"
>  #include "imx8qxp-ss-conn.dtsi"
>  #include "imx8qxp-ss-lsio.dtsi"
> 

