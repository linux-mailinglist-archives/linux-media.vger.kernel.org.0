Return-Path: <linux-media+bounces-60468-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iKNpKQ0l+mlIKQMAu9opvQ
	(envelope-from <linux-media+bounces-60468-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 19:12:45 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 121924D1E22
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 19:12:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0DBB0305F158
	for <lists+linux-media@lfdr.de>; Tue,  5 May 2026 17:12:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0C5F4A2E08;
	Tue,  5 May 2026 17:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Xk1TcFWW"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A452748B396;
	Tue,  5 May 2026 17:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778001128; cv=none; b=A2lgpR2kabcP8I6TDyqLYgGkcVZN1u2Qdw4uXYtF6K+g+jpThCdyOFaUQHxbjy3NhOTxhjAhBTEPC4Lxyq9mj+qjiL+pttogZGIF2RJBTmG8HCOJztx1zjRubg0tvDdkp2SdexK8pCeJ2GZkZ+bLXFC8xDpppoJTv3SYl27zGp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778001128; c=relaxed/simple;
	bh=l0cSBZtY8v8/BXAKjOef5rDCo9Ch/FtnYTeDMKLxKf8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=p/7XdEfqsrpcQ4sqQslJ2cBfYByos+vZ65Z+SdCbEL1j6oPp+OHrTf/OOpXbzM26nT0nNmwSPc672OVfzTjetAvxwvXEufzoZaYF3u+XATjcdKE31V7NssdZjezmk+lGIHAAArPxohLZT65x8FiudoSOfmV6LueIjEs+SSKrn1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Xk1TcFWW; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1778001124;
	bh=l0cSBZtY8v8/BXAKjOef5rDCo9Ch/FtnYTeDMKLxKf8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Xk1TcFWWz+b4FqFamS1MxscOyUDHkM5B+1fXmOorHcQCB8J4fuK7O4MEuyUNnU6gs
	 7QRX71N6cQOJgDgjyLFAHe+iVXQMuhaX5QTAH0iQ8ApUpSpZGreexSbVVJVIojQt3u
	 bGxTv8egBbuPyX60cADHbo0NrgNMmXAu3klzJ1Rdp/+LwKlWHTUwBQnv13AjBdTTLT
	 h5wWO1IVGMUSqulMu6FqHl9Aydn9W2OWWCdLTAFCfWyoV9vSF3r8cvH7P1m5qf/N+9
	 8Kq5kP3GQLttM6oQNn4G8ywaFJPDTO7ygW3lA+ZNI3q1mdXjZw76hRFCpSdeI1qYDk
	 WKxLeeWxUC1GQ==
Received: from fedora (unknown [100.64.0.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C575A17E1313;
	Tue,  5 May 2026 19:12:03 +0200 (CEST)
Date: Tue, 5 May 2026 19:11:59 +0200
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
Message-ID: <20260505191159.0b9a0c0b@fedora>
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
X-Rspamd-Queue-Id: 121924D1E22
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60468-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,arm.com:email,collabora.com:dkim]

On Tue,  5 May 2026 16:05:13 +0200
Ketil Johnsen <ketil.johnsen@arm.com> wrote:

> From: Florent Tomasin <florent.tomasin@arm.com>
> 
> This patch modifies the Panthor driver code to allow handling
> of the GPU HW protected mode enter and exit.
> 
> The logic added by this patch includes:
> - the mechanisms needed for entering and exiting protected mode.
> - the handling of protected mode IRQs and FW interactions.
> - the scheduler changes needed to decide when to enter
>   protected mode based on CSG scheduling.
> 
> Note that the submission of a protected mode jobs are done
> from the user space.
> 
> The following is a summary of how protected mode is entered
> and exited:
> - When the GPU detects a protected mode job needs to be
>   executed, an IRQ is sent to the CPU to notify the kernel
>   driver that the job is blocked until the GPU has entered
>   protected mode. The entering of protected mode is controlled
>   by the kernel driver.
> - The Mali Panthor CSF driver will schedule a tick and evaluate
>   which CS in the CSG to schedule on slot needs protected mode.
>   If the priority of the CSG is not sufficiently high, the
>   protected mode job will not progress until the CSG is
>   scheduled at top priority.
> - The Panthor scheduler notifies the GPU that the blocked
>   protected jobs will soon be able to progress.
> - Once all CSG and CS slots are updated, the scheduler
>   requests the GPU to enter protected mode and waits for
>   it to be acknowledged.
> - If successful, all protected mode jobs will resume execution
>   while normal mode jobs block until the GPU exits
>   protected mode, or the kernel driver rotates the CSGs
>   and forces the GPU to exit protected mode.
> - If unsuccessful, the scheduler will request a GPU reset.
> - When a protected mode job is suspended as a result of
>   the CSGs rotation, the GPU will send an IRQ to the CPU
>   to notify that the protected mode job needs to resume.
> 
> This sequence will continue so long the user space is
> submitting protected mode jobs.
> 
> Signed-off-by: Florent Tomasin <florent.tomasin@arm.com>
> Co-developed-by: Paul Toadere <paul.toadere@arm.com>
> Signed-off-by: Paul Toadere <paul.toadere@arm.com>
> Co-developed-by: Samuel Percival <samuel.percival@arm.com>
> Signed-off-by: Samuel Percival <samuel.percival@arm.com>
> Co-developed-by: Ketil Johnsen <ketil.johnsen@arm.com>
> Signed-off-by: Ketil Johnsen <ketil.johnsen@arm.com>
> ---
>  drivers/gpu/drm/panthor/panthor_device.c |   1 +
>  drivers/gpu/drm/panthor/panthor_device.h |   9 +
>  drivers/gpu/drm/panthor/panthor_fw.c     |  86 ++++++++-
>  drivers/gpu/drm/panthor/panthor_fw.h     |   5 +
>  drivers/gpu/drm/panthor/panthor_gpu.c    |  14 +-
>  drivers/gpu/drm/panthor/panthor_gpu.h    |   6 +
>  drivers/gpu/drm/panthor/panthor_mmu.c    |  10 +
>  drivers/gpu/drm/panthor/panthor_sched.c  | 224 +++++++++++++++++++++--
>  8 files changed, 339 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
> index 3a5cdfa99e5fe..449f17b0f4c5c 100644
> --- a/drivers/gpu/drm/panthor/panthor_device.c
> +++ b/drivers/gpu/drm/panthor/panthor_device.c
> @@ -207,6 +207,7 @@ int panthor_device_init(struct panthor_device *ptdev)
>  
>  	ptdev->soc_data = of_device_get_match_data(ptdev->base.dev);
>  
> +	init_rwsem(&ptdev->protm.lock);
>  	init_completion(&ptdev->unplug.done);
>  	ret = drmm_mutex_init(&ptdev->base, &ptdev->unplug.lock);
>  	if (ret)
> diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
> index d51fec97fc5fa..ebeec45cf60a1 100644
> --- a/drivers/gpu/drm/panthor/panthor_device.h
> +++ b/drivers/gpu/drm/panthor/panthor_device.h
> @@ -334,6 +334,15 @@ struct panthor_device {
>  	struct {
>  		/** @heap: Pointer to the protected heap */
>  		struct dma_heap *heap;
> +
> +		/**
> +		 * @lock: Lock to prevent VM operations during protected mode.

Here it says the lock prevents VM ops while the GPU is in protected
mode, but...

> +		 *
> +		 * The MMU will not execute commands when the GPU is in
> +		 * protected mode, so we use this RW lock to sync access
> +		 * between VM_BIND and GPU protected mode.
> +		 */
> +		struct rw_semaphore lock;
>  	} protm;
>  };
>  
> diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
> index 1aba29b9779b6..281556530ddab 100644
> --- a/drivers/gpu/drm/panthor/panthor_fw.c
> +++ b/drivers/gpu/drm/panthor/panthor_fw.c
> @@ -1057,7 +1057,9 @@ static void panthor_fw_init_global_iface(struct panthor_device *ptdev)
>  					 GLB_CFG_PROGRESS_TIMER |
>  					 GLB_CFG_POWEROFF_TIMER |
>  					 GLB_IDLE_EN |
> -					 GLB_IDLE;
> +					 GLB_IDLE |
> +					 GLB_PROTM_ENTER |
> +					 GLB_PROTM_EXIT;
>  
>  	if (panthor_fw_has_glb_state(ptdev))
>  		glb_iface->input->ack_irq_mask |= GLB_STATE_MASK;
> @@ -1456,6 +1458,88 @@ static void panthor_fw_ping_work(struct work_struct *work)
>  	}
>  }
>  
> +int panthor_fw_protm_enter(struct panthor_device *ptdev)
> +{
> +	struct panthor_fw_global_iface *glb_iface;
> +	u32 acked;
> +	u32 status;
> +	int ret;
> +
> +	down_write(&ptdev->protm.lock);
> +
> +	glb_iface = panthor_fw_get_glb_iface(ptdev);
> +
> +	panthor_fw_toggle_reqs(glb_iface, req, ack, GLB_PROTM_ENTER);
> +	gpu_write(ptdev, CSF_DOORBELL(CSF_GLB_DOORBELL_ID), 1);
> +
> +	ret = panthor_fw_glb_wait_acks(ptdev, GLB_PROTM_ENTER, &acked, 4000);
> +	if (ret) {
> +		drm_err(&ptdev->base, "Wait for FW protected mode acknowledge timed out");
> +		up_write(&ptdev->protm.lock);
> +		return ret;
> +	}
> +
> +	/* Wait for the GPU to actually enter protected mode.
> +	 * There would be some time gap between FW sending the
> +	 * ACK for GLB_PROTM_ENTER and GPU entering protected mode.
> +	 */
> +	if (gpu_read_poll_timeout(ptdev, GPU_STATUS, status,
> +				  (status & GPU_STATUS_PROTM_ACTIVE) ||
> +					  ((glb_iface->input->req ^ glb_iface->output->ack) &
> +					   GLB_PROTM_EXIT),
> +				  10, 500000)) {
> +		drm_err(&ptdev->base, "Wait for GPU protected mode enter timed out");
> +		ret = -ETIMEDOUT;
> +	}
> +
> +	up_write(&ptdev->protm.lock);

... here I see the lock being released right after we've entered
protected mode. Meaning the MMU layer can proceed with any pending VM
ops even though the GPU only exists PROTM when panthor_fw_protm_exit()
is called. If this is expected, the protm::lock doc should be updated to
reflect that.

Also, I don't think a rw_semaphore alone is enough to cover the kind of
critical section you're trying to declare, because it requires that the
lock is taken/released from the same thread, and
panthor_fw_protm_enter()/panthor_fw_protm_exit() will be called from
different work items. This probably explains why the doc no longer
matches the implementation.

I guess this could be reworked to use a combination of rwlock+completion,
where the VM logic does something like:

	down_read(protm.lock);
	while (!try_wait_for_completion(protm.complete)) {
		up_read(protm.lock);
		if (!wait_for_completion_timeout(protm.complete, timeout)) {
			schedule_reset();
			return -ETIMEDOUT;
		}
		down_read(protm.lock);
	}

	// proceed with the VM op

	up_read(protm.lock);

in panthor_fw_protm_enter(), you'd take the lock in write mode,
reinit the completion object, release the lock, and proceed with
the PROTM operation. If it fails, you call complete_all()
immediately, if it works, you defer the complete_all() to the
panthor_fw_protm_exit() path.

> +
> +	return ret;
> +}
> +
> +void panthor_fw_protm_exit(struct panthor_device *ptdev)
> +{
> +	struct panthor_fw_global_iface *glb_iface = panthor_fw_get_glb_iface(ptdev);
> +
> +	/* Acknowledge the protm exit. */
> +	panthor_fw_update_reqs(glb_iface, req, glb_iface->output->ack, GLB_PROTM_EXIT);
> +}
> +
> +int panthor_fw_protm_exit_wait_event_timeout(struct panthor_device *ptdev)
> +{
> +	struct panthor_fw_global_iface *glb_iface = panthor_fw_get_glb_iface(ptdev);
> +	int ret = 0;
> +
> +	/* Send PING request to force an exit */
> +	panthor_fw_toggle_reqs(glb_iface, req, ack, GLB_PING);

Uh, if a PING triggers a PROTM exit, we should probably pause the PING
(or reschedule it) right before entering PROTM, otherwise timings might
make it so PROTM is exited almost immediately after enter.

> +	gpu_write(ptdev, CSF_DOORBELL(CSF_GLB_DOORBELL_ID), 1);
> +
> +	ret = wait_event_timeout(ptdev->fw->req_waitqueue,
> +				 !(gpu_read(ptdev, GPU_STATUS) & GPU_STATUS_PROTM_ACTIVE),
> +				 msecs_to_jiffies(500));
> +
> +	if (!ret) {
> +		drm_err(&ptdev->base, "Wait for forced protected mode exit timed out");
> +		panthor_device_schedule_reset(ptdev);
> +		return -ETIMEDOUT;
> +	}
> +
> +	return 0;
> +}
> +
> +void panthor_fw_protm_exit_sync(struct panthor_device *ptdev)
> +{
> +	u32 status;
> +
> +	/* Busy-wait (5ms) for FW to exit protected mode on its own */
> +	if (!gpu_read_poll_timeout(ptdev, GPU_STATUS, status,
> +				   !(status & GPU_STATUS_PROTM_ACTIVE), 10,
> +				   5000))
> +		return;
> +
> +	panthor_fw_protm_exit_wait_event_timeout(ptdev);
> +}

I'll stop there for now.

Regards,

Boris

