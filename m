Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 328D08CFE5
	for <lists+linux-media@lfdr.de>; Wed, 14 Aug 2019 11:42:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726821AbfHNJmu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Aug 2019 05:42:50 -0400
Received: from retiisi.org.uk ([95.216.213.190]:35340 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726606AbfHNJmu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Aug 2019 05:42:50 -0400
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id 7A1F3634C89;
        Wed, 14 Aug 2019 12:42:38 +0300 (EEST)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1hxpnh-0000u7-SD; Wed, 14 Aug 2019 12:42:37 +0300
Date:   Wed, 14 Aug 2019 12:42:37 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     =?iso-8859-1?Q?S=E9bastien?= Szymanski 
        <sebastien.szymanski@armadeus.com>
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devel@driverdev.osuosl.org
Subject: Re: [PATCH v3 1/3] ARM: dts: imx6ul: Add csi node
Message-ID: <20190814094237.GJ2527@valkosipuli.retiisi.org.uk>
References: <20190731163257.32448-1-sebastien.szymanski@armadeus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190731163257.32448-1-sebastien.szymanski@armadeus.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sébastien,

On Wed, Jul 31, 2019 at 06:32:57PM +0200, Sébastien Szymanski wrote:
> Add csi node for i.MX6UL SoC.
> 
> Reviewed-by: Fabio Estevam <festevam@gmail.com>
> Signed-off-by: Sébastien Szymanski <sebastien.szymanski@armadeus.com>

This should be probably merged through the ARM tree.

I can take the other two.

> ---
> 
> Changes for v3:
>  - none
> 
> Changes for v2:
>  - only "mclk" clock is required now.
> 
>  arch/arm/boot/dts/imx6ul.dtsi | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/imx6ul.dtsi b/arch/arm/boot/dts/imx6ul.dtsi
> index 81d4b4925127..56cfcf0e5084 100644
> --- a/arch/arm/boot/dts/imx6ul.dtsi
> +++ b/arch/arm/boot/dts/imx6ul.dtsi
> @@ -957,6 +957,15 @@
>  				};
>  			};
>  
> +			csi: csi@21c4000 {
> +				compatible = "fsl,imx6ul-csi", "fsl,imx7-csi";
> +				reg = <0x021c4000 0x4000>;
> +				interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&clks IMX6UL_CLK_CSI>;
> +				clock-names = "mclk";
> +				status = "disabled";
> +			};
> +
>  			lcdif: lcdif@21c8000 {
>  				compatible = "fsl,imx6ul-lcdif", "fsl,imx28-lcdif";
>  				reg = <0x021c8000 0x4000>;

-- 
Sakari Ailus
