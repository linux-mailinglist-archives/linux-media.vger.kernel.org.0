Return-Path: <linux-media+bounces-33135-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B80A0AC0D96
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 16:07:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E86C9A23943
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 14:06:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC8CA28C84A;
	Thu, 22 May 2025 14:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="UxU5Eef5"
X-Original-To: linux-media@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65C0A28C5C1;
	Thu, 22 May 2025 14:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747922798; cv=none; b=MH9YHI0XWo3Anvkli2N/hNDaiB5TwTGws14vW+4teMvawOyms+cjjMfPmlAN2G7nDrnFvylaFoIEY47nw+LKy/Pg1l1TFQKeNc0K8KBkSFBC595lR7G6IOFE42H4zi9Fgf4fYBlfpavRv7/SKZiw4h8WxgDPoVviLE5f4ZTSxOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747922798; c=relaxed/simple;
	bh=KWZ6//jWISV+t9xn5BlPrGdIlTM7WK5Vb1s/QFVTTkU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MtVStXtcBznno9MnFD2DWLQSMA16W5eo9dgUnFeWYGlQmv9zWH+kF/CnQTVI2bS8vpXdRjfsHm+bRReJv7OLGJY+3lIe+J+BVE4Vlj3NHUPAVH3BWIaU1EtlGidjFIIfWOxTZYZ0nJgcsZwXGYqjknzSBJMlLRXzk+QVm3ZSfxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=UxU5Eef5; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4b397r4ZsZz9sm9;
	Thu, 22 May 2025 16:06:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1747922792; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eg7HpbjzyiBKrreN6ukn472LGnMSUrxyAXAMNtQPS9U=;
	b=UxU5Eef5aRU2BbmrgrLtHtVeGCDij7qzkyPtqE0QPpxKbyPqGcb5S1AYHsioYcxGwk6GuW
	op+KsVq63vjRkugZVufq7Q+etJZ6RvUhIcYmDT85TbAtHsuHjfk5NVxyroqt4aKqmqpoMr
	QDC04hmP23j6J5S8ezROBsBuPeGpiS2lqtsJSvWJyzRmCTsPRmGpeTYn5XTyA16Nzdr9Kf
	uAFC/rF5UveAh0gmY9z5EMZ8AY17cuS2yV1s+jsgG+15rbVNfnhgeA41+I5kdZ3ru1wfJ/
	lzDva/u6vefEfjj5sHAA0RckViQhuGxwDeHWipsFjpgJ1mvRzjXHA8GECx/LhQ==
Message-ID: <3dd0d7d48515177138fda16e2fcd764ddca91204.camel@mailbox.org>
Subject: Re: [PATCH] drm/sched/tests: Use one lock for fence context
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, Philipp Stanner
 <phasta@kernel.org>, Matthew Brost <matthew.brost@intel.com>, Danilo
 Krummrich <dakr@kernel.org>, Christian =?ISO-8859-1?Q?K=F6nig?=
 <ckoenig.leichtzumerken@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org
Date: Thu, 22 May 2025 16:06:27 +0200
In-Reply-To: <29124381-6949-4828-9b57-dc2dc0f55107@igalia.com>
References: <20250521100440.110019-2-phasta@kernel.org>
	 <29124381-6949-4828-9b57-dc2dc0f55107@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-ID: a75daceb3509a5973ed
X-MBO-RS-META: pozxfjisrm8nnebmafbugdw993m1eexq

On Wed, 2025-05-21 at 11:24 +0100, Tvrtko Ursulin wrote:
>=20
> On 21/05/2025 11:04, Philipp Stanner wrote:
> > When the unit tests were implemented, each scheduler job got its
> > own,
> > distinct lock. This is not how dma_fence context locking rules are
> > to be
> > implemented. All jobs belonging to the same fence context (in this
> > case:
> > scheduler) should share a lock for their dma_fences. This is to
> > comply
> > to various dma_fence rules, e.g., ensuring that only one fence gets
> > signaled at a time.
> >=20
> > Use the fence context (scheduler) lock for the jobs.
>=20
> I think for the mock scheduler it works to share the lock, but I
> don't=20
> think see that the commit message is correct. Where do you see the=20
> requirement to share the lock? AFAIK fence->lock is a fence lock,=20
> nothing more semantically.

This patch is in part to probe a bit with Christian and Danilo to see
whether we can get a bit more clarity about it.

In many places, notably Nouveau, it's definitely well established
practice to use one lock for the fctx and all the jobs associated with
it.


>=20
> And what does "ensuring that only one fence gets signalled at a time"
> mean? You mean signal in seqno order?=C2=A0

Yes. But that's related. If jobs' fences can get signaled indepently
from each other, that might race and screw up ordering. A common lock
can prevent that.

> Even that is not guaranteed in the=20
> contract due opportunistic signalling.

Jobs must be submitted to the hardware in the order they were
submitted, and, therefore, their fences must be signaled in order. No?

What do you mean by opportunistic signaling?


P.




>=20
> Regards,
>=20
> Tvrtko
>=20
> > Signed-off-by: Philipp Stanner <phasta@kernel.org>
> > ---
> > =C2=A0 drivers/gpu/drm/scheduler/tests/mock_scheduler.c | 5 ++---
> > =C2=A0 drivers/gpu/drm/scheduler/tests/sched_tests.h=C2=A0=C2=A0=C2=A0 =
| 1 -
> > =C2=A0 2 files changed, 2 insertions(+), 4 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
> > b/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
> > index f999c8859cf7..17023276f4b0 100644
> > --- a/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
> > +++ b/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
> > @@ -64,7 +64,7 @@ static void drm_mock_sched_job_complete(struct
> > drm_mock_sched_job *job)
> > =C2=A0=20
> > =C2=A0=C2=A0	job->flags |=3D DRM_MOCK_SCHED_JOB_DONE;
> > =C2=A0=C2=A0	list_move_tail(&job->link, &sched->done_list);
> > -	dma_fence_signal(&job->hw_fence);
> > +	dma_fence_signal_locked(&job->hw_fence);
> > =C2=A0=C2=A0	complete(&job->done);
> > =C2=A0 }
> > =C2=A0=20
> > @@ -123,7 +123,6 @@ drm_mock_sched_job_new(struct kunit *test,
> > =C2=A0=C2=A0	job->test =3D test;
> > =C2=A0=20
> > =C2=A0=C2=A0	init_completion(&job->done);
> > -	spin_lock_init(&job->lock);
> > =C2=A0=C2=A0	INIT_LIST_HEAD(&job->link);
> > =C2=A0=C2=A0	hrtimer_setup(&job->timer,
> > drm_mock_sched_job_signal_timer,
> > =C2=A0=C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CLOCK_MONOTONIC, HRTIMER_M=
ODE_ABS);
> > @@ -169,7 +168,7 @@ static struct dma_fence
> > *mock_sched_run_job(struct drm_sched_job *sched_job)
> > =C2=A0=20
> > =C2=A0=C2=A0	dma_fence_init(&job->hw_fence,
> > =C2=A0=C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &drm_mock_sched_hw_f=
ence_ops,
> > -		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &job->lock,
> > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &sched->lock,
> > =C2=A0=C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sched->hw_timeline.c=
ontext,
> > =C2=A0=C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 atomic_inc_return(&s=
ched-
> > >hw_timeline.next_seqno));
> > =C2=A0=20
> > diff --git a/drivers/gpu/drm/scheduler/tests/sched_tests.h
> > b/drivers/gpu/drm/scheduler/tests/sched_tests.h
> > index 27caf8285fb7..fbba38137f0c 100644
> > --- a/drivers/gpu/drm/scheduler/tests/sched_tests.h
> > +++ b/drivers/gpu/drm/scheduler/tests/sched_tests.h
> > @@ -106,7 +106,6 @@ struct drm_mock_sched_job {
> > =C2=A0=C2=A0	unsigned int		duration_us;
> > =C2=A0=C2=A0	ktime_t			finish_at;
> > =C2=A0=20
> > -	spinlock_t		lock;
> > =C2=A0=C2=A0	struct dma_fence	hw_fence;
> > =C2=A0=20
> > =C2=A0=C2=A0	struct kunit		*test;
>=20


