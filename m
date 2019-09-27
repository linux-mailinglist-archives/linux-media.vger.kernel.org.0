Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4AF47C04EE
	for <lists+linux-media@lfdr.de>; Fri, 27 Sep 2019 14:14:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726163AbfI0MOs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Sep 2019 08:14:48 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:45529 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725992AbfI0MOs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Sep 2019 08:14:48 -0400
Received: from [IPv6:2001:420:44c1:2577:2521:77be:ff76:8085] ([IPv6:2001:420:44c1:2577:2521:77be:ff76:8085])
        by smtp-cloud7.xs4all.net with ESMTPA
        id Dp8ziLh7W9D4hDp93iC0PW; Fri, 27 Sep 2019 14:14:45 +0200
Subject: Re: [PATCH v10 07/14] media: tvp5150: fix set_selection rectangle
 handling
To:     Marco Felsch <m.felsch@pengutronix.de>, mchehab@kernel.org,
        sakari.ailus@linux.intel.com, hans.verkuil@cisco.com,
        jacopo+renesas@jmondi.org, robh+dt@kernel.org,
        laurent.pinchart@ideasonboard.com
Cc:     devicetree@vger.kernel.org, kernel@pengutronix.de,
        linux-media@vger.kernel.org
References: <20190830101646.6530-1-m.felsch@pengutronix.de>
 <20190830101646.6530-8-m.felsch@pengutronix.de>
 <20190927121334.xjt4pneuohppy44n@pengutronix.de>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <d613ad34-d6fa-44a2-3705-2f72c4ee4330@xs4all.nl>
Date:   Fri, 27 Sep 2019 14:14:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190927121334.xjt4pneuohppy44n@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfB5GfU5afttLAtcKnXz+zIDnAGqcX5oBAlr2K48SWGaGMxUErHNf3BQMRA7U4A+Md02rcH0BQAFxy2faoXYKxxoRjDqvA8kdnTk96SRl4Om6hdZl0VnO
 AsvFOUIenBHGH6GPA0ti4X450hpbNyMZySR5KnAq0ePlOgX+8uB17LPYtyVZ0ZxJFnYqUz7mMsF7UJtkxmLatUO1egsPWvJufxC4km5UhGKMRySLHEIlMpwk
 fIXJIU9xRpVhVG8hBIPmAGvlwIkSUVFeBt34pCo9nsH+2tYK+KxSG/4jXxb/8yXooxysEcgO9W8RFcSwY44ooepM9y/er+hzUwqkgJmD78SfNEApj/oZgl7d
 ePkN68JpeMw+Z9TNM9W1fWVwKDl660Pie55ecB4uSBjyfVWZtIMLbrl5Nj54eVyNxFldIbKXN1HuRCey2RMA1A8PVMrqBb1y/H7UodqCZeFdWq/0u82xcpUo
 w9aAP6G4iteEyafzhRhIQ63EqWvFo1361QyaRxLUton08awSazGlKMsWTC1/1lcDcJpKCg+UwmJtKOOUrRAd60RgnIAMuz5mh4XzXID01ydMym2iKTMXzWrF
 R1CH5dYNVKDo/NMJWepMIV+fKuo4NgWI7eBbs46bWm/lrA==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 9/27/19 2:13 PM, Marco Felsch wrote:
> Hi Hans,
> 
> since you review contained many checkpatch issues I wanna ask if it okay
> to keep this line as it before I will send a v11. Please check my inline
> comment.
> 
> On 19-08-30 12:16, Marco Felsch wrote:
>> Currently a local copy of sel->r is made and adapted to the hardware
>> constraints. After the adaption the value is applied to the hardware but
>> the driver forgot to reflect the adapted value to the user space.
>>
>> Drop the local copy and work directly on the requested rectangle
>> instead to fix this.
>>
>> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
>> ---
>>
>> v10:
>> - new patch
>>
>>  drivers/media/i2c/tvp5150.c | 32 ++++++++++++++++----------------
>>  1 file changed, 16 insertions(+), 16 deletions(-)
>>
>> diff --git a/drivers/media/i2c/tvp5150.c b/drivers/media/i2c/tvp5150.c
>> index 477a929d4f89..c1542a89e8c8 100644
>> --- a/drivers/media/i2c/tvp5150.c
>> +++ b/drivers/media/i2c/tvp5150.c
>> @@ -1024,7 +1024,7 @@ static int tvp5150_set_selection(struct v4l2_subdev *sd,
>>  				 struct v4l2_subdev_selection *sel)
>>  {
>>  	struct tvp5150 *decoder = to_tvp5150(sd);
>> -	struct v4l2_rect rect = sel->r;
>> +	struct v4l2_rect *rect = &sel->r;
>>  	v4l2_std_id std;
>>  	int hmax;
>>  
>> @@ -1033,11 +1033,11 @@ static int tvp5150_set_selection(struct v4l2_subdev *sd,
>>  		return -EINVAL;
>>  
>>  	dev_dbg_lvl(sd->dev, 1, debug, "%s left=%d, top=%d, width=%d, height=%d\n",
>> -		__func__, rect.left, rect.top, rect.width, rect.height);
>> +		__func__, rect->left, rect->top, rect->width, rect->height);
>>  
>>  	/* tvp5150 has some special limits */
>> -	rect.left = clamp(rect.left, 0, TVP5150_MAX_CROP_LEFT);
>> -	rect.top = clamp(rect.top, 0, TVP5150_MAX_CROP_TOP);
>> +	rect->left = clamp(rect->left, 0, TVP5150_MAX_CROP_LEFT);
>> +	rect->top = clamp(rect->top, 0, TVP5150_MAX_CROP_TOP);
>>  
>>  	/* Calculate height based on current standard */
>>  	if (decoder->norm == V4L2_STD_ALL)
>> @@ -1055,26 +1055,26 @@ static int tvp5150_set_selection(struct v4l2_subdev *sd,
>>  	 *  - width = 2 due to UYVY colorspace
>>  	 *  - height, image = no special alignment
>>  	 */
>> -	v4l_bound_align_image(&rect.width,
>> -			      TVP5150_H_MAX - TVP5150_MAX_CROP_LEFT - rect.left,
>> -			      TVP5150_H_MAX - rect.left, 1, &rect.height,
>> -			      hmax - TVP5150_MAX_CROP_TOP - rect.top,
>> -			      hmax - rect.top, 0, 0);
>> +	v4l_bound_align_image(&rect->width,
>> +			      TVP5150_H_MAX - TVP5150_MAX_CROP_LEFT - rect->left,
> 
> Now checkpatch complains about this line because it is 81 characters
> long. Is it okay to keep this as single line for readability?

Yes, in this case splitting it up just makes it harder to read, so keep it as-is.

Regards,

	Hans

> 
> Regards,
>   Marco
> 
> 
>> +			      TVP5150_H_MAX - rect->left, 1, &rect->height,
>> +			      hmax - TVP5150_MAX_CROP_TOP - rect->top,
>> +			      hmax - rect->top, 0, 0);
>>  
>> -	regmap_write(decoder->regmap, TVP5150_VERT_BLANKING_START, rect.top);
>> +	regmap_write(decoder->regmap, TVP5150_VERT_BLANKING_START, rect->top);
>>  	regmap_write(decoder->regmap, TVP5150_VERT_BLANKING_STOP,
>> -		     rect.top + rect.height - hmax);
>> +		     rect->top + rect->height - hmax);
>>  	regmap_write(decoder->regmap, TVP5150_ACT_VD_CROP_ST_MSB,
>> -		     rect.left >> TVP5150_CROP_SHIFT);
>> +		     rect->left >> TVP5150_CROP_SHIFT);
>>  	regmap_write(decoder->regmap, TVP5150_ACT_VD_CROP_ST_LSB,
>> -		     rect.left | (1 << TVP5150_CROP_SHIFT));
>> +		     rect->left | (1 << TVP5150_CROP_SHIFT));
>>  	regmap_write(decoder->regmap, TVP5150_ACT_VD_CROP_STP_MSB,
>> -		     (rect.left + rect.width - TVP5150_MAX_CROP_LEFT) >>
>> +		     (rect->left + rect->width - TVP5150_MAX_CROP_LEFT) >>
>>  		     TVP5150_CROP_SHIFT);
>>  	regmap_write(decoder->regmap, TVP5150_ACT_VD_CROP_STP_LSB,
>> -		     rect.left + rect.width - TVP5150_MAX_CROP_LEFT);
>> +		     rect->left + rect->width - TVP5150_MAX_CROP_LEFT);
>>  
>> -	decoder->rect = rect;
>> +	decoder->rect = *rect;
>>  
>>  	return 0;
>>  }
>> -- 
>> 2.20.1
>>
>>
> 

