Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B70F910A123
	for <lists+linux-media@lfdr.de>; Tue, 26 Nov 2019 16:24:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728466AbfKZPYO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Nov 2019 10:24:14 -0500
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:34971 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728451AbfKZPYO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Nov 2019 10:24:14 -0500
Received: from [IPv6:2001:420:44c1:2577:f03d:3627:b74f:a4d0]
 ([IPv6:2001:420:44c1:2577:f03d:3627:b74f:a4d0])
        by smtp-cloud8.xs4all.net with ESMTPA
        id ZchEiaf9pksqeZchHiYk5M; Tue, 26 Nov 2019 16:24:12 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1574781852; bh=4gxx5oTkKbDKoObq38O2EkaB3+LM3MYuZWGfE12bztI=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=Lc/4Sx56axK2WoXAa9kSEXqJgNkssOO05yJtLwFjv/G5nVhg+vrHm59EpCRZCfNH3
         BIGK3FbPhUciQ3CS1TggZVniP5N6jf1eN+vL8rdnCaW/+UJeKL4kVdLNbraG95DxgO
         trt/ul9AmFzII5hOwcQFLKjPXQxFCjcwEQ4MuEa4JkRxowZHY2LiBYo9WXNmcgxaW0
         Abreiv+23VCw3PdGbOud8jvRgmraT9Awtp2tEYxc5wXWwE6vt3nzKajnbPyojjthPs
         CamxbPoYDMu4Zomus4ifPcA1B7IJJib9ngkDGO5QZeS4nGpOHYewt0U0tNQ98qoitP
         x93PodJhbf8SQ==
Subject: Re: [PATCH v4 6/8] media: v4l2-core: fix v4l2_buffer handling for
 time64 ABI
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        y2038 Mailman List <y2038@lists.linaro.org>
References: <20191111203835.2260382-1-arnd@arndb.de>
 <20191111203835.2260382-7-arnd@arndb.de>
 <d54c82b5-21b7-2d5e-ad0b-206527ad2768@xs4all.nl>
 <CAK8P3a0rom6x4X8eH0zknfZ5=6_rrXGKGR4H+RiY4SWKbXfp=g@mail.gmail.com>
 <2271665b-f890-802f-eba8-0da43867d81f@xs4all.nl>
 <CAK8P3a35r0hEnjKOc8LQRr+v3xo-kxWQ5VhxZoT=tjQHcs4-yA@mail.gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <c06ea07c-953a-e512-3d2b-3672d804cc82@xs4all.nl>
Date:   Tue, 26 Nov 2019 16:24:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAK8P3a35r0hEnjKOc8LQRr+v3xo-kxWQ5VhxZoT=tjQHcs4-yA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfMo8e49wZQjSzKPBuJzZYMQbg0THdf3vb6M4bv+ZyNrhexmkDoUtkp5lsqIC8STnw+F/uRir3VtGq4S3HqH33jiKOoe9BsYavqmBRHmpDQ2B7ff1kjPH
 4uRSQw7upy035u9l59Qiby3ZQpYxhSxOR0Kl5dwRAboikyZbpBHUR7hfm64xb2qK60yZJu6rB0KegZh12nTKvXbL1g88JZal3rzFiFbUTiROaClcuSqt9qfg
 9n1MX87+MQ2qbSdSQkldxzi7JTiJFBAX5c+eohEkD13hV82V4B3H8a+92W3R6Mcl2HC7G8m/waAIdjrMmGUOPDeu7sgv6P9KgSfARgP1xm/1v6OMlTsGQADr
 smoRbOW7/CCeJhzxAY58SI87t+uGQDi8j1jnjsD9+nPkbIjedYB6DC6awtbafkY7PmCcn1OH
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 11/26/19 4:17 PM, Arnd Bergmann wrote:
> On Tue, Nov 26, 2019 at 3:15 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>>
>> Then use that in the struct v4l2_buffer definition:
>>
>> struct v4l2_buffer {
>> ...
>> #ifdef __KERNEL__
>>         struct __kernel_v4l2_timeval timestamp;
>> #else
>>         struct timeval               timestamp;
>> #endif
>>
>> That keeps struct v4l2_buffer fairly clean. And it also makes it
>> possible to have a bit more extensive documentation for the
>> struct __kernel_v4l2_timeval without polluting the actual struct
>> v4l2_buffer definition.
> 
> Yes, good idea. I've added this version now:
> 
> #ifdef __KERNEL__
> /*
>  * This corresponds to the user space version of timeval
>  * for 64-bit time_t. sparc64 is different from everyone
>  * else, using the microseconds in the wrong half of the
>  * second 64-bit word.
>  */
> struct __kernel_v4l2_timeval {
>         long long       tv_sec;
> #if defined(__sparc__) && defined(__arch64__)
>         int             tv_usec;
>         int             __pad;
> #else
>         long long       tv_usec;
> #endif
> };
> #endif
> 
> I briefly considered using #else #define __kernel_v4l2_timeval timeval
> to avoid the second #ifdef, but went back to your version again
> for clarify.
> 
>> The videodev2.h header is something users of the API look at a
>> lot and having this really ugly kernel timestamp in there is
>> not acceptably IMHO. But splitting it off should work.
> 
> Do you also mean moving it into a separate header file, or
> just outside of struct v4l2_buffer? Since it's hidden in #ifdef
> __KERNEL__, it could be moved to media/ioctl.h or elsewhere.

I've thought about that, but that risks having to change drivers
since they would now have to include another header to get the
right timeval definition. In the end I don't think it is worth the
effort.

I think it is best to define __kernel_v4l2_timeval just before
the struct v4l2_requestbuffers definition rather than before the
struct v4l2_buffer. That way it doesn't interfere with the
userspace structs for the buffer API.

Regards,

	Hans

> 
>       Arnd
> 

