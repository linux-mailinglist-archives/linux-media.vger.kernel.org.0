Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 154967BF487
	for <lists+linux-media@lfdr.de>; Tue, 10 Oct 2023 09:40:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1442496AbjJJHkM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Oct 2023 03:40:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1442480AbjJJHkL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Oct 2023 03:40:11 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 178509E
        for <linux-media@vger.kernel.org>; Tue, 10 Oct 2023 00:40:10 -0700 (PDT)
Received: from [192.168.88.20] (91-157-153-81.elisa-laajakaista.fi [91.157.153.81])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 353303D6;
        Tue, 10 Oct 2023 09:40:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1696923607;
        bh=TGdBHzD5J8jcBqsL1KOb8cPA5lHVkmyeE4018Hfopk8=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=Q8qCL0sNsge0U6BY7BYYSj0pUCqWbxhb9zYgdi6v3NxAM8+hP6K7PLInfkxnqn5VL
         O1H4Y8AYi2bhFJnsJ29GCmxK0El0Vf8EHGLDulKOlAirrMGvFuDGxP5I8hOvzl2jhZ
         vUz9gvDMPdXn6Mul1yRPuc+kLbRKvUO8D+CVQpWM=
Message-ID: <7dccde6c-e82f-4c63-bfbc-b0f1170e2796@ideasonboard.com>
Date:   Tue, 10 Oct 2023 10:40:05 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] V4L2 sub-device active state helper, CCS fixes
Content-Language: en-US
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20231009220906.221303-1-sakari.ailus@linux.intel.com>
 <d5cf6f37-c1d2-4b79-bf12-611fead262bc@ideasonboard.com>
 <ZST7+X7jwjVxNtTF@kekkonen.localdomain>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <ZST7+X7jwjVxNtTF@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 10/10/2023 10:23, Sakari Ailus wrote:
> Moi,
> 
> On Tue, Oct 10, 2023 at 09:52:48AM +0300, Tomi Valkeinen wrote:
>> On 10/10/2023 01:09, Sakari Ailus wrote:
>>> Hi folks,
>>>
>>> This set includes a helper for working with V4L2 sub-device active state as
>>> well as a fix for the CCS driver sub-device state patch.
>>>
>>> since v1:
>>>
>>> - There were other drivers using __v4l2_subdev_state_alloc(). Ouch. Change
>>>     those users as well. Note that this function should not be used in
>>>     drivers, hence API niceness is not a high priority.
>>>
>>> Sakari Ailus (4):
>>>     media: v4l: subdev: Set sub-device active state earlier
>>>     media: v4l: subdev: Add a helper to tell if a sub-device state is
>>>       active
>>>     media: ccs: Rework initialising sub-device state
>>>     media: ccs: Fix a (harmless) lockdep warning
>>>
>>>    drivers/media/i2c/ccs/ccs-core.c              | 64 ++++++++++++-------
>>>    .../platform/renesas/rcar-vin/rcar-v4l2.c     |  3 +-
>>>    .../media/platform/renesas/vsp1/vsp1_entity.c |  3 +-
>>>    drivers/media/v4l2-core/v4l2-subdev.c         | 14 ++--
>>>    drivers/staging/media/tegra-video/vi.c        |  2 +-
>>>    include/media/v4l2-subdev.h                   | 11 +++-
>>>    6 files changed, 66 insertions(+), 31 deletions(-)
>>>
>>
>> I'm not familiar with the CCS driver, and you don't explain much why you are
>> doing this, so it's a bit unclear to me. But I don't like it.
>>
>> The idea with the subdev state was that the driver doesn't need to know
>> whether it's active-state or try-state. It should behave the same way in
>> both cases. This series goes against that.
>>
>> Can you explain a bit what the issue is and what you are doing in this
>> series?
> 
> The driver maintains internal state and that needs to be updated when the
> configuration (including what's in sub-device state) changes. Generally the
> driver knows (as for the whence field) which state it's dealing with but
> that is not the case for init_cfg.

So you need to set the subdev state to sd->active_state earlier (in 
patch 1) so that the driver can use v4l2_subdev_state_whence()? You 
don't really explain that in the patch descriptions.

In other words, if init_cfg() were to get a whence-parameter, this 
wouldn't be needed? (I don't want to do that, just trying to understand 
what's going on).

> Alternatively I could split the internal workings of the driver into active
> and try states but I prefer to improve the framework and make the driver
> simpler.

I agree with the goal, but I don't think this is improving the framework.

If we decide that we need to know if a state is an active-state or a 
try-state, I think it's better to add a whence-field into the state 
itself. But I'd rather not.

> Deducing the internal configuration solely based on sub-device state is not
> really feasible.

Am I correct in that what you really need is a way to sub-class the 
subdev state, so that you can have all that internal state in the subdev 
state, and thus all the code in the driver can work in "whence-agnostic" 
manner? That's something we've been thinking about for a long time.

But the driver needs to be fixed now, not at some point in the future, 
of course. If the sub-classing would solve the issue (i.e. we have a 
plan in mind), I'd rather just hack this in the driver, instead of 
extending the framework, which might easily lead to other drivers going 
the wrong way too.

How about a private flag, set before calling 
v4l2_subdev_init_finalize(), and unset after the call. ccs_init_cfg() 
can look at that flag an if it's set, it's initializing an active state.

  Tomi

