Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6915240D378
	for <lists+linux-media@lfdr.de>; Thu, 16 Sep 2021 08:52:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234686AbhIPGyH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Sep 2021 02:54:07 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:58506 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232254AbhIPGyH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Sep 2021 02:54:07 -0400
Received: from [192.168.1.111] (91-158-153-130.elisa-laajakaista.fi [91.158.153.130])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 70CBD2A5;
        Thu, 16 Sep 2021 08:52:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1631775166;
        bh=CcXkUo4YTxyP9sW4nUPseHW6XxnvGt4sYFzB/P2PKn0=;
        h=From:To:Cc:References:Subject:Date:In-Reply-To:From;
        b=C6TSjYa8NGMaV7raUdJpLg/doddBoVhNlcduifsk1MbrJCp8MNY2TjdcTKLziSdPr
         3XlVLsNGxE3Pc24HyD11RKBppnNQrEADoZqQHBu+1PJkPZWliuAjL41M7D+Ckc44Tm
         nhvyky2wt9t2UvxRQM+AMDw9YMPWw/zFtgNZLV8c=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>
References: <20210830110116.488338-1-tomi.valkeinen@ideasonboard.com>
 <20210830110116.488338-3-tomi.valkeinen@ideasonboard.com>
 <20210915094403.cazj7bjampnes4ba@uno.localdomain>
 <8e322af6-c010-f906-f733-6d3f770a48fc@ideasonboard.com>
Subject: Re: [PATCH v8 02/36] media: subdev: add active state to struct
 v4l2_subdev
Message-ID: <f0f4bc4b-7594-28ab-8e8a-2819ce82df47@ideasonboard.com>
Date:   Thu, 16 Sep 2021 09:52:42 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <8e322af6-c010-f906-f733-6d3f770a48fc@ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 16/09/2021 09:17, Tomi Valkeinen wrote:
> Hi,
> 
> On 15/09/2021 12:44, Jacopo Mondi wrote:
>> Hi Tomi,
>>
>> On Mon, Aug 30, 2021 at 02:00:42PM +0300, Tomi Valkeinen wrote:
>>> Add a new 'state' field to struct v4l2_subdev to which we can store the
>>> active state of a subdev. This will place the subdev configuration into
>>> a known place, allowing us to use the state directly from the v4l2
>>> framework, thus simplifying the drivers.
>>>
>>> We also add v4l2_subdev_alloc_state() and v4l2_subdev_free_state(),
>>> which need to be used by the drivers that support subdev state in struct
>>> v4l2_subdev.
>>>
>>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>>> ---
>>>   drivers/media/v4l2-core/v4l2-subdev.c | 21 ++++++++++++++++
>>>   include/media/v4l2-subdev.h           | 36 +++++++++++++++++++++++++++
>>>   2 files changed, 57 insertions(+)
>>>
>>> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c 
>>> b/drivers/media/v4l2-core/v4l2-subdev.c
>>> index 26a34a8e3d37..e1a794f69815 100644
>>> --- a/drivers/media/v4l2-core/v4l2-subdev.c
>>> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
>>> @@ -943,3 +943,24 @@ void v4l2_subdev_notify_event(struct v4l2_subdev 
>>> *sd,
>>>       v4l2_subdev_notify(sd, V4L2_DEVICE_NOTIFY_EVENT, (void *)ev);
>>>   }
>>>   EXPORT_SYMBOL_GPL(v4l2_subdev_notify_event);
>>> +
>>> +int v4l2_subdev_alloc_state(struct v4l2_subdev *sd)
>>> +{
>>> +    struct v4l2_subdev_state *state;
>>> +
>>> +    state = v4l2_alloc_subdev_state(sd);

Replying to this again, as the second email didn't actually cover all 
the topics...

>> So, I think this is one source of confusion about init_cfg.
>>
>> v4l2_alloc_subdev_state() calls init_cfg() and 'state-aware' driver
>> are now supposed to allocate their state by calling
>> v4l2_subdev_alloc_state(), in the same way as the core does for the
>> file-handle ones.
>>
>> This will lead to init_cfg to be called for the 'active' (ie owned by
>> the subdev) state, and then you need to add context to the state (by
>> adding a 'which' field) to know what state you're dealing with.
>>
>> According to the init_cfg() documentation
>>
>>   * @init_cfg: initialize the pad config to default values
>>
>> the op has to be called in order to initialize the per-file-handle
>> context, not the active one.
> 
> I have missed updating the documentation there =).

The documentation above doesn't imply per-file-handle context or TRY 
case, afaics. It just says "initialize state to default". Unless "pad 
config" always means TRY, which I think it doesn't as the drivers have 
internally been using pad configs.

But it's true that so far init_cfg has only been called for TRY case, 
and perhaps that's enough of a reason to keep it so.

>> I would rather just embed 'struct v4l2_subdev_state' in 'struct
>> v4l2_subdev', have the core going through the
> 
> Why would embedding the state change anything?
> 
>> 'v4l2_subdev_alloc_state()' to initialize the per-fh state, but have
>> drivers initialize their own state at probe time. If they need for
>> some reason to access their 'active' state at init_cfg() time, they
>> caan fish it from their subdev.
>>
>> If I'm not mistaken this will remove the need to have a which filed in
>> the state, as I think the 'context' should be inferred from the
>> 'which' argument embedded in the ops-specific structures, and not held
>> in the state itself.

It's true that the state's which field is mainly (probably only) needed 
for handling the init_cfg. It could be solved in other ways too:

- New subdev op to initialize active state
- New subdev op which gets 'which' as a parameter, to initialize both 
states (state-aware drivers wouldn't need to implement the old init_cfg)
- Coccinelle to change init_cfg to get the which as a parameter

Without doing any deep thinking, the middle one sounds best to me.

  Tomi
