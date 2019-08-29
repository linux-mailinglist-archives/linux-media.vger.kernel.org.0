Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BE343A1BA2
	for <lists+linux-media@lfdr.de>; Thu, 29 Aug 2019 15:39:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727867AbfH2Njt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Aug 2019 09:39:49 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:59995 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727830AbfH2Njt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Aug 2019 09:39:49 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud8.xs4all.net with ESMTPA
        id 3KeNiS60ZDqPe3KeRiOGsF; Thu, 29 Aug 2019 15:39:47 +0200
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
 <0df4ef45-ba3f-98b9-878e-8cdd2bf307f6@xs4all.nl>
 <20190829131842.rptvouuir3ubqf4a@uno.localdomain>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <f282b92b-515d-09fd-20d1-cfec53c84332@xs4all.nl>
Date:   Thu, 29 Aug 2019 15:39:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190829131842.rptvouuir3ubqf4a@uno.localdomain>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfGoMxmH/H9f/IUhQk2j1e/hSex7h1Be4EGAOmaHXikli8Q+yzHpWNU/oqg2M5Nvpc1k16dY1ZHADDSW+KqVw465hM9i5nkOJOUsgbre5uSI/3/xiyL14
 AbHq+kyyJ/9DwxDu64lfb8a/ejoBOhILGg0+MrhAt3aeuhqkbYyv2oPzMU0rfGhKD+MKKRyWmmjO2LQOsq0RF9zZwXIk2/5TgJ1IvmoegQ7qrW4ai3K7U/ZG
 FwQBVo/SC2AXtrUoFqdsF1DBIeRb0goj6fCtm9GPKe+69tablGWp3BcvbrOpiF6ltG1w30OgObxyzYrzRCjJrtL5/wu7kdAFBXsqdTJXDhTZnI6UYjnOAq5T
 Bm38rou+
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 8/29/19 3:18 PM, Jacopo Mondi wrote:
> Hi Hans
> 
> On Thu, Aug 29, 2019 at 02:55:30PM +0200, Hans Verkuil wrote:
>> On 8/29/19 2:40 PM, Jacopo Mondi wrote:
>>> HI Hans,
>>>
>>> On Thu, Aug 29, 2019 at 12:20:18PM +0200, Hans Verkuil wrote:
>>>> On 8/27/19 11:23 AM, Jacopo Mondi wrote:
>>>>> Report the native pixel array size and the crop bounds for the ov5670
>>>>> sensor driver.
>>>>>
>>>>> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
>>>>> ---
>>>>>  drivers/media/i2c/ov5670.c | 20 ++++++++++++++++++++
>>>>>  1 file changed, 20 insertions(+)
>>>>>
>>>>> diff --git a/drivers/media/i2c/ov5670.c b/drivers/media/i2c/ov5670.c
>>>>> index 2bc57e85f721..3e22fe9ccad1 100644
>>>>> --- a/drivers/media/i2c/ov5670.c
>>>>> +++ b/drivers/media/i2c/ov5670.c
>>>>> @@ -2258,6 +2258,25 @@ static int ov5670_set_pad_format(struct v4l2_subdev *sd,
>>>>>  	return 0;
>>>>>  }
>>>>>
>>>>> +static int ov5670_get_selection(struct v4l2_subdev *sd,
>>>>> +				struct v4l2_subdev_pad_config *cfg,
>>>>> +				struct v4l2_subdev_selection *sel)
>>>>> +{
>>>>> +	switch (sel->target) {
>>>>> +	case V4L2_SEL_TGT_CROP_BOUNDS:
>>>>> +	case V4L2_SEL_TGT_NATIVE_SIZE:
>>>>> +		sel->r.left = 0;
>>>>> +		sel->r.top = 0;
>>>>> +		sel->r.width = 2592;
>>>>> +		sel->r.height = 1944;
>>>>
>>>> Why do you need this?
>>>>
>>>
>>> I need to expose the pixel array size and the active pixel area size,
>>> and I interpreted the two above targets as the right place where to do
>>> so.
>>
>> That didn't answer my question :-)
>>
>> Why do you need to expose this? Who uses it for what purpose?
>>
> 
> Ah, ok :)
> 
> Quoting the cover letter of the series:
> 
> Retrieving the following camera static information is a requirement for the
> implementation of the Android-compatiblity layer of libcamera, but I'm sure
> it might prove useful for other user-space applications and libraries as well.
> 
> In other words, in order to report to the android camera stack those
> two information (among -many- others) they should be somehow retrieved
> from the kernel interface, and after considering adding two more
> read-only controls to expose them as I did for rotation and location,
> I went for using the selection API.
> 
>>>
>>> At least for NATIVE_SIZE the documentation seems to match my
>>> understanding:
>>>
>>> "The native size of the device, e.g. a sensor’s pixel array. left and top
>>> fields are zero for this target."
>>
>> Correct.
>>
>>>
>>>
>>>> Since the format can change for this and the next driver I think CROP_BOUNDS
>>>> at least should match the current format.
>>>>
>>>
>>> Ah, does it? It was not clear to me from the documentation, as it
>>> suggested to me that target actually identifies the active pixel area
>>>
>>> "Bounds of the crop rectangle. All valid crop rectangles fit inside the
>>> crop bounds rectangle."
>>>
>>> It does not mention format, should this be updated?
>>
>> The problem is that for sensors it is indeed not clear.
>>
>> In principle the crop bounds matches the resolution that the sensor uses
>> pre-scaling. So yes, that means that it is equal to the native size.
> 
> native size != active areas size.
> Did you mean the latter here?

I mean the latter, but I have to say that the spec doesn't make it clear
if TGT_NATIVE_SIZE equals the active area or also includes inactive pixels.

What exactly does Android expect?

> 
>>
>> But many sensors have a discrete list of supported formats and it is not
>> clear how they map each format to the actual sensor. If it is clearly just
>> done through binning or averaging, then all is fine.
>>
>> If the formats have different aspect ratios, then it becomes a bit more
>> difficult how to relate the crop bounds with the format since you may not
>> know to which sensor area the current format corresponds.
> 
> I see. We've had the same discussion in the libcamera list, as indeed
> the crop bounds might depend on the aspect ratio as you said.
> 
> Maybe the crop_bound target is not the right place to report the
> active area, or maybe the concept of active area is ill-defined if
> the sensor is cross-shaped:
> 
>     /--------------------/ -> Pixel array size
>     ----------------------
>     |x    |        |--- x|------> 4:3 crop bounds
>     |x------------------x|
>     |x|   |        |   |x|
>     |x|   |        |   |x|------> 21:9 crop bounds
>     |x|   |        |   |x|
>     |x------------------x|
>     |x    |________|    x|
>     ----------------------
>       |                 |
>       ---------------------------> Black pixels colums
> 
>>
>> I have no clear answer for you, to be honest, but it can get tricky.
>>
> 
> Indeed, but assuming a simpler square-shaped sensor, is the crop bound
> target the right one to report the active pixel area ?

I don't think so.

The crop bounds defines the outer bounds of the area where you can put
your crop rectangle. This can very well include areas where the pixels
are covered and so always return black (sometimes used to obtain black
levels, I believe).

The default crop rectangle would be the one that reports the active
area. The native size rectangle would be the full pixel array.

So CROP_DEFAULT <= CROP_BOUNDS <= NATIVE_SIZE.

For a cross-shaped sensor I would expect that the CROP_BOUNDS/DEFAULT
depends on the format (aspect ratio).

I think this makes sense.

The specification definitely needs to be improved, patches are welcome...

> 
>>>
>>> How would you report the two information I need?
>>
>> It depends on my original question: what do you need this information for?
>>
> 
> Please note that it's for the android camera stack in this case, but
> it's an information that userspace might want to know for several
> different reasons. Calibration and FOV calculation come to mind. Does
> this makes sense to you?

Ah, so that's what it is used for :-)

Which of the three targets above would match with what Android needs?

Regards,

	Hans

> 
> Thanks
>    j
> 
>> Regards,
>>
>> 	Hans
>>
>>>
>>>> I don't think this patch and the next have anything to do with the location/rotate
>>>> support. I would split it off from this series.
>>>>
>>>
>>> Agreed, they were split in v1, maybe it has not been a wise move to
>>> make a single series out of them. I'll split again.
>>>
>>> Thanks
>>>    j
>>>
>>>> Regards,
>>>>
>>>> 	Hans
>>>>
>>>>> +		break;
>>>>> +	default:
>>>>> +		return -EINVAL;
>>>>> +	}
>>>>> +
>>>>> +	return 0;
>>>>> +}
>>>>> +
>>>>>  static int ov5670_get_skip_frames(struct v4l2_subdev *sd, u32 *frames)
>>>>>  {
>>>>>  	*frames = OV5670_NUM_OF_SKIP_FRAMES;
>>>>> @@ -2425,6 +2444,7 @@ static const struct v4l2_subdev_pad_ops ov5670_pad_ops = {
>>>>>  	.enum_mbus_code = ov5670_enum_mbus_code,
>>>>>  	.get_fmt = ov5670_get_pad_format,
>>>>>  	.set_fmt = ov5670_set_pad_format,
>>>>> +	.get_selection = ov5670_get_selection,
>>>>>  	.enum_frame_size = ov5670_enum_frame_size,
>>>>>  };
>>>>>
>>>>>
>>>>
>>

