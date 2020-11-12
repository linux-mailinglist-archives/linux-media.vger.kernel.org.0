Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40DEF2B0141
	for <lists+linux-media@lfdr.de>; Thu, 12 Nov 2020 09:37:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726028AbgKLIg4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Nov 2020 03:36:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725928AbgKLIg4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Nov 2020 03:36:56 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79E36C0613D1;
        Thu, 12 Nov 2020 00:36:56 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id E6CE41F4610D
Message-ID: <a4760dc55d8122798c42b62d16bfde01a855769f.camel@collabora.com>
Subject: Re: [PATCH v5 05/10] arm64: dts: imx8qxp: Add jpeg encoder/decoder
 nodes
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     "Mirela Rabulea (OSS)" <mirela.rabulea@oss.nxp.com>,
        mchehab@kernel.org, hverkuil-cisco@xs4all.nl, shawnguo@kernel.org,
        robh+dt@kernel.org, p.zabel@pengutronix.de
Cc:     paul.kocialkowski@bootlin.com, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-imx@nxp.com,
        s.hauer@pengutronix.de, aisheng.dong@nxp.com,
        daniel.baluta@nxp.com, robert.chiras@nxp.com,
        laurentiu.palcu@nxp.com, mark.rutland@arm.com,
        devicetree@vger.kernel.org,
        laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se,
        dafna.hirschfeld@collabora.com,
        Mirela Rabulea <mirela.rabulea@nxp.com>
Date:   Thu, 12 Nov 2020 05:36:41 -0300
In-Reply-To: <20201112030557.8540-6-mirela.rabulea@oss.nxp.com>
References: <20201112030557.8540-1-mirela.rabulea@oss.nxp.com>
         <20201112030557.8540-6-mirela.rabulea@oss.nxp.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.3-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mirela,

On Thu, 2020-11-12 at 05:05 +0200, Mirela Rabulea (OSS) wrote:
> From: Mirela Rabulea <mirela.rabulea@nxp.com>
> 
> Add jpeg decoder/encoder nodes, for now on imx8qxp only.
> The same should work on imx8qm, but it was not tested.
> 

Does imx8qm need changes in the dt bindings?

Unless you are aware of reasons preventing us from enabling
it on imx8qm, then we could go for imx8qm as well (reusing
imx8qxp- compatible).

> Signed-off-by: Mirela Rabulea <mirela.rabulea@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx8qxp-mek.dts |  8 ++++
>  arch/arm64/boot/dts/freescale/imx8qxp.dtsi    | 37 +++++++++++++++++++
>  2 files changed, 45 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts b/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
> index 46437d3c7a04..a0ad9789e9b8 100644
> --- a/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
> @@ -270,3 +270,11 @@
>  		>;
>  	};
>  };
> +
> +&jpegdec {
> +	status = "okay";
> +};
> +
> +&jpegenc {
> +	status = "okay";
> +};

Please drop this. See below.

> diff --git a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
> index e46faac1fe71..1d9a16388fa8 100644
> --- a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
> @@ -629,4 +629,41 @@
>  			};
>  		};
>  	};
> +
> +	img_subsys: bus@58000000 {
> +		compatible = "simple-bus";
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges = <0x58000000 0x0 0x58000000 0x1000000>;
> +
> +		jpegdec: jpegdec@58400000 {
> +			compatible = "nxp,imx8qxp-jpgdec";
> +			reg = <0x58400000 0x00050000 >;
> +			interrupts = <GIC_SPI 309 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 310 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 311 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 312 IRQ_TYPE_LEVEL_HIGH>;
> +			power-domains = <&pd IMX_SC_R_MJPEG_DEC_MP>,
> +					<&pd IMX_SC_R_MJPEG_DEC_S0>,
> +					<&pd IMX_SC_R_MJPEG_DEC_S1>,
> +					<&pd IMX_SC_R_MJPEG_DEC_S2>,
> +					<&pd IMX_SC_R_MJPEG_DEC_S3>;
> +			status = "disabled";

Pure memory-to-memory are typically not enabled per-board,
but just per-platform.

So you can drop the disabled status here.

Thanks,
Ezequiel

> +		};
> +
> +		jpegenc: jpegenc@58450000 {
> +			compatible = "nxp,imx8qxp-jpgenc";
> +			reg = <0x58450000 0x00050000 >;
> +			interrupts = <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 306 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 307 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 308 IRQ_TYPE_LEVEL_HIGH>;
> +			power-domains = <&pd IMX_SC_R_MJPEG_ENC_MP>,
> +					<&pd IMX_SC_R_MJPEG_ENC_S0>,
> +					<&pd IMX_SC_R_MJPEG_ENC_S1>,
> +					<&pd IMX_SC_R_MJPEG_ENC_S2>,
> +					<&pd IMX_SC_R_MJPEG_ENC_S3>;
> +			status = "disabled";
> +		};
> +	};
>  };


