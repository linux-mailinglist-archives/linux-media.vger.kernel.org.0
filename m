Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A16402A92FE
	for <lists+linux-media@lfdr.de>; Fri,  6 Nov 2020 10:42:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726558AbgKFJmK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Nov 2020 04:42:10 -0500
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:58057 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726139AbgKFJmJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 6 Nov 2020 04:42:09 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id ayFukJTEONanzayFxkrf8o; Fri, 06 Nov 2020 10:42:07 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1604655727; bh=PEYrZDSSRdLLZhPX1URBLOlxwYHt3bdhihLxlWPafi4=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=co4DjGTgpego4sZsdoj7dnWYhchTR9mxgHZdOW3K7q8+1xmEiWLbCoVDqv2GJVLYB
         YN6HmiIugO6eWUotyffn2mt2IcMJH3v27yUM4GOc2fIFvF33aqY36aGXHshB95AEXI
         lhs7G5rgrIMWernMi01I8SvXgE9BImWVNSxoNgP2zk7qTi3ctad8MvoYGj2M49zjiP
         ysBotCfL0SwxW5e0zXZADZSQNOGVl8m5mCD4+4mo2hMnNDUE2U6nvBU767V9hGaNa+
         eGTYvT4RGBjmWgDv4AmV1ziD6JuGc/xi/fXQgQY1tzgERpaLRre+etorx/dYW1yaV6
         pcDwFpneiGf+w==
Subject: Re: [PATCH v2 15/30] media: ov5647: Add support for get_selection()
To:     Jacopo Mondi <jacopo@jmondi.org>, linux-media@vger.kernel.org
Cc:     mchehab@kernel.org, sakari.ailus@linux.intel.com,
        laurent.pinchart@ideasonboard.com,
        roman.kovalivskyi@globallogic.com, dafna.hirschfeld@collabora.com,
        dave.stevenson@raspberrypi.org, naush@raspberrypi.com,
        erosca@de.adit-jv.com,
        Dave Stevenson <dave.stevenson@raspberrypi.com>
References: <20201104103622.595908-1-jacopo@jmondi.org>
 <20201104103622.595908-16-jacopo@jmondi.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <98b2ee85-8149-f0ca-b42b-e0a5329c65bd@xs4all.nl>
Date:   Fri, 6 Nov 2020 10:42:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201104103622.595908-16-jacopo@jmondi.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfPB6e2J6GYrA9CsEg5NEvzIQJjdM4BL5KQ0v6Q/dZU3j1KN0AS3enKYmmbJgmYKPzW4arDSfbVcazXp+FVwdd2JQ2wvNS7Z6wacy3bIX5oAzZvBfhWGv
 S/9fjT6kMAJkTsCg+Q3VUbh5ulXjPDysm3Ldtsfqe3Xz4c0x6t1IBMRhPky1tdMijeHgDTuXR/f9D3IkQd6giIC6mpVGwsSYKUd81fL2FFVoB7wWK34FnzEE
 qHh76zDBtYE7JRdRUxP4UPO3Ex6EpgNzzIANdsE96UKQ2WcbaK7U8WI3mhtArA+827anZdAg1sjkfaiKVC6O8lNYNGNrdFU11ZrydmJQprQaQUYag46cLzQR
 BcY5WP74WYK9NSAK7CL1QToHU1lOKeCkY/Mw3wneu8z519gXSpAnWzxanVS5QhTxPK87cIJNuNUEFQkYvaDQhsEAm6peut091v7cXMnv83N7yrWDicA8R0cR
 RWAylxKxjoL7hoe+QH0c+5a7T1WAp/2yk5GDQmZkE9mvUrOGgJ106HlKRtevH3S+i+1uBZkm+VT1a8/nWQP77tOcmWAyUGNJBh6iTie20/07hj4iI1cOTfRx
 V5U=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 04/11/2020 11:36, Jacopo Mondi wrote:
> From: Dave Stevenson <dave.stevenson@raspberrypi.com>
> 
> Support the get_selection() pad operation to report the device
> full pixel array size, the currently applied analogue crop rectangle and
> the active pixel array dimensions.
> 
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
>  drivers/media/i2c/ov5647.c | 93 ++++++++++++++++++++++++++++----------
>  1 file changed, 70 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
> index d41c11afe1216..65fcd86dcba96 100644
> --- a/drivers/media/i2c/ov5647.c
> +++ b/drivers/media/i2c/ov5647.c
> @@ -59,25 +59,14 @@
>  #define VAL_TERM 0xfe
>  #define REG_DLY  0xffff
>  
> -#define OV5647_ROW_START		0x01
> -#define OV5647_ROW_START_MIN		0
> -#define OV5647_ROW_START_MAX		2004
> -#define OV5647_ROW_START_DEF		54
> -
> -#define OV5647_COLUMN_START		0x02
> -#define OV5647_COLUMN_START_MIN		0
> -#define OV5647_COLUMN_START_MAX		2750
> -#define OV5647_COLUMN_START_DEF		16
> -
> -#define OV5647_WINDOW_HEIGHT		0x03
> -#define OV5647_WINDOW_HEIGHT_MIN	2
> -#define OV5647_WINDOW_HEIGHT_MAX	2006
> -#define OV5647_WINDOW_HEIGHT_DEF	1944
> -
> -#define OV5647_WINDOW_WIDTH		0x04
> -#define OV5647_WINDOW_WIDTH_MIN		2
> -#define OV5647_WINDOW_WIDTH_MAX		2752
> -#define OV5647_WINDOW_WIDTH_DEF		2592
> +/* OV5647 native and active pixel array size */
> +#define OV5647_NATIVE_WIDTH		2624U
> +#define OV5647_NATIVE_HEIGHT		1956U
> +
> +#define OV5647_PIXEL_ARRAY_LEFT		16U
> +#define OV5647_PIXEL_ARRAY_TOP		16U
> +#define OV5647_PIXEL_ARRAY_WIDTH	2592U
> +#define OV5647_PIXEL_ARRAY_HEIGHT	1944U
>  
>  struct regval_list {
>  	u16 addr;
> @@ -86,6 +75,7 @@ struct regval_list {
>  
>  struct ov5647_mode {
>  	struct v4l2_mbus_framefmt	format;
> +	struct v4l2_rect		crop;
>  	const struct regval_list	*reg_list;
>  	unsigned int			num_regs;
>  };
> @@ -224,6 +214,12 @@ static const struct ov5647_mode ov5647_8bit_modes[] = {
>  			.width		= 640,
>  			.height		= 480
>  		},
> +		.crop = {
> +			.left		= 0,
> +			.top		= 0,
> +			.width		= 1280,
> +			.height		= 960,
> +		},
>  		.reg_list	= ov5647_640x480,
>  		.num_regs	= ARRAY_SIZE(ov5647_640x480)
>  	},
> @@ -509,6 +505,20 @@ static const struct v4l2_subdev_core_ops ov5647_subdev_core_ops = {
>  #endif
>  };
>  
> +static const struct v4l2_rect *
> +__ov5647_get_pad_crop(struct ov5647 *ov5647, struct v4l2_subdev_pad_config *cfg,
> +		      unsigned int pad, enum v4l2_subdev_format_whence which)
> +{
> +	switch (which) {
> +	case V4L2_SUBDEV_FORMAT_TRY:
> +		return v4l2_subdev_get_try_crop(&ov5647->sd, cfg, pad);
> +	case V4L2_SUBDEV_FORMAT_ACTIVE:
> +		return &ov5647->mode->crop;
> +	}
> +
> +	return NULL;
> +}
> +
>  static int ov5647_s_stream(struct v4l2_subdev *sd, int enable)
>  {
>  	struct ov5647 *sensor = to_sensor(sd);
> @@ -579,11 +589,48 @@ static int ov5647_set_get_fmt(struct v4l2_subdev *sd,
>  	return 0;
>  }
>  
> +static int ov5647_get_selection(struct v4l2_subdev *sd,
> +				struct v4l2_subdev_pad_config *cfg,
> +				struct v4l2_subdev_selection *sel)
> +{
> +	switch (sel->target) {
> +	case V4L2_SEL_TGT_CROP: {
> +		struct ov5647 *sensor = to_sensor(sd);
> +
> +		mutex_lock(&sensor->lock);
> +		sel->r = *__ov5647_get_pad_crop(sensor, cfg, sel->pad,
> +						sel->which);
> +		mutex_unlock(&sensor->lock);
> +
> +		return 0;
> +	}
> +
> +	case V4L2_SEL_TGT_NATIVE_SIZE:
> +		sel->r.top = 0;
> +		sel->r.left = 0;
> +		sel->r.width = OV5647_NATIVE_WIDTH;
> +		sel->r.height = OV5647_NATIVE_HEIGHT;
> +
> +		return 0;
> +
> +	case V4L2_SEL_TGT_CROP_DEFAULT:
> +		sel->r.top = OV5647_PIXEL_ARRAY_TOP;
> +		sel->r.left = OV5647_PIXEL_ARRAY_LEFT;
> +		sel->r.width = OV5647_PIXEL_ARRAY_WIDTH;
> +		sel->r.height = OV5647_PIXEL_ARRAY_HEIGHT;
> +
> +		return 0;

You're missing V4L2_SEL_TGT_CROP_BOUNDS. In order to support VIDIOC_CROPCAP
it is required that g_selection supports both V4L2_SEL_TGT_CROP_DEFAULT and
V4L2_SEL_TGT_CROP_BOUNDS.

So this is the reason why v4l2-compliance fails that test.

I'm improving the comment in that test to make it easier to pinpoint the
reason for the fail.

Regards,

	Hans

> +	}
> +
> +	return -EINVAL;
> +}
> +
>  static const struct v4l2_subdev_pad_ops ov5647_subdev_pad_ops = {
>  	.enum_mbus_code		= ov5647_enum_mbus_code,
>  	.enum_frame_size	= ov5647_enum_frame_size,
>  	.set_fmt		= ov5647_set_get_fmt,
>  	.get_fmt		= ov5647_set_get_fmt,
> +	.get_selection		= ov5647_get_selection,
>  };
>  
>  static const struct v4l2_subdev_ops ov5647_subdev_ops = {
> @@ -628,10 +675,10 @@ static int ov5647_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
>  	struct v4l2_mbus_framefmt *format = v4l2_subdev_get_try_format(sd, fh->pad, 0);
>  	struct v4l2_rect *crop = v4l2_subdev_get_try_crop(sd, fh->pad, 0);
>  
> -	crop->left = OV5647_COLUMN_START_DEF;
> -	crop->top = OV5647_ROW_START_DEF;
> -	crop->width = OV5647_WINDOW_WIDTH_DEF;
> -	crop->height = OV5647_WINDOW_HEIGHT_DEF;
> +	crop->left = OV5647_PIXEL_ARRAY_LEFT;
> +	crop->top = OV5647_PIXEL_ARRAY_TOP;
> +	crop->width = OV5647_PIXEL_ARRAY_WIDTH;
> +	crop->height = OV5647_PIXEL_ARRAY_HEIGHT;
>  
>  	*format = OV5647_DEFAULT_FORMAT;
>  
> 

