Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 729C134A9A7
	for <lists+linux-media@lfdr.de>; Fri, 26 Mar 2021 15:25:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230239AbhCZOZI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Mar 2021 10:25:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230218AbhCZOY4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Mar 2021 10:24:56 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6685DC0613AA
        for <linux-media@vger.kernel.org>; Fri, 26 Mar 2021 07:24:55 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <pza@pengutronix.de>)
        id 1lPnOE-0007g5-8r; Fri, 26 Mar 2021 15:24:42 +0100
Received: from pza by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <pza@pengutronix.de>)
        id 1lPnOC-0006zY-EG; Fri, 26 Mar 2021 15:24:40 +0100
Date:   Fri, 26 Mar 2021 15:24:40 +0100
From:   Philipp Zabel <pza@pengutronix.de>
To:     Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc:     ezequiel@collabora.com, mchehab@kernel.org, robh+dt@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
        lee.jones@linaro.org, gregkh@linuxfoundation.org,
        mripard@kernel.org, paul.kocialkowski@bootlin.com, wens@csie.org,
        jernej.skrabec@siol.net, hverkuil-cisco@xs4all.nl,
        emil.l.velikov@gmail.com, kernel@pengutronix.de, linux-imx@nxp.com,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devel@driverdev.osuosl.org,
        kernel@collabora.com
Subject: Re: [PATCH v6 13/13] arm64: dts: imx8mq: Add node to G2 hardware
Message-ID: <20210326142440.GD8441@pengutronix.de>
References: <20210318082046.51546-1-benjamin.gaignard@collabora.com>
 <20210318082046.51546-14-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210318082046.51546-14-benjamin.gaignard@collabora.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 15:21:32 up 36 days, 17:45, 97 users,  load average: 0.13, 0.09,
 0.09
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: pza@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Mar 18, 2021 at 09:20:46AM +0100, Benjamin Gaignard wrote:
> Split VPU node in two: one for G1 and one for G2 since they are
> different hardware blocks.
> Add syscon for hardware control block.
> Remove reg-names property that is useless.
> Each VPU node only need one interrupt.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> ---
> version 5:
>  - use syscon instead of VPU reset
> 
>  arch/arm64/boot/dts/freescale/imx8mq.dtsi | 43 ++++++++++++++++++-----
>  1 file changed, 34 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8mq.dtsi b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> index 17c449e12c2e..b537d153ebbd 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> @@ -1329,15 +1329,16 @@ usb3_phy1: usb-phy@382f0040 {
>  			status = "disabled";
>  		};
>  
> -		vpu: video-codec@38300000 {
> +		vpu_ctrl: syscon@38320000 {
> +			compatible = "nxp,imx8mq-vpu-ctrl", "syscon";
> +			reg = <0x38320000 0x10000>;
> +		};
> +
> +		vpu_g1: video-codec@38300000 {
>  			compatible = "nxp,imx8mq-vpu";
> -			reg = <0x38300000 0x10000>,
> -			      <0x38310000 0x10000>,
> -			      <0x38320000 0x10000>;
> -			reg-names = "g1", "g2", "ctrl";
> -			interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
> -			interrupt-names = "g1", "g2";
> +			reg = <0x38300000 0x10000>;
> +			interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "g1";
>  			clocks = <&clk IMX8MQ_CLK_VPU_G1_ROOT>,
>  				 <&clk IMX8MQ_CLK_VPU_G2_ROOT>,
>  				 <&clk IMX8MQ_CLK_VPU_DEC_ROOT>;
> @@ -1350,9 +1351,33 @@ vpu: video-codec@38300000 {
>  						 <&clk IMX8MQ_VPU_PLL_OUT>,
>  						 <&clk IMX8MQ_SYS1_PLL_800M>,
>  						 <&clk IMX8MQ_VPU_PLL>;
> -			assigned-clock-rates = <600000000>, <600000000>,
> +			assigned-clock-rates = <600000000>, <300000000>,

I'd like to see this mentioned in the commit message.

> +					       <800000000>, <0>;
> +			power-domains = <&pgc_vpu>;
> +			nxp,imx8mq-vpu-ctrl = <&vpu_ctrl>;
> +		};
> +
> +		vpu_g2: video-codec@38310000 {
> +			compatible = "nxp,imx8mq-vpu-g2";
> +			reg = <0x38310000 0x10000>;
> +			interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "g2";
> +			clocks = <&clk IMX8MQ_CLK_VPU_G1_ROOT>,
> +				 <&clk IMX8MQ_CLK_VPU_G2_ROOT>,
> +				 <&clk IMX8MQ_CLK_VPU_DEC_ROOT>;
> +			clock-names = "g1", "g2",  "bus";
> +			assigned-clocks = <&clk IMX8MQ_CLK_VPU_G1>,

Can the G1 clock configuration be dropped from the G2 device node and
the G2 clock configuration from the G1 device node? It looks weird that
these devices configure each other's clocks.

regards
Philipp
