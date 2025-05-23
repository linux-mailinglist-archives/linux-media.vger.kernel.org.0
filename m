Return-Path: <linux-media+bounces-33270-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1A58AC2560
	for <lists+linux-media@lfdr.de>; Fri, 23 May 2025 16:48:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E0F637B4411
	for <lists+linux-media@lfdr.de>; Fri, 23 May 2025 14:46:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B47E4296D29;
	Fri, 23 May 2025 14:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="ih242rmi"
X-Original-To: linux-media@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83161296735;
	Fri, 23 May 2025 14:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748011648; cv=none; b=p3NWbA8FnhM+RI2SWY/pJqwdOoLldoMfrv6Wjvfwiop4xHc1p+KK3AqDYrIkO1LioObeEq0w7P9Rl/nN9H8Qv1iEcQbo15Z2IP2Ge+g9pHxIVYgxQN0gjqq7KZie/xwVCbZ6wiaOaGb0PZ+/871ipk3XsY9FuC4NlQfcp0EbiSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748011648; c=relaxed/simple;
	bh=uJVEqtQB2R0KIYcty+/oFwmLq8Os/xq6uQ23VuVDeuU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HyJXgmJZ/iexpjCYBxXsYjxI42oA5pdtEFyAa1pxvPuoQy4Ig8ja+ID/OJmggs7eqgZiSVUdaECGR1AOV3oanHQEIw5iedjvxdy8px0mv5baGUckmVPAIb7dGN1xvHZ1cKLkOT6ENzCa6yQPHO/cpjVCVNL4RK+8OJbiNQmIWcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=ih242rmi; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=9zrV7433NHFYKHB0uHhJrmu7dOYAkEyNGtUe1qTfMxY=; b=ih242rmiGTg7PIJBXm/mbCuRbd
	9HqXObANz4FIiecYRyNtFnWmzUTa4LI+LyRFX/qZoUH6HjlSA2+XShtnDMk5kiUpA8F9b9g+UmlvH
	VO9eWwxM+1xjqOkjPYQTz5UUrf1Pdqy+OGko1g+2jKGjnOmF1NZcWqnTHvDpAX3bRL3YTOizs3xvH
	VB/0yFhASnY+ANiv4EkJJ4eubbb+jkp4KkkuibNjyiL1tKzW+Vm2qrA9tJyM2TB3jB9vsXRde4yKu
	3b8MDNnQ1V71mvTymGIw0P9Pc7kKKq1CANuci5a/Trzq0b7nEKZCrPigj6kgpHaRZNRUL9DcfPpbe
	ZStse38Q==;
Received: from [81.79.92.254] (helo=[192.168.0.101])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1uITfv-00CDpK-BA; Fri, 23 May 2025 16:47:07 +0200
Message-ID: <4255f9a9-be17-4a9a-b7cf-8e3d4f93b38b@igalia.com>
Date: Fri, 23 May 2025 15:47:06 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dma-buf: Add __dma_fence_is_signaled()
To: Philipp Stanner <phasta@kernel.org>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
References: <20250522112540.161411-2-phasta@kernel.org>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <20250522112540.161411-2-phasta@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 22/05/2025 12:25, Philipp Stanner wrote:
> Some parties want to check whether a function is already signaled
> without actually signaling the fence, which is what
> dma_fence_is_signaled() might due if the fence ops 'signaled' callback

s/due/do/

> is implemented.
> 
> Add __dma_fence_is_signaled(), which _only_ checks whether a fence is
> signaled. Use it internally.
> 
> Suggested-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Signed-off-by: Philipp Stanner <phasta@kernel.org>
> ---
>   include/linux/dma-fence.h | 24 ++++++++++++++++++++++--
>   1 file changed, 22 insertions(+), 2 deletions(-)
> 
> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
> index 48b5202c531d..ac951a54a007 100644
> --- a/include/linux/dma-fence.h
> +++ b/include/linux/dma-fence.h
> @@ -381,6 +381,26 @@ bool dma_fence_remove_callback(struct dma_fence *fence,
>   			       struct dma_fence_cb *cb);
>   void dma_fence_enable_sw_signaling(struct dma_fence *fence);
>   
> +/**
> + * __dma_fence_is_signaled - Only check whether a fence is signaled yet.
> + * @fence: the fence to check
> + *
> + * This function just checks whether @fence is signaled, without interacting
> + * with the fence in any way. The user must, therefore, ensure through other

s/user/caller/ ?

Otherwise looks good to me. For if/when Christian approves you can add my:

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Regards,

Tvrtko

> + * means that fences get signaled eventually.
> + *
> + * This function does not require locking.
> + *
> + * See also dma_fence_is_signaled().
> + *
> + * Return: true if signaled, false otherwise.
> + */
> +static inline bool
> +__dma_fence_is_signaled(struct dma_fence *fence)
> +{
> +	return test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags);
> +}
> +
>   /**
>    * dma_fence_is_signaled_locked - Return an indication if the fence
>    *                                is signaled yet.
> @@ -398,7 +418,7 @@ void dma_fence_enable_sw_signaling(struct dma_fence *fence);
>   static inline bool
>   dma_fence_is_signaled_locked(struct dma_fence *fence)
>   {
> -	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
> +	if (__dma_fence_is_signaled(fence))
>   		return true;
>   
>   	if (fence->ops->signaled && fence->ops->signaled(fence)) {
> @@ -428,7 +448,7 @@ dma_fence_is_signaled_locked(struct dma_fence *fence)
>   static inline bool
>   dma_fence_is_signaled(struct dma_fence *fence)
>   {
> -	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
> +	if (__dma_fence_is_signaled(fence))
>   		return true;
>   
>   	if (fence->ops->signaled && fence->ops->signaled(fence)) {


