Return-Path: <linux-media+bounces-4834-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 30FED84CF6C
	for <lists+linux-media@lfdr.de>; Wed,  7 Feb 2024 18:10:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3DCC01C26CAC
	for <lists+linux-media@lfdr.de>; Wed,  7 Feb 2024 17:10:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC61C7A70E;
	Wed,  7 Feb 2024 17:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="kwxj5o5r"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67A8B823B9
	for <linux-media@vger.kernel.org>; Wed,  7 Feb 2024 17:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707325817; cv=none; b=CgwWlvE06ngK0G/zzjbmxkfOcT9cV2kSZtslcG717RZ3X/b/Da3Oqd2+9q+Ynx1U3MIa7Y4qqPYB45Cpz1HGZqsKvIuZ0VATOUZXWWJzdplr3hXSJ8cPCDH+ENXdxi8BxAgej5pzoG+/gPy59LAxIfJu3eRgBwMMFXY7tbD5cEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707325817; c=relaxed/simple;
	bh=vEUPI+uVUhfTV/tojMqehfC5wsKr2e5S0TdhVxbgmpk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=su42prOBmL2lFctr6XD3qwulH+2EWnLCGYc2AsLd2/LH1Z7Pn+ll9rqJb+XS5cIHpjCDgsd1nvALnFMk5iYs4xFulDpuCX5ueXq4VX/XRAe+J21o8HB3RHiD3Kj2rBSK9TNQUFz69Cvkio/x39fFFLk3lSvKpNbq0hOhgCs1AOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=kwxj5o5r; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-40fb7427044so2665905e9.0
        for <linux-media@vger.kernel.org>; Wed, 07 Feb 2024 09:10:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1707325812; x=1707930612; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UPG+Y5UifSfAr1b/3ugQkQKZbhHpDNonzO9dzweV4Ww=;
        b=kwxj5o5r3k2qZWAp2ske0jdNDUjyE8l1jCeq/X2uoaiFLy52Flmd77vayPCatztiRr
         lW6ZIIwoo4itIYGQGTHWp16g+iNNCH9ya1EHAFCAsjZ5dUw5rikKlEr1DC/A4EYizTK5
         k4Oa70jPZomY0Bvmm+R8kbI41EwubCbBIguCY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707325812; x=1707930612;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UPG+Y5UifSfAr1b/3ugQkQKZbhHpDNonzO9dzweV4Ww=;
        b=eOUxWJXLZk6FNc4Hk5CDp0i7qDhc7pZxpwHvCHXrgjWZOkYS8ozhXlkGf4UZSbPJwi
         tv2FhM9DzsNdxatmGYIhbgQTE3ZBWSzXsk0abxuXmy16NLcjEI8D3rF3eb+4toF0f2a1
         TQ90JYpinUoZcpyJBY53mK0jh7ivpGj2dzu9G5KjOI3tTxL9c28oGOEBX3vSJvCJwUnx
         2AyjZ/NRR0ljH4JFME3Qt+Re3U51P13kj+LSqXvDCiStC18BF8NrP2JqnayBDkm9r+SO
         NQmW8+ZuAvVDOlkanqdn+HUy5GTnkWyO7oqeO9GFw48wgtV3AyP5v2Xyst9lu1IjYL+x
         S4DA==
X-Forwarded-Encrypted: i=1; AJvYcCX2qGGDG42rwgbcmx4WuFuV7wK0bkX77qiX7bmYmQv9qfG+/BVSm8Xc6370ZA2PM9MJJRf79eRYBjYA7M5gP161i43puISi4WHHD6s=
X-Gm-Message-State: AOJu0Yy1m/kp4AcXfm5+OY0ryGmcbzdEyTnTEYybe8x4JQPSvNd0Cjd2
	KqrOwX33AKH0d5ASfBfOoa2hGmtxXBNjEIkrB/5QfIRrZ7JFRPIWlDM6wrlafrg=
X-Google-Smtp-Source: AGHT+IEsPRfVy9ib6+oPTaqzljo0dzFnfy37G2xZ7RAqfN0oGHicnE8YOdNtlahZH3k+EfqI3cynvg==
X-Received: by 2002:a05:600c:3d8e:b0:40f:e930:9ebe with SMTP id bi14-20020a05600c3d8e00b0040fe9309ebemr3771440wmb.0.1707325812247;
        Wed, 07 Feb 2024 09:10:12 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU4d78PdJmWpGaxeVM/qVZphJus4y+keSsoOAhdIG4L9XbZi80S4LVlZjttUegahtRfb+WxnirB+rL7E+6dEhFQZdLaQyPdkA85Et84sn/Z8V/ODYhjfY3gJmYMEOdASWS2hdFyUPFRrIZVkyqcw0v85EO8qpTdvza67qAvwxb8v8BF/UDU0yEtj/Fn+NGrXSYKuDi9d7XLMrSSk76P9fgRxH0AWyOIvrR05xWc7FcVAoPrRXBLzq7YxpULr524RIadgKGCNrDuyW8mlrDJUD7xOJeXQD13mpqPdZWEXcQnHr3PlmyY9P7zejXJmXoH7gngc7HcscVY61Kip0O2FNSNaM+3P97i/aa9+TLPtTTFX+vV65/23X6hTg7Onsn7Q9bNaviLS1LE6W6mgxV274yHq6U/3XLMgAU6cMqSzvM0MAghTIXF0LHNbKtFP8+14g1vjHl3lVfjH9rlI5hH9zzOblXyvY+ixmIMPg==
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id m4-20020a05600c4f4400b0041007731a52sm2697105wmq.11.2024.02.07.09.10.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Feb 2024 09:10:11 -0800 (PST)
Date: Wed, 7 Feb 2024 18:10:09 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Paul Cercueil <paul@crapouillou.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Nuno =?iso-8859-1?Q?S=E1?= <noname.nuno@gmail.com>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	linux-usb@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [Linaro-mm-sig] [PATCH v5 2/6] dma-buf: udmabuf: Implement
 .{begin,end}_access
Message-ID: <ZcO5ccqwTIhSKDfS@phenom.ffwll.local>
Mail-Followup-To: Paul Cercueil <paul@crapouillou.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Nuno =?iso-8859-1?Q?S=E1?= <noname.nuno@gmail.com>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	linux-usb@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
References: <20240119141402.44262-1-paul@crapouillou.net>
 <20240119141402.44262-3-paul@crapouillou.net>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240119141402.44262-3-paul@crapouillou.net>
X-Operating-System: Linux phenom 6.6.11-amd64 

On Fri, Jan 19, 2024 at 03:13:58PM +0100, Paul Cercueil wrote:
> Implement .begin_access() and .end_access() callbacks.
> 
> For now these functions will simply sync/flush the CPU cache when
> needed.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> 
> ---
> v5: New patch
> ---
>  drivers/dma-buf/udmabuf.c | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 
> diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
> index c40645999648..a87d89b58816 100644
> --- a/drivers/dma-buf/udmabuf.c
> +++ b/drivers/dma-buf/udmabuf.c
> @@ -179,6 +179,31 @@ static int end_cpu_udmabuf(struct dma_buf *buf,
>  	return 0;
>  }
>  
> +static int begin_udmabuf(struct dma_buf_attachment *attach,
> +			 struct sg_table *sgt,
> +			 enum dma_data_direction dir)
> +{
> +	struct dma_buf *buf = attach->dmabuf;
> +	struct udmabuf *ubuf = buf->priv;
> +	struct device *dev = ubuf->device->this_device;
> +
> +	dma_sync_sg_for_device(dev, sgt->sgl, sg_nents(sgt->sgl), dir);

So one thing I've just wondered is whether we've made sure that this is
only doing cache coherency maintenance, and not swiotlb bounce buffer
copying. The latter would really not be suitable for dma-buf anymore I
think.

Not sure how to best check for that since it's all in the depths of the
dma-api code, but I guess the best way to really make sure is to disable
CONFIG_SWIOTLB. Otherwise I guess the way to absolutely make sure is to
trace swiotlb_sync_single_for_device/cpu.

It would be kinda neat if dma-buf.c code could make sure you never ever
get an swiotlb entry from a dma_buf_map_attachment call, but I don't think
we can enforce that. There's sg_dma_is_swiotlb, but that won't catch all
implementations, only the generic dma-iommu.c one.

Cheers, Sima

> +	return 0;
> +}
> +
> +static int end_udmabuf(struct dma_buf_attachment *attach,
> +		       struct sg_table *sgt,
> +		       enum dma_data_direction dir)
> +{
> +	struct dma_buf *buf = attach->dmabuf;
> +	struct udmabuf *ubuf = buf->priv;
> +	struct device *dev = ubuf->device->this_device;
> +
> +	if (dir != DMA_TO_DEVICE)
> +		dma_sync_sg_for_cpu(dev, sgt->sgl, sg_nents(sgt->sgl), dir);
> +	return 0;
> +}
> +
>  static const struct dma_buf_ops udmabuf_ops = {
>  	.cache_sgt_mapping = true,
>  	.map_dma_buf	   = map_udmabuf,
> @@ -189,6 +214,8 @@ static const struct dma_buf_ops udmabuf_ops = {
>  	.vunmap		   = vunmap_udmabuf,
>  	.begin_cpu_access  = begin_cpu_udmabuf,
>  	.end_cpu_access    = end_cpu_udmabuf,
> +	.begin_access      = begin_udmabuf,
> +	.end_access        = end_udmabuf,
>  };
>  
>  #define SEALS_WANTED (F_SEAL_SHRINK)
> -- 
> 2.43.0
> 
> _______________________________________________
> Linaro-mm-sig mailing list -- linaro-mm-sig@lists.linaro.org
> To unsubscribe send an email to linaro-mm-sig-leave@lists.linaro.org

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

