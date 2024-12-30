Return-Path: <linux-media+bounces-24158-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 36B909FE54F
	for <lists+linux-media@lfdr.de>; Mon, 30 Dec 2024 11:25:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DB9A51626D5
	for <lists+linux-media@lfdr.de>; Mon, 30 Dec 2024 10:25:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66CAE1A4F1F;
	Mon, 30 Dec 2024 10:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="i9sX8MoD"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7E1A199934
	for <linux-media@vger.kernel.org>; Mon, 30 Dec 2024 10:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735554346; cv=none; b=tajf+R52uFLvDsAuD3giTGZbT7heNZU7duRln35WpGkxS3EeumtKEGIeSTIXoEQBU6kVq0niKl1creErbO219WBlfTJJSwzQCpVB98e4H3oMrwmNUerlju/Yp9T0RkkNiw+hZduslWjQ152NPyuMD+MgwKj6X/UTdzrp+VOLHAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735554346; c=relaxed/simple;
	bh=yOATJvuJePqu3dD4FXggfybg/PoFjpyLSh7L1lvxp48=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=axyWykzv23l6dHW9BOXfVAeU6TFoi3UXfZVvXfvI4QqIWcMDDs9vEehMCktIA0/vYn3jeTjPZuqmxy9gRgWWPxrbZ3UE+U36yeoXU5aauebEELJEUh8UXBaKtAwsDvSsALdMXo8W4tnOWxRpE2+1y33d3vWE68xa8PAWP3l6vFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=i9sX8MoD; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1735554343;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cVdmHsrNhDi44uqqzECxIUXBR3cty0k4vtSMFPeoM14=;
	b=i9sX8MoDG5Ys7mWnJLLQWfMDqx2ichkZp1mT6VboyPqUmnWxzUb3Ot0qzYApxV/I4ZoDny
	I98pzh2NHWfkRYrqSz/kolf4Y9p1S10G960HL6fxgLoP0c1Sg6NdkIfVl8xEUE5XLQoiQb
	+ibMkUVseJrwZaogY7gsqT2iCY3qhJQ=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-615-pYlHPHApP4mS_qI3hvT1uA-1; Mon, 30 Dec 2024 05:25:42 -0500
X-MC-Unique: pYlHPHApP4mS_qI3hvT1uA-1
X-Mimecast-MFC-AGG-ID: pYlHPHApP4mS_qI3hvT1uA
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-38629a685fdso1028119f8f.2
        for <linux-media@vger.kernel.org>; Mon, 30 Dec 2024 02:25:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735554341; x=1736159141;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cVdmHsrNhDi44uqqzECxIUXBR3cty0k4vtSMFPeoM14=;
        b=LT+89ct4tYBQiRRWBT72XeqfxevFQ5FmpNCiClX2uEoTZS+5AGrERg/VpeWA1dg95c
         KErUWmj+258DRNFA6hAe2P9FRhV/aC77YMLlybLZYasgS00d+1Ce1cDKHomf7dCbFv2w
         LB3tzWsj17+4VUOROKSGgNDW20DxzxGbuzen7bRHOfUEB3i3f//aMkJj4Kmn8y6ytYbh
         sOjF73gc5xrWrS67bQcsI8bsCtuaIwJM6yXt3z7arv6YQ6bct8CCIsV81Ieo6g3QRXii
         oNarfAxBkeZT+M6bT5HvTBa5blL1gVrR515dUaS5YzUfRqnLEs8nf6CTcVADkF1aQcaJ
         OaQw==
X-Forwarded-Encrypted: i=1; AJvYcCXaOiCy1TXs3YKFWu8wfOK/PTjSx5L3rtoY1F3jCliYgpf0iGznwHWnOXjlKxb9/52SghIyYkHvLVHU/w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyr1ticOBvkqLnjXy69EyR0CvZJCXrZECCG6xvl4QWA5simixdQ
	NpOlLQJuSeLlkrxWWSQ4cFaV3LS4oLwMbWyktr9luI+lSIxaumWvIh1FMtw4ZES/E+uSUY4DSCS
	Y4YuqcKSEu30RINEDWWSvVWo9tIy+uXcDcOv+CHmP7ccEz//dPw0Ay1ZIICcr39oqJhf5s5k=
X-Gm-Gg: ASbGncvxU4J79BaacuPPcd8EtDWOrGb6yNhzTMDidZSoQl/12oZtqlB//ht/gWiDBy9
	as3oMSCqNUCWl1LlU1llmK6YoGwYMsX7dgtUoSctl5DxrjLe0bcooDSvXHeKd35PXf6PozdipOH
	7RMHHITdvWB2Q4AmNWrWhrCBMMNr/i2AQY551zDcoffGT9tFLP8J4hTkYVgStPfyKj6bDuxB3bV
	ito6RVM05gGausfosZWkysfPC/shvA8ZalhQ7y5GsV1lA6VLRJxqUcPCidWnNcaJP0njeV+iQhI
	2dZofZ9/XP68as9ZlpSkniz9LyxW610=
X-Received: by 2002:a5d:5985:0:b0:386:32ca:9e22 with SMTP id ffacd0b85a97d-38a223ff477mr23516783f8f.41.1735554340886;
        Mon, 30 Dec 2024 02:25:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHXB17EQJu+klTnxp8LwHvdfA4cYR0URMrlxmzt4eQvr0KDUHYN953IpLh8B/apPcYWxNQCVA==
X-Received: by 2002:a5d:5985:0:b0:386:32ca:9e22 with SMTP id ffacd0b85a97d-38a223ff477mr23516761f8f.41.1735554340535;
        Mon, 30 Dec 2024 02:25:40 -0800 (PST)
Received: from ?IPv6:2001:16b8:3d0e:1700:7f81:92a8:f6f3:8c59? ([2001:16b8:3d0e:1700:7f81:92a8:f6f3:8c59])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4366e210cecsm315434025e9.2.2024.12.30.02.25.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Dec 2024 02:25:39 -0800 (PST)
Message-ID: <5fb25705d202d40707730aacb6833d1939483cf4.camel@redhat.com>
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
Date: Mon, 30 Dec 2024 11:25:38 +0100
In-Reply-To: <5c4c610e-26ec-447c-b4db-ad38e994720b@amd.com>
References: <20241220124515.93169-2-phasta@kernel.org>
	 <5c4c610e-26ec-447c-b4db-ad38e994720b@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2024-12-20 at 13:53 +0100, Christian K=C3=B6nig wrote:
> Am 20.12.24 um 13:45 schrieb Philipp Stanner:
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
> > Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> > Cc: Tvrtko Ursulin <tursulin@ursulin.net>
> > Cc: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> > Signed-off-by: Philipp Stanner <pstanner@redhat.com>
> > ---
> > =C2=A0 drivers/gpu/drm/scheduler/sched_main.c | 10 +++++++---
> > =C2=A0 include/drm/gpu_scheduler.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 20 ++++++++++++++++----
> > =C2=A0 2 files changed, 23 insertions(+), 7 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/scheduler/sched_main.c
> > b/drivers/gpu/drm/scheduler/sched_main.c
> > index 7ce25281c74c..d6f8df39d848 100644
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
> > index 95e17504e46a..a1f5c9a14278 100644
> > --- a/include/drm/gpu_scheduler.h
> > +++ b/include/drm/gpu_scheduler.h
> > @@ -420,10 +420,22 @@ struct drm_sched_backend_ops {
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
>=20
> Maybe we should improve that here as well while at it.
>=20
> That drm_sched_job_recovery() can call this multiple times actually
> goes=20
> against the dma_fence rules since drivers can't easily allocate a new
> HW=20
> fence.
>=20
> Something like "The deprecated drm_sched_job_recovery() function
> might=20
> call this again, but it is strongly advised to not be used because it
> violates dma_fence memory allocations rules."

I just realized that drm_sched_job_recovery() is indeed deprecated so
hard that it simply doesn't exist anymore. There is no such function.

It seems to me that we (and that old docstring) are actually talking
about drm_sched_resubmit_jobs(), which is also deprecated, and which
does invoke backend_ops.run_job()?


P.


>=20
> On the other hand can of course be a separate patch.
>=20
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
> > return a
> > +	 * fence whose refcount is at least 2: One for the
> > scheduler's
> > +	 * reference returned here, another one for the reference
> > kept by the
> > +	 * driver.
>=20
> Well the driver actually doesn't need any extra reference. The
> scheduler=20
> just needs to guarantee that this reference isn't dropped before it
> is=20
> signaled.
>=20
> Regards,
> Christian.
>=20
> > =C2=A0=C2=A0	 */
> > =C2=A0=C2=A0	struct dma_fence *(*run_job)(struct drm_sched_job
> > *sched_job);
> > =C2=A0=20
>=20


