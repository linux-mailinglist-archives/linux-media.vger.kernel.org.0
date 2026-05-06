Return-Path: <linux-media+bounces-60545-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +NUiAE8B+2kbVQMAu9opvQ
	(envelope-from <linux-media+bounces-60545-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 10:52:31 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 224A94D8203
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 10:52:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 584D33021598
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2026 08:51:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E45D3E6DE1;
	Wed,  6 May 2026 08:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="lKCgYU5q"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 062D3322C78;
	Wed,  6 May 2026 08:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778057514; cv=none; b=L/EoX56+k2ZAvGc/BVrh0z02N7khhMYCMTaSVR0wGHkxan+tIH37lLzkkguHwHhJj+NKrWJjyaCiiE/clW+Xyh3AnU+LvsyH1fEoBQa1qM1UCwCrupZrkgDez/ONtSQG8G8r00guQvy0+UhQAjy2namRIjtHizPpO8p+fXTw2cY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778057514; c=relaxed/simple;
	bh=qn8hCXeok/i1qfKg2+apfL6WRVPA2S3XWp9AscVrXqY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=V1Hws74BzZQbK+qzFwflJYKLwUkL2CPSgC4kKBhMf90t9m5ViUou2r2qSV3+mkdFI3RDKLwqPkY9vkYD7bpwp1qwvzo/Oyw+OaP7RYSOuNtKA8omBkUYS3JkIjcK4rkT5HtoeRJcJkyCSe5elSDnnAvoohZK5Sjy3Em+MWvNqN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=lKCgYU5q; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1778057510;
	bh=qn8hCXeok/i1qfKg2+apfL6WRVPA2S3XWp9AscVrXqY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=lKCgYU5q+LWXj791/sVDxiKvYI4BFPtsXRvttcatIxuqT3J1yAni62KB0nbdUOxLk
	 v4ivYv29NjLOBkUC2QBpKm9WbmcgfBFie34FXsFNNZYxPCL8Pmq/M/miBfkkboBu2t
	 6R6uOqNJ0/wXMkvRsMAy+thzbYcQW40ZDDNpqgtY0Dcq2Da8ddgHFaD+M9xXoW53ZZ
	 fRNgKmf/5ddJU9wqgVEocXO3lvgDxbsqSbgdir2cLL3ccBtHwrfSvIv088woF/ln6K
	 Oj/3co90eLSWpB933nfuKazT99hfaDovfSpZefjzk5c+dc1GzIilxOlkSWuhVYjJdb
	 GSmnSlW1VQ1Gw==
Received: from fedora (unknown [100.64.0.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D164117E1321;
	Wed,  6 May 2026 10:51:48 +0200 (CEST)
Date: Wed, 6 May 2026 10:51:45 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Ketil Johnsen <ketil.johnsen@arm.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Jonathan
 Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, Sumit
 Semwal <sumit.semwal@linaro.org>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>,
 John Stultz <jstultz@google.com>, "T.J. Mercier" <tjmercier@google.com>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>, Steven Price
 <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, Daniel Almeida
 <daniel.almeida@collabora.com>, Alice Ryhl <aliceryhl@google.com>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Florent Tomasin <florent.tomasin@arm.com>, Paul Toadere
 <paul.toadere@arm.com>, Samuel Percival <samuel.percival@arm.com>
Subject: Re: [PATCH 7/8] drm/panthor: Add support for entering and exiting
 protected mode
Message-ID: <20260506105145.6f25181d@fedora>
In-Reply-To: <20260505140516.1372388-8-ketil.johnsen@arm.com>
References: <20260505140516.1372388-1-ketil.johnsen@arm.com>
	<20260505140516.1372388-8-ketil.johnsen@arm.com>
Organization: Collabora
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 224A94D8203
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60545-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[30];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,lwn.net,linuxfoundation.org,linaro.org,collabora.com,arm.com,google.com,amd.com,lists.freedesktop.org,vger.kernel.org,lists.linaro.org,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[boris.brezillon@collabora.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,collabora.com:dkim]

On Tue,  5 May 2026 16:05:13 +0200
Ketil Johnsen <ketil.johnsen@arm.com> wrote:

Here comes the second part of the review :-).

> diff --git a/drivers/gpu/drm/panthor/panthor_gpu.c b/drivers/gpu/drm/panthor/panthor_gpu.c
> index 2ab444ee8c710..e93042eaf3fc8 100644
> --- a/drivers/gpu/drm/panthor/panthor_gpu.c
> +++ b/drivers/gpu/drm/panthor/panthor_gpu.c
> @@ -100,8 +100,11 @@ static void panthor_gpu_irq_handler(struct panthor_device *ptdev, u32 status)
>  			 fault_status, panthor_exception_name(ptdev, fault_status & 0xFF),
>  			 address);
>  	}
> -	if (status & GPU_IRQ_PROTM_FAULT)
> +	if (status & GPU_IRQ_PROTM_FAULT) {
>  		drm_warn(&ptdev->base, "GPU Fault in protected mode\n");
> +		panthor_gpu_disable_protm_fault_interrupt(ptdev);

It's only used in a single place, so I'd just inline the content of
panthor_gpu_disable_protm_fault_interrupt() here. Also, I think
panthor_gpu_disable_protm_fault_interrupt() is not taking the right
lock (see below).

> +		panthor_device_schedule_reset(ptdev);
> +	}
>  
>  	spin_lock(&ptdev->gpu->reqs_lock);
>  	if (status & ptdev->gpu->pending_reqs) {
> @@ -367,6 +370,10 @@ int panthor_gpu_soft_reset(struct panthor_device *ptdev)
>  	unsigned long flags;
>  
>  	spin_lock_irqsave(&ptdev->gpu->reqs_lock, flags);
> +
> +	/** Re-enable the protm_irq_fault when reset is complete */
> +	ptdev->gpu->irq.mask |= GPU_IRQ_PROTM_FAULT;

panthor_irq::mask should only be modified with the
panthor_irq::mask_lock held. Besides, we have a helper for
that:

	panthor_gpu_irq_enable_events(&ptdev->gpu->irq,	GPU_IRQ_PROTM_FAULT);

> +
>  	if (!drm_WARN_ON(&ptdev->base,
>  			 ptdev->gpu->pending_reqs & GPU_IRQ_RESET_COMPLETED)) {
>  		ptdev->gpu->pending_reqs |= GPU_IRQ_RESET_COMPLETED;
> @@ -427,3 +434,8 @@ void panthor_gpu_resume(struct panthor_device *ptdev)
>  	panthor_hw_l2_power_on(ptdev);
>  }
>  
> +void panthor_gpu_disable_protm_fault_interrupt(struct panthor_device *ptdev)
> +{
> +	scoped_guard(spinlock_irqsave, &ptdev->gpu->reqs_lock)
> +		ptdev->gpu->irq.mask &= ~GPU_IRQ_PROTM_FAULT;

Same problem with wrong lock being taken to modify the mask, and
panthor_gpu_irq_disable_events() probably being a better option?

> +}
> diff --git a/drivers/gpu/drm/panthor/panthor_gpu.h b/drivers/gpu/drm/panthor/panthor_gpu.h
> index 12c263a399281..ca66c73f543e6 100644
> --- a/drivers/gpu/drm/panthor/panthor_gpu.h
> +++ b/drivers/gpu/drm/panthor/panthor_gpu.h
> @@ -54,4 +54,10 @@ int panthor_gpu_soft_reset(struct panthor_device *ptdev);
>  void panthor_gpu_power_changed_off(struct panthor_device *ptdev);
>  int panthor_gpu_power_changed_on(struct panthor_device *ptdev);
>  
> +/**
> + * panthor_gpu_disable_protm_fault_interrupt() - Disable GPU_PROTECTED_FAULT interrupt
> + * @ptdev: Device.
> + */
> +void panthor_gpu_disable_protm_fault_interrupt(struct panthor_device *ptdev);
> +
>  #endif
> diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
> index 07f54176ec1bf..702f537905b56 100644
> --- a/drivers/gpu/drm/panthor/panthor_mmu.c
> +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
> @@ -31,6 +31,7 @@
>  #include <linux/sizes.h>
>  
>  #include "panthor_device.h"
> +#include "panthor_fw.h"
>  #include "panthor_gem.h"
>  #include "panthor_gpu.h"
>  #include "panthor_heap.h"
> @@ -1704,8 +1705,12 @@ static int panthor_vm_lock_region(struct panthor_vm *vm, u64 start, u64 size)
>  	if (drm_WARN_ON(&ptdev->base, vm->locked_region.size))
>  		return -EINVAL;
>  
> +	down_read(&ptdev->protm.lock);
> +
>  	mutex_lock(&ptdev->mmu->as.slots_lock);
>  	if (vm->as.id >= 0 && size) {
> +		panthor_fw_protm_exit_sync(ptdev);
> +
>  		/* Lock the region that needs to be updated */
>  		gpu_write64(ptdev, AS_LOCKADDR(vm->as.id),
>  			    pack_region_range(ptdev, &start, &size));
> @@ -1720,6 +1725,9 @@ static int panthor_vm_lock_region(struct panthor_vm *vm, u64 start, u64 size)
>  	}
>  	mutex_unlock(&ptdev->mmu->as.slots_lock);
>  
> +	if (ret)
> +		up_read(&ptdev->protm.lock);

Let's try to keep the locked section local to a function: the protm.lock
should, IMHO, be taken/released in panthor_vm_exec_op(). If we go for
that, this also makes the panthor_vm_lock_region() vs
panthor_vm_expand_locked_region() distinction useless, though it's
probably fine to keep it for clarity.

> +
>  	return ret;
>  }
>  
> @@ -1805,6 +1813,8 @@ static void panthor_vm_unlock_region(struct panthor_vm *vm)
>  	vm->locked_region.start = 0;
>  	vm->locked_region.size = 0;
>  	mutex_unlock(&ptdev->mmu->as.slots_lock);
> +
> +	up_read(&ptdev->protm.lock);
>  }
>  
>  static void panthor_mmu_irq_handler(struct panthor_device *ptdev, u32 status)
> diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
> index 987072bd867c4..acb04250c7def 100644
> --- a/drivers/gpu/drm/panthor/panthor_sched.c
> +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> @@ -308,6 +308,15 @@ struct panthor_scheduler {
>  		 */
>  		struct list_head stopped_groups;
>  	} reset;
> +
> +	/** @protm: Protected mode related fields. */
> +	struct {
> +		/** @protected_mode: True if GPU is in protected mode. */
> +		bool protected_mode;

nit: s/protected_mode/enabled/s. But do we even need that boolean?
Isn't active_group != NULL providing the same info?

> +
> +		/** @active_group: The active protected group. */
> +		struct panthor_group *active_group;
> +	} protm;
>  };
>  
>  /**
> @@ -570,6 +579,16 @@ struct panthor_group {
>  	/** @fatal_queues: Bitmask reflecting the queues that hit a fatal exception. */
>  	u32 fatal_queues;
>  
> +	/**
> +	 * @protm_pending_queues: Bitmask reflecting the queues that are waiting
> +	 *                        on a CS_PROTM_PENDING.
> +	 *
> +	 * The GPU will set the bit associated to the queue pending protected mode
> +	 * when a PROT_REGION command is executing or when trying to resume previously
> +	 * suspended protected mode jobs.
> +	 */
> +	u32 protm_pending_queues;
> +
>  	/** @tiler_oom: Mask of queues that have a tiler OOM event to process. */
>  	atomic_t tiler_oom;
>  
> @@ -1176,6 +1195,7 @@ queue_resume_timeout(struct panthor_queue *queue)
>   * @ptdev: Device.
>   * @csg_id: Group slot ID.
>   * @cs_id: Queue slot ID.
> + * @protm_ack: Acknowledge pending protected mode queues
>   *
>   * Program a queue slot with the queue information so things can start being
>   * executed on this queue.
> @@ -1472,6 +1492,34 @@ csg_slot_prog_locked(struct panthor_device *ptdev, u32 csg_id, u32 priority)
>  	return 0;
>  }
>  
> +static void
> +cs_slot_process_protm_pending_event_locked(struct panthor_device *ptdev,
> +					   u32 csg_id, u32 cs_id)
> +{
> +	struct panthor_scheduler *sched = ptdev->scheduler;
> +	struct panthor_csg_slot *csg_slot = &sched->csg_slots[csg_id];
> +	struct panthor_group *group = csg_slot->group;
> +
> +	lockdep_assert_held(&sched->lock);
> +
> +	if (!group)
> +		return;
> +
> +	/* No protected memory heap, a user space program tried to
> +	 * submit a protected mode jobs resulting in the GPU raising
> +	 * a CS_PROTM_PENDING request.
> +	 *
> +	 * This scenario is invalid and the protected mode jobs must
> +	 * not be allowed to progress.
> +	 */
> +	if (!ptdev->protm.heap)
> +		return;

Should we flag the group unusable when that happens and schedule it out
as soon as possible?

	if (!ptdev->protm.heap)
		group->fatal_queues |= BIT(cs_id);
	else
		group->protm_pending_queues |= BIT(cs_id);

	sched_queue_delayed_work(sched, tick, 0);

> +
> +	group->protm_pending_queues |= BIT(cs_id);
> +
> +	sched_queue_delayed_work(sched, tick, 0);
> +}
> +
>  static void
>  cs_slot_process_fatal_event_locked(struct panthor_device *ptdev,
>  				   u32 csg_id, u32 cs_id)
> @@ -1718,6 +1766,9 @@ static bool cs_slot_process_irq_locked(struct panthor_device *ptdev,
>  	if (events & CS_TILER_OOM)
>  		cs_slot_process_tiler_oom_event_locked(ptdev, csg_id, cs_id);
>  
> +	if (events & CS_PROTM_PENDING)
> +		cs_slot_process_protm_pending_event_locked(ptdev, csg_id, cs_id);
> +
>  	/* We don't acknowledge the TILER_OOM event since its handling is
>  	 * deferred to a separate work.
>  	 */
> @@ -1848,6 +1899,17 @@ static void sched_process_idle_event_locked(struct panthor_device *ptdev)
>  	sched_queue_delayed_work(ptdev->scheduler, tick, 0);
>  }
>  
> +static void sched_process_protm_exit_event_locked(struct panthor_device *ptdev)
> +{
> +	lockdep_assert_held(&ptdev->scheduler->lock);
> +
> +	/* Acknowledge the protm exit and schedule a tick. */
> +	panthor_fw_protm_exit(ptdev);

Let's just inline the content of panthor_fw_protm_exit() here.*
It doesn't make sense to have all these indirections, especially
since PROTM and scheduling are intertwined anyway, so I consider
it part of the scheduler responsibility (just like the scheduler
deals with other GLB events).

The same goes for the other panthor_fw_protm_ helpers defined in
panthor_fw.c, I think panthor_sched.c would be a better fit for
those, or even inlining their content if they are only used in
a single place.

> +	sched_queue_delayed_work(ptdev->scheduler, tick, 0);
> +	ptdev->scheduler->protm.protected_mode = false;
> +	ptdev->scheduler->protm.active_group = NULL;
> +}
> +
>  /**
>   * sched_process_global_irq_locked() - Process the scheduling part of a global IRQ
>   * @ptdev: Device.
> @@ -1863,6 +1925,9 @@ static void sched_process_global_irq_locked(struct panthor_device *ptdev)
>  	ack = READ_ONCE(glb_iface->output->ack);
>  	evts = (req ^ ack) & GLB_EVT_MASK;
>  
> +	if (evts & GLB_PROTM_EXIT)
> +		sched_process_protm_exit_event_locked(ptdev);
> +
>  	if (evts & GLB_IDLE)
>  		sched_process_idle_event_locked(ptdev);
>  }
> @@ -1872,23 +1937,71 @@ static void process_fw_events_work(struct work_struct *work)
>  	struct panthor_scheduler *sched = container_of(work, struct panthor_scheduler,
>  						      fw_events_work);
>  	u32 events = atomic_xchg(&sched->fw_events, 0);
> +	u32 csg_events = events & ~JOB_INT_GLOBAL_IF;
>  	struct panthor_device *ptdev = sched->ptdev;
>  
>  	mutex_lock(&sched->lock);
>  
> +	while (csg_events) {
> +		u32 csg_id = ffs(csg_events) - 1;
> +
> +		sched_process_csg_irq_locked(ptdev, csg_id);
> +		csg_events &= ~BIT(csg_id);
> +	}

I'm sure you have a good reason to re-order the processing
of CSG and GLB events, and it'd be good to have it documented
in a comment.

> +
>  	if (events & JOB_INT_GLOBAL_IF) {
>  		sched_process_global_irq_locked(ptdev);
>  		events &= ~JOB_INT_GLOBAL_IF;
>  	}
>  
> -	while (events) {
> -		u32 csg_id = ffs(events) - 1;
> +	mutex_unlock(&sched->lock);
> +}
>  
> -		sched_process_csg_irq_locked(ptdev, csg_id);
> -		events &= ~BIT(csg_id);
> +static void handle_protm_fault(struct panthor_device *ptdev)

This is a bit of a misnomer, I think. It doesn't seem to be triggered
by a FAULT event, it's more a timeout on a PROTM section that would
lead to a reset being scheduled, and this "blocked-in-protm" situation
being detected as part of the reset.

> +{
> +	struct panthor_scheduler *sched = ptdev->scheduler;
> +	u32 csg_id;
> +	struct panthor_group *protm_group;
> +
> +	guard(mutex)(&sched->lock);
> +
> +	if (!sched->protm.protected_mode)
> +		return;
> +
> +	protm_group = sched->protm.active_group;
> +
> +	if (drm_WARN_ON(&ptdev->base, !protm_group))
> +		return;

See, that's a perfect example of sched->protm.protected_mode being redundant.
Now you're left with a potential protected_mode=true,active_group=NULL
inconsistency you don't expect.

> +
> +	/* Group will be terminated by the device reset */
> +	protm_group->fatal_queues |= GENMASK(protm_group->queue_count - 1, 0);
> +
> +	if (!panthor_fw_protm_exit_wait_event_timeout(ptdev))
> +		goto cleanup_protm;
> +
> +	/**
> +	 * GPU failed to exit protected mode. Mark all non-protected mode CSGs

	/* GPU failed to exit protected mode. Mark all non-protected mode CSGs

> +	 * as suspended so that they are unaffected by the GPU reset.
> +	 */
> +
> +	for (csg_id = 0; csg_id < sched->csg_slot_count; csg_id++) {
> +		struct panthor_group *group = sched->csg_slots[csg_id].group;
> +
> +		if (!group || group == protm_group)
> +			continue;
> +
> +		group->state = PANTHOR_CS_GROUP_SUSPENDED;
> +
> +		group_unbind_locked(group);
> +
> +		list_move(&group->run_node, group_is_idle(group) ?
> +						&sched->groups.idle[group->priority] :
> +						&sched->groups.runnable[group->priority]);

nit: Let's use a local struct list_head * variable to select the right list.

>  	}
>  
> -	mutex_unlock(&sched->lock);
> +cleanup_protm:
> +	sched->protm.protected_mode = false;
> +	sched->protm.active_group = NULL;
>  }
>  
>  /**
> @@ -2029,6 +2142,7 @@ struct panthor_sched_tick_ctx {
>  	bool immediate_tick;
>  	bool stop_tick;
>  	u32 csg_upd_failed_mask;
> +	struct panthor_group *protm_group;
>  };
>  
>  static bool
> @@ -2299,6 +2413,7 @@ tick_ctx_evict_group(struct panthor_scheduler *sched,
>  
>  static void
>  tick_ctx_reschedule_group(struct panthor_scheduler *sched,
> +			  struct panthor_sched_tick_ctx *ctx,
>  			  struct panthor_csg_slots_upd_ctx *upd_ctx,
>  			  struct panthor_group *group,
>  			  int new_csg_prio)
> @@ -2321,6 +2436,30 @@ tick_ctx_reschedule_group(struct panthor_scheduler *sched,
>  					csg_iface->output->ack ^ CSG_ENDPOINT_CONFIG,
>  					CSG_ENDPOINT_CONFIG);
>  	}
> +
> +	if (ctx->protm_group == group) {
> +		for (u32 q = 0; q < group->queue_count; q++) {
> +			struct panthor_fw_cs_iface *cs_iface;
> +
> +			if (!(group->protm_pending_queues & BIT(q)))
> +				continue;
> +
> +			cs_iface = panthor_fw_get_cs_iface(ptdev, group->csg_id, q);
> +			panthor_fw_update_reqs(cs_iface, req, cs_iface->output->ack,
> +					       CS_PROTM_PENDING);
> +		}
> +
> +		panthor_fw_toggle_reqs(csg_iface, doorbell_req, doorbell_ack,
> +				       group->protm_pending_queues);
> +		csgs_upd_ctx_ring_doorbell(upd_ctx, group->csg_id);
> +		group->protm_pending_queues = 0;
> +
> +		/*
> +		 * We only allow one protected group to run at same time,
> +		 * as it makes it easier to handle faults in protected mode.

It's more something to document in the panthor_scheduler::protm::active_group
section.

> +		 */
> +		sched->protm.active_group = group;

Would it make sense to move this logic to a tick_ctx_handle_protm_group()
helper that's called before/after tick_ctx_reschedule_group()? This way
there's no extra if (ctx->protm_group == group) conditional branch in here.


static void
tick_ctx_handle_protm_group(struct panthor_scheduler *sched,
			    struct panthor_sched_tick_ctx *ctx,
 			    struct panthor_csg_slots_upd_ctx *upd_ctx)
{
	struct panthor_device *ptdev = sched->ptdev;
	struct panthor_group *group = ctx->protm_group;
	struct panthor_fw_csg_iface *csg_iface;

	if (!group || drm_WARN_ON(&ptdev->base, group->csg_id < 0))
		return;

	csg_iface = panthor_fw_get_csg_iface(ptdev, group->csg_id);
	for (u32 q = 0; q < group->queue_count; q++) {
		struct panthor_fw_cs_iface *cs_iface;

		if (!(group->protm_pending_queues & BIT(q)))
			continue;

		cs_iface = panthor_fw_get_cs_iface(ptdev, group->csg_id, q);
		panthor_fw_update_reqs(cs_iface, req, cs_iface->output->ack,
				       CS_PROTM_PENDING);
	}

	panthor_fw_toggle_reqs(csg_iface, doorbell_req, doorbell_ack,
			       group->protm_pending_queues);
	csgs_upd_ctx_ring_doorbell(upd_ctx, group->csg_id);
	group->protm_pending_queues = 0;
	sched->protm.active_group = group;
}

> +	}
>  }
>  
>  static void
> @@ -2336,6 +2475,17 @@ tick_ctx_schedule_group(struct panthor_scheduler *sched,
>  	group_bind_locked(group, csg_id);
>  	csg_slot_prog_locked(ptdev, csg_id, csg_prio);
>  
> +	/* If the group was waiting for protected mode before suspension,
> +	 * and the tick context enters this mode, it should be serviced
> +	 * immediately because the slot reset should have set the
> +	 * CS_PROTM_PENDING bit to zero, and cs_prog_slot_locked() sets it to
> +	 * zero too.
> +	 * It's not clear if we will get a new CS_PROTM_PENDING event in that
> +	 * case, but it should be safe either way.
> +	 */
> +	if (group->protm_pending_queues && ctx->protm_group)
> +		group->protm_pending_queues = 0;

I'd move this to the path where we do the SUSPEND, or group_unbind(), even.

> +
>  	csgs_upd_ctx_queue_reqs(ptdev, upd_ctx, csg_id,
>  				group->state == PANTHOR_CS_GROUP_SUSPENDED ?
>  				CSG_STATE_RESUME : CSG_STATE_START,
> @@ -2365,7 +2515,7 @@ tick_ctx_apply(struct panthor_scheduler *sched, struct panthor_sched_tick_ctx *c
>  
>  		/* Update priorities on already running groups. */
>  		list_for_each_entry(group, &ctx->groups[prio], run_node) {
> -			tick_ctx_reschedule_group(sched, &upd_ctx, group, new_csg_prio--);
> +			tick_ctx_reschedule_group(sched, ctx, &upd_ctx, group, new_csg_prio--);
>  		}
>  	}
>  
> @@ -2457,6 +2607,15 @@ tick_ctx_apply(struct panthor_scheduler *sched, struct panthor_sched_tick_ctx *c
>  
>  	sched->used_csg_slot_count = ctx->group_count;
>  	sched->might_have_idle_groups = ctx->idle_group_count > 0;
> +
> +	if (ctx->protm_group) {
> +		ret = panthor_fw_protm_enter(ptdev);
> +		if (ret) {
> +			panthor_device_schedule_reset(ptdev);
> +			ctx->csg_upd_failed_mask = U32_MAX;

It's weird to flag it as all CSGs update failed. Should we instead
have

			/* If we failed to enter PROTM, consider the group who
			 * requested it as failed.
			 */
			ctx->csg_upd_failed_mask |= BIT(ctx->protm_group->csg_id);

> +		}
> +		sched->protm.protected_mode = true;

I'd move that to a tick_ctx_service_protm_req() helper that has the
panthor_fw_protm_enter() inlined, because again, it doesn't make
sense to have this defined in panthor_fw.c if the only user lives
in panthor_sched.c

> +	}
>  }
>  
>  static u64
> @@ -2490,7 +2649,7 @@ static void tick_work(struct work_struct *work)
>  	u64 resched_target = sched->resched_target;
>  	u64 remaining_jiffies = 0, resched_delay;
>  	u64 now = get_jiffies_64();
> -	int prio, ret, cookie;
> +	int prio, protm_prio, ret, cookie;
>  	bool full_tick;
>  
>  	if (!drm_dev_enter(&ptdev->base, &cookie))
> @@ -2564,14 +2723,49 @@ static void tick_work(struct work_struct *work)
>  		}
>  	}
>  
> +	/* Check if the highest priority group want to switch to protected mode */
> +	for (protm_prio = PANTHOR_CSG_PRIORITY_COUNT - 1; protm_prio >= 0; protm_prio--) {
> +		struct panthor_group *group;
> +
> +		group = list_first_entry_or_null(&ctx.groups[protm_prio],
> +						 struct panthor_group,
> +						 run_node);
> +		if (group) {
> +			ctx.protm_group = group;
> +			break;
> +		}

Should this be

		if (group) {
			if (group->protm_pending_queues)
				ctx.protm_group = group;

			break;
		}

?

> +	}
> +
>  	/* If we have free CSG slots left, pick idle groups */
> -	for (prio = PANTHOR_CSG_PRIORITY_COUNT - 1;
> -	     prio >= 0 && !tick_ctx_is_full(sched, &ctx);
> -	     prio--) {

How about we keep it a single indentation level and skip higher prios if
PROTM is requested:

		/* Pick only idle groups with equal or lower priority than the
		 * group triggering protected mode. Do not bother picking
		 * unscheduled idle groups.
		 */
		if (ctx.protm_group && prio < protm_prio)
			continue;

This saves us an indentation level and limits the code duplication.

> -		/* Check the old_group queue first to avoid reprogramming the slots */
> -		tick_ctx_pick_groups_from_list(sched, &ctx, &ctx.old_groups[prio], false, true);
> -		tick_ctx_pick_groups_from_list(sched, &ctx, &sched->groups.idle[prio],
> -					       false, false);
> +	if (ctx.protm_group) {
> +		/* Pick only idle groups with equal or lower priority than the
> +		 * group triggering protected mode. Do not bother picking
> +		 * unscheduled idle groups.
> +		 */
> +		for (prio = protm_prio;
> +		     prio >= 0 && !tick_ctx_is_full(sched, &ctx);
> +		     prio--)
> +			tick_ctx_pick_groups_from_list(sched, &ctx,
> +						       &ctx.old_groups[prio],
> +						       false, true);
> +	} else {
> +		/* No switch to protected, just pick any idle group according
> +		 * to priority
> +		 */
> +		for (prio = PANTHOR_CSG_PRIORITY_COUNT - 1;
> +		     prio >= 0 && !tick_ctx_is_full(sched, &ctx);
> +		     prio--) {
> +			/* Check the old_group queue first to avoid
> +			 * reprogramming the slots
> +			 */
> +			tick_ctx_pick_groups_from_list(sched, &ctx,
> +						       &ctx.old_groups[prio],
> +						       false, true);
> +			tick_ctx_pick_groups_from_list(sched, &ctx,
> +						       &sched->groups.idle[prio],
> +						       false, false);
> +		}
> +
>  	}
>  
>  	tick_ctx_apply(sched, &ctx);
> @@ -2993,6 +3187,8 @@ void panthor_sched_pre_reset(struct panthor_device *ptdev)
>  	cancel_work_sync(&sched->sync_upd_work);
>  	cancel_delayed_work_sync(&sched->tick_work);
>  
> +	handle_protm_fault(ptdev);

I actually wonder if this should be part of the panthor_sched_suspend()
logic. That is, we would automatically flag all non-protm groups as
suspended if the GPU was in PROTM mode at the time the hang happened.

> +
>  	panthor_sched_suspend(ptdev);
>  
>  	/* Stop all groups that might still accept jobs, so we don't get passed

Regards,

Boris

