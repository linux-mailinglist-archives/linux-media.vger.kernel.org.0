Return-Path: <linux-media+bounces-41771-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AC63B43BF8
	for <lists+linux-media@lfdr.de>; Thu,  4 Sep 2025 14:45:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 28ED916F74A
	for <lists+linux-media@lfdr.de>; Thu,  4 Sep 2025 12:45:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B29BF2FCC10;
	Thu,  4 Sep 2025 12:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="RDt3K1CF"
X-Original-To: linux-media@vger.kernel.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 128C61E4AE
	for <linux-media@vger.kernel.org>; Thu,  4 Sep 2025 12:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756989936; cv=none; b=VHN5x45LRcgBDRruj0Jj4v2H7s+h4xt0W1PHAgp/NcGhecVFTI8VtRF2UzS4+yqMwm1vbkPMdZwPuRndsF6+oOXtL/xsEDKkY4v03hT5SFQqQ8QgecTxNVnaM2nxnMeXRf0PAAWNG4Ta8GSOtpcU9eIlQRzFYUYWfehkkexWjFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756989936; c=relaxed/simple;
	bh=y6h7WC8krLg+71mS2lYQcwHjHiD1f22ZYGOAeRwYrb4=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NM2MjZkdGmQlO9LlIrUbPVBTW4t+cpkyPslWsktDzMD2eFJqZ/oZv7z0if8DEZpMlio6ePC1h6MCMaxamlSPWZOkP1/uvlVmPBsuvVcHS0ik3BPruqYHoMmuPfvUN06b2SQUwCLya0XwggfMzDdAfloid6dq8px5w/2jWvOv+5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=RDt3K1CF; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4cHfMs237Tz9tdB;
	Thu,  4 Sep 2025 14:45:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1756989929; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7cw5SlezJWkD9vH4s5x2Q9sfM/T9DczJB5/DrhIxAxM=;
	b=RDt3K1CFKib5cOnL+kd4amKsRNrF43xl7nF+IomYrmqtsEdP7x7UD7Sp7e+0/FEr6hOsiK
	nXM4aL8kqjmNQXj1IRFm+61pKuNi089hwn2vsiWOUp21QiEV5Zf8t1SdpuBIfeJgBHgb74
	22zMve8a6qF45kqnIwGbJcxu10d1qAOyrr8+jBW4m10/vExayKHfwuxbbqXmiY3A6yDkJB
	krBS1TD3ShW5XcdjbDHAGBRh64KhKXDRroCLD8cVe6vDT1HQyiPtsLvSkYg3ms3JIOzhZh
	Uv6fTphk53jXfqkTpw+yMs8zKsK2iMcohS8/AkY4AZIN04j75lPRFEGW5A4LeA==
Message-ID: <b6c09af972e7d4a9cb1c9d6621f77f923c3a8a56.camel@mailbox.org>
Subject: Re: [PATCH 2/2] dma-buf: add warning when dma_fence is signaled
 from IOCTL
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: Christian =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>, 
	simona.vetter@ffwll.ch, tvrtko.ursulin@igalia.com, airlied@gmail.com, 
	dakr@kernel.org, sumit.semwal@linaro.org, dri-devel@lists.freedesktop.org, 
	linux-media@vger.kernel.org
Date: Thu, 04 Sep 2025 14:45:25 +0200
In-Reply-To: <20250812143402.8619-2-christian.koenig@amd.com>
References: <20250812143402.8619-1-christian.koenig@amd.com>
	 <20250812143402.8619-2-christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-META: iswzzsxdww7z5h9gisg9sxxgd37yb7gs
X-MBO-RS-ID: d86d65c433cca0c4a77

On Tue, 2025-08-12 at 16:34 +0200, Christian K=C3=B6nig wrote:
> From: Christian K=C3=B6nig <ckoenig@able.fritz.box>
>=20
> We have the re-occurring problem that people try to invent a
> DMA-fences implementation which signals fences based on an userspace
> IOCTL.
>=20
> This is well known as source of hard to track down crashes and is
> documented to be an invalid approach. The problem is that it seems
> to work during initial testing and only long term tests points out
> why this can never work correctly.
>=20
> So give at least a warning when people try to signal a fence from
> task context and not from interrupts or a work item. This check is
> certainly not perfect but better than nothing.
>=20
> Signed-off-by: Christian K=C3=B6nig <ckoenig@able.fritz.box>
> ---
> =C2=A0drivers/dma-buf/dma-fence.c | 59 +++++++++++++++++++++++++++-------=
---
> =C2=A0include/linux/dma-fence.h=C2=A0=C2=A0 |=C2=A0 9 ++++--
> =C2=A02 files changed, 51 insertions(+), 17 deletions(-)
>=20
> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
> index 3f78c56b58dc..2bce620eacac 100644
> --- a/drivers/dma-buf/dma-fence.c
> +++ b/drivers/dma-buf/dma-fence.c
> @@ -345,33 +345,23 @@ void __dma_fence_might_wait(void)
> =C2=A0}
> =C2=A0#endif
> =C2=A0
> -
> =C2=A0/**
> - * dma_fence_signal_timestamp_locked - signal completion of a fence
> + * dma_fence_signal_internal - internal signal completion of a fence
> =C2=A0 * @fence: the fence to signal
> =C2=A0 * @timestamp: fence signal timestamp in kernel's CLOCK_MONOTONIC t=
ime domain
> =C2=A0 *
> - * Signal completion for software callbacks on a fence, this will unbloc=
k
> - * dma_fence_wait() calls and run all the callbacks added with
> - * dma_fence_add_callback(). Can be called multiple times, but since a f=
ence
> - * can only go from the unsignaled to the signaled state and not back, i=
t will
> - * only be effective the first time. Set the timestamp provided as the f=
ence
> - * signal timestamp.
> - *
> - * Unlike dma_fence_signal_timestamp(), this function must be called wit=
h
> - * &dma_fence.lock held.
> + * Internal signal the dma_fence without error checking. Should *NEVER* =
be used
> + * by drivers or external code directly.
> =C2=A0 *
> =C2=A0 * Returns 0 on success and a negative error value when @fence has =
been
> =C2=A0 * signalled already.
> =C2=A0 */
> -int dma_fence_signal_timestamp_locked(struct dma_fence *fence,
> -				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ktime_t timestamp)
> +int dma_fence_signal_internal(struct dma_fence *fence, ktime_t timestamp=
)
> =C2=A0{
> =C2=A0	struct dma_fence_cb *cur, *tmp;
> =C2=A0	struct list_head cb_list;
> =C2=A0
> =C2=A0	lockdep_assert_held(fence->lock);
> -
> =C2=A0	if (unlikely(test_and_set_bit(DMA_FENCE_FLAG_SIGNALED_BIT,
> =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &fence->flags)))
> =C2=A0		return -EINVAL;
> @@ -390,7 +380,46 @@ int dma_fence_signal_timestamp_locked(struct dma_fen=
ce *fence,
> =C2=A0
> =C2=A0	return 0;
> =C2=A0}
> -EXPORT_SYMBOL(dma_fence_signal_timestamp_locked);
> +EXPORT_SYMBOL(dma_fence_signal_internal);
> +
> +/**
> + * dma_fence_signal_timestamp_locked - signal completion of a fence
> + * @fence: the fence to signal
> + * @timestamp: fence signal timestamp in kernel's CLOCK_MONOTONIC time d=
omain
> + *
> + * Signal completion for software callbacks on a fence, this will unbloc=
k
> + * dma_fence_wait() calls and run all the callbacks added with
> + * dma_fence_add_callback(). Can be called multiple times, but since a f=
ence
> + * can only go from the unsignaled to the signaled state and not back, i=
t will
> + * only be effective the first time. Set the timestamp provided as the f=
ence
> + * signal timestamp.
> + *
> + * Unlike dma_fence_signal_timestamp(), this function must be called wit=
h
> + * &dma_fence.lock held.
> + *
> + * Returns 0 on success and a negative error value when @fence has been
> + * signalled already.
> + */
> +int dma_fence_signal_timestamp_locked(struct dma_fence *fence,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ktime_t timestamp)
> +{
> +	/*
> +	 * We have the re-occurring problem that people try to invent a
> +	 * DMA-fences implementation which signals fences based on an userspace
> +	 * IOCTL.
> +	 *
> +	 * This is well known as source of hard to track down crashes and is
> +	 * documented to be an invalid approach. The problem is that it seems
> +	 * to work during initial testing and only long term tests points out
> +	 * why this can never work correctly.
> +	 *
> +	 * So give at least a warning when people try to signal a fence from
> +	 * task context and not from interrupts or a work item. This check is
> +	 * certainly not perfect but better than nothing.
> +	 */
> +	WARN_ON_ONCE(!in_interrupt() && !current_work());

I only just realized that this could cause false-positive warnings
should a driver tear down drm/sched with drm_sched_fini() plus
drm_sched_backend_ops.cancel_job(). This signals left over dma_fences
with an error.

And drm_sched_fini() doesn't usually run in work items, does it. It can
be invoked through ioctls that destroy a channel and the associated
scheduler, with rmmod etc.

cancel_job() is (for now) only used in the unit tests since we recently
had to revert the usage in Nouveau (because of a different problem). I
intend to add it back there, though; and we established cancel_job() as
the way to deal with drm/sched's memory leaks in lengthy discussions.


I think that warning should not be added. False positive warnings in
dmesg would confuse users, cause unnecessary support tickets etc.


P.


> +	return dma_fence_signal_internal(fence, timestamp);
> +}
> =C2=A0
> =C2=A0/**
> =C2=A0 * dma_fence_signal_timestamp - signal completion of a fence
> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
> index 64639e104110..8dbcd66989b8 100644
> --- a/include/linux/dma-fence.h
> +++ b/include/linux/dma-fence.h
> @@ -369,6 +369,7 @@ int dma_fence_signal_locked(struct dma_fence *fence);
> =C2=A0int dma_fence_signal_timestamp(struct dma_fence *fence, ktime_t tim=
estamp);
> =C2=A0int dma_fence_signal_timestamp_locked(struct dma_fence *fence,
> =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ktime_t timestamp);
> +int dma_fence_signal_internal(struct dma_fence *fence, ktime_t timestamp=
);
> =C2=A0signed long dma_fence_default_wait(struct dma_fence *fence,
> =C2=A0				=C2=A0=C2=A0 bool intr, signed long timeout);
> =C2=A0int dma_fence_add_callback(struct dma_fence *fence,
> @@ -422,7 +423,7 @@ dma_fence_is_signaled_locked(struct dma_fence *fence)
> =C2=A0		return true;
> =C2=A0
> =C2=A0	if (fence->ops->signaled && fence->ops->signaled(fence)) {
> -		dma_fence_signal_locked(fence);
> +		dma_fence_signal_internal(fence, ktime_get());
> =C2=A0		return true;
> =C2=A0	}
> =C2=A0
> @@ -448,11 +449,15 @@ dma_fence_is_signaled_locked(struct dma_fence *fenc=
e)
> =C2=A0static inline bool
> =C2=A0dma_fence_is_signaled(struct dma_fence *fence)
> =C2=A0{
> +	unsigned long flags;
> +
> =C2=A0	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
> =C2=A0		return true;
> =C2=A0
> =C2=A0	if (fence->ops->signaled && fence->ops->signaled(fence)) {
> -		dma_fence_signal(fence);
> +		spin_lock_irqsave(fence->lock, flags);
> +		dma_fence_signal_internal(fence, ktime_get());
> +		spin_unlock_irqrestore(fence->lock, flags);
> =C2=A0		return true;
> =C2=A0	}
> =C2=A0


