Return-Path: <linux-media+bounces-35094-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 355A0ADCFE5
	for <lists+linux-media@lfdr.de>; Tue, 17 Jun 2025 16:32:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4148418850F8
	for <lists+linux-media@lfdr.de>; Tue, 17 Jun 2025 14:25:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A69A2EF656;
	Tue, 17 Jun 2025 14:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="HkjTSDm5"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28C822EF64A
	for <linux-media@vger.kernel.org>; Tue, 17 Jun 2025 14:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750170314; cv=none; b=UXmdgZ0kv8ZdFY9NMVw59DofXrSNrUy1I6ED5fZRBdoOHLxv2hr68GDMjxHvKxGNxGd9ll8+5e/LHzK8bgpdFEjaUuplJzOyEJURj12TD6zqrkDSUMJSJM+dkhFTKQo+h+K82uuMghWeCuUFvUAdOjDRIQYywf0vnVPN4gldWTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750170314; c=relaxed/simple;
	bh=MJVh9FqFD3KJCh1Pp9qSs5ITe7Bdy58pKCW4efESyDc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tlK5400Ae+eAeFmB4baNZfg4CVzLjHs2Od53UjTFJFSxHGidTYcgMeKQSodtGdlDWxqeSvqivsZgBWjzvRG0PmCIPsxN8rq/nNOuaR6icnoM5qr/axe7YbdQmam040OPGTaDoE9/Bkvo4NYAXCD5rX1H8U2OXqtrURpvIc3tBcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=HkjTSDm5; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a507e88b0aso5632935f8f.1
        for <linux-media@vger.kernel.org>; Tue, 17 Jun 2025 07:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1750170311; x=1750775111; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XXt3dy96emDfUbi5YZOyss2yuwnnqq07rcmYyztRQSY=;
        b=HkjTSDm56M1RXnax/YZpIqRl69wafE///BIz0HQYmHIb4wN43hxE8R47tK+DbzUyaH
         PI0eBQvWEjdEV+YBfpiYLl2h5EOWhFoPWsa2e3ynDruSgde9QP674K2dW1ZxcnL9k0h3
         UsOaDdbaMw1XnwxC7gE6AHodyOJG6ITgJjhHs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750170311; x=1750775111;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XXt3dy96emDfUbi5YZOyss2yuwnnqq07rcmYyztRQSY=;
        b=TpYEPVAML2jr9kDNa1RNGwNUZrS/znevgfLjQVvmIQhWbI1fhfBTxk/0E2x5mNFr7b
         vaEZ+tXD9Sw4vG/nrp7bNjXZv1stGjRFmEH3tZR6yF4Hl8AtL11fUZYLoUekYOZgNYy3
         tlXMCtQV9D77n6QnS396ZX7Zyk+AWKcbcjLSSaAcGkdTxorc45w69za9SZDYtpPnNZL8
         0xLLIiv6+3OvXaJGQkEazQLzASxkXQ5JvSqt0gn8U/2jAaTSORKU5ElNN2sR9QBKY4rh
         rg7IJlOJkRoHY2CJH6GQSE7aDNTmLccjdXmZubvrw7SyF3f9aTnbQYGQR6Qx2xZ5JqLa
         v9XA==
X-Forwarded-Encrypted: i=1; AJvYcCVQNW05h2v1KFr3SJwcWNmntRVZJOqFgp4Xfc2X681/lUkK+t9gVcknOIjVTSZE9c9IiLa3VwXcUg1sGQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxdFPlcuQhAvnlfrJ0BUJa5val0xgXHNMdq4F/me5yW9PdAiPPD
	kbnPRWPE2yj4ciajEw1yqNQ/30InFjeyENn0zMpi/eQhzqXQFZ3P6JbNuEJayr7SU1o=
X-Gm-Gg: ASbGncvrVMkqYj15Tm7NvCTgHTBB2dsLh1XnX584lTt20bD8v0fnyghltFT4m04H2/k
	egoN2KIrQxqsnNWmCCnD/McQCC1rdIR2b8yLgPPa09OffqC0SwRLTncVbwrmNx8GrJrC4WtmbZ5
	cukB5ScW2NzXPZfLPR2Fj7QVBF+LTODZt5vHUqhrMcEkBKbu4WZ7nJWMU3Ueo8bCzIKTJgiRKE8
	3Dw1E1nP7fklSStdih49qdneXSZxusmAQ24ymRrF1hgzbKY1cqsGrjLs6w1XeI9/SVZXUuXw30S
	IMhKS6geytJrMf5B+i95QpfaBsq4mssy6SrcfVc/DXCuNDZc3VC9ULTFkLGMxEYOBQe2Bicr4Q=
	=
X-Google-Smtp-Source: AGHT+IEbdYZbQa6vrYSOaM4WdmPVqMOqkP9lVIxOcii3jXSSMba4JKehblrgcpHlbRQBeXzMM6KpFQ==
X-Received: by 2002:a5d:64ee:0:b0:3a4:e1e1:7779 with SMTP id ffacd0b85a97d-3a5723a2be9mr10791911f8f.32.1750170311421;
        Tue, 17 Jun 2025 07:25:11 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b1bc97sm14245947f8f.68.2025.06.17.07.25.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 07:25:10 -0700 (PDT)
Date: Tue, 17 Jun 2025 16:25:09 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Philipp Stanner <phasta@kernel.org>,
	Matthew Brost <matthew.brost@intel.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: Re: [PATCH v2] drm/sched: Clarify scenarios for separate workqueues
Message-ID: <aFF6xeu78cXTGFH0@phenom.ffwll.local>
Mail-Followup-To: Danilo Krummrich <dakr@kernel.org>,
	Philipp Stanner <phasta@kernel.org>,
	Matthew Brost <matthew.brost@intel.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
References: <20250612144953.111829-2-phasta@kernel.org>
 <aFFy5aG1eOeMU44S@phenom.ffwll.local>
 <aFF3YIAFkgsAKvQV@pollux>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aFF3YIAFkgsAKvQV@pollux>
X-Operating-System: Linux phenom 6.12.30-amd64 

On Tue, Jun 17, 2025 at 04:10:40PM +0200, Danilo Krummrich wrote:
> On Tue, Jun 17, 2025 at 03:51:33PM +0200, Simona Vetter wrote:
> > On Thu, Jun 12, 2025 at 04:49:54PM +0200, Philipp Stanner wrote:
> > > + * NOTE that sharing &struct drm_sched_init_args.submit_wq with the driver
> > > + * theoretically can deadlock. It must be guaranteed that submit_wq never has
> > > + * more than max_active - 1 active tasks, or if max_active tasks are reached at
> > > + * least one of them does not execute operations that may block on dma_fences
> > > + * that potentially make progress through this scheduler instance. Otherwise,
> > > + * it is possible that all max_active tasks end up waiting on a dma_fence (that
> > > + * can only make progress through this schduler instance), while the
> > > + * scheduler's queued work waits for at least one of the max_active tasks to
> > > + * finish. Thus, this can result in a deadlock.
> > 
> > Uh if you have an ordered wq you deadlock with just one misuse. I'd just
> > explain that the wq must provide sufficient forward-progress guarantees
> > for the scheduler, specifically that it's on the dma_fence signalling
> > critical path and leave the concrete examples for people to figure out
> > when the design a specific locking scheme.
> 
> This isn't a concrete example, is it? It's exactly what you say in slightly
> different words, with the addition of highlighting the impact of the workqueue's
> max_active configuration.
> 
> I think that's relevant, because N - 1 active tasks can be on the dma_fence
> signalling critical path without issues.
> 
> We could change
> 
> 	"if max_active tasks are reached at least one of them must not execute
> 	 operations that may block on dma_fences that potentially make progress
> 	 through this scheduler instance"
> 
> to 
> 
> 	"if max_active tasks are reached at least one of them must not be on the
> 	 dma_fence signalling critical path"
> 
> which is a bit more to the point I think.

My point was to more state that the wq must be suitable for the scheduler
jobs as the general issue, and specifically then also highlight the
dma_fence concurrency issue. But it's not the only one, you can have
driver locks and other fun involved here too.

Also since all the paragraphs above talk about ordered wq as the example
where specifying your own wq makes sense, it's a bit confusing to now
suddenly only talk about the concurrent wq case without again mentioned
that the ordered wq case is really limited.
-Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

