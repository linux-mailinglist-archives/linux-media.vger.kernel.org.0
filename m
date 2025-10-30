Return-Path: <linux-media+bounces-46002-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 71D7CC1FC97
	for <lists+linux-media@lfdr.de>; Thu, 30 Oct 2025 12:20:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9CB6D1892621
	for <lists+linux-media@lfdr.de>; Thu, 30 Oct 2025 11:18:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DF462E6CC0;
	Thu, 30 Oct 2025 11:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="rfCkCj1a"
X-Original-To: linux-media@vger.kernel.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B976D2E0915;
	Thu, 30 Oct 2025 11:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761823071; cv=none; b=YIwhHibRQdJg7Y1kkM+THqoFRbHIFET2VAAjSw4/LlaxIAsExEEtuCoA97wmSHT3hkQz/+d02x6LDlupgygvMKN3cQb0/GKLGqQHnSaHqdGs+B2YO6LYSjsL7T2mUB0vmdVHvdBxDyDtfKHl37vj0cX2qbjsTIbG2yn8kmc7y5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761823071; c=relaxed/simple;
	bh=ef6IQ8G5fS30t07ddl2rgjhqXh3EABvzFi7I2xxCRiU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cK0naH3ZYE0nxLV5qAmuoVds+olDWlNgS+YxRe81NFQccAiNWQzF6ip5n81xwCgJG6XIpT3/wGiSzwcANBfZt6KqDMx+0olddv0sYRg0Lvj8DpNsPS30hL1J5NBjPf71uFlXtgROJSw9xuoJSAJndgPEElmXuGli3VxrLO0dr28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=rfCkCj1a; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4cy1mg3LK0z9spB;
	Thu, 30 Oct 2025 12:17:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1761823059; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=udQdI8kZ9HNR1T3YelubgV+z74XJhbul0irKljvsfkw=;
	b=rfCkCj1aKP3gD9fOKRtgCEZm254WNjvqqyYCD1808//A8YhflHFiiKP/HJOpq9yq7jNCyk
	hj7d/rUdifE+Wvb1dA6BhWHH++w6Rp/9RQv02E7vyrnCJQD87ql2VfxV8iNEz7ryyPJEB6
	CdVBDsuHksvbjEZ7QsbTjPA3Fue3uZqqbuNtCh5dKSZNtEZFqiEOS22+l+Dw4Cb4MutmvD
	CpP519yREgx3PQSsNMBmJY1IV9tKJY8+akQB8/CXqqMjO/kZfBn4ZqOTBcmch6fx+WE+oG
	+fZ3LqaV8rbTc8Al9CqQZW/zaCGJvIMlEJqLF+8Da7WYsH5KdeRDJLj7qoC9mg==
Message-ID: <fb2881006f843bd85dd02948c4467c81086effc8.camel@mailbox.org>
Subject: Re: [PATCH v1] drm/sched: fix deadlock in
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
 <sumit.semwal@linaro.org>
Cc: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Date: Thu, 30 Oct 2025 12:17:31 +0100
In-Reply-To: <20251029091103.1159-1-pierre-eric.pelloux-prayer@amd.com>
References: <20251029091103.1159-1-pierre-eric.pelloux-prayer@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-META: uxkngmmbxwy4o97th7ytiop6e8nj697p
X-MBO-RS-ID: ca1f3193d85e48195cb

On Wed, 2025-10-29 at 10:11 +0100, Pierre-Eric Pelloux-Prayer wrote:
> https://gitlab.freedesktop.org/mesa/mesa/-/issues/13908=C2=A0pointed out

This link should be moved to the tag section at the bottom at a Closes:
tag. Optionally a Reported-by:, too.

> a possible deadlock:
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

The commit message is lacking an explanation as to _how_ and _when_ the
deadlock comes to be. That's a prerequisite for understanding why the
below is the proper fix and solution.

The issue seems to be that you cannot perform certain tasks from within
that work item?

> My initial fix was to replace xa_erase by xa_erase_irq, but Christian
> pointed out that calling dma_fence_add_callback from a callback can
> also deadlock if the signalling fence and the one passed to
> dma_fence_add_callback share the same lock.
>=20
> To fix both issues, the code iterating on dependencies and re-arming them
> is moved out to drm_sched_entity_kill_jobs_work.
>=20
> Suggested-by: Christian K=C3=B6nig <christian.koenig@amd.com>
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
> +
> =C2=A0static void drm_sched_entity_kill_jobs_work(struct work_struct *wrk=
)
> =C2=A0{
> =C2=A0	struct drm_sched_job *job =3D container_of(wrk, typeof(*job), work=
);
> -
> -	drm_sched_fence_scheduled(job->s_fence, NULL);
> -	drm_sched_fence_finished(job->s_fence, -ESRCH);
> -	WARN_ON(job->s_fence->parent);
> -	job->sched->ops->free_job(job);

Can free_job() really not be called from within work item context?


P.

