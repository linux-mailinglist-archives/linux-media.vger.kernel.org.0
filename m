Return-Path: <linux-media+bounces-7347-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BB2288089A
	for <lists+linux-media@lfdr.de>; Wed, 20 Mar 2024 01:36:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D57131F23D32
	for <lists+linux-media@lfdr.de>; Wed, 20 Mar 2024 00:36:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F698A32;
	Wed, 20 Mar 2024 00:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="iqT02NNa"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08B2E631
	for <linux-media@vger.kernel.org>; Wed, 20 Mar 2024 00:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710894996; cv=none; b=CAkOtgMh89Q9mhIwuc5uTIoxmssflK2uOt/swSeOBzs357a2uagoEF9KD707za1vBtI1jXFvg3HOVAwHGiseD1RXyZFMtLbb21WAs5RzFURYAaXvc/7j2GkFbxBwTEYGUj4dwzZti4rPoSNLO1yPuhiCL08W7pFuZKdsYQW2gVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710894996; c=relaxed/simple;
	bh=7NeWvSI115Bd5feHfoYHHkri0aUkXEnWuV3r4rKlPV8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P0bwJv07LCGkM5wmbVRtYXB+GLlmvZFL9nZ67yhGuZ6jwpxx8MLO52EtcJjfBNMNExDrJAzuwnW8Ti/Sp0shJgIv2AKjqrvS3vrDn4Nk2+q5HvN9+yuHdwPWL2NDTuG1URi+5NZy6GSo4NT1jgttxbDZMNRIrrpohfyupIJcgKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=iqT02NNa; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 32800B1;
	Wed, 20 Mar 2024 01:36:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1710894966;
	bh=7NeWvSI115Bd5feHfoYHHkri0aUkXEnWuV3r4rKlPV8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iqT02NNasKZzJkXDxawTsC9s6E4WxR1Je2If/Ijbo2mV4QCdgXtQNlYK7Q2h3pur+
	 31EA38Z+ynDfkskzRPJhT5qpYvSyEOA9rk2ibjfTJAXo1WDWcEPuayVz3aBjJYEk/y
	 FvQVJ3Fpu0LFbTeewv7Nu1W7szdSb1J4EhSuIdfU=
Date: Wed, 20 Mar 2024 02:36:30 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, tomi.valkeinen@ideasonboard.com,
	bingbu.cao@intel.com, hongju.wang@intel.com, hverkuil@xs4all.nl,
	Andrey Konovalov <andrey.konovalov@linaro.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Dmitry Perchanov <dmitry.perchanov@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Alain Volmat <alain.volmat@foss.st.com>
Subject: Re: [PATCH v8 11/38] media: v4l: subdev: Add a function to lock two
 sub-device states, use it
Message-ID: <20240320003630.GP8501@pendragon.ideasonboard.com>
References: <20240313072516.241106-1-sakari.ailus@linux.intel.com>
 <20240313072516.241106-12-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240313072516.241106-12-sakari.ailus@linux.intel.com>

Hi Sakari,

Thank you for the patch.

On Wed, Mar 13, 2024 at 09:24:49AM +0200, Sakari Ailus wrote:
> Add two new functions, v4l2_subdev_lock_states() and
> v4l2_subdev_unclock_states(), to acquire and release the state of two
> sub-devices. They differ from calling v4l2_subdev_{un,}lock_state() so
> that if the two states share the same lock, the lock is acquired only
> once.

A bit of a hack, but I think we can live with it for now. A better long
term implementation will be to acquire all state locks from
media_pipeline_start() before doing any validation, and always using
different locks for different subdevs.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> Also use the new functions in v4l2_subdev_link_validate().
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/v4l2-core/v4l2-subdev.c | 12 +++-----
>  include/media/v4l2-subdev.h           | 40 +++++++++++++++++++++++++++
>  2 files changed, 44 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index 4c6198c48dd6..6c34df19ea2f 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -1400,17 +1400,13 @@ int v4l2_subdev_link_validate(struct media_link *link)
>  
>  	states_locked = sink_state && source_state;
>  
> -	if (states_locked) {
> -		v4l2_subdev_lock_state(sink_state);
> -		v4l2_subdev_lock_state(source_state);
> -	}
> +	if (states_locked)
> +		v4l2_subdev_lock_states(sink_state, source_state);
>  
>  	ret = v4l2_subdev_link_validate_locked(link, states_locked);
>  
> -	if (states_locked) {
> -		v4l2_subdev_unlock_state(sink_state);
> -		v4l2_subdev_unlock_state(source_state);
> -	}
> +	if (states_locked)
> +		v4l2_subdev_unlock_states(sink_state, source_state);
>  
>  	return ret;
>  }
> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index a9e6b8146279..9cce48365975 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -1724,6 +1724,46 @@ static inline void v4l2_subdev_unlock_state(struct v4l2_subdev_state *state)
>  	mutex_unlock(state->lock);
>  }
>  
> +/**
> + * v4l2_subdev_lock_states - Lock two sub-device states
> + * @state1: One subdevice state
> + * @state2: The other subdevice state
> + *
> + * Locks the state of two sub-devices.
> + *
> + * The states must be unlocked with v4l2_subdev_unlock_states() after use.
> + *
> + * This differs from calling v4l2_subdev_lock_state() on both states so that if
> + * the states share the same lock, the lock is acquired only once (so no
> + * deadlock occurs). The caller is responsible for ensuring the locks will
> + * always be acquired in the same order.
> + */
> +static inline void v4l2_subdev_lock_states(struct v4l2_subdev_state *state1,
> +					   struct v4l2_subdev_state *state2)
> +{
> +	mutex_lock(state1->lock);
> +	if (state1->lock != state2->lock)
> +		mutex_lock(state2->lock);
> +}
> +
> +/**
> + * v4l2_subdev_unlock_states() - Unlock two sub-device states
> + * @state1: One subdevice state
> + * @state2: The other subdevice state
> + *
> + * Unlocks the state of two sub-devices.
> + *
> + * This differs from calling v4l2_subdev_unlock_state() on both states so that
> + * if the states share the same lock, the lock is released only once.
> + */
> +static inline void v4l2_subdev_unlock_states(struct v4l2_subdev_state *state1,
> +					     struct v4l2_subdev_state *state2)
> +{
> +	mutex_unlock(state1->lock);
> +	if (state1->lock != state2->lock)
> +		mutex_unlock(state2->lock);
> +}
> +
>  /**
>   * v4l2_subdev_get_unlocked_active_state() - Checks that the active subdev state
>   *					     is unlocked and returns it

-- 
Regards,

Laurent Pinchart

