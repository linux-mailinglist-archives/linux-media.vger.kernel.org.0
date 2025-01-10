Return-Path: <linux-media+bounces-24579-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 909DAA08B0E
	for <lists+linux-media@lfdr.de>; Fri, 10 Jan 2025 10:15:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F1F447A0662
	for <lists+linux-media@lfdr.de>; Fri, 10 Jan 2025 09:14:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55FB2209F38;
	Fri, 10 Jan 2025 09:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HzUOtQ6A"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11AB73BBF0
	for <linux-media@vger.kernel.org>; Fri, 10 Jan 2025 09:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736500496; cv=none; b=GkNGcPzmYWfRXY1IsCiDPDkD9hiI+JK+TT6aIgwzmaPWv1VnBqHGnLwwbLl3WPBNf2YZNDmo3Fz98vmQJlwASP8jlUagJM+imv488yZd9yNcdHt762cwfglY/vdrRb5ZOWWIQhrhRGGkXnFLXp/Os3Vod+NrINefFHkFO9qZJV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736500496; c=relaxed/simple;
	bh=KrpQYKwCv1NFZiIePrfS/rkTV6cEnkv7v7NbHOxw+ao=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=S5ZJ814Mo+MLPnlbdP9kTQ1ts1UqU0EuZGdm6j79b5LWSkCpCKnbxCpgE7+FhwLi9+TYjJQg+RXpAF+o9hukGD6PG+Kyuj9szQBykySqH6tPplv7RC86itE7D4uLRLJ7fBGlFP5xKzUJfGQV/L+O+0wHl6yw0GBtsfiwJtW6lVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HzUOtQ6A; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736500494;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8WE2y7Tnn0z8S9WigHQq+Beyf3tmLnG35Pz4F1jLvso=;
	b=HzUOtQ6Ac4c1d9fGXzZFDYyDzSkUXoUgRQPRoUwLNscg9RYhShCgmq2I8jrf78j+ynGGw7
	kr2lcXoV7B+N/2AgGP4dG2z/EGlxZFYPumx/ddKCmOhU4BUhlbS96+Pc3kBTKTINLcDrtz
	4MZ/Z94G0eDeDujlgnVnNSGRAzHNzOI=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-112-AheBc4WWM4O3kRvVWjFLdg-1; Fri, 10 Jan 2025 04:14:52 -0500
X-MC-Unique: AheBc4WWM4O3kRvVWjFLdg-1
X-Mimecast-MFC-AGG-ID: AheBc4WWM4O3kRvVWjFLdg
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-38a873178f2so863864f8f.1
        for <linux-media@vger.kernel.org>; Fri, 10 Jan 2025 01:14:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736500491; x=1737105291;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8WE2y7Tnn0z8S9WigHQq+Beyf3tmLnG35Pz4F1jLvso=;
        b=cLUiY+E0fa44hIXS9mwZGsPWnUXFTdaitY0TOQpNvsinhXf4qewKDrwq6iVTX4Uj8S
         aOQsw7nR4s9PI6ImEDcKX04eHdwHsqUfbSxRdHlI20Ufnq3EZYAtME2n1Orrc3+iEtpw
         CjiDakFrkiO0yWis1L1d40Fk8s5yKTHKWalh3oGdRnZGbXuwGchX3X8uaUtRSKQZ0u7/
         bxhVudBHrdcMjLh+RAhJoHgLLyJ3o+ynuho0nvdX8xNQ5vVYEjuRkjdOC/GQ0g6ORblM
         YOAyQXBx0P4u/ygqT83ufQbB2IZppM5tNn4W8xSvlJqWIaxPZb2TT9zIn5fCBTib2x1F
         wj5g==
X-Forwarded-Encrypted: i=1; AJvYcCVWc0f+RWECnQRbchlJDwUZbu/Z2yBWgrPJgvGsq4h4cO+I7Nc+BUPSurJ0ms3ODRRWnwjbamsbLX1rpg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0krCQv8jIgMgOkegLQmH92zD4oldHDg97j12WfYqP9Bpmdee9
	GVUpj2+vPn3znNQjhhuWAItPbSuHxuGlnIdbMoLVmRiRbweGn9LZXCrds6pNn69u/UTx4sF1JIz
	9c5IUWTtBFxd3W3IqLOlJMzSQzzYt5GmPBDU1HCx06qz/CSe5XJDCfm4YCHiq
X-Gm-Gg: ASbGncu5fVDD3QNm/Thz0CEeEsk3a1cOEEr7mVq/RVSHSoO2JQmkBSU/MpL5oyTc7Bq
	Yk18/koyukV5yvn3Eo12ip4QJbmIE3TRNZRcywtPJsw5BtCWsyubuGP4+NPKrc80OGZHZ+Qj74d
	HVSyZFBj5mmAt0FYqmNDp/m9vUtPuDumu+txAGeZ5HCBRbo3mZSa9054zSEtwjr5EdckjEmrm6Q
	eRJChdEZUcwBETg347LOja7pW+N62AnP147rh1/btHiGtka9lGaPlp6PSwqIIFeUWYFy5zAI0wK
	yNJK5HIJ3V23OS7WX2FlEBw/sGz9G0Q801X+VL7dNymUrOrlHQ2zkHHnaHnfct43lUKkMB6qjff
	84cZQ0wBILJ/j
X-Received: by 2002:a5d:5f52:0:b0:382:4926:98fa with SMTP id ffacd0b85a97d-38a8733691amr9430337f8f.40.1736500491581;
        Fri, 10 Jan 2025 01:14:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFtXquHIJObzLgOAiA1rB/PNIksOhxW+GDPZKrOCv6KsWQW80GBE0j/RUI1fRpLdmchCqwXWg==
X-Received: by 2002:a5d:5f52:0:b0:382:4926:98fa with SMTP id ffacd0b85a97d-38a8733691amr9430298f8f.40.1736500491137;
        Fri, 10 Jan 2025 01:14:51 -0800 (PST)
Received: from ?IPv6:2001:16b8:2d10:d100:478:f613:cd65:5ca1? (200116b82d10d1000478f613cd655ca1.dip.versatel-1u1.de. [2001:16b8:2d10:d100:478:f613:cd65:5ca1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e37e375sm3932101f8f.22.2025.01.10.01.14.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 01:14:50 -0800 (PST)
Message-ID: <dc31c33626c5f6100c93cb51eaf37070d5a7ba9f.camel@redhat.com>
Subject: Re: [PATCH 1/3] drm/sched: Document run_job() refcount hazard
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
Date: Fri, 10 Jan 2025 10:14:49 +0100
In-Reply-To: <Z3_dgYGOSfLUcI0J@pollux>
References: <20250109133710.39404-2-phasta@kernel.org>
	 <20250109133710.39404-4-phasta@kernel.org> <Z3_dgYGOSfLUcI0J@pollux>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, 2025-01-09 at 15:30 +0100, Danilo Krummrich wrote:
> On Thu, Jan 09, 2025 at 02:37:10PM +0100, Philipp Stanner wrote:
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
> > =C2=A0drivers/gpu/drm/scheduler/sched_main.c | 10 +++++++---
> > =C2=A0include/drm/gpu_scheduler.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 19 +++++++++++++++----
> > =C2=A02 files changed, 22 insertions(+), 7 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/scheduler/sched_main.c
> > b/drivers/gpu/drm/scheduler/sched_main.c
> > index 57da84908752..5f46c01eb01e 100644
> > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > @@ -1218,15 +1218,19 @@ static void drm_sched_run_job_work(struct
> > work_struct *w)
> > =C2=A0	drm_sched_fence_scheduled(s_fence, fence);
> > =C2=A0
> > =C2=A0	if (!IS_ERR_OR_NULL(fence)) {
> > -		/* Drop for original kref_init of the fence */
> > -		dma_fence_put(fence);
> > -
> > =C2=A0		r =3D dma_fence_add_callback(fence, &sched_job->cb,
> > =C2=A0					=C2=A0=C2=A0 drm_sched_job_done_cb);
> > =C2=A0		if (r =3D=3D -ENOENT)
> > =C2=A0			drm_sched_job_done(sched_job, fence-
> > >error);
> > =C2=A0		else if (r)
> > =C2=A0			DRM_DEV_ERROR(sched->dev, "fence add
> > callback failed (%d)\n", r);
> > +
> > +		/*
> > +		 * s_fence took a new reference to fence in the
> > call to
> > +		 * drm_sched_fence_scheduled() above. The
> > reference passed by
>=20
> I think mentioning that in this context is a bit misleading. The
> reason we can
> put the fence here, is because we stop using the local fence pointer
> we have a
> reference for (from run_job()).
>=20
> This has nothing to do with the fact that drm_sched_fence_scheduled()
> took its
> own reference when it stored a copy of this fence pointer in a
> separate data
> structure.
>=20
> With that fixed,

Then let's remove the comment completely I'd say.

>=20
> Reviewed-by: Danilo Krummrich <dakr@kernel.org>

And I forgot your SB. Will add.


Danke,
P.

>=20
> > +		 * run_job() above is now not needed any longer.
> > Drop it.
> > +		 */
> > +		dma_fence_put(fence);
> > =C2=A0	} else {
> > =C2=A0		drm_sched_job_done(sched_job, IS_ERR(fence) ?
> > =C2=A0				=C2=A0=C2=A0 PTR_ERR(fence) : 0);
> > diff --git a/include/drm/gpu_scheduler.h
> > b/include/drm/gpu_scheduler.h
> > index 95e17504e46a..d5cd2a78f27c 100644
> > --- a/include/drm/gpu_scheduler.h
> > +++ b/include/drm/gpu_scheduler.h
> > @@ -420,10 +420,21 @@ struct drm_sched_backend_ops {
> > =C2=A0					 struct drm_sched_entity
> > *s_entity);
> > =C2=A0
> > =C2=A0	/**
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
> > =C2=A0	 */
> > =C2=A0	struct dma_fence *(*run_job)(struct drm_sched_job
> > *sched_job);
> > =C2=A0
> > --=20
> > 2.47.1
> >=20


