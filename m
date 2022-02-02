Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AEB354A7B68
	for <lists+linux-media@lfdr.de>; Thu,  3 Feb 2022 00:04:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347978AbiBBXEQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Feb 2022 18:04:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233672AbiBBXEP (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Feb 2022 18:04:15 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 653E3C061714
        for <linux-media@vger.kernel.org>; Wed,  2 Feb 2022 15:04:15 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7827449C;
        Thu,  3 Feb 2022 00:04:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1643843053;
        bh=sFkNabhzaMA2jp9oLFmITg9opKdaWDTgdyX29yyVBrA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PRB30zG/+MG6oIg+lj07XbEQ9bwGPE9WQSLHIJuhl19OOMZd18O9kJA/rAqy5O3Tn
         RqMLZ4+KwRPSSrhbsxRpa+NRkQcRmhiPk4tQUes4keFJSoh++Hv6cmUrn+XCUmp9Pe
         YVb/Bo1yabXCbpZEpsL9joSmKB9WlEfyC2FlHspk=
Date:   Thu, 3 Feb 2022 01:03:50 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     slongerbeam@gmail.com, sakari.ailus@iki.fi,
        hverkuil-cisco@xs4all.nl, mirela.rabulea@nxp.com,
        xavier.roumegue@oss.nxp.com, tomi.valkeinen@ideasonboard.com,
        hugues.fruchet@st.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
        aford173@gmail.com, festevam@gmail.com,
        eugen.hristev@microchip.com, jbrunet@baylibre.com,
        mchehab@kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH 21/21] media: ov5640: Adjust format to bpp in s_fmt
Message-ID: <YfsN1oL2wq5rYk+H@pendragon.ideasonboard.com>
References: <20220131143245.128089-1-jacopo@jmondi.org>
 <20220131144556.129122-1-jacopo@jmondi.org>
 <20220131144556.129122-2-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220131144556.129122-2-jacopo@jmondi.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Mon, Jan 31, 2022 at 03:45:56PM +0100, Jacopo Mondi wrote:
> The ov5640 driver supports different sizes for different mbus_codes.
> In particular:
> 
> - 8bpp modes: high resolution sizes (>= 1280x720)
> - 16bpp modes: all sizes
> - 24bpp modes: low resolutions sizes (< 1280x720)
> 
> Adjust the image sizes according to the above constraints.
> 
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
>  drivers/media/i2c/ov5640.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> index 2978dabd1d54..49d0df80f71a 100644
> --- a/drivers/media/i2c/ov5640.c
> +++ b/drivers/media/i2c/ov5640.c
> @@ -2529,6 +2529,7 @@ static int ov5640_try_fmt_internal(struct v4l2_subdev *sd,
>  				   enum ov5640_frame_rate fr,
>  				   const struct ov5640_mode_info **new_mode)
>  {
> +	unsigned int bpp = ov5640_code_to_bpp(fmt->code);
>  	struct ov5640_dev *sensor = to_ov5640_dev(sd);
>  	const struct ov5640_mode_info *mode;
>  	int i;
> @@ -2536,6 +2537,17 @@ static int ov5640_try_fmt_internal(struct v4l2_subdev *sd,
>  	mode = ov5640_find_mode(sensor, fr, fmt->width, fmt->height, true);
>  	if (!mode)
>  		return -EINVAL;
> +
> +	/*
> +	 * Adjust mode according to bpp:
> +	 * - 8bpp modes work for resolution >= 1280x720
> +	 * - 24bpp modes work resolution < 1280x720
> +	 */
> +	if (bpp == 8 && mode->crop.width < 1280)
> +		mode = &ov5640_mode_data[OV5640_MODE_720P_1280_720];
> +	else if (bpp == 24 && mode->crop.width > 1024)
> +		mode = &ov5640_mode_data[OV5640_MODE_XGA_1024_768];

This is in line with patch 20/21, so

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

but I'm still not sure about the limitation for 8bpp.

> +
>  	fmt->width = mode->crop.width;
>  	fmt->height = mode->crop.height;
>  

-- 
Regards,

Laurent Pinchart
