Return-Path: <linux-media+bounces-17530-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D19996B35C
	for <lists+linux-media@lfdr.de>; Wed,  4 Sep 2024 09:50:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BE837B26B97
	for <lists+linux-media@lfdr.de>; Wed,  4 Sep 2024 07:50:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7056F1527AC;
	Wed,  4 Sep 2024 07:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="cf8OetjE"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2647F15573D;
	Wed,  4 Sep 2024 07:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725436165; cv=none; b=u9kr7WhWOmk9hHAj7ja8UFriOb5w9ruYVOsvxtnH1IVxVK6MJHitHF1BgGOFqwzQ/338OXLTi3IIxp0wOVo8worf7vU8C/lYR6YRZDwJOOqtbh3gsM8Hpzthl2elNHonX9vP0k1YYum8Sy2hQsaICfCEiX+z6/15kL2wi+ErgFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725436165; c=relaxed/simple;
	bh=OED4sxa3rjYFiAWeWy9Q2YdnCP2YVqKB7b0Rc6pNONE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=StShDSGzf1SWoqDlUzsrHM5XkAhREPzvKJ0mM2gyBXZpirTAdDMS6tq8KcOcX9wK5LT+e9YddlnXlQLUUdwg8oZmREaRlM5itXEIUyVtGb8rXr3CBHJ+gTMQq/VgtfSU81DukCGDdJcF6HWuJrFYI9/j3QtAQIxgBU8bUou1S34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=cf8OetjE; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1725436161;
	bh=OED4sxa3rjYFiAWeWy9Q2YdnCP2YVqKB7b0Rc6pNONE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=cf8OetjENdIZ9FeZSpqyQr4UEl+P54QZPE2tkUEOUjzUBnYKAsACaHrOZggEvs0fU
	 /BzUUMOu0DPsgXkvLomyWiGcyw3iUrtC25NizJQTW9iT346c20Qg7qmWKXiOu3FOYo
	 CRKtnApH9hUsX1NbI+eDtaEDQMbFcHnIf5bvCQxL/Rp04ttVXn5nfomwsxSRZba42X
	 7rPvdSXqlPKolqCaquoOuCYEsiwLoQpnpOHifXeXz1JFWTfS7L//o1mH/8xieanuO9
	 Jl3k/g1SRUBRZekpoajkbzYuCRSHVUYESHP3pvZMfOxaIwz4ZGTjNBnMa2dvDr50Zu
	 Cj1cDTbYLw05g==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6B48617E0F92;
	Wed,  4 Sep 2024 09:49:20 +0200 (CEST)
Date: Wed, 4 Sep 2024 09:49:15 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Sumit Semwal
 <sumit.semwal@linaro.org>, Christian =?UTF-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v5 1/4] drm/panthor: introduce job cycle and timestamp
 accounting
Message-ID: <20240904094915.1d92661d@collabora.com>
In-Reply-To: <20240903202541.430225-2-adrian.larumbe@collabora.com>
References: <20240903202541.430225-1-adrian.larumbe@collabora.com>
	<20240903202541.430225-2-adrian.larumbe@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue,  3 Sep 2024 21:25:35 +0100
Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com> wrote:

> Enable calculations of job submission times in clock cycles and wall
> time. This is done by expanding the boilerplate command stream when runni=
ng
> a job to include instructions that compute said times right before an aft=
er
> a user CS.
>=20
> A separate kernel BO is created per queue to store those values. Jobs can
> access their sampled data through a slots buffer-specific index different
> from that of the queue's ringbuffer. The reason for this is saving memory
> on the profiling information kernel BO, since the amount of simultaneous
> profiled jobs we can write into the queue's ringbuffer might be much
> smaller than for regular jobs, as the former take more CSF instructions.
>=20
> This commit is done in preparation for enabling DRM fdinfo support in the
> Panthor driver, which depends on the numbers calculated herein.
>=20
> A profile mode mask has been added that will in a future commit allow UM =
to
> toggle performance metric sampling behaviour, which is disabled by default
> to save power. When a ringbuffer CS is constructed, timestamp and cycling
> sampling instructions are added depending on the enabled flags in the
> profiling mask.
>=20
> A helper was provided that calculates the number of instructions for a
> given set of enablement mask, and these are passed as the number of credi=
ts
> when initialising a DRM scheduler job.
>=20
> Signed-off-by: Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com>
> ---
>  drivers/gpu/drm/panthor/panthor_device.h |  22 ++
>  drivers/gpu/drm/panthor/panthor_sched.c  | 327 ++++++++++++++++++++---
>  2 files changed, 305 insertions(+), 44 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/p=
anthor/panthor_device.h
> index e388c0472ba7..a48e30d0af30 100644
> --- a/drivers/gpu/drm/panthor/panthor_device.h
> +++ b/drivers/gpu/drm/panthor/panthor_device.h
> @@ -66,6 +66,25 @@ struct panthor_irq {
>  	atomic_t suspended;
>  };
> =20
> +/**
> + * enum panthor_device_profiling_mode - Profiling state
> + */
> +enum panthor_device_profiling_flags {
> +	/** @PANTHOR_DEVICE_PROFILING_DISABLED: Profiling is disabled. */
> +	PANTHOR_DEVICE_PROFILING_DISABLED =3D 0,
> +
> +	/** @PANTHOR_DEVICE_PROFILING_CYCLES: Sampling job cycles. */
> +	PANTHOR_DEVICE_PROFILING_CYCLES =3D BIT(0),
> +
> +	/** @PANTHOR_DEVICE_PROFILING_TIMESTAMP: Sampling job timestamp. */
> +	PANTHOR_DEVICE_PROFILING_TIMESTAMP =3D BIT(1),
> +
> +	/** @PANTHOR_DEVICE_PROFILING_ALL: Sampling everything. */
> +	PANTHOR_DEVICE_PROFILING_ALL =3D
> +	PANTHOR_DEVICE_PROFILING_CYCLES |
> +	PANTHOR_DEVICE_PROFILING_TIMESTAMP,
> +};
> +
>  /**
>   * struct panthor_device - Panthor device
>   */
> @@ -162,6 +181,9 @@ struct panthor_device {
>  		 */
>  		struct page *dummy_latest_flush;
>  	} pm;
> +
> +	/** @profile_mask: User-set profiling flags for job accounting. */
> +	u32 profile_mask;
>  };
> =20
>  /**
> diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/pa=
nthor/panthor_sched.c
> index c426a392b081..b087648bf59a 100644
> --- a/drivers/gpu/drm/panthor/panthor_sched.c
> +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> @@ -93,6 +93,9 @@
>  #define MIN_CSGS				3
>  #define MAX_CSG_PRIO				0xf
> =20
> +#define NUM_INSTRS_PER_CACHE_LINE		(64 / sizeof(u64))
> +#define MAX_INSTRS_PER_JOB			32
> +
>  struct panthor_group;
> =20
>  /**
> @@ -476,6 +479,18 @@ struct panthor_queue {
>  		 */
>  		struct list_head in_flight_jobs;
>  	} fence_ctx;
> +
> +	/** @profiling_info: Job profiling data slots and access information. */
> +	struct {
> +		/** @slots: Kernel BO holding the slots. */
> +		struct panthor_kernel_bo *slots;
> +
> +		/** @slot_count: Number of jobs ringbuffer can hold at once. */
> +		u32 slot_count;
> +
> +		/** @profiling_seqno: Index of the next available profiling informatio=
n slot. */
> +		u32 profiling_seqno;

Nit: no need to repeat profiling as it's under the profiling_info
struct. I would simply name that one 'seqno'.

> +	} profiling_info;

s/profiling_info/profiling/ ?

>  };
> =20
>  /**
> @@ -661,6 +676,18 @@ struct panthor_group {
>  	struct list_head wait_node;
>  };
> =20
> +struct panthor_job_profiling_data {
> +	struct {
> +		u64 before;
> +		u64 after;
> +	} cycles;
> +
> +	struct {
> +		u64 before;
> +		u64 after;
> +	} time;
> +};
> +
>  /**
>   * group_queue_work() - Queue a group work
>   * @group: Group to queue the work for.
> @@ -774,6 +801,12 @@ struct panthor_job {
> =20
>  	/** @done_fence: Fence signaled when the job is finished or cancelled. =
*/
>  	struct dma_fence *done_fence;
> +
> +	/** @profile_mask: Current device job profiling enablement bitmask. */
> +	u32 profile_mask;
> +
> +	/** @profile_slot: Job profiling information index in the profiling slo=
ts BO. */
> +	u32 profiling_slot;

Nit: we tend to group fields together under sub-structs, so I'd say:

	struct {
		u32 mask; // or flags
		u32 slot;
	} profiling;

>  };
> =20
>  static void
> @@ -838,6 +871,7 @@ static void group_free_queue(struct panthor_group *gr=
oup, struct panthor_queue *
> =20
>  	panthor_kernel_bo_destroy(queue->ringbuf);
>  	panthor_kernel_bo_destroy(queue->iface.mem);
> +	panthor_kernel_bo_destroy(queue->profiling_info.slots);
> =20
>  	/* Release the last_fence we were holding, if any. */
>  	dma_fence_put(queue->fence_ctx.last_fence);
> @@ -1982,8 +2016,6 @@ tick_ctx_init(struct panthor_scheduler *sched,
>  	}
>  }
> =20
> -#define NUM_INSTRS_PER_SLOT		16
> -
>  static void
>  group_term_post_processing(struct panthor_group *group)
>  {
> @@ -2815,65 +2847,211 @@ static void group_sync_upd_work(struct work_stru=
ct *work)
>  	group_put(group);
>  }
> =20
> -static struct dma_fence *
> -queue_run_job(struct drm_sched_job *sched_job)
> +struct panthor_job_ringbuf_instrs {
> +	u64 buffer[MAX_INSTRS_PER_JOB];
> +	u32 count;
> +};
> +
> +struct panthor_job_instr {
> +	u32 profile_mask;
> +	u64 instr;
> +};
> +
> +#define JOB_INSTR(__prof, __instr) \
> +	{ \
> +		.profile_mask =3D __prof, \
> +		.instr =3D __instr, \
> +	}
> +
> +static void
> +copy_instrs_to_ringbuf(struct panthor_queue *queue,
> +		       struct panthor_job *job,
> +		       struct panthor_job_ringbuf_instrs *instrs)
> +{
> +	ssize_t ringbuf_size =3D panthor_kernel_bo_size(queue->ringbuf);
> +	u32 start =3D job->ringbuf.start & (ringbuf_size - 1);
> +	ssize_t size, written;
> +
> +	/*
> +	 * We need to write a whole slot, including any trailing zeroes
> +	 * that may come at the end of it. Also, because instrs.buffer had
> +	 * been zero-initialised, there's no need to pad it with 0's
> +	 */
> +	instrs->count =3D ALIGN(instrs->count, NUM_INSTRS_PER_CACHE_LINE);
> +	size =3D instrs->count * sizeof(u64);
> +	written =3D min(ringbuf_size - start, size);
> +
> +	memcpy(queue->ringbuf->kmap + start, instrs->buffer, written);
> +
> +	if (written < size)
> +		memcpy(queue->ringbuf->kmap,
> +		       &instrs->buffer[(ringbuf_size - start)/sizeof(u64)],
> +		       size - written);
> +}
> +
> +struct panthor_job_cs_params {
> +	u32 profile_mask;
> +	u64 addr_reg; u64 val_reg;
> +	u64 cycle_reg; u64 time_reg;
> +	u64 sync_addr; u64 times_addr;
> +	u64 cs_start; u64 cs_size;
> +	u32 last_flush; u32 waitall_mask;
> +};
> +
> +static void
> +get_job_cs_params(struct panthor_job *job, struct panthor_job_cs_params =
*params)
>  {
> -	struct panthor_job *job =3D container_of(sched_job, struct panthor_job,=
 base);
>  	struct panthor_group *group =3D job->group;
>  	struct panthor_queue *queue =3D group->queues[job->queue_idx];
>  	struct panthor_device *ptdev =3D group->ptdev;
>  	struct panthor_scheduler *sched =3D ptdev->scheduler;
> -	u32 ringbuf_size =3D panthor_kernel_bo_size(queue->ringbuf);
> -	u32 ringbuf_insert =3D queue->iface.input->insert & (ringbuf_size - 1);
> -	u64 addr_reg =3D ptdev->csif_info.cs_reg_count -
> -		       ptdev->csif_info.unpreserved_cs_reg_count;
> -	u64 val_reg =3D addr_reg + 2;
> -	u64 sync_addr =3D panthor_kernel_bo_gpuva(group->syncobjs) +
> -			job->queue_idx * sizeof(struct panthor_syncobj_64b);
> -	u32 waitall_mask =3D GENMASK(sched->sb_slot_count - 1, 0);
> -	struct dma_fence *done_fence;
> -	int ret;
> =20
> -	u64 call_instrs[NUM_INSTRS_PER_SLOT] =3D {
> +	params->addr_reg =3D ptdev->csif_info.cs_reg_count -
> +			   ptdev->csif_info.unpreserved_cs_reg_count;
> +	params->val_reg =3D params->addr_reg + 2;
> +	params->cycle_reg =3D params->addr_reg;
> +	params->time_reg =3D params->val_reg;
> +
> +	params->sync_addr =3D panthor_kernel_bo_gpuva(group->syncobjs) +
> +			    job->queue_idx * sizeof(struct panthor_syncobj_64b);
> +	params->times_addr =3D panthor_kernel_bo_gpuva(queue->profiling_info.sl=
ots) +
> +			     (job->profiling_slot * sizeof(struct panthor_job_profiling_data)=
);
> +	params->waitall_mask =3D GENMASK(sched->sb_slot_count - 1, 0);
> +
> +	params->cs_start =3D job->call_info.start;
> +	params->cs_size =3D job->call_info.size;
> +	params->last_flush =3D job->call_info.latest_flush;
> +
> +	params->profile_mask =3D job->profile_mask;
> +}
> +
> +static void
> +prepare_job_instrs(const struct panthor_job_cs_params *params,
> +		   struct panthor_job_ringbuf_instrs *instrs)
> +{
> +	const struct panthor_job_instr instr_seq[] =3D {
>  		/* MOV32 rX+2, cs.latest_flush */
> -		(2ull << 56) | (val_reg << 48) | job->call_info.latest_flush,
> +		JOB_INSTR(PANTHOR_DEVICE_PROFILING_DISABLED,
> +			  (2ull << 56) | (params->val_reg << 48) | params->last_flush),
> =20
>  		/* FLUSH_CACHE2.clean_inv_all.no_wait.signal(0) rX+2 */
> -		(36ull << 56) | (0ull << 48) | (val_reg << 40) | (0 << 16) | 0x233,
> +		JOB_INSTR(PANTHOR_DEVICE_PROFILING_DISABLED,
> +			  (36ull << 56) | (0ull << 48) | (params->val_reg << 40) | (0 << 16) =
| 0x233),
> +
> +		/* MOV48 rX:rX+1, cycles_offset */
> +		JOB_INSTR(PANTHOR_DEVICE_PROFILING_CYCLES,
> +			  (1ull << 56) | (params->cycle_reg << 48) |
> +			  (params->times_addr +
> +			   offsetof(struct panthor_job_profiling_data, cycles.before))),
> +		/* STORE_STATE cycles */
> +		JOB_INSTR(PANTHOR_DEVICE_PROFILING_CYCLES,
> +			  (40ull << 56) | (params->cycle_reg << 40) | (1ll << 32)),
> +		/* MOV48 rX:rX+1, time_offset */
> +		JOB_INSTR(PANTHOR_DEVICE_PROFILING_TIMESTAMP,
> +			  (1ull << 56) | (params->time_reg << 48) |
> +			  (params->times_addr +
> +			   offsetof(struct panthor_job_profiling_data, time.before))),
> +		/* STORE_STATE timer */
> +		JOB_INSTR(PANTHOR_DEVICE_PROFILING_TIMESTAMP,
> +			  (40ull << 56) | (params->time_reg << 40) | (0ll << 32)),
> =20
>  		/* MOV48 rX:rX+1, cs.start */
> -		(1ull << 56) | (addr_reg << 48) | job->call_info.start,
> -
> +		JOB_INSTR(PANTHOR_DEVICE_PROFILING_DISABLED,
> +			  (1ull << 56) | (params->addr_reg << 48) | params->cs_start),
>  		/* MOV32 rX+2, cs.size */
> -		(2ull << 56) | (val_reg << 48) | job->call_info.size,
> -
> +		JOB_INSTR(PANTHOR_DEVICE_PROFILING_DISABLED,
> +			  (2ull << 56) | (params->val_reg << 48) | params->cs_size),
>  		/* WAIT(0) =3D> waits for FLUSH_CACHE2 instruction */
> -		(3ull << 56) | (1 << 16),
> -
> +		JOB_INSTR(PANTHOR_DEVICE_PROFILING_DISABLED, (3ull << 56) | (1 << 16)),
>  		/* CALL rX:rX+1, rX+2 */
> -		(32ull << 56) | (addr_reg << 40) | (val_reg << 32),
> +		JOB_INSTR(PANTHOR_DEVICE_PROFILING_DISABLED,
> +			  (32ull << 56) | (params->addr_reg << 40) | (params->val_reg << 32)),
> +
> +		/* MOV48 rX:rX+1, cycles_offset */
> +		JOB_INSTR(PANTHOR_DEVICE_PROFILING_CYCLES,
> +			  (1ull << 56) | (params->cycle_reg << 48) |
> +			  (params->times_addr +
> +			   offsetof(struct panthor_job_profiling_data, cycles.after))),
> +		/* STORE_STATE cycles */
> +		JOB_INSTR(PANTHOR_DEVICE_PROFILING_CYCLES,
> +			  (40ull << 56) | (params->cycle_reg << 40) | (1ll << 32)),
> +
> +		/* MOV48 rX:rX+1, time_offset */
> +		JOB_INSTR(PANTHOR_DEVICE_PROFILING_TIMESTAMP,
> +			  (1ull << 56) | (params->time_reg << 48) |
> +			  (params->times_addr +
> +			   offsetof(struct panthor_job_profiling_data, time.after))),
> +		/* STORE_STATE timer */
> +		JOB_INSTR(PANTHOR_DEVICE_PROFILING_TIMESTAMP,
> +			  (40ull << 56) | (params->time_reg << 40) | (0ll << 32)),
> =20
>  		/* MOV48 rX:rX+1, sync_addr */
> -		(1ull << 56) | (addr_reg << 48) | sync_addr,
> -
> +		JOB_INSTR(PANTHOR_DEVICE_PROFILING_DISABLED,
> +			  (1ull << 56) | (params->addr_reg << 48) | params->sync_addr),
>  		/* MOV48 rX+2, #1 */
> -		(1ull << 56) | (val_reg << 48) | 1,
> -
> +		JOB_INSTR(PANTHOR_DEVICE_PROFILING_DISABLED,
> +			  (1ull << 56) | (params->val_reg << 48) | 1),
>  		/* WAIT(all) */
> -		(3ull << 56) | (waitall_mask << 16),
> -
> +		JOB_INSTR(PANTHOR_DEVICE_PROFILING_DISABLED,
> +			  (3ull << 56) | (params->waitall_mask << 16)),
>  		/* SYNC_ADD64.system_scope.propage_err.nowait rX:rX+1, rX+2*/
> -		(51ull << 56) | (0ull << 48) | (addr_reg << 40) | (val_reg << 32) | (0=
 << 16) | 1,
> -
> +		JOB_INSTR(PANTHOR_DEVICE_PROFILING_DISABLED,
> +			  (51ull << 56) | (0ull << 48) | (params->addr_reg << 40) |
> +			  (params->val_reg << 32) | (0 << 16) | 1),
>  		/* ERROR_BARRIER, so we can recover from faults at job
>  		 * boundaries.
>  		 */
> -		(47ull << 56),
> +		JOB_INSTR(PANTHOR_DEVICE_PROFILING_DISABLED, (47ull << 56)),
> +	};
> +	u32 pad;
> +
> +	/* NEED to be cacheline aligned to please the prefetcher. */
> +	static_assert(sizeof(instrs->buffer) % 64 =3D=3D 0,
> +		      "panthor_job_ringbuf_instrs::buffer is not aligned on a cachelin=
e");
> +
> +	/* Make sure we have enough storage to store the whole sequence. */
> +	static_assert(ALIGN(ARRAY_SIZE(instr_seq), NUM_INSTRS_PER_CACHE_LINE) <=
=3D
> +		      ARRAY_SIZE(instrs->buffer),
> +		      "instr_seq vs panthor_job_ringbuf_instrs::buffer size mismatch");

We probably want to catch situations where instrs->buffer has gone
bigger than needed (say we found a way to drop instructions), so I
would turn the '<=3D' condition into an '=3D=3D'.

> +
> +	for (u32 i =3D 0; i < ARRAY_SIZE(instr_seq); i++) {
> +		/* If the profile mask of this instruction is not enabled, skip it. */
> +		if (instr_seq[i].profile_mask &&
> +		    !(instr_seq[i].profile_mask & params->profile_mask))
> +			continue;
> +
> +		instrs->buffer[instrs->count++] =3D instr_seq[i].instr;
> +	}
> +
> +	pad =3D ALIGN(instrs->count, NUM_INSTRS_PER_CACHE_LINE);
> +	memset(&instrs->buffer[instrs->count], 0,
> +	       (pad - instrs->count) * sizeof(instrs->buffer[0]));
> +	instrs->count =3D pad;
> +}
> +
> +static u32 calc_job_credits(u32 profile_mask)
> +{
> +	struct panthor_job_ringbuf_instrs instrs;
> +	struct panthor_job_cs_params params =3D {
> +		.profile_mask =3D profile_mask,
>  	};
> =20
> -	/* Need to be cacheline aligned to please the prefetcher. */
> -	static_assert(sizeof(call_instrs) % 64 =3D=3D 0,
> -		      "call_instrs is not aligned on a cacheline");
> +	prepare_job_instrs(&params, &instrs);
> +	return instrs.count;
> +}
> +
> +static struct dma_fence *
> +queue_run_job(struct drm_sched_job *sched_job)
> +{
> +	struct panthor_job *job =3D container_of(sched_job, struct panthor_job,=
 base);
> +	struct panthor_group *group =3D job->group;
> +	struct panthor_queue *queue =3D group->queues[job->queue_idx];
> +	struct panthor_device *ptdev =3D group->ptdev;
> +	struct panthor_scheduler *sched =3D ptdev->scheduler;
> +	struct panthor_job_ringbuf_instrs instrs;
> +	struct panthor_job_cs_params cs_params;
> +	struct dma_fence *done_fence;
> +	int ret;
> =20
>  	/* Stream size is zero, nothing to do except making sure all previously
>  	 * submitted jobs are done before we signal the
> @@ -2900,17 +3078,23 @@ queue_run_job(struct drm_sched_job *sched_job)
>  		       queue->fence_ctx.id,
>  		       atomic64_inc_return(&queue->fence_ctx.seqno));
> =20
> -	memcpy(queue->ringbuf->kmap + ringbuf_insert,
> -	       call_instrs, sizeof(call_instrs));
> +	job->profiling_slot =3D queue->profiling_info.profiling_seqno++;
> +	if (queue->profiling_info.profiling_seqno =3D=3D queue->profiling_info.=
slot_count)
> +		queue->profiling_info.profiling_seqno =3D 0;
> +
> +	job->ringbuf.start =3D queue->iface.input->insert;
> +
> +	get_job_cs_params(job, &cs_params);
> +	prepare_job_instrs(&cs_params, &instrs);
> +	copy_instrs_to_ringbuf(queue, job, &instrs);
> +
> +	job->ringbuf.end =3D job->ringbuf.start + (instrs.count * sizeof(u64));
> =20
>  	panthor_job_get(&job->base);
>  	spin_lock(&queue->fence_ctx.lock);
>  	list_add_tail(&job->node, &queue->fence_ctx.in_flight_jobs);
>  	spin_unlock(&queue->fence_ctx.lock);
> =20
> -	job->ringbuf.start =3D queue->iface.input->insert;
> -	job->ringbuf.end =3D job->ringbuf.start + sizeof(call_instrs);
> -
>  	/* Make sure the ring buffer is updated before the INSERT
>  	 * register.
>  	 */
> @@ -3003,6 +3187,24 @@ static const struct drm_sched_backend_ops panthor_=
queue_sched_ops =3D {
>  	.free_job =3D queue_free_job,
>  };
> =20
> +static u32 calc_profiling_ringbuf_num_slots(struct panthor_device *ptdev,
> +				       u32 cs_ringbuf_size)
> +{
> +	u32 min_profiled_job_instrs =3D U32_MAX;
> +	u32 last_flag =3D fls(PANTHOR_DEVICE_PROFILING_ALL);
> +
> +	for (u32 i =3D 0; i < last_flag; i++) {
> +		if (BIT(i) & PANTHOR_DEVICE_PROFILING_ALL)
> +			min_profiled_job_instrs =3D
> +				min(min_profiled_job_instrs, calc_job_credits(BIT(i)));
> +	}

Okay, I think this loop deserves an explanation. The goal is to
calculate the minimal size of a profile job so we can deduce the
maximum number of profiling slots that will be used simultaneously. We
ignore PANTHOR_DEVICE_PROFILING_DISABLED, because those jobs won't use
a profiling slot in the first place.

> +
> +	drm_WARN_ON(&ptdev->base,
> +		    !IS_ALIGNED(min_profiled_job_instrs, NUM_INSTRS_PER_CACHE_LINE));

We can probably drop this WARN_ON(), it's supposed to be checked in
calc_job_credits().

> +
> +	return DIV_ROUND_UP(cs_ringbuf_size, min_profiled_job_instrs * sizeof(u=
64));
> +}
> +
>  static struct panthor_queue *
>  group_create_queue(struct panthor_group *group,
>  		   const struct drm_panthor_queue_create *args)
> @@ -3056,9 +3258,38 @@ group_create_queue(struct panthor_group *group,
>  		goto err_free_queue;
>  	}
> =20
> +	queue->profiling_info.slot_count =3D
> +		calc_profiling_ringbuf_num_slots(group->ptdev, args->ringbuf_size);
> +
> +	queue->profiling_info.slots =3D
> +		panthor_kernel_bo_create(group->ptdev, group->vm,
> +					 queue->profiling_info.slot_count *
> +					 sizeof(struct panthor_job_profiling_data),
> +					 DRM_PANTHOR_BO_NO_MMAP,
> +					 DRM_PANTHOR_VM_BIND_OP_MAP_NOEXEC |
> +					 DRM_PANTHOR_VM_BIND_OP_MAP_UNCACHED,
> +					 PANTHOR_VM_KERNEL_AUTO_VA);
> +
> +	if (IS_ERR(queue->profiling_info.slots)) {
> +		ret =3D PTR_ERR(queue->profiling_info.slots);
> +		goto err_free_queue;
> +	}
> +
> +	ret =3D panthor_kernel_bo_vmap(queue->profiling_info.slots);
> +	if (ret)
> +		goto err_free_queue;
> +
> +	memset(queue->profiling_info.slots->kmap, 0,
> +	       queue->profiling_info.slot_count * sizeof(struct panthor_job_pro=
filing_data));

I don't think we need to memset() the profiling buffer.

> +
> +	/*
> +	 * Credit limit argument tells us the total number of instructions
> +	 * across all CS slots in the ringbuffer, with some jobs requiring
> +	 * twice as many as others, depending on their profiling status.
> +	 */
>  	ret =3D drm_sched_init(&queue->scheduler, &panthor_queue_sched_ops,
>  			     group->ptdev->scheduler->wq, 1,
> -			     args->ringbuf_size / (NUM_INSTRS_PER_SLOT * sizeof(u64)),
> +			     args->ringbuf_size / sizeof(u64),
>  			     0, msecs_to_jiffies(JOB_TIMEOUT_MS),
>  			     group->ptdev->reset.wq,
>  			     NULL, "panthor-queue", group->ptdev->base.dev);
> @@ -3354,6 +3585,7 @@ panthor_job_create(struct panthor_file *pfile,
>  {
>  	struct panthor_group_pool *gpool =3D pfile->groups;
>  	struct panthor_job *job;
> +	u32 credits;
>  	int ret;
> =20
>  	if (qsubmit->pad)
> @@ -3407,9 +3639,16 @@ panthor_job_create(struct panthor_file *pfile,
>  		}
>  	}
> =20
> +	job->profile_mask =3D pfile->ptdev->profile_mask;
> +	credits =3D calc_job_credits(job->profile_mask);
> +	if (credits =3D=3D 0) {
> +		ret =3D -EINVAL;
> +		goto err_put_job;
> +	}
> +
>  	ret =3D drm_sched_job_init(&job->base,
>  				 &job->group->queues[job->queue_idx]->entity,
> -				 1, job->group);
> +				 credits, job->group);
>  	if (ret)
>  		goto err_put_job;
> =20

Just add a bunch of minor comments (mostly cosmetic changes), but the
implementation looks good to me.

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

