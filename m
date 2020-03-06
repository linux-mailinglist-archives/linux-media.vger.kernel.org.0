Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1CE5517BFD1
	for <lists+linux-media@lfdr.de>; Fri,  6 Mar 2020 15:04:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726875AbgCFOEJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Mar 2020 09:04:09 -0500
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:51351 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726650AbgCFOEI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 6 Mar 2020 09:04:08 -0500
Received: from [IPv6:2001:983:e9a7:1:558f:c736:2117:17d1]
 ([IPv6:2001:983:e9a7:1:558f:c736:2117:17d1])
        by smtp-cloud7.xs4all.net with ESMTPA
        id ADa9j3D5JEE3qADaAjCcfO; Fri, 06 Mar 2020 15:04:06 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1583503446; bh=8XxOCEPoREORb7c2HZFhCn8VIk+8g8Vx9q7Ipbq6HFw=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=FvVbK0BlEtTlr/R0qe1IPOmx5y2+1eGzOryBsaMeONisjfDEnowfg8CsvLS9+I9sA
         rYVBmc/471Yk5tTURRtrnPBz9Y0dQMva2hwHCRf4948cul0cISEZLuu52/xjn9aTrW
         JLYzyt4WEBsgLEMuLszQ3wVREtNEffedsBrAUcXCT5vY1W9GE5W2VMI+G4xb3HRq+E
         9bFa7Ir22jMArz5Umg5ZZ6s64YCw/qClxfLZtlqH9NGqZQOergZgnVkjQByNi+ZHyC
         3oeEV7dBp02TpvAFYS9A03DtIrCqzC7QTnCUx1O70lsURRucl4c/tSAOmzlrx4bMdh
         N1Hh+A4cOjHgg==
Subject: Re: [PATCHv4 10/11] videobuf2: add begin/end cpu_access callbacks to
 dma-sg
To:     Sergey Senozhatsky <senozhatsky@chromium.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Tomasz Figa <tfiga@chromium.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Pawel Osciak <posciak@chromium.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200302041213.27662-1-senozhatsky@chromium.org>
 <20200302041213.27662-11-senozhatsky@chromium.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <f99cd8d2-26a2-acd1-a986-aee66cd2ba12@xs4all.nl>
Date:   Fri, 6 Mar 2020 15:04:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200302041213.27662-11-senozhatsky@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfFMSCgA13lZgSAxVSxB39QttbqabtJqi1Btj2KpFHRd7akSgc+5ebRNAGJwWhBvwvkSHc6wEsg1VbBBnY1jIcXPh6QBQIa8FwoDM7YoSQ67UyYSoOqVw
 KmoWWaLlsWMbbbeeK3RV2XIFpZArCb1gbE0ConzX8jJwz2zk0CEzBG5j1YlpLZNXFS8ceb/RidXCFTCHuRdJVkeIxNGxNoA6sTGwNRgZj4gsNm4/iLNBfsS5
 SnMtxh3XyRtmbE6B8Dhm/2KtFuXbwSFxgsVLEJujOFQVJfd0vz7cjTsfVVXC/3Aeej4XSO43AQVYw7dC8e8tgrgf632YLGhKMZsHGciQrXYw4Cn89b9NxqaE
 AKR6RNLyFs/0LBlqbB9tazliftZRYKGOzOtVSoNOC2crpWmb4ZLZ93tjuGBQ+zZsl5hNIBHjEE2TeaU+Vu3RUTKkrG8jOD+8LKIKoZyBEQ7KHpDOmszy303A
 9BEU6q05KdyCwuPv+CpURSSqx7K5vj4tAU8p6/0YrG/PzocjIfWLYn+jbFTVnFq8oIYUnvo3r7tdSYMbozhuQgnV2V+VkflgmW1v0kEi6Q905aLZsn1g7u51
 wjMQTwYYt9/iM+3BEStzJTrb2fO93zJa8YYwn5TWt4KI0g==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 02/03/2020 05:12, Sergey Senozhatsky wrote:
> Provide begin_cpu_access() and end_cpu_access() dma_buf_ops
> callbacks for cache synchronisation on exported buffers.
> 
> V4L2_FLAG_MEMORY_NON_CONSISTENT has no effect on dma-sg buffers.
> dma-sg allocates memory using the page allocator directly, so
> there is no memory consistency guarantee.
> 
> Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> ---
>  .../media/common/videobuf2/videobuf2-dma-sg.c | 28 +++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 
> diff --git a/drivers/media/common/videobuf2/videobuf2-dma-sg.c b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> index 6db60e9d5183..ddc67c9aaedb 100644
> --- a/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> +++ b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> @@ -120,6 +120,12 @@ static void *vb2_dma_sg_alloc(struct device *dev, unsigned long dma_attrs,
>  	buf->num_pages = size >> PAGE_SHIFT;
>  	buf->dma_sgt = &buf->sg_table;
>  
> +	/*
> +	 * NOTE: dma-sg allocates memory using the page allocator directly, so
> +	 * there is no memory consistency guarantee, hence dma-sg ignores DMA
> +	 * attributes passed from the upper layer. That means that
> +	 * V4L2_FLAG_MEMORY_NON_CONSISTENT has no effect on dma-sg buffers.
> +	 */
>  	buf->pages = kvmalloc_array(buf->num_pages, sizeof(struct page *),
>  				    GFP_KERNEL | __GFP_ZERO);
>  	if (!buf->pages)
> @@ -470,6 +476,26 @@ static void vb2_dma_sg_dmabuf_ops_release(struct dma_buf *dbuf)
>  	vb2_dma_sg_put(dbuf->priv);
>  }
>  
> +static int vb2_dma_sg_dmabuf_ops_begin_cpu_access(struct dma_buf *dbuf,
> +					enum dma_data_direction direction)

I suggest you use this style to avoid checkpatch warnings:

static int
vb2_dma_sg_dmabuf_ops_begin_cpu_access(struct dma_buf *dbuf,
				       enum dma_data_direction direction)

> +{
> +	struct vb2_dma_sg_buf *buf = dbuf->priv;
> +	struct sg_table *sgt = buf->dma_sgt;
> +
> +	dma_sync_sg_for_cpu(buf->dev, sgt->sgl, sgt->nents, buf->dma_dir);
> +	return 0;
> +}
> +
> +static int vb2_dma_sg_dmabuf_ops_end_cpu_access(struct dma_buf *dbuf,
> +					enum dma_data_direction direction)

Ditto.

Regards,

	Hans

> +{
> +	struct vb2_dma_sg_buf *buf = dbuf->priv;
> +	struct sg_table *sgt = buf->dma_sgt;
> +
> +	dma_sync_sg_for_device(buf->dev, sgt->sgl, sgt->nents, buf->dma_dir);
> +	return 0;
> +}
> +
>  static void *vb2_dma_sg_dmabuf_ops_vmap(struct dma_buf *dbuf)
>  {
>  	struct vb2_dma_sg_buf *buf = dbuf->priv;
> @@ -488,6 +514,8 @@ static const struct dma_buf_ops vb2_dma_sg_dmabuf_ops = {
>  	.detach = vb2_dma_sg_dmabuf_ops_detach,
>  	.map_dma_buf = vb2_dma_sg_dmabuf_ops_map,
>  	.unmap_dma_buf = vb2_dma_sg_dmabuf_ops_unmap,
> +	.begin_cpu_access = vb2_dma_sg_dmabuf_ops_begin_cpu_access,
> +	.end_cpu_access = vb2_dma_sg_dmabuf_ops_end_cpu_access,
>  	.vmap = vb2_dma_sg_dmabuf_ops_vmap,
>  	.mmap = vb2_dma_sg_dmabuf_ops_mmap,
>  	.release = vb2_dma_sg_dmabuf_ops_release,
> 

