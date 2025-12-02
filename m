Return-Path: <linux-media+bounces-48057-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D1722C9AB02
	for <lists+linux-media@lfdr.de>; Tue, 02 Dec 2025 09:30:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A01BA3A4695
	for <lists+linux-media@lfdr.de>; Tue,  2 Dec 2025 08:30:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 402203081AD;
	Tue,  2 Dec 2025 08:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="rtiE3GB6"
X-Original-To: linux-media@vger.kernel.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67459307AEC;
	Tue,  2 Dec 2025 08:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764664171; cv=none; b=IMHsDUIHjJVYpcM505BYK+IjfuK1z2a2CJfJrvb35aWIqpBYNwtMx+9KHWjeNePXMllxNqsuCBZuCay6thG+q+vzVBxybtMY6d+JVs4IveesKQFqdZDblkOc85MHpJnoT9isWEotJXPvte+KlyTGSXI1G4NjtSbFVLkpR9IY0oU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764664171; c=relaxed/simple;
	bh=XO59gKHerE8bgMBXwUVjJyR3vGNR9BpDZVicXJo8giE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Csbl6vd+Rcm8NrRjNUuFnDAev1c2BUrypBj2dcc4PMHMk1yBAPGCWUEJ9h0IpqvtTX4pj4vYlqlNiSsvzjjO188pl98hSxsZXh7tTvpLUvSsMn6XUIsIanaq/9JXHPQS04HJlcmWKXkeenAyMyrBJs3BY8nwborPth3yBGB/X3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=rtiE3GB6; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4dLDTD0jlmz9t0n;
	Tue,  2 Dec 2025 09:29:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1764664160; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=F3V+T3Om8mfxHZjoquX2SFCTJRc6COI8uBe9tXVns1o=;
	b=rtiE3GB6OQymRRXq6bWEORf0EfuPDtxS3sekTtzO4T8XZ5MLvkGt1Ac63OSi8pz4kbswXr
	yX/iz/4acIgH6RUpliPeKrVGPQnrMs4ZXxhU13MkAgCIPxHBH+/pm8Z/Cf3nSH4HQ8B/Bz
	ayg2P2whnMkKeJLXUzff2SV/iVSLS8+8FonRXw6WpYcXZ4ISMy2FqDLagUV/ezUoERrhXv
	zWyTuYkstLxtsa7rlL59fvFOO+uPnh2qr28MZUrbY+2Xl2t37pRdVa0fxXfdwI5/F/sg1r
	5Flw/byOkjwd8AVdjG0gHpG5fTsS2diT8CrO3d6uWKB+oAPFIHn+SRu5ItC5+w==
Message-ID: <1aaaa2fe56fc7598b653a5e45fc26aa0b8703ad5.camel@mailbox.org>
Subject: Re: [PATCH v2 8/8] drm/xe: Use dma_fence_test_signaled_flag()
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: Matthew Brost <matthew.brost@intel.com>, Philipp Stanner
 <phasta@kernel.org>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, Gustavo Padovan
 <gustavo@padovan.org>, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Felix Kuehling <Felix.Kuehling@amd.com>, Alex
 Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>,  Tvrtko Ursulin <tursulin@ursulin.net>, Huang Rui
 <ray.huang@amd.com>, Matthew Auld <matthew.auld@intel.com>,  Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Lucas De
 Marchi <lucas.demarchi@intel.com>, Thomas =?ISO-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org,  linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org,  intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Date: Tue, 02 Dec 2025 09:29:09 +0100
In-Reply-To: <aS3touSB1ZyR2hfM@lstrano-desk.jf.intel.com>
References: <20251201105011.19386-2-phasta@kernel.org>
	 <20251201105011.19386-10-phasta@kernel.org>
	 <aS3touSB1ZyR2hfM@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-ID: 76ac2ab24f1c8917547
X-MBO-RS-META: 6eppcxqxqw1xf4rtz518s3ggqzj8e6aa

On Mon, 2025-12-01 at 11:33 -0800, Matthew Brost wrote:
> On Mon, Dec 01, 2025 at 11:50:12AM +0100, Philipp Stanner wrote:
> > There is a new dma_fence helper which simplifies testing for a fence's
> > signaled_flag. Use it in xe.
> >=20
> > Signed-off-by: Philipp Stanner <phasta@kernel.org>
>=20
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>

Doesn't apply on drm-misc-next. Suggestions about what to do about
that?


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
> > --=20
> > 2.49.0
> >=20


