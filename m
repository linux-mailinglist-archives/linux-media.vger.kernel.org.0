Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44D4F2C95D8
	for <lists+linux-media@lfdr.de>; Tue,  1 Dec 2020 04:39:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727750AbgLADhm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Nov 2020 22:37:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727719AbgLADhl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Nov 2020 22:37:41 -0500
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BD22C0613D2;
        Mon, 30 Nov 2020 19:37:01 -0800 (PST)
Received: by mail-pj1-x1041.google.com with SMTP id t21so383244pjw.2;
        Mon, 30 Nov 2020 19:37:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=NL582lgLVSi6KvAu9Utf9CebPYU3CkLIdkP46F4/+EA=;
        b=Xhga9YlKz842XlE+bb+SVEwobT1WQdwHoo7D7fOlF20D0+a3pLa7mD7wAMBsoNZD92
         uuQtPfpMZeW+IlOssf8/rWOw+QKg4PspN2T5/kdsgqzAFOZ/HTDb+IXKvmETtlQE+uV2
         lXobZ7ntNQW3D5X2jcCxlPBk3A7ivPUpAfZpczlDxl01oriyRBobJvB++T+NdzzoDFX7
         veXQz8MvK4l4UMZubI5hihJlJiCZ99c5RCXeBsHjgSAWU3w/C3tTOv0G4Nrm+05jAcQ5
         apm/NsHGqk7+d0Nsg27zQ1AjqTIesG3qtSe40lJruY1ZgMRjOr4KyeRX3RaEahrQ9fce
         rjmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=NL582lgLVSi6KvAu9Utf9CebPYU3CkLIdkP46F4/+EA=;
        b=jIjVGBf3PYgnL6Hg0bMlYUoZjhA8f2CuXIs0bw21VEJu7w1+evPnaD8xlXu+i09Jvn
         gLSTlHBrmyyExNvAW6Z4SB82l/kQP5oCDD/N6onoIlRxqoPYbcSJO1MMsPKhjDYUyODD
         FQ5wrEO4nPzT355inm/1rlJQ3ot+iHNH6solpppkBWSP82nsHkK7v14QYhIG5SEeUGao
         QpxPjgQRP1sIfHZbV4PWQijLqEpjw6Wvx5H4pIbuEJt2SgQYY0NCPVM2Ciln7enSMBCk
         8u6ALTiyuX5wFKru6xzSVOAvvKgytq8LVVU5MjBXkLfg0vXBb6UecGd6QWOYB0IzLoAl
         pjcw==
X-Gm-Message-State: AOAM533UJtQeOe8lev3DiApp2tmdygD2M1naXIzRDlwZQhdA8cKhDeEB
        S0S/3HYxY4caN569L88+FSk=
X-Google-Smtp-Source: ABdhPJzmYqh8DitkJm6pCCwff8gLw1CZT70pu7CE5gBkghmKUNChEaqVJDkSnRtWr2lmiD9MQutdvA==
X-Received: by 2002:a17:90a:c003:: with SMTP id p3mr600818pjt.221.1606793820977;
        Mon, 30 Nov 2020 19:37:00 -0800 (PST)
Received: from localhost ([2401:fa00:8f:203:a6ae:11ff:fe11:4b46])
        by smtp.gmail.com with ESMTPSA id w131sm489881pfd.14.2020.11.30.19.36.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Nov 2020 19:37:00 -0800 (PST)
Date:   Tue, 1 Dec 2020 12:36:58 +0900
From:   Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
To:     Christoph Hellwig <hch@lst.de>
Cc:     Ricardo Ribalda <ribalda@chromium.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
        Joerg Roedel <joro@8bytes.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Sergey Senozhatsky <senozhatsky@google.com>
Subject: Re: [PATCH v3 5/6] media: uvcvideo: Use dma_alloc_noncontiguos API
Message-ID: <20201201033658.GE3723071@google.com>
References: <20201125221917.150463-1-ribalda@chromium.org>
 <20201130083410.GD32234@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201130083410.GD32234@lst.de>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On (20/11/30 09:34), Christoph Hellwig wrote:
> 
> > +	uvc_urb->pages = dma_alloc_noncontiguous(dma_dev, stream->urb_size,
> > +						 &uvc_urb->dma,
> > +						 gfp_flags | __GFP_NOWARN, 0);
> > +	if (!uvc_urb->pages)
> > +		return false;
> > +
> > +	uvc_urb->buffer = vmap(uvc_urb->pages,
> > +			       PAGE_ALIGN(stream->urb_size) >> PAGE_SHIFT,
> > +			       VM_DMA_COHERENT, PAGE_KERNEL);
> > +	if (!uvc_urb->buffer) {
> > +		dma_free_noncontiguous(dma_dev, stream->urb_size,
> > +				       uvc_urb->pages, uvc_urb->dma);
> > +		return false;
> > +	}
> > +
> > +	if (sg_alloc_table_from_pages(&uvc_urb->sgt, uvc_urb->pages,
> > +				PAGE_ALIGN(stream->urb_size) >> PAGE_SHIFT, 0,
> > +				stream->urb_size, GFP_KERNEL)) {
> > +		vunmap(uvc_urb->buffer);
> > +		dma_free_noncontiguous(dma_dev, stream->urb_size,
> > +				       uvc_urb->pages, uvc_urb->dma);
> > +		return false;
> > +	}
> 
> I wonder if we should lift this into a helper.  On the one hand I had
> proliferating struct scatterlist usage, on the other hand it is all over
> the media and drm code anyway, and duplicating this doesn't help anyone.

Not that I have any sound experience in this area, but the helper
probably won't hurt. Do you also plan to add vmap() to that helper
or dma_alloc_noncontiguous()/sg_alloc_table_from_pages() only?

	helper()
	{
		dma_alloc_noncontiguous();
		sg_alloc_table_from_pages();

		if ((dma_attrs & DMA_ATTR_NO_KERNEL_MAPPING) == 0)
			vmap();
	}

videobuf2-dma-contig still has to carry around two versions: one that
deals with the noncontig pages and sgt (new API); and the current one.
But if the helper will include fallback to coherent allocations then
this may change, depending on the helper implementation.

	-ss
