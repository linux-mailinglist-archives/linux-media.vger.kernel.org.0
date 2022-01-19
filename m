Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32AF5493C91
	for <lists+linux-media@lfdr.de>; Wed, 19 Jan 2022 16:05:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355515AbiASPFg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Jan 2022 10:05:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355626AbiASPFX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Jan 2022 10:05:23 -0500
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4562C061574
        for <linux-media@vger.kernel.org>; Wed, 19 Jan 2022 07:05:22 -0800 (PST)
Received: by mail-wm1-x32e.google.com with SMTP id j5-20020a05600c1c0500b0034d2e956aadso5998872wms.4
        for <linux-media@vger.kernel.org>; Wed, 19 Jan 2022 07:05:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=0odyDD4qZWEyKf4dgk5bsg3tKYSY9CGvoUStfcevylA=;
        b=KY4YCZwWueLtUID+/YuRziwAprnxroizrhhiLqgR+VJv0dvAqf6p/e/Z8+2hbD5td3
         M1RXz2Ulz5/UO405poQs0LC2mWECerbCYmm6/PclkyYapoYCKVCVsrH7+qHMc7mD7DNG
         yVv6KCpVaJQuyRwX173l73U/aTdl9LopqeRzs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=0odyDD4qZWEyKf4dgk5bsg3tKYSY9CGvoUStfcevylA=;
        b=QV7X+LY+tVtSekBh11QNNsnmh8IzTQIXFY5+N+x6IWDdqJPfpCc1JXcSUywHLogL3r
         crhXIyNcnwfw7ZeE5hc+uPxNfRSab6Pb8PqS8+Cm5siZFSxlWmRb7DtpLQpR3tjMrzCK
         sCJ44x//RURr8e6wLo1enlXo8i7FTIyq0HGVKLiGassDXcJ5GhY5YXW7Ra5qpTDGLkQV
         1clIUA6S/c9sQjrmXVip/B+f3HEvpV5/9h7ozax7WEuwP8/NXcjUSrYv0plhRoxyiItD
         UGtaCQRBrxCN+wkLuOLcSCZJYEqz+krXNYSNwIxgdqM29G1FIoxCjUlAJ0d5l1R1wYVn
         ZCog==
X-Gm-Message-State: AOAM530fjaG2SPDBxzI9ek5Slrjd3c9iJzKLj8yxJ8BdSDo3BUE5DWWk
        +LDdmfumShLpPJIOWyvRRFBhAw==
X-Google-Smtp-Source: ABdhPJxqxOTFLl5T1cf1q2Ex/gbOeL3/4WLRyt3JAUtwMEe4sBmurRyS45VDAxAFnc6SDjv5q4TcRQ==
X-Received: by 2002:adf:fec2:: with SMTP id q2mr29547534wrs.546.1642604721320;
        Wed, 19 Jan 2022 07:05:21 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id g17sm7645503wmq.9.2022.01.19.07.05.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jan 2022 07:05:20 -0800 (PST)
Date:   Wed, 19 Jan 2022 16:05:18 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Weizhao Ouyang <o451686892@gmail.com>
Cc:     Sumit Semwal <sumit.semwal@linaro.org>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Liam Mark <lmark@codeaurora.org>,
        Laura Abbott <labbott@kernel.org>,
        Brian Starkey <Brian.Starkey@arm.com>,
        John Stultz <john.stultz@linaro.org>, christian.koenig@amd.com,
        linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Subject: Re: [PATCH] dma-buf: cma_heap: Fix mutex locking section
Message-ID: <YegormDmEewox0MF@phenom.ffwll.local>
Mail-Followup-To: Weizhao Ouyang <o451686892@gmail.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Liam Mark <lmark@codeaurora.org>, Laura Abbott <labbott@kernel.org>,
        Brian Starkey <Brian.Starkey@arm.com>,
        John Stultz <john.stultz@linaro.org>, christian.koenig@amd.com,
        linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
References: <20220104073545.124244-1-o451686892@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220104073545.124244-1-o451686892@gmail.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jan 04, 2022 at 03:35:45PM +0800, Weizhao Ouyang wrote:
> Fix cma_heap_buffer mutex locking critical section to protect vmap_cnt
> and vaddr.
> 
> Fixes: a5d2d29e24be ("dma-buf: heaps: Move heap-helper logic into the cma_heap implementation")
> Signed-off-by: Weizhao Ouyang <o451686892@gmail.com>
> ---
>  drivers/dma-buf/heaps/cma_heap.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/cma_heap.c
> index 0c05b79870f9..83f02bd51dda 100644
> --- a/drivers/dma-buf/heaps/cma_heap.c
> +++ b/drivers/dma-buf/heaps/cma_heap.c
> @@ -124,10 +124,11 @@ static int cma_heap_dma_buf_begin_cpu_access(struct dma_buf *dmabuf,
>  	struct cma_heap_buffer *buffer = dmabuf->priv;
>  	struct dma_heap_attachment *a;
>  
> +	mutex_lock(&buffer->lock);
> +
>  	if (buffer->vmap_cnt)
>  		invalidate_kernel_vmap_range(buffer->vaddr, buffer->len);

Since this creates nesting with mm/, but optionally I think it'd be good
to prime lockdep so it knows about this. See e.g. dma_resv_lockdep() in
dma-resv.c, except I don't know offhand what the right lock for
invalidate_kernel_vmap_range is.
-Daniel


>  
> -	mutex_lock(&buffer->lock);
>  	list_for_each_entry(a, &buffer->attachments, list) {
>  		if (!a->mapped)
>  			continue;
> @@ -144,10 +145,11 @@ static int cma_heap_dma_buf_end_cpu_access(struct dma_buf *dmabuf,
>  	struct cma_heap_buffer *buffer = dmabuf->priv;
>  	struct dma_heap_attachment *a;
>  
> +	mutex_lock(&buffer->lock);
> +
>  	if (buffer->vmap_cnt)
>  		flush_kernel_vmap_range(buffer->vaddr, buffer->len);
>  
> -	mutex_lock(&buffer->lock);
>  	list_for_each_entry(a, &buffer->attachments, list) {
>  		if (!a->mapped)
>  			continue;
> -- 
> 2.32.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
