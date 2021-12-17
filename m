Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47C1B478C18
	for <lists+linux-media@lfdr.de>; Fri, 17 Dec 2021 14:19:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236623AbhLQNT5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Dec 2021 08:19:57 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:54794 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234037AbhLQNT4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Dec 2021 08:19:56 -0500
Received: from [192.168.1.111] (91-156-85-209.elisa-laajakaista.fi [91.156.85.209])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E6F9292A;
        Fri, 17 Dec 2021 14:19:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1639747195;
        bh=Q2ju2t9kk34XW2YzZPI259ZuMIfX1d0QXiwBhaJnzEI=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=gR5MSt3cQ9vZTadDsy2uHLeeEYI9BggsgKW8ut1291EYqty738bfqLxljSaaAnYqy
         NMWUiW9fPOwhsyREPmAItbtjkI0qCwcT8sjIo/i+4AGmIcIPgeoRieG/FiFhSXqkRG
         LLEvTEu7nxzbq1A8mpZtKHvLUnVciBJncBmqvYKQ=
Subject: Re: [PATCH 2/6] media: subdev: add active state to struct v4l2_subdev
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>
References: <20211217111836.225013-1-tomi.valkeinen@ideasonboard.com>
 <20211217111836.225013-3-tomi.valkeinen@ideasonboard.com>
 <20211217120756.bcbfete54jcsmjmd@uno.localdomain>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Message-ID: <011a5285-0077-3267-8a8d-2be5b14af402@ideasonboard.com>
Date:   Fri, 17 Dec 2021 15:19:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211217120756.bcbfete54jcsmjmd@uno.localdomain>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 17/12/2021 14:07, Jacopo Mondi wrote:
> Hi Tomi,
> 
> On Fri, Dec 17, 2021 at 01:18:32PM +0200, Tomi Valkeinen wrote:
>> Add a new 'active_state' field to struct v4l2_subdev to which we can
>> store the active state of a subdev. This will place the subdev
>> configuration into a known place, allowing us to use the state directly
>> from the v4l2 framework, thus simplifying the drivers.
>>
>> Also add functions v4l2_subdev_init_finalize() and
>> v4l2_subdev_cleanup(), which will allocate and free the active state.
>> The functions are named in a generic way so that they can be also used
>> for other subdev initialization work.
>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>> Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>> ---
>>   drivers/media/v4l2-core/v4l2-subdev.c | 21 ++++++++++
>>   include/media/v4l2-subdev.h           | 58 +++++++++++++++++++++++++++
>>   2 files changed, 79 insertions(+)
>>
>> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
>> index fe49c86a9b02..de160140d63b 100644
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
>> +	sd->active_state = state;
>> +
>> +	return 0;
>> +}
>> +EXPORT_SYMBOL_GPL(v4l2_subdev_init_finalize);
>> +
>> +void v4l2_subdev_cleanup(struct v4l2_subdev *sd)
>> +{
>> +	__v4l2_subdev_state_free(sd->active_state);
>> +	sd->active_state = NULL;
>> +}
>> +EXPORT_SYMBOL_GPL(v4l2_subdev_cleanup);
>> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
>> index e52bf508c75b..eddf72768e10 100644
>> --- a/include/media/v4l2-subdev.h
>> +++ b/include/media/v4l2-subdev.h
>> @@ -645,6 +645,9 @@ struct v4l2_subdev_ir_ops {
>>    * This structure only needs to be passed to the pad op if the 'which' field
>>    * of the main argument is set to %V4L2_SUBDEV_FORMAT_TRY. For
>>    * %V4L2_SUBDEV_FORMAT_ACTIVE it is safe to pass %NULL.
>> + *
>> + * Note: This struct is also used in active state, and the try_ prefix is
>> + * historical and to be removed.
>>    */
>>   struct v4l2_subdev_pad_config {
>>   	struct v4l2_mbus_framefmt try_fmt;
>> @@ -898,6 +901,9 @@ struct v4l2_subdev_platform_data {
>>    * @subdev_notifier: A sub-device notifier implicitly registered for the sub-
>>    *		     device using v4l2_async_register_subdev_sensor().
>>    * @pdata: common part of subdevice platform data
>> + * @active_state: Active state for the subdev (NULL for subdevs tracking the
>> + *		  state internally). Initialized by calling
>> + *		  v4l2_subdev_init_finalize().
> 
> Is alignement a little off or is it my mail client ?

Looks correct to me. It's using tabs there. I don't like, I think it 
should be spaces, but I followed the convention used elsewhere.

  Tomi
