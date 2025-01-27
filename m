Return-Path: <linux-media+bounces-25311-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B75D2A1D5ED
	for <lists+linux-media@lfdr.de>; Mon, 27 Jan 2025 13:32:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C3FA91886E5B
	for <lists+linux-media@lfdr.de>; Mon, 27 Jan 2025 12:33:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2192A1FF1BD;
	Mon, 27 Jan 2025 12:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VYBGc1tO"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD21E1EA91
	for <linux-media@vger.kernel.org>; Mon, 27 Jan 2025 12:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737981168; cv=none; b=g9VRg9o6lUSn0CAL+jR/IWshDHakbR9w278lbLfFjxDsgMtR1iS8YFh+gkBihlBLRfQ7KBtgQOM6YTWj3vjTA5BQzK8/fPuDICoYwDj5hp3DQGSLIb9liaKi/3n9vO+4D4lVL4nrb5Ly8JIpLRLtIkYj13WTSDZDVKmPwVkUJ6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737981168; c=relaxed/simple;
	bh=QvnfIPSVxIDg/zZ7z50tYItpc8ToDmCFqOKuQD6F12s=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=eQxPJcBa73LHM6zCLz8jkhdt4G6VwVCTnNEUS9/jSTSmgZO4Xd5aUFqYDw1PnuBISKSxZUAVv6F1/BmMKgu05Dn/yGaEeuDgmdbpMtHfViqZXOWV8Fsj+tdCIGFfjPmsC+ausNp5GBUXDwXdznayQTxrg7jLcFOFgQqr0Q0d+9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VYBGc1tO; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737981165;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8cJsN7JtVmizhZG8Wf1Rn8rpd7OZNPCP78564dc89H8=;
	b=VYBGc1tOJJQiEFMV62iK9CDZsd81jvisMG2IpL5UQOfpxzpD45cVi39O+IgB63ra07R16O
	OHWZPLLM4RJ/z1MfzzeTDo73osE8F43HonNaeDzrYIPqiZT2IPhnU7hwcFAmqvXQqTLtDi
	ON2wNh1jZ/BZo3A1qfE3Jn9mU1LBas8=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-117-JH6AcPqeN1CAQJOybX_ihg-1; Mon, 27 Jan 2025 07:32:43 -0500
X-MC-Unique: JH6AcPqeN1CAQJOybX_ihg-1
X-Mimecast-MFC-AGG-ID: JH6AcPqeN1CAQJOybX_ihg
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3862c67763dso1538680f8f.3
        for <linux-media@vger.kernel.org>; Mon, 27 Jan 2025 04:32:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737981162; x=1738585962;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8cJsN7JtVmizhZG8Wf1Rn8rpd7OZNPCP78564dc89H8=;
        b=Wi6pZE0kXGcd7Ksy3aeCmBar/kVqmjBZYJKK83Ke/CybGajzl77W57piE6I8l05kee
         teAl4hg9fAjPRSfz6kS1205kI/W/wsOOljqhkRHMCAMWHG8GFlNPRm7fWrIhRagYM7vt
         CjzMXGfxwtr0Rr5IY1UtgHxWsVIeNXvCtpvGlLoPKIuODu0iAm2jwCyWkFJgA+lUxsUj
         tycZZvmaIRdXjVi859G2nQuQmQogZCIKYryb91CRfTdeiy6UzmiTD35hIywzYpv4b1tw
         x755NCf6vNwG0F5kWvQfr2MeLAb7YARP0HWkBoabG0RSk2r4yOhdJFkNYa9K4MfLeXPO
         qjYQ==
X-Forwarded-Encrypted: i=1; AJvYcCXqYs7Y5LHCtg/2aYP1nRWCtzqLUw+CjIBovMz+opnHe+8B+GxNJsmx/Fn+mqgFzObu+uwmGqOXnOnZyg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxR1WsbLF6KM7uIu0Qil4bh4IyoqguLXlqux4FwluHWq1cO2GeR
	Ec+sr+OZog3VaH1SaNPpls/sexCB4ubGHKgazhPioBWZgE0KXi3vK5bBwWkLxpariKT4ubZ/1DU
	96qWaRZZaig6qyEibgz5HMqGVOkLf4p6BHnDeBM0/F4OCD7C2mpj5y7JpAvMA
X-Gm-Gg: ASbGncvpJjDw/jYKhHMh/F+D3SqptBWrB02E6vvi+VtOuzuoQ2ilAbs+sKy2IbuuJiF
	2BlNxK/KW88vE2BNvVSOtQ8QpGD9CGMKVug32XgGlfcWM5TAiCA8EGU5J/DwfGA3n7bdQYZATst
	kRw9w733VBfn+R+xj0Djwgbo5QBdUgGeNF1AUyz9eJ+6jskGhjgc1TiOoOTYlSLoKUXFApJLItK
	SY+sMw7SXxwKdXXObfKgIDnx5FAo01FfNyY30sNLmBhGWXqCcD85hw+/ge4+KeYOa1Uh6vyVwaN
	AXLVX1Kg+BrK4rcl9oAnVxXjUe7XY98=
X-Received: by 2002:a5d:52c2:0:b0:386:3b93:6cc6 with SMTP id ffacd0b85a97d-38bf566351emr33533114f8f.15.1737981162371;
        Mon, 27 Jan 2025 04:32:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFBaPCwUSnk53tQlc6WfPOk3ncvy1ywdcAouZXKSWdZNT8hyH+OzZG7uNY+oBoHpv0nkx0sOw==
X-Received: by 2002:a5d:52c2:0:b0:386:3b93:6cc6 with SMTP id ffacd0b85a97d-38bf566351emr33533074f8f.15.1737981161884;
        Mon, 27 Jan 2025 04:32:41 -0800 (PST)
Received: from [10.200.68.91] (nat-pool-muc-u.redhat.com. [149.14.88.27])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a1c42fcsm11143132f8f.96.2025.01.27.04.32.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 04:32:41 -0800 (PST)
Message-ID: <1da78171e9bb5c533bfc5ddb232d81a6a531de10.camel@redhat.com>
Subject: Re: [PATCH v2 3/3] drm/sched: Update timedout_job()'s documentation
From: Philipp Stanner <pstanner@redhat.com>
To: Danilo Krummrich <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>
Cc: Matthew Brost <matthew.brost@intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Date: Mon, 27 Jan 2025 13:32:40 +0100
In-Reply-To: <Z5OHKHZRBed_bxF6@pollux>
References: <20250121151544.44949-2-phasta@kernel.org>
	 <20250121151544.44949-6-phasta@kernel.org> <Z5OHKHZRBed_bxF6@pollux>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2025-01-24 at 13:27 +0100, Danilo Krummrich wrote:
> On Tue, Jan 21, 2025 at 04:15:46PM +0100, Philipp Stanner wrote:
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
> > =C2=A0include/drm/gpu_scheduler.h | 82 ++++++++++++++++++++++----------=
-
> > ----
> > =C2=A01 file changed, 49 insertions(+), 33 deletions(-)
> >=20
> > diff --git a/include/drm/gpu_scheduler.h
> > b/include/drm/gpu_scheduler.h
> > index cf40fdb55541..4806740b9023 100644
> > --- a/include/drm/gpu_scheduler.h
> > +++ b/include/drm/gpu_scheduler.h
> > @@ -394,8 +394,14 @@ static inline bool
> > drm_sched_invalidate_job(struct drm_sched_job *s_job,
> > =C2=A0}
> > =C2=A0
> > =C2=A0enum drm_gpu_sched_stat {
> > -	DRM_GPU_SCHED_STAT_NONE, /* Reserve 0 */
> > +	/* Reserve 0 */
> > +	DRM_GPU_SCHED_STAT_NONE,
> > +
> > +	/* Operation succeeded */
> > =C2=A0	DRM_GPU_SCHED_STAT_NOMINAL,
> > +
> > +	/* Failure because dev is no longer available, for example
> > because
> > +	 * it was unplugged. */
> > =C2=A0	DRM_GPU_SCHED_STAT_ENODEV,
> > =C2=A0};
> > =C2=A0
> > @@ -447,43 +453,53 @@ struct drm_sched_backend_ops {
> > =C2=A0	 * @timedout_job: Called when a job has taken too long to
> > execute,
> > =C2=A0	 * to trigger GPU recovery.
> > =C2=A0	 *
> > -	 * This method is called in a workqueue context.
>=20
> Why remove this line?

I felt its surplus. All the functions here are callbacks that are
invoked by "the scheduler". I thought that's all the driver really
needs to know. Why should it care about the wq context?

Also, it's the only function for which the context is mentioned. If we
keep it here, we should probably provide it everywhere else, too.

>=20
> > +	 * @sched_job: The job that has timed out
> > =C2=A0	 *
> > -	 * Drivers typically issue a reset to recover from GPU
> > hangs, and this
> > -	 * procedure usually follows the following workflow:
> > +	 * Returns: A drm_gpu_sched_stat enum.
>=20
> Maybe "The status of the scheduler, defined by &drm_gpu_sched_stat".
>=20
> I think you forgot to add the corresponding parts in the
> documentation of
> drm_gpu_sched_stat.

What do you mean, precisely? I added information to that enum. You mean
that I should add that that enum is a return type for this callback
here?

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
> > -	 * 5. Restart the scheduler using drm_sched_start(). At
> > that point, new
> > -	 *=C2=A0=C2=A0=C2=A0 jobs can be queued, and the scheduler thread is
> > unblocked
> > +	 * Drivers typically issue a reset to recover from GPU
> > hangs.
> > +	 * This procedure looks very different depending on
> > whether a firmware
> > +	 * or a hardware scheduler is being used.
> > +	 *
> > +	 * For a FIRMWARE SCHEDULER, each (pseudo-)ring has one
> > scheduler, and
>=20
> Why pseudo? It's still a real ring buffer.
>=20
> > +	 * each scheduler has one entity. Hence, you typically
> > follow those
> > +	 * steps:
>=20
> Maybe better "Hence, the steps taken typically look as follows:".
>=20
> > +	 *
> > +	 * 1. Stop the scheduler using drm_sched_stop(). This will
> > pause the
> > +	 *=C2=A0=C2=A0=C2=A0 scheduler workqueues and cancel the timeout work=
,
> > guaranteeing
> > +	 *=C2=A0=C2=A0=C2=A0 that nothing is queued while we remove the ring.
>=20
> "while the ring is removed"
>=20
> > +	 * 2. Remove the ring. In most (all?) cases the firmware
> > will make sure
>=20
> At least I don't know about other cases and I also don't think it'd
> make a lot
> of sense if it'd be different. But of course there's no rule
> preventing people
> to implement things weirdly.

Seems like we can then use an absolute phrase here and who really wants
to do weird things won't be stopped by that anyways :]

>=20
> > +	 *=C2=A0=C2=A0=C2=A0 that the corresponding parts of the hardware are
> > resetted, and that
> > +	 *=C2=A0=C2=A0=C2=A0 other rings are not impacted.
> > +	 * 3. Kill the entity the faulted job stems from, and the
> > associated
>=20
> There can only be one entity in this case, so you can drop "the
> faulted job
> stems from".
>=20
> > +	 *=C2=A0=C2=A0=C2=A0 scheduler.
> > +	 *
> > +	 *
> > +	 * For a HARDWARE SCHEDULER, each ring also has one
> > scheduler, but each
> > +	 * scheduler is typically associated with many entities.
> > This implies
>=20
> What about "each scheduler can be scheduling one or more entities"?
>=20
> > +	 * that all entities associated with the affected
> > scheduler cannot be
>=20
> I think you want to say that not all entites can be torn down, rather
> than none
> of them can be torn down.
>=20
> > +	 * torn down, because this would effectively also kill
> > innocent
> > +	 * userspace processes which did not submit faulty jobs
> > (for example).
>=20
> This is phrased ambiguously, "kill userspace processs" typically
> means something
> different than you mean in this context.

then let's say "down, because this would also affect users that did not
provide faulty jobs through their entities.", ack?


Danke,
P.

>=20
> > +	 *
> > +	 * Consequently, the procedure to recover with a hardware
> > scheduler
> > +	 * should look like this:
> > +	 *
> > +	 * 1. Stop all schedulers impacted by the reset using
> > drm_sched_stop().
> > +	 * 2. Figure out to which entity the faulted job belongs
> > to.
> > +	 * 3. Kill that entity.
>=20
> I'd combine the two steps: "2. Kill the entity the faulty job
> originates from".
>=20
> > +	 * 4. Issue a GPU reset on all faulty rings (driver-
> > specific).
> > +	 * 5. Re-submit jobs on all schedulers impacted by re-
> > submitting them to
> > +	 *=C2=A0=C2=A0=C2=A0 the entities which are still alive.
> > +	 * 6. Restart all schedulers that were stopped in step #1
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


