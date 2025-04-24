Return-Path: <linux-media+bounces-30948-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BDEAA9AEE6
	for <lists+linux-media@lfdr.de>; Thu, 24 Apr 2025 15:24:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BB0E2176500
	for <lists+linux-media@lfdr.de>; Thu, 24 Apr 2025 13:24:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32D7327C84A;
	Thu, 24 Apr 2025 13:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BkJgZDK3"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C85227B51C;
	Thu, 24 Apr 2025 13:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745501061; cv=none; b=qSS/cZgNDyMJm/kBWZXcBOehkalNH2uJppohqNApHTxCNtKIVPgzbzpyf2THDWogFK7md1f/sTnP8nVMfdIpyX00FGLNGw11950ylM3LWIeTnBHB0GP2n9B0/S1og7NFNqUEm+U6SAoOC0p8nSoTSdC4Eqki83XI8hRip0nxxxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745501061; c=relaxed/simple;
	bh=5BvkCvimTwN5NICaMdIH9+jiIrA1JIL41Q3aBs5HSRU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OA/lEjg4n3IVv/qsXrTOW8S8R4abvoIe4eoMJ5v6UF0B4lsecXfmqKrAxaCxKViU9Dq4dqJm40RpJjlfoeWsHjLaOcEQmP1g7Ebiin1XukXRCugFtYIidZ6Par3C14jVRhV9t+U82hBEqh7/mRhXBr/eAH9oTHhbpkMOcGydIpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BkJgZDK3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBF77C4CEE3;
	Thu, 24 Apr 2025 13:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745501061;
	bh=5BvkCvimTwN5NICaMdIH9+jiIrA1JIL41Q3aBs5HSRU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=BkJgZDK3qDzBeK7OGhanAll8tyyF2cUdBIpnmDCT/yVvKmNXwQQfggybwxP7+FOlN
	 oUFznwgEpnchDMpmbCBzwiMAfiZe52Q796GdiyOpNBYI7Qinq1npnUSphs35RNIVPR
	 H0UsxWORsKLJaOcJT4P8YmAIEFEJ6Uji0opaFKbIeF8RgSBH88PJEcroF4RWctFo//
	 jxz80HJ78cPRjNZffFdGCm/oBh1jl9P0WouNkBSlAHjPJJgsiGLbxeXY9d9ziYtM+A
	 EAfDd4YF4HTDOx63R/hh3kSz28pPQduVmqTUmujLyoNfQWymhHT2zPbxCBiQJdNJov
	 bFscp05F9GhYg==
Message-ID: <609c8b1a-d7a9-4667-bd6c-1455c639fcd0@kernel.org>
Date: Thu, 24 Apr 2025 15:24:17 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] drm/nouveau: Check dma_fence in canonical way
To: Philipp Stanner <phasta@kernel.org>
Cc: Lyude Paul <lyude@redhat.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
References: <20250424130254.42046-2-phasta@kernel.org>
 <20250424130254.42046-6-phasta@kernel.org>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20250424130254.42046-6-phasta@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/24/25 3:02 PM, Philipp Stanner wrote:
> In nouveau_fence_done(), a fence is checked for being signaled by
> manually evaluating the base fence's bits. This can be done in a
> canonical manner through dma_fence_is_signaled().
> 
> Replace the bit-check with dma_fence_is_signaled().
> 
> Signed-off-by: Philipp Stanner <phasta@kernel.org>
> ---
>   drivers/gpu/drm/nouveau/nouveau_fence.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
> index fb9811938c82..d5654e26d5bc 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_fence.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
> @@ -253,7 +253,7 @@ nouveau_fence_done(struct nouveau_fence *fence)
>   	struct nouveau_channel *chan;
>   	unsigned long flags;
>   
> -	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->base.flags))
> +	if (dma_fence_is_signaled(&fence->base))

This is only correct with commit bbe5679f30d7 ("drm/nouveau: Fix WARN_ON in
nouveau_fence_context_kill()") from drm-misc-fixes, correct?

