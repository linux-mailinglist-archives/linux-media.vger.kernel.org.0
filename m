Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1678E2A657A
	for <lists+linux-media@lfdr.de>; Wed,  4 Nov 2020 14:46:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729794AbgKDNqv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Nov 2020 08:46:51 -0500
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:39361 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728508AbgKDNqv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 4 Nov 2020 08:46:51 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id aJ7Xk5ZXrRiwVaJ7akK0qR; Wed, 04 Nov 2020 14:46:45 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1604497605; bh=j6/VktKqW5UWMitcsHjVm0wjZqEq/p9Pb9DksT80vjQ=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=eC2qkJWs2AXnsSTLhYntHsBuDkzmJCjzAKny3fLS4TRYXnc4UX3exm98AFgg4NZYD
         B9iXFfEcdR90URTbvHHQZYJnwYI6izTCP7zosBCt/n/SPHdPrz3TYAHm6Y2+4AaVSc
         VKZo8g4KzbUveUutzm5Lw65hryIzTBl0CpYxqWl+N4fr+trR9NgumGb4sIUuFH9/49
         XCNPUpWNcy35T/SwDG4NzX+ja17LctAv53WMOvlXtiUvlYfbCLJfgkMyzkSW0TUiu+
         EO4FeyThyVdDh8qqiZMQmoJ4DUY60LoOFVcRscY6RIXWVEA9GlynHZfchMV+vYLCvm
         L3LM+qGj3DEIA==
Subject: Re: [PATCH v3 1/2] media: uapi: add MEDIA_BUS_FMT_METADATA_FIXED
 media bus format.
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        helen.koike@collabora.com, ezequiel@collabora.com,
        kernel@collabora.com, dafna3@gmail.com,
        linux-rockchip@lists.infradead.org, mchehab@kernel.org,
        tfiga@chromium.org
References: <20201030134609.30020-1-dafna.hirschfeld@collabora.com>
 <20201030140241.GQ26150@paasikivi.fi.intel.com>
 <5c8852f5-a803-1bd0-7798-3cca0d7ee9ea@xs4all.nl>
 <20201104123218.GQ26150@paasikivi.fi.intel.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <573fb8b3-e4fd-9239-a407-e904ed18ff3f@xs4all.nl>
Date:   Wed, 4 Nov 2020 14:46:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201104123218.GQ26150@paasikivi.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfBKGS3o96G0TyHu13R07jm/faKtHJ+SSOCo9iY0jFUMqT6k9uH2pIxJetbTiQmsqGmjh1EbALmtJk+S17BisgHw8Q7uux1QgG1XXUypVEz29ad7gm1WM
 DR/HN5nqP/46NcwW3SpELHQTPXSfsm7FgxpUUcP3TF3fFkJLm8ct5ekaaSU7eEWfQGcHlS7tn2n/P2pQOZlG0D1fPMeF0w081IHCmyucG8pzveun0KslkUPP
 MwPfbiPZ8ZbX7bjTtoSR+cOaIXQPunTA4kTJpYzj4gI3TdjMp5W9Z4aB0RIRxgoZg4kPfAQljnDV+yykCMTlhEXyy/TwnwPXcT0KRuDY3qUXXDF9gVX9mRAR
 nXI1M/xplzk5B/q6I5QJok6liCkFAwoQFjNsyEYz5EMsMPRnF9TcitBH5c9z2j9wo5fe8Xv4Zt+lti2MGJRPbDSzzVboCaGQZVB3FZYB9WIPXTpb+u/KvAdh
 g0AjWAf3gqDDyfRfjxOH0e9oJzS/o1JQzMFSh8wAaTy9HR4OVrs2VCktXi/I8P92DwCxTXi2hKXZvnnhThMyLILKfGFdNWWp5S9lKA==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 04/11/2020 13:32, Sakari Ailus wrote:
> Hi Hans,
> 
> On Wed, Nov 04, 2020 at 01:16:03PM +0100, Hans Verkuil wrote:
>> On 30/10/2020 15:02, Sakari Ailus wrote:
>>> Hi Dafna,
>>>
>>> On Fri, Oct 30, 2020 at 02:46:08PM +0100, Dafna Hirschfeld wrote:
>>>> MEDIA_BUS_FMT_METADATA_FIXED should be used when
>>>> the same driver handles both sides of the link and
>>>> the bus format is a fixed metadata format that is
>>>> not configurable from userspace.
>>>> The width and height will be set to 0 for this format.
>>>>
>>>> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
>>>> Acked-by: Helen Koike <helen.koike@collabora.com>
>>>> ---
>>>> changes since v2:
>>>> added documentation in subdev-formats.rst
>>>> changes since v1:
>>>> 1. replace "This format may have 0 height and width."
>>>> with "Width and height will be set to 0 for this format."
>>>> and add it also to the commit log
>>>> 2. s/meida:/media:/ in the patch subject line
>>>>
>>>>  .../media/v4l/subdev-formats.rst              | 27 +++++++++++++++++++
>>>>  include/uapi/linux/media-bus-format.h         |  8 ++++++
>>>>  2 files changed, 35 insertions(+)
>>>>
>>>> diff --git a/Documentation/userspace-api/media/v4l/subdev-formats.rst b/Documentation/userspace-api/media/v4l/subdev-formats.rst
>>>> index c9b7bb3ca089..7f16cbe46e5c 100644
>>>> --- a/Documentation/userspace-api/media/v4l/subdev-formats.rst
>>>> +++ b/Documentation/userspace-api/media/v4l/subdev-formats.rst
>>>> @@ -7899,3 +7899,30 @@ formats.
>>>>        - 0x5001
>>>>        - Interleaved raw UYVY and JPEG image format with embedded meta-data
>>>>  	used by Samsung S3C73MX camera sensors.
>>>> +
>>>> +.. _v4l2-mbus-metadata-fmts:
>>>> +
>>>> +Metadata Formats
>>>> +^^^^^^^^^^^^^^^^
>>>> +
>>>> +This section lists all metadata formats.
>>>> +
>>>> +The following table lists the existing metadata formats.
>>>> +
>>>> +.. tabularcolumns:: |p{8.0cm}|p{1.4cm}|p{7.7cm}|
>>>> +
>>>> +.. flat-table:: Metadata formats
>>>> +    :header-rows:  1
>>>> +    :stub-columns: 0
>>>> +
>>>> +    * - Identifier
>>>> +      - Code
>>>> +      - Comments
>>>> +    * .. _MEDIA-BUS-FMT-METADATA-FIXED:
>>>> +
>>>> +      - MEDIA_BUS_FMT_METADATA_FIXED
>>>> +      - 0x7001
>>>> +      - This format should be used when the same driver handles
>>>> +	both sides of the link and the bus format is a fixed
>>>> +	metadata format that is not configurable from userspace.
>>>> +	Width and height will be set to 0 for this format.
>>>> diff --git a/include/uapi/linux/media-bus-format.h b/include/uapi/linux/media-bus-format.h
>>>> index 84fa53ffb13f..2ce3d891d344 100644
>>>> --- a/include/uapi/linux/media-bus-format.h
>>>> +++ b/include/uapi/linux/media-bus-format.h
>>>> @@ -156,4 +156,12 @@
>>>>  /* HSV - next is	0x6002 */
>>>>  #define MEDIA_BUS_FMT_AHSV8888_1X32		0x6001
>>>>  
>>>> +/*
>>>> + * This format should be used when the same driver handles
>>>> + * both sides of the link and the bus format is a fixed
>>>> + * metadata format that is not configurable from userspace.
>>>> + * Width and height will be set to 0 for this format.
>>>> + */
>>>
>>> Does this mean that metadata with dimensions should not use
>>> MEDIA_BUS_FMT_METADATA_FIXED? I guess that's not the intention? For some
>>> formats the dimensions would be relevant but for others not. I'd thus
>>> replace "will" by "may". Same for the documentation.
>>
>> struct v4l2_meta_format as used with VIDIOC_G/S/TRY_FMT doesn't have
>> a width or height either. Supporting width and height for metadata
>> doesn't really make sense for me for metadata.
>>
>> Explicitly specifying the width and height here indicates that the
>> data is basically an array of width x height of some sort which makes
>> sense for video devices.
>>
>> Metadata is more complex data that cannot be represented like that.
>> If metadata is actually an array, then I'm not sure I would call it
>> metadata, I would probably see it as video with its own pixelformat
>> that contains non-video data.
> 
> Let's say the metadata is laid out in a similar way than an image; you have
> lines of data, followed by some padding at the end, and a line has length
> and a buffer has a number of lines. Sensor metadata falls into this
> description.
> 
> Would you then use struct v4l2_pix_format for it, and use
> V4L2_BUF_TYPE_VIDEO_CAPTURE for it?

Yes. It's still metadata, but it has the same 'format' as video data.
We have similar situations such as with v4l-touch devices: the data
is formatted like video, but it is actually pressure values from a
touch pad. But it is 'video-like' in its behavior.

> 
> That would make a few things easier but this is still metadata, not video
> data. Albeit I guess it's not important to be so strict about that
> interface-wise, indeed this is not a bad fit for such metadata. Still some
> fields such as colourspace and quantisation are not relevant, but that
> holds also for some pixel formats.
> 

So are you OK with setting width and height to 0 for MEDIA_BUS_FMT_METADATA_*?

Regards,

	Hans
