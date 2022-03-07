Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1B88F4CF3C2
	for <lists+linux-media@lfdr.de>; Mon,  7 Mar 2022 09:37:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231969AbiCGIh2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Mar 2022 03:37:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232014AbiCGIh1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Mar 2022 03:37:27 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95CA9205E3
        for <linux-media@vger.kernel.org>; Mon,  7 Mar 2022 00:36:33 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 15DD260ED9
        for <linux-media@vger.kernel.org>; Mon,  7 Mar 2022 08:36:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0182EC340E9;
        Mon,  7 Mar 2022 08:36:30 +0000 (UTC)
Message-ID: <0d058225-d732-0368-b8be-562618ea9a8a@xs4all.nl>
Date:   Mon, 7 Mar 2022 09:36:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v5 5/6] media: subdev: add v4l2_subdev_call_state_active()
Content-Language: en-US
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
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
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <381d99d4-ccc6-6066-03b2-4870ffdccfd5@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 3/7/22 08:16, Tomi Valkeinen wrote:
> Hi Hans,
> 
> On 04/03/2022 15:34, Hans Verkuil wrote:
>> Hi Tomi,
>>
>> On 3/1/22 11:55, Tomi Valkeinen wrote:
>>> Add v4l2_subdev_call_state_active() macro to help calling subdev ops
>>> that take a subdev state as a parameter. Normally the v4l2 framework
>>> will lock and pass the correct subdev state to the subdev ops, but there
>>> are legacy situations where this is not the case (e.g. non-MC video
>>> device driver calling set_fmt in a source subdev).
>>>
>>> As this macro is only needed for legacy use cases, the macro is added in
>>> a new header file, v4l2-subdev-legacy.h.
>>>
>>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>>> ---
>>>   include/media/v4l2-subdev-legacy.h | 42 ++++++++++++++++++++++++++++++
>>>   1 file changed, 42 insertions(+)
>>>   create mode 100644 include/media/v4l2-subdev-legacy.h
>>>
>>> diff --git a/include/media/v4l2-subdev-legacy.h b/include/media/v4l2-subdev-legacy.h
>>> new file mode 100644
>>> index 000000000000..6a61e579b629
>>> --- /dev/null
>>> +++ b/include/media/v4l2-subdev-legacy.h
>>> @@ -0,0 +1,42 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>>> +/*
>>> + *  V4L2 sub-device legacy support header.
>>> + *
>>> + *  Copyright (C) 2022  Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>>> + */
>>> +
>>> +#ifndef _V4L2_SUBDEV_LEGACY_H
>>> +#define _V4L2_SUBDEV_LEGACY_H
>>> +
>>> +/**
>>> + * v4l2_subdev_call_state_active - call an operation of a v4l2_subdev which
>>> + *                   takes state as a parameter, passing the
>>> + *                   subdev its active state.
>>> + *
>>> + * @sd: pointer to the &struct v4l2_subdev
>>> + * @o: name of the element at &struct v4l2_subdev_ops that contains @f.
>>> + *     Each element there groups a set of callbacks functions.
>>> + * @f: callback function to be called.
>>> + *     The callback functions are defined in groups, according to
>>> + *     each element at &struct v4l2_subdev_ops.
>>> + * @args: arguments for @f.
>>> + *
>>> + * This is similar to v4l2_subdev_call(), except that this version can only be
>>> + * used for ops that take a subdev state as a parameter. The macro will get the
>>> + * active state and lock it before calling the op, and unlock it after the
>>> + * call.
>>> + */
>>
>> You should explain why this is a legacy macro and, ideally, what would need to
>> be done to get rid of it. The first is in the commit log, but nobody reads that :-)
>>
>> But if just using it in a non-MC video device driver constitutes 'legacy' use,
>> then I disagree with that. There are many non-MC video device drivers, nothing
>> legacy about that.
> 
> It's difficult to define all the scenarios where this can be used, but the ones I can imagine fall under legacy (depending on how you define that, though).
> 
> I use this in CAL driver, which supports non-MC (legacy) and MC. CAL has a bunch of video devices (one for each DMA engine) and two CSI-2 PHY devices (v4l2 subdevs).
> 
> When operating in MC mode, the userspace will call, e.g., set_fmt in the PHY subdev, and so forth.
> 
> But in non-MC case the userspace calls VIDIOC_S_FMT in the video dev, and the video dev has to propagate that to the PHY subdev. I do this propagation using the v4l2_subdev_call_state_active macro.
> 
> I don't know if there are other drivers that support both non-MC and MC modes. I could also just move this macro to the CAL driver, and we could add this to the v4l2 framework if we see other drivers using similar constructs.

It is common to have non-MC drivers that call set_fmt of a subdev.
Wouldn't they all need to use this helper macro? If so, then this is NOT a
legacy use, it's just a non-MC driver use.

Am I missing something?

Regards,

	Hans

> 
>  Tomi
