Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09B413DA47F
	for <lists+linux-media@lfdr.de>; Thu, 29 Jul 2021 15:40:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237681AbhG2NlA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Jul 2021 09:41:00 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:59043 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237608AbhG2Nk7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Jul 2021 09:40:59 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id 96HOmVGdWXTlc96HPmWvER; Thu, 29 Jul 2021 15:40:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1627566055; bh=SKtdJbFBroNlyJ9v4WHCSY4r7YiyKHukivZf1WxfNk4=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=Sl73bZnWpPWVEnfzn/LHTcccUXHS2NlSDxUDFDdMCdnQ7ph/vmwm9m4OKL5bc2wLm
         BbClShtuWe4nm7qq7lkEpep72EFdHBGGcdZK2hnt01H3naZD84XVZPtq0JcGhH3V7+
         7Kyzk7bbZs2kMTp0axhbWxcTwZ4+ydQWPxS098aWg8bOeROZpIyz0TICMnTcWxo+YH
         8vsKsiRQcZnHIE2KEzYXSpCfdL23l/ZnE8l1njH0ugE7Jx6msyQdeR+HCznZBiTnoN
         q6c7Dj/W3hcgSSaH/JYqHal1aDnQlZqGNmzOcbmIdHDPPnbYaRde85BmMJdTPQgGde
         bQV7PU0YcV8Vg==
Subject: Re: [PATCH v2] media: em28xx: add missing em28xx_close_extension
To:     Pavel Skripkin <paskripkin@gmail.com>
Cc:     mchehab@kernel.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        syzbot+a6969ef522a36d3344c9@syzkaller.appspotmail.com
References: <7df1705e-b2c7-ddfc-9cc5-582fb1a304e5@xs4all.nl>
 <20210721194307.12155-1-paskripkin@gmail.com>
 <3b1de658-ebf0-e45f-49ef-953e3467e7d4@xs4all.nl>
 <20210729154556.6e257405@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <aa8b3e18-7903-9380-d0d6-2303d09110fe@xs4all.nl>
Date:   Thu, 29 Jul 2021 15:40:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210729154556.6e257405@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfOels+rWNGJsd3s1FgjYI5bgbUtAhGJnJzP4SYHlnrOYc0yuTc2XOpM2sV8FufbBeMYt6VY+dY8Cn07Cs9I4/IB8cb79M4I3PX4mzieq3aFKB7RRV4iF
 jDiLRNF2sLIykgHLOUKa5OTWD2WGTY8wZZhLZtkHuaipr3AhpW4jcCwMPZ0UoC1ODLuxjfeoIiwaqxTmTBEWOLZF3Oh6GJgDm1LVdY0GLWx0oxLhjofgqgkF
 pJCdiRTaxNSbPRbtjUgF8GtOEzx26xbAmMzbwR64sQOc3ba8bCfMWKGeP16NXQeYytnoLYBuw1p/ka2bixyN+EDeOhGO3qGBh8mbxPCizbUQtJA7TJRJzR6z
 pfGh+X/r6yDXgfg6MdqDKmxHxvIb1v5tHCTyXnTYKY3f4uLIZS6FPcpxwVGuzDtu5KKRsCycwlh1XmIDYc7Fvhs8TUvZKgCau5/nPlrkuWoZEFjGddBAQfs3
 eova3epiX1UysxPv
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 29/07/2021 14:45, Pavel Skripkin wrote:
> On Thu, 29 Jul 2021 11:45:19 +0200
> Hans Verkuil <hverkuil@xs4all.nl> wrote:
> 
>> On 21/07/2021 21:43, Pavel Skripkin wrote:
>>> If em28xx dev has ->dev_next pointer, we need to delete dev_next
>>> list node from em28xx_extension_devlist on disconnect to avoid UAF
>>> bugs and corrupted list bugs, since driver frees this pointer on
>>> disconnect.
>>>
>>> Fixes: 1a23f81b7dc3 ("V4L/DVB (9979): em28xx: move usb probe code
>>> to a proper place") Reported-and-tested-by:
>>> syzbot+a6969ef522a36d3344c9@syzkaller.appspotmail.com
>>> Signed-off-by: Pavel Skripkin <paskripkin@gmail.com> ---
>>>
>>> Changes in v2:
>>> 	Previous patch was completely broken. I've done some
>>> debugging again and found true root case of the reported bug.
>>>
>>> ---
>>>  drivers/media/usb/em28xx/em28xx-cards.c | 4 +++-
>>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/media/usb/em28xx/em28xx-cards.c
>>> b/drivers/media/usb/em28xx/em28xx-cards.c index
>>> c1e0dccb7408..d56b040e1bd7 100644 ---
>>> a/drivers/media/usb/em28xx/em28xx-cards.c +++
>>> b/drivers/media/usb/em28xx/em28xx-cards.c @@ -4139,8 +4139,10 @@
>>> static void em28xx_usb_disconnect(struct usb_interface *intf) 
>>>  	em28xx_close_extension(dev);
>>>  
>>> -	if (dev->dev_next)
>>> +	if (dev->dev_next) {
>>>  		em28xx_release_resources(dev->dev_next);
>>> +		em28xx_close_extension(dev->dev_next);
>>
>> Wouldn't it be better to swap these two?
>>
>> That order is also used for em28xx_close_extension(dev) and
>> em28xx_release_resources(dev).
>>
>> You do need to store dev->dev_next in a temp variable, though.
>>
> 
> Hi, Hans!
> 
> I don't understand why I need to store dev->dev_next in a temp
> variable. I don't see code in em28xx_release_resources() or
> em28xx_close_extension() that zeroes this pointer.

Apologies for the confusion, just ignore that bit. I misunderstood
what dev_next was for.

So check if swapping these two lines passes syzbot, and then that's
the final version.

Regards,

	Hans

> 
> 
> 
> With regards,
> Pavel Skripkin
> 
> 

