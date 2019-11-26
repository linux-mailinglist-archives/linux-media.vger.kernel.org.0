Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7C7DB10A0F7
	for <lists+linux-media@lfdr.de>; Tue, 26 Nov 2019 16:10:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727586AbfKZPKi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Nov 2019 10:10:38 -0500
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:38337 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727418AbfKZPKi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Nov 2019 10:10:38 -0500
Received: from [IPv6:2001:420:44c1:2577:f03d:3627:b74f:a4d0]
 ([IPv6:2001:420:44c1:2577:f03d:3627:b74f:a4d0])
        by smtp-cloud8.xs4all.net with ESMTPA
        id ZcU3iaZJEksqeZcU7iYfh5; Tue, 26 Nov 2019 16:10:35 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1574781035; bh=y76WVidUlXSx+713+kBnOamFxobos7oe0CF4cgTQRfA=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=JWjARITxSzrlT4oLVfCBlCwlMHkqI+8GTpLfUdncPI9+6RynoEaPsH8S4x/rq5BK/
         Juz73MzLmg9+A5lIxJbdq0RKWIzA2otWqdaeyMe/n0VnUI8pa8e4UWVGHfUbrofYFz
         Bw3ZDvihsSY9c+aN0yYNSfssLwHAh6x7/dOsgPAv4x76wM4Oo4SHwgJ9hG3RHoEZVj
         iZS1y+ES/YE189QBXI3NtM8eKdaBjUh/KjP4y4MVPbmfG2+MFbRJom1pb/MOusALgH
         u2pX9ou3Nf9sMkf+rtFlYCCmkyokGMlgL6VQgv7flcGflnbQJaa+nyaJLdj+GID0lt
         7Ub4xoH3e8ygw==
Subject: Re: [PATCH v4 5/8] media: v4l2-core: fix VIDIOC_DQEVENT for time64
 ABI
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        y2038 Mailman List <y2038@lists.linaro.org>
References: <20191111203835.2260382-1-arnd@arndb.de>
 <20191111203835.2260382-6-arnd@arndb.de>
 <272c471b-a7a9-c830-e19b-d1f19ee47073@xs4all.nl>
 <CAK8P3a3vHWBJU6EiUbRKJ01Zsv5E5Yfr+=h2Dg95atjvaHZ+Rg@mail.gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <15a1a26c-b3ad-7449-4508-1207527ab21f@xs4all.nl>
Date:   Tue, 26 Nov 2019 16:10:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAK8P3a3vHWBJU6EiUbRKJ01Zsv5E5Yfr+=h2Dg95atjvaHZ+Rg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfHXt42Xzu9yCtqJYE8yF9vBBOgW++AEDzbz1qafByFrqdrJjYY+s40cEl6BhSegiY/e+BkoYZpFdFKmksrSqAwfu31sbBDUrVDotPgAHFTDMsOAhje8l
 8K36RqGQOrk/fpiqNFgTlgJbN6RjDFMgv+Hw8F9SeBge6c1mhJtlqTHZU8czBMdgmQHOdJGf1R1yDQWisUDxLglxV9DXwBMbP9DnecaN6mjAJSXdcxLfNta0
 LPy04FeAgrYLzsT/49OeXL+co0z2auN/Znm+72wikI88jF5pZ4kqWyxUWxBDinYjrAiQqHzKlCwNNqZIz3hSvb9IVydkdb12pD6wb4zUKMQy1eBOFKd00kWV
 iUs8Q2HjkFa4eN4x64mXK+Y0Rs+rb3Ton5HrsxrStl8eyL3NpWMONNpRfErU+P+i8ZpKGTL8
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 11/26/19 3:43 PM, Arnd Bergmann wrote:
> On Mon, Nov 25, 2019 at 3:40 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>> On 11/11/19 9:38 PM, Arnd Bergmann wrote:
> 
>>>       switch (cmd) {
>>> +#ifdef CONFIG_COMPAT_32BIT_TIME
>>> +     case VIDIOC_DQEVENT_TIME32: {
>>> +             struct v4l2_event_time32 ev32;
>>> +             struct v4l2_event *ev = parg;
>>> +
>>> +             memcpy(&ev32, ev, offsetof(struct v4l2_event, timestamp));
>>> +             ev32.timestamp.tv_sec = ev->timestamp.tv_sec;
>>> +             ev32.timestamp.tv_nsec = ev->timestamp.tv_nsec;
>>> +             memcpy(&ev32.id, &ev->id, sizeof(*ev) - offsetof(struct v4l2_event, id));
>>
>> This looks dangerous: due to 64-bit alignment requirements the
>> v4l2_event struct may end with a 4-byte hole at the end of the struct,
>> which you do not want to copy to ev32.
>>
>> I think it is safer to just copy id and reserved separately:
>>
>>                 ev32.id = ev->id;
>>                 memcpy(ev32.reserved, ev->reserved, sizeof(ev->reserved));
> 
> Actually I think it's that's also bad: The padding in *ev must already be
> cleared here (otherwise there is a leak of stack data in the kernel
> already), so  *not* copying the padding requires at least adding a memset
> upfront.
> 
> I would do the per-member copy like I did for v4l2_buffer in my
> other reply:
> 
>                 struct v4l2_event *ev = parg;
>                 struct v4l2_event_time32 ev32 = {
>                         .type           = ev->type,
>                         .pending        = ev->pending,
>                         .sequence       = ev->sequence,
>                         .timestamp.tv_sec  = ev->timestamp.tv_sec,
>                         .timestamp.tv_nsec = ev->timestamp.tv_nsec,
>                         .id             = ev->id,
>                 };
> 
>                 memcpy(ev32.u, ev->u, sizeof(ev->u));
>                 memcpy(ev32.reserved, ev->reserved, sizeof(ev->reserved));
> 
>                 if (copy_to_user(arg, &ev32, sizeof(ev32)))
>                         return -EFAULT;
> 
> Unfortunately this is a little uglier because it still requires the two
> memcpy() for the arrays, but I think it's good enough.

I agree.

Hmm, can't you do .u = ev->u ? Or is that not allowed by this syntax?

> 
> Any other ideas? Let me know if I should do a memset()
> plus individual member copy instead.

I think we have to, unless you have a better solution. This is leaking
information from the holes in the struct.

>>> +             if (!(sd->flags & V4L2_SUBDEV_FL_HAS_EVENTS))
>>> +                     return -ENOIOCTLCMD;
>>> +
>>> +             rval = v4l2_event_dequeue(vfh, &ev, file->f_flags & O_NONBLOCK);
>>> +
>>> +             memcpy(ev32, &ev, offsetof(struct v4l2_event, timestamp));
>>> +             ev32->timestamp.tv_sec = ev.timestamp.tv_sec;
>>> +             ev32->timestamp.tv_nsec = ev.timestamp.tv_nsec;
>>> +             memcpy(&ev32->id, &ev.id,
>>> +                    sizeof(ev) - offsetof(struct v4l2_event, id));
>>
>> Ditto.
> 
> Using the corresponding code here as well.
> 
>>> +
>>>  #define V4L2_EVENT_SUB_FL_SEND_INITIAL               (1 << 0)
>>>  #define V4L2_EVENT_SUB_FL_ALLOW_FEEDBACK     (1 << 1)
>>>
>>> @@ -2486,6 +2515,7 @@ struct v4l2_create_buffers {
>>>  #define      VIDIOC_S_DV_TIMINGS     _IOWR('V', 87, struct v4l2_dv_timings)
>>>  #define      VIDIOC_G_DV_TIMINGS     _IOWR('V', 88, struct v4l2_dv_timings)
>>>  #define      VIDIOC_DQEVENT           _IOR('V', 89, struct v4l2_event)
>>> +#define      VIDIOC_DQEVENT_TIME32    _IOR('V', 89, struct v4l2_event_time32)
>>
>> Shouldn't this be under #ifdef __KERNEL__?
>>
>> And should this be in the public header at all? media/v4l2-ioctl.h might be a better
>> place.
> 
> Done.
> 
>        Arnd
> 

Regards,

	Hans
