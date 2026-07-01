Return-Path: <linux-media+bounces-66170-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1641MHfURGpC1goAu9opvQ
	(envelope-from <linux-media+bounces-66170-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 01 Jul 2026 10:48:55 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C1006EB433
	for <lists+linux-media@lfdr.de>; Wed, 01 Jul 2026 10:48:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("headers rsa verify failed") header.d=igalia.com header.s=20170329 header.b=CNK8dPCz;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66170-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66170-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=igalia.com (policy=none);
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3AF833120970
	for <lists+linux-media@lfdr.de>; Wed,  1 Jul 2026 08:45:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06E9F3EDE52;
	Wed,  1 Jul 2026 08:45:07 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 520AA3B2FF6
	for <linux-media@vger.kernel.org>; Wed,  1 Jul 2026 08:45:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782895506; cv=none; b=UyW/GIeO0lQ17GISoEj1KDT7vYfAIvlDnc3b4d17USsG/jLws+tlTmzkX6j/T88dKWWfPJkqw9kDYoB4oIt7gSAKdLe2fkj8JIRvjtX61yukyrHEnFDuQZCLrSzUlZzkq0mr3bHIFMVm6vVMldam3aWGJ0QRInqNllizURRZiR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782895506; c=relaxed/simple;
	bh=Vz239xCltOhkTgeoGvaIFg6rYZjKGMrz8jDBpeqAEpU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lBjy++g/qkEosTYUt/flhiuqKW/82RIi62XMhjJqhuiarareP+2ye5JBb8xgqhgLvRGw/0XEQoy1h/mlMIHgJD/XaeD5Xwp4ibIdAAnSg/oOtgEH6yiebNOT1N3AcO1dphtjZBqJ7wmruDcWlud45npaQazGv1iuUNlTYb/Mem4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=CNK8dPCz; arc=none smtp.client-ip=213.97.179.56
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Vcr9hDLfN5srlwZ5qfiqQl9LSdudUQDmJHBwn+BWzxc=; b=CNK8dPCzUY0KTxowYj9l/wPf5V
	Xq4Lh9DqMwr/uiu0tjxHrFyffPmPDpMlIQ0woTTCjARljDZaocyLZ/4bfNEMG+92YQ5X7QtBHGt+Z
	ekSNdDbXziQzudZ8pDOSDjkPJZUY0q5IDh2E+IYHn6NC6DwDs37HFtIvp4Jh9qobyZG6epO1SUSf+
	Fcku8rZcAme5wPNLexwQHBEiJQ3+C5KstkLiklRE1FKM5ySzcWTSrolioRughWoWWxl7l9QpFObQU
	ybpv9aBxSgoxOe8hSI5EZir4Ski7mJ6HmdHV18l/FPYq4njK14Xwe5mdPCi+qBiJhHhso+dTLbPU3
	Ut03HdTg==;
Received: from [90.240.106.137] (helo=[192.168.0.116])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1weqYt-007Tf1-I4; Wed, 01 Jul 2026 10:44:51 +0200
Message-ID: <d30b496e-2971-429d-b49d-4fe6e15a1830@igalia.com>
Date: Wed, 1 Jul 2026 09:44:50 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/10] dma-buf: use dma_fence_test_signaled_flag()
To: christian.koenig@amd.com, phasta@kernel.org, simona@ffwll.ch,
 sumit.semwal@linaro.org, dakr@kernel.org
Cc: dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
References: <20260624122917.2483-1-christian.koenig@amd.com>
 <20260624122917.2483-3-christian.koenig@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <20260624122917.2483-3-christian.koenig@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:christian.koenig@amd.com,m:phasta@kernel.org,m:simona@ffwll.ch,m:sumit.semwal@linaro.org,m:dakr@kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[igalia.com:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-66170-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[tvrtko.ursulin@igalia.com,linux-media@vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tvrtko.ursulin@igalia.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1C1006EB433


On 24/06/2026 12:13, Christian König wrote:
> Instead of dma_fence_is_signaled_locked() use
> dma_fence_test_signaled_flag().
> 
> The extra polling check seems unecessary for those use cases.

I echo the comment that better commit messages are needed in this 
series. Also, the patch affects two really different areas so should be 
split in two.

> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>   drivers/dma-buf/sw_sync.c | 2 +-
>   include/linux/dma-fence.h | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/dma-buf/sw_sync.c b/drivers/dma-buf/sw_sync.c
> index 8df20b0218a9..243991bc1506 100644
> --- a/drivers/dma-buf/sw_sync.c
> +++ b/drivers/dma-buf/sw_sync.c
> @@ -262,7 +262,7 @@ static struct sync_pt *sync_pt_create(struct sync_timeline *obj,
>   	INIT_LIST_HEAD(&pt->link);
>   
>   	spin_lock_irq(&obj->lock);
> -	if (!dma_fence_is_signaled_locked(&pt->base)) {
> +	if (!dma_fence_test_signaled_flag(&pt->base)) {
>   		struct rb_node **p = &obj->pt_tree.rb_node;
>   		struct rb_node *parent = NULL;
>   

I am not familiar with the implementation but this looks safe to me. It 
appears the point is to just not allow userspace inserting past fences 
into the internal tracking structures.

> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
> index 158cd609f103..803e10ca76e3 100644
> --- a/include/linux/dma-fence.h
> +++ b/include/linux/dma-fence.h
> @@ -658,7 +658,7 @@ static inline struct dma_fence *dma_fence_later(struct dma_fence *f1,
>    */
>   static inline int dma_fence_get_status_locked(struct dma_fence *fence)
>   {
> -	if (dma_fence_is_signaled_locked(fence))
> +	if (dma_fence_test_signaled_flag(fence))
>   		return fence->error ?: 1;
>   	else
>   		return 0;

This one has more callers.

1. sync_fence - should be fine.
2. amdgpu - Smallish false positive race on reset? But possibly okay. 
Your call.
3. Selftests - single threaded so okay.
4. Nouveau - looks like some sort of a last gasp check for signaled 
status when wait expired. It's a 15 second timeout so I guess fine as well.

So in summary, changes look fine to me. But I would split sw_sync and 
get_status and improve the commit message for both.

Regards,

Tvrtko


