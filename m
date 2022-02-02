Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6013D4A7B48
	for <lists+linux-media@lfdr.de>; Wed,  2 Feb 2022 23:50:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236839AbiBBWsu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Feb 2022 17:48:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231298AbiBBWsu (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Feb 2022 17:48:50 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5A32C061714
        for <linux-media@vger.kernel.org>; Wed,  2 Feb 2022 14:48:49 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DE575D88;
        Wed,  2 Feb 2022 23:48:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1643842128;
        bh=SkvNHaYU88ZcNRzYvm8K1eUxz6pkl9NmqgkSRbFFhOs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bXYsbtJT0KyRJlX3+FpCCEVtJjWmHod9LGPTnEdGo5rwkoPi+XHNaWobheM0Ig9u0
         qoawCaEYy2hyGGJIkKAcuy7IMfPyyQOQbJkaFq9OsQE8OP0yf7V2vEWh8n0l5iYp1t
         gYYy/QjpB6Xxt2qvY/1HLM7QBuTSTHRoUFufOr+Y=
Date:   Thu, 3 Feb 2022 00:48:25 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     slongerbeam@gmail.com, sakari.ailus@iki.fi,
        hverkuil-cisco@xs4all.nl, mirela.rabulea@nxp.com,
        xavier.roumegue@oss.nxp.com, tomi.valkeinen@ideasonboard.com,
        hugues.fruchet@st.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
        aford173@gmail.com, festevam@gmail.com,
        eugen.hristev@microchip.com, jbrunet@baylibre.com,
        mchehab@kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH 18/21] media: ov5640: Add RGB565_1X16 format
Message-ID: <YfsKOaT895j0UxnQ@pendragon.ideasonboard.com>
References: <20220131143245.128089-1-jacopo@jmondi.org>
 <20220131144529.129096-1-jacopo@jmondi.org>
 <20220131144529.129096-2-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220131144529.129096-2-jacopo@jmondi.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Mon, Jan 31, 2022 at 03:45:28PM +0100, Jacopo Mondi wrote:
> The driver already supports the 2X8_[LE|BE] variants of RGB565
> formats.
> 
> As for CSI-2 the 2X8 variants do not apply, add RGB565_1X16 variant
> with little-endian ordering of components as required by the CSI-2
> specifications.
> 
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
>  drivers/media/i2c/ov5640.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> index 9d6eb3288b07..db77cdb8a958 100644
> --- a/drivers/media/i2c/ov5640.c
> +++ b/drivers/media/i2c/ov5640.c
> @@ -197,6 +197,7 @@ static const struct ov5640_pixfmt {
>  	{ MEDIA_BUS_FMT_YUYV8_1X16, V4L2_COLORSPACE_SRGB, 16,},
>  	{ MEDIA_BUS_FMT_RGB565_2X8_LE, V4L2_COLORSPACE_SRGB, 16},
>  	{ MEDIA_BUS_FMT_RGB565_2X8_BE, V4L2_COLORSPACE_SRGB, 16},
> +	{ MEDIA_BUS_FMT_RGB565_1X16, V4L2_COLORSPACE_SRGB, 16},

Should/could we limit this format to CSI-2 mode ?

>  	{ MEDIA_BUS_FMT_SBGGR8_1X8, V4L2_COLORSPACE_SRGB, 8},
>  	{ MEDIA_BUS_FMT_SGBRG8_1X8, V4L2_COLORSPACE_SRGB, 8},
>  	{ MEDIA_BUS_FMT_SGRBG8_1X8, V4L2_COLORSPACE_SRGB, 8},
> @@ -2746,6 +2747,7 @@ static int ov5640_set_framefmt(struct ov5640_dev *sensor,
>  		mux = OV5640_FMT_MUX_YUV422;
>  		break;
>  	case MEDIA_BUS_FMT_RGB565_2X8_LE:
> +	case MEDIA_BUS_FMT_RGB565_1X16:
>  		/* RGB565 {g[2:0],b[4:0]},{r[4:0],g[5:3]} */
>  		fmt = 0x6F;
>  		mux = OV5640_FMT_MUX_RGB;

-- 
Regards,

Laurent Pinchart
