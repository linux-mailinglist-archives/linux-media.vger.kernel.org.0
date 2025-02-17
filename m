Return-Path: <linux-media+bounces-26228-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 603EAA38A69
	for <lists+linux-media@lfdr.de>; Mon, 17 Feb 2025 18:12:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2D20118948A8
	for <lists+linux-media@lfdr.de>; Mon, 17 Feb 2025 17:12:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 103A82288FE;
	Mon, 17 Feb 2025 17:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="NbtAOISG"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A3B22288E8
	for <linux-media@vger.kernel.org>; Mon, 17 Feb 2025 17:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739812334; cv=pass; b=VY71/Dk4DoW1tQTo6u3iP+isWJmW7e/GmRux7tIdUUiAKey0knBqhfGj+jrK5QVmLv4aXBcyUVwNhJfWwGF5g9fzpBcHuGXsrWvLXoR0f7cUbZQsGrPvJn0dG6p0y8bGLf30732R39/j07U/fmdVW9XT7OdTp4ifZjEqH0TA58Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739812334; c=relaxed/simple;
	bh=qPrMHcrWfk7oSbDJbLnSaPxvEFTYzx1o62GyBYYWV4E=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=k4MvGTgDMbgtVNPNJ6Zq+RLpw6YXaM+eLkIQmbvfg5IewH+Arx13vfOlDHOGIeTDEnb3o1dmsd0mhYqqpyHdM5f1SmlF765mrlet/GskjHygIGhzo2QL7MPSILWZG3vk9Afu5QBz8Vm7t90dYP9dwQFFFkIp4aAoubNLgnomo6Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b=NbtAOISG; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1739812309; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=hqyADJNYC2aimF7lYhuFOsC+6k2xQO65NDUU5ZzeByWhjduXyqf4IPpFktRU7aVUXomLzv2dEfmNLxLUudGCJB3rW6AAfNvd9+UMPxd+nVKAhHe6ZPthA2AYw6X3hK0/ABpZ1yT89STo7P1snUkiN19HRo6oHRKtyRwEJyB3u60=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1739812309; h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To:Cc; 
	bh=5QQeEj40V6XqgWfew2oEhxd1HG5xi0TbLeuzYxV2w9E=; 
	b=dE6sPhoPb2GHCaaNCa3OItw99Hu4vkTpJFRh/BvZEDIYGGFbmXfGcwLfyBRyCipr13B7KQbWQZHzSfVLU58M9cF/dv2cC93SR02a/coff5+TLERRcF4XUuq84CIGJDfFDyxqNWXx9A86tQOpcQnBaeYPrYnW3IlmDnIO7YWBscg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
	dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1739812309;
	s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
	bh=5QQeEj40V6XqgWfew2oEhxd1HG5xi0TbLeuzYxV2w9E=;
	b=NbtAOISGpv5XZd219y8LTnswIpo5h4xyC4isTd/9Wy3avHKaGIM/Fnhr/DsfUo8F
	0nW2u2Dkhy0X5wnYfzm5SVSOaagkJU2d/fo6STuxogbLfyeAfQrJAhyrdeQ3mbMEkKz
	eymjINrbedM/ufL+/fFUWmCeZEamiNqeJTCEm/9g=
Received: by mx.zohomail.com with SMTPS id 1739812308096180.3571063855636;
	Mon, 17 Feb 2025 09:11:48 -0800 (PST)
Message-ID: <0ced2a19-a595-4862-87b1-f9c5c6cabf16@collabora.com>
Date: Mon, 17 Feb 2025 20:11:43 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] dma-buf/dma-fence: remove unnecessary callbacks
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 sumit.semwal@linaro.org, tzimmermann@suse.de, simona@ffwll.ch,
 tvrtko.ursulin@igalia.com, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Rob Clark <robdclark@gmail.com>
References: <20250211163109.12200-1-christian.koenig@amd.com>
 <20250211163109.12200-3-christian.koenig@amd.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Content-Language: en-US
In-Reply-To: <20250211163109.12200-3-christian.koenig@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 2/11/25 19:31, Christian König wrote:
> The fence_value_str and timeline_value_str callbacks were just an
> unnecessary abstraction in the SW sync implementation.
> 
> The only caller of those callbacks already knew that the fence in
> questions is a timeline_fence. So print the values directly instead
> of using a redirection.
> 
> Additional to that remove the implementations from virtgpu and vgem.
> As far as I can see those were never used in the first place.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>  drivers/dma-buf/sw_sync.c              | 16 ----------------
>  drivers/dma-buf/sync_debug.c           | 21 ++-------------------
>  drivers/gpu/drm/vgem/vgem_fence.c      | 15 ---------------
>  drivers/gpu/drm/virtio/virtgpu_fence.c | 16 ----------------
>  include/linux/dma-fence.h              | 21 ---------------------
>  5 files changed, 2 insertions(+), 87 deletions(-)
> 
> diff --git a/drivers/dma-buf/sw_sync.c b/drivers/dma-buf/sw_sync.c
> index f5905d67dedb..849280ae79a9 100644
> --- a/drivers/dma-buf/sw_sync.c
> +++ b/drivers/dma-buf/sw_sync.c
> @@ -173,20 +173,6 @@ static bool timeline_fence_signaled(struct dma_fence *fence)
>  	return !__dma_fence_is_later(fence->seqno, parent->value, fence->ops);
>  }
>  
> -static void timeline_fence_value_str(struct dma_fence *fence,
> -				    char *str, int size)
> -{
> -	snprintf(str, size, "%lld", fence->seqno);
> -}
> -
> -static void timeline_fence_timeline_value_str(struct dma_fence *fence,
> -					     char *str, int size)
> -{
> -	struct sync_timeline *parent = dma_fence_parent(fence);
> -
> -	snprintf(str, size, "%d", parent->value);
> -}
> -
>  static void timeline_fence_set_deadline(struct dma_fence *fence, ktime_t deadline)
>  {
>  	struct sync_pt *pt = dma_fence_to_sync_pt(fence);
> @@ -208,8 +194,6 @@ static const struct dma_fence_ops timeline_fence_ops = {
>  	.get_timeline_name = timeline_fence_get_timeline_name,
>  	.signaled = timeline_fence_signaled,
>  	.release = timeline_fence_release,
> -	.fence_value_str = timeline_fence_value_str,
> -	.timeline_value_str = timeline_fence_timeline_value_str,
>  	.set_deadline = timeline_fence_set_deadline,
>  };
>  
> diff --git a/drivers/dma-buf/sync_debug.c b/drivers/dma-buf/sync_debug.c
> index 237bce21d1e7..270daae7d89a 100644
> --- a/drivers/dma-buf/sync_debug.c
> +++ b/drivers/dma-buf/sync_debug.c
> @@ -82,25 +82,8 @@ static void sync_print_fence(struct seq_file *s,
>  		seq_printf(s, "@%lld.%09ld", (s64)ts64.tv_sec, ts64.tv_nsec);
>  	}
>  
> -	if (fence->ops->timeline_value_str &&
> -		fence->ops->fence_value_str) {
> -		char value[64];
> -		bool success;
> -
> -		fence->ops->fence_value_str(fence, value, sizeof(value));
> -		success = strlen(value);
> -
> -		if (success) {
> -			seq_printf(s, ": %s", value);
> -
> -			fence->ops->timeline_value_str(fence, value,
> -						       sizeof(value));
> -
> -			if (strlen(value))
> -				seq_printf(s, " / %s", value);
> -		}
> -	}
> -
> +	seq_printf(s, ": %lld", fence->seqno);
> +	seq_printf(s, " / %d", parent->value);
>  	seq_putc(s, '\n');
>  }
>  
> diff --git a/drivers/gpu/drm/vgem/vgem_fence.c b/drivers/gpu/drm/vgem/vgem_fence.c
> index e15754178395..5298d995faa7 100644
> --- a/drivers/gpu/drm/vgem/vgem_fence.c
> +++ b/drivers/gpu/drm/vgem/vgem_fence.c
> @@ -53,25 +53,10 @@ static void vgem_fence_release(struct dma_fence *base)
>  	dma_fence_free(&fence->base);
>  }
>  
> -static void vgem_fence_value_str(struct dma_fence *fence, char *str, int size)
> -{
> -	snprintf(str, size, "%llu", fence->seqno);
> -}
> -
> -static void vgem_fence_timeline_value_str(struct dma_fence *fence, char *str,
> -					  int size)
> -{
> -	snprintf(str, size, "%llu",
> -		 dma_fence_is_signaled(fence) ? fence->seqno : 0);
> -}
> -
>  static const struct dma_fence_ops vgem_fence_ops = {
>  	.get_driver_name = vgem_fence_get_driver_name,
>  	.get_timeline_name = vgem_fence_get_timeline_name,
>  	.release = vgem_fence_release,
> -
> -	.fence_value_str = vgem_fence_value_str,
> -	.timeline_value_str = vgem_fence_timeline_value_str,
>  };
>  
>  static void vgem_fence_timeout(struct timer_list *t)
> diff --git a/drivers/gpu/drm/virtio/virtgpu_fence.c b/drivers/gpu/drm/virtio/virtgpu_fence.c
> index f28357dbde35..44c1d8ef3c4d 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_fence.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_fence.c
> @@ -49,26 +49,10 @@ static bool virtio_gpu_fence_signaled(struct dma_fence *f)
>  	return false;
>  }
>  
> -static void virtio_gpu_fence_value_str(struct dma_fence *f, char *str, int size)
> -{
> -	snprintf(str, size, "[%llu, %llu]", f->context, f->seqno);
> -}
> -
> -static void virtio_gpu_timeline_value_str(struct dma_fence *f, char *str,
> -					  int size)
> -{
> -	struct virtio_gpu_fence *fence = to_virtio_gpu_fence(f);
> -
> -	snprintf(str, size, "%llu",
> -		 (u64)atomic64_read(&fence->drv->last_fence_id));
> -}
> -
>  static const struct dma_fence_ops virtio_gpu_fence_ops = {
>  	.get_driver_name     = virtio_gpu_get_driver_name,
>  	.get_timeline_name   = virtio_gpu_get_timeline_name,
>  	.signaled            = virtio_gpu_fence_signaled,
> -	.fence_value_str     = virtio_gpu_fence_value_str,
> -	.timeline_value_str  = virtio_gpu_timeline_value_str,
>  };
>  
>  struct virtio_gpu_fence *virtio_gpu_fence_alloc(struct virtio_gpu_device *vgdev,
> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
> index e230af0d123f..8778e2d758da 100644
> --- a/include/linux/dma-fence.h
> +++ b/include/linux/dma-fence.h
> @@ -238,27 +238,6 @@ struct dma_fence_ops {
>  	 */
>  	void (*release)(struct dma_fence *fence);
>  
> -	/**
> -	 * @fence_value_str:
> -	 *
> -	 * Callback to fill in free-form debug info specific to this fence, like
> -	 * the sequence number.
> -	 *
> -	 * This callback is optional.
> -	 */
> -	void (*fence_value_str)(struct dma_fence *fence, char *str, int size);
> -
> -	/**
> -	 * @timeline_value_str:
> -	 *
> -	 * Fills in the current value of the timeline as a string, like the
> -	 * sequence number. Note that the specific fence passed to this function
> -	 * should not matter, drivers should only use it to look up the
> -	 * corresponding timeline structures.
> -	 */
> -	void (*timeline_value_str)(struct dma_fence *fence,
> -				   char *str, int size);
> -
>  	/**
>  	 * @set_deadline:
>  	 *

Look okay. No sure if Google's perfetto makes use of the syncfile
debugfs and then this change may brake the userspace parser for
virtio-gpu, but debugfs isn't ABI and perfetto will adapt if needed.

+cc Rob Clark for visibility

Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>


-- 
Best regards,
Dmitry

