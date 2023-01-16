Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D484A66C85E
	for <lists+linux-media@lfdr.de>; Mon, 16 Jan 2023 17:38:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233395AbjAPQim (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Jan 2023 11:38:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233449AbjAPQhw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Jan 2023 11:37:52 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1271265AC;
        Mon, 16 Jan 2023 08:26:50 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DA4B3802;
        Mon, 16 Jan 2023 17:26:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1673886409;
        bh=MyAQgnEElXngJucMzYKS5/Z2k5xntq+cpLZdqqCy+gY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=W9YCa6lUW2IijayY74/GX/vpaa282G3p1Jh4LJDP+sZ/tBPrzOl1i4EJE44DfAoZV
         Cooc5emNweyO8Vz49U5xnTEjH6C60QCQWaFCW73MOGomjfK+nm7/PmP0FxkyTYWEdH
         Y8CkvB3ND2PewAd8VJROncOtlRF88akLw7X/ipig=
Date:   Mon, 16 Jan 2023 18:26:49 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Michael Tretter <m.tretter@pengutronix.de>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Fabio Estevam <festevam@gmail.com>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        kernel@pengutronix.de, linux-imx@nxp.com,
        linux-arm-kernel@lists.infradead.org,
        Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v2 08/16] ARM: dts: imx7d: add node for PXP
Message-ID: <Y8V6yU8bZoVt32wN@pendragon.ideasonboard.com>
References: <20230112-imx-pxp-v2-0-e2281da1db55@pengutronix.de>
 <20230112-imx-pxp-v2-8-e2281da1db55@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230112-imx-pxp-v2-8-e2281da1db55@pengutronix.de>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Michael,

(CC'ing Shawn)

On Fri, Jan 13, 2023 at 10:54:14AM +0100, Michael Tretter wrote:
> The i.MX7d contains a Pixel Pipeline in version 3.0. Add the device tree
> node to make it available.
> 
> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>

Should this go through Shawn's tree ? If so, how would you like to
handle the dependency on the DT bindings in patch 01/16 ?

> ---
> Changelog
> 
> v2:
> 
> - fix alignment
> ---
>  arch/arm/boot/dts/imx7d.dtsi | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/imx7d.dtsi b/arch/arm/boot/dts/imx7d.dtsi
> index 7ceb7c09f7ad..4b94b8afb55d 100644
> --- a/arch/arm/boot/dts/imx7d.dtsi
> +++ b/arch/arm/boot/dts/imx7d.dtsi
> @@ -165,6 +165,15 @@ pcie_phy: pcie-phy@306d0000 {
>  		  reg = <0x306d0000 0x10000>;
>  		  status = "disabled";
>  	};
> +
> +	pxp: pxp@30700000 {
> +		compatible = "fsl,imx7d-pxp";
> +		reg = <0x30700000 0x10000>;
> +		interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 46 IRQ_TYPE_LEVEL_HIGH>;
> +		clocks = <&clks IMX7D_PXP_CLK>;
> +		clock-names = "axi";
> +	};
>  };
>  
>  &aips3 {

-- 
Regards,

Laurent Pinchart
