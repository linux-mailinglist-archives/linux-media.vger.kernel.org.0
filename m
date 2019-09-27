Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 47FC3C04E7
	for <lists+linux-media@lfdr.de>; Fri, 27 Sep 2019 14:13:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727421AbfI0MNl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Sep 2019 08:13:41 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:51665 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726163AbfI0MNl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Sep 2019 08:13:41 -0400
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1iDp7u-0003vU-Ve; Fri, 27 Sep 2019 14:13:34 +0200
Received: from mfe by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <mfe@pengutronix.de>)
        id 1iDp7u-0006T5-KX; Fri, 27 Sep 2019 14:13:34 +0200
Date:   Fri, 27 Sep 2019 14:13:34 +0200
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     mchehab@kernel.org, sakari.ailus@linux.intel.com,
        hans.verkuil@cisco.com, jacopo+renesas@jmondi.org,
        robh+dt@kernel.org, laurent.pinchart@ideasonboard.com
Cc:     devicetree@vger.kernel.org, kernel@pengutronix.de,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v10 07/14] media: tvp5150: fix set_selection rectangle
 handling
Message-ID: <20190927121334.xjt4pneuohppy44n@pengutronix.de>
References: <20190830101646.6530-1-m.felsch@pengutronix.de>
 <20190830101646.6530-8-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190830101646.6530-8-m.felsch@pengutronix.de>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 14:10:39 up 132 days, 18:28, 86 users,  load average: 0.08, 0.07,
 0.04
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

since you review contained many checkpatch issues I wanna ask if it okay
to keep this line as it before I will send a v11. Please check my inline
comment.

On 19-08-30 12:16, Marco Felsch wrote:
> Currently a local copy of sel->r is made and adapted to the hardware
> constraints. After the adaption the value is applied to the hardware but
> the driver forgot to reflect the adapted value to the user space.
> 
> Drop the local copy and work directly on the requested rectangle
> instead to fix this.
> 
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> ---
> 
> v10:
> - new patch
> 
>  drivers/media/i2c/tvp5150.c | 32 ++++++++++++++++----------------
>  1 file changed, 16 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/media/i2c/tvp5150.c b/drivers/media/i2c/tvp5150.c
> index 477a929d4f89..c1542a89e8c8 100644
> --- a/drivers/media/i2c/tvp5150.c
> +++ b/drivers/media/i2c/tvp5150.c
> @@ -1024,7 +1024,7 @@ static int tvp5150_set_selection(struct v4l2_subdev *sd,
>  				 struct v4l2_subdev_selection *sel)
>  {
>  	struct tvp5150 *decoder = to_tvp5150(sd);
> -	struct v4l2_rect rect = sel->r;
> +	struct v4l2_rect *rect = &sel->r;
>  	v4l2_std_id std;
>  	int hmax;
>  
> @@ -1033,11 +1033,11 @@ static int tvp5150_set_selection(struct v4l2_subdev *sd,
>  		return -EINVAL;
>  
>  	dev_dbg_lvl(sd->dev, 1, debug, "%s left=%d, top=%d, width=%d, height=%d\n",
> -		__func__, rect.left, rect.top, rect.width, rect.height);
> +		__func__, rect->left, rect->top, rect->width, rect->height);
>  
>  	/* tvp5150 has some special limits */
> -	rect.left = clamp(rect.left, 0, TVP5150_MAX_CROP_LEFT);
> -	rect.top = clamp(rect.top, 0, TVP5150_MAX_CROP_TOP);
> +	rect->left = clamp(rect->left, 0, TVP5150_MAX_CROP_LEFT);
> +	rect->top = clamp(rect->top, 0, TVP5150_MAX_CROP_TOP);
>  
>  	/* Calculate height based on current standard */
>  	if (decoder->norm == V4L2_STD_ALL)
> @@ -1055,26 +1055,26 @@ static int tvp5150_set_selection(struct v4l2_subdev *sd,
>  	 *  - width = 2 due to UYVY colorspace
>  	 *  - height, image = no special alignment
>  	 */
> -	v4l_bound_align_image(&rect.width,
> -			      TVP5150_H_MAX - TVP5150_MAX_CROP_LEFT - rect.left,
> -			      TVP5150_H_MAX - rect.left, 1, &rect.height,
> -			      hmax - TVP5150_MAX_CROP_TOP - rect.top,
> -			      hmax - rect.top, 0, 0);
> +	v4l_bound_align_image(&rect->width,
> +			      TVP5150_H_MAX - TVP5150_MAX_CROP_LEFT - rect->left,

Now checkpatch complains about this line because it is 81 characters
long. Is it okay to keep this as single line for readability?

Regards,
  Marco


> +			      TVP5150_H_MAX - rect->left, 1, &rect->height,
> +			      hmax - TVP5150_MAX_CROP_TOP - rect->top,
> +			      hmax - rect->top, 0, 0);
>  
> -	regmap_write(decoder->regmap, TVP5150_VERT_BLANKING_START, rect.top);
> +	regmap_write(decoder->regmap, TVP5150_VERT_BLANKING_START, rect->top);
>  	regmap_write(decoder->regmap, TVP5150_VERT_BLANKING_STOP,
> -		     rect.top + rect.height - hmax);
> +		     rect->top + rect->height - hmax);
>  	regmap_write(decoder->regmap, TVP5150_ACT_VD_CROP_ST_MSB,
> -		     rect.left >> TVP5150_CROP_SHIFT);
> +		     rect->left >> TVP5150_CROP_SHIFT);
>  	regmap_write(decoder->regmap, TVP5150_ACT_VD_CROP_ST_LSB,
> -		     rect.left | (1 << TVP5150_CROP_SHIFT));
> +		     rect->left | (1 << TVP5150_CROP_SHIFT));
>  	regmap_write(decoder->regmap, TVP5150_ACT_VD_CROP_STP_MSB,
> -		     (rect.left + rect.width - TVP5150_MAX_CROP_LEFT) >>
> +		     (rect->left + rect->width - TVP5150_MAX_CROP_LEFT) >>
>  		     TVP5150_CROP_SHIFT);
>  	regmap_write(decoder->regmap, TVP5150_ACT_VD_CROP_STP_LSB,
> -		     rect.left + rect.width - TVP5150_MAX_CROP_LEFT);
> +		     rect->left + rect->width - TVP5150_MAX_CROP_LEFT);
>  
> -	decoder->rect = rect;
> +	decoder->rect = *rect;
>  
>  	return 0;
>  }
> -- 
> 2.20.1
> 
> 

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
