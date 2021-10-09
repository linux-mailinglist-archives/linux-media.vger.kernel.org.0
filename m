Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 221AF427D42
	for <lists+linux-media@lfdr.de>; Sat,  9 Oct 2021 22:19:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230052AbhJIUUy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 9 Oct 2021 16:20:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229806AbhJIUUx (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 9 Oct 2021 16:20:53 -0400
Received: from bombadil.infradead.org (unknown [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 544ADC061570;
        Sat,  9 Oct 2021 13:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=OdxynBMvMWIJFcPB8GGPc5a3zX/bgG/GY3urYIWqlq4=; b=PohPH2FbWggj4HpbO17djBxK7l
        9M0zKr6izo5jGkvEZEqFhmJ/IdL+XOM1Zte5RoXcT1AAexeKXuVdOw2YbbvSC7Y1JxS64U5Q8pp2u
        rZMsRFUjJy4eRrFpaHANTn0fZvaOrReiDgZZIy0wEymnZWy4pUWd5E/KOyyjmmGuqP5qvE08DKt4l
        /bR0j1LYmdrZ6mCEWIHhqitcyP9O+NP1a9zbCj128yaD8UiimthSeRKvU5QLApIGbYnz3zD6j0/2h
        G5MErc8XoGD5rIG0QY6tTGBXjYWNr69ZiwhfP1mJCvO5KfvhFbHodH0FuWQ1UMOPIBdjzjBdkD4kE
        vIWTnufg==;
Received: from [2601:1c0:6280:3f0::aa0b]
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mZInz-0062rz-Ru; Sat, 09 Oct 2021 20:18:51 +0000
Subject: Re: [PATCH v5] Driver for ON Semi AR0521 camera sensor
To:     Jacopo Mondi <jacopo@jmondi.org>,
        =?UTF-8?Q?Krzysztof_Ha=c5=82asa?= <khalasa@piap.pl>,
        "joe@perches.com" <joe@perches.com>
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <m3fstfoexa.fsf@t19.piap.pl>
 <YV3YkXAKxiLmPYwL@valkosipuli.retiisi.eu> <m3zgrlkxn6.fsf@t19.piap.pl>
 <20211009090749.hujuwamgkjw2tfcx@uno.localdomain>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <a8bd12e5-cdb5-ee85-d0a9-03ede990f5d2@infradead.org>
Date:   Sat, 9 Oct 2021 13:18:50 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211009090749.hujuwamgkjw2tfcx@uno.localdomain>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 10/9/21 2:07 AM, Jacopo Mondi wrote:
> Hi Krzysztof,
> 
>     I've been testing this driver in the last few days, thanks for your
> effort in upstreaming it!
> 
> I'll separately comment on what I had to change to have it working for
> my use case, but let me continue the discussion from where it was left
> pending here to add my 2 cents.
> 
> On Thu, Oct 07, 2021 at 11:11:09AM +0200, Krzysztof Hałasa wrote:
>> Hi Sakari,
>>
>> Thanks for your input.
>>
>>> Where's the corresponding DT binding patch? Ideally it would be part of the
>>> same set.
>>
>> Well I've sent it a moment before this one. Will make them a set next
>> time.
>>
>>>> +#define AR0521_WIDTH_BLANKING_MIN     572u
>>>> +#define AR0521_HEIGHT_BLANKING_MIN     28u // must be even
>>>
>>> Please use /* */ for comments. The SPDX tag is an exception.
>>
>> As far as I know, this is no longer the case, the C99 comments are now
>> permitted and maybe even encouraged. Or was I dreaming?
>>
>> checkpatch doesn't protest either.
> 
> To my understanding the C99 standard added support for the //
> commenting style and tollerate them, but they're still from C++ and I
> see very few places where they're used in the kernel, and per as far I
> know they're still not allowed by the coding style
> https://www.kernel.org/doc/html/latest/process/coding-style.html#commenting

http://lkml.iu.edu/hypermail/linux/kernel/1607.1/00627.html

Maybe we should update coding-style then.

> 
> Looking at how you used comments in the driver I think you could get
> rid of most // comments easily, the register tables might be an
> exception but I would really try to remove them from there as well.
> 
> 
>>
>>> Please wrap your lines at 80 or earlier, unless a sound reason exists to do
>>> otherwise.
>>
>> This limitation appears to be lifted as well, after all those years.
>> Is there a specific reason to still use it here? Yes, lines longer than
>> 80 chars make the code much more readable (for my eyes, at least).
>> Yes, I know there is some "soft" limit, and I trim lines when it makes
>> them better in my opinion.
>>
> 
> In my personal opinion lifting that restriction caused more pain than
> anything, as different subsystem are now imposing different
> requirements. Here everything has been so far pretty strict about
> going over 80-cols, but I think there are situation where it makes
> sense in example
> 

[snip]

> 
> My suggestion is: aim to 80 cols whenever possible, if it forces you
> to do things like the above shown function declaration you can go a
> little over that

Yes, 80 max is still preferred. Up to 100 may be tolerable in some
cases.

> As reported here
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=bdc48fa11e46f867ea4d75fa59ee87a7f48be144
> if you go over 100 you should ask yourself what are you doing :)




-- 
~Randy
