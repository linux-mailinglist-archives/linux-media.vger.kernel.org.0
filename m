Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CBB8D100368
	for <lists+linux-media@lfdr.de>; Mon, 18 Nov 2019 12:02:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726905AbfKRLCn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 Nov 2019 06:02:43 -0500
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:34665 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726518AbfKRLCn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 Nov 2019 06:02:43 -0500
Received: from [IPv6:2001:983:e9a7:1:51d2:6e2e:1293:dc69]
 ([IPv6:2001:983:e9a7:1:51d2:6e2e:1293:dc69])
        by smtp-cloud8.xs4all.net with ESMTPA
        id WenniiFCkecrtWenoix6uF; Mon, 18 Nov 2019 12:02:41 +0100
Subject: Re: [PATCH 11/15] media/videobuf2: Drop dma_buf->k(un)map support
To:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        DRI Development <dri-devel@lists.freedesktop.org>
Cc:     Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Pawel Osciak <pawel@osciak.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Tomasz Figa <tfiga@chromium.org>, linux-media@vger.kernel.org
References: <20191118103536.17675-1-daniel.vetter@ffwll.ch>
 <20191118103536.17675-12-daniel.vetter@ffwll.ch>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <3c596f9f-6a9d-325c-452a-f1f89c6f7c49@xs4all.nl>
Date:   Mon, 18 Nov 2019 12:02:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191118103536.17675-12-daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfF9d6OadzwnyFo3iKuF59GLDdkkVTZh7P72EcJen+CG+5ZJY0ylR42hZTxroQVlWn6SXxZsps1ax+/Yqy+G5ZFdmqnduL/RN48I3fQolczp0edFbeahO
 jeSNtOMJoy8L74dwudb+VrfOmT2rsSd/yaErd5H567cgZxgrxMMraH4Exzq5gb80Z28goZxTe66+Z+SUgrNUYwu3IEdZGrdRhwOeQdTzEyjjcCyEB2WvN+NG
 MlbFrSUwrpKkpu5dNXkxXq+Cs9VMAC4OoSCMBZBs18RKE4cBx8g8dD8iDzkfSRgYszbH2o0DpYKCa6urtuVFWGMKJZt8fLncBfp84L4kXNtoMyGzpJ4w/YfC
 gVaPyR7TleJGiEDskSrzScyjdvCSAFvXJBkgsSR1evh56cExXQWlkC3ZIXl4VNLSYO6A4OKZiIeM8V8a5ojD8PWhHmOdBezYmOseGzGfSSZJBUzyYOvdlfMl
 6mGm7H4k+cs0moEfepKW8jVUeA87vGscP3H3ehUW+lWyBIkUv96y7e7HF5A5duAoOsJRGztrN3BwKr4apehpWZw22jQWdgJv6mMXVw==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 11/18/19 11:35 AM, Daniel Vetter wrote:
> No in-tree users left.
> 
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>

Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Thanks!

	Hans

> Cc: Pawel Osciak <pawel@osciak.com>
> Cc: Marek Szyprowski <m.szyprowski@samsung.com>
> Cc: Kyungmin Park <kyungmin.park@samsung.com>
> Cc: Tomasz Figa <tfiga@chromium.org>
> Cc: linux-media@vger.kernel.org
> --
> Ack for merging this through drm trees very much appreciated.
> -Daniel
> ---
>  drivers/media/common/videobuf2/videobuf2-dma-contig.c | 8 --------
>  drivers/media/common/videobuf2/videobuf2-dma-sg.c     | 8 --------
>  drivers/media/common/videobuf2/videobuf2-vmalloc.c    | 8 --------
>  3 files changed, 24 deletions(-)
> 
> diff --git a/drivers/media/common/videobuf2/videobuf2-dma-contig.c b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> index 44cd0e530bbd..d0c9dffe49e5 100644
> --- a/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> +++ b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> @@ -335,13 +335,6 @@ static void vb2_dc_dmabuf_ops_release(struct dma_buf *dbuf)
>  	vb2_dc_put(dbuf->priv);
>  }
>  
> -static void *vb2_dc_dmabuf_ops_kmap(struct dma_buf *dbuf, unsigned long pgnum)
> -{
> -	struct vb2_dc_buf *buf = dbuf->priv;
> -
> -	return buf->vaddr ? buf->vaddr + pgnum * PAGE_SIZE : NULL;
> -}
> -
>  static void *vb2_dc_dmabuf_ops_vmap(struct dma_buf *dbuf)
>  {
>  	struct vb2_dc_buf *buf = dbuf->priv;
> @@ -360,7 +353,6 @@ static const struct dma_buf_ops vb2_dc_dmabuf_ops = {
>  	.detach = vb2_dc_dmabuf_ops_detach,
>  	.map_dma_buf = vb2_dc_dmabuf_ops_map,
>  	.unmap_dma_buf = vb2_dc_dmabuf_ops_unmap,
> -	.map = vb2_dc_dmabuf_ops_kmap,
>  	.vmap = vb2_dc_dmabuf_ops_vmap,
>  	.mmap = vb2_dc_dmabuf_ops_mmap,
>  	.release = vb2_dc_dmabuf_ops_release,
> diff --git a/drivers/media/common/videobuf2/videobuf2-dma-sg.c b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> index ed706b2a263c..6db60e9d5183 100644
> --- a/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> +++ b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> @@ -470,13 +470,6 @@ static void vb2_dma_sg_dmabuf_ops_release(struct dma_buf *dbuf)
>  	vb2_dma_sg_put(dbuf->priv);
>  }
>  
> -static void *vb2_dma_sg_dmabuf_ops_kmap(struct dma_buf *dbuf, unsigned long pgnum)
> -{
> -	struct vb2_dma_sg_buf *buf = dbuf->priv;
> -
> -	return buf->vaddr ? buf->vaddr + pgnum * PAGE_SIZE : NULL;
> -}
> -
>  static void *vb2_dma_sg_dmabuf_ops_vmap(struct dma_buf *dbuf)
>  {
>  	struct vb2_dma_sg_buf *buf = dbuf->priv;
> @@ -495,7 +488,6 @@ static const struct dma_buf_ops vb2_dma_sg_dmabuf_ops = {
>  	.detach = vb2_dma_sg_dmabuf_ops_detach,
>  	.map_dma_buf = vb2_dma_sg_dmabuf_ops_map,
>  	.unmap_dma_buf = vb2_dma_sg_dmabuf_ops_unmap,
> -	.map = vb2_dma_sg_dmabuf_ops_kmap,
>  	.vmap = vb2_dma_sg_dmabuf_ops_vmap,
>  	.mmap = vb2_dma_sg_dmabuf_ops_mmap,
>  	.release = vb2_dma_sg_dmabuf_ops_release,
> diff --git a/drivers/media/common/videobuf2/videobuf2-vmalloc.c b/drivers/media/common/videobuf2/videobuf2-vmalloc.c
> index 04d51ca63223..4d5af352e249 100644
> --- a/drivers/media/common/videobuf2/videobuf2-vmalloc.c
> +++ b/drivers/media/common/videobuf2/videobuf2-vmalloc.c
> @@ -319,13 +319,6 @@ static void vb2_vmalloc_dmabuf_ops_release(struct dma_buf *dbuf)
>  	vb2_vmalloc_put(dbuf->priv);
>  }
>  
> -static void *vb2_vmalloc_dmabuf_ops_kmap(struct dma_buf *dbuf, unsigned long pgnum)
> -{
> -	struct vb2_vmalloc_buf *buf = dbuf->priv;
> -
> -	return buf->vaddr + pgnum * PAGE_SIZE;
> -}
> -
>  static void *vb2_vmalloc_dmabuf_ops_vmap(struct dma_buf *dbuf)
>  {
>  	struct vb2_vmalloc_buf *buf = dbuf->priv;
> @@ -344,7 +337,6 @@ static const struct dma_buf_ops vb2_vmalloc_dmabuf_ops = {
>  	.detach = vb2_vmalloc_dmabuf_ops_detach,
>  	.map_dma_buf = vb2_vmalloc_dmabuf_ops_map,
>  	.unmap_dma_buf = vb2_vmalloc_dmabuf_ops_unmap,
> -	.map = vb2_vmalloc_dmabuf_ops_kmap,
>  	.vmap = vb2_vmalloc_dmabuf_ops_vmap,
>  	.mmap = vb2_vmalloc_dmabuf_ops_mmap,
>  	.release = vb2_vmalloc_dmabuf_ops_release,
> 

