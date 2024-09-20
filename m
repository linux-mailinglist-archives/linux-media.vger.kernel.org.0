Return-Path: <linux-media+bounces-18423-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 435CF97DAA1
	for <lists+linux-media@lfdr.de>; Sat, 21 Sep 2024 00:37:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6DEAB1C20E37
	for <lists+linux-media@lfdr.de>; Fri, 20 Sep 2024 22:37:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC89318CBFA;
	Fri, 20 Sep 2024 22:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="B78NB5L6"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1246178383;
	Fri, 20 Sep 2024 22:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726871794; cv=pass; b=FPzTgSj3nMRwPHypGLdJ77pTiCTgypFRevC6bluloorDGkXT/En+ZSnUAsJCC218MPZ5qMFKQ1GWKHA9KwmZuFqAQmtgS0IOM7ZWvtuOLAGiwM+fK1nvz1O50BW+mBCVF4d4zCtRaEfbI4AldVZ2WRzq1VOJ0wG/gcDKxyeTEnk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726871794; c=relaxed/simple;
	bh=Zj/mtaZFtjvtr2j9L/6A4G1H/T7xxcaSv6a5i/0cedI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RRkBPKTAX5i2S03mW0krdc9OkE4dloKaN5dzU0OLOIAiAoSGgiQCJnEC1p8regiuwotAmAzy1zgJmcgxZPWtJor/mje8TqVmkk9tvHtuEIhDq/E/wq3DwR9bYFW1eRug8m3ASCiqKqL6OovbU5nXvmpLH1d3QXo+l59BQWdnpUk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b=B78NB5L6; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1726871770; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=P39SQDEUV0Z6Bue3QTuEfV61wMljhNZbC3sZVwgEt44G9QGipBwPgrxwNhM3QHdOioDry5CI1VnndmXLLD1MPpumJlT9hcuh8/sDBI+l0LDngZYGBULPLJy/h6J8Dva3LD63krgz3RzIGS85pMy+H5MSjhQZrWSG96v1njc22mk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1726871770; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=WIBHyQeIyGxDzXLLSOLQzsrlM1w3lRDmuabeOYlBefI=; 
	b=mFACAKA+0onI9DLMQoMsDRd6jHfgXIWSdUqlZfMsQ+109i4GDqrfO1xeIoTAfyleg6g+qSn6uI1vkJKNtf/PdiPC6F28KE+AwhLAP89/Ia84Xx6uRe20ZcDJMbQg8/QtEK1hkH+9RNbuggTDIk9QLYS1SZgjyIjLVxpDL0T6J50=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
	dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1726871770;
	s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:Message-Id:Reply-To;
	bh=WIBHyQeIyGxDzXLLSOLQzsrlM1w3lRDmuabeOYlBefI=;
	b=B78NB5L6Gk4ikO9EFW4cB7cBmwcUBLRZX3jxsJxazSRfVXhwRgOPz3UmSy7mKJcJ
	mEfQXTBRvQv16xCFoiAR+PyUar9wTR28USFvvncTVRQ5WrV1hyY3rZhOtZqyoNuhwdM
	Qg3eeOThxua48JtLDHAl3C844oLp1x/JQqHAgRkA=
Received: by mx.zohomail.com with SMTPS id 1726871768562805.09469367683;
	Fri, 20 Sep 2024 15:36:08 -0700 (PDT)
Date: Fri, 20 Sep 2024 23:36:03 +0100
From: =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>
To: Steven Price <steven.price@arm.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>, 
	Liviu Dudau <liviu.dudau@arm.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
	kernel@collabora.com, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v6 1/5] drm/panthor: introduce job cycle and timestamp
 accounting
Message-ID: <bq6lctwgpsxvrdaajmjo3xdjt32srmsxvjhtzyebdj6izjzoaw@6duby4axg3pf>
References: <5c4d1008-261f-4c47-ab73-c527675484a4@arm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5c4d1008-261f-4c47-ab73-c527675484a4@arm.com>

Hi Steve, thanks for the review.

I've applied all of your suggestions for the next patch series revision, so I'll
only be answering to your question about the calc_profiling_ringbuf_num_slots
function further down below.

On 16.09.2024 12:15, Steven Price wrote:
> On 13/09/2024 13:42, Adrián Larumbe wrote:
> > Enable calculations of job submission times in clock cycles and wall
> > time. This is done by expanding the boilerplate command stream when running
> > a job to include instructions that compute said times right before and
> > after a user CS.
> > 
> > A separate kernel BO is created per queue to store those values. Jobs can
> > access their sampled data through an index different from that of the
> > queue's ringbuffer. The reason for this is saving memory on the profiling
> > information kernel BO, since the amount of simultaneous profiled jobs we
> > can write into the queue's ringbuffer might be much smaller than for
> > regular jobs, as the former take more CSF instructions.
> > 
> > This commit is done in preparation for enabling DRM fdinfo support in the
> > Panthor driver, which depends on the numbers calculated herein.
> > 
> > A profile mode mask has been added that will in a future commit allow UM to
> > toggle performance metric sampling behaviour, which is disabled by default
> > to save power. When a ringbuffer CS is constructed, timestamp and cycling
> > sampling instructions are added depending on the enabled flags in the
> > profiling mask.
> > 
> > A helper was provided that calculates the number of instructions for a
> > given set of enablement mask, and these are passed as the number of credits
> > when initialising a DRM scheduler job.
> > 
> > Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
> > Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> > Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
> 
> Sorry I've been a bit slow about reviewing this. The kernel bot has
> pointed out a few minor issues and there's a few more below.
> 
> > ---
> >  drivers/gpu/drm/panthor/panthor_device.h |  22 ++
> >  drivers/gpu/drm/panthor/panthor_sched.c  | 337 ++++++++++++++++++++---
> >  2 files changed, 315 insertions(+), 44 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
> > index e388c0472ba7..a48e30d0af30 100644
> > --- a/drivers/gpu/drm/panthor/panthor_device.h
> > +++ b/drivers/gpu/drm/panthor/panthor_device.h
> > @@ -66,6 +66,25 @@ struct panthor_irq {
> >  	atomic_t suspended;
> >  };
> >  
> > +/**
> > + * enum panthor_device_profiling_mode - Profiling state
> > + */
> > +enum panthor_device_profiling_flags {
> > +	/** @PANTHOR_DEVICE_PROFILING_DISABLED: Profiling is disabled. */
> > +	PANTHOR_DEVICE_PROFILING_DISABLED = 0,
> > +
> > +	/** @PANTHOR_DEVICE_PROFILING_CYCLES: Sampling job cycles. */
> > +	PANTHOR_DEVICE_PROFILING_CYCLES = BIT(0),
> > +
> > +	/** @PANTHOR_DEVICE_PROFILING_TIMESTAMP: Sampling job timestamp. */
> > +	PANTHOR_DEVICE_PROFILING_TIMESTAMP = BIT(1),
> > +
> > +	/** @PANTHOR_DEVICE_PROFILING_ALL: Sampling everything. */
> > +	PANTHOR_DEVICE_PROFILING_ALL =
> > +	PANTHOR_DEVICE_PROFILING_CYCLES |
> > +	PANTHOR_DEVICE_PROFILING_TIMESTAMP,
> > +};
> > +
> >  /**
> >   * struct panthor_device - Panthor device
> >   */
> > @@ -162,6 +181,9 @@ struct panthor_device {
> >  		 */
> >  		struct page *dummy_latest_flush;
> >  	} pm;
> > +
> > +	/** @profile_mask: User-set profiling flags for job accounting. */
> > +	u32 profile_mask;
> >  };
> >  
> >  /**
> > diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
> > index 42afdf0ddb7e..bcba52558f1e 100644
> > --- a/drivers/gpu/drm/panthor/panthor_sched.c
> > +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> > @@ -93,6 +93,9 @@
> >  #define MIN_CSGS				3
> >  #define MAX_CSG_PRIO				0xf
> >  
> > +#define NUM_INSTRS_PER_CACHE_LINE		(64 / sizeof(u64))
> > +#define MAX_INSTRS_PER_JOB			24
> > +
> >  struct panthor_group;
> >  
> >  /**
> > @@ -476,6 +479,18 @@ struct panthor_queue {
> >  		 */
> >  		struct list_head in_flight_jobs;
> >  	} fence_ctx;
> > +
> > +	/** @profiling_info: Job profiling data slots and access information. */
> 
> kerneldoc name doesn't match: s/profiling_info/profiling/
> 
> > +	struct {
> > +		/** @slots: Kernel BO holding the slots. */
> > +		struct panthor_kernel_bo *slots;
> > +
> > +		/** @slot_count: Number of jobs ringbuffer can hold at once. */
> > +		u32 slot_count;
> > +
> > +		/** @profiling_seqno: Index of the next available profiling information slot. */
> 
> s/profiling_seqno/seqno/
> 
> > +		u32 seqno;
> > +	} profiling;
> >  };
> >  
> >  /**
> > @@ -661,6 +676,18 @@ struct panthor_group {
> >  	struct list_head wait_node;
> >  };
> >  
> > +struct panthor_job_profiling_data {
> > +	struct {
> > +		u64 before;
> > +		u64 after;
> > +	} cycles;
> > +
> > +	struct {
> > +		u64 before;
> > +		u64 after;
> > +	} time;
> > +};
> > +
> >  /**
> >   * group_queue_work() - Queue a group work
> >   * @group: Group to queue the work for.
> > @@ -774,6 +801,15 @@ struct panthor_job {
> >  
> >  	/** @done_fence: Fence signaled when the job is finished or cancelled. */
> >  	struct dma_fence *done_fence;
> > +
> > +	/** @profiling: Job profiling information. */
> > +	struct {
> > +		/** @mask: Current device job profiling enablement bitmask. */
> > +		u32 mask;
> > +
> > +		/** @slot: Job index in the profiling slots BO. */
> > +		u32 slot;
> > +	} profiling;
> >  };
> >  
> >  static void
> > @@ -838,6 +874,7 @@ static void group_free_queue(struct panthor_group *group, struct panthor_queue *
> >  
> >  	panthor_kernel_bo_destroy(queue->ringbuf);
> >  	panthor_kernel_bo_destroy(queue->iface.mem);
> > +	panthor_kernel_bo_destroy(queue->profiling.slots);
> >  
> >  	/* Release the last_fence we were holding, if any. */
> >  	dma_fence_put(queue->fence_ctx.last_fence);
> > @@ -1982,8 +2019,6 @@ tick_ctx_init(struct panthor_scheduler *sched,
> >  	}
> >  }
> >  
> > -#define NUM_INSTRS_PER_SLOT		16
> > -
> >  static void
> >  group_term_post_processing(struct panthor_group *group)
> >  {
> > @@ -2815,65 +2850,211 @@ static void group_sync_upd_work(struct work_struct *work)
> >  	group_put(group);
> >  }
> >  
> > -static struct dma_fence *
> > -queue_run_job(struct drm_sched_job *sched_job)
> > +struct panthor_job_ringbuf_instrs {
> > +	u64 buffer[MAX_INSTRS_PER_JOB];
> > +	u32 count;
> > +};
> > +
> > +struct panthor_job_instr {
> > +	u32 profile_mask;
> > +	u64 instr;
> > +};
> > +
> > +#define JOB_INSTR(__prof, __instr) \
> > +	{ \
> > +		.profile_mask = __prof, \
> > +		.instr = __instr, \
> > +	}
> > +
> > +static void
> > +copy_instrs_to_ringbuf(struct panthor_queue *queue,
> > +		       struct panthor_job *job,
> > +		       struct panthor_job_ringbuf_instrs *instrs)
> > +{
> > +	ssize_t ringbuf_size = panthor_kernel_bo_size(queue->ringbuf);
> > +	u32 start = job->ringbuf.start & (ringbuf_size - 1);
> > +	ssize_t size, written;
> > +
> > +	/*
> > +	 * We need to write a whole slot, including any trailing zeroes
> > +	 * that may come at the end of it. Also, because instrs.buffer has
> > +	 * been zero-initialised, there's no need to pad it with 0's
> > +	 */
> > +	instrs->count = ALIGN(instrs->count, NUM_INSTRS_PER_CACHE_LINE);
> > +	size = instrs->count * sizeof(u64);
> > +	written = min(ringbuf_size - start, size);
> 
> This causes a signedness error - I think the easiest thing is to just
> make size/written unsigned.
> 
> You might also want to consider a WARN_ON(size > ringbuf_size) or
> similar to catch that (impossible) case which would cause the below
> logic to fail.
> 
> > +
> > +	memcpy(queue->ringbuf->kmap + start, instrs->buffer, written);
> > +
> > +	if (written < size)
> > +		memcpy(queue->ringbuf->kmap,
> > +		       &instrs->buffer[(ringbuf_size - start)/sizeof(u64)],
> 
>                                         ^^^^^^^^^^^^^^^^^^^^
> I believe this is equal to 'written', so this can be rewritten as:
> 
> +		       &instrs->buffer[written / sizeof(u64)],
> 
> which I find clearer, especially since you've used 'written' just below.
> 
> > +		       size - written);
> > +}
> > +
> > +struct panthor_job_cs_params {
> > +	u32 profile_mask;
> > +	u64 addr_reg; u64 val_reg;
> > +	u64 cycle_reg; u64 time_reg;
> > +	u64 sync_addr; u64 times_addr;
> > +	u64 cs_start; u64 cs_size;
> > +	u32 last_flush; u32 waitall_mask;
> > +};
> > +
> > +static void
> > +get_job_cs_params(struct panthor_job *job, struct panthor_job_cs_params *params)
> >  {
> > -	struct panthor_job *job = container_of(sched_job, struct panthor_job, base);
> >  	struct panthor_group *group = job->group;
> >  	struct panthor_queue *queue = group->queues[job->queue_idx];
> >  	struct panthor_device *ptdev = group->ptdev;
> >  	struct panthor_scheduler *sched = ptdev->scheduler;
> > -	u32 ringbuf_size = panthor_kernel_bo_size(queue->ringbuf);
> > -	u32 ringbuf_insert = queue->iface.input->insert & (ringbuf_size - 1);
> > -	u64 addr_reg = ptdev->csif_info.cs_reg_count -
> > -		       ptdev->csif_info.unpreserved_cs_reg_count;
> > -	u64 val_reg = addr_reg + 2;
> > -	u64 sync_addr = panthor_kernel_bo_gpuva(group->syncobjs) +
> > -			job->queue_idx * sizeof(struct panthor_syncobj_64b);
> > -	u32 waitall_mask = GENMASK(sched->sb_slot_count - 1, 0);
> > -	struct dma_fence *done_fence;
> > -	int ret;
> >  
> > -	u64 call_instrs[NUM_INSTRS_PER_SLOT] = {
> > +	params->addr_reg = ptdev->csif_info.cs_reg_count -
> > +			   ptdev->csif_info.unpreserved_cs_reg_count;
> > +	params->val_reg = params->addr_reg + 2;
> > +	params->cycle_reg = params->addr_reg;
> > +	params->time_reg = params->val_reg;
> > +
> > +	params->sync_addr = panthor_kernel_bo_gpuva(group->syncobjs) +
> > +			    job->queue_idx * sizeof(struct panthor_syncobj_64b);
> > +	params->times_addr = panthor_kernel_bo_gpuva(queue->profiling.slots) +
> > +			     (job->profiling.slot * sizeof(struct panthor_job_profiling_data));
> > +	params->waitall_mask = GENMASK(sched->sb_slot_count - 1, 0);
> > +
> > +	params->cs_start = job->call_info.start;
> > +	params->cs_size = job->call_info.size;
> > +	params->last_flush = job->call_info.latest_flush;
> > +
> > +	params->profile_mask = job->profiling.mask;
> > +}
> > +
> > +static void
> > +prepare_job_instrs(const struct panthor_job_cs_params *params,
> > +		   struct panthor_job_ringbuf_instrs *instrs)
> > +{
> > +	const struct panthor_job_instr instr_seq[] = {
> >  		/* MOV32 rX+2, cs.latest_flush */
> > -		(2ull << 56) | (val_reg << 48) | job->call_info.latest_flush,
> > +		JOB_INSTR(PANTHOR_DEVICE_PROFILING_DISABLED,
> > +			  (2ull << 56) | (params->val_reg << 48) | params->last_flush),
> >  
> >  		/* FLUSH_CACHE2.clean_inv_all.no_wait.signal(0) rX+2 */
> > -		(36ull << 56) | (0ull << 48) | (val_reg << 40) | (0 << 16) | 0x233,
> > +		JOB_INSTR(PANTHOR_DEVICE_PROFILING_DISABLED,
> > +			  (36ull << 56) | (0ull << 48) | (params->val_reg << 40) | (0 << 16) | 0x233),
> > +
> > +		/* MOV48 rX:rX+1, cycles_offset */
> > +		JOB_INSTR(PANTHOR_DEVICE_PROFILING_CYCLES,
> > +			  (1ull << 56) | (params->cycle_reg << 48) |
> > +			  (params->times_addr +
> > +			   offsetof(struct panthor_job_profiling_data, cycles.before))),
> > +		/* STORE_STATE cycles */
> > +		JOB_INSTR(PANTHOR_DEVICE_PROFILING_CYCLES,
> > +			  (40ull << 56) | (params->cycle_reg << 40) | (1ll << 32)),
> > +		/* MOV48 rX:rX+1, time_offset */
> > +		JOB_INSTR(PANTHOR_DEVICE_PROFILING_TIMESTAMP,
> > +			  (1ull << 56) | (params->time_reg << 48) |
> > +			  (params->times_addr +
> > +			   offsetof(struct panthor_job_profiling_data, time.before))),
> > +		/* STORE_STATE timer */
> > +		JOB_INSTR(PANTHOR_DEVICE_PROFILING_TIMESTAMP,
> > +			  (40ull << 56) | (params->time_reg << 40) | (0ll << 32)),
> >  
> >  		/* MOV48 rX:rX+1, cs.start */
> > -		(1ull << 56) | (addr_reg << 48) | job->call_info.start,
> > -
> > +		JOB_INSTR(PANTHOR_DEVICE_PROFILING_DISABLED,
> > +			  (1ull << 56) | (params->addr_reg << 48) | params->cs_start),
> >  		/* MOV32 rX+2, cs.size */
> > -		(2ull << 56) | (val_reg << 48) | job->call_info.size,
> > -
> > +		JOB_INSTR(PANTHOR_DEVICE_PROFILING_DISABLED,
> > +			  (2ull << 56) | (params->val_reg << 48) | params->cs_size),
> >  		/* WAIT(0) => waits for FLUSH_CACHE2 instruction */
> > -		(3ull << 56) | (1 << 16),
> > -
> > +		JOB_INSTR(PANTHOR_DEVICE_PROFILING_DISABLED, (3ull << 56) | (1 << 16)),
> >  		/* CALL rX:rX+1, rX+2 */
> > -		(32ull << 56) | (addr_reg << 40) | (val_reg << 32),
> > +		JOB_INSTR(PANTHOR_DEVICE_PROFILING_DISABLED,
> > +			  (32ull << 56) | (params->addr_reg << 40) | (params->val_reg << 32)),
> > +
> > +		/* MOV48 rX:rX+1, cycles_offset */
> > +		JOB_INSTR(PANTHOR_DEVICE_PROFILING_CYCLES,
> > +			  (1ull << 56) | (params->cycle_reg << 48) |
> > +			  (params->times_addr +
> > +			   offsetof(struct panthor_job_profiling_data, cycles.after))),
> > +		/* STORE_STATE cycles */
> > +		JOB_INSTR(PANTHOR_DEVICE_PROFILING_CYCLES,
> > +			  (40ull << 56) | (params->cycle_reg << 40) | (1ll << 32)),
> > +
> > +		/* MOV48 rX:rX+1, time_offset */
> > +		JOB_INSTR(PANTHOR_DEVICE_PROFILING_TIMESTAMP,
> > +			  (1ull << 56) | (params->time_reg << 48) |
> > +			  (params->times_addr +
> > +			   offsetof(struct panthor_job_profiling_data, time.after))),
> > +		/* STORE_STATE timer */
> > +		JOB_INSTR(PANTHOR_DEVICE_PROFILING_TIMESTAMP,
> > +			  (40ull << 56) | (params->time_reg << 40) | (0ll << 32)),
> >  
> >  		/* MOV48 rX:rX+1, sync_addr */
> > -		(1ull << 56) | (addr_reg << 48) | sync_addr,
> > -
> > +		JOB_INSTR(PANTHOR_DEVICE_PROFILING_DISABLED,
> > +			  (1ull << 56) | (params->addr_reg << 48) | params->sync_addr),
> >  		/* MOV48 rX+2, #1 */
> > -		(1ull << 56) | (val_reg << 48) | 1,
> > -
> > +		JOB_INSTR(PANTHOR_DEVICE_PROFILING_DISABLED,
> > +			  (1ull << 56) | (params->val_reg << 48) | 1),
> >  		/* WAIT(all) */
> > -		(3ull << 56) | (waitall_mask << 16),
> > -
> > +		JOB_INSTR(PANTHOR_DEVICE_PROFILING_DISABLED,
> > +			  (3ull << 56) | (params->waitall_mask << 16)),
> >  		/* SYNC_ADD64.system_scope.propage_err.nowait rX:rX+1, rX+2*/
> > -		(51ull << 56) | (0ull << 48) | (addr_reg << 40) | (val_reg << 32) | (0 << 16) | 1,
> > -
> > +		JOB_INSTR(PANTHOR_DEVICE_PROFILING_DISABLED,
> > +			  (51ull << 56) | (0ull << 48) | (params->addr_reg << 40) |
> > +			  (params->val_reg << 32) | (0 << 16) | 1),
> >  		/* ERROR_BARRIER, so we can recover from faults at job
> >  		 * boundaries.
> >  		 */
> > -		(47ull << 56),
> > +		JOB_INSTR(PANTHOR_DEVICE_PROFILING_DISABLED, (47ull << 56)),
> 
> Personally I think this would be easier to read if instead of using
> JOB_INSTR directly we define a few extra helper macros of the below form:
> 
> #define JOB_INSTR_ALWAYS(instr) \
> 	JOB_INSTR(PANTHOR_DEVICE_PROFILING_DISABLED, instr)
> #define JOB_INSTR_TIMESTAMP(instr) \
> 	JOB_INSTR(PANTHOR_DEVICE_PROFILING_TIMESTAMP, instr)
> #define JOB_INSTR_CYCLES(instr) \
> 	JOB_INSTR(PANTHOR_DEVICE_PROFILING_CYCLES, instr)
> 
> In particular I think the ...PROFILING_DISABLED flag is somewhat
> confusing because actually means "always" not only when profiling is
> disabled.
> 
> > +	};
> > +	u32 pad;
> > +
> > +	/* NEED to be cacheline aligned to please the prefetcher. */
> > +	static_assert(sizeof(instrs->buffer) % 64 == 0,
> > +		      "panthor_job_ringbuf_instrs::buffer is not aligned on a cacheline");
> > +
> > +	/* Make sure we have enough storage to store the whole sequence. */
> > +	static_assert(ALIGN(ARRAY_SIZE(instr_seq), NUM_INSTRS_PER_CACHE_LINE) ==
> > +		      ARRAY_SIZE(instrs->buffer),
> > +		      "instr_seq vs panthor_job_ringbuf_instrs::buffer size mismatch");
> > +
> > +	for (u32 i = 0; i < ARRAY_SIZE(instr_seq); i++) {
> > +		/* If the profile mask of this instruction is not enabled, skip it. */
> > +		if (instr_seq[i].profile_mask &&
> > +		    !(instr_seq[i].profile_mask & params->profile_mask))
> > +			continue;
> > +
> > +		instrs->buffer[instrs->count++] = instr_seq[i].instr;
> > +	}
> > +
> > +	pad = ALIGN(instrs->count, NUM_INSTRS_PER_CACHE_LINE);
> > +	memset(&instrs->buffer[instrs->count], 0,
> > +	       (pad - instrs->count) * sizeof(instrs->buffer[0]));
> > +	instrs->count = pad;
> > +}
> > +
> > +static u32 calc_job_credits(u32 profile_mask)
> > +{
> > +	struct panthor_job_ringbuf_instrs instrs;
> 
> You need to initialize this as instrs.count is read by prepare_job_instrs().
> 
> > +	struct panthor_job_cs_params params = {
> > +		.profile_mask = profile_mask,
> >  	};
> >  
> > -	/* Need to be cacheline aligned to please the prefetcher. */
> > -	static_assert(sizeof(call_instrs) % 64 == 0,
> > -		      "call_instrs is not aligned on a cacheline");
> > +	prepare_job_instrs(&params, &instrs);
> > +	return instrs.count;
> > +}
> > +
> > +static struct dma_fence *
> > +queue_run_job(struct drm_sched_job *sched_job)
> > +{
> > +	struct panthor_job *job = container_of(sched_job, struct panthor_job, base);
> > +	struct panthor_group *group = job->group;
> > +	struct panthor_queue *queue = group->queues[job->queue_idx];
> > +	struct panthor_device *ptdev = group->ptdev;
> > +	struct panthor_scheduler *sched = ptdev->scheduler;
> > +	struct panthor_job_ringbuf_instrs instrs;
> > +	struct panthor_job_cs_params cs_params;
> > +	struct dma_fence *done_fence;
> > +	int ret;
> >  
> >  	/* Stream size is zero, nothing to do except making sure all previously
> >  	 * submitted jobs are done before we signal the
> > @@ -2900,17 +3081,23 @@ queue_run_job(struct drm_sched_job *sched_job)
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
> > +	copy_instrs_to_ringbuf(queue, job, &instrs);
> > +
> > +	job->ringbuf.end = job->ringbuf.start + (instrs.count * sizeof(u64));
> >  
> >  	panthor_job_get(&job->base);
> >  	spin_lock(&queue->fence_ctx.lock);
> >  	list_add_tail(&job->node, &queue->fence_ctx.in_flight_jobs);
> >  	spin_unlock(&queue->fence_ctx.lock);
> >  
> > -	job->ringbuf.start = queue->iface.input->insert;
> > -	job->ringbuf.end = job->ringbuf.start + sizeof(call_instrs);
> > -
> >  	/* Make sure the ring buffer is updated before the INSERT
> >  	 * register.
> >  	 */
> > @@ -3003,6 +3190,34 @@ static const struct drm_sched_backend_ops panthor_queue_sched_ops = {
> >  	.free_job = queue_free_job,
> >  };
> >  
> > +static u32 calc_profiling_ringbuf_num_slots(struct panthor_device *ptdev,
> > +				       u32 cs_ringbuf_size)
> > +{
> > +	u32 min_profiled_job_instrs = U32_MAX;
> > +	u32 last_flag = fls(PANTHOR_DEVICE_PROFILING_ALL);
> > +
> > +	/*
> > +	 * We want to calculate the minimum size of a profiled job's CS,
> > +	 * because since they need additional instructions for the sampling
> > +	 * of performance metrics, they might take up further slots in
> > +	 * the queue's ringbuffer. This means we might not need as many job
> > +	 * slots for keeping track of their profiling information. What we
> > +	 * need is the maximum number of slots we should allocate to this end,
> > +	 * which matches the maximum number of profiled jobs we can place
> > +	 * simultaneously in the queue's ring buffer.
> > +	 * That has to be calculated separately for every single job profiling
> > +	 * flag, but not in the case job profiling is disabled, since unprofiled
> > +	 * jobs don't need to keep track of this at all.
> > +	 */
> > +	for (u32 i = 0; i < last_flag; i++) {
> > +		if (BIT(i) & PANTHOR_DEVICE_PROFILING_ALL)
> > +			min_profiled_job_instrs =
> > +				min(min_profiled_job_instrs, calc_job_credits(BIT(i)));
> > +	}
> > +
> > +	return DIV_ROUND_UP(cs_ringbuf_size, min_profiled_job_instrs * sizeof(u64));
> > +}
> 
> I may be missing something, but is there a situation where this is
> different to calc_job_credits(0)? AFAICT the infrastructure you've added
> can only add extra instructions to the no-flags case - whereas this
> implies you're thinking that instructions may also be removed (or replaced).
> 
> Steve

Since we create a separate kernel BO to hold the profiling information slot, we
need one that would be able to accomodate as many slots as the maximum number of
profiled jobs we can insert simultaneously into the queue's ring buffer. Because
profiled jobs always take more instructions than unprofiled ones, then we would
usually need fewer slots than the number of unprofiled jobs we could insert at
once in the ring buffer.

Because we represent profiling metrics with a bit mask, then we need to test the
size of the CS for every single metric enabled in isolation, since enabling more
than one will always mean a bigger CS, and therefore fewer jobs tracked at once
in the queue's ring buffer.

In our case, calling calc_job_credits(0) would simply tell us the number of
instructions we need for a normal job with no profiled features enabled, which
would always requiere less instructions than profiled ones, and therefore more
slots in the profiling info kernel BO. But we don't need to keep track of
profiling numbers for unprofiled jobs, so there's no point in calculating this
number.

At first I was simply allocating a profiling info kernel BO as big as the number
of simultaneous unprofiled job slots in the ring queue, but Boris pointed out
that since queue ringbuffers can be as big as 2GiB, a lot of this memory would
be wasted, since profiled jobs always require more slots because they hold more
instructions, so fewer profiling slots in said kernel BO.

The value of this approach will eventually manifest if we decided to keep track of
more profiling metrics, since this code won't have to change at all, other than
adding new profiling flags in the panthor_device_profiling_flags enum.

Regards,
Adrian

> > +
> >  static struct panthor_queue *
> >  group_create_queue(struct panthor_group *group,
> >  		   const struct drm_panthor_queue_create *args)
> > @@ -3056,9 +3271,35 @@ group_create_queue(struct panthor_group *group,
> >  		goto err_free_queue;
> >  	}
> >  
> > +	queue->profiling.slot_count =
> > +		calc_profiling_ringbuf_num_slots(group->ptdev, args->ringbuf_size);
> > +
> > +	queue->profiling.slots =
> > +		panthor_kernel_bo_create(group->ptdev, group->vm,
> > +					 queue->profiling.slot_count *
> > +					 sizeof(struct panthor_job_profiling_data),
> > +					 DRM_PANTHOR_BO_NO_MMAP,
> > +					 DRM_PANTHOR_VM_BIND_OP_MAP_NOEXEC |
> > +					 DRM_PANTHOR_VM_BIND_OP_MAP_UNCACHED,
> > +					 PANTHOR_VM_KERNEL_AUTO_VA);
> > +
> > +	if (IS_ERR(queue->profiling.slots)) {
> > +		ret = PTR_ERR(queue->profiling.slots);
> > +		goto err_free_queue;
> > +	}
> > +
> > +	ret = panthor_kernel_bo_vmap(queue->profiling.slots);
> > +	if (ret)
> > +		goto err_free_queue;
> > +
> > +	/*
> > +	 * Credit limit argument tells us the total number of instructions
> > +	 * across all CS slots in the ringbuffer, with some jobs requiring
> > +	 * twice as many as others, depending on their profiling status.
> > +	 */
> >  	ret = drm_sched_init(&queue->scheduler, &panthor_queue_sched_ops,
> >  			     group->ptdev->scheduler->wq, 1,
> > -			     args->ringbuf_size / (NUM_INSTRS_PER_SLOT * sizeof(u64)),
> > +			     args->ringbuf_size / sizeof(u64),
> >  			     0, msecs_to_jiffies(JOB_TIMEOUT_MS),
> >  			     group->ptdev->reset.wq,
> >  			     NULL, "panthor-queue", group->ptdev->base.dev);
> > @@ -3354,6 +3595,7 @@ panthor_job_create(struct panthor_file *pfile,
> >  {
> >  	struct panthor_group_pool *gpool = pfile->groups;
> >  	struct panthor_job *job;
> > +	u32 credits;
> >  	int ret;
> >  
> >  	if (qsubmit->pad)
> > @@ -3407,9 +3649,16 @@ panthor_job_create(struct panthor_file *pfile,
> >  		}
> >  	}
> >  
> > +	job->profiling.mask = pfile->ptdev->profile_mask;
> > +	credits = calc_job_credits(job->profiling.mask);
> > +	if (credits == 0) {
> > +		ret = -EINVAL;
> > +		goto err_put_job;
> > +	}
> > +
> >  	ret = drm_sched_job_init(&job->base,
> >  				 &job->group->queues[job->queue_idx]->entity,
> > -				 1, job->group);
> > +				 credits, job->group);
> >  	if (ret)
> >  		goto err_put_job;
> >  


