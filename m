Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 61ECD473693
	for <lists+linux-media@lfdr.de>; Mon, 13 Dec 2021 22:29:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243127AbhLMV3o (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Dec 2021 16:29:44 -0500
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:50255 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234055AbhLMV3n (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Dec 2021 16:29:43 -0500
Received: (Authenticated sender: jacopo@jmondi.org)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 5AC721BF203;
        Mon, 13 Dec 2021 21:29:40 +0000 (UTC)
Date:   Mon, 13 Dec 2021 22:30:33 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>
Subject: Re: [PATCH v10 02/38] media: subdev: add active state to struct
 v4l2_subdev
Message-ID: <20211213213033.sr3isjmxvyl47qgl@uno.localdomain>
References: <20211130141536.891878-1-tomi.valkeinen@ideasonboard.com>
 <20211130141536.891878-3-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211130141536.891878-3-tomi.valkeinen@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

On Tue, Nov 30, 2021 at 04:15:00PM +0200, Tomi Valkeinen wrote:
> Add a new 'active_state' field to struct v4l2_subdev to which we can
> store the active state of a subdev. This will place the subdev
> configuration into a known place, allowing us to use the state directly
> from the v4l2 framework, thus simplifying the drivers.
>
> Also add functions v4l2_subdev_init_finalize() and
> v4l2_subdev_cleanup(), which will allocate and free the active state.
> The functions are named in a generic way so that they can be also used
> for other subdev initialization work.
>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/media/v4l2-core/v4l2-subdev.c | 21 +++++++++++
>  include/media/v4l2-subdev.h           | 54 +++++++++++++++++++++++++++
>  2 files changed, 75 insertions(+)
>
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index fe49c86a9b02..de160140d63b 100644
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
> +	sd->active_state = state;

You could spare the local var..

> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(v4l2_subdev_init_finalize);
> +
> +void v4l2_subdev_cleanup(struct v4l2_subdev *sd)
> +{
> +	__v4l2_subdev_state_free(sd->active_state);
> +	sd->active_state = NULL;
> +}
> +EXPORT_SYMBOL_GPL(v4l2_subdev_cleanup);
> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index e52bf508c75b..87c3126b2754 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -645,6 +645,9 @@ struct v4l2_subdev_ir_ops {
>   * This structure only needs to be passed to the pad op if the 'which' field
>   * of the main argument is set to %V4L2_SUBDEV_FORMAT_TRY. For
>   * %V4L2_SUBDEV_FORMAT_ACTIVE it is safe to pass %NULL.
> + *
> + * Note: This struct is also used in active state, and the try_ prefix is
> + * historical and to be removed.
>   */
>  struct v4l2_subdev_pad_config {
>  	struct v4l2_mbus_framefmt try_fmt;
> @@ -898,6 +901,8 @@ struct v4l2_subdev_platform_data {
>   * @subdev_notifier: A sub-device notifier implicitly registered for the sub-
>   *		     device using v4l2_async_register_subdev_sensor().
>   * @pdata: common part of subdevice platform data
> + * @active_state: active state for the subdev (NULL for subdevs tracking the
> + *                state internally)

I would suggest here that init_finalize() should be used

 * @active_state: subdev active state. Initialized by calling
                  v4l2_subdev_init_finalize() by drivers that support
                  state

I would have said "the state API" but then we would need to define
what the state API as a concept :)

>   *
>   * Each instance of a subdev driver should create this struct, either
>   * stand-alone or embedded in a larger struct.
> @@ -929,6 +934,19 @@ struct v4l2_subdev {
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

what about "... For the time being it's kept as a pointer to allow drivers
to support state as an opt-in feature."

> +	 */
> +	struct v4l2_subdev_state *active_state;
>  };
>
>
> @@ -1217,4 +1235,40 @@ extern const struct v4l2_subdev_ops v4l2_subdev_call_wrappers;
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

Or just "It must be called by subdev drivers that support active state
as the last operation before registering the subdev."

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

nit:
The other functions in the file are documented with "Returns" (and
also "This function" seems to be more commonly used that just "This").

> + * support active state.
> + */
> +static inline struct v4l2_subdev_state *
> +v4l2_subdev_get_active_state(struct v4l2_subdev *sd)
> +{
> +	return sd->active_state;
> +}
> +

This is only used by the core, and by top drivers when doing:

      ret = v4l2_subdev_call(sd, pad, enum_frame_size,
                             v4l2_subdev_get_active_state(sd), &fse);

To pass to the subdev its own state.

I wonder if a macro like

#define v4l2_subdev_call_state(sd, o, f, args)					\
	({									\
	 struct v4l2_subdev_state *st = v4l2_subdev_get_active_state(sd);	\
	 v4l2_subdev_call(sd, o, f, st, args);					\
	 })

Could help simplify the state API.

Please be patient if I digress a bit more on the API now..

Looking forward in the series we'll end up having 5 functions to
manage state, if I've not missed any

1) struct v4l2_subdev_state *v4l2_subdev_get_active_state(struct v4l2_subdev *sd);

2) struct v4l2_subdev_state *v4l2_subdev_lock_active_state(struct v4l2_subdev *sd);

3) void v4l2_subdev_lock_state(struct v4l2_subdev_state *state);

4) void v4l2_subdev_unlock_state(struct v4l2_subdev_state *state);

5) struct v4l2_subdev_state *v4l2_subdev_lock_and_return_state(struct v4l2_subdev *sd,
				                               struct v4l2_subdev_state *state)

1) and 2) are helpers to get (locked/unlocked) v4l2_subdevice.state,
used in operations which implicitly operates on the active state
(s_stream etc)

I wonder if we shouldn't just have a locked v4l2_subdev_get_state()
and an optional unlocked version which can be used by the core in
place of v4l2_subdev_get_active_state() and by drivers which know what
they're doing by using the unlocked version

3) and 4) lock the state at hand (to be used in operations with a
'state' parameter)

5) is currently unused and it still feels a bit ill-defined. If the state
passed in as parameter is NULL then deflect it to sd->state, so I
guess it assumes that the user is a state-aware subdev driver which
needs to protect against in-kernel callers that do no pass in a valid state to
the operation call. This implies that if the caller passes in a NULL
state for the TRY format, this gets deflected to the subdev's active
state, something which should not happen, right ? I would be tempted
to just fail loud if !state and assume if you're moving your subdev to
use state you should be able to fix the caller as well.

What would you think of:

- v4l2_subdev_get_state(sd)
- v4l2_subdev_get_state_unlocked(sd)
  (or __v4l2_subdev_get_state(sd))
- v4l2_subdev_lock_state(state)
- v4l2_subdev_unlock_state(state)

>  #endif
> --
> 2.25.1
>
