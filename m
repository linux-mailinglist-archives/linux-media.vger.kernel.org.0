Return-Path: <linux-media+bounces-24936-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D428DA16A63
	for <lists+linux-media@lfdr.de>; Mon, 20 Jan 2025 11:08:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E14E53A103B
	for <lists+linux-media@lfdr.de>; Mon, 20 Jan 2025 10:08:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B2C61B3949;
	Mon, 20 Jan 2025 10:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iEi5v2y4"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25007195381
	for <linux-media@vger.kernel.org>; Mon, 20 Jan 2025 10:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737367683; cv=none; b=EflaNmdbj6RvRSMrA1nuz84UgizHRIEW2mQmwAjWZwCU9CW1JxJ48pHkctk3xdbRDSoSBxJxDvwxIl45/RpapfzsUbUm68uwi/fW1E8EHk8wHutEwL3DaYuNBrImMzmLxCvEgXw9lVuIqTqEz+wC8+bgo5Rxv7i+In4XUwwlNPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737367683; c=relaxed/simple;
	bh=jZiObaCojGryZ39ZjXN9i7RhCVVT7LxuKYk4iQMzVbU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PAwrnhRFdoLbFH2RwOo2glGXNkMkXRGFvCA5Rek2OIQyQJAISu4d7/mQ3JZjleDzcmVhi44xxcneHP7a+uGlfwDJynVhAXrmNA7YSO2cPs34itqBvIwKuNSv+3Xm10emFUBpwJshVVdyQCG5uy5vzJXG/iHMMKOKeKT7DtvwHYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iEi5v2y4; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737367681;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cam6lj9SKiCASZpKH8QSwyvgICKQyMWdN1CBKpORAmM=;
	b=iEi5v2y4PGefckO9HWptApRl764kYQmkmRqiIVuFhIJJgNCQf9FP7KsJVbGBfudfXUFA9c
	SenCn19iHs4UHDIduKSWNWKcqsLXegggFtjNCYi5OENdTqAjS9E8U87o6WdS1FYv9Syk/D
	JPrxMSd1twYEzkjrAfbPpEaWLt/ii5c=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-227-M9iqX_f0OROo8L227vxoeA-1; Mon, 20 Jan 2025 05:07:59 -0500
X-MC-Unique: M9iqX_f0OROo8L227vxoeA-1
X-Mimecast-MFC-AGG-ID: M9iqX_f0OROo8L227vxoeA
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2ef9204f898so7865176a91.2
        for <linux-media@vger.kernel.org>; Mon, 20 Jan 2025 02:07:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737367678; x=1737972478;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cam6lj9SKiCASZpKH8QSwyvgICKQyMWdN1CBKpORAmM=;
        b=Ns+eJzhGXcCb7cbLBIr+eB3noe21cuwpUGhJOJGPNi1cONIBapsMyxVmSDnRzWHJZ2
         0r9bvSryZFBrYy5zwlOQFUhsPRlEfuNzeyw4B0ymESZeLOYxTqDjk0Ti70jV9ntlNLLu
         4Ic9j5yhqG2FTG/b8pYWOScCRQzG83M+ANE7hEMiHDJyKY1XXPPZf1OGCIdSyjwB8Njv
         TI3+NhfJNnVPgKpIESfUZELjyHVPkUE/aveoPsUqAPGc0fuzzE42OvR/yQj8+1jJ51ne
         1c27+dl+6ArjM3TimWYME3xt0o0IGyZXTt9MYkNCVtjjt/RzuC+Md7zuvrwe2wPesbnB
         kuCw==
X-Forwarded-Encrypted: i=1; AJvYcCVayS24i6vFlZNbj+BIFWqG0qOEp4vmcqXbSgRoEriCQpxNjzQ5RFtpWzunTBVqkSlldU1eskdhlsRpUQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwAMfcB33iAws5sFt7aZ5j379OsRm79y7Yj/5Py2VgRzKXoFXou
	FH6o8X3SI01oTRR3obyIZ/UeMmcAxptaUa5YGb2+sffsXrgBHYZSa2p/yohYmjTVHZG1cFnwCtt
	8nkCo6wpxVdsJUuzKO+atX+365LVRvlqZHBThODiWFgtHnc8NbTe4/Jg2oy7w
X-Gm-Gg: ASbGnctfLi39//s7MEpM55/g9uC7pATTmp6vtiMlUa5GUxbnoCUxGLWYvvMSx5WY4BZ
	e3b4DZwQiXmKSiT3HvEJuaanD0PdNp5Qwp+IY3k9ut26MS2UQKwOAM2oEAQytUJwcQqWEnL1t3j
	EjMdnl+//4qjcxWrIC4pZgRhG51nwHbOXLct6/pl0hpcLPqqlG3xDKR1Rj3q52d79ktF+W1Q/Mf
	m+7w8iuvunBhvAJPFctttLoYUIiJOfIMt+56Lc81uyo3Arv1C3hBdMnIvtwGy2LQ8woWrY4jkco
	bjC/E2ZbuPmZkDJkupMh
X-Received: by 2002:a05:6a00:4c94:b0:724:e75b:22d1 with SMTP id d2e1a72fcca58-72dafa800c4mr18218135b3a.16.1737367678203;
        Mon, 20 Jan 2025 02:07:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGZoY/ziXee5by0xKUslLvYKlSWN/aLZztp5SxsNLxuQbdsugpbvji3u6wCsWMR+wUnsGZ5fg==
X-Received: by 2002:a05:6a00:4c94:b0:724:e75b:22d1 with SMTP id d2e1a72fcca58-72dafa800c4mr18218091b3a.16.1737367677786;
        Mon, 20 Jan 2025 02:07:57 -0800 (PST)
Received: from [10.200.68.91] (nat-pool-muc-u.redhat.com. [149.14.88.27])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72dab815f1bsm6880482b3a.65.2025.01.20.02.07.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 02:07:57 -0800 (PST)
Message-ID: <13d6fc760e3e4a297086bdfd56438f0079937fa5.camel@redhat.com>
Subject: Re: [PATCH 3/3] drm/sched: Update timedout_job()'s documentation
From: Philipp Stanner <pstanner@redhat.com>
To: Danilo Krummrich <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>
Cc: Luben Tuikov <ltuikov89@gmail.com>, Matthew Brost
 <matthew.brost@intel.com>,  Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org,  linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org,  linaro-mm-sig@lists.linaro.org
Date: Mon, 20 Jan 2025 11:07:44 +0100
In-Reply-To: <Z4T9Eq9lMPlmLUYk@pollux.localdomain>
References: <20250109133710.39404-2-phasta@kernel.org>
	 <20250109133710.39404-6-phasta@kernel.org>
	 <Z4T9Eq9lMPlmLUYk@pollux.localdomain>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2025-01-13 at 12:46 +0100, Danilo Krummrich wrote:
> On Thu, Jan 09, 2025 at 02:37:12PM +0100, Philipp Stanner wrote:
> > drm_sched_backend_ops.timedout_job()'s documentation is outdated.
> > It
> > mentions the deprecated function drm_sched_resubmit_job().
> > Furthermore,
> > it does not point out the important distinction between hardware
> > and
> > firmware schedulers.
> >=20
> > Since firmware schedulers tyipically only use one entity per
> > scheduler,
> > timeout handling is significantly more simple because the entity
> > the
> > faulted job came from can just be killed without affecting innocent
> > processes.
> >=20
> > Update the documentation with that distinction and other details.
> >=20
> > Reformat the docstring to work to a unified style with the other
> > handles.
> >=20
> > Signed-off-by: Philipp Stanner <phasta@kernel.org>
> > ---
> > =C2=A0include/drm/gpu_scheduler.h | 83 +++++++++++++++++++++++---------=
-
> > ----
> > =C2=A01 file changed, 52 insertions(+), 31 deletions(-)
> >=20
> > diff --git a/include/drm/gpu_scheduler.h
> > b/include/drm/gpu_scheduler.h
> > index c4e65f9f7f22..380b8840c591 100644
> > --- a/include/drm/gpu_scheduler.h
> > +++ b/include/drm/gpu_scheduler.h
> > @@ -445,43 +445,64 @@ struct drm_sched_backend_ops {
> > =C2=A0	 * @timedout_job: Called when a job has taken too long to
> > execute,
> > =C2=A0	 * to trigger GPU recovery.
> > =C2=A0	 *
> > -	 * This method is called in a workqueue context.
> > +	 * @sched_job: The job that has timed out
> > =C2=A0	 *
> > -	 * Drivers typically issue a reset to recover from GPU
> > hangs, and this
> > -	 * procedure usually follows the following workflow:
> > +	 * Returns:
> > +	 * - DRM_GPU_SCHED_STAT_NOMINAL, on success, i.e., if the
> > underlying
> > +	 *=C2=A0=C2=A0 driver has started or completed recovery.
> > +	 * - DRM_GPU_SCHED_STAT_ENODEV, if the device is no longer
> > +	 *=C2=A0=C2=A0 available, i.e., has been unplugged.
>=20
> Maybe it'd be better to document this at the enum level and add a
> link.
>=20
> > =C2=A0	 *
> > -	 * 1. Stop the scheduler using drm_sched_stop(). This will
> > park the
> > -	 *=C2=A0=C2=A0=C2=A0 scheduler thread and cancel the timeout work,
> > guaranteeing that
> > -	 *=C2=A0=C2=A0=C2=A0 nothing is queued while we reset the hardware qu=
eue
> > -	 * 2. Try to gracefully stop non-faulty jobs (optional)
> > -	 * 3. Issue a GPU reset (driver-specific)
> > -	 * 4. Re-submit jobs using drm_sched_resubmit_jobs()
> > +	 * Drivers typically issue a reset to recover from GPU
> > hangs.
> > +	 * This procedure looks very different depending on
> > whether a firmware
> > +	 * or a hardware scheduler is being used.
> > +	 *
> > +	 * For a FIRMWARE SCHEDULER, each (pseudo-)ring has one
> > scheduler, and
> > +	 * each scheduler (typically) has one entity. Hence, you
> > typically
>=20
> I think you can remove the first "typically" here. I don't think that
> for a
> firmware scheduler we ever have something else than a 1:1 relation,
> besides that
> having something else than a 1:1 relation (whatever that would be)
> would likely
> be a contradiction to the statement above.
>=20
> > +	 * follow those steps:
> > +	 *
> > +	 * 1. Stop the scheduler using drm_sched_stop(). This will
> > pause the
> > +	 *=C2=A0=C2=A0=C2=A0 scheduler workqueues and cancel the timeout work=
,
> > guaranteeing
> > +	 *=C2=A0=C2=A0=C2=A0 that nothing is queued while we reset the hardwa=
re
> > queue.
>=20
> Rather reset / remove the software queue / ring.
>=20
> (Besides: I think we should also define a distinct terminology,
> sometimes "queue"
> refers to the ring buffer, sometimes it refers to the entity, etc. At
> least we
> should be consequent within this commit, and then fix the rest.)


Very good idea!

How about we, from now on, always just call it "ring" or "hardware
ring"?

I think queue is very generic and, as you point out, often used for the
entities and stuff like that.

>=20
> > +	 * 2. Try to gracefully stop non-faulty jobs (optional).
> > +	 * TODO: RFC ^ Folks, should we remove this step? What
> > does it even mean
> > +	 * precisely to "stop" those jobs? Is that even helpful to
> > userspace in
> > +	 * any way?
>=20
> I think this means to prevent unrelated queues / jobs from being
> impacted by the
> subsequent GPU reset.
>=20
> So, this is likely not applicable here, see below.
>=20
> > +	 * 3. Issue a GPU reset (driver-specific).
>=20
> I'm not entirely sure it really applies to all GPUs that feature a FW
> scheduler,
> but I'd expect that the FW takes care of resetting the corresponding
> HW
> (including preventing impact on other FW rings) if the faulty FW ring
> is removed
> by the driver.

@Christian: Agree? AMD is still purely a HW scheduler afaik.

>=20
> > +	 * 4. Kill the entity the faulted job stems from, and the
> > associated
> > +	 *=C2=A0=C2=A0=C2=A0 scheduler.
> > =C2=A0	 * 5. Restart the scheduler using drm_sched_start(). At
> > that point, new
> > -	 *=C2=A0=C2=A0=C2=A0 jobs can be queued, and the scheduler thread is
> > unblocked
> > +	 *=C2=A0=C2=A0=C2=A0 jobs can be queued, and the scheduler workqueues
> > awake again.
>=20
> How can we start the scheduler again after we've killed it? I think
> the most
> likely scenario is that the FW ring (including the scheduler
> structures) is
> removed entirely and simply re-created. So, I think we can probably
> remove 5.

ACK

>=20
> > +	 *
> > +	 * For a HARDWARE SCHEDULER, each ring also has one
> > scheduler, but each
> > +	 * scheduler typically has many attached entities. This
> > implies that you
>=20
> Maybe better "associated". For the second sentence, I'd rephrase it,
> e.g. "This
> implies that all entities associated with the affected scheduler
> can't be torn
> down, because [...]".
>=20
> > +	 * cannot tear down all entities associated with the
> > affected scheduler,
> > +	 * because this would effectively also kill innocent
> > userspace processes
> > +	 * which did not submit faulty jobs (for example).
> > +	 *
> > +	 * Consequently, the procedure to recover with a hardware
> > scheduler
> > +	 * should look like this:
> > +	 *
> > +	 * 1. Stop all schedulers impacted by the reset using
> > drm_sched_stop().
> > +	 * 2. Figure out to which entity the faulted job belongs.
>=20
> "belongs to"
>=20
> > +	 * 3. Try to gracefully stop non-faulty jobs (optional).
> > +	 * TODO: RFC ^ Folks, should we remove this step? What
> > does it even mean
> > +	 * precisely to "stop" those jobs? Is that even helpful to
> > userspace in
> > +	 * any way?
>=20
> See above.

Agree with all. Will fix those in v2.

Danke,
P.

>=20
> > +	 * 4. Kill that entity.
> > +	 * 5. Issue a GPU reset on all faulty rings (driver-
> > specific).
> > +	 * 6. Re-submit jobs on all schedulers impacted by re-
> > submitting them to
> > +	 *=C2=A0=C2=A0=C2=A0 the entities which are still alive.
> > +	 * 7. Restart all schedulers that were stopped in step #1
> > using
> > +	 *=C2=A0=C2=A0=C2=A0 drm_sched_start().
> > =C2=A0	 *
> > =C2=A0	 * Note that some GPUs have distinct hardware queues but
> > need to reset
> > =C2=A0	 * the GPU globally, which requires extra synchronization
> > between the
> > -	 * timeout handler of the different &drm_gpu_scheduler.
> > One way to
> > -	 * achieve this synchronization is to create an ordered
> > workqueue
> > -	 * (using alloc_ordered_workqueue()) at the driver level,
> > and pass this
> > -	 * queue to drm_sched_init(), to guarantee that timeout
> > handlers are
> > -	 * executed sequentially. The above workflow needs to be
> > slightly
> > -	 * adjusted in that case:
> > -	 *
> > -	 * 1. Stop all schedulers impacted by the reset using
> > drm_sched_stop()
> > -	 * 2. Try to gracefully stop non-faulty jobs on all queues
> > impacted by
> > -	 *=C2=A0=C2=A0=C2=A0 the reset (optional)
> > -	 * 3. Issue a GPU reset on all faulty queues (driver-
> > specific)
> > -	 * 4. Re-submit jobs on all schedulers impacted by the
> > reset using
> > -	 *=C2=A0=C2=A0=C2=A0 drm_sched_resubmit_jobs()
> > -	 * 5. Restart all schedulers that were stopped in step #1
> > using
> > -	 *=C2=A0=C2=A0=C2=A0 drm_sched_start()
> > -	 *
> > -	 * Return DRM_GPU_SCHED_STAT_NOMINAL, when all is normal,
> > -	 * and the underlying driver has started or completed
> > recovery.
> > -	 *
> > -	 * Return DRM_GPU_SCHED_STAT_ENODEV, if the device is no
> > longer
> > -	 * available, i.e. has been unplugged.
> > +	 * timeout handlers of different schedulers. One way to
> > achieve this
> > +	 * synchronization is to create an ordered workqueue
> > (using
> > +	 * alloc_ordered_workqueue()) at the driver level, and
> > pass this queue
> > +	 * as drm_sched_init()'s @timeout_wq parameter. This will
> > guarantee
> > +	 * that timeout handlers are executed sequentially.
> > =C2=A0	 */
> > =C2=A0	enum drm_gpu_sched_stat (*timedout_job)(struct
> > drm_sched_job *sched_job);
> > =C2=A0
> > --=20
> > 2.47.1
> >=20
>=20


