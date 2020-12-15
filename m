Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DBD782DABBB
	for <lists+linux-media@lfdr.de>; Tue, 15 Dec 2020 12:19:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728560AbgLOLRd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Dec 2020 06:17:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727167AbgLOLRc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Dec 2020 06:17:32 -0500
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82C93C06179C
        for <linux-media@vger.kernel.org>; Tue, 15 Dec 2020 03:16:51 -0800 (PST)
Received: by mail-ed1-x541.google.com with SMTP id r5so20550484eda.12
        for <linux-media@vger.kernel.org>; Tue, 15 Dec 2020 03:16:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=9bNzWa77clAXXw3WuHzQU/iKItvBAyb0MCpe4O/Qk0w=;
        b=wYmNDrjnN8OS/Im9x5G/shkodwQ55HU+2LzJjuAayUdo89qcLVBlgvxbLzLTdGrspq
         /Rl13LsRzs3HbOBoRgbB4du25rf02G5QDuzwDu6awR9rNGgV6iX2KAiYiHF65ayEXvXz
         ZL8WGqKs6hUt5xmpO7j5RUFDl3OQJ9qvVRt0EDZu65k87erReZ8oBgoP1FFrjgwnylB/
         6gQdJvdCCWH2KsCGYtqAvh8prid2PmiEGe7EC4RJIvFBiRW1TVb+8qJj4t8XS2TnjDnh
         tV0zD4+9OcBIhO5p7+aqn2lnfu+LBS6ebJpjb5rJnArhu3ulLRXiK3i+aIiDr9Pbvypb
         n94g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=9bNzWa77clAXXw3WuHzQU/iKItvBAyb0MCpe4O/Qk0w=;
        b=YaEVUG5gYs7Nt8NqaoQ120ambb/KofFqF+IPONQDPTbt3Pedwc9r+gQlaQTAjsUzGL
         bT9pfrBNADI267Gbn306KO3F5sD/qsDJV5HMwiWiiJQ9fqEPopQfLXPWLdZu5uy4w5Hr
         667XlH2ZQ+4HPh5EkSpQFlkhMT9vxFm4hD3Y/TEZyCS1Ptfv0u3VLCfXVKejOyacQsTI
         +vLtW7AA5Q9H5GIie+M8waU12hOig/RFqF0Rt5YtagQaOrK0NsQtYJTjAaibRe/hMZSu
         jBzMrNNGfOoacc5iXKgZ9f7rBibDDwwCG9jCl47MyjSqJ59LIAWXHsGmkSWgS2trPyNl
         vG0Q==
X-Gm-Message-State: AOAM5313DGpQFzPXHcx66WNZcrLKZddpTpPAdnE5bVfu14mj+nzzDN8X
        PMTr/svxGygMvSI7pMf3Qfj91Q==
X-Google-Smtp-Source: ABdhPJxVDdyAXqKbiJLC27uMRO9Y5S+YBQQgqGrjIcYHWvctTA3M47GV9OLU0mdpmVKsk0oCHG2PGA==
X-Received: by 2002:aa7:dc5a:: with SMTP id g26mr29132901edu.35.1608031010204;
        Tue, 15 Dec 2020 03:16:50 -0800 (PST)
Received: from [192.168.0.3] (hst-221-86.medicom.bg. [84.238.221.86])
        by smtp.googlemail.com with ESMTPSA id pv24sm1110392ejb.101.2020.12.15.03.16.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Dec 2020 03:16:49 -0800 (PST)
Subject: Re: [PATCH] media: venus: use contig vb2 ops
To:     Alexandre Courbot <acourbot@chromium.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Fritz Koenig <frkoenig@chromium.org>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>
References: <20201214125703.866998-1-acourbot@chromium.org>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <5319c101-f4a4-9c99-b15d-4999366f7a63@linaro.org>
Date:   Tue, 15 Dec 2020 13:16:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201214125703.866998-1-acourbot@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

Cc: Robin

On 12/14/20 2:57 PM, Alexandre Courbot wrote:
> This driver uses the SG vb2 ops, but effectively only ever accesses the
> first entry of the SG table, indicating that it expects a flat layout.
> Switch it to use the contiguous ops to make sure this expected invariant

Under what circumstances the sg table will has nents > 1? I came down to
[1] but not sure I got it right.

I'm afraid that for systems with low amount of system memory and when
the memory become fragmented, the driver will not work. That's why I
started with sg allocator.

[1]
https://elixir.bootlin.com/linux/v5.10.1/source/drivers/iommu/dma-iommu.c#L782

> is always enforced. Since the device is supposed to be behind an IOMMU
> this should have little to none practical consequences beyond making the
> driver not rely on a particular behavior of the SG implementation.
> 
> Reported-by: Tomasz Figa <tfiga@chromium.org>
> Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
> ---
> Hi everyone,
> 
> It probably doesn't hurt to fix this issue before some actual issue happens.
> I have tested this patch on Chrome OS and playback was just as fine as with
> the SG ops.
> 
>  drivers/media/platform/Kconfig              | 2 +-
>  drivers/media/platform/qcom/venus/helpers.c | 9 ++-------
>  drivers/media/platform/qcom/venus/vdec.c    | 6 +++---
>  drivers/media/platform/qcom/venus/venc.c    | 6 +++---
>  4 files changed, 9 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
> index 35a18d388f3f..d9d7954111f2 100644
> --- a/drivers/media/platform/Kconfig
> +++ b/drivers/media/platform/Kconfig
> @@ -533,7 +533,7 @@ config VIDEO_QCOM_VENUS
>  	depends on INTERCONNECT || !INTERCONNECT
>  	select QCOM_MDT_LOADER if ARCH_QCOM
>  	select QCOM_SCM if ARCH_QCOM
> -	select VIDEOBUF2_DMA_SG
> +	select VIDEOBUF2_DMA_CONTIG
>  	select V4L2_MEM2MEM_DEV
>  	help
>  	  This is a V4L2 driver for Qualcomm Venus video accelerator
> diff --git a/drivers/media/platform/qcom/venus/helpers.c b/drivers/media/platform/qcom/venus/helpers.c
> index 50439eb1ffea..859d260f002b 100644
> --- a/drivers/media/platform/qcom/venus/helpers.c
> +++ b/drivers/media/platform/qcom/venus/helpers.c
> @@ -7,7 +7,7 @@
>  #include <linux/mutex.h>
>  #include <linux/slab.h>
>  #include <linux/kernel.h>
> -#include <media/videobuf2-dma-sg.h>
> +#include <media/videobuf2-dma-contig.h>
>  #include <media/v4l2-mem2mem.h>
>  #include <asm/div64.h>
>  
> @@ -1284,14 +1284,9 @@ int venus_helper_vb2_buf_init(struct vb2_buffer *vb)
>  	struct venus_inst *inst = vb2_get_drv_priv(vb->vb2_queue);
>  	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
>  	struct venus_buffer *buf = to_venus_buffer(vbuf);
> -	struct sg_table *sgt;
> -
> -	sgt = vb2_dma_sg_plane_desc(vb, 0);
> -	if (!sgt)
> -		return -EFAULT;
>  
>  	buf->size = vb2_plane_size(vb, 0);
> -	buf->dma_addr = sg_dma_address(sgt->sgl);

Can we do it:

	if (WARN_ON(sgt->nents > 1))
		return -EFAULT;

I understand that logically using dma-sg when the flat layout is
expected by the hardware is wrong, but I haven't seen issues until now.

> +	buf->dma_addr = vb2_dma_contig_plane_dma_addr(vb, 0);
>  
>  	if (vb->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
>  		list_add_tail(&buf->reg_list, &inst->registeredbufs);
> diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
> index 8488411204c3..3fb277c81aca 100644
> --- a/drivers/media/platform/qcom/venus/vdec.c
> +++ b/drivers/media/platform/qcom/venus/vdec.c
> @@ -13,7 +13,7 @@
>  #include <media/v4l2-event.h>
>  #include <media/v4l2-ctrls.h>
>  #include <media/v4l2-mem2mem.h>
> -#include <media/videobuf2-dma-sg.h>
> +#include <media/videobuf2-dma-contig.h>
>  
>  #include "hfi_venus_io.h"
>  #include "hfi_parser.h"
> @@ -1461,7 +1461,7 @@ static int m2m_queue_init(void *priv, struct vb2_queue *src_vq,
>  	src_vq->io_modes = VB2_MMAP | VB2_DMABUF;
>  	src_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
>  	src_vq->ops = &vdec_vb2_ops;
> -	src_vq->mem_ops = &vb2_dma_sg_memops;
> +	src_vq->mem_ops = &vb2_dma_contig_memops;
>  	src_vq->drv_priv = inst;
>  	src_vq->buf_struct_size = sizeof(struct venus_buffer);
>  	src_vq->allow_zero_bytesused = 1;
> @@ -1475,7 +1475,7 @@ static int m2m_queue_init(void *priv, struct vb2_queue *src_vq,
>  	dst_vq->io_modes = VB2_MMAP | VB2_DMABUF;
>  	dst_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
>  	dst_vq->ops = &vdec_vb2_ops;
> -	dst_vq->mem_ops = &vb2_dma_sg_memops;
> +	dst_vq->mem_ops = &vb2_dma_contig_memops;
>  	dst_vq->drv_priv = inst;
>  	dst_vq->buf_struct_size = sizeof(struct venus_buffer);
>  	dst_vq->allow_zero_bytesused = 1;
> diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
> index 1c61602c5de1..a09550cd1dba 100644
> --- a/drivers/media/platform/qcom/venus/venc.c
> +++ b/drivers/media/platform/qcom/venus/venc.c
> @@ -10,7 +10,7 @@
>  #include <linux/pm_runtime.h>
>  #include <linux/slab.h>
>  #include <media/v4l2-mem2mem.h>
> -#include <media/videobuf2-dma-sg.h>
> +#include <media/videobuf2-dma-contig.h>
>  #include <media/v4l2-ioctl.h>
>  #include <media/v4l2-event.h>
>  #include <media/v4l2-ctrls.h>
> @@ -1001,7 +1001,7 @@ static int m2m_queue_init(void *priv, struct vb2_queue *src_vq,
>  	src_vq->io_modes = VB2_MMAP | VB2_USERPTR | VB2_DMABUF;
>  	src_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
>  	src_vq->ops = &venc_vb2_ops;
> -	src_vq->mem_ops = &vb2_dma_sg_memops;
> +	src_vq->mem_ops = &vb2_dma_contig_memops;
>  	src_vq->drv_priv = inst;
>  	src_vq->buf_struct_size = sizeof(struct venus_buffer);
>  	src_vq->allow_zero_bytesused = 1;
> @@ -1017,7 +1017,7 @@ static int m2m_queue_init(void *priv, struct vb2_queue *src_vq,
>  	dst_vq->io_modes = VB2_MMAP | VB2_USERPTR | VB2_DMABUF;
>  	dst_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
>  	dst_vq->ops = &venc_vb2_ops;
> -	dst_vq->mem_ops = &vb2_dma_sg_memops;
> +	dst_vq->mem_ops = &vb2_dma_contig_memops;
>  	dst_vq->drv_priv = inst;
>  	dst_vq->buf_struct_size = sizeof(struct venus_buffer);
>  	dst_vq->allow_zero_bytesused = 1;
> 

-- 
regards,
Stan
