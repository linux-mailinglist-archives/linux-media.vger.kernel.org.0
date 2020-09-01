Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CD25259FE1
	for <lists+linux-media@lfdr.de>; Tue,  1 Sep 2020 22:19:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728951AbgIAUTL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Sep 2020 16:19:11 -0400
Received: from foss.arm.com ([217.140.110.172]:49694 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728889AbgIAUTJ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 1 Sep 2020 16:19:09 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7111C1063;
        Tue,  1 Sep 2020 13:19:07 -0700 (PDT)
Received: from [10.57.40.122] (unknown [10.57.40.122])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0A55E3F66F;
        Tue,  1 Sep 2020 13:19:04 -0700 (PDT)
Subject: Re: [PATCH v9 32/32] videobuf2: use sgtable-based scatterlist
 wrappers
To:     Marek Szyprowski <m.szyprowski@samsung.com>,
        dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
        linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Cc:     Christoph Hellwig <hch@lst.de>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        linux-arm-kernel@lists.infradead.org,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Pawel Osciak <pawel@osciak.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
References: <20200826063316.23486-1-m.szyprowski@samsung.com>
 <CGME20200826063629eucas1p194665c749b5a37c74e6445370fd7f7c4@eucas1p1.samsung.com>
 <20200826063316.23486-33-m.szyprowski@samsung.com>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <02d07186-d97d-2309-9d9d-2f697112e7e0@arm.com>
Date:   Tue, 1 Sep 2020 21:19:03 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200826063316.23486-33-m.szyprowski@samsung.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 2020-08-26 07:33, Marek Szyprowski wrote:
> Use recently introduced common wrappers operating directly on the struct
> sg_table objects and scatterlist page iterators to make the code a bit
> more compact, robust, easier to follow and copy/paste safe.
> 
> No functional change, because the code already properly did all the
> scaterlist related calls.

^^ typo

Otherwise,

Reviewed-by: Robin Murphy <robin.murphy@arm.com>

> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>   .../common/videobuf2/videobuf2-dma-contig.c   | 34 ++++++++-----------
>   .../media/common/videobuf2/videobuf2-dma-sg.c | 32 +++++++----------
>   .../common/videobuf2/videobuf2-vmalloc.c      | 12 +++----
>   3 files changed, 31 insertions(+), 47 deletions(-)
> 
> diff --git a/drivers/media/common/videobuf2/videobuf2-dma-contig.c b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> index ec3446cc45b8..1b242d844dde 100644
> --- a/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> +++ b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> @@ -58,10 +58,10 @@ static unsigned long vb2_dc_get_contiguous_size(struct sg_table *sgt)
>   	unsigned int i;
>   	unsigned long size = 0;
>   
> -	for_each_sg(sgt->sgl, s, sgt->nents, i) {
> +	for_each_sgtable_dma_sg(sgt, s, i) {
>   		if (sg_dma_address(s) != expected)
>   			break;
> -		expected = sg_dma_address(s) + sg_dma_len(s);
> +		expected += sg_dma_len(s);
>   		size += sg_dma_len(s);
>   	}
>   	return size;
> @@ -103,8 +103,7 @@ static void vb2_dc_prepare(void *buf_priv)
>   	if (!sgt)
>   		return;
>   
> -	dma_sync_sg_for_device(buf->dev, sgt->sgl, sgt->orig_nents,
> -			       buf->dma_dir);
> +	dma_sync_sgtable_for_device(buf->dev, sgt, buf->dma_dir);
>   }
>   
>   static void vb2_dc_finish(void *buf_priv)
> @@ -115,7 +114,7 @@ static void vb2_dc_finish(void *buf_priv)
>   	if (!sgt)
>   		return;
>   
> -	dma_sync_sg_for_cpu(buf->dev, sgt->sgl, sgt->orig_nents, buf->dma_dir);
> +	dma_sync_sgtable_for_cpu(buf->dev, sgt, buf->dma_dir);
>   }
>   
>   /*********************************************/
> @@ -275,8 +274,8 @@ static void vb2_dc_dmabuf_ops_detach(struct dma_buf *dbuf,
>   		 * memory locations do not require any explicit cache
>   		 * maintenance prior or after being used by the device.
>   		 */
> -		dma_unmap_sg_attrs(db_attach->dev, sgt->sgl, sgt->orig_nents,
> -				   attach->dma_dir, DMA_ATTR_SKIP_CPU_SYNC);
> +		dma_unmap_sgtable(db_attach->dev, sgt, attach->dma_dir,
> +				  DMA_ATTR_SKIP_CPU_SYNC);
>   	sg_free_table(sgt);
>   	kfree(attach);
>   	db_attach->priv = NULL;
> @@ -301,8 +300,8 @@ static struct sg_table *vb2_dc_dmabuf_ops_map(
>   
>   	/* release any previous cache */
>   	if (attach->dma_dir != DMA_NONE) {
> -		dma_unmap_sg_attrs(db_attach->dev, sgt->sgl, sgt->orig_nents,
> -				   attach->dma_dir, DMA_ATTR_SKIP_CPU_SYNC);
> +		dma_unmap_sgtable(db_attach->dev, sgt, attach->dma_dir,
> +				  DMA_ATTR_SKIP_CPU_SYNC);
>   		attach->dma_dir = DMA_NONE;
>   	}
>   
> @@ -310,9 +309,8 @@ static struct sg_table *vb2_dc_dmabuf_ops_map(
>   	 * mapping to the client with new direction, no cache sync
>   	 * required see comment in vb2_dc_dmabuf_ops_detach()
>   	 */
> -	sgt->nents = dma_map_sg_attrs(db_attach->dev, sgt->sgl, sgt->orig_nents,
> -				      dma_dir, DMA_ATTR_SKIP_CPU_SYNC);
> -	if (!sgt->nents) {
> +	if (dma_map_sgtable(db_attach->dev, sgt, dma_dir,
> +			    DMA_ATTR_SKIP_CPU_SYNC)) {
>   		pr_err("failed to map scatterlist\n");
>   		mutex_unlock(lock);
>   		return ERR_PTR(-EIO);
> @@ -455,8 +453,8 @@ static void vb2_dc_put_userptr(void *buf_priv)
>   		 * No need to sync to CPU, it's already synced to the CPU
>   		 * since the finish() memop will have been called before this.
>   		 */
> -		dma_unmap_sg_attrs(buf->dev, sgt->sgl, sgt->orig_nents,
> -				   buf->dma_dir, DMA_ATTR_SKIP_CPU_SYNC);
> +		dma_unmap_sgtable(buf->dev, sgt, buf->dma_dir,
> +				  DMA_ATTR_SKIP_CPU_SYNC);
>   		pages = frame_vector_pages(buf->vec);
>   		/* sgt should exist only if vector contains pages... */
>   		BUG_ON(IS_ERR(pages));
> @@ -553,9 +551,8 @@ static void *vb2_dc_get_userptr(struct device *dev, unsigned long vaddr,
>   	 * No need to sync to the device, this will happen later when the
>   	 * prepare() memop is called.
>   	 */
> -	sgt->nents = dma_map_sg_attrs(buf->dev, sgt->sgl, sgt->orig_nents,
> -				      buf->dma_dir, DMA_ATTR_SKIP_CPU_SYNC);
> -	if (sgt->nents <= 0) {
> +	if (dma_map_sgtable(buf->dev, sgt, buf->dma_dir,
> +			    DMA_ATTR_SKIP_CPU_SYNC)) {
>   		pr_err("failed to map scatterlist\n");
>   		ret = -EIO;
>   		goto fail_sgt_init;
> @@ -577,8 +574,7 @@ static void *vb2_dc_get_userptr(struct device *dev, unsigned long vaddr,
>   	return buf;
>   
>   fail_map_sg:
> -	dma_unmap_sg_attrs(buf->dev, sgt->sgl, sgt->orig_nents,
> -			   buf->dma_dir, DMA_ATTR_SKIP_CPU_SYNC);
> +	dma_unmap_sgtable(buf->dev, sgt, buf->dma_dir, DMA_ATTR_SKIP_CPU_SYNC);
>   
>   fail_sgt_init:
>   	sg_free_table(sgt);
> diff --git a/drivers/media/common/videobuf2/videobuf2-dma-sg.c b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> index 0a40e00f0d7e..0dd3b19025e0 100644
> --- a/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> +++ b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> @@ -148,9 +148,8 @@ static void *vb2_dma_sg_alloc(struct device *dev, unsigned long dma_attrs,
>   	 * No need to sync to the device, this will happen later when the
>   	 * prepare() memop is called.
>   	 */
> -	sgt->nents = dma_map_sg_attrs(buf->dev, sgt->sgl, sgt->orig_nents,
> -				      buf->dma_dir, DMA_ATTR_SKIP_CPU_SYNC);
> -	if (!sgt->nents)
> +	if (dma_map_sgtable(buf->dev, sgt, buf->dma_dir,
> +			    DMA_ATTR_SKIP_CPU_SYNC))
>   		goto fail_map;
>   
>   	buf->handler.refcount = &buf->refcount;
> @@ -186,8 +185,8 @@ static void vb2_dma_sg_put(void *buf_priv)
>   	if (refcount_dec_and_test(&buf->refcount)) {
>   		dprintk(1, "%s: Freeing buffer of %d pages\n", __func__,
>   			buf->num_pages);
> -		dma_unmap_sg_attrs(buf->dev, sgt->sgl, sgt->orig_nents,
> -				   buf->dma_dir, DMA_ATTR_SKIP_CPU_SYNC);
> +		dma_unmap_sgtable(buf->dev, sgt, buf->dma_dir,
> +				  DMA_ATTR_SKIP_CPU_SYNC);
>   		if (buf->vaddr)
>   			vm_unmap_ram(buf->vaddr, buf->num_pages);
>   		sg_free_table(buf->dma_sgt);
> @@ -204,8 +203,7 @@ static void vb2_dma_sg_prepare(void *buf_priv)
>   	struct vb2_dma_sg_buf *buf = buf_priv;
>   	struct sg_table *sgt = buf->dma_sgt;
>   
> -	dma_sync_sg_for_device(buf->dev, sgt->sgl, sgt->orig_nents,
> -			       buf->dma_dir);
> +	dma_sync_sgtable_for_device(buf->dev, sgt, buf->dma_dir);
>   }
>   
>   static void vb2_dma_sg_finish(void *buf_priv)
> @@ -213,7 +211,7 @@ static void vb2_dma_sg_finish(void *buf_priv)
>   	struct vb2_dma_sg_buf *buf = buf_priv;
>   	struct sg_table *sgt = buf->dma_sgt;
>   
> -	dma_sync_sg_for_cpu(buf->dev, sgt->sgl, sgt->orig_nents, buf->dma_dir);
> +	dma_sync_sgtable_for_cpu(buf->dev, sgt, buf->dma_dir);
>   }
>   
>   static void *vb2_dma_sg_get_userptr(struct device *dev, unsigned long vaddr,
> @@ -256,9 +254,8 @@ static void *vb2_dma_sg_get_userptr(struct device *dev, unsigned long vaddr,
>   	 * No need to sync to the device, this will happen later when the
>   	 * prepare() memop is called.
>   	 */
> -	sgt->nents = dma_map_sg_attrs(buf->dev, sgt->sgl, sgt->orig_nents,
> -				      buf->dma_dir, DMA_ATTR_SKIP_CPU_SYNC);
> -	if (!sgt->nents)
> +	if (dma_map_sgtable(buf->dev, sgt, buf->dma_dir,
> +			    DMA_ATTR_SKIP_CPU_SYNC))
>   		goto userptr_fail_map;
>   
>   	return buf;
> @@ -284,8 +281,7 @@ static void vb2_dma_sg_put_userptr(void *buf_priv)
>   
>   	dprintk(1, "%s: Releasing userspace buffer of %d pages\n",
>   	       __func__, buf->num_pages);
> -	dma_unmap_sg_attrs(buf->dev, sgt->sgl, sgt->orig_nents, buf->dma_dir,
> -			   DMA_ATTR_SKIP_CPU_SYNC);
> +	dma_unmap_sgtable(buf->dev, sgt, buf->dma_dir, DMA_ATTR_SKIP_CPU_SYNC);
>   	if (buf->vaddr)
>   		vm_unmap_ram(buf->vaddr, buf->num_pages);
>   	sg_free_table(buf->dma_sgt);
> @@ -408,8 +404,7 @@ static void vb2_dma_sg_dmabuf_ops_detach(struct dma_buf *dbuf,
>   
>   	/* release the scatterlist cache */
>   	if (attach->dma_dir != DMA_NONE)
> -		dma_unmap_sg(db_attach->dev, sgt->sgl, sgt->orig_nents,
> -			attach->dma_dir);
> +		dma_unmap_sgtable(db_attach->dev, sgt, attach->dma_dir, 0);
>   	sg_free_table(sgt);
>   	kfree(attach);
>   	db_attach->priv = NULL;
> @@ -434,15 +429,12 @@ static struct sg_table *vb2_dma_sg_dmabuf_ops_map(
>   
>   	/* release any previous cache */
>   	if (attach->dma_dir != DMA_NONE) {
> -		dma_unmap_sg(db_attach->dev, sgt->sgl, sgt->orig_nents,
> -			attach->dma_dir);
> +		dma_unmap_sgtable(db_attach->dev, sgt, attach->dma_dir, 0);
>   		attach->dma_dir = DMA_NONE;
>   	}
>   
>   	/* mapping to the client with new direction */
> -	sgt->nents = dma_map_sg(db_attach->dev, sgt->sgl, sgt->orig_nents,
> -				dma_dir);
> -	if (!sgt->nents) {
> +	if (dma_map_sgtable(db_attach->dev, sgt, dma_dir, 0)) {
>   		pr_err("failed to map scatterlist\n");
>   		mutex_unlock(lock);
>   		return ERR_PTR(-EIO);
> diff --git a/drivers/media/common/videobuf2/videobuf2-vmalloc.c b/drivers/media/common/videobuf2/videobuf2-vmalloc.c
> index c66fda4a65e4..bf5ac63a5742 100644
> --- a/drivers/media/common/videobuf2/videobuf2-vmalloc.c
> +++ b/drivers/media/common/videobuf2/videobuf2-vmalloc.c
> @@ -229,7 +229,7 @@ static int vb2_vmalloc_dmabuf_ops_attach(struct dma_buf *dbuf,
>   		kfree(attach);
>   		return ret;
>   	}
> -	for_each_sg(sgt->sgl, sg, sgt->nents, i) {
> +	for_each_sgtable_sg(sgt, sg, i) {
>   		struct page *page = vmalloc_to_page(vaddr);
>   
>   		if (!page) {
> @@ -259,8 +259,7 @@ static void vb2_vmalloc_dmabuf_ops_detach(struct dma_buf *dbuf,
>   
>   	/* release the scatterlist cache */
>   	if (attach->dma_dir != DMA_NONE)
> -		dma_unmap_sg(db_attach->dev, sgt->sgl, sgt->orig_nents,
> -			attach->dma_dir);
> +		dma_unmap_sgtable(db_attach->dev, sgt, attach->dma_dir, 0);
>   	sg_free_table(sgt);
>   	kfree(attach);
>   	db_attach->priv = NULL;
> @@ -285,15 +284,12 @@ static struct sg_table *vb2_vmalloc_dmabuf_ops_map(
>   
>   	/* release any previous cache */
>   	if (attach->dma_dir != DMA_NONE) {
> -		dma_unmap_sg(db_attach->dev, sgt->sgl, sgt->orig_nents,
> -			attach->dma_dir);
> +		dma_unmap_sgtable(db_attach->dev, sgt, attach->dma_dir, 0);
>   		attach->dma_dir = DMA_NONE;
>   	}
>   
>   	/* mapping to the client with new direction */
> -	sgt->nents = dma_map_sg(db_attach->dev, sgt->sgl, sgt->orig_nents,
> -				dma_dir);
> -	if (!sgt->nents) {
> +	if (dma_map_sgtable(db_attach->dev, sgt, dma_dir, 0)) {
>   		pr_err("failed to map scatterlist\n");
>   		mutex_unlock(lock);
>   		return ERR_PTR(-EIO);
> 
