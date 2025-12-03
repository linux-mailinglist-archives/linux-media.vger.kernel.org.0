Return-Path: <linux-media+bounces-48156-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 31A75C9F6F8
	for <lists+linux-media@lfdr.de>; Wed, 03 Dec 2025 16:26:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A751330056FC
	for <lists+linux-media@lfdr.de>; Wed,  3 Dec 2025 15:24:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38CC932B9BB;
	Wed,  3 Dec 2025 15:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="HWvzvG/b"
X-Original-To: linux-media@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75B8732B9A5;
	Wed,  3 Dec 2025 15:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764775110; cv=none; b=jvFdO34LApC8anlh1ITDpbLMlAxL85+eD7yqk64lb0SJAVhFSz298Pu+wbGTUE5G9eE1WTmjJk8kbEFTBss9sxObbPwXEzjXLreozVu1pz0ifqJpRY3+cxm8XGQsIsJo2tH48yL+S8w5sAXEoeTFfAq6w9ikZAHDki6hcl8UuQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764775110; c=relaxed/simple;
	bh=NCGnqFnaYowKz0rjrThGT3iRsS95Gwu6iI8gp+nEoTI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rvB9ARWmwH3V8TTEZjiJGG6JNLoUgorpxuBFGm39EHAucd0NVqAbttuY4M+H/JlfiRRGZrhSsr49ubSBdA1NORX/SY3vSFulGQjY1+a3xQ8YtCQ6Piha7Za/KPT1yYGP+djfRfPkqCbBDbU+gKxF2mrYd5NgMHklcSOO+o7wyFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=HWvzvG/b; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4dM1Vf2198z9sjZ;
	Wed,  3 Dec 2025 16:18:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1764775098; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2aZUkHtkSK0oCrh4KpajSb66h7yNzcpGmeYAya58G6Y=;
	b=HWvzvG/bIkZHelt1pMkEtQNl8S6CqFby2URUKUUB07VYVfokbK9e15c3hxNjrr2apm3gGU
	YzAzMoDBLbpqjeJn90QGuW5OEM8jI+eXSoxAx0au7bP21OFfTtjYCnZEKJwkIbxeLYBzYR
	6MaxFz8QiEe42Y36Ebyj9spKVnNl76pzgSyFrCfM0XCOolUvjsPkrSCKh9oGnmMsvtZUiT
	PDREL5YP68E4h0sr5phE6b8dzbAUDaBM+MrmvfsvSn47mOuJF17yaV9mdFydPwPMsK0dy3
	5PW54Z9r1eqMoINlPTuwQLazqXFxAlJH8p/UjnW8L0Hv0sf1nAnLJbljJUVaMA==
Message-ID: <a4655788feddd883f70aa374e4315cfaee59a88c.camel@mailbox.org>
Subject: Re: [PATCH v2 8/8] drm/xe: Use dma_fence_test_signaled_flag()
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Philipp
 Stanner <phasta@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 Gustavo Padovan <gustavo@padovan.org>, Felix Kuehling
 <Felix.Kuehling@amd.com>, Alex Deucher <alexander.deucher@amd.com>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, Huang Rui <ray.huang@amd.com>,
 Matthew Auld <matthew.auld@intel.com>,  Matthew Brost
 <matthew.brost@intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Thomas =?ISO-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, 
	intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Date: Wed, 03 Dec 2025 16:18:06 +0100
In-Reply-To: <e67b12d1-111f-484a-8374-4152d3b9f328@amd.com>
References: <20251201105011.19386-2-phasta@kernel.org>
	 <20251201105011.19386-10-phasta@kernel.org>
	 <e67b12d1-111f-484a-8374-4152d3b9f328@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-ID: 2d25109a1dd7c0ac011
X-MBO-RS-META: u6d8mbjai1kb5wbkyqh941df6oh6is5g

On Wed, 2025-12-03 at 14:15 +0100, Christian K=C3=B6nig wrote:
> On 12/1/25 11:50, Philipp Stanner wrote:
> > There is a new dma_fence helper which simplifies testing for a fence's
> > signaled_flag. Use it in xe.
> >=20
> > Signed-off-by: Philipp Stanner <phasta@kernel.org>
>=20
> Acked-by: Christian K=C3=B6nig <christian.koenig@amd.com>

This series would then be completely reviewed, it seems. So one could
push it. Question is just who and where, and what to do about the merge
conflict with intel.

Matthew?


P.

>=20
> > ---
> > =C2=A0drivers/gpu/drm/xe/xe_exec_queue.c | 9 +++------
> > =C2=A0drivers/gpu/drm/xe/xe_pt.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 3 +--
> > =C2=A0drivers/gpu/drm/xe/xe_sched_job.c=C2=A0 | 2 +-
> > =C2=A03 files changed, 5 insertions(+), 9 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe=
_exec_queue.c
> > index cb5f204c08ed..06736f52fbaa 100644
> > --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> > +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> > @@ -1037,8 +1037,7 @@ struct dma_fence *xe_exec_queue_last_fence_get(st=
ruct xe_exec_queue *q,
> > =C2=A0
> > =C2=A0	xe_exec_queue_last_fence_lockdep_assert(q, vm);
> > =C2=A0
> > -	if (q->last_fence &&
> > -	=C2=A0=C2=A0=C2=A0 test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &q->last_fen=
ce->flags))
> > +	if (q->last_fence && dma_fence_test_signaled_flag(q->last_fence))
> > =C2=A0		xe_exec_queue_last_fence_put(q, vm);
> > =C2=A0
> > =C2=A0	fence =3D q->last_fence ? q->last_fence : dma_fence_get_stub();
> > @@ -1064,8 +1063,7 @@ struct dma_fence *xe_exec_queue_last_fence_get_fo=
r_resume(struct xe_exec_queue *
> > =C2=A0
> > =C2=A0	lockdep_assert_held_write(&q->hwe->hw_engine_group->mode_sem);
> > =C2=A0
> > -	if (q->last_fence &&
> > -	=C2=A0=C2=A0=C2=A0 test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &q->last_fen=
ce->flags))
> > +	if (q->last_fence && dma_fence_test_signaled_flag(q->last_fence))
> > =C2=A0		xe_exec_queue_last_fence_put_unlocked(q);
> > =C2=A0
> > =C2=A0	fence =3D q->last_fence ? q->last_fence : dma_fence_get_stub();
> > @@ -1106,8 +1104,7 @@ int xe_exec_queue_last_fence_test_dep(struct xe_e=
xec_queue *q, struct xe_vm *vm)
> > =C2=A0
> > =C2=A0	fence =3D xe_exec_queue_last_fence_get(q, vm);
> > =C2=A0	if (fence) {
> > -		err =3D test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags) ?
> > -			0 : -ETIME;
> > +		err =3D dma_fence_test_signaled_flag(fence) ? 0 : -ETIME;
> > =C2=A0		dma_fence_put(fence);
> > =C2=A0	}
> > =C2=A0
> > diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> > index 07f96bda638a..1ca2dec18e51 100644
> > --- a/drivers/gpu/drm/xe/xe_pt.c
> > +++ b/drivers/gpu/drm/xe/xe_pt.c
> > @@ -1208,8 +1208,7 @@ static bool no_in_syncs(struct xe_sync_entry *syn=
cs, u32 num_syncs)
> > =C2=A0	for (i =3D 0; i < num_syncs; i++) {
> > =C2=A0		struct dma_fence *fence =3D syncs[i].fence;
> > =C2=A0
> > -		if (fence && !test_bit(DMA_FENCE_FLAG_SIGNALED_BIT,
> > -				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &fence->flags))
> > +		if (fence && !dma_fence_test_signaled_flag(fence))
> > =C2=A0			return false;
> > =C2=A0	}
> > =C2=A0
> > diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_=
sched_job.c
> > index d21bf8f26964..1c9ba49a325b 100644
> > --- a/drivers/gpu/drm/xe/xe_sched_job.c
> > +++ b/drivers/gpu/drm/xe/xe_sched_job.c
> > @@ -188,7 +188,7 @@ static bool xe_fence_set_error(struct dma_fence *fe=
nce, int error)
> > =C2=A0	bool signaled;
> > =C2=A0
> > =C2=A0	spin_lock_irqsave(fence->lock, irq_flags);
> > -	signaled =3D test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags);
> > +	signaled =3D dma_fence_test_signaled_flag(fence);
> > =C2=A0	if (!signaled)
> > =C2=A0		dma_fence_set_error(fence, error);
> > =C2=A0	spin_unlock_irqrestore(fence->lock, irq_flags);
>=20


