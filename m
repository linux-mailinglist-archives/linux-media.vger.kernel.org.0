Return-Path: <linux-media+bounces-26225-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB542A388D0
	for <lists+linux-media@lfdr.de>; Mon, 17 Feb 2025 17:09:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 824777A2B6E
	for <lists+linux-media@lfdr.de>; Mon, 17 Feb 2025 16:08:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21DB122489E;
	Mon, 17 Feb 2025 16:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="FCM2vIQd"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD7FC21D58B
	for <linux-media@vger.kernel.org>; Mon, 17 Feb 2025 16:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739808537; cv=none; b=qAHNC564C29JDrG3hzfuhyr+sz0WYNCVWhYUzbLHbYv3S8aXnNrsnhKafman+F/pF761a2fjR0IAiRsdt0O5ILLZ8dPA4KlOzrg9qwOYxdvAiRbl7Pu+/qqVkGdf601CAJ5UlYjwnaaOGeKZMjxrS/kdP6nwo6A0twDSDuYlR9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739808537; c=relaxed/simple;
	bh=1u/A8hcvUzOm2hAgyLhGfRD79AKYKakz2QSrvOfoxS4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IVzTDTwfPac5oHEW0C206GBqOBVyEKd2R7hgUFVKfY/E+5nv2xhG6+O+AKT+lq4C5/PKylsc/7O1EzrYgqg1n8pgbwvHJNwxgnP4snv+ebp2Lupevh50op+kvY4SLDQs43WXG658eaHsjkT1/K0B1hHmIkWqPfZ2EJdV3YVMXc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=FCM2vIQd; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43932b9b09aso49748965e9.3
        for <linux-media@vger.kernel.org>; Mon, 17 Feb 2025 08:08:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1739808534; x=1740413334; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GTyX/n7RsOt5tb8xr9K3LdJvUk6okpjAk1qMtkdAS2I=;
        b=FCM2vIQd9T7ObONIT90CaW2R6EIAbYUD1lbGzNKcRAogYaZd1CLwHTUD0EugcBHdrT
         6THuQBfuqytFEXtjk34Np7qkQftYaAiV7hD4mDwGtXT+pzkNJcKQQK4lyW9xQ1e5lDYO
         8I55BYmVwW0IDfPKZWsfpE3JzWZVGaSB5ygiQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739808534; x=1740413334;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GTyX/n7RsOt5tb8xr9K3LdJvUk6okpjAk1qMtkdAS2I=;
        b=LtA+tsLXrzLwrVEVxP6uj/M2cFowkMvDm+EvhgICv11UIfhnqKitP9VwQUHrz0X0N7
         f9i8HB6ozxpXdNvrxC0q/EZ4CURqne7uYh56TTvySiEgMWccTVfzABgjuvD05iq2PGeL
         eHhcFpcIIpQQaUydnH+rR0T0Ywn5TZeZJEF14qsVf4JIuP7EFPV/lwz0Ia3gt4lE5i4J
         WxvM1iLVFtfP3oxLMWuSpYSH+EecEm2M/QbJ3TkDFx6e0m1bNvaldwWrwKWtzh4o/J8l
         IXOQchtse1eMPpYgJpCQVRJfBqcQsOBAB57NuXOzdUrv+ciO33MJjo9kqIpucLJM5sve
         3Y0Q==
X-Forwarded-Encrypted: i=1; AJvYcCWDPRMMTOBg/3Uz1JFxq8Y85e1KoLmZcrLNTA7o3ch+T+U1qIQ6vJIxO+2LPH6rO/sqlfvuwhY7gCu4SA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzrYIUgYY9cS/w8x2XtFb6mPS2SErGCFPAcykQODNCdK4IJx0dM
	8adaE/5KJrK+FTHqCEC01TnHNJXPuCTxFMNns6j+1nff1iXMKu6WyYUVbnUHwyw=
X-Gm-Gg: ASbGncvJVTMidsiHv9GIH3IpyBWYZl8i0NWYFVxtlVy/a0gYIV+4N3OVTuo/QbdxoFe
	3YiZlwFF8MjldPr5wbiEUo4mEzlBtX0TXvebxW7iCzMZVLZNoakho7qVVrlhLTXUJoatZ8uWNxq
	UdY8fSA6rFsvaEgfKuCiUDpsmkLzRZcJw8Ri7KBwVWXIWHR15pkw7Ab6REDoJeVYPVuRF7fKh5S
	GslXZRFeGUYRZHgrVNlBcUkpStx+P+Gwp50IJQywtbnQeD10c8CmxLF9BPhoNAiLQw148TCts07
	Tei6vM8BaqUYKuxgDHYq9FTWw/4=
X-Google-Smtp-Source: AGHT+IHHWRJ59zvQG+4eZoc+8l1InJA6uGE93rXsYApIwLbabBqPxJcso2ZsQ64zsKfbIzCOQb2HOA==
X-Received: by 2002:a05:600c:4450:b0:439:916a:b3db with SMTP id 5b1f17b1804b1-439916ab5bdmr8896785e9.6.1739808533777;
        Mon, 17 Feb 2025 08:08:53 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f258ccef7sm12871986f8f.31.2025.02.17.08.08.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 08:08:53 -0800 (PST)
Date: Mon, 17 Feb 2025 17:08:51 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: sumit.semwal@linaro.org, tzimmermann@suse.de, simona@ffwll.ch,
	dmitry.osipenko@collabora.com, tvrtko.ursulin@igalia.com,
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH 2/4] dma-buf/dma-fence: remove unnecessary callbacks
Message-ID: <Z7NfExCVMagNI5Z3@phenom.ffwll.local>
References: <20250211163109.12200-1-christian.koenig@amd.com>
 <20250211163109.12200-3-christian.koenig@amd.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250211163109.12200-3-christian.koenig@amd.com>
X-Operating-System: Linux phenom 6.12.11-amd64 

On Tue, Feb 11, 2025 at 05:31:07PM +0100, Christian König wrote:
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

Ok I got really confused here for a moment, but checks all out.

Reviewed-by: Simona Vetter <simona.vetter@ffwll.ch>

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
> -- 
> 2.34.1
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

