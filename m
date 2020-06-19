Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF31B2005A0
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2020 11:44:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732008AbgFSJnv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 19 Jun 2020 05:43:51 -0400
Received: from foss.arm.com ([217.140.110.172]:49834 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731195AbgFSJnu (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 19 Jun 2020 05:43:50 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6D1392B;
        Fri, 19 Jun 2020 02:43:49 -0700 (PDT)
Received: from [10.57.9.128] (unknown [10.57.9.128])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5BE7C3F71F;
        Fri, 19 Jun 2020 02:43:47 -0700 (PDT)
Subject: Re: [PATCH v6 35/36] videobuf2: use sgtable-based scatterlist
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
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org
References: <20200618153956.29558-1-m.szyprowski@samsung.com>
 <CGME20200618154038eucas1p1acd4fcdd183de4c19c4004778527a755@eucas1p1.samsung.com>
 <20200618153956.29558-36-m.szyprowski@samsung.com>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <c2808024-943a-f46e-6ad8-5579a507bfdf@arm.com>
Date:   Fri, 19 Jun 2020 10:43:46 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200618153956.29558-36-m.szyprowski@samsung.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 2020-06-18 16:39, Marek Szyprowski wrote:
> Use recently introduced common wrappers operating directly on the struct
> sg_table objects and scatterlist page iterators to make the code a bit
> more compact, robust, easier to follow and copy/paste safe.
> 
> No functional change, because the code already properly did all the
> scaterlist related calls.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>   .../common/videobuf2/videobuf2-dma-contig.c   | 41 ++++++++-----------
>   .../media/common/videobuf2/videobuf2-dma-sg.c | 32 ++++++---------
>   .../common/videobuf2/videobuf2-vmalloc.c      | 12 ++----
>   3 files changed, 34 insertions(+), 51 deletions(-)
> 
> diff --git a/drivers/media/common/videobuf2/videobuf2-dma-contig.c b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> index f4b4a7c135eb..ba01a8692d88 100644
> --- a/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> +++ b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> @@ -48,16 +48,15 @@ struct vb2_dc_buf {
>   
>   static unsigned long vb2_dc_get_contiguous_size(struct sg_table *sgt)
>   {
> -	struct scatterlist *s;
>   	dma_addr_t expected = sg_dma_address(sgt->sgl);
> -	unsigned int i;
> +	struct sg_dma_page_iter dma_iter;
>   	unsigned long size = 0;
>   
> -	for_each_sg(sgt->sgl, s, sgt->nents, i) {
> -		if (sg_dma_address(s) != expected)
> +	for_each_sgtable_dma_page(sgt, &dma_iter, 0) {
> +		if (sg_page_iter_dma_address(&dma_iter) != expected)
>   			break;
> -		expected = sg_dma_address(s) + sg_dma_len(s);
> -		size += sg_dma_len(s);
> +		expected += PAGE_SIZE;
> +		size += PAGE_SIZE;

Same comment as for the DRM version. In fact, given that it's the same 
function with the same purpose, might it be worth hoisting out as a 
generic helper for the sg_table API itself?

>   	}
>   	return size;
>   }
[...]
> diff --git a/drivers/media/common/videobuf2/videobuf2-dma-sg.c b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> index 92072a08af25..6ddf953efa11 100644
> --- a/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> +++ b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> @@ -142,9 +142,8 @@ static void *vb2_dma_sg_alloc(struct device *dev, unsigned long dma_attrs,
>   	 * No need to sync to the device, this will happen later when the
>   	 * prepare() memop is called.
>   	 */
> -	sgt->nents = dma_map_sg_attrs(buf->dev, sgt->sgl, sgt->orig_nents,
> -				      buf->dma_dir, DMA_ATTR_SKIP_CPU_SYNC);
> -	if (!sgt->nents)
> +	if (dma_map_sgtable(buf->dev, sgt, buf->dma_dir,
> +			    DMA_ATTR_SKIP_CPU_SYNC)) {

As 0-day's explosions of nonsense imply, there's a rogue bracket here...

>   		goto fail_map;
>   
>   	buf->handler.refcount = &buf->refcount;
> @@ -180,8 +179,8 @@ static void vb2_dma_sg_put(void *buf_priv)
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
> @@ -202,8 +201,7 @@ static void vb2_dma_sg_prepare(void *buf_priv)
>   	if (buf->db_attach)
>   		return;
>   
> -	dma_sync_sg_for_device(buf->dev, sgt->sgl, sgt->orig_nents,
> -			       buf->dma_dir);
> +	dma_sync_sgtable_for_device(buf->dev, sgt, buf->dma_dir);
>   }
>   
>   static void vb2_dma_sg_finish(void *buf_priv)
> @@ -215,7 +213,7 @@ static void vb2_dma_sg_finish(void *buf_priv)
>   	if (buf->db_attach)
>   		return;
>   
> -	dma_sync_sg_for_cpu(buf->dev, sgt->sgl, sgt->orig_nents, buf->dma_dir);
> +	dma_sync_sgtable_for_cpu(buf->dev, sgt, buf->dma_dir);
>   }
>   
>   static void *vb2_dma_sg_get_userptr(struct device *dev, unsigned long vaddr,
> @@ -258,9 +256,8 @@ static void *vb2_dma_sg_get_userptr(struct device *dev, unsigned long vaddr,
>   	 * No need to sync to the device, this will happen later when the
>   	 * prepare() memop is called.
>   	 */
> -	sgt->nents = dma_map_sg_attrs(buf->dev, sgt->sgl, sgt->orig_nents,
> -				      buf->dma_dir, DMA_ATTR_SKIP_CPU_SYNC);
> -	if (!sgt->nents)
> +	if (dma_map_sgtable(buf->dev, sgt, buf->dma_dir,
> +			    DMA_ATTR_SKIP_CPU_SYNC)) {

... and here.

Robin.
