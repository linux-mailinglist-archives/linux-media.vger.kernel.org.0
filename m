Return-Path: <linux-media+bounces-15020-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 027CB9311FB
	for <lists+linux-media@lfdr.de>; Mon, 15 Jul 2024 12:09:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B974E2858D8
	for <lists+linux-media@lfdr.de>; Mon, 15 Jul 2024 10:09:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE374187347;
	Mon, 15 Jul 2024 10:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="OQVyA/H1"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C978118629E
	for <linux-media@vger.kernel.org>; Mon, 15 Jul 2024 10:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721038135; cv=none; b=BVJ/A/Pnt7CiA288LsLMclcidhDxZam8jA/iDPnbGOU6Mu9300TkQZOELBgIACd1nuUMR4ja5HNFqANdmWua3iEMcT3gFKd0qy4LILlssUpNZ4KnnEmFfXuq08vbZpw2s8giJaPfSdU1ahxF0HdSvtcA4BT7372BWEC3N7AcItE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721038135; c=relaxed/simple;
	bh=nzxGF/IVWypN5a9C8DAnRx04C5FDKt5UmDZII9AqUcw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KL6pCWf7ciHvl6yUUCuE+om06YmcZlBsabJt10eKenfpNh9M8HGAcQhwie7Ha6tQOeCvHrT7FDYNjEuF/sxFqPMAzWKGHYo7SoVTjOoZWgy3Bck0nkkj0P+zAvxgKiKFJddAdfjSvQkC5Yb6jvY8UIkrozKlIna7WABO+jIysqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=OQVyA/H1; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-426659ff58bso3497645e9.2
        for <linux-media@vger.kernel.org>; Mon, 15 Jul 2024 03:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1721038132; x=1721642932; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CR2Ia0FiVFedpG588AkdnSWlCXZ9egJLBsCqhnpjuT8=;
        b=OQVyA/H1EAAR6l7xnIePghX5mvtv36egXS9FhEb4+IPFi6aPlrBex5nR3sI1VErnB1
         UPP71ZnmqP9xg4z5RT/IBTn8zyEXcIO7fM2enawvkWJRtxYqJhIUrGrOnWkOatZsLsLy
         SPvnn6ehZt84TWch4+uFEAYQCmlG9jPtNKFXk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721038132; x=1721642932;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CR2Ia0FiVFedpG588AkdnSWlCXZ9egJLBsCqhnpjuT8=;
        b=rzn/6I5nszWutit0A6a7XaN/JE3+afet3tH/REy5LG2GpCDTa/Xyx9BKpEXvO4P6/M
         zQlDLrMPm7tDCnIrTeBObxRfOI6PLem1kpEEw9zCHFAdcQdjC3CU2RpWXQk40ixT6Bxt
         cRDBJc3nEhmL35jAlx2zFpK23tGVhRa9ck6Udwu2R+WCd3bDKU68rfFp4Cg+5C41IE+L
         vN0CcYIAcK5KFpBLRf+N9EpdqVL5/V6saJUoEc2XoWRDGKqUjUbm8IHZVy3jBivbSfy3
         3fo+lR/RAOiXDMO144iIQSRGFskolGklLGAmEsJYWfLYUqmxRfoe/5Dxo3HWsb9deM8j
         9gqg==
X-Forwarded-Encrypted: i=1; AJvYcCUBPgM7rC4YrfDLMxRoSFrVs4I99EauFfKqz5zsNAMTFMPOVEdfvFQ7muWtjDAhW8LnkwlLCcNlWyiCFvIb1mSEt7+YoHOu2uKY/b8=
X-Gm-Message-State: AOJu0Yz2+x9MYO8Ju2qoAKPIkAz3ZfyQ+SlogccmFszzW4JOS6HB3w6R
	AG3Ekg6twBrJmzHI3+6voaVbcyAVN3lXM6YekEZstpU2BUd9mD1eq+eGT/4Iu1k=
X-Google-Smtp-Source: AGHT+IHyT41V56P2D7gRVnHbsl6ebnID4kMa+VsHDxqWmcAkAFdIoHpQ9xgw+h4TlxD7k+VH6h7+vQ==
X-Received: by 2002:a05:600c:3b8c:b0:426:4920:2846 with SMTP id 5b1f17b1804b1-4279834f1e5mr64390645e9.3.1721038132199;
        Mon, 15 Jul 2024 03:08:52 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4279f23981fsm115958335e9.4.2024.07.15.03.08.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jul 2024 03:08:51 -0700 (PDT)
Date: Mon, 15 Jul 2024 12:08:49 +0200
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
	DRI Development <dri-devel@lists.freedesktop.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
	Daniel Vetter <daniel.vetter@intel.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH 1/2] drm: Add might_fault to drm_modeset_lock priming
Message-ID: <ZpT1MeLxz2yLtDxu@phenom.ffwll.local>
Mail-Followup-To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	DRI Development <dri-devel@lists.freedesktop.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
	Daniel Vetter <daniel.vetter@intel.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org
References: <20240710093120.732208-1-daniel.vetter@ffwll.ch>
 <03f7e2ad-fd5c-4da7-a14c-34c2c158c513@amd.com>
 <CAKMK7uFvCr2qcHun06LC-ON3GBqj8=mCpPGHuAOh9BEyr60fiQ@mail.gmail.com>
 <cf3ff1b9-2934-47bd-93c7-5ea55d10c82f@amd.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cf3ff1b9-2934-47bd-93c7-5ea55d10c82f@amd.com>
X-Operating-System: Linux phenom 6.9.7-amd64 

On Wed, Jul 10, 2024 at 02:40:04PM +0200, Christian König wrote:
> Am 10.07.24 um 13:58 schrieb Daniel Vetter:
> > On Wed, 10 Jul 2024 at 13:39, Christian König <christian.koenig@amd.com> wrote:
> > > Am 10.07.24 um 11:31 schrieb Daniel Vetter:
> > > > We already teach lockdep that dma_resv nests within drm_modeset_lock,
> > > > but there's a lot more: All drm kms ioctl rely on being able to
> > > > put/get_user while holding modeset locks, so we really need a
> > > > might_fault in there too to complete the picture. Add it.
> > > Mhm, lockdep should be able to deduce that when there might be faults
> > > under the dma_resv lock there might also be faults under the
> > > drm_modeset_lock.
> > You're not allowed to take a fault under dma_resv, because drivers
> > might need to take that lock to handle faults. So unfortunately in our
> > combined lockdep priming, there really seems to be no chain yet that
> > teaches about faults possibly happening while holding
> > drm_modeset_lock.
> 
> Ah, of course! You are right, it was just the other way around.

Applied to drm-misc-next, thanks for your review.
-Sima

> 
> Thanks,
> Christian.
> 
> > -Sima
> > 
> > > > Motivated by a syzbot report that blew up on bcachefs doing an
> > > > unconditional console_lock way deep in the locking hierarchy, and
> > > > lockdep only noticing the depency loop in a drm ioctl instead of much
> > > > earlier. This annotation will make sure such issues have a much harder
> > > > time escaping.
> > > > 
> > > > References: https://lore.kernel.org/dri-devel/00000000000073db8b061cd43496@google.com/
> > > > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > > > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > > > Cc: Maxime Ripard <mripard@kernel.org>
> > > > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > > > Cc: Sumit Semwal <sumit.semwal@linaro.org>
> > > > Cc: "Christian König" <christian.koenig@amd.com>
> > > > Cc: linux-media@vger.kernel.org
> > > > Cc: linaro-mm-sig@lists.linaro.org
> > > On the other hand pointing it out explicitly doesn't hurts us at all, so
> > > Reviewed-by: Christian König <christian.koenig@amd.com>.
> > > 
> > > Regards,
> > > Christian.
> > > 
> > > > ---
> > > >    drivers/gpu/drm/drm_mode_config.c | 2 ++
> > > >    1 file changed, 2 insertions(+)
> > > > 
> > > > diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode_config.c
> > > > index 568972258222..37d2e0a4ef4b 100644
> > > > --- a/drivers/gpu/drm/drm_mode_config.c
> > > > +++ b/drivers/gpu/drm/drm_mode_config.c
> > > > @@ -456,6 +456,8 @@ int drmm_mode_config_init(struct drm_device *dev)
> > > >                if (ret == -EDEADLK)
> > > >                        ret = drm_modeset_backoff(&modeset_ctx);
> > > > 
> > > > +             might_fault();
> > > > +
> > > >                ww_acquire_init(&resv_ctx, &reservation_ww_class);
> > > >                ret = dma_resv_lock(&resv, &resv_ctx);
> > > >                if (ret == -EDEADLK)
> > 
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

