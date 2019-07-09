Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 75F2C63DCD
	for <lists+linux-media@lfdr.de>; Wed, 10 Jul 2019 00:20:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726601AbfGIWUw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 9 Jul 2019 18:20:52 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:46422 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726218AbfGIWUw (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 9 Jul 2019 18:20:52 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id 60BBB28A50E
Subject: Re: [PATCH 3/7] media: vimc: Create a V4L2 output device
To:     =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@collabora.com>,
        linux-media@vger.kernel.org
Cc:     mchehab@kernel.org, hverkuil@xs4all.nl, kernel@collabora.com,
        linux-kernel@vger.kernel.org
References: <20190702154752.14939-1-andrealmeid@collabora.com>
 <20190702154752.14939-4-andrealmeid@collabora.com>
From:   Helen Koike <helen.koike@collabora.com>
Openpgp: preference=signencrypt
Autocrypt: addr=helen.koike@collabora.com; keydata=
 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
Message-ID: <736f1720-399a-f252-3f15-3288b458452f@collabora.com>
Date:   Tue, 9 Jul 2019 19:20:42 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190702154752.14939-4-andrealmeid@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi André,

Thanks for the patch, just some minor comments below.

On 7/2/19 12:47 PM, André Almeida wrote:
> Using the functions on vimc-video, create a V4L2 output device.
> When a streaming is initialized on the output device, it'll start
> returning those buffers on to the userspace, while always keeping one on
> the list. When the capture device starts streaming on the same pipeline,
> it will copy the first frame on the list to the process_frame pipeline.
> 
> The vimc-streamer has a callback to warn all subdevices when a streaming
> will start or stop. This is useful so the subdevices can allocate a
> frame with suitable size to send through the pipeline, and then free
> then when it not used anymore. Since the vimc-output will also be part
> of the pipeline (but it is not a V4L2 subdevice), change the callback to
> be part of vimc_ent_device, rather than a linked with the subdevice API.
> In this way, it's possible to have a generic solution to call start/stop
> streaming callbacks to all devices in the pipeline.
> 
> Add a vb2 buffer validate function. This is required to
> create a V4L2 output device.
> 
> Signed-off-by: André Almeida <andrealmeid@collabora.com>
> ---
>  drivers/media/platform/vimc/Makefile        |   4 +-
>  drivers/media/platform/vimc/vimc-common.h   |   5 +-
>  drivers/media/platform/vimc/vimc-debayer.c  |  11 +-
>  drivers/media/platform/vimc/vimc-output.c   | 362 ++++++++++++++++++++
>  drivers/media/platform/vimc/vimc-scaler.c   |  10 +-
>  drivers/media/platform/vimc/vimc-sensor.c   |  10 +-
>  drivers/media/platform/vimc/vimc-streamer.c |  22 +-
>  drivers/media/platform/vimc/vimc-video.c    |   9 +
>  drivers/media/platform/vimc/vimc-video.h    |   2 +
>  9 files changed, 395 insertions(+), 40 deletions(-)
>  create mode 100644 drivers/media/platform/vimc/vimc-output.c
> 
> diff --git a/drivers/media/platform/vimc/Makefile b/drivers/media/platform/vimc/Makefile
> index fb90aa0f33a5..611331b9fceb 100644
> --- a/drivers/media/platform/vimc/Makefile
> +++ b/drivers/media/platform/vimc/Makefile
> @@ -1,5 +1,5 @@
>  # SPDX-License-Identifier: GPL-2.0
>  vimc-y := vimc-core.o vimc-common.o vimc-streamer.o
>  
> -obj-$(CONFIG_VIDEO_VIMC) += vimc.o vimc-video.o vimc-capture.o vimc-debayer.o \
> -                vimc-scaler.o vimc-sensor.o
> +obj-$(CONFIG_VIDEO_VIMC) += vimc.o vimc-video.o vimc-capture.o vimc-output.o \
> +                vimc-debayer.o vimc-scaler.o vimc-sensor.o
> diff --git a/drivers/media/platform/vimc/vimc-common.h b/drivers/media/platform/vimc/vimc-common.h
> index 7b4d988b208b..003024bcdaed 100644
> --- a/drivers/media/platform/vimc/vimc-common.h
> +++ b/drivers/media/platform/vimc/vimc-common.h
> @@ -78,6 +78,8 @@ struct vimc_platform_data {
>   * @vdev_get_format:	callback that returns the current format a pad, used
>   *			only when is_media_entity_v4l2_video_device(ent) returns
>   *			true
> + * @s_stream:		callback used when vimc-capture will start/stop a
> + *			streaming, to subdevice alloc/free it frames

I would re-word this a bit:
callback used when vimc-capture start/stop streaming, so subdevices can alloc/free frames.

>   *
>   * Each node of the topology must create a vimc_ent_device struct. Depending on
>   * the node it will be of an instance of v4l2_subdev or video_device struct
> @@ -94,7 +96,8 @@ struct vimc_ent_device {
>  	void * (*process_frame)(struct vimc_ent_device *ved,
>  				const void *frame);
>  	void (*vdev_get_format)(struct vimc_ent_device *ved,
> -			      struct v4l2_pix_format *fmt);
> +				struct v4l2_pix_format *fmt);
> +	int (*s_stream)(struct vimc_ent_device *ved, int enable);
>  };
>  
>  /**
> diff --git a/drivers/media/platform/vimc/vimc-debayer.c b/drivers/media/platform/vimc/vimc-debayer.c
> index 00598fbf3cba..9e0c7c2c3c72 100644
> --- a/drivers/media/platform/vimc/vimc-debayer.c
> +++ b/drivers/media/platform/vimc/vimc-debayer.c
> @@ -320,9 +320,10 @@ static void vimc_deb_set_rgb_pix_rgb24(struct vimc_deb_device *vdeb,
>  		vdeb->src_frame[index + i] = rgb[i];
>  }
>  
> -static int vimc_deb_s_stream(struct v4l2_subdev *sd, int enable)
> +static int vimc_deb_s_stream(struct vimc_ent_device *ved, int enable)
>  {
> -	struct vimc_deb_device *vdeb = v4l2_get_subdevdata(sd);
> +	struct vimc_deb_device *vdeb = container_of(ved, struct vimc_deb_device,
> +						    ved);
>  
>  	if (enable) {
>  		u32 src_pixelformat = vdeb->ved.stream->producer_pixfmt;
> @@ -373,13 +374,8 @@ static int vimc_deb_s_stream(struct v4l2_subdev *sd, int enable)
>  	return 0;
>  }
>  
> -static const struct v4l2_subdev_video_ops vimc_deb_video_ops = {
> -	.s_stream = vimc_deb_s_stream,
> -};
> -
>  static const struct v4l2_subdev_ops vimc_deb_ops = {
>  	.pad = &vimc_deb_pad_ops,
> -	.video = &vimc_deb_video_ops,
>  };
>  
>  static unsigned int vimc_deb_get_val(const u8 *bytes,
> @@ -549,6 +545,7 @@ static int vimc_deb_comp_bind(struct device *comp, struct device *master,
>  	}
>  
>  	vdeb->ved.process_frame = vimc_deb_process_frame;
> +	vdeb->ved.s_stream = vimc_deb_s_stream;
>  	dev_set_drvdata(comp, &vdeb->ved);
>  	vdeb->dev = comp;
>  
> diff --git a/drivers/media/platform/vimc/vimc-output.c b/drivers/media/platform/vimc/vimc-output.c
> new file mode 100644
> index 000000000000..3fb9441adc43
> --- /dev/null
> +++ b/drivers/media/platform/vimc/vimc-output.c
> @@ -0,0 +1,362 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * vimc-output.c Virtual Media Controller Driver
> + *
> + * Copyright 2019 Collabora, Ltd.
> + */
> +
> +#include "vimc-video.h"
> +#include <linux/kthread.h>
> +#include <linux/freezer.h>
> +
> +#define VIMC_OUT_DRV_NAME "vimc-output"
> +
> +static const struct v4l2_ioctl_ops vimc_out_ioctl_ops = {
> +	.vidioc_querycap = vimc_vid_querycap,
> +
> +	.vidioc_g_fmt_vid_out = vimc_vid_g_fmt,
> +	.vidioc_s_fmt_vid_out = vimc_vid_s_fmt,
> +	.vidioc_try_fmt_vid_out = vimc_vid_try_fmt,
> +	.vidioc_enum_fmt_vid_out = vimc_vid_enum_fmt,
> +	.vidioc_enum_framesizes = vimc_vid_enum_framesizes,
> +
> +	.vidioc_reqbufs = vb2_ioctl_reqbufs,
> +	.vidioc_create_bufs = vb2_ioctl_create_bufs,
> +	.vidioc_prepare_buf = vb2_ioctl_prepare_buf,
> +	.vidioc_querybuf = vb2_ioctl_querybuf,
> +	.vidioc_qbuf = vb2_ioctl_qbuf,
> +	.vidioc_dqbuf = vb2_ioctl_dqbuf,
> +	.vidioc_expbuf = vb2_ioctl_expbuf,
> +	.vidioc_streamon = vb2_ioctl_streamon,
> +	.vidioc_streamoff = vb2_ioctl_streamoff,
> +};
> +
> +/**
> + * vimc_out_consume_frame - grab a frame from the queue and release it
> + *
> + * @arg: *vimc_vid_device passed as argument to kthread
> + *
> + * This function is called when the stream is on. If there's a frame available

s/This function is called/This thread is started/

> + * on the queue, it will get it and "consume" it. This means, marks the frame
> + * as done and make sure there're at least one frame to be on the list.
> + * It should stop when the streaming stops too
> + *
> + * Return: always 0
> + */
> +static int vimc_out_consume_frame(void *arg)
> +{
> +	struct vimc_vid_device *vout = arg;
> +	struct vimc_vid_buffer *vimc_buf;
> +
> +	set_freezable();
> +
> +	for (;;) {
> +		try_to_freeze();
> +		if (kthread_should_stop())
> +			break;
> +
> +		/* TODO: support custom framerate */
> +		set_current_state(TASK_UNINTERRUPTIBLE);
> +		schedule_timeout(HZ / 60);
> +
> +		spin_lock(&vout->qlock);
> +
> +		/*
> +		 * if there's only on frame on the buffer, keep it there
> +		 * this is done in a way that the output always can send a
> +		 * frame to the pipeline, even if the capture framerate is
> +		 * higher than the output framarate

s/framarate/framerate/

> +		 */
> +		if (list_empty(&vout->buf_list) ||
> +		    list_is_singular(&vout->buf_list)) {
> +			spin_unlock(&vout->qlock);
> +			continue;
> +		}
> +
> +		vimc_buf = list_first_entry(&vout->buf_list,
> +				    typeof(*vimc_buf), list);
> +		list_del(&vimc_buf->list);
> +		spin_unlock(&vout->qlock);
> +
> +		vimc_buf->vb2.vb2_buf.timestamp = ktime_get_ns();
> +		vimc_buf->vb2.sequence = vout->sequence++;
> +		vimc_buf->vb2.field = vout->format.field;
> +		vb2_buffer_done(&vimc_buf->vb2.vb2_buf, VB2_BUF_STATE_DONE);
> +	}
> +
> +	return 0;
> +}
> +
> +/**
> + * vimc_out_start_streaming - callback used when userspace starts streaming
> + *
> + * @vq:	   queue of vb2 video buffers
> + * @count: number of already queued buffers
> + *
> + * Allocate the output frame and starts the consume thread
> + *
> + * Return: 0 on success or error code
> + */
> +static int vimc_out_start_streaming(struct vb2_queue *vq, unsigned int count)
> +{
> +	struct vimc_vid_device *vout = vb2_get_drv_priv(vq);
> +
> +	vout->sequence = 0;
> +
> +	vout->kthread_fd = kthread_run(vimc_out_consume_frame, vout,
> +					      "vimc-output consume thread");

Alignment

> +
> +	if (IS_ERR(vout->kthread_fd))
> +		return PTR_ERR(vout->kthread_fd);
> +
> +	return 0;
> +}
> +
> +/**
> + * vimc_out_stop_streaming - callback used when userspace stops streaming
> + *
> + * @vq:	   queue of vb2 video buffers
> + *
> + * Wait until vimc_stream stops consuming a frame (using a mutex) and free it.
> + * Stops the thread and return all unused buffers to userspace.
> + */
> +static void vimc_out_stop_streaming(struct vb2_queue *vq)
> +{
> +	struct vimc_vid_device *vout = vb2_get_drv_priv(vq);
> +
> +	vout->sequence = 0;
> +
> +	kthread_stop(vout->kthread_fd);
> +
> +	vimc_vid_return_all_buffers(vout, VB2_BUF_STATE_ERROR);
> +}
> +
> +static const struct vb2_ops vimc_out_qops = {
> +	.start_streaming	= vimc_out_start_streaming,
> +	.stop_streaming		= vimc_out_stop_streaming,
> +	.buf_queue		= vimc_vid_buf_queue,
> +	.queue_setup		= vimc_vid_queue_setup,
> +	.buf_prepare		= vimc_vid_buffer_prepare,
> +	.buf_out_validate	= vimc_vid_buffer_validate,
> +	/*
> +	 * Since q->lock is set we can use the standard
> +	 * vb2_ops_wait_prepare/finish helper functions.
> +	 */
> +	.wait_prepare		= vb2_ops_wait_prepare,
> +	.wait_finish		= vb2_ops_wait_finish,
> +};
> +
> +static const struct media_entity_operations vimc_out_mops = {
> +	.link_validate		= vimc_link_validate,
> +};
> +
> +/**
> + * vimc_out_process_frame - process a frame on media pipeline
> + *
> + * @ved:   the vimc entity structure to process the frame
> + * @frame: pointer to the pipeline frame. Unused by output
> + *
> + * If there's a frame to be sent to the pipeline, copy the newest frame and
> + * send it through the pipeline.
> + * If there's no frame on vimc_output buffer list (this probably means that
> + * there's no streaming going on at the output) or the pixelformat of the stream
> + * mismatch the output format, send NULL.
> + */
> +static void *vimc_out_process_frame(struct vimc_ent_device *ved,
> +						 const void *frame)

Alignment

> +{
> +	struct vimc_vid_device *vout = container_of(ved, struct vimc_vid_device,
> +						    ved);
> +	struct vimc_vid_buffer *vimc_buf;
> +	void *vbuf;
> +
> +	if (ved->stream->producer_pixfmt != vout->format.pixelformat)
> +		return NULL;

fyi, after reverting "media: vimc: propagate pixel format in the stream"
this check should be done in vimc_link_validate

> +
> +	spin_lock(&vout->qlock);
> +	vimc_buf = list_first_entry_or_null(&vout->buf_list,
> +					    typeof(*vimc_buf), list);
> +	spin_unlock(&vout->qlock);
> +
> +	if (!vimc_buf)
> +		return NULL;
> +
> +	vbuf = vb2_plane_vaddr(&vimc_buf->vb2.vb2_buf, 0);
> +	memcpy(vout->frame, vbuf, vout->format.sizeimage);
> +
> +	return vout->frame;
> +}
> +
> +/**
> + * vimc_out_s_stream - callback before/after the start/stop of pipeline stream
> + *
> + * @ved:	the vimc_ent_device compenent of vimc_vid_device
> + * @enable:	0 means that the streaming has stop, non-zero means the
> + *		will begin

s/has/has to/
I think some word is missing. Maybe just:
0 stop the stream, non-zero start the stream

> + *
> + */
> +static int vimc_out_s_stream(struct vimc_ent_device *ved, int enable)
> +{
> +	struct vimc_vid_device *vout =
> +				container_of(ved, struct vimc_vid_device, ved);
> +
> +	if (enable) {
> +		vout->frame = vmalloc(vout->format.sizeimage);
> +		if (!vout->frame)
> +			return -ENOMEM;
> +
> +	} else {
> +		vfree(vout->frame);
> +		vout->frame = NULL;
> +	}
> +
> +	return 0;
> +}
> +
> +static int vimc_out_comp_bind(struct device *comp, struct device *master,
> +		void *master_data)
> +{
> +	struct v4l2_device *v4l2_dev = master_data;
> +	struct vimc_platform_data *pdata = comp->platform_data;
> +	struct vimc_vid_device *vout;
> +	struct video_device *vdev;
> +	struct vb2_queue *q;
> +	int ret;
> +
> +	/* Allocate the vimc_vid_device struct */
> +	vout = kzalloc(sizeof(*vout), GFP_KERNEL);
> +	if (!vout)
> +		return -ENOMEM;
> +
> +	vout->stream.pipe_size = 0;
> +	/* Allocate the pads */
> +	vout->ved.pads =
> +		vimc_pads_init(1, (const unsigned long[1]) {MEDIA_PAD_FL_SOURCE});
> +	if (IS_ERR(vout->ved.pads)) {
> +		ret = PTR_ERR(vout->ved.pads);
> +		goto err_free_vout;
> +	}
> +
> +	/* Initialize the media entity */
> +	vout->vdev.entity.name = pdata->entity_name;
> +	vout->vdev.entity.function = MEDIA_ENT_F_IO_V4L;
> +	ret = media_entity_pads_init(&vout->vdev.entity,
> +				     1, vout->ved.pads);
> +	if (ret)
> +		goto err_clean_pads;
> +
> +	/* Initialize the lock */
> +	mutex_init(&vout->lock);
> +
> +	/* Initialize the vb2 queue */
> +	q = &vout->queue;
> +	q->type = V4L2_BUF_TYPE_VIDEO_OUTPUT;
> +	q->io_modes = VB2_MMAP | VB2_DMABUF | VB2_USERPTR;
> +	q->drv_priv = vout;
> +	q->buf_struct_size = sizeof(struct vimc_vid_buffer);
> +	q->ops = &vimc_out_qops;
> +	q->mem_ops = &vb2_vmalloc_memops;
> +	q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
> +	q->min_buffers_needed = 2;
> +	q->lock = &vout->lock;
> +
> +	ret = vb2_queue_init(q);
> +	if (ret) {
> +		dev_err(comp, "%s: vb2 queue init failed (err=%d)\n",
> +				pdata->entity_name, ret);

alignment

> +		goto err_clean_m_ent;
> +	}
> +
> +	/* Initialize buffer list and its lock */
> +	INIT_LIST_HEAD(&vout->buf_list);
> +	spin_lock_init(&vout->qlock);
> +
> +	/* Set default frame format */
> +	vout->format = fmt_default;
> +	v4l2_fill_pixfmt(&vout->format, vout->format.pixelformat,
> +			 vout->format.width, vout->format.height);
> +
> +	/* Fill the vimc_ent_device struct */
> +	vout->ved.ent = &vout->vdev.entity;
> +	vout->ved.process_frame = vimc_out_process_frame;
> +	vout->ved.s_stream = vimc_out_s_stream;
> +	vout->ved.vdev_get_format = vimc_vid_get_format;
> +	dev_set_drvdata(comp, &vout->ved);
> +	vout->dev = comp;
> +
> +	/* Initialize the video_device struct */
> +	vdev = &vout->vdev;
> +	vdev->device_caps = V4L2_CAP_VIDEO_OUTPUT | V4L2_CAP_STREAMING;
> +	vdev->entity.ops = &vimc_out_mops;
> +	vdev->release = vimc_vid_release;
> +	vdev->fops = &vimc_vid_fops;
> +	vdev->ioctl_ops = &vimc_out_ioctl_ops;
> +	vdev->lock = &vout->lock;
> +	vdev->queue = q;
> +	vdev->v4l2_dev = v4l2_dev;
> +	vdev->vfl_dir = VFL_DIR_TX;
> +	strscpy(vdev->name, pdata->entity_name, sizeof(vdev->name));
> +	video_set_drvdata(vdev, &vout->ved);
> +
> +	/* Register the video_device with the v4l2 and the media framework */
> +	ret = video_register_device(vdev, VFL_TYPE_GRABBER, -1);
> +	if (ret) {
> +		dev_err(comp, "%s: video register failed (err=%d)\n",
> +				vout->vdev.name, ret);
> +		goto err_release_queue;
> +	}
> +
> +	return 0;
> +
> +err_release_queue:
> +	vb2_queue_release(q);
> +err_clean_m_ent:
> +	media_entity_cleanup(&vout->vdev.entity);
> +err_clean_pads:
> +	vimc_pads_cleanup(vout->ved.pads);
> +err_free_vout:
> +	kfree(vout);
> +
> +	return ret;
> +}
> +
> +static const struct component_ops vimc_out_comp_ops = {
> +	.bind = vimc_out_comp_bind,
> +	.unbind = vimc_vid_comp_unbind,
> +};
> +
> +static int vimc_out_probe(struct platform_device *pdev)
> +{
> +	return component_add(&pdev->dev, &vimc_out_comp_ops);
> +}
> +
> +static int vimc_out_remove(struct platform_device *pdev)
> +{
> +	component_del(&pdev->dev, &vimc_out_comp_ops);
> +
> +	return 0;
> +}
> +
> +static const struct platform_device_id vimc_out_driver_ids[] = {
> +	{
> +		.name           = VIMC_OUT_DRV_NAME,
> +	},
> +	{ }
> +};
> +
> +static struct platform_driver vimc_out_pdrv = {
> +	.probe		= vimc_out_probe,
> +	.remove		= vimc_out_remove,
> +	.id_table	= vimc_out_driver_ids,
> +	.driver		= {
> +		.name	= VIMC_OUT_DRV_NAME,
> +	},
> +};
> +
> +module_platform_driver(vimc_out_pdrv);
> +
> +MODULE_DEVICE_TABLE(platform, vimc_out_driver_ids);
> +
> +MODULE_DESCRIPTION("Virtual Media Controller Driver (VIMC) Output");
> +MODULE_AUTHOR("André Almeida <andrealmeid@collabora.com>");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/media/platform/vimc/vimc-scaler.c b/drivers/media/platform/vimc/vimc-scaler.c
> index c7123a45c55b..2c3e486a29c0 100644
> --- a/drivers/media/platform/vimc/vimc-scaler.c
> +++ b/drivers/media/platform/vimc/vimc-scaler.c
> @@ -194,9 +194,10 @@ static const struct v4l2_subdev_pad_ops vimc_sca_pad_ops = {
>  	.set_fmt		= vimc_sca_set_fmt,
>  };
>  
> -static int vimc_sca_s_stream(struct v4l2_subdev *sd, int enable)
> +static int vimc_sca_s_stream(struct vimc_ent_device *ved, int enable)
>  {
> -	struct vimc_sca_device *vsca = v4l2_get_subdevdata(sd);
> +	struct vimc_sca_device *vsca = container_of(ved, struct vimc_sca_device,
> +						    ved);
>  
>  	if (enable) {
>  		u32 pixelformat = vsca->ved.stream->producer_pixfmt;
> @@ -239,13 +240,9 @@ static int vimc_sca_s_stream(struct v4l2_subdev *sd, int enable)
>  	return 0;
>  }
>  
> -static const struct v4l2_subdev_video_ops vimc_sca_video_ops = {
> -	.s_stream = vimc_sca_s_stream,
> -};
>  
>  static const struct v4l2_subdev_ops vimc_sca_ops = {
>  	.pad = &vimc_sca_pad_ops,
> -	.video = &vimc_sca_video_ops,
>  };
>  
>  static void vimc_sca_fill_pix(u8 *const ptr,
> @@ -381,6 +378,7 @@ static int vimc_sca_comp_bind(struct device *comp, struct device *master,
>  	}
>  
>  	vsca->ved.process_frame = vimc_sca_process_frame;
> +	vsca->ved.s_stream = vimc_sca_s_stream,
>  	dev_set_drvdata(comp, &vsca->ved);
>  	vsca->dev = comp;
>  
> diff --git a/drivers/media/platform/vimc/vimc-sensor.c b/drivers/media/platform/vimc/vimc-sensor.c
> index 51359472eef2..a1afb840493d 100644
> --- a/drivers/media/platform/vimc/vimc-sensor.c
> +++ b/drivers/media/platform/vimc/vimc-sensor.c
> @@ -177,10 +177,10 @@ static void *vimc_sen_process_frame(struct vimc_ent_device *ved,
>  	return vsen->frame;
>  }
>  
> -static int vimc_sen_s_stream(struct v4l2_subdev *sd, int enable)
> +static int vimc_sen_s_stream(struct vimc_ent_device *ved, int enable)
>  {
>  	struct vimc_sen_device *vsen =
> -				container_of(sd, struct vimc_sen_device, sd);
> +				container_of(ved, struct vimc_sen_device, ved);
>  
>  	if (enable) {
>  		u32 pixelformat = vsen->ved.stream->producer_pixfmt;
> @@ -218,14 +218,9 @@ static const struct v4l2_subdev_core_ops vimc_sen_core_ops = {
>  	.unsubscribe_event = v4l2_event_subdev_unsubscribe,
>  };
>  
> -static const struct v4l2_subdev_video_ops vimc_sen_video_ops = {
> -	.s_stream = vimc_sen_s_stream,
> -};
> -
>  static const struct v4l2_subdev_ops vimc_sen_ops = {
>  	.core = &vimc_sen_core_ops,
>  	.pad = &vimc_sen_pad_ops,
> -	.video = &vimc_sen_video_ops,
>  };
>  
>  static int vimc_sen_s_ctrl(struct v4l2_ctrl *ctrl)
> @@ -351,6 +346,7 @@ static int vimc_sen_comp_bind(struct device *comp, struct device *master,
>  		goto err_free_hdl;
>  
>  	vsen->ved.process_frame = vimc_sen_process_frame;
> +	vsen->ved.s_stream = vimc_sen_s_stream;
>  	dev_set_drvdata(comp, &vsen->ved);
>  	vsen->dev = comp;
>  
> diff --git a/drivers/media/platform/vimc/vimc-streamer.c b/drivers/media/platform/vimc/vimc-streamer.c
> index 3b3f36357a0e..fd330415ac38 100644
> --- a/drivers/media/platform/vimc/vimc-streamer.c
> +++ b/drivers/media/platform/vimc/vimc-streamer.c
> @@ -47,7 +47,6 @@ static struct media_entity *vimc_get_source_entity(struct media_entity *ent)
>  static void vimc_streamer_pipeline_terminate(struct vimc_stream *stream)
>  {
>  	struct vimc_ent_device *ved;
> -	struct v4l2_subdev *sd;
>  
>  	while (stream->pipe_size) {
>  		stream->pipe_size--;
> @@ -55,11 +54,8 @@ static void vimc_streamer_pipeline_terminate(struct vimc_stream *stream)
>  		ved->stream = NULL;
>  		stream->ved_pipeline[stream->pipe_size] = NULL;
>  
> -		if (!is_media_entity_v4l2_subdev(ved->ent))
> -			continue;
> -
> -		sd = media_entity_to_v4l2_subdev(ved->ent);
> -		v4l2_subdev_call(sd, video, s_stream, 0);
> +		if (ved->s_stream)
> +			ved->s_stream(ved, 0);
>  	}
>  }
>  
> @@ -79,7 +75,6 @@ static int vimc_streamer_pipeline_init(struct vimc_stream *stream,
>  	struct media_entity *entity;
>  	struct video_device *vdev;
>  	struct v4l2_subdev *sd;
> -	int ret = 0;
>  
>  	stream->pipe_size = 0;
>  	while (stream->pipe_size < VIMC_STREAMER_PIPELINE_MAX_SIZE) {
> @@ -90,16 +85,8 @@ static int vimc_streamer_pipeline_init(struct vimc_stream *stream,
>  		stream->ved_pipeline[stream->pipe_size++] = ved;
>  		ved->stream = stream;
>  
> -		if (is_media_entity_v4l2_subdev(ved->ent)) {
> -			sd = media_entity_to_v4l2_subdev(ved->ent);
> -			ret = v4l2_subdev_call(sd, video, s_stream, 1);
> -			if (ret && ret != -ENOIOCTLCMD) {
> -				pr_err("subdev_call error %s\n",
> -				       ved->ent->name);
> -				vimc_streamer_pipeline_terminate(stream);
> -				return ret;
> -			}
> -		}
> +		if (ved->s_stream)
> +			ved->s_stream(ved, 1);
>  
>  		entity = vimc_get_source_entity(ved->ent);
>  		/* Check if the end of the pipeline was reached*/
> @@ -149,6 +136,7 @@ static int vimc_streamer_thread(void *data)
>  			if (!frame || IS_ERR(frame))
>  				break;
>  		}
> +
>  		//wait for 60hz
>  		set_current_state(TASK_UNINTERRUPTIBLE);
>  		schedule_timeout(HZ / 60);
> diff --git a/drivers/media/platform/vimc/vimc-video.c b/drivers/media/platform/vimc/vimc-video.c
> index f7ccb2e9d6c5..0187e699543a 100644
> --- a/drivers/media/platform/vimc/vimc-video.c
> +++ b/drivers/media/platform/vimc/vimc-video.c
> @@ -236,6 +236,15 @@ int vimc_vid_buffer_prepare(struct vb2_buffer *vb)
>  }
>  EXPORT_SYMBOL_GPL(vimc_vid_buffer_prepare);
>  
> +int vimc_vid_buffer_validate(struct vb2_buffer *vb)
> +{
> +	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
> +
> +	vbuf->field = V4L2_FIELD_NONE;
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(vimc_vid_buffer_validate);

Is this function only used by the output? Maybe just keep it private in the output.

> +
>  void vimc_vid_release(struct video_device *vdev)
>  {
>  	struct vimc_vid_device *vid =
> diff --git a/drivers/media/platform/vimc/vimc-video.h b/drivers/media/platform/vimc/vimc-video.h
> index 22cb0e2dbdbb..67f13244bf92 100644
> --- a/drivers/media/platform/vimc/vimc-video.h
> +++ b/drivers/media/platform/vimc/vimc-video.h
> @@ -116,6 +116,8 @@ int vimc_vid_queue_setup(struct vb2_queue *vq, unsigned int *nbuffers,
>  
>  int vimc_vid_buffer_prepare(struct vb2_buffer *vb);
>  
> +int vimc_vid_buffer_validate(struct vb2_buffer *vb);
> +
>  int vimc_vid_probe(struct platform_device *pdev);
>  
>  int vimc_vid_remove(struct platform_device *pdev);
> 

Thanks,
Helen
