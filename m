Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CA7C075778
	for <lists+linux-media@lfdr.de>; Thu, 25 Jul 2019 21:00:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726422AbfGYTAQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Jul 2019 15:00:16 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:47200 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726303AbfGYTAQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Jul 2019 15:00:16 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id 1B45E28BD73
Subject: Re: [PATCH 2/2] media: Don't hide any menu if "ancillary drivers
 autoselect" is enabled
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Chen-Yu Tsai <wens@kernel.org>
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        Hans Verkuil <hans.verkuil@cisco.com>, kernel@collabora.com,
        Linux Media Mailing List <linux-media@vger.kernel.org>
References: <20190715212316.352-1-ezequiel@collabora.com>
 <20190715212316.352-3-ezequiel@collabora.com>
 <20190725125730.2218f0a8@coco.lan>
 <f87fb2e6bd740de8c44df1f8ff3b48b7b04af481.camel@collabora.com>
 <CAGb2v65wOz+nUi=Leb3FudU7K5S_AHtuCarXHcO0kMvvqEw8rQ@mail.gmail.com>
 <20190725154111.7fc7e335@coco.lan>
From:   Helen Koike <helen.koike@collabora.com>
Openpgp: preference=signencrypt
Autocrypt: addr=helen.koike@collabora.com; keydata=
 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
Message-ID: <4517f590-dcda-5bf0-70dd-3cffc5d71ba3@collabora.com>
Date:   Thu, 25 Jul 2019 16:00:02 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190725154111.7fc7e335@coco.lan>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 7/25/19 3:41 PM, Mauro Carvalho Chehab wrote:
> Em Fri, 26 Jul 2019 01:29:58 +0800
> Chen-Yu Tsai <wens@kernel.org> escreveu:
> 
>> On Fri, Jul 26, 2019 at 1:06 AM Ezequiel Garcia <ezequiel@collabora.com> wrote:
>>>
>>> On Thu, 2019-07-25 at 12:57 -0300, Mauro Carvalho Chehab wrote:  
>>>> Em Mon, 15 Jul 2019 18:23:16 -0300
>>>> Ezequiel Garcia <ezequiel@collabora.com> escreveu:
>>>>  
>>>>> Many users have been complaining about not being able to find
>>>>> certain menu options. One such example are camera sensor drivers
>>>>> (e.g IMX219, OV5645, etc) which are common on embedded platforms
>>>>> and not always ancillary devices.
>>>>>
>>>>> The problem with MEDIA_SUBDRV_AUTOSELECT seems to be related
>>>>> to the fact that it uses the "visible" kbuild syntax to hide
>>>>> entire group of drivers.
>>>>>
>>>>> This is not obvious and, as explained above, not always desired.
>>>>>
>>>>> To fix the problem, drop the "visible" and stop hiding any menu
>>>>> options. Users skilled enough to configure their kernel are expected
>>>>> to be skilled enough to know what (not) to configure anyway.
>>>>>
>>>>> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
>>>>> ---
>>>>>  drivers/media/dvb-frontends/Kconfig | 1 -
>>>>>  drivers/media/i2c/Kconfig           | 1 -
>>>>>  drivers/media/spi/Kconfig           | 1 -
>>>>>  drivers/media/tuners/Kconfig        | 1 -
>>>>>  4 files changed, 4 deletions(-)
>>>>>
>>>>> diff --git a/drivers/media/dvb-frontends/Kconfig b/drivers/media/dvb-frontends/Kconfig
>>>>> index dc43749177df..2d1fea3bf546 100644
>>>>> --- a/drivers/media/dvb-frontends/Kconfig
>>>>> +++ b/drivers/media/dvb-frontends/Kconfig
>>>>> @@ -1,5 +1,4 @@
>>>>>  menu "Customise DVB Frontends"
>>>>> -   visible if !MEDIA_SUBDRV_AUTOSELECT || COMPILE_TEST || EXPERT
>>>>>
>>>>>  comment "Multistandard (satellite) frontends"
>>>>>     depends on DVB_CORE
>>>>> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
>>>>> index 79ce9ec6fc1b..475072bb67d6 100644
>>>>> --- a/drivers/media/i2c/Kconfig
>>>>> +++ b/drivers/media/i2c/Kconfig
>>>>> @@ -23,7 +23,6 @@ config VIDEO_IR_I2C
>>>>>  #
>>>>>
>>>>>  menu "I2C Encoders, decoders, sensors and other helper chips"
>>>>> -   visible if !MEDIA_SUBDRV_AUTOSELECT || COMPILE_TEST || EXPERT  
>>>>
>>>> Hmm... Hans picked this patch, but IMO it doesn't make sense
>>>> for PC consumer people to see the hundreds of extra options
>>>> that making those menus visible will produce.
>>>>
>>>> This was added because in the past we had lots of issues with
>>>> people desktop/laptop settings with all those things enabled.
>>>>
>>>> In any case, if the desktop/laptop user is smart enough to
>>>> go though it, he can simply disable MEDIA_SUBDRV_AUTOSELECT and
>>>> manually select what he wants, so I really miss the point of
>>>> making those stuff always visible.
>>>>
>>>> Now, from this patch's comments, it seems that you want this
>>>> to be visible if CONFIG_EMBEDDED. So, I won't complain if you
>>>> replace the changes on this patch to:
>>>>
>>>>       menu "foo"
>>>>           visible if !MEDIA_SUBDRV_AUTOSELECT || !EMBEDDED || COMPILE_TEST || EXPERT
>>>>
>>>> In other words, for the normal guy that just wants to build the
>>>> latest media stuff for his PC camera or TV device to work, he won't
>>>> need to dig into hundreds of things that won't make any difference
>>>> if he enables, except for making the Kernel bigger.
>>>>  
>>>
>>> Well, I think the real value of MEDIA_SUBDRV_AUTOSELECT is the autoselection,
>>> not the hidden part. I'm really missing to see what hiding anything gives you.
>>>
>>> In other words, this option gets useful when driver authors select ancillary
>>> drivers such as:
>>>
>>> config VIDEO_USBVISION
>>>         tristate "USB video devices based on Nogatech NT1003/1004/1005"
>>>         depends on I2C && VIDEO_V4L2
>>>         select VIDEO_TUNER
>>>         select VIDEO_SAA711X if MEDIA_SUBDRV_AUTOSELECT
>>>
>>> What's so confusing about having these drivers visible? Compared to the
>>> rest of the zillion menu options, what's more confusing about seeing these?
>>>
>>> Now, while I would agree with EMBEDDED, the problem with that is that
>>> many "embedded" platforms don't enable EMBEDDED. So, it's not that useful.
>>>
>>> Finally, let me give an example of why hiding the menus is so bad.
>>> Normally, to enable a symbol, we use the search tool.
>>>
>>> Now, when MEDIA_SUBDRV_AUTOSELECT=y, the search tool will _not_ take you
>>> there and there's no indication why.  
>>
>> As someone who has done so in the past year, I agree it's confusing.
>> I had to dig through the Kconfig files to figure out which knobs to
>> turn to get the OV5640 option out. The description says "auto-selecting",

I had this same problem.

> 
> Well, the text and/or the help message can be changed, if it is not
> clear enough, but this option was added because we had too many issues
> with users trying to build drivers for their devices without being
> able to do that, because selecting thousands of devices is something
> that an average PC user has troubles.
> 
> I'm all to improve it, provided that we don't make harder for non-devs
> to build the Kernel.
> 
>> which does not equal hiding everything. You could still have drivers
>> auto-selected (or not) based on a Kconfig option without hiding things.
>>

Another idea is to separate in two options, MEDIA_SUBDRV_AUTOSELECT and
MEDIA_SUBDRV_ADVANCED, where the first one autoselects things and the later
enables more options.

Helen

>> ChenYu
> 
> 
> 
> Thanks,
> Mauro
> 
