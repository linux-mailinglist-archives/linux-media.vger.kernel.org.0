Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 056A6493BE8
	for <lists+linux-media@lfdr.de>; Wed, 19 Jan 2022 15:26:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237718AbiASO0t (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Jan 2022 09:26:49 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:41800 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235332AbiASO0t (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Jan 2022 09:26:49 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9D423464;
        Wed, 19 Jan 2022 15:26:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1642602407;
        bh=5a2v6BcFBpyh60y4X1A6VErwVG9QEb2OnYOumbK36dw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Z/YG5sCKZ1ZMW06yrkBzBBG1NaV5gm42wsuYlmI19oeUuTVLEBbe7Vyw36G3b4kCM
         tHYpO0mNP3HSZBzjgDIhxew5FgrO03P6rNQn2I9xwoPrzaNQGN+W5q8Zg432tZztUC
         ZOnRoca/AIpBQHALC7QdqyKNQh07Gq/5LTCKFCuU=
Date:   Wed, 19 Jan 2022 16:26:33 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 2/2] staging: media: imx: imx7-mipi-csic: Set PIXEL_MODE
 for YUV422
Message-ID: <YegfmRSeLvqy6T9L@pendragon.ideasonboard.com>
References: <20220119112024.11339-1-jacopo@jmondi.org>
 <20220119112024.11339-3-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220119112024.11339-3-jacopo@jmondi.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Wed, Jan 19, 2022 at 12:20:24PM +0100, Jacopo Mondi wrote:
> Bits 13 and 12 of the ISP_CONFIGn register configure the PIXEL_MODE
> which specifies the sampling size, in pixel component units, on the
> CSI-2 output data interface when data are transferred to memory.
> 
> The register description in the chip manual specifies that DUAL mode
> should be used for YUV422 data but does not clarify the reason.
> 
> Todo: verify if other YUV formats require the same setting and what is the
> appropriate setting for RAW and sRGB formats.

I'll also test it on i.MX8MM, I recall I had to *not* set
PIXEL_MODE_DUAL on that platform for YUV to work.

> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
>  drivers/staging/media/imx/imx7-mipi-csis.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
> index cb54bb7491d9..e96989c46479 100644
> --- a/drivers/staging/media/imx/imx7-mipi-csis.c
> +++ b/drivers/staging/media/imx/imx7-mipi-csis.c
> @@ -499,6 +499,10 @@ static void __mipi_csis_set_format(struct csi_state *state)
>  	/* Color format */
>  	val = mipi_csis_read(state, MIPI_CSIS_ISP_CONFIG_CH(0));
>  	val &= ~(MIPI_CSIS_ISPCFG_ALIGN_32BIT | MIPI_CSIS_ISPCFG_FMT_MASK);
> +
> +	if (state->csis_fmt->data_type == MIPI_CSI2_DATA_TYPE_YUV422_8)
> +		val |= MIPI_CSIS_ISPCFG_PIXEL_MODE_DUAL;
> +
>  	val |= MIPI_CSIS_ISPCFG_FMT(state->csis_fmt->data_type);
>  	mipi_csis_write(state, MIPI_CSIS_ISP_CONFIG_CH(0), val);
>  

-- 
Regards,

Laurent Pinchart
