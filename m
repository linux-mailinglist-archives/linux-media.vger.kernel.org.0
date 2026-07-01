Return-Path: <linux-media+bounces-66183-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jelKNG3aRGqf2AoAu9opvQ
	(envelope-from <linux-media+bounces-66183-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 01 Jul 2026 11:14:21 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CCE86EB825
	for <lists+linux-media@lfdr.de>; Wed, 01 Jul 2026 11:14:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("headers rsa verify failed") header.d=igalia.com header.s=20170329 header.b=DsTVFV9J;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66183-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66183-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=igalia.com (policy=none);
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B3CF9303FFA1
	for <lists+linux-media@lfdr.de>; Wed,  1 Jul 2026 09:14:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 615CA3EF0A4;
	Wed,  1 Jul 2026 09:14:16 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A4513C108E
	for <linux-media@vger.kernel.org>; Wed,  1 Jul 2026 09:14:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782897255; cv=none; b=BhoxDcILgSWHSZ5cIBSicAuBkbR05w+YAvDlqllM3pg0SGAM3kIyZNOpzzvjSKSXFaJDDzN8YlQDGHXPCpy42I+e43lTtluS6UCTMKXJ02PIxgS8J77TDxfZhBspmY3oGFBHz/hmj0YX4vF6qzlUeC0mMbANGvZq2lmjTTU1D1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782897255; c=relaxed/simple;
	bh=mt3K3KMOZkxYLbEU/3GzgWQsbBpn0u8yFoIItmgAUrk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TkG63JfGosB4EGJexkmyjK3InksQok4k1US0428Etz6OkeAYTIYEhHyZNN7zXLvNoxF2/DhrGjpyrE70mOChtQSr1ofm4q8hJM1VaJHQSl7kqbbojy+Xx9+Kwwhw4kd6NfvA6MABiENYvs2pdSZuoXglsvZY1oWegZZajokGD7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=DsTVFV9J; arc=none smtp.client-ip=213.97.179.56
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=1TYMgFbsZk3C4VsIV6cOCwS3sYW9gqVKz0hDjm9HJmM=; b=DsTVFV9JoWtCweWr6kX9IAi8At
	PwNORQnTyasxMakqw37DYc/UVQ78O17cKXNxZ78IJt58z4QiyS+D7s8qeiICGF/rV/U3sjRAitSk7
	9X6TxB4wf3rOtAEoHXcXYVDtq3RBpjRxQfIfyJ2qXMhyCu40vQL23TqECUXg6F7pIE6KsFz9gpNW5
	IeG225lYq2xAtjbZXpVKALwhGO6x+Go/V3cMnbAWcTONjC6CL72iB4Gohkcwl/+jLpbKEvzMh9lmc
	+zqeRXiFunlgCIalJED+qTMcV8VJm4GlbsCHSQRmAbsMn2DQpAN6g0nIrTkcS1LULjrvKYOjkYqbz
	E+jl5jLA==;
Received: from [90.240.106.137] (helo=[192.168.0.116])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1wer1C-007UF9-1h; Wed, 01 Jul 2026 11:14:06 +0200
Message-ID: <6f4a8e96-db41-4609-8c84-54d847911857@igalia.com>
Date: Wed, 1 Jul 2026 10:14:05 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/10] drm/amdgpu: use dma_fence_test_signaled_flag()
To: christian.koenig@amd.com, phasta@kernel.org, simona@ffwll.ch,
 sumit.semwal@linaro.org, dakr@kernel.org
Cc: dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
References: <20260624122917.2483-1-christian.koenig@amd.com>
 <20260624122917.2483-4-christian.koenig@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <20260624122917.2483-4-christian.koenig@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[igalia.com:-];
	TAGGED_FROM(0.00)[bounces-66183-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[tvrtko.ursulin@igalia.com,linux-media@vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:christian.koenig@amd.com,m:phasta@kernel.org,m:simona@ffwll.ch,m:sumit.semwal@linaro.org,m:dakr@kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tvrtko.ursulin@igalia.com,linux-media@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,amd.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2CCE86EB825


On 24/06/2026 12:13, Christian König wrote:
> Instead of dma_fence_is_signaled_locked() use
> dma_fence_test_signaled_flag().
> 
> The extra polling check seems unecessary for those use cases.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c       | 8 ++++----
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c        | 2 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c | 2 +-
>   3 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> index ea69b1bac7c6..1192b9800ff2 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> @@ -652,7 +652,7 @@ void amdgpu_fence_driver_set_error(struct amdgpu_ring *ring, int error)
>   
>   		fence = rcu_dereference_protected(drv->fences[i],
>   						  lockdep_is_held(&drv->lock));
> -		if (fence && !dma_fence_is_signaled_locked(fence))
> +		if (fence && !dma_fence_test_signaled_flag(fence))
>   			dma_fence_set_error(fence, error);
>   	}
>   	spin_unlock_irqrestore(&drv->lock, flags);
> @@ -677,7 +677,7 @@ void amdgpu_fence_driver_force_completion(struct amdgpu_ring *ring,
>   
>   		fence = rcu_dereference_protected(drv->fences[i],
>   						  lockdep_is_held(&drv->lock));
> -		if (fence && !dma_fence_is_signaled_locked(fence)) {
> +		if (fence && !dma_fence_test_signaled_flag(fence)) {
>   			if (fence == timedout_fence)
>   				dma_fence_set_error(fence, -ETIME);
>   			else
> @@ -738,7 +738,7 @@ void amdgpu_ring_set_fence_errors_and_reemit(struct amdgpu_ring *ring,
>   		rcu_read_lock();
>   		unprocessed = rcu_dereference(*ptr);
>   
> -		if (unprocessed && !dma_fence_is_signaled_locked(unprocessed)) {
> +		if (unprocessed && !dma_fence_test_signaled_flag(unprocessed)) {
>   			fence = container_of(unprocessed, struct amdgpu_fence, base);
>   			is_guilty_fence = fence == guilty_fence;
>   			is_guilty_context = fence->context == guilty_fence->context;
> @@ -802,7 +802,7 @@ void amdgpu_ring_backup_unprocessed_commands(struct amdgpu_ring *ring,
>   		rcu_read_lock();
>   		unprocessed = rcu_dereference(*ptr);
>   
> -		if (unprocessed && !dma_fence_is_signaled(unprocessed)) {
> +		if (unprocessed && !dma_fence_test_signaled_flag(unprocessed)) {
>   			fence = container_of(unprocessed, struct amdgpu_fence, base);
>   
>   			amdgpu_ring_backup_unprocessed_command(ring, fence);

No fence->ops->signaled so all good.

> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c
> index d6bee5c30073..ae9d6a2eefab 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c
> @@ -460,7 +460,7 @@ bool amdgpu_ring_soft_recovery(struct amdgpu_ring *ring, unsigned int vmid,
>   		return false;
>   
>   	dma_fence_lock_irqsave(fence, flags);
> -	if (!dma_fence_is_signaled_locked(fence))
> +	if (!dma_fence_test_signaled_flag(fence))
>   		dma_fence_set_error(fence, -ENODATA);
>   	dma_fence_unlock_irqrestore(fence, flags);

A bit of an odd function? With this change it becomes:

	dma_fence_lock_irqsave(fence, flags);
	if (!dma_fence_test_signaled_flag(fence))
		dma_fence_set_error(fence, -ENODATA);
	dma_fence_unlock_irqrestore(fence, flags);

	while (!dma_fence_is_signaled(fence) &&
	       ktime_to_ns(ktime_sub(deadline, ktime_get())) > 0)
		ring->funcs->soft_recovery(ring, vmid);

	ret = dma_fence_is_signaled(fence);

Does this flow make sense?

>   
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
> index a41fb72dba94..2cc6552a6399 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
> @@ -426,7 +426,7 @@ amdgpu_userq_fence_driver_set_error(struct amdgpu_userq_fence *fence,
>   
>   	f = rcu_dereference_protected(&fence->base,
>   				      lockdep_is_held(&fence_drv->fence_list_lock));
> -	if (f && !dma_fence_is_signaled_locked(f))
> +	if (f && !dma_fence_test_signaled_flag(f))
>   		dma_fence_set_error(f, error);
>   	spin_unlock_irqrestore(&fence_drv->fence_list_lock, flags);
>   }

amdgpu_userq_fence_signaled does exists so is there any scope for this 
to open a false positive window?

Regards,

Tvrtko


