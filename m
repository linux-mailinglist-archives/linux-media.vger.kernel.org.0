Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 83E95419D6
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2019 03:08:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407524AbfFLBIR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 Jun 2019 21:08:17 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:37263 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405839AbfFLBIR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 Jun 2019 21:08:17 -0400
Received: by mail-wm1-f67.google.com with SMTP id 22so4730781wmg.2
        for <linux-media@vger.kernel.org>; Tue, 11 Jun 2019 18:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=3jkXvknQg8EEGSuEMMPIwxQOU6c9pyrx4DRxzjnb8aQ=;
        b=lRlrys1AbooA28b0mROR34+jQpivC/kCUC4gAS1b4AoIf5MGFj9CW+EnvSoyZiAMXo
         ofZN5TTOqG3zzhs3IqD3FuS/nYzK28qFabKlPGKW+mr9M3V/TfhrI/EGY9BjgqnpxT+G
         1rp10o9+9mA2x18kolsw8IYnJZUx1Al4CwrIs8d9TXBJ3W8tr+MxntTeW12ym9/LhJj2
         TYczx9Em579ZXNnyG32HDw+kFu1pclRBaN7z7VlWwrStQpdZCEv4Oim6N+khZtOvysmt
         UKptCxWfG1+tHraeEQYTBerjk5wALc8e9S3naSOT1bC+Z6gXBTasXG8i4gG5ahH4LgMo
         tOXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=3jkXvknQg8EEGSuEMMPIwxQOU6c9pyrx4DRxzjnb8aQ=;
        b=oib2r/vAd44byssKdYIkCgjguV5+sxpylM73CVFxZt+7X/WtpeGq6xjXBfoZyIEjtX
         XarkSAmEtlFxvBHRk4QA5tCz/37FPJmU2shL381ERp2K18vZCbSbCkVgvkz9AMEiL0xf
         jT0zofltR6ZfSsQ6BDyjWClHdpibSKGzxhgFqAKFQ+EZZBKJTf8GYz8oRvy04yze5Y0y
         OVjGNX5v+pyKigsUwatD1rWnrkEhRWcEuP9ChbCTz8bi8sb0UdaL6grpaq9UaF7HElwm
         8TsKRE/7TfDfh+p+CuNODppN965AWZwVburgsNFt7tzCZICsci0/UpSDWbguXTOGAIeI
         yj6g==
X-Gm-Message-State: APjAAAXzmAhJeMn+eWztrQu0xDCWXVWkJ6aZy/nSc+sxq/6LNXlE/6vi
        XkRpQfukaCz4ejePXvHABDw=
X-Google-Smtp-Source: APXvYqznS0AG2bMuVboqz8dh9ISycy5g/0+onCTGZSjkkDe7YD9YnVuvD8ZRC83Sf6zqWFAmfDLFOQ==
X-Received: by 2002:a1c:1d8d:: with SMTP id d135mr18682351wmd.54.1560301691102;
        Tue, 11 Jun 2019 18:08:11 -0700 (PDT)
Received: from [172.30.88.199] (sjewanfw1-nat.mentorg.com. [139.181.7.34])
        by smtp.gmail.com with ESMTPSA id 32sm36032345wra.35.2019.06.11.18.08.07
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 11 Jun 2019 18:08:10 -0700 (PDT)
Subject: Re: [PATCH v8] media: imx: add mem2mem device
To:     Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org
Cc:     Hans Verkuil <hans.verkuil@cisco.com>,
        Tim Harvey <tharvey@gateworks.com>, kernel@pengutronix.de
References: <20190418164414.29373-1-p.zabel@pengutronix.de>
From:   Steve Longerbeam <slongerbeam@gmail.com>
Message-ID: <9ca64889-046f-324c-9a5a-94ea0082f21e@gmail.com>
Date:   Tue, 11 Jun 2019 18:08:04 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190418164414.29373-1-p.zabel@pengutronix.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Philipp,

Version 9 will also need to fix merge conflicts due to the recent module 
re-org and the switch to sync registration for the IPU internal subdevs.

I've done that work already, feel free to cherry-pick it from my github 
fork if you agree with the merge fixes:

git@github.com:slongerbeam/mediatree.git, branch imx/mem2mem.v8.

Btw, some bugs have been found and fixed in ipu-image-convert.c. I will 
be posting a patch-set shortly. You can review branch imx/bgthree-2136 
in my fork for the changes.

Steve


On 4/18/19 9:44 AM, Philipp Zabel wrote:
> Add a single imx-media mem2mem video device that uses the IPU IC PP
> (image converter post processing) task for scaling and colorspace
> conversion.
> On i.MX6Q/DL SoCs with two IPUs currently only the first IPU is used.
>
> The hardware only supports writing to destination buffers up to
> 1024x1024 pixels in a single pass, arbitrary sizes can be achieved
> by rendering multiple tiles per frame.
>
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> [slongerbeam@gmail.com: use ipu_image_convert_adjust(), fix
>   device_run() error handling, add missing media-device header,
>   unregister and remove the mem2mem device in error paths in
>   imx_media_probe_complete() and in imx_media_remove()]
> Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
> ---
> Changes since v7 [1]:
>   - Change capture format to keep aspect ration when changing rotation.
>   - Adjust output and update formats to alignment requirements, if
>     necessary when changing rotation or flip modes.
>   - Disallow changing rotation or flip modes if a format change is
>     required on a busy queue.
>   - Add sequence counting.
>   - Use v4l2_m2m_buf_copy_metadata.
>   - Disallow interlaced field modes.
>   - Rename video device to "ipu_ic_pp csc/scaler".
>
> [1] https://patchwork.linuxtv.org/patch/53968/
> ---
>   drivers/staging/media/imx/Kconfig             |   1 +
>   drivers/staging/media/imx/Makefile            |   1 +
>   .../staging/media/imx/imx-media-csc-scaler.c  | 917 ++++++++++++++++++
>   drivers/staging/media/imx/imx-media-dev.c     |  34 +-
>   drivers/staging/media/imx/imx-media.h         |  10 +
>   5 files changed, 959 insertions(+), 4 deletions(-)
>   create mode 100644 drivers/staging/media/imx/imx-media-csc-scaler.c
>
> diff --git a/drivers/staging/media/imx/Kconfig b/drivers/staging/media/imx/Kconfig
> index f6d220b649fb..9bf14eb2154b 100644
> --- a/drivers/staging/media/imx/Kconfig
> +++ b/drivers/staging/media/imx/Kconfig
> @@ -6,6 +6,7 @@ config VIDEO_IMX_MEDIA
>   	depends on HAS_DMA
>   	select VIDEOBUF2_DMA_CONTIG
>   	select V4L2_FWNODE
> +	select V4L2_MEM2MEM_DEV
>   	help
>   	  Say yes here to enable support for video4linux media controller
>   	  driver for the i.MX5/6 SOC.
> diff --git a/drivers/staging/media/imx/Makefile b/drivers/staging/media/imx/Makefile
> index d2d909a36239..0c86723f1763 100644
> --- a/drivers/staging/media/imx/Makefile
> +++ b/drivers/staging/media/imx/Makefile
> @@ -7,6 +7,7 @@ imx-media-ic-objs := imx-ic-common.o imx-ic-prp.o imx-ic-prpencvf.o
>   obj-$(CONFIG_VIDEO_IMX_MEDIA) += imx-media.o
>   obj-$(CONFIG_VIDEO_IMX_MEDIA) += imx-media-common.o
>   obj-$(CONFIG_VIDEO_IMX_MEDIA) += imx-media-capture.o
> +obj-$(CONFIG_VIDEO_IMX_MEDIA) += imx-media-csc-scaler.o
>   obj-$(CONFIG_VIDEO_IMX_MEDIA) += imx-media-vdic.o
>   obj-$(CONFIG_VIDEO_IMX_MEDIA) += imx-media-ic.o
>   
> diff --git a/drivers/staging/media/imx/imx-media-csc-scaler.c b/drivers/staging/media/imx/imx-media-csc-scaler.c
> new file mode 100644
> index 000000000000..4a0ecdfe38e6
> --- /dev/null
> +++ b/drivers/staging/media/imx/imx-media-csc-scaler.c
> @@ -0,0 +1,917 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * i.MX IPUv3 IC PP mem2mem CSC/Scaler driver
> + *
> + * Copyright (C) 2011 Pengutronix, Sascha Hauer
> + * Copyright (C) 2018 Pengutronix, Philipp Zabel
> + */
> +#include <linux/module.h>
> +#include <linux/delay.h>
> +#include <linux/fs.h>
> +#include <linux/version.h>
> +#include <linux/sched.h>
> +#include <linux/slab.h>
> +#include <video/imx-ipu-v3.h>
> +#include <video/imx-ipu-image-convert.h>
> +
> +#include <media/media-device.h>
> +#include <media/v4l2-ctrls.h>
> +#include <media/v4l2-event.h>
> +#include <media/v4l2-mem2mem.h>
> +#include <media/v4l2-device.h>
> +#include <media/v4l2-ioctl.h>
> +#include <media/videobuf2-dma-contig.h>
> +
> +#include "imx-media.h"
> +
> +#define fh_to_ctx(__fh)	container_of(__fh, struct ipu_csc_scaler_ctx, fh)
> +
> +enum {
> +	V4L2_M2M_SRC = 0,
> +	V4L2_M2M_DST = 1,
> +};
> +
> +struct ipu_csc_scaler_priv {
> +	struct imx_media_video_dev	vdev;
> +
> +	struct v4l2_m2m_dev		*m2m_dev;
> +	struct device			*dev;
> +
> +	struct imx_media_dev		*md;
> +
> +	struct mutex			mutex;	/* mem2mem device mutex */
> +};
> +
> +#define vdev_to_priv(v) container_of(v, struct ipu_csc_scaler_priv, vdev)
> +
> +/* Per-queue, driver-specific private data */
> +struct ipu_csc_scaler_q_data {
> +	struct v4l2_pix_format		cur_fmt;
> +	struct v4l2_rect		rect;
> +};
> +
> +struct ipu_csc_scaler_ctx {
> +	struct ipu_csc_scaler_priv	*priv;
> +
> +	struct v4l2_fh			fh;
> +	struct ipu_csc_scaler_q_data	q_data[2];
> +	struct ipu_image_convert_ctx	*icc;
> +
> +	struct v4l2_ctrl_handler	ctrl_hdlr;
> +	int				rotate;
> +	bool				hflip;
> +	bool				vflip;
> +	enum ipu_rotate_mode		rot_mode;
> +	unsigned int			sequence;
> +};
> +
> +static struct ipu_csc_scaler_q_data *get_q_data(struct ipu_csc_scaler_ctx *ctx,
> +						enum v4l2_buf_type type)
> +{
> +	if (V4L2_TYPE_IS_OUTPUT(type))
> +		return &ctx->q_data[V4L2_M2M_SRC];
> +	else
> +		return &ctx->q_data[V4L2_M2M_DST];
> +}
> +
> +/*
> + * mem2mem callbacks
> + */
> +
> +static void job_abort(void *_ctx)
> +{
> +	struct ipu_csc_scaler_ctx *ctx = _ctx;
> +
> +	if (ctx->icc)
> +		ipu_image_convert_abort(ctx->icc);
> +}
> +
> +static void ipu_ic_pp_complete(struct ipu_image_convert_run *run, void *_ctx)
> +{
> +	struct ipu_csc_scaler_ctx *ctx = _ctx;
> +	struct ipu_csc_scaler_priv *priv = ctx->priv;
> +	struct vb2_v4l2_buffer *src_buf, *dst_buf;
> +
> +	src_buf = v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
> +	dst_buf = v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
> +
> +	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf, true);
> +
> +	src_buf->sequence = dst_buf->sequence = ctx->sequence++;
> +
> +	v4l2_m2m_buf_done(src_buf, run->status ? VB2_BUF_STATE_ERROR :
> +						 VB2_BUF_STATE_DONE);
> +	v4l2_m2m_buf_done(dst_buf, run->status ? VB2_BUF_STATE_ERROR :
> +						 VB2_BUF_STATE_DONE);
> +
> +	v4l2_m2m_job_finish(priv->m2m_dev, ctx->fh.m2m_ctx);
> +	kfree(run);
> +}
> +
> +static void device_run(void *_ctx)
> +{
> +	struct ipu_csc_scaler_ctx *ctx = _ctx;
> +	struct ipu_csc_scaler_priv *priv = ctx->priv;
> +	struct vb2_v4l2_buffer *src_buf, *dst_buf;
> +	struct ipu_image_convert_run *run;
> +	int ret;
> +
> +	src_buf = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
> +	dst_buf = v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
> +
> +	run = kzalloc(sizeof(*run), GFP_KERNEL);
> +	if (!run)
> +		goto err;
> +
> +	run->ctx = ctx->icc;
> +	run->in_phys = vb2_dma_contig_plane_dma_addr(&src_buf->vb2_buf, 0);
> +	run->out_phys = vb2_dma_contig_plane_dma_addr(&dst_buf->vb2_buf, 0);
> +
> +	ret = ipu_image_convert_queue(run);
> +	if (ret < 0) {
> +		v4l2_err(ctx->priv->vdev.vfd->v4l2_dev,
> +			 "%s: failed to queue: %d\n", __func__, ret);
> +		goto err;
> +	}
> +
> +	return;
> +
> +err:
> +	v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
> +	v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
> +	v4l2_m2m_buf_done(src_buf, VB2_BUF_STATE_ERROR);
> +	v4l2_m2m_buf_done(dst_buf, VB2_BUF_STATE_ERROR);
> +	v4l2_m2m_job_finish(priv->m2m_dev, ctx->fh.m2m_ctx);
> +}
> +
> +/*
> + * Video ioctls
> + */
> +static int ipu_csc_scaler_querycap(struct file *file, void *priv,
> +				   struct v4l2_capability *cap)
> +{
> +	strscpy(cap->driver, "imx-media-csc-scaler", sizeof(cap->driver));
> +	strscpy(cap->card, "imx-media-csc-scaler", sizeof(cap->card));
> +	strscpy(cap->bus_info, "platform:imx-media-csc-scaler",
> +		sizeof(cap->bus_info));
> +
> +	return 0;
> +}
> +
> +static int ipu_csc_scaler_enum_fmt(struct file *file, void *fh,
> +				   struct v4l2_fmtdesc *f)
> +{
> +	u32 fourcc;
> +	int ret;
> +
> +	ret = imx_media_enum_format(&fourcc, f->index, CS_SEL_ANY);
> +	if (ret)
> +		return ret;
> +
> +	f->pixelformat = fourcc;
> +
> +	return 0;
> +}
> +
> +static int ipu_csc_scaler_g_fmt(struct file *file, void *priv,
> +				struct v4l2_format *f)
> +{
> +	struct ipu_csc_scaler_ctx *ctx = fh_to_ctx(priv);
> +	struct ipu_csc_scaler_q_data *q_data;
> +
> +	q_data = get_q_data(ctx, f->type);
> +
> +	f->fmt.pix = q_data->cur_fmt;
> +
> +	return 0;
> +}
> +
> +static int ipu_csc_scaler_try_fmt(struct file *file, void *priv,
> +				  struct v4l2_format *f)
> +{
> +	struct ipu_csc_scaler_ctx *ctx = fh_to_ctx(priv);
> +	struct ipu_csc_scaler_q_data *q_data = get_q_data(ctx, f->type);
> +	struct ipu_image test_in, test_out;
> +	enum v4l2_field field;
> +
> +	field = f->fmt.pix.field;
> +	if (field == V4L2_FIELD_ANY)
> +		field = V4L2_FIELD_NONE;
> +	else if (field != V4L2_FIELD_NONE)
> +		return -EINVAL;
> +
> +	if (f->type == V4L2_BUF_TYPE_VIDEO_CAPTURE) {
> +		struct ipu_csc_scaler_q_data *q_data_in =
> +			get_q_data(ctx, V4L2_BUF_TYPE_VIDEO_OUTPUT);
> +
> +		test_out.pix = f->fmt.pix;
> +		test_in.pix = q_data_in->cur_fmt;
> +	} else {
> +		struct ipu_csc_scaler_q_data *q_data_out =
> +			get_q_data(ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE);
> +
> +		test_in.pix = f->fmt.pix;
> +		test_out.pix = q_data_out->cur_fmt;
> +	}
> +
> +	ipu_image_convert_adjust(&test_in, &test_out, ctx->rot_mode);
> +
> +	f->fmt.pix = (f->type == V4L2_BUF_TYPE_VIDEO_CAPTURE) ?
> +		test_out.pix : test_in.pix;
> +
> +	if (f->type == V4L2_BUF_TYPE_VIDEO_CAPTURE) {
> +		f->fmt.pix.colorspace = q_data->cur_fmt.colorspace;
> +		f->fmt.pix.ycbcr_enc = q_data->cur_fmt.ycbcr_enc;
> +		f->fmt.pix.xfer_func = q_data->cur_fmt.xfer_func;
> +		f->fmt.pix.quantization = q_data->cur_fmt.quantization;
> +	} else if (f->fmt.pix.colorspace == V4L2_COLORSPACE_DEFAULT) {
> +		f->fmt.pix.colorspace = V4L2_COLORSPACE_SRGB;
> +		f->fmt.pix.ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
> +		f->fmt.pix.xfer_func = V4L2_XFER_FUNC_DEFAULT;
> +		f->fmt.pix.quantization = V4L2_QUANTIZATION_DEFAULT;
> +	}
> +
> +	return 0;
> +}
> +
> +static int ipu_csc_scaler_s_fmt(struct file *file, void *priv,
> +				struct v4l2_format *f)
> +{
> +	struct ipu_csc_scaler_q_data *q_data;
> +	struct ipu_csc_scaler_ctx *ctx = fh_to_ctx(priv);
> +	struct vb2_queue *vq;
> +	int ret;
> +
> +	vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type);
> +	if (vb2_is_busy(vq)) {
> +		v4l2_err(ctx->priv->vdev.vfd->v4l2_dev, "%s: queue busy\n",
> +			 __func__);
> +		return -EBUSY;
> +	}
> +
> +	q_data = get_q_data(ctx, f->type);
> +
> +	ret = ipu_csc_scaler_try_fmt(file, priv, f);
> +	if (ret < 0)
> +		return ret;
> +
> +	q_data->cur_fmt.width = f->fmt.pix.width;
> +	q_data->cur_fmt.height = f->fmt.pix.height;
> +	q_data->cur_fmt.pixelformat = f->fmt.pix.pixelformat;
> +	q_data->cur_fmt.field = f->fmt.pix.field;
> +	q_data->cur_fmt.bytesperline = f->fmt.pix.bytesperline;
> +	q_data->cur_fmt.sizeimage = f->fmt.pix.sizeimage;
> +
> +	/* Reset cropping/composing rectangle */
> +	q_data->rect.left = 0;
> +	q_data->rect.top = 0;
> +	q_data->rect.width = q_data->cur_fmt.width;
> +	q_data->rect.height = q_data->cur_fmt.height;
> +
> +	if (f->type == V4L2_BUF_TYPE_VIDEO_OUTPUT) {
> +		/* Set colorimetry on the output queue */
> +		q_data->cur_fmt.colorspace = f->fmt.pix.colorspace;
> +		q_data->cur_fmt.ycbcr_enc = f->fmt.pix.ycbcr_enc;
> +		q_data->cur_fmt.xfer_func = f->fmt.pix.xfer_func;
> +		q_data->cur_fmt.quantization = f->fmt.pix.quantization;
> +		/* Propagate colorimetry to the capture queue */
> +		q_data = get_q_data(ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE);
> +		q_data->cur_fmt.colorspace = f->fmt.pix.colorspace;
> +		q_data->cur_fmt.ycbcr_enc = f->fmt.pix.ycbcr_enc;
> +		q_data->cur_fmt.xfer_func = f->fmt.pix.xfer_func;
> +		q_data->cur_fmt.quantization = f->fmt.pix.quantization;
> +	}
> +
> +	/*
> +	 * TODO: Setting colorimetry on the capture queue is currently not
> +	 * supported by the V4L2 API
> +	 */
> +
> +	return 0;
> +}
> +
> +static int ipu_csc_scaler_g_selection(struct file *file, void *priv,
> +				      struct v4l2_selection *s)
> +{
> +	struct ipu_csc_scaler_ctx *ctx = fh_to_ctx(priv);
> +	struct ipu_csc_scaler_q_data *q_data;
> +
> +	switch (s->target) {
> +	case V4L2_SEL_TGT_CROP:
> +	case V4L2_SEL_TGT_CROP_DEFAULT:
> +	case V4L2_SEL_TGT_CROP_BOUNDS:
> +		if (s->type != V4L2_BUF_TYPE_VIDEO_OUTPUT)
> +			return -EINVAL;
> +		q_data = get_q_data(ctx, V4L2_BUF_TYPE_VIDEO_OUTPUT);
> +		break;
> +	case V4L2_SEL_TGT_COMPOSE:
> +	case V4L2_SEL_TGT_COMPOSE_DEFAULT:
> +	case V4L2_SEL_TGT_COMPOSE_BOUNDS:
> +		if (s->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
> +			return -EINVAL;
> +		q_data = get_q_data(ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE);
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	if (s->target == V4L2_SEL_TGT_CROP ||
> +	    s->target == V4L2_SEL_TGT_COMPOSE) {
> +		s->r = q_data->rect;
> +	} else {
> +		s->r.left = 0;
> +		s->r.top = 0;
> +		s->r.width = q_data->cur_fmt.width;
> +		s->r.height = q_data->cur_fmt.height;
> +	}
> +
> +	return 0;
> +}
> +
> +static int ipu_csc_scaler_s_selection(struct file *file, void *priv,
> +				      struct v4l2_selection *s)
> +{
> +	struct ipu_csc_scaler_ctx *ctx = fh_to_ctx(priv);
> +	struct ipu_csc_scaler_q_data *q_data;
> +
> +	switch (s->target) {
> +	case V4L2_SEL_TGT_CROP:
> +		if (s->type != V4L2_BUF_TYPE_VIDEO_OUTPUT)
> +			return -EINVAL;
> +		break;
> +	case V4L2_SEL_TGT_COMPOSE:
> +		if (s->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
> +			return -EINVAL;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	if (s->type != V4L2_BUF_TYPE_VIDEO_CAPTURE &&
> +	    s->type != V4L2_BUF_TYPE_VIDEO_OUTPUT)
> +		return -EINVAL;
> +
> +	q_data = get_q_data(ctx, s->type);
> +
> +	/* The input's frame width to the IC must be a multiple of 8 pixels
> +	 * When performing resizing the frame width must be multiple of burst
> +	 * size - 8 or 16 pixels as defined by CB#_BURST_16 parameter.
> +	 */
> +	if (s->flags & V4L2_SEL_FLAG_GE)
> +		s->r.width = round_up(s->r.width, 8);
> +	if (s->flags & V4L2_SEL_FLAG_LE)
> +		s->r.width = round_down(s->r.width, 8);
> +	s->r.width = clamp_t(unsigned int, s->r.width, 8,
> +			     round_down(q_data->cur_fmt.width, 8));
> +	s->r.height = clamp_t(unsigned int, s->r.height, 1,
> +			      q_data->cur_fmt.height);
> +	s->r.left = clamp_t(unsigned int, s->r.left, 0,
> +			    q_data->cur_fmt.width - s->r.width);
> +	s->r.top = clamp_t(unsigned int, s->r.top, 0,
> +			   q_data->cur_fmt.height - s->r.height);
> +
> +	/* V4L2_SEL_FLAG_KEEP_CONFIG is only valid for subdevices */
> +	q_data->rect = s->r;
> +
> +	return 0;
> +}
> +
> +static const struct v4l2_ioctl_ops ipu_csc_scaler_ioctl_ops = {
> +	.vidioc_querycap		= ipu_csc_scaler_querycap,
> +
> +	.vidioc_enum_fmt_vid_cap	= ipu_csc_scaler_enum_fmt,
> +	.vidioc_g_fmt_vid_cap		= ipu_csc_scaler_g_fmt,
> +	.vidioc_try_fmt_vid_cap		= ipu_csc_scaler_try_fmt,
> +	.vidioc_s_fmt_vid_cap		= ipu_csc_scaler_s_fmt,
> +
> +	.vidioc_enum_fmt_vid_out	= ipu_csc_scaler_enum_fmt,
> +	.vidioc_g_fmt_vid_out		= ipu_csc_scaler_g_fmt,
> +	.vidioc_try_fmt_vid_out		= ipu_csc_scaler_try_fmt,
> +	.vidioc_s_fmt_vid_out		= ipu_csc_scaler_s_fmt,
> +
> +	.vidioc_g_selection		= ipu_csc_scaler_g_selection,
> +	.vidioc_s_selection		= ipu_csc_scaler_s_selection,
> +
> +	.vidioc_reqbufs			= v4l2_m2m_ioctl_reqbufs,
> +	.vidioc_querybuf		= v4l2_m2m_ioctl_querybuf,
> +
> +	.vidioc_qbuf			= v4l2_m2m_ioctl_qbuf,
> +	.vidioc_expbuf			= v4l2_m2m_ioctl_expbuf,
> +	.vidioc_dqbuf			= v4l2_m2m_ioctl_dqbuf,
> +	.vidioc_create_bufs		= v4l2_m2m_ioctl_create_bufs,
> +	.vidioc_prepare_buf		= v4l2_m2m_ioctl_prepare_buf,
> +
> +	.vidioc_streamon		= v4l2_m2m_ioctl_streamon,
> +	.vidioc_streamoff		= v4l2_m2m_ioctl_streamoff,
> +
> +	.vidioc_subscribe_event		= v4l2_ctrl_subscribe_event,
> +	.vidioc_unsubscribe_event	= v4l2_event_unsubscribe,
> +};
> +
> +/*
> + * Queue operations
> + */
> +
> +static int ipu_csc_scaler_queue_setup(struct vb2_queue *vq,
> +				      unsigned int *nbuffers,
> +				      unsigned int *nplanes,
> +				      unsigned int sizes[],
> +				      struct device *alloc_devs[])
> +{
> +	struct ipu_csc_scaler_ctx *ctx = vb2_get_drv_priv(vq);
> +	struct ipu_csc_scaler_q_data *q_data;
> +	unsigned int size, count = *nbuffers;
> +
> +	q_data = get_q_data(ctx, vq->type);
> +
> +	size = q_data->cur_fmt.sizeimage;
> +
> +	*nbuffers = count;
> +
> +	if (*nplanes)
> +		return sizes[0] < size ? -EINVAL : 0;
> +
> +	*nplanes = 1;
> +	sizes[0] = size;
> +
> +	dev_dbg(ctx->priv->dev, "get %d buffer(s) of size %d each.\n",
> +		count, size);
> +
> +	return 0;
> +}
> +
> +static int ipu_csc_scaler_buf_prepare(struct vb2_buffer *vb)
> +{
> +	struct vb2_queue *vq = vb->vb2_queue;
> +	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
> +	struct ipu_csc_scaler_ctx *ctx = vb2_get_drv_priv(vq);
> +	struct ipu_csc_scaler_q_data *q_data;
> +	unsigned long size;
> +
> +	dev_dbg(ctx->priv->dev, "type: %d\n", vq->type);
> +
> +	if (V4L2_TYPE_IS_OUTPUT(vq->type)) {
> +		if (vbuf->field == V4L2_FIELD_ANY)
> +			vbuf->field = V4L2_FIELD_NONE;
> +		if (vbuf->field != V4L2_FIELD_NONE) {
> +			dev_dbg(ctx->priv->dev, "%s: field isn't supported\n",
> +				__func__);
> +			return -EINVAL;
> +		}
> +	}
> +
> +	q_data = get_q_data(ctx, vq->type);
> +	size = q_data->cur_fmt.sizeimage;
> +
> +	if (vb2_plane_size(vb, 0) < size) {
> +		dev_dbg(ctx->priv->dev,
> +			"%s: data will not fit into plane (%lu < %lu)\n",
> +			__func__, vb2_plane_size(vb, 0), size);
> +		return -EINVAL;
> +	}
> +
> +	vb2_set_plane_payload(vb, 0, size);
> +
> +	return 0;
> +}
> +
> +static void ipu_csc_scaler_buf_queue(struct vb2_buffer *vb)
> +{
> +	struct ipu_csc_scaler_ctx *ctx = vb2_get_drv_priv(vb->vb2_queue);
> +
> +	v4l2_m2m_buf_queue(ctx->fh.m2m_ctx, to_vb2_v4l2_buffer(vb));
> +}
> +
> +static void ipu_image_from_q_data(struct ipu_image *im,
> +				  struct ipu_csc_scaler_q_data *q_data)
> +{
> +	im->pix.width = q_data->cur_fmt.width;
> +	im->pix.height = q_data->cur_fmt.height;
> +	im->pix.bytesperline = q_data->cur_fmt.bytesperline;
> +	im->pix.pixelformat = q_data->cur_fmt.pixelformat;
> +	im->rect = q_data->rect;
> +}
> +
> +static int ipu_csc_scaler_start_streaming(struct vb2_queue *q,
> +					  unsigned int count)
> +{
> +	const enum ipu_ic_task ic_task = IC_TASK_POST_PROCESSOR;
> +	struct ipu_csc_scaler_ctx *ctx = vb2_get_drv_priv(q);
> +	struct ipu_csc_scaler_priv *priv = ctx->priv;
> +	struct ipu_soc *ipu = priv->md->ipu[0];
> +	struct ipu_csc_scaler_q_data *q_data;
> +	struct vb2_queue *other_q;
> +	struct ipu_image in, out;
> +
> +	other_q = v4l2_m2m_get_vq(ctx->fh.m2m_ctx,
> +				  (q->type == V4L2_BUF_TYPE_VIDEO_CAPTURE) ?
> +				  V4L2_BUF_TYPE_VIDEO_OUTPUT :
> +				  V4L2_BUF_TYPE_VIDEO_CAPTURE);
> +	if (!vb2_is_streaming(other_q))
> +		return 0;
> +
> +	if (ctx->icc) {
> +		v4l2_warn(ctx->priv->vdev.vfd->v4l2_dev, "removing old ICC\n");
> +		ipu_image_convert_unprepare(ctx->icc);
> +	}
> +
> +	q_data = get_q_data(ctx, V4L2_BUF_TYPE_VIDEO_OUTPUT);
> +	ipu_image_from_q_data(&in, q_data);
> +
> +	q_data = get_q_data(ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE);
> +	ipu_image_from_q_data(&out, q_data);
> +
> +	ctx->icc = ipu_image_convert_prepare(ipu, ic_task, &in, &out,
> +					     ctx->rot_mode,
> +					     ipu_ic_pp_complete, ctx);
> +	if (IS_ERR(ctx->icc)) {
> +		struct vb2_v4l2_buffer *buf;
> +		int ret = PTR_ERR(ctx->icc);
> +
> +		ctx->icc = NULL;
> +		v4l2_err(ctx->priv->vdev.vfd->v4l2_dev, "%s: error %d\n",
> +			 __func__, ret);
> +		while ((buf = v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx)))
> +			v4l2_m2m_buf_done(buf, VB2_BUF_STATE_QUEUED);
> +		while ((buf = v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx)))
> +			v4l2_m2m_buf_done(buf, VB2_BUF_STATE_QUEUED);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static void ipu_csc_scaler_stop_streaming(struct vb2_queue *q)
> +{
> +	struct ipu_csc_scaler_ctx *ctx = vb2_get_drv_priv(q);
> +	struct vb2_v4l2_buffer *buf;
> +
> +	if (ctx->icc) {
> +		ipu_image_convert_unprepare(ctx->icc);
> +		ctx->icc = NULL;
> +	}
> +
> +	ctx->sequence = 0;
> +
> +	if (q->type == V4L2_BUF_TYPE_VIDEO_OUTPUT) {
> +		while ((buf = v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx)))
> +			v4l2_m2m_buf_done(buf, VB2_BUF_STATE_ERROR);
> +	} else {
> +		while ((buf = v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx)))
> +			v4l2_m2m_buf_done(buf, VB2_BUF_STATE_ERROR);
> +	}
> +}
> +
> +static const struct vb2_ops ipu_csc_scaler_qops = {
> +	.queue_setup		= ipu_csc_scaler_queue_setup,
> +	.buf_prepare		= ipu_csc_scaler_buf_prepare,
> +	.buf_queue		= ipu_csc_scaler_buf_queue,
> +	.wait_prepare		= vb2_ops_wait_prepare,
> +	.wait_finish		= vb2_ops_wait_finish,
> +	.start_streaming	= ipu_csc_scaler_start_streaming,
> +	.stop_streaming		= ipu_csc_scaler_stop_streaming,
> +};
> +
> +static int ipu_csc_scaler_queue_init(void *priv, struct vb2_queue *src_vq,
> +				     struct vb2_queue *dst_vq)
> +{
> +	struct ipu_csc_scaler_ctx *ctx = priv;
> +	int ret;
> +
> +	memset(src_vq, 0, sizeof(*src_vq));
> +	src_vq->type = V4L2_BUF_TYPE_VIDEO_OUTPUT;
> +	src_vq->io_modes = VB2_MMAP | VB2_DMABUF;
> +	src_vq->drv_priv = ctx;
> +	src_vq->buf_struct_size = sizeof(struct v4l2_m2m_buffer);
> +	src_vq->ops = &ipu_csc_scaler_qops;
> +	src_vq->mem_ops = &vb2_dma_contig_memops;
> +	src_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
> +	src_vq->lock = &ctx->priv->mutex;
> +	src_vq->dev = ctx->priv->dev;
> +
> +	ret = vb2_queue_init(src_vq);
> +	if (ret)
> +		return ret;
> +
> +	memset(dst_vq, 0, sizeof(*dst_vq));
> +	dst_vq->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
> +	dst_vq->io_modes = VB2_MMAP | VB2_DMABUF;
> +	dst_vq->drv_priv = ctx;
> +	dst_vq->buf_struct_size = sizeof(struct v4l2_m2m_buffer);
> +	dst_vq->ops = &ipu_csc_scaler_qops;
> +	dst_vq->mem_ops = &vb2_dma_contig_memops;
> +	dst_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
> +	dst_vq->lock = &ctx->priv->mutex;
> +	dst_vq->dev = ctx->priv->dev;
> +
> +	return vb2_queue_init(dst_vq);
> +}
> +
> +static int ipu_csc_scaler_s_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +	struct ipu_csc_scaler_ctx *ctx = container_of(ctrl->handler,
> +						      struct ipu_csc_scaler_ctx,
> +						      ctrl_hdlr);
> +	enum ipu_rotate_mode rot_mode;
> +	int rotate;
> +	bool hflip, vflip;
> +	int ret = 0;
> +
> +	rotate = ctx->rotate;
> +	hflip = ctx->hflip;
> +	vflip = ctx->vflip;
> +
> +	switch (ctrl->id) {
> +	case V4L2_CID_HFLIP:
> +		hflip = ctrl->val;
> +		break;
> +	case V4L2_CID_VFLIP:
> +		vflip = ctrl->val;
> +		break;
> +	case V4L2_CID_ROTATE:
> +		rotate = ctrl->val;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	ret = ipu_degrees_to_rot_mode(&rot_mode, rotate, hflip, vflip);
> +	if (ret)
> +		return ret;
> +
> +	if (rot_mode != ctx->rot_mode) {
> +		struct v4l2_pix_format *in_fmt, *out_fmt;
> +		struct ipu_image test_in, test_out;
> +
> +		in_fmt = &ctx->q_data[V4L2_M2M_SRC].cur_fmt;
> +		out_fmt = &ctx->q_data[V4L2_M2M_DST].cur_fmt;
> +
> +		test_in.pix = *in_fmt;
> +		test_out.pix = *out_fmt;
> +
> +		if (ipu_rot_mode_is_irt(rot_mode) !=
> +		    ipu_rot_mode_is_irt(ctx->rot_mode)) {
> +			/* Switch width and height to keep aspect ratio intact */
> +			test_out.pix.width = out_fmt->height;
> +			test_out.pix.height = out_fmt->width;
> +		}
> +
> +		ipu_image_convert_adjust(&test_in, &test_out, ctx->rot_mode);
> +
> +		/* Check if output format needs to be changed */
> +		if (test_in.pix.width != in_fmt->width ||
> +		    test_in.pix.height != in_fmt->height ||
> +		    test_in.pix.bytesperline != in_fmt->bytesperline ||
> +		    test_in.pix.sizeimage != in_fmt->sizeimage) {
> +			struct vb2_queue *out_q;
> +
> +			out_q = v4l2_m2m_get_vq(ctx->fh.m2m_ctx,
> +						V4L2_BUF_TYPE_VIDEO_OUTPUT);
> +			if (vb2_is_busy(out_q))
> +				return -EBUSY;
> +		}
> +
> +		/* Check if capture format needs to be changed */
> +		if (test_out.pix.width != out_fmt->width ||
> +		    test_out.pix.height != out_fmt->height ||
> +		    test_out.pix.bytesperline != out_fmt->bytesperline ||
> +		    test_out.pix.sizeimage != out_fmt->sizeimage) {
> +			struct vb2_queue *cap_q;
> +
> +			cap_q = v4l2_m2m_get_vq(ctx->fh.m2m_ctx,
> +						V4L2_BUF_TYPE_VIDEO_CAPTURE);
> +			if (vb2_is_busy(cap_q))
> +				return -EBUSY;
> +		}
> +
> +		*in_fmt = test_in.pix;
> +		*out_fmt = test_out.pix;
> +
> +		ctx->rot_mode = rot_mode;
> +		ctx->rotate = rotate;
> +		ctx->hflip = hflip;
> +		ctx->vflip = vflip;
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct v4l2_ctrl_ops ipu_csc_scaler_ctrl_ops = {
> +	.s_ctrl = ipu_csc_scaler_s_ctrl,
> +};
> +
> +static int ipu_csc_scaler_init_controls(struct ipu_csc_scaler_ctx *ctx)
> +{
> +	struct v4l2_ctrl_handler *hdlr = &ctx->ctrl_hdlr;
> +
> +	v4l2_ctrl_handler_init(hdlr, 3);
> +
> +	v4l2_ctrl_new_std(hdlr, &ipu_csc_scaler_ctrl_ops, V4L2_CID_HFLIP,
> +			  0, 1, 1, 0);
> +	v4l2_ctrl_new_std(hdlr, &ipu_csc_scaler_ctrl_ops, V4L2_CID_VFLIP,
> +			  0, 1, 1, 0);
> +	v4l2_ctrl_new_std(hdlr, &ipu_csc_scaler_ctrl_ops, V4L2_CID_ROTATE,
> +			  0, 270, 90, 0);
> +
> +	if (hdlr->error) {
> +		v4l2_ctrl_handler_free(hdlr);
> +		return hdlr->error;
> +	}
> +
> +	v4l2_ctrl_handler_setup(hdlr);
> +	return 0;
> +}
> +
> +#define DEFAULT_WIDTH	720
> +#define DEFAULT_HEIGHT	576
> +static const struct ipu_csc_scaler_q_data ipu_csc_scaler_q_data_default = {
> +	.cur_fmt = {
> +		.width = DEFAULT_WIDTH,
> +		.height = DEFAULT_HEIGHT,
> +		.pixelformat = V4L2_PIX_FMT_YUV420,
> +		.field = V4L2_FIELD_NONE,
> +		.bytesperline = DEFAULT_WIDTH,
> +		.sizeimage = DEFAULT_WIDTH * DEFAULT_HEIGHT * 3 / 2,
> +		.colorspace = V4L2_COLORSPACE_SRGB,
> +	},
> +	.rect = {
> +		.width = DEFAULT_WIDTH,
> +		.height = DEFAULT_HEIGHT,
> +	},
> +};
> +
> +/*
> + * File operations
> + */
> +static int ipu_csc_scaler_open(struct file *file)
> +{
> +	struct ipu_csc_scaler_priv *priv = video_drvdata(file);
> +	struct ipu_csc_scaler_ctx *ctx = NULL;
> +	int ret;
> +
> +	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
> +	if (!ctx)
> +		return -ENOMEM;
> +
> +	ctx->rot_mode = IPU_ROTATE_NONE;
> +
> +	v4l2_fh_init(&ctx->fh, video_devdata(file));
> +	file->private_data = &ctx->fh;
> +	v4l2_fh_add(&ctx->fh);
> +	ctx->priv = priv;
> +
> +	ctx->fh.m2m_ctx = v4l2_m2m_ctx_init(priv->m2m_dev, ctx,
> +					    &ipu_csc_scaler_queue_init);
> +	if (IS_ERR(ctx->fh.m2m_ctx)) {
> +		ret = PTR_ERR(ctx->fh.m2m_ctx);
> +		goto err_ctx;
> +	}
> +
> +	ret = ipu_csc_scaler_init_controls(ctx);
> +	if (ret)
> +		goto err_ctrls;
> +
> +	ctx->fh.ctrl_handler = &ctx->ctrl_hdlr;
> +
> +	ctx->q_data[V4L2_M2M_SRC] = ipu_csc_scaler_q_data_default;
> +	ctx->q_data[V4L2_M2M_DST] = ipu_csc_scaler_q_data_default;
> +
> +	dev_dbg(priv->dev, "Created instance %p, m2m_ctx: %p\n", ctx,
> +		ctx->fh.m2m_ctx);
> +
> +	return 0;
> +
> +err_ctrls:
> +	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
> +err_ctx:
> +	v4l2_fh_del(&ctx->fh);
> +	v4l2_fh_exit(&ctx->fh);
> +	kfree(ctx);
> +	return ret;
> +}
> +
> +static int ipu_csc_scaler_release(struct file *file)
> +{
> +	struct ipu_csc_scaler_priv *priv = video_drvdata(file);
> +	struct ipu_csc_scaler_ctx *ctx = fh_to_ctx(file->private_data);
> +
> +	dev_dbg(priv->dev, "Releasing instance %p\n", ctx);
> +
> +	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
> +	v4l2_fh_del(&ctx->fh);
> +	v4l2_fh_exit(&ctx->fh);
> +	kfree(ctx);
> +
> +	return 0;
> +}
> +
> +static const struct v4l2_file_operations ipu_csc_scaler_fops = {
> +	.owner		= THIS_MODULE,
> +	.open		= ipu_csc_scaler_open,
> +	.release	= ipu_csc_scaler_release,
> +	.poll		= v4l2_m2m_fop_poll,
> +	.unlocked_ioctl	= video_ioctl2,
> +	.mmap		= v4l2_m2m_fop_mmap,
> +};
> +
> +static struct v4l2_m2m_ops m2m_ops = {
> +	.device_run	= device_run,
> +	.job_abort	= job_abort,
> +};
> +
> +static const struct video_device ipu_csc_scaler_videodev_template = {
> +	.name		= "ipu_ic_pp csc/scaler",
> +	.fops		= &ipu_csc_scaler_fops,
> +	.ioctl_ops	= &ipu_csc_scaler_ioctl_ops,
> +	.minor		= -1,
> +	.release	= video_device_release,
> +	.vfl_dir	= VFL_DIR_M2M,
> +	.device_caps	= V4L2_CAP_VIDEO_M2M | V4L2_CAP_STREAMING,
> +};
> +
> +int imx_media_csc_scaler_device_register(struct imx_media_video_dev *vdev)
> +{
> +	struct ipu_csc_scaler_priv *priv = vdev_to_priv(vdev);
> +	struct video_device *vfd = vdev->vfd;
> +	int ret;
> +
> +	vfd->v4l2_dev = &priv->md->v4l2_dev;
> +
> +	ret = video_register_device(vfd, VFL_TYPE_GRABBER, -1);
> +	if (ret) {
> +		v4l2_err(vfd->v4l2_dev, "Failed to register video device\n");
> +		return ret;
> +	}
> +
> +	v4l2_info(vfd->v4l2_dev, "Registered %s as /dev/%s\n", vfd->name,
> +		  video_device_node_name(vfd));
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(imx_media_csc_scaler_device_register);
> +
> +void imx_media_csc_scaler_device_unregister(struct imx_media_video_dev *vdev)
> +{
> +	struct ipu_csc_scaler_priv *priv = vdev_to_priv(vdev);
> +	struct video_device *vfd = priv->vdev.vfd;
> +
> +	mutex_lock(&priv->mutex);
> +
> +	if (video_is_registered(vfd))
> +		video_unregister_device(vfd);
> +
> +	mutex_unlock(&priv->mutex);
> +}
> +EXPORT_SYMBOL_GPL(imx_media_csc_scaler_device_unregister);
> +
> +struct imx_media_video_dev *
> +imx_media_csc_scaler_device_init(struct imx_media_dev *md)
> +{
> +	struct ipu_csc_scaler_priv *priv;
> +	struct video_device *vfd;
> +	int ret;
> +
> +	priv = devm_kzalloc(md->md.dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return ERR_PTR(-ENOMEM);
> +
> +	priv->md = md;
> +	priv->dev = md->md.dev;
> +
> +	mutex_init(&priv->mutex);
> +
> +	vfd = video_device_alloc();
> +	if (!vfd)
> +		return ERR_PTR(-ENOMEM);
> +
> +	*vfd = ipu_csc_scaler_videodev_template;
> +	vfd->lock = &priv->mutex;
> +	priv->vdev.vfd = vfd;
> +
> +	INIT_LIST_HEAD(&priv->vdev.list);
> +
> +	video_set_drvdata(vfd, priv);
> +
> +	priv->m2m_dev = v4l2_m2m_init(&m2m_ops);
> +	if (IS_ERR(priv->m2m_dev)) {
> +		ret = PTR_ERR(priv->m2m_dev);
> +		v4l2_err(&md->v4l2_dev, "Failed to init mem2mem device: %d\n",
> +			 ret);
> +		return ERR_PTR(ret);
> +	}
> +
> +	return &priv->vdev;
> +}
> +EXPORT_SYMBOL_GPL(imx_media_csc_scaler_device_init);
> +
> +void imx_media_csc_scaler_device_remove(struct imx_media_video_dev *vdev)
> +{
> +	struct ipu_csc_scaler_priv *priv = vdev_to_priv(vdev);
> +
> +	v4l2_m2m_release(priv->m2m_dev);
> +}
> +EXPORT_SYMBOL_GPL(imx_media_csc_scaler_device_remove);
> +
> +MODULE_DESCRIPTION("i.MX IPUv3 mem2mem scaler/CSC driver");
> +MODULE_AUTHOR("Sascha Hauer <s.hauer@pengutronix.de>");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/staging/media/imx/imx-media-dev.c b/drivers/staging/media/imx/imx-media-dev.c
> index 0a7d1d183141..4d2078d18a48 100644
> --- a/drivers/staging/media/imx/imx-media-dev.c
> +++ b/drivers/staging/media/imx/imx-media-dev.c
> @@ -323,12 +323,36 @@ int imx_media_probe_complete(struct v4l2_async_notifier *notifier)
>   		goto unlock;
>   
>   	ret = v4l2_device_register_subdev_nodes(&imxmd->v4l2_dev);
> -unlock:
> -	mutex_unlock(&imxmd->mutex);
>   	if (ret)
> -		return ret;
> +		goto unlock;
> +
> +	imxmd->m2m_vdev = imx_media_csc_scaler_device_init(imxmd);
> +	if (IS_ERR(imxmd->m2m_vdev)) {
> +		ret = PTR_ERR(imxmd->m2m_vdev);
> +		goto unlock;
> +	}
>   
> -	return media_device_register(&imxmd->md);
> +	ret = imx_media_csc_scaler_device_register(imxmd->m2m_vdev);
> +	if (ret)
> +		goto m2m_remove;
> +
> +	mutex_unlock(&imxmd->mutex);
> +
> +	ret = media_device_register(&imxmd->md);
> +	if (ret) {
> +		mutex_lock(&imxmd->mutex);
> +		goto m2m_unreg;
> +	}
> +
> +	return 0;
> +
> +m2m_unreg:
> +	imx_media_csc_scaler_device_unregister(imxmd->m2m_vdev);
> +m2m_remove:
> +	imx_media_csc_scaler_device_remove(imxmd->m2m_vdev);
> +unlock:
> +	mutex_unlock(&imxmd->mutex);
> +	return ret;
>   }
>   
>   /*
> @@ -504,6 +528,8 @@ static int imx_media_remove(struct platform_device *pdev)
>   	v4l2_async_notifier_unregister(&imxmd->notifier);
>   	imx_media_remove_ipu_internal_subdevs(imxmd);
>   	v4l2_async_notifier_cleanup(&imxmd->notifier);
> +	imx_media_csc_scaler_device_unregister(imxmd->m2m_vdev);
> +	imx_media_csc_scaler_device_remove(imxmd->m2m_vdev);
>   	media_device_unregister(&imxmd->md);
>   	v4l2_device_unregister(&imxmd->v4l2_dev);
>   	media_device_cleanup(&imxmd->md);
> diff --git a/drivers/staging/media/imx/imx-media.h b/drivers/staging/media/imx/imx-media.h
> index dd603a6b3a70..1894553b4497 100644
> --- a/drivers/staging/media/imx/imx-media.h
> +++ b/drivers/staging/media/imx/imx-media.h
> @@ -151,6 +151,9 @@ struct imx_media_dev {
>   
>   	/* for async subdev registration */
>   	struct v4l2_async_notifier notifier;
> +
> +	/* IC scaler/CSC mem2mem video device */
> +	struct imx_media_video_dev *m2m_vdev;
>   };
>   
>   enum codespace_sel {
> @@ -281,6 +284,13 @@ void imx_media_capture_device_set_format(struct imx_media_video_dev *vdev,
>   					 const struct v4l2_rect *compose);
>   void imx_media_capture_device_error(struct imx_media_video_dev *vdev);
>   
> +/* imx-media-mem2mem.c */
> +struct imx_media_video_dev *
> +imx_media_csc_scaler_device_init(struct imx_media_dev *dev);
> +void imx_media_csc_scaler_device_remove(struct imx_media_video_dev *vdev);
> +int imx_media_csc_scaler_device_register(struct imx_media_video_dev *vdev);
> +void imx_media_csc_scaler_device_unregister(struct imx_media_video_dev *vdev);
> +
>   /* subdev group ids */
>   #define IMX_MEDIA_GRP_ID_CSI2          BIT(8)
>   #define IMX_MEDIA_GRP_ID_CSI           BIT(9)

