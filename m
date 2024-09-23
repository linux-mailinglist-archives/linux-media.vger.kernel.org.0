Return-Path: <linux-media+bounces-18464-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C024B97E9D4
	for <lists+linux-media@lfdr.de>; Mon, 23 Sep 2024 12:19:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EFB101C2115A
	for <lists+linux-media@lfdr.de>; Mon, 23 Sep 2024 10:19:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4310F19599C;
	Mon, 23 Sep 2024 10:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="JFVK5qSM"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE656195809;
	Mon, 23 Sep 2024 10:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727086740; cv=none; b=af8MgBHQZU41/mPMUx02/8QzXoHiPKFP8MnbDZUSyk8Y9+x8gHMcIC/EbyS2K6yi7TaTIxGkOYq7aOmhKelQic36AbrDHaAdvfxOE6UvLNmHUAS/PmZ8KRmaarYybGx3DuKR837p5Y2f1pkDlI05SQyQWb6aYmiMnEFZSCDllFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727086740; c=relaxed/simple;
	bh=FZPFPyImlZ9G/QZYUIY+wTwdbXvFKDdPVq5ZV7K2YM0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Xk0QFQUzvFZoZC+CL1cmGbCbORYH29PrdDEGJkD0qjKfwMbNEzAJ/S5k5AGg91fzaJ3C9ugljulerI/n++Gun2kwUuqQ2fwovyOAgV9QPYcSwLD4WiyjVefCxmg4e6VE8MVTjRV3tJmC2hD/bKy9RL35Hw1LVlF5VCEgUlvqkRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=JFVK5qSM; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1727086736;
	bh=FZPFPyImlZ9G/QZYUIY+wTwdbXvFKDdPVq5ZV7K2YM0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=JFVK5qSMFhRSItdTGbHWohtUZKut2/6jd9DE3PZ7by+BDMt6KhajR4rzAZkrcXLg1
	 yLRFcN7WYCTbvptb0Q//GQffpQngzTkCC3fEFgjuOKRWzx8HnrKpmNOavv2m4We9m4
	 xCbGDNyucriAtfaLUDiYP4KV78oyKB+orPEBocQweq/LbT8LWRRnDVK/eUzoHgDGvC
	 dZFYFzJDzgwf1ZchvQTRbccYhVxhOmxMIU4OXseJMleqmJX01IKTN/oA82lxW53Dh6
	 8KRxcEbTBlAGLSpbAUE5a9FETDlKkLfnVDgQDB+oe668aPT8aQ+9GIFKAHd3aGWuEC
	 HPSmZCeCDPR0Q==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id F3CF217E10D3;
	Mon, 23 Sep 2024 12:18:55 +0200 (CEST)
Date: Mon, 23 Sep 2024 12:18:50 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Steven Price <steven.price@arm.com>
Cc: =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>, Liviu
 Dudau <liviu.dudau@arm.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v7 1/5] drm/panthor: introduce job cycle and timestamp
 accounting
Message-ID: <20240923121850.38181059@collabora.com>
In-Reply-To: <07c8c715-4016-4963-8544-2e9cc1a8208b@arm.com>
References: <20240920234436.207563-1-adrian.larumbe@collabora.com>
	<20240920234436.207563-2-adrian.larumbe@collabora.com>
	<07c8c715-4016-4963-8544-2e9cc1a8208b@arm.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 23 Sep 2024 10:07:14 +0100
Steven Price <steven.price@arm.com> wrote:

> > +static struct dma_fence *
> > +queue_run_job(struct drm_sched_job *sched_job)
> > +{
> > +	struct panthor_job *job = container_of(sched_job, struct panthor_job, base);
> > +	struct panthor_group *group = job->group;
> > +	struct panthor_queue *queue = group->queues[job->queue_idx];
> > +	struct panthor_device *ptdev = group->ptdev;
> > +	struct panthor_scheduler *sched = ptdev->scheduler;
> > +	struct panthor_job_ringbuf_instrs instrs;  
> 
> instrs isn't initialised...
> 
> > +	struct panthor_job_cs_params cs_params;
> > +	struct dma_fence *done_fence;
> > +	int ret;
> >  
> >  	/* Stream size is zero, nothing to do except making sure all previously
> >  	 * submitted jobs are done before we signal the
> > @@ -2900,17 +3062,23 @@ queue_run_job(struct drm_sched_job *sched_job)
> >  		       queue->fence_ctx.id,
> >  		       atomic64_inc_return(&queue->fence_ctx.seqno));
> >  
> > -	memcpy(queue->ringbuf->kmap + ringbuf_insert,
> > -	       call_instrs, sizeof(call_instrs));
> > +	job->profiling.slot = queue->profiling.seqno++;
> > +	if (queue->profiling.seqno == queue->profiling.slot_count)
> > +		queue->profiling.seqno = 0;
> > +
> > +	job->ringbuf.start = queue->iface.input->insert;
> > +
> > +	get_job_cs_params(job, &cs_params);
> > +	prepare_job_instrs(&cs_params, &instrs);  
> 
> ...but it's passed into prepare_job_instrs() which depends on
> instrs.count (same bug as was in calc_job_credits()) - sorry I didn't
> spot it last review.

Hm, can't we initialize instr::count to zero in prepare_job_instrs()
instead?

