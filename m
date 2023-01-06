Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB92D66003C
	for <lists+linux-media@lfdr.de>; Fri,  6 Jan 2023 13:27:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233785AbjAFM1Q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Jan 2023 07:27:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233783AbjAFM0y (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 6 Jan 2023 07:26:54 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FD82DECF;
        Fri,  6 Jan 2023 04:26:47 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 593824AE;
        Fri,  6 Jan 2023 13:26:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1673008005;
        bh=m1X1odnCfIlRirABQHd6+2sZ5MgpsXnuOJErlg4T9sg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lIYxJI4G+CD9daaD0OAkdLSkja0ME1TA2DGcB16j9i5nFPWC0yCyBIzNoiKtgjAvQ
         wbey/Of6iXy9ftN/IpaplyGIiQM5KHpGKIDW2zHDnm4pZsurIxdEzzkHtOWebYqKHz
         hmRgBoXbJsSlRHjsUHByAS5SIyTIzLLRVFAuODgQ=
Date:   Fri, 6 Jan 2023 14:26:40 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Michael Tretter <m.tretter@pengutronix.de>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Fabio Estevam <festevam@gmail.com>, kernel@pengutronix.de,
        linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 4/8] media: imx-pxp: explicitly disable unused blocks
Message-ID: <Y7gTgEDL1qsWfH8r@pendragon.ideasonboard.com>
References: <20230105134729.59542-1-m.tretter@pengutronix.de>
 <20230105134729.59542-5-m.tretter@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230105134729.59542-5-m.tretter@pengutronix.de>
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

On Thu, Jan 05, 2023 at 02:47:25PM +0100, Michael Tretter wrote:
> Various multiplexers in the pipeline are not used with the currently
> configured data path. Disable all unused multiplexers by selecting the
> "no output" (3) option.
> 
> The datasheet doesn't explicitly require this, but the PXP has been seen
> to hang after processing a few hundreds of frames otherwise.

On which platform(s) have you noticed that ?

> As at it, add documentation for the multiplexers that are actually
> relevant for the data path.
> 
> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> ---
>  drivers/media/platform/nxp/imx-pxp.c | 30 +++++++++++++++++-----------
>  1 file changed, 18 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/media/platform/nxp/imx-pxp.c b/drivers/media/platform/nxp/imx-pxp.c
> index a957fee88829..6ffd07cda965 100644
> --- a/drivers/media/platform/nxp/imx-pxp.c
> +++ b/drivers/media/platform/nxp/imx-pxp.c
> @@ -731,22 +731,28 @@ static u32 pxp_data_path_ctrl0(struct pxp_ctx *ctx)
>  	u32 ctrl0;
>  
>  	ctrl0 = 0;
> -	ctrl0 |= BF_PXP_DATA_PATH_CTRL0_MUX15_SEL(0);
> +	ctrl0 |= BF_PXP_DATA_PATH_CTRL0_MUX15_SEL(3);
> +	/* Bypass Dithering x3CH */
>  	ctrl0 |= BF_PXP_DATA_PATH_CTRL0_MUX14_SEL(1);
> -	ctrl0 |= BF_PXP_DATA_PATH_CTRL0_MUX13_SEL(0);
> +	ctrl0 |= BF_PXP_DATA_PATH_CTRL0_MUX13_SEL(3);
> +	/* Select Rotation */
>  	ctrl0 |= BF_PXP_DATA_PATH_CTRL0_MUX12_SEL(0);
> +	/* Select LUT */
>  	ctrl0 |= BF_PXP_DATA_PATH_CTRL0_MUX11_SEL(0);
> -	ctrl0 |= BF_PXP_DATA_PATH_CTRL0_MUX10_SEL(0);
> +	ctrl0 |= BF_PXP_DATA_PATH_CTRL0_MUX10_SEL(3);
> +	/* Select MUX8 for LUT */
>  	ctrl0 |= BF_PXP_DATA_PATH_CTRL0_MUX9_SEL(1);
> +	/* Select CSC 2 */
>  	ctrl0 |= BF_PXP_DATA_PATH_CTRL0_MUX8_SEL(0);
> -	ctrl0 |= BF_PXP_DATA_PATH_CTRL0_MUX7_SEL(0);
> -	ctrl0 |= BF_PXP_DATA_PATH_CTRL0_MUX6_SEL(0);
> -	ctrl0 |= BF_PXP_DATA_PATH_CTRL0_MUX5_SEL(0);
> -	ctrl0 |= BF_PXP_DATA_PATH_CTRL0_MUX4_SEL(0);
> +	ctrl0 |= BF_PXP_DATA_PATH_CTRL0_MUX7_SEL(3);
> +	ctrl0 |= BF_PXP_DATA_PATH_CTRL0_MUX6_SEL(3);
> +	ctrl0 |= BF_PXP_DATA_PATH_CTRL0_MUX5_SEL(3);
> +	ctrl0 |= BF_PXP_DATA_PATH_CTRL0_MUX4_SEL(3);
> +	/* Bypass Rotation 2 */
>  	ctrl0 |= BF_PXP_DATA_PATH_CTRL0_MUX3_SEL(0);
> -	ctrl0 |= BF_PXP_DATA_PATH_CTRL0_MUX2_SEL(0);
> -	ctrl0 |= BF_PXP_DATA_PATH_CTRL0_MUX1_SEL(0);
> -	ctrl0 |= BF_PXP_DATA_PATH_CTRL0_MUX0_SEL(0);
> +	ctrl0 |= BF_PXP_DATA_PATH_CTRL0_MUX2_SEL(3);
> +	ctrl0 |= BF_PXP_DATA_PATH_CTRL0_MUX1_SEL(3);
> +	ctrl0 |= BF_PXP_DATA_PATH_CTRL0_MUX0_SEL(3);

The muxes being disabled look fine to me, but the values of MUX8, MUX12
and MUX14 look strange based on the i.MX7D reference manual. Maybe the
register values were different in previous SoCs ? I haven't found any
other relevant reference manual that document the mux values, I may have
overlooked something.

Anyway, this isn't an issue with this patch, so

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  
>  	return ctrl0;
>  }
> @@ -760,8 +766,8 @@ static void pxp_set_data_path(struct pxp_ctx *ctx)
>  	ctrl0 = pxp_data_path_ctrl0(ctx);
>  
>  	ctrl1 = 0;
> -	ctrl1 |= BF_PXP_DATA_PATH_CTRL1_MUX17_SEL(1);
> -	ctrl1 |= BF_PXP_DATA_PATH_CTRL1_MUX16_SEL(1);
> +	ctrl1 |= BF_PXP_DATA_PATH_CTRL1_MUX17_SEL(3);
> +	ctrl1 |= BF_PXP_DATA_PATH_CTRL1_MUX16_SEL(3);
>  
>  	writel(ctrl0, dev->mmio + HW_PXP_DATA_PATH_CTRL0);
>  	writel(ctrl1, dev->mmio + HW_PXP_DATA_PATH_CTRL1);

-- 
Regards,

Laurent Pinchart
