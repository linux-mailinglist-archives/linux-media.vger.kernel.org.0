Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5083A29516
	for <lists+linux-media@lfdr.de>; Fri, 24 May 2019 11:48:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390184AbfEXJrx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 May 2019 05:47:53 -0400
Received: from retiisi.org.uk ([95.216.213.190]:49866 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2389841AbfEXJrx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 May 2019 05:47:53 -0400
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id 82CB3634C7B;
        Fri, 24 May 2019 12:47:22 +0300 (EEST)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.89)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1hU6nK-00018F-C3; Fri, 24 May 2019 12:47:22 +0300
Date:   Fri, 24 May 2019 12:47:22 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     "Andrew F. Davis" <afd@ti.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] [media] videobuf-dma-contig: Use size of buffer in mmap
 not vma size
Message-ID: <20190524094722.sjzk6hwfgjigxix6@valkosipuli.retiisi.org.uk>
References: <20190329173427.18238-1-afd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190329173427.18238-1-afd@ti.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Mar 29, 2019 at 12:34:27PM -0500, Andrew F. Davis wrote:
> The size of the vma can be larger than the size of the backing buffer.
> Use the buffer size over vma size to prevent exposing extra memory
> to userspace.
> 
> Signed-off-by: Andrew F. Davis <afd@ti.com>

Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>

> ---
>  drivers/media/v4l2-core/videobuf-dma-contig.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/videobuf-dma-contig.c b/drivers/media/v4l2-core/videobuf-dma-contig.c
> index e1bf50df4c70..65e2655d22b7 100644
> --- a/drivers/media/v4l2-core/videobuf-dma-contig.c
> +++ b/drivers/media/v4l2-core/videobuf-dma-contig.c
> @@ -280,7 +280,6 @@ static int __videobuf_mmap_mapper(struct videobuf_queue *q,
>  	struct videobuf_dma_contig_memory *mem;
>  	struct videobuf_mapping *map;
>  	int retval;
> -	unsigned long size;
>  
>  	dev_dbg(q->dev, "%s\n", __func__);
>  
> @@ -303,7 +302,6 @@ static int __videobuf_mmap_mapper(struct videobuf_queue *q,
>  		goto error;
>  
>  	/* Try to remap memory */
> -	size = vma->vm_end - vma->vm_start;
>  	vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);
>  
>  	/* the "vm_pgoff" is just used in v4l2 to find the
> @@ -314,7 +312,7 @@ static int __videobuf_mmap_mapper(struct videobuf_queue *q,
>  	 */
>  	vma->vm_pgoff = 0;
>  
> -	retval = vm_iomap_memory(vma, mem->dma_handle, size);
> +	retval = vm_iomap_memory(vma, mem->dma_handle, mem->size);
>  	if (retval) {
>  		dev_err(q->dev, "mmap: remap failed with error %d. ",
>  			retval);
> -- 
> 2.21.0
> 

-- 
Sakari Ailus
