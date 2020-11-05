Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FEBE2A7EAD
	for <lists+linux-media@lfdr.de>; Thu,  5 Nov 2020 13:35:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730577AbgKEMfK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Nov 2020 07:35:10 -0500
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:49501 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730344AbgKEMfJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 5 Nov 2020 07:35:09 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id aeTkkCup0NanzaeTnkoKTw; Thu, 05 Nov 2020 13:35:07 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1604579707; bh=CvSxDX9wQb32LlMB7/lzKcwReuyk6sk83rE6bpZrRTg=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=cue1Zrhw+WDA0Kno/d/AhCIaXxTc7ejXyUMgPtnC0AR6Lg6dWB00+c4SdYLrNWrA/
         twVvivBK0jdkg/38zPJdzVZahmX0zFOlhJRNJ3MyYi+6icttGT005c2pNKR/kOAzKR
         7/b9JqwWKSpKvUYZ3t2PahLgg1ATVNv1N5BYA/daAeBbTa9sMyb5dcD0k5OxGyjJj+
         BUs076Mc3JKv6fCHrbgRhoK/kI9I+XtzywODZEhjSWBcFiQGxbi53wIgsg6oCVYZE7
         bq/uOx2ZeC2fu7b9kP1fkjgC0mP4C5OPYRJdYEeiBqfu9yRKPrU6xRaUAp4hRq/I1d
         OuKKsn5XgmPYw==
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
 <573fb8b3-e4fd-9239-a407-e904ed18ff3f@xs4all.nl>
 <20201104145456.GR26150@paasikivi.fi.intel.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <98059490-6ab1-c895-5a20-e1b14b70c624@xs4all.nl>
Date:   Thu, 5 Nov 2020 13:35:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201104145456.GR26150@paasikivi.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfESwrLD7Q/5VLr5TD8KhPZRccYDg4FzA8PK+X+KDPqAlmw5DszWyPAJgSYZQrVAsoAlwuWl7vRXOQcR1aDILVfic+aUyhv2b4KRX4erDVJgs8af5Wds5
 N7iLPDysEGpMjucDbOZjscwipWsJdvb7D/jq7uOu3toS9enS2RJODU3+iEl1pS+AWM2d/eG+dn29OKaQ82QQHJB9anxRcktdiB5B8AOvjom7RYUi80o/XR6r
 HjEd5XlhrMJdHbTciO4Ltb9a3SFwnxJu6nD4U8rFSR21feN16pOw2P6qVAX+1DyYxG/pzcn8ICZy3XQOCvzOJnDkAvAPd2oEh6ryvwp6qahbogGjeaIo5GTi
 WhWTkHLyo5zdsyKGX234PQ6JgKGqxU/YOr0cqFRBZ0vJRN0iS+y4nf+3MO25AkPTrYTFCj3y2th/pZORMpyeE8YbV0IU0mPypX7JMaYbkyPa5gea5PwwKLFZ
 PMmsR0Jxui2tD5NIZ6zMlPkhJKD+taM5I8A3xKHD1hF61BFPRzuUj8mHUSVh5HYbwG1aedPJehSuidmn9xumNX7JEF5kb6UEQXb+Wg==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 04/11/2020 15:54, Sakari Ailus wrote:
> Hi Hans,
> 
> On Wed, Nov 04, 2020 at 02:46:39PM +0100, Hans Verkuil wrote:
>> On 04/11/2020 13:32, Sakari Ailus wrote:
>>> Hi Hans,
>>>
>>> On Wed, Nov 04, 2020 at 01:16:03PM +0100, Hans Verkuil wrote:
>>>> On 30/10/2020 15:02, Sakari Ailus wrote:
>>>>> Hi Dafna,
>>>>>
>>>>> On Fri, Oct 30, 2020 at 02:46:08PM +0100, Dafna Hirschfeld wrote:
>>>>>> MEDIA_BUS_FMT_METADATA_FIXED should be used when
>>>>>> the same driver handles both sides of the link and
>>>>>> the bus format is a fixed metadata format that is
>>>>>> not configurable from userspace.
>>>>>> The width and height will be set to 0 for this format.
>>>>>>
>>>>>> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
>>>>>> Acked-by: Helen Koike <helen.koike@collabora.com>
>>>>>> ---
>>>>>> changes since v2:
>>>>>> added documentation in subdev-formats.rst
>>>>>> changes since v1:
>>>>>> 1. replace "This format may have 0 height and width."
>>>>>> with "Width and height will be set to 0 for this format."
>>>>>> and add it also to the commit log
>>>>>> 2. s/meida:/media:/ in the patch subject line
>>>>>>
>>>>>>  .../media/v4l/subdev-formats.rst              | 27 +++++++++++++++++++
>>>>>>  include/uapi/linux/media-bus-format.h         |  8 ++++++
>>>>>>  2 files changed, 35 insertions(+)
>>>>>>
>>>>>> diff --git a/Documentation/userspace-api/media/v4l/subdev-formats.rst b/Documentation/userspace-api/media/v4l/subdev-formats.rst
>>>>>> index c9b7bb3ca089..7f16cbe46e5c 100644
>>>>>> --- a/Documentation/userspace-api/media/v4l/subdev-formats.rst
>>>>>> +++ b/Documentation/userspace-api/media/v4l/subdev-formats.rst
>>>>>> @@ -7899,3 +7899,30 @@ formats.
>>>>>>        - 0x5001
>>>>>>        - Interleaved raw UYVY and JPEG image format with embedded meta-data
>>>>>>  	used by Samsung S3C73MX camera sensors.
>>>>>> +
>>>>>> +.. _v4l2-mbus-metadata-fmts:
>>>>>> +
>>>>>> +Metadata Formats
>>>>>> +^^^^^^^^^^^^^^^^
>>>>>> +
>>>>>> +This section lists all metadata formats.
>>>>>> +
>>>>>> +The following table lists the existing metadata formats.
>>>>>> +
>>>>>> +.. tabularcolumns:: |p{8.0cm}|p{1.4cm}|p{7.7cm}|
>>>>>> +
>>>>>> +.. flat-table:: Metadata formats
>>>>>> +    :header-rows:  1
>>>>>> +    :stub-columns: 0
>>>>>> +
>>>>>> +    * - Identifier
>>>>>> +      - Code
>>>>>> +      - Comments
>>>>>> +    * .. _MEDIA-BUS-FMT-METADATA-FIXED:
>>>>>> +
>>>>>> +      - MEDIA_BUS_FMT_METADATA_FIXED
>>>>>> +      - 0x7001
>>>>>> +      - This format should be used when the same driver handles
>>>>>> +	both sides of the link and the bus format is a fixed
>>>>>> +	metadata format that is not configurable from userspace.
>>>>>> +	Width and height will be set to 0 for this format.
>>>>>> diff --git a/include/uapi/linux/media-bus-format.h b/include/uapi/linux/media-bus-format.h
>>>>>> index 84fa53ffb13f..2ce3d891d344 100644
>>>>>> --- a/include/uapi/linux/media-bus-format.h
>>>>>> +++ b/include/uapi/linux/media-bus-format.h
>>>>>> @@ -156,4 +156,12 @@
>>>>>>  /* HSV - next is	0x6002 */
>>>>>>  #define MEDIA_BUS_FMT_AHSV8888_1X32		0x6001
>>>>>>  
>>>>>> +/*
>>>>>> + * This format should be used when the same driver handles
>>>>>> + * both sides of the link and the bus format is a fixed
>>>>>> + * metadata format that is not configurable from userspace.
>>>>>> + * Width and height will be set to 0 for this format.
>>>>>> + */
>>>>>
>>>>> Does this mean that metadata with dimensions should not use
>>>>> MEDIA_BUS_FMT_METADATA_FIXED? I guess that's not the intention? For some
>>>>> formats the dimensions would be relevant but for others not. I'd thus
>>>>> replace "will" by "may". Same for the documentation.
>>>>
>>>> struct v4l2_meta_format as used with VIDIOC_G/S/TRY_FMT doesn't have
>>>> a width or height either. Supporting width and height for metadata
>>>> doesn't really make sense for me for metadata.
>>>>
>>>> Explicitly specifying the width and height here indicates that the
>>>> data is basically an array of width x height of some sort which makes
>>>> sense for video devices.
>>>>
>>>> Metadata is more complex data that cannot be represented like that.
>>>> If metadata is actually an array, then I'm not sure I would call it
>>>> metadata, I would probably see it as video with its own pixelformat
>>>> that contains non-video data.
>>>
>>> Let's say the metadata is laid out in a similar way than an image; you have
>>> lines of data, followed by some padding at the end, and a line has length
>>> and a buffer has a number of lines. Sensor metadata falls into this
>>> description.
>>>
>>> Would you then use struct v4l2_pix_format for it, and use
>>> V4L2_BUF_TYPE_VIDEO_CAPTURE for it?
>>
>> Yes. It's still metadata, but it has the same 'format' as video data.
>> We have similar situations such as with v4l-touch devices: the data
>> is formatted like video, but it is actually pressure values from a
>> touch pad. But it is 'video-like' in its behavior.
>>
>>>
>>> That would make a few things easier but this is still metadata, not video
>>> data. Albeit I guess it's not important to be so strict about that
>>> interface-wise, indeed this is not a bad fit for such metadata. Still some
>>> fields such as colourspace and quantisation are not relevant, but that
>>> holds also for some pixel formats.
>>>
>>
>> So are you OK with setting width and height to 0 for MEDIA_BUS_FMT_METADATA_*?
> 
> One more question.
> 
> What do you do if a link can carry both metadata (as in
> V4L2_BUF_TYPE_METADATA_CAPTURE) as well as pixel data, but with a fixed
> format?
> 
> I'm not sure we have any such case at the moment but it's not
> inconceivable.
> 

This should be reflected in the mediabus format. So METADATA_FIXED if it carries
metadata, or a video format if it carries video. Userspace could configure this
with VIDIOC_SUBDEV_S_FMT if it is something that userspace can actually change.

Regards,

	Hans
