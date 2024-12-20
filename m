Return-Path: <linux-media+bounces-23917-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A60C79F93FF
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 15:11:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 56DB47A12B2
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 14:11:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B240216384;
	Fri, 20 Dec 2024 14:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JkTZ06r1"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09F3B1C5F37
	for <linux-media@vger.kernel.org>; Fri, 20 Dec 2024 14:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734703902; cv=none; b=jFBYgigS0/7hQtH1/R+etDRru7By5HIeZdssqW+yS3DafumaC42MdBb8/P0/UDxwEIpoqWky2X2D8tAOSlLUMF1jF4vcqXAjysDm1AqoDD2KZFyWzC+EfuYTiL1+AqyF48FBtpZA27mUONGBy3InMa1VlanYIAWJYAKR6ixtBpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734703902; c=relaxed/simple;
	bh=tXG9+6xIhGDGxa6ol7ehNCy/Egn12Mcieruz73qr/a8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JhZNsnnSBe5Y0hHg0O64o2PpXayavAwQdFmBFMD4xyxYclNv9O4lnIMrLxxVDTY/lbvwPE6MvGcyFLIhx9fxZ96ct0EbZtgcsSYLa6hzbx6XaWBeK9Ey0ehVagyI0k3JC9r1vOH1hV86ncA9meSsVOYXadbqUgHli9J5+cGQbAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JkTZ06r1; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734703898;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KR/Ybg3lzFNNrynj6GP2dfr+h48F8Y8mlhL1ZrgmhI0=;
	b=JkTZ06r1ZECNnT3QzmRt0z7JGoVU/OHdNRK0uyCf4RFxVfqKPwFvTtVJL505sZbm/S3Crp
	BbsqyLv/Ry0rlT1/aLt37vhKzsiwic7iTquFamND7swmd9W613pdK0f8V4gIQravuZglxu
	LUm4GOAi45FxYWy17YHvoTunLJBamz8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-488-UXvYG6KgOyaHyGEScT1HBA-1; Fri, 20 Dec 2024 09:11:37 -0500
X-MC-Unique: UXvYG6KgOyaHyGEScT1HBA-1
X-Mimecast-MFC-AGG-ID: UXvYG6KgOyaHyGEScT1HBA
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4362b9c15d8so11022515e9.3
        for <linux-media@vger.kernel.org>; Fri, 20 Dec 2024 06:11:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734703896; x=1735308696;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KR/Ybg3lzFNNrynj6GP2dfr+h48F8Y8mlhL1ZrgmhI0=;
        b=RrMNiNvAwfmac+3BxFJkSjFrb4ygN0JGFKPIfrK5Om3FN8K6nu+xNrIxuAXCkNEcE8
         3mlEtMTLEzjQn33H0pIXThr3nW2x5igNdyTwZD+waGpzql+/SsSu9fCeCf6MtizsdLEB
         nDARbpnSWn4Nd2eNPyp7zKdL0O1ckCopas9xRA6aw0afeXrGnFJohf1tRf8DpHoqLL2h
         znvC4SC6NcvQJv4sCM39AXgpKIj7ziQRnXlcTvqbeJp3cnq0iXXHuuZb5/IishoO4NaD
         qw6GULPckv/tUO5o93cI5i4V4AnsQIZ2W9DlBRGs4jpanmF+Kb8+rmZ6Q6ClZGMpcx/+
         1GVg==
X-Forwarded-Encrypted: i=1; AJvYcCVm/r16P5m45az6uQCBn+JLyh1yHA0N75RhUW1/2B1zV/1r4EC7CTuzoqlVbcNboJ7rblWTvoxL3sDf/Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxRlPPr4968TRExQVl8ecmdNnOhJ5N0CFhC8ChEkfoaKZhoyNUs
	a2K8h8/JRhXNolrMNOTsrTHN3crXSWV4tVDXhYZ4mg720K6/+1twtKeb8KvjS1STvVhFiUvad2Q
	HbetCl3UQk5jYOf1NlNr+tRhteGn14mHN0n5YjSVmC5VgaaRdy++ZOi2aEl3z
X-Gm-Gg: ASbGncvqscJ3BTzyTGVzC7B5J5/XB0pOnpmjzzAg85DFytzn5ToxVKBijMto3qvahc/
	uDmCvGGlgzcuT2HE/bd/RDgfZU7P5hZS7Gl74lcDtjDzb48JrW9k+povl7z8E/Y+lPzQaNa3wYo
	zsyiqpbwEA9WrZp3MHa+II8nLE1jZlEp99vFU1nwsOe3ajjeTJMxMhcsccbBE8pps6VdYFqQEBX
	ZLHvYu+0H8mis/HNH4ufTDyOU0Drc7RAdE+hJcJLETGxWT0lQxjzNrMD4f/Uxv+vdznvih7T+lz
	/BhodpzXjY6yS+ZWeh3AWI+PRXTlMh4=
X-Received: by 2002:a7b:c459:0:b0:434:ff30:a165 with SMTP id 5b1f17b1804b1-436712441e2mr5994595e9.8.1734703896340;
        Fri, 20 Dec 2024 06:11:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFvm84P8soawQWG7WWO+ebyxGNN7WWXWb2n1BSpHTBIQgvoW1jO1ClH+ywj0Fo/WaCNkr7iYw==
X-Received: by 2002:a7b:c459:0:b0:434:ff30:a165 with SMTP id 5b1f17b1804b1-436712441e2mr5994205e9.8.1734703895893;
        Fri, 20 Dec 2024 06:11:35 -0800 (PST)
Received: from ?IPv6:2001:16b8:3db8:2e00:4b6c:c773:a3e0:8035? ([2001:16b8:3db8:2e00:4b6c:c773:a3e0:8035])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4366127c4fcsm47460175e9.29.2024.12.20.06.11.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 06:11:35 -0800 (PST)
Message-ID: <46f22193d960c0a0960c2ceaa525e9ff57fc09b6.camel@redhat.com>
Subject: Re: [PATCH] drm/sched: Document run_job() refcount hazard
From: Philipp Stanner <pstanner@redhat.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Danilo
 Krummrich <dakr@kernel.org>
Cc: Philipp Stanner <phasta@kernel.org>, Luben Tuikov <ltuikov89@gmail.com>,
  Matthew Brost <matthew.brost@intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>,
 dri-devel@lists.freedesktop.org,  linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org,  linaro-mm-sig@lists.linaro.org, Tvrtko
 Ursulin <tursulin@ursulin.net>, Andrey Grodzovsky
 <andrey.grodzovsky@amd.com>
Date: Fri, 20 Dec 2024 15:11:34 +0100
In-Reply-To: <e366a206-9fa3-4c6b-b307-d48855a7b183@amd.com>
References: <20241220124515.93169-2-phasta@kernel.org>
	 <5c4c610e-26ec-447c-b4db-ad38e994720b@amd.com> <Z2VunIJ4ltfW_xqD@pollux>
	 <e366a206-9fa3-4c6b-b307-d48855a7b183@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2024-12-20 at 14:25 +0100, Christian K=C3=B6nig wrote:
> Am 20.12.24 um 14:18 schrieb Danilo Krummrich:
> > On Fri, Dec 20, 2024 at 01:53:34PM +0100, Christian K=C3=B6nig wrote:
> > > Am 20.12.24 um 13:45 schrieb Philipp Stanner:
> > > > From: Philipp Stanner <pstanner@redhat.com>
> > > >=20
> > > > drm_sched_backend_ops.run_job() returns a dma_fence for the
> > > > scheduler.
> > > > That fence is signalled by the driver once the hardware
> > > > completed the
> > > > associated job. The scheduler does not increment the reference
> > > > count on
> > > > that fence, but implicitly expects to inherit this fence from
> > > > run_job().
> > > >=20
> > > > This is relatively subtle and prone to misunderstandings.
> > > >=20
> > > > This implies that, to keep a reference for itself, a driver
> > > > needs to
> > > > call dma_fence_get() in addition to dma_fence_init() in that
> > > > callback.
> > > >=20
> > > > It's further complicated by the fact that the scheduler even
> > > > decrements
> > > > the refcount in drm_sched_run_job_work() since it created a new
> > > > reference in drm_sched_fence_scheduled(). It does, however,
> > > > still use
> > > > its pointer to the fence after calling dma_fence_put() - which
> > > > is safe
> > > > because of the aforementioned new reference, but actually still
> > > > violates
> > > > the refcounting rules.
> > > >=20
> > > > Improve the explanatory comment for that decrement.
> > > >=20
> > > > Move the call to dma_fence_put() to the position behind the
> > > > last usage
> > > > of the fence.
> > > >=20
> > > > Document the necessity to increment the reference count in
> > > > drm_sched_backend_ops.run_job().
> > > >=20
> > > > Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> > > > Cc: Tvrtko Ursulin <tursulin@ursulin.net>
> > > > Cc: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> > > > Signed-off-by: Philipp Stanner <pstanner@redhat.com>
> > > > ---
> > > > =C2=A0=C2=A0 drivers/gpu/drm/scheduler/sched_main.c | 10 +++++++---
> > > > =C2=A0=C2=A0 include/drm/gpu_scheduler.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 20
> > > > ++++++++++++++++----
> > > > =C2=A0=C2=A0 2 files changed, 23 insertions(+), 7 deletions(-)
> > > >=20
> > > > diff --git a/drivers/gpu/drm/scheduler/sched_main.c
> > > > b/drivers/gpu/drm/scheduler/sched_main.c
> > > > index 7ce25281c74c..d6f8df39d848 100644
> > > > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > > > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > > > +	 *
> > > > +	 * @sched_job: the job to run
> > > > +	 *
> > > > +	 * Returns: dma_fence the driver must signal once the
> > > > hardware has
> > > > +	 *	completed the job ("hardware fence").
> > > > +	 *
> > > > +	 * Note that the scheduler expects to 'inherit' its
> > > > own reference to
> > > > +	 * this fence from the callback. It does not invoke an
> > > > extra
> > > > +	 * dma_fence_get() on it. Consequently, this callback
> > > > must return a
> > > > +	 * fence whose refcount is at least 2: One for the
> > > > scheduler's
> > > > +	 * reference returned here, another one for the
> > > > reference kept by the
> > > > +	 * driver.
> > > Well the driver actually doesn't need any extra reference. The
> > > scheduler
> > > just needs to guarantee that this reference isn't dropped before
> > > it is
> > > signaled.
> > I think he means the reference the driver's fence context has to
> > have in order
> > to signal that thing eventually.
>=20
> Yeah, but this is usually a weak reference. IIRC most drivers don't=20
> increment the reference count for the reference they keep to signal a
> fence.
>=20
> It's expected that the consumers of the dma_fence keep the fence
> alive=20
> at least until it is signaled.

So are you saying that the driver having an extra reference (without
having obtained it with dma_fence_get()) is not an issue because the
driver is the one who will signal the fence [and then be done with it]?

>  That's why we have this nice warning in=20
> dma_fence_release().
>=20
> On the other hand I completely agree it would be more defensive if=20
> drivers increment the reference count for the reference they keep for
> signaling.
>=20
> So if we want to document that the fence reference count should at
> least=20
> be 2 we somehow need to enforce this with a warning for example.

We could =E2=80=93 but I'm not sure whether it really needs to be "enforced=
",
especially if it were only to be a minor issue, as you seem to hint at
above.
Document it is the minimum IMO


P.

>=20
> Regards,
> Christian.
>=20
>=20
>=20
> >=20
> > > Regards,
> > > Christian.
> > >=20
> > > > =C2=A0=C2=A0=C2=A0	 */
> > > > =C2=A0=C2=A0=C2=A0	struct dma_fence *(*run_job)(struct drm_sched_jo=
b
> > > > *sched_job);
>=20


