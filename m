Return-Path: <linux-media+bounces-11594-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF9338C8550
	for <lists+linux-media@lfdr.de>; Fri, 17 May 2024 13:11:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 76616281BA5
	for <lists+linux-media@lfdr.de>; Fri, 17 May 2024 11:11:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFBDE3BB20;
	Fri, 17 May 2024 11:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="JqPQFdnU"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95FB33A28E
	for <linux-media@vger.kernel.org>; Fri, 17 May 2024 11:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715944305; cv=none; b=cVTwXGHwW98IF1H5fv8zPi9g1HsyIyy/JcIhiZ1nXBd9DaREsQ1CDC+LT9/eFxvZZv99zsW67Ii8YgSf25ug3ukHrz9ozB1yviqxS8H0z91MsAihSHDiM3qv3xL2HQvPKHiAlCCHojWzGcdCEbbKeW7n98NB3FVyTH5JXJbdzUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715944305; c=relaxed/simple;
	bh=bsHwyLU1JWlCeweRVx7mI9guSKJ9whpiVchqwNI2eUc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IH9ZzGqPdml5CT/jjpT2O4527qzuB0oumDkO4QKEj/MsY5gjFW0ldmmzo3Wh/t8Fjeu7KVemU3/LVfrJtBhXLgSMEz/crHDphGkeYt2H0x+mnjhwL7ui0tt0hpgfIASC4Rrqy85isB0BgxA/rKVoz4b6kHJHaPPrvQ5C6eb3FRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=JqPQFdnU; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2b33d011e5dso39381a91.0
        for <linux-media@vger.kernel.org>; Fri, 17 May 2024 04:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1715944303; x=1716549103; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1HywPLbaWJxCxiU/ZxKcyrVCr65pGTtmyNTRw7JGX4k=;
        b=JqPQFdnUeuUyHcYjsa1Nq0muRlmTRA7Sx8sXN/66d+hEeupLROWNNDyi6nbSbML85u
         NKLWufLgmB54vTSFWKcH7yIxLKUzmu7aGP/BaO0rPglG9zIPhMcCLxKdSjH+vcPT6NAr
         NmS82tftktYwpR8meoTIRmS0zNKi+aCw3FV+8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715944303; x=1716549103;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1HywPLbaWJxCxiU/ZxKcyrVCr65pGTtmyNTRw7JGX4k=;
        b=HWThVTBQeuJTWLlj8zXAGmKClu89jtUgpr0auuX+jugIcxpkS+bcQANktSlYT7vuOJ
         dhVDbRrRupxg3AQVBRH5eTQiJ8u0RA2jdoeRM6mS71EEzbCMG/A1ik0f7bopYgMxD0SE
         f3sIqziC3WERKsnBPbT9A1Cb7RYHvvEDGfLh1EwarsXN78LwYtYfjyoJD99/HxNh4bDh
         Wj1Okv85kQvDf7W/oYOMB2jk9DnG4KQomPAK4PAT7p/qlDeB9+ipc6F35D3H0bMJxX1V
         SA8xmp6Rqoh2jpi0tEczJgAkWTEHVoMEid4zaejaocwEIBvuIVjYJgwXUl4ZpPFKkN9v
         Ncgg==
X-Forwarded-Encrypted: i=1; AJvYcCVlIekb+0PCIGPIgHp87vq8yt/3PuRJoGoVXcy4ZtlfStzFBxsJUVZXg+GwtiDbxVCJDGnayfQIj+QANFIBwIUDqA0FkZLAU0ReAzw=
X-Gm-Message-State: AOJu0YyfwTtXePK9/Pg/eW0ysZxqU0GoUzphJJZN0vS+pPnob6tgSVz1
	PtyJATaWwlLUETi3XVfMLF4r6LzXJfnJJhu6qHNOjP7+HdflbdqaJxWtjyD89Q==
X-Google-Smtp-Source: AGHT+IGp82lW8rEKRe/2329QyXgEfgDRdOm01kRBTSngU/uKtRNIX+mJ77MaRX5gICTaHbfLJS6nqQ==
X-Received: by 2002:a17:90b:2351:b0:2b2:9783:d0ca with SMTP id 98e67ed59e1d1-2b6c71100b2mr30691251a91.12.1715944302624;
        Fri, 17 May 2024 04:11:42 -0700 (PDT)
Received: from chromium.org (237.198.80.34.bc.googleusercontent.com. [34.80.198.237])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2b6711661c0sm15236971a91.22.2024.05.17.04.11.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 May 2024 04:11:42 -0700 (PDT)
Date: Fri, 17 May 2024 20:11:39 +0900
From: Tomasz Figa <tfiga@chromium.org>
To: Yunke Cao <yunkec@chromium.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Subject: Re: [PATCH v2 1/3] media: videobuf2-core: release all planes first
 in __prepare_dmabuf()
Message-ID: <idyreh3tm33dappbaoek43urhr75jhcu44l6d67qszos42yhcp@mqxlfmdmryto>
References: <20240403091306.1308878-1-yunkec@chromium.org>
 <20240403091306.1308878-2-yunkec@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240403091306.1308878-2-yunkec@chromium.org>

Hi Yunke,

On Wed, Apr 03, 2024 at 06:13:04PM +0900, Yunke Cao wrote:
> The existing implementation, validating planes, checking if the planes
> changed, releasing previous planes and reaquiring new planes all happens in
> the same for loop.
> 
> Split the for loop into 3 parts
> 1. In the first for loop, validate planes and check if planes changed.
> 2. Call __vb2_buf_dmabuf_put() to release all planes.
> 3. In the second for loop, reaquire new planes.
> 
> Signed-off-by: Yunke Cao <yunkec@chromium.org>
> ---
>  .../media/common/videobuf2/videobuf2-core.c   | 64 ++++++++++---------
>  1 file changed, 34 insertions(+), 30 deletions(-)
> 

Thanks for the second revision and sorry for the delay. Please check my
comments inline.

> diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
> index b6bf8f232f48..702f7b6f783a 100644
> --- a/drivers/media/common/videobuf2/videobuf2-core.c
> +++ b/drivers/media/common/videobuf2/videobuf2-core.c
> @@ -1341,11 +1341,13 @@ static int __prepare_dmabuf(struct vb2_buffer *vb)
>  	for (plane = 0; plane < vb->num_planes; ++plane) {
>  		struct dma_buf *dbuf = dma_buf_get(planes[plane].m.fd);
>  
> +		planes[plane].dbuf = dbuf;
> +
>  		if (IS_ERR_OR_NULL(dbuf)) {
>  			dprintk(q, 1, "invalid dmabuf fd for plane %d\n",
>  				plane);
>  			ret = -EINVAL;
> -			goto err;
> +			goto err_put_dbuf;

nit: Maybe err_put_planes, since we're cleaning up the planes[] array?

>  		}
>  
>  		/* use DMABUF size if length is not provided */
> @@ -1356,17 +1358,14 @@ static int __prepare_dmabuf(struct vb2_buffer *vb)
>  			dprintk(q, 1, "invalid dmabuf length %u for plane %d, minimum length %u\n",
>  				planes[plane].length, plane,
>  				vb->planes[plane].min_length);
> -			dma_buf_put(dbuf);
>  			ret = -EINVAL;
> -			goto err;
> +			goto err_put_dbuf;
>  		}
>  
>  		/* Skip the plane if already verified */
>  		if (dbuf == vb->planes[plane].dbuf &&
> -			vb->planes[plane].length == planes[plane].length) {
> -			dma_buf_put(dbuf);
> +		    vb->planes[plane].length == planes[plane].length)
>  			continue;
> -		}
>  
>  		dprintk(q, 3, "buffer for plane %d changed\n", plane);
>  
> @@ -1375,29 +1374,30 @@ static int __prepare_dmabuf(struct vb2_buffer *vb)
>  			vb->copied_timestamp = 0;
>  			call_void_vb_qop(vb, buf_cleanup, vb);

Would it make sense to also move these two to the if (reacquired) part
below, since they are done once for the entire vb?

>  		}
> +	}
>  
> -		/* Release previously acquired memory if present */
> -		__vb2_plane_dmabuf_put(vb, &vb->planes[plane]);
> -		vb->planes[plane].bytesused = 0;
> -		vb->planes[plane].length = 0;
> -		vb->planes[plane].m.fd = 0;
> -		vb->planes[plane].data_offset = 0;

I don't see the code below setting the 4 fields above to zero. Is it
intended?

> +	if (reacquired) {
> +		__vb2_buf_dmabuf_put(vb);
> +
> +		for (plane = 0; plane < vb->num_planes; ++plane) {
> +			/* Acquire each plane's memory */
> +			mem_priv = call_ptr_memop(attach_dmabuf,
> +						  vb,
> +						  q->alloc_devs[plane] ? : q->dev,
> +						  planes[plane].dbuf,
> +						  planes[plane].length);
> +			if (IS_ERR(mem_priv)) {
> +				dprintk(q, 1, "failed to attach dmabuf\n");
> +				ret = PTR_ERR(mem_priv);
> +				goto err_put_dbuf;

Hmm, I think in this case we need to also clean up the partially acquired
planes of vb.

> +			}
>  
> -		/* Acquire each plane's memory */
> -		mem_priv = call_ptr_memop(attach_dmabuf,
> -					  vb,
> -					  q->alloc_devs[plane] ? : q->dev,
> -					  dbuf,
> -					  planes[plane].length);
> -		if (IS_ERR(mem_priv)) {
> -			dprintk(q, 1, "failed to attach dmabuf\n");
> -			ret = PTR_ERR(mem_priv);
> -			dma_buf_put(dbuf);
> -			goto err;
> +			vb->planes[plane].dbuf = planes[plane].dbuf;
> +			vb->planes[plane].mem_priv = mem_priv;
>  		}
> -
> -		vb->planes[plane].dbuf = dbuf;
> -		vb->planes[plane].mem_priv = mem_priv;
> +	} else {
> +		for (plane = 0; plane < vb->num_planes; ++plane)
> +			dma_buf_put(planes[plane].dbuf);
>  	}
>  
>  	/*
> @@ -1413,7 +1413,7 @@ static int __prepare_dmabuf(struct vb2_buffer *vb)
>  		if (ret) {
>  			dprintk(q, 1, "failed to map dmabuf for plane %d\n",
>  				plane);
> -			goto err;
> +			goto err_put_vb2_buf;
>  		}
>  		vb->planes[plane].dbuf_mapped = 1;
>  	}

I think this entire loop can also go under the (reacquired) case, since
(!reacquired) means that all the planes were identical (and thus are
alreday mapped). Given that now we release all the planes in one go, we
could even simplify it by dropping the dbuf_mapped check from the loop.

> @@ -1437,7 +1437,7 @@ static int __prepare_dmabuf(struct vb2_buffer *vb)
>  		ret = call_vb_qop(vb, buf_init, vb);
>  		if (ret) {
>  			dprintk(q, 1, "buffer initialization failed\n");
> -			goto err;
> +			goto err_put_vb2_buf;
>  		}
>  	}

Same for this block.

>  
> @@ -1445,11 +1445,15 @@ static int __prepare_dmabuf(struct vb2_buffer *vb)
>  	if (ret) {
>  		dprintk(q, 1, "buffer preparation failed\n");
>  		call_void_vb_qop(vb, buf_cleanup, vb);
> -		goto err;
> +		goto err_put_vb2_buf;
>  	}
>  
>  	return 0;
> -err:
> +
> +err_put_dbuf:
> +	for (plane = 0; plane < vb->num_planes; ++plane)

dma_buf_put() will throw a warning if the dmabuf pointer is NULL and just
plain crash if IS_ERR(), so we shouldn't call it on array elements that we
didn't succeed for.

> +		dma_buf_put(planes[plane].dbuf);
> +err_put_vb2_buf:
>  	/* In case of errors, release planes that were already acquired */
>  	__vb2_buf_dmabuf_put(vb);

Actually, would it make sense to invert the order of clean-up steps here?
In case if only the first loop fails, we don't really need to do anything with
vb. Or am I missing something?

Best regards,
Tomasz

