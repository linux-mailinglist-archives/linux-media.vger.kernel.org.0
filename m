Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1372531BC40
	for <lists+linux-media@lfdr.de>; Mon, 15 Feb 2021 16:25:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230195AbhBOPYw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Feb 2021 10:24:52 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:51256 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230245AbhBOPY0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Feb 2021 10:24:26 -0500
Received: from [192.168.1.111] (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D35AD5A4;
        Mon, 15 Feb 2021 16:23:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1613402618;
        bh=YgrLgkMiifvU+GhGZQMEpspcDJOZcC3Ezvb6byVOv4w=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=XkSkthzORuP71r5twlW5477vH8y630FKX1SysBeel8LsI2X3UvTyQg7sF9OGkRU5T
         1fBM3yFw2u0lwYDYpsEmKd3TH5N02VbDF59YuZ0UP/9MkctACIPn30X9rQmvedcwI0
         ukABW61Rzw4HmqQnFG24spiTRcfv29hLboEqInjE=
Subject: Re: [PATCH v3 24/24] media: ti-vpe: cal: Implement media controller
 centric API
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org, Benoit Parrot <bparrot@ti.com>
References: <20201206235353.26968-1-laurent.pinchart@ideasonboard.com>
 <20201206235353.26968-25-laurent.pinchart@ideasonboard.com>
 <d3a0f5e3-d94a-8c67-63e7-b5dfb5f8ea5d@xs4all.nl>
 <X87AHVETKz0CrzQq@pendragon.ideasonboard.com>
 <7792f746-7e49-006c-e02d-bc36a48d3247@xs4all.nl>
 <X8+mq486bL/St/vT@pendragon.ideasonboard.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
Message-ID: <1edba432-ff1f-bcd0-5b39-11fa10d904a2@ideasonboard.com>
Date:   Mon, 15 Feb 2021 17:23:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <X8+mq486bL/St/vT@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 08/12/2020 18:15, Laurent Pinchart wrote:

>>>> I noticed that this defaults to video centric.
>>>>
>>>> To come back to the discussion of the v2 of this patch, I believe we
>>>> need to decide what to do here so we have a good template for future
>>>> drivers that need this.
>>>>
>>>> My opinion is that you want a Kconfig option to set the default for
>>>> this, so this becomes something like this:
>>>>
>>>> bool cal_mc_api = CONFIG_TI_CAL_MC_API;
>>>>
>>>> What do you think?
>>>>
>>>> I will make a PR for v5.12 for patches 1-23, but I would like to have this
>>>> remaining issue resolved before merging this final patch.
>>>>
>>>> I do think that a Kconfig option is very desirable, but whether the default
>>>> of this option should be y or n is less clear. Since this driver has always
>>>> been video-centric I can imagine that it makes sense to set it to n. But
>>>> for e.g. a new driver like the tegra-video driver (currently in staging),
>>>> it would make sense to set it to y since it is a new driver. Ditto for the
>>>> rpi camera driver.
>>>
>>> For this driver I think video-centric mode is the best default to start
>>> with, to avoid changing the behaviour all of a sudden. We can switch it
>>> to MC-centric by default later if desired, after userspace gets a chance
>>> to adapt.
>>
>> Fair enough.
>>
>>>
>>>> In that case the rule would be that for new mainline drivers the default
>>>> should always be y (MC-centric), but if the driver was already in mainline
>>>> and MC support is added (like for this driver), then the default remains n
>>>> for backwards compatibility.
>>>
>>> I think that for new drivers we shouldn't support video-centric mode at
>>> all. It should only be supported in downstream (vendor) kernels, and
>>> only if backward compatibility with existing userspace needs to be
>>> ensured. The unicam driver, for instance, fits in that category. Drivers
>>> whose development is ongoing (or hasn't started) should only use the MC
>>> API. Whether the option should be y or n by default would then be a
>>> vendor decision, it wouldn't affect upstream.
>>
>> No, that I strongly disagree with. Vendors would have to carry those patches
>> for a long time, and if past experience is any guide, they will mess it up.
>> Or even refuse to upgrade to the mainline code because it is too much hassle
>> and instead keep using their own driver.
>>
>> In my opinion the mainline driver should be MC-centric, and it is up to the
>> vendor to decide whether video-centric is also supported: this should only
>> be done if there is a long history of video-centric behavior in the past.
>> In that case a Kconfig option is needed to select MC, and in the mainline
>> kernel this should default to y for such new drivers.
>>
>> In both Raspbian and Linux4Tegra video-centric has been the norm for many
>> years, so there are many userspace applications that expect that behavior.
>> You want those distros to use the mainline driver (eventually...) since
>> those distros are widely used so you also get a large installed base and
>> (hopefully) bug reports and bug fixes for the driver. If you decide to
>> require the distro to carry a patch to turn a driver into a video-centric
>> variant, then I am afraid they will not bother upgrading to the mainline
>> driver and just keep their own driver.
> 
> For Raspberry Pi, and the Unicam driver in particular, that won't be
> possible. A video-centric API will require quite a few hacks that
> shouldn't be upstreamed, in particular to support multiple CSI-2 data
> types. The current implementation uses two sink pad in the CSI-2
> receiver subdevs to model the image and embedded data multiplexed over
> the CSI-2 virtual channel. This requires corresponding changes to sensor
> drivers to use two source pads. Sakari has reviewed this, and the
> implementation will need to move to the V4L2 multiplexed streams support
> API (which has been proposed but not merged yet), and I can't see this
> working well with a video-centric approach.
> 
> I suspect the same would apply to any CSI-2 receiver, and thus to Tegra
> as well, but I can't comment on that as I'm not familiar with the
> hardware and driver.
> 
>> In any case, I really like your approach, all I want is a Kconfig option
>> and it is good to go.

Waking up this thread, as I'm writing new patches based on these =).

For this series, afaiu there are no open questions. We can add a kconfig
option to choose the default option (in addition to the module
parameter), and as discussed, this one should default to video mode.

For new drivers, I think we should require support for MC (and default
to MC), but leave the decision about video support to the
vendor/developer. I have the same concerns as Hans if we reject new
drivers with video support by default.

Then again, I think it's sensible to require the video support to be...
well, "sensible". The code for video support should be quite
straightforward and simple. It should be a valid reason to reject the
driver if the driver tries to support complex HW setups with video model
and ends up creating all kinds of hacks which are not needed with MC.
(the Unicam case Laurent described above sounds like this).

 Tomi
