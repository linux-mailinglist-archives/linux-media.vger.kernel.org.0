Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D39184D009A
	for <lists+linux-media@lfdr.de>; Mon,  7 Mar 2022 15:01:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239786AbiCGOCK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Mar 2022 09:02:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242960AbiCGOBy (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Mar 2022 09:01:54 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CADA18C7F3
        for <linux-media@vger.kernel.org>; Mon,  7 Mar 2022 06:00:59 -0800 (PST)
Received: from [192.168.1.111] (91-156-85-209.elisa-laajakaista.fi [91.156.85.209])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2E85D478;
        Mon,  7 Mar 2022 15:00:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1646661657;
        bh=UNx6DJxyWvAEqmwu8gow8jAfifhRye7FdF6C8sPoLBI=;
        h=Date:Subject:To:References:From:In-Reply-To:From;
        b=T6XDFa/6bhZhrCtyb/ON6zlGXOdMx+ZHmtLRUduL9+un415+yNcmEDhswYGU0T4nu
         0DokABLvzcn3aQmYJwYg6wRsvsXtSWOrAFkn+vLZ4s1F6vwVgF2q7jPfBQSgafo3JR
         VjQZ77Lhtz14JvmzUhoyK5LIBHMfYovcCmlUNt1Q=
Message-ID: <84e6019a-ed8a-918a-a4a9-0c868cc1b1b5@ideasonboard.com>
Date:   Mon, 7 Mar 2022 16:00:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v5 5/6] media: subdev: add v4l2_subdev_call_state_active()
Content-Language: en-US
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Pratyush Yadav <p.yadav@ti.com>
References: <20220301105548.305191-1-tomi.valkeinen@ideasonboard.com>
 <20220301105548.305191-6-tomi.valkeinen@ideasonboard.com>
 <0653fa02-10d5-99cb-5adb-7c5ae262bf8c@xs4all.nl>
 <381d99d4-ccc6-6066-03b2-4870ffdccfd5@ideasonboard.com>
 <0d058225-d732-0368-b8be-562618ea9a8a@xs4all.nl>
 <d40d3f0f-c1f1-301e-878d-7bdc33a494c6@ideasonboard.com>
 <c7a49330-22a9-d24f-8b53-1dab1015c951@xs4all.nl>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <c7a49330-22a9-d24f-8b53-1dab1015c951@xs4all.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 07/03/2022 11:51, Hans Verkuil wrote:
> Hi Tomi,
> 
> On 3/7/22 10:16, Tomi Valkeinen wrote:
>> Hi Hans,
>>
>> On 07/03/2022 10:36, Hans Verkuil wrote:
>>>
>>>
>>> On 3/7/22 08:16, Tomi Valkeinen wrote:
>>>> Hi Hans,
>>>>
>>>> On 04/03/2022 15:34, Hans Verkuil wrote:
>>>>> Hi Tomi,
>>>>>
>>>>> On 3/1/22 11:55, Tomi Valkeinen wrote:
>>>>>> Add v4l2_subdev_call_state_active() macro to help calling subdev ops
>>>>>> that take a subdev state as a parameter. Normally the v4l2 framework
>>>>>> will lock and pass the correct subdev state to the subdev ops, but there
>>>>>> are legacy situations where this is not the case (e.g. non-MC video
>>>>>> device driver calling set_fmt in a source subdev).
>>>>>>
>>>>>> As this macro is only needed for legacy use cases, the macro is added in
>>>>>> a new header file, v4l2-subdev-legacy.h.
>>>>>>
>>>>>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>>>>>> ---
>>>>>>     include/media/v4l2-subdev-legacy.h | 42 ++++++++++++++++++++++++++++++
>>>>>>     1 file changed, 42 insertions(+)
>>>>>>     create mode 100644 include/media/v4l2-subdev-legacy.h
>>>>>>
>>>>>> diff --git a/include/media/v4l2-subdev-legacy.h b/include/media/v4l2-subdev-legacy.h
>>>>>> new file mode 100644
>>>>>> index 000000000000..6a61e579b629
>>>>>> --- /dev/null
>>>>>> +++ b/include/media/v4l2-subdev-legacy.h
>>>>>> @@ -0,0 +1,42 @@
>>>>>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>>>>>> +/*
>>>>>> + *  V4L2 sub-device legacy support header.
>>>>>> + *
>>>>>> + *  Copyright (C) 2022  Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>>>>>> + */
>>>>>> +
>>>>>> +#ifndef _V4L2_SUBDEV_LEGACY_H
>>>>>> +#define _V4L2_SUBDEV_LEGACY_H
>>>>>> +
>>>>>> +/**
>>>>>> + * v4l2_subdev_call_state_active - call an operation of a v4l2_subdev which
>>>>>> + *                   takes state as a parameter, passing the
>>>>>> + *                   subdev its active state.
>>>>>> + *
>>>>>> + * @sd: pointer to the &struct v4l2_subdev
>>>>>> + * @o: name of the element at &struct v4l2_subdev_ops that contains @f.
>>>>>> + *     Each element there groups a set of callbacks functions.
>>>>>> + * @f: callback function to be called.
>>>>>> + *     The callback functions are defined in groups, according to
>>>>>> + *     each element at &struct v4l2_subdev_ops.
>>>>>> + * @args: arguments for @f.
>>>>>> + *
>>>>>> + * This is similar to v4l2_subdev_call(), except that this version can only be
>>>>>> + * used for ops that take a subdev state as a parameter. The macro will get the
>>>>>> + * active state and lock it before calling the op, and unlock it after the
>>>>>> + * call.
>>>>>> + */
>>>>>
>>>>> You should explain why this is a legacy macro and, ideally, what would need to
>>>>> be done to get rid of it. The first is in the commit log, but nobody reads that :-)
>>>>>
>>>>> But if just using it in a non-MC video device driver constitutes 'legacy' use,
>>>>> then I disagree with that. There are many non-MC video device drivers, nothing
>>>>> legacy about that.
>>>>
>>>> It's difficult to define all the scenarios where this can be used, but the ones I can imagine fall under legacy (depending on how you define that, though).
>>>>
>>>> I use this in CAL driver, which supports non-MC (legacy) and MC. CAL has a bunch of video devices (one for each DMA engine) and two CSI-2 PHY devices (v4l2 subdevs).
>>>>
>>>> When operating in MC mode, the userspace will call, e.g., set_fmt in the PHY subdev, and so forth.
>>>>
>>>> But in non-MC case the userspace calls VIDIOC_S_FMT in the video dev, and the video dev has to propagate that to the PHY subdev. I do this propagation using the v4l2_subdev_call_state_active macro.
>>>>
>>>> I don't know if there are other drivers that support both non-MC and MC modes. I could also just move this macro to the CAL driver, and we could add this to the v4l2 framework if we see other drivers using similar constructs.
>>>
>>> It is common to have non-MC drivers that call set_fmt of a subdev.
>>> Wouldn't they all need to use this helper macro? If so, then this is NOT a
>>> legacy use, it's just a non-MC driver use.
>>
>> These non-MC drivers that call set_fmt of a subdev, they're video device drivers, right? In other words, there are no subdev drivers that call set_fmt on other subdevs?
> 
> Probably not, but I am not 100% certain. There are a few nested subdev cases, but I don't remember which.
> 
>>
>> This does get a bit complex, keeping the old and new code working together. In this context, I think we have three different "classes":
>>
>> 1. non-MC
>> 2. MC, no state support
>> 3. MC, state support
> 
> Are you talking about subdev drivers or bridge drivers? It's a bit confusing. I'm assuming it can be either.

Yes, I mean either one.

>> We have classes 1 and 2 in upstream, and 3 will be enabled with this series (and expanded with the streams series).
>>
>> Classes 1 and 2 continue working as before. If you have a pipeline with only class 3 drivers, it works without any legacy "hacks". The problems come when you combine 1 or 2 with 3. Or possibly the problems appear only when combining class 1 and class 3, as class 2 drivers are not supposed to call subdev ops which take a state parameter on other subdevs.
>>
>> A class 3 driver expects to get either a try or an active state as a parameter, but class 1 drivers pass NULL for the active state. If you write a class 3 driver and want it to work with class 1 (without any changes to those drivers), you must do extra plumbing in the ops functions, to catch the NULL state case and get & lock the state yourself. If you do that, this macro is not needed.
>>
>> Alternatively, class 1 drivers could be changed to use this macro, so that a possible class 3 driver in the pipeline would work without additional code. But there are a lot of class 1 drivers, and thus modifications, and I wasn't planning to go that way.
>>
>> The CAL driver I mentioned supports both class 1 and class 3 (via a module parameter) in the video dev driver, and the class 1 mode uses this macro as CAL's PHY subdev (part of the same driver) is a class 3 subdev. The class 1 support is legacy support in CAL's case.
>>
>> So... Depending on what kind of driver combinations we want to support, this may or may not be legacy, depending on how you define legacy =).
> 
> Let me try to explain what my concerns are. Eventually I would really like all subdevs to be capable of working with MC bridge drivers, i.e. have state support. Bridge drivers can be either MC or non-MC.
> 
> So I would like to know:
> 
> 1.1) How to convert a subdev driver to a MC state-aware subdev driver?

I presume you mean how to convert an MC subdev driver to state-aware MC 
driver. If you have a non-MC subdev driver, then that first needs to be 
converted to an MC driver, which is out of scope here.

Here's an example commit where I convert OV10635 to streams:

https://git.kernel.org/pub/scm/linux/kernel/git/tomba/linux.git/commit/?h=streams/work-v11&id=ffb08af15f04ef2ce0a00bb356e957c839d6bccb

However, the commit is on top of the streams series and I add support 
for multiple streams in addition to the active state, so 1) it's not as 
simple as it could be (e.g. get_frame_desc() and set_routing() ops could 
be left out), and 2) it's not using the old-style v4l2_subdev_pad_config 
(which is the only option on top of this series), but the new routes & 
streams.

So the example doesn't quite answer to your question... I haven't looked 
at implementing a driver which would be state-aware but not 
streams-aware, but I think it's essentially just:

- Use v4l2_subdev_init_finalize() to create the active state storage
- Always use state->pads instead of something stored in the driver's 
private data for active case.

> 1.2) What is the legacy code that such a MC state-aware subdev driver has to keep in order to work with older bridge drivers that do not support such subdev drivers? (i.e. they pass NULL as the state)

I believe the only extra code needed is to handle the state == NULL 
case. This means adding code to each subdev op which has the state as a 
parameter, and doing, perhaps, something like this:

my_set_fmt(sd, _state, fmt)
{
	state = _state

	if (!_state)
		state = v4l2_subdev_lock_and_get_active_state(sd);

	... use 'state' here ...

	if (!_state)
		v4l2_subdev_unlock_state(state);
}

Maybe we can somehow macro-ify the above, which creates a wrapper for 
the op. Or, as I mentioned, we could try to change all the drivers that 
do those calls, so that they use the macro in this patch instead.

> 2.1) How to convert a bridge driver (either non-MC or MC, but no state support) to properly support a fully converted subdev (MC state-aware) driver?

Converting non-MC driver to an MC driver is out of the context here, as 
it's not related to the active state. An MC bridge driver should work 
fine with state-aware subdev drivers, as the bridge driver should not 
call any of the subdev's state-related ops.

To make a non-MC bridge driver support state-aware subdev drivers, they 
can use the macro in this patch.

> 2.2) What is the legacy code that such a bridge driver has to keep in order to work with older subdev drivers that are not yet MC state-aware?

The older subdev drivers should keep working without any extra code.

> The code needed for 1.2 and 2.2 (helper functions/macros) is legacy code, and can be marked as such.
> > If this is clear, then we can work towards converting both subdev and 
bridge drivers and eventually (might take years!) get rid of the legacy 
code.
> 
> Removing support for case 2 is probably something that we want to do sooner than later.
> 
> For the CAL driver I do not consider non-MC support as legacy. It's legacy in the context of the CAL driver only, but API-wise it is not since there are many non-MC bridge drivers.

That's true, but also, non-MC bridge drivers do not need to use this 
function if the subdev drivers use the method shown in 1.2. I think this 
is the question here:

- Change all the callers and use the macro in this patch. Then the macro 
is not legacy.
- Change the callees, in which case this macro is needed only in some 
cases where, for whatever reason, a specific callee has not been changed 
(yet?). In this case it's legacy.

Changing the callers would be a nicer option, I think, but I also fear 
that it's very difficult and easily brings in bugs. I haven't looked 
closely, but I think it would be a big patch.

And it's not clear to me if there's a benefit: do all those drivers ever 
need to interact a state-aware subdev driver? If they do, maybe there 
are only a few such subdev drivers, and it's not a big issue to have the 
lock/unlock code in those state-aware subdev drivers. All the other 
state-aware subdev drivers would not need the legacy support code as 
they're used only in more modern pipelines.

  Tomi
