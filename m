Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9A7B97AD1B3
	for <lists+linux-media@lfdr.de>; Mon, 25 Sep 2023 09:32:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229582AbjIYHdB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 Sep 2023 03:33:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229475AbjIYHdA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Sep 2023 03:33:00 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30F2AC2
        for <linux-media@vger.kernel.org>; Mon, 25 Sep 2023 00:32:54 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45CAFC433C7;
        Mon, 25 Sep 2023 07:32:51 +0000 (UTC)
Message-ID: <8175c3d7-9e28-4483-a573-c64109784c60@xs4all.nl>
Date:   Mon, 25 Sep 2023 09:32:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/13] media: rockchip: rga: extract helper to fill
 descriptors
Content-Language: en-US, nl
To:     Michael Tretter <m.tretter@pengutronix.de>,
        Jacob Chen <jacob-chen@iotwrt.com>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Shengyu Qu <wiagn233@outlook.com>,
        Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Diederik de Haas <didi.debian@cknow.org>
Cc:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de
References: <20230914-rockchip-rga-multiplanar-v1-0-abfd77260ae3@pengutronix.de>
 <20230914-rockchip-rga-multiplanar-v1-2-abfd77260ae3@pengutronix.de>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
In-Reply-To: <20230914-rockchip-rga-multiplanar-v1-2-abfd77260ae3@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 14/09/2023 14:40, Michael Tretter wrote:
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
> 
> While at it, use provided helpers for iterating the sg_table instead of
> manually calculating the DMA addresses.
> 
> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> ---
>  drivers/media/platform/rockchip/rga/rga-buf.c | 47 +++++++++++++++------------
>  drivers/media/platform/rockchip/rga/rga.h     |  8 +++--
>  2 files changed, 33 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/media/platform/rockchip/rga/rga-buf.c b/drivers/media/platform/rockchip/rga/rga-buf.c
> index 81508ed5abf3..df5ebc90e32d 100644
> --- a/drivers/media/platform/rockchip/rga/rga-buf.c
> +++ b/drivers/media/platform/rockchip/rga/rga-buf.c
> @@ -5,6 +5,7 @@
>   */
>  
>  #include <linux/pm_runtime.h>
> +#include <linux/scatterlist.h>
>  
>  #include <media/v4l2-device.h>
>  #include <media/v4l2-ioctl.h>
> @@ -15,6 +16,25 @@
>  #include "rga-hw.h"
>  #include "rga.h"
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
>  static int
>  rga_queue_setup(struct vb2_queue *vq,
>  		unsigned int *nbuffers, unsigned int *nplanes,
> @@ -114,11 +134,8 @@ void rga_buf_map(struct vb2_buffer *vb)
>  {
>  	struct rga_ctx *ctx = vb2_get_drv_priv(vb->vb2_queue);
>  	struct rockchip_rga *rga = ctx->rga;
> -	struct sg_table *sgt;
> -	struct scatterlist *sgl;
> -	unsigned int *pages;
> -	unsigned int address, len, i, p;
> -	unsigned int mapped_size = 0;
> +	struct rga_dma_desc *pages;
> +	unsigned int num_desc = 0;
>  
>  	if (vb->type == V4L2_BUF_TYPE_VIDEO_OUTPUT)
>  		pages = rga->src_mmu_pages;
> @@ -126,23 +143,13 @@ void rga_buf_map(struct vb2_buffer *vb)
>  		pages = rga->dst_mmu_pages;
>  
>  	/* Create local MMU table for RGA */
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
>  	}
>  
>  	/* sync local MMU table for RGA */
>  	dma_sync_single_for_device(rga->dev, virt_to_phys(pages),
> -				   8 * PAGE_SIZE, DMA_BIDIRECTIONAL);
> +				   num_desc * sizeof(*pages), DMA_BIDIRECTIONAL);
>  }
> diff --git a/drivers/media/platform/rockchip/rga/rga.h b/drivers/media/platform/rockchip/rga/rga.h
> index 5fa9d2f366dc..22f7da28ac51 100644
> --- a/drivers/media/platform/rockchip/rga/rga.h
> +++ b/drivers/media/platform/rockchip/rga/rga.h
> @@ -40,6 +40,10 @@ struct rga_frame {
>  	u32 size;
>  };
>  
> +struct rga_dma_desc {
> +	u32 addr;
> +};
> +
>  struct rockchip_rga_version {
>  	u32 major;
>  	u32 minor;
> @@ -81,8 +85,8 @@ struct rockchip_rga {
>  	struct rga_ctx *curr;
>  	dma_addr_t cmdbuf_phy;
>  	void *cmdbuf_virt;
> -	unsigned int *src_mmu_pages;
> -	unsigned int *dst_mmu_pages;
> +	struct rga_dma_desc *src_mmu_pages;
> +	struct rga_dma_desc *dst_mmu_pages;

This breaks compilation:

drivers/media/platform/rockchip/rga/rga.c: In function ‘rga_probe’:
drivers/media/platform/rockchip/rga/rga.c:875:28: error: assignment to ‘struct rga_dma_desc *’ from incompatible pointer type ‘unsigned int *’ [-Werror=incompatible-pointer-types]
  875 |         rga->src_mmu_pages =
      |                            ^
drivers/media/platform/rockchip/rga/rga.c:881:28: error: assignment to ‘struct rga_dma_desc *’ from incompatible pointer type ‘unsigned int *’ [-Werror=incompatible-pointer-types]
  881 |         rga->dst_mmu_pages =
      |                            ^

It's probably something that is fixed in a later patch, but as it is right
now this series breaks bisect.

Regards,

	Hans

>  };
>  
>  struct rga_frame *rga_get_frame(struct rga_ctx *ctx, enum v4l2_buf_type type);
> 

