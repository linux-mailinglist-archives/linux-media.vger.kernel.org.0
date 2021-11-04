Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21C574451DD
	for <lists+linux-media@lfdr.de>; Thu,  4 Nov 2021 11:59:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231318AbhKDLCS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Nov 2021 07:02:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231254AbhKDLCR (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 4 Nov 2021 07:02:17 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D762C061714
        for <linux-media@vger.kernel.org>; Thu,  4 Nov 2021 03:59:39 -0700 (PDT)
Received: from [192.168.1.111] (91-158-153-130.elisa-laajakaista.fi [91.158.153.130])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7B3D7E52;
        Thu,  4 Nov 2021 11:59:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1636023576;
        bh=ftUo9/OXzwCUAy83vQOJ4mlc8sxaxylnokFGGWH9o+g=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=iu/8Oc7dMziQvV53TJKgUVTxokBrep1mksjmzPANDThdT/sYpRjThXAuSQg5KLV3n
         3rJ/RgkLyXAhDiNn6gbnL4z45upjRRNOglsAJzrdWvo5QLBQKukH+RLj+8LF5op9Aw
         NdFz9xDaCK82GwVny7V4qqYrE3tU91RzjgP93nl0=
Subject: Re: [PATCH v9 02/36] media: subdev: add active state to struct
 v4l2_subdev
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Pratyush Yadav <p.yadav@ti.com>
References: <20211005085750.138151-1-tomi.valkeinen@ideasonboard.com>
 <20211005085750.138151-3-tomi.valkeinen@ideasonboard.com>
 <710f80a6-81a4-3c98-70d5-364e015d8bfd@xs4all.nl>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Message-ID: <cdbb1b34-f3b5-8606-ee9c-91b575bfc349@ideasonboard.com>
Date:   Thu, 4 Nov 2021 12:59:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <710f80a6-81a4-3c98-70d5-364e015d8bfd@xs4all.nl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 12/10/2021 17:32, Hans Verkuil wrote:
> On 05/10/2021 10:57, Tomi Valkeinen wrote:
>> Add a new 'state' field to struct v4l2_subdev to which we can store the
>> active state of a subdev. This will place the subdev configuration into
>> a known place, allowing us to use the state directly from the v4l2
>> framework, thus simplifying the drivers.
>>
>> Also add functions v4l2_subdev_init_finalize() and
>> v4l2_subdev_cleanup(), which will allocate and free the active state.
>> The functions are named in a generic way so that they can be also used
>> for other subdev initialization work.
>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>> ---
>>   drivers/media/v4l2-core/v4l2-subdev.c | 21 +++++++++++
>>   include/media/v4l2-subdev.h           | 51 +++++++++++++++++++++++++++
>>   2 files changed, 72 insertions(+)
>>
>> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
>> index fe49c86a9b02..bcaf66a1e3d9 100644
>> --- a/drivers/media/v4l2-core/v4l2-subdev.c
>> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
>> @@ -943,3 +943,24 @@ void v4l2_subdev_notify_event(struct v4l2_subdev *sd,
>>   	v4l2_subdev_notify(sd, V4L2_DEVICE_NOTIFY_EVENT, (void *)ev);
>>   }
>>   EXPORT_SYMBOL_GPL(v4l2_subdev_notify_event);
>> +
>> +int v4l2_subdev_init_finalize(struct v4l2_subdev *sd)
>> +{
>> +	struct v4l2_subdev_state *state;
>> +
>> +	state = __v4l2_subdev_state_alloc(sd);
>> +	if (IS_ERR(state))
>> +		return PTR_ERR(state);
>> +
>> +	sd->state = state;
>> +
>> +	return 0;
>> +}
>> +EXPORT_SYMBOL_GPL(v4l2_subdev_init_finalize);
>> +
>> +void v4l2_subdev_cleanup(struct v4l2_subdev *sd)
>> +{
>> +	__v4l2_subdev_state_free(sd->state);
>> +	sd->state = NULL;
>> +}
>> +EXPORT_SYMBOL_GPL(v4l2_subdev_cleanup);
>> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
>> index e52bf508c75b..3aaa7146e5ff 100644
>> --- a/include/media/v4l2-subdev.h
>> +++ b/include/media/v4l2-subdev.h
>> @@ -898,6 +898,8 @@ struct v4l2_subdev_platform_data {
>>    * @subdev_notifier: A sub-device notifier implicitly registered for the sub-
>>    *		     device using v4l2_async_register_subdev_sensor().
>>    * @pdata: common part of subdevice platform data
>> + * @state: active state for the subdev (NULL for subdevs tracking the state
>> + *	   internally)
>>    *
>>    * Each instance of a subdev driver should create this struct, either
>>    * stand-alone or embedded in a larger struct.
>> @@ -929,6 +931,19 @@ struct v4l2_subdev {
>>   	struct v4l2_async_notifier *notifier;
>>   	struct v4l2_async_notifier *subdev_notifier;
>>   	struct v4l2_subdev_platform_data *pdata;
>> +
>> +	/*
>> +	 * The fields below are private, and should only be accessed via
>> +	 * appropriate functions.
>> +	 */
>> +
>> +	/*
>> +	 * TODO: state should most likely be changed from a pointer to an
>> +	 * embedded field. For the time being it's kept as a pointer to more
>> +	 * easily catch uses of state in the cases where the driver doesn't
>> +	 * support it.
>> +	 */
>> +	struct v4l2_subdev_state *state;
> 
> Hmm:
> 
> struct v4l2_subdev_state {
>          struct v4l2_subdev_pad_config *pads;
> };
> 
> and:
> 
> struct v4l2_subdev_pad_config {
>          struct v4l2_mbus_framefmt try_fmt;
>          struct v4l2_rect try_crop;
>          struct v4l2_rect try_compose;
> };
> 
> So why is this the active state if struct v4l2_subdev_pad_config has try_* fields?
> 
> At the very least it should be mentioned somewhere in the code (and probably commit
> log as well) that the try_ prefix is historical, or will be removed later, or something
> like that.

I'll add a note about it. I did not want to do renames like this yet, as 
they'll affect multiple drivers, creating a conflict hell when rebasing 
this series.

Also note that at the moment those try_* fields are only used in 
try-context. Upstream drivers do not support active state, so they'll 
only get the TRY version of v4l2_subdev_state. And the new drivers that 
support active state do not use the 'pads' field nor v4l2_subdev_pad_config.

  Tomi
