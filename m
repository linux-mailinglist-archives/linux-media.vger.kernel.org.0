Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5BD1A11E69A
	for <lists+linux-media@lfdr.de>; Fri, 13 Dec 2019 16:33:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727917AbfLMPdD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Dec 2019 10:33:03 -0500
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:53611 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727831AbfLMPdC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Dec 2019 10:33:02 -0500
Received: from [IPv6:2001:983:e9a7:1:c93c:45bd:1710:e478]
 ([IPv6:2001:983:e9a7:1:c93c:45bd:1710:e478])
        by smtp-cloud9.xs4all.net with ESMTPA
        id fmw6iifUIGyJwfmw7i1f6C; Fri, 13 Dec 2019 16:33:00 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1576251180; bh=jkbeBwA2046yQAx8KlSre92+P3gjbk24eJvaxr1q7Sw=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=hwgBk3mN8ggB5kEqpKJ3+Bxt4aYRPHwJNzv3tE42xLEz3JbSQnMaIqStabHcCeyaW
         vhCnhGk1Y6DG40aT3PD9fYpGFjeJqONeLLE7HyJMl4uD92wnNg1ddSauBqx3nfIwvP
         kJo3o4c/201KZfyv8k4JBi2JpFKYrk3qZIbtBaDbPnSN30plQOZvcVeQbSuAEpdT0a
         PJZf9iSkbKpiIO8JX+U+cvODhkBF1B5UbGUMchXG/HHbjni4WLXyBCsVV5GfePiIJa
         tH13SI6xL1zW4ruQYnWsMxbPtiSX+pQaA0oMr/mlmgEvtD5BV1189tWfMbF1IFJCHH
         mhwdfsP7LETVQ==
Subject: Re: [PATCH v5 6/8] media: v4l2-core: fix v4l2_buffer handling for
 time64 ABI
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        y2038 Mailman List <y2038@lists.linaro.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20191126161824.337724-1-arnd@arndb.de>
 <20191126161824.337724-7-arnd@arndb.de>
 <09c664fd-87fb-4fac-f104-9afbe7d33aa2@xs4all.nl>
 <CAK8P3a1TvFCJf8t9T1yOXjsp088s9dbEOKLVDPinfwJe2B-27g@mail.gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <81bb5da1-6b84-8473-4ada-c174f43bbae2@xs4all.nl>
Date:   Fri, 13 Dec 2019 16:32:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAK8P3a1TvFCJf8t9T1yOXjsp088s9dbEOKLVDPinfwJe2B-27g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfGVkJKKS1g0cyyV9cuBt4eBAaOVFkxlUfInP+p/AL+8d83IvSqATu4yY7i2PPlvfXOprcRiGJGwZ5dqVKbwe/rc81RkqyKRbMGV813thRftzAAjN7Wxz
 pAtFXN0qxurHtCQNyEOS+ky5iXZhn2z/KJnZc/fK+C6/YXCSBs+WHHgMGjqrYDBrMOeni7pKAX6a4jf5Hi0DlrL/ezCvREw5tr16bc0BEv/aCi2Hb5q9YYGh
 D3qEe/V7CHGH+iJWPAtpKeKMt8RemG2tpm3swpIpkrQkkwm/sasSuD2G8AE3/I0oxbGHGxpKuHgZp+cuB3v2uMXl/CS5yPWFp6mSRRbE4aWDcwfqBHpj266C
 tszlIurXT9o6U3HhhKMF44dsZvmL56YUhirLv7TIMB+Kc65vuZo=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 12/13/19 4:08 PM, Arnd Bergmann wrote:
> On Thu, Dec 12, 2019 at 4:43 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>>
>> On 11/26/19 5:18 PM, Arnd Bergmann wrote:
>>>
>>>       switch (cmd) {
>>> +#ifdef COMPAT_32BIT_TIME
>>
>> COMPAT_32BIT_TIME -> CONFIG_COMPAT_32BIT_TIME
> 
> Fixed.
> 
>>> +             *vb = (struct v4l2_buffer) {
>>> +                     .index          = vb32.index,
>>> +                     .type           = vb32.type,
>>> +                     .bytesused      = vb32.bytesused,
>>> +                     .flags          = vb32.flags,
>>> +                     .field          = vb32.field,
>>> +                     .timestamp.tv_sec       = vb32.timestamp.tv_sec,
>>> +                     .timestamp.tv_usec      = vb32.timestamp.tv_usec,
>>> +                     .timecode       = vb32.timecode,
>>
>> You forgot to copy sequence.
>>
>>> +                     .memory         = vb32.memory,
>>> +                     .m.userptr      = vb32.m.usercopy,
>>
>> usercopy -> userptr
> 
> Fixed.
> 
>>> +                     .length         = vb32.length,
>>> +                     .request_fd     = vb32.request_fd,
>>> +             };
>>> +
>>> +             if (cmd == VIDIOC_QUERYBUF_TIME32)
>>> +                     memset(&vb->length, 0, sizeof(*vb) -
>>> +                            offsetof(struct v4l2_buffer, length));
>>
>> It's from the field AFTER vb->length that this needs to be zeroed. It's best to
>> use the CLEAR_AFTER_FIELD macro here.
> 
> I'm a bit lost about this one: the fields that are not explicitly
> uninitialized here are already set to zero by the assignment
> above. Should this simply be a
> 
>                 if (cmd == VIDIOC_QUERYBUF_TIME32)
>                        vb->request_fd = 0;

Yes, you are correct. That's much simpler.

> 
> then? I don't remember where that memset() originally came
> from or why request_fd has to be cleared here.
> 
>>> @@ -3100,6 +3141,30 @@ static int video_put_user(void __user *arg, void *parg, unsigned int cmd)
>>>                       return -EFAULT;
>>>               break;
>>>       }
>>> +     case VIDIOC_QUERYBUF_TIME32:
>>> +     case VIDIOC_QBUF_TIME32:
>>> +     case VIDIOC_DQBUF_TIME32:
>>> +     case VIDIOC_PREPARE_BUF_TIME32: {
>>> +             struct v4l2_buffer *vb = parg;
>>> +             struct v4l2_buffer_time32 vb32 = {
>>> +                     .index          = vb->index,
>>> +                     .type           = vb->type,
>>> +                     .bytesused      = vb->bytesused,
>>> +                     .flags          = vb->flags,
>>> +                     .field          = vb->field,
>>> +                     .timestamp.tv_sec       = vb->timestamp.tv_sec,
>>> +                     .timestamp.tv_usec      = vb->timestamp.tv_usec,
>>> +                     .timecode       = vb->timecode,
>>
>> You forgot to copy sequence.
> 
> Fixed.
> 
>> With these changes this patch series passed both the 64 and 32 bit compliance
>> tests (in fact, all the issues mentioned above were found with these compliance
>> tests).
> 
> Yay compliance tests!
> 
>> I am unable to test with musl since v4l2-ctl and v4l2-compliance are C++ programs,
>> and there doesn't appear to be an easy way to compile a C++ program with musl.
>>
>> If you happen to have a test environment where you can compile C++ with musl,
>> then let me know and I can give instructions on how to run the compliance tests.
>>
>> If you can't test that, then I can merge this regardless, and hope for the best
>> once the Y2038 fixes end up in glibc. But ideally I'd like to have this tested.
> 
> I've heard good things about the prebuilt toolchains from http://musl.cc/.
> These seems to come with a libstdc++, but I have not tried that myself.

I'll see if I can give those a spin, but if I can't get it to work quickly,
then I don't plan on spending much time on it.

Regards,

	Hans

> 
> I've folded the change below into this patch in my y2038-v4l2-v6 branch
> but have not been able to update the copy on git.kernel.org yet because of
> server-side issues today.
> 
>           Arnd
> 
> 8<-----
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c
> b/drivers/media/v4l2-core/v4l2-ioctl.c
> index c416870a3166..667225712343 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -3055,7 +3055,7 @@ static int video_get_user(void __user *arg, void
> *parg, unsigned int cmd,
>         }
> 
>         switch (cmd) {
> -#ifdef COMPAT_32BIT_TIME
> +#ifdef CONFIG_COMPAT_32BIT_TIME
>         case VIDIOC_QUERYBUF_TIME32:
>         case VIDIOC_QBUF_TIME32:
>         case VIDIOC_DQBUF_TIME32:
> @@ -3075,15 +3075,15 @@ static int video_get_user(void __user *arg,
> void *parg, unsigned int cmd,
>                         .timestamp.tv_sec       = vb32.timestamp.tv_sec,
>                         .timestamp.tv_usec      = vb32.timestamp.tv_usec,
>                         .timecode       = vb32.timecode,
> +                       .sequence       = vb32.sequence,
>                         .memory         = vb32.memory,
> -                       .m.userptr      = vb32.m.usercopy,
> +                       .m.userptr      = vb32.m.userptr,
>                         .length         = vb32.length,
>                         .request_fd     = vb32.request_fd,
>                 };
> 
>                 if (cmd == VIDIOC_QUERYBUF_TIME32)
> -                       memset(&vb->length, 0, sizeof(*vb) -
> -                              offsetof(struct v4l2_buffer, length));
> +                       vb->request_fd = 0;
> 
>                 break;
>         }
> @@ -3155,6 +3155,7 @@ static int video_put_user(void __user *arg, void
> *parg, unsigned int cmd)
>                         .timestamp.tv_sec       = vb->timestamp.tv_sec,
>                         .timestamp.tv_usec      = vb->timestamp.tv_usec,
>                         .timecode       = vb->timecode,
> +                       .sequence       = vb->sequence,
>                         .memory         = vb->memory,
>                         .m.userptr      = vb->m.userptr,
>                         .length         = vb->length,
> 

