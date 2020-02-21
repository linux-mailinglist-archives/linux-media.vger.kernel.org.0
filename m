Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5F0FC16773D
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2020 09:41:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730980AbgBUIkj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 21 Feb 2020 03:40:39 -0500
Received: from mail-ed1-f66.google.com ([209.85.208.66]:37535 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730376AbgBUIkh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 21 Feb 2020 03:40:37 -0500
Received: by mail-ed1-f66.google.com with SMTP id t7so1384420edr.4
        for <linux-media@vger.kernel.org>; Fri, 21 Feb 2020 00:40:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mdfYSHre91XAhuL2zlbX4h8h3Yznjyh8n02reURVrpA=;
        b=be1Um1aYGObAz82CSAkzfJq/gweWP9IMyNulCBSpPc+Jd+LDdxvlkvHYfS8CmKwaCY
         5URDh9vE7l0oKCJfqm/Y9Pe97k+hxrK54CEsaIw+fbge89dpXcJOVFIsDwP561mXMaVC
         PDv9j3LisQqnAqvQqOBwPXbqewRAOGGQeUv6I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mdfYSHre91XAhuL2zlbX4h8h3Yznjyh8n02reURVrpA=;
        b=eAkk33kL9KxVvnQUH3TTZcfAV2dNPgQtXeMCyW20LALAzEAcnOtHLyHDHIHmU6slC1
         v9H6pg/dhU1p3Qs8/lrG9mP5qyKFsJXCW0Wbhn7+KAS9+T8OELBfxnbsuKHob98Pyj+d
         K5udElgLSi1LRu9xmS+WCyI9Q8cAb9ty/AoZTU0xcVDes6huOxC8opPWHzlkRu7rr4ku
         3E8SQ29/9yGVKft4utO/ILiA0PVmN2G1+Qq6mbWUwKyRb9taZwo/Fvt2f1+GTP23afO6
         sTdg9gtFMMAp2CfnUb+W1Wld905iNth/srfJ3RRAmkKsJd2fDzYU6Fg3ipN1TdcWTl7P
         I0yw==
X-Gm-Message-State: APjAAAXQEqCwgkVkv3KyCxmeVVIAThxrzHdRcYAEQTxUeNbSXim3tTUz
        +k+4dbQeOmqvHwRqTunGkXsDDAYdFhnqog==
X-Google-Smtp-Source: APXvYqxIHuzdIJzhHmVbITrML7vzQdNAoUU4LXjsLGi3axwjzGmGPTNgbH2GQi94X2VDHfvRLvDhrQ==
X-Received: by 2002:a05:6402:709:: with SMTP id w9mr11999411edx.74.1582274433829;
        Fri, 21 Feb 2020 00:40:33 -0800 (PST)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com. [209.85.221.49])
        by smtp.gmail.com with ESMTPSA id p18sm148089ejg.45.2020.02.21.00.40.32
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Feb 2020 00:40:33 -0800 (PST)
Received: by mail-wr1-f49.google.com with SMTP id u6so1011330wrt.0
        for <linux-media@vger.kernel.org>; Fri, 21 Feb 2020 00:40:32 -0800 (PST)
X-Received: by 2002:adf:c54e:: with SMTP id s14mr45668709wrf.385.1582274431870;
 Fri, 21 Feb 2020 00:40:31 -0800 (PST)
MIME-Version: 1.0
References: <fc26112c-85e6-36a7-f6ab-8b8fb46fbec7@xs4all.nl>
In-Reply-To: <fc26112c-85e6-36a7-f6ab-8b8fb46fbec7@xs4all.nl>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Fri, 21 Feb 2020 17:40:19 +0900
X-Gmail-Original-Message-ID: <CAAFQd5Ctftqa=KsAOZWy59xDujEchRE0bK_XW=VeBk6MmRF9eA@mail.gmail.com>
Message-ID: <CAAFQd5Ctftqa=KsAOZWy59xDujEchRE0bK_XW=VeBk6MmRF9eA@mail.gmail.com>
Subject: Re: [PATCH] media: v4l2: add VB2_DMABUF to all drivers
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Maxime Ripard <mripard@kernel.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Fri, Feb 21, 2020 at 5:26 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>
> There where still several (usually old) vb2-based drivers that did not
> support DMABUF as streaming mode. There is no reason not to support this,
> so add it throughout the media tree.

There is one thing to be wary of. Some of the hardware, like s5p-mfc,
require all the buffers to be registered before streaming. That's not
possible with DMABUF memory type, because the buffers are known only
after respective QBUF calls and also subsequent QBUF calls with the
same buffer index may queue different DMA-bufs. Care must be taken not
to enable DMABUF for such hardware.

Best regards,
Tomasz

>
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---
>  drivers/media/dvb-frontends/rtl2832_sdr.c                 | 2 +-
>  drivers/media/pci/saa7134/saa7134-video.c                 | 2 +-
>  drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c            | 2 +-
>  drivers/media/pci/solo6x10/solo6x10-v4l2.c                | 2 +-
>  drivers/media/pci/sta2x11/sta2x11_vip.c                   | 2 +-
>  drivers/media/platform/exynos4-is/fimc-isp-video.c        | 2 +-
>  drivers/media/platform/exynos4-is/fimc-lite.c             | 2 +-
>  drivers/media/platform/omap3isp/ispvideo.c                | 2 +-
>  drivers/media/platform/s3c-camif/camif-capture.c          | 2 +-
>  drivers/media/platform/s5p-g2d/g2d.c                      | 4 ++--
>  drivers/media/platform/s5p-jpeg/jpeg-core.c               | 4 ++--
>  drivers/media/platform/s5p-mfc/s5p_mfc.c                  | 8 ++++----
>  drivers/media/platform/sh_veu.c                           | 4 ++--
>  drivers/media/platform/sunxi/sun4i-csi/sun4i_dma.c        | 2 +-
>  drivers/media/usb/airspy/airspy.c                         | 2 +-
>  drivers/media/usb/dvb-usb/cxusb-analog.c                  | 4 ++--
>  drivers/media/usb/em28xx/em28xx-video.c                   | 2 +-
>  drivers/media/usb/go7007/go7007-v4l2.c                    | 2 +-
>  drivers/media/usb/msi2500/msi2500.c                       | 2 +-
>  drivers/media/usb/pwc/pwc-if.c                            | 2 +-
>  drivers/media/usb/s2255/s2255drv.c                        | 2 +-
>  drivers/media/usb/usbtv/usbtv-video.c                     | 2 +-
>  drivers/media/usb/uvc/uvc_queue.c                         | 2 +-
>  .../staging/vc04_services/bcm2835-camera/bcm2835-camera.c | 2 +-
>  24 files changed, 31 insertions(+), 31 deletions(-)
>
> diff --git a/drivers/media/dvb-frontends/rtl2832_sdr.c b/drivers/media/dvb-frontends/rtl2832_sdr.c
> index 60d1e59d2292..55ac4b32ea39 100644
> --- a/drivers/media/dvb-frontends/rtl2832_sdr.c
> +++ b/drivers/media/dvb-frontends/rtl2832_sdr.c
> @@ -1359,7 +1359,7 @@ static int rtl2832_sdr_probe(struct platform_device *pdev)
>
>         /* Init videobuf2 queue structure */
>         dev->vb_queue.type = V4L2_BUF_TYPE_SDR_CAPTURE;
> -       dev->vb_queue.io_modes = VB2_MMAP | VB2_USERPTR | VB2_READ;
> +       dev->vb_queue.io_modes = VB2_MMAP | VB2_USERPTR | VB2_READ | VB2_DMABUF;
>         dev->vb_queue.drv_priv = dev;
>         dev->vb_queue.buf_struct_size = sizeof(struct rtl2832_sdr_frame_buf);
>         dev->vb_queue.ops = &rtl2832_sdr_vb2_ops;
> diff --git a/drivers/media/pci/saa7134/saa7134-video.c b/drivers/media/pci/saa7134/saa7134-video.c
> index 342cabf48064..2d3081dbdf83 100644
> --- a/drivers/media/pci/saa7134/saa7134-video.c
> +++ b/drivers/media/pci/saa7134/saa7134-video.c
> @@ -2133,7 +2133,7 @@ int saa7134_video_init1(struct saa7134_dev *dev)
>         q = &dev->vbi_vbq;
>         q->type = V4L2_BUF_TYPE_VBI_CAPTURE;
>         /* Don't add VB2_USERPTR, see comment above */
> -       q->io_modes = VB2_MMAP | VB2_READ;
> +       q->io_modes = VB2_MMAP | VB2_READ | VB2_DMABUF;
>         if (saa7134_userptr)
>                 q->io_modes |= VB2_USERPTR;
>         q->drv_priv = &dev->vbi_q;
> diff --git a/drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c b/drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c
> index 476d7f3b32d6..d3239d86cead 100644
> --- a/drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c
> +++ b/drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c
> @@ -1265,7 +1265,7 @@ static struct solo_enc_dev *solo_enc_alloc(struct solo_dev *solo_dev,
>         solo_enc->motion_global = true;
>         solo_enc->motion_thresh = SOLO_DEF_MOT_THRESH;
>         solo_enc->vidq.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
> -       solo_enc->vidq.io_modes = VB2_MMAP | VB2_USERPTR | VB2_READ;
> +       solo_enc->vidq.io_modes = VB2_MMAP | VB2_USERPTR | VB2_READ | VB2_DMABUF;
>         solo_enc->vidq.ops = &solo_enc_video_qops;
>         solo_enc->vidq.mem_ops = &vb2_dma_sg_memops;
>         solo_enc->vidq.drv_priv = solo_enc;
> diff --git a/drivers/media/pci/solo6x10/solo6x10-v4l2.c b/drivers/media/pci/solo6x10/solo6x10-v4l2.c
> index 78792067e920..9d290099b7a0 100644
> --- a/drivers/media/pci/solo6x10/solo6x10-v4l2.c
> +++ b/drivers/media/pci/solo6x10/solo6x10-v4l2.c
> @@ -667,7 +667,7 @@ int solo_v4l2_init(struct solo_dev *solo_dev, unsigned nr)
>         video_set_drvdata(solo_dev->vfd, solo_dev);
>
>         solo_dev->vidq.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
> -       solo_dev->vidq.io_modes = VB2_MMAP | VB2_USERPTR | VB2_READ;
> +       solo_dev->vidq.io_modes = VB2_MMAP | VB2_USERPTR | VB2_READ | VB2_DMABUF;
>         solo_dev->vidq.ops = &solo_video_qops;
>         solo_dev->vidq.mem_ops = &vb2_dma_contig_memops;
>         solo_dev->vidq.drv_priv = solo_dev;
> diff --git a/drivers/media/pci/sta2x11/sta2x11_vip.c b/drivers/media/pci/sta2x11/sta2x11_vip.c
> index fd3de3bb0c89..b97c13472cb3 100644
> --- a/drivers/media/pci/sta2x11/sta2x11_vip.c
> +++ b/drivers/media/pci/sta2x11/sta2x11_vip.c
> @@ -847,7 +847,7 @@ static int sta2x11_vip_init_buffer(struct sta2x11_vip *vip)
>         }
>         memset(&vip->vb_vidq, 0, sizeof(struct vb2_queue));
>         vip->vb_vidq.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
> -       vip->vb_vidq.io_modes = VB2_MMAP | VB2_READ;
> +       vip->vb_vidq.io_modes = VB2_MMAP | VB2_READ | VB2_DMABUF;
>         vip->vb_vidq.drv_priv = vip;
>         vip->vb_vidq.buf_struct_size = sizeof(struct vip_buffer);
>         vip->vb_vidq.ops = &vip_video_qops;
> diff --git a/drivers/media/platform/exynos4-is/fimc-isp-video.c b/drivers/media/platform/exynos4-is/fimc-isp-video.c
> index d2cbcdca0463..55bae20eb8db 100644
> --- a/drivers/media/platform/exynos4-is/fimc-isp-video.c
> +++ b/drivers/media/platform/exynos4-is/fimc-isp-video.c
> @@ -587,7 +587,7 @@ int fimc_isp_video_device_register(struct fimc_isp *isp,
>
>         memset(q, 0, sizeof(*q));
>         q->type = type;
> -       q->io_modes = VB2_MMAP | VB2_USERPTR;
> +       q->io_modes = VB2_MMAP | VB2_DMABUF | VB2_USERPTR;
>         q->ops = &isp_video_capture_qops;
>         q->mem_ops = &vb2_dma_contig_memops;
>         q->buf_struct_size = sizeof(struct isp_video_buf);
> diff --git a/drivers/media/platform/exynos4-is/fimc-lite.c b/drivers/media/platform/exynos4-is/fimc-lite.c
> index e87c6a09205b..d06bf4865b84 100644
> --- a/drivers/media/platform/exynos4-is/fimc-lite.c
> +++ b/drivers/media/platform/exynos4-is/fimc-lite.c
> @@ -1276,7 +1276,7 @@ static int fimc_lite_subdev_registered(struct v4l2_subdev *sd)
>
>         memset(q, 0, sizeof(*q));
>         q->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
> -       q->io_modes = VB2_MMAP | VB2_USERPTR;
> +       q->io_modes = VB2_MMAP | VB2_DMABUF | VB2_USERPTR;
>         q->ops = &fimc_lite_qops;
>         q->mem_ops = &vb2_dma_contig_memops;
>         q->buf_struct_size = sizeof(struct flite_buffer);
> diff --git a/drivers/media/platform/omap3isp/ispvideo.c b/drivers/media/platform/omap3isp/ispvideo.c
> index ee183c35ff3b..e8c46ff1aeb4 100644
> --- a/drivers/media/platform/omap3isp/ispvideo.c
> +++ b/drivers/media/platform/omap3isp/ispvideo.c
> @@ -1319,7 +1319,7 @@ static int isp_video_open(struct file *file)
>
>         queue = &handle->queue;
>         queue->type = video->type;
> -       queue->io_modes = VB2_MMAP | VB2_USERPTR;
> +       queue->io_modes = VB2_MMAP | VB2_DMABUF | VB2_USERPTR;
>         queue->drv_priv = handle;
>         queue->ops = &isp_video_queue_ops;
>         queue->mem_ops = &vb2_dma_contig_memops;
> diff --git a/drivers/media/platform/s3c-camif/camif-capture.c b/drivers/media/platform/s3c-camif/camif-capture.c
> index 2fb45db8e4ba..54989dacaf5d 100644
> --- a/drivers/media/platform/s3c-camif/camif-capture.c
> +++ b/drivers/media/platform/s3c-camif/camif-capture.c
> @@ -1121,7 +1121,7 @@ int s3c_camif_register_video_node(struct camif_dev *camif, int idx)
>
>         memset(q, 0, sizeof(*q));
>         q->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
> -       q->io_modes = VB2_MMAP | VB2_USERPTR;
> +       q->io_modes = VB2_MMAP | VB2_DMABUF | VB2_USERPTR;
>         q->ops = &s3c_camif_qops;
>         q->mem_ops = &vb2_dma_contig_memops;
>         q->buf_struct_size = sizeof(struct camif_buffer);
> diff --git a/drivers/media/platform/s5p-g2d/g2d.c b/drivers/media/platform/s5p-g2d/g2d.c
> index f5f05ea9f521..98f94e1fa6b8 100644
> --- a/drivers/media/platform/s5p-g2d/g2d.c
> +++ b/drivers/media/platform/s5p-g2d/g2d.c
> @@ -144,7 +144,7 @@ static int queue_init(void *priv, struct vb2_queue *src_vq,
>         int ret;
>
>         src_vq->type = V4L2_BUF_TYPE_VIDEO_OUTPUT;
> -       src_vq->io_modes = VB2_MMAP | VB2_USERPTR;
> +       src_vq->io_modes = VB2_MMAP | VB2_DMABUF | VB2_USERPTR;
>         src_vq->drv_priv = ctx;
>         src_vq->ops = &g2d_qops;
>         src_vq->mem_ops = &vb2_dma_contig_memops;
> @@ -158,7 +158,7 @@ static int queue_init(void *priv, struct vb2_queue *src_vq,
>                 return ret;
>
>         dst_vq->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
> -       dst_vq->io_modes = VB2_MMAP | VB2_USERPTR;
> +       dst_vq->io_modes = VB2_MMAP | VB2_DMABUF | VB2_USERPTR;
>         dst_vq->drv_priv = ctx;
>         dst_vq->ops = &g2d_qops;
>         dst_vq->mem_ops = &vb2_dma_contig_memops;
> diff --git a/drivers/media/platform/s5p-jpeg/jpeg-core.c b/drivers/media/platform/s5p-jpeg/jpeg-core.c
> index ac2162235cef..4c10ec0d7da4 100644
> --- a/drivers/media/platform/s5p-jpeg/jpeg-core.c
> +++ b/drivers/media/platform/s5p-jpeg/jpeg-core.c
> @@ -2620,7 +2620,7 @@ static int queue_init(void *priv, struct vb2_queue *src_vq,
>         int ret;
>
>         src_vq->type = V4L2_BUF_TYPE_VIDEO_OUTPUT;
> -       src_vq->io_modes = VB2_MMAP | VB2_USERPTR;
> +       src_vq->io_modes = VB2_MMAP | VB2_DMABUF | VB2_USERPTR;
>         src_vq->drv_priv = ctx;
>         src_vq->buf_struct_size = sizeof(struct v4l2_m2m_buffer);
>         src_vq->ops = &s5p_jpeg_qops;
> @@ -2634,7 +2634,7 @@ static int queue_init(void *priv, struct vb2_queue *src_vq,
>                 return ret;
>
>         dst_vq->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
> -       dst_vq->io_modes = VB2_MMAP | VB2_USERPTR;
> +       dst_vq->io_modes = VB2_MMAP | VB2_DMABUF | VB2_USERPTR;
>         dst_vq->drv_priv = ctx;
>         dst_vq->buf_struct_size = sizeof(struct v4l2_m2m_buffer);
>         dst_vq->ops = &s5p_jpeg_qops;
> diff --git a/drivers/media/platform/s5p-mfc/s5p_mfc.c b/drivers/media/platform/s5p-mfc/s5p_mfc.c
> index b776f83e395e..ff770328f690 100644
> --- a/drivers/media/platform/s5p-mfc/s5p_mfc.c
> +++ b/drivers/media/platform/s5p-mfc/s5p_mfc.c
> @@ -845,10 +845,10 @@ static int s5p_mfc_open(struct file *file)
>         q->drv_priv = &ctx->fh;
>         q->lock = &dev->mfc_mutex;
>         if (vdev == dev->vfd_dec) {
> -               q->io_modes = VB2_MMAP;
> +               q->io_modes = VB2_MMAP | VB2_DMABUF;
>                 q->ops = get_dec_queue_ops();
>         } else if (vdev == dev->vfd_enc) {
> -               q->io_modes = VB2_MMAP | VB2_USERPTR;
> +               q->io_modes = VB2_MMAP | VB2_DMABUF | VB2_USERPTR;
>                 q->ops = get_enc_queue_ops();
>         } else {
>                 ret = -ENOENT;
> @@ -872,10 +872,10 @@ static int s5p_mfc_open(struct file *file)
>         q->drv_priv = &ctx->fh;
>         q->lock = &dev->mfc_mutex;
>         if (vdev == dev->vfd_dec) {
> -               q->io_modes = VB2_MMAP;
> +               q->io_modes = VB2_MMAP | VB2_DMABUF;
>                 q->ops = get_dec_queue_ops();
>         } else if (vdev == dev->vfd_enc) {
> -               q->io_modes = VB2_MMAP | VB2_USERPTR;
> +               q->io_modes = VB2_MMAP | VB2_DMABUF | VB2_USERPTR;
>                 q->ops = get_enc_queue_ops();
>         } else {
>                 ret = -ENOENT;
> diff --git a/drivers/media/platform/sh_veu.c b/drivers/media/platform/sh_veu.c
> index 2b4c0d9d6928..b95a7e2ede55 100644
> --- a/drivers/media/platform/sh_veu.c
> +++ b/drivers/media/platform/sh_veu.c
> @@ -924,7 +924,7 @@ static int sh_veu_queue_init(void *priv, struct vb2_queue *src_vq,
>
>         memset(src_vq, 0, sizeof(*src_vq));
>         src_vq->type = V4L2_BUF_TYPE_VIDEO_OUTPUT;
> -       src_vq->io_modes = VB2_MMAP | VB2_USERPTR;
> +       src_vq->io_modes = VB2_MMAP | VB2_DMABUF | VB2_USERPTR;
>         src_vq->drv_priv = veu;
>         src_vq->buf_struct_size = sizeof(struct v4l2_m2m_buffer);
>         src_vq->ops = &sh_veu_qops;
> @@ -939,7 +939,7 @@ static int sh_veu_queue_init(void *priv, struct vb2_queue *src_vq,
>
>         memset(dst_vq, 0, sizeof(*dst_vq));
>         dst_vq->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
> -       dst_vq->io_modes = VB2_MMAP | VB2_USERPTR;
> +       dst_vq->io_modes = VB2_MMAP | VB2_DMABUF | VB2_USERPTR;
>         dst_vq->drv_priv = veu;
>         dst_vq->buf_struct_size = sizeof(struct v4l2_m2m_buffer);
>         dst_vq->ops = &sh_veu_qops;
> diff --git a/drivers/media/platform/sunxi/sun4i-csi/sun4i_dma.c b/drivers/media/platform/sunxi/sun4i-csi/sun4i_dma.c
> index 78fa1c535ac6..3278746246aa 100644
> --- a/drivers/media/platform/sunxi/sun4i-csi/sun4i_dma.c
> +++ b/drivers/media/platform/sunxi/sun4i-csi/sun4i_dma.c
> @@ -413,7 +413,7 @@ int sun4i_csi_dma_register(struct sun4i_csi *csi, int irq)
>
>         q->min_buffers_needed = 3;
>         q->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
> -       q->io_modes = VB2_MMAP;
> +       q->io_modes = VB2_MMAP | VB2_DMABUF;
>         q->lock = &csi->lock;
>         q->drv_priv = csi;
>         q->buf_struct_size = sizeof(struct sun4i_csi_buffer);
> diff --git a/drivers/media/usb/airspy/airspy.c b/drivers/media/usb/airspy/airspy.c
> index 751703db06f5..e6ac289d7aa0 100644
> --- a/drivers/media/usb/airspy/airspy.c
> +++ b/drivers/media/usb/airspy/airspy.c
> @@ -999,7 +999,7 @@ static int airspy_probe(struct usb_interface *intf,
>
>         /* Init videobuf2 queue structure */
>         s->vb_queue.type = V4L2_BUF_TYPE_SDR_CAPTURE;
> -       s->vb_queue.io_modes = VB2_MMAP | VB2_USERPTR | VB2_READ;
> +       s->vb_queue.io_modes = VB2_MMAP | VB2_USERPTR | VB2_READ | VB2_DMABUF;
>         s->vb_queue.drv_priv = s;
>         s->vb_queue.buf_struct_size = sizeof(struct airspy_frame_buf);
>         s->vb_queue.ops = &airspy_vb2_ops;
> diff --git a/drivers/media/usb/dvb-usb/cxusb-analog.c b/drivers/media/usb/dvb-usb/cxusb-analog.c
> index 0699f718d052..574094e0cb7d 100644
> --- a/drivers/media/usb/dvb-usb/cxusb-analog.c
> +++ b/drivers/media/usb/dvb-usb/cxusb-analog.c
> @@ -1626,8 +1626,8 @@ static int cxusb_medion_register_analog_video(struct dvb_usb_device *dvbdev)
>         int ret;
>
>         cxdev->videoqueue.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
> -       cxdev->videoqueue.io_modes = VB2_MMAP | VB2_USERPTR | VB2_READ |
> -               VB2_DMABUF;
> +       cxdev->videoqueue.io_modes =
> +               VB2_MMAP | VB2_USERPTR | VB2_READ | VB2_DMABUF;
>         cxdev->videoqueue.ops = &cxdev_video_qops;
>         cxdev->videoqueue.mem_ops = &vb2_vmalloc_memops;
>         cxdev->videoqueue.drv_priv = dvbdev;
> diff --git a/drivers/media/usb/em28xx/em28xx-video.c b/drivers/media/usb/em28xx/em28xx-video.c
> index b0f7390e4b4f..fead98e5cfc3 100644
> --- a/drivers/media/usb/em28xx/em28xx-video.c
> +++ b/drivers/media/usb/em28xx/em28xx-video.c
> @@ -1266,7 +1266,7 @@ static int em28xx_vb2_setup(struct em28xx *dev)
>         /* Setup Videobuf2 for VBI capture */
>         q = &v4l2->vb_vbiq;
>         q->type = V4L2_BUF_TYPE_VBI_CAPTURE;
> -       q->io_modes = VB2_READ | VB2_MMAP | VB2_USERPTR;
> +       q->io_modes = VB2_READ | VB2_MMAP | VB2_USERPTR | VB2_DMABUF;
>         q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
>         q->drv_priv = dev;
>         q->buf_struct_size = sizeof(struct em28xx_buffer);
> diff --git a/drivers/media/usb/go7007/go7007-v4l2.c b/drivers/media/usb/go7007/go7007-v4l2.c
> index 0b3d185f3cb0..da7f7a27da62 100644
> --- a/drivers/media/usb/go7007/go7007-v4l2.c
> +++ b/drivers/media/usb/go7007/go7007-v4l2.c
> @@ -1081,7 +1081,7 @@ int go7007_v4l2_init(struct go7007 *go)
>
>         INIT_LIST_HEAD(&go->vidq_active);
>         go->vidq.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
> -       go->vidq.io_modes = VB2_MMAP | VB2_USERPTR | VB2_READ;
> +       go->vidq.io_modes = VB2_MMAP | VB2_USERPTR | VB2_READ | VB2_DMABUF;
>         go->vidq.ops = &go7007_video_qops;
>         go->vidq.mem_ops = &vb2_vmalloc_memops;
>         go->vidq.drv_priv = go;
> diff --git a/drivers/media/usb/msi2500/msi2500.c b/drivers/media/usb/msi2500/msi2500.c
> index 65be6f140fe8..29f888d449ff 100644
> --- a/drivers/media/usb/msi2500/msi2500.c
> +++ b/drivers/media/usb/msi2500/msi2500.c
> @@ -1196,7 +1196,7 @@ static int msi2500_probe(struct usb_interface *intf,
>
>         /* Init videobuf2 queue structure */
>         dev->vb_queue.type = V4L2_BUF_TYPE_SDR_CAPTURE;
> -       dev->vb_queue.io_modes = VB2_MMAP | VB2_USERPTR | VB2_READ;
> +       dev->vb_queue.io_modes = VB2_MMAP | VB2_USERPTR | VB2_READ | VB2_DMABUF;
>         dev->vb_queue.drv_priv = dev;
>         dev->vb_queue.buf_struct_size = sizeof(struct msi2500_frame_buf);
>         dev->vb_queue.ops = &msi2500_vb2_ops;
> diff --git a/drivers/media/usb/pwc/pwc-if.c b/drivers/media/usb/pwc/pwc-if.c
> index 9b76cf133d52..0a033a5781d5 100644
> --- a/drivers/media/usb/pwc/pwc-if.c
> +++ b/drivers/media/usb/pwc/pwc-if.c
> @@ -1044,7 +1044,7 @@ static int usb_pwc_probe(struct usb_interface *intf, const struct usb_device_id
>
>         /* Init videobuf2 queue structure */
>         pdev->vb_queue.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
> -       pdev->vb_queue.io_modes = VB2_MMAP | VB2_USERPTR | VB2_READ;
> +       pdev->vb_queue.io_modes = VB2_MMAP | VB2_USERPTR | VB2_READ | VB2_DMABUF;
>         pdev->vb_queue.drv_priv = pdev;
>         pdev->vb_queue.buf_struct_size = sizeof(struct pwc_frame_buf);
>         pdev->vb_queue.ops = &pwc_vb_queue_ops;
> diff --git a/drivers/media/usb/s2255/s2255drv.c b/drivers/media/usb/s2255/s2255drv.c
> index 329ec8089592..d4d7555f9c36 100644
> --- a/drivers/media/usb/s2255/s2255drv.c
> +++ b/drivers/media/usb/s2255/s2255drv.c
> @@ -1625,7 +1625,7 @@ static int s2255_probe_v4l(struct s2255_dev *dev)
>                 }
>                 q = &vc->vb_vidq;
>                 q->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
> -               q->io_modes = VB2_MMAP | VB2_READ | VB2_USERPTR;
> +               q->io_modes = VB2_MMAP | VB2_READ | VB2_USERPTR | VB2_DMABUF;
>                 q->drv_priv = vc;
>                 q->lock = &vc->vb_lock;
>                 q->buf_struct_size = sizeof(struct s2255_buffer);
> diff --git a/drivers/media/usb/usbtv/usbtv-video.c b/drivers/media/usb/usbtv/usbtv-video.c
> index 3d9284a09ee5..c0d77e0fc86f 100644
> --- a/drivers/media/usb/usbtv/usbtv-video.c
> +++ b/drivers/media/usb/usbtv/usbtv-video.c
> @@ -888,7 +888,7 @@ int usbtv_video_init(struct usbtv *usbtv)
>
>         /* videobuf2 structure */
>         usbtv->vb2q.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
> -       usbtv->vb2q.io_modes = VB2_MMAP | VB2_USERPTR | VB2_READ;
> +       usbtv->vb2q.io_modes = VB2_MMAP | VB2_USERPTR | VB2_READ | VB2_DMABUF;
>         usbtv->vb2q.drv_priv = usbtv;
>         usbtv->vb2q.buf_struct_size = sizeof(struct usbtv_buf);
>         usbtv->vb2q.ops = &usbtv_vb2_ops;
> diff --git a/drivers/media/usb/uvc/uvc_queue.c b/drivers/media/usb/uvc/uvc_queue.c
> index cd60c6c1749e..a1cc5788da56 100644
> --- a/drivers/media/usb/uvc/uvc_queue.c
> +++ b/drivers/media/usb/uvc/uvc_queue.c
> @@ -222,7 +222,7 @@ int uvc_queue_init(struct uvc_video_queue *queue, enum v4l2_buf_type type,
>         int ret;
>
>         queue->queue.type = type;
> -       queue->queue.io_modes = VB2_MMAP | VB2_USERPTR;
> +       queue->queue.io_modes = VB2_MMAP | VB2_USERPTR | VB2_DMABUF;
>         queue->queue.drv_priv = queue;
>         queue->queue.buf_struct_size = sizeof(struct uvc_buffer);
>         queue->queue.mem_ops = &vb2_vmalloc_memops;
> diff --git a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
> index 1ef31a984741..fe7a8205bfd4 100644
> --- a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
> +++ b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
> @@ -1919,7 +1919,7 @@ static int bcm2835_mmal_probe(struct platform_device *pdev)
>                 q = &dev->capture.vb_vidq;
>                 memset(q, 0, sizeof(*q));
>                 q->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
> -               q->io_modes = VB2_MMAP | VB2_USERPTR | VB2_READ;
> +               q->io_modes = VB2_MMAP | VB2_USERPTR | VB2_READ | VB2_DMABUF;
>                 q->drv_priv = dev;
>                 q->buf_struct_size = sizeof(struct mmal_buffer);
>                 q->ops = &bm2835_mmal_video_qops;
> --
> 2.25.0
>
