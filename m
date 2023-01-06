Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED389660054
	for <lists+linux-media@lfdr.de>; Fri,  6 Jan 2023 13:36:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229983AbjAFMgw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Jan 2023 07:36:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229491AbjAFMgu (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 6 Jan 2023 07:36:50 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07704687A5;
        Fri,  6 Jan 2023 04:36:50 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D4B124AE;
        Fri,  6 Jan 2023 13:36:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1673008608;
        bh=QAFwGDwfRo7x8ep0IH8RPLsB7hptSNTNYuYA5OV+Xsk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YPKrM5jfAMy2k9CpeiyjY54mAh3RVyZ3NOVKUwCoSIiDbFexFTuqRngOFrsmjipjz
         fkOFEEwFR3T9nyI7Hxd8N0wEbYy0geNSmeqikJXGb+4/8eaTySegUBkPmf8wnEI7Sv
         TXnoZoyPTglnfUtO9L3uKqK2o0NnmyIMEA+bJfn0=
Date:   Fri, 6 Jan 2023 14:36:41 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Michael Tretter <m.tretter@pengutronix.de>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Fabio Estevam <festevam@gmail.com>, kernel@pengutronix.de,
        linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 8/8] ARM: dts: imx7d: add node for PXP
Message-ID: <Y7gV2bGXqPMLr4Vv@pendragon.ideasonboard.com>
References: <20230105134729.59542-1-m.tretter@pengutronix.de>
 <20230105134729.59542-9-m.tretter@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230105134729.59542-9-m.tretter@pengutronix.de>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Michael,

Thank you for the patch.

On Thu, Jan 05, 2023 at 02:47:29PM +0100, Michael Tretter wrote:
> The i.MX7d contains a Pixel Pipeline in version 3.0. Add the device tree
> node to make it available.
> 
> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> ---
>  arch/arm/boot/dts/imx7d.dtsi | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/imx7d.dtsi b/arch/arm/boot/dts/imx7d.dtsi
> index 7ceb7c09f7ad..728cc9413a7c 100644
> --- a/arch/arm/boot/dts/imx7d.dtsi
> +++ b/arch/arm/boot/dts/imx7d.dtsi
> @@ -165,6 +165,15 @@ pcie_phy: pcie-phy@306d0000 {
>  		  reg = <0x306d0000 0x10000>;
>  		  status = "disabled";
>  	};
> +
> +	pxp: pxp@30700000 {
> +		compatible = "fsl,imx7d-pxp";

Hmmm... The i.MX7S also has a PXP that seems compatible. I thus wonder
if we shouldn't move this node to imx7s.dtsi.

> +		reg = <0x30700000 0x10000>;
> +		interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
> +			<GIC_SPI 46 IRQ_TYPE_LEVEL_HIGH>;

Nitpicking, alignment ?

> +		clocks = <&clks IMX7D_PXP_CLK>;
> +		clock-names = "axi";
> +	};
>  };
>  
>  &aips3 {

-- 
Regards,

Laurent Pinchart
