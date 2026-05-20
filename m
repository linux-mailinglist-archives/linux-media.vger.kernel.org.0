Return-Path: <linux-media+bounces-62323-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id COEyDEvWDWrW3wUAu9opvQ
	(envelope-from <linux-media+bounces-62323-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 17:42:03 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C383159119A
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 17:42:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4828D33BDF4C
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 15:27:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD50C3F2116;
	Wed, 20 May 2026 15:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="f+yESunc"
X-Original-To: linux-media@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93DE53F0773;
	Wed, 20 May 2026 15:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779290815; cv=none; b=qEfuFc8w6558BiuG50eDj081qdyosAVTUDy0MvoBwgPyGBRdrYTjFgIYNyVua/LDgpMD6XgrOPg5GbHXfp4XMpLU86Zrf3pqjeToMdg3MfH5ZWhxKygczt98y6wCWmhi82aWKy2CWTMSbLHm89ImK1Xp/JN2lzwc0EbfdFt+vfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779290815; c=relaxed/simple;
	bh=eLC/lLOsDoMQiE0jluMI03wSqZDhZ3ckHXClsCDD384=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H7uGmoUgsui1k5NBFL0r6JHZR3l9c/Us0LV4OgPIAMRz3CLbBBc81LDHoJ4ZThIULGypZhCGepmKcMCeaMePh4yXKtib9vTXfXxuIAFTaVOsG94Rn4d2VGZBUxS4/eiYarnD068Y5413Uw7SmgmldNT+wTwc/mxhJgSaDHfdP30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=f+yESunc; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DF51A16A3;
	Wed, 20 May 2026 08:26:47 -0700 (PDT)
Received: from [10.57.33.178] (unknown [10.57.33.178])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7D7983F632;
	Wed, 20 May 2026 08:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779290813; bh=eLC/lLOsDoMQiE0jluMI03wSqZDhZ3ckHXClsCDD384=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=f+yESunc5ez5O58FRCGqT9OtLFER+maqB8lJEI5P/bIW7+o4XTXgxrvwrJDG0yj7J
	 w7mkmCSC8xH/fgavdxKgMPkgJkcDq5KeUIyui4SFjiObcJt031Saey/lCZC3GXceOP
	 4l3okcDO3twVQCU+/OLT86+0vUU7YMaM+3/umRHg=
Message-ID: <5bfe47cf-baff-48fb-9a98-0d0bbc085f3b@arm.com>
Date: Wed, 20 May 2026 16:26:44 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] dma-resv: Define guards for context-less dma_resv
 locks
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
References: <20260513-panthor-guard-refactor-v1-0-f2d8c15a97ce@collabora.com>
 <20260513-panthor-guard-refactor-v1-2-f2d8c15a97ce@collabora.com>
Content-Language: en-GB
From: Steven Price <steven.price@arm.com>
In-Reply-To: <20260513-panthor-guard-refactor-v1-2-f2d8c15a97ce@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[linaro.org,amd.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org,lists.linaro.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-62323-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[arm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[steven.price@arm.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: C383159119A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 13/05/2026 17:58, Boris Brezillon wrote:
> When used without a context, dma_resv are no different from regular
> locks. Define guards so we can use the guard-syntactic sugars for
> explicit/implicit scoped locks.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>  include/linux/dma-resv.h | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
> index c5ab6fd9ebe8..e559b1811ca3 100644
> --- a/include/linux/dma-resv.h
> +++ b/include/linux/dma-resv.h
> @@ -40,6 +40,7 @@
>  #define _LINUX_RESERVATION_H
>  
>  #include <linux/ww_mutex.h>
> +#include <linux/cleanup.h>
>  #include <linux/dma-fence.h>
>  #include <linux/slab.h>
>  #include <linux/seqlock.h>
> @@ -484,4 +485,8 @@ void dma_resv_set_deadline(struct dma_resv *obj, enum dma_resv_usage usage,
>  bool dma_resv_test_signaled(struct dma_resv *obj, enum dma_resv_usage usage);
>  void dma_resv_describe(struct dma_resv *obj, struct seq_file *seq);
>  
> +DEFINE_GUARD(dma_resv, struct dma_resv *, dma_resv_lock(_T, NULL), dma_resv_unlock(_T));
> +DEFINE_GUARD_COND(dma_resv, _intr, dma_resv_lock_interruptible(_T, NULL), !_RET);
> +DEFINE_GUARD_COND(dma_resv, _try, dma_resv_trylock(_T));
> +
>  #endif /* _LINUX_RESERVATION_H */
> 


