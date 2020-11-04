Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CEED12A5F0D
	for <lists+linux-media@lfdr.de>; Wed,  4 Nov 2020 09:03:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726691AbgKDIDV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Nov 2020 03:03:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726152AbgKDIDV (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 Nov 2020 03:03:21 -0500
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0AD2C061A4D;
        Wed,  4 Nov 2020 00:03:20 -0800 (PST)
Received: by mail-ej1-x644.google.com with SMTP id k3so28387834ejj.10;
        Wed, 04 Nov 2020 00:03:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:references:message-id:date:user-agent:mime-version
         :in-reply-to:content-transfer-encoding:content-language;
        bh=lSHGlcZONhf6qBQExAcS/zcrqWFtE8KDWWdwXpyQQ+o=;
        b=JQRa+YZuAJZjt1g7TC9uAoHYTcFw/40zCiI/3Bz628T8dyzU/yCN5jgd/Etdq+GbEH
         rvQ0wwkqSkrFz6SZ+s29kV53j3Ij6xInhh5wd2YonabzH3OIqagnV3Y/fwYlJGUIsbju
         M6Pgp2sRf+Jk2ZRChyJYcGR/I0zh9K3Rl6el5aeVgdm0J8zJkqP5jgFK3OycNIjnoidP
         GdBR+n1qZJtM6kAiVsUJ4iPzD4JNOEnxhbkijpte9JvvDa/5TM/FLLZ573iv+9j6gIM6
         I7tnIrRTbVArZ2dr8ZpE/5Cpmo4V7ibsFSprrAEKDa5kJlkpzbHvcUOw6a6iEgUHUr/2
         z5xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=lSHGlcZONhf6qBQExAcS/zcrqWFtE8KDWWdwXpyQQ+o=;
        b=uKtzNPKXuyB11kMa2pEQm5xkoSxtvZnofJG3l8rmSZ2WT9a+aszYl/zWH0O9+Qck7u
         cS4CcRsXcBU3PUg7entZ8m43W3MpopSDElKjSWvuL3CnQUbs1UQ+j6q13A4VL2CqV+me
         n9ODlnwz48c3NQ/VpnQNb0FYjnCtWrFxit5mYAp2pIKra5eH/JXK+U0U4OZfnYGYCbHv
         rTG0VFAAr/cKFoO3ab0c+YW2RtNAtyclJr5CPpGITo86PehmbNd37mPBZVgI5zJBlARS
         95iJjq+BiPus7KT+eITUz0M/A4DnutssrOmbDbNSwylKX21VOUxpRH+CsDAgLCLfAY3e
         aQIg==
X-Gm-Message-State: AOAM5315164I4SXRt204rVHBoWti3N+y7nZAHj3v+EafhdfSYarCxXmV
        l75g4p24aZBgb/Lwc0vmKYx3ByqCbco=
X-Google-Smtp-Source: ABdhPJyYf7wTm7PCR+aDC0KR0zCSeQg/FQpbVuARHDgbDgaGw2ovwStfe5mIvBm9OL1gpSoTMbbB9g==
X-Received: by 2002:a17:906:c1d4:: with SMTP id bw20mr23369417ejb.91.1604476999489;
        Wed, 04 Nov 2020 00:03:19 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7? ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
        by smtp.gmail.com with ESMTPSA id f25sm600558edr.53.2020.11.04.00.03.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2020 00:03:18 -0800 (PST)
Subject: Re: [PATCH 1/2] mm: mmap: fix fput in error path v2
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
To:     akpm@linux-foundation.org, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        chris@chris-wilson.co.uk, airlied@redhat.com, daniel@ffwll.ch,
        sumit.semwal@linaro.org, willy@infradead.org, jhubbard@nvidia.com,
        jgg@ziepe.ca, linmiaohe@huawei.com
References: <20201012085203.56119-1-christian.koenig@amd.com>
Message-ID: <be6d248d-01d4-f2a3-5e33-7f311daef0b7@gmail.com>
Date:   Wed, 4 Nov 2020 09:03:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201012085203.56119-1-christian.koenig@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If nobody comes up with an objections I'm going to merge that through 
drm-misc-next.

Thanks,
Christian.

Am 12.10.20 um 10:52 schrieb Christian König:
> Patch "495c10cc1c0c CHROMIUM: dma-buf: restore args..."
> adds a workaround for a bug in mmap_region.
>
> As the comment states ->mmap() callback can change
> vma->vm_file and so we might call fput() on the wrong file.
>
> Revert the workaround and proper fix this in mmap_region.
>
> v2: drop the extra if in dma_buf_mmap as well
>
> Signed-off-by: Christian König <christian.koenig@amd.com>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>   drivers/dma-buf/dma-buf.c | 20 +++-----------------
>   mm/mmap.c                 |  2 +-
>   2 files changed, 4 insertions(+), 18 deletions(-)
>
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index a6ba4d598f0e..08630d057cf2 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -1143,9 +1143,6 @@ EXPORT_SYMBOL_GPL(dma_buf_end_cpu_access);
>   int dma_buf_mmap(struct dma_buf *dmabuf, struct vm_area_struct *vma,
>   		 unsigned long pgoff)
>   {
> -	struct file *oldfile;
> -	int ret;
> -
>   	if (WARN_ON(!dmabuf || !vma))
>   		return -EINVAL;
>   
> @@ -1163,22 +1160,11 @@ int dma_buf_mmap(struct dma_buf *dmabuf, struct vm_area_struct *vma,
>   		return -EINVAL;
>   
>   	/* readjust the vma */
> -	get_file(dmabuf->file);
> -	oldfile = vma->vm_file;
> -	vma->vm_file = dmabuf->file;
> +	fput(vma->vm_file);
> +	vma->vm_file = get_file(dmabuf->file);
>   	vma->vm_pgoff = pgoff;
>   
> -	ret = dmabuf->ops->mmap(dmabuf, vma);
> -	if (ret) {
> -		/* restore old parameters on failure */
> -		vma->vm_file = oldfile;
> -		fput(dmabuf->file);
> -	} else {
> -		if (oldfile)
> -			fput(oldfile);
> -	}
> -	return ret;
> -
> +	return dmabuf->ops->mmap(dmabuf, vma);
>   }
>   EXPORT_SYMBOL_GPL(dma_buf_mmap);
>   
> diff --git a/mm/mmap.c b/mm/mmap.c
> index 40248d84ad5f..3a2670d73355 100644
> --- a/mm/mmap.c
> +++ b/mm/mmap.c
> @@ -1852,8 +1852,8 @@ unsigned long mmap_region(struct file *file, unsigned long addr,
>   	return addr;
>   
>   unmap_and_free_vma:
> +	fput(vma->vm_file);
>   	vma->vm_file = NULL;
> -	fput(file);
>   
>   	/* Undo any partial mapping done by a device driver. */
>   	unmap_region(mm, vma, prev, vma->vm_start, vma->vm_end);

