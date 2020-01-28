Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DD2A714B116
	for <lists+linux-media@lfdr.de>; Tue, 28 Jan 2020 09:47:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725959AbgA1Irt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Jan 2020 03:47:49 -0500
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:42873 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725879AbgA1Irs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Jan 2020 03:47:48 -0500
Received: from [IPv6:2001:983:e9a7:1:6d16:ffdc:f7c6:fc6f]
 ([IPv6:2001:983:e9a7:1:6d16:ffdc:f7c6:fc6f])
        by smtp-cloud7.xs4all.net with ESMTPA
        id wMX9iIoYkrNgywMXCiShaY; Tue, 28 Jan 2020 09:47:46 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1580201266; bh=zsZ23T0yizz0IYOVWOZiX2msSNRRWXrfdJvBnFGECWI=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=lJIhX869O3CwbGYTgExssJ8JRG50kLhXbIv6zfQ6CwduZPbsIN2uDmHKSBdAK09xy
         UzB3x0CA4d2Q5oUWqM5cvmMsZSHlgCRgf8hR7NXQA5O8bnV5z7BjEgYOS4PoX/EVBL
         h2JnjtbsSeXhoLq7yQbukm7F73e5eFZJ4YS4N5eWatWz2ySey1G9eZsyZcQ88K7zRt
         MFkPWPiTYkg7YbKgNcWowyfBHP3SUKIHJqOs5SxSeEoN6lcmwwxBc86IkV3ecpC3u7
         9Gdes9MmPtt3a5M2V5e+ZalciOuJPmTqjOIif3KmU924WT408g1mDWruACvyMWbTAs
         hxEPEtmWW1h+g==
Subject: Re: [RFC][PATCH 13/15] videobuf2: do not sync buffers for DMABUF
 queues
To:     Tomasz Figa <tfiga@chromium.org>
Cc:     Sergey Senozhatsky <senozhatsky@chromium.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Pawel Osciak <posciak@chromium.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20191217032034.54897-1-senozhatsky@chromium.org>
 <20191217032034.54897-14-senozhatsky@chromium.org>
 <2d0e1a9b-6c5e-ff70-9862-32c8b8aaf65f@xs4all.nl>
 <20200122050515.GB49953@google.com>
 <57f711a0-6183-74f6-ab24-ebe414cb6881@xs4all.nl>
 <CAAFQd5Dbw=B7kb-p8nkPN3GxwL0O-5q=y1HRAVUVOwv4eEAv-Q@mail.gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <84606676-9b24-5feb-0451-7db0527da3f0@xs4all.nl>
Date:   Tue, 28 Jan 2020 09:47:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAAFQd5Dbw=B7kb-p8nkPN3GxwL0O-5q=y1HRAVUVOwv4eEAv-Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfOciQBP+VSXqRJdF55dcRHxvsSaKepY4n6NTV5Ab1qk06A8yXGHwjj4M5sh3TVcBt3ea5jpADtBE3JdxB52R6Zwg7OIm4NkxPYiuMJxu8tG4nzTh0m4V
 okuYHQldwnhIdQ1ydKvbviaqmGDAWzvlfMUYFcHroXszxlrwCu4ZA1hxePTILAYcxLdcLnuNy+1QAimguvx9PEHoEaiOKfS64CZvl+T69SyPYVR3yTcO3gZR
 p/MQflRIKSM9MOAXscdUKZWVr3I1asJTiod+LEi4ehYbX4D53Z+mbanwlEtB3Mwi8eUbxaRfeKXcmyvBn6NnNx6blsckfOogj5ewlv0v7wj9++1BspjH2bOV
 LOMqgUF5z8LT5a/pQZNeS20dHifIqwC8KD8aEy3vkEVqLqAVSyp+M1NkRigHJohhqFYzsmMCWjZRstfd9ExfYTnE33Ktqi3Eq++4K4EFANN1qsgCdRQGcfIk
 MLoDGQza2tF+gCSrAbw2r5bFunUu6SCm+jfazrnjIanvqDD417cAqJGtuMpPVWMWlCWhFvyCGrs24+R/kECEBz7FtJI0KPlRc/sL1COfYo8TBywJEkWkKiuH
 rzN00FwD//Ytm9KPViK6+n5y86YiUyR3G3j40t2lO4zW2w==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 1/28/20 8:19 AM, Tomasz Figa wrote:
> On Thu, Jan 23, 2020 at 8:35 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>>
>> On 1/22/20 6:05 AM, Sergey Senozhatsky wrote:
>>> On (20/01/10 11:30), Hans Verkuil wrote:
>>> [..]
>>>>> diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
>>>>> index 1762849288ae..2b9d3318e6fb 100644
>>>>> --- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
>>>>> +++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
>>>>> @@ -341,8 +341,22 @@ static void set_buffer_cache_hints(struct vb2_queue *q,
>>>>>                                struct vb2_buffer *vb,
>>>>>                                struct v4l2_buffer *b)
>>>>>  {
>>>>> -   vb->need_cache_sync_on_prepare = 1;
>>>>> +   /*
>>>>> +    * DMA exporter should take care of cache syncs, so we can avoid
>>>>> +    * explicit ->prepare()/->finish() syncs.
>>>>> +    */
>>>>> +   if (q->memory == VB2_MEMORY_DMABUF) {
>>>>> +           vb->need_cache_sync_on_finish = 0;
>>>>> +           vb->need_cache_sync_on_prepare = 0;
>>>>> +           return;
>>>>> +   }
>>>>>
>>>>> +   /*
>>>>> +    * For other ->memory types we always need ->prepare() cache
>>>>> +    * sync. ->finish() cache sync, however, can be avoided when queue
>>>>> +    * direction is TO_DEVICE.
>>>>> +    */
>>>>> +   vb->need_cache_sync_on_prepare = 1;
>>>>
>>>> I'm trying to remember: what needs to be done in prepare()
>>>> for a capture buffer? I thought that for capture you only
>>>> needed to invalidate the cache in finish(), but nothing needs
>>>> to be done in the prepare().
>>>
>>> Hmm. Not sure. A precaution in case if user-space wrote to that buffer?
>>
>> But whatever was written in the buffer is going to be overwritten anyway.
>>
>> Unless I am mistaken the current situation is that the cache syncs are done
>> in both prepare and finish, regardless of the DMA direction.
>>
>> I would keep that behavior to avoid introducing any unexpected regressions.
>>
> 
> It wouldn't be surprising if the buffer was first filled with default
> values (e.g. all zeroes) on the CPU. That would make the cache lines
> dirty and they could overwrite what the device writes. So we need to
> flush (aka clean) the write-back caches on prepare for CAPTURE
> buffers.

Very true, I'd forgotten about that. This should be documented in the userspace
documentation. And possible in this function as well.

I think these issues are complex enough that there is no such things as too
much documentation :-)

> 
>> Then, if q->allow_cache_hint is set, then default to a cache sync (cache clean)
>> in the prepare for OUTPUT buffers and a cache sync (cache invalidate) in the
>> finish for CAPTURE buffers.
> 
> I'd still default to the existing behavior even if allow_cache_hint is
> set, because of what I wrote above. Then if the userspace doesn't ever
> write to the buffers, it can request no flush/clean by setting the
> V4L2_BUF_FLAG_NO_CACHE_CLEAN flag when queuing the buffer.
> 
>>
>> This also means that any drivers that want to access a buffer in between the
>> prepare...finish calls will need to do a begin/end_cpu_access. But that's a
>> separate matter.
> 
> AFAIR with current design of the series, the drivers can opt-in for
> userspace cache sync hints, so by default even if the userspace
> requests sync to be skipped, it wouldn't have any effect unless the
> driver allows so. Then I'd imagine migrating all the drivers to
> request clean/invalidate explicitly. Note that the DMA-buf
> begin/end_cpu_access isn't enough here. We'd need something like
> vb2_begin/end_cpu_access() which also takes care of syncing
> inconsistent MMAP and USERPTR buffers.

I did just that in my old git branch for this:

https://git.linuxtv.org/hverkuil/media_tree.git/log/?h=vb2-cpu-access

Regards,

	Hans

> 
>>
>> Regards,
>>
>>         Hans
>>
>>>
>>> +     if (q->dma_dir == DMA_FROM_DEVICE)
>>> +             q->need_cache_sync_on_prepare = 0;
>>>
>>> ?
>>>
>>>       -ss
>>>
>>

