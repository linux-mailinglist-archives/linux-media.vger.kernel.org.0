Return-Path: <linux-media+bounces-45599-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 41E8CC0B907
	for <lists+linux-media@lfdr.de>; Mon, 27 Oct 2025 02:03:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 03C694EE446
	for <lists+linux-media@lfdr.de>; Mon, 27 Oct 2025 01:03:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79C4519D082;
	Mon, 27 Oct 2025 01:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="RCfMUIpo"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EC8D1A9FBF;
	Mon, 27 Oct 2025 01:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761526999; cv=none; b=gRv82lgFEMy39FuqWRpp7M+1Aki98/yoR1uZoC8EC+/GQZITHd4tSOko7ehfPz9xonO96f2KnIoXJbyz6Mgo8QA8STIkssvEWQaRNPLkdy3zR+t+JHHMaMUyn+EVf4JIIryFcbLRWbrhonjvr0DQfTuw2c5yOLkb2jdOdP1T36Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761526999; c=relaxed/simple;
	bh=TRf7E6Wmq0Mv8cybHM8FwxOjKlKmGcf5vNcSFqxCThQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T9AUPHps33fER8niDxgYIUzdQqJqS/tuDvvQE5lHib/OEn3VsP3u6lhRYnH4Es8kU7XwXjKBiMpbwSnS+UnbXI1a92v0aOm+2wUo++ZKAty4DWdeP8RjcBKmd7Zon5REuXx1Ngz9E3oCtFrPlAjzndxwd8OvcUPI55jn8kjTWDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=RCfMUIpo; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (82-203-161-16.bb.dnainternet.fi [82.203.161.16])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 58884E1F;
	Mon, 27 Oct 2025 02:01:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1761526884;
	bh=TRf7E6Wmq0Mv8cybHM8FwxOjKlKmGcf5vNcSFqxCThQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RCfMUIpoNetOTMMslAZo8oCNJc6hYAi95o22PZvksxmAUO19SFB+PB07bK1H/R2LB
	 JoeoFI4mfyf22ZCFddAV/tPcpMTPMntNVNMXZpHnO8aEdAHzphDoacWleOlqImVTax
	 JVA+qtIU7pdO/71BuxqZVjEiCLRvaHln3uEiqSGg=
Date: Mon, 27 Oct 2025 03:02:57 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Cc: Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, Frank Li <Frank.Li@nxp.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>
Subject: Re: [PATCH v7 5/5] arm64: dts: imx8ulp: Add CSI and ISI Nodes
Message-ID: <20251027010257.GQ13023@pendragon.ideasonboard.com>
References: <20251023-csi2_imx8ulp-v7-0-5ecb081ce79b@nxp.com>
 <20251023-csi2_imx8ulp-v7-5-5ecb081ce79b@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251023-csi2_imx8ulp-v7-5-5ecb081ce79b@nxp.com>

On Thu, Oct 23, 2025 at 05:19:46PM +0800, Guoniu Zhou wrote:
> From: Guoniu Zhou <guoniu.zhou@nxp.com>
> 
> The CSI-2 in the i.MX8ULP is almost identical to the version present
> in the i.MX8QXP/QM and is routed to the ISI. Add both the ISI and CSI
> nodes and mark them as disabled by default since capture is dependent
> on an attached camera.
> 
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  arch/arm64/boot/dts/freescale/imx8ulp.dtsi | 67 ++++++++++++++++++++++++++++++
>  1 file changed, 67 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
> index 13b01f3aa2a4950c37e72e04f6bfb5995dc19178..99271d55dfb60ed2cbfe664d928be179eb257674 100644
> --- a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
> @@ -7,6 +7,7 @@
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/power/imx8ulp-power.h>
> +#include <dt-bindings/reset/imx8ulp-pcc-reset.h>
>  #include <dt-bindings/thermal/thermal.h>
>  
>  #include "imx8ulp-pinfunc.h"
> @@ -842,6 +843,72 @@ spdif: spdif@2dab0000 {
>  				dma-names = "rx", "tx";
>  				status = "disabled";
>  			};
> +
> +			isi: isi@2dac0000 {
> +				compatible = "fsl,imx8ulp-isi";
> +				reg = <0x2dac0000 0x10000>;
> +				interrupts = <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&pcc5 IMX8ULP_CLK_ISI>,
> +					 <&cgc2 IMX8ULP_CLK_LPAV_AXI_DIV>;
> +				clock-names = "axi", "apb";
> +				power-domains = <&scmi_devpd IMX8ULP_PD_ISI>;
> +				status = "disabled";
> +
> +				ports {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					port@0 {
> +						reg = <0>;
> +						isi_in: endpoint {
> +							remote-endpoint = <&mipi_csi_out>;
> +						};
> +					};
> +				};
> +			};
> +
> +			mipi_csi: csi@2daf0000 {
> +				compatible = "fsl,imx8ulp-mipi-csi2";
> +				reg = <0x2daf0000 0x10000>,
> +				      <0x2dad0000 0x10000>;
> +				clocks = <&pcc5 IMX8ULP_CLK_CSI>,
> +					 <&pcc5 IMX8ULP_CLK_CSI_CLK_ESC>,
> +					 <&pcc5 IMX8ULP_CLK_CSI_CLK_UI>,
> +					 <&pcc5 IMX8ULP_CLK_CSI_REGS>;
> +				clock-names = "core", "esc", "ui", "pclk";
> +				assigned-clocks = <&pcc5 IMX8ULP_CLK_CSI>,
> +						  <&pcc5 IMX8ULP_CLK_CSI_CLK_ESC>,
> +						  <&pcc5 IMX8ULP_CLK_CSI_CLK_UI>,
> +						  <&pcc5 IMX8ULP_CLK_CSI_REGS>;
> +				assigned-clock-parents = <&cgc2 IMX8ULP_CLK_PLL4_PFD1_DIV1>,
> +							 <&cgc2 IMX8ULP_CLK_PLL4_PFD1_DIV2>,
> +							 <&cgc2 IMX8ULP_CLK_PLL4_PFD0_DIV1>;
> +				assigned-clock-rates = <200000000>,
> +						       <80000000>,
> +						       <100000000>,
> +						       <79200000>;
> +				power-domains = <&scmi_devpd IMX8ULP_PD_MIPI_CSI>;
> +				resets = <&pcc5 PCC5_CSI_SWRST>,
> +					 <&pcc5 PCC5_CSI_REGS_SWRST>;
> +				status = "disabled";
> +
> +				ports {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					port@0 {
> +						reg = <0>;
> +					};
> +
> +					port@1 {
> +						reg = <1>;
> +
> +						mipi_csi_out: endpoint {
> +							remote-endpoint = <&isi_in>;
> +						};
> +					};
> +				};
> +			};
>  		};
>  
>  		gpiod: gpio@2e200000 {

-- 
Regards,

Laurent Pinchart

