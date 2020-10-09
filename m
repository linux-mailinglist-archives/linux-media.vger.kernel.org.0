Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 755F7288C5D
	for <lists+linux-media@lfdr.de>; Fri,  9 Oct 2020 17:15:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389202AbgJIPPm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Oct 2020 11:15:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388533AbgJIPPm (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Oct 2020 11:15:42 -0400
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com [IPv6:2607:f8b0:4864:20::844])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22DEEC0613D5
        for <linux-media@vger.kernel.org>; Fri,  9 Oct 2020 08:15:42 -0700 (PDT)
Received: by mail-qt1-x844.google.com with SMTP id d1so8177404qtr.6
        for <linux-media@vger.kernel.org>; Fri, 09 Oct 2020 08:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=XeahOZa88YOWCvFbh6+bgMvAS5KgvoSIrQZEwsz1AvI=;
        b=fiL8LqVIzi0BjC3AqpEniGWmtrH2e79DZDkKidQOoBdeBwwAF9glihw+P1udtUiRiR
         dTk+zv6qfOMRvAe+t3ZpstOPjWPwltaqd/54uMwnhyMbGimWYP6wjQZSPDPRSBLDMEq3
         jODLb9NnENznI2EjlVY8eeeQyOUt4wDCUBVw5E4o4CtxhrkZCvZljgQal96XAy815jPH
         RDf/kD1jB8E0S7A8xBT0hfridv/3aaapdFgFp0DMdGUAYVCsNNXdo32vpE1si8aOY0qD
         6JQLnOXMhIaPxpkffwZ3sgo12yyxh9cXcLPNx5AWVvptt5wn10sWuE/osKnMQoWVJT4F
         EMkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=XeahOZa88YOWCvFbh6+bgMvAS5KgvoSIrQZEwsz1AvI=;
        b=ipH/m17sXJvUblKHkydwmIhI/z/sqfMw15ZooJfVg4us9JMDaEa0dOj9V62eU9dbTe
         EEKHvy29KNtYgg4C1XALRtTTijc1XRfO/0Y+TngGDoXEaHj4AUPnOEFLnqTx90+A93QE
         reGbwvw3o6fYCZcRfVZ2oa5PSyXW+fsDNA+jCFyPOgthcKrUm1QrJ9wgkNq0PKTLEdx2
         h/7e01vv+abu5sBvpBP8wntCKVaq/J+VFoWoDKv0BOuZr2KKXTzyW+DaTGyq+PuLBUXB
         hVB7z8wqHroBYgdcCd3uxK57Hb1fEeTk4kMrBa+ov5/O3PQbD5M0f98DmV0yIZIKUo20
         DoDg==
X-Gm-Message-State: AOAM532aquP9Db6BP147Gb/7wGDiAnQR4DxeJkz9wwK9gDKVRKtZNjH5
        8mlX95nZG0uzG/9raB2ecXMBGg==
X-Google-Smtp-Source: ABdhPJxmLOKDbXxWMI0YoJdQfdZgk6XHAKS3TkXBLEezFKBn9UGmtIW842jk7ARXlak9j8uix2/hmg==
X-Received: by 2002:ac8:545a:: with SMTP id d26mr14359060qtq.124.1602256541398;
        Fri, 09 Oct 2020 08:15:41 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net. [156.34.48.30])
        by smtp.gmail.com with ESMTPSA id s123sm6228708qkd.128.2020.10.09.08.15.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2020 08:15:40 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94)
        (envelope-from <jgg@ziepe.ca>)
        id 1kQu7Q-0020Yl-8k; Fri, 09 Oct 2020 12:15:40 -0300
Date:   Fri, 9 Oct 2020 12:15:40 -0300
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Christian =?utf-8?B?S8O2bmln?= <ckoenig.leichtzumerken@gmail.com>
Cc:     linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, chris@chris-wilson.co.uk,
        airlied@redhat.com, akpm@linux-foundation.org, daniel@ffwll.ch,
        sumit.semwal@linaro.org, willy@infradead.org, jhubbard@nvidia.com
Subject: Re: [PATCH 1/6] mm: mmap: fix fput in error path
Message-ID: <20201009151540.GX5177@ziepe.ca>
References: <20201009150342.1979-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201009150342.1979-1-christian.koenig@amd.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Oct 09, 2020 at 05:03:37PM +0200, Christian König wrote:
> Patch "495c10cc1c0c CHROMIUM: dma-buf: restore args..."
> adds a workaround for a bug in mmap_region.
> 
> As the comment states ->mmap() callback can change
> vma->vm_file and so we might call fput() on the wrong file.
> 
> Revert the workaround and proper fix this in mmap_region.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
>  drivers/dma-buf/dma-buf.c | 22 +++++-----------------
>  mm/mmap.c                 |  2 +-
>  2 files changed, 6 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index a6ba4d598f0e..edd57402a48a 100644
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -1143,9 +1143,6 @@ EXPORT_SYMBOL_GPL(dma_buf_end_cpu_access);
>  int dma_buf_mmap(struct dma_buf *dmabuf, struct vm_area_struct *vma,
>  		 unsigned long pgoff)
>  {
> -	struct file *oldfile;
> -	int ret;
> -
>  	if (WARN_ON(!dmabuf || !vma))
>  		return -EINVAL;
>  
> @@ -1163,22 +1160,13 @@ int dma_buf_mmap(struct dma_buf *dmabuf, struct vm_area_struct *vma,
>  		return -EINVAL;
>  
>  	/* readjust the vma */
> -	get_file(dmabuf->file);
> -	oldfile = vma->vm_file;
> -	vma->vm_file = dmabuf->file;
> -	vma->vm_pgoff = pgoff;
> +	if (vma->vm_file)
> +		fput(vma->vm_file);

This if is redundant too

But otherwise

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Thanks,
Jason
