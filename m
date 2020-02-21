Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A161C1678E9
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2020 10:01:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727039AbgBUJBI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 21 Feb 2020 04:01:08 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:47598 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725865AbgBUJBI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 21 Feb 2020 04:01:08 -0500
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 84C46563;
        Fri, 21 Feb 2020 10:01:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1582275666;
        bh=TxYe0ZyAfOlUJr3E7Fgz4oWbWpIlHLP5eduwgtS3LI0=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=FgmhHyi0mN/88wg3j7VM6Cob6PoEdcqhuOqMHtSgq6RUvSTG9NNT829eOYz+7TxMp
         OhWtHYudG1V+NyBSRcWckTzINYva7cZ7ZBon80ddfXbWVqZxJJjSNfVOa7MAVREEDN
         L+3nyKJ4NpV1xmSpnS9aFpG89t9gCBgCz+PelwXI=
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [RFC PATCH 9/9] omap3isp/rcar_fdp1/vsp1/xilinx: drop VB2_USERPTR
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20200221084531.576156-1-hverkuil-cisco@xs4all.nl>
 <20200221084531.576156-10-hverkuil-cisco@xs4all.nl>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <6b0e13b1-77c8-1b15-6be1-3139ca471715@ideasonboard.com>
Date:   Fri, 21 Feb 2020 09:01:02 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200221084531.576156-10-hverkuil-cisco@xs4all.nl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On 21/02/2020 08:45, Hans Verkuil wrote:
> The combination of VB2_USERPTR and dma-contig makes no sense for
> these devices, drop it.
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

Agreed, the FDP1 and VSP1 expect contiguous physical memory, so a
user-pointer doesn't make much sense to be permitted.

I haven't lokoed at the Xilinx platform in regards to this but I would
be surprised if it wasn't the same issue there of course.

For VSP1/FDP1:

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>



> ---
>  drivers/media/platform/omap3isp/ispvideo.c | 2 +-
>  drivers/media/platform/rcar_fdp1.c         | 4 ++--
>  drivers/media/platform/vsp1/vsp1_video.c   | 2 +-
>  drivers/media/platform/xilinx/xilinx-dma.c | 2 +-
>  4 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/platform/omap3isp/ispvideo.c b/drivers/media/platform/omap3isp/ispvideo.c
> index e8c46ff1aeb4..1104654ba438 100644
> --- a/drivers/media/platform/omap3isp/ispvideo.c
> +++ b/drivers/media/platform/omap3isp/ispvideo.c
> @@ -1319,7 +1319,7 @@ static int isp_video_open(struct file *file)
>  
>  	queue = &handle->queue;
>  	queue->type = video->type;
> -	queue->io_modes = VB2_MMAP | VB2_DMABUF | VB2_USERPTR;
> +	queue->io_modes = VB2_MMAP | VB2_DMABUF;
>  	queue->drv_priv = handle;
>  	queue->ops = &isp_video_queue_ops;
>  	queue->mem_ops = &vb2_dma_contig_memops;
> diff --git a/drivers/media/platform/rcar_fdp1.c b/drivers/media/platform/rcar_fdp1.c
> index 97bed45360f0..df081f66575f 100644
> --- a/drivers/media/platform/rcar_fdp1.c
> +++ b/drivers/media/platform/rcar_fdp1.c
> @@ -2047,7 +2047,7 @@ static int queue_init(void *priv, struct vb2_queue *src_vq,
>  	int ret;
>  
>  	src_vq->type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
> -	src_vq->io_modes = VB2_MMAP | VB2_USERPTR | VB2_DMABUF;
> +	src_vq->io_modes = VB2_MMAP | VB2_DMABUF;
>  	src_vq->drv_priv = ctx;
>  	src_vq->buf_struct_size = sizeof(struct fdp1_buffer);
>  	src_vq->ops = &fdp1_qops;
> @@ -2061,7 +2061,7 @@ static int queue_init(void *priv, struct vb2_queue *src_vq,
>  		return ret;
>  
>  	dst_vq->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
> -	dst_vq->io_modes = VB2_MMAP | VB2_USERPTR | VB2_DMABUF;
> +	dst_vq->io_modes = VB2_MMAP | VB2_DMABUF;
>  	dst_vq->drv_priv = ctx;
>  	dst_vq->buf_struct_size = sizeof(struct fdp1_buffer);
>  	dst_vq->ops = &fdp1_qops;
> diff --git a/drivers/media/platform/vsp1/vsp1_video.c b/drivers/media/platform/vsp1/vsp1_video.c
> index 5e59ed2c3614..112e2092f6d3 100644
> --- a/drivers/media/platform/vsp1/vsp1_video.c
> +++ b/drivers/media/platform/vsp1/vsp1_video.c
> @@ -1300,7 +1300,7 @@ struct vsp1_video *vsp1_video_create(struct vsp1_device *vsp1,
>  	video_set_drvdata(&video->video, video);
>  
>  	video->queue.type = video->type;
> -	video->queue.io_modes = VB2_MMAP | VB2_USERPTR | VB2_DMABUF;
> +	video->queue.io_modes = VB2_MMAP | VB2_DMABUF;
>  	video->queue.lock = &video->lock;
>  	video->queue.drv_priv = video;
>  	video->queue.buf_struct_size = sizeof(struct vsp1_vb2_buffer);
> diff --git a/drivers/media/platform/xilinx/xilinx-dma.c b/drivers/media/platform/xilinx/xilinx-dma.c
> index b211380a11f2..57e52ad720dd 100644
> --- a/drivers/media/platform/xilinx/xilinx-dma.c
> +++ b/drivers/media/platform/xilinx/xilinx-dma.c
> @@ -708,7 +708,7 @@ int xvip_dma_init(struct xvip_composite_device *xdev, struct xvip_dma *dma,
>  	 * instead of 'cat' isn't really a drawback.
>  	 */
>  	dma->queue.type = type;
> -	dma->queue.io_modes = VB2_MMAP | VB2_USERPTR | VB2_DMABUF;
> +	dma->queue.io_modes = VB2_MMAP | VB2_DMABUF;
>  	dma->queue.lock = &dma->lock;
>  	dma->queue.drv_priv = dma;
>  	dma->queue.buf_struct_size = sizeof(struct xvip_dma_buffer);
> 

