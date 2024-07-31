Return-Path: <linux-media+bounces-15663-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F1CFC943766
	for <lists+linux-media@lfdr.de>; Wed, 31 Jul 2024 22:50:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8B8A31C2136E
	for <lists+linux-media@lfdr.de>; Wed, 31 Jul 2024 20:50:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3153168C26;
	Wed, 31 Jul 2024 20:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="lwg5MZeL"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A2341607B7
	for <linux-media@vger.kernel.org>; Wed, 31 Jul 2024 20:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722459030; cv=none; b=ZW3geup1nE9WwQxnVmjO88SJVJeJB6ZOzAMipaL7aLOOycm0prrkJifAS+ON3U0TWRc2JISjwqlo5o+J2s2i52v+LOCyrwBP3UxEFP5UsHHYMOslmfAeppFLHgivch9hjtrKGDpWM/RZE9p1bYfrZukXplZDXipLmf+ZopQ6aPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722459030; c=relaxed/simple;
	bh=ccUCugW1N2J/712pEft7YYpLGhN0cRZIKLxLFCnlq5s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GIsT3QSE/lL+botoemjnJ3RhXjmAJaS/xFAL4hpvMoCz5kNkl6sXAJoOQLkLzi9qNVpTKsGkT2FhbGV03VdsEZx473bisA5yairNsc+yngKLpKWhTRrnNadk3xHkBtSuFaGAHAsR0XwqS77BEzQE3tZnptjtAJJX/xuUQY8EOjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=lwg5MZeL; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4280921baa2so4596605e9.2
        for <linux-media@vger.kernel.org>; Wed, 31 Jul 2024 13:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1722459027; x=1723063827; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L1IW9fAfwq5NHi01t4CV5LKiWLlhlBwcc8UFMWZp9sQ=;
        b=lwg5MZeLWiv+dJNZg3bkYKn7G9k6z+pydqVZvOooLhyTjSYSdXBZxUm7jexXhugpTr
         l2k9xC7uogzfWwiNUlfdX+1q0N5c3c4bKtcjkXLdF8pd4B4QKRjhzP4WyzypyP6f7wL7
         Gncln1tahVWOED+0R8kUYJc0m0iETHd/U8S28=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722459027; x=1723063827;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L1IW9fAfwq5NHi01t4CV5LKiWLlhlBwcc8UFMWZp9sQ=;
        b=FqvAbRKqqkJ5BBPTTkvJ7MkFB3E569CkyBe2G+JWskx1tcQ9uqC/7xteN1yGA3clmM
         AOwP7j8CVoYZEV88fJYZdaKyFQfG5N1GyVGKCxWMAyLSPU1TZeM4Also8L78Ui5+M8/1
         jGd3lMfns/Yu99Vcs5Y2jLxovaTRo8KH9RtWr3NA81PSa6JSQPnEWh8F7ZAQ8zS8Auc1
         59P/ntIhz7dJMlKryS7pWRpwdyza6MkqaDI+s7P1y2La5fGaXV+fPU6zjP3fsjCNW9Ns
         OjjAyFm/NPKDUbBbQ2RtmIeN7kgHSFvfpGxOCzut2iLluUuiCvPsDc7y9gZGgVAK4XDN
         Xs4g==
X-Forwarded-Encrypted: i=1; AJvYcCVsie+2uTdY5a2uCso/qZG9VHimTj7cU/CDdSa3Id2ogMTfTTJTQk8zno9jgCzjQbEbSB6u/EjW8T3YoxDCAMQGUh5kQhRdrbcbXik=
X-Gm-Message-State: AOJu0Yxp2+covsrvN9rbfMkDZRtP652KECANwrSbmz2jH/3PZGm0igAm
	Yn+D2FZeZcMpNo+Nu5aTIj2bVfjw6NeofPIUJB1dKcz6UMtOjmSwhefTQvpPt9k=
X-Google-Smtp-Source: AGHT+IHiZKSox2G+KBZt85yTqo1If0pNRi36MPMG5PUE38oK6EzOOZBBO76h+Oh0f6kIAO981/aiaA==
X-Received: by 2002:a05:600c:35c9:b0:425:6962:4253 with SMTP id 5b1f17b1804b1-428b8a3da1emr2490685e9.4.1722459026790;
        Wed, 31 Jul 2024 13:50:26 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4282b8adc7dsm33246505e9.14.2024.07.31.13.50.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 13:50:26 -0700 (PDT)
Date: Wed, 31 Jul 2024 22:50:24 +0200
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Huan Yang <link@vivo.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
	opensource.kernel@vivo.com
Subject: Re: [PATCH] udmabuf: use kmem_cache to alloc udmabuf folio
Message-ID: <ZqqjkCZtDP3jtD_2@phenom.ffwll.local>
Mail-Followup-To: Huan Yang <link@vivo.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
	opensource.kernel@vivo.com
References: <20240731033449.1016195-1-link@vivo.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240731033449.1016195-1-link@vivo.com>
X-Operating-System: Linux phenom 6.9.10-amd64 

On Wed, Jul 31, 2024 at 11:34:49AM +0800, Huan Yang wrote:
> The current udmabuf_folio contains a list_head and the corresponding
> folio pointer, with a size of 24 bytes. udmabuf_folio uses kmalloc to
> allocate memory.
> 
> However, kmalloc is a public pool, starting from 64 bytes. This means
> that each udmabuf_folio allocation will waste 40 bytes.
> 
> Considering that each udmabuf creates a folio corresponding to a
> udmabuf_folio, the wasted memory can be significant in the case of
> memory fragmentation.
> 
> Furthermore, if udmabuf is frequently used, the allocation and
> deallocation of udmabuf_folio will also be frequent.
> 
> Therefore, this patch adds a kmem_cache dedicated to the allocation and
> deallocation of udmabuf_folio.This is expected to improve the
> performance of allocation and deallocation within the expected range,
> while also avoiding memory waste.
> 
> Signed-off-by: Huan Yang <link@vivo.com>
> ---
>  drivers/dma-buf/udmabuf.c | 18 +++++++++++++++---
>  1 file changed, 15 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
> index 047c3cd2ceff..db4de8c745ce 100644
> --- a/drivers/dma-buf/udmabuf.c
> +++ b/drivers/dma-buf/udmabuf.c
> @@ -24,6 +24,8 @@ static int size_limit_mb = 64;
>  module_param(size_limit_mb, int, 0644);
>  MODULE_PARM_DESC(size_limit_mb, "Max size of a dmabuf, in megabytes. Default is 64.");
>  
> +static struct kmem_cache *udmabuf_folio_cachep;
> +
>  struct udmabuf {
>  	pgoff_t pagecount;
>  	struct folio **folios;
> @@ -169,7 +171,7 @@ static void unpin_all_folios(struct list_head *unpin_list)
>  		unpin_folio(ubuf_folio->folio);
>  
>  		list_del(&ubuf_folio->list);
> -		kfree(ubuf_folio);
> +		kmem_cache_free(udmabuf_folio_cachep, ubuf_folio);
>  	}
>  }
>  
> @@ -178,7 +180,7 @@ static int add_to_unpin_list(struct list_head *unpin_list,
>  {
>  	struct udmabuf_folio *ubuf_folio;
>  
> -	ubuf_folio = kzalloc(sizeof(*ubuf_folio), GFP_KERNEL);
> +	ubuf_folio = kmem_cache_alloc(udmabuf_folio_cachep, GFP_KERNEL);
>  	if (!ubuf_folio)
>  		return -ENOMEM;
>  
> @@ -492,10 +494,20 @@ static int __init udmabuf_dev_init(void)
>  	if (ret < 0) {
>  		pr_err("Could not setup DMA mask for udmabuf device\n");
>  		misc_deregister(&udmabuf_misc);

misc_deregister() is now called twice in this error path, I think you've
forgotten to delete this line too?

Otherwise lgtm.
-Sima

> -		return ret;
> +		goto err;
> +	}
> +
> +	udmabuf_folio_cachep = KMEM_CACHE(udmabuf_folio, 0);
> +	if (unlikely(!udmabuf_folio_cachep)) {
> +		ret = -ENOMEM;
> +		goto err;
>  	}
>  
>  	return 0;
> +
> +err:
> +	misc_deregister(&udmabuf_misc);
> +	return ret;
>  }
>  
>  static void __exit udmabuf_dev_exit(void)
> 
> base-commit: cd19ac2f903276b820f5d0d89de0c896c27036ed
> -- 
> 2.45.2
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

