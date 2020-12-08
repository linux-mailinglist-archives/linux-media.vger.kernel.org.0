Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9E182D2B55
	for <lists+linux-media@lfdr.de>; Tue,  8 Dec 2020 13:46:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729303AbgLHMpr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Dec 2020 07:45:47 -0500
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:52971 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728281AbgLHMpq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 8 Dec 2020 07:45:46 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id mcMVkCQo82G8DmcMYkxaqL; Tue, 08 Dec 2020 13:45:03 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1607431503; bh=3T90wRrLrdbw2J2RH33qWmCRt/sm5RUgqQtqG5ELjJ8=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=NQ44kYkWPcPvTZ3rmsWvaUangF8dw/+6Ed2otB2DFFKIamhCHGPqEmF8V0xwJnxgN
         0rCQY6gb2f9y34+dJjndGePlZvgQt3fbg2dwKKmjXkmfCa66RNvUjDVpVtaYas8Js7
         SZy/vR2M4xVRDtVbcOVvwdEKu3tIrZiaVukGtSId6B+2qVRD/actN40xQQsr8iKj0Z
         dC0n0HW1WBws2xa7EJ4NXYeeheQ+YOdUPDtUIq9SbfhQtRT8TAFaZxzm53Y4PxJ/n8
         9puIxTcj+6jjSWoX01e+1Gai5rjejrO8ulwumkmprE76X/cbnuvQ9WkncTnNeQCHAM
         VWaSp4KymTvCA==
Subject: Re: [PATCH] imx274: remove composition support, add
 V4L2_SEL_TGT_CROP_DEFAULT
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        "Eugen.Hristev@microchip.com" <Eugen.Hristev@microchip.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Luca Ceresoli <luca@lucaceresoli.net>
References: <7940b65c-b5d8-0167-3262-4282f10e873c@xs4all.nl>
 <20201207124655.GY852@paasikivi.fi.intel.com>
 <a61e6644-cb94-6ec9-f0e0-1c256bedb0ed@xs4all.nl>
 <20201207134258.GB852@paasikivi.fi.intel.com>
 <20201207145313.GC852@paasikivi.fi.intel.com>
 <692d3668-03b3-9b45-52ca-a1c05e2a6e1a@xs4all.nl>
 <20201208114600.GD25763@paasikivi.fi.intel.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <fb4481e8-7a67-352c-3424-847ff3e1ee39@xs4all.nl>
Date:   Tue, 8 Dec 2020 13:44:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201208114600.GD25763@paasikivi.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfKTqIWcVfiu8OqERH/5osSj02/QHU4HsO83YUldcfVEEjgFzCPNfmXi4mfQahWs0V9HCV31Qo9a93C/K0KAdMlg2bSR3xE7OqCdwD91wK36aa3sKw58V
 vedzj+d0TSI9/yfq1newxovtHIVo4IkN/2G2yiBDUvmPczT/mKqU/XiUVPlJjO4y0q4ocRJc4pGEcD5rjFJVNFxglrVd0HJZo3PrHq9Vw8RIEoCwEEpKcS0f
 jnKt+llOf1y61ZzmJpxuNLPqaK6pQKmc92uiOQvSKam+WcuRtIqR1tAA2SOGAOXBwX+XuwLdQnc2ZEdygYGMPEzeoQDEDFGOo1LRyJn6pOVdJk71gEfg1U6o
 0GeTfpIW
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 08/12/2020 12:46, Sakari Ailus wrote:
> On Tue, Dec 08, 2020 at 10:47:29AM +0100, Hans Verkuil wrote:
>> On 07/12/2020 15:53, Sakari Ailus wrote:
>>> On Mon, Dec 07, 2020 at 03:42:58PM +0200, Sakari Ailus wrote:
>>>> Hi Hans,
>>>>
>>>> On Mon, Dec 07, 2020 at 02:16:39PM +0100, Hans Verkuil wrote:
>>>>> On 07/12/2020 13:46, Sakari Ailus wrote:
>>>>>> Hi Hans,
>>>>>>
>>>>>> Thanks for the patch.
>>>>>>
>>>>>> On Mon, Dec 07, 2020 at 12:18:55PM +0100, Hans Verkuil wrote:
>>>>>>> This driver does not support composition, only cropping.
>>>>>>> Composition means that the sensor can output e.g. 1920x1080,
>>>>>>> but can compose a cropped 1280x720 image in the middle of the
>>>>>>> 1920x1080 canvas, filling in the unused area with a background
>>>>>>> color.
>>>>>>
>>>>>> That's how this would work on V4L2 video nodes...
>>>>>>
>>>>>>>
>>>>>>> That's not supported at all. So drop the bogus composition support.
>>>>>>
>>>>>> But this is a sub-device driver. On sub-devices the COMPOSE target is used
>>>>>> for configuring scaling, binning and sub-sampling. I don't know about the
>>>>>> capabilities of this particular driver but the code
>>>>>> (__imx274_change_compose function in particular) looks very much such that
>>>>>> it does support binning.
>>>>>>
>>>>>
>>>>> That should be done via set_fmt. There you select the output width and height.
>>>>>
>>>>> So if set_fmt sets 1920x1080, and the crop is 960x540, then you scale (or
>>>>> do binning/sub-sampling). Compose means composing the image into a larger
>>>>> canvas. For this driver the compose rectangle is always equal to the
>>>>> format, so set_selection(COMPOSE) is identical to set_fmt().
>>>>>
>>>>> If it was real composition, then there would have to be a try_compose as
>>>>> well, just as there is a try_crop. Instead set_selection(COMPOSE) fills in
>>>>
>>>> On sub-devices there's a try context that's file handle specific.
>>
>> I know, but that isn't used here.
> 
> What exactly are you referring to? The imx274 driver does at least appear
> to do just that.

No, it doesn't. Just grep for try_compose, you won't find it. Only try_fmt and
try_crop.

> 
>>
>>>>
>>>>> try_fmt. Clearly wrong.
>>>>
>>>> Not more than using set_fmt if you look at the documentation:
>>>>
>>>> <URL:https://hverkuil.home.xs4all.nl/spec/userspace-api/v4l/dev-subdev.html#order-of-configuration-and-format-propagation>
>>>>
>>>> In this case it's just on the sink pad, as the sub-device exports no source
>>>> pads. I think there are probably a few such drivers around.
>>
>> Which example are you referring to? 4.5 or 4.6?
>>
>> 4.5 is closest to what a sensor is, except you won't have a sink pad. Here you crop
>> from the sensor image, and to scale it up/down to the source media bus format
>> width and height (if the hardware supports that, of course).
>>
>> There is no composition. If composition was supported, then the crop rectangle
>> would be scaled up/down to the composition rectangle, which would be a rectangle
> 
> I'm not claiming there is composition, but the COMPOSE targets are also
> used when the device supports scaling, not composition. This has been so
> from the very beginning, and cannot (and should not) be changed at this
> point.

No, that's not true.

If that were true, then lots of sensor drivers would all support TGT_COMPOSE, but
they don't.

Without true composition then the scaling is just between the crop rectangle (if any)
and the mediabus format. I.e. try_crop and try_fmt.

Otherwise it would be very confusing since that would allow userspace to set both
the format size and the compose rectangle to different sizes, and which will then
be picked? Without true composition one would have to override the other, which
makes no sense.

> 
>> inside the source media bus format. Any pixels outside of that composition rectangle
>> would have to be filled with some background color. A video device would use composition
>> to write to a rectangle inside a memory buffer, a subdev device would use composition
>> in the same way, except it would just generate background pixels for anything outside
>> of the composition rectangle on the source pad.
>>
>> It is very, very rare for sensors or video receivers that support composition. They
>> typically support crop and they may support scaling of some sort, and that's it.
>>
>> This imx274 driver certainly does not support composition. It's plain wrong. And if
>> you look at the code carefully you'll see that the 'composition' just sets the source
>> media bus format.
>>
>> There are (besides imx274) only two sensor drivers that claim to support composition:
>> ccs and s5k5baf. The latter might actually be real since it has an embedded SoC ISP.
>> It is lacking a control to set the background color, though.
>>
>> CCS is a pipeline with scalers, binners, etc., but I am not so sure it actually supports
>> composition: can it compose the image inside a larger image that will go out on a source
>> pad?
>>
>> BTW, how do you test CCS? Do you run v4l2-compliance? I see no support for the
>> CROP/COMPOSE_DEFAULT selection, which suggests to me that v4l2-compliance will likely
>> protest. In order to implement the old VIDIOC_CROPCAP ioctl using the new selection
>> API you need both _BOUNDS and _DEFAULT selection targets. v4l2-compliance checks for
>> that.
> 
> The selection targets are documented in the spec but none has been
> mandatory. Some dependencies would be reasonable, for instance to require
> CROP_BOUNDS when CROP is supported. But these are not in the spec now, and
> v4l2-compliance shouldn't require them unless this is documented so in the
> spec.

CROPCAP returns the bound and default rectangles. It can only do that if the
selection API can return those rectangles. CROPCAP is required if cropping is
supported, see:

https://hverkuil.home.xs4all.nl/spec/userspace-api/v4l/vidioc-cropcap.html

"This ioctl must be implemented for video capture or output devices that support
 cropping and/or scaling and/or have non-square pixels, and for overlay devices."

So this IS in the spec. It is trivial to implement since in almost all cases
DEFAULT and BOUNDS are identical. Drivers do not implement cropcap directly
anymore, but the cropcap implementation in v4l2-ioctl.c just requests the
BOUNDS and DEFAULT selection targets. Video drivers typically just pass that
request on to the subdev driver.

It is how I found that issue: v4l2-compliance fails on that with the imx274
since it doesn't implement the CROP_DEFAULT target.

> 
>>
>>>>
>>>> Which sub-device drivers configure scaling based on set_fmt? I'm only aware
>>>> of omap3isp which pre-dates the selection API.
>>>
>>> That said, there are a lot of drivers that pick the entire configuration
>>> (cropping (digital and analogue), binning, scaling and sub-samplink) just
>>> based on set_fmt. It's what drivers to as there are no good solutions for
>>> the current API, but for the user it's pretty awful.
>>>
>>
>> No, that's nothing to do with composition. The CCS driver creates a chain of
>> subdevs, one for each step (scaling, binning), and so you can control it precisely.
>> But I am pretty sure that each step will be like the 4.5 example: you receive
>> an image on the sink pad, you can optionally crop that, and the result is scaled
>> up/down to the source media bus format. There is no composition taking place.
> 
> Again, that's not how it works.
> 
> I also want to stress this is how it has always worked: the sub-device
> selection support was merged with the CCS driver that was the first user.
> There's simply no way to re-purpose interfaces now, after a decade of use
> in the mainline kernel.

So if I set the composition rectangle to 1280x720 and with (top, left) at
(128,128), and I set the media bus format to 1920x1080, and then try to
validate the pipeline, what will happen?

Anyway, I'm talking about the imx274 driver, not the ccs driver. I believe
the ccs driver is wrong, but it has been wrong since the beginning, so there
is a reason to keep it.

In the imx274 this composition support was added in commit 39dd23dc9d4c in July
2018, so if you prefer to keep it to prevent breakage, then that is a valid
reason. In that case I'll rework the patch to just add support for CROP_DEFAULT.
But it is hopelessly wrong: both SUBDEV_S_FMT and S_SELECTION(COMPOSE) set
try_fmt for V4L2_SUBDEV_FORMAT_TRY. I.e., they do the same thing.

Basically this is a degenerate case where the composition rectangle must always
remain the same as the format width/height, and changing one will change the other.
This makes S_SELECTION(COMPOSE) pointless. Worse, it suggests to userspace that
the driver supports true composition, when it really doesn't.

Regards,

	Hans


> 
>> Or in other words, the composition rectangle always matches the source media bus
>> format. But there is no point exposing that, it would just be confusing to userspace.
>>
>> The only possible use-case that I can see is similar to example 4.6 (except with
>> one source pad, not two): there you scale from the sink crop to the sink compose
>> rectangle, then do a source crop and output that to the source pad. But that only
>> makes sense if you can actually do a source crop in the hardware. If you can't, then
>> it again reduces to just a sink crop and scaling to the source media bus format.
>>
>> In any case, imx274 definitely doesn't do composition, so that should be removed.
> 

