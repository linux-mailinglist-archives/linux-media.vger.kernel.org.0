Return-Path: <linux-media+bounces-13795-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 917169103C1
	for <lists+linux-media@lfdr.de>; Thu, 20 Jun 2024 14:09:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 16D271F22179
	for <lists+linux-media@lfdr.de>; Thu, 20 Jun 2024 12:09:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09EC31ABCBF;
	Thu, 20 Jun 2024 12:08:43 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B7D617B429;
	Thu, 20 Jun 2024 12:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718885322; cv=none; b=MNvQIwcGR/YjxMYvCvGhKeeQRolkVcYS2HkNB3cijy9lWC0lIG/PUmiRNA4MR9iCOGwj8dGywOngyzXLzd0OZjjbOT+7ZwuzKcwPXVW5UaBaDpRe5d9zbuLtuXqKMoXIOVIBPZ5/vdVIKIbBkMFn0P4EZmxM6NpAdI2kri4zc3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718885322; c=relaxed/simple;
	bh=k/hBmGffR/8FG8yAj00B670WBvkrDKB18J3Awx3t6UE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mtup86OJ8kko/+4S/7XF7C/map+OmA+lMSRDE6kzMkl7r1bt1Od5mlacXen/xkUKwve6uPwBrXJ90ldbPihYxrY3wZ2ZxN/NA+nn4+ZjodOBH7luaptNPYpbk+gBtXy1CTOsoLcdgeXpphIV6ZGvtF6zdnifGOZVSS4H6W+AjeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6B2DC2BD10;
	Thu, 20 Jun 2024 12:08:38 +0000 (UTC)
Message-ID: <d9c511e7-cf5b-449a-8116-bead72580b6d@xs4all.nl>
Date: Thu, 20 Jun 2024 14:08:37 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 11/13] staging: media: starfive: Add ISP params video
 device
To: Changhuang Liang <changhuang.liang@starfivetech.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Ming Qian <ming.qian@nxp.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Mingjia Zhang <mingjia.zhang@mediatek.com>, Marvin Lin <milkfafa@gmail.com>
Cc: Jack Zhu <jack.zhu@starfivetech.com>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
References: <20240402100011.13480-1-changhuang.liang@starfivetech.com>
 <20240402100011.13480-12-changhuang.liang@starfivetech.com>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20240402100011.13480-12-changhuang.liang@starfivetech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02/04/2024 12:00, Changhuang Liang wrote:
> Add ISP params video device to write ISP parameters for 3A.
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  drivers/staging/media/starfive/camss/Makefile |   2 +
>  .../staging/media/starfive/camss/stf-camss.c  |  23 +-
>  .../staging/media/starfive/camss/stf-camss.h  |   3 +
>  .../media/starfive/camss/stf-isp-params.c     | 238 ++++++++++++++++++
>  .../staging/media/starfive/camss/stf-isp.h    |   4 +
>  .../staging/media/starfive/camss/stf-output.c |  83 ++++++
>  .../staging/media/starfive/camss/stf-output.h |  22 ++
>  7 files changed, 374 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/staging/media/starfive/camss/stf-isp-params.c
>  create mode 100644 drivers/staging/media/starfive/camss/stf-output.c
>  create mode 100644 drivers/staging/media/starfive/camss/stf-output.h
> 
> diff --git a/drivers/staging/media/starfive/camss/Makefile b/drivers/staging/media/starfive/camss/Makefile
> index 411b45f3fb52..077165cbba7a 100644
> --- a/drivers/staging/media/starfive/camss/Makefile
> +++ b/drivers/staging/media/starfive/camss/Makefile
> @@ -9,6 +9,8 @@ starfive-camss-objs += \
>  		stf-capture.o \
>  		stf-isp.o \
>  		stf-isp-hw-ops.o \
> +		stf-isp-params.o \
> +		stf-output.o \
>  		stf-video.o
>  
>  obj-$(CONFIG_VIDEO_STARFIVE_CAMSS) += starfive-camss.o
> diff --git a/drivers/staging/media/starfive/camss/stf-camss.c b/drivers/staging/media/starfive/camss/stf-camss.c
> index 3fe4e3332719..20eef0daccbe 100644
> --- a/drivers/staging/media/starfive/camss/stf-camss.c
> +++ b/drivers/staging/media/starfive/camss/stf-camss.c
> @@ -127,6 +127,7 @@ static int stfcamss_register_devs(struct stfcamss *stfcamss)
>  {
>  	struct stf_capture *cap_yuv = &stfcamss->captures[STF_CAPTURE_YUV];
>  	struct stf_capture *cap_scd = &stfcamss->captures[STF_CAPTURE_SCD];
> +	struct stf_output *output = &stfcamss->output;
>  	struct stf_isp_dev *isp_dev = &stfcamss->isp_dev;
>  	int ret;
>  
> @@ -137,13 +138,20 @@ static int stfcamss_register_devs(struct stfcamss *stfcamss)
>  		return ret;
>  	}
>  
> -	ret = stf_capture_register(stfcamss, &stfcamss->v4l2_dev);
> +	ret = stf_output_register(stfcamss, &stfcamss->v4l2_dev);
>  	if (ret < 0) {
>  		dev_err(stfcamss->dev,
>  			"failed to register capture: %d\n", ret);
>  		goto err_isp_unregister;
>  	}
>  
> +	ret = stf_capture_register(stfcamss, &stfcamss->v4l2_dev);
> +	if (ret < 0) {
> +		dev_err(stfcamss->dev,
> +			"failed to register capture: %d\n", ret);
> +		goto err_out_unregister;
> +	}
> +
>  	ret = media_create_pad_link(&isp_dev->subdev.entity, STF_ISP_PAD_SRC,
>  				    &cap_yuv->video.vdev.entity, 0, 0);
>  	if (ret)
> @@ -158,13 +166,23 @@ static int stfcamss_register_devs(struct stfcamss *stfcamss)
>  
>  	cap_scd->video.source_subdev = &isp_dev->subdev;
>  
> +	ret = media_create_pad_link(&output->video.vdev.entity, 0,
> +				    &isp_dev->subdev.entity, STF_ISP_PAD_SINK_PARAMS,
> +				    0);
> +	if (ret)
> +		goto err_rm_links1;
> +
>  	return ret;
>  
> +err_rm_links1:
> +	media_entity_remove_links(&cap_scd->video.vdev.entity);
>  err_rm_links0:
>  	media_entity_remove_links(&isp_dev->subdev.entity);
>  	media_entity_remove_links(&cap_yuv->video.vdev.entity);
>  err_cap_unregister:
>  	stf_capture_unregister(stfcamss);
> +err_out_unregister:
> +	stf_output_unregister(stfcamss);
>  err_isp_unregister:
>  	stf_isp_unregister(&stfcamss->isp_dev);
>  
> @@ -175,14 +193,17 @@ static void stfcamss_unregister_devs(struct stfcamss *stfcamss)
>  {
>  	struct stf_capture *cap_yuv = &stfcamss->captures[STF_CAPTURE_YUV];
>  	struct stf_capture *cap_scd = &stfcamss->captures[STF_CAPTURE_SCD];
> +	struct stf_output *output = &stfcamss->output;
>  	struct stf_isp_dev *isp_dev = &stfcamss->isp_dev;
>  
> +	media_entity_remove_links(&output->video.vdev.entity);
>  	media_entity_remove_links(&isp_dev->subdev.entity);
>  	media_entity_remove_links(&cap_yuv->video.vdev.entity);
>  	media_entity_remove_links(&cap_scd->video.vdev.entity);
>  
>  	stf_isp_unregister(&stfcamss->isp_dev);
>  	stf_capture_unregister(stfcamss);
> +	stf_output_unregister(stfcamss);
>  }
>  
>  static int stfcamss_subdev_notifier_bound(struct v4l2_async_notifier *async,
> diff --git a/drivers/staging/media/starfive/camss/stf-camss.h b/drivers/staging/media/starfive/camss/stf-camss.h
> index ae49c7031ab7..3f84f1a1e997 100644
> --- a/drivers/staging/media/starfive/camss/stf-camss.h
> +++ b/drivers/staging/media/starfive/camss/stf-camss.h
> @@ -21,6 +21,7 @@
>  #include "stf-buffer.h"
>  #include "stf-isp.h"
>  #include "stf-capture.h"
> +#include "stf-output.h"
>  
>  enum stf_port_num {
>  	STF_PORT_DVP = 0,
> @@ -55,6 +56,7 @@ struct stfcamss {
>  	struct device *dev;
>  	struct stf_isp_dev isp_dev;
>  	struct stf_capture captures[STF_CAPTURE_NUM];
> +	struct stf_output output;
>  	struct v4l2_async_notifier notifier;
>  	void __iomem *syscon_base;
>  	void __iomem *isp_base;
> @@ -132,4 +134,5 @@ static inline void stf_syscon_reg_clear_bit(struct stfcamss *stfcamss,
>  	value = ioread32(stfcamss->syscon_base + reg);
>  	iowrite32(value & ~bit_mask, stfcamss->syscon_base + reg);
>  }
> +
>  #endif /* STF_CAMSS_H */
> diff --git a/drivers/staging/media/starfive/camss/stf-isp-params.c b/drivers/staging/media/starfive/camss/stf-isp-params.c
> new file mode 100644
> index 000000000000..dbf50f31709e
> --- /dev/null
> +++ b/drivers/staging/media/starfive/camss/stf-isp-params.c
> @@ -0,0 +1,238 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * stf-isp-params.c
> + *
> + * StarFive Camera Subsystem - V4L2 device node
> + *
> + * Copyright (C) 2021-2023 StarFive Technology Co., Ltd.
> + */
> +
> +#include <media/videobuf2-dma-contig.h>
> +
> +#include "stf-camss.h"
> +#include "stf-video.h"
> +
> +static inline struct stfcamss_buffer *
> +to_stfcamss_buffer(struct vb2_v4l2_buffer *vbuf)
> +{
> +	return container_of(vbuf, struct stfcamss_buffer, vb);
> +}
> +
> +static int stf_isp_params_queue_setup(struct vb2_queue *q,
> +				      unsigned int *num_buffers,
> +				      unsigned int *num_planes,
> +				      unsigned int sizes[],
> +				      struct device *alloc_devs[])
> +{

Add:

        if (*nplanes)
                return sizes[0] < sizeof(struct jh7110_isp_params_buffer ? -EINVAL : 0;

> +	*num_planes = 1;
> +	sizes[0] = sizeof(struct jh7110_isp_params_buffer);
> +
> +	return 0;
> +}
> +
> +static int stf_isp_params_buf_init(struct vb2_buffer *vb)
> +{
> +	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
> +	struct stfcamss_buffer *buffer = to_stfcamss_buffer(vbuf);
> +	dma_addr_t *paddr;
> +
> +	paddr = vb2_plane_cookie(vb, 0);
> +	buffer->addr[0] = *paddr;
> +	buffer->vaddr = vb2_plane_vaddr(vb, 0);
> +
> +	return 0;
> +}
> +
> +static int stf_isp_params_buf_prepare(struct vb2_buffer *vb)
> +{
> +	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
> +
> +	if (sizeof(struct jh7110_isp_params_buffer) > vb2_plane_size(vb, 0))
> +		return -EINVAL;
> +
> +	vb2_set_plane_payload(vb, 0, sizeof(struct jh7110_isp_params_buffer));
> +
> +	vbuf->field = V4L2_FIELD_NONE;
> +
> +	return 0;
> +}
> +
> +static void stf_isp_params_buf_queue(struct vb2_buffer *vb)
> +{
> +	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
> +	struct stfcamss_video *video = vb2_get_drv_priv(vb->vb2_queue);
> +	struct stfcamss_buffer *buffer = to_stfcamss_buffer(vbuf);
> +
> +	video->ops->queue_buffer(video, buffer);
> +}
> +
> +static void stf_isp_params_stop_streaming(struct vb2_queue *q)
> +{
> +	struct stfcamss_video *video = vb2_get_drv_priv(q);
> +
> +	video->ops->flush_buffers(video, VB2_BUF_STATE_ERROR);
> +}
> +
> +static const struct vb2_ops stf_isp_params_vb2_q_ops = {
> +	.queue_setup     = stf_isp_params_queue_setup,
> +	.wait_prepare    = vb2_ops_wait_prepare,
> +	.wait_finish     = vb2_ops_wait_finish,
> +	.buf_init        = stf_isp_params_buf_init,
> +	.buf_prepare     = stf_isp_params_buf_prepare,
> +	.buf_queue       = stf_isp_params_buf_queue,
> +	.stop_streaming  = stf_isp_params_stop_streaming,
> +};
> +
> +static int stf_isp_params_init_format(struct stfcamss_video *video)
> +{
> +	video->active_fmt.fmt.meta.dataformat = V4L2_META_FMT_STF_ISP_PARAMS;
> +	video->active_fmt.fmt.meta.buffersize = sizeof(struct jh7110_isp_params_buffer);
> +
> +	return 0;
> +}
> +
> +static int stf_isp_params_querycap(struct file *file, void *fh,
> +				   struct v4l2_capability *cap)
> +{
> +	strscpy(cap->driver, "starfive-camss", sizeof(cap->driver));
> +	strscpy(cap->card, "Starfive Camera Subsystem", sizeof(cap->card));
> +
> +	return 0;
> +}
> +
> +static int stf_isp_params_enum_fmt(struct file *file, void *priv,
> +				   struct v4l2_fmtdesc *f)
> +{
> +	struct stfcamss_video *video = video_drvdata(file);
> +
> +	if (f->index > 0 || f->type != video->type)
> +		return -EINVAL;
> +
> +	f->pixelformat = video->active_fmt.fmt.meta.dataformat;
> +	return 0;
> +}
> +
> +static int stf_isp_params_g_fmt(struct file *file, void *fh, struct v4l2_format *f)
> +{
> +	struct stfcamss_video *video = video_drvdata(file);
> +	struct v4l2_meta_format *meta = &f->fmt.meta;
> +
> +	if (f->type != video->type)
> +		return -EINVAL;
> +
> +	meta->dataformat = video->active_fmt.fmt.meta.dataformat;
> +	meta->buffersize = video->active_fmt.fmt.meta.buffersize;
> +
> +	return 0;
> +}
> +
> +static const struct v4l2_ioctl_ops stf_isp_params_ioctl_ops = {
> +	.vidioc_querycap                = stf_isp_params_querycap,
> +	.vidioc_enum_fmt_meta_out	= stf_isp_params_enum_fmt,
> +	.vidioc_g_fmt_meta_out          = stf_isp_params_g_fmt,
> +	.vidioc_s_fmt_meta_out          = stf_isp_params_g_fmt,
> +	.vidioc_try_fmt_meta_out        = stf_isp_params_g_fmt,
> +	.vidioc_reqbufs                 = vb2_ioctl_reqbufs,
> +	.vidioc_querybuf                = vb2_ioctl_querybuf,
> +	.vidioc_qbuf                    = vb2_ioctl_qbuf,
> +	.vidioc_expbuf                  = vb2_ioctl_expbuf,
> +	.vidioc_dqbuf                   = vb2_ioctl_dqbuf,
> +	.vidioc_create_bufs             = vb2_ioctl_create_bufs,
> +	.vidioc_prepare_buf             = vb2_ioctl_prepare_buf,
> +	.vidioc_streamon                = vb2_ioctl_streamon,
> +	.vidioc_streamoff               = vb2_ioctl_streamoff,
> +};
> +
> +static const struct v4l2_file_operations stf_isp_params_fops = {
> +	.owner          = THIS_MODULE,
> +	.unlocked_ioctl = video_ioctl2,
> +	.open           = v4l2_fh_open,
> +	.release        = vb2_fop_release,
> +	.poll           = vb2_fop_poll,
> +	.mmap           = vb2_fop_mmap,
> +	.read           = vb2_fop_read,

This isn't needed since no read support is indicated in q->io_modes.

Note: I see that this is also set in stf_vid_fops, but it can be dropped
there as well. Please make a separate patch for that change.

> +};
> +
> +static void stf_isp_params_release(struct video_device *vdev)
> +{
> +	struct stfcamss_video *video = video_get_drvdata(vdev);
> +
> +	media_entity_cleanup(&vdev->entity);
> +
> +	mutex_destroy(&video->q_lock);
> +	mutex_destroy(&video->lock);
> +}
> +
> +int stf_isp_params_register(struct stfcamss_video *video,
> +			    struct v4l2_device *v4l2_dev,
> +			    const char *name)
> +{
> +	struct video_device *vdev = &video->vdev;
> +	struct vb2_queue *q;
> +	struct media_pad *pad = &video->pad;
> +	int ret;
> +
> +	mutex_init(&video->q_lock);
> +	mutex_init(&video->lock);
> +
> +	q = &video->vb2_q;
> +	q->drv_priv = video;
> +	q->mem_ops = &vb2_dma_contig_memops;
> +	q->ops = &stf_isp_params_vb2_q_ops;
> +	q->type = video->type;
> +	q->io_modes = VB2_DMABUF | VB2_MMAP;
> +	q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
> +	q->buf_struct_size = sizeof(struct stfcamss_buffer);
> +	q->dev = video->stfcamss->dev;
> +	q->lock = &video->q_lock;
> +	q->min_queued_buffers = STFCAMSS_MIN_BUFFERS;
> +	ret = vb2_queue_init(q);
> +	if (ret < 0) {
> +		dev_err(video->stfcamss->dev,
> +			"Failed to init vb2 queue: %d\n", ret);
> +		goto err_mutex_destroy;
> +	}
> +
> +	pad->flags = MEDIA_PAD_FL_SOURCE;
> +	ret = media_entity_pads_init(&vdev->entity, 1, pad);
> +	if (ret < 0) {
> +		dev_err(video->stfcamss->dev,
> +			"Failed to init video entity: %d\n", ret);
> +		goto err_mutex_destroy;
> +	}
> +
> +	ret = stf_isp_params_init_format(video);
> +	if (ret < 0) {
> +		dev_err(video->stfcamss->dev,
> +			"Failed to init format: %d\n", ret);
> +		goto err_media_cleanup;
> +	}
> +	vdev->ioctl_ops = &stf_isp_params_ioctl_ops;
> +	vdev->device_caps = V4L2_CAP_META_OUTPUT;
> +	vdev->fops = &stf_isp_params_fops;
> +	vdev->device_caps |= V4L2_CAP_STREAMING | V4L2_CAP_IO_MC;
> +	vdev->vfl_dir = VFL_DIR_TX;
> +	vdev->release = stf_isp_params_release;
> +	vdev->v4l2_dev = v4l2_dev;
> +	vdev->queue = &video->vb2_q;
> +	vdev->lock = &video->lock;
> +	strscpy(vdev->name, name, sizeof(vdev->name));
> +
> +	video_set_drvdata(vdev, video);
> +
> +	ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
> +	if (ret < 0) {
> +		dev_err(video->stfcamss->dev,
> +			"Failed to register video device: %d\n", ret);
> +		goto err_media_cleanup;
> +	}
> +
> +	return 0;
> +
> +err_media_cleanup:
> +	media_entity_cleanup(&vdev->entity);
> +err_mutex_destroy:
> +	mutex_destroy(&video->lock);
> +	mutex_destroy(&video->q_lock);
> +	return ret;
> +}
> diff --git a/drivers/staging/media/starfive/camss/stf-isp.h b/drivers/staging/media/starfive/camss/stf-isp.h
> index eca3ba1ade75..76ea943bfe98 100644
> --- a/drivers/staging/media/starfive/camss/stf-isp.h
> +++ b/drivers/staging/media/starfive/camss/stf-isp.h
> @@ -474,4 +474,8 @@ void stf_set_scd_addr(struct stfcamss *stfcamss,
>  		      dma_addr_t yhist_addr, dma_addr_t scd_addr,
>  		      enum stf_isp_type_scd type_scd);
>  
> +int stf_isp_params_register(struct stfcamss_video *video,
> +			    struct v4l2_device *v4l2_dev,
> +			    const char *name);
> +
>  #endif /* STF_ISP_H */
> diff --git a/drivers/staging/media/starfive/camss/stf-output.c b/drivers/staging/media/starfive/camss/stf-output.c
> new file mode 100644
> index 000000000000..8eaf4979cafa
> --- /dev/null
> +++ b/drivers/staging/media/starfive/camss/stf-output.c
> @@ -0,0 +1,83 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * StarFive Camera Subsystem - output device
> + *
> + * Copyright (C) 2023 StarFive Technology Co., Ltd.
> + */
> +
> +#include "stf-camss.h"
> +
> +static inline struct stf_output *to_stf_output(struct stfcamss_video *video)
> +{
> +	return container_of(video, struct stf_output, video);
> +}
> +
> +static int stf_output_queue_buffer(struct stfcamss_video *video,
> +				   struct stfcamss_buffer *buf)
> +{
> +	struct stf_output *output = to_stf_output(video);
> +	struct stf_v_buf *v_bufs = &output->buffers;
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&v_bufs->lock, flags);
> +	stf_buf_add_ready(v_bufs, buf);
> +	spin_unlock_irqrestore(&v_bufs->lock, flags);
> +
> +	return 0;
> +}
> +
> +static int stf_output_flush_buffers(struct stfcamss_video *video,
> +				    enum vb2_buffer_state state)
> +{
> +	struct stf_output *output = to_stf_output(video);
> +	struct stf_v_buf *v_bufs = &output->buffers;
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&v_bufs->lock, flags);
> +	stf_buf_flush(v_bufs, state);
> +	spin_unlock_irqrestore(&v_bufs->lock, flags);
> +
> +	return 0;
> +}
> +
> +static const struct stfcamss_video_ops stf_output_ops = {
> +	.queue_buffer = stf_output_queue_buffer,
> +	.flush_buffers = stf_output_flush_buffers,
> +};
> +
> +static void stf_output_init(struct stfcamss *stfcamss, struct stf_output *out)
> +{
> +	out->buffers.state = STF_OUTPUT_OFF;
> +	out->buffers.buf[0] = NULL;
> +	out->buffers.buf[1] = NULL;
> +	out->buffers.active_buf = 0;
> +	INIT_LIST_HEAD(&out->buffers.pending_bufs);
> +	INIT_LIST_HEAD(&out->buffers.ready_bufs);
> +	spin_lock_init(&out->buffers.lock);
> +
> +	out->video.stfcamss = stfcamss;
> +	out->video.type = V4L2_BUF_TYPE_META_OUTPUT;
> +}
> +
> +void stf_output_unregister(struct stfcamss *stfcamss)
> +{
> +	struct stf_output *output = &stfcamss->output;
> +
> +	if (!video_is_registered(&output->video.vdev))
> +		return;
> +
> +	media_entity_cleanup(&output->video.vdev.entity);
> +	vb2_video_unregister_device(&output->video.vdev);
> +}
> +
> +int stf_output_register(struct stfcamss *stfcamss,
> +			struct v4l2_device *v4l2_dev)
> +{
> +	struct stf_output *output = &stfcamss->output;
> +
> +	output->video.ops = &stf_output_ops;
> +	stf_output_init(stfcamss, output);
> +	stf_isp_params_register(&output->video, v4l2_dev, "output_params");
> +
> +	return 0;
> +}
> diff --git a/drivers/staging/media/starfive/camss/stf-output.h b/drivers/staging/media/starfive/camss/stf-output.h
> new file mode 100644
> index 000000000000..d3591a0b609b
> --- /dev/null
> +++ b/drivers/staging/media/starfive/camss/stf-output.h
> @@ -0,0 +1,22 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Starfive Camera Subsystem driver
> + *
> + * Copyright (C) 2023 StarFive Technology Co., Ltd.
> + */
> +
> +#ifndef STF_OUTPUT_H
> +#define STF_OUTPUT_H
> +
> +#include "stf-video.h"
> +
> +struct stf_output {
> +	struct stfcamss_video video;
> +	struct stf_v_buf buffers;
> +};
> +
> +int stf_output_register(struct stfcamss *stfcamss,
> +			struct v4l2_device *v4l2_dev);
> +void stf_output_unregister(struct stfcamss *stfcamss);
> +
> +#endif

Regards,

	Hans

