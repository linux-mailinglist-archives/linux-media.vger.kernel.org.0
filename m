Return-Path: <linux-media+bounces-1998-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A179B80A904
	for <lists+linux-media@lfdr.de>; Fri,  8 Dec 2023 17:33:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1D8921F2121A
	for <lists+linux-media@lfdr.de>; Fri,  8 Dec 2023 16:33:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1253A374FF;
	Fri,  8 Dec 2023 16:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Kz5g9Ta0"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D26E0173F;
	Fri,  8 Dec 2023 08:33:16 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 69A63291;
	Fri,  8 Dec 2023 17:32:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1702053153;
	bh=rLh/2q4AJ1YxvzU0Zsf1S+FZAJTXfTvKKL/PGIj5nBw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Kz5g9Ta0nKsBnkrm43Ao95w/y0fyAV0BeDjDuMUUclxvhSDUadhv4DDliQxoa+3nH
	 Ys3xVaGGzNU55HB44fflPAN+jfk4ergwsUo75xt4Vll9G89EdHJPu/LxB1pBVUAJvp
	 bG8IC1KYTIzj5iVCOinK6Nfla+shGJ43ooSsmixI=
Date: Fri, 8 Dec 2023 18:33:22 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: v4l: subdev: Move out subdev state lock macros
 outside CONFIG_MEDIA_CONTROLLER
Message-ID: <20231208163322.GM25616@pendragon.ideasonboard.com>
References: <20231208-v4l2-state-mc-fix-v1-1-a0c8162557c6@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231208-v4l2-state-mc-fix-v1-1-a0c8162557c6@ideasonboard.com>

Hi Tomi,

Thank you for the patch.

On Fri, Dec 08, 2023 at 06:15:15PM +0200, Tomi Valkeinen wrote:
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

Agreed.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  include/media/v4l2-subdev.h | 166 ++++++++++++++++++++++----------------------
>  1 file changed, 83 insertions(+), 83 deletions(-)
> 
> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
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
> 
> ---
> base-commit: e55a9482888da73eeadde5f13ef8bafce68a38ed
> change-id: 20231208-v4l2-state-mc-fix-b4f0ebfbb2bf

-- 
Regards,

Laurent Pinchart

