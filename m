Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D6AD7B81D7
	for <lists+linux-media@lfdr.de>; Wed,  4 Oct 2023 16:09:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242443AbjJDOKA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Oct 2023 10:10:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232875AbjJDOKA (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 Oct 2023 10:10:00 -0400
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20D76A1
        for <linux-media@vger.kernel.org>; Wed,  4 Oct 2023 07:09:56 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1qo2ZP-0000Tb-KC; Wed, 04 Oct 2023 16:09:47 +0200
Received: from [2a0a:edc0:2:b01:1d::c0] (helo=ptx.whiteo.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <mtr@pengutronix.de>)
        id 1qo2ZO-00B3KG-OD; Wed, 04 Oct 2023 16:09:46 +0200
Received: from mtr by ptx.whiteo.stw.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1qo2ZO-00CmAP-LV; Wed, 04 Oct 2023 16:09:46 +0200
Date:   Wed, 4 Oct 2023 16:09:46 +0200
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Jacob Chen <jacob-chen@iotwrt.com>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Shengyu Qu <wiagn233@outlook.com>,
        Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Diederik de Haas <didi.debian@cknow.org>,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de
Subject: Re: [PATCH 02/13] media: rockchip: rga: extract helper to fill
 descriptors
Message-ID: <20231004140946.GC3042281@pengutronix.de>
Mail-Followup-To: Michael Tretter <m.tretter@pengutronix.de>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Jacob Chen <jacob-chen@iotwrt.com>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>, Shengyu Qu <wiagn233@outlook.com>,
        Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Diederik de Haas <didi.debian@cknow.org>,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de
References: <20230914-rockchip-rga-multiplanar-v1-0-abfd77260ae3@pengutronix.de>
 <20230914-rockchip-rga-multiplanar-v1-2-abfd77260ae3@pengutronix.de>
 <8175c3d7-9e28-4483-a573-c64109784c60@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8175c3d7-9e28-4483-a573-c64109784c60@xs4all.nl>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 25 Sep 2023 09:32:49 +0200, Hans Verkuil wrote:
> On 14/09/2023 14:40, Michael Tretter wrote:
> > The IOMMU of the RGA is programmed with a list of DMA descriptors that
> > contain an 32 bit address per 4k page in the video buffers. The address
> > in the descriptor points to the start address of the page.
> > 
> > Introduce 'struct rga_dma_desc' to make the handling of the DMA
> > descriptors explicit instead of hiding them behind standard types.
> > 
> > As the descriptors only handle 32 bit addresses, addresses above 4 GB
> > cannot be addressed. If this is detected, stop filling the descriptor
> > list and report an error.
> > 
> > While at it, use provided helpers for iterating the sg_table instead of
> > manually calculating the DMA addresses.
> > 
> > Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> > ---
> >  drivers/media/platform/rockchip/rga/rga-buf.c | 47 +++++++++++++++------------
> >  drivers/media/platform/rockchip/rga/rga.h     |  8 +++--
> >  2 files changed, 33 insertions(+), 22 deletions(-)
> > 
> > diff --git a/drivers/media/platform/rockchip/rga/rga-buf.c b/drivers/media/platform/rockchip/rga/rga-buf.c
> > index 81508ed5abf3..df5ebc90e32d 100644
> > --- a/drivers/media/platform/rockchip/rga/rga-buf.c
> > +++ b/drivers/media/platform/rockchip/rga/rga-buf.c
> > @@ -5,6 +5,7 @@
> >   */
> >  
> >  #include <linux/pm_runtime.h>
> > +#include <linux/scatterlist.h>
> >  
> >  #include <media/v4l2-device.h>
> >  #include <media/v4l2-ioctl.h>
> > @@ -15,6 +16,25 @@
> >  #include "rga-hw.h"
> >  #include "rga.h"
> >  
> > +static int fill_descriptors(struct rga_dma_desc *desc, struct sg_table *sgt)
> > +{
> > +	struct sg_dma_page_iter iter;
> > +	struct rga_dma_desc *tmp = desc;
> > +	unsigned int num_desc = 0;
> > +	dma_addr_t addr;
> > +
> > +	for_each_sgtable_dma_page(sgt, &iter, 0) {
> > +		addr = sg_page_iter_dma_address(&iter);
> > +		if (upper_32_bits(addr) != 0L)
> > +			return -1;
> > +		tmp->addr = lower_32_bits(addr);
> > +		tmp++;
> > +		num_desc++;
> > +	}
> > +
> > +	return num_desc;
> > +}
> > +
> >  static int
> >  rga_queue_setup(struct vb2_queue *vq,
> >  		unsigned int *nbuffers, unsigned int *nplanes,
> > @@ -114,11 +134,8 @@ void rga_buf_map(struct vb2_buffer *vb)
> >  {
> >  	struct rga_ctx *ctx = vb2_get_drv_priv(vb->vb2_queue);
> >  	struct rockchip_rga *rga = ctx->rga;
> > -	struct sg_table *sgt;
> > -	struct scatterlist *sgl;
> > -	unsigned int *pages;
> > -	unsigned int address, len, i, p;
> > -	unsigned int mapped_size = 0;
> > +	struct rga_dma_desc *pages;
> > +	unsigned int num_desc = 0;
> >  
> >  	if (vb->type == V4L2_BUF_TYPE_VIDEO_OUTPUT)
> >  		pages = rga->src_mmu_pages;
> > @@ -126,23 +143,13 @@ void rga_buf_map(struct vb2_buffer *vb)
> >  		pages = rga->dst_mmu_pages;
> >  
> >  	/* Create local MMU table for RGA */
> > -	sgt = vb2_plane_cookie(vb, 0);
> > -
> > -	for_each_sg(sgt->sgl, sgl, sgt->nents, i) {
> > -		len = sg_dma_len(sgl) >> PAGE_SHIFT;
> > -		address = sg_phys(sgl);
> > -
> > -		for (p = 0; p < len; p++) {
> > -			dma_addr_t phys = address +
> > -					  ((dma_addr_t)p << PAGE_SHIFT);
> > -
> > -			pages[mapped_size + p] = phys;
> > -		}
> > -
> > -		mapped_size += len;
> > +	num_desc = fill_descriptors(pages, vb2_dma_sg_plane_desc(vb, 0));
> > +	if (num_desc < 0) {
> > +		dev_err(rga->dev, "Failed to map buffer");
> > +		return;
> >  	}
> >  
> >  	/* sync local MMU table for RGA */
> >  	dma_sync_single_for_device(rga->dev, virt_to_phys(pages),
> > -				   8 * PAGE_SIZE, DMA_BIDIRECTIONAL);
> > +				   num_desc * sizeof(*pages), DMA_BIDIRECTIONAL);
> >  }
> > diff --git a/drivers/media/platform/rockchip/rga/rga.h b/drivers/media/platform/rockchip/rga/rga.h
> > index 5fa9d2f366dc..22f7da28ac51 100644
> > --- a/drivers/media/platform/rockchip/rga/rga.h
> > +++ b/drivers/media/platform/rockchip/rga/rga.h
> > @@ -40,6 +40,10 @@ struct rga_frame {
> >  	u32 size;
> >  };
> >  
> > +struct rga_dma_desc {
> > +	u32 addr;
> > +};
> > +
> >  struct rockchip_rga_version {
> >  	u32 major;
> >  	u32 minor;
> > @@ -81,8 +85,8 @@ struct rockchip_rga {
> >  	struct rga_ctx *curr;
> >  	dma_addr_t cmdbuf_phy;
> >  	void *cmdbuf_virt;
> > -	unsigned int *src_mmu_pages;
> > -	unsigned int *dst_mmu_pages;
> > +	struct rga_dma_desc *src_mmu_pages;
> > +	struct rga_dma_desc *dst_mmu_pages;
> 
> This breaks compilation:
> 
> drivers/media/platform/rockchip/rga/rga.c: In function ‘rga_probe’:
> drivers/media/platform/rockchip/rga/rga.c:875:28: error: assignment to ‘struct rga_dma_desc *’ from incompatible pointer type ‘unsigned int *’ [-Werror=incompatible-pointer-types]
>   875 |         rga->src_mmu_pages =
>       |                            ^
> drivers/media/platform/rockchip/rga/rga.c:881:28: error: assignment to ‘struct rga_dma_desc *’ from incompatible pointer type ‘unsigned int *’ [-Werror=incompatible-pointer-types]
>   881 |         rga->dst_mmu_pages =
>       |                            ^
> 
> It's probably something that is fixed in a later patch, but as it is right
> now this series breaks bisect.

Thanks. I'll fix this in v2.

Michael

> 
> Regards,
> 
> 	Hans
> 
> >  };
> >  
> >  struct rga_frame *rga_get_frame(struct rga_ctx *ctx, enum v4l2_buf_type type);
> > 
> 
> 
