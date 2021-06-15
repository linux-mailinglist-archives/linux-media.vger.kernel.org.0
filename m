Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D372F3A795B
	for <lists+linux-media@lfdr.de>; Tue, 15 Jun 2021 10:48:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231238AbhFOIuq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Jun 2021 04:50:46 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:54841 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231140AbhFOIuq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Jun 2021 04:50:46 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id t4kPlaCxehg8Zt4kSlNcGd; Tue, 15 Jun 2021 10:48:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1623746920; bh=D88kM9ujQnj7i6N2VtCVDveR3oNFRtRf3kQMUegjoOY=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=RoDFXps+qdleYy8lyM1bfRBgw55Wc8mmvnvFTYabcQxXNhc6EgsIV0QIl4LMIngJg
         18Q69dfHk6x6r5lTHEnVaorCpGS2TLk4tPoOHG0Zk6tS+YI1wgTIsFRSfkzWi11rGv
         kmL+GS9BIFVDgMvA83oVit4OM+AM4AA7SaBGQcIbwTyRyG9kkOrEIycGQ5Tij9nuK6
         OCS/FJQnlGcNVXSNWSQfFk7yqpgShz2jcZgOyJ0NJ5fWjoTsorzBvBJT8i+q550i/1
         hSOE/FopapBa2hdzCqj3z2hQeu1jEWpFJLjTPK0Wa0CbhLjdDJTxYpx52WCnSacc0c
         HmrRbRzYqNefQ==
Subject: Re: [PATCH v3 4/8] media: subdev: remove VIDIOC_DQEVENT_TIME32
 handling
To:     Arnd Bergmann <arnd@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
        Eduardo Valentin <edubezval@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Vaibhav Gupta <vaibhavgupta40@gmail.com>,
        Liu Shixin <liushixin2@huawei.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-staging@lists.linux.dev
References: <20210614103409.3154127-1-arnd@kernel.org>
 <20210614103409.3154127-5-arnd@kernel.org>
 <YMeLlvALJ5nJbQGg@pendragon.ideasonboard.com>
 <CAK8P3a1+cWFn8=xyGwZ0c7fWr6+tdEF_sXtMpPCZypDBA_UryA@mail.gmail.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <e3162d4c-d40d-442d-39a0-c99c4328932e@xs4all.nl>
Date:   Tue, 15 Jun 2021 10:48:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <CAK8P3a1+cWFn8=xyGwZ0c7fWr6+tdEF_sXtMpPCZypDBA_UryA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfN/I5tImLjHpNtcaqdywVyPqnbBXHwMUARNNSLJLLpsafX3RZVkyBXIqhE5VrbPhGSVsT11Y1grZyLi7DWT/v/XfD6PfPWpcofMBkN3e3hKe7kluqypy
 dTsp+RC9/ERks6JrZax++ykUJia7E7UN/X1w7jbkP7PGsodbkZUUALiwUrdaLLPYpUg/97oJI4boX2/fCNahCIy/O5BLrCMq2Iv3jc8KldjWYv1aIzvDi20S
 0WuMDlyAdSt+7iTtWsrr/wsZAF5KjmOJY3ZPX0MavCzJ5PtnlVwW2ri+POQ6Iy8E8PLdbXmkfzz2LDoKD1K7UqcWVsxtZ65iKfXXAnPWhgEh3sw4WxuuFt7S
 c4u1h/d5Tehv43EUGGLEIY7RrKu1VNDFu6v2ccNhQ1XIeCM0GufBM4e68qGQtJSuLI7sSZdx3FLqRKAU04SAzWeynOn8rNlaEaykd+dbq3U2RZd5nKjmPXGD
 hh4yYPKoNxphYw9rdFHe6Cph7boYgj5K8iHOvztjszBwUgS7+wFEex8n+m3ude7rNTEkOLU9wAv8wTuUKRCH6G9/eEQZWCsjxZi+qnFKVZ5ZcKDr7cL/z+0d
 5LBrhhWy1/QzLPUuFqP1XjIGo+Dyem86XEXxb/HQ8Z9iG2YLj4OR1MVbivD7O9tzrrc4vOH4d8mUhlQapJiMZFvsJAeKNVySl0SYgcwsebzObFSF2a7Lin/B
 jGqiT5BNkrA=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 15/06/2021 10:43, Arnd Bergmann wrote:
> On Mon, Jun 14, 2021 at 7:02 PM Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
>>
>> On Mon, Jun 14, 2021 at 12:34:05PM +0200, Arnd Bergmann wrote:
>>> From: Arnd Bergmann <arnd@arndb.de>
>>>
>>> Converting the VIDIOC_DQEVENT_TIME32/VIDIOC_DQEVENT32/
>>> VIDIOC_DQEVENT32_TIME32 arguments to the canonical form is done in common
>>> code, but for some reason I ended up adding another conversion helper to
>>> subdev_do_ioctl() as well. I must have concluded that this does not go
>>> through the common conversion, but it has done that since the ioctl
>>> handler was first added.
>>>
>>> I assume this one is harmless as there should be no way to arrive here
>>> from user space, but since it is dead code, it should just get removed.

I changed this to:

"I assume this one is harmless as there should be no way to arrive here
from user space if CONFIG_COMPAT_32BIT_TIME is set,"

If it is not set, then this will just fall into the default case and is
handled as if it is a potential custom ioctl, as you would expect.

Let me know if you have a better text, I can still update it.

Regards,

	Hans

>>
>> If I'm not mistaken, this could be reached when
>> !CONFIG_COMPAT_32BIT_TIME, can't it ? Still, there's no need for this
>> code in that case, so it seems fine to me.
> 
> Yes, that is correct, I missed that condition. We definitely should not handle
> the command in that case.
> 
> Hans, since you mentioned you would pick up this patch, I assume  you
> are going to reword the patch as you see fit. If you prefer me to resend it,
> let me know.
> 
>        Arnd
> 

