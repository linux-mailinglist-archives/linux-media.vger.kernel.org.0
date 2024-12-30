Return-Path: <linux-media+bounces-24159-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DF27D9FE555
	for <lists+linux-media@lfdr.de>; Mon, 30 Dec 2024 11:32:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A2D7118826D5
	for <lists+linux-media@lfdr.de>; Mon, 30 Dec 2024 10:32:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6860B1A706F;
	Mon, 30 Dec 2024 10:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CvMIde7n"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0538313B284
	for <linux-media@vger.kernel.org>; Mon, 30 Dec 2024 10:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735554743; cv=none; b=bZnOUfLt1e53rPNcHNUPGwMAUZDUW53q7r7OU2VGiPmKhPfGmPeoIA25jJ+7GpAYXl1pTPZW55TbmwsZSAS8JvYkiH/VREZnA4Jp37WhHSb63dyimASIKKCdJbk1yKWD/xiip9rcysVlntSNN4VW0+NU/VW8afDaO9bZ9y6zTb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735554743; c=relaxed/simple;
	bh=i6+kNO4IXe3yw47B/05F+gSTTtb4snO7Jwz715I/1is=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=G6H0rb7hiJ1Bdl7SiCqKYfI6TrSONV4qMszeSgXxlQgeSmy1HwLQgFfHAtV+cjaEQ12Kq2l7uFhj2RukqotZQtros97SZPg3El0qHj8h2BaYTyC7qh5SU94OVA9eS+b2aqquUXoyNb2l36Re5Is6RZgyq+mzj8GTOG6K0ojlEw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CvMIde7n; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1735554740;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1Ejlp46RZvGD/F7TXnupAMS6ui8zDFj94kIEqbP/YBY=;
	b=CvMIde7nn3/hu/PwtswfENZ8RNqN9NCV/tw0taesG3P4UnC+6voz8gAXEuaahzKyBP93sw
	lKb9Peat7b405tbBQo11kV7wB7He3Ju+4CGrSuMzj1plqddr5PB3yv5U2TGmQnnKXI4dWM
	DuBQUki3R/mcKq9/7F4EoD9HIyqLTq4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-108-nY255R3ONDq1bJRtiU7Ozg-1; Mon, 30 Dec 2024 05:32:19 -0500
X-MC-Unique: nY255R3ONDq1bJRtiU7Ozg-1
X-Mimecast-MFC-AGG-ID: nY255R3ONDq1bJRtiU7Ozg
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4361eb83f46so67038095e9.3
        for <linux-media@vger.kernel.org>; Mon, 30 Dec 2024 02:32:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735554738; x=1736159538;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1Ejlp46RZvGD/F7TXnupAMS6ui8zDFj94kIEqbP/YBY=;
        b=VUfkFCKw5G9/kSvNy9Eu1X9AJxEbqiF6Nz6BxYcZsbsdRyRPjBNXZqDyYqdGrDjwN4
         tVytWXRFBBIEDK8F6QSQu4hngW5sGPziiG4WgAb9FO8xE6+vuJdoaH4Z1Z+7KMJFGVFB
         OdMxdCZPMWvU5C6WbSOCSsuk4ujnixO0MrVZEPMcbuVcwNYblcq25uzMHvSH4PjLdEu/
         1FWX6hrco1aeXpoT97GNsAYqOwDl23vNnuwm9fYZideA4nU6Ct1FU5Vnc3aEpXiTlty9
         peik8CGOhl4/BM547dodAL/Zqa0aaELY85ld6TmJH8tJNfVD3990y7038hpaEu5rSCCX
         yo5g==
X-Forwarded-Encrypted: i=1; AJvYcCUnbfabLZhWv/9c0+dyAh53ZATfCesitpOdpJO/m2fLCFwbJDrx8F839jGQIzEnfefldTWhyyAsQrFrQg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4uZyy1kLwjJBlt6oJ0PgLz9YBnOvz5Uo0P3RlFXie3C9Jdpvu
	VMBTX0drkMBA8xkLYNNpJztPdaHEcmaBI1tx/BN0zzOjwvVX6B/4+fFPBUaZiwOQew02CfuQznT
	Fz3tipTddvbh+IEkOvYi6Kv7Pc2voWfGJmPNhA1jRVi/xY2k+sN0RJ4IQqwqz
X-Gm-Gg: ASbGncv/PKTgdNxd+vRzrGIYDgVxufjiaQfQKB+I2baW+w7fLpPQo1IBNOQZW6YJyfW
	zLM12O+lPDGkLUeLCLhjUyrrWuhll26phaOfzdoVNWcNEwHZZqpIEQ8z3NTGgQTS1OB+RdDIJAS
	036Gi2/D/1nq5MRwilkPu4ltcWpjS6CDGmxV8AhwN3wwH39N724vCnfy8/LWsLf+JmYmtVDyjAW
	GItkFoghmGmWz4j4uNZNSIlDkGVO/6ptL7W5fQZ5xCiFEkxxWA0TgWDwzIheew4KLAstzSMX7u6
	2rnoCBQmkDfh2uQCBItE5+SOI+Q19oA=
X-Received: by 2002:a05:600c:1c12:b0:431:58cd:b259 with SMTP id 5b1f17b1804b1-4366d356dfcmr312941725e9.31.1735554737908;
        Mon, 30 Dec 2024 02:32:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHlRFlbNoY+KcqeO9+HeoBICEtrqoVNx6gMJZlhy1FeLcBM24INP3mDxq5/8fnYTHSYTUs38w==
X-Received: by 2002:a05:600c:1c12:b0:431:58cd:b259 with SMTP id 5b1f17b1804b1-4366d356dfcmr312941545e9.31.1735554737541;
        Mon, 30 Dec 2024 02:32:17 -0800 (PST)
Received: from ?IPv6:2001:16b8:3d0e:1700:7f81:92a8:f6f3:8c59? ([2001:16b8:3d0e:1700:7f81:92a8:f6f3:8c59])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436611fc161sm350155805e9.10.2024.12.30.02.32.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Dec 2024 02:32:17 -0800 (PST)
Message-ID: <ab3aad6bd82b99add72a6b015464d925bec638dc.camel@redhat.com>
Subject: Re: [PATCH] drm/sched: Document run_job() refcount hazard
From: Philipp Stanner <pstanner@redhat.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Philipp
 Stanner <phasta@kernel.org>, Luben Tuikov <ltuikov89@gmail.com>, Matthew
 Brost <matthew.brost@intel.com>, Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Sumit Semwal
 <sumit.semwal@linaro.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, Tvrtko Ursulin
	 <tursulin@ursulin.net>, Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Date: Mon, 30 Dec 2024 11:32:16 +0100
In-Reply-To: <5fb25705d202d40707730aacb6833d1939483cf4.camel@redhat.com>
References: <20241220124515.93169-2-phasta@kernel.org>
	 <5c4c610e-26ec-447c-b4db-ad38e994720b@amd.com>
	 <5fb25705d202d40707730aacb6833d1939483cf4.camel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2024-12-30 at 11:25 +0100, Philipp Stanner wrote:
> On Fri, 2024-12-20 at 13:53 +0100, Christian K=C3=B6nig wrote:
> > Am 20.12.24 um 13:45 schrieb Philipp Stanner:
> > > From: Philipp Stanner <pstanner@redhat.com>
> > >=20
> > > drm_sched_backend_ops.run_job() returns a dma_fence for the
> > > scheduler.
> > > That fence is signalled by the driver once the hardware completed
> > > the
> > > associated job. The scheduler does not increment the reference
> > > count on
> > > that fence, but implicitly expects to inherit this fence from
> > > run_job().
> > >=20
> > > This is relatively subtle and prone to misunderstandings.
> > >=20
> > > This implies that, to keep a reference for itself, a driver needs
> > > to
> > > call dma_fence_get() in addition to dma_fence_init() in that
> > > callback.
> > >=20
> > > It's further complicated by the fact that the scheduler even
> > > decrements
> > > the refcount in drm_sched_run_job_work() since it created a new
> > > reference in drm_sched_fence_scheduled(). It does, however, still
> > > use
> > > its pointer to the fence after calling dma_fence_put() - which is
> > > safe
> > > because of the aforementioned new reference, but actually still
> > > violates
> > > the refcounting rules.
> > >=20
> > > Improve the explanatory comment for that decrement.
> > >=20
> > > Move the call to dma_fence_put() to the position behind the last
> > > usage
> > > of the fence.
> > >=20
> > > Document the necessity to increment the reference count in
> > > drm_sched_backend_ops.run_job().
> > >=20
> > > Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> > > Cc: Tvrtko Ursulin <tursulin@ursulin.net>
> > > Cc: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> > > Signed-off-by: Philipp Stanner <pstanner@redhat.com>
> > > ---
> > > =C2=A0 drivers/gpu/drm/scheduler/sched_main.c | 10 +++++++---
> > > =C2=A0 include/drm/gpu_scheduler.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 20 ++++++++++++++++---
> > > -
> > > =C2=A0 2 files changed, 23 insertions(+), 7 deletions(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/scheduler/sched_main.c
> > > b/drivers/gpu/drm/scheduler/sched_main.c
> > > index 7ce25281c74c..d6f8df39d848 100644
> > > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > > @@ -1218,15 +1218,19 @@ static void drm_sched_run_job_work(struct
> > > work_struct *w)
> > > =C2=A0=C2=A0	drm_sched_fence_scheduled(s_fence, fence);
> > > =C2=A0=20
> > > =C2=A0=C2=A0	if (!IS_ERR_OR_NULL(fence)) {
> > > -		/* Drop for original kref_init of the fence */
> > > -		dma_fence_put(fence);
> > > -
> > > =C2=A0=C2=A0		r =3D dma_fence_add_callback(fence, &sched_job-
> > > >cb,
> > > =C2=A0=C2=A0					=C2=A0=C2=A0
> > > drm_sched_job_done_cb);
> > > =C2=A0=C2=A0		if (r =3D=3D -ENOENT)
> > > =C2=A0=C2=A0			drm_sched_job_done(sched_job, fence-
> > > > error);
> > > =C2=A0=C2=A0		else if (r)
> > > =C2=A0=C2=A0			DRM_DEV_ERROR(sched->dev, "fence add
> > > callback failed (%d)\n", r);
> > > +
> > > +		/*
> > > +		 * s_fence took a new reference to fence in the
> > > call to
> > > +		 * drm_sched_fence_scheduled() above. The
> > > reference passed by
> > > +		 * run_job() above is now not needed any longer.
> > > Drop it.
> > > +		 */
> > > +		dma_fence_put(fence);
> > > =C2=A0=C2=A0	} else {
> > > =C2=A0=C2=A0		drm_sched_job_done(sched_job, IS_ERR(fence) ?
> > > =C2=A0=C2=A0				=C2=A0=C2=A0 PTR_ERR(fence) : 0);
> > > diff --git a/include/drm/gpu_scheduler.h
> > > b/include/drm/gpu_scheduler.h
> > > index 95e17504e46a..a1f5c9a14278 100644
> > > --- a/include/drm/gpu_scheduler.h
> > > +++ b/include/drm/gpu_scheduler.h
> > > @@ -420,10 +420,22 @@ struct drm_sched_backend_ops {
> > > =C2=A0=C2=A0					 struct drm_sched_entity
> > > *s_entity);
> > > =C2=A0=20
> > > =C2=A0=C2=A0	/**
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * @run_job: Called =
to execute the job once all of the
> > > dependencies
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * have been resolve=
d.=C2=A0 This may be called multiple
> > > times,
> > > if
> > > -	 * timedout_job() has happened and
> > > drm_sched_job_recovery()
> > > -	 * decides to try it again.
> > > +	 * @run_job: Called to execute the job once all of the
> > > dependencies
> > > +	 * have been resolved. This may be called multiple
> > > times,
> > > if
> > > +	 * timedout_job() has happened and
> > > drm_sched_job_recovery() decides to
> > > +	 * try it again.
> >=20
> > Maybe we should improve that here as well while at it.
> >=20
> > That drm_sched_job_recovery() can call this multiple times actually
> > goes=20
> > against the dma_fence rules since drivers can't easily allocate a
> > new
> > HW=20
> > fence.
> >=20
> > Something like "The deprecated drm_sched_job_recovery() function
> > might=20
> > call this again, but it is strongly advised to not be used because
> > it
> > violates dma_fence memory allocations rules."
>=20
> I just realized that drm_sched_job_recovery() is indeed deprecated so
> hard that it simply doesn't exist anymore. There is no such function.
>=20
> It seems to me that we (and that old docstring) are actually talking
> about drm_sched_resubmit_jobs(), which is also deprecated, and which
> does invoke backend_ops.run_job()?


Yo, wait a second
=E2=80=93 so drm_sched_resubmit_jobs() has been deprecated. Yet we still
happily encourage people to use it in the documentation of
timedout_job().

That's uncool. Especially since we don't tell users what they should be
using instead in timedout_job().

Suggestions?

P.

>=20
>=20
> P.
>=20
>=20
> >=20
> > On the other hand can of course be a separate patch.
> >=20
> > > +	 *
> > > +	 * @sched_job: the job to run
> > > +	 *
> > > +	 * Returns: dma_fence the driver must signal once the
> > > hardware has
> > > +	 *	completed the job ("hardware fence").
> > > +	 *
> > > +	 * Note that the scheduler expects to 'inherit' its own
> > > reference to
> > > +	 * this fence from the callback. It does not invoke an
> > > extra
> > > +	 * dma_fence_get() on it. Consequently, this callback
> > > must
> > > return a
> > > +	 * fence whose refcount is at least 2: One for the
> > > scheduler's
> > > +	 * reference returned here, another one for the
> > > reference
> > > kept by the
> > > +	 * driver.
> >=20
> > Well the driver actually doesn't need any extra reference. The
> > scheduler=20
> > just needs to guarantee that this reference isn't dropped before it
> > is=20
> > signaled.
> >=20
> > Regards,
> > Christian.
> >=20
> > > =C2=A0=C2=A0	 */
> > > =C2=A0=C2=A0	struct dma_fence *(*run_job)(struct drm_sched_job
> > > *sched_job);
> > > =C2=A0=20
> >=20
>=20


