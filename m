Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5A401DE842
	for <lists+linux-media@lfdr.de>; Mon, 21 Oct 2019 11:38:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727211AbfJUJiE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Oct 2019 05:38:04 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:45337 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726847AbfJUJiD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Oct 2019 05:38:03 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud7.xs4all.net with ESMTPA
        id MU8TiTcPNo1ZhMU8WiLOBn; Mon, 21 Oct 2019 11:38:01 +0200
Subject: Re: [RFC PATCH v3 1/6] media: v4l2: Extend pixel formats to unify
 single/multi-planar handling (and more)
To:     Tomasz Figa <tfiga@chromium.org>
Cc:     Boris Brezillon <boris.brezillon@collabora.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Hirokazu Honda <hiroh@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Brian Starkey <Brian.Starkey@arm.com>, kernel@collabora.com
References: <20191008091119.7294-1-boris.brezillon@collabora.com>
 <20191008091119.7294-2-boris.brezillon@collabora.com>
 <9b289f76-6c09-b088-204d-ce5b5009bd7b@xs4all.nl>
 <CAAFQd5C7D24teYQThou+ZvZrZ7iH6-hAumSCiRi8U6tDKSdzuA@mail.gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <ce4639c3-fcae-e8ca-d2b8-dd79b14f7204@xs4all.nl>
Date:   Mon, 21 Oct 2019 11:37:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAAFQd5C7D24teYQThou+ZvZrZ7iH6-hAumSCiRi8U6tDKSdzuA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfJ4zM1lqz42ih4NeLrMwNH0HBC/IvKb5eDoTKsrPadYqTwItBUi421Hl64YdgDBi1xZFe1rNFoYqWtjAeU+UrkDt8+h3C0us9cpgYixoqCp9nk3kGwH2
 2mld/lV/YpAWtDIfNrV+5mlRKAh6gRuXFaC1Qm8ZbcJD3WRQQyqe1GqvwjnqhID6ZR5P3nmkx4nipmr3wbi/79SLXaO4IadJt3gWOdgdIW/QZHwmxscAgrGs
 0eGY3fk8tsFWtumT7JPsaDOCHCm45Re9sA025QAjSaajabNZjK7jNrU2cV9JCbiv/yElVvuzxpyQsgAPD5mMww2Dcl7RtHeT7h3dxTIe1hCbBgXScri44Bt8
 20wdWpNzPBaVNOY6MB47rfAhR4BLgXaHyXxeKhzsg4d5ocwVByZPdjSKdPQ5BHWtAIPjd8k1godf8D8ktQge8HjWvCVkKA6gPhageUO6ChZbBRkliKULGPwC
 W9H+N+IyApUzVgsQ1rKrCd/OFKplikiqSicVuZTG+91vk3wdMYE7TJr/2xc=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 10/21/19 11:26 AM, Tomasz Figa wrote:
> On Mon, Oct 21, 2019 at 5:41 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>>
>> On 10/8/19 11:11 AM, Boris Brezillon wrote:
>>> This is part of the multiplanar and singleplanar unification process.
>>> v4l2_ext_pix_format is supposed to work for both cases.
>>>
>>> We also add the concept of modifiers already employed in DRM to expose
>>> HW-specific formats (like tiled or compressed formats) and allow
>>> exchanging this information with the DRM subsystem in a consistent way.
>>>
>>> Note that V4L2_BUF_TYPE_VIDEO[_OUTPUT]_OVERLAY and
>>> V4L2_BUF_TYPE_VIDEO_{CAPTURE,OUTPUT}_MPLANE types are no longer accepted
>>> in v4l2_ext_format and will be rejected if you use the {G,S,TRY}EXT_FMT
>>> ioctls. V4L2_BUF_TYPE_VIDEO_{CAPTURE,OUTPUT}_MPLANE is dropped as part
>>> of the multiplanar/singleplanar unification.
>>> V4L2_BUF_TYPE_VIDEO[_OUTPUT]_OVERLAY seems to be used mostly on old
>>> drivers and supporting it would require some extra rework.
>>>
>>> New hooks have been added to v4l2_ioctl_ops to support those new ioctls
>>> in drivers, but, in the meantime, the core takes care of converting
>>> {S,G,TRY}_EXT_FMT requests into {S,G,TRY}_FMT so that old drivers can
>>> still work if the userspace app/lib uses the new ioctls.
>>> The conversion is also done the other around to allow userspace
>>> apps/libs using {S,G,TRY}_FMT to work with drivers implementing the
>>> _ext_ hooks.
>>>
>>> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
>>> ---
>>
>> <snip>
>>
>>>
>>> +#define VIDIOC_G_EXT_FMT     _IOWR('V', 104, struct v4l2_ext_format)
>>> +#define VIDIOC_S_EXT_FMT     _IOWR('V', 105, struct v4l2_ext_format)
>>> +#define VIDIOC_TRY_EXT_FMT   _IOWR('V', 106, struct v4l2_ext_format)
>>>  /* Reminder: when adding new ioctls please add support for them to
>>>     drivers/media/v4l2-core/v4l2-compat-ioctl32.c as well! */
>>>
>>>
>>
>> Since we're extending g/s/try_fmt, we should also provide a replacement for
>> enum_fmt, esp. given this thread:
>>
>> https://www.mail-archive.com/linux-media@vger.kernel.org/msg150871.html
> 
> While that's a completely valid problem that should be addressed, I'm
> not sure if putting all the things in one bag would have a positive
> effect on solving all the problems in a reasonable timeline.

I'm not sure what you mean with this. We can't ignore this either, and if
we're going to add these new ioctls, then let's try to fix as much as we can.

> 
>>
>> So here is a preliminary suggestion:
>>
>> struct v4l2_ext_fmtdesc {
>>         __u32               index;             /* Format number      */
>>         __u32               type;              /* enum v4l2_buf_type */
>>         __u32               which;             /* enum v4l2_subdev_format_whence, ignored if mbus_code == 0 */
>>         __u32               mbus_code;         /* Mediabus Code (set to 0 if n/a) */
>>         __u32               flags;
>>         __u8                description[32];   /* Description string */
>>         __u32               pixelformat;       /* Format fourcc      */
>> };
>>
>> This would solve (I think) the issue raised in the thread since you can now get
>> just for formats that are valid for the given mediabus code and the which field.
>>
> 
> Hmm, why only mbus_code? We have the same problem with mem2mem
> devices, where the format set on one queue affects the formats
> supported on another queue. Perhaps it should be defined to return
> formats valid with the current state of the driver? If we want to
> extend it to return formats for arbitrary states, perhaps we should
> use a mechanism similar to the TRY_FMT slot in subdevices, where we
> can set the configuration we want to test against and then ENUM_FMT
> would return the formats valid for that configuration?

Good point.

> 
>> Other improvements that could be made is to return more information about the
>> format (similar to struct v4l2_format_info). In particular v4l2_pixel_encoding
>> and mem/comp_planes would be useful for userspace to know.
> 
> An alternative would be to go away from mixing mem_planes and
> pixelformats and just having the "planarity" queryable and
> configurable separately. The existing duplicated FourCCs would have to
> remain for compatibility reasons, though.

Interesting idea, but I don't know if this would make the API more or less confusing.

> 
>>
>> Finally, we can also add a new ioctl that combines ENUM_FMT/ENUM_FRAMESIZES/ENUM_FRAMEINTERVALS
>> and returns an array of all valid formats/sizes/intervals, requiring just a single ioctl
>> to obtain all this information.
> 
> While it definitely sounds like a useful thing to have, it would be an
> interesting problem to solve given the inter-dependencies between
> pads, queues and other state, as in the mbus example above.

This is definitely a separate issue for further in the future.

Regards,

	Hans
