Return-Path: <linux-media+bounces-14853-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7887592D24B
	for <lists+linux-media@lfdr.de>; Wed, 10 Jul 2024 15:07:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2E2C2288D08
	for <lists+linux-media@lfdr.de>; Wed, 10 Jul 2024 13:07:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9349D19247B;
	Wed, 10 Jul 2024 13:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="PQ7PlYhl"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80E2E19246C;
	Wed, 10 Jul 2024 13:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720616840; cv=none; b=jWYmKsWJarrQ7bwV56egFsfO6NmJr6PDa0pm9Vr1tNQ9gnaFKHN3MGVwMJCW3vXnmaZoEmhQPPu7s9hD0HZDMCUogdxBPM9mC2jSO2hktjLe7XDVC4Bqkl7UWBhQSZQe8o1G6og5FBoI7zfwl+TIqtfNHNiKMnB+TejABVWHsMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720616840; c=relaxed/simple;
	bh=PQUx0I7MGHuyxPAlOVfpjTcKELjmVcJvI9KKtgifZs0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IUFeqOyhriQ2O8/v34TZX3je3N6OBx8nkUycft3olgfqrN1KBZHeku8QgXQcY1rHxlS8PkA1y1ejRu4Xpr5O6JB96hSDQh8FucYRQgnZUIhuKJD5lEl4MqLf8O5E9/sxwSdZwIC83ks7GWqxM4MYdEQZG5VXMdtRsUweAl8mnTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=PQ7PlYhl; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (unknown [IPv6:2001:b07:5d2e:52c9:72c3:346:a663:c82d])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C84D47E2;
	Wed, 10 Jul 2024 15:06:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1720616802;
	bh=PQUx0I7MGHuyxPAlOVfpjTcKELjmVcJvI9KKtgifZs0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PQ7PlYhlEkyaY15kd0AlDnemluWzvJQ5/OGVQ0qU4Jsk5UpKxYYcrD6FrG0cO6xji
	 2USp0L+2fq/oFB3Uegv+xzSz5lbNYw1q4PmNoB8VgdKM9t8jG8xMbpTIZ2qmQ+08Eq
	 O7QCclHsL1JigOpMtJi6wRzsiV/r2FbdgUbrYeU4=
Date: Wed, 10 Jul 2024 15:07:12 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Changhuang Liang <changhuang.liang@starfivetech.com>, 
	Hans Verkuil <hverkuil@xs4all.nl>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>, Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, Mingjia Zhang <mingjia.zhang@mediatek.com>, 
	Jack Zhu <jack.zhu@starfivetech.com>, Keith Zhao <keith.zhao@starfivetech.com>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v5 11/14] staging: media: starfive: Add ISP params video
 device
Message-ID: <kjrkmnmtw5rij6clxgtcfi525xydhy3njrp7vbjxs2wqjwvv72@3dertnkvlyie>
References: <20240709083824.430473-1-changhuang.liang@starfivetech.com>
 <20240709083824.430473-12-changhuang.liang@starfivetech.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240709083824.430473-12-changhuang.liang@starfivetech.com>

Hi Changhuang

   + Hans for one question on the vb2 queue mem_ops to use.

On Tue, Jul 09, 2024 at 01:38:21AM GMT, Changhuang Liang wrote:
> Add ISP params video device to write ISP parameters for 3A.
>
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  drivers/staging/media/starfive/camss/Makefile |   2 +
>  .../staging/media/starfive/camss/stf-camss.c  |  23 +-
>  .../staging/media/starfive/camss/stf-camss.h  |   3 +
>  .../media/starfive/camss/stf-isp-params.c     | 240 ++++++++++++++++++
>  .../staging/media/starfive/camss/stf-isp.h    |   4 +
>  .../staging/media/starfive/camss/stf-output.c |  83 ++++++
>  .../staging/media/starfive/camss/stf-output.h |  22 ++
>  7 files changed, 376 insertions(+), 1 deletion(-)
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

so now you have

stf-capture.c and stf-output.c

that define the entry point for the isp driver to register video nodes
and initialize the type-specific operations.

They call into:

stf-video.c (and now) into stf-params.c

to initialize the vb2 queue and register the video devices.

stf-video.c handles RAW, YUV and STAT nodes
stf-params.c handles PARAMS

I'm not asking you to change this, but most drivers have a single file
for -params, -stats and -video where they handle both the vb2 queue,
the video device registration.

Seeing however that stf-output is only 83 lines I wonder if it
shouldn't be collapsed into stf-isp-params.c

You're now a v5 already, this is an invasive change, but I guess it's
something that could be post-poned to when the driver will be
de-staged

>  		stf-video.o
>
>  obj-$(CONFIG_VIDEO_STARFIVE_CAMSS) += starfive-camss.o
> diff --git a/drivers/staging/media/starfive/camss/stf-camss.c b/drivers/staging/media/starfive/camss/stf-camss.c
> index fafa3ce2f6da..4b2288c3199c 100644
> --- a/drivers/staging/media/starfive/camss/stf-camss.c
> +++ b/drivers/staging/media/starfive/camss/stf-camss.c
> @@ -128,6 +128,7 @@ static int stfcamss_register_devs(struct stfcamss *stfcamss)
>  {
>  	struct stf_capture *cap_yuv = &stfcamss->captures[STF_CAPTURE_YUV];
>  	struct stf_capture *cap_scd = &stfcamss->captures[STF_CAPTURE_SCD];
> +	struct stf_output *output = &stfcamss->output;
>  	struct stf_isp_dev *isp_dev = &stfcamss->isp_dev;
>  	int ret;
>
> @@ -138,13 +139,20 @@ static int stfcamss_register_devs(struct stfcamss *stfcamss)
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
> @@ -159,13 +167,23 @@ static int stfcamss_register_devs(struct stfcamss *stfcamss)
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

or err_rm_link_scd

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
> @@ -176,14 +194,17 @@ static void stfcamss_unregister_devs(struct stfcamss *stfcamss)
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

not necessary

>  #endif /* STF_CAMSS_H */
> diff --git a/drivers/staging/media/starfive/camss/stf-isp-params.c b/drivers/staging/media/starfive/camss/stf-isp-params.c
> new file mode 100644
> index 000000000000..e015857815f0
> --- /dev/null
> +++ b/drivers/staging/media/starfive/camss/stf-isp-params.c
> @@ -0,0 +1,240 @@
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
> +	if (*num_planes)
> +		return sizes[0] < sizeof(struct jh7110_isp_params_buffer) ? -EINVAL : 0;
> +
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

same question as for the stat

> +	buffer->addr[0] = *paddr;
> +	buffer->vaddr = vb2_plane_vaddr(vb, 0);
> +
> +	return 0;
> +}

You could as well (unless something's related to cookies I don't
understand) get the vaddr() of the buffer at the time it gets used and
drop _buf_init() completely

> +
> +static int stf_isp_params_buf_prepare(struct vb2_buffer *vb)
> +{
> +	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
> +
> +	if (sizeof(struct jh7110_isp_params_buffer) > vb2_plane_size(vb, 0))
> +		return -EINVAL;
> +
> +	vb2_set_plane_payload(vb, 0, sizeof(struct jh7110_isp_params_buffer));

This shouldn't be done by the kernel on OUTPUT queues, but you should
make sure that the payload set by userspace has the correct size
(which is sizeof(struct jh7110_isp_params_buffer)). I think you can
also drop the check for vb2_plane_size() as the buffer size is set at
queue_setup().

> +
> +	vbuf->field = V4L2_FIELD_NONE;

Also this is not necessary I guess
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

You can really do that here and drop the -output.c file

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

There's not need to store this in the active_fmt. params.c can use
V4L2_META_FMT_STF_ISP_PARAMS and sizeof(struct
jh7110_isp_params_buffer) directly in enum_fmt and g_fmt.

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

are two mutexes required for the vb2 queue and the video node ? I see,
in example, rkisp1-params.c uses a single one

> +
> +	q = &video->vb2_q;
> +	q->drv_priv = video;
> +	q->mem_ops = &vb2_dma_contig_memops;

Now, I might be wrong, but unless you need to allocate memory from a
DMA-capable area, you shouldn't need to use vb2_dma_contig_memops.

Looking at the next patches you apply configuration parameters to the
ISP by inspecting the user supplied parameters one by one, not by
transfering the whole parameters buffer to a memory area. Hans what do
you think ?

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

Same as per the stat nodes, there's a single format, IO_MC doesn't
give you anything ?

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
> --
> 2.25.1
>
>

