Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB7713A5E04
	for <lists+linux-media@lfdr.de>; Mon, 14 Jun 2021 10:01:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232557AbhFNIDL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Jun 2021 04:03:11 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:54765 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232520AbhFNIDJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Jun 2021 04:03:09 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id shWjlak7ahqltshWmllraP; Mon, 14 Jun 2021 10:01:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1623657662; bh=qYegCn8bghApdRTOt7yc45P5rLD/KRziiVFVMHXr67Y=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=hJ9bVRxMgJzr6+rxmZE0wKabQivXopaWVmbU/JuEh4uJC5x8yMBSwVCqegwxvETkw
         D5qTCR0orRpXCaweRdWbcy/ch4yDgrl0DaM1+HqtlPbGMgNTDAmLMe+DYGsxdJLbGL
         Y9otO90gVNSXutow/m1C4EuaKacHUoV8SfB5O5mrZfmKine3WrSnWK4pvOfbBJonzB
         jQjsJ+q00xPRqhXeEL/7tMOM4fJtSQnwqe5XAAoquF6Dbe5F+VjHuowEFwNII4/x7r
         ZdFpUfEuMgGM5uazhtZiOwgF2wfNoYaCKk3cToVjcO2O8LUpl69GzllprzhAGI1qAa
         DyqifWV6fH8zg==
Subject: Re: [PATCH v2 2/7] media: v4l2-core: explicitly clear ioctl input
 data
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
        Eduardo Valentin <edubezval@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Vaibhav Gupta <vaibhavgupta40@gmail.com>,
        Liu Shixin <liushixin2@huawei.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-staging@lists.linux.dev
References: <20210610214305.4170835-1-arnd@kernel.org>
 <20210610214305.4170835-3-arnd@kernel.org>
 <a59eeddd-34bb-6b84-06b3-9fb1934d447e@xs4all.nl>
 <CAK8P3a2XbiU9SdafUapKABXJes8C5roLGKynL5LnGfTN3n=Evw@mail.gmail.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <8ba91833-5388-8534-45d8-f7ae5d701d5a@xs4all.nl>
Date:   Mon, 14 Jun 2021 10:00:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <CAK8P3a2XbiU9SdafUapKABXJes8C5roLGKynL5LnGfTN3n=Evw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfL8VRkDlHn8BdQLCWBk3xRLr6A7ruzmSa24cuWe51M8NmzkwNYBBBRAqRQRoWYknQ5+EoavBBZjNKv8jDg+XCiu/c++GsGc0JWkjXZKeNHzpeSv4XggZ
 loCL9V6Iv5p5zXaTynQ2bZV0kmRn3eEYztQrkIVsTh/SahK5jaRTf5ar8OWvjggtNK0pzbayUovWRYypDGCUlpbXGO9EVK1hwbEtqji3OFFgTF3c9w2Yiivc
 EtaafQiQUomvVt6l7DCoQrBFiHcQasPBBpA1Ri1/K0xqSDnlfmVGKg5RILD5RwboJOlIpgdHYGtooPCCvtDxZ/h4TkbSKx3KEBNDIdNCoYRfogT3Dt1JDeAe
 /ADbgt7YJ5V/GQLsdxYDPqymCNJ3GcXlBPlRp5I0zZrdpVzPX6LT3IJsLImU7zMeds+JqVZb3NsloW/8US7lsimRJhWyWSjOEabnplR89zGpaGDp2VjJglO2
 KjlruMzKp03tkz4jPHbAss7GNncrY1KjcZNR7SOw0H1aDz05k6SNm6ruKCya9ZL8RAmoAZKSoSDkV3LLXPu8D2GlvftIPGFMhNoOyKONxlULS1gxLuXZWuv9
 qdhlx03YuXHTY5+zZjdZhjNE7yHlFUsiqjPd1P4Fd5RHm84QjnGJ3bLXYZcu+WaIESYh3uzgm9ss7Hws8CkzYPoQMGdhiUJIPuZGzr1u1wAOtXn095E9sILR
 B8VXLJPCK7w=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Arnd,

On 11/06/2021 17:22, Arnd Bergmann wrote:
> On Fri, Jun 11, 2021 at 2:05 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>> On 10/06/2021 23:43, Arnd Bergmann wrote:
>>> @@ -3122,12 +3122,23 @@ static int video_get_user(void __user *arg, void *parg,
>>>
>>>       if (cmd == real_cmd) {
>>>               if (copy_from_user(parg, (void __user *)arg, n))
>>> -                     err = -EFAULT;
>>> -     } else if (in_compat_syscall()) {
>>> -             err = v4l2_compat_get_user(arg, parg, cmd);
>>> -     } else {
>>> -             switch (cmd) {
>>> +                     return -EFAULT;
>>> +
>>> +             /* zero out anything we don't copy from userspace */
>>> +             if (n < _IOC_SIZE(real_cmd))
>>> +                     memset((u8 *)parg + n, 0, _IOC_SIZE(real_cmd) - n);
>>
>> This should always happen, not just when cmd == real_cmd.
> 
> Ok, got it. I was trying to simplify this, but I went a little too far, so
> in the case of VIDIOC_QUERYBUF_TIME32 I dropped the final
> clearing of the extra data, leaving the user data in place.
> 
>> The comment is a bit misleading: besides zeroing what isn't copied from
>> userspace, it also zeroes copied fields based on INFO_FL_CLEAR_MASK.
> 
> I'm not following here, isn't that the same? We copy 'n' bytes, and then we
> clear 'size - n' bytes, which is everything that wasn't copied.
> 
>> With this change that no longer happens and v4l2-compliance starts complaining.
>>
>>> +
>>> +             return 0;
>>> +     }
>>> +
>>> +     /* zero out whole buffer first to deal with missing emulation */
>>> +     memset(parg, 0, _IOC_SIZE(real_cmd));
>>> +
>>> +     if (in_compat_syscall())
>>> +             return v4l2_compat_get_user(arg, parg, cmd);
>>> +
>>>  #if !defined(CONFIG_64BIT) && defined(CONFIG_COMPAT_32BIT_TIME)
>>> +     switch (cmd) {
>>>               case VIDIOC_QUERYBUF_TIME32:
>>>               case VIDIOC_QBUF_TIME32:
>>>               case VIDIOC_DQBUF_TIME32:
>>
>> The 'case' statements need to be indented one tab less.
> 
> It seems this is no longer needed when I go back to having the switch()
> inside the else{}.
> 
>>> @@ -3140,28 +3151,24 @@ static int video_get_user(void __user *arg, void *parg,
>>>
>>>                       *vb = (struct v4l2_buffer) {
>>>                               .index          = vb32.index,
>>> -                                     .type           = vb32.type,
>>> -                                     .bytesused      = vb32.bytesused,
>>> -                                     .flags          = vb32.flags,
>>> -                                     .field          = vb32.field,
>>> -                                     .timestamp.tv_sec       = vb32.timestamp.tv_sec,
>>> -                                     .timestamp.tv_usec      = vb32.timestamp.tv_usec,
>>> -                                     .timecode       = vb32.timecode,
>>> -                                     .sequence       = vb32.sequence,
>>> -                                     .memory         = vb32.memory,
>>> -                                     .m.userptr      = vb32.m.userptr,
>>> -                                     .length         = vb32.length,
>>> -                                     .request_fd     = vb32.request_fd,
>>> +                             .type           = vb32.type,
>>> +                             .bytesused      = vb32.bytesused,
>>> +                             .flags          = vb32.flags,
>>> +                             .field          = vb32.field,
>>> +                             .timestamp.tv_sec       = vb32.timestamp.tv_sec,
>>> +                             .timestamp.tv_usec      = vb32.timestamp.tv_usec,
>>> +                             .timecode       = vb32.timecode,
>>> +                             .sequence       = vb32.sequence,
>>> +                             .memory         = vb32.memory,
>>> +                             .m.userptr      = vb32.m.userptr,
>>> +                             .length         = vb32.length,
>>> +                             .request_fd     = vb32.request_fd,
>>
>> Can you put these whitespace changes in a separate patch?
> 
> Sure.
> 
>> I ended up with this code, and then my tests passed:
>>
>>        if (cmd == real_cmd) {
>>                 if (copy_from_user(parg, (void __user *)arg, n))
>>                         return -EFAULT;
>>         } else if (in_compat_syscall()) {
>>                 memset(parg, 0, n);
>>                 err = v4l2_compat_get_user(arg, parg, cmd);
>>         } else {
>> #if !defined(CONFIG_64BIT) && defined(CONFIG_COMPAT_32BIT_TIME)
>>                 memset(parg, 0, n);
>>                 switch (cmd) {
>>                 case VIDIOC_QUERYBUF_TIME32:
>>                 case VIDIOC_QBUF_TIME32:
>>                 case VIDIOC_DQBUF_TIME32:
>>                 case VIDIOC_PREPARE_BUF_TIME32: {
>>                         struct v4l2_buffer_time32 vb32;
>>                         struct v4l2_buffer *vb = parg;
>>
>>                         if (copy_from_user(&vb32, arg, sizeof(vb32)))
>>                                 return -EFAULT;
>>
>>                         *vb = (struct v4l2_buffer) {
>>                                 .index          = vb32.index,
>>                                         .type           = vb32.type,
>>                                         .bytesused      = vb32.bytesused,
>>                                         .flags          = vb32.flags,
>>                                         .field          = vb32.field,
>>                                         .timestamp.tv_sec       = vb32.timestamp.tv_sec,
>>                                         .timestamp.tv_usec      = vb32.timestamp.tv_usec,
>>                                         .timecode       = vb32.timecode,
>>                                         .sequence       = vb32.sequence,
>>                                         .memory         = vb32.memory,
>>                                         .m.userptr      = vb32.m.userptr,
>>                                         .length         = vb32.length,
>>                                         .request_fd     = vb32.request_fd,
>>                         };
>>                         break;
>>                 }
>>                 }
>> #endif
>>         }
>>
>>         /* zero out anything we don't copy from userspace */
>>         if (!err && n < _IOC_SIZE(real_cmd))
>>                 memset((u8 *)parg + n, 0, _IOC_SIZE(real_cmd) - n);
>>
>>         return err;
> 
> Ok, so this version just adds the two memset(), without any other
> changes. That is clearly the safest change, and I'll send it like this
> in v3.
> 
>> That said, I also ran the regression tests on a i686 VM, and there I got a
>> bunch of failures, but that was *without* your patches, so I think something
>> unrelated broke. I'll have to dig more into this in the next few days.
>>
>> But I wanted to get this out first, since this patch is clearly wrong.
> 
> Thanks a lot for taking a look and giving it an initial test. I have
> updated the git tree at
> 
> git://git.kernel.org:/pub/scm/linux/kernel/git/arnd/playground.git
> playground/v4l2-compat-ioctl
> 
> with the changes you pointed out. Let me know when you have found
> out what was going on in the VM guest, and I'll send it as v3 or integrate
> additional fixes that you find necessary.

Please post v3: one issue I had turned out to be due to a misconfiguration
causing some of the tests to run out of memory.

The other issue is with the X32 ABI: that is currently failing, with or
without your series. I'm not sure why yet, from what I remember this worked fine
last time I tested. But my memory may be faulty, since it is so long ago.

Regards,

	Hans

> 
>      Arnd
> 

