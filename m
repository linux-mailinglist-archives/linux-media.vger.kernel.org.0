Return-Path: <linux-media+bounces-34631-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB7EAD73E7
	for <lists+linux-media@lfdr.de>; Thu, 12 Jun 2025 16:32:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C1C041888CC2
	for <lists+linux-media@lfdr.de>; Thu, 12 Jun 2025 14:28:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9AE2225761;
	Thu, 12 Jun 2025 14:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="xD9XA+tF"
X-Original-To: linux-media@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 611D02F24;
	Thu, 12 Jun 2025 14:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749738461; cv=none; b=JL8OxZKea/I4lflhc6j3Pkk9tOCpvYxX18s1TRTIj+xCHsDlDR2Dd+1cCXJ7OhE+tk8RiWl6keQgiz6xgugHBSWaSA9PwBtDRazscfJ2DgpTEIIK2O68o6+TEpc8F0Pl4RvNVxH1XFhaeNM3J9JKr5QduC8qKjt8OGh2E43Dzcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749738461; c=relaxed/simple;
	bh=mZtjFVpDF4zOYDZZGfMJaIYLzQRJ1cUipqthavlmgVg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=D+U0irz+fNiK8hEX1tTHk6+D9WLBpMeT7VNyubCpnjC3z4jaKnPWT2LYpdJWkzWvkeUuXEE/cpa/JvXLCN63/IvKR9/GmNiX8EUaJWYH2RxYn7QuGDThbj413YLtgmdtNQgTl7H7UFCOsIJ5Hbuoyy2KmMHuIcTtiutY79YIus8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=xD9XA+tF; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4bJ4Sw0z4Dz9sp3;
	Thu, 12 Jun 2025 16:21:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1749738064; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LUPnbMKZsQR2YGEzcKKfW5NC/LS9WZVDDt3t+hU+WYU=;
	b=xD9XA+tF3DtsgZ/TvoLRbK1Aczn2kB03rAMmVtJak3LqwegXNUc9uE/X+ueAQE2lsb3m4z
	nMS/GAVVbawehSW3oHS+UrMDPUfosntFCueeJu0jdBg7agC7b/icGX2oLwDaaDbb/D3uJL
	e0PHOod+Rz4m5QK3iAme7eCMyiPKbR5hv1VO4K8fvv7B7PtHCpIMMecJx5sREk1CryUckd
	v62q0rHqELw4BRYHCKbhp13fonFZXPKIGO8HYmj7yJardsvD2c96JZp/YCYBLIPBPM8h8y
	a26R8D10Vu/FuGEcVYJVpeR3fZsngtoc6ndZnptXNyVwj5KyXuDzGjrPViZ2IA==
Message-ID: <f4f326a0ecb98a9996919c3f827b3247b8207feb.camel@mailbox.org>
Subject: Re: [RFC PATCH 1/6] drm/sched: Avoid memory leaks with cancel_job()
 callback
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, Philipp Stanner
 <phasta@kernel.org>, Lyude Paul <lyude@redhat.com>, Danilo Krummrich
 <dakr@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Matthew Brost <matthew.brost@intel.com>, Christian
 =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Sumit Semwal
 <sumit.semwal@linaro.org>, Pierre-Eric Pelloux-Prayer
 <pierre-eric.pelloux-prayer@amd.com>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Date: Thu, 12 Jun 2025 16:20:58 +0200
In-Reply-To: <62ff8ddb-b2f1-4e52-a026-290561ab5337@igalia.com>
References: <20250603093130.100159-2-phasta@kernel.org>
	 <20250603093130.100159-3-phasta@kernel.org>
	 <62ff8ddb-b2f1-4e52-a026-290561ab5337@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-META: oodnuo5gzpywi6c6hikd3z6f1sf1sei5
X-MBO-RS-ID: 8a4021f237a81cd6bf4

On Thu, 2025-06-12 at 15:17 +0100, Tvrtko Ursulin wrote:
>=20
> On 03/06/2025 10:31, Philipp Stanner wrote:
> > Since its inception, the GPU scheduler can leak memory if the
> > driver
> > calls drm_sched_fini() while there are still jobs in flight.
> >=20
> > The simplest way to solve this in a backwards compatible manner is
> > by
> > adding a new callback, drm_sched_backend_ops.cancel_job(), which
> > instructs the driver to signal the hardware fence associated with
> > the
> > job. Afterwards, the scheduler can savely use the established
> > free_job()
> > callback for freeing the job.
> >=20
> > Implement the new backend_ops callback cancel_job().
> >=20
> > Suggested-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>=20
> Please just add the link to the patch here (it is only in the cover
> letter):
>=20
> Link:=20
> https://lore.kernel.org/dri-devel/20250418113211.69956-1-tvrtko.ursulin@i=
galia.com/

That I can do, sure

>=20
> And you probably want to take the unit test modifications from the
> same=20
> patch too. You could put them in the same patch or separate.

Necessary adjustments for the unit tests are already implemented and
are waiting for review separately, since this can be done independently
from this entire series:

https://lore.kernel.org/dri-devel/20250605134154.191764-2-phasta@kernel.org=
/


Thx
P.

>=20
> Regards,
>=20
> Tvrtko
>=20
> > Signed-off-by: Philipp Stanner <phasta@kernel.org>
> > ---
> > =C2=A0 drivers/gpu/drm/scheduler/sched_main.c | 34 ++++++++++++++++----=
-
> > -----
> > =C2=A0 include/drm/gpu_scheduler.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 9 +++++++
> > =C2=A0 2 files changed, 30 insertions(+), 13 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/scheduler/sched_main.c
> > b/drivers/gpu/drm/scheduler/sched_main.c
> > index d20726d7adf0..3f14f1e151fa 100644
> > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > @@ -1352,6 +1352,18 @@ int drm_sched_init(struct drm_gpu_scheduler
> > *sched, const struct drm_sched_init_
> > =C2=A0 }
> > =C2=A0 EXPORT_SYMBOL(drm_sched_init);
> > =C2=A0=20
> > +static void drm_sched_kill_remaining_jobs(struct drm_gpu_scheduler
> > *sched)
> > +{
> > +	struct drm_sched_job *job, *tmp;
> > +
> > +	/* All other accessors are stopped. No locking necessary.
> > */
> > +	list_for_each_entry_safe_reverse(job, tmp, &sched-
> > >pending_list, list) {
> > +		sched->ops->cancel_job(job);
> > +		list_del(&job->list);
> > +		sched->ops->free_job(job);
> > +	}
> > +}
> > +
> > =C2=A0 /**
> > =C2=A0=C2=A0 * drm_sched_fini - Destroy a gpu scheduler
> > =C2=A0=C2=A0 *
> > @@ -1359,19 +1371,11 @@ EXPORT_SYMBOL(drm_sched_init);
> > =C2=A0=C2=A0 *
> > =C2=A0=C2=A0 * Tears down and cleans up the scheduler.
> > =C2=A0=C2=A0 *
> > - * This stops submission of new jobs to the hardware through
> > - * drm_sched_backend_ops.run_job(). Consequently,
> > drm_sched_backend_ops.free_job()
> > - * will not be called for all jobs still in
> > drm_gpu_scheduler.pending_list.
> > - * There is no solution for this currently. Thus, it is up to the
> > driver to make
> > - * sure that:
> > - *
> > - *=C2=A0 a) drm_sched_fini() is only called after for all submitted
> > jobs
> > - *=C2=A0=C2=A0=C2=A0=C2=A0 drm_sched_backend_ops.free_job() has been c=
alled or that
> > - *=C2=A0 b) the jobs for which drm_sched_backend_ops.free_job() has no=
t
> > been called
> > - *=C2=A0=C2=A0=C2=A0=C2=A0 after drm_sched_fini() ran are freed manual=
ly.
> > - *
> > - * FIXME: Take care of the above problem and prevent this function
> > from leaking
> > - * the jobs in drm_gpu_scheduler.pending_list under any
> > circumstances.
> > + * This stops submission of new jobs to the hardware through
> > &struct
> > + * drm_sched_backend_ops.run_job. If &struct
> > drm_sched_backend_ops.cancel_job
> > + * is implemented, all jobs will be canceled through it and
> > afterwards cleaned
> > + * up through &struct drm_sched_backend_ops.free_job. If
> > cancel_job is not
> > + * implemented, memory could leak.
> > =C2=A0=C2=A0 */
> > =C2=A0 void drm_sched_fini(struct drm_gpu_scheduler *sched)
> > =C2=A0 {
> > @@ -1401,6 +1405,10 @@ void drm_sched_fini(struct drm_gpu_scheduler
> > *sched)
> > =C2=A0=C2=A0	/* Confirm no work left behind accessing device structures
> > */
> > =C2=A0=C2=A0	cancel_delayed_work_sync(&sched->work_tdr);
> > =C2=A0=20
> > +	/* Avoid memory leaks if supported by the driver. */
> > +	if (sched->ops->cancel_job)
> > +		drm_sched_kill_remaining_jobs(sched);
> > +
> > =C2=A0=C2=A0	if (sched->own_submit_wq)
> > =C2=A0=C2=A0		destroy_workqueue(sched->submit_wq);
> > =C2=A0=C2=A0	sched->ready =3D false;
> > diff --git a/include/drm/gpu_scheduler.h
> > b/include/drm/gpu_scheduler.h
> > index e62a7214e052..81dcbfc8c223 100644
> > --- a/include/drm/gpu_scheduler.h
> > +++ b/include/drm/gpu_scheduler.h
> > @@ -512,6 +512,15 @@ struct drm_sched_backend_ops {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * and it's=
 time to clean it up.
> > =C2=A0=C2=A0	 */
> > =C2=A0=C2=A0	void (*free_job)(struct drm_sched_job *sched_job);
> > +
> > +	/**
> > +	 * @cancel_job: Used by the scheduler to guarantee
> > remaining jobs' fences
> > +	 * get signaled in drm_sched_fini().
> > +	 *
> > +	 * Drivers need to signal the passed job's hardware fence
> > with
> > +	 * -ECANCELED in this callback. They must not free the
> > job.
> > +	 */
> > +	void (*cancel_job)(struct drm_sched_job *sched_job);
> > =C2=A0 };
> > =C2=A0=20
> > =C2=A0 /**
>=20


