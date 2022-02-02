Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5384F4A7B58
	for <lists+linux-media@lfdr.de>; Wed,  2 Feb 2022 23:58:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347966AbiBBW57 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Feb 2022 17:57:59 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:36348 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231478AbiBBW56 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Feb 2022 17:57:58 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id CCDB3D88;
        Wed,  2 Feb 2022 23:57:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1643842677;
        bh=h2HwL7dcVfC5F/LlqhE/HpOxkQfZuvR+dBFgDTJlgG8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=oUHrVStMbyXjobT9EwrLPCtvWSA1QUmja29ohfELUv8ohT+USxPsaFFXLkH2TkYjW
         WMJ+o/MQfPtZWoEOmW52YoEd4RMrruYMP8NbwoN6daH229h9BF94vUQ2Y604dzV20C
         rtFgE+PkYl1URetn1veme2KFgjo1cPMsTIj9IrFE=
Date:   Thu, 3 Feb 2022 00:57:34 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     slongerbeam@gmail.com, sakari.ailus@iki.fi,
        hverkuil-cisco@xs4all.nl, mirela.rabulea@nxp.com,
        xavier.roumegue@oss.nxp.com, tomi.valkeinen@ideasonboard.com,
        hugues.fruchet@st.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
        aford173@gmail.com, festevam@gmail.com,
        eugen.hristev@microchip.com, jbrunet@baylibre.com,
        mchehab@kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH 20/21] media: ov5640: Restrict sizes to mbus code
Message-ID: <YfsMXsm/ZEHzoB0S@pendragon.ideasonboard.com>
References: <20220131143245.128089-1-jacopo@jmondi.org>
 <20220131144556.129122-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220131144556.129122-1-jacopo@jmondi.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Mon, Jan 31, 2022 at 03:45:55PM +0100, Jacopo Mondi wrote:
> The ov5640 driver supports different sizes for different mbus_codes.
> In particular:
> 
> - 8bpp modes: high resolution sizes (>= 1280x720)

I'm curious as to why the raw modes can't support lower resolutions.

> - 16bpp modes: all sizes
> - 24bpp modes: low resolutions sizes (< 1280x720)
> 
> Restrict the frame sizes enumerations to the above constraints.
> 
> While at it, make sure the fse->mbus_code parameter is valid, and return
> -EINVAL if it's not.
> 
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
>  drivers/media/i2c/ov5640.c | 20 +++++++++++++++++---
>  1 file changed, 17 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> index 5891eaab05ee..2978dabd1d54 100644
> --- a/drivers/media/i2c/ov5640.c
> +++ b/drivers/media/i2c/ov5640.c
> @@ -3288,14 +3288,28 @@ static int ov5640_enum_frame_size(struct v4l2_subdev *sd,
>  				  struct v4l2_subdev_state *sd_state,
>  				  struct v4l2_subdev_frame_size_enum *fse)
>  {
> +	u32 bpp = ov5640_code_to_bpp(fse->code);
> +	unsigned int index = fse->index;
> +
>  	if (fse->pad != 0)
>  		return -EINVAL;
> -	if (fse->index >= OV5640_NUM_MODES)
> +	if (!bpp)
> +		return -EINVAL;
> +
> +	/* Only low-resolution modes are supported for 24bpp modes. */
> +	if (bpp == 24 && index >= OV5640_MODE_720P_1280_720)
> +		return -EINVAL;
> +
> +	/* Only high-resolutions modes are supported for 8bpp formats. */
> +	if (bpp == 8)
> +		index += OV5640_MODE_720P_1280_720;
> +
> +	if (index >= OV5640_NUM_MODES)
>  		return -EINVAL;
>  
> -	fse->min_width = ov5640_mode_data[fse->index].crop.width;
> +	fse->min_width = ov5640_mode_data[index].crop.width;
>  	fse->max_width = fse->min_width;
> -	fse->min_height = ov5640_mode_data[fse->index].crop.height;
> +	fse->min_height = ov5640_mode_data[index].crop.height;
>  	fse->max_height = fse->min_height;
>  
>  	return 0;

-- 
Regards,

Laurent Pinchart
