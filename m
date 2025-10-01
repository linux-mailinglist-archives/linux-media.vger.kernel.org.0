Return-Path: <linux-media+bounces-43447-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 16996BAF4E3
	for <lists+linux-media@lfdr.de>; Wed, 01 Oct 2025 08:53:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AF8EB16E64A
	for <lists+linux-media@lfdr.de>; Wed,  1 Oct 2025 06:53:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08F3523D7E8;
	Wed,  1 Oct 2025 06:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kerneltoast.com header.i=@kerneltoast.com header.b="I9D+11+r"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14F921474CC
	for <linux-media@vger.kernel.org>; Wed,  1 Oct 2025 06:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759301600; cv=none; b=OZnxnv7tharHV3mjvxsC2N3bfceHxMIkcDaQ3gZvgLk4F8cuFOUUJ3LxGnHsJp+60wcZcoR2eqM6twM536yeYpQlsQ9J6sY/yO168YPzBxe0av9oDiSJf27qed8kZKLPX+YlXiL6PmyK2DilSM2fWLXK9qxqRx8EUM1HNNnKirA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759301600; c=relaxed/simple;
	bh=b6I0eOW8Vg7u3XRW5rWK5o0/IrVrbpCzP3idXVcywRk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=av5IiAo0uQeuel8ORtBIjtwbWO+/zVPgzmyWpMbdDY7UPxc7Wt6VUMiBdJi5ttxhn7tIUFY4U5AqLGu/dRdCpHuoJZ7aHqzIBcgPayL7b2CPirtB2wZ9SpeXljDPL5jGkU+kDQgLdMSyX4Wz4AY72d+dRie2tvzLGZ1OIcIijHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kerneltoast.com; spf=pass smtp.mailfrom=kerneltoast.com; dkim=pass (2048-bit key) header.d=kerneltoast.com header.i=@kerneltoast.com header.b=I9D+11+r; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kerneltoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kerneltoast.com
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-b523fb676efso6611048a12.3
        for <linux-media@vger.kernel.org>; Tue, 30 Sep 2025 23:53:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kerneltoast.com; s=google; t=1759301597; x=1759906397; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=m3WGN5Y7FV5Ly7w4cZhcKopzSsqpOK2P3CD1YbIRVMY=;
        b=I9D+11+rpP7Gx9Htl6dJfJskmAkwSZKcljyiWvUnc+zNB1xfPFs99WXe+d1qa2VfN0
         2StkgSTHN2JQcrbzDixfXD1NXpbqLfh4D39HiGd5SX5eZIDCf5RuD4R9l8j3IniBpHXv
         Zqa1OB7kbkPX+rhl92+fMS4TJGkRTp8DI31Zx8VphyVZRIJZuOCdNTAQHN3zEqjCXy5a
         WAyUcQVHowPUMdtzssiSN1odnFtxk2HQ0auX10mFgwaGQnIovT87yku1pe9TEv8xYajm
         ycmGrg4su1TYbHHWTX+EVIQqpnh6hc+wxOPjv5FIuM2emS+xfcYb6Kurb8DoRC9qHBO+
         InGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759301597; x=1759906397;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m3WGN5Y7FV5Ly7w4cZhcKopzSsqpOK2P3CD1YbIRVMY=;
        b=Q+UiGB7b/6WNHxqo+/nM3uLQJfxXgwUAu6JNbfrhn6P1KKirZK1xVeMk1oJn3UYQjy
         KhyEoetwI6k2+B1LrKh/pY7z4LyRvliC8JozTPfwLg/kzlsht2CWj8gQEs64KzitciR7
         z1KwwoJikOF4mTNxuJYFBi/hjeJcve9QAAPTL196zqy/7F5Qp6M70VIIJpeVWPXXH1rD
         bURR9yWNy+wMwrbBAkh59b5u4BpHdEDnJSdGACtHSOpno5fIGXhXM5O2HbqN9VG0pWta
         YKwCSUp5wk3XFhpn/6Sxck+onVAB7ZPQQiu8Ms+HR0PX3nXEiNwKkKFn1NQbdxyKuFey
         zBOQ==
X-Forwarded-Encrypted: i=1; AJvYcCWqJ7yS3wihu8zsveU+qQ7XnlZbaNI1b/p2iFO/fH6VKb6uu1b64G2TK0zbicn3GuCsK3QtaOo8rOwWmw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyNuolI7cln7YC18dCocbP3BqpIgsaUDvq4FZa5C7RAcDwrRXuV
	GY9Hl7ksELjfL9dnb6gMHJbdoXS5HGxA5Q9HhNtq5gvi0mdEoJjeF2O2O8qJ6JAIyHFg
X-Gm-Gg: ASbGncswhyYFT4KvvNzsvdAndxKS0O3+DOdwJXAkR+Y/qTmQMgd35sdd/2u+STm1W8t
	5ZIigrE9hvXeHqsuGwLntavFmq8DVH7AyoNdUqAWGKvvm/kXBX5Dqge4ekCas9tJPQMJW9QTxl/
	qDaT8KR8JbrbLsiPaJUOktI51ug68ytjtUcLek1Hg4A16rVLWR8h3L99QQoBxVtQJI5uHUVPdQ0
	gY0IaBI7oWR3sLVQgBO1SpTmmdpS7uQrgUmg+6Qxb7i3CpZEs/LYXVQy7h0dF74p8Y1I/8MJvbn
	np3c1c1xSTy7q2jWuTHau3GEHYmJ4w6d8YtaJpRj4s6gzu20DZeNto4SdqIcawoa5UJ0C0pZ9GH
	MqIgmcBP2ynrfN4I6ORDGLT/bZb8tBNz6P/YcJk+O2W8V47+H4FOStzDs7Go=
X-Google-Smtp-Source: AGHT+IF2dU66nQ64PVXbwK3t2dqDcJQ6/DUcOdlECxZ/Ft0wLWm+rD5uIhGTWrn2Gi6j5U3sRo/PwQ==
X-Received: by 2002:a17:903:2f0c:b0:250:b622:c750 with SMTP id d9443c01a7336-28e7f2c5878mr30756035ad.27.1759301597101;
        Tue, 30 Sep 2025 23:53:17 -0700 (PDT)
Received: from sultan-box ([79.127.217.41])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed672a51fsm178195065ad.63.2025.09.30.23.53.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 23:53:16 -0700 (PDT)
Date: Tue, 30 Sep 2025 23:53:12 -0700
From: Sultan Alsawaf <sultan@kerneltoast.com>
To: Bin Du <Bin.Du@amd.com>
Cc: mchehab@kernel.org, hverkuil@xs4all.nl,
	laurent.pinchart+renesas@ideasonboard.com,
	bryan.odonoghue@linaro.org, sakari.ailus@linux.intel.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	pratap.nirujogi@amd.com, benjamin.chan@amd.com, king.li@amd.com,
	gjorgji.rosikopulos@amd.com, Phil.Jawich@amd.com,
	Dominic.Antony@amd.com, mario.limonciello@amd.com,
	richard.gong@amd.com, anson.tsao@amd.com,
	Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>,
	Alexey Zagorodnikov <xglooom@gmail.com>
Subject: Re: [PATCH v4 5/7] media: platform: amd: isp4 video node and buffers
 handling added
Message-ID: <aNzP2LH0OwUkMtGb@sultan-box>
References: <20250911100847.277408-1-Bin.Du@amd.com>
 <20250911100847.277408-6-Bin.Du@amd.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250911100847.277408-6-Bin.Du@amd.com>

Hi Bin,

On Thu, Sep 11, 2025 at 06:08:45PM +0800, Bin Du wrote:
> Isp video implements v4l2 video interface and supports NV12 and YUYV. It
> manages buffers, pipeline power and state. Cherry-picked Sultan's DMA
> buffer related fix from branch v6.16-drm-tip-isp4-for-amd on
> https://github.com/kerneltoast/kernel_x86_laptop.git
> 
> Co-developed-by: Sultan Alsawaf <sultan@kerneltoast.com>
> Signed-off-by: Sultan Alsawaf <sultan@kerneltoast.com>
> Co-developed-by: Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
> Signed-off-by: Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
> Signed-off-by: Bin Du <Bin.Du@amd.com>
> Tested-by: Alexey Zagorodnikov <xglooom@gmail.com>

[snip]

> +++ b/drivers/media/platform/amd/isp4/isp4.c
> @@ -178,6 +178,16 @@ static int isp4_capture_probe(struct platform_device *pdev)
>  		goto err_isp4_deinit;
>  	}
>  
> +	ret = media_create_pad_link(&isp_dev->isp_sdev.sdev.entity,
> +				    0, &isp_dev->isp_sdev.isp_vdev.vdev.entity,
> +				    0,
> +				    MEDIA_LNK_FL_ENABLED |
> +				    MEDIA_LNK_FL_IMMUTABLE);
> +	if (ret) {
> +		dev_err(dev, "fail to create pad link %d\n", ret);
> +		goto err_isp4_deinit;
> +	}
> +

Two problems with this hunk:

1. According to the comment in include/media/media-device.h [1],
   media_create_pad_link() should be called before media_device_register():

    * So drivers need to first initialize the media device, register any entity
    * within the media device, create pad to pad links and then finally register
    * the media device by calling media_device_register() as a final step.

2. Missing call to media_device_unregister() on error when
   media_create_pad_link() fails.

Since the media_create_pad_link() will be moved before media_device_register(),
we will need to clean up media_create_pad_link() when media_device_register()
fails.

The clean-up function for media_create_pad_link() is media_device_unregister().
According to the comment for media_device_unregister() [2], it is safe to call
media_device_unregister() on an unregistered media device that is initialized
(through media_device_init()).

In addition, this made me realize that there's no call to media_device_cleanup()
in the entire driver too. This is the cleanup function for media_device_init(),
so it should be called on error and on module unload.

To summarize, make the following changes:

1. Move the media_create_pad_link() up, right before media_device_register().

2. When media_device_register() fails, clean up media_create_pad_link() by
   calling media_device_unregister().

3. Add a missing call to media_device_cleanup() on error and module unload to
   clean up media_device_init().

>  	platform_set_drvdata(pdev, isp_dev);
>  
>  	return 0;
> diff --git a/drivers/media/platform/amd/isp4/isp4_subdev.c b/drivers/media/platform/amd/isp4/isp4_subdev.c
> index a9cb14de04ca..7d3339c915eb 100644
> --- a/drivers/media/platform/amd/isp4/isp4_subdev.c
> +++ b/drivers/media/platform/amd/isp4/isp4_subdev.c

[snip]

> +static int isp4sd_ioc_send_img_buf(struct v4l2_subdev *sd,
> +				   struct isp4if_img_buf_info *buf_info)
> +{
> +	struct isp4_subdev *isp_subdev = to_isp4_subdev(sd);
> +	struct isp4_interface *ispif = &isp_subdev->ispif;
> +	struct isp4if_img_buf_node *buf_node = NULL;

Remove unnecessary initialization of `buf_node`.

> +	struct device *dev = isp_subdev->dev;
> +	int ret = -EINVAL;

Remove unnecessary initialization of `ret`.

> +
> +	mutex_lock(&isp_subdev->ops_mutex);

Use guard() for this mutex and remove the unlock_and_return label.

> +	/* TODO: remove isp_status */
> +	if (ispif->status != ISP4IF_STATUS_FW_RUNNING) {
> +		dev_err(dev, "fail send img buf for bad fsm %d\n",
> +			ispif->status);
> +		mutex_unlock(&isp_subdev->ops_mutex);
> +		return -EINVAL;
> +	}
> +
> +	buf_node = isp4if_alloc_buffer_node(buf_info);
> +	if (!buf_node) {
> +		dev_err(dev, "fail alloc sys img buf info node\n");
> +		ret = -ENOMEM;
> +		goto unlock_and_return;
> +	}
> +
> +	ret = isp4if_queue_buffer(ispif, buf_node);
> +	if (ret) {
> +		dev_err(dev, "fail to queue image buf, %d\n", ret);
> +		goto error_release_buf_node;
> +	}
> +
> +	if (!isp_subdev->sensor_info.start_stream_cmd_sent) {
> +		isp_subdev->sensor_info.buf_sent_cnt++;
> +
> +		if (isp_subdev->sensor_info.buf_sent_cnt >=
> +		    ISP4SD_MIN_BUF_CNT_BEF_START_STREAM) {
> +			ret = isp4if_send_command(ispif, CMD_ID_START_STREAM,
> +						  NULL, 0);
> +
> +			if (ret) {
> +				dev_err(dev, "fail to START_STREAM");
> +				goto error_release_buf_node;
> +			}
> +			isp_subdev->sensor_info.start_stream_cmd_sent = true;
> +			isp_subdev->sensor_info.output_info.start_status =
> +				ISP4SD_START_STATUS_STARTED;
> +			isp_subdev->sensor_info.status =
> +				ISP4SD_START_STATUS_STARTED;
> +		} else {
> +			dev_dbg(dev,
> +				"no send start,required %u,buf sent %u\n",

Add a space after each comma in this string.

> +				ISP4SD_MIN_BUF_CNT_BEF_START_STREAM,
> +				isp_subdev->sensor_info.buf_sent_cnt);
> +		}
> +	}
> +
> +	mutex_unlock(&isp_subdev->ops_mutex);
> +
> +	return 0;
> +
> +error_release_buf_node:
> +	isp4if_dealloc_buffer_node(buf_node);
> +
> +unlock_and_return:
> +	mutex_unlock(&isp_subdev->ops_mutex);
> +
> +	return ret;
> +}

[snip]

> +++ b/drivers/media/platform/amd/isp4/isp4_video.c
> @@ -0,0 +1,1207 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright (C) 2025 Advanced Micro Devices, Inc.
> + */
> +
> +#include <drm/amd/isp.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/vmalloc.h>
> +#include <media/v4l2-ioctl.h>
> +#include <media/v4l2-mc.h>
> +
> +#include "isp4_interface.h"
> +#include "isp4_subdev.h"
> +#include "isp4_video.h"
> +
> +#define ISP4VID_ISP_DRV_NAME "amd_isp_capture"
> +#define ISP4VID_MAX_PREVIEW_FPS 30
> +#define ISP4VID_DEFAULT_FMT isp4vid_formats[0]
> +
> +#define ISP4VID_PAD_VIDEO_OUTPUT 0
> +
> +/* timeperframe default */
> +#define ISP4VID_ISP_TPF_DEFAULT isp4vid_tpfs[0]
> +
> +/* amdisp buffer for vb2 operations */
> +struct isp4vid_vb2_buf {
> +	struct device			*dev;
> +	void				*vaddr;
> +	unsigned long			size;
> +	refcount_t			refcount;
> +	struct dma_buf			*dbuf;
> +	void				*bo;
> +	u64				gpu_addr;
> +	struct vb2_vmarea_handler	handler;
> +};
> +
> +static int isp4vid_vb2_mmap(void *buf_priv, struct vm_area_struct *vma);

Don't need the isp4vid_vb2_mmap() prototype here anymore, remove it. 

> +
> +static void isp4vid_vb2_put(void *buf_priv);
> +
> +static const char *isp4vid_video_dev_name = "Preview";

Turn this into `static const char *const isp4vid_video_dev_name = "Preview";`
which makes the `isp4vid_video_dev_name` variable itself const, so that you
cannot change `isp4vid_video_dev_name` to something else.

> +
> +/* Sizes must be in increasing order */
> +static const struct v4l2_frmsize_discrete isp4vid_frmsize[] = {
> +	{640, 360},
> +	{640, 480},
> +	{1280, 720},
> +	{1280, 960},
> +	{1920, 1080},
> +	{1920, 1440},
> +	{2560, 1440},
> +	{2880, 1620},
> +	{2880, 1624},
> +	{2888, 1808},
> +};
> +
> +static const u32 isp4vid_formats[] = {
> +	V4L2_PIX_FMT_NV12,
> +	V4L2_PIX_FMT_YUYV
> +};
> +
> +/* timeperframe list */
> +static const struct v4l2_fract isp4vid_tpfs[] = {
> +	{.numerator = 1, .denominator = ISP4VID_MAX_PREVIEW_FPS}

Add a space after { and a space before }.

Also, it is more common to see v4l2_fract initialized without specifying the
struct member names.

To summarize, change to `{ 1, ISP4VID_MAX_PREVIEW_FPS }`

> +};
> +
> +static void isp4vid_handle_frame_done(struct isp4vid_dev *isp_vdev,
> +				      const struct isp4if_img_buf_info *img_buf,
> +				      bool done_suc)
> +{
> +	struct isp4vid_capture_buffer *isp4vid_buf;

Rename isp4vid_buf to isp_buf like in isp4vid_qops_start_streaming().

> +	enum vb2_buffer_state state;
> +	void *vbuf;
> +
> +	mutex_lock(&isp_vdev->buf_list_lock);
> +
> +	/* Get the first entry of the list */
> +	isp4vid_buf = list_first_entry_or_null(&isp_vdev->buf_list, typeof(*isp4vid_buf), list);
> +	if (!isp4vid_buf) {
> +		mutex_unlock(&isp_vdev->buf_list_lock);
> +		return;
> +	}
> +
> +	vbuf = vb2_plane_vaddr(&isp4vid_buf->vb2.vb2_buf, 0);
> +
> +	if (vbuf != img_buf->planes[0].sys_addr) {
> +		dev_err(isp_vdev->dev, "Invalid vbuf");
> +		mutex_unlock(&isp_vdev->buf_list_lock);
> +		return;
> +	}
> +
> +	/* Remove this entry from the list */
> +	list_del(&isp4vid_buf->list);
> +
> +	mutex_unlock(&isp_vdev->buf_list_lock);

Change to this starting from the mutex_lock():

	scoped_guard(mutex, &isp_vdev->buf_list_lock) {
		/* Get the first entry of the list */
		isp_buf = list_first_entry_or_null(&isp_vdev->buf_list,
						   typeof(*isp_buf), list);
		if (!isp_buf)
			return;

		vbuf = vb2_plane_vaddr(&isp_buf->vb2.vb2_buf, 0);
		if (vbuf != img_buf->planes[0].sys_addr) {
			dev_err(isp_vdev->dev, "Invalid vbuf");
			return;
		}

		/* Remove this entry from the list */
		list_del(&isp_buf->list);
	}

> +
> +	/* Fill the buffer */
> +	isp4vid_buf->vb2.vb2_buf.timestamp = ktime_get_ns();
> +	isp4vid_buf->vb2.sequence = isp_vdev->sequence++;
> +	isp4vid_buf->vb2.field = V4L2_FIELD_ANY;
> +
> +	/* at most 2 planes */
> +	vb2_set_plane_payload(&isp4vid_buf->vb2.vb2_buf,
> +			      0, isp_vdev->format.sizeimage);
> +
> +	state = done_suc ? VB2_BUF_STATE_DONE : VB2_BUF_STATE_ERROR;
> +	vb2_buffer_done(&isp4vid_buf->vb2.vb2_buf, state);
> +
> +	dev_dbg(isp_vdev->dev, "call vb2_buffer_done(size=%u)\n",
> +		isp_vdev->format.sizeimage);
> +}

[snip]

> +static void *isp4vid_vb2_attach_dmabuf(struct vb2_buffer *vb, struct device *dev,
> +				       struct dma_buf *dbuf,
> +				       unsigned long size)
> +{
> +	struct isp4vid_vb2_buf *buf;
> +
> +	if (dbuf->size < size) {
> +		dev_err(dev, "Invalid dmabuf size %zu %lu", dbuf->size, size);
> +		return ERR_PTR(-EFAULT);
> +	}
> +
> +	buf = kzalloc(sizeof(*buf), GFP_KERNEL);
> +	if (!buf)
> +		return ERR_PTR(-ENOMEM);
> +
> +	struct isp4vid_vb2_buf *dbg_buf = dbuf->priv;

Move dbg_buf declaration to the top of the function.

> +
> +	buf->dev = dev;
> +	buf->dbuf = dbuf;
> +	buf->size = size;
> +
> +	dev_dbg(dev, "attach dmabuf of isp user bo 0x%llx size %ld",
> +		dbg_buf->gpu_addr, dbg_buf->size);
> +
> +	return buf;
> +}
> +
> +static void isp4vid_vb2_unmap_dmabuf(void *mem_priv)
> +{
> +	struct isp4vid_vb2_buf *buf = mem_priv;
> +	struct iosys_map map = IOSYS_MAP_INIT_VADDR(buf->vaddr);
> +
> +	dev_dbg(buf->dev, "unmap dmabuf of isp user bo 0x%llx size %ld",
> +		buf->gpu_addr, buf->size);
> +
> +	dma_buf_vunmap_unlocked(buf->dbuf, &map);
> +	buf->vaddr = NULL;
> +}
> +
> +static int isp4vid_vb2_map_dmabuf(void *mem_priv)
> +{
> +	struct isp4vid_vb2_buf *mmap_buf = NULL;

Remove unnecessary initialization of `mmap_buf`, and combine it onto one line
with `buf`:

	struct isp4vid_vb2_buf *buf = mem_priv, *mmap_buf;

> +	struct isp4vid_vb2_buf *buf = mem_priv;
> +	struct iosys_map map = {};

Remove unnecessary initialization of `map`, it is initialized inside
dma_buf_vmap_unlocked() at the very beginning.

> +	int ret;
> +
> +	ret = dma_buf_vmap_unlocked(buf->dbuf, &map);
> +	if (ret) {
> +		dev_err(buf->dev, "vmap_unlocked fail");
> +		return -EFAULT;
> +	}
> +	buf->vaddr = map.vaddr;
> +
> +	mmap_buf = buf->dbuf->priv;
> +	buf->gpu_addr = mmap_buf->gpu_addr;
> +
> +	dev_dbg(buf->dev, "map dmabuf of isp user bo 0x%llx size %ld",
> +		buf->gpu_addr, buf->size);
> +
> +	return 0;
> +}

[snip]

> +static const struct v4l2_pix_format isp4vid_fmt_default = {
> +	.width = 1920,
> +	.height = 1080,
> +	.pixelformat = V4L2_PIX_FMT_NV12,

Set .pixelformat to ISP4VID_DEFAULT_FMT.

> +	.field = V4L2_FIELD_NONE,
> +	.colorspace = V4L2_COLORSPACE_SRGB,
> +};
> +
> +static void isp4vid_capture_return_all_buffers(struct isp4vid_dev *isp_vdev,
> +					       enum vb2_buffer_state state)
> +{
> +	struct isp4vid_capture_buffer *vbuf, *node;
> +
> +	mutex_lock(&isp_vdev->buf_list_lock);
> +
> +	list_for_each_entry_safe(vbuf, node, &isp_vdev->buf_list, list) {
> +		list_del(&vbuf->list);
> +		vb2_buffer_done(&vbuf->vb2.vb2_buf, state);
> +	}
> +	mutex_unlock(&isp_vdev->buf_list_lock);

Change to this starting from the mutex_lock():

	scoped_guard(mutex, &isp_vdev->buf_list_lock) {
		list_for_each_entry_safe(vbuf, node, &isp_vdev->buf_list, list)
			vb2_buffer_done(&vbuf->vb2.vb2_buf, state);
		INIT_LIST_HEAD(&isp_vdev->buf_list);
	}

> +
> +	dev_dbg(isp_vdev->dev, "call vb2_buffer_done(%d)\n", state);
> +}
> +
> +static int isp4vid_vdev_link_validate(struct media_link *link)
> +{
> +	return 0;
> +}
> +
> +static const struct media_entity_operations isp4vid_vdev_ent_ops = {
> +	.link_validate = isp4vid_vdev_link_validate,
> +};
> +
> +static const struct v4l2_file_operations isp4vid_vdev_fops = {
> +	.owner = THIS_MODULE,
> +	.open = v4l2_fh_open,
> +	.release = vb2_fop_release,
> +	.read = vb2_fop_read,
> +	.poll = vb2_fop_poll,
> +	.unlocked_ioctl = video_ioctl2,
> +	.mmap = vb2_fop_mmap,
> +};
> +
> +static int isp4vid_ioctl_querycap(struct file *file, void *fh, struct v4l2_capability *cap)
> +{
> +	struct isp4vid_dev *isp_vdev = video_drvdata(file);
> +
> +	strscpy(cap->driver, ISP4VID_ISP_DRV_NAME, sizeof(cap->driver));
> +	snprintf(cap->card, sizeof(cap->card), "%s", ISP4VID_ISP_DRV_NAME);
> +	cap->capabilities |= V4L2_CAP_STREAMING | V4L2_CAP_VIDEO_CAPTURE;
> +
> +	dev_dbg(isp_vdev->dev, "%s|capabilities=0x%X", isp_vdev->vdev.name, cap->capabilities);
> +
> +	return 0;
> +}
> +
> +static int isp4vid_g_fmt_vid_cap(struct file *file, void *priv, struct v4l2_format *f)
> +{
> +	struct isp4vid_dev *isp_vdev = video_drvdata(file);
> +
> +	f->fmt.pix = isp_vdev->format;
> +
> +	return 0;
> +}
> +
> +static int isp4vid_try_fmt_vid_cap(struct file *file, void *priv, struct v4l2_format *f)
> +{
> +	struct isp4vid_dev *isp_vdev = video_drvdata(file);
> +	struct v4l2_pix_format *format = &f->fmt.pix;
> +	unsigned int i;

Change to `int i;` for consistency.

> +
> +	if (f->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
> +		return -EINVAL;
> +
> +	/*
> +	 * Check if the hardware supports the requested format, use the default
> +	 * format otherwise.
> +	 */
> +	for (i = 0; i < ARRAY_SIZE(isp4vid_formats); i++)
> +		if (isp4vid_formats[i] == format->pixelformat)
> +			break;
> +
> +	if (i == ARRAY_SIZE(isp4vid_formats))
> +		format->pixelformat = ISP4VID_DEFAULT_FMT;
> +
> +	switch (format->pixelformat) {
> +	case V4L2_PIX_FMT_NV12: {
> +		const struct v4l2_frmsize_discrete *fsz =
> +			v4l2_find_nearest_size(isp4vid_frmsize,
> +					       ARRAY_SIZE(isp4vid_frmsize),
> +					       width, height,
> +					       format->width, format->height);
> +
> +		format->width = fsz->width;
> +		format->height = fsz->height;
> +
> +		format->bytesperline = format->width;
> +		format->sizeimage = format->bytesperline *
> +				    format->height * 3 / 2;
> +	}
> +	break;
> +	case V4L2_PIX_FMT_YUYV: {
> +		const struct v4l2_frmsize_discrete *fsz =
> +			v4l2_find_nearest_size(isp4vid_frmsize,
> +					       ARRAY_SIZE(isp4vid_frmsize),
> +					       width, height,
> +					       format->width, format->height);
> +
> +		format->width = fsz->width;
> +		format->height = fsz->height;
> +
> +		format->bytesperline = format->width * 2;
> +		format->sizeimage = format->bytesperline * format->height;
> +	}
> +	break;
> +	default:
> +		dev_err(isp_vdev->dev, "%s|unsupported fmt=%u",
> +			isp_vdev->vdev.name, format->pixelformat);
> +		return -EINVAL;
> +	}

Create a variable declaration `const struct v4l2_frmsize_discrete *fsz;` at the
top of the function and change everything starting from the switch to this:

	fsz = v4l2_find_nearest_size(isp4vid_frmsize,
				     ARRAY_SIZE(isp4vid_frmsize), width, height,
				     format->width, format->height);
	format->width = fsz->width;
	format->height = fsz->height;
	isp4vid_fill_buffer_size(format);

And this will go with a complementary change to isp4vid_fill_buffer_size() to
make it possible to reuse isp4vid_fill_buffer_size() here to remove code
duplication.

> +
> +	if (format->field == V4L2_FIELD_ANY)
> +		format->field = isp4vid_fmt_default.field;
> +
> +	if (format->colorspace == V4L2_COLORSPACE_DEFAULT)
> +		format->colorspace = isp4vid_fmt_default.colorspace;
> +
> +	return 0;
> +}

[snip]

> +static int isp4vid_fill_buffer_size(struct isp4vid_dev *isp_vdev)
> +{
> +	int ret = 0;
> +
> +	switch (isp_vdev->format.pixelformat) {
> +	case V4L2_PIX_FMT_NV12:
> +		isp_vdev->format.bytesperline = isp_vdev->format.width;
> +		isp_vdev->format.sizeimage = isp_vdev->format.bytesperline *
> +					     isp_vdev->format.height * 3 / 2;
> +		break;
> +	case V4L2_PIX_FMT_YUYV:
> +		isp_vdev->format.bytesperline = isp_vdev->format.width;
> +		isp_vdev->format.sizeimage = isp_vdev->format.bytesperline *
> +					     isp_vdev->format.height * 2;
> +		break;
> +	default:
> +		dev_err(isp_vdev->dev, "fail for invalid default format 0x%x",
> +			isp_vdev->format.pixelformat);
> +		ret = -EINVAL;
> +		break;
> +	}
> +
> +	return ret;
> +}

Looks like isp_vdev->format.bytesperline is set wrong here for YUYV, it should
be width * 2.

Move isp4vid_fill_buffer_size() definition above isp4vid_try_fmt_vid_cap() so it
can be used there and change isp4vid_fill_buffer_size() to this:

static int isp4vid_fill_buffer_size(struct v4l2_pix_format *fmt)
{
	switch (fmt->pixelformat) {
	case V4L2_PIX_FMT_NV12: {
		fmt->bytesperline = fmt->width;
		fmt->sizeimage = fmt->bytesperline * fmt->height * 3 / 2;
		break;
	case V4L2_PIX_FMT_YUYV:
		fmt->bytesperline = fmt->width * 2;
		fmt->sizeimage = fmt->bytesperline * fmt->height;
		break;
	default:
		return -EINVAL;
	}

	return 0;
}

This fixes the isp_vdev->format.bytesperline issue too.

> +
> +static const struct vb2_ops isp4vid_qops = {
> +	.queue_setup = isp4vid_qops_queue_setup,
> +	.buf_queue = isp4vid_qops_buffer_queue,
> +	.start_streaming = isp4vid_qops_start_streaming,
> +	.stop_streaming = isp4vid_qops_stop_streaming,
> +	.wait_prepare = vb2_ops_wait_prepare,
> +	.wait_finish = vb2_ops_wait_finish,
> +};
> +
> +int isp4vid_dev_init(struct isp4vid_dev *isp_vdev, struct v4l2_subdev *isp_sdev,
> +		     const struct isp4vid_ops *ops)
> +{
> +	const char *vdev_name = isp4vid_video_dev_name;
> +	struct v4l2_device *v4l2_dev;
> +	struct video_device *vdev;
> +	struct vb2_queue *q;
> +	int ret;
> +
> +	if (!isp_vdev || !isp_sdev || !isp_sdev->v4l2_dev)
> +		return -EINVAL;
> +
> +	v4l2_dev = isp_sdev->v4l2_dev;
> +	vdev = &isp_vdev->vdev;
> +
> +	isp_vdev->isp_sdev = isp_sdev;
> +	isp_vdev->dev = v4l2_dev->dev;
> +	isp_vdev->ops = ops;
> +
> +	/* Initialize the vb2_queue struct */
> +	mutex_init(&isp_vdev->vbq_lock);
> +	q = &isp_vdev->vbq;
> +	q->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
> +	q->io_modes = VB2_MMAP | VB2_DMABUF;
> +	q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
> +	q->buf_struct_size = sizeof(struct isp4vid_capture_buffer);
> +	q->min_queued_buffers = 2;
> +	q->ops = &isp4vid_qops;
> +	q->drv_priv = isp_vdev;
> +	q->mem_ops = &isp4vid_vb2_memops;
> +	q->lock = &isp_vdev->vbq_lock;
> +	q->dev = v4l2_dev->dev;
> +	ret = vb2_queue_init(q);
> +	if (ret) {
> +		dev_err(v4l2_dev->dev, "vb2_queue_init error:%d", ret);
> +		return ret;
> +	}
> +	/* Initialize buffer list and its lock */
> +	mutex_init(&isp_vdev->buf_list_lock);
> +	INIT_LIST_HEAD(&isp_vdev->buf_list);
> +
> +	/* Set default frame format */
> +	isp_vdev->format = isp4vid_fmt_default;
> +	isp_vdev->timeperframe = ISP4VID_ISP_TPF_DEFAULT;
> +	v4l2_simplify_fraction(&isp_vdev->timeperframe.numerator,
> +			       &isp_vdev->timeperframe.denominator, 8, 333);
> +
> +	ret = isp4vid_fill_buffer_size(isp_vdev);

Change to `ret = isp4vid_fill_buffer_size(&isp_vdev->format);`

> +	if (ret) {
> +		dev_err(v4l2_dev->dev, "fail to fill buffer size: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = isp4vid_set_fmt_2_isp(isp_sdev, &isp_vdev->format);
> +	if (ret) {
> +		dev_err(v4l2_dev->dev, "fail init format :%d\n", ret);
> +		return ret;
> +	}
> +
> +	/* Initialize the video_device struct */
> +	isp_vdev->vdev.entity.name = vdev_name;
> +	isp_vdev->vdev.entity.function = MEDIA_ENT_F_IO_V4L;
> +	isp_vdev->vdev_pad.flags = MEDIA_PAD_FL_SINK;
> +	ret = media_entity_pads_init(&isp_vdev->vdev.entity, 1,
> +				     &isp_vdev->vdev_pad);
> +
> +	if (ret) {
> +		dev_err(v4l2_dev->dev, "init media entity pad fail:%d\n", ret);
> +		return ret;
> +	}
> +
> +	vdev->device_caps = V4L2_CAP_VIDEO_CAPTURE |
> +			    V4L2_CAP_STREAMING | V4L2_CAP_IO_MC;
> +	vdev->entity.ops = &isp4vid_vdev_ent_ops;
> +	vdev->release = video_device_release_empty;
> +	vdev->fops = &isp4vid_vdev_fops;
> +	vdev->ioctl_ops = &isp4vid_vdev_ioctl_ops;
> +	vdev->lock = NULL;
> +	vdev->queue = q;
> +	vdev->v4l2_dev = v4l2_dev;
> +	vdev->vfl_dir = VFL_DIR_RX;
> +	strscpy(vdev->name, vdev_name, sizeof(vdev->name));
> +	video_set_drvdata(vdev, isp_vdev);
> +
> +	ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
> +	if (ret)
> +		dev_err(v4l2_dev->dev, "register video device fail:%d\n", ret);

No error handling?

> +
> +	return ret;
> +}
> +
> +void isp4vid_dev_deinit(struct isp4vid_dev *isp_vdev)
> +{
> +	video_unregister_device(&isp_vdev->vdev);
> +}
> diff --git a/drivers/media/platform/amd/isp4/isp4_video.h b/drivers/media/platform/amd/isp4/isp4_video.h
> new file mode 100644
> index 000000000000..fae7dbdedd18
> --- /dev/null
> +++ b/drivers/media/platform/amd/isp4/isp4_video.h

[snip]

> +
> +struct isp4vid_capture_buffer {
> +	/*
> +	 * struct vb2_v4l2_buffer must be the first element
> +	 * the videobuf2 framework will allocate this struct based on
> +	 * buf_struct_size and use the first sizeof(struct vb2_buffer) bytes of
> +	 * memory as a vb2_buffer
> +	 */
> +	struct vb2_v4l2_buffer vb2;
> +	struct isp4if_img_buf_info img_buf;
> +	struct list_head list;
> +};
> +
> +struct isp4vid_dev;

Unnecessary isp4vid_dev forward declaration, remove it.

> +
> +struct isp4vid_ops {
> +	int (*send_buffer)(struct v4l2_subdev *sd,
> +			   struct isp4if_img_buf_info *img_buf);
> +};
> +
> +struct isp4vid_dev {
> +	struct video_device vdev;
> +	struct media_pad vdev_pad;
> +	struct v4l2_pix_format format;
> +
> +	/* mutex that protects vbq */
> +	struct mutex vbq_lock;
> +	struct vb2_queue vbq;
> +
> +	/* mutex that protects buf_list */
> +	struct mutex buf_list_lock;
> +	struct list_head buf_list;
> +
> +	u32 sequence;
> +	bool stream_started;
> +	struct task_struct *kthread;

Remove unused `kthread` struct member.

> +
> +	struct media_pipeline pipe;
> +	struct device *dev;
> +	struct v4l2_subdev *isp_sdev;
> +	struct v4l2_fract timeperframe;
> +
> +	/* Callback operations */
> +	const struct isp4vid_ops *ops;
> +};
> +
> +int isp4vid_dev_init(struct isp4vid_dev *isp_vdev,
> +		     struct v4l2_subdev *isp_sdev,
> +		     const struct isp4vid_ops *ops);
> +
> +void isp4vid_dev_deinit(struct isp4vid_dev *isp_vdev);
> +
> +s32 isp4vid_notify(void *cb_ctx, struct isp4vid_framedone_param *evt_param);
> +
> +#endif
> -- 
> 2.34.1
> 

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/include/media/media-device.h?h=v6.17-rc7#n204
[2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/include/media/media-device.h?h=v6.17-rc7#n289

Sultan

