Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0EA313DE80B
	for <lists+linux-media@lfdr.de>; Tue,  3 Aug 2021 10:11:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234394AbhHCILp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Aug 2021 04:11:45 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:39489 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234284AbhHCILo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 3 Aug 2021 04:11:44 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id ApWNmT2xeXTlcApWOmkLod; Tue, 03 Aug 2021 10:11:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1627978293; bh=VgVqgttpCYUEY7XAzzrX5spYh7tCcjaVHO0Z/TzLWV4=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=vn1nHmPRmYDwa7hSiyrqnHcBqpmwVaWJ6j7ETVpHhxKsk+qPJuaz7BXe+o+n9r+nb
         BP6JV8LOUAZ7BlJ+SH5JKlE2xK7EzyCiAa+VeG8QDg9mVRl9S7i3uFTC5hz6yXjXLh
         1itfcviKJBfFe+oFn8DDHQuu7A8RGrPFq9EGwUkmewE5n+ahihWl1tlNT62rrBNqfR
         zwJI7Wno4fecMSGsM9TjeFVK/Mgtzu2b/7GgqamooaCrEe42UzmmOVhaEbUPN5KHpZ
         EEN7ogptDETJxM1FqU83N2hWSEfDSDGsEqWx2YFrK+Go3uLEVt/4EwAPFVsEQ8/tZH
         EW3EL6jj/u7BA==
Subject: Re: [PATCHv4 4/8] videobuf2: move cache_hints handling to allocators
To:     Sergey Senozhatsky <senozhatsky@chromium.org>,
        Tomasz Figa <tfiga@chromium.org>
Cc:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Christoph Hellwig <hch@lst.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210727070517.443167-1-senozhatsky@chromium.org>
 <20210727070517.443167-5-senozhatsky@chromium.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <9997d302-effb-7026-6891-56426823fc25@xs4all.nl>
Date:   Tue, 3 Aug 2021 10:11:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210727070517.443167-5-senozhatsky@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfP7utDhFZzvhx+Gqx1iyJwx5uU1S1ahFpycBzOARHxQNKxfGyGcn/z6HI2HRPGT+j1XD1DMcAXRT3+LZx/xKi4ckqR341WdgO+H5ZLKpkqtxl2mrK53b
 1d9Kn0y4hGqNz5hM/CwCb4zHvAQS+GTLnlzGUsik9moyD/T/uMS9FuAAnI2RE6DEhjc5IiZf4SumD3bvkVOVlM5JFuylb/hSHUWJvZ0JSKLlejEgojciTJH1
 7gBAv4aznx8sr0HyVxvDm8KiH5YLZA0s0gaCUAro36ctQO35cGlNwe7RoaGoNlJpLutcil/DLOb9SqFJ80Mk7TmpYEJm2qyMyvwgQFOhYq6pZjUnA+2WGIdn
 LE907lFjlOnoezk49zKnMqZds9Lti1s9yR0w9SzpU5erco+SExDuY9gAmIPhgUJzNNzqH/bS8R5eCpKNloCcOd1y4a9MEcCMxsZGZSYafayIQbZXqk2pz4QV
 P8Jt7hVoaKH6YxzI+HmUB/aXfnAyzKUhKT/Vixh90BswayxRqDhprJI6y5RC73pbKqZS1ulmxfgMssR9
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 27/07/2021 09:05, Sergey Senozhatsky wrote:
> This moves cache hints handling from videobuf2 core down

from -> from the

> to allocators level, because allocators do the sync/flush

to allocators -> to the allocator's

> caches eventually and may take better decisions. Besides,
> allocators already decide whether cache sync/flush should
> be done or can be skipped. This patch moves the scattered
> buffer cache sync logic to one common place.

Regards,

	Hans

> 
> Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> ---
>  drivers/media/common/videobuf2/videobuf2-core.c       | 6 ------
>  drivers/media/common/videobuf2/videobuf2-dma-contig.c | 6 ++++++
>  drivers/media/common/videobuf2/videobuf2-dma-sg.c     | 6 ++++++
>  3 files changed, 12 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
> index 76210c006958..55af63d54f23 100644
> --- a/drivers/media/common/videobuf2/videobuf2-core.c
> +++ b/drivers/media/common/videobuf2/videobuf2-core.c
> @@ -328,9 +328,6 @@ static void __vb2_buf_mem_prepare(struct vb2_buffer *vb)
>  		return;
>  
>  	vb->synced = 1;
> -	if (vb->skip_cache_sync_on_prepare)
> -		return;
> -
>  	for (plane = 0; plane < vb->num_planes; ++plane)
>  		call_void_memop(vb, prepare, vb->planes[plane].mem_priv);
>  }
> @@ -347,9 +344,6 @@ static void __vb2_buf_mem_finish(struct vb2_buffer *vb)
>  		return;
>  
>  	vb->synced = 0;
> -	if (vb->skip_cache_sync_on_finish)
> -		return;
> -
>  	for (plane = 0; plane < vb->num_planes; ++plane)
>  		call_void_memop(vb, finish, vb->planes[plane].mem_priv);
>  }
> diff --git a/drivers/media/common/videobuf2/videobuf2-dma-contig.c b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> index 019c3843dc6d..1e218bc440c6 100644
> --- a/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> +++ b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> @@ -101,6 +101,9 @@ static void vb2_dc_prepare(void *buf_priv)
>  	struct vb2_dc_buf *buf = buf_priv;
>  	struct sg_table *sgt = buf->dma_sgt;
>  
> +	if (buf->vb->skip_cache_sync_on_prepare)
> +		return;
> +
>  	if (!sgt)
>  		return;
>  
> @@ -112,6 +115,9 @@ static void vb2_dc_finish(void *buf_priv)
>  	struct vb2_dc_buf *buf = buf_priv;
>  	struct sg_table *sgt = buf->dma_sgt;
>  
> +	if (buf->vb->skip_cache_sync_on_finish)
> +		return;
> +
>  	if (!sgt)
>  		return;
>  
> diff --git a/drivers/media/common/videobuf2/videobuf2-dma-sg.c b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> index 50265080cfc8..33ee63a99139 100644
> --- a/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> +++ b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> @@ -204,6 +204,9 @@ static void vb2_dma_sg_prepare(void *buf_priv)
>  	struct vb2_dma_sg_buf *buf = buf_priv;
>  	struct sg_table *sgt = buf->dma_sgt;
>  
> +	if (buf->vb->skip_cache_sync_on_prepare)
> +		return;
> +
>  	dma_sync_sgtable_for_device(buf->dev, sgt, buf->dma_dir);
>  }
>  
> @@ -212,6 +215,9 @@ static void vb2_dma_sg_finish(void *buf_priv)
>  	struct vb2_dma_sg_buf *buf = buf_priv;
>  	struct sg_table *sgt = buf->dma_sgt;
>  
> +	if (buf->vb->skip_cache_sync_on_finish)
> +		return;
> +
>  	dma_sync_sgtable_for_cpu(buf->dev, sgt, buf->dma_dir);
>  }
>  
> 

