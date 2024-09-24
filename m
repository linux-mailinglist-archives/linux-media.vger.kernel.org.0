Return-Path: <linux-media+bounces-18500-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D854B9843ED
	for <lists+linux-media@lfdr.de>; Tue, 24 Sep 2024 12:44:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B0C09287D17
	for <lists+linux-media@lfdr.de>; Tue, 24 Sep 2024 10:44:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94DEC19DF41;
	Tue, 24 Sep 2024 10:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="eFWWH8Hm"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1109319D886
	for <linux-media@vger.kernel.org>; Tue, 24 Sep 2024 10:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727174673; cv=none; b=Cn/9jjl/SwdpAFqVpTVzdlG6WNiAQZmMtItIBqAHBFwMNTqz0Q4moIZt8XE4kcETdI+Pr6ki2g3UPqf93i6Ox6tNYpsQPe8tnEWjh1Z8qWAygqqfLY1O6Ox//C4MOu30HxXV9SKEM5pg6IcXhoaPfdeNoozpa+izrKEUVu7ALsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727174673; c=relaxed/simple;
	bh=vSNW/+B75QZ6s6u2VGWRRHqfSZPy9mqUh/MvYkJWf7o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OA1UXeD7ktKXThpFsWvxIGKpBFVQUNsVGSBbaXuXD89SPp2GgFY2cOCJrDzV8de1PyoEKctTu/IwVv9jQZx8VA0MRJLAASJQV87rr3pFW30qf+llBW4uAyRg1RIAeRZpaMuVIPcwn5t5GIW7RrLyJzWHd111z6jv+ikKeOjsVBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=eFWWH8Hm; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5c42f406e29so7707565a12.2
        for <linux-media@vger.kernel.org>; Tue, 24 Sep 2024 03:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1727174670; x=1727779470; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hg57tMMy0blYSuezkQiHoCi7dn58SQLwrksj0aFKAtU=;
        b=eFWWH8HmWs4d9JqBcmwLNk5ELK66EvH5lgS3rd788Mzyq+cgMpboswImDi/5jucQD5
         GcmU5FgS56J6rA+690PMjPvLs4aIuHeTkw63s6YLElCs5kO2uuxPpFGzobbcD09MisU6
         DAOQZYn8cQBIGACgseMAJdzJ2fM2Wlx1Ux6TU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727174670; x=1727779470;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hg57tMMy0blYSuezkQiHoCi7dn58SQLwrksj0aFKAtU=;
        b=qT0Bs4tHFruVc0yQQg3D8xF9bskCJtQ6PHfnm22oQbBYNpyeRGFwAoUH2Bc7kMfZP+
         v1y1v7Yu4da8pG4tPf13kWhp+ljixWfojU8tZxfFTkcbxSOLq6XC68fSYrX8NPmEBbRj
         vE0OmYZ+/pkqlf2TewhM28EBACP8lWFi/qkbHfxUhnCohwSyhv9/YDxXxlTlfOhKNg89
         0CejzANdA8q/Is/BB9eEiE6aDPEimXwDVVSxdE/EdcEgaABF5TzMDOIVGHVQShcw1caf
         KC2DlGE07e33qCTYoP2y9bqYEE2N+DnSfSdD012EN4GQRvKOqf1ZJj3Mb5PDdMjCKvqM
         XnjQ==
X-Forwarded-Encrypted: i=1; AJvYcCUCGkjFK+/16DrGZ8VPu3Tk1ky54rtvg6vBi4IpdPFdUK3II4gjITOZ/qfaHAR3ppKp5Zg6wKoCs89bRw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3f31mXN9u/jOMcWDk01rMFF11xUwC61QpvgQLcaya1gPy/2Gf
	iHlp0VR8TYtgVgBZ+m7klQBP7WVTOD2nXR6siDVI7n8Tlx9JslexCQlyHsZ81kg=
X-Google-Smtp-Source: AGHT+IFsbAPQtvwlsECTfv5o6GbOlmX9+qawAUAtHMx47dRNmzL6e4E6m9ePldWVdx0t67RittQL/w==
X-Received: by 2002:a17:907:9282:b0:a7a:af5d:f312 with SMTP id a640c23a62f3a-a90d514a9b4mr1367037666b.46.1727174670064;
        Tue, 24 Sep 2024 03:44:30 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9392f3479fsm69803366b.39.2024.09.24.03.44.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Sep 2024 03:44:29 -0700 (PDT)
Date: Tue, 24 Sep 2024 12:44:27 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: sumit.semwal@linaro.org, daniel@ffwll.ch, tursulin@ursulin.net,
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH 1/2] dma-buf/dma-fence: remove unnecessary callbacks
Message-ID: <ZvKYC1WPOhQpjw94@phenom.ffwll.local>
References: <20240918115513.2716-1-christian.koenig@amd.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240918115513.2716-1-christian.koenig@amd.com>
X-Operating-System: Linux phenom 6.10.6-amd64 

On Wed, Sep 18, 2024 at 01:55:12PM +0200, Christian König wrote:
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
> index c353029789cf..f7ce4c6b8b8e 100644
> --- a/drivers/dma-buf/sw_sync.c
> +++ b/drivers/dma-buf/sw_sync.c
> @@ -178,20 +178,6 @@ static bool timeline_fence_enable_signaling(struct dma_fence *fence)
>  	return true;
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
> @@ -214,8 +200,6 @@ static const struct dma_fence_ops timeline_fence_ops = {
>  	.enable_signaling = timeline_fence_enable_signaling,
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
> index e7ad819962e3..cf91cae6e30f 100644
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

