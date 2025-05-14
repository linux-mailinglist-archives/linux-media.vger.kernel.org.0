Return-Path: <linux-media+bounces-32481-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 10047AB6BB3
	for <lists+linux-media@lfdr.de>; Wed, 14 May 2025 14:46:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0FB901B67D8C
	for <lists+linux-media@lfdr.de>; Wed, 14 May 2025 12:46:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC25D2797A0;
	Wed, 14 May 2025 12:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="cCdvo0q3"
X-Original-To: linux-media@vger.kernel.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC51034CF5;
	Wed, 14 May 2025 12:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747226788; cv=none; b=rvwKsMwGjvW8x7igvEma/enWwhXzm31brww+RSzQ9CKhnUGmRIfqcR+Pmnwr0FCnNiUSHQvRYXzOL1lewvHenK0iOZ/FJ7XhUAeSRvIiC0YB76euiik1nKZODp+mxv8VeYzzA8EzdWQZeBS2Xqf7LaNkd3zW/w8pxmiIBmAp1rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747226788; c=relaxed/simple;
	bh=jMRfiNiSjkT+I63v+Zw5znAS191vtTy+/cChgpF5z9o=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UwHFZqpb/ybqFqLwy5Ieja61gxVa4Sb2P+6Io6aH6QYr3f2VGvJbII3JKZhM233TXy3l8SVCvre6PqsVKzV1n7lbIEe6ZpG22lbYYp9Sw2nnvkuqE8W0A4WWAphNCv4XvdGQpkotZMiXXxkzWbzsFykcTkZWuKerbmTfKzWjVwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=cCdvo0q3; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4ZyCl31ZnGz9snt;
	Wed, 14 May 2025 14:46:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1747226783; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RvhuufjJWlflHAYdcYTrZqmE0a4wYRybOZgh/DnhpXw=;
	b=cCdvo0q3szdBfKR57fkxOysKRYgBEiPLHzVYvDYUzeTLlkLlOhHGwDtNParGTsPYmGx8VC
	ArR76tMWw1HhldwOJx6/lxx7CGoBxJLqEkoYEm7BxUFPuAR/Qh2Gf+MOXXbWVlNtVNPzI8
	4yafDxR3St2kFwKxa7Y7jgZmI7qEOqQ6ej6uHu4sT78qiN4SV7nyPBVaizRuO9w+r1dL9k
	fw4MIxnqzRnhTShf5foOcmKByWm5k/rARu6CBAczJVSPsq/jzh9/SuGRswt4BoOMDBNZ1Y
	oKNsm2tURWvkWdQicbSHb1ZTgtrdwQLw3xYVoquZYu6OmJyGzyBAQsj7+nGmdQ==
Message-ID: <48f98c31656ac131f228a4415a561e914d70c9de.camel@mailbox.org>
Subject: Re: [PATCH v9 05/10] drm/sched: trace dependencies for gpu jobs
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>, 
 Matthew Brost <matthew.brost@intel.com>, Danilo Krummrich
 <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>,  Christian
 =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>,  Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Sumit Semwal
 <sumit.semwal@linaro.org>
Cc: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Date: Wed, 14 May 2025 14:46:18 +0200
In-Reply-To: <20250424083834.15518-6-pierre-eric.pelloux-prayer@amd.com>
References: <20250424083834.15518-1-pierre-eric.pelloux-prayer@amd.com>
	 <20250424083834.15518-6-pierre-eric.pelloux-prayer@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-ID: 016bf6d42cc38318115
X-MBO-RS-META: peagjocu9j1god3a7y83es46uibc7fob

nit: title: s/gpu/GPU

We also mostly start with an upper case letter after the :, but JFYI,
it's not a big deal.


P.

On Thu, 2025-04-24 at 10:38 +0200, Pierre-Eric Pelloux-Prayer wrote:
> We can't trace dependencies from drm_sched_job_add_dependency
> because when it's called the job's fence is not available yet.
>=20
> So instead each dependency is traced individually when
> drm_sched_entity_push_job is used.
>=20
> Tracing the dependencies allows tools to analyze the dependencies
> between the jobs (previously it was only possible for fences
> traced by drm_sched_job_wait_dep).
>=20
> Signed-off-by: Pierre-Eric Pelloux-Prayer
> <pierre-eric.pelloux-prayer@amd.com>
> Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> ---
> =C2=A0.../gpu/drm/scheduler/gpu_scheduler_trace.h=C2=A0=C2=A0 | 23
> +++++++++++++++++++
> =C2=A0drivers/gpu/drm/scheduler/sched_entity.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 8 +++++++
> =C2=A02 files changed, 31 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
> b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
> index 6f5bd05131aa..5d9992ad47d3 100644
> --- a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
> +++ b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
> @@ -87,6 +87,29 @@ TRACE_EVENT(drm_sched_process_job,
> =C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __entry->fence_context, __entry->f=
ence_seqno)
> =C2=A0);
> =C2=A0
> +TRACE_EVENT(drm_sched_job_add_dep,
> +	TP_PROTO(struct drm_sched_job *sched_job, struct dma_fence
> *fence),
> +	TP_ARGS(sched_job, fence),
> +	TP_STRUCT__entry(
> +		=C2=A0=C2=A0=C2=A0 __field(u64, fence_context)
> +		=C2=A0=C2=A0=C2=A0 __field(u64, fence_seqno)
> +		=C2=A0=C2=A0=C2=A0 __field(u64, id)
> +		=C2=A0=C2=A0=C2=A0 __field(u64, ctx)
> +		=C2=A0=C2=A0=C2=A0 __field(u64, seqno)
> +		=C2=A0=C2=A0=C2=A0 ),
> +
> +	TP_fast_assign(
> +		=C2=A0=C2=A0=C2=A0 __entry->fence_context =3D sched_job->s_fence-
> >finished.context;
> +		=C2=A0=C2=A0=C2=A0 __entry->fence_seqno =3D sched_job->s_fence-
> >finished.seqno;
> +		=C2=A0=C2=A0=C2=A0 __entry->id =3D sched_job->id;
> +		=C2=A0=C2=A0=C2=A0 __entry->ctx =3D fence->context;
> +		=C2=A0=C2=A0=C2=A0 __entry->seqno =3D fence->seqno;
> +		=C2=A0=C2=A0=C2=A0 ),
> +	TP_printk("fence=3D%llu:%llu, id=3D%llu depends on
> fence=3D%llu:%llu",
> +		=C2=A0 __entry->fence_context, __entry->fence_seqno,
> __entry->id,
> +		=C2=A0 __entry->ctx, __entry->seqno)
> +);
> +
> =C2=A0TRACE_EVENT(drm_sched_job_wait_dep,
> =C2=A0	=C2=A0=C2=A0=C2=A0 TP_PROTO(struct drm_sched_job *sched_job, struc=
t
> dma_fence *fence),
> =C2=A0	=C2=A0=C2=A0=C2=A0 TP_ARGS(sched_job, fence),
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c
> b/drivers/gpu/drm/scheduler/sched_entity.c
> index bd39db7bb240..be579e132711 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -587,6 +587,14 @@ void drm_sched_entity_push_job(struct
> drm_sched_job *sched_job)
> =C2=A0	ktime_t submit_ts;
> =C2=A0
> =C2=A0	trace_drm_sched_job(sched_job, entity);
> +
> +	if (trace_drm_sched_job_add_dep_enabled()) {
> +		struct dma_fence *entry;
> +		unsigned long index;
> +
> +		xa_for_each(&sched_job->dependencies, index, entry)
> +			trace_drm_sched_job_add_dep(sched_job,
> entry);
> +	}
> =C2=A0	atomic_inc(entity->rq->sched->score);
> =C2=A0	WRITE_ONCE(entity->last_user, current->group_leader);
> =C2=A0


