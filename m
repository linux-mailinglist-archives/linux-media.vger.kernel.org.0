Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 43132CEFE7
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2019 02:28:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729612AbfJHA2F (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Oct 2019 20:28:05 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:40611 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729285AbfJHA2E (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Oct 2019 20:28:04 -0400
Received: by mail-wr1-f68.google.com with SMTP id h4so8547590wrv.7;
        Mon, 07 Oct 2019 17:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:subject:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=w+JBUrRhiUQbDzaygs2fgvMicjQUmjOGtRFHB3njrmE=;
        b=MZd5VttPijXxFzVk1TicOZ49zJWo4ZHPTGaxMizeEaVRdcdItqjNBpmvfl1tlSrqiR
         200pLXx6umSubZnGccOLkQC6Iq9lu0d5DCxvI5MwDI97dyAYXiWF2QHvpRX0kwqiO8Lw
         YTas/6lA/plybBkn2SUfH8KfczAl6iXSqbAUI7uxtcyaj9mjPxlY6NCPhqxricBHF0jK
         Ow0nsQqpIs+o5CR4GJy2wfD5O3WNA+mkM7e1Co/WSReVZJZ/J+q8XY7WKOXSl0siIikP
         r41dofptArfYLCHpBWjnFAmJssNYvoZnDGVU8br2FcZvwcvPwFS0EaDtXuBVpeJZGvDK
         eWOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=w+JBUrRhiUQbDzaygs2fgvMicjQUmjOGtRFHB3njrmE=;
        b=XtjHyjsfNndO5tL6Yv/8Z0gFaHrgD3U+Kb/ETbk82a768Xf1Fs7MiI/13AKx/J7CeH
         vawK2JPw+QQoskWEERFUTumu+nJEJ/FFiKDxWmVLpIW0UlQU3Q+f7KXYZPFtLjmemu45
         2d7bzaqNmOyNCH4AxQJKtZteoOknugXwOlYXcY9S6D2ZuKPjnIJxmTuJZF+bxylQpA2q
         a6k966JWwhDoTKBc6iVE7KPeZTxBGAGPPiWe1s+gE8pE/yyvZwd3hgMv0jLnNAJmyaCE
         oqn//4MLF5B3z4lEY+lVHjf1VgHF5kUGxNgQaywHsX02+Tsn3QoyF/zjEj+4k6Cij4A/
         Z0vw==
X-Gm-Message-State: APjAAAWgSmZZhH73tlwIt/YOJCxoPKRrYqLPr3UoQxr6P3fGyGUCOibQ
        g1wYV//iwgUKoCE7OYyVgT901nej
X-Google-Smtp-Source: APXvYqwkfbsKuWqXA0MMV+UkXywV90ZOV3CPC8nDUTLoE5WmtXTI7Kr+OPhfP7NiNUjgYcJMCiFhwA==
X-Received: by 2002:a5d:4b50:: with SMTP id w16mr16529077wrs.82.1570494481328;
        Mon, 07 Oct 2019 17:28:01 -0700 (PDT)
Received: from [172.30.88.146] (sjewanfw1-nat.mentorg.com. [139.181.7.34])
        by smtp.gmail.com with ESMTPSA id y186sm2424952wmd.26.2019.10.07.17.27.58
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 07 Oct 2019 17:28:00 -0700 (PDT)
From:   Steve Longerbeam <slongerbeam@gmail.com>
Subject: Re: [PATCH] media: i2c: adv7180: fix adv7280 BT.656-4 compatibility
To:     Tim Harvey <tharvey@gateworks.com>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>,
        Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Matthew Michilot <matthew.michilot@gmail.com>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20190827215539.1286-1-mmichilot@gateworks.com>
 <cb3e9be4-9ce6-354f-bb7c-a4710edc1c1b@xs4all.nl>
 <20190829142931.GZ28351@bigcity.dyn.berto.se>
 <CAJ+vNU11HTcP8L5J2Xg+Rmhvb8JDYemhJxt-GaGG5Myk3n38Tw@mail.gmail.com>
 <20190927190454.GA7409@bigcity.dyn.berto.se>
 <CAJ+vNU2shAbnLO9TY4dtPupLxE4UFvNi9FXoFF4MfPbtbAZo=g@mail.gmail.com>
 <20190927204340.GB7409@bigcity.dyn.berto.se>
 <CAJ+vNU2=cXvi3f67igJX03rONodaPkuSRPS=x9WPSxwLnOEUvA@mail.gmail.com>
Message-ID: <ece1d3cc-891c-49a5-4639-a5a70385e1a4@gmail.com>
Date:   Mon, 7 Oct 2019 17:27:57 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAJ+vNU2=cXvi3f67igJX03rONodaPkuSRPS=x9WPSxwLnOEUvA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 10/2/19 2:31 PM, Tim Harvey wrote:
> On Fri, Sep 27, 2019 at 1:43 PM Niklas Söderlund
> <niklas.soderlund@ragnatech.se>  wrote:
>> Hi Tim,
>>
>> On 2019-09-27 12:26:40 -0700, Tim Harvey wrote:
>>> On Fri, Sep 27, 2019 at 12:04 PM Niklas Söderlund
>>> <niklas.soderlund@ragnatech.se>  wrote:
>>>> Hi Tim,
>>>>
>>>> Sorry for taking to so long to look at this.
>>>>
>>>> On 2019-09-23 15:04:47 -0700, Tim Harvey wrote:
>>>>> On Thu, Aug 29, 2019 at 7:29 AM Niklas Söderlund
>>>>> <niklas.soderlund@ragnatech.se>  wrote:
>>>>>> Hi,
>>>>>>
>>>>>> On 2019-08-29 13:43:49 +0200, Hans Verkuil wrote:
>>>>>>> Adding Niklas.
>>>>>>>
>>>>>>> Niklas, can you take a look at this?
>>>>>> I'm happy to have a look at this. I'm currently moving so all my boards
>>>>>> are in a box somewhere. I hope to have my lab up and running next week,
>>>>>> so if this is not urgent I will look at it then.
>>>>>>
>>>>> Niklas,
>>>>>
>>>>> Have you looked at this yet? Without this patch the ADV7280A does not
>>>>> output proper BT.656. We tested this on a Gateworks Ventana GW5404-G
>>>>> which uses the ADV7280A connected to the IMX6 CSI parallel bus. I'm
>>>>> hoping to see this get merged and perhaps backported to older kernels.
>>>> I only have access to an adv7180 so I was unable to test this patch.
>>>> After reviewing the documentation I think the patch is OK if what you
>>>> want is to unconditionally switch the driver from outputting BT.656-3 to
>>>> outputting BT.656-4.
>>>>
>>>> As this change would effect a large number of compat strings (adv7280,
>>>> adv7280-m, adv7281, adv7281-m, adv7281-ma, adv7282, adv7282-m) and the
>>>> goal is to back port it I'm a bit reluctant to adding my tag to this
>>>> patch as I'm not sure if this will break other setups.
>>>>
>>>>  From the documentation about the BT.656-4 register (address 0x04 bit 7):
>>>>
>>>>      Between Revision 3 and Revision 4 of the ITU-R BT.656 standards,
>>>>      the ITU has changed the toggling position for the V bit within
>>>>      the SAV EAV codes for NTSC. The ITU-R BT.656-4 standard
>>>>      bit allows the user to select an output mode that is compliant
>>>>      with either the previous or new standard. For further information,
>>>>      visit the International Telecommunication Union website.
>>>>
>>>>      Note that the standard change only affects NTSC and has no
>>>>      bearing on PAL.
>>>>
>>>>      When ITU-R BT.656-4 is 0 (default), the ITU-R BT.656-3
>>>>      specification is used. The V bit goes low at EAV of Line 10
>>>>      and Line 273.
>>>>
>>>>      When ITU-R BT.656-4 is 1, the ITU-R BT.656-4 specification is
>>>>      used. The V bit goes low at EAV of Line 20 and Line 283.
>>>>
>>>> Do you know what effects such a change would bring? Looking at the
>>>> driver BT.656-4 seems to be set unconditionally for some adv7180 chips.
>>>>
>>> Niklas,
>>>
>>> Quite simply, we have a board that has an ADV7180 attached to the
>>> parallel CSI of an IMX6 that worked fine with mainline drivers then
>>> when we revised this board to attach an ADV7280A in the same way
>>> capture failed to sync. Investigation showed that the NEWAVMODE
>>> differed between the two.
>> I understand your problem, the driver configures adv7180 and adv7280
>> differently.
>>
>>> So if the point of the driver is to configure the variants in the same
>>> way, this patch needs to be applied.
>> I'm not sure that is the point of the driver. As the driver today
>> configures different compatible strings differently. Some as ITU-R
>> BT.656-3 and some as ITU-R BT.656-4, I can only assume there is a reason
>> for that.
>>
>>> I would maintain that the adv7180 comes up with NEWAVMODE enabled and
>>> in order to be compatible we must configure the adv7282 the same.
>>>
>>> The same argument can be made for setting the V bit end position in
>>> NTSC mode - its done for the adv7180 so for compatible output it
>>> should be done for the adv7282.
>> I understand that this is needed to make it a drop-in replacement for
>> the adv7180 in your use-case. But I'm not sure it is a good idea for
>> other users of the driver. What if someone is already using a adv7282 on
>> a board and depends on it providing ITU-R BT.656-3 and the old settings?
>> If this patch is picked up there use-cases may break.
>>
>> I'm not sure what the best way forward is I'm afraid. Looking at
>> video-interfaces.txt we have a device tree property bus-type which is
>> used to describe the bus is a BT.656 bus but not which revision of it.
>>
>> I'm not really found of driver specific bus descriptions, but maybe this
>> is a case where one might consider adding one? Hans what do you think?
>>
> Niklas / Hans,
>
> Thanks for the feedback. I thought that the goal of any 'compatible'
> device should be to be configured identically. If that's not the case
> then we need more discussion for sure.
>
> There are 3 registers being changed by this patch which do the
> following for the adv7182/adv7280/adv7181/adv7282:
> - change output from BT656-3 to BT656-4 (as the driver does this for adv7180)
> - enable NEWAVMODE meaning EAV/SAV codes are configurable (new code
> but adv7180 enables this by power-on default and adv7280 does not)
> - configure V bit end count (to be what adv7180 uses; this isn't used
> if NEWAVMODE is disabled)
>
> So its not only the question of how to decide to configure BT656-3 vs
> BT656-4 but how to deal with differences in the EAV/SAV codes. I'm not
> an expert so I don't know what configuration is BT656 compliant and of
> course without knowing who is using these devices we can't tell what
> would break even if we fix something that may be misconfigured already
> (or even completely unused).
>
> I'm cc'ing Steve Longerbeam as well as at one point he was suggesting
> adding a 'newavmode' property to the adv7180 bindings and likely
> recalls the discussions there.

I've never understood why the adv7180 driver configures a non-standard 
V-bit end position (ADV7180_NTSC_V_BIT_END_MANUAL_NVEND), maybe because 
the driver was introduced along with a new bridge driver that assumes 
that V-bit position. The parallel CSI interface in imx6 driver is also 
configuring its crop window to work with this non-standard V-bit position.

The most straight-forward approach to decouple these adv7180 
dependencies would be to remove the non-standard V-bit setting in the 
adv7180 driver, and it should output standard bt.656-3 or bt.656-4 
SAV/EAV codes for all compatible chips. Then expand on the bus-type DT 
bindings to distinguish between bt.656-3 and bt.656-4. And finally all 
bridge drivers that use adv7180 would have to be fixed to work only with 
standard bt.656-3/4 codes. But I realize that last part isn't so easy, 
and it's even possible some bridge drivers may not be able to cope with 
the standard V-bit positions.


Steve

