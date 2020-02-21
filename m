Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EBADA167CD2
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2020 12:54:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728085AbgBULyc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 21 Feb 2020 06:54:32 -0500
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:53373 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727137AbgBULyb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 21 Feb 2020 06:54:31 -0500
Received: from [IPv6:2001:420:44c1:2577:48a6:6836:cfc5:da53]
 ([IPv6:2001:420:44c1:2577:48a6:6836:cfc5:da53])
        by smtp-cloud9.xs4all.net with ESMTPA
        id 56szjJE77yIme56t2jpZpJ; Fri, 21 Feb 2020 12:54:29 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1582286069; bh=ZHepa8rH5OhpJv03l/O5B2mwn2DwKaHoL+evKFEveH4=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=exPv/IVXatSKvgIe32x5CoSrMdHZwONZd0oH1JpahhMSB4x73TxS8d73yjnJBBFsI
         00BGu/JI9Pz9u2etoDZk58Tt5I9hhRsOwNnLkw+AsmGvU2481ARsXg374+3jzrFiyl
         /m6/lQ2ir7B3yVQxDGgePVmWczL7O1XoNuX2XMrcILHpr97glIhQ2QsThbFdvaeNQx
         4rnQZiMGX9wv0jBHo9IYf2Xq1h38v/drtDL6k4sG57JVKdkJT/AonExFnDXXqYWYmo
         fLmxl2XQv+d3tTY+MO2LmieYI/tJWLB5QO6BIGf4SP1LZDvO+mVHD4Fo1k36oD7uKN
         IZ2QayXU+7I1A==
Subject: Re: [RFC PATCH 8/9] exynos/s3c/s5p: drop VB2_USERPTR
To:     Tomasz Figa <tfiga@chromium.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Sylwester Nawrocki <snawrocki@kernel.org>
References: <20200221084531.576156-1-hverkuil-cisco@xs4all.nl>
 <20200221084531.576156-9-hverkuil-cisco@xs4all.nl>
 <CAAFQd5D_=EqagJRx03N-1rGAyLz6AYsScB7bfAWVCSW=mbCRRA@mail.gmail.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <d6dc1de9-0c4c-4fd5-fe10-34fc57d899b4@xs4all.nl>
Date:   Fri, 21 Feb 2020 12:54:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAAFQd5D_=EqagJRx03N-1rGAyLz6AYsScB7bfAWVCSW=mbCRRA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfES/1SZL+8zWXvtyGj2uSKEblpgU5Ti+WV92Z8JAh/UOQgWzFjgO4U0ctxctLCVbF2vLm7q8l9xTpIMCDX9WmmGlQyWy5i+Hj8V91BKum/hiHQPNdgy0
 OsVh7g1RpygRXFloRa7giISEoMlIaD7WhuV3OlljLbA+6K8CZJMVWbEuoGycQlRVFYJCJWZcVXPxwj/LXRFlm9OleVrh0keILTZiiF1SZ79EquWqzos6Oq+q
 aB0B3fsUpYLpc7VJvfMDyBYFv0WfTVB/68FXNCfAdSwZYI51l2ygGenhwHaBl3cZTI1ZUdYaLlwKEXVSt+TDuv44sn9sJFAZItA/vZYtTnFSv0BhDdcA3P+q
 pXEZxLmFgsMcD0g97TRycsvklcJoCyhQUKpSBtacJJAPm7aT3OM=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 2/21/20 9:53 AM, Tomasz Figa wrote:
> Hi Hans,
> 
> On Fri, Feb 21, 2020 at 5:46 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>>
>> The combination of VB2_USERPTR and dma-contig makes no sense for
>> these devices, drop it.
> 
> Even though I personally don't like user pointers, I believe at least
> some of those devices are fine with USERPTR in case they are behind an
> IOMMU, like on the newer Exynos SoCs. +Marek Szyprowski too.

I would like this to be tested. I always wonder if that has actually
been tested, especially with regards to the partial first and last pages of
the malloc()ed memory. I.e., worst case only 8 bytes may have to be written
to a page if malloc() aligned the pointer poorly. Can the DMA handle that,
even with an IOMMU?

Note that I have the same concern for VB2_USERPTR with dma-sg.

This was a good opportunity to improve v4l2-compliance: it adds sentinels at
the start/end of the buffer, and it checks that those sentinels are never
overwritten. So if this test passes for a driver, then VB2_USERPTR can stay
in, but it should probably have a comment that it has been tested with
v4l2-compliance.

> 
> What makes you believe it makes no sense for them?

Serious doubts that this has been properly tested :-)
You really need a test like I wrote today for v4l2-compliance
in order to be certain that it works.

Regards,

	Hans

> 
> Best regards,
> Tomasz
> 
>>
>> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>> Cc: Sylwester Nawrocki <snawrocki@kernel.org>
>> Cc: Tomasz Figa <tfiga@chromium.org>
>> ---
>>  drivers/media/platform/exynos-gsc/gsc-m2m.c        | 4 ++--
>>  drivers/media/platform/exynos4-is/fimc-capture.c   | 2 +-
>>  drivers/media/platform/exynos4-is/fimc-isp-video.c | 2 +-
>>  drivers/media/platform/exynos4-is/fimc-lite.c      | 2 +-
>>  drivers/media/platform/exynos4-is/fimc-m2m.c       | 4 ++--
>>  drivers/media/platform/s3c-camif/camif-capture.c   | 2 +-
>>  drivers/media/platform/s5p-g2d/g2d.c               | 4 ++--
>>  drivers/media/platform/s5p-jpeg/jpeg-core.c        | 4 ++--
>>  drivers/media/platform/s5p-mfc/s5p_mfc.c           | 6 ++----
>>  9 files changed, 14 insertions(+), 16 deletions(-)
>>
>> diff --git a/drivers/media/platform/exynos-gsc/gsc-m2m.c b/drivers/media/platform/exynos-gsc/gsc-m2m.c
>> index 35a1d0d6dd66..f4b192e49c80 100644
>> --- a/drivers/media/platform/exynos-gsc/gsc-m2m.c
>> +++ b/drivers/media/platform/exynos-gsc/gsc-m2m.c
>> @@ -583,7 +583,7 @@ static int queue_init(void *priv, struct vb2_queue *src_vq,
>>
>>         memset(src_vq, 0, sizeof(*src_vq));
>>         src_vq->type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
>> -       src_vq->io_modes = VB2_MMAP | VB2_USERPTR | VB2_DMABUF;
>> +       src_vq->io_modes = VB2_MMAP | VB2_DMABUF;
>>         src_vq->drv_priv = ctx;
>>         src_vq->ops = &gsc_m2m_qops;
>>         src_vq->mem_ops = &vb2_dma_contig_memops;
>> @@ -598,7 +598,7 @@ static int queue_init(void *priv, struct vb2_queue *src_vq,
>>
>>         memset(dst_vq, 0, sizeof(*dst_vq));
>>         dst_vq->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
>> -       dst_vq->io_modes = VB2_MMAP | VB2_USERPTR | VB2_DMABUF;
>> +       dst_vq->io_modes = VB2_MMAP | VB2_DMABUF;
>>         dst_vq->drv_priv = ctx;
>>         dst_vq->ops = &gsc_m2m_qops;
>>         dst_vq->mem_ops = &vb2_dma_contig_memops;
>> diff --git a/drivers/media/platform/exynos4-is/fimc-capture.c b/drivers/media/platform/exynos4-is/fimc-capture.c
>> index 121d609ff856..8d14207b3403 100644
>> --- a/drivers/media/platform/exynos4-is/fimc-capture.c
>> +++ b/drivers/media/platform/exynos4-is/fimc-capture.c
>> @@ -1771,7 +1771,7 @@ static int fimc_register_capture_device(struct fimc_dev *fimc,
>>
>>         memset(q, 0, sizeof(*q));
>>         q->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
>> -       q->io_modes = VB2_MMAP | VB2_USERPTR | VB2_DMABUF;
>> +       q->io_modes = VB2_MMAP | VB2_DMABUF;
>>         q->drv_priv = ctx;
>>         q->ops = &fimc_capture_qops;
>>         q->mem_ops = &vb2_dma_contig_memops;
>> diff --git a/drivers/media/platform/exynos4-is/fimc-isp-video.c b/drivers/media/platform/exynos4-is/fimc-isp-video.c
>> index 55bae20eb8db..94f3215916f6 100644
>> --- a/drivers/media/platform/exynos4-is/fimc-isp-video.c
>> +++ b/drivers/media/platform/exynos4-is/fimc-isp-video.c
>> @@ -587,7 +587,7 @@ int fimc_isp_video_device_register(struct fimc_isp *isp,
>>
>>         memset(q, 0, sizeof(*q));
>>         q->type = type;
>> -       q->io_modes = VB2_MMAP | VB2_DMABUF | VB2_USERPTR;
>> +       q->io_modes = VB2_MMAP | VB2_DMABUF;
>>         q->ops = &isp_video_capture_qops;
>>         q->mem_ops = &vb2_dma_contig_memops;
>>         q->buf_struct_size = sizeof(struct isp_video_buf);
>> diff --git a/drivers/media/platform/exynos4-is/fimc-lite.c b/drivers/media/platform/exynos4-is/fimc-lite.c
>> index d06bf4865b84..3c2c70b252bb 100644
>> --- a/drivers/media/platform/exynos4-is/fimc-lite.c
>> +++ b/drivers/media/platform/exynos4-is/fimc-lite.c
>> @@ -1276,7 +1276,7 @@ static int fimc_lite_subdev_registered(struct v4l2_subdev *sd)
>>
>>         memset(q, 0, sizeof(*q));
>>         q->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
>> -       q->io_modes = VB2_MMAP | VB2_DMABUF | VB2_USERPTR;
>> +       q->io_modes = VB2_MMAP | VB2_DMABUF;
>>         q->ops = &fimc_lite_qops;
>>         q->mem_ops = &vb2_dma_contig_memops;
>>         q->buf_struct_size = sizeof(struct flite_buffer);
>> diff --git a/drivers/media/platform/exynos4-is/fimc-m2m.c b/drivers/media/platform/exynos4-is/fimc-m2m.c
>> index c70c2cbe3eb1..3323563ed913 100644
>> --- a/drivers/media/platform/exynos4-is/fimc-m2m.c
>> +++ b/drivers/media/platform/exynos4-is/fimc-m2m.c
>> @@ -554,7 +554,7 @@ static int queue_init(void *priv, struct vb2_queue *src_vq,
>>         int ret;
>>
>>         src_vq->type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
>> -       src_vq->io_modes = VB2_MMAP | VB2_USERPTR | VB2_DMABUF;
>> +       src_vq->io_modes = VB2_MMAP | VB2_DMABUF;
>>         src_vq->drv_priv = ctx;
>>         src_vq->ops = &fimc_qops;
>>         src_vq->mem_ops = &vb2_dma_contig_memops;
>> @@ -568,7 +568,7 @@ static int queue_init(void *priv, struct vb2_queue *src_vq,
>>                 return ret;
>>
>>         dst_vq->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
>> -       dst_vq->io_modes = VB2_MMAP | VB2_USERPTR | VB2_DMABUF;
>> +       dst_vq->io_modes = VB2_MMAP | VB2_DMABUF;
>>         dst_vq->drv_priv = ctx;
>>         dst_vq->ops = &fimc_qops;
>>         dst_vq->mem_ops = &vb2_dma_contig_memops;
>> diff --git a/drivers/media/platform/s3c-camif/camif-capture.c b/drivers/media/platform/s3c-camif/camif-capture.c
>> index 54989dacaf5d..eb99468a5427 100644
>> --- a/drivers/media/platform/s3c-camif/camif-capture.c
>> +++ b/drivers/media/platform/s3c-camif/camif-capture.c
>> @@ -1121,7 +1121,7 @@ int s3c_camif_register_video_node(struct camif_dev *camif, int idx)
>>
>>         memset(q, 0, sizeof(*q));
>>         q->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
>> -       q->io_modes = VB2_MMAP | VB2_DMABUF | VB2_USERPTR;
>> +       q->io_modes = VB2_MMAP | VB2_DMABUF;
>>         q->ops = &s3c_camif_qops;
>>         q->mem_ops = &vb2_dma_contig_memops;
>>         q->buf_struct_size = sizeof(struct camif_buffer);
>> diff --git a/drivers/media/platform/s5p-g2d/g2d.c b/drivers/media/platform/s5p-g2d/g2d.c
>> index 98f94e1fa6b8..a8f8c9e00452 100644
>> --- a/drivers/media/platform/s5p-g2d/g2d.c
>> +++ b/drivers/media/platform/s5p-g2d/g2d.c
>> @@ -144,7 +144,7 @@ static int queue_init(void *priv, struct vb2_queue *src_vq,
>>         int ret;
>>
>>         src_vq->type = V4L2_BUF_TYPE_VIDEO_OUTPUT;
>> -       src_vq->io_modes = VB2_MMAP | VB2_DMABUF | VB2_USERPTR;
>> +       src_vq->io_modes = VB2_MMAP | VB2_DMABUF;
>>         src_vq->drv_priv = ctx;
>>         src_vq->ops = &g2d_qops;
>>         src_vq->mem_ops = &vb2_dma_contig_memops;
>> @@ -158,7 +158,7 @@ static int queue_init(void *priv, struct vb2_queue *src_vq,
>>                 return ret;
>>
>>         dst_vq->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
>> -       dst_vq->io_modes = VB2_MMAP | VB2_DMABUF | VB2_USERPTR;
>> +       dst_vq->io_modes = VB2_MMAP | VB2_DMABUF;
>>         dst_vq->drv_priv = ctx;
>>         dst_vq->ops = &g2d_qops;
>>         dst_vq->mem_ops = &vb2_dma_contig_memops;
>> diff --git a/drivers/media/platform/s5p-jpeg/jpeg-core.c b/drivers/media/platform/s5p-jpeg/jpeg-core.c
>> index 4c10ec0d7da4..d03164854576 100644
>> --- a/drivers/media/platform/s5p-jpeg/jpeg-core.c
>> +++ b/drivers/media/platform/s5p-jpeg/jpeg-core.c
>> @@ -2620,7 +2620,7 @@ static int queue_init(void *priv, struct vb2_queue *src_vq,
>>         int ret;
>>
>>         src_vq->type = V4L2_BUF_TYPE_VIDEO_OUTPUT;
>> -       src_vq->io_modes = VB2_MMAP | VB2_DMABUF | VB2_USERPTR;
>> +       src_vq->io_modes = VB2_MMAP | VB2_DMABUF;
>>         src_vq->drv_priv = ctx;
>>         src_vq->buf_struct_size = sizeof(struct v4l2_m2m_buffer);
>>         src_vq->ops = &s5p_jpeg_qops;
>> @@ -2634,7 +2634,7 @@ static int queue_init(void *priv, struct vb2_queue *src_vq,
>>                 return ret;
>>
>>         dst_vq->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
>> -       dst_vq->io_modes = VB2_MMAP | VB2_DMABUF | VB2_USERPTR;
>> +       dst_vq->io_modes = VB2_MMAP | VB2_DMABUF;
>>         dst_vq->drv_priv = ctx;
>>         dst_vq->buf_struct_size = sizeof(struct v4l2_m2m_buffer);
>>         dst_vq->ops = &s5p_jpeg_qops;
>> diff --git a/drivers/media/platform/s5p-mfc/s5p_mfc.c b/drivers/media/platform/s5p-mfc/s5p_mfc.c
>> index ff770328f690..32df5e26daab 100644
>> --- a/drivers/media/platform/s5p-mfc/s5p_mfc.c
>> +++ b/drivers/media/platform/s5p-mfc/s5p_mfc.c
>> @@ -844,11 +844,10 @@ static int s5p_mfc_open(struct file *file)
>>         q->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
>>         q->drv_priv = &ctx->fh;
>>         q->lock = &dev->mfc_mutex;
>> +       q->io_modes = VB2_MMAP | VB2_DMABUF;
>>         if (vdev == dev->vfd_dec) {
>> -               q->io_modes = VB2_MMAP | VB2_DMABUF;
>>                 q->ops = get_dec_queue_ops();
>>         } else if (vdev == dev->vfd_enc) {
>> -               q->io_modes = VB2_MMAP | VB2_DMABUF | VB2_USERPTR;
>>                 q->ops = get_enc_queue_ops();
>>         } else {
>>                 ret = -ENOENT;
>> @@ -871,11 +870,10 @@ static int s5p_mfc_open(struct file *file)
>>         q->type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
>>         q->drv_priv = &ctx->fh;
>>         q->lock = &dev->mfc_mutex;
>> +       q->io_modes = VB2_MMAP | VB2_DMABUF;
>>         if (vdev == dev->vfd_dec) {
>> -               q->io_modes = VB2_MMAP | VB2_DMABUF;
>>                 q->ops = get_dec_queue_ops();
>>         } else if (vdev == dev->vfd_enc) {
>> -               q->io_modes = VB2_MMAP | VB2_DMABUF | VB2_USERPTR;
>>                 q->ops = get_enc_queue_ops();
>>         } else {
>>                 ret = -ENOENT;
>> --
>> 2.25.0
>>

