Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 58158637A0A
	for <lists+linux-media@lfdr.de>; Thu, 24 Nov 2022 14:35:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230014AbiKXNfP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Nov 2022 08:35:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229846AbiKXNfO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Nov 2022 08:35:14 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC8866E552
        for <linux-media@vger.kernel.org>; Thu, 24 Nov 2022 05:35:13 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 6F1BAB826CF
        for <linux-media@vger.kernel.org>; Thu, 24 Nov 2022 13:35:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 431B6C433C1;
        Thu, 24 Nov 2022 13:35:10 +0000 (UTC)
Message-ID: <5e585a78-15c8-fd17-bc34-96f7ed18f592@xs4all.nl>
Date:   Thu, 24 Nov 2022 14:35:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH] media: videobuf2-dma-sg: use v{un,}map instead of
 vm_{un,}map_ram
Content-Language: en-US
To:     Michael Grzeschik <m.grzeschik@pengutronix.de>,
        linux-media@vger.kernel.org
Cc:     tfiga@chromium.org, m.szyprowski@samsung.com, kernel@pengutronix.de
References: <20221120234441.550908-1-m.grzeschik@pengutronix.de>
From:   Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <20221120234441.550908-1-m.grzeschik@pengutronix.de>
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

On 21/11/2022 00:44, Michael Grzeschik wrote:
> The comments before the vm_map_ram function state that it should be used
> for up to 256 KB only, and video buffers are definitely much larger. It
> recommends using vmap in that case.
> 
> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
> ---
>  drivers/media/common/videobuf2/videobuf2-dma-sg.c | 7 ++++---

drivers/media/common/videobuf2/videobuf2-vmalloc.c uses it as well,
probably also incorrectly. It makes sense to change that one as well.

Regards,

	Hans

>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/common/videobuf2/videobuf2-dma-sg.c b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> index dcb8de5ab3e84a..e86621fba350f3 100644
> --- a/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> +++ b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> @@ -188,7 +188,7 @@ static void vb2_dma_sg_put(void *buf_priv)
>  		dma_unmap_sgtable(buf->dev, sgt, buf->dma_dir,
>  				  DMA_ATTR_SKIP_CPU_SYNC);
>  		if (buf->vaddr)
> -			vm_unmap_ram(buf->vaddr, buf->num_pages);
> +			vunmap(buf->vaddr);
>  		sg_free_table(buf->dma_sgt);
>  		while (--i >= 0)
>  			__free_page(buf->pages[i]);
> @@ -289,7 +289,7 @@ static void vb2_dma_sg_put_userptr(void *buf_priv)
>  	       __func__, buf->num_pages);
>  	dma_unmap_sgtable(buf->dev, sgt, buf->dma_dir, DMA_ATTR_SKIP_CPU_SYNC);
>  	if (buf->vaddr)
> -		vm_unmap_ram(buf->vaddr, buf->num_pages);
> +		vunmap(buf->vaddr);
>  	sg_free_table(buf->dma_sgt);
>  	if (buf->dma_dir == DMA_FROM_DEVICE ||
>  	    buf->dma_dir == DMA_BIDIRECTIONAL)
> @@ -312,7 +312,8 @@ static void *vb2_dma_sg_vaddr(struct vb2_buffer *vb, void *buf_priv)
>  			ret = dma_buf_vmap(buf->db_attach->dmabuf, &map);
>  			buf->vaddr = ret ? NULL : map.vaddr;
>  		} else {
> -			buf->vaddr = vm_map_ram(buf->pages, buf->num_pages, -1);
> +			buf->vaddr = vmap(buf->pages, buf->num_pages, VM_MAP,
> +					  PAGE_KERNEL);
>  		}
>  	}
>  

