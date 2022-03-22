Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A8EC64E3BE0
	for <lists+linux-media@lfdr.de>; Tue, 22 Mar 2022 10:46:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231180AbiCVJrl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Mar 2022 05:47:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231794AbiCVJrk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Mar 2022 05:47:40 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C5926A416
        for <linux-media@vger.kernel.org>; Tue, 22 Mar 2022 02:46:09 -0700 (PDT)
Received: from [192.168.1.111] (91-156-85-209.elisa-laajakaista.fi [91.156.85.209])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 81A249DE;
        Tue, 22 Mar 2022 10:46:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1647942367;
        bh=IxZIMOt9d6XbBTCzYHOf+CRhAtDrs2+qQO9U6ScxHDw=;
        h=Date:Subject:To:References:From:In-Reply-To:From;
        b=DglucBrDYq4ccw1LXbCyhU7dVTsmLAn2Uc5wIGYUDibPoe00GcNjz6zmmfAXhPZz7
         xEHI+CusWhTEM1jv38GOFC0hNLwbtiCpgpyPomClJOGluSm9XyTJ4Ht8tU/iKqtiNu
         oHHWmkeYqbyTOIZL8TF2vCIp9rpP8F8QkhcNPGi0=
Message-ID: <2661ceec-b90b-4c7c-0b65-631693b6f74b@ideasonboard.com>
Date:   Tue, 22 Mar 2022 11:46:03 +0200
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
 <84e6019a-ed8a-918a-a4a9-0c868cc1b1b5@ideasonboard.com>
 <3aa7a854-b2e3-12c5-0e2a-3d80b451ec80@xs4all.nl>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <3aa7a854-b2e3-12c5-0e2a-3d80b451ec80@xs4all.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 22/03/2022 11:23, Hans Verkuil wrote:

> Can you make a patch that converts ov5648.c (or a similar driver) to use
> sd->active_state? I'd like to see how that looks.

I have ov5640, I can convert that one.
> Right. So to confirm: the only reason a state-ware subdev set_fmt op is called
> with a NULL state pointer is if it is called from non-MC bridge drivers? And if

I hope so. There could be MC bridge or subdev drivers that call set_fmt 
(or get_fmt) on other subdevs. I cannot figure out why that would be 
done, though, and it sounds wrong to me. Afaik, with MC, set_fmt (and 
other such calls) always come from the userspace, and each subdev is 
configured separately from the others.

But if there are such drivers, they'll get fixed along the non-MC bridge 
drivers.

> we would update those bridge drivers to always pass a non-NULL state pointer,
> then such subdevs no longer need to care about this and can just use the state.

That's correct.

>>> 2.1) How to convert a bridge driver (either non-MC or MC, but no state support) to properly support a fully converted subdev (MC state-aware) driver?
>>
>> Converting non-MC driver to an MC driver is out of the context here, as it's not related to the active state. An MC bridge driver should work fine with state-aware subdev drivers, as the bridge driver
>> should not call any of the subdev's state-related ops.
>>
>> To make a non-MC bridge driver support state-aware subdev drivers, they can use the macro in this patch.
> 
> That sounds good to me.
> 
> The only legacy bit about the macro, though, is the fact that v4l2_subdev_get_active_state()
> can return NULL: that indicates that the subdev driver isn't properly state-aware.
> 
> So I think this should be a regular macro in v4l2-subdev.h.
> 
> Perhaps with a comment mentioning that v4l2_subdev_get_active_state() can be replaced by
> v4l2_subdev_lock_and_get_active_state() once all subdevs are state-aware.

Yes, that's true. I'll add the comment, and move this back to v4l2-subdev.h.

>>> 2.2) What is the legacy code that such a bridge driver has to keep in order to work with older subdev drivers that are not yet MC state-aware?
>>
>> The older subdev drivers should keep working without any extra code.
>>
>>> The code needed for 1.2 and 2.2 (helper functions/macros) is legacy code, and can be marked as such.
>>>> If this is clear, then we can work towards converting both subdev and
>> bridge drivers and eventually (might take years!) get rid of the legacy code.
>>>
>>> Removing support for case 2 is probably something that we want to do sooner than later.
>>>
>>> For the CAL driver I do not consider non-MC support as legacy. It's legacy in the context of the CAL driver only, but API-wise it is not since there are many non-MC bridge drivers.
>>
>> That's true, but also, non-MC bridge drivers do not need to use this function if the subdev drivers use the method shown in 1.2. I think this is the question here:
>>
>> - Change all the callers and use the macro in this patch. Then the macro is not legacy.
>> - Change the callees, in which case this macro is needed only in some cases where, for whatever reason, a specific callee has not been changed (yet?). In this case it's legacy.
>>
>> Changing the callers would be a nicer option, I think, but I also fear that it's very difficult and easily brings in bugs. I haven't looked closely, but I think it would be a big patch.
> 
> I believe changing the callers is the correct approach. Next to that I want to slowly
> convert all subdevs to be state-aware (i.e. use sd->active_state etc). Based on past
> experience it is a really bad idea to have all these variations in how subdevs work.
> That should be minimized.
> 
> I suspect that modifying the callers isn't as bad as you might think. It is also the
> sane approach: passing the active_state to the subdev really *is* what you want to do.
> It is not a hack, it is the right thing. Adding a workaround in a subdev where a
> NULL state is handled separately is, however, a hack, and a hack that is all to easy
> to forget to implement in new drivers.

Ok.

I'll send a v6 soon with the changes we've discussed, and I'll take a 
look at ov5640.c and changing the callers.

  Tomi
