Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15EFC408A9F
	for <lists+linux-media@lfdr.de>; Mon, 13 Sep 2021 14:00:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239830AbhIMMBw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Sep 2021 08:01:52 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:35326 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239811AbhIMMBt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Sep 2021 08:01:49 -0400
Received: from [192.168.1.111] (91-158-153-130.elisa-laajakaista.fi [91.158.153.130])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 00F799E;
        Mon, 13 Sep 2021 14:00:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1631534427;
        bh=oYg3xjt1V/svGJLAzRU8oYrm0/RjxZsLIat01GJRR/E=;
        h=To:Cc:References:From:Subject:Date:In-Reply-To:From;
        b=Q7e1uTalBdPxqCzUh8PUvS+54cZi7sQrRxoXIYfWAZV7yjOQOkDM9JCXKkD/yIq/a
         PmxVTTUU4O4KSzdwaqOgGjhiWShRjHwG29Jq0vLOOPgO8xxqaleMdTr8n0dTMneOgG
         jKTTwTehBcpwToXiiE5kJY5kXenn5owunoZTuPd8=
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
 <20210913105723.dppl2uwcnyzas77d@uno.localdomain>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v8 02/36] media: subdev: add active state to struct
 v4l2_subdev
Message-ID: <e880395b-d33b-5208-22b0-c93aa6b03989@ideasonboard.com>
Date:   Mon, 13 Sep 2021 15:00:24 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210913105723.dppl2uwcnyzas77d@uno.localdomain>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 13/09/2021 13:57, Jacopo Mondi wrote:
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
>> +	if (IS_ERR(state))
>> +		return PTR_ERR(state);
>> +
>> +	sd->state = state;
>> +
>> +	return 0;
>> +}
>> +EXPORT_SYMBOL_GPL(v4l2_subdev_alloc_state);
>> +
>> +void v4l2_subdev_free_state(struct v4l2_subdev *sd)
>> +{
>> +	v4l2_free_subdev_state(sd->state);
>> +	sd->state = NULL;
>> +}
>> +EXPORT_SYMBOL_GPL(v4l2_subdev_free_state);
>> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
>> index 8701d2e7d893..ecaf040ead57 100644
>> --- a/include/media/v4l2-subdev.h
>> +++ b/include/media/v4l2-subdev.h
>> @@ -898,6 +898,8 @@ struct v4l2_subdev_platform_data {
>>    * @subdev_notifier: A sub-device notifier implicitly registered for the sub-
>>    *		     device using v4l2_async_register_subdev_sensor().
>>    * @pdata: common part of subdevice platform data
>> + * @state: active state for the subdev (NULL for subdevs tracking the state
>> + * 	   internally)
>>    *
>>    * Each instance of a subdev driver should create this struct, either
>>    * stand-alone or embedded in a larger struct.
>> @@ -929,6 +931,7 @@ struct v4l2_subdev {
>>   	struct v4l2_async_notifier *notifier;
>>   	struct v4l2_async_notifier *subdev_notifier;
>>   	struct v4l2_subdev_platform_data *pdata;
>> +	struct v4l2_subdev_state *state;
> 
> Is there anything preventing state from being a struct member and only
> allocate the required number of v4l2_subdev_pad_config entries ?

Perhaps nothing strictly prevents it, but having the state pointer != 
NULL tells us that the driver has created the state. One annoyance was 
that I didn't find a good place to implicitly create the state based on 
a subdev flag. Instead the subdev driver needs to call 
v4l2_subdev_alloc_state() explicitly. So having the state as a pointer 
makes it clear that the state has been initialized.

>>   };
>>
>>
>> @@ -1217,4 +1220,37 @@ extern const struct v4l2_subdev_ops v4l2_subdev_call_wrappers;
>>   void v4l2_subdev_notify_event(struct v4l2_subdev *sd,
>>   			      const struct v4l2_event *ev);
>>
>> +/**
>> + * v4l2_subdev_alloc_state() - Allocate active subdev state for subdevice
>> + * @sd: The subdev for which the state is allocated
>> + *
>> + * This will allocate a subdev state and store it to
>> + * &struct v4l2_subdev->state.
>> + *
>> + * Must call v4l2_subdev_free_state() when the state is no longer needed.
>> + */
>> +int v4l2_subdev_alloc_state(struct v4l2_subdev *sd);
>> +
>> +/**
>> + * v4l2_subdev_free_state() - Free the active subdev state for subdevice
>> + * @sd: The subdevice
>> + *
>> + * This will free the subdev's state and set
>> + * &struct v4l2_subdev->state to NULL.
>> + */
>> +void v4l2_subdev_free_state(struct v4l2_subdev *sd);
>> +
>> +/**
>> + * v4l2_subdev_get_active_state() - Return the active subdev state for subdevice
>> + * @sd: The subdevice
>> + *
>> + * Return the active state for the subdevice, or NULL if the subdev does not
>> + * support active state.
>> + */
>> +static inline struct v4l2_subdev_state *
>> +v4l2_subdev_get_active_state(struct v4l2_subdev *sd)
>> +{
>> +	return sd->state;
>> +}
> 
> It would also make safer to access sd->state, as if a driver doesn't
> allocate a state but calls this function it would get back a NULL
> pointer.

Would WARN_ON(!sd->state) be ok?

> Also, the name 'active' suggests there will be a non-active state ?

It's the V4L2_SUBDEV_FORMAT_ACTIVE vs V4L2_SUBDEV_FORMAT_TRY. For TRY we 
don't need getters, as the TRY state is passed directly to the relevant 
ops. But the drivers need to get the ACTIVE state, e.g. when starting 
the streaming.

  Tomi
