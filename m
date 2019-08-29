Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 80AF1A1539
	for <lists+linux-media@lfdr.de>; Thu, 29 Aug 2019 11:56:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726245AbfH2J44 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Aug 2019 05:56:56 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:46175 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726009AbfH2J44 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Aug 2019 05:56:56 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud8.xs4all.net with ESMTPA
        id 3HAeiQePVDqPe3HAhiNLZ4; Thu, 29 Aug 2019 11:56:53 +0200
Subject: Re: [PATCH v9 07/13] media: tvp5150: add FORMAT_TRY support for
 get/set selection handlers
To:     Marco Felsch <m.felsch@pengutronix.de>, mchehab@kernel.org,
        sakari.ailus@linux.intel.com, hans.verkuil@cisco.com,
        jacopo+renesas@jmondi.org, robh+dt@kernel.org,
        laurent.pinchart@ideasonboard.com
Cc:     devicetree@vger.kernel.org, kernel@pengutronix.de,
        linux-media@vger.kernel.org
References: <20190822080556.17109-1-m.felsch@pengutronix.de>
 <20190822080556.17109-8-m.felsch@pengutronix.de>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <aadcd44b-7708-e4e7-1926-d9ac0bc8ef8f@xs4all.nl>
Date:   Thu, 29 Aug 2019 11:56:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190822080556.17109-8-m.felsch@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfMP08EdhoSqy9MKefGcTN/FrhEzObt23llm3FoYDuBHOjd/1/VHgO5StYLF6dAbQP1aN62G23F9b94E9P5BxGuA+uy5V+qopg+/Tb4NM+Ql4Dt/dOs8E
 cZyvokxt4lhMO/GeNT8N2j+6xCKvtOg8CXlQXAjw8cI6bCGN4FkLPOKOtgl79xHHW8mrhORjSjAKBMXbWcoSfPPv5zdlhEy18zfb7pUwWDEHQPCMN6hJEYKT
 83Ofsa320bduygU2Frk87auYTJ3FjP3TrIIDEoF3iCp0QDPpVB19TXCEmDdKuTKgrfCiulxKqj6zfdHUC6/O9n1UgJ9VENjtfTvchdXviIbyIH52JoJBa2Ti
 FMXJwKgOe6ec7YfOmpjBnWGT5Af7mV3/obJl2hzsq+rnHCXfUUQLUJw5wQlHC96nwDNxQUnwx6T+wxQGJ7Q1qnzhioa+g3U84MMba9PD9bXfzU74cP5ZqbTe
 zEUQrOOk3sCMf6vxRaVC5YXKOpVG7/ZYeRsTVw==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 8/22/19 10:05 AM, Marco Felsch wrote:
> Since commit 10d5509c8d50 ("[media] v4l2: remove g/s_crop from video ops")
> the 'which' field for set/get_selection must be FORMAT_ACTIVE. There is
> no way to try different selections. The patch adds a helper function to
> select the correct selection memory space (sub-device file handle or
> driver state) which will be set/returned.
> 
> The selection rectangle is updated if the format is FORMAT_ACTIVE and
> the rectangle position and/or size differs from the current set
> rectangle.
> 
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> ---
> Changelog:
> 
> v8:
> - adapt commit message
> - remove wrong FORMAT_TRY handling for tvp5150_fill_fmt() handling
> - return 0 during set_selection if FORMAT_TRY was requested and
>   CONFIG_VIDEO_V4L2_SUBDEV_API is disabled
> - return -EINVAL during get_selection if FORMAT_TRY was requested and
>   CONFIG_VIDEO_V4L2_SUBDEV_API is disabled
> v7:
> - __tvp5150_get_pad_crop(): return error on default case
> - simplify __tvp5150_get_pad_crop() error handling
> - tvp5150_set_selection() squash __tvp5150_set_selection() execution
>   conditions
> v6:
> nothing
> v5:
>  - handle stub for v4l2_subdev_get_try_crop() internal since commit
>    ("media: v4l2-subdev: add stubs for v4l2_subdev_get_try_*")
>    isn't anymore part of this series.
>  - add error handling of __tvp5150_get_pad_crop()
> v4:
>  - fix merge conflict due to rebase on top of media-tree/master
>  - __tvp5150_get_pad_crop(): cosmetic alignment fixes
> ---
>  drivers/media/i2c/tvp5150.c | 111 +++++++++++++++++++++++++-----------
>  1 file changed, 79 insertions(+), 32 deletions(-)
> 
> diff --git a/drivers/media/i2c/tvp5150.c b/drivers/media/i2c/tvp5150.c
> index 477a929d4f89..62a1c7c3a7c0 100644
> --- a/drivers/media/i2c/tvp5150.c
> +++ b/drivers/media/i2c/tvp5150.c
> @@ -19,6 +19,7 @@
>  #include <media/v4l2-ctrls.h>
>  #include <media/v4l2-fwnode.h>
>  #include <media/v4l2-mc.h>
> +#include <media/v4l2-rect.h>
>  
>  #include "tvp5150_reg.h"
>  
> @@ -995,6 +996,23 @@ static void tvp5150_set_default(v4l2_std_id std, struct v4l2_rect *crop)
>  		crop->height = TVP5150_V_MAX_OTHERS;
>  }
>  
> +static struct v4l2_rect *
> +__tvp5150_get_pad_crop(struct tvp5150 *decoder,
> +		       struct v4l2_subdev_pad_config *cfg, unsigned int pad,
> +		       enum v4l2_subdev_format_whence which)
> +{
> +	switch (which) {
> +	case V4L2_SUBDEV_FORMAT_ACTIVE:
> +		return &decoder->rect;
> +	case V4L2_SUBDEV_FORMAT_TRY:
> +#if defined(CONFIG_VIDEO_V4L2_SUBDEV_API)
> +		return v4l2_subdev_get_try_crop(&decoder->sd, cfg, pad);
> +#endif

Hmm, this fall-through is confusing.

I'd just do:

#else
		return ERR_PTR(-EINVAL);
#endif


> +	default:
> +		return ERR_PTR(-EINVAL);
> +	}
> +}
> +
>  static int tvp5150_fill_fmt(struct v4l2_subdev *sd,
>  			    struct v4l2_subdev_pad_config *cfg,
>  			    struct v4l2_subdev_format *format)
> @@ -1019,36 +1037,68 @@ static int tvp5150_fill_fmt(struct v4l2_subdev *sd,
>  	return 0;
>  }
>  
> +unsigned int tvp5150_get_hmax(struct v4l2_subdev *sd)
> +{
> +	struct tvp5150 *decoder = to_tvp5150(sd);
> +	v4l2_std_id std;
> +
> +	/* Calculate height based on current standard */
> +	if (decoder->norm == V4L2_STD_ALL)
> +		std = tvp5150_read_std(sd);
> +	else
> +		std = decoder->norm;
> +
> +	return (std & V4L2_STD_525_60) ?
> +		TVP5150_V_MAX_525_60 : TVP5150_V_MAX_OTHERS;
> +}
> +
> +static inline void
> +__tvp5150_set_selection(struct v4l2_subdev *sd, struct v4l2_rect rect)
> +{
> +	struct tvp5150 *decoder = to_tvp5150(sd);
> +	unsigned int hmax = tvp5150_get_hmax(sd);
> +
> +	regmap_write(decoder->regmap, TVP5150_VERT_BLANKING_START, rect.top);
> +	regmap_write(decoder->regmap, TVP5150_VERT_BLANKING_STOP,
> +		     rect.top + rect.height - hmax);
> +	regmap_write(decoder->regmap, TVP5150_ACT_VD_CROP_ST_MSB,
> +		     rect.left >> TVP5150_CROP_SHIFT);
> +	regmap_write(decoder->regmap, TVP5150_ACT_VD_CROP_ST_LSB,
> +		     rect.left | (1 << TVP5150_CROP_SHIFT));
> +	regmap_write(decoder->regmap, TVP5150_ACT_VD_CROP_STP_MSB,
> +		     (rect.left + rect.width - TVP5150_MAX_CROP_LEFT) >>
> +		     TVP5150_CROP_SHIFT);
> +	regmap_write(decoder->regmap, TVP5150_ACT_VD_CROP_STP_LSB,
> +		     rect.left + rect.width - TVP5150_MAX_CROP_LEFT);
> +}
> +
>  static int tvp5150_set_selection(struct v4l2_subdev *sd,
>  				 struct v4l2_subdev_pad_config *cfg,
>  				 struct v4l2_subdev_selection *sel)
>  {
>  	struct tvp5150 *decoder = to_tvp5150(sd);
>  	struct v4l2_rect rect = sel->r;
> -	v4l2_std_id std;
> -	int hmax;
> +	struct v4l2_rect *crop;
> +	unsigned int hmax;
>  
> -	if (sel->which != V4L2_SUBDEV_FORMAT_ACTIVE ||
> -	    sel->target != V4L2_SEL_TGT_CROP)
> +	if (sel->target != V4L2_SEL_TGT_CROP)
>  		return -EINVAL;
>  
>  	dev_dbg_lvl(sd->dev, 1, debug, "%s left=%d, top=%d, width=%d, height=%d\n",
>  		__func__, rect.left, rect.top, rect.width, rect.height);
>  
> +	/*
> +	 * Do not apply the request in case of FORMAT_TRY and disabled
> +	 * CONFIG_VIDEO_V4L2_SUBDEV_API support.
> +	 */
> +	crop = __tvp5150_get_pad_crop(decoder, cfg, sel->pad, sel->which);
> +	if (IS_ERR(crop))
> +		return 0;

This isn't right.

If VIDEO_V4L2_SUBDEV_API isn't set, then set_selection with FORMAT_TRY
should succeed: it should just verify (and optionally adjust) the selection
against the current active format and return that.

I think the easiest would be to do this:

#ifdef VIDEO_V4L2_SUBDEV_API
	crop = __tvp5150_get_pad_crop(decoder, cfg, sel->pad, sel->which);
#else
	crop = __tvp5150_get_pad_crop(decoder, cfg, sel->pad, V4L2_SUBDEV_FORMAT_ACTIVE);
#endif

> +
>  	/* tvp5150 has some special limits */
>  	rect.left = clamp(rect.left, 0, TVP5150_MAX_CROP_LEFT);
>  	rect.top = clamp(rect.top, 0, TVP5150_MAX_CROP_TOP);
> -
> -	/* Calculate height based on current standard */
> -	if (decoder->norm == V4L2_STD_ALL)
> -		std = tvp5150_read_std(sd);
> -	else
> -		std = decoder->norm;
> -
> -	if (std & V4L2_STD_525_60)
> -		hmax = TVP5150_V_MAX_525_60;
> -	else
> -		hmax = TVP5150_V_MAX_OTHERS;
> +	hmax = tvp5150_get_hmax(sd);
>  
>  	/*
>  	 * alignments:
> @@ -1061,20 +1111,15 @@ static int tvp5150_set_selection(struct v4l2_subdev *sd,
>  			      hmax - TVP5150_MAX_CROP_TOP - rect.top,
>  			      hmax - rect.top, 0, 0);
>  
> -	regmap_write(decoder->regmap, TVP5150_VERT_BLANKING_START, rect.top);
> -	regmap_write(decoder->regmap, TVP5150_VERT_BLANKING_STOP,
> -		     rect.top + rect.height - hmax);
> -	regmap_write(decoder->regmap, TVP5150_ACT_VD_CROP_ST_MSB,
> -		     rect.left >> TVP5150_CROP_SHIFT);
> -	regmap_write(decoder->regmap, TVP5150_ACT_VD_CROP_ST_LSB,
> -		     rect.left | (1 << TVP5150_CROP_SHIFT));
> -	regmap_write(decoder->regmap, TVP5150_ACT_VD_CROP_STP_MSB,
> -		     (rect.left + rect.width - TVP5150_MAX_CROP_LEFT) >>
> -		     TVP5150_CROP_SHIFT);
> -	regmap_write(decoder->regmap, TVP5150_ACT_VD_CROP_STP_LSB,
> -		     rect.left + rect.width - TVP5150_MAX_CROP_LEFT);
> +	/*
> +	 * Update output image size if the selection (crop) rectangle size or
> +	 * position has been modified.
> +	 */
> +	if (sel->which == V4L2_SUBDEV_FORMAT_ACTIVE &&
> +	    !v4l2_rect_equal(&rect, crop))
> +		__tvp5150_set_selection(sd, rect);
>  
> -	decoder->rect = rect;
> +	*crop = rect;
>  
>  	return 0;
>  }
> @@ -1084,11 +1129,9 @@ static int tvp5150_get_selection(struct v4l2_subdev *sd,
>  				 struct v4l2_subdev_selection *sel)
>  {
>  	struct tvp5150 *decoder = container_of(sd, struct tvp5150, sd);
> +	struct v4l2_rect *crop;
>  	v4l2_std_id std;
>  
> -	if (sel->which != V4L2_SUBDEV_FORMAT_ACTIVE)
> -		return -EINVAL;
> -
>  	switch (sel->target) {
>  	case V4L2_SEL_TGT_CROP_BOUNDS:
>  		sel->r.left = 0;
> @@ -1106,7 +1149,11 @@ static int tvp5150_get_selection(struct v4l2_subdev *sd,
>  			sel->r.height = TVP5150_V_MAX_OTHERS;
>  		return 0;
>  	case V4L2_SEL_TGT_CROP:
> -		sel->r = decoder->rect;
> +		crop = __tvp5150_get_pad_crop(decoder, cfg, sel->pad,
> +						sel->which);
> +		if (IS_ERR(crop))
> +			return PTR_ERR(crop);
> +		sel->r = *crop;
>  		return 0;
>  	default:
>  		return -EINVAL;
> 

Regards,

	Hans
