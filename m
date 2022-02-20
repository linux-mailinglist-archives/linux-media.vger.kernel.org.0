Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 313D84BCE8B
	for <lists+linux-media@lfdr.de>; Sun, 20 Feb 2022 14:07:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243807AbiBTNHx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 20 Feb 2022 08:07:53 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:45458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236610AbiBTNHw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 20 Feb 2022 08:07:52 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 782E12DE6
        for <linux-media@vger.kernel.org>; Sun, 20 Feb 2022 05:07:31 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B119025B;
        Sun, 20 Feb 2022 14:07:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1645362449;
        bh=6QvWI4aXbctkk2Bvv6KScM1flAKn5s37iGFs4SYw+rI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=MxLTSfzyAWxrxY6vb3hXoP0va19IJV2eQIl+uMG0V0KN60VnEYI0zqSemQ7yruIGd
         QgVoAM0t4kXfYCH3QqwJcorJ71ppyDreNn5r2cxki9KvIuglg57oXC+2HqgvcUlow2
         YKBEfGo8XWKFx4jEID+8mc72pJLopXYa+/74gbOM=
Date:   Sun, 20 Feb 2022 15:07:20 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     slongerbeam@gmail.com, sakari.ailus@iki.fi,
        hverkuil-cisco@xs4all.nl, mirela.rabulea@nxp.com,
        xavier.roumegue@oss.nxp.com, tomi.valkeinen@ideasonboard.com,
        hugues.fruchet@st.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
        aford173@gmail.com, festevam@gmail.com,
        eugen.hristev@microchip.com, jbrunet@baylibre.com,
        mchehab@kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH v2 20/23] media: ov5640: Add RGB565_1X16 format
Message-ID: <YhI9COB67n5EKVtZ@pendragon.ideasonboard.com>
References: <20220210110458.152494-1-jacopo@jmondi.org>
 <20220210111044.152904-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220210111044.152904-1-jacopo@jmondi.org>
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

On Thu, Feb 10, 2022 at 12:10:41PM +0100, Jacopo Mondi wrote:
> The driver already supports the 2X8_[LE|BE] variants of RGB565
> formats.
> 
> As for CSI-2 the 2X8 variants do not apply, add RGB565_1X16 variant
> with little-endian ordering of components as required by the CSI-2
> specifications.
> 
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
>  drivers/media/i2c/ov5640.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> index aecc8912099a..3a21f4648acf 100644
> --- a/drivers/media/i2c/ov5640.c
> +++ b/drivers/media/i2c/ov5640.c
> @@ -220,6 +220,10 @@ static const struct ov5640_pixfmt {
>  		.code = MEDIA_BUS_FMT_RGB565_2X8_BE,
>  		.colorspace = V4L2_COLORSPACE_SRGB,
>  		.bpp = 16,
> +	}, {
> +		.code = MEDIA_BUS_FMT_RGB565_1X16,
> +		.colorspace = V4L2_COLORSPACE_SRGB,
> +		.bpp = 16,

Should/could we limit this format to CSI-2 mode ?

>  	}, {
>  		.code = MEDIA_BUS_FMT_SBGGR8_1X8,
>  		.colorspace = V4L2_COLORSPACE_SRGB,
> @@ -2763,6 +2767,7 @@ static int ov5640_set_framefmt(struct ov5640_dev *sensor,
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
