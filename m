Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7AE526415A
	for <lists+linux-media@lfdr.de>; Thu, 10 Sep 2020 11:18:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730116AbgIJJSJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Sep 2020 05:18:09 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:43375 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730255AbgIJJRr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Sep 2020 05:17:47 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id GIi0kYt1SPTBMGIi1kQaZv; Thu, 10 Sep 2020 11:17:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1599729464; bh=SOB+0wexHska1Ivgxq6US3wAQZn9sVTIazfeIH88yQ0=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=nxL6ixWoWEXEiGQapeNSq7XtIn4mWLlyNNtzPUmmqSYGrKJJS0YIgPyIqa792QHnw
         XdBL9VWo9A4Us3G7+ZDYRMmbT2KwgtQGM69loIGxJWEwXMFvZ1SuE/dN6XeLPERSqB
         3Ok/dq1tb7uPjmRWzTEPo1WZR/y7nHxU4ketZpjOtFFyqyhnCCkgHxqf9MvjoVPh9S
         QVBx59SDczngil2/NopypYqzD9lLTuQKNRzEGUQKKRCaTV3Uzgi9YSMtIj6eHMDSzD
         wr7r+CY6Xj7xx3TDMyC+HGsMp2AGGaRXh3W1GsJqRe4e7FKaU7vaQiUhGjTR7Wit8W
         v9M36n3FB0Flg==
Subject: Re: [PATCH v10 30/30] videobuf2: use sgtable-based scatterlist
 wrappers
To:     Marek Szyprowski <m.szyprowski@samsung.com>,
        dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
        linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Cc:     Christoph Hellwig <hch@lst.de>,
        Robin Murphy <robin.murphy@arm.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        linux-arm-kernel@lists.infradead.org,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Tomasz Figa <tfiga@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
References: <20200904131711.12950-1-m.szyprowski@samsung.com>
 <CGME20200904133512eucas1p204efa4e252ceb5fb50715239705f9965@eucas1p2.samsung.com>
 <20200904131711.12950-31-m.szyprowski@samsung.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <e1070a0d-2772-b5e2-7067-9f53ade19aae@xs4all.nl>
Date:   Thu, 10 Sep 2020 11:17:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200904131711.12950-31-m.szyprowski@samsung.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfOyym1s3hFy/wAnDsU5HmkCZJYyTj0QxaN6e/uK7k12aGGra4yqVYNAI11oZgPFnkurAxOfrqhRtT3UeKSK+3Y6xUMlkjhbpk5SqXaBWLGvAC8bcL20U
 SQl3FQ6ug7sKPMxbQ9nPZ9abpjMmfbsdeKC4HHQE2YYcaNMQ7qict2h/6JShk+yTvN4XM0ZES+Lyb1vnILB077gRCSygCrFB5sCcwJNVbP4AdxQa3VpctLPs
 WcOQXh/YE2Xw/tNcQ2Ny2bGrLZq++NZwUbCvGVe8FPIvQ7C/7Pc2p+A0wWGkoSUZNDbW92sPKFyYIGBxsCVG0S9K548oSNYUYgniCx159VuyK0gVspmpTJ8e
 ZzjeqWfrVDuNrKdeM8Nne0gfhl7mX0+5Ep8CvtWuusUWROjdbImIgoaeuN0i813xBDrU5iobK+2ZL9DhtnwI+ZWGC5qwHiRTBnMgeH7WGjIrUcenbPsQW+Cl
 eCBIEzwASMN9RMaEEwbzJcaZcrLcXPUzNUBrFUdeN3e/GwGG9vWNlGWRvREsKFAuTJkc2/zA1b1zVFwohmjpejqRVae1H7XgwmNR9MKKwe76cNRdWr1d5Bu5
 40cz/MOmAYDbV1eddNggEFio1GVwEJwmIBafyh/8UhvK4c/57KpZ0H9DnTdBFNB9ec1H8PypAO7yjhsVDzKvcSBCKBD3ot0N/yuc4hJ9uQUr6D6MEY/WIVfb
 Po0zpkjQXuKHrpA+HijgkLX/elJC8p10Gfa2xlVh5MprizQIMePbnw==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 04/09/2020 15:17, Marek Szyprowski wrote:
> Use recently introduced common wrappers operating directly on the struct
> sg_table objects and scatterlist page iterators to make the code a bit
> more compact, robust, easier to follow and copy/paste safe.
> 
> No functional change, because the code already properly did all the
> scatterlist related calls.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Reviewed-by: Robin Murphy <robin.murphy@arm.com>

Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Note that I agree with Marek to keep returning -EIO. If we want to propagate
low-level errors, then that should be done in a separate patch. But I think EIO
is fine.

Regards,

	Hans

> ---
>  .../common/videobuf2/videobuf2-dma-contig.c   | 34 ++++++++-----------
>  .../media/common/videobuf2/videobuf2-dma-sg.c | 32 +++++++----------
>  .../common/videobuf2/videobuf2-vmalloc.c      | 12 +++----
>  3 files changed, 31 insertions(+), 47 deletions(-)
> 
> diff --git a/drivers/media/common/videobuf2/videobuf2-dma-contig.c b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> index ec3446cc45b8..1b242d844dde 100644
> --- a/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> +++ b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> @@ -58,10 +58,10 @@ static unsigned long vb2_dc_get_contiguous_size(struct sg_table *sgt)
>  	unsigned int i;
>  	unsigned long size = 0;
>  
> -	for_each_sg(sgt->sgl, s, sgt->nents, i) {
> +	for_each_sgtable_dma_sg(sgt, s, i) {
>  		if (sg_dma_address(s) != expected)
>  			break;
> -		expected = sg_dma_address(s) + sg_dma_len(s);
> +		expected += sg_dma_len(s);
>  		size += sg_dma_len(s);
>  	}
>  	return size;
> @@ -103,8 +103,7 @@ static void vb2_dc_prepare(void *buf_priv)
>  	if (!sgt)
>  		return;
>  
> -	dma_sync_sg_for_device(buf->dev, sgt->sgl, sgt->orig_nents,
> -			       buf->dma_dir);
> +	dma_sync_sgtable_for_device(buf->dev, sgt, buf->dma_dir);
>  }
>  
>  static void vb2_dc_finish(void *buf_priv)
> @@ -115,7 +114,7 @@ static void vb2_dc_finish(void *buf_priv)
>  	if (!sgt)
>  		return;
>  
> -	dma_sync_sg_for_cpu(buf->dev, sgt->sgl, sgt->orig_nents, buf->dma_dir);
> +	dma_sync_sgtable_for_cpu(buf->dev, sgt, buf->dma_dir);
>  }
>  
>  /*********************************************/
> @@ -275,8 +274,8 @@ static void vb2_dc_dmabuf_ops_detach(struct dma_buf *dbuf,
>  		 * memory locations do not require any explicit cache
>  		 * maintenance prior or after being used by the device.
>  		 */
> -		dma_unmap_sg_attrs(db_attach->dev, sgt->sgl, sgt->orig_nents,
> -				   attach->dma_dir, DMA_ATTR_SKIP_CPU_SYNC);
> +		dma_unmap_sgtable(db_attach->dev, sgt, attach->dma_dir,
> +				  DMA_ATTR_SKIP_CPU_SYNC);
>  	sg_free_table(sgt);
>  	kfree(attach);
>  	db_attach->priv = NULL;
> @@ -301,8 +300,8 @@ static struct sg_table *vb2_dc_dmabuf_ops_map(
>  
>  	/* release any previous cache */
>  	if (attach->dma_dir != DMA_NONE) {
> -		dma_unmap_sg_attrs(db_attach->dev, sgt->sgl, sgt->orig_nents,
> -				   attach->dma_dir, DMA_ATTR_SKIP_CPU_SYNC);
> +		dma_unmap_sgtable(db_attach->dev, sgt, attach->dma_dir,
> +				  DMA_ATTR_SKIP_CPU_SYNC);
>  		attach->dma_dir = DMA_NONE;
>  	}
>  
> @@ -310,9 +309,8 @@ static struct sg_table *vb2_dc_dmabuf_ops_map(
>  	 * mapping to the client with new direction, no cache sync
>  	 * required see comment in vb2_dc_dmabuf_ops_detach()
>  	 */
> -	sgt->nents = dma_map_sg_attrs(db_attach->dev, sgt->sgl, sgt->orig_nents,
> -				      dma_dir, DMA_ATTR_SKIP_CPU_SYNC);
> -	if (!sgt->nents) {
> +	if (dma_map_sgtable(db_attach->dev, sgt, dma_dir,
> +			    DMA_ATTR_SKIP_CPU_SYNC)) {
>  		pr_err("failed to map scatterlist\n");
>  		mutex_unlock(lock);
>  		return ERR_PTR(-EIO);
> @@ -455,8 +453,8 @@ static void vb2_dc_put_userptr(void *buf_priv)
>  		 * No need to sync to CPU, it's already synced to the CPU
>  		 * since the finish() memop will have been called before this.
>  		 */
> -		dma_unmap_sg_attrs(buf->dev, sgt->sgl, sgt->orig_nents,
> -				   buf->dma_dir, DMA_ATTR_SKIP_CPU_SYNC);
> +		dma_unmap_sgtable(buf->dev, sgt, buf->dma_dir,
> +				  DMA_ATTR_SKIP_CPU_SYNC);
>  		pages = frame_vector_pages(buf->vec);
>  		/* sgt should exist only if vector contains pages... */
>  		BUG_ON(IS_ERR(pages));
> @@ -553,9 +551,8 @@ static void *vb2_dc_get_userptr(struct device *dev, unsigned long vaddr,
>  	 * No need to sync to the device, this will happen later when the
>  	 * prepare() memop is called.
>  	 */
> -	sgt->nents = dma_map_sg_attrs(buf->dev, sgt->sgl, sgt->orig_nents,
> -				      buf->dma_dir, DMA_ATTR_SKIP_CPU_SYNC);
> -	if (sgt->nents <= 0) {
> +	if (dma_map_sgtable(buf->dev, sgt, buf->dma_dir,
> +			    DMA_ATTR_SKIP_CPU_SYNC)) {
>  		pr_err("failed to map scatterlist\n");
>  		ret = -EIO;
>  		goto fail_sgt_init;
> @@ -577,8 +574,7 @@ static void *vb2_dc_get_userptr(struct device *dev, unsigned long vaddr,
>  	return buf;
>  
>  fail_map_sg:
> -	dma_unmap_sg_attrs(buf->dev, sgt->sgl, sgt->orig_nents,
> -			   buf->dma_dir, DMA_ATTR_SKIP_CPU_SYNC);
> +	dma_unmap_sgtable(buf->dev, sgt, buf->dma_dir, DMA_ATTR_SKIP_CPU_SYNC);
>  
>  fail_sgt_init:
>  	sg_free_table(sgt);
> diff --git a/drivers/media/common/videobuf2/videobuf2-dma-sg.c b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> index 0a40e00f0d7e..0dd3b19025e0 100644
> --- a/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> +++ b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> @@ -148,9 +148,8 @@ static void *vb2_dma_sg_alloc(struct device *dev, unsigned long dma_attrs,
>  	 * No need to sync to the device, this will happen later when the
>  	 * prepare() memop is called.
>  	 */
> -	sgt->nents = dma_map_sg_attrs(buf->dev, sgt->sgl, sgt->orig_nents,
> -				      buf->dma_dir, DMA_ATTR_SKIP_CPU_SYNC);
> -	if (!sgt->nents)
> +	if (dma_map_sgtable(buf->dev, sgt, buf->dma_dir,
> +			    DMA_ATTR_SKIP_CPU_SYNC))
>  		goto fail_map;
>  
>  	buf->handler.refcount = &buf->refcount;
> @@ -186,8 +185,8 @@ static void vb2_dma_sg_put(void *buf_priv)
>  	if (refcount_dec_and_test(&buf->refcount)) {
>  		dprintk(1, "%s: Freeing buffer of %d pages\n", __func__,
>  			buf->num_pages);
> -		dma_unmap_sg_attrs(buf->dev, sgt->sgl, sgt->orig_nents,
> -				   buf->dma_dir, DMA_ATTR_SKIP_CPU_SYNC);
> +		dma_unmap_sgtable(buf->dev, sgt, buf->dma_dir,
> +				  DMA_ATTR_SKIP_CPU_SYNC);
>  		if (buf->vaddr)
>  			vm_unmap_ram(buf->vaddr, buf->num_pages);
>  		sg_free_table(buf->dma_sgt);
> @@ -204,8 +203,7 @@ static void vb2_dma_sg_prepare(void *buf_priv)
>  	struct vb2_dma_sg_buf *buf = buf_priv;
>  	struct sg_table *sgt = buf->dma_sgt;
>  
> -	dma_sync_sg_for_device(buf->dev, sgt->sgl, sgt->orig_nents,
> -			       buf->dma_dir);
> +	dma_sync_sgtable_for_device(buf->dev, sgt, buf->dma_dir);
>  }
>  
>  static void vb2_dma_sg_finish(void *buf_priv)
> @@ -213,7 +211,7 @@ static void vb2_dma_sg_finish(void *buf_priv)
>  	struct vb2_dma_sg_buf *buf = buf_priv;
>  	struct sg_table *sgt = buf->dma_sgt;
>  
> -	dma_sync_sg_for_cpu(buf->dev, sgt->sgl, sgt->orig_nents, buf->dma_dir);
> +	dma_sync_sgtable_for_cpu(buf->dev, sgt, buf->dma_dir);
>  }
>  
>  static void *vb2_dma_sg_get_userptr(struct device *dev, unsigned long vaddr,
> @@ -256,9 +254,8 @@ static void *vb2_dma_sg_get_userptr(struct device *dev, unsigned long vaddr,
>  	 * No need to sync to the device, this will happen later when the
>  	 * prepare() memop is called.
>  	 */
> -	sgt->nents = dma_map_sg_attrs(buf->dev, sgt->sgl, sgt->orig_nents,
> -				      buf->dma_dir, DMA_ATTR_SKIP_CPU_SYNC);
> -	if (!sgt->nents)
> +	if (dma_map_sgtable(buf->dev, sgt, buf->dma_dir,
> +			    DMA_ATTR_SKIP_CPU_SYNC))
>  		goto userptr_fail_map;
>  
>  	return buf;
> @@ -284,8 +281,7 @@ static void vb2_dma_sg_put_userptr(void *buf_priv)
>  
>  	dprintk(1, "%s: Releasing userspace buffer of %d pages\n",
>  	       __func__, buf->num_pages);
> -	dma_unmap_sg_attrs(buf->dev, sgt->sgl, sgt->orig_nents, buf->dma_dir,
> -			   DMA_ATTR_SKIP_CPU_SYNC);
> +	dma_unmap_sgtable(buf->dev, sgt, buf->dma_dir, DMA_ATTR_SKIP_CPU_SYNC);
>  	if (buf->vaddr)
>  		vm_unmap_ram(buf->vaddr, buf->num_pages);
>  	sg_free_table(buf->dma_sgt);
> @@ -408,8 +404,7 @@ static void vb2_dma_sg_dmabuf_ops_detach(struct dma_buf *dbuf,
>  
>  	/* release the scatterlist cache */
>  	if (attach->dma_dir != DMA_NONE)
> -		dma_unmap_sg(db_attach->dev, sgt->sgl, sgt->orig_nents,
> -			attach->dma_dir);
> +		dma_unmap_sgtable(db_attach->dev, sgt, attach->dma_dir, 0);
>  	sg_free_table(sgt);
>  	kfree(attach);
>  	db_attach->priv = NULL;
> @@ -434,15 +429,12 @@ static struct sg_table *vb2_dma_sg_dmabuf_ops_map(
>  
>  	/* release any previous cache */
>  	if (attach->dma_dir != DMA_NONE) {
> -		dma_unmap_sg(db_attach->dev, sgt->sgl, sgt->orig_nents,
> -			attach->dma_dir);
> +		dma_unmap_sgtable(db_attach->dev, sgt, attach->dma_dir, 0);
>  		attach->dma_dir = DMA_NONE;
>  	}
>  
>  	/* mapping to the client with new direction */
> -	sgt->nents = dma_map_sg(db_attach->dev, sgt->sgl, sgt->orig_nents,
> -				dma_dir);
> -	if (!sgt->nents) {
> +	if (dma_map_sgtable(db_attach->dev, sgt, dma_dir, 0)) {
>  		pr_err("failed to map scatterlist\n");
>  		mutex_unlock(lock);
>  		return ERR_PTR(-EIO);
> diff --git a/drivers/media/common/videobuf2/videobuf2-vmalloc.c b/drivers/media/common/videobuf2/videobuf2-vmalloc.c
> index c66fda4a65e4..bf5ac63a5742 100644
> --- a/drivers/media/common/videobuf2/videobuf2-vmalloc.c
> +++ b/drivers/media/common/videobuf2/videobuf2-vmalloc.c
> @@ -229,7 +229,7 @@ static int vb2_vmalloc_dmabuf_ops_attach(struct dma_buf *dbuf,
>  		kfree(attach);
>  		return ret;
>  	}
> -	for_each_sg(sgt->sgl, sg, sgt->nents, i) {
> +	for_each_sgtable_sg(sgt, sg, i) {
>  		struct page *page = vmalloc_to_page(vaddr);
>  
>  		if (!page) {
> @@ -259,8 +259,7 @@ static void vb2_vmalloc_dmabuf_ops_detach(struct dma_buf *dbuf,
>  
>  	/* release the scatterlist cache */
>  	if (attach->dma_dir != DMA_NONE)
> -		dma_unmap_sg(db_attach->dev, sgt->sgl, sgt->orig_nents,
> -			attach->dma_dir);
> +		dma_unmap_sgtable(db_attach->dev, sgt, attach->dma_dir, 0);
>  	sg_free_table(sgt);
>  	kfree(attach);
>  	db_attach->priv = NULL;
> @@ -285,15 +284,12 @@ static struct sg_table *vb2_vmalloc_dmabuf_ops_map(
>  
>  	/* release any previous cache */
>  	if (attach->dma_dir != DMA_NONE) {
> -		dma_unmap_sg(db_attach->dev, sgt->sgl, sgt->orig_nents,
> -			attach->dma_dir);
> +		dma_unmap_sgtable(db_attach->dev, sgt, attach->dma_dir, 0);
>  		attach->dma_dir = DMA_NONE;
>  	}
>  
>  	/* mapping to the client with new direction */
> -	sgt->nents = dma_map_sg(db_attach->dev, sgt->sgl, sgt->orig_nents,
> -				dma_dir);
> -	if (!sgt->nents) {
> +	if (dma_map_sgtable(db_attach->dev, sgt, dma_dir, 0)) {
>  		pr_err("failed to map scatterlist\n");
>  		mutex_unlock(lock);
>  		return ERR_PTR(-EIO);
> 

