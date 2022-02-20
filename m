Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CFB4A4BCD3A
	for <lists+linux-media@lfdr.de>; Sun, 20 Feb 2022 09:25:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234516AbiBTIZb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 20 Feb 2022 03:25:31 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:48452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229751AbiBTIZb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 20 Feb 2022 03:25:31 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 298FC50450
        for <linux-media@vger.kernel.org>; Sun, 20 Feb 2022 00:25:10 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1AE4D25B;
        Sun, 20 Feb 2022 09:25:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1645345507;
        bh=Gm5QZo1/GZ0qWGopTydy/9LzYYv9V43HHCRG+cCgYPo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=l3KwcAuwSp9s+/KNCiI3YYxcAljDg1EGf3h8rtOIRvoGUvx5URs/O563oe/K0OViP
         EJgajVKZww8QkiAS1nbdOv5y1uyJW5CwNEbokPZLNspG14e3pzhdkes0u29jOS9AgU
         LNnrsohCmANKN8exO5JBin9ncuVLV8c9AuuivKg8=
Date:   Sun, 20 Feb 2022 10:24:58 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     slongerbeam@gmail.com, p.zabel@pengutronix.de, shawnguo@kernel.org,
        s.hauer@pengutronix.de, festevam@gmail.com, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl, martin.kepplinger@puri.sm,
        rmfrfs@gmail.com, xavier.roumegue@oss.nxp.com,
        alexander.stein@ew.tq-group.com, dorota.czaplejewicz@puri.sm,
        kernel@pengutronix.de, linux-imx@nxp.com,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 4/7] media: imx: imx-mipi-csis: Set PIXEL_MODE for
 YUV422
Message-ID: <YhH62gZLzQ9ZwlfV@pendragon.ideasonboard.com>
References: <20220218183421.583874-1-jacopo@jmondi.org>
 <20220218183421.583874-5-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220218183421.583874-5-jacopo@jmondi.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Fri, Feb 18, 2022 at 07:34:18PM +0100, Jacopo Mondi wrote:
> Bits 13 and 12 of the ISP_CONFIGn register configure the PIXEL_MODE
> which specifies the sampling size, in pixel component units, on the
> CSI-2 output data interface when data are transferred to memory.
> 
> The register description in the chip manual specifies that DUAL mode
> should be used for YUV422 data.
>
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> Signed-off-by: Xavier Roumegue <xavier.roumegue@oss.nxp.com>
> ---
>  drivers/media/platform/imx/imx-mipi-csis.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/imx/imx-mipi-csis.c b/drivers/media/platform/imx/imx-mipi-csis.c
> index 3e7efcf43a5f..86e7ea3713d9 100644
> --- a/drivers/media/platform/imx/imx-mipi-csis.c
> +++ b/drivers/media/platform/imx/imx-mipi-csis.c
> @@ -173,6 +173,7 @@
>  #define MIPI_CSIS_ISPCFG_PIXEL_MODE_SINGLE	(0 << 12)
>  #define MIPI_CSIS_ISPCFG_PIXEL_MODE_DUAL	(1 << 12)
>  #define MIPI_CSIS_ISPCFG_PIXEL_MODE_QUAD	(2 << 12)	/* i.MX8M[MNP] only */
> +#define MIPI_CSIS_ISPCFG_PIXEL_MASK		(3 << 12)
>  #define MIPI_CSIS_ISPCFG_ALIGN_32BIT		BIT(11)
>  #define MIPI_CSIS_ISPCFG_FMT(fmt)		((fmt) << 2)
>  #define MIPI_CSIS_ISPCFG_FMT_MASK		(0x3f << 2)
> @@ -506,7 +507,13 @@ static void __mipi_csis_set_format(struct csi_state *state)
>  
>  	/* Color format */
>  	val = mipi_csis_read(state, MIPI_CSIS_ISP_CONFIG_CH(0));
> -	val &= ~(MIPI_CSIS_ISPCFG_ALIGN_32BIT | MIPI_CSIS_ISPCFG_FMT_MASK);
> +	val &= ~(MIPI_CSIS_ISPCFG_ALIGN_32BIT | MIPI_CSIS_ISPCFG_FMT_MASK
> +		| MIPI_CSIS_ISPCFG_PIXEL_MASK);
> +

Let's add some more information here too:

	/*
	 * YUV 4:2:2 can be transferred with 8 or 16 bits per clock sample
	 * (referred to in the documentation as single and dual pixel modes
	 * respectively, although the 8-bit mode transfers half a pixel per
	 * clock sample and the 16-bit mode one pixel). While both mode work
	 * when the CSIS is connected to a receiver that supports either option,
	 * single pixel mode requires clock rates twice as high. As all SoCs
	 * that integrate the CSIS can operate in 16-bit bit mode, and some do
	 * not support 8-bit mode (this is the case of the i.MX8MP), use dual
	 * pixel mode unconditionally.
	 */

With this,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +	/* TODO: Verify which other formats require DUAL (or QUAD) modes. */

I expect that at least RAW8 could benefit from dual mode too. While the
i.MX8MM reference manual states that dual mode can also be used for
RAW10 and RAW12, I think the CSI bridge has a 16-bit input bus, so this
may not be possible (I could be wrong).

> +	if (state->csis_fmt->data_type == MIPI_CSI2_DATA_TYPE_YUV422_8)
> +		val |= MIPI_CSIS_ISPCFG_PIXEL_MODE_DUAL;
> +
>  	val |= MIPI_CSIS_ISPCFG_FMT(state->csis_fmt->data_type);
>  	mipi_csis_write(state, MIPI_CSIS_ISP_CONFIG_CH(0), val);
>  

-- 
Regards,

Laurent Pinchart
