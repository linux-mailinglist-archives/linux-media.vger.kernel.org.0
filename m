Return-Path: <linux-media+bounces-29140-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D7765A7796A
	for <lists+linux-media@lfdr.de>; Tue,  1 Apr 2025 13:18:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 169E43AA610
	for <lists+linux-media@lfdr.de>; Tue,  1 Apr 2025 11:18:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44D331F17F7;
	Tue,  1 Apr 2025 11:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KHbCbSAw"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64A211E5B7E;
	Tue,  1 Apr 2025 11:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743506315; cv=none; b=cXphUiOYTnUxiHxTdNKKaE9hlbtwgQ2L5e0BdMNhMEHpWJdr5gERN6wK/Pehnx++RFyf8W1/+BD9NqHBmRZlzPWeJkewQn8ezXP3S7/S4LezCKWvQj1ogVxb5MigkDcrrSFnlfC/aHaqE6Eq/qHfpmsDDZDKhFebjG6HjM1Um3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743506315; c=relaxed/simple;
	bh=oLsWEROtM3VNERbcwSdXIndJfkcUD2LyFz5BAQhpfWg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KNn4noM1lWLnGjztIWmI6cgcq2g8ysGod/MZ5MU/2N/NX/8GEz2z+ca8hZbvlaO3fWJAAVa/UFI7qhBfq0q26pQ4e+S6QJjlJpvTaJ+o/MILAlUTK1HGOaeXvC5/Zftlv8PIt1yCPvUECPEzxwXvUvQ7jG7/PLWOOvQQ59Jf1ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KHbCbSAw; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3912d2c89ecso4787461f8f.2;
        Tue, 01 Apr 2025 04:18:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743506312; x=1744111112; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MHjLXZJ1cnpvspCUUy5TO+Zanl0UIrIyQt6fEAo5S/E=;
        b=KHbCbSAwuTTpKHqThyn93AbYCAJ9ZxGgGpHVa7n4OtOjQ61K06qYeJOreZ/Y5onl3R
         xZhXauhFsUTn1Vh2l9IFx8ZpiAlvNsurUIOzwQQNfgSOAxhDCOh3NLBvf5ourI/JzOYX
         0Ai2t+f4RT5FJcqSBVEq0tGrBDjHBLVdk8fMiVyVKq4SkMyyML/uZqe0RA4EnMUu0Jn6
         3VZVJGjXeZGTx+P1kPOnJQHHmucVb5sMWWdATMB03t7+xpPAxuBxVCVNTs3JOf0Bzy23
         bbsFP2LaEbyU1Vr3JKlvdQu6nr8Z+SjwgtiNv2+WSlTtjgPVCT26kjcDCI0f9oS6G5Nt
         /oQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743506312; x=1744111112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MHjLXZJ1cnpvspCUUy5TO+Zanl0UIrIyQt6fEAo5S/E=;
        b=GPxoMG+s1qTA/z80YjqElYnCJHmnNO0mPa3oORXqAUE7tzNbKoUefDi7ger9kxq+jR
         ILRuL8f9bWDHoftqdKFihQe+s+uGQVIZ1lmy31G17Txs1oyz9MThv8ZgLv84+IO54RsD
         xbl7RJfLXGYsQam4PKvk8yvdsreY18w0vKJv9mZs3+T2iuqvfvUEd8hBvOQ6S4+YGif2
         BFdhR0CvtBSH/uX6jnrP1IwXOnKs6pe7L7+9ThcWJrqArOJSIl8cWhi0LgnkGujIEBp6
         4zTJrn9Bf3tzxYuoxZtd0qqAW5uJW861X6sT6+IhVyq3uP+UxGm+F4KHWjBCGJpD8vWs
         GvDw==
X-Forwarded-Encrypted: i=1; AJvYcCW14kPkMe9GHI4kKgdX7ifvi7/Y92jtDNomCk8esYCk0IDkJkrYh7LOR+QUlXJTixMyg+XAjLmLmn/jOYk=@vger.kernel.org, AJvYcCWH0CZcUG4BjFFK3JgqwQaF3gLL51d9GLCn6CKyrSHQOvOeQQqDpqmBMsDkOn2wTswTnnbElcip9slv234=@vger.kernel.org
X-Gm-Message-State: AOJu0YyfEeNPt2MUII8WnlVua4OuGLSnnj4NivYUcBrOrGZObU2KcUzL
	0zCC3/Odx2TVXwFbToa2sMdJQ7INKuCamtRQUIPB+5PtIPM17JGE
X-Gm-Gg: ASbGncuTxJQsxefu/C6qc8KTTx1dNzDRa2REUo0POT1eN1C4FIpKrzH8IL4dWLrag+9
	Ab+5c616+wJ1VvS5yblKoKiPsi/VaR3+IgQkoNZ6sTNdsTOQeqbAQYRcgTV/InVNVk+P1RxwUBO
	v+PH000jxZNQX/gmr4PBLysrm5tbWeO/2VCw9V2qn3R7hCOhKaluQNJ9xjMXYEV8NNbE1KiqrrQ
	gpMK/lo6ODAylR9r95nm4i7R/nMuEuFy7chyi2ksrXySRucSwQxe8g6pQFxvcUboG3XM0nEgQJn
	0kRVW8tPFvZvlJXszCts1oZANcY554yE9DcsqpvdOigDhoTPZdsd4f22uvNhtr0O+E5cMKjAxg=
	=
X-Google-Smtp-Source: AGHT+IHL7hdDkklKqbVxncDc8exnu0HuxmsEO5AkQ0x0L0l35X0qyjhrepIfjwYO28fP7NDX2ub+LQ==
X-Received: by 2002:a5d:6daf:0:b0:391:4914:3c6a with SMTP id ffacd0b85a97d-39c120e34b1mr7985118f8f.29.1743506311481;
        Tue, 01 Apr 2025 04:18:31 -0700 (PDT)
Received: from [10.254.108.83] (munvpn.amd.com. [165.204.72.6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b663470sm13778422f8f.27.2025.04.01.04.18.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Apr 2025 04:18:31 -0700 (PDT)
Message-ID: <593b5915-7148-446a-a240-7f7939025a5f@gmail.com>
Date: Tue, 1 Apr 2025 13:18:28 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Linaro-mm-sig] [PATCH v5] drm/syncobj: Extend EXPORT_SYNC_FILE
 for timeline syncobjs
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Rob Clark <robdclark@chromium.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK:Keyword:bdma_?:buf|fence|resvb"
 <linux-media@vger.kernel.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK:Keyword:bdma_?:buf|fence|resvb"
 <linaro-mm-sig@lists.linaro.org>
References: <20250331212333.16029-1-robdclark@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <20250331212333.16029-1-robdclark@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Am 31.03.25 um 23:23 schrieb Rob Clark:
> From: Rob Clark <robdclark@chromium.org>
>
> Add support for exporting a dma_fence fd for a specific point on a
> timeline.  This is needed for vtest/vpipe[1][2] to implement timeline
> syncobj support, as it needs a way to turn a point on a timeline back
> into a dma_fence fd.  It also closes an odd omission from the syncobj
> UAPI.
>
> [1] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/33433
> [2] https://gitlab.freedesktop.org/virgl/virglrenderer/-/merge_requests/805
>
> v2: Add DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_TIMELINE
> v3: Add unstaged uabi header hunk
> v4: Also handle IMPORT_SYNC_FILE case
> v5: Address comments from Dmitry
>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/drm_syncobj.c | 45 +++++++++++++++++++++++++++--------
>  include/uapi/drm/drm.h        |  4 ++++
>  2 files changed, 39 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
> index 4f2ab8a7b50f..b0a4c58fe726 100644
> --- a/drivers/gpu/drm/drm_syncobj.c
> +++ b/drivers/gpu/drm/drm_syncobj.c
> @@ -741,7 +741,7 @@ static int drm_syncobj_fd_to_handle(struct drm_file *file_private,
>  }
>  
>  static int drm_syncobj_import_sync_file_fence(struct drm_file *file_private,
> -					      int fd, int handle)
> +					      int fd, int handle, u64 point)
>  {
>  	struct dma_fence *fence = sync_file_get_fence(fd);
>  	struct drm_syncobj *syncobj;
> @@ -755,14 +755,22 @@ static int drm_syncobj_import_sync_file_fence(struct drm_file *file_private,
>  		return -ENOENT;
>  	}
>  
> -	drm_syncobj_replace_fence(syncobj, fence);
> +	if (point) {
> +		struct dma_fence_chain *chain = dma_fence_chain_alloc();
> +		if (!chain)
> +			return -ENOMEM;
> +		drm_syncobj_add_point(syncobj, chain, fence, point);

Just a nit pick but checkpatch.pl will complain about it: Empty line between declaration and code please.

Maybe double check if checpatch.pl is otherwise happy with the patch.

With that done feel free to add Reviewed-by: Christian König <christian.koenig@amd.com>.

Let me know if I should push it to drm-misc-next.

Regards,
Christian.

> +	} else {
> +		drm_syncobj_replace_fence(syncobj, fence);
> +	}
> +
>  	dma_fence_put(fence);
>  	drm_syncobj_put(syncobj);
>  	return 0;
>  }
>  
>  static int drm_syncobj_export_sync_file(struct drm_file *file_private,
> -					int handle, int *p_fd)
> +					int handle, u64 point, int *p_fd)
>  {
>  	int ret;
>  	struct dma_fence *fence;
> @@ -772,7 +780,7 @@ static int drm_syncobj_export_sync_file(struct drm_file *file_private,
>  	if (fd < 0)
>  		return fd;
>  
> -	ret = drm_syncobj_find_fence(file_private, handle, 0, 0, &fence);
> +	ret = drm_syncobj_find_fence(file_private, handle, point, 0, &fence);
>  	if (ret)
>  		goto err_put_fd;
>  
> @@ -869,6 +877,9 @@ drm_syncobj_handle_to_fd_ioctl(struct drm_device *dev, void *data,
>  				   struct drm_file *file_private)
>  {
>  	struct drm_syncobj_handle *args = data;
> +	unsigned valid_flags = DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_TIMELINE |
> +			       DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_EXPORT_SYNC_FILE;
> +	u64 point = 0;
>  
>  	if (!drm_core_check_feature(dev, DRIVER_SYNCOBJ))
>  		return -EOPNOTSUPP;
> @@ -876,13 +887,18 @@ drm_syncobj_handle_to_fd_ioctl(struct drm_device *dev, void *data,
>  	if (args->pad)
>  		return -EINVAL;
>  
> -	if (args->flags != 0 &&
> -	    args->flags != DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_EXPORT_SYNC_FILE)
> +	if (args->flags & ~valid_flags)
>  		return -EINVAL;
>  
> +	if (args->flags & DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_TIMELINE)
> +		point = args->point;
> +
>  	if (args->flags & DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_EXPORT_SYNC_FILE)
>  		return drm_syncobj_export_sync_file(file_private, args->handle,
> -						    &args->fd);
> +						    point, &args->fd);
> +
> +	if (args->point)
> +		return -EINVAL;
>  
>  	return drm_syncobj_handle_to_fd(file_private, args->handle,
>  					&args->fd);
> @@ -893,6 +909,9 @@ drm_syncobj_fd_to_handle_ioctl(struct drm_device *dev, void *data,
>  				   struct drm_file *file_private)
>  {
>  	struct drm_syncobj_handle *args = data;
> +	unsigned valid_flags = DRM_SYNCOBJ_FD_TO_HANDLE_FLAGS_TIMELINE |
> +			       DRM_SYNCOBJ_FD_TO_HANDLE_FLAGS_IMPORT_SYNC_FILE;
> +	u64 point = 0;
>  
>  	if (!drm_core_check_feature(dev, DRIVER_SYNCOBJ))
>  		return -EOPNOTSUPP;
> @@ -900,14 +919,20 @@ drm_syncobj_fd_to_handle_ioctl(struct drm_device *dev, void *data,
>  	if (args->pad)
>  		return -EINVAL;
>  
> -	if (args->flags != 0 &&
> -	    args->flags != DRM_SYNCOBJ_FD_TO_HANDLE_FLAGS_IMPORT_SYNC_FILE)
> +	if (args->flags & ~valid_flags)
>  		return -EINVAL;
>  
> +	if (args->flags & DRM_SYNCOBJ_FD_TO_HANDLE_FLAGS_TIMELINE)
> +		point = args->point;
> +
>  	if (args->flags & DRM_SYNCOBJ_FD_TO_HANDLE_FLAGS_IMPORT_SYNC_FILE)
>  		return drm_syncobj_import_sync_file_fence(file_private,
>  							  args->fd,
> -							  args->handle);
> +							  args->handle,
> +							  point);
> +
> +	if (args->point)
> +		return -EINVAL;
>  
>  	return drm_syncobj_fd_to_handle(file_private, args->fd,
>  					&args->handle);
> diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
> index 7fba37b94401..e63a71d3c607 100644
> --- a/include/uapi/drm/drm.h
> +++ b/include/uapi/drm/drm.h
> @@ -905,13 +905,17 @@ struct drm_syncobj_destroy {
>  };
>  
>  #define DRM_SYNCOBJ_FD_TO_HANDLE_FLAGS_IMPORT_SYNC_FILE (1 << 0)
> +#define DRM_SYNCOBJ_FD_TO_HANDLE_FLAGS_TIMELINE         (1 << 1)
>  #define DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_EXPORT_SYNC_FILE (1 << 0)
> +#define DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_TIMELINE         (1 << 1)
>  struct drm_syncobj_handle {
>  	__u32 handle;
>  	__u32 flags;
>  
>  	__s32 fd;
>  	__u32 pad;
> +
> +	__u64 point;
>  };
>  
>  struct drm_syncobj_transfer {


