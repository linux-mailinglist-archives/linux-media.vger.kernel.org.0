Return-Path: <linux-media+bounces-46284-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D6548C3109B
	for <lists+linux-media@lfdr.de>; Tue, 04 Nov 2025 13:44:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D490518861C9
	for <lists+linux-media@lfdr.de>; Tue,  4 Nov 2025 12:44:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB469257AC6;
	Tue,  4 Nov 2025 12:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="cu9dCIEX"
X-Original-To: linux-media@vger.kernel.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D6D92D3221;
	Tue,  4 Nov 2025 12:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762260222; cv=none; b=FVpY/b8SVvJkMStCbEFPhxAflnhjUYj1obOPy8uzGvJ4ji7vLovrXVu0K/9v+XJuIhQyt2re/dU5tN0Z2UE+5qIXaDA4fMAn9Ep44/rxuA+CnYwcSTJoQjUYiG65vA4LGU745ivkjwt9+awDU7jV5AB7X5Wlsrdd5u8gks8JBdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762260222; c=relaxed/simple;
	bh=SC3J9fesfnrkX23G43m3YNEjCujBZXCwByXltqleRE0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UUoQ0BHIoM42B/2pYFBwqL5Rsca+XOyizyOTgdGmD68Kpaa6HWG0sW2PRrR8/0wBcwklUF00vzNLCxtOS6xkmdmjJJ1O+kCeYL+fr9cmm83eaUJrwzFij0gaSb1pRyOk9TCcP5u0aaF+Pf1RwI+sKGGRhLd4tdYLF9L4Tw5Shhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=cu9dCIEX; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4d17RW2vHfz9tc2;
	Tue,  4 Nov 2025 13:43:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1762260215; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JPkgDZbOpdQZ6CjBxSWvLUc4rQdd3n90Y0EiY992u4w=;
	b=cu9dCIEX6zb+HQyiyF2HYnBo7cvxv34vMCj/2+2PBPrWRnD1D+9hTKIqrkCSa+IDNQG1wf
	D6MkW5UhSTCKoqj/BX4tOO4x4zlfioTEE3NTdacLz916BfMP6zdIYOBtZZuF3B0fhrJ4yF
	kbiNqLmKTk0iPRZahCXFwBci1aGOl0eohc+Sr/kUxXRMwnM4yYw8YdQHtcbfsTt+05V3Xw
	7xcB2uX+UdcrG+B4aj5XYc69ytPCTgWc7/nqw7qwgX7dRFkMu10jDZWTRcDDfEC6QcEXgf
	PPpZJsHjB9j6NLM10lFj2EKMMvoxrVf0RGVlB91SKBvy3Iu2YN9hKpUj+1SBlQ==
Message-ID: <628cdf3a0c5b783c09fe2a40aca4a4a48c614e66.camel@mailbox.org>
Subject: Re: [PATCH v3] drm/sched: Fix deadlock in
 drm_sched_entity_kill_jobs_cb
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>, 
 Matthew Brost <matthew.brost@intel.com>, Danilo Krummrich
 <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>,  Christian
 =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>,  Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Sumit Semwal
 <sumit.semwal@linaro.org>, Luben Tuikov <luben.tuikov@amd.com>
Cc: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>, Christian
 =?ISO-8859-1?Q?K=F6nig?=
	 <christian.koenig@amd.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linaro-mm-sig@lists.linaro.org
Date: Tue, 04 Nov 2025 13:43:27 +0100
In-Reply-To: <20251104095358.15092-1-pierre-eric.pelloux-prayer@amd.com>
References: <20251104095358.15092-1-pierre-eric.pelloux-prayer@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-META: phbpfqy7crs61b9sp6exm9j8i6h4ozxt
X-MBO-RS-ID: c9a33b565f3f691c7d2

On Tue, 2025-11-04 at 10:53 +0100, Pierre-Eric Pelloux-Prayer wrote:
> The Mesa issue referenced below pointed out a possible deadlock:
>=20
> [ 1231.611031]=C2=A0 Possible interrupt unsafe locking scenario:
>=20
> [ 1231.611033]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CPU0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 CPU1
> [ 1231.611034]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ----=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 ----
> [ 1231.611035]=C2=A0=C2=A0 lock(&xa->xa_lock#17);
> [ 1231.611038]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 local_irq_disable();
> [ 1231.611039]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 lock(&fence->lock);
> [ 1231.611041]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 lock(&xa->xa_lock#17=
);
> [ 1231.611044]=C2=A0=C2=A0 <Interrupt>
> [ 1231.611045]=C2=A0=C2=A0=C2=A0=C2=A0 lock(&fence->lock);
> [ 1231.611047]
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 *** DEADLOCK ***
>=20
> In this example, CPU0 would be any function accessing job->dependencies
> through the xa_* functions that doesn't disable interrupts (eg:
> drm_sched_job_add_dependency, drm_sched_entity_kill_jobs_cb).
>=20
> CPU1 is executing drm_sched_entity_kill_jobs_cb as a fence signalling
> callback so in an interrupt context. It will deadlock when trying to
> grab the xa_lock which is already held by CPU0.
>=20
> Replacing all xa_* usage by their xa_*_irq counterparts would fix
> this issue, but Christian pointed out another issue: dma_fence_signal
> takes fence.lock and so does dma_fence_add_callback.
>=20
> =C2=A0 dma_fence_signal() // locks f1.lock
> =C2=A0 -> drm_sched_entity_kill_jobs_cb()
> =C2=A0 -> foreach dependencies
> =C2=A0=C2=A0=C2=A0=C2=A0 -> dma_fence_add_callback() // locks f2.lock
>=20
> This will deadlock if f1 and f2 share the same spinlock.
>=20
> To fix both issues, the code iterating on dependencies and re-arming them
> is moved out to drm_sched_entity_kill_jobs_work.
>=20
> v2: reworded commit message (Philipp)
> v3: added Fixes tag (Philipp)

Thx for the update.
In the future please put the changelog below between a pair of '---'

---
v2: =E2=80=A6
v3: =E2=80=A6
---

Some things I have unfortunately overlooked below.

>=20
> Fixes: 2fdb8a8f07c2 ("drm/scheduler: rework entity flush, kill and fini")

We should +Cc stable. It's a deadlock after all.

> Link: https://gitlab.freedesktop.org/mesa/mesa/-/issues/13908
> Reported-by: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
> Suggested-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd=
.com>
> ---
> =C2=A0drivers/gpu/drm/scheduler/sched_entity.c | 34 +++++++++++++--------=
---
> =C2=A01 file changed, 19 insertions(+), 15 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/s=
cheduler/sched_entity.c
> index c8e949f4a568..fe174a4857be 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -173,26 +173,15 @@ int drm_sched_entity_error(struct drm_sched_entity =
*entity)
> =C2=A0}
> =C2=A0EXPORT_SYMBOL(drm_sched_entity_error);
> =C2=A0
> +static void drm_sched_entity_kill_jobs_cb(struct dma_fence *f,
> +					=C2=A0 struct dma_fence_cb *cb);

It's far better to move the function up instead. Can you do that?

> +
>=20

[=E2=80=A6]

> +/* Signal the scheduler finished fence when the entity in question is ki=
lled. */
> +static void drm_sched_entity_kill_jobs_cb(struct dma_fence *f,
> +					=C2=A0 struct dma_fence_cb *cb)
> +{
> +	struct drm_sched_job *job =3D container_of(cb, struct drm_sched_job,
> +						 finish_cb);
> +
> +	dma_fence_put(f);

It would be great if we knew what fence is being dropped here and why.
I know you're just moving the pre-existing code, but if you should
know, informing about that via comment would be great.

Optional.


Rest of the code looks good. No further objections.


P.

