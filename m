Return-Path: <linux-media+bounces-5302-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 15A8D8582B3
	for <lists+linux-media@lfdr.de>; Fri, 16 Feb 2024 17:37:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A7C2D1F23062
	for <lists+linux-media@lfdr.de>; Fri, 16 Feb 2024 16:37:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FBCC12FF8D;
	Fri, 16 Feb 2024 16:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="ACMZFYzH"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CA6C12F39F
	for <linux-media@vger.kernel.org>; Fri, 16 Feb 2024 16:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708101450; cv=none; b=jdqOkqsqH8l1v8gFZV+EMGeHI0RUpwtGOdHGNJYbza5K1h8SQ9+3Fuomb2kZYHz3KqxYyku3qoplCVc6vksIvN7mST0NEHms0aNf2GkpaluHqLQlgpeKzsnBg0CUNrKN/W9/qeRNeWVWo3nt7yMw10K/K1SYSGWrZte1rj658yI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708101450; c=relaxed/simple;
	bh=vgLUcLFqapR2ucxfBmF5IVhNPZSccxKOa8SDdfQtlpk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DxOgEFovusudH1x4fiqQMSQiQoirksqmT435nM/uvp/TFpfOwaOEaCmKoG1RmoQMPQzGLOjFk8pEnuORSSWEANsXqk5WjGaOCRIMsWqAgVCW5Fjs19e5RXXrEMIme5XUAU0ABF3qPynbVQ1WIZXQFwsEXiXEM75wxT6+rvWlwOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=ACMZFYzH; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2d0ca40aafaso5819081fa.0
        for <linux-media@vger.kernel.org>; Fri, 16 Feb 2024 08:37:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1708101446; x=1708706246; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2BJidT3hS5vkgQ0xTVUzjojqrGFxsDATBuEs0RRAQ6o=;
        b=ACMZFYzH4y8s2QEamAXqWpeslhLhHFhmtSh4wqnOPsvEl98cehf0ZNP1tvrZ82x7wF
         cuDc0mKWfK+rK0tyg62ih0svO8eO1sUxzQuZ0kIKYpCQim6R0qbbIB1nHS8bMNVFOra+
         qathW+wMwUR1jRdLHqqJelSGQnB0KSsmbtMVo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708101446; x=1708706246;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2BJidT3hS5vkgQ0xTVUzjojqrGFxsDATBuEs0RRAQ6o=;
        b=bScdDLTxacFSSwAapxowGtOKDoYN42TybJ4V1YE5HFY+Zyg1qAsFoqcKt9VaNTUtsa
         QsClHa2PgdQvSVMk/JLZvc6f8G8q733O03SD4bqicaljOLDOodBL63/e+JUG8DNs/b+Q
         ftt65ij8F2vTyScwN35a+5QU6914v5dUunZW5CGzFVGObASNCTqB0en/nOR7Quw8R2g7
         GCMn4QY7I62pvZaRbl5+cgKSlf0g4gKj/rpdg2SqB+6FPMo/UaofkR2Gf9jcB5tKsnDJ
         dmnjMdE/rXLi8A03rNoIW/leaY/TMavuwvat+MVAHnWGsnVo9tsUju6DH7+XMEs4bLTq
         BzSA==
X-Forwarded-Encrypted: i=1; AJvYcCWDHsapgOkXowSnVRmeSvFIEx9UXA1xDZ0aK41ufY5HEhEMGGX2ymGeLo2dBieu3+RRZoiDxV9VhUxT46KiORoXgAgVzCnhpEE0LWw=
X-Gm-Message-State: AOJu0YwbvQhXw9Rl5kPnF/qrx7ELowrOPTuWL4+J6C9n58bEGUjwOGo8
	rPguGKjh50lA7n6kLfZBkCdRvUBF1Ww882/tGoQvmH5XP48abkKBuqq2NYR5c7k=
X-Google-Smtp-Source: AGHT+IGS0GDo5tChpTazykXSgETAvi5nJVe9c/sifb50z1ANJBtBWxRUCH2PLe/YXqHGMMtGcrzHyw==
X-Received: by 2002:a2e:a9a6:0:b0:2d2:233f:1ae0 with SMTP id x38-20020a2ea9a6000000b002d2233f1ae0mr247313ljq.1.1708101446154;
        Fri, 16 Feb 2024 08:37:26 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id bg22-20020a05600c3c9600b0040fc56712e8sm2881166wmb.17.2024.02.16.08.37.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 08:37:25 -0800 (PST)
Date: Fri, 16 Feb 2024 17:37:23 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Gustavo Padovan <gustavo@padovan.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	Alex Deucher <alexander.deucher@amd.com>,
	amd-gfx@lists.freedesktop.org
Subject: Re: [PATCH v2 6/6] drm: add drm_mode_atomic_commit event
Message-ID: <Zc-PQ9Yx4fk4TK43@phenom.ffwll.local>
References: <20240117184329.479554-1-pierre-eric.pelloux-prayer@amd.com>
 <20240213155112.156537-1-pierre-eric.pelloux-prayer@amd.com>
 <20240213155112.156537-7-pierre-eric.pelloux-prayer@amd.com>
 <20240213112017.726016f0@gandalf.local.home>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240213112017.726016f0@gandalf.local.home>
X-Operating-System: Linux phenom 6.6.11-amd64 

On Tue, Feb 13, 2024 at 11:20:17AM -0500, Steven Rostedt wrote:
> On Tue, 13 Feb 2024 16:50:31 +0100
> Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com> wrote:
> 
> > @@ -1503,6 +1504,24 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
> >  		drm_mode_object_put(obj);
> >  	}
> >  
> > +	if (trace_drm_mode_atomic_commit_enabled()) {
> > +		struct drm_crtc_state *crtc_state;
> > +		struct drm_crtc *crtc;
> > +		int *crtcs;
> > +		int i, num_crtcs;
> > +
> > +		crtcs = kcalloc(dev->mode_config.num_crtc, sizeof(int),
> > +				GFP_KERNEL);
> 
> If the above allocation fails, this will cause a NULL kernel dereference.

Yeah can't we somehow iterate directly into the trace subsystem? If
nothing else works I guess just a per-crtc event should do.

The more fundamental issue: I don't get how this works. For atomic we
have:
- explicitly handed in in-fences as dependencies with the IN_FENCE
  property
- dependencies that drivers fish out of the dma_resv object of the
  underlying gem buffer objects for each framebuffer. That has become
  pretty much entirely generic code since everyone uses the same, and so
  imo the dependency tracking should be fully generic too

- atomic has an out-fence too, so we could even do the full fence->fence
  dependency tracking. It's just not created as a userspace object if all
  userspace asks for is a drm vblank event, but it is very much there. And
  I think if you want fence tracking, we really should have fence tracking
  :-) Also the out-fence should be 100% generic (or it's a driver bug)
  because the driver functions hide the differences between generating a
  vblank event and signalling a dma_fence.

Cheers, Sima


> 
> -- Steve
> 
> > +
> > +		num_crtcs = 0;
> > +		for_each_new_crtc_in_state(state, crtc, crtc_state, i)
> > +			crtcs[num_crtcs++] = drm_crtc_index(crtc);
> > +
> > +		trace_drm_mode_atomic_commit(file_priv, crtcs, num_crtcs, arg->flags);
> > +
> > +		kfree(crtcs);
> > +	}
> > +
> >  	ret = prepare_signaling(dev, state, arg, file_priv, &fence_state,
> >  				&num_fences);
> >  	if (ret)

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

