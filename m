Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 092AF109D31
	for <lists+linux-media@lfdr.de>; Tue, 26 Nov 2019 12:44:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728174AbfKZLn5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Nov 2019 06:43:57 -0500
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:53155 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725884AbfKZLn4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Nov 2019 06:43:56 -0500
Received: from [IPv6:2001:420:44c1:2577:f03d:3627:b74f:a4d0]
 ([IPv6:2001:420:44c1:2577:f03d:3627:b74f:a4d0])
        by smtp-cloud7.xs4all.net with ESMTPA
        id ZZG2iFikrjpCOZZG5i5L5F; Tue, 26 Nov 2019 12:43:54 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1574768634; bh=x+Jz7Gw9Z56QjWtxcvTqZ2nl9dKf/bTGLBWhIEL58tA=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=iopaX69/0VPqEa4BZDcUQAxi7obAZeMk5JiECTBCmJ3q1vEPpW4pGOKTKm3poQVla
         YVwgMV4OeZxU57Yfl3sRt0vVDFEHMHEn4x0RCItVstWSq2cu6r6i15O2H30Y0OJ4Wl
         74u6vJiPQfaYvT5gxN9JrXF/E4lApzdLMQkOOWVN9TYEnRPa7y5ag/3PEp1hBUsCgQ
         FO3JG16XIcvwCdcS+c2oj1he1/nvnJcW0siZquclY79e0MzLKAQ94Z2DPJPkGWN8no
         2+wVrZpI84ybFm/FFzEB9/hYSSk7ciyUiFma7K3HK6Rezjlq4Ty6gYOmCNZlkJLzlf
         0gW/ia30S38gQ==
Subject: Re: [PATCH v4 2/8] media: v4l2: abstract timeval handling in
 v4l2_buffer
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        y2038 Mailman List <y2038@lists.linaro.org>
References: <20191111203835.2260382-1-arnd@arndb.de>
 <20191111203835.2260382-3-arnd@arndb.de>
 <00fea162-508a-b6e1-84ba-1472a94f6945@xs4all.nl>
 <CAK8P3a3dhruU1k9XtVHZsfmTxt+jL5Pf8jhT77+vce5p=h9U8w@mail.gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <efdeef8a-5ce7-bbe5-8def-e4eec31f13ab@xs4all.nl>
Date:   Tue, 26 Nov 2019 12:43:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAK8P3a3dhruU1k9XtVHZsfmTxt+jL5Pf8jhT77+vce5p=h9U8w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfBOkbCwWInD2lFTX8p0nyKnZ+84lQbHuBNnKSS7ohtfK2pNi8snslujQh22RvKH/ZnI1cM+HH8j9SRwHmAUNQdEJCQRYyF3Eb8d5d0lLaiTyFrSIOxkm
 2bUPlWaTXPuM/pSVctOsG//utMZnszVP61cjKjWyRA5+9Y818sTACZPP1X2J4HCakhlh0kvXzVvxLCsFy6Qqj92rG9vzT3OyQhrDTJGLtX2khu8Du8Arxb43
 wcIwM44ZNj5ZSmJ7ZYhJc0pHLxUiCCK6nM9epVRAyBTpmMa4vTs5tJ0pBzmHJWboMvJ7/5Fh5U1Gpbr3rFpBlEIOxpwtiPbV+8ldW30z2thkLp+Q+bsoGPVH
 DjmOlV/93i1+54lOC5o5vMnD1vTBo8DHGiXHGxVgxQAKQu1HepboJ2Ih+ZAxA7pP8H3uTTi5
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 11/26/19 12:34 PM, Arnd Bergmann wrote:
> On Mon, Nov 25, 2019 at 4:52 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>>
>> On 11/11/19 9:38 PM, Arnd Bergmann wrote:
>>> As a preparation for adding 64-bit time_t support in the uapi,
>>> change the drivers to no longer care about the format of the
>>> timestamp field in struct v4l2_buffer.
>>>
>>> The v4l2_timeval_to_ns() function is no longer needed in the
>>> kernel after this, but there may be userspace code relying on
>>> it because it is part of the uapi header.
>>
>> There is indeed userspace code that relies on this.
> 
> Ok, good to know. I rephrased the changelog text as
> 
> The v4l2_timeval_to_ns() function is no longer needed in the
> kernel after this, but there is userspace code relying on
> it to be part of the uapi header.
> 
>>>
>>> +static inline u64 v4l2_buffer_get_timestamp(const struct v4l2_buffer *buf)
>>> +{
>>> +     return buf->timestamp.tv_sec * NSEC_PER_SEC +
>>> +            (u32)buf->timestamp.tv_usec * NSEC_PER_USEC;
>>
>> Why the (u32) cast?
> 
> Simple question, long answer:
> 
> on 32-bit architectures, the tv_usec member may be 32-bit wide plus
> padding in user space when interpreted as a regular 'struct timeval',
> but the kernel implementation now sees it as a 64-bit member,
> with half of it being possibly uninitialized user space data.
> 
> The 32-bit cast avoids that uninitialized data and ensures user space
> passing garbage in the upper half gets ignored, as it has to be on 32-bit
> user space.

But that's only valid for little endian 32 bit systems, right?
Is this only an issue for x86 platforms?

> 
> On 64-bit native user space, the tv_usec field is always 64 bit wide,
> so this is a change in behavior for denormalized timeval data
> with tv_usec > U32_MAX, but the current behavior does not appear
> worth preserving either.
> 
> The correct way would probably be to return an error for
>  tv_usec >USEC_PER_SEC, but as the code never did that, this
> would risk a regression for user space that relies on passing
> invalid timestamps without getting an error.

This long answer needs to be added to a comment to that function.
Because otherwise someone will come along later and remove that
seemingly unnecessary cast.

It's OK if it is a long comment, it's a non-trivial reason.

> 
>>> +static inline void v4l2_buffer_set_timestamp(struct v4l2_buffer *buf,
>>> +                                          u64 timestamp)
>>> +{
>>> +     struct timespec64 ts = ns_to_timespec64(timestamp);
>>> +
>>> +     buf->timestamp.tv_sec  = ts.tv_sec;
>>> +     buf->timestamp.tv_usec = ts.tv_nsec / NSEC_PER_USEC;
>>> +}
>>> +
>>
>> This does not belong in the public header. This is kernel specific,
> 
> Note: this is not the uapi header but the in-kernel one.

Ah, I missed that.

> 
>> so media/v4l2-common.h would be a good place.
> 
> Ok, sounds good. I wasn't sure where to put it, and ended up
> with include/linux/videodev2.h as the best replacement for
> include/uapi/linux/videodev2.h, changed it to
> include/media/v4l2-common.h now.

Never use include/linux/videodev2.h. It's just a wrapper around
the uapi header and should not contain any 'real' code.

It's also why I missed that you modified that header since we never
touch it.

Regards,

	Hans

> 
>        Arnd
> 

