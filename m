Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B69C4BCE97
	for <lists+linux-media@lfdr.de>; Sun, 20 Feb 2022 14:16:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238223AbiBTNQg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 20 Feb 2022 08:16:36 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:33492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232564AbiBTNQf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 20 Feb 2022 08:16:35 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4ACCB3C72C
        for <linux-media@vger.kernel.org>; Sun, 20 Feb 2022 05:16:14 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 658C025B;
        Sun, 20 Feb 2022 14:16:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1645362972;
        bh=1lxyg7OPywJYp++CdnlCg5MX82c8lR3AAr4fpWqzaLY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Rt1kqXLZlBoJkJB7/LAeAj0p/QgKNIvh/3RehZ/2usZyo1mRI71IApO3g/Bo6/AOT
         mlo6QW1kc224WqJJs1aTSes0ZCMUq24hg0PzvJF0/v+HYoARBADQqlAVjlSt8JUMXY
         aI/5aWGagwzZFUeNIUEsBaft9yQzGBv8tZ5lKzXU=
Date:   Sun, 20 Feb 2022 15:16:03 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     slongerbeam@gmail.com, sakari.ailus@iki.fi,
        hverkuil-cisco@xs4all.nl, mirela.rabulea@nxp.com,
        xavier.roumegue@oss.nxp.com, tomi.valkeinen@ideasonboard.com,
        hugues.fruchet@st.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
        aford173@gmail.com, festevam@gmail.com,
        eugen.hristev@microchip.com, jbrunet@baylibre.com,
        mchehab@kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH v2 22/23] media: ov5640: Restrict sizes to mbus code
Message-ID: <YhI/E72moUnW66Mp@pendragon.ideasonboard.com>
References: <20220210110458.152494-1-jacopo@jmondi.org>
 <20220210111044.152904-3-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220210111044.152904-3-jacopo@jmondi.org>
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

On Thu, Feb 10, 2022 at 12:10:43PM +0100, Jacopo Mondi wrote:
> The ov5640 driver supports different sizes for different mbus_codes.
> In particular:
> 
> - 8bpp modes: high resolution sizes (>= 1280x720)
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
> index f894570ac53c..81bf547a923e 100644
> --- a/drivers/media/i2c/ov5640.c
> +++ b/drivers/media/i2c/ov5640.c
> @@ -3315,14 +3315,28 @@ static int ov5640_enum_frame_size(struct v4l2_subdev *sd,
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

s/24bpp modes/24bpp formats/


Do you think this is a limitation of the sensor, or an issue in the
driver ? In the latter case, I'd write

	/* FIXME: High resolution modes don't work in 24bpp formats. */

> +	if (bpp == 24 && index >= OV5640_MODE_720P_1280_720)
> +		return -EINVAL;
> +
> +	/* Only high-resolutions modes are supported for 8bpp formats. */

And here

	/* FIXME: Low resolution modes don't work in 8bpp formats. */

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

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
