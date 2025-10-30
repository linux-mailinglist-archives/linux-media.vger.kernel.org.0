Return-Path: <linux-media+bounces-46007-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A1FC20029
	for <lists+linux-media@lfdr.de>; Thu, 30 Oct 2025 13:28:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 708D519C5454
	for <lists+linux-media@lfdr.de>; Thu, 30 Oct 2025 12:27:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDD43324B0C;
	Thu, 30 Oct 2025 12:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="vYHaRMpx"
X-Original-To: linux-media@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A7563126DF;
	Thu, 30 Oct 2025 12:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761827189; cv=none; b=f9bAniDsQ1yqI8MhE2oSkpPTQbe7cZ8NJhKy6SdvwuV02Om4BWYDDQkhwLxZX4HVVYyLO4zdNWKeDwF+5wlrjVO66sXWXfcFlVzWl9n+RLIsIz9/JLo6l3PTQnWm7nZrPn+is/+7dag/CH+rgalecy1n/HoTK2vUDuVrvWwkwMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761827189; c=relaxed/simple;
	bh=zZDwFr4IyiT8vx7/wLRCFRIXbWSDTfwwP9NpmJNno9M=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cBC3Zn5EuwcFGCcfaZii/YBG6L/U/BH+XdwvyGp/xWKWb6qgH4MIM92XLfGIRRKzfRwaqH9sxkd8NSaefFJmLoF/0XUySNaMQ7c7i5r3kj7JfTgNbFNzE+JTpjVHPES5ECra3SGYkeYj5OARo58mJeBb/0HrfsOehdieiSRd4Ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=vYHaRMpx; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4cy3Hs1HYnz9vBj;
	Thu, 30 Oct 2025 13:26:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1761827177; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9DK/EsSrv/ZUc4X4MrgLDSTB0kWrjlTtTs1nlO5FmUg=;
	b=vYHaRMpx01AqFN5eK8xNSNlujKnBCKhUWW+nXEEbLsTAXCQapvG+uBzxAT7/zTIq0Ocn4e
	EkNumxB1SbEdozNM9GV4IhJZqNaYp0US2CWJUfA7OPVFsZo2mgHeFN/mEG1drwN6+qIQYN
	tNqHw3eQgMfUbXto1Eu3Dcw6cSEUc9p5IDvdEviWqTSn7sVCqeEMRMyAPMC8mOxwkYYD4W
	R2sdzkDzqMigZ+YFphSmFs2aza7IBYMxkgnuj2l5u9fbuCZZhNwr08A2Kj+AR7Y6ioSeVF
	bRW6BQeov+jAFvcfaoKN/8AL5T0ShhlBcIyXaCPxACA21jk+LhcQQisqcPh2EA==
Message-ID: <c51ea5a408ca6d404074be1df219077457ea76f6.camel@mailbox.org>
Subject: Re: [PATCH v1] drm/sched: fix deadlock in
 drm_sched_entity_kill_jobs_cb
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: Pierre-Eric Pelloux-Prayer <pierre-eric@damsy.net>, phasta@kernel.org, 
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>, Matthew
 Brost <matthew.brost@intel.com>, Danilo Krummrich <dakr@kernel.org>,
 Christian =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>,  Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Sumit Semwal
 <sumit.semwal@linaro.org>
Cc: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Date: Thu, 30 Oct 2025 13:26:10 +0100
In-Reply-To: <442d0e70-c9e2-4bd6-a144-ea083dbf86d2@damsy.net>
References: <20251029091103.1159-1-pierre-eric.pelloux-prayer@amd.com>
	 <fb2881006f843bd85dd02948c4467c81086effc8.camel@mailbox.org>
	 <442d0e70-c9e2-4bd6-a144-ea083dbf86d2@damsy.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-META: t5i1pxoekhdn1m5qnn8hwnur5fmqbb8o
X-MBO-RS-ID: 8afa6dd1f8f1b2c6dfd

On Thu, 2025-10-30 at 13:06 +0100, Pierre-Eric Pelloux-Prayer wrote:
>=20
>=20
> Le 30/10/2025 =C3=A0 12:17, Philipp Stanner a =C3=A9crit=C2=A0:
> > On Wed, 2025-10-29 at 10:11 +0100, Pierre-Eric Pelloux-Prayer wrote:
> > > https://gitlab.freedesktop.org/mesa/mesa/-/issues/13908=C2=A0pointed =
out
> >=20
> > This link should be moved to the tag section at the bottom at a Closes:
> > tag. Optionally a Reported-by:, too.
>=20
> The bug report is about a different issue. The potential deadlock being f=
ixed by=20
> this patch was discovered while investigating it.
> I'll add a Reported-by tag though.
>=20
> >=20
> > > a possible deadlock:
> > >=20
> > > [ 1231.611031]=C2=A0 Possible interrupt unsafe locking scenario:
> > >=20
> > > [ 1231.611033]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CPU0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CPU1
> > > [ 1231.611034]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ----=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ----
> > > [ 1231.611035]=C2=A0=C2=A0 lock(&xa->xa_lock#17);
> > > [ 1231.611038]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 local_irq_disable=
();
> > > [ 1231.611039]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 lock(&fence->lock=
);
> > > [ 1231.611041]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 lock(&xa->xa_lock=
#17);
> > > [ 1231.611044]=C2=A0=C2=A0 <Interrupt>
> > > [ 1231.611045]=C2=A0=C2=A0=C2=A0=C2=A0 lock(&fence->lock);
> > > [ 1231.611047]
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 *** DEADLOCK ***
> > >=20
> >=20
> > The commit message is lacking an explanation as to _how_ and _when_ the
> > deadlock comes to be. That's a prerequisite for understanding why the
> > below is the proper fix and solution.
>=20
> I copy-pasted a small chunk of the full deadlock analysis report included=
 in the=20
> ticket because it's 300+ lines long. Copying the full log isn't useful IM=
O, but=20
> I can add more context.

The log wouldn't be useful, but a human-generated explanation as you
detail it below.

>=20
> The problem is that a thread (CPU0 above) can lock the job's dependencies=
=20
> xa_array without disabling the interrupts.

Which drm_sched function would that be?

> If a fence signals while CPU0 holds this lock and drm_sched_entity_kill_j=
obs_cb=20
> is called, it will try to grab the xa_array lock which is not possible be=
cause=20
> CPU0 holds it already.

You mean an *interrupt* signals the fence? Shouldn't interrupt issues
be solved with spin_lock_irqdisable() =E2=80=93 but we can't have that beca=
use
it's the xarray doing that internally?

You don't have to explain that in this mail-thread, a v2 detailing that
would be suficient.

>=20
>=20
> >=20
> > The issue seems to be that you cannot perform certain tasks from within
> > that work item?

[=E2=80=A6]

> >=20
> > > +static void drm_sched_entity_kill_jobs_cb(struct dma_fence *f,
> > > +					=C2=A0 struct dma_fence_cb *cb);
> > > +
> > > =C2=A0=C2=A0static void drm_sched_entity_kill_jobs_work(struct work_s=
truct *wrk)
> > > =C2=A0=C2=A0{
> > > =C2=A0=C2=A0	struct drm_sched_job *job =3D container_of(wrk, typeof(*=
job), work);
> > > -
> > > -	drm_sched_fence_scheduled(job->s_fence, NULL);
> > > -	drm_sched_fence_finished(job->s_fence, -ESRCH);
> > > -	WARN_ON(job->s_fence->parent);
> > > -	job->sched->ops->free_job(job);
> >=20
> > Can free_job() really not be called from within work item context?
>=20
> It's still called from drm_sched_entity_kill_jobs_work but the diff is sl=
ightly=20
> confusing.

OK, probably my bad. But just asking, do you use
git format-patch --histogram
?

histogram often produces better diffs than default.


P.

