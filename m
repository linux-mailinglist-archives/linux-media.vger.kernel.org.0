Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 172D83D0ECA
	for <lists+linux-media@lfdr.de>; Wed, 21 Jul 2021 14:27:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237206AbhGULpB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Jul 2021 07:45:01 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:46547 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231680AbhGULpA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Jul 2021 07:45:00 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id 6BI6mheQn2bXB6BI7mDvh4; Wed, 21 Jul 2021 14:25:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1626870336; bh=+DztvelO/yPgK1wYCM6vfTtwlapzEajeVBirBtT85+c=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=owxEOz2JVJgHnjkVvoTs0ZPVyBWgG5pUAKJFHmx4IliqUiSgkpouY0yQPGjH79l7B
         6fPNBIphMzRitU28Rwb+ELlVPfQzjpqC8aPlU2SKgyI+VMKo5QdCwxHs0mlL/BpqKD
         x+b51h4N598k2n/dItwCZQ40Sab4MrMVrohkLPuydwq0Y2s2nuHv4z5sgY6YxmXSaV
         Z0OISIqcZ3V3haA1QHaM83x2iXNkLedUfVXvHKiimwE82eYIlO9PbT6R2Ypka0vb0X
         YvwhZA5H0RG/tezrRNn9ON4/XW8jWjJsN3Tse4Tz1GIXED4THpNfHlMf0uZx3F382Y
         cAd972MIu4Csw==
Subject: Re: [PATCH] media: em28xx: fix corrupted list
To:     Pavel Skripkin <paskripkin@gmail.com>
Cc:     mchehab@kernel.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        syzbot+a6969ef522a36d3344c9@syzkaller.appspotmail.com
References: <20210706145025.25776-1-paskripkin@gmail.com>
 <c6bb9cd0-2a8d-99c3-a14d-51c6364ba92d@xs4all.nl>
 <20210721152154.6b1a4e68@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <7df1705e-b2c7-ddfc-9cc5-582fb1a304e5@xs4all.nl>
Date:   Wed, 21 Jul 2021 14:25:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210721152154.6b1a4e68@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfFspLPSmV4+1cSenxF+ojR+5K7O9bPy1mqfVyHs2olKwfYvYxD4Rdd97Aro2hIHocUBs1rPVdp1Yy8OyRLlc3WMeL35CVpzrb7KAzztJO9tVzsTUqivi
 V9TRKA2XkfMAvd4BM5IEaYeyD40us2PmzTESWvHK0oH53Apu1wzAtXqgvePfnzDXGtvLt6K87F35093hBCZglltkhoj4T8zcE32m2gxq6AJoM6ln6BLI6uWf
 Pkz5+LFNUMx1lcVmP72RT00JWIwQPzf09DT6PvVclQEVU8pQlhu0gayqXJI7/vI6eSKrj/Tbm0SaFdwU7ShT3EWGB3OsGZOUS3N86L2+wH53qZ3qofr61JTj
 umKG5WezCpcQUw5Boq3x+dCwn1HONCW6pdcl96Oo4uez+vZoyi2f4umFN1uVGPZHU8r373ukViiKWTy8MLKcvP1KlO6L6yJmEHZg1Fmrrh5X+dYcESsM8Ozl
 583KWzwLX0Ubwq0x
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 21/07/2021 14:21, Pavel Skripkin wrote:
> On Tue, 20 Jul 2021 14:13:13 +0200
> Hans Verkuil <hverkuil@xs4all.nl> wrote:
> 
>> On 06/07/2021 16:50, Pavel Skripkin wrote:
>>> Syzbot reported corrupted list in em28xx driver. The problem was in
>>> non-reinitialized lists on disconnect. Since all 2 lists are global
>>> variables and driver can be connected and disconnected many times we
>>> should call INIT_LIST_HEAD() in .disconnect method to prevent
>>> corrupted list entries.
>>>
>>> Fixes: 1a23f81b7dc3 ("V4L/DVB (9979): em28xx: move usb probe code
>>> to a proper place") Reported-by:
>>> syzbot+a6969ef522a36d3344c9@syzkaller.appspotmail.com
>>> Signed-off-by: Pavel Skripkin <paskripkin@gmail.com> ---
>>>  drivers/media/usb/em28xx/em28xx-cards.c | 2 ++
>>>  drivers/media/usb/em28xx/em28xx-core.c  | 6 ++++++
>>>  drivers/media/usb/em28xx/em28xx.h       | 1 +
>>>  3 files changed, 9 insertions(+)
>>>
>>> diff --git a/drivers/media/usb/em28xx/em28xx-cards.c
>>> b/drivers/media/usb/em28xx/em28xx-cards.c index
>>> ba9292e2a587..8b1ff79c37a0 100644 ---
>>> a/drivers/media/usb/em28xx/em28xx-cards.c +++
>>> b/drivers/media/usb/em28xx/em28xx-cards.c @@ -4148,6 +4148,8 @@
>>> static void em28xx_usb_disconnect(struct usb_interface *intf)
>>> dev->dev_next = NULL; }
>>>  	kref_put(&dev->ref, em28xx_free_device);
>>> +
>>> +	em28xx_reset_lists();
>>>  }
>>>  
>>>  static int em28xx_usb_suspend(struct usb_interface *intf,
>>> diff --git a/drivers/media/usb/em28xx/em28xx-core.c
>>> b/drivers/media/usb/em28xx/em28xx-core.c index
>>> 584fa400cd7d..03970ed00dba 100644 ---
>>> a/drivers/media/usb/em28xx/em28xx-core.c +++
>>> b/drivers/media/usb/em28xx/em28xx-core.c @@ -1131,6 +1131,12 @@
>>> void em28xx_init_extension(struct em28xx *dev)
>>> mutex_unlock(&em28xx_devlist_mutex); }
>>>  
>>> +void em28xx_reset_lists(void)
>>> +{
>>> +	INIT_LIST_HEAD(&em28xx_devlist);
>>> +	INIT_LIST_HEAD(&em28xx_extension_devlist);
>>
>> This needs a mutex_lock(&em28xx_devlist_mutex);
>>
>> But actually, I don't think this is right: if there are multiple
>> em28xx devices, then I think if you disconnect one, then the other is
>> - with this code - also removed from the list.
>>
>> Can you give a link to the actual syzbot bug? I'm not at all sure you
>> are fixing the right thing here.
> 
> Hi, Hans!
> 
> I guess, I missed my coffee that morning, sorry :) This patch looks
> complety wrong, of course.
> 
> I've took a close look at this bug one more time, and I found the true
> root case of this bug.
> 
> If em28xx dev has dev_next pointer we need to close dev->next extension
> on disconnect to avoid UAF and corrupted list bug. So, something like
> this should work:
> 
> diff --git a/drivers/media/usb/em28xx/em28xx-cards.c b/drivers/media/usb/em28xx/em28xx-cards.c
> index c1e0dccb7408..d56b040e1bd7 100644
> --- a/drivers/media/usb/em28xx/em28xx-cards.c
> +++ b/drivers/media/usb/em28xx/em28xx-cards.c
> @@ -4139,8 +4139,10 @@ static void em28xx_usb_disconnect(struct usb_interface *intf)
>  
>  	em28xx_close_extension(dev);
>  
> -	if (dev->dev_next)
> +	if (dev->dev_next) {
>  		em28xx_release_resources(dev->dev_next);
> +		em28xx_close_extension(dev->dev_next);
> +	}
>  	em28xx_release_resources(dev);
>  
>  	if (dev->dev_next) {
> 
> How to You feel about it? I am going to send this patch for syzbot
> testing

That looks a lot saner :-)

> 
> 
> Syzbot link:
> https://syzkaller.appspot.com/bug?id=3609bbf45bf63a8f6032f330eb3d34f51cc81493
> 
> 
> Again, sorry for v1 patch, I don't know how I came up with this fix :(

No problem, just post a v2 if syzbot passes.

Regards,

	Hans

>  
> 
> 
> With regards,
> Pavel Skripkin
> 

