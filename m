Return-Path: <linux-media+bounces-7142-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AAA0387D07A
	for <lists+linux-media@lfdr.de>; Fri, 15 Mar 2024 16:42:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D962C1C20C3C
	for <lists+linux-media@lfdr.de>; Fri, 15 Mar 2024 15:42:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CE1F3E498;
	Fri, 15 Mar 2024 15:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="vomBAiab"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 037D0321B4
	for <linux-media@vger.kernel.org>; Fri, 15 Mar 2024 15:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710517330; cv=none; b=SfYQHTYTHkGS5nQu70uUi71ob9f8s3eSgvVwoByD9dhvD2ym8zjx4RIxWBSSfQneXGiRgKFD1NgN98QbS/MWTx6oRqmRwk8b2G4mFMSF5w7WTbOZTUiqot2818Qro0x2iN8jHzj4U7z02D2CNwlP0tN4yD4rxxDEmwoOB0F4rF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710517330; c=relaxed/simple;
	bh=VCT006G4rpw+VZkP5/dmEVnV6VKJQraaYKg51p4hIl0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AmM8uKArLXVYcVtuzDwF6ff7CevEh4yn/gEjaSEfFKspYxe0zPsINNhAYgaGM5JzlvK4+ymgWJYIB4yCWG39N8EN76bJeCfXufTA9BWzT49S4xy7w08SyfyjXNf/vsUheyJ6GCRXO1Ul0DafrHzX6JtQiKqyLDGO3gCWeddBfTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=vomBAiab; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1710517327;
	bh=VCT006G4rpw+VZkP5/dmEVnV6VKJQraaYKg51p4hIl0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=vomBAiabZIAK5c4OjcLXukIcm6r3pQ6u5po+Wpn+mpToLvATcqq0LrtUEL+W4ZTWm
	 yUKdR+OSUHR3jdN+sHs3iU3FNQu2xkz3km7hNk1ngdkpmsAgyBgfTbfemeYItooINA
	 hcfk2E6bvb0QxoIiR+Ph+pfYseFz83QSJCE4tKqdlhlAHTGFrtv/pRlWQc5o/TLArS
	 2y1mbFu3AB9VNVQstQSD+BB31VeW3+rZjIYJqKbnton4wH2zMsNQKqDpqLkGUEK5oX
	 oekpB7GUAP/P+ryrd8CqxrtV+l+267LFZmZ7zw4V2qOcA1kCcJ43y4BhAwC449HG3X
	 jlYfsZIXkfPsg==
Received: from [100.74.67.65] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 8A0373782110;
	Fri, 15 Mar 2024 15:42:06 +0000 (UTC)
Message-ID: <11cf8b40-3c4b-4b15-a58b-b4f02b098c78@collabora.com>
Date: Fri, 15 Mar 2024 16:42:05 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 11/38] media: v4l: subdev: Add a function to lock two
 sub-device states, use it
Content-Language: en-US
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 tomi.valkeinen@ideasonboard.com, bingbu.cao@intel.com,
 hongju.wang@intel.com, hverkuil@xs4all.nl,
 Andrey Konovalov <andrey.konovalov@linaro.org>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Dmitry Perchanov <dmitry.perchanov@intel.com>,
 "Ng, Khai Wen" <khai.wen.ng@intel.com>,
 Alain Volmat <alain.volmat@foss.st.com>
References: <20240313072516.241106-1-sakari.ailus@linux.intel.com>
 <20240313072516.241106-12-sakari.ailus@linux.intel.com>
From: Julien Massot <julien.massot@collabora.com>
In-Reply-To: <20240313072516.241106-12-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 3/13/24 08:24, Sakari Ailus wrote:
> Add two new functions, v4l2_subdev_lock_states() and
> v4l2_subdev_unclock_states(), to acquire and release the state of two
> sub-devices. They differ from calling v4l2_subdev_{un,}lock_state() so
> that if the two states share the same lock, the lock is acquired only
> once.
> 
> Also use the new functions in v4l2_subdev_link_validate().
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Julien Massot <julien.massot@collabora.com>
> ---
>   drivers/media/v4l2-core/v4l2-subdev.c | 12 +++-----
>   include/media/v4l2-subdev.h           | 40 +++++++++++++++++++++++++++
>   2 files changed, 44 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index 4c6198c48dd6..6c34df19ea2f 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -1400,17 +1400,13 @@ int v4l2_subdev_link_validate(struct media_link *link)
>   
>   	states_locked = sink_state && source_state;
>   
> -	if (states_locked) {
> -		v4l2_subdev_lock_state(sink_state);
> -		v4l2_subdev_lock_state(source_state);
> -	}
> +	if (states_locked)
> +		v4l2_subdev_lock_states(sink_state, source_state);
>   
>   	ret = v4l2_subdev_link_validate_locked(link, states_locked);
>   
> -	if (states_locked) {
> -		v4l2_subdev_unlock_state(sink_state);
> -		v4l2_subdev_unlock_state(source_state);
> -	}
> +	if (states_locked)
> +		v4l2_subdev_unlock_states(sink_state, source_state);
>   
>   	return ret;
>   }
> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index a9e6b8146279..9cce48365975 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -1724,6 +1724,46 @@ static inline void v4l2_subdev_unlock_state(struct v4l2_subdev_state *state)
>   	mutex_unlock(state->lock);
>   }
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
>   /**
>    * v4l2_subdev_get_unlocked_active_state() - Checks that the active subdev state
>    *					     is unlocked and returns it

-- 
Julien Massot
Senior Software Engineer
Collabora Ltd.
Platinum Building, St John's Innovation Park, Cambridge CB4 0DS, UK
Registered in England & Wales, no. 5513718

