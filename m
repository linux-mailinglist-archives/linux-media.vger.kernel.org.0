Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 842A1619C43
	for <lists+linux-media@lfdr.de>; Fri,  4 Nov 2022 16:55:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232023AbiKDPzm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Nov 2022 11:55:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231901AbiKDPzb (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Nov 2022 11:55:31 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDB5831238;
        Fri,  4 Nov 2022 08:55:29 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4DBCF62275;
        Fri,  4 Nov 2022 15:55:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F297C433B5;
        Fri,  4 Nov 2022 15:55:26 +0000 (UTC)
Message-ID: <66a6a8aa-4a06-1bf0-8c08-70569e4d129e@xs4all.nl>
Date:   Fri, 4 Nov 2022 16:55:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Content-Language: en-US
To:     Michael Grzeschik <m.grzeschik@pengutronix.de>,
        linux-usb@vger.kernel.org
Cc:     linux-media@vger.kernel.org, gregkh@linuxfoundation.org,
        balbi@kernel.org, laurent.pinchart@ideasonboard.com,
        kernel@pengutronix.de, stable <stable@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>
References: <20221026184212.366897-1-m.grzeschik@pengutronix.de>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: [PATCH 1/2] media: videobuf2-dma-sg: fix vmap and vunmap
 callbacks
In-Reply-To: <20221026184212.366897-1-m.grzeschik@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Marek,

Can you review this? It looks good to me, but I wonder if videobuf2-dma-config.c
has a similar problem. That looks to be mapping as well, but there is no vunmap.

Michael, I have a comment below:

On 26/10/2022 20:42, Michael Grzeschik wrote:
> For dmabuf import users to be able to use the vaddr from another
> videobuf2-dma-sg source, the exporter needs to set a proper vaddr on
> vb2_dma_sg_dmabuf_ops_vmap callback.
> 
> This patch adds vm_map_ram on map if buf->vaddr was not set, and also
> adds the vb2_dma_sg_dmabuf_ops_vunmap function to remove the mapping
> afterwards.
> 
> Cc: stable <stable@kernel.org>
> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
> ---
>  drivers/media/common/videobuf2/videobuf2-dma-sg.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/drivers/media/common/videobuf2/videobuf2-dma-sg.c b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> index fa69158a65b1fd..8d6e154bbbc8b0 100644
> --- a/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> +++ b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> @@ -496,11 +496,25 @@ static int vb2_dma_sg_dmabuf_ops_vmap(struct dma_buf *dbuf,
>  {
>  	struct vb2_dma_sg_buf *buf = dbuf->priv;
>  
> +	if (!buf->vaddr)
> +		buf->vaddr = vm_map_ram(buf->pages, buf->num_pages, -1);

The comments before the vm_map_ram function state that it should be used for
up to 256 KB only, and video buffers are definitely much larger. It recommends
using vmap in that case. Any reason for not switching to vmap()?

Regards,

	Hans

> +
>  	iosys_map_set_vaddr(map, buf->vaddr);
>  
>  	return 0;
>  }
>  
> +static void vb2_dma_sg_dmabuf_ops_vunmap(struct dma_buf *dbuf,
> +				      struct iosys_map *map)
> +{
> +	struct vb2_dma_sg_buf *buf = dbuf->priv;
> +
> +	if (buf->vaddr)
> +		vm_unmap_ram(buf->vaddr, buf->num_pages);
> +
> +	buf->vaddr = NULL;
> +}
> +
>  static int vb2_dma_sg_dmabuf_ops_mmap(struct dma_buf *dbuf,
>  	struct vm_area_struct *vma)
>  {
> @@ -515,6 +529,7 @@ static const struct dma_buf_ops vb2_dma_sg_dmabuf_ops = {
>  	.begin_cpu_access = vb2_dma_sg_dmabuf_ops_begin_cpu_access,
>  	.end_cpu_access = vb2_dma_sg_dmabuf_ops_end_cpu_access,
>  	.vmap = vb2_dma_sg_dmabuf_ops_vmap,
> +	.vunmap = vb2_dma_sg_dmabuf_ops_vunmap,
>  	.mmap = vb2_dma_sg_dmabuf_ops_mmap,
>  	.release = vb2_dma_sg_dmabuf_ops_release,
>  };

