Return-Path: <linux-media+bounces-2077-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E6F2480C35E
	for <lists+linux-media@lfdr.de>; Mon, 11 Dec 2023 09:36:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9FD4B280D76
	for <lists+linux-media@lfdr.de>; Mon, 11 Dec 2023 08:36:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 464F120DE8;
	Mon, 11 Dec 2023 08:36:43 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB3131F612
	for <linux-media@vger.kernel.org>; Mon, 11 Dec 2023 08:36:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C797C433C7;
	Mon, 11 Dec 2023 08:36:40 +0000 (UTC)
Message-ID: <1305161c-24a3-4392-8e97-1f506b934f87@xs4all.nl>
Date: Mon, 11 Dec 2023 09:36:38 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/8] media: v4l: subdev: Move out subdev state lock
 macros outside CONFIG_MEDIA_CONTROLLER
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-media@vger.kernel.org
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Paul Elder <paul.elder@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
References: <20231208181442.13356-1-laurent.pinchart@ideasonboard.com>
 <20231208181648.13568-1-laurent.pinchart@ideasonboard.com>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20231208181648.13568-1-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08/12/2023 19:16, Laurent Pinchart wrote:
> From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> 
> The subdev state locking macros and macros to get the active state are
> currently behind CONFIG_MEDIA_CONTROLLER. This makes sense, as there can
> be no subdev state without MC.
> 
> However, we have code paths common to MC and non-MC cases which call
> subdev operations that have subdev state as a parameter. In the non-MC
> case the state parameter would always be NULL.
> 
> Thus it makes sense to allow, e.g.:
> 
> v4l2_subdev_call_state_active(sd, pad, get_fmt, fmt)
> 
> which for non-MC case would call the subdev passing NULL as the state.
> 
> This currently fails:
> https://lore.kernel.org/oe-kbuild-all/202312061101.PLrz5NnJ-lkp@intel.com/
> 
> Fix the issue by moving the related macros to be outside
> CONFIG_MEDIA_CONTROLLER. The v4l2_subdev_lock_state() and
> v4l2_subdev_unlock_state() macros will crash if given NULL as the state,
> but the other macros behave correctly even when there's no active state,
> and they will only call the lock/unlock macros if there is a state.
> 
> An alternative fix would be to make another version of
> v4l2_subdev_call_state_try() with ifdefs, which would not use any state
> macros and would always pass NULL as the state. But having two version
> of a macro/function is always more confusing than having just one, so I
> went this way.
> 
> So, this fixes the v4l2_subdev_call_state_active() macro. But we also
> have v4l2_subdev_call_state_try(). It would be possible to fix that
> macro by additionally creating "no-op" variants of the state alloc and
> free functions. However, v4l2_subdev_call_state_try() is only used by a
> single driver (stm32-dcmi), which selects MC, and the macro is supposed
> to be removed as soon as the users have been converted away from the
> macro. Thus I have not touched the state alloc/free functions, and I
> think it makes sense to keep alloc/free functions available only if
> there's actually something that can be allocated or freed.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Regards,

	Hans

> Link: https://lore.kernel.org/r/20231208-v4l2-state-mc-fix-v1-1-a0c8162557c6@ideasonboard.com
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  include/media/v4l2-subdev.h | 166 ++++++++++++++++++------------------
>  1 file changed, 83 insertions(+), 83 deletions(-)
> 
> diff --git a/include/media/v4l2-include/media/v4l2-subdev.hsubdev.h b/include/media/v4l2-subdev.h
> index 8b08f6640dee..61024a74ce38 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -1311,89 +1311,6 @@ int __v4l2_subdev_init_finalize(struct v4l2_subdev *sd, const char *name,
>   */
>  void v4l2_subdev_cleanup(struct v4l2_subdev *sd);
>  
> -/**
> - * v4l2_subdev_lock_state() - Locks the subdev state
> - * @state: The subdevice state
> - *
> - * Locks the given subdev state.
> - *
> - * The state must be unlocked with v4l2_subdev_unlock_state() after use.
> - */
> -static inline void v4l2_subdev_lock_state(struct v4l2_subdev_state *state)
> -{
> -	mutex_lock(state->lock);
> -}
> -
> -/**
> - * v4l2_subdev_unlock_state() - Unlocks the subdev state
> - * @state: The subdevice state
> - *
> - * Unlocks the given subdev state.
> - */
> -static inline void v4l2_subdev_unlock_state(struct v4l2_subdev_state *state)
> -{
> -	mutex_unlock(state->lock);
> -}
> -
> -/**
> - * v4l2_subdev_get_unlocked_active_state() - Checks that the active subdev state
> - *					     is unlocked and returns it
> - * @sd: The subdevice
> - *
> - * Returns the active state for the subdevice, or NULL if the subdev does not
> - * support active state. If the state is not NULL, calls
> - * lockdep_assert_not_held() to issue a warning if the state is locked.
> - *
> - * This function is to be used e.g. when getting the active state for the sole
> - * purpose of passing it forward, without accessing the state fields.
> - */
> -static inline struct v4l2_subdev_state *
> -v4l2_subdev_get_unlocked_active_state(struct v4l2_subdev *sd)
> -{
> -	if (sd->active_state)
> -		lockdep_assert_not_held(sd->active_state->lock);
> -	return sd->active_state;
> -}
> -
> -/**
> - * v4l2_subdev_get_locked_active_state() - Checks that the active subdev state
> - *					   is locked and returns it
> - *
> - * @sd: The subdevice
> - *
> - * Returns the active state for the subdevice, or NULL if the subdev does not
> - * support active state. If the state is not NULL, calls lockdep_assert_held()
> - * to issue a warning if the state is not locked.
> - *
> - * This function is to be used when the caller knows that the active state is
> - * already locked.
> - */
> -static inline struct v4l2_subdev_state *
> -v4l2_subdev_get_locked_active_state(struct v4l2_subdev *sd)
> -{
> -	if (sd->active_state)
> -		lockdep_assert_held(sd->active_state->lock);
> -	return sd->active_state;
> -}
> -
> -/**
> - * v4l2_subdev_lock_and_get_active_state() - Locks and returns the active subdev
> - *					     state for the subdevice
> - * @sd: The subdevice
> - *
> - * Returns the locked active state for the subdevice, or NULL if the subdev
> - * does not support active state.
> - *
> - * The state must be unlocked with v4l2_subdev_unlock_state() after use.
> - */
> -static inline struct v4l2_subdev_state *
> -v4l2_subdev_lock_and_get_active_state(struct v4l2_subdev *sd)
> -{
> -	if (sd->active_state)
> -		v4l2_subdev_lock_state(sd->active_state);
> -	return sd->active_state;
> -}
> -
>  /*
>   * A macro to generate the macro or function name for sub-devices state access
>   * wrapper macros below.
> @@ -1738,6 +1655,89 @@ int v4l2_subdev_s_stream_helper(struct v4l2_subdev *sd, int enable);
>  
>  #endif /* CONFIG_MEDIA_CONTROLLER */
>  
> +/**
> + * v4l2_subdev_lock_state() - Locks the subdev state
> + * @state: The subdevice state
> + *
> + * Locks the given subdev state.
> + *
> + * The state must be unlocked with v4l2_subdev_unlock_state() after use.
> + */
> +static inline void v4l2_subdev_lock_state(struct v4l2_subdev_state *state)
> +{
> +	mutex_lock(state->lock);
> +}
> +
> +/**
> + * v4l2_subdev_unlock_state() - Unlocks the subdev state
> + * @state: The subdevice state
> + *
> + * Unlocks the given subdev state.
> + */
> +static inline void v4l2_subdev_unlock_state(struct v4l2_subdev_state *state)
> +{
> +	mutex_unlock(state->lock);
> +}
> +
> +/**
> + * v4l2_subdev_get_unlocked_active_state() - Checks that the active subdev state
> + *					     is unlocked and returns it
> + * @sd: The subdevice
> + *
> + * Returns the active state for the subdevice, or NULL if the subdev does not
> + * support active state. If the state is not NULL, calls
> + * lockdep_assert_not_held() to issue a warning if the state is locked.
> + *
> + * This function is to be used e.g. when getting the active state for the sole
> + * purpose of passing it forward, without accessing the state fields.
> + */
> +static inline struct v4l2_subdev_state *
> +v4l2_subdev_get_unlocked_active_state(struct v4l2_subdev *sd)
> +{
> +	if (sd->active_state)
> +		lockdep_assert_not_held(sd->active_state->lock);
> +	return sd->active_state;
> +}
> +
> +/**
> + * v4l2_subdev_get_locked_active_state() - Checks that the active subdev state
> + *					   is locked and returns it
> + *
> + * @sd: The subdevice
> + *
> + * Returns the active state for the subdevice, or NULL if the subdev does not
> + * support active state. If the state is not NULL, calls lockdep_assert_held()
> + * to issue a warning if the state is not locked.
> + *
> + * This function is to be used when the caller knows that the active state is
> + * already locked.
> + */
> +static inline struct v4l2_subdev_state *
> +v4l2_subdev_get_locked_active_state(struct v4l2_subdev *sd)
> +{
> +	if (sd->active_state)
> +		lockdep_assert_held(sd->active_state->lock);
> +	return sd->active_state;
> +}
> +
> +/**
> + * v4l2_subdev_lock_and_get_active_state() - Locks and returns the active subdev
> + *					     state for the subdevice
> + * @sd: The subdevice
> + *
> + * Returns the locked active state for the subdevice, or NULL if the subdev
> + * does not support active state.
> + *
> + * The state must be unlocked with v4l2_subdev_unlock_state() after use.
> + */
> +static inline struct v4l2_subdev_state *
> +v4l2_subdev_lock_and_get_active_state(struct v4l2_subdev *sd)
> +{
> +	if (sd->active_state)
> +		v4l2_subdev_lock_state(sd->active_state);
> +	return sd->active_state;
> +}
> +
>  /**
>   * v4l2_subdev_init - initializes the sub-device struct
>   *


