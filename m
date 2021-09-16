Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C83A40D31E
	for <lists+linux-media@lfdr.de>; Thu, 16 Sep 2021 08:17:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234524AbhIPGTK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Sep 2021 02:19:10 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:58226 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234527AbhIPGTI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Sep 2021 02:19:08 -0400
Received: from [192.168.1.111] (91-158-153-130.elisa-laajakaista.fi [91.158.153.130])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D7DED2A5;
        Thu, 16 Sep 2021 08:17:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1631773066;
        bh=iYCPuib0MItJiRSPhtg5wHxL/ZiTUmi3/zxckQ6Q/ww=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=kWpZmfMm+JAP5EYEHZIl9WirfGFULX1NQXQmBdf28x+b8n+oqa31+vyNwuL5//Sor
         RDpinWnf+NAE8Zg84T8Vz0gk43UrUG0AJbcHuQ4g5WbdmZAE1oy0YoWBBchs/6LjSA
         LL+NVoNhzx8oOW+zZ9oX4+jZyFXp0cKpHHtxVfko=
Subject: Re: [PATCH v8 02/36] media: subdev: add active state to struct
 v4l2_subdev
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
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Message-ID: <8e322af6-c010-f906-f733-6d3f770a48fc@ideasonboard.com>
Date:   Thu, 16 Sep 2021 09:17:42 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210915094403.cazj7bjampnes4ba@uno.localdomain>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 15/09/2021 12:44, Jacopo Mondi wrote:
> Hi Tomi,
> 
> On Mon, Aug 30, 2021 at 02:00:42PM +0300, Tomi Valkeinen wrote:
>> Add a new 'state' field to struct v4l2_subdev to which we can store the
>> active state of a subdev. This will place the subdev configuration into
>> a known place, allowing us to use the state directly from the v4l2
>> framework, thus simplifying the drivers.
>>
>> We also add v4l2_subdev_alloc_state() and v4l2_subdev_free_state(),
>> which need to be used by the drivers that support subdev state in struct
>> v4l2_subdev.
>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>> ---
>>   drivers/media/v4l2-core/v4l2-subdev.c | 21 ++++++++++++++++
>>   include/media/v4l2-subdev.h           | 36 +++++++++++++++++++++++++++
>>   2 files changed, 57 insertions(+)
>>
>> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
>> index 26a34a8e3d37..e1a794f69815 100644
>> --- a/drivers/media/v4l2-core/v4l2-subdev.c
>> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
>> @@ -943,3 +943,24 @@ void v4l2_subdev_notify_event(struct v4l2_subdev *sd,
>>   	v4l2_subdev_notify(sd, V4L2_DEVICE_NOTIFY_EVENT, (void *)ev);
>>   }
>>   EXPORT_SYMBOL_GPL(v4l2_subdev_notify_event);
>> +
>> +int v4l2_subdev_alloc_state(struct v4l2_subdev *sd)
>> +{
>> +	struct v4l2_subdev_state *state;
>> +
>> +	state = v4l2_alloc_subdev_state(sd);
> 
> So, I think this is one source of confusion about init_cfg.
> 
> v4l2_alloc_subdev_state() calls init_cfg() and 'state-aware' driver
> are now supposed to allocate their state by calling
> v4l2_subdev_alloc_state(), in the same way as the core does for the
> file-handle ones.
> 
> This will lead to init_cfg to be called for the 'active' (ie owned by
> the subdev) state, and then you need to add context to the state (by
> adding a 'which' field) to know what state you're dealing with.
> 
> According to the init_cfg() documentation
> 
>   * @init_cfg: initialize the pad config to default values
> 
> the op has to be called in order to initialize the per-file-handle
> context, not the active one.

I have missed updating the documentation there =).

> I would rather just embed 'struct v4l2_subdev_state' in 'struct
> v4l2_subdev', have the core going through the

Why would embedding the state change anything?

> 'v4l2_subdev_alloc_state()' to initialize the per-fh state, but have
> drivers initialize their own state at probe time. If they need for
> some reason to access their 'active' state at init_cfg() time, they
> caan fish it from their subdev.
> 
> If I'm not mistaken this will remove the need to have a which filed in
> the state, as I think the 'context' should be inferred from the
> 'which' argument embedded in the ops-specific structures, and not held
> in the state itself.

I'll comment on these in the next reply, as your second mail covered the 
same topics.

  Tomi
