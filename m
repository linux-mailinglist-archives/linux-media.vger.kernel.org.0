Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 541B1163FEC
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2020 10:04:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726260AbgBSJEc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Feb 2020 04:04:32 -0500
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:37241 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726163AbgBSJEc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Feb 2020 04:04:32 -0500
Received: from [192.168.2.10] ([46.9.235.248])
        by smtp-cloud7.xs4all.net with ESMTPA
        id 4LHOjzaYoP9a94LHRjnck7; Wed, 19 Feb 2020 10:04:29 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1582103069; bh=awI5pcolTUc0dIRN7RtZluGyjY51sqg70SkWPn5V+Qc=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=erm3ELrqsQaRKYifwM8QyDXEp5mSi+S38r6kId5G0cKhVbJsO4ykrRSaP7MLj3T7B
         kLZtAuLTQIR/0HM0AQONzJYBPi0CP+39MNVW6m/Rvt08PrG1FxyhmzztcOtZ30WjFn
         76UkubCkzkT0kD8CiQ4hFl2SKse+/eanTeZjKn3ItJZSeedSOXFRso77xWhvxIjkUY
         VkwYmR79J3/EHfWeTQK4MWUgK4UNHR7ApQwYG7wyoHtOdkHXb53/2OEE8XfOzXaWmD
         wZj9imX5pVtjB+atSAm5DkV9/jGjFLmIgDobt03jzcG9yiN5ZZBl1J+Q+1txc9be9L
         g7q4kK14ssmYg==
Subject: Re: [RFC][PATCHv2 05/12] videobuf2: handle
 V4L2_FLAG_MEMORY_NON_CONSISTENT flag
To:     Sergey Senozhatsky <senozhatsky@chromium.org>
Cc:     Hans Verkuil <hans.verkuil@cisco.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Pawel Osciak <posciak@chromium.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200204025641.218376-1-senozhatsky@chromium.org>
 <20200204025641.218376-6-senozhatsky@chromium.org>
 <7f3310f9-8a12-1299-726d-2ca04207b32c@xs4all.nl>
 <20200219085945.GE122464@google.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <2ec710c4-1471-afe2-abbc-6a499ffadfec@xs4all.nl>
Date:   Wed, 19 Feb 2020 10:04:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200219085945.GE122464@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfD8MOJGsnBhvSaB2qok14JGJWIOOoItvmomDYMBrOFx+X0hwe9sz1Sjkz5SX4UYax1pdDO9wY3evoTCpb6P74vqgxJI7i/mMYMftApR2u3ITNWK8BYE9
 sMMyW+BxYTbigHhb6ZZUNCJZ1feBWIYWzV7OIKYyC9FYg8YKXOPmqqD/J3Zu2wOpE5xB9RC+VSDj5cDfxrDDEt/ganlSHNQh6cwG+xW2m83l8qdbNmHag+X6
 ZKq2xt/ZBBEyvsbKSNJ+x6coIIgx11++nQ2oPhSNKVSfYwCWXW0OEUSpjg+q/LEUKGUFCJU9/78ztlJox3xDcsg9pwMMrKi2v6c4YsK/fwpqoat+kXBU0Zfd
 7Cg4rNtKAweVkUjG5Ksmq3lunIX+6R6gigy8DFEkK/5iiYaPo2O/1jrUQSINkYgrXtrbwffeTzFtRHejaYeLm8oSlEnYxjsLQf+oPcyLDmrZaWBS/FVIq8WM
 09amECDdbh+09SJOEZ+rJxyZ/YTfsFRg+7D2xwRRFkMt0P9doGJ4bu5eTjdH3CyuRAN5c3YC30dEpM9R
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 2/19/20 9:59 AM, Sergey Senozhatsky wrote:
> On (20/02/19 09:25), Hans Verkuil wrote:
> [..]
>>> diff --git a/Documentation/media/uapi/v4l/vidioc-create-bufs.rst b/Documentation/media/uapi/v4l/vidioc-create-bufs.rst
>>> index bd08e4f77ae4..68185e94b686 100644
>>> --- a/Documentation/media/uapi/v4l/vidioc-create-bufs.rst
>>> +++ b/Documentation/media/uapi/v4l/vidioc-create-bufs.rst
>>> @@ -121,7 +121,14 @@ than the number requested.
>>>  	other changes, then set ``count`` to 0, ``memory`` to
>>>  	``V4L2_MEMORY_MMAP`` and ``format.type`` to the buffer type.
>>>      * - __u32
>>> -      - ``reserved``\ [7]
>>> +      - ``flags``
>>> +      - Specifies additional buffer management attributes. Valid only when
>>> +	queue reports :ref:`V4L2_BUF_CAP_SUPPORTS_CACHE_HINTS` capability.
>>> +	Old drivers and applications must set it to zero.
>>
>> Drop the 'Valid only' sentence. The V4L2_FLAG_MEMORY_NON_CONSISTENT depends
>> on that capability, but other flags added in the future may not.
> 
> The whole sentence, right?

Yes, "Valid only ... capability."

> 
>> Inside add a reference to the memory flags section created in patch 3.
> 
> Sorry. Inside?

Oops: Inside -> Instead

> 
> [..]
>>> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
>>> index 72efc1c544cd..169a8cf345ed 100644
>>> --- a/include/uapi/linux/videodev2.h
>>> +++ b/include/uapi/linux/videodev2.h
>>> @@ -938,7 +938,10 @@ struct v4l2_requestbuffers {
>>>  	__u32			type;		/* enum v4l2_buf_type */
>>>  	__u32			memory;		/* enum v4l2_memory */
>>>  	__u32			capabilities;
>>> -	__u32			reserved[1];
>>> +	union {
>>> +		__u32		flags;
>>> +		__u32		reserved[1];
>>> +	};
>>
>> How about this:
>>
>> 	__u8			flags;
>> 	__u8			reserved[3];
>>
>> That avoids the anonymous union and allows some space for future additions.
> 
> Hmm. This way old apps, which clear out ->reserved, e.g.
> memset(&x.reserved, 0x00, sizeof(x.reserved)), won't clear
> out x.flags and can accidentally submit some unintended
> garbage. It's not the case with anon union.

Hmm. I need to think about this some more, so leave in the anon union
for now.

Regards,

	Hans

> 
> 	-ss
> 

