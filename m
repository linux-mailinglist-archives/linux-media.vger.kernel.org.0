Return-Path: <linux-media+bounces-24531-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 34217A07817
	for <lists+linux-media@lfdr.de>; Thu,  9 Jan 2025 14:48:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BFA4C1883CEF
	for <lists+linux-media@lfdr.de>; Thu,  9 Jan 2025 13:48:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA5D4218AC9;
	Thu,  9 Jan 2025 13:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bb6cIj0v"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A06452185A9
	for <linux-media@vger.kernel.org>; Thu,  9 Jan 2025 13:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736430479; cv=none; b=nGovrVcdlHialOQsijHxatuFoKGMmZ+buY/FiTyUQmtjHsQJmU1rItYmZarj7Kg8GrpIvKUEo9of7SeTaOdXLUsPCD81rGxzavZP8wmgOnKdHYQUiHcw6xc7+lWRg/zFUHqmT1PNj+0vXAZA+grMWgedGdCdhegirOORml4od7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736430479; c=relaxed/simple;
	bh=WXMTHuln4/Zg+gWH7seXXtH3jzgpCQpBY7Ohv1slIcY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FOjxq707i/XT4Jiz/zCPuMCkAzheUSavPOX7U/3TPETckGCz77jER1mz8aeaDWBzVL252mLprN5s+m2nCEl8QSRT6EFntKirZfxLbmxK12SGjecGij16FaUUaXlsBrBOaFWJpIN3phwnGuQI7quxn37BCzmBhigzAXM9pMu44jY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bb6cIj0v; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736430476;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lpOOk3veSZPKRfwHoLIhf35QT/4GJJoffoiHyp6Ak+o=;
	b=bb6cIj0vn4cgQyoW2GSPT+DKsiReg77SjeKMr69wcg3rRQx3k6f0CGJITned9uIL3bNpmm
	xi1Q0/fUEtT7yUK3Rv4iTPpVrXLnJoCjRW9lUbyQ4p4fk84YdFKZWHI2eC/dePt++m6Jrg
	i/3Ffi7gtduZmTDLqHJ6kaGrmbpcgkQ=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-8-S5DSpkSTPx2MKo39nrA5fA-1; Thu, 09 Jan 2025 08:47:55 -0500
X-MC-Unique: S5DSpkSTPx2MKo39nrA5fA-1
X-Mimecast-MFC-AGG-ID: S5DSpkSTPx2MKo39nrA5fA
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6d89a389ee9so21727326d6.2
        for <linux-media@vger.kernel.org>; Thu, 09 Jan 2025 05:47:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736430475; x=1737035275;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lpOOk3veSZPKRfwHoLIhf35QT/4GJJoffoiHyp6Ak+o=;
        b=iAHDx+IpxjEvEekWy+hHPp09rQYwYZpN+0fTtQHKuulXzBf0G5guL6yCw77pD5EZyq
         D1WsW/+Y+kF7JPVFatZaB1jlawVX8bUh2iYHgG0i4WLmXniuwzzbBYKvdVA7GF2P56+n
         WA0G3dESpSnZiGWjVEew/EAdZlVvLcgnbF06MQkdgHC5z84CxTb0fn6Cnnt9kHbK3fqo
         15oj5KgDxzWJizfm1tOnKcAo0j2Gi7HfL/U5/+j9R7cg2sK/BwXiDum+OWkToRUoK4i9
         HzNfu4ioDqQOVt67wFYJRNT51fv8sSsoCjsvbmWESe9ckdTzptCr2swI14ENcGkUQVT4
         Pt1w==
X-Forwarded-Encrypted: i=1; AJvYcCWggT6Ast8helSJTU9Vhkxu9oLf8mWYC2SgxYd/nu+BLP+TF2jPqYwM/V5AzKXm0JShGeYD/WbHSzkXHA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5FwPS6iUWDX8KVr2ZWyblezD/yS/55WdV81s6Yi9byjfsl/D1
	41sdiNLLnSfHd4ISyQm3XS8qjAunfEgg0J6oB4qys1PTqZRtBe0PStHcCpnt8EsTyJdrb9LfoxS
	vdNP1rh82Mk5qNuUK9U4J2+UADRcjEKyIpBrC6/rtbyZmSaYKP4L5z0aGb18K
X-Gm-Gg: ASbGncv91PicWl38wuQRhQT18hNCQxZ+eKbyOkXRC7Y4KPZ4EWVVqCziUjFQMTRMKbx
	7P2bKvvfNX/ZPoeGUsjy8Zz09oD4gzo7RqR/TsNVdP4aT6cGiDGf5iUxKkvefacgEH18ZqK8lXv
	S8+FJZixhFdSXwKix0WGe22Tac7IssFYVIOlnPEhy2JeYCGyD/ur1ujFi5oCNPWmyauztaIPEv5
	PDibSWFz+zlteIrW19ypFC/4hVUhSV7SrtxWAYiWRtnxDU99JXNkiV9ngzHnnzx1hMZeahUKwdU
	HwrVRIw=
X-Received: by 2002:ad4:5d66:0:b0:6d8:8109:a547 with SMTP id 6a1803df08f44-6df9b229b3dmr98723056d6.22.1736430474925;
        Thu, 09 Jan 2025 05:47:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEXPRzGXe/fDNCKPhYjjHFGFf1iA3m4z/OSqYfqPRvN04kQEjns6bNBz7lR9YWVXA9GZdtP8Q==
X-Received: by 2002:ad4:5d66:0:b0:6d8:8109:a547 with SMTP id 6a1803df08f44-6df9b229b3dmr98722806d6.22.1736430474573;
        Thu, 09 Jan 2025 05:47:54 -0800 (PST)
Received: from [10.200.68.91] (nat-pool-muc-u.redhat.com. [149.14.88.27])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6dd7debcc33sm124784176d6.123.2025.01.09.05.47.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 05:47:54 -0800 (PST)
Message-ID: <734c1bbdb4c38dbb4fb8c681d7aec2f1232a488c.camel@redhat.com>
Subject: Re: [PATCH 1/3] drm/sched: Document run_job() refcount hazard
From: Philipp Stanner <pstanner@redhat.com>
To: Tvrtko Ursulin <tursulin@ursulin.net>, Philipp Stanner
 <phasta@kernel.org>,  Luben Tuikov <ltuikov89@gmail.com>, Matthew Brost
 <matthew.brost@intel.com>, Danilo Krummrich <dakr@kernel.org>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>,  Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>,  Simona Vetter <simona@ffwll.ch>, Sumit Semwal
 <sumit.semwal@linaro.org>, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Date: Thu, 09 Jan 2025 14:47:50 +0100
In-Reply-To: <036bda23-a6a0-46f6-844a-567805cd0f7e@ursulin.net>
References: <20250109133710.39404-2-phasta@kernel.org>
	 <20250109133710.39404-4-phasta@kernel.org>
	 <036bda23-a6a0-46f6-844a-567805cd0f7e@ursulin.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, 2025-01-09 at 13:44 +0000, Tvrtko Ursulin wrote:
>=20
> On 09/01/2025 13:37, Philipp Stanner wrote:
> > From: Philipp Stanner <pstanner@redhat.com>
> >=20
> > drm_sched_backend_ops.run_job() returns a dma_fence for the
> > scheduler.
> > That fence is signalled by the driver once the hardware completed
> > the
> > associated job. The scheduler does not increment the reference
> > count on
> > that fence, but implicitly expects to inherit this fence from
> > run_job().
> >=20
> > This is relatively subtle and prone to misunderstandings.
> >=20
> > This implies that, to keep a reference for itself, a driver needs
> > to
> > call dma_fence_get() in addition to dma_fence_init() in that
> > callback.
> >=20
> > It's further complicated by the fact that the scheduler even
> > decrements
> > the refcount in drm_sched_run_job_work() since it created a new
> > reference in drm_sched_fence_scheduled(). It does, however, still
> > use
> > its pointer to the fence after calling dma_fence_put() - which is
> > safe
> > because of the aforementioned new reference, but actually still
> > violates
> > the refcounting rules.
> >=20
> > Improve the explanatory comment for that decrement.
> >=20
> > Move the call to dma_fence_put() to the position behind the last
> > usage
> > of the fence.
> >=20
> > Document the necessity to increment the reference count in
> > drm_sched_backend_ops.run_job().
> >=20
> > Signed-off-by: Philipp Stanner <pstanner@redhat.com>
> > ---
> > =C2=A0 drivers/gpu/drm/scheduler/sched_main.c | 10 +++++++---
> > =C2=A0 include/drm/gpu_scheduler.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 19 +++++++++++++++----
> > =C2=A0 2 files changed, 22 insertions(+), 7 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/scheduler/sched_main.c
> > b/drivers/gpu/drm/scheduler/sched_main.c
> > index 57da84908752..5f46c01eb01e 100644
> > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > @@ -1218,15 +1218,19 @@ static void drm_sched_run_job_work(struct
> > work_struct *w)
> > =C2=A0=C2=A0	drm_sched_fence_scheduled(s_fence, fence);
> > =C2=A0=20
> > =C2=A0=C2=A0	if (!IS_ERR_OR_NULL(fence)) {
> > -		/* Drop for original kref_init of the fence */
> > -		dma_fence_put(fence);
> > -
> > =C2=A0=C2=A0		r =3D dma_fence_add_callback(fence, &sched_job->cb,
> > =C2=A0=C2=A0					=C2=A0=C2=A0 drm_sched_job_done_cb);
> > =C2=A0=C2=A0		if (r =3D=3D -ENOENT)
> > =C2=A0=C2=A0			drm_sched_job_done(sched_job, fence-
> > >error);
> > =C2=A0=C2=A0		else if (r)
> > =C2=A0=C2=A0			DRM_DEV_ERROR(sched->dev, "fence add
> > callback failed (%d)\n", r);
> > +
> > +		/*
> > +		 * s_fence took a new reference to fence in the
> > call to
> > +		 * drm_sched_fence_scheduled() above. The
> > reference passed by
> > +		 * run_job() above is now not needed any longer.
> > Drop it.
> > +		 */
> > +		dma_fence_put(fence);
> > =C2=A0=C2=A0	} else {
> > =C2=A0=C2=A0		drm_sched_job_done(sched_job, IS_ERR(fence) ?
> > =C2=A0=C2=A0				=C2=A0=C2=A0 PTR_ERR(fence) : 0);
> > diff --git a/include/drm/gpu_scheduler.h
> > b/include/drm/gpu_scheduler.h
> > index 95e17504e46a..d5cd2a78f27c 100644
> > --- a/include/drm/gpu_scheduler.h
> > +++ b/include/drm/gpu_scheduler.h
> > @@ -420,10 +420,21 @@ struct drm_sched_backend_ops {
> > =C2=A0=C2=A0					 struct drm_sched_entity
> > *s_entity);
> > =C2=A0=20
> > =C2=A0=C2=A0	/**
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * @run_job: Called to=
 execute the job once all of the
> > dependencies
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * have been resolved.=
=C2=A0 This may be called multiple times,
> > if
> > -	 * timedout_job() has happened and
> > drm_sched_job_recovery()
> > -	 * decides to try it again.
> > +	 * @run_job: Called to execute the job once all of the
> > dependencies
> > +	 * have been resolved. This may be called multiple times,
> > if
> > +	 * timedout_job() has happened and
> > drm_sched_job_recovery() decides to
> > +	 * try it again.
> > +	 *
> > +	 * @sched_job: the job to run
> > +	 *
> > +	 * Returns: dma_fence the driver must signal once the
> > hardware has
> > +	 *	completed the job ("hardware fence").
> > +	 *
> > +	 * Note that the scheduler expects to 'inherit' its own
> > reference to
> > +	 * this fence from the callback. It does not invoke an
> > extra
> > +	 * dma_fence_get() on it. Consequently, this callback must
> > take a
> > +	 * reference for the scheduler, and additional ones for
> > the driver's
> > +	 * respective needs.
>=20
> Another thing which would be really good to document here is what
> other=20
> things run_job can return apart from the fence.
>=20
> For instance amdgpu can return an ERR_PTR but I haven't looked into=20
> other drivers.

ERR_PTR and NULL are both fine.

But good catch, I'll add that in v2

P.

>=20
> Regards,
>=20
> Tvrtko
>=20
> > =C2=A0=C2=A0	 */
> > =C2=A0=C2=A0	struct dma_fence *(*run_job)(struct drm_sched_job
> > *sched_job);
> > =C2=A0=20
>=20


