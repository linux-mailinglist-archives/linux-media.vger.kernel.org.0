Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 899272DA9D8
	for <lists+linux-media@lfdr.de>; Tue, 15 Dec 2020 10:14:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727526AbgLOJDc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Dec 2020 04:03:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727320AbgLOJDS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Dec 2020 04:03:18 -0500
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E942FC06179C
        for <linux-media@vger.kernel.org>; Tue, 15 Dec 2020 01:02:37 -0800 (PST)
Received: by mail-ej1-x644.google.com with SMTP id w1so21884932ejf.11
        for <linux-media@vger.kernel.org>; Tue, 15 Dec 2020 01:02:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/uXVPucjHR3fNKbq750a3yKPPn2iWB1iP3/avDQ0gbk=;
        b=W6Y0rt+9Pmp4l5AMg/qdvmD6BD9OxEqcIpX4G+t9eJ9k9d8H/hrnB4WS6FZM14gtyq
         dDZ71P4jHFA+uFczi6yvXZmpMtdEZtfJHRpYjkIU1X+3fbTe7KZr82CDx2bgii4P/XqN
         tVbhVjOwMcRr8LBAuQxP0YEBsyZd84LWI2ud8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/uXVPucjHR3fNKbq750a3yKPPn2iWB1iP3/avDQ0gbk=;
        b=EKh+aGIaBSRZcT2nq0GHqIARltXgk1ijFLAfPUzBlMG71YAWzOjAenjQjIGTSfpUQB
         3vhqliscgkY6cDp3v3OEdO+nsO5YtIs9OrjTHWmLb2c4LFpgwgVEciDKMIL+KI3rXOls
         GuU+c8cZKgItOenaHQeSm8tdRnIdsubdhU3SZMEJtRRWpci+ydR3BMTiBSrtk5bpmk2W
         /R1+Q5hmxX9qpIhLhofPfCu/Gp+kaFlsOTLizeFb/eexGB+s4xbu6ab6X5UO7dsz7i0B
         opNyz36k7eCmabDHqWTECil+xlv5nAe3fZ1DSnDYzGfy5F7GZRehfezCgT4tvkTWk4k9
         QM3Q==
X-Gm-Message-State: AOAM530cGi3QA8ZUZj5O7HrBk1+EeSZ+5NCqUNdwV7AIHUr1dhj6VW/p
        uLkG23u5myHRu1KRp1kL90Vl176eR+or/A==
X-Google-Smtp-Source: ABdhPJyY2uL4obMNe5YyCXxNdZ90Yp9PFPwVpbji5/NA9pSjodQDJCfI6HWfK1ayQRDbELmrycZeCQ==
X-Received: by 2002:a17:907:4332:: with SMTP id ni2mr4939467ejb.422.1608022956435;
        Tue, 15 Dec 2020 01:02:36 -0800 (PST)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com. [209.85.221.42])
        by smtp.gmail.com with ESMTPSA id x9sm866045ejd.99.2020.12.15.01.02.35
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Dec 2020 01:02:35 -0800 (PST)
Received: by mail-wr1-f42.google.com with SMTP id c5so15391569wrp.6
        for <linux-media@vger.kernel.org>; Tue, 15 Dec 2020 01:02:35 -0800 (PST)
X-Received: by 2002:adf:bb0e:: with SMTP id r14mr33806266wrg.159.1608022954669;
 Tue, 15 Dec 2020 01:02:34 -0800 (PST)
MIME-Version: 1.0
References: <20201214125703.866998-1-acourbot@chromium.org>
In-Reply-To: <20201214125703.866998-1-acourbot@chromium.org>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Tue, 15 Dec 2020 18:02:22 +0900
X-Gmail-Original-Message-ID: <CAAFQd5BSTnVzGHRV1-H-vS-Ez=yC2He=-diaE_yYuBXiT549+A@mail.gmail.com>
Message-ID: <CAAFQd5BSTnVzGHRV1-H-vS-Ez=yC2He=-diaE_yYuBXiT549+A@mail.gmail.com>
Subject: Re: [PATCH] media: venus: use contig vb2 ops
To:     Alexandre Courbot <acourbot@chromium.org>
Cc:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Fritz Koenig <frkoenig@chromium.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Dec 14, 2020 at 9:57 PM Alexandre Courbot <acourbot@chromium.org> wrote:
>
> This driver uses the SG vb2 ops, but effectively only ever accesses the
> first entry of the SG table, indicating that it expects a flat layout.
> Switch it to use the contiguous ops to make sure this expected invariant
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

Reviewed-by: Tomasz Figa <tfiga@chromium.org>

Best regards,
Tomasz

> diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
> index 35a18d388f3f..d9d7954111f2 100644
> --- a/drivers/media/platform/Kconfig
> +++ b/drivers/media/platform/Kconfig
> @@ -533,7 +533,7 @@ config VIDEO_QCOM_VENUS
>         depends on INTERCONNECT || !INTERCONNECT
>         select QCOM_MDT_LOADER if ARCH_QCOM
>         select QCOM_SCM if ARCH_QCOM
> -       select VIDEOBUF2_DMA_SG
> +       select VIDEOBUF2_DMA_CONTIG
>         select V4L2_MEM2MEM_DEV
>         help
>           This is a V4L2 driver for Qualcomm Venus video accelerator
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
>         struct venus_inst *inst = vb2_get_drv_priv(vb->vb2_queue);
>         struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
>         struct venus_buffer *buf = to_venus_buffer(vbuf);
> -       struct sg_table *sgt;
> -
> -       sgt = vb2_dma_sg_plane_desc(vb, 0);
> -       if (!sgt)
> -               return -EFAULT;
>
>         buf->size = vb2_plane_size(vb, 0);
> -       buf->dma_addr = sg_dma_address(sgt->sgl);
> +       buf->dma_addr = vb2_dma_contig_plane_dma_addr(vb, 0);
>
>         if (vb->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
>                 list_add_tail(&buf->reg_list, &inst->registeredbufs);
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
>         src_vq->io_modes = VB2_MMAP | VB2_DMABUF;
>         src_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
>         src_vq->ops = &vdec_vb2_ops;
> -       src_vq->mem_ops = &vb2_dma_sg_memops;
> +       src_vq->mem_ops = &vb2_dma_contig_memops;
>         src_vq->drv_priv = inst;
>         src_vq->buf_struct_size = sizeof(struct venus_buffer);
>         src_vq->allow_zero_bytesused = 1;
> @@ -1475,7 +1475,7 @@ static int m2m_queue_init(void *priv, struct vb2_queue *src_vq,
>         dst_vq->io_modes = VB2_MMAP | VB2_DMABUF;
>         dst_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
>         dst_vq->ops = &vdec_vb2_ops;
> -       dst_vq->mem_ops = &vb2_dma_sg_memops;
> +       dst_vq->mem_ops = &vb2_dma_contig_memops;
>         dst_vq->drv_priv = inst;
>         dst_vq->buf_struct_size = sizeof(struct venus_buffer);
>         dst_vq->allow_zero_bytesused = 1;
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
>         src_vq->io_modes = VB2_MMAP | VB2_USERPTR | VB2_DMABUF;
>         src_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
>         src_vq->ops = &venc_vb2_ops;
> -       src_vq->mem_ops = &vb2_dma_sg_memops;
> +       src_vq->mem_ops = &vb2_dma_contig_memops;
>         src_vq->drv_priv = inst;
>         src_vq->buf_struct_size = sizeof(struct venus_buffer);
>         src_vq->allow_zero_bytesused = 1;
> @@ -1017,7 +1017,7 @@ static int m2m_queue_init(void *priv, struct vb2_queue *src_vq,
>         dst_vq->io_modes = VB2_MMAP | VB2_USERPTR | VB2_DMABUF;
>         dst_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
>         dst_vq->ops = &venc_vb2_ops;
> -       dst_vq->mem_ops = &vb2_dma_sg_memops;
> +       dst_vq->mem_ops = &vb2_dma_contig_memops;
>         dst_vq->drv_priv = inst;
>         dst_vq->buf_struct_size = sizeof(struct venus_buffer);
>         dst_vq->allow_zero_bytesused = 1;
> --
> 2.29.2.684.gfbc64c5ab5-goog
>
