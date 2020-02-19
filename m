Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 63A36163F49
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2020 09:35:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726512AbgBSIfL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Feb 2020 03:35:11 -0500
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:47415 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726001AbgBSIfL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Feb 2020 03:35:11 -0500
Received: from [192.168.2.10] ([46.9.235.248])
        by smtp-cloud7.xs4all.net with ESMTPA
        id 4Kp0jzM3DP9a94Kp3jnR2K; Wed, 19 Feb 2020 09:35:09 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1582101309; bh=C8+TLX9CUjoYRbjqV89DAOrnbxNqT7La9+Tr4+Nt/Xs=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=Im/GCuvczi+2FTbLoNthxvmmyj/yWDPNHrxtz76J+xF24ZTX6P2sAsYjH5WeaH1cl
         n94ltxdd8tbqYnWKoYK3OwG7CPh/Fkichzhz9l2+CkCxW1aa5t4L/vAwMBdnZfgOJ0
         2sODOe3cx7qRA6b5qJOBDnjVHGaeZFj8fS6vJHa8QQdLYb77gc910q0kyRkP2XDgO7
         iKEGlvmXc7vzPFiJjpTAwMFBKIGcyEie5cZwZrpM2t1mY3GxETwcVoPtELpPg3dRAi
         wr9VQm122I7NV5vKucWvwLfKf5TcH3lrR/q/OhmgC6hZ0yKg/opbxaluW0zDCw0ko2
         gvpBIDM15NPDg==
Subject: Re: [RFC][PATCHv2 11/12] videobuf2: add begin/end cpu_access
 callbacks to dma-sg
To:     Sergey Senozhatsky <senozhatsky@chromium.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Pawel Osciak <posciak@chromium.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200204025641.218376-1-senozhatsky@chromium.org>
 <20200204025641.218376-12-senozhatsky@chromium.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <06d654ec-9d05-4ef5-c27e-ff78c96a3457@xs4all.nl>
Date:   Wed, 19 Feb 2020 09:35:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200204025641.218376-12-senozhatsky@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfAM6J5MuTxDS9Mq5vbGVpdEHcL+zpBvRu+SSDWsXh/ekZ6HatxQGKgFprfDkFu0Ka3/ar4Z/N5a4SPBi5lejeQuuvs59XV0qYbRg7/KEai1qKNs0vSNK
 SFvHeF75F+IGbVDs/hJzUe6nd4KxhjIIoY11hh5HLmH4NAE4/JNIsLyTZ4b7ti0hAWyCFqTkL8/gjMuwIx28GWpnr4FLpakv3tNkQjyTt9f6WEAsl16kWJ52
 tMa2gzFo4MGztIycB5X6Bu/FMsnRRXkEEIZJEGf75dFw1EoiO4F2pvx7Dvd1BykI2pDRjr50hkbFDgHtz/r592L7KPJ9nYA40SCm+ZZ0C6R65kkik4VmJYzb
 Pdq0/q8CriBaYsAQvLZ4yUiBfcs6zvnl5W1YMDCrW2QwYvh7nNmWYELvEjwNAMIogBsck43+Utr15Yl8EqaYxd2irJ0sJbyDtIthifA6vGa1uefSsbVbXBDt
 0KYxiuZ8F3EUAAYDIhhxLZ7xIzTZzVZ8kNDb7lcw87ojTWj2tuwPqYcZOvDIzAQTcAaJGq0F9rDO1ADT
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 2/4/20 3:56 AM, Sergey Senozhatsky wrote:
> Provide begin_cpu_access() and end_cpu_access() dma_buf_ops
> callbacks for cache synchronisation on exported buffers.
> 
> V4L2_FLAG_MEMORY_NON_CONSISTENT has no effect on dma-sg buffers.
> dma-sg allocates memory using the page allocator directly, so
> there is no memory consistency guarantee.

This should also be a comment in the code.

Regards,

	Hans

> 
> Change-Id: Ia0d9d72a8c2a9fe3264ac148f59201573289ed2c
> Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> ---
>  .../media/common/videobuf2/videobuf2-dma-sg.c | 22 +++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/drivers/media/common/videobuf2/videobuf2-dma-sg.c b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> index 6db60e9d5183..bfc99a0cb7b9 100644
> --- a/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> +++ b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> @@ -470,6 +470,26 @@ static void vb2_dma_sg_dmabuf_ops_release(struct dma_buf *dbuf)
>  	vb2_dma_sg_put(dbuf->priv);
>  }
>  
> +static int vb2_dma_sg_dmabuf_ops_begin_cpu_access(struct dma_buf *dbuf,
> +					enum dma_data_direction direction)
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
> @@ -488,6 +508,8 @@ static const struct dma_buf_ops vb2_dma_sg_dmabuf_ops = {
>  	.detach = vb2_dma_sg_dmabuf_ops_detach,
>  	.map_dma_buf = vb2_dma_sg_dmabuf_ops_map,
>  	.unmap_dma_buf = vb2_dma_sg_dmabuf_ops_unmap,
> +	.begin_cpu_access = vb2_dma_sg_dmabuf_ops_begin_cpu_access,
> +	.end_cpu_access = vb2_dma_sg_dmabuf_ops_end_cpu_access,
>  	.vmap = vb2_dma_sg_dmabuf_ops_vmap,
>  	.mmap = vb2_dma_sg_dmabuf_ops_mmap,
>  	.release = vb2_dma_sg_dmabuf_ops_release,
> 

