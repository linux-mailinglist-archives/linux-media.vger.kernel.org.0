Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7974B42A742
	for <lists+linux-media@lfdr.de>; Tue, 12 Oct 2021 16:32:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235309AbhJLOeU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Oct 2021 10:34:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237252AbhJLOeR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Oct 2021 10:34:17 -0400
Received: from lb2-smtp-cloud8.xs4all.net (lb2-smtp-cloud8.xs4all.net [IPv6:2001:888:0:108::2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5524DC06174E
        for <linux-media@vger.kernel.org>; Tue, 12 Oct 2021 07:32:15 -0700 (PDT)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id aIp8msThAx7rIaIpBmMLye; Tue, 12 Oct 2021 16:32:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1634049133; bh=g9XrZmnh3UMjJvBHCpehZSHtTZAD1I3BElsxJwgBDU4=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=EvNVa7DvnLTku3E32R9NqVfvSWIwA0b1qEndaZW6mlyIBF7B2rxbx5j1y2wBmXZV+
         kTKE8t7KVWNZ1MKDYiaNRiBSRWcQCpoc9yhfOKtr9C3cMcbLt9sv+IebVWDmbCZc1T
         00O+F8jwyMVKW+FD6vwJiClAUQOwH997JNWTiVe0t1CGFQHH58iwUKkpXouKfOHvaU
         2rrbBDzPR/3gk2Y5Dg49EZXGdMpkHfrAieW3T3ztPWV9ZyEjjzz89LdHf0zFCQiWbg
         vBYceH4n000mV8cQNuBDMOLHzG/uoQWooxdHxeDa/wVRybEigMx0SFlKpVwwJb2OhU
         G66SuRAC8nNDA==
Subject: Re: [PATCH v9 02/36] media: subdev: add active state to struct
 v4l2_subdev
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Pratyush Yadav <p.yadav@ti.com>
References: <20211005085750.138151-1-tomi.valkeinen@ideasonboard.com>
 <20211005085750.138151-3-tomi.valkeinen@ideasonboard.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <710f80a6-81a4-3c98-70d5-364e015d8bfd@xs4all.nl>
Date:   Tue, 12 Oct 2021 16:32:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211005085750.138151-3-tomi.valkeinen@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfOrRIVBBWX4yJc94+fMD2ea3BlpXPs+etg85PmWnodJHohPiQ7hxb2TCfizk2zZ0OHkWubFouhfF8cwF1I+Eb5djvhM32+EDXtaawPYlvxE4zH7C5S3N
 LjyPEpPD8mOD9WXRtpUwbybbOvnC3qzTtOgu1OFsoqv7+O5P5ThhD+COXzSexf3TSjP+q09MfLE7Egfz+VROXFlA8YN1DKpC3+ZhuVfkcrw0dai3m5AZ7o90
 tu0CBkWfNSsxlgLPgr0pHRWPEp4z6WZU6cbzYATHUW1KRZohwJiBqddlB7S4pTiQYw1raJK4qqyAh1UTXDCUT+cv3Z+1pIoskczoCC1stk5xQ7ixp9UV46fU
 r7xpyKiEtAT7vV9jwc3AxVTpd29mC+I3XFJ97pVynuzd6i4Sr2dp98MLHRkTe3Q79caOeLBcOgeKZDPZzA84BKDigPklu6gF21ozXLLtN/12wg77yruoqV6N
 6pb2y4Lx7r5m/r/e8RaSgj67tN+RXWA3MeXfDQ==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 05/10/2021 10:57, Tomi Valkeinen wrote:
> Add a new 'state' field to struct v4l2_subdev to which we can store the
> active state of a subdev. This will place the subdev configuration into
> a known place, allowing us to use the state directly from the v4l2
> framework, thus simplifying the drivers.
> 
> Also add functions v4l2_subdev_init_finalize() and
> v4l2_subdev_cleanup(), which will allocate and free the active state.
> The functions are named in a generic way so that they can be also used
> for other subdev initialization work.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/media/v4l2-core/v4l2-subdev.c | 21 +++++++++++
>  include/media/v4l2-subdev.h           | 51 +++++++++++++++++++++++++++
>  2 files changed, 72 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index fe49c86a9b02..bcaf66a1e3d9 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -943,3 +943,24 @@ void v4l2_subdev_notify_event(struct v4l2_subdev *sd,
>  	v4l2_subdev_notify(sd, V4L2_DEVICE_NOTIFY_EVENT, (void *)ev);
>  }
>  EXPORT_SYMBOL_GPL(v4l2_subdev_notify_event);
> +
> +int v4l2_subdev_init_finalize(struct v4l2_subdev *sd)
> +{
> +	struct v4l2_subdev_state *state;
> +
> +	state = __v4l2_subdev_state_alloc(sd);
> +	if (IS_ERR(state))
> +		return PTR_ERR(state);
> +
> +	sd->state = state;
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(v4l2_subdev_init_finalize);
> +
> +void v4l2_subdev_cleanup(struct v4l2_subdev *sd)
> +{
> +	__v4l2_subdev_state_free(sd->state);
> +	sd->state = NULL;
> +}
> +EXPORT_SYMBOL_GPL(v4l2_subdev_cleanup);
> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index e52bf508c75b..3aaa7146e5ff 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -898,6 +898,8 @@ struct v4l2_subdev_platform_data {
>   * @subdev_notifier: A sub-device notifier implicitly registered for the sub-
>   *		     device using v4l2_async_register_subdev_sensor().
>   * @pdata: common part of subdevice platform data
> + * @state: active state for the subdev (NULL for subdevs tracking the state
> + *	   internally)
>   *
>   * Each instance of a subdev driver should create this struct, either
>   * stand-alone or embedded in a larger struct.
> @@ -929,6 +931,19 @@ struct v4l2_subdev {
>  	struct v4l2_async_notifier *notifier;
>  	struct v4l2_async_notifier *subdev_notifier;
>  	struct v4l2_subdev_platform_data *pdata;
> +
> +	/*
> +	 * The fields below are private, and should only be accessed via
> +	 * appropriate functions.
> +	 */
> +
> +	/*
> +	 * TODO: state should most likely be changed from a pointer to an
> +	 * embedded field. For the time being it's kept as a pointer to more
> +	 * easily catch uses of state in the cases where the driver doesn't
> +	 * support it.
> +	 */
> +	struct v4l2_subdev_state *state;

Hmm:

struct v4l2_subdev_state {
        struct v4l2_subdev_pad_config *pads;
};

and:

struct v4l2_subdev_pad_config {
        struct v4l2_mbus_framefmt try_fmt;
        struct v4l2_rect try_crop;
        struct v4l2_rect try_compose;
};

So why is this the active state if struct v4l2_subdev_pad_config has try_* fields?

At the very least it should be mentioned somewhere in the code (and probably commit
log as well) that the try_ prefix is historical, or will be removed later, or something
like that.

Regards,

	Hans

>  };
>  
>  
> @@ -1217,4 +1232,40 @@ extern const struct v4l2_subdev_ops v4l2_subdev_call_wrappers;
>  void v4l2_subdev_notify_event(struct v4l2_subdev *sd,
>  			      const struct v4l2_event *ev);
>  
> +/**
> + * v4l2_subdev_init_finalize() - Finalize the initialization of the subdevice
> + * @sd: The subdev
> + *
> + * This finalizes the initialization of the subdev, including allocation of
> + * the active state for the subdev.
> + *
> + * This must be called by the subdev drivers that use the centralized active
> + * state, after the subdev struct has been initialized and
> + * media_entity_pads_init() has been called.
> + *
> + * Must call v4l2_subdev_cleanup() when the subdev is being removed.
> + */
> +int v4l2_subdev_init_finalize(struct v4l2_subdev *sd);
> +
> +/**
> + * v4l2_subdev_cleanup() - Release the resources needed by the subdevice
> + * @sd: The subdevice
> + *
> + * This will release the resources allocated in v4l2_subdev_init_finalize.
> + */
> +void v4l2_subdev_cleanup(struct v4l2_subdev *sd);
> +
> +/**
> + * v4l2_subdev_get_active_state() - Return the active subdev state for subdevice
> + * @sd: The subdevice
> + *
> + * Return the active state for the subdevice, or NULL if the subdev does not
> + * support active state.
> + */
> +static inline struct v4l2_subdev_state *
> +v4l2_subdev_get_active_state(struct v4l2_subdev *sd)
> +{
> +	return sd->state;
> +}
> +
>  #endif
> 

