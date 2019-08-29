Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0291AA1A8D
	for <lists+linux-media@lfdr.de>; Thu, 29 Aug 2019 14:55:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727040AbfH2Mzf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Aug 2019 08:55:35 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:34611 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726739AbfH2Mzf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Aug 2019 08:55:35 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud8.xs4all.net with ESMTPA
        id 3JxaiRoQfDqPe3JxdiO66E; Thu, 29 Aug 2019 14:55:33 +0200
Subject: Re: [PATCH v2 09/10] media: i2c: ov5670: Report native size and crop
 bounds
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tfiga@google.com,
        "open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" 
        <linux-media@vger.kernel.org>
References: <20190827092339.8858-1-jacopo@jmondi.org>
 <20190827092339.8858-12-jacopo@jmondi.org>
 <db08aa45-922e-e477-9836-cbbc3f17ad8e@xs4all.nl>
 <20190829124055.zxiu7x6abxfhkzch@uno.localdomain>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <0df4ef45-ba3f-98b9-878e-8cdd2bf307f6@xs4all.nl>
Date:   Thu, 29 Aug 2019 14:55:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190829124055.zxiu7x6abxfhkzch@uno.localdomain>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfIX9PfHm1fcZkjHZcA4SWVX6Jew9xTj4lYrUBR4MXUDY/JB7nocqKN3Yh35QKldutKyF1fW6ezxpuFpEV925hG8CUmK1VjMgxsAPszIvh20fMt50QXa9
 2OJFHBOljcvwTsAS1LMAEgIVb5Svi5OLSRoPPOTzaRsjDL3iKB3IzS95ODORIrtJyt3wpoP2fL/irM+TJ+Hr2l5OCO7Ihud3pqtX9qIiJb/GAQC47KlvS6YU
 MrxcXWqAGFwL0ONdpbW07RlAvWs3pPcb1+Y+UQzO/LTmiZ3lLzkr+0rdFF1NgLR/1BCs8fz7+Aqdy/S//QTqd8h/IEibvF8MP10MHej1AetnV2lkadFSp672
 m0d7WR0B
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 8/29/19 2:40 PM, Jacopo Mondi wrote:
> HI Hans,
> 
> On Thu, Aug 29, 2019 at 12:20:18PM +0200, Hans Verkuil wrote:
>> On 8/27/19 11:23 AM, Jacopo Mondi wrote:
>>> Report the native pixel array size and the crop bounds for the ov5670
>>> sensor driver.
>>>
>>> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
>>> ---
>>>  drivers/media/i2c/ov5670.c | 20 ++++++++++++++++++++
>>>  1 file changed, 20 insertions(+)
>>>
>>> diff --git a/drivers/media/i2c/ov5670.c b/drivers/media/i2c/ov5670.c
>>> index 2bc57e85f721..3e22fe9ccad1 100644
>>> --- a/drivers/media/i2c/ov5670.c
>>> +++ b/drivers/media/i2c/ov5670.c
>>> @@ -2258,6 +2258,25 @@ static int ov5670_set_pad_format(struct v4l2_subdev *sd,
>>>  	return 0;
>>>  }
>>>
>>> +static int ov5670_get_selection(struct v4l2_subdev *sd,
>>> +				struct v4l2_subdev_pad_config *cfg,
>>> +				struct v4l2_subdev_selection *sel)
>>> +{
>>> +	switch (sel->target) {
>>> +	case V4L2_SEL_TGT_CROP_BOUNDS:
>>> +	case V4L2_SEL_TGT_NATIVE_SIZE:
>>> +		sel->r.left = 0;
>>> +		sel->r.top = 0;
>>> +		sel->r.width = 2592;
>>> +		sel->r.height = 1944;
>>
>> Why do you need this?
>>
> 
> I need to expose the pixel array size and the active pixel area size,
> and I interpreted the two above targets as the right place where to do
> so.

That didn't answer my question :-)

Why do you need to expose this? Who uses it for what purpose?

> 
> At least for NATIVE_SIZE the documentation seems to match my
> understanding:
> 
> "The native size of the device, e.g. a sensor’s pixel array. left and top
> fields are zero for this target."

Correct.

> 
> 
>> Since the format can change for this and the next driver I think CROP_BOUNDS
>> at least should match the current format.
>>
> 
> Ah, does it? It was not clear to me from the documentation, as it
> suggested to me that target actually identifies the active pixel area
> 
> "Bounds of the crop rectangle. All valid crop rectangles fit inside the
> crop bounds rectangle."
> 
> It does not mention format, should this be updated?

The problem is that for sensors it is indeed not clear.

In principle the crop bounds matches the resolution that the sensor uses
pre-scaling. So yes, that means that it is equal to the native size.

But many sensors have a discrete list of supported formats and it is not
clear how they map each format to the actual sensor. If it is clearly just
done through binning or averaging, then all is fine.

If the formats have different aspect ratios, then it becomes a bit more
difficult how to relate the crop bounds with the format since you may not
know to which sensor area the current format corresponds.

I have no clear answer for you, to be honest, but it can get tricky.

> 
> How would you report the two information I need?

It depends on my original question: what do you need this information for?

Regards,

	Hans

> 
>> I don't think this patch and the next have anything to do with the location/rotate
>> support. I would split it off from this series.
>>
> 
> Agreed, they were split in v1, maybe it has not been a wise move to
> make a single series out of them. I'll split again.
> 
> Thanks
>    j
> 
>> Regards,
>>
>> 	Hans
>>
>>> +		break;
>>> +	default:
>>> +		return -EINVAL;
>>> +	}
>>> +
>>> +	return 0;
>>> +}
>>> +
>>>  static int ov5670_get_skip_frames(struct v4l2_subdev *sd, u32 *frames)
>>>  {
>>>  	*frames = OV5670_NUM_OF_SKIP_FRAMES;
>>> @@ -2425,6 +2444,7 @@ static const struct v4l2_subdev_pad_ops ov5670_pad_ops = {
>>>  	.enum_mbus_code = ov5670_enum_mbus_code,
>>>  	.get_fmt = ov5670_get_pad_format,
>>>  	.set_fmt = ov5670_set_pad_format,
>>> +	.get_selection = ov5670_get_selection,
>>>  	.enum_frame_size = ov5670_enum_frame_size,
>>>  };
>>>
>>>
>>

