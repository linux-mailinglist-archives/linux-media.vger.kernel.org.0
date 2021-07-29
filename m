Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E5253DA70C
	for <lists+linux-media@lfdr.de>; Thu, 29 Jul 2021 17:06:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236736AbhG2PGJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Jul 2021 11:06:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229864AbhG2PGI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Jul 2021 11:06:08 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06A33C061765
        for <linux-media@vger.kernel.org>; Thu, 29 Jul 2021 08:06:04 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 89C1B1F44300
Message-ID: <695fc81424e58d29242aa2101497175386a4fba3.camel@collabora.com>
Subject: Re: [PATCH 1/3] cedrus: drop min_buffers_needed.
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org
Cc:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Daniel Almeida <daniel.almeida@collabora.com>
Date:   Thu, 29 Jul 2021 12:05:56 -0300
In-Reply-To: <20210729133627.1592672-2-hverkuil-cisco@xs4all.nl>
References: <20210729133627.1592672-1-hverkuil-cisco@xs4all.nl>
         <20210729133627.1592672-2-hverkuil-cisco@xs4all.nl>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.3-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 2021-07-29 at 15:36 +0200, Hans Verkuil wrote:
> There is no reason for the cedrus driver to set min_buffers_needed.
> A non-zero min_buffers_needed can cause problems with the Request API
> if start_streaming fails when queueing a buffer from a request.
> 
> Since it is not needed for this driver, just remove it.
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Cc: Ezequiel Garcia <ezequiel@collabora.com>
> Cc: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

Adding Daniel in Cc, I think he has a board
ready to run some tests if needed.

Having said that, Hantro doesn't use min_buffers_needed
so this looks correct.

Reviewed-by: Ezequiel Garcia <ezequiel@collabora.com>

Thanks,
Ezequiel

> ---
>  drivers/staging/media/sunxi/cedrus/cedrus_video.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_video.c b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
> index c589fe9dae70..f3cd452575d4 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_video.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
> @@ -570,7 +570,6 @@ int cedrus_queue_init(void *priv, struct vb2_queue *src_vq,
>         src_vq->io_modes = VB2_MMAP | VB2_DMABUF;
>         src_vq->drv_priv = ctx;
>         src_vq->buf_struct_size = sizeof(struct cedrus_buffer);
> -       src_vq->min_buffers_needed = 1;
>         src_vq->ops = &cedrus_qops;
>         src_vq->mem_ops = &vb2_dma_contig_memops;
>         src_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
> @@ -587,7 +586,6 @@ int cedrus_queue_init(void *priv, struct vb2_queue *src_vq,
>         dst_vq->io_modes = VB2_MMAP | VB2_DMABUF;
>         dst_vq->drv_priv = ctx;
>         dst_vq->buf_struct_size = sizeof(struct cedrus_buffer);
> -       dst_vq->min_buffers_needed = 1;
>         dst_vq->ops = &cedrus_qops;
>         dst_vq->mem_ops = &vb2_dma_contig_memops;
>         dst_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;

-- 
Kindly,
Ezequiel

