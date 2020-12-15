Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F1652DB46C
	for <lists+linux-media@lfdr.de>; Tue, 15 Dec 2020 20:23:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731903AbgLOTWk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Dec 2020 14:22:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729453AbgLOTWc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Dec 2020 14:22:32 -0500
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com [IPv6:2607:f8b0:4864:20::742])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08FD9C0617A6
        for <linux-media@vger.kernel.org>; Tue, 15 Dec 2020 11:21:52 -0800 (PST)
Received: by mail-qk1-x742.google.com with SMTP id 186so20284844qkj.3
        for <linux-media@vger.kernel.org>; Tue, 15 Dec 2020 11:21:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=jVFwMMQ6DKs7XfDfHBL54ryc0drSH1XuLSwFgllEzFk=;
        b=gwGflH/bRbNg9bfRJPwgIerK4m2SnJXQN6M9Rt9hgfg5E2Tc5Sl3tb/jAHmLeO6Vws
         md2nJXWa8HjTp88IvMCY+CDp1frGOB15dwZjGkiLeAqkCnT5/2LgtdV+ktApgHfQp4jX
         LoplF7W9Sp9ZDAc4oR64TZ7ApRAYGmbK5tmHdEu2sX+c9806EfFpIS6Q5rgMhp3BtyQq
         X6eXZjKf5z9HOraU43WXGNkTC08I7228YqmofgOMcxLT+qAUAr6majb4bg/8t98lMvhs
         8eMz5zC64SMrIWbFa+tSqAmysMprOeot8Tovbxx0eOCLVnXvBBWUh6olVLDB91f7PsSg
         xFYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=jVFwMMQ6DKs7XfDfHBL54ryc0drSH1XuLSwFgllEzFk=;
        b=i+V4fbLvaPq0cl65mswW8iHpTccPBL/otwGH5LAKWx8B6jknRAUAjCueh5oAl1Ak51
         78wVixw+rywPpYfz+vRJBWNb8DFobQ0CxYIsVfa/HXvNXMG6f0AMAdKHyiJ44kigHWee
         EsLH0W7jwPWne0NnxXukcl44oUctYjQMI2m6eiG6/72ZzylpNvaAPx5La/Iv7lt30AcK
         thvghuv1AA6CPmFbtQUba6LzmoHs8DCDPExIGhxQyk9oK0p4lPdRujD2hlE7FupD3UAZ
         tj1YpO7XqfXNg6v4J0YF/CmYs5egjk5PUyDOlrffR9fI1YPG9kgbm+qdU+aHNS9IITk0
         fFKw==
X-Gm-Message-State: AOAM531vboobLZnqEHyngv2KAdA4MxT8SLpzcBokr7zVKR5fX24qssj5
        1eH/OpHexbq5xiq2DrqDh5YXQA==
X-Google-Smtp-Source: ABdhPJzuaQviOWifzB4vFVrYl1zvqzYv7mEFODLs+IvzB209ZG3dmolQvghfExxbffgQCGTPFDQUxA==
X-Received: by 2002:a05:620a:69c:: with SMTP id f28mr10622571qkh.127.1608060111025;
        Tue, 15 Dec 2020 11:21:51 -0800 (PST)
Received: from nicolas-tpx395.lan (173-246-12-168.qc.cable.ebox.net. [173.246.12.168])
        by smtp.gmail.com with ESMTPSA id l20sm19454994qtu.25.2020.12.15.11.21.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Dec 2020 11:21:50 -0800 (PST)
Message-ID: <bc42c936d7a67609b9dc4212b5a34b0d761676ed.camel@ndufresne.ca>
Subject: Re: [PATCH] media: venus: use contig vb2 ops
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Tomasz Figa <tfiga@chromium.org>
Cc:     Alexandre Courbot <acourbot@chromium.org>,
        Fritz Koenig <frkoenig@chromium.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Robin Murphy <robin.murphy@arm.com>
Date:   Tue, 15 Dec 2020 14:21:48 -0500
In-Reply-To: <b5d35bbd-ae50-7a09-9edf-ca23d1a4b168@linaro.org>
References: <20201214125703.866998-1-acourbot@chromium.org>
         <5319c101-f4a4-9c99-b15d-4999366f7a63@linaro.org>
         <CAAFQd5AQ8VHiRYkzkd5ZJBPT5_5WO0tyQrwqBEfnMVKYiTugTA@mail.gmail.com>
         <b5d35bbd-ae50-7a09-9edf-ca23d1a4b168@linaro.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.1 (3.38.1-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le mardi 15 décembre 2020 à 15:54 +0200, Stanimir Varbanov a écrit :
> Hi Tomasz,
> 
> On 12/15/20 1:47 PM, Tomasz Figa wrote:
> > On Tue, Dec 15, 2020 at 8:16 PM Stanimir Varbanov
> > <stanimir.varbanov@linaro.org> wrote:
> > > 
> > > Hi,
> > > 
> > > Cc: Robin
> > > 
> > > On 12/14/20 2:57 PM, Alexandre Courbot wrote:
> > > > This driver uses the SG vb2 ops, but effectively only ever accesses the
> > > > first entry of the SG table, indicating that it expects a flat layout.
> > > > Switch it to use the contiguous ops to make sure this expected invariant
> > > 
> > > Under what circumstances the sg table will has nents > 1? I came down to
> > > [1] but not sure I got it right.
> > > 
> > > I'm afraid that for systems with low amount of system memory and when
> > > the memory become fragmented, the driver will not work. That's why I
> > > started with sg allocator.
> > 
> > It is exactly the opposite. The vb2-dma-contig allocator is "contig"
> > in terms of the DMA (aka IOVA) address space. In other words, it
> > guarantees that having one DMA address and length fully describes the
> 
> Ahh, I missed that part. Looks like I misunderstood videobu2 contig
> allocator.

I'm learning everyday too, but I'm surprised I don't see a call to
vb2_dma_contig_set_max_seg_size() in this driver (I could also just have missed
a patch when overlooking this thread) ?

The reason I'm asking, doc says it should be called by driver supporting IOMMU,
which seems to be the case for such drivers (MFC, exynos4-is, exynos-gsc, mtk-
mdp, s5p-g2d, hantro, rkvdec, zoran, ti-vpe, ..). I posting it, worst case it's
all covered and we are good, otherwise perhaps a downstream patch didn't make it
?

/**
 * vb2_dma_contig_set_max_seg_size() - configure DMA max segment size
 * @dev:        device for configuring DMA parameters
 * @size:       size of DMA max segment size to set
 *
 * To allow mapping the scatter-list into a single chunk in the DMA
 * address space, the device is required to have the DMA max segment
 * size parameter set to a value larger than the buffer size. Otherwise,
 * the DMA-mapping subsystem will split the mapping into max segment
 * size chunks. This function sets the DMA max segment size
 * parameter to let DMA-mapping map a buffer as a single chunk in DMA
 * address space.
 * This code assumes that the DMA-mapping subsystem will merge all
 * scatterlist segments if this is really possible (for example when
 * an IOMMU is available and enabled).
 * Ideally, this parameter should be set by the generic bus code, but it
 * is left with the default 64KiB value due to historical litmiations in
 * other subsystems (like limited USB host drivers) and there no good
 * place to set it to the proper value.
 * This function should be called from the drivers, which are known to
 * operate on platforms with IOMMU and provide access to shared buffers
 * (either USERPTR or DMABUF). This should be done before initializing
 * videobuf2 queue.
 */

regards,
Nicolas

> 
> > buffer. This seems to be the requirement of the hardware/firmware
> > handled by the venus driver. If the device is behind an IOMMU, which
> > is the case for the SoCs in question, the underlying DMA ops will
> > actually allocate a discontiguous set of pages, so it has nothing to
> > do to system memory amount or fragmentation. If for some reason the
> > IOMMU can't be used, there is no way around, the memory needs to be
> > contiguous because of the hardware/firmware/driver expectation.
> > 
> > On the other hand, the vb2-dma-sg allocator doesn't have any
> > continuity guarantees for the DMA, or any other, address space. The
> > current code works fine, because it calls dma_map_sg() on the whole
> > set of pages and that ends up mapping it contiguously in the IOVA
> > space, but that's just an implementation detail, not an API guarantee.
> 
> It was good to know. Thanks for the explanation.
> 
> > 
> > Best regards,
> > Tomasz
> > 
> > > 
> > > [1]
> > > https://elixir.bootlin.com/linux/v5.10.1/source/drivers/iommu/dma-iommu.c#L782
> > > 
> > > > is always enforced. Since the device is supposed to be behind an IOMMU
> > > > this should have little to none practical consequences beyond making the
> > > > driver not rely on a particular behavior of the SG implementation.
> > > > 
> > > > Reported-by: Tomasz Figa <tfiga@chromium.org>
> > > > Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
> > > > ---
> > > > Hi everyone,
> > > > 
> > > > It probably doesn't hurt to fix this issue before some actual issue
> > > > happens.
> > > > I have tested this patch on Chrome OS and playback was just as fine as
> > > > with
> > > > the SG ops.
> > > > 
> > > >  drivers/media/platform/Kconfig              | 2 +-
> > > >  drivers/media/platform/qcom/venus/helpers.c | 9 ++-------
> > > >  drivers/media/platform/qcom/venus/vdec.c    | 6 +++---
> > > >  drivers/media/platform/qcom/venus/venc.c    | 6 +++---
> > > >  4 files changed, 9 insertions(+), 14 deletions(-)
> > > > 
> > > > diff --git a/drivers/media/platform/Kconfig
> > > > b/drivers/media/platform/Kconfig
> > > > index 35a18d388f3f..d9d7954111f2 100644
> > > > --- a/drivers/media/platform/Kconfig
> > > > +++ b/drivers/media/platform/Kconfig
> > > > @@ -533,7 +533,7 @@ config VIDEO_QCOM_VENUS
> > > >       depends on INTERCONNECT || !INTERCONNECT
> > > >       select QCOM_MDT_LOADER if ARCH_QCOM
> > > >       select QCOM_SCM if ARCH_QCOM
> > > > -     select VIDEOBUF2_DMA_SG
> > > > +     select VIDEOBUF2_DMA_CONTIG
> > > >       select V4L2_MEM2MEM_DEV
> > > >       help
> > > >         This is a V4L2 driver for Qualcomm Venus video accelerator
> > > > diff --git a/drivers/media/platform/qcom/venus/helpers.c
> > > > b/drivers/media/platform/qcom/venus/helpers.c
> > > > index 50439eb1ffea..859d260f002b 100644
> > > > --- a/drivers/media/platform/qcom/venus/helpers.c
> > > > +++ b/drivers/media/platform/qcom/venus/helpers.c
> > > > @@ -7,7 +7,7 @@
> > > >  #include <linux/mutex.h>
> > > >  #include <linux/slab.h>
> > > >  #include <linux/kernel.h>
> > > > -#include <media/videobuf2-dma-sg.h>
> > > > +#include <media/videobuf2-dma-contig.h>
> > > >  #include <media/v4l2-mem2mem.h>
> > > >  #include <asm/div64.h>
> > > > 
> > > > @@ -1284,14 +1284,9 @@ int venus_helper_vb2_buf_init(struct vb2_buffer
> > > > *vb)
> > > >       struct venus_inst *inst = vb2_get_drv_priv(vb->vb2_queue);
> > > >       struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
> > > >       struct venus_buffer *buf = to_venus_buffer(vbuf);
> > > > -     struct sg_table *sgt;
> > > > -
> > > > -     sgt = vb2_dma_sg_plane_desc(vb, 0);
> > > > -     if (!sgt)
> > > > -             return -EFAULT;
> > > > 
> > > >       buf->size = vb2_plane_size(vb, 0);
> > > > -     buf->dma_addr = sg_dma_address(sgt->sgl);
> > > 
> > > Can we do it:
> > > 
> > >         if (WARN_ON(sgt->nents > 1))
> > >                 return -EFAULT;
> > > 
> > > I understand that logically using dma-sg when the flat layout is
> > > expected by the hardware is wrong, but I haven't seen issues until now.
> > > 
> > > > +     buf->dma_addr = vb2_dma_contig_plane_dma_addr(vb, 0);
> > > > 
> > > >       if (vb->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
> > > >               list_add_tail(&buf->reg_list, &inst->registeredbufs);
> > > > diff --git a/drivers/media/platform/qcom/venus/vdec.c
> > > > b/drivers/media/platform/qcom/venus/vdec.c
> > > > index 8488411204c3..3fb277c81aca 100644
> > > > --- a/drivers/media/platform/qcom/venus/vdec.c
> > > > +++ b/drivers/media/platform/qcom/venus/vdec.c
> > > > @@ -13,7 +13,7 @@
> > > >  #include <media/v4l2-event.h>
> > > >  #include <media/v4l2-ctrls.h>
> > > >  #include <media/v4l2-mem2mem.h>
> > > > -#include <media/videobuf2-dma-sg.h>
> > > > +#include <media/videobuf2-dma-contig.h>
> > > > 
> > > >  #include "hfi_venus_io.h"
> > > >  #include "hfi_parser.h"
> > > > @@ -1461,7 +1461,7 @@ static int m2m_queue_init(void *priv, struct
> > > > vb2_queue *src_vq,
> > > >       src_vq->io_modes = VB2_MMAP | VB2_DMABUF;
> > > >       src_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
> > > >       src_vq->ops = &vdec_vb2_ops;
> > > > -     src_vq->mem_ops = &vb2_dma_sg_memops;
> > > > +     src_vq->mem_ops = &vb2_dma_contig_memops;
> > > >       src_vq->drv_priv = inst;
> > > >       src_vq->buf_struct_size = sizeof(struct venus_buffer);
> > > >       src_vq->allow_zero_bytesused = 1;
> > > > @@ -1475,7 +1475,7 @@ static int m2m_queue_init(void *priv, struct
> > > > vb2_queue *src_vq,
> > > >       dst_vq->io_modes = VB2_MMAP | VB2_DMABUF;
> > > >       dst_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
> > > >       dst_vq->ops = &vdec_vb2_ops;
> > > > -     dst_vq->mem_ops = &vb2_dma_sg_memops;
> > > > +     dst_vq->mem_ops = &vb2_dma_contig_memops;
> > > >       dst_vq->drv_priv = inst;
> > > >       dst_vq->buf_struct_size = sizeof(struct venus_buffer);
> > > >       dst_vq->allow_zero_bytesused = 1;
> > > > diff --git a/drivers/media/platform/qcom/venus/venc.c
> > > > b/drivers/media/platform/qcom/venus/venc.c
> > > > index 1c61602c5de1..a09550cd1dba 100644
> > > > --- a/drivers/media/platform/qcom/venus/venc.c
> > > > +++ b/drivers/media/platform/qcom/venus/venc.c
> > > > @@ -10,7 +10,7 @@
> > > >  #include <linux/pm_runtime.h>
> > > >  #include <linux/slab.h>
> > > >  #include <media/v4l2-mem2mem.h>
> > > > -#include <media/videobuf2-dma-sg.h>
> > > > +#include <media/videobuf2-dma-contig.h>
> > > >  #include <media/v4l2-ioctl.h>
> > > >  #include <media/v4l2-event.h>
> > > >  #include <media/v4l2-ctrls.h>
> > > > @@ -1001,7 +1001,7 @@ static int m2m_queue_init(void *priv, struct
> > > > vb2_queue *src_vq,
> > > >       src_vq->io_modes = VB2_MMAP | VB2_USERPTR | VB2_DMABUF;
> > > >       src_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
> > > >       src_vq->ops = &venc_vb2_ops;
> > > > -     src_vq->mem_ops = &vb2_dma_sg_memops;
> > > > +     src_vq->mem_ops = &vb2_dma_contig_memops;
> > > >       src_vq->drv_priv = inst;
> > > >       src_vq->buf_struct_size = sizeof(struct venus_buffer);
> > > >       src_vq->allow_zero_bytesused = 1;
> > > > @@ -1017,7 +1017,7 @@ static int m2m_queue_init(void *priv, struct
> > > > vb2_queue *src_vq,
> > > >       dst_vq->io_modes = VB2_MMAP | VB2_USERPTR | VB2_DMABUF;
> > > >       dst_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
> > > >       dst_vq->ops = &venc_vb2_ops;
> > > > -     dst_vq->mem_ops = &vb2_dma_sg_memops;
> > > > +     dst_vq->mem_ops = &vb2_dma_contig_memops;
> > > >       dst_vq->drv_priv = inst;
> > > >       dst_vq->buf_struct_size = sizeof(struct venus_buffer);
> > > >       dst_vq->allow_zero_bytesused = 1;
> > > > 
> > > 
> > > --
> > > regards,
> > > Stan
> 


