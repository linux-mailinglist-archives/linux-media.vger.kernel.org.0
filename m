Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 77B87C03D3
	for <lists+linux-media@lfdr.de>; Fri, 27 Sep 2019 13:06:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726540AbfI0LGF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Sep 2019 07:06:05 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:54171 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725882AbfI0LGF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Sep 2019 07:06:05 -0400
Received: from [IPv6:2001:420:44c1:2577:2521:77be:ff76:8085] ([IPv6:2001:420:44c1:2577:2521:77be:ff76:8085])
        by smtp-cloud7.xs4all.net with ESMTPA
        id Do4ViLJFM9D4hDo4YiBjD5; Fri, 27 Sep 2019 13:06:02 +0200
Subject: Re: [PATCH v10 08/14] media: tvp5150: add FORMAT_TRY support for
 get/set selection handlers
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     mchehab@kernel.org, sakari.ailus@linux.intel.com,
        hans.verkuil@cisco.com, jacopo+renesas@jmondi.org,
        robh+dt@kernel.org, laurent.pinchart@ideasonboard.com,
        devicetree@vger.kernel.org, kernel@pengutronix.de,
        linux-media@vger.kernel.org
References: <20190830101646.6530-1-m.felsch@pengutronix.de>
 <20190830101646.6530-9-m.felsch@pengutronix.de>
 <05b9b16f-dcd6-b76b-7e37-c246f4465515@xs4all.nl>
 <20190927105737.gpl3xpnoatmjw7do@pengutronix.de>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <6d2584b1-db89-c8f5-3834-fdd6933336f6@xs4all.nl>
Date:   Fri, 27 Sep 2019 13:05:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190927105737.gpl3xpnoatmjw7do@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfO2WcQc3u2Gxyq27unVoLKvQgIldfQAAky2/r5wEFWUBq45Fhls3DvRGQrjOQfGekeIUsp9k7hYTr+1/33xWaeU3ldQqCijSz/3/ulwo1fBgRUw55am2
 Md04ufAoMfVrNRX3gvwdGPXLc/LBrg8eGrmtqRCJGtnsg7LpH6czQUYSH6ruYsSZ9zVrJl5j9tGir3PeIJsWKKtKai62p5T3oiCESvBk46eGAEa37D7OSo0E
 TCV9U6+z92pXTmwjSDzR9ZaXazs3Arc3186KVlGfFuclvpkcmxBCkaQrhE9Xq9C8XWMz7wZvXWYrQfhTfjPwW8hV9rg2gHH4LwpsRgDSXe3QIR1koirxPzky
 GFTEun6ojJE07m8p6RjedxLfuhU6niippMdi9DRaHUBSK+80bBNh0UghUR9uPg8oHPniJARI/yoUkPL3WfbOOaUUi0E3qkcpE8gedlQwQ/ELEKl1VEucrvB7
 GNx+dTOgEwnIvRj12OLxI4WgWZJkei9MKLf8DnSQsH3MKj1s1b/6ilygJpxcidaaOzdQIVLrC4QRYnEMoYHMQIrqAjRyB5uMoVhOlRo3YiiCTgGar8z0+Gus
 8wXe49dal8wV4fAisDBJA8+dz3Z6MUjgxxMqYAZ5VdYf1Q==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 9/27/19 12:57 PM, Marco Felsch wrote:
> Hi Hans,
> 
> On 19-09-27 11:01, Hans Verkuil wrote:
>> On 8/30/19 12:16 PM, Marco Felsch wrote:
>>> Since commit 10d5509c8d50 ("[media] v4l2: remove g/s_crop from video ops")
>>> the 'which' field for set/get_selection must be FORMAT_ACTIVE. There is
>>> no way to try different selections. The patch adds a helper function to
>>> select the correct selection memory space (sub-device file handle or
>>> driver state) which will be set/returned.
>>>
>>> The selection rectangle is updated if the format is FORMAT_ACTIVE and
>>> the rectangle position and/or size differs from the current set
>>> rectangle.
>>>
>>> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
>>
>> One checkpatch warning:
>>
>> CHECK: Alignment should match open parenthesis
>> #170: FILE: drivers/media/i2c/tvp5150.c:1155:
>> +               crop = __tvp5150_get_pad_crop(decoder, cfg, sel->pad,
>> +                                               sel->which);
>>
>> I'd have fixed this myself, but since there are some changes needed
>> elsewhere, you can pick this up as well for a v11.
>>
>> And some more comments below:
>>
>>> ---
>>> Changelog:
>>>
>>> v10:
>>> - __tvp5150_get_pad_crop: drop confusing fall-through
>>> - set_selection: fix FORMAT_TRY handling if CONFIG_VIDEO_V4L2_SUBDEV_API
>>>                  is disabled. Adapt sel->r and return 0.
>>> v8:
>>> - adapt commit message
>>> - remove wrong FORMAT_TRY handling for tvp5150_fill_fmt() handling
>>> - return 0 during set_selection if FORMAT_TRY was requested and
>>>   CONFIG_VIDEO_V4L2_SUBDEV_API is disabled
>>> - return -EINVAL during get_selection if FORMAT_TRY was requested and
>>>   CONFIG_VIDEO_V4L2_SUBDEV_API is disabled
>>> v7:
>>> - __tvp5150_get_pad_crop(): return error on default case
>>> - simplify __tvp5150_get_pad_crop() error handling
>>> - tvp5150_set_selection() squash __tvp5150_set_selection() execution
>>>   conditions
>>> v6:
>>> nothing
>>> v5:
>>>  - handle stub for v4l2_subdev_get_try_crop() internal since commit
>>>    ("media: v4l2-subdev: add stubs for v4l2_subdev_get_try_*")
>>>    isn't anymore part of this series.
>>>  - add error handling of __tvp5150_get_pad_crop()
>>> v4:
>>>  - fix merge conflict due to rebase on top of media-tree/master
>>>  - __tvp5150_get_pad_crop(): cosmetic alignment fixes
>>>
>>>  drivers/media/i2c/tvp5150.c | 113 ++++++++++++++++++++++++++----------
>>>  1 file changed, 81 insertions(+), 32 deletions(-)
>>>
>>> diff --git a/drivers/media/i2c/tvp5150.c b/drivers/media/i2c/tvp5150.c
>>> index c1542a89e8c8..636e8737ac44 100644
>>> --- a/drivers/media/i2c/tvp5150.c
>>> +++ b/drivers/media/i2c/tvp5150.c
>>> @@ -19,6 +19,7 @@
>>>  #include <media/v4l2-ctrls.h>
>>>  #include <media/v4l2-fwnode.h>
>>>  #include <media/v4l2-mc.h>
>>> +#include <media/v4l2-rect.h>
>>>  
>>>  #include "tvp5150_reg.h"
>>>  
>>> @@ -995,6 +996,25 @@ static void tvp5150_set_default(v4l2_std_id std, struct v4l2_rect *crop)
>>>  		crop->height = TVP5150_V_MAX_OTHERS;
>>>  }
>>>  
>>> +static struct v4l2_rect *
>>> +__tvp5150_get_pad_crop(struct tvp5150 *decoder,
>>> +		       struct v4l2_subdev_pad_config *cfg, unsigned int pad,
>>> +		       enum v4l2_subdev_format_whence which)
>>
>> Please don't use __ in the function name. Double underscores should never be
>> used in C code since that's reserved for use by the compiler. What's wrong
>> with just plain tvp5150_get_pad_crop()?
> 
> I tought it is common at least within the v4l subsystem. There are a
> few other drivers following that __ pattern. Anyway I can rename it ;)

I think it is used too much in our code, generally for no good reason.

In this case there is no reason whatsoever that would warrant adding a __ prefix.

Regards,

	Hans

> 
>>> +{
>>> +	switch (which) {
>>> +	case V4L2_SUBDEV_FORMAT_ACTIVE:
>>> +		return &decoder->rect;
>>> +	case V4L2_SUBDEV_FORMAT_TRY:
>>> +#if defined(CONFIG_VIDEO_V4L2_SUBDEV_API)
>>> +		return v4l2_subdev_get_try_crop(&decoder->sd, cfg, pad);
>>> +#else
>>> +		return ERR_PTR(-EINVAL);
>>> +#endif
>>> +	default:
>>> +		return ERR_PTR(-EINVAL);
>>> +	}
>>> +}
>>> +
>>>  static int tvp5150_fill_fmt(struct v4l2_subdev *sd,
>>>  			    struct v4l2_subdev_pad_config *cfg,
>>>  			    struct v4l2_subdev_format *format)
>>> @@ -1019,17 +1039,51 @@ static int tvp5150_fill_fmt(struct v4l2_subdev *sd,
>>>  	return 0;
>>>  }
>>>  
>>> +unsigned int tvp5150_get_hmax(struct v4l2_subdev *sd)
>>> +{
>>> +	struct tvp5150 *decoder = to_tvp5150(sd);
>>> +	v4l2_std_id std;
>>> +
>>> +	/* Calculate height based on current standard */
>>> +	if (decoder->norm == V4L2_STD_ALL)
>>> +		std = tvp5150_read_std(sd);
>>> +	else
>>> +		std = decoder->norm;
>>> +
>>> +	return (std & V4L2_STD_525_60) ?
>>> +		TVP5150_V_MAX_525_60 : TVP5150_V_MAX_OTHERS;
>>> +}
>>> +
>>> +static inline void
>>> +__tvp5150_set_selection(struct v4l2_subdev *sd, struct v4l2_rect *rect)
>>
>> You can drop 'inline', there is no need for that.
>>
>> I'd also rename the function to something more understandable. E.g.
>> tvp5150_set_hw_selection().
> 
> Okay I will change that.
> 
> Regards,
>   Marco 
> 
>>
>>> +{
>>> +	struct tvp5150 *decoder = to_tvp5150(sd);
>>> +	unsigned int hmax = tvp5150_get_hmax(sd);
>>> +
>>> +	regmap_write(decoder->regmap, TVP5150_VERT_BLANKING_START, rect->top);
>>> +	regmap_write(decoder->regmap, TVP5150_VERT_BLANKING_STOP,
>>> +		     rect->top + rect->height - hmax);
>>> +	regmap_write(decoder->regmap, TVP5150_ACT_VD_CROP_ST_MSB,
>>> +		     rect->left >> TVP5150_CROP_SHIFT);
>>> +	regmap_write(decoder->regmap, TVP5150_ACT_VD_CROP_ST_LSB,
>>> +		     rect->left | (1 << TVP5150_CROP_SHIFT));
>>> +	regmap_write(decoder->regmap, TVP5150_ACT_VD_CROP_STP_MSB,
>>> +		     (rect->left + rect->width - TVP5150_MAX_CROP_LEFT) >>
>>> +		     TVP5150_CROP_SHIFT);
>>> +	regmap_write(decoder->regmap, TVP5150_ACT_VD_CROP_STP_LSB,
>>> +		     rect->left + rect->width - TVP5150_MAX_CROP_LEFT);
>>> +}
>>> +
>>>  static int tvp5150_set_selection(struct v4l2_subdev *sd,
>>>  				 struct v4l2_subdev_pad_config *cfg,
>>>  				 struct v4l2_subdev_selection *sel)
>>>  {
>>>  	struct tvp5150 *decoder = to_tvp5150(sd);
>>>  	struct v4l2_rect *rect = &sel->r;
>>> -	v4l2_std_id std;
>>> -	int hmax;
>>> +	struct v4l2_rect *crop;
>>> +	unsigned int hmax;
>>>  
>>> -	if (sel->which != V4L2_SUBDEV_FORMAT_ACTIVE ||
>>> -	    sel->target != V4L2_SEL_TGT_CROP)
>>> +	if (sel->target != V4L2_SEL_TGT_CROP)
>>>  		return -EINVAL;
>>>  
>>>  	dev_dbg_lvl(sd->dev, 1, debug, "%s left=%d, top=%d, width=%d, height=%d\n",
>>> @@ -1038,17 +1092,7 @@ static int tvp5150_set_selection(struct v4l2_subdev *sd,
>>>  	/* tvp5150 has some special limits */
>>>  	rect->left = clamp(rect->left, 0, TVP5150_MAX_CROP_LEFT);
>>>  	rect->top = clamp(rect->top, 0, TVP5150_MAX_CROP_TOP);
>>> -
>>> -	/* Calculate height based on current standard */
>>> -	if (decoder->norm == V4L2_STD_ALL)
>>> -		std = tvp5150_read_std(sd);
>>> -	else
>>> -		std = decoder->norm;
>>> -
>>> -	if (std & V4L2_STD_525_60)
>>> -		hmax = TVP5150_V_MAX_525_60;
>>> -	else
>>> -		hmax = TVP5150_V_MAX_OTHERS;
>>> +	hmax = tvp5150_get_hmax(sd);
>>>  
>>>  	/*
>>>  	 * alignments:
>>> @@ -1061,20 +1105,23 @@ static int tvp5150_set_selection(struct v4l2_subdev *sd,
>>>  			      hmax - TVP5150_MAX_CROP_TOP - rect->top,
>>>  			      hmax - rect->top, 0, 0);
>>>  
>>> -	regmap_write(decoder->regmap, TVP5150_VERT_BLANKING_START, rect->top);
>>> -	regmap_write(decoder->regmap, TVP5150_VERT_BLANKING_STOP,
>>> -		     rect->top + rect->height - hmax);
>>> -	regmap_write(decoder->regmap, TVP5150_ACT_VD_CROP_ST_MSB,
>>> -		     rect->left >> TVP5150_CROP_SHIFT);
>>> -	regmap_write(decoder->regmap, TVP5150_ACT_VD_CROP_ST_LSB,
>>> -		     rect->left | (1 << TVP5150_CROP_SHIFT));
>>> -	regmap_write(decoder->regmap, TVP5150_ACT_VD_CROP_STP_MSB,
>>> -		     (rect->left + rect->width - TVP5150_MAX_CROP_LEFT) >>
>>> -		     TVP5150_CROP_SHIFT);
>>> -	regmap_write(decoder->regmap, TVP5150_ACT_VD_CROP_STP_LSB,
>>> -		     rect->left + rect->width - TVP5150_MAX_CROP_LEFT);
>>> +	if (!IS_ENABLED(CONFIG_VIDEO_V4L2_SUBDEV_API) &&
>>> +	    sel->which == V4L2_SUBDEV_FORMAT_TRY)
>>> +		return 0;
>>> +
>>> +	crop = __tvp5150_get_pad_crop(decoder, cfg, sel->pad, sel->which);
>>> +	if (IS_ERR(crop))
>>> +		return PTR_ERR(crop);
>>> +
>>> +	/*
>>> +	 * Update output image size if the selection (crop) rectangle size or
>>> +	 * position has been modified.
>>> +	 */
>>> +	if (sel->which == V4L2_SUBDEV_FORMAT_ACTIVE &&
>>> +	    !v4l2_rect_equal(rect, crop))
>>> +		__tvp5150_set_selection(sd, rect);
>>>  
>>> -	decoder->rect = *rect;
>>> +	*crop = *rect;
>>>  
>>>  	return 0;
>>>  }
>>> @@ -1084,11 +1131,9 @@ static int tvp5150_get_selection(struct v4l2_subdev *sd,
>>>  				 struct v4l2_subdev_selection *sel)
>>>  {
>>>  	struct tvp5150 *decoder = container_of(sd, struct tvp5150, sd);
>>> +	struct v4l2_rect *crop;
>>>  	v4l2_std_id std;
>>>  
>>> -	if (sel->which != V4L2_SUBDEV_FORMAT_ACTIVE)
>>> -		return -EINVAL;
>>> -
>>>  	switch (sel->target) {
>>>  	case V4L2_SEL_TGT_CROP_BOUNDS:
>>>  		sel->r.left = 0;
>>> @@ -1106,7 +1151,11 @@ static int tvp5150_get_selection(struct v4l2_subdev *sd,
>>>  			sel->r.height = TVP5150_V_MAX_OTHERS;
>>>  		return 0;
>>>  	case V4L2_SEL_TGT_CROP:
>>> -		sel->r = decoder->rect;
>>> +		crop = __tvp5150_get_pad_crop(decoder, cfg, sel->pad,
>>> +						sel->which);
>>> +		if (IS_ERR(crop))
>>> +			return PTR_ERR(crop);
>>> +		sel->r = *crop;
>>>  		return 0;
>>>  	default:
>>>  		return -EINVAL;
>>>
>>
>> Regards,
>>
>> 	Hans
>>
> 

