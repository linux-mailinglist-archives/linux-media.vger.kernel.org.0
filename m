Return-Path: <linux-media+bounces-45459-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C27E5C050F2
	for <lists+linux-media@lfdr.de>; Fri, 24 Oct 2025 10:33:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 939EC3A595D
	for <lists+linux-media@lfdr.de>; Fri, 24 Oct 2025 08:31:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 315C11A5B9D;
	Fri, 24 Oct 2025 08:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="rpxNnSPy"
X-Original-To: linux-media@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1142C302756;
	Fri, 24 Oct 2025 08:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761294709; cv=none; b=uhwwJxn3x5cg50IeYcjfUHOKeCtn88mGQCClPhA4o35slwwB1lK0WgOd9Xi78EnBnvwrpAPvHqRP3YKbMercayca14rDRVarsYzhhOFh6zysoSWt893sI1Dfp9xpg7CN6GnexxrL5K5cZW+ZNluEhFmFr4vfb76tbxNf1nquOac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761294709; c=relaxed/simple;
	bh=+oFZVMNkPuoa6IuZjQ7ty+59p6L1PyezFKfOjWlo0+A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cUwIHmcMEV2xHKoBV3/R3OHwju6VZIH9pshq7SGsoUtIdad4ChQ2l5oOJ5zYUeV9TlfP7A4auC/X5Z4/hh5pxSvfcu103ON9qdrPM9PlGy4v1DGV/wP2CRNIRUn3e/In0M1HhyIVsgOK/kCVcP2f5vzS5JiNTsG09u+oBRFOqXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=rpxNnSPy; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=bJJRxoLah8YqjPp5kr+nq6nQT696ZsDy3XRzsti8eP0=; b=rpxNnSPyYUNP1sXUlZ8n1iTraX
	2nukbWaid2abuQnlUjoQRC+fTPeA4ZtlpVdj2AJlnGXmvI5pOUM5BOTFLcQGvc5eiw6IlWQg4ikbs
	nkTPXoRJ7L9RqWmhuiXXe3tKbmhYLXdWaYMHZM6PIGjTUyQd//UtQoqpfiSWz0zM7fGexrT1QFq6F
	I5CCfi5xzRx0N3oO6BdodcvnoUMnQUTvKAu/OXip4NcdNfnvFGxmLIt4Coi0KRIk+eencm/o7bm0q
	tCToe4JjMrvsHropl5zwtxy8OlUBB+NU/lMvm5fU689/MOC0LZyYMTAqStKqftO0n85beFvTGzWi1
	0sIX6thg==;
Received: from [90.242.12.242] (helo=[192.168.0.101])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1vCDCp-00Eg9q-SQ; Fri, 24 Oct 2025 10:31:27 +0200
Message-ID: <11b7a8a5-170f-4815-a8ac-5dba2d8e67a1@igalia.com>
Date: Fri, 24 Oct 2025 09:31:26 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dma-fence: Correct return of dma_fence_driver_name()
To: Philipp Stanner <phasta@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, Gustavo Padovan
 <gustavo@padovan.org>, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>
References: <20251024075019.162351-2-phasta@kernel.org>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <20251024075019.162351-2-phasta@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 24/10/2025 08:50, Philipp Stanner wrote:
> To decouple the dma_fence_ops lifetime from dma_fences lifetime RCU
> support was added to said function, coupled with using the signaled bit
> to detect whether the fence_ops might be gone already.
> 
> When implementing that a wrong string was set as a default return
> parameter, indicating that every driver whose fence is already signalled
> must be detached, which is frankly wrong.

Depends on how you look at it. After being signaled fence has to be 
detached from the driver. Ie. nothing belonging to this driver must be 
accessed via the fence.

I started with names and Christian has recently continued with ops.

> Reported-by: Danilo Krummrich <dakr@kernel.org>
> Fixes: 506aa8b02a8d ("dma-fence: Add safe access helpers and document the rules")
> Signed-off-by: Philipp Stanner <phasta@kernel.org>
> ---
> When this was merged, it sadly slipped by me. I think this entire RCU
> mechanism was / is an overengineered idea.
> 
> If we look at who actually uses dma_fence_driver_name() and
> dma_fence_timeline_name() – functions from which the largest share of
> the fence_ops vs. fence lifetime issue stems from – we discover that
> there is a single user:
> 
> i915.

Not quite. The trigger event for fixing this was actually xe where use 
after free was achievable with a trivial set of userspace steps. See 
reproducer at:

https://lore.kernel.org/igt-dev/20250312131835.83983-1-tvrtko.ursulin@igalia.com/

Essentially any fence exporter whose fence can be exported either 
directly via sync file, or via syncobj to sync file export, and has 
state accessible via the fence ops which may be freed after the fence is 
signalled, or if the driver can be unbound from the device and unloaded, 
is vulnerable.

> Isn't that driver even deprecated?
Not exactly. It is not getting support for new hardware generations, 
while the new driver is not supporting old. There is a cut off point and 
an overlap of around one generation. Although I am not even sure this 
overlap is officially supported by Intel.

> I think the better thing to do is: remove these functions alltogether,
> or at least deprecate them. Then the only lifetime issue left so solve
> is the callback functions.

That would be nice, I also do not see much value in exporting names to 
userspace. But first more conversation around breaking the sync file ABI 
needs to happen. I think we had a little bit of it when changing the 
names of signalled fences and thinking was existing tools which look at 
the names will mostly survive it. Not sure if they would if unsignalled 
names would change.

> 
> P.
> ---
>   drivers/dma-buf/dma-fence.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
> index 3f78c56b58dc..1875a0abebd3 100644
> --- a/drivers/dma-buf/dma-fence.c
> +++ b/drivers/dma-buf/dma-fence.c
> @@ -1111,7 +1111,7 @@ const char __rcu *dma_fence_driver_name(struct dma_fence *fence)
>   	if (!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
>   		return fence->ops->get_driver_name(fence);
>   	else
> -		return "detached-driver";
> +		return "driver-whose-fence-is-already-signalled";

IMHO unnecessarily verbose and whether or not changing it to anything 
different warrants a Fixes: tag is debatable.

Regards,

Tvrtko

>   }
>   EXPORT_SYMBOL(dma_fence_driver_name);
>   


