Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EA0DD75372
	for <lists+linux-media@lfdr.de>; Thu, 25 Jul 2019 18:01:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388490AbfGYQBc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Jul 2019 12:01:32 -0400
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:34647 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2388187AbfGYQBc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Jul 2019 12:01:32 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud8.xs4all.net with ESMTPA
        id qgBKhBRkheD5bqgBOhiVSf; Thu, 25 Jul 2019 18:01:30 +0200
Subject: Re: [PATCH 2/2] media: Don't hide any menu if "ancillary drivers
 autoselect" is enabled
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Ezequiel Garcia <ezequiel@collabora.com>
Cc:     Hans Verkuil <hans.verkuil@cisco.com>, kernel@collabora.com,
        linux-media@vger.kernel.org,
        Helen Koike <helen.koike@collabora.com>
References: <20190715212316.352-1-ezequiel@collabora.com>
 <20190715212316.352-3-ezequiel@collabora.com>
 <20190725125730.2218f0a8@coco.lan>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <4a60eb6e-d0b7-2305-9ea0-407a6b53bd9b@xs4all.nl>
Date:   Thu, 25 Jul 2019 18:01:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190725125730.2218f0a8@coco.lan>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfEFBkLHjEghXG1c+0Tr5aVOJt2vJbRyYqFAZjP6oPw+t8qoIt9yM3qlSerV4QR+rNM1r9rvwQnkErTfricSi8wKFUGgZ3HW0GZ3tbfHe5+TGpC0m7dz7
 //8tAyHRimaRg/CBy1WUQ4k8+ZuLUT3tcrK28o0AJ3KTBQpVxb2J+oVOcKFsI0BBt1/FuMUrCQvLG+t2wvt/jg/7+l/Xyk10V0plnUbhA2Nex1uP+oZCXSwH
 a0RSXsQWVZmxUCslPtN7sgbfvRTlM83g3w+XzgkKJMz6rV7mKkk3qbNt7U/82nqeA3qMBlUECXcwklpNyYxC3VqtjeVEdOFo0nwvbH5X/pAolD61nGwjUEPF
 AMYE0BmQ
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 7/25/19 5:57 PM, Mauro Carvalho Chehab wrote:
> Em Mon, 15 Jul 2019 18:23:16 -0300
> Ezequiel Garcia <ezequiel@collabora.com> escreveu:
> 
>> Many users have been complaining about not being able to find
>> certain menu options. One such example are camera sensor drivers
>> (e.g IMX219, OV5645, etc) which are common on embedded platforms
>> and not always ancillary devices.
>>
>> The problem with MEDIA_SUBDRV_AUTOSELECT seems to be related
>> to the fact that it uses the "visible" kbuild syntax to hide
>> entire group of drivers.
>>
>> This is not obvious and, as explained above, not always desired.
>>
>> To fix the problem, drop the "visible" and stop hiding any menu
>> options. Users skilled enough to configure their kernel are expected
>> to be skilled enough to know what (not) to configure anyway.
>>
>> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
>> ---
>>  drivers/media/dvb-frontends/Kconfig | 1 -
>>  drivers/media/i2c/Kconfig           | 1 -
>>  drivers/media/spi/Kconfig           | 1 -
>>  drivers/media/tuners/Kconfig        | 1 -
>>  4 files changed, 4 deletions(-)
>>
>> diff --git a/drivers/media/dvb-frontends/Kconfig b/drivers/media/dvb-frontends/Kconfig
>> index dc43749177df..2d1fea3bf546 100644
>> --- a/drivers/media/dvb-frontends/Kconfig
>> +++ b/drivers/media/dvb-frontends/Kconfig
>> @@ -1,5 +1,4 @@
>>  menu "Customise DVB Frontends"
>> -	visible if !MEDIA_SUBDRV_AUTOSELECT || COMPILE_TEST || EXPERT
>>  
>>  comment "Multistandard (satellite) frontends"
>>  	depends on DVB_CORE
>> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
>> index 79ce9ec6fc1b..475072bb67d6 100644
>> --- a/drivers/media/i2c/Kconfig
>> +++ b/drivers/media/i2c/Kconfig
>> @@ -23,7 +23,6 @@ config VIDEO_IR_I2C
>>  #
>>  
>>  menu "I2C Encoders, decoders, sensors and other helper chips"
>> -	visible if !MEDIA_SUBDRV_AUTOSELECT || COMPILE_TEST || EXPERT
> 
> Hmm... Hans picked this patch, but IMO it doesn't make sense
> for PC consumer people to see the hundreds of extra options
> that making those menus visible will produce.
> 
> This was added because in the past we had lots of issues with
> people desktop/laptop settings with all those things enabled.
> 
> In any case, if the desktop/laptop user is smart enough to
> go though it, he can simply disable MEDIA_SUBDRV_AUTOSELECT and
> manually select what he wants, so I really miss the point of
> making those stuff always visible.
> 
> Now, from this patch's comments, it seems that you want this
> to be visible if CONFIG_EMBEDDED. So, I won't complain if you
> replace the changes on this patch to:
> 
> 	menu "foo"
> 	    visible if !MEDIA_SUBDRV_AUTOSELECT || !EMBEDDED || COMPILE_TEST || EXPERT
> 
> In other words, for the normal guy that just wants to build the
> latest media stuff for his PC camera or TV device to work, he won't
> need to dig into hundreds of things that won't make any difference
> if he enables, except for making the Kernel bigger.

Good points, I agree.

Regards,

	Hans

> 
> 
>>  
>>  comment "Audio decoders, processors and mixers"
>>  
>> diff --git a/drivers/media/spi/Kconfig b/drivers/media/spi/Kconfig
>> index 08386abb9bbc..d94921fe3db5 100644
>> --- a/drivers/media/spi/Kconfig
>> +++ b/drivers/media/spi/Kconfig
>> @@ -2,7 +2,6 @@
>>  if VIDEO_V4L2
>>  
>>  menu "SPI helper chips"
>> -	visible if !MEDIA_SUBDRV_AUTOSELECT || COMPILE_TEST || EXPERT
>>  
>>  config VIDEO_GS1662
>>  	tristate "Gennum Serializers video"
>> diff --git a/drivers/media/tuners/Kconfig b/drivers/media/tuners/Kconfig
>> index a7108e575e9b..01212df505ae 100644
>> --- a/drivers/media/tuners/Kconfig
>> +++ b/drivers/media/tuners/Kconfig
>> @@ -16,7 +16,6 @@ config MEDIA_TUNER
>>  	select MEDIA_TUNER_MC44S803 if MEDIA_SUBDRV_AUTOSELECT
>>  
>>  menu "Customize TV tuners"
>> -	visible if !MEDIA_SUBDRV_AUTOSELECT || COMPILE_TEST || EXPERT
>>  	depends on MEDIA_ANALOG_TV_SUPPORT || MEDIA_DIGITAL_TV_SUPPORT || MEDIA_RADIO_SUPPORT || MEDIA_SDR_SUPPORT
>>  
>>  config MEDIA_TUNER_SIMPLE
> 
> 
> 
> Thanks,
> Mauro
> 

