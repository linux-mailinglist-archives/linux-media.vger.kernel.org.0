Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AFAE04CF48A
	for <lists+linux-media@lfdr.de>; Mon,  7 Mar 2022 10:17:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235229AbiCGJST (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Mar 2022 04:18:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236547AbiCGJSH (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Mar 2022 04:18:07 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0ECE065162
        for <linux-media@vger.kernel.org>; Mon,  7 Mar 2022 01:17:03 -0800 (PST)
Received: from [192.168.1.111] (91-156-85-209.elisa-laajakaista.fi [91.156.85.209])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7CD8651C;
        Mon,  7 Mar 2022 10:17:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1646644621;
        bh=qiI0rsy5RmK/NfRQq8eNa6A07OJdI8tpYvLTTDNBad0=;
        h=Date:Subject:To:References:From:In-Reply-To:From;
        b=mEIV2Kcx7u2TB0ZhR3IK/CIsgW+o3nlt4biYOrbdxOvymaQv5vfY54lADXhtjpCP7
         T5UjoRY2QCav/n8hwzEeMblTvaD2pBj1KoS8DtpHhePcV/f/uIR+c9mj+hOgHUBZRy
         vQSmI2ft7BEP9j6aIpEjVj2Gv83lGrFVEw+Odrjw=
Message-ID: <d40d3f0f-c1f1-301e-878d-7bdc33a494c6@ideasonboard.com>
Date:   Mon, 7 Mar 2022 11:16:56 +0200
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
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <0d058225-d732-0368-b8be-562618ea9a8a@xs4all.nl>
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

Hi Hans,

On 07/03/2022 10:36, Hans Verkuil wrote:
> 
> 
> On 3/7/22 08:16, Tomi Valkeinen wrote:
>> Hi Hans,
>>
>> On 04/03/2022 15:34, Hans Verkuil wrote:
>>> Hi Tomi,
>>>
>>> On 3/1/22 11:55, Tomi Valkeinen wrote:
>>>> Add v4l2_subdev_call_state_active() macro to help calling subdev ops
>>>> that take a subdev state as a parameter. Normally the v4l2 framework
>>>> will lock and pass the correct subdev state to the subdev ops, but there
>>>> are legacy situations where this is not the case (e.g. non-MC video
>>>> device driver calling set_fmt in a source subdev).
>>>>
>>>> As this macro is only needed for legacy use cases, the macro is added in
>>>> a new header file, v4l2-subdev-legacy.h.
>>>>
>>>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>>>> ---
>>>>    include/media/v4l2-subdev-legacy.h | 42 ++++++++++++++++++++++++++++++
>>>>    1 file changed, 42 insertions(+)
>>>>    create mode 100644 include/media/v4l2-subdev-legacy.h
>>>>
>>>> diff --git a/include/media/v4l2-subdev-legacy.h b/include/media/v4l2-subdev-legacy.h
>>>> new file mode 100644
>>>> index 000000000000..6a61e579b629
>>>> --- /dev/null
>>>> +++ b/include/media/v4l2-subdev-legacy.h
>>>> @@ -0,0 +1,42 @@
>>>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>>>> +/*
>>>> + *  V4L2 sub-device legacy support header.
>>>> + *
>>>> + *  Copyright (C) 2022  Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>>>> + */
>>>> +
>>>> +#ifndef _V4L2_SUBDEV_LEGACY_H
>>>> +#define _V4L2_SUBDEV_LEGACY_H
>>>> +
>>>> +/**
>>>> + * v4l2_subdev_call_state_active - call an operation of a v4l2_subdev which
>>>> + *                   takes state as a parameter, passing the
>>>> + *                   subdev its active state.
>>>> + *
>>>> + * @sd: pointer to the &struct v4l2_subdev
>>>> + * @o: name of the element at &struct v4l2_subdev_ops that contains @f.
>>>> + *     Each element there groups a set of callbacks functions.
>>>> + * @f: callback function to be called.
>>>> + *     The callback functions are defined in groups, according to
>>>> + *     each element at &struct v4l2_subdev_ops.
>>>> + * @args: arguments for @f.
>>>> + *
>>>> + * This is similar to v4l2_subdev_call(), except that this version can only be
>>>> + * used for ops that take a subdev state as a parameter. The macro will get the
>>>> + * active state and lock it before calling the op, and unlock it after the
>>>> + * call.
>>>> + */
>>>
>>> You should explain why this is a legacy macro and, ideally, what would need to
>>> be done to get rid of it. The first is in the commit log, but nobody reads that :-)
>>>
>>> But if just using it in a non-MC video device driver constitutes 'legacy' use,
>>> then I disagree with that. There are many non-MC video device drivers, nothing
>>> legacy about that.
>>
>> It's difficult to define all the scenarios where this can be used, but the ones I can imagine fall under legacy (depending on how you define that, though).
>>
>> I use this in CAL driver, which supports non-MC (legacy) and MC. CAL has a bunch of video devices (one for each DMA engine) and two CSI-2 PHY devices (v4l2 subdevs).
>>
>> When operating in MC mode, the userspace will call, e.g., set_fmt in the PHY subdev, and so forth.
>>
>> But in non-MC case the userspace calls VIDIOC_S_FMT in the video dev, and the video dev has to propagate that to the PHY subdev. I do this propagation using the v4l2_subdev_call_state_active macro.
>>
>> I don't know if there are other drivers that support both non-MC and MC modes. I could also just move this macro to the CAL driver, and we could add this to the v4l2 framework if we see other drivers using similar constructs.
> 
> It is common to have non-MC drivers that call set_fmt of a subdev.
> Wouldn't they all need to use this helper macro? If so, then this is NOT a
> legacy use, it's just a non-MC driver use.

These non-MC drivers that call set_fmt of a subdev, they're video device 
drivers, right? In other words, there are no subdev drivers that call 
set_fmt on other subdevs?

This does get a bit complex, keeping the old and new code working 
together. In this context, I think we have three different "classes":

1. non-MC
2. MC, no state support
3. MC, state support

We have classes 1 and 2 in upstream, and 3 will be enabled with this 
series (and expanded with the streams series).

Classes 1 and 2 continue working as before. If you have a pipeline with 
only class 3 drivers, it works without any legacy "hacks". The problems 
come when you combine 1 or 2 with 3. Or possibly the problems appear 
only when combining class 1 and class 3, as class 2 drivers are not 
supposed to call subdev ops which take a state parameter on other subdevs.

A class 3 driver expects to get either a try or an active state as a 
parameter, but class 1 drivers pass NULL for the active state. If you 
write a class 3 driver and want it to work with class 1 (without any 
changes to those drivers), you must do extra plumbing in the ops 
functions, to catch the NULL state case and get & lock the state 
yourself. If you do that, this macro is not needed.

Alternatively, class 1 drivers could be changed to use this macro, so 
that a possible class 3 driver in the pipeline would work without 
additional code. But there are a lot of class 1 drivers, and thus 
modifications, and I wasn't planning to go that way.

The CAL driver I mentioned supports both class 1 and class 3 (via a 
module parameter) in the video dev driver, and the class 1 mode uses 
this macro as CAL's PHY subdev (part of the same driver) is a class 3 
subdev. The class 1 support is legacy support in CAL's case.

So... Depending on what kind of driver combinations we want to support, 
this may or may not be legacy, depending on how you define legacy =).

  Tomi
