Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B6AA7A0882
	for <lists+linux-media@lfdr.de>; Thu, 14 Sep 2023 17:06:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240011AbjINPGh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Sep 2023 11:06:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234066AbjINPGh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Sep 2023 11:06:37 -0400
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 9EF121FC7
        for <linux-media@vger.kernel.org>; Thu, 14 Sep 2023 08:06:32 -0700 (PDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 97D501FB;
        Thu, 14 Sep 2023 08:07:09 -0700 (PDT)
Received: from [10.57.93.68] (unknown [10.57.93.68])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6105F3F738;
        Thu, 14 Sep 2023 08:06:30 -0700 (PDT)
Message-ID: <239e2853-f89f-20da-2492-7f6d33aede63@arm.com>
Date:   Thu, 14 Sep 2023 16:06:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 02/13] media: rockchip: rga: extract helper to fill
 descriptors
Content-Language: en-GB
To:     Michael Tretter <m.tretter@pengutronix.de>,
        Jacob Chen <jacob-chen@iotwrt.com>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Shengyu Qu <wiagn233@outlook.com>,
        Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
        Diederik de Haas <didi.debian@cknow.org>
Cc:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de
References: <20230914-rockchip-rga-multiplanar-v1-0-abfd77260ae3@pengutronix.de>
 <20230914-rockchip-rga-multiplanar-v1-2-abfd77260ae3@pengutronix.de>
From:   Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <20230914-rockchip-rga-multiplanar-v1-2-abfd77260ae3@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 2023-09-14 13:40, Michael Tretter wrote:
> The IOMMU of the RGA is programmed with a list of DMA descriptors that
> contain an 32 bit address per 4k page in the video buffers. The address
> in the descriptor points to the start address of the page.
> 
> Introduce 'struct rga_dma_desc' to make the handling of the DMA
> descriptors explicit instead of hiding them behind standard types.
> 
> As the descriptors only handle 32 bit addresses, addresses above 4 GB
> cannot be addressed. If this is detected, stop filling the descriptor
> list and report an error.

That sounds unnecessary, since the only DMA addresses the RGA should be 
seeing are those from a dma_map_sg() call using the RGA device itself, 
and that would have failed if it was unable to provide a valid DMA 
address for the device.

The existing rga_buf_map() code is so clearly wrong I can't tell whether 
that mapping is done somewhere out in the core framework or whether the 
driver's supposed to be doing it for itself.

Thanks,
Robin.

> While at it, use provided helpers for iterating the sg_table instead of
> manually calculating the DMA addresses.
> 
> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> ---
>   drivers/media/platform/rockchip/rga/rga-buf.c | 47 +++++++++++++++------------
>   drivers/media/platform/rockchip/rga/rga.h     |  8 +++--
>   2 files changed, 33 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/media/platform/rockchip/rga/rga-buf.c b/drivers/media/platform/rockchip/rga/rga-buf.c
> index 81508ed5abf3..df5ebc90e32d 100644
> --- a/drivers/media/platform/rockchip/rga/rga-buf.c
> +++ b/drivers/media/platform/rockchip/rga/rga-buf.c
> @@ -5,6 +5,7 @@
>    */
>   
>   #include <linux/pm_runtime.h>
> +#include <linux/scatterlist.h>
>   
>   #include <media/v4l2-device.h>
>   #include <media/v4l2-ioctl.h>
> @@ -15,6 +16,25 @@
>   #include "rga-hw.h"
>   #include "rga.h"
>   
> +static int fill_descriptors(struct rga_dma_desc *desc, struct sg_table *sgt)
> +{
> +	struct sg_dma_page_iter iter;
> +	struct rga_dma_desc *tmp = desc;
> +	unsigned int num_desc = 0;
> +	dma_addr_t addr;
> +
> +	for_each_sgtable_dma_page(sgt, &iter, 0) {
> +		addr = sg_page_iter_dma_address(&iter);
> +		if (upper_32_bits(addr) != 0L)
> +			return -1;
> +		tmp->addr = lower_32_bits(addr);
> +		tmp++;
> +		num_desc++;
> +	}
> +
> +	return num_desc;
> +}
> +
>   static int
>   rga_queue_setup(struct vb2_queue *vq,
>   		unsigned int *nbuffers, unsigned int *nplanes,
> @@ -114,11 +134,8 @@ void rga_buf_map(struct vb2_buffer *vb)
>   {
>   	struct rga_ctx *ctx = vb2_get_drv_priv(vb->vb2_queue);
>   	struct rockchip_rga *rga = ctx->rga;
> -	struct sg_table *sgt;
> -	struct scatterlist *sgl;
> -	unsigned int *pages;
> -	unsigned int address, len, i, p;
> -	unsigned int mapped_size = 0;
> +	struct rga_dma_desc *pages;
> +	unsigned int num_desc = 0;
>   
>   	if (vb->type == V4L2_BUF_TYPE_VIDEO_OUTPUT)
>   		pages = rga->src_mmu_pages;
> @@ -126,23 +143,13 @@ void rga_buf_map(struct vb2_buffer *vb)
>   		pages = rga->dst_mmu_pages;
>   
>   	/* Create local MMU table for RGA */
> -	sgt = vb2_plane_cookie(vb, 0);
> -
> -	for_each_sg(sgt->sgl, sgl, sgt->nents, i) {
> -		len = sg_dma_len(sgl) >> PAGE_SHIFT;
> -		address = sg_phys(sgl);
> -
> -		for (p = 0; p < len; p++) {
> -			dma_addr_t phys = address +
> -					  ((dma_addr_t)p << PAGE_SHIFT);
> -
> -			pages[mapped_size + p] = phys;
> -		}
> -
> -		mapped_size += len;
> +	num_desc = fill_descriptors(pages, vb2_dma_sg_plane_desc(vb, 0));
> +	if (num_desc < 0) {
> +		dev_err(rga->dev, "Failed to map buffer");
> +		return;
>   	}
>   
>   	/* sync local MMU table for RGA */
>   	dma_sync_single_for_device(rga->dev, virt_to_phys(pages),
> -				   8 * PAGE_SIZE, DMA_BIDIRECTIONAL);
> +				   num_desc * sizeof(*pages), DMA_BIDIRECTIONAL);
>   }
> diff --git a/drivers/media/platform/rockchip/rga/rga.h b/drivers/media/platform/rockchip/rga/rga.h
> index 5fa9d2f366dc..22f7da28ac51 100644
> --- a/drivers/media/platform/rockchip/rga/rga.h
> +++ b/drivers/media/platform/rockchip/rga/rga.h
> @@ -40,6 +40,10 @@ struct rga_frame {
>   	u32 size;
>   };
>   
> +struct rga_dma_desc {
> +	u32 addr;
> +};
> +
>   struct rockchip_rga_version {
>   	u32 major;
>   	u32 minor;
> @@ -81,8 +85,8 @@ struct rockchip_rga {
>   	struct rga_ctx *curr;
>   	dma_addr_t cmdbuf_phy;
>   	void *cmdbuf_virt;
> -	unsigned int *src_mmu_pages;
> -	unsigned int *dst_mmu_pages;
> +	struct rga_dma_desc *src_mmu_pages;
> +	struct rga_dma_desc *dst_mmu_pages;
>   };
>   
>   struct rga_frame *rga_get_frame(struct rga_ctx *ctx, enum v4l2_buf_type type);
> 
