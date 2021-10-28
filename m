Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5AEF343D91E
	for <lists+linux-media@lfdr.de>; Thu, 28 Oct 2021 04:03:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229691AbhJ1CGS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 Oct 2021 22:06:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229534AbhJ1CGR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 Oct 2021 22:06:17 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 581B8C061570;
        Wed, 27 Oct 2021 19:03:51 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9738C276;
        Thu, 28 Oct 2021 04:03:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1635386626;
        bh=5UFjGoxIACVBiNY+4qv4rZSdiMAoqqZWEfDV5pYwRNs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=EdhDdkNdVAA1mlU3SiJC3b5wCrJzER3M7sXwdWK+uDkxiMKzq9Hb0UHl8VB4mCkON
         cM5Ff1HWD4yNv/hCulSTzuO3xZ5dRxcz7eFSMcsik55NbJDQ0PrZpOA8KziwtcCaa3
         yAXEFfoG+/beZqkU7zy0Mah2nJd2L7ezk1ZLy/4I=
Date:   Thu, 28 Oct 2021 05:03:22 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Adam Ford <aford173@gmail.com>
Cc:     linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        cstevens@beaconembedded.com, aford@beaconembedded.com,
        Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [RFC V2 1/5] arm64: dts: imx8mm: Add CSI nodes
Message-ID: <YXoE6p1xAX5zJZMg@pendragon.ideasonboard.com>
References: <20211023203457.1217821-1-aford173@gmail.com>
 <20211023203457.1217821-2-aford173@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211023203457.1217821-2-aford173@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Adam,

Thank you for the patch.

On Sat, Oct 23, 2021 at 03:34:52PM -0500, Adam Ford wrote:
> There is a csi bridge and csis interface that tie together
> to allow csi2 capture.
> 
> Signed-off-by: Adam Ford <aford173@gmail.com>
> ---
>  arch/arm64/boot/dts/freescale/imx8mm.dtsi | 55 +++++++++++++++++++++++
>  1 file changed, 55 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8mm.dtsi b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
> index c2f3f118f82e..920f9041ef50 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mm.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
> @@ -1068,6 +1068,22 @@ aips4: bus@32c00000 {
>  			#size-cells = <1>;
>  			ranges = <0x32c00000 0x32c00000 0x400000>;
>  
> +			csi: csi@32e20000 {
> +				compatible = "fsl,imx8mm-csi", "fsl,imx7-csi";
> +				reg = <0x32e20000 0x1000>;
> +				interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&clk IMX8MM_CLK_CSI1_ROOT>;
> +				clock-names = "mclk";
> +				power-domains = <&disp_blk_ctrl IMX8MM_DISPBLK_PD_CSI_BRIDGE>;
> +				status = "disabled";
> +
> +				port {
> +					csi_in: endpoint {
> +						remote-endpoint = <&imx8mm_mipi_csi_out>;
> +					};
> +				};
> +			};
> +
>  			disp_blk_ctrl: blk-ctrl@32e28000 {
>  				compatible = "fsl,imx8mm-disp-blk-ctrl", "syscon";
>  				reg = <0x32e28000 0x100>;
> @@ -1095,6 +1111,45 @@ disp_blk_ctrl: blk-ctrl@32e28000 {
>  				#power-domain-cells = <1>;
>  			};
>  
> +			mipi_csi2: mipi-csi@32e30000 {

I'd rename the label to mipi_csi to match the name in the reference
manual.

> +				compatible = "fsl,imx8mm-mipi-csi2";
> +				reg = <0x32e30000 0x1000>;
> +				interrupts = <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>;
> +				assigned-clocks = <&clk IMX8MM_CLK_CSI1_CORE>,
> +						  <&clk IMX8MM_CLK_CSI1_PHY_REF>;
> +				assigned-clock-parents = <&clk IMX8MM_SYS_PLL2_1000M>,
> +							  <&clk IMX8MM_SYS_PLL2_1000M>;
> +				clock-frequency = <333000000>;
> +				clocks = <&clk IMX8MM_CLK_DISP_APB_ROOT>,
> +					 <&clk IMX8MM_CLK_CSI1_ROOT>,
> +					 <&clk IMX8MM_CLK_CSI1_PHY_REF>,
> +					 <&clk IMX8MM_CLK_DISP_AXI_ROOT>;
> +				clock-names = "pclk", "wrap", "phy", "axi";
> +				power-domains = <&disp_blk_ctrl IMX8MM_DISPBLK_PD_MIPI_CSI>;
> +				status = "disabled";
> +
> +				ports {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					port@0 {
> +						reg = <0>;
> +
> +						imx8mm_mipi_csi_in: endpoint {
> +						};

Empty ports are fine as they model the hardware, even when not
connected, but an endpoint models a connection, so it needs a remote
endpoint. You can drop the endpoint here, board DT files will create one
with

&mipi_csi {
	ports {
		port@0 {
			board_endpoint: endpoint {
				...
			};
		};
	};
};

> +					};
> +
> +					port@1 {
> +						reg = <1>;
> +
> +						imx8mm_mipi_csi_out: endpoint {
> +							remote-endpoint = <&csi_in>;
> +						};
> +					};
> +				};
> +			};
> +
> +

A single blank line is enough.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  			usbotg1: usb@32e40000 {
>  				compatible = "fsl,imx8mm-usb", "fsl,imx7d-usb";
>  				reg = <0x32e40000 0x200>;

-- 
Regards,

Laurent Pinchart
