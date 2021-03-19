Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD6E934121B
	for <lists+linux-media@lfdr.de>; Fri, 19 Mar 2021 02:29:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232547AbhCSB27 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Mar 2021 21:28:59 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:49670 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230507AbhCSB2b (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Mar 2021 21:28:31 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 243954FD;
        Fri, 19 Mar 2021 02:28:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1616117310;
        bh=De/Sgch1EkNL9tSneSnL+VZqqhcbLgbZJt930S19048=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=rVWZApkXriyjuCmCS7zlX6ZdrRWDjokCBXZAKmvnXzB7EnZvZ+6CQff9qi1JwoUOl
         P1UDqPqmApDbicQjMoL6LZ6JXDZTvlWfmF9tkb67WMa+bVG0DE3x8c+Zi08DUb1GGN
         xjZcfnP6HFrddnIxdbhlfoKnjAX12OAGwJKAmTPw=
Date:   Fri, 19 Mar 2021 03:27:52 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Frieder Schrempf <frieder.schrempf@kontron.de>
Cc:     linux-media@vger.kernel.org, Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v2 00/77] media: imx: Miscellaneous fixes and cleanups
 for i.MX7
Message-ID: <YFP+GH+3sS0cdd2R@pendragon.ideasonboard.com>
References: <20210215042741.28850-1-laurent.pinchart@ideasonboard.com>
 <268621a5-03ab-4cd9-d95a-bf5b6a4b4f7b@kontron.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <268621a5-03ab-4cd9-d95a-bf5b6a4b4f7b@kontron.de>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Frieder,

On Wed, Mar 17, 2021 at 07:04:19PM +0100, Frieder Schrempf wrote:
> On 15.02.21 05:26, Laurent Pinchart wrote:
> > Hello,
> > 
> > This large patch series is a collection of miscellaneous fixes, cleanups
> > and enhancements for the i.MX7 camera support. Most notably, it
> > implements support for the Media Controller API in the driver.
> > 
> > Compared to v1, review comments have been taken into account, and the
> > patches have been rebased on top of the DT bindings and latest imx
> > changes as present in the linux-media tree. Patches 38/77, 39/77, 60/77
> > and 61/77 are new. For additional information, please see individual
> > patches.
> > 
> > I have successfully tested the code on an i.MX6ULL board (with an
> > MT9M114 sensor), an I.MX7D board (with an IMX296 sensor), and an i.MX8MM
> > board (with an OV5640 sensor, and additional patches for i.MX8MM
> > support).
> 
> First of all, thanks for the great work!

You're welcome.

> I'm currently trying to get a setup with CSI + MIPI + ADV7280 working on 
> an i.MX8MM system. Would you mind sharing the additional patches I need 
> for this?
> 
> I guess you are referring to patches for the MIPI CSIS PHY and the 
> devicetree. Anything else, that I'm missing?

I've pushed my work in progress patches to

	git://linuxtv.org/pinchartl/media.git imx/next

I haven't tested this on mainline though, as the i.MX8MM board I'm using
currently requires an NXP BSP.

For the DT integration, here's what I have in imx8mm.dtsi:

			csi1_bridge: csi1_bridge@32e20000 {
				compatible = "fsl,imx8mm-csi", "fsl,imx7-csi";
				reg = <0x32e20000 0x1000>;
				interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
				clocks = <&clk IMX8MM_CLK_DISP_AXI_ROOT>,
					 <&clk IMX8MM_CLK_CSI1_ROOT>,
					 <&clk IMX8MM_CLK_DISP_APB_ROOT>;
				clock-names = "axi", "mclk", "dcic";
				power-domains = <&dispmix_pd>;
				status = "disabled";

				port {
					csi_in: endpoint {
						remote-endpoint = <&mipi_csi_out>;
					};
				};
			};

			mipi_csi: mipi_csi@32e30000 {
				compatible = "fsl,imx8mm-mipi-csi2", "fsl,imx7-mipi-csi2";
				reg = <0x32e30000 0x1000>;
				interrupts = <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>;
				clock-frequency = <333000000>;
				clocks = <&clk IMX8MM_CLK_DISP_APB_ROOT>,
					 <&clk IMX8MM_CLK_CSI1_ROOT>,
					 <&clk IMX8MM_CLK_CSI1_PHY_REF>,
					 <&clk IMX8MM_CLK_DISP_AXI_ROOT>;
				clock-names = "pclk", "wrap", "phy", "axi";
				power-domains = <&mipi_pd>;

				status = "disabled";

				ports {
					#address-cells = <1>;
					#size-cells = <0>;

					port@0 {
						reg = <0>;
					};

					port@1 {
						reg = <1>;

						mipi_csi_out: endpoint {
							remote-endpoint = <&csi_in>;
						};
					};
				};
			};

Mainline seems to be missing the power domains, so you'll likely have to
sort this out.

-- 
Regards,

Laurent Pinchart
