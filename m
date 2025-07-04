Return-Path: <linux-media+bounces-36820-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CB12AF8F36
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 11:53:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 908EA1CA5366
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 09:54:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A62F2ED17F;
	Fri,  4 Jul 2025 09:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="sK8edQOt"
X-Original-To: linux-media@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DA4728689A;
	Fri,  4 Jul 2025 09:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751622817; cv=none; b=FW8I/+gtiF2IP9R66BwY/U4NX1wM8aUwNM3xcckszp1zYvZMBAuVZL1v04BRlG0kKkMam3yWcLDPz/csIm4kaQkavbDyBmiFSnvfXPmDelDKrSa3wpnb/PUJg9Q9W+QY9n/aIRJTCbAHoAiSZWOSHwunL7KvX+cXcPeVzZy5f/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751622817; c=relaxed/simple;
	bh=4ehB6b1sVOPa7iMPLxqguuE6OmLGmoFdyN4H2bNlKes=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RU934A6MrFgy7ZyasxP538VnrlRLEm/fbdIvHkZObn2yzVnMQCsOhQqiaQcvqRe0XuXrIKW5Exv/qVNVbdAuGOLn/OD6u5cEPwz96b8GF24VkmrZo3Gz01SMbcyrzKOvi23uw/3UbF5LCYazucmbGXK5ORHaxEGsZbHbaEPOCfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=sK8edQOt; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4bYTV335mZz9t3b;
	Fri,  4 Jul 2025 11:53:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1751622811; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XVdGgAyV7zv1tE1nDhhj6shdNz3/wOzCG8QXxgZfEtM=;
	b=sK8edQOtevLwrhp+L6vKqsnyPhoQbmn6cKkpIBkIbYZROKAiTml52HYSYx535BykTmfqgs
	KW+4eyb9iWUKHdfkgpkAzt0Lqd8Je5ClkDgnc/yz5FM+SD1FHX8les4dYv8lql+vGkczEQ
	AoUq7lQnsqd/H6nDnn1SXvs7mTLJAfJRAHd6T8FnhH0Vg71E9xuSzYj3vBr8NNplBtGsuY
	oOmFBdeQ28hs9B4Mbpzf/bhlEv5hvcgxCV1LHV30en1kemPDPhAtRuTMmrbr6zR37wFkDL
	eD3ai06a8aPDvod+mnIKIC/tFTVc37z2KES/CCVeaDzDVVmS//w7v5/gFU8paw==
Message-ID: <fc61c7c9d5d341d752458d0ee6313ec932803ab3.camel@mailbox.org>
Subject: Re: [PATCH 2/6] drm/sched/tests: Port to cancel_job()
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, phasta@kernel.org, Lyude
 Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Matthew Brost
 <matthew.brost@intel.com>, Christian =?ISO-8859-1?Q?K=F6nig?=
 <ckoenig.leichtzumerken@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Sumit Semwal
 <sumit.semwal@linaro.org>, Pierre-Eric Pelloux-Prayer
 <pierre-eric.pelloux-prayer@amd.com>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linaro-mm-sig@lists.linaro.org
Date: Fri, 04 Jul 2025 11:53:25 +0200
In-Reply-To: <9a070a66-f6fd-45b4-958c-c6e9f3487a0c@igalia.com>
References: <20250701132142.76899-3-phasta@kernel.org>
	 <20250701132142.76899-5-phasta@kernel.org>
	 <f9b55d5b-0018-4850-a9b7-2f267467e957@igalia.com>
	 <6762d33b4fe8e7b264a7403f228e6ec6723ae623.camel@mailbox.org>
	 <9a070a66-f6fd-45b4-958c-c6e9f3487a0c@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-ID: d3de0f1ed48b6cb7079
X-MBO-RS-META: 6wtz9saqp63urpgjkiru59jusu3qeiad

On Wed, 2025-07-02 at 12:25 +0100, Tvrtko Ursulin wrote:
>=20
> On 02/07/2025 11:56, Philipp Stanner wrote:
> > On Wed, 2025-07-02 at 11:36 +0100, Tvrtko Ursulin wrote:
> > >=20
> > > On 01/07/2025 14:21, Philipp Stanner wrote:
> > > > The GPU Scheduler now supports a new callback, cancel_job(),
> > > > which
> > > > lets
> > > > the scheduler cancel all jobs which might not yet be freed when
> > > > drm_sched_fini() runs. Using this callback allows for
> > > > significantly
> > > > simplifying the mock scheduler teardown code.
> > > >=20
> > > > Implement the cancel_job() callback and adjust the code where
> > > > necessary.
> > >=20
> > > Cross referencing against my version I think you missed this
> > > hunk:
> > >=20
> > > --- a/drivers/gpu/drm/scheduler/tests/sched_tests.h
> > > +++ b/drivers/gpu/drm/scheduler/tests/sched_tests.h
> > > @@ -49,7 +49,6 @@ struct drm_mock_scheduler {
> > >=20
> > > =C2=A0=C2=A0=C2=A0	spinlock_t		lock;
> > > =C2=A0=C2=A0=C2=A0	struct list_head	job_list;
> > > -	struct list_head	done_list;
> > >=20
> > > =C2=A0=C2=A0=C2=A0	struct {
> > > =C2=A0=C2=A0=C2=A0		u64		context;
> > >=20
> >=20
> > Right, overlooked that one.
> >=20
> > >=20
> > > I also had this:
> > >=20
> > > @@ -97,7 +96,8 @@ struct drm_mock_sched_job {
> > > =C2=A0=C2=A0=C2=A0	struct completion	done;
> > >=20
> > > =C2=A0=C2=A0 #define DRM_MOCK_SCHED_JOB_DONE		0x1
> > > -#define DRM_MOCK_SCHED_JOB_TIMEDOUT	0x2
> > > +#define DRM_MOCK_SCHED_JOB_CANCELED	0x2
> > > +#define DRM_MOCK_SCHED_JOB_TIMEDOUT	0x4
> > >=20
> > > And was setting it in the callback. And since we should add a
> > > test to
> > > explicitly cover the new callback, and just the callback, that
> > > could
> > > make it very easy to do it.
> >=20
> > What do you imagine that to look like? The scheduler only invokes
> > the
> > callback on tear down.
> >=20
> > We also don't have tests that only test free_job() and the like, do
> > we?
> >=20
> > You cannot test a callback for the scheduler, because the callback
> > is
> > implemented in the driver.
> >=20
> > Callbacks are tested by using the scheduler. In this case, it's
> > tested
> > the intended way by the unit tests invoking drm_sched_free().
>=20
> Something like (untested):
>=20
> static void drm_sched_test_cleanup(struct kunit *test)
> {
> 	struct drm_mock_sched_entity *entity;
> 	struct drm_mock_scheduler *sched;
> 	struct drm_mock_sched_job job;
> 	bool done;
>=20
> 	/*
> 	 * Check that the job cancel callback gets invoked by the
> scheduler.
> 	 */
>=20
> 	sched =3D drm_mock_sched_new(test, MAX_SCHEDULE_TIMEOUT);
> 	entity =3D drm_mock_sched_entity_new(test,
> 					=C2=A0=C2=A0
> DRM_SCHED_PRIORITY_NORMAL,
> 					=C2=A0=C2=A0 sched);
>=20
> 	job =3D drm_mock_sched_job_new(test, entity);
> 	drm_mock_sched_job_submit(job);
> 	done =3D drm_mock_sched_job_wait_scheduled(job, HZ);
> 	KUNIT_ASSERT_TRUE(test, done);
>=20
> 	drm_mock_sched_entity_free(entity);
> 	drm_mock_sched_fini(sched);
>=20
> 	KUNIT_ASSERT_TRUE(test, job->flags &
> DRM_MOCK_SCHED_JOB_CANCELED);
> }

That could work =E2=80=93 but it's racy.

I wonder if we want to introduce a mechanism into the mock scheduler
through which we can enforce a simulated GPU hang. Then it would never
race, and that might be useful for more advanced tests for reset
recovery and those things.

Opinions?


P.


>=20
> Or via the hw fence status.
>=20
> Regards,
>=20
> Tvrtko
>=20
> > > > Signed-off-by: Philipp Stanner <phasta@kernel.org>
> > > > ---
> > > > =C2=A0=C2=A0 .../gpu/drm/scheduler/tests/mock_scheduler.c=C2=A0 | 6=
6 +++++++--
> > > > -----
> > > > -----
> > > > =C2=A0=C2=A0 1 file changed, 23 insertions(+), 43 deletions(-)
> > > >=20
> > > > diff --git a/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
> > > > b/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
> > > > index 49d067fecd67..2d3169d95200 100644
> > > > --- a/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
> > > > +++ b/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
> > > > @@ -63,7 +63,7 @@ static void
> > > > drm_mock_sched_job_complete(struct
> > > > drm_mock_sched_job *job)
> > > > =C2=A0=C2=A0=C2=A0	lockdep_assert_held(&sched->lock);
> > > > =C2=A0=C2=A0=20
> > > > =C2=A0=C2=A0=C2=A0	job->flags |=3D DRM_MOCK_SCHED_JOB_DONE;
> > > > -	list_move_tail(&job->link, &sched->done_list);
> > > > +	list_del(&job->link);
> > > > =C2=A0=C2=A0=C2=A0	dma_fence_signal_locked(&job->hw_fence);
> > > > =C2=A0=C2=A0=C2=A0	complete(&job->done);
> > > > =C2=A0=C2=A0 }
> > > > @@ -236,26 +236,39 @@ mock_sched_timedout_job(struct
> > > > drm_sched_job
> > > > *sched_job)
> > > > =C2=A0=C2=A0=20
> > > > =C2=A0=C2=A0 static void mock_sched_free_job(struct drm_sched_job
> > > > *sched_job)
> > > > =C2=A0=C2=A0 {
> > > > -	struct drm_mock_scheduler *sched =3D
> > > > -			drm_sched_to_mock_sched(sched_job-
> > > > >sched);
> > > > =C2=A0=C2=A0=C2=A0	struct drm_mock_sched_job *job =3D
> > > > drm_sched_job_to_mock_job(sched_job);
> > > > -	unsigned long flags;
> > > > =C2=A0=C2=A0=20
> > > > -	/* Remove from the scheduler done list. */
> > > > -	spin_lock_irqsave(&sched->lock, flags);
> > > > -	list_del(&job->link);
> > > > -	spin_unlock_irqrestore(&sched->lock, flags);
> > > > =C2=A0=C2=A0=C2=A0	dma_fence_put(&job->hw_fence);
> > > > -
> > > > =C2=A0=C2=A0=C2=A0	drm_sched_job_cleanup(sched_job);
> > > > =C2=A0=C2=A0=20
> > > > =C2=A0=C2=A0=C2=A0	/* Mock job itself is freed by the kunit framewo=
rk. */
> > > > =C2=A0=C2=A0 }
> > > > =C2=A0=C2=A0=20
> > > > +static void mock_sched_cancel_job(struct drm_sched_job
> > > > *sched_job)
> > > > +{
> > > > +	struct drm_mock_scheduler *sched =3D
> > > > drm_sched_to_mock_sched(sched_job->sched);
> > > > +	struct drm_mock_sched_job *job =3D
> > > > drm_sched_job_to_mock_job(sched_job);
> > > > +	unsigned long flags;
> > > > +
> > > > +	hrtimer_cancel(&job->timer);
> > > > +
> > > > +	spin_lock_irqsave(&sched->lock, flags);
> > > > +	if (!dma_fence_is_signaled_locked(&job->hw_fence)) {
> > > > +		list_del(&job->link);
> > > > +		dma_fence_set_error(&job->hw_fence, -
> > > > ECANCELED);
> > > > +		dma_fence_signal_locked(&job->hw_fence);
> > > > +	}
> > > > +	spin_unlock_irqrestore(&sched->lock, flags);
> > > > +
> > > > +	/* The GPU Scheduler will call
> > > > drm_sched_backend_ops.free_job(), still.
> > > > +	 * Mock job itself is freed by the kunit framework. */
> > >=20
> > > /*
> > > =C2=A0=C2=A0 * Multiline comment style to stay consistent, at least i=
n this
> > > file.
> > > =C2=A0=C2=A0 */
> > >=20
> > > The rest looks good, but I need to revisit the timeout/free
> > > handling
> > > since it has been a while and you changed it recently.
> > >=20
> > > Regards,
> > >=20
> > > Tvrtko
> > >=20
> > > > +}
> > > > +
> > > > =C2=A0=C2=A0 static const struct drm_sched_backend_ops
> > > > drm_mock_scheduler_ops
> > > > =3D {
> > > > =C2=A0=C2=A0=C2=A0	.run_job =3D mock_sched_run_job,
> > > > =C2=A0=C2=A0=C2=A0	.timedout_job =3D mock_sched_timedout_job,
> > > > -	.free_job =3D mock_sched_free_job
> > > > +	.free_job =3D mock_sched_free_job,
> > > > +	.cancel_job =3D mock_sched_cancel_job,
> > > > =C2=A0=C2=A0 };
> > > > =C2=A0=C2=A0=20
> > > > =C2=A0=C2=A0 /**
> > > > @@ -289,7 +302,6 @@ struct drm_mock_scheduler
> > > > *drm_mock_sched_new(struct kunit *test, long timeout)
> > > > =C2=A0=C2=A0=C2=A0	sched->hw_timeline.context =3D
> > > > dma_fence_context_alloc(1);
> > > > =C2=A0=C2=A0=C2=A0	atomic_set(&sched->hw_timeline.next_seqno, 0);
> > > > =C2=A0=C2=A0=C2=A0	INIT_LIST_HEAD(&sched->job_list);
> > > > -	INIT_LIST_HEAD(&sched->done_list);
> > > > =C2=A0=C2=A0=C2=A0	spin_lock_init(&sched->lock);
> > > > =C2=A0=C2=A0=20
> > > > =C2=A0=C2=A0=C2=A0	return sched;
> > > > @@ -304,38 +316,6 @@ struct drm_mock_scheduler
> > > > *drm_mock_sched_new(struct kunit *test, long timeout)
> > > > =C2=A0=C2=A0=C2=A0 */
> > > > =C2=A0=C2=A0 void drm_mock_sched_fini(struct drm_mock_scheduler *sc=
hed)
> > > > =C2=A0=C2=A0 {
> > > > -	struct drm_mock_sched_job *job, *next;
> > > > -	unsigned long flags;
> > > > -	LIST_HEAD(list);
> > > > -
> > > > -	drm_sched_wqueue_stop(&sched->base);
> > > > -
> > > > -	/* Force complete all unfinished jobs. */
> > > > -	spin_lock_irqsave(&sched->lock, flags);
> > > > -	list_for_each_entry_safe(job, next, &sched->job_list,
> > > > link)
> > > > -		list_move_tail(&job->link, &list);
> > > > -	spin_unlock_irqrestore(&sched->lock, flags);
> > > > -
> > > > -	list_for_each_entry(job, &list, link)
> > > > -		hrtimer_cancel(&job->timer);
> > > > -
> > > > -	spin_lock_irqsave(&sched->lock, flags);
> > > > -	list_for_each_entry_safe(job, next, &list, link)
> > > > -		drm_mock_sched_job_complete(job);
> > > > -	spin_unlock_irqrestore(&sched->lock, flags);
> > > > -
> > > > -	/*
> > > > -	 * Free completed jobs and jobs not yet processed by
> > > > the
> > > > DRM scheduler
> > > > -	 * free worker.
> > > > -	 */
> > > > -	spin_lock_irqsave(&sched->lock, flags);
> > > > -	list_for_each_entry_safe(job, next, &sched->done_list,
> > > > link)
> > > > -		list_move_tail(&job->link, &list);
> > > > -	spin_unlock_irqrestore(&sched->lock, flags);
> > > > -
> > > > -	list_for_each_entry_safe(job, next, &list, link)
> > > > -		mock_sched_free_job(&job->base);
> > > > -
> > > > =C2=A0=C2=A0=C2=A0	drm_sched_fini(&sched->base);
> > > > =C2=A0=C2=A0 }
> > > > =C2=A0=C2=A0=20
> > >=20
> >=20
>=20


