Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FA7F327AAB
	for <lists+linux-media@lfdr.de>; Mon,  1 Mar 2021 10:25:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233857AbhCAJYs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Mar 2021 04:24:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233854AbhCAJY2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Mar 2021 04:24:28 -0500
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AB44C061756
        for <linux-media@vger.kernel.org>; Mon,  1 Mar 2021 01:23:48 -0800 (PST)
Received: by mail-ej1-x633.google.com with SMTP id p8so529501ejb.10
        for <linux-media@vger.kernel.org>; Mon, 01 Mar 2021 01:23:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=2dy7/E8HSGfJiqqdxi761X4q+2hMNs1FHArXFkc+7Lk=;
        b=Hvzar0bi8ZtMKWVof9tAX71NYajdUzeaQEycJkNH1QL2OuHhPvk/W9qwEQCgpIAohM
         Gr3o8LEoLnXYUW8+acvNLlOZfQuJQHIHlLEgOFrB8BUDF0HEaeiwfWFagCNIZWYVvqyJ
         +XkhRhxG2VcBA74LtU8QhBcpltTJuZPOxIPA4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=2dy7/E8HSGfJiqqdxi761X4q+2hMNs1FHArXFkc+7Lk=;
        b=OV2Iqrnh4LE/vL4XDTi1bm+/6zsdrtjiuBFv8JPJvKy3kzeaDS2NPCqPXTg0tsB1Hp
         RDNQTK0YjEMXWEONOJOHKdNqAw4ZhH5QmPml407hO545SMZZgonpahJd2j7L+RWt7zIG
         sKWhCKlaXfc2ndl7vuaZOxbBiRubDYG9/X+7ayHTcs61Je2oQzuKc5JOHHIldbkKnpz5
         4yEoivNQu7sUDNlhu6CIA3h/OkPCjo732GCOycS/PPgViaNfdF9ffzFoGkYyIj9XtPc4
         p42DNHkFVXPfv7s5F9X+/AJbuZkp3+U15KBq9mude28n7YG95h5jPJGhNtxNYl9YVrZC
         Xu8Q==
X-Gm-Message-State: AOAM532EHFCp9MwyLdcvL1N3ZJwrVk7gLkNj1CvIPH1bpovsoUZtP5Ye
        ebJbgDTGT5TluNo6CoKsI+/VGGlvZH3aBw==
X-Google-Smtp-Source: ABdhPJxCrzL4cAyB+baAae+kBDrsS8ZbHfCd+uObXbcV88FAUs/MpofWFfb2flQrHMzBSRC7nupXCA==
X-Received: by 2002:a17:906:845b:: with SMTP id e27mr14627429ejy.487.1614590626680;
        Mon, 01 Mar 2021 01:23:46 -0800 (PST)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com. [209.85.221.44])
        by smtp.gmail.com with ESMTPSA id bz20sm13113717ejc.28.2021.03.01.01.23.45
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Mar 2021 01:23:45 -0800 (PST)
Received: by mail-wr1-f44.google.com with SMTP id w11so15285530wrr.10
        for <linux-media@vger.kernel.org>; Mon, 01 Mar 2021 01:23:45 -0800 (PST)
X-Received: by 2002:adf:e412:: with SMTP id g18mr15968814wrm.159.1614590625114;
 Mon, 01 Mar 2021 01:23:45 -0800 (PST)
MIME-Version: 1.0
References: <20201214125703.866998-1-acourbot@chromium.org>
 <5319c101-f4a4-9c99-b15d-4999366f7a63@linaro.org> <CAAFQd5AQ8VHiRYkzkd5ZJBPT5_5WO0tyQrwqBEfnMVKYiTugTA@mail.gmail.com>
 <b5d35bbd-ae50-7a09-9edf-ca23d1a4b168@linaro.org> <bc42c936d7a67609b9dc4212b5a34b0d761676ed.camel@ndufresne.ca>
 <CAAFQd5BQv2vu_FSxJjVZLpgcuFi1WHVem_O-0x-vkG1KZJi0eA@mail.gmail.com>
In-Reply-To: <CAAFQd5BQv2vu_FSxJjVZLpgcuFi1WHVem_O-0x-vkG1KZJi0eA@mail.gmail.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Mon, 1 Mar 2021 18:23:33 +0900
X-Gmail-Original-Message-ID: <CAAFQd5BAT2Xe+_swAe+hMqm_cQVbWJUzkH3dS+8-QHknV=KTjw@mail.gmail.com>
Message-ID: <CAAFQd5BAT2Xe+_swAe+hMqm_cQVbWJUzkH3dS+8-QHknV=KTjw@mail.gmail.com>
Subject: Re: [PATCH] media: venus: use contig vb2 ops
To:     Alexandre Courbot <acourbot@chromium.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     Fritz Koenig <frkoenig@chromium.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Alex, Stanimir,

On Wed, Dec 16, 2020 at 12:15 PM Tomasz Figa <tfiga@chromium.org> wrote:
>
> On Wed, Dec 16, 2020 at 4:21 AM Nicolas Dufresne <nicolas@ndufresne.ca> w=
rote:
> >
> > Le mardi 15 d=C3=A9cembre 2020 =C3=A0 15:54 +0200, Stanimir Varbanov a =
=C3=A9crit :
> > > Hi Tomasz,
> > >
> > > On 12/15/20 1:47 PM, Tomasz Figa wrote:
> > > > On Tue, Dec 15, 2020 at 8:16 PM Stanimir Varbanov
> > > > <stanimir.varbanov@linaro.org> wrote:
> > > > >
> > > > > Hi,
> > > > >
> > > > > Cc: Robin
> > > > >
> > > > > On 12/14/20 2:57 PM, Alexandre Courbot wrote:
> > > > > > This driver uses the SG vb2 ops, but effectively only ever acce=
sses the
> > > > > > first entry of the SG table, indicating that it expects a flat =
layout.
> > > > > > Switch it to use the contiguous ops to make sure this expected =
invariant
> > > > >
> > > > > Under what circumstances the sg table will has nents > 1? I came =
down to
> > > > > [1] but not sure I got it right.
> > > > >
> > > > > I'm afraid that for systems with low amount of system memory and =
when
> > > > > the memory become fragmented, the driver will not work. That's wh=
y I
> > > > > started with sg allocator.
> > > >
> > > > It is exactly the opposite. The vb2-dma-contig allocator is "contig=
"
> > > > in terms of the DMA (aka IOVA) address space. In other words, it
> > > > guarantees that having one DMA address and length fully describes t=
he
> > >
> > > Ahh, I missed that part. Looks like I misunderstood videobu2 contig
> > > allocator.
> >
> > I'm learning everyday too, but I'm surprised I don't see a call to
> > vb2_dma_contig_set_max_seg_size() in this driver (I could also just hav=
e missed
> > a patch when overlooking this thread) ?
> >
> > The reason I'm asking, doc says it should be called by driver supportin=
g IOMMU,
> > which seems to be the case for such drivers (MFC, exynos4-is, exynos-gs=
c, mtk-
> > mdp, s5p-g2d, hantro, rkvdec, zoran, ti-vpe, ..). I posting it, worst c=
ase it's
> > all covered and we are good, otherwise perhaps a downstream patch didn'=
t make it
> > ?
> >
> > /**
> >  * vb2_dma_contig_set_max_seg_size() - configure DMA max segment size
> >  * @dev:        device for configuring DMA parameters
> >  * @size:       size of DMA max segment size to set
> >  *
> >  * To allow mapping the scatter-list into a single chunk in the DMA
> >  * address space, the device is required to have the DMA max segment
> >  * size parameter set to a value larger than the buffer size. Otherwise=
,
> >  * the DMA-mapping subsystem will split the mapping into max segment
> >  * size chunks. This function sets the DMA max segment size
> >  * parameter to let DMA-mapping map a buffer as a single chunk in DMA
> >  * address space.
> >  * This code assumes that the DMA-mapping subsystem will merge all
> >  * scatterlist segments if this is really possible (for example when
> >  * an IOMMU is available and enabled).
> >  * Ideally, this parameter should be set by the generic bus code, but i=
t
> >  * is left with the default 64KiB value due to historical litmiations i=
n
> >  * other subsystems (like limited USB host drivers) and there no good
> >  * place to set it to the proper value.
> >  * This function should be called from the drivers, which are known to
> >  * operate on platforms with IOMMU and provide access to shared buffers
> >  * (either USERPTR or DMABUF). This should be done before initializing
> >  * videobuf2 queue.
> >  */
>
> It does call dma_set_max_seg_size() directly:
> https://elixir.bootlin.com/linux/latest/source/drivers/media/platform/qco=
m/venus/core.c#L230
>
> Actually, why do we even need a vb2 helper for this?
>

What's the plan for this patch?

Best regards,
Tomasz

> >
> > regards,
> > Nicolas
> >
> > >
> > > > buffer. This seems to be the requirement of the hardware/firmware
> > > > handled by the venus driver. If the device is behind an IOMMU, whic=
h
> > > > is the case for the SoCs in question, the underlying DMA ops will
> > > > actually allocate a discontiguous set of pages, so it has nothing t=
o
> > > > do to system memory amount or fragmentation. If for some reason the
> > > > IOMMU can't be used, there is no way around, the memory needs to be
> > > > contiguous because of the hardware/firmware/driver expectation.
> > > >
> > > > On the other hand, the vb2-dma-sg allocator doesn't have any
> > > > continuity guarantees for the DMA, or any other, address space. The
> > > > current code works fine, because it calls dma_map_sg() on the whole
> > > > set of pages and that ends up mapping it contiguously in the IOVA
> > > > space, but that's just an implementation detail, not an API guarant=
ee.
> > >
> > > It was good to know. Thanks for the explanation.
> > >
> > > >
> > > > Best regards,
> > > > Tomasz
> > > >
> > > > >
> > > > > [1]
> > > > > https://elixir.bootlin.com/linux/v5.10.1/source/drivers/iommu/dma=
-iommu.c#L782
> > > > >
> > > > > > is always enforced. Since the device is supposed to be behind a=
n IOMMU
> > > > > > this should have little to none practical consequences beyond m=
aking the
> > > > > > driver not rely on a particular behavior of the SG implementati=
on.
> > > > > >
> > > > > > Reported-by: Tomasz Figa <tfiga@chromium.org>
> > > > > > Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
> > > > > > ---
> > > > > > Hi everyone,
> > > > > >
> > > > > > It probably doesn't hurt to fix this issue before some actual i=
ssue
> > > > > > happens.
> > > > > > I have tested this patch on Chrome OS and playback was just as =
fine as
> > > > > > with
> > > > > > the SG ops.
> > > > > >
> > > > > >  drivers/media/platform/Kconfig              | 2 +-
> > > > > >  drivers/media/platform/qcom/venus/helpers.c | 9 ++-------
> > > > > >  drivers/media/platform/qcom/venus/vdec.c    | 6 +++---
> > > > > >  drivers/media/platform/qcom/venus/venc.c    | 6 +++---
> > > > > >  4 files changed, 9 insertions(+), 14 deletions(-)
> > > > > >
> > > > > > diff --git a/drivers/media/platform/Kconfig
> > > > > > b/drivers/media/platform/Kconfig
> > > > > > index 35a18d388f3f..d9d7954111f2 100644
> > > > > > --- a/drivers/media/platform/Kconfig
> > > > > > +++ b/drivers/media/platform/Kconfig
> > > > > > @@ -533,7 +533,7 @@ config VIDEO_QCOM_VENUS
> > > > > >       depends on INTERCONNECT || !INTERCONNECT
> > > > > >       select QCOM_MDT_LOADER if ARCH_QCOM
> > > > > >       select QCOM_SCM if ARCH_QCOM
> > > > > > -     select VIDEOBUF2_DMA_SG
> > > > > > +     select VIDEOBUF2_DMA_CONTIG
> > > > > >       select V4L2_MEM2MEM_DEV
> > > > > >       help
> > > > > >         This is a V4L2 driver for Qualcomm Venus video accelera=
tor
> > > > > > diff --git a/drivers/media/platform/qcom/venus/helpers.c
> > > > > > b/drivers/media/platform/qcom/venus/helpers.c
> > > > > > index 50439eb1ffea..859d260f002b 100644
> > > > > > --- a/drivers/media/platform/qcom/venus/helpers.c
> > > > > > +++ b/drivers/media/platform/qcom/venus/helpers.c
> > > > > > @@ -7,7 +7,7 @@
> > > > > >  #include <linux/mutex.h>
> > > > > >  #include <linux/slab.h>
> > > > > >  #include <linux/kernel.h>
> > > > > > -#include <media/videobuf2-dma-sg.h>
> > > > > > +#include <media/videobuf2-dma-contig.h>
> > > > > >  #include <media/v4l2-mem2mem.h>
> > > > > >  #include <asm/div64.h>
> > > > > >
> > > > > > @@ -1284,14 +1284,9 @@ int venus_helper_vb2_buf_init(struct vb2=
_buffer
> > > > > > *vb)
> > > > > >       struct venus_inst *inst =3D vb2_get_drv_priv(vb->vb2_queu=
e);
> > > > > >       struct vb2_v4l2_buffer *vbuf =3D to_vb2_v4l2_buffer(vb);
> > > > > >       struct venus_buffer *buf =3D to_venus_buffer(vbuf);
> > > > > > -     struct sg_table *sgt;
> > > > > > -
> > > > > > -     sgt =3D vb2_dma_sg_plane_desc(vb, 0);
> > > > > > -     if (!sgt)
> > > > > > -             return -EFAULT;
> > > > > >
> > > > > >       buf->size =3D vb2_plane_size(vb, 0);
> > > > > > -     buf->dma_addr =3D sg_dma_address(sgt->sgl);
> > > > >
> > > > > Can we do it:
> > > > >
> > > > >         if (WARN_ON(sgt->nents > 1))
> > > > >                 return -EFAULT;
> > > > >
> > > > > I understand that logically using dma-sg when the flat layout is
> > > > > expected by the hardware is wrong, but I haven't seen issues unti=
l now.
> > > > >
> > > > > > +     buf->dma_addr =3D vb2_dma_contig_plane_dma_addr(vb, 0);
> > > > > >
> > > > > >       if (vb->type =3D=3D V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
> > > > > >               list_add_tail(&buf->reg_list, &inst->registeredbu=
fs);
> > > > > > diff --git a/drivers/media/platform/qcom/venus/vdec.c
> > > > > > b/drivers/media/platform/qcom/venus/vdec.c
> > > > > > index 8488411204c3..3fb277c81aca 100644
> > > > > > --- a/drivers/media/platform/qcom/venus/vdec.c
> > > > > > +++ b/drivers/media/platform/qcom/venus/vdec.c
> > > > > > @@ -13,7 +13,7 @@
> > > > > >  #include <media/v4l2-event.h>
> > > > > >  #include <media/v4l2-ctrls.h>
> > > > > >  #include <media/v4l2-mem2mem.h>
> > > > > > -#include <media/videobuf2-dma-sg.h>
> > > > > > +#include <media/videobuf2-dma-contig.h>
> > > > > >
> > > > > >  #include "hfi_venus_io.h"
> > > > > >  #include "hfi_parser.h"
> > > > > > @@ -1461,7 +1461,7 @@ static int m2m_queue_init(void *priv, str=
uct
> > > > > > vb2_queue *src_vq,
> > > > > >       src_vq->io_modes =3D VB2_MMAP | VB2_DMABUF;
> > > > > >       src_vq->timestamp_flags =3D V4L2_BUF_FLAG_TIMESTAMP_COPY;
> > > > > >       src_vq->ops =3D &vdec_vb2_ops;
> > > > > > -     src_vq->mem_ops =3D &vb2_dma_sg_memops;
> > > > > > +     src_vq->mem_ops =3D &vb2_dma_contig_memops;
> > > > > >       src_vq->drv_priv =3D inst;
> > > > > >       src_vq->buf_struct_size =3D sizeof(struct venus_buffer);
> > > > > >       src_vq->allow_zero_bytesused =3D 1;
> > > > > > @@ -1475,7 +1475,7 @@ static int m2m_queue_init(void *priv, str=
uct
> > > > > > vb2_queue *src_vq,
> > > > > >       dst_vq->io_modes =3D VB2_MMAP | VB2_DMABUF;
> > > > > >       dst_vq->timestamp_flags =3D V4L2_BUF_FLAG_TIMESTAMP_COPY;
> > > > > >       dst_vq->ops =3D &vdec_vb2_ops;
> > > > > > -     dst_vq->mem_ops =3D &vb2_dma_sg_memops;
> > > > > > +     dst_vq->mem_ops =3D &vb2_dma_contig_memops;
> > > > > >       dst_vq->drv_priv =3D inst;
> > > > > >       dst_vq->buf_struct_size =3D sizeof(struct venus_buffer);
> > > > > >       dst_vq->allow_zero_bytesused =3D 1;
> > > > > > diff --git a/drivers/media/platform/qcom/venus/venc.c
> > > > > > b/drivers/media/platform/qcom/venus/venc.c
> > > > > > index 1c61602c5de1..a09550cd1dba 100644
> > > > > > --- a/drivers/media/platform/qcom/venus/venc.c
> > > > > > +++ b/drivers/media/platform/qcom/venus/venc.c
> > > > > > @@ -10,7 +10,7 @@
> > > > > >  #include <linux/pm_runtime.h>
> > > > > >  #include <linux/slab.h>
> > > > > >  #include <media/v4l2-mem2mem.h>
> > > > > > -#include <media/videobuf2-dma-sg.h>
> > > > > > +#include <media/videobuf2-dma-contig.h>
> > > > > >  #include <media/v4l2-ioctl.h>
> > > > > >  #include <media/v4l2-event.h>
> > > > > >  #include <media/v4l2-ctrls.h>
> > > > > > @@ -1001,7 +1001,7 @@ static int m2m_queue_init(void *priv, str=
uct
> > > > > > vb2_queue *src_vq,
> > > > > >       src_vq->io_modes =3D VB2_MMAP | VB2_USERPTR | VB2_DMABUF;
> > > > > >       src_vq->timestamp_flags =3D V4L2_BUF_FLAG_TIMESTAMP_COPY;
> > > > > >       src_vq->ops =3D &venc_vb2_ops;
> > > > > > -     src_vq->mem_ops =3D &vb2_dma_sg_memops;
> > > > > > +     src_vq->mem_ops =3D &vb2_dma_contig_memops;
> > > > > >       src_vq->drv_priv =3D inst;
> > > > > >       src_vq->buf_struct_size =3D sizeof(struct venus_buffer);
> > > > > >       src_vq->allow_zero_bytesused =3D 1;
> > > > > > @@ -1017,7 +1017,7 @@ static int m2m_queue_init(void *priv, str=
uct
> > > > > > vb2_queue *src_vq,
> > > > > >       dst_vq->io_modes =3D VB2_MMAP | VB2_USERPTR | VB2_DMABUF;
> > > > > >       dst_vq->timestamp_flags =3D V4L2_BUF_FLAG_TIMESTAMP_COPY;
> > > > > >       dst_vq->ops =3D &venc_vb2_ops;
> > > > > > -     dst_vq->mem_ops =3D &vb2_dma_sg_memops;
> > > > > > +     dst_vq->mem_ops =3D &vb2_dma_contig_memops;
> > > > > >       dst_vq->drv_priv =3D inst;
> > > > > >       dst_vq->buf_struct_size =3D sizeof(struct venus_buffer);
> > > > > >       dst_vq->allow_zero_bytesused =3D 1;
> > > > > >
> > > > >
> > > > > --
> > > > > regards,
> > > > > Stan
> > >
> >
> >
