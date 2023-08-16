Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4845877E3B9
	for <lists+linux-media@lfdr.de>; Wed, 16 Aug 2023 16:35:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343656AbjHPOe7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Aug 2023 10:34:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343667AbjHPOed (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Aug 2023 10:34:33 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E4B026A1
        for <linux-media@vger.kernel.org>; Wed, 16 Aug 2023 07:34:29 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id BD170C85;
        Wed, 16 Aug 2023 16:33:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1692196394;
        bh=ch/klZHDWO7+wfH82u1d/vkSCn7e/idW6e/eLKXAOcM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=CWYyocUEZHPl4QsqQwrzXI2aFJhpjS60bm9JqNSp/G3txrZ+vWwJOPwbQl+9NZriA
         RzqTL3vt03+3MRkKKkWRWQPjgBwUuuUwGcIsIXlIGzmYY5bz121MXVH1AKa8kghUPq
         UzcNBo3d6EWfoi2B2PZJiLxud8luDeufVKADRWvo=
Date:   Wed, 16 Aug 2023 17:34:32 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        andrew-ct.chen@mediatek.com, yunfei.dong@mediatek.com,
        matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
        linux-mediatek@lists.infradead.org,
        Wei Chen <harperchen1110@gmail.com>, tiffany.lin@mediatek.com,
        Nicolas Dufresne <nicolas@ndufresne.ca>
Subject: Re: [PATCH] media: videobuf2-core.c: check if all buffers have the
 same number of planes
Message-ID: <20230816143432.GA4436@pendragon.ideasonboard.com>
References: <e75ff985-2499-9a16-21fe-ee2e81547e6f@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e75ff985-2499-9a16-21fe-ee2e81547e6f@xs4all.nl>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

Thank you for the patch.

On Wed, Aug 16, 2023 at 02:47:33PM +0200, Hans Verkuil wrote:
> Currently if VIDIOC_CREATE_BUFS is called to add new buffers, then the requested
> number of planes per buffer might be different from the already allocated buffers.
> 
> However, this does not make a lot of sense and there are no drivers that allow
> for variable number of planes in the allocated buffers.
> 
> While it is possible do this today, when such a buffer is queued it will fail
> in the buf_prepare() callback where the plane sizes are checked if those are
> large enough. If fewer planes were allocated, then the size for the missing
> planes are 0 and the check will return -EINVAL.
> 
> But it is much better to do this check in VIDIOC_CREATE_BUFS.

I don't think this is a good idea. One important use case for
VIDIOC_CREATE_BUFS is to allocate buffers for a different format than
the one currently configured for the device, to prepare for a future
capture (or output) session with a different configuration. This patch
would prevent that.

> This patch adds the check to videobuf2-core.c
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---
> With this patch the mediatek vcodec patch would no longer be needed:
> https://patchwork.linuxtv.org/project/linux-media/patch/20230810082333.972165-1-harperchen1110@gmail.com/
> ---
> diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
> index cf6727d9c81f..b88c08319bbe 100644
> --- a/drivers/media/common/videobuf2/videobuf2-core.c
> +++ b/drivers/media/common/videobuf2/videobuf2-core.c
> @@ -938,6 +938,10 @@ int vb2_core_create_bufs(struct vb2_queue *q, enum vb2_memory memory,
>  			dprintk(q, 1, "memory model mismatch\n");
>  			return -EINVAL;
>  		}
> +		if (requested_planes != q->num_planes) {
> +			dprintk(q, 1, "num_planes mismatch\n");
> +			return -EINVAL;
> +		}
>  		if (!verify_coherency_flags(q, non_coherent_mem))
>  			return -EINVAL;
>  	}
> @@ -1002,6 +1006,8 @@ int vb2_core_create_bufs(struct vb2_queue *q, enum vb2_memory memory,
>  		mutex_unlock(&q->mmap_lock);
>  		return -ENOMEM;
>  	}
> +	if (no_previous_buffers)
> +		q->num_planes = num_planes;
>  	mutex_unlock(&q->mmap_lock);
> 
>  	/*
> diff --git a/include/media/videobuf2-core.h b/include/media/videobuf2-core.h
> index 4b6a9d2ea372..799a285447b7 100644
> --- a/include/media/videobuf2-core.h
> +++ b/include/media/videobuf2-core.h
> @@ -558,6 +558,7 @@ struct vb2_buf_ops {
>   * @dma_dir:	DMA mapping direction.
>   * @bufs:	videobuf2 buffer structures
>   * @num_buffers: number of allocated/used buffers
> + * @num_planes: number of planes in each buffer
>   * @queued_list: list of buffers currently queued from userspace
>   * @queued_count: number of buffers queued and ready for streaming.
>   * @owned_by_drv_count: number of buffers owned by the driver
> @@ -621,6 +622,7 @@ struct vb2_queue {
>  	enum dma_data_direction		dma_dir;
>  	struct vb2_buffer		*bufs[VB2_MAX_FRAME];
>  	unsigned int			num_buffers;
> +	unsigned int			num_planes;
> 
>  	struct list_head		queued_list;
>  	unsigned int			queued_count;

-- 
Regards,

Laurent Pinchart
