Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 096144A7B33
	for <lists+linux-media@lfdr.de>; Wed,  2 Feb 2022 23:41:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345624AbiBBWlL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Feb 2022 17:41:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232825AbiBBWlL (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Feb 2022 17:41:11 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D847C061714
        for <linux-media@vger.kernel.org>; Wed,  2 Feb 2022 14:41:11 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4F826D88;
        Wed,  2 Feb 2022 23:41:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1643841669;
        bh=upVObDfD513WnnllD3rGvyhgpf/A3zszhOxVYaWncB0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=sAFNfWLxeUi4WcIXE2VENi1ci/KfQdsy/WC/rW+MHGdiGVvNhQTkOV0XS7Lsk20aw
         PHmMdmk23T8QvCgN84RVMARrJucjL3rnwrLzYG3JenvjUEzdUH3O2azl2iDv7SM4ZT
         boDZJHejJ89yD67VxRkSh9ZHLzVOCmYrkiFGXkAk=
Date:   Thu, 3 Feb 2022 00:40:46 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     slongerbeam@gmail.com, sakari.ailus@iki.fi,
        hverkuil-cisco@xs4all.nl, mirela.rabulea@nxp.com,
        xavier.roumegue@oss.nxp.com, tomi.valkeinen@ideasonboard.com,
        hugues.fruchet@st.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
        aford173@gmail.com, festevam@gmail.com,
        eugen.hristev@microchip.com, jbrunet@baylibre.com,
        mchehab@kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH 16/21] media: ov5640: Disable s_frame_interval in MIPI
 mode
Message-ID: <YfsIblSAeVeyEFoi@pendragon.ideasonboard.com>
References: <20220131143245.128089-1-jacopo@jmondi.org>
 <20220131144444.129036-1-jacopo@jmondi.org>
 <20220131144444.129036-5-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220131144444.129036-5-jacopo@jmondi.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Mon, Jan 31, 2022 at 03:44:44PM +0100, Jacopo Mondi wrote:
> When the sensor is operated in MIPI mode, the frame rate configuration
> is performed by tuning the frame blanking times and not by the
> s_frame_interval subdev operation.
> 
> Disallow enum/s/g_frame_interval if the chip is used in MIPI mode.
> 
> While at it re-indent one function which whose parameters were wrongly
> aligned.

I would squash this with 15/21.

> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
>  drivers/media/i2c/ov5640.c | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> index ec46e16223af..28da0ddd2a06 100644
> --- a/drivers/media/i2c/ov5640.c
> +++ b/drivers/media/i2c/ov5640.c
> @@ -3275,15 +3275,17 @@ static int ov5640_enum_frame_size(struct v4l2_subdev *sd,
>  	return 0;
>  }
>  
> -static int ov5640_enum_frame_interval(
> -	struct v4l2_subdev *sd,
> -	struct v4l2_subdev_state *sd_state,
> -	struct v4l2_subdev_frame_interval_enum *fie)
> +static int ov5640_enum_frame_interval(struct v4l2_subdev *sd,
> +				      struct v4l2_subdev_state *sd_state,
> +				      struct v4l2_subdev_frame_interval_enum *fie)
>  {
>  	struct ov5640_dev *sensor = to_ov5640_dev(sd);
>  	struct v4l2_fract tpf;
>  	int ret;
>  
> +	if (ov5640_is_mipi(sensor))
> +		return -EINVAL;

Should we return -ENOIOCTLCMD instead of -EINVAL, to indicate the
operation isn't implemented in CSI-2 mode ? Same below.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +
>  	if (fie->pad != 0)
>  		return -EINVAL;
>  	if (fie->index >= OV5640_NUM_FRAMERATES)
> @@ -3306,6 +3308,9 @@ static int ov5640_g_frame_interval(struct v4l2_subdev *sd,
>  {
>  	struct ov5640_dev *sensor = to_ov5640_dev(sd);
>  
> +	if (ov5640_is_mipi(sensor))
> +		return -EINVAL;
> +
>  	mutex_lock(&sensor->lock);
>  	fi->interval = sensor->frame_interval;
>  	mutex_unlock(&sensor->lock);
> @@ -3320,6 +3325,9 @@ static int ov5640_s_frame_interval(struct v4l2_subdev *sd,
>  	const struct ov5640_mode_info *mode;
>  	int frame_rate, ret = 0;
>  
> +	if (ov5640_is_mipi(sensor))
> +		return -EINVAL;
> +
>  	if (fi->pad != 0)
>  		return -EINVAL;
>  

-- 
Regards,

Laurent Pinchart
