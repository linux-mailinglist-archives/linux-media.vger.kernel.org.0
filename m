Return-Path: <linux-media+bounces-24696-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8910DA0B662
	for <lists+linux-media@lfdr.de>; Mon, 13 Jan 2025 13:08:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8259B3A66E4
	for <lists+linux-media@lfdr.de>; Mon, 13 Jan 2025 12:07:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CB1322F15E;
	Mon, 13 Jan 2025 12:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EOxiqTp9"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10DDE22A4C1
	for <linux-media@vger.kernel.org>; Mon, 13 Jan 2025 12:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736770043; cv=none; b=AEUGvpDGirlt/AwGm44nsBEj8Oh+izYZyWYHMn1f2csM/k4wOVFPf2aoDC4IWLfJZObNZVMiz1PGf7nvCB+F+V0QEbk9rPTifzmk9RMSr+dfblTs9UBo3k00G3geUJKLNfKrpfM3kl7T42AxNEcwO3z44GbpcdwezDK4LqOHtTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736770043; c=relaxed/simple;
	bh=OsuGXX1IB+4jMhYbVJJTnzxRgsURfdW1BWdB4B7uvHI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OEcCHEJwBAcpfAsNs1EYg7QXBvanzYJWm9QmZZL/0WzyY5Uau/rPGmMsTcOBX7StmXIGiLj6g4LF9NfUrQ7xhYLSUpLi6E0Eacs2wDVaH7J4YJ1aD1UcY8SdgD38dbN+3iPxY/V3/6WN5zEuf4WVgf7KJ/9MZKAX1tadqwbMhC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EOxiqTp9; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736770038;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+TdSHXspwnZXwF4h2DZEwKqf77S3RUPoHliyOCG8joM=;
	b=EOxiqTp9TK0SDOjXvuGok8AXFMn6c8rV7GwMvW9rGbI4xQeZ1BYmf/7WAsegGxVG0iRzB3
	eXvrFX8GUlge4Mo5pZyyzjlcDeE/HTsEMgmhCmtOjXKBpDFlKzPe7x11YlUCpU6fiVXzaR
	HtCgiDTstk3QI/9esSF4opujsWxRFBQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-417-THMEzfDwOcihSAR1d4WgDQ-1; Mon, 13 Jan 2025 07:07:17 -0500
X-MC-Unique: THMEzfDwOcihSAR1d4WgDQ-1
X-Mimecast-MFC-AGG-ID: THMEzfDwOcihSAR1d4WgDQ
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4361c040ba8so24095515e9.1
        for <linux-media@vger.kernel.org>; Mon, 13 Jan 2025 04:07:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736770036; x=1737374836;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+TdSHXspwnZXwF4h2DZEwKqf77S3RUPoHliyOCG8joM=;
        b=TC6HrNAbEm9bWQQiq7g/+RUulDdZMX8UNnVII1MkOydWaxuYQ5hrnPEslvBU+IgUeG
         oia4OnutkNvVc0O1HqlDUs0I+gNChFFTGF3pWJyYaMOaky8P6OqXO7sYV0OceY8eApvV
         SSb76PzaIawN7GxBajAwc0IlyZnqD4uTX1XFjl0wCOLYfvlNZLtEiKki13+BHoCKMuAM
         O+qJP6NLHDf9KBnDk5yqz+VAL/X+PLbFaTVNPH/pWp2kt5UyzinH9H0xPkoUEga0CmWE
         c1pST2wDT2uYoKgvXmrFbg43yPImeH0E/IV499vvTDDvCn+a+qW4WTTAkkOJhVsR0rmm
         oBhg==
X-Forwarded-Encrypted: i=1; AJvYcCWLroBvuiQx0V2kryU/hZ9MfiRW0xcYkmPEEhCCVlJeNq8jY6LVfgNxt/ufrIoc20ZqneJNYoCse9SKcQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxF/4yHHGcFNdW5OGa3vGE1sg6lulKWrPgn/4MQvGYuLFgrSMkL
	Vbf4GotpAvkp1763WgPRRm9x4s+BEKYoJaL9rD9Yf9YrSaDH0tag3jdcxOJ7XAjikWU+h9JWwv2
	7UdkIf7F32q5l/DGh0jUmtE8TeZn3dYKSQbjJ8kdJ9yTQvBROVap3In6gcyod
X-Gm-Gg: ASbGncsaFzjhBIs6AJnATdxJB8vqmZDGVB0kljd4VxSw8k5PiD3I4ZngWGLzim1VboF
	FzTxcXVeu4NbR/PtoJ307eUTwyIG/Hahw3SOFGmfv9EKvT83XgYUZ6hV7uKOWC5jUX4gATgEf+E
	FHS8ppQJ9tMmhsV+eVhyxb5HDyKLHicRQbYmyFcAPx1kucVwAd2mruPDrxJmNCkQSIcZ6MB8eTF
	Rn818zvdEwQcWK19lNtkfWmX71tKQOjy2u/AJtZHsfRwxifoFxjKn8j6BqXZArb6D1vQSFfRa0I
	Ty1q+ezmGsSMz5jvCJdnm02raoCDk9xKBVh0QH/1KRWRb0RgLh+6t70gLiAJEM7y9eqA/D1lZiE
	9z/85sDQ1rw5BRCCD
X-Received: by 2002:a5d:64af:0:b0:38a:8e2e:9fcc with SMTP id ffacd0b85a97d-38a8e2ea11cmr15492271f8f.45.1736770035852;
        Mon, 13 Jan 2025 04:07:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGpSJ9ro6ZHAQTx4w8s1hVHKl20+St+yEc7qTxW7zB/9BUgzdP9J0EacCpHEFeFW46e29u8xQ==
X-Received: by 2002:a5d:64af:0:b0:38a:8e2e:9fcc with SMTP id ffacd0b85a97d-38a8e2ea11cmr15492222f8f.45.1736770035376;
        Mon, 13 Jan 2025 04:07:15 -0800 (PST)
Received: from ?IPv6:2001:16b8:2d84:4500:c248:649d:c975:50e7? (200116b82d844500c248649dc97550e7.dip.versatel-1u1.de. [2001:16b8:2d84:4500:c248:649d:c975:50e7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e3834a6sm11892576f8f.28.2025.01.13.04.07.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 04:07:15 -0800 (PST)
Message-ID: <24a1169b0d1a4ba895df30c2665265bbf3e78e2a.camel@redhat.com>
Subject: Re: [PATCH 1/3] drm/sched: Document run_job() refcount hazard
From: Philipp Stanner <pstanner@redhat.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Philipp
 Stanner <phasta@kernel.org>, Luben Tuikov <ltuikov89@gmail.com>, Matthew
 Brost <matthew.brost@intel.com>, Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Sumit Semwal
 <sumit.semwal@linaro.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Date: Mon, 13 Jan 2025 13:07:13 +0100
In-Reply-To: <a52651d1-16c3-4038-bea8-c6ec1812eb3d@amd.com>
References: <20250109133710.39404-2-phasta@kernel.org>
	 <20250109133710.39404-4-phasta@kernel.org>
	 <a52651d1-16c3-4038-bea8-c6ec1812eb3d@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, 2025-01-09 at 15:01 +0100, Christian K=C3=B6nig wrote:
> Am 09.01.25 um 14:37 schrieb Philipp Stanner:
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
>=20
> I just came to realize that this hack with calling run_job multiple=20
> times won't work any more with this patch here.
>=20
> The background is that you can't allocate memory for a newly returned
> fence and as far as I know no driver pre allocates multiple HW fences
> for a job.
>=20
> So at least amdgpu used to re-use the same HW fence as return over
> and=20
> over again, just re-initialized the reference count. I removed that
> hack=20
> from amdgpu, but just FYI it could be that other driver did the same.
>=20
> Apart from that concern I think that this patch is really the right=20
> thing and that driver hacks relying on the order of dropping
> references=20
> are fundamentally broken approaches.

I don't see how a hack couldn't work anymore with this patch. All it
does is add comments, and it moves the putting of the dma_fence to
where it belongs. But we're in run_job_work() here, which executes
sequentially.
Drivers reusing fences or modifying the refcount might be bad and
hacky, but as long as we're not racing here it doesn't matter whether
the scheduler decrements the refcount a few nanoseconds later than
before.

Anyways, even if I'm wrong, it seems we agree that provoking such
explosions would be worth it.

P.

>=20
> So feel free to add Reviewed-by: Christian K=C3=B6nig
> <christian.koenig@amd.com>.
>=20
> Regards,
> Christian.
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
> > take a
> > +	 * reference for the scheduler, and additional ones for
> > the driver's
> > +	 * respective needs.
> > =C2=A0=C2=A0	 */
> > =C2=A0=C2=A0	struct dma_fence *(*run_job)(struct drm_sched_job
> > *sched_job);
> > =C2=A0=20
>=20


