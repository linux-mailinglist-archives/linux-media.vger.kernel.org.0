Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 51E251678D1
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2020 09:53:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727498AbgBUIxd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 21 Feb 2020 03:53:33 -0500
Received: from mail-ed1-f67.google.com ([209.85.208.67]:36672 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727188AbgBUIxd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 21 Feb 2020 03:53:33 -0500
Received: by mail-ed1-f67.google.com with SMTP id j17so1431674edp.3
        for <linux-media@vger.kernel.org>; Fri, 21 Feb 2020 00:53:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uvctYbL+/0OGuu75ArjF+bihU3mJ92KfMME205AoiCg=;
        b=IWmngd8tHeZQqmRv27Spt/RF17wZYlch2yNvmcqirD97txLOQNwk955b3DJw72NMWI
         8YIoBQ6M2H0/qJqusjdx6khHm/HDsHHaIAh2SeDAOvsztv98yMQ/71jteCHw1dyFJG/0
         Mx64W5C6ZVRZL/6A4bfPcYqqXc1wKgIUFm710=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uvctYbL+/0OGuu75ArjF+bihU3mJ92KfMME205AoiCg=;
        b=LpN5ZpQZNf/QVGMKvLJyAW8+N2JeiZS+R/Bh6NSX3/9+FTXNlH/3AbdhGZenwS1nOm
         Z/EHdRbvsaJnb6ojJrSCFhVGc0yOOG8Red5SWP3ywUpLIYdhcXOwtj1WA0QDzfqgDq4k
         JVXuHw6TeyJoQDeMnOT+ikLpswUD6hkjBQVf8xgvJzkv0ln3KUumcfKXh4sM5JojYFLT
         /jq4HekEyeRWYxN0/LJAuaD+9m2nsKQO1np7YYtfK0ETMUjh7V/1faEHrvziWsno9nzU
         WbCa5e6ANMLzWJfTBJwCw+caLnOHAFhL/YfW2nRTRoPJ1Ucu21pBQxtx7ls+EH+eTMLR
         cNOQ==
X-Gm-Message-State: APjAAAWQd59wQkoGaOt7LT2/S1E397Q9GdjwYwB0q4uu1mZGNH7Hj/tI
        BO4LChR8/mD8nUH4ao0kOx7TE1svfln1Jg==
X-Google-Smtp-Source: APXvYqyoJJjj2UtaJwzsF7uhosqHx3hEMt7QCj0V99zfKf0wwmgjDSwlRQNbA4Xf27/ejLbZ1HwjIA==
X-Received: by 2002:a17:906:9249:: with SMTP id c9mr14936811ejx.0.1582275210417;
        Fri, 21 Feb 2020 00:53:30 -0800 (PST)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com. [209.85.221.51])
        by smtp.gmail.com with ESMTPSA id n10sm151839ejk.67.2020.02.21.00.53.29
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Feb 2020 00:53:29 -0800 (PST)
Received: by mail-wr1-f51.google.com with SMTP id w15so1033792wru.4
        for <linux-media@vger.kernel.org>; Fri, 21 Feb 2020 00:53:29 -0800 (PST)
X-Received: by 2002:adf:aadb:: with SMTP id i27mr49933461wrc.105.1582275208850;
 Fri, 21 Feb 2020 00:53:28 -0800 (PST)
MIME-Version: 1.0
References: <20200221084531.576156-1-hverkuil-cisco@xs4all.nl> <20200221084531.576156-9-hverkuil-cisco@xs4all.nl>
In-Reply-To: <20200221084531.576156-9-hverkuil-cisco@xs4all.nl>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Fri, 21 Feb 2020 17:53:15 +0900
X-Gmail-Original-Message-ID: <CAAFQd5D_=EqagJRx03N-1rGAyLz6AYsScB7bfAWVCSW=mbCRRA@mail.gmail.com>
Message-ID: <CAAFQd5D_=EqagJRx03N-1rGAyLz6AYsScB7bfAWVCSW=mbCRRA@mail.gmail.com>
Subject: Re: [RFC PATCH 8/9] exynos/s3c/s5p: drop VB2_USERPTR
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Sylwester Nawrocki <snawrocki@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Fri, Feb 21, 2020 at 5:46 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>
> The combination of VB2_USERPTR and dma-contig makes no sense for
> these devices, drop it.

Even though I personally don't like user pointers, I believe at least
some of those devices are fine with USERPTR in case they are behind an
IOMMU, like on the newer Exynos SoCs. +Marek Szyprowski too.

What makes you believe it makes no sense for them?

Best regards,
Tomasz

>
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Cc: Sylwester Nawrocki <snawrocki@kernel.org>
> Cc: Tomasz Figa <tfiga@chromium.org>
> ---
>  drivers/media/platform/exynos-gsc/gsc-m2m.c        | 4 ++--
>  drivers/media/platform/exynos4-is/fimc-capture.c   | 2 +-
>  drivers/media/platform/exynos4-is/fimc-isp-video.c | 2 +-
>  drivers/media/platform/exynos4-is/fimc-lite.c      | 2 +-
>  drivers/media/platform/exynos4-is/fimc-m2m.c       | 4 ++--
>  drivers/media/platform/s3c-camif/camif-capture.c   | 2 +-
>  drivers/media/platform/s5p-g2d/g2d.c               | 4 ++--
>  drivers/media/platform/s5p-jpeg/jpeg-core.c        | 4 ++--
>  drivers/media/platform/s5p-mfc/s5p_mfc.c           | 6 ++----
>  9 files changed, 14 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/media/platform/exynos-gsc/gsc-m2m.c b/drivers/media/platform/exynos-gsc/gsc-m2m.c
> index 35a1d0d6dd66..f4b192e49c80 100644
> --- a/drivers/media/platform/exynos-gsc/gsc-m2m.c
> +++ b/drivers/media/platform/exynos-gsc/gsc-m2m.c
> @@ -583,7 +583,7 @@ static int queue_init(void *priv, struct vb2_queue *src_vq,
>
>         memset(src_vq, 0, sizeof(*src_vq));
>         src_vq->type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
> -       src_vq->io_modes = VB2_MMAP | VB2_USERPTR | VB2_DMABUF;
> +       src_vq->io_modes = VB2_MMAP | VB2_DMABUF;
>         src_vq->drv_priv = ctx;
>         src_vq->ops = &gsc_m2m_qops;
>         src_vq->mem_ops = &vb2_dma_contig_memops;
> @@ -598,7 +598,7 @@ static int queue_init(void *priv, struct vb2_queue *src_vq,
>
>         memset(dst_vq, 0, sizeof(*dst_vq));
>         dst_vq->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
> -       dst_vq->io_modes = VB2_MMAP | VB2_USERPTR | VB2_DMABUF;
> +       dst_vq->io_modes = VB2_MMAP | VB2_DMABUF;
>         dst_vq->drv_priv = ctx;
>         dst_vq->ops = &gsc_m2m_qops;
>         dst_vq->mem_ops = &vb2_dma_contig_memops;
> diff --git a/drivers/media/platform/exynos4-is/fimc-capture.c b/drivers/media/platform/exynos4-is/fimc-capture.c
> index 121d609ff856..8d14207b3403 100644
> --- a/drivers/media/platform/exynos4-is/fimc-capture.c
> +++ b/drivers/media/platform/exynos4-is/fimc-capture.c
> @@ -1771,7 +1771,7 @@ static int fimc_register_capture_device(struct fimc_dev *fimc,
>
>         memset(q, 0, sizeof(*q));
>         q->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
> -       q->io_modes = VB2_MMAP | VB2_USERPTR | VB2_DMABUF;
> +       q->io_modes = VB2_MMAP | VB2_DMABUF;
>         q->drv_priv = ctx;
>         q->ops = &fimc_capture_qops;
>         q->mem_ops = &vb2_dma_contig_memops;
> diff --git a/drivers/media/platform/exynos4-is/fimc-isp-video.c b/drivers/media/platform/exynos4-is/fimc-isp-video.c
> index 55bae20eb8db..94f3215916f6 100644
> --- a/drivers/media/platform/exynos4-is/fimc-isp-video.c
> +++ b/drivers/media/platform/exynos4-is/fimc-isp-video.c
> @@ -587,7 +587,7 @@ int fimc_isp_video_device_register(struct fimc_isp *isp,
>
>         memset(q, 0, sizeof(*q));
>         q->type = type;
> -       q->io_modes = VB2_MMAP | VB2_DMABUF | VB2_USERPTR;
> +       q->io_modes = VB2_MMAP | VB2_DMABUF;
>         q->ops = &isp_video_capture_qops;
>         q->mem_ops = &vb2_dma_contig_memops;
>         q->buf_struct_size = sizeof(struct isp_video_buf);
> diff --git a/drivers/media/platform/exynos4-is/fimc-lite.c b/drivers/media/platform/exynos4-is/fimc-lite.c
> index d06bf4865b84..3c2c70b252bb 100644
> --- a/drivers/media/platform/exynos4-is/fimc-lite.c
> +++ b/drivers/media/platform/exynos4-is/fimc-lite.c
> @@ -1276,7 +1276,7 @@ static int fimc_lite_subdev_registered(struct v4l2_subdev *sd)
>
>         memset(q, 0, sizeof(*q));
>         q->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
> -       q->io_modes = VB2_MMAP | VB2_DMABUF | VB2_USERPTR;
> +       q->io_modes = VB2_MMAP | VB2_DMABUF;
>         q->ops = &fimc_lite_qops;
>         q->mem_ops = &vb2_dma_contig_memops;
>         q->buf_struct_size = sizeof(struct flite_buffer);
> diff --git a/drivers/media/platform/exynos4-is/fimc-m2m.c b/drivers/media/platform/exynos4-is/fimc-m2m.c
> index c70c2cbe3eb1..3323563ed913 100644
> --- a/drivers/media/platform/exynos4-is/fimc-m2m.c
> +++ b/drivers/media/platform/exynos4-is/fimc-m2m.c
> @@ -554,7 +554,7 @@ static int queue_init(void *priv, struct vb2_queue *src_vq,
>         int ret;
>
>         src_vq->type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
> -       src_vq->io_modes = VB2_MMAP | VB2_USERPTR | VB2_DMABUF;
> +       src_vq->io_modes = VB2_MMAP | VB2_DMABUF;
>         src_vq->drv_priv = ctx;
>         src_vq->ops = &fimc_qops;
>         src_vq->mem_ops = &vb2_dma_contig_memops;
> @@ -568,7 +568,7 @@ static int queue_init(void *priv, struct vb2_queue *src_vq,
>                 return ret;
>
>         dst_vq->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
> -       dst_vq->io_modes = VB2_MMAP | VB2_USERPTR | VB2_DMABUF;
> +       dst_vq->io_modes = VB2_MMAP | VB2_DMABUF;
>         dst_vq->drv_priv = ctx;
>         dst_vq->ops = &fimc_qops;
>         dst_vq->mem_ops = &vb2_dma_contig_memops;
> diff --git a/drivers/media/platform/s3c-camif/camif-capture.c b/drivers/media/platform/s3c-camif/camif-capture.c
> index 54989dacaf5d..eb99468a5427 100644
> --- a/drivers/media/platform/s3c-camif/camif-capture.c
> +++ b/drivers/media/platform/s3c-camif/camif-capture.c
> @@ -1121,7 +1121,7 @@ int s3c_camif_register_video_node(struct camif_dev *camif, int idx)
>
>         memset(q, 0, sizeof(*q));
>         q->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
> -       q->io_modes = VB2_MMAP | VB2_DMABUF | VB2_USERPTR;
> +       q->io_modes = VB2_MMAP | VB2_DMABUF;
>         q->ops = &s3c_camif_qops;
>         q->mem_ops = &vb2_dma_contig_memops;
>         q->buf_struct_size = sizeof(struct camif_buffer);
> diff --git a/drivers/media/platform/s5p-g2d/g2d.c b/drivers/media/platform/s5p-g2d/g2d.c
> index 98f94e1fa6b8..a8f8c9e00452 100644
> --- a/drivers/media/platform/s5p-g2d/g2d.c
> +++ b/drivers/media/platform/s5p-g2d/g2d.c
> @@ -144,7 +144,7 @@ static int queue_init(void *priv, struct vb2_queue *src_vq,
>         int ret;
>
>         src_vq->type = V4L2_BUF_TYPE_VIDEO_OUTPUT;
> -       src_vq->io_modes = VB2_MMAP | VB2_DMABUF | VB2_USERPTR;
> +       src_vq->io_modes = VB2_MMAP | VB2_DMABUF;
>         src_vq->drv_priv = ctx;
>         src_vq->ops = &g2d_qops;
>         src_vq->mem_ops = &vb2_dma_contig_memops;
> @@ -158,7 +158,7 @@ static int queue_init(void *priv, struct vb2_queue *src_vq,
>                 return ret;
>
>         dst_vq->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
> -       dst_vq->io_modes = VB2_MMAP | VB2_DMABUF | VB2_USERPTR;
> +       dst_vq->io_modes = VB2_MMAP | VB2_DMABUF;
>         dst_vq->drv_priv = ctx;
>         dst_vq->ops = &g2d_qops;
>         dst_vq->mem_ops = &vb2_dma_contig_memops;
> diff --git a/drivers/media/platform/s5p-jpeg/jpeg-core.c b/drivers/media/platform/s5p-jpeg/jpeg-core.c
> index 4c10ec0d7da4..d03164854576 100644
> --- a/drivers/media/platform/s5p-jpeg/jpeg-core.c
> +++ b/drivers/media/platform/s5p-jpeg/jpeg-core.c
> @@ -2620,7 +2620,7 @@ static int queue_init(void *priv, struct vb2_queue *src_vq,
>         int ret;
>
>         src_vq->type = V4L2_BUF_TYPE_VIDEO_OUTPUT;
> -       src_vq->io_modes = VB2_MMAP | VB2_DMABUF | VB2_USERPTR;
> +       src_vq->io_modes = VB2_MMAP | VB2_DMABUF;
>         src_vq->drv_priv = ctx;
>         src_vq->buf_struct_size = sizeof(struct v4l2_m2m_buffer);
>         src_vq->ops = &s5p_jpeg_qops;
> @@ -2634,7 +2634,7 @@ static int queue_init(void *priv, struct vb2_queue *src_vq,
>                 return ret;
>
>         dst_vq->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
> -       dst_vq->io_modes = VB2_MMAP | VB2_DMABUF | VB2_USERPTR;
> +       dst_vq->io_modes = VB2_MMAP | VB2_DMABUF;
>         dst_vq->drv_priv = ctx;
>         dst_vq->buf_struct_size = sizeof(struct v4l2_m2m_buffer);
>         dst_vq->ops = &s5p_jpeg_qops;
> diff --git a/drivers/media/platform/s5p-mfc/s5p_mfc.c b/drivers/media/platform/s5p-mfc/s5p_mfc.c
> index ff770328f690..32df5e26daab 100644
> --- a/drivers/media/platform/s5p-mfc/s5p_mfc.c
> +++ b/drivers/media/platform/s5p-mfc/s5p_mfc.c
> @@ -844,11 +844,10 @@ static int s5p_mfc_open(struct file *file)
>         q->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
>         q->drv_priv = &ctx->fh;
>         q->lock = &dev->mfc_mutex;
> +       q->io_modes = VB2_MMAP | VB2_DMABUF;
>         if (vdev == dev->vfd_dec) {
> -               q->io_modes = VB2_MMAP | VB2_DMABUF;
>                 q->ops = get_dec_queue_ops();
>         } else if (vdev == dev->vfd_enc) {
> -               q->io_modes = VB2_MMAP | VB2_DMABUF | VB2_USERPTR;
>                 q->ops = get_enc_queue_ops();
>         } else {
>                 ret = -ENOENT;
> @@ -871,11 +870,10 @@ static int s5p_mfc_open(struct file *file)
>         q->type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
>         q->drv_priv = &ctx->fh;
>         q->lock = &dev->mfc_mutex;
> +       q->io_modes = VB2_MMAP | VB2_DMABUF;
>         if (vdev == dev->vfd_dec) {
> -               q->io_modes = VB2_MMAP | VB2_DMABUF;
>                 q->ops = get_dec_queue_ops();
>         } else if (vdev == dev->vfd_enc) {
> -               q->io_modes = VB2_MMAP | VB2_DMABUF | VB2_USERPTR;
>                 q->ops = get_enc_queue_ops();
>         } else {
>                 ret = -ENOENT;
> --
> 2.25.0
>
