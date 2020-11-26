Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 821832C5337
	for <lists+linux-media@lfdr.de>; Thu, 26 Nov 2020 12:46:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732141AbgKZLoz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Nov 2020 06:44:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731379AbgKZLoz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Nov 2020 06:44:55 -0500
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6415C0613D4;
        Thu, 26 Nov 2020 03:44:53 -0800 (PST)
Received: by mail-pg1-x542.google.com with SMTP id 62so1519150pgg.12;
        Thu, 26 Nov 2020 03:44:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=UpERwUmn/OuG9/9GiqizbXJDLzVxL1S8PfGCKpa9aUg=;
        b=nYGL5wwMzInwZKf69/TnCeMo02Cht0pAdcQoAUSgCVe5YzuaNqWcOj9BMSrJG11J2f
         KNcl4S4BCDyYQZ9xw4Y7s1+6wFphhly5hk8wMuIGqUaPzSzSN98tnParN/VVKeaQNJV1
         KhMm0oyRhW/8xPEbWsyFARG/ib75aDcW85H82wQyIIf/H75HSWxzBXzqqRPWQh1WqZcX
         iPdAS4W+W92oDObcecbFDg5zHufOPtH8/afpKxrogGEW3TTkAY+fxXaJ14gouOOTshdj
         lDZUplgZzM2IrqxRyA5OetWAyeNjvrdA+uf3NtbZL7nOSM1+RgxdRJ0hsNWi3qqnzHJX
         thgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=UpERwUmn/OuG9/9GiqizbXJDLzVxL1S8PfGCKpa9aUg=;
        b=dIdT955rtQoAL64otwwvv/PreNSIo+OCTRiwTTrYytKCmhEVYIFmPBgpKa4li1opUF
         ENuYDpabXwU+CpJa8j76AojDhJihANjgeZVceyLteDSn0A2OL3jeBR71i+/GCysTpJdv
         cSIildg/MwpxP0/bdaWNzzrsLj7IptP8YXYX/WljIOyVkx3AssVFjR32d5yQ69anLzLS
         eQw888ZHd2jjwj1SEGkOk9Pz7njeNkgtrZ6haP9uafdwO2CiP/4xmEwgMN6Mhun0afNe
         Ubu9t6HEbdhVMDZ7SLEgyrUHddEAezYLcUyHFGyOAz34F7jVbQ+IqGgFhG+hMujl6efv
         1brw==
X-Gm-Message-State: AOAM531MqtQJ9BV8njN2OMrBbAWzewjpObongyYwvcOxlxWVK4gK5mud
        HQpfd9ISnT81YQGx5JeLaBk=
X-Google-Smtp-Source: ABdhPJw/1d59DXda0KuVqjExWVYT3bxoXf2mR5gIjPc+28YwR+iFHQlRFLWrBosK+geb9FM5JmT/vA==
X-Received: by 2002:a63:62c6:: with SMTP id w189mr2343708pgb.440.1606391093464;
        Thu, 26 Nov 2020 03:44:53 -0800 (PST)
Received: from localhost ([2401:fa00:8f:203:a6ae:11ff:fe11:4b46])
        by smtp.gmail.com with ESMTPSA id d15sm6575313pjr.27.2020.11.26.03.44.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2020 03:44:52 -0800 (PST)
Date:   Thu, 26 Nov 2020 20:44:50 +0900
From:   Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Christoph Hellwig <hch@lst.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
        Joerg Roedel <joro@8bytes.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Sergey Senozhatsky <senozhatsky@google.com>
Subject: Re: [PATCH v3 5/6] media: uvcvideo: Use dma_alloc_noncontiguos API
Message-ID: <20201126114450.GB3723071@google.com>
References: <20201125221917.150463-1-ribalda@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201125221917.150463-1-ribalda@chromium.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On (20/11/25 23:19), Ricardo Ribalda wrote:
[..]
> +	if (uvc_urb->pages)
> +		dma_sync_sgtable_for_device(stream_to_dmadev(uvc_urb->stream),
> +					    &uvc_urb->sgt, DMA_FROM_DEVICE);

[..]

> +	if (uvc_urb->pages)
> +		dma_sync_sgtable_for_cpu(stream_to_dmadev(stream),
> +					 &uvc_urb->sgt, DMA_FROM_DEVICE);

[..]

> +	uvc_urb->pages = dma_alloc_noncontiguous(dma_dev, stream->urb_size,
> +						 &uvc_urb->dma,
> +						 gfp_flags | __GFP_NOWARN, 0);

Do we need to pass __GFP_NOWARN? It seems that

dma_alloc_noncontiguous()
  __iommu_dma_alloc_noncontiguous()
    __iommu_dma_alloc_pages()

does this internally.

> +	if (!uvc_urb->pages)
> +		return false;
> +
> +	uvc_urb->buffer = vmap(uvc_urb->pages,
> +			       PAGE_ALIGN(stream->urb_size) >> PAGE_SHIFT,
> +			       VM_DMA_COHERENT, PAGE_KERNEL);

This is not related to Ricardo's patch, just a side note:

  I think VM_DMA_COHERENT needs to be renamed. I found it a bit confusing
  to see DMA_COHERENT mapping being dma_sync-ed. It turned out that the
  flag has different meaning.

	-ss
