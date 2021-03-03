Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BD3C32C74E
	for <lists+linux-media@lfdr.de>; Thu,  4 Mar 2021 02:10:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377035AbhCDAb1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Mar 2021 19:31:27 -0500
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:46595 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1447754AbhCCPQ1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 3 Mar 2021 10:16:27 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id HTDtlatQDqY4WHTDxlTZCw; Wed, 03 Mar 2021 16:15:41 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1614784541; bh=J0tuUx26jPfWFkbVKriXY3BnEeegJi6Jyq9mglqP7yE=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=teM3cb9yHvvQ3WdAYyrGSgoSxtEWDDvcU+KYYtPC3YmdNQtZvN4IUthj/4qq9teHC
         LWUr3gytuMIo4kVogtyiNKjLKQLjxQJ7URt0sba8t+Be4q48fe5QA1rlqpjyqq4tNu
         tLbUB42dpkLiJ2IjV7/6+8llg0ErN7YNPNXiq+Lmu2g2z0Fwpwea1HELFjN325dery
         I5xnkJ35J4t++PznhRTX0GEUlFvmJTn7j27XdudN1dC0qnydMYYBdMd6rP55xvAC5l
         mnWKLTP9kj3467oe0FVWZRy6pldvLJDTz0E33464oSw+wmQb+vHBxcbDaHpxdSPx6k
         u5F6VvAntQBAA==
Subject: Re: [PATCH v3 24/24] media: ti-vpe: cal: Implement media controller
 centric API
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Benoit Parrot <bparrot@ti.com>
References: <20201206235353.26968-1-laurent.pinchart@ideasonboard.com>
 <20201206235353.26968-25-laurent.pinchart@ideasonboard.com>
 <d3a0f5e3-d94a-8c67-63e7-b5dfb5f8ea5d@xs4all.nl>
 <X87AHVETKz0CrzQq@pendragon.ideasonboard.com>
 <7792f746-7e49-006c-e02d-bc36a48d3247@xs4all.nl>
 <X8+mq486bL/St/vT@pendragon.ideasonboard.com>
 <1edba432-ff1f-bcd0-5b39-11fa10d904a2@ideasonboard.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <836243a0-6c8c-25a2-2551-ac9a5faab807@xs4all.nl>
Date:   Wed, 3 Mar 2021 16:15:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <1edba432-ff1f-bcd0-5b39-11fa10d904a2@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfDFaWNHvRX9Uigs914h4fwDEo/CB4nsfDSvyHjGfGWvFqsp2nRg3MZ50PKmYivB7IG5+g+MQghRkkCZSCT0PBh4Yh9KrRlOSBGSpGz5qOeB8aDq82okj
 IqJIvepIsZvBZ2RPpNs3JHUBD3CQ1oTFR7yULCEgQz48BrB/FKguXtxhmb34xjc4oDYsqbh2RnjRWYZckWJ2JpBRxcXClHnWDbYykR17LpYUT4WAA8o2qTDj
 220YwT44gFEuDQoiUI5C7lbUqDAIa+dp9OQymhWfD/i7gXWYE8TbqL2aDyIvMtIOyirwptE/RWnZhAxgOxYjHw==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 15/02/2021 16:23, Tomi Valkeinen wrote:
> On 08/12/2020 18:15, Laurent Pinchart wrote:
> 
>>>>> I noticed that this defaults to video centric.
>>>>>
>>>>> To come back to the discussion of the v2 of this patch, I believe we
>>>>> need to decide what to do here so we have a good template for future
>>>>> drivers that need this.
>>>>>
>>>>> My opinion is that you want a Kconfig option to set the default for
>>>>> this, so this becomes something like this:
>>>>>
>>>>> bool cal_mc_api = CONFIG_TI_CAL_MC_API;
>>>>>
>>>>> What do you think?
>>>>>
>>>>> I will make a PR for v5.12 for patches 1-23, but I would like to have this
>>>>> remaining issue resolved before merging this final patch.
>>>>>
>>>>> I do think that a Kconfig option is very desirable, but whether the default
>>>>> of this option should be y or n is less clear. Since this driver has always
>>>>> been video-centric I can imagine that it makes sense to set it to n. But
>>>>> for e.g. a new driver like the tegra-video driver (currently in staging),
>>>>> it would make sense to set it to y since it is a new driver. Ditto for the
>>>>> rpi camera driver.
>>>>
>>>> For this driver I think video-centric mode is the best default to start
>>>> with, to avoid changing the behaviour all of a sudden. We can switch it
>>>> to MC-centric by default later if desired, after userspace gets a chance
>>>> to adapt.
>>>
>>> Fair enough.
>>>
>>>>
>>>>> In that case the rule would be that for new mainline drivers the default
>>>>> should always be y (MC-centric), but if the driver was already in mainline
>>>>> and MC support is added (like for this driver), then the default remains n
>>>>> for backwards compatibility.
>>>>
>>>> I think that for new drivers we shouldn't support video-centric mode at
>>>> all. It should only be supported in downstream (vendor) kernels, and
>>>> only if backward compatibility with existing userspace needs to be
>>>> ensured. The unicam driver, for instance, fits in that category. Drivers
>>>> whose development is ongoing (or hasn't started) should only use the MC
>>>> API. Whether the option should be y or n by default would then be a
>>>> vendor decision, it wouldn't affect upstream.
>>>
>>> No, that I strongly disagree with. Vendors would have to carry those patches
>>> for a long time, and if past experience is any guide, they will mess it up.
>>> Or even refuse to upgrade to the mainline code because it is too much hassle
>>> and instead keep using their own driver.
>>>
>>> In my opinion the mainline driver should be MC-centric, and it is up to the
>>> vendor to decide whether video-centric is also supported: this should only
>>> be done if there is a long history of video-centric behavior in the past.
>>> In that case a Kconfig option is needed to select MC, and in the mainline
>>> kernel this should default to y for such new drivers.
>>>
>>> In both Raspbian and Linux4Tegra video-centric has been the norm for many
>>> years, so there are many userspace applications that expect that behavior.
>>> You want those distros to use the mainline driver (eventually...) since
>>> those distros are widely used so you also get a large installed base and
>>> (hopefully) bug reports and bug fixes for the driver. If you decide to
>>> require the distro to carry a patch to turn a driver into a video-centric
>>> variant, then I am afraid they will not bother upgrading to the mainline
>>> driver and just keep their own driver.
>>
>> For Raspberry Pi, and the Unicam driver in particular, that won't be
>> possible. A video-centric API will require quite a few hacks that
>> shouldn't be upstreamed, in particular to support multiple CSI-2 data
>> types. The current implementation uses two sink pad in the CSI-2
>> receiver subdevs to model the image and embedded data multiplexed over
>> the CSI-2 virtual channel. This requires corresponding changes to sensor
>> drivers to use two source pads. Sakari has reviewed this, and the
>> implementation will need to move to the V4L2 multiplexed streams support
>> API (which has been proposed but not merged yet), and I can't see this
>> working well with a video-centric approach.
>>
>> I suspect the same would apply to any CSI-2 receiver, and thus to Tegra
>> as well, but I can't comment on that as I'm not familiar with the
>> hardware and driver.
>>
>>> In any case, I really like your approach, all I want is a Kconfig option
>>> and it is good to go.
> 
> Waking up this thread, as I'm writing new patches based on these =).
> 
> For this series, afaiu there are no open questions. We can add a kconfig
> option to choose the default option (in addition to the module
> parameter), and as discussed, this one should default to video mode.

Can someone make a v4 of this patch? It would be nice to get this last
remaining patch merged.

> 
> For new drivers, I think we should require support for MC (and default
> to MC), but leave the decision about video support to the
> vendor/developer. 

Makes sense.

> I have the same concerns as Hans if we reject new
> drivers with video support by default.
> Then again, I think it's sensible to require the video support to be...
> well, "sensible". The code for video support should be quite
> straightforward and simple. It should be a valid reason to reject the
> driver if the driver tries to support complex HW setups with video model
> and ends up creating all kinds of hacks which are not needed with MC.
> (the Unicam case Laurent described above sounds like this).

And there is a grey area between 'sensible' and 'not sensible'. If there
is already a large video-centric ecosystem, then there is a good reason
to allow for more complexity to avoid distros forking the driver.

I guess I would have to see the complexity to be able to say if it is
worth it in my opinion (which I am sure differs from other people's
opinion!).

Regards,

	Hans
