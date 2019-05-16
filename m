Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5CD2220265
	for <lists+linux-media@lfdr.de>; Thu, 16 May 2019 11:19:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726597AbfEPJTp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 May 2019 05:19:45 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:36913 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726336AbfEPJTp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 May 2019 05:19:45 -0400
Received: from [IPv6:2001:420:44c1:2579:5556:9d1d:75e4:9919] ([IPv6:2001:420:44c1:2579:5556:9d1d:75e4:9919])
        by smtp-cloud9.xs4all.net with ESMTPA
        id RCY5hnd4wsDWyRCY9hwYR6; Thu, 16 May 2019 11:19:42 +0200
Subject: Re: Questions regarding Documentation/media/uapi/v4l/field-order.rst
To:     "Rodin, Michael (Ferchau; ADITG/ESM1)" <mrodin@de.adit-jv.com>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Cc:     "Friedrich, Eugen (ADITG/ESM1)" <efriedrich@de.adit-jv.com>,
        "Rosca, Eugeniu (ADITG/ESM1)" <erosca@de.adit-jv.com>,
        "slongerbeam@gmail.com" <slongerbeam@gmail.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <AC35D0CFBC66A84AAA9DF4334B52828D13614162@HI2EXCH01.adit-jv.com>
 <187c237b-6b75-f408-ae41-6065baf5cd7f@xs4all.nl>
 <AC35D0CFBC66A84AAA9DF4334B52828D13617E17@HI2EXCH01.adit-jv.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <3a241a5c-902e-ba53-748c-ab410513d1ad@xs4all.nl>
Date:   Thu, 16 May 2019 11:19:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <AC35D0CFBC66A84AAA9DF4334B52828D13617E17@HI2EXCH01.adit-jv.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfCmJvEgMkMWWLppOvtzi9Gxtr0EebmmVhtNHBnbhZsTl3QOQ4gtz/1cqkaS49zNsUxnLC2cnUCzd1rDI9488WBBe+gttnJ44Y3hBxuy/FUeMTBZwr56k
 xJbn+J6sBlk6HnBWqXJ6e+y9ZkCp94HbMmSGI5+nmCT26T0J0jSk0K1P5On9eLQ8tPXxN02f6+70cc/ZrOd9BUHw7dgSaiekWsqPvA86nepMUcj/5CL7sBl4
 4zgiGrWvfRrlFnnSwVAuFcaQl6O+X6kF7P+itNZTzMrHvPWXgnOQhcMrLkU+0wb++wXpH2N58YlKfJIoIw1+kzvKExY4ZUp2KkXHYvpDrH1EbB+gmKAbSoXK
 rY+/4ImcBIhZSKP9w04Uxfp7Eft5ApLjiqrWRZRKX7rul9in08GsNMVBOPu23JbaHjuXHoidyfnJWp6bEy92lL/Q+xm7E08bAx1OPxIgX4UAUg6NTzfsZnej
 TPz2iavnL9YGmHq7RbUi1ZIoknEkrgwgTMOfLQ==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 5/16/19 10:19 AM, Rodin, Michael (Ferchau; ADITG/ESM1) wrote:
>> On 4/16/19 3:54 PM, Rodin, Michael (Ferchau; ADITG/ESM1) wrote:
>>> Hi,
>>>
>>> I would like to ask several questions regarding the documentation of the
>> enum "v4l2_field" [1].
>>> These questions came up during my investigations of issues with
>>> interaction between the gstreamer plugin v4l2src and the rcar video input
>> driver [2].
>>>
>>> The documentation [1] specifies that:
>>> "All video capture and output devices must report the current field order.
>>> Some drivers may permit the selection of a different order, to this
>>> end applications initialize the field field of struct v4l2_pix_format
>>> before calling the VIDIOC_S_FMT ioctl. If this is not desired it
>>> should have the value V4L2_FIELD_ANY (0)."
>>>
>>> If I have understood these lines correctly, this means that if
>>> userspace sets "field" member of the struct "v4l2_pix_format" to
>>> V4L2_FIELD_ANY and uses this as parameter for the VIDIOC_S_FMT ioctl,
>>> then a driver should select/report the field order, which was
>>> previously set by media-ctl utility in the next subdevice, which is
>>> connected
>> to the /dev/videoX node (From my understanding this would be equivalent to
>> the "current field order").
>>>
>>> If the described behavior is correct, then the description in the table
>>> row for
>> V4L2_FIELD_ANY in [1] is incomplete:
>>> "Applications request this field order when any one of the
>> V4L2_FIELD_NONE, V4L2_FIELD_TOP, V4L2_FIELD_BOTTOM, or
>> V4L2_FIELD_INTERLACED formats is acceptable."
>>> What if V4L2_FIELD_ALTERNATE or V4L2_FIELD_SEQ_TB or
>> V4L2_FIELD_SEQ_BT are also acceptable for the application?
>>> I think that the specification is either unprecise or my understanding of
>>> the
>> specification is wrong.
>>
>> The spec is a bit out of date: those missing field values were probably
>> added
>> after this text was written. I'll make a patch fixing this.
> 
> Thank you for the patch! I think, the sentence "Drivers choose depending on
> hardware capabilities..." in the description of V4L2_FIELD_ANY is also
> unprecise,
> because when media-ctl is used, the format is chosen by the userspace and
> not by the driver. So if I choose "interlaced" for the connected subdevice
> by using media-ctl (which calls VIDIOC_SUBDEV_S_FMT) and it is successfully
> set, then V4L2_FIELD_ANY will definitely return V4L2_FIELD_INTERLACED
> and nothing else is possible.

Actually, a subdev will have no knowledge of other subdevs. So using ANY will
just cause the subdev driver to choose something based on the HW capabilities
and existing pad formats. Using ANY with media-ctl is allowed, but generally
is asking for problems.

So how ANY is mapped to a real field value by the driver is indeed undefined.
As long as the result is valid, that's the only requirement.

In most cases it is obvious what a driver will choose: NONE for camera pipelines,
INTERLACED for SDTV interlaced formats, and for HDMI either NONE for progressive
formats or ALTERNATE for interlaced formats.

> 
>>>
>>> Another potential issue, which I found in this documentation is that
>>> it does not distinguish between multiple contexts in which enum v4l2_field
>> can be used. I can think of at least two different contexts:
>>> - When used to select the field order with VIDIOC_S_FMT ioctl.
>>> - When used to report the field order in a buffer: for example application
>> sets V4L2_FIELD_ALTERNATE in VIDIOC_S_FMT ioctl and then gets buffers,
>> which have V4L2_FIELD_TOP/BOTTOM set.
>>
>> IMHO the text is reasonably clear on that. But if you have suggestions to
>> improve it, then make a proposal.
>>
>>> Now with this in mind, when I read the description of V4L2_FIELD_NONE:
>>> "The driver may also indicate this order when it cannot distinguish
>>> between
>> V4L2_FIELD_TOP and V4L2_FIELD_BOTTOM."
>>
>> Whoops, that makes no sense. There are no drivers that do this. I'll remove
>> this line. If a driver can't tell the difference, then it should just pick
>> FIELD_TOP
>> or BOTTOM.
> 
> Thank you! So this means that drivers should return FIELD_ALTERNATE in S_FMT,
> even if they can not distinguish between FIELD_TOP and FIELD_BOTTOM.

If you can't distinguish between FIELD_TOP and FIELD_BOTTOM then that effectively
means that the HW cannot support FIELD_ALTERNATE. That mode relies on the HW
being able to distinguish between top and bottom fields.

> Would it make sense to add your last sentence "If a driver can't tell the
> difference,
> then it should just pick FIELD_TOP or BOTTOM." to the description of
> V4L2_FIELD_ALTERNATE (or better just FIELD_TOP so it is easier for userspace
> to check whether there is no field detection), so this case is documented
> after
> removing of "The driver may also indicate this order when it cannot
> distinguish
> between V4L2_FIELD_TOP and V4L2_FIELD_BOTTOM."?

No. If the HW cannot distinguish between top and bottom fields, then it
shouldn't signal interlaced support at all. Without knowing what field
is captured userspace cannot do anything with it. It just makes no sense.

> 
>>> I see two possible meanings/interpretations:
>>> - If application sets V4L2_FIELD_ALTERNATE in VIDIOC_S_FMT ioctl, report
>> V4L2_FIELD_NONE back
>>>    so the application knows that the driver can not provide any TOP/BOTTOM
>> metadata in the buffers
>>>    (which may be necessary for the application for example for
>>> deinterlacing)
>> before it has got any buffer.
>>> - If application sets V4L2_FIELD_ALTERNATE in VIDIOC_S_FMT ioctl, driver
>> reports V4L2_FIELD_ALTERNATE back,
>>>    even if it can not distinguish between TOP/BOTTOM. But when the
>> application starts to read buffers,
>>>    they have V4L2_FIELD_NONE set if it's not possible to distinguish
>>> between
>> TOP/BOTTOM.
>>
>> Actually, drivers cannot ever return NONE for a top or bottom field.
>> FIELD_NONE indicates that a full frame has arrived, and doing something else
>> would break userspace.
>>
>>>
>>> Also there is another ambiguity in the description of V4L2_FIELD_NONE:
>>> "Images are in progressive format, not interlaced."
>>> What does "interlaced" mean in this case? Does it mean the other possible
>> enum values or just the V4L2_FIELD_INTERLACED?
>>
>> It means that the source video transmitted full frames, not top and bottom
>> fields. I clarified the text a bit.
> 
> Thanks for the clarification! So just to avoid misunderstanding, 
> V4L2_FIELD_INTERLACED and V4L2_FIELD_SEQ_BT/TB
> are "interlaced" in this context, because they contain fields (and are "field-based")?

Yes.

> 
>>> If this just means V4L2_FIELD_INTERLACED, then it would imply that for
>>> example V4L2_FIELD_SEQ_TB and V4L2_FIELD_ALTERNATE are progressive
>> formats, which is obviously not true.
>>> And also generally, in which of described contexts should be
>> V4L2_FIELD_NONE set or reported (buffer or VIDIOC_S_FMT ioctl)?
>>
>> For video capture (that's what we are talking about here) it is returned by
>> the
>> driver in v4l2_buffer, never by userspace. Userspace can try to request a
>> specific field value when calling S_FMT, but the driver can overwrite it.
> 
> Sorry, what do you mean by "returned by userspace" here?

No idea :-)  Just ignore the ", never by userspace" bit in that sentence.

Basically, userspace sets a format by calling VIDIOC_S_FMT. The driver returns
the actual format it will use taking into account hardware limitations. The
returned field value is what it will use for the video capture.

While streaming, when you dequeue a buffer (VIDIOC_DQBUF) the field value in
v4l2_buffer is normally identical to the field value from v4l2_format, except
in the case where v4l2_format says FIELD_ALTERNATE: in that case the v4l2_buffer
field value shall be either TOP or BOTTOM.

Regards,

	Hans
