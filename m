Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E11DD3A0E1D
	for <lists+linux-media@lfdr.de>; Wed,  9 Jun 2021 09:53:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236233AbhFIHyw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Jun 2021 03:54:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237338AbhFIHyv (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Jun 2021 03:54:51 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60931C061574
        for <linux-media@vger.kernel.org>; Wed,  9 Jun 2021 00:52:57 -0700 (PDT)
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1lqt11-00063s-5n; Wed, 09 Jun 2021 09:52:43 +0200
Received: from mfe by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <mfe@pengutronix.de>)
        id 1lqt0y-0004m9-RT; Wed, 09 Jun 2021 09:52:40 +0200
Date:   Wed, 9 Jun 2021 09:52:40 +0200
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     Martin Kepplinger <martin.kepplinger@puri.sm>
Cc:     festevam@gmail.com, krzk@kernel.org,
        laurent.pinchart@ideasonboard.com, devicetree@vger.kernel.org,
        kernel@pengutronix.de, kernel@puri.sm,
        linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, mchehab@kernel.org,
        phone-devel@vger.kernel.org, robh@kernel.org, shawnguo@kernel.org,
        slongerbeam@gmail.com
Subject: Re: [PATCH v3 3/3] arm64: dts: imx8mq: add mipi csi phy and csi
 bridge descriptions
Message-ID: <20210609075240.ajx6ejvqie4sgkvj@pengutronix.de>
References: <20210608104128.1616028-1-martin.kepplinger@puri.sm>
 <20210608104128.1616028-4-martin.kepplinger@puri.sm>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210608104128.1616028-4-martin.kepplinger@puri.sm>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 09:46:34 up 188 days, 21:52, 47 users,  load average: 0.18, 0.13,
 0.11
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Martin,

On 21-06-08 12:41, Martin Kepplinger wrote:

...

> +			csi1: csi@30a90000 {
> +				compatible = "fsl,imx7-csi";

AFAIK an unwritten rule (at least for the iMX mach) is to specify the
SoC specific compatible and the compatible which is supported by the
driver already, so this should be:

compatible = "fsl,imx8mq-csi", "fsl,imx7-csi";

This is very helpful if we need to handle some quirk for the imx8mq
later on.

Regards,
  Marco


> +				reg = <0x30a90000 0x10000>;
> +				interrupts = <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&clk IMX8MQ_CLK_CSI1_ROOT>;
> +				clock-names = "mclk";
> +				status = "disabled";
> +
> +				port {
> +					csi1_ep: endpoint {
> +						remote-endpoint = <&csi1_mipi_ep>;
> +					};
> +				};
> +			};
> +
> +			mipi_csi2: csi@30b60000 {
> +				compatible = "fsl,imx8mq-mipi-csi2";
> +				reg = <0x30b60000 0x1000>;
> +				clocks = <&clk IMX8MQ_CLK_CSI2_CORE>,
> +				   <&clk IMX8MQ_CLK_CSI2_ESC>,
> +				   <&clk IMX8MQ_CLK_CSI2_PHY_REF>,
> +				   <&clk IMX8MQ_CLK_CLKO2>;
> +				clock-names = "core", "esc", "pxl", "clko2";
> +				assigned-clocks = <&clk IMX8MQ_CLK_CSI2_CORE>,
> +				    <&clk IMX8MQ_CLK_CSI2_PHY_REF>,
> +				    <&clk IMX8MQ_CLK_CSI2_ESC>;
> +				assigned-clock-rates = <266000000>, <333000000>, <66000000>;
> +				assigned-clock-parents = <&clk IMX8MQ_SYS1_PLL_266M>,
> +					<&clk IMX8MQ_SYS2_PLL_1000M>,
> +					<&clk IMX8MQ_SYS1_PLL_800M>;
> +				power-domains = <&pgc_mipi_csi2>;
> +				reset = <&src>;
> +				phy = <&iomuxc_gpr>;
> +				interconnects = <&noc IMX8MQ_ICM_CSI2 &noc IMX8MQ_ICS_DRAM>;
> +				interconnect-names = "dram";
> +				status = "disabled";
> +
> +				ports {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					port@0 {
> +						reg = <0>;
> +
> +						csi2_mipi_ep: endpoint {
> +							remote-endpoint = <&csi2_ep>;
> +						};
> +					};
> +				};
> +			};
> +
> +			csi2: csi@30b80000 {
> +				compatible = "fsl,imx7-csi";
> +				reg = <0x30b80000 0x10000>;
> +				interrupts = <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&clk IMX8MQ_CLK_CSI2_ROOT>;
> +				clock-names = "mclk";
> +				status = "disabled";
> +
> +				port {
> +					csi2_ep: endpoint {
> +						remote-endpoint = <&csi2_mipi_ep>;
> +					};
> +				};
> +			};
> +
>  			mu: mailbox@30aa0000 {
>  				compatible = "fsl,imx8mq-mu", "fsl,imx6sx-mu";
>  				reg = <0x30aa0000 0x10000>;
> -- 
> 2.30.2
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> 

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
