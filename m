Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 73A0E61DAF0
	for <lists+linux-media@lfdr.de>; Sat,  5 Nov 2022 15:24:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229853AbiKEOYZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 5 Nov 2022 10:24:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229782AbiKEOYY (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 5 Nov 2022 10:24:24 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED0A5DEBD;
        Sat,  5 Nov 2022 07:24:22 -0700 (PDT)
Received: from pendragon.ideasonboard.com (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C1698A04;
        Sat,  5 Nov 2022 15:24:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1667658260;
        bh=tXTdDVWSfyJVYM9fzFbnCgt5p+nkUCR9gGTl5CCZODg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=XSFjLSNqvHRci1q35WIpFHieKOUkeadca6BsPc7+GpftrmbbVqdoJmt/qD8aWOCPf
         kYFICRQUc/JBi9BLzwanq0Qi75eqG1qRyXDxEdCH3YJezd7g8BRiQcuXKQYADuqYn6
         4Zv4JYxILA8ePQPacUMVmOe3ft1kPpj0DloqvojE=
Date:   Sat, 5 Nov 2022 16:24:00 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Michael Grzeschik <m.grzeschik@pengutronix.de>,
        linux-usb@vger.kernel.org, linux-media@vger.kernel.org,
        gregkh@linuxfoundation.org, balbi@kernel.org,
        kernel@pengutronix.de, stable <stable@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH 1/2] media: videobuf2-dma-sg: fix vmap and vunmap
 callbacks
Message-ID: <Y2ZyAKHqd2f2ewoa@pendragon.ideasonboard.com>
References: <20221026184212.366897-1-m.grzeschik@pengutronix.de>
 <66a6a8aa-4a06-1bf0-8c08-70569e4d129e@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <66a6a8aa-4a06-1bf0-8c08-70569e4d129e@xs4all.nl>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Nov 04, 2022 at 04:55:25PM +0100, Hans Verkuil wrote:
> Marek,
> 
> Can you review this? It looks good to me, but I wonder if videobuf2-dma-config.c
> has a similar problem. That looks to be mapping as well, but there is no vunmap.
> 
> Michael, I have a comment below:
> 
> On 26/10/2022 20:42, Michael Grzeschik wrote:
> > For dmabuf import users to be able to use the vaddr from another
> > videobuf2-dma-sg source, the exporter needs to set a proper vaddr on
> > vb2_dma_sg_dmabuf_ops_vmap callback.
> > 
> > This patch adds vm_map_ram on map if buf->vaddr was not set, and also
> > adds the vb2_dma_sg_dmabuf_ops_vunmap function to remove the mapping
> > afterwards.
> > 
> > Cc: stable <stable@kernel.org>
> > Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
> > ---
> >  drivers/media/common/videobuf2/videobuf2-dma-sg.c | 15 +++++++++++++++
> >  1 file changed, 15 insertions(+)
> > 
> > diff --git a/drivers/media/common/videobuf2/videobuf2-dma-sg.c b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> > index fa69158a65b1fd..8d6e154bbbc8b0 100644
> > --- a/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> > +++ b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> > @@ -496,11 +496,25 @@ static int vb2_dma_sg_dmabuf_ops_vmap(struct dma_buf *dbuf,
> >  {
> >  	struct vb2_dma_sg_buf *buf = dbuf->priv;
> >  
> > +	if (!buf->vaddr)
> > +		buf->vaddr = vm_map_ram(buf->pages, buf->num_pages, -1);
> 
> The comments before the vm_map_ram function state that it should be used for
> up to 256 KB only, and video buffers are definitely much larger. It recommends
> using vmap in that case. Any reason for not switching to vmap()?

vb2_dma_sg_vaddr() already uses vm_map_ram(), so that would need to be
fixed too. I assume the code is copied from there.

> > +
> >  	iosys_map_set_vaddr(map, buf->vaddr);
> >  
> >  	return 0;
> >  }
> >  
> > +static void vb2_dma_sg_dmabuf_ops_vunmap(struct dma_buf *dbuf,
> > +				      struct iosys_map *map)
> > +{
> > +	struct vb2_dma_sg_buf *buf = dbuf->priv;
> > +
> > +	if (buf->vaddr)
> > +		vm_unmap_ram(buf->vaddr, buf->num_pages);
> > +
> > +	buf->vaddr = NULL;
> > +}
> > +
> >  static int vb2_dma_sg_dmabuf_ops_mmap(struct dma_buf *dbuf,
> >  	struct vm_area_struct *vma)
> >  {
> > @@ -515,6 +529,7 @@ static const struct dma_buf_ops vb2_dma_sg_dmabuf_ops = {
> >  	.begin_cpu_access = vb2_dma_sg_dmabuf_ops_begin_cpu_access,
> >  	.end_cpu_access = vb2_dma_sg_dmabuf_ops_end_cpu_access,
> >  	.vmap = vb2_dma_sg_dmabuf_ops_vmap,
> > +	.vunmap = vb2_dma_sg_dmabuf_ops_vunmap,
> >  	.mmap = vb2_dma_sg_dmabuf_ops_mmap,
> >  	.release = vb2_dma_sg_dmabuf_ops_release,
> >  };

-- 
Regards,

Laurent Pinchart
