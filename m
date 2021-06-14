Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F19F3A5F8B
	for <lists+linux-media@lfdr.de>; Mon, 14 Jun 2021 11:55:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232745AbhFNJ5i (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Jun 2021 05:57:38 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:45413 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232579AbhFNJ5i (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Jun 2021 05:57:38 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id sjJalbW64hqltsjJdlmPc3; Mon, 14 Jun 2021 11:55:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1623664533; bh=h1QaFllNSMbEspZsTu9vh7/Sp9Elx95/sHYX7TXVj+s=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=WNIOST+fYRM8X7g/AzZpvCTmfVTkVppgJbVsKZTZpxHEPaDSVlwhXuWizfAa4TJma
         GvxXAw8EtvG1vjK9xpAKVfVfExbE+ySO9mP6ljElcgf3qZiRiPWTJepbW9eVy6TTXF
         bATbamLNT3MmkyNiJHJ8eGLqBlMfK9ebRK8lxPNdj9omUymc7U5fd+AIp1bpBZ5CSC
         j2dtwg3LagIcTSRYFogD9NDBFNcmbs2uZKMd4LL5IA1E3slI/ysGcPYX3rx6C9trPE
         vwbamu7QzIm8yu76WLpNGaeK1ToE4rq/7Q5x7UwZQr4qemm8aRM8Aj5AytHsyQXlp1
         EGOiVJ3gFW0Iw==
Subject: Re: [PATCH v4 16/17] media: v4l2-subdev: De-deprecate init() subdev
 op
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        kieran.bingham+renesas@ideasonboard.com,
        laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, geert@linux-m68k.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>
References: <20210412093451.14198-1-jacopo+renesas@jmondi.org>
 <20210412093451.14198-17-jacopo+renesas@jmondi.org>
 <2ad9747e-7e2d-2c95-a98b-b6b0e7534e42@xs4all.nl>
 <20210614094548.ufd6qczjj5zpkbfb@uno.localdomain>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <07c42c41-138a-7e48-a320-4a9e8873a168@xs4all.nl>
Date:   Mon, 14 Jun 2021 11:55:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210614094548.ufd6qczjj5zpkbfb@uno.localdomain>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfOXFssleaqyRgfZHQbYetbMYLLh5KQhaxxbwXoDSuGRuper5ubsze1tunY4NVu5lVjgYsBJ+AIt5YGXQdaE8ZE1/bnMJsICrQQWyuUaAiYm8M+FxPqlZ
 DH2QJgswbJ/QVeW7fUETr0gh2o+/hqKaRCteUU7Gc75zl0KXtI0nhwujyo256MYCovlxSiJ432qOtNQfh/LZ04eezSB14LIQg6P8faMZi0YXlfoSpp40ZMWV
 ycfDoi5jOxsim6RhTBIufYHEgyX42ddALUnZNskOusHLjD5Zyd1xjqSISvzLtEToJhafMZpxFffZ9/9Qry1z9+XNSGFSK9whVT+CRSwYFTXLQY0s4RJOBKFl
 yj9VbAPj9MdqiJF0zKTRHDVMrpqE+hN9lCyLYhtU+xWoxEEqVVEwHKfTSqVW0LoH5N+nmdD9bgss1m3SfAaCxYKndFaz5WIwGco8z8BCMMsFeVhOGKUzhP7S
 zGeeFjPTEmdHlYyRnikJTpdt58sIRbfviQpeIp3wIdpmQPXAxlPTsPOWwf9IMTCsATIhlH0Q+L8y7FUiWwgwUU+dqwW05Bhnf3jtvlHwa36MIkNWiQ42g+5F
 A5UAwNPiX/uOR7/df3W1v6cBIVwT/WqHR/Qs0RLR8fs69g==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 14/06/2021 11:45, Jacopo Mondi wrote:
> Hi Hans,
>    thanks for your reply
> 
> On Mon, Jun 14, 2021 at 10:51:25AM +0200, Hans Verkuil wrote:
>> On 12/04/2021 11:34, Jacopo Mondi wrote:
>>> The init() subdev core operation is deemed to be deprecated for new
>>> subdevice drivers. However it could prove useful for complex
>>> architectures to defer operation that require access to the
>>> communication bus if said bus is not available (or fully configured)
>>> at the time when the subdevice probe() function is run.
>>>
>>> As an example, the GMSL architecture requires the GMSL configuration
>>> link to be configured on the host side after the remote subdevice
>>> has completed its probe function. After the configuration on the host
>>> side has been performed, the subdevice registers can be accessed through
>>> the communication bus.
>>>
>>> In particular:
>>>
>>> 	HOST			REMOTE
>>>
>>> 	probe()
>>> 	   |
>>> 	   ---------------------> |
>>> 				  probe() {
>>> 				     bus config()
>>> 				  }
>>> 	   |<--------------------|
>>> 	v4l2 async bound {
>>> 	    bus config()
>>> 	    call subdev init()
>>> 	   |-------------------->|
>>> 				 init() {
>>> 				     access register on the bus()
>>> 				}
>>> 	   |<-------------------
>>> 	}
>>>
>>> In the GMSL use case the bus configuration requires the enablement of the
>>> noise immunity threshold on the remote side which ensures reliability
>>> of communications in electrically noisy environments. After the subdevice
>>> has enabled the threshold at the end of its probe() sequence the host
>>> side shall compensate it with an higher signal amplitude. Once this
>>> sequence has completed the bus can be accessed with noise protection
>>> enabled and all the operations that require a considerable number of
>>> transactions on the bus (such as the image sensor configuration
>>> sequence) are run in the subdevice init() operation implementation.
>>>
>>> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
>>> ---
>>>  include/media/v4l2-subdev.h | 15 ++++++++++++---
>>>  1 file changed, 12 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
>>> index d0e9a5bdb08b..3068d9940669 100644
>>> --- a/include/media/v4l2-subdev.h
>>> +++ b/include/media/v4l2-subdev.h
>>> @@ -148,9 +148,18 @@ struct v4l2_subdev_io_pin_config {
>>>   *	each pin being configured.  This function could be called at times
>>>   *	other than just subdevice initialization.
>>>   *
>>> - * @init: initialize the sensor registers to some sort of reasonable default
>>> - *	values. Do not use for new drivers and should be removed in existing
>>> - *	drivers.
>>> + * @init: initialize the subdevice registers to some sort of reasonable default
>>> + *	values. Do not use for new drivers (and should be removed in existing
>>> + *	ones) for regular architectures where the image sensor is connected to
>>> + *	the host receiver. For more complex architectures where the subdevice
>>> + *	initialization should be deferred to the completion of the probe
>>> + *	sequence of some intermediate component, or the communication bus
>>> + *	requires configurations on the host side that depend on the completion
>>> + *	of the probe sequence of the remote subdevices, the usage of this
>>> + *	operation could be considered to allow the devices along the pipeline to
>>> + *	probe and register in the media graph and to defer any operation that
>>> + *	require actual access to the communication bus to their init() function
>>> + *	implementation.
>>
>> I don't like de-deprecating init. It was deprecated for a good reason, and
>> I'd like to keep it that way.
> 
> I see, fair enough :)
> 
>>
>> There are two alternatives: one is a bit quick-and-dirty, the other is a hint
>> towards a more generic solution (just a hint since it will require more research):
>>
>> 1) Quick-and-dirty: use the core callback op to create a custom INIT callback.
>> This depends on this patch:
>>
>> https://patchwork.linuxtv.org/project/linux-media/patch/20210610214305.4170835-8-arnd@kernel.org/
>>
>> This will make it clear to the reader that this is a highly specific interaction
>> between two drivers that are tightly coupled. It works in the current situation,
>> but not if we want to make this more generic.
> 
> Depends what you mean with 'generic' :) I think such a solution would
> slightly abuse a generic API like 'command' is, but the GMSL
> deserializers/serializers are tighly coupled by definition, so this is
> less a concern, as long as we have a single driver for the whole
> camera module. If we're going to split it in 3 subdev drivers then
> yes, they will all have to implement .command() and they can be used
> with in isolation with a generic receiver driver.
> 
>>
>> 2) Subdev drivers can implement the registered() op which is called by
>> v4l2_device_register_subdev(). This in turn is called from v4l2_async_match_notify().
>>
>> What you want is that when max9286 calls v4l2_async_subdev_notifier_register, it
>> can set a flag or something indicating that initialization has to be postponed.
>> Then, when v4l2_async_match_notify() calls the register() callback, that flag can
>> be read. If false, then the register() callback will initialize the device, if
>> true then that won't happen. Instead, it will do that when the max9286 calls a
>> post_register() callback.
> 
> 2 questions to help me better understand this:
> 1) s/register()/registered() in this paragraph ?

Yes, sorry.

> 2) $ git grep post_register drivers/media/ include/media/
>    gives me back nothing.
> 
>    Are you suggesting a new operation ?

Yes, that would be a new op.

Regards,

	Hans

> 
> Thanks
>    j
> 
>>
>> This is a lot more work (and research, since this is just a brainstorm from my
>> side), but it is a way towards making this a generic solution.
>>
>> Regards,
>>
>> 	Hans
>>
>>>   *
>>>   * @load_fw: load firmware.
>>>   *
>>> --
>>> 2.31.1
>>>
>>

