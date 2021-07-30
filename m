Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B32053DB8AC
	for <lists+linux-media@lfdr.de>; Fri, 30 Jul 2021 14:35:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238693AbhG3Mfa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Jul 2021 08:35:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238723AbhG3Mfa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Jul 2021 08:35:30 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 680C2C061765;
        Fri, 30 Jul 2021 05:35:25 -0700 (PDT)
Received: from [IPv6:2a02:810a:880:f54:51e7:d967:c146:d0c] (unknown [IPv6:2a02:810a:880:f54:51e7:d967:c146:d0c])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id CC1E11F448A3;
        Fri, 30 Jul 2021 13:35:23 +0100 (BST)
Subject: Re: [PATCH] media: vimc: Add support for contiguous DMA buffers
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Helen Koike <helen.koike@collabora.com>,
        Shuah Khan <skhan@linuxfoundation.org>
References: <20210730001939.30769-1-laurent.pinchart+renesas@ideasonboard.com>
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <40a1fed8-456e-97c5-9aa7-715a4a4c816b@collabora.com>
Date:   Fri, 30 Jul 2021 14:35:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210730001939.30769-1-laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi

On 30.07.21 02:19, Laurent Pinchart wrote:
> The vimc driver is used for testing purpose, and some test use cases
> involve sharing buffers with a consumer device. Consumers often require
> DMA contiguous memory, which vimc doesn't currently support. This leads
> in the best case to usage of bounce buffers, which is very slow, and in
> the worst case in a complete failure.
> 
> Add support for the dma-contig allocator in vimc to support those use
> cases properly. The allocator is selected through a new "allocator"
> module parameter, which defaults to vmalloc.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>   drivers/media/test-drivers/vimc/vimc-capture.c |  9 +++++++--
>   drivers/media/test-drivers/vimc/vimc-common.h  |  2 ++
>   drivers/media/test-drivers/vimc/vimc-core.c    | 10 ++++++++++
>   3 files changed, 19 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/test-drivers/vimc/vimc-capture.c b/drivers/media/test-drivers/vimc/vimc-capture.c
> index 5e9fd902cd37..92b69a6529fb 100644
> --- a/drivers/media/test-drivers/vimc/vimc-capture.c
> +++ b/drivers/media/test-drivers/vimc/vimc-capture.c
> @@ -7,6 +7,7 @@
>   
>   #include <media/v4l2-ioctl.h>
>   #include <media/videobuf2-core.h>
> +#include <media/videobuf2-dma-contig.h>
>   #include <media/videobuf2-vmalloc.h>
>   
>   #include "vimc-common.h"
> @@ -423,14 +424,18 @@ static struct vimc_ent_device *vimc_cap_add(struct vimc_device *vimc,
>   	/* Initialize the vb2 queue */
>   	q = &vcap->queue;
>   	q->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
> -	q->io_modes = VB2_MMAP | VB2_DMABUF | VB2_USERPTR;
> +	q->io_modes = VB2_MMAP | VB2_DMABUF;

maybe to be on the safe side VB2_DMABUF should be set only if vimc_allocator==1 ?

> +	if (vimc_allocator != 1)

maybe define a macro instead of `1` ?

> +		q->io_modes |= VB2_USERPTR;
>   	q->drv_priv = vcap;
>   	q->buf_struct_size = sizeof(struct vimc_cap_buffer);
>   	q->ops = &vimc_cap_qops;
> -	q->mem_ops = &vb2_vmalloc_memops;
> +	q->mem_ops = vimc_allocator == 1
> +		   ? &vb2_dma_contig_memops : &vb2_vmalloc_memops;
>   	q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
>   	q->min_buffers_needed = 2;
>   	q->lock = &vcap->lock;
> +	q->dev = v4l2_dev->dev;
>   
>   	ret = vb2_queue_init(q);
>   	if (ret) {
> diff --git a/drivers/media/test-drivers/vimc/vimc-common.h b/drivers/media/test-drivers/vimc/vimc-common.h
> index a289434e75ba..b77939123501 100644
> --- a/drivers/media/test-drivers/vimc/vimc-common.h
> +++ b/drivers/media/test-drivers/vimc/vimc-common.h
> @@ -35,6 +35,8 @@
>   
>   #define VIMC_PIX_FMT_MAX_CODES 8
>   
> +extern unsigned int vimc_allocator;
> +
>   /**
>    * vimc_colorimetry_clamp - Adjust colorimetry parameters
>    *
> diff --git a/drivers/media/test-drivers/vimc/vimc-core.c b/drivers/media/test-drivers/vimc/vimc-core.c
> index 4b0ae6f51d76..7badcecb7aed 100644
> --- a/drivers/media/test-drivers/vimc/vimc-core.c
> +++ b/drivers/media/test-drivers/vimc/vimc-core.c
> @@ -5,6 +5,7 @@
>    * Copyright (C) 2015-2017 Helen Koike <helen.fornazier@gmail.com>
>    */
>   
> +#include <linux/dma-mapping.h>
>   #include <linux/font.h>
>   #include <linux/init.h>
>   #include <linux/module.h>
> @@ -15,6 +16,12 @@
>   
>   #include "vimc-common.h"
>   
> +unsigned int vimc_allocator;
> +module_param_named(allocator, vimc_allocator, uint, 0444);
> +MODULE_PARM_DESC(allocator, " memory allocator selection, default is 0.\n"
> +			     "\t\t    0 == vmalloc\n"
> +			     "\t\t    1 == dma-contig");
> +

There is a section 'Module options' in vimc.rst. So a doc should be added there.

Thanks,
Dafna

>   #define VIMC_MDEV_MODEL_NAME "VIMC MDEV"
>   
>   #define VIMC_ENT_LINK(src, srcpad, sink, sinkpad, link_flags) {	\
> @@ -278,6 +285,9 @@ static int vimc_probe(struct platform_device *pdev)
>   
>   	tpg_set_font(font->data);
>   
> +	if (vimc_allocator == 1)
> +		dma_coerce_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
> +
>   	vimc = kzalloc(sizeof(*vimc), GFP_KERNEL);
>   	if (!vimc)
>   		return -ENOMEM;
> 
