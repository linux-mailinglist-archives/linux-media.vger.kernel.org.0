Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44E3247D8AB
	for <lists+linux-media@lfdr.de>; Wed, 22 Dec 2021 22:23:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238235AbhLVVXE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Dec 2021 16:23:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230115AbhLVVXD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Dec 2021 16:23:03 -0500
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DC7AC061574
        for <linux-media@vger.kernel.org>; Wed, 22 Dec 2021 13:23:03 -0800 (PST)
Received: by mail-ed1-x52d.google.com with SMTP id f5so13548811edq.6
        for <linux-media@vger.kernel.org>; Wed, 22 Dec 2021 13:23:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=7uCwVgIdUNyS2+Vf8fBeHDqgyCKmyllVBt9AhJderrQ=;
        b=OFb4TBFRFmRtLgziqM2CU3Xz/keCLRPRbJxJLqSIzPw5DsjC77+SED3+wEqweXZu/r
         7f53W11o9hzg3gdkyNlw+8upEFr7t4TQVmqHZcqTjXzUvqpX8nW36zyW9isb3N8Jp7d4
         rznjmDEjh0Xj8pBPNSJvAmLkVwdGzapOlXhC4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=7uCwVgIdUNyS2+Vf8fBeHDqgyCKmyllVBt9AhJderrQ=;
        b=zOReQhjvAhDAtpXDPg4zfgw6LeG2hyDBHjK07Bh1St3g9TmPJ5hMwjhAv4cMBJtp0F
         gkiCODmm1e4yKTsIkmqD32xNSIq2JcG5oYPS5V3YrZoB9cc8gZdquGPu7fbZXqi63Z1d
         d23hNP2GaWajWLCGLJ6+o69OG/qXp+DZBv1P/zgwBrrs+WAwYDvkIU2NuWz9rbXgB342
         ulQ+5w5Dzv/KxpoLkIdXpCtd8a2wRmklOR1kMbzlugVRWlG1i7ipQIkryMeSxKvJaSo0
         MFAuHhU/RSeVndNzDRc5GJ+TylQSe59pYMcV8eEUzwbn3Y9IUVMqcWHAIDJ7ucejDhHA
         bg0g==
X-Gm-Message-State: AOAM5310tPrjZ9usbdmXftVkpEViN/Fqc+6p6N5ABCCJ83odZxXKNMcw
        9/Rf++RE/pIOoF+9sJZeFc1ifg==
X-Google-Smtp-Source: ABdhPJzmRP8AML3qliy2Op5iUsEArD0nhe3n5SG1dTwdhl3Xs7qcVR7f3Ddt4pQqd/BGaE2rQkP+2A==
X-Received: by 2002:a17:907:1629:: with SMTP id hb41mr4114530ejc.328.1640208182181;
        Wed, 22 Dec 2021 13:23:02 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id jt4sm1061781ejb.105.2021.12.22.13.23.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Dec 2021 13:23:01 -0800 (PST)
Date:   Wed, 22 Dec 2021 22:23:00 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Christian =?iso-8859-1?Q?K=F6nig?= 
        <ckoenig.leichtzumerken@gmail.com>
Cc:     daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH 05/24] RDMA: use dma_resv_wait() instead of extracting
 the fence
Message-ID: <YcOXNNxN4WajDN4L@phenom.ffwll.local>
References: <20211207123411.167006-1-christian.koenig@amd.com>
 <20211207123411.167006-6-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211207123411.167006-6-christian.koenig@amd.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Dec 07, 2021 at 01:33:52PM +0100, Christian König wrote:
> Use dma_resv_wait() instead of extracting the exclusive fence and
> waiting on it manually.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>

No rdma lists nor maintainers on cc, so no chances to get the ack you need
to merge this through drm-misc-next.


> ---
>  drivers/infiniband/core/umem_dmabuf.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/infiniband/core/umem_dmabuf.c b/drivers/infiniband/core/umem_dmabuf.c
> index f0760741f281..d32cd7538835 100644
> --- a/drivers/infiniband/core/umem_dmabuf.c
> +++ b/drivers/infiniband/core/umem_dmabuf.c
> @@ -16,7 +16,6 @@ int ib_umem_dmabuf_map_pages(struct ib_umem_dmabuf *umem_dmabuf)
>  {
>  	struct sg_table *sgt;
>  	struct scatterlist *sg;
> -	struct dma_fence *fence;
>  	unsigned long start, end, cur = 0;
>  	unsigned int nmap = 0;
>  	int i;
> @@ -68,11 +67,8 @@ int ib_umem_dmabuf_map_pages(struct ib_umem_dmabuf *umem_dmabuf)
>  	 * may be not up-to-date. Wait for the exporter to finish
>  	 * the migration.
>  	 */
> -	fence = dma_resv_excl_fence(umem_dmabuf->attach->dmabuf->resv);
> -	if (fence)
> -		return dma_fence_wait(fence, false);
> -
> -	return 0;
> +	return dma_resv_wait_timeout(umem_dmabuf->attach->dmabuf->resv, false,
> +				     false, MAX_SCHEDULE_TIMEOUT);

I think a wrapper for dma_resv_wait() without timeout would be neat, which
we lack. Either way:

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

>  }
>  EXPORT_SYMBOL(ib_umem_dmabuf_map_pages);
>  
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
