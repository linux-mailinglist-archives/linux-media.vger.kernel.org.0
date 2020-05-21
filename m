Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6CD9D1DD5F7
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2020 20:28:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729151AbgEUS2a (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 May 2020 14:28:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728240AbgEUS2a (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 May 2020 14:28:30 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA554C061A0E
        for <linux-media@vger.kernel.org>; Thu, 21 May 2020 11:28:29 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id l11so7676164wru.0
        for <linux-media@vger.kernel.org>; Thu, 21 May 2020 11:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=w/qbchDuhEuOkRwhtx2G1Azv0aEnUNwdBxIWmgtktpE=;
        b=EEITU+Uu4ELDJtCJzXV4CZbSdqi7fwj9HmJ8jS+2nbB+RfFx2LiG8PpOIMB+TuKZx4
         HgCGtwXLn94zvfEz4GWWjEjzTh1GUZtyMqMKi6nzD2jOfgjR+cUBvSRkfze6nvln5uTu
         G1Pc7AYGJ2a/+5vX7yMpVIaYTk/jXVJWNmt/s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=w/qbchDuhEuOkRwhtx2G1Azv0aEnUNwdBxIWmgtktpE=;
        b=Azny35EaFNopeCDE9WfGnziJ2F+Ihil+SwE79wp688eEsaVdnW8ICo8mzvZZz+AVPa
         BuoYLXsCV0N7cYDMe6KLJa7/w//SRRy7IKODBGwjL2PJXmumJAThihcWnMq1qC4+9dS4
         1jVhICMVA+2d7rVrQwEBtPNpgBBUPwiU7um2EbIbqKG8DE0I9B9SlV5OfRP/HbjzsocO
         pT4dugb8OBAMXsYdt78A3T+a5k3KZsJr05jBntziI2wg9bI6c7NJvhVdetaomeEokpDf
         fDvS7EM1JXX27rckVMvmdyIfPxQGFiH+RBqHLhHpad8RloFAZanfmIG0NuDTPprbDiLO
         eADw==
X-Gm-Message-State: AOAM530QVVqdimkcjIwJvCQlq6v6hchi8C+N9UUpD6Ws80NrGY1GWGOe
        W9ly98LUtToKgqFWjZpCYSo23A==
X-Google-Smtp-Source: ABdhPJxWxx3F0TvQ/vps/qPJIinaVNRTDtXCMwHqbRkk5VBMQpxwfHhta19fJRC6306Yfg7uCH1k+g==
X-Received: by 2002:a5d:4c4f:: with SMTP id n15mr10347202wrt.249.1590085708170;
        Thu, 21 May 2020 11:28:28 -0700 (PDT)
Received: from chromium.org (205.215.190.35.bc.googleusercontent.com. [35.190.215.205])
        by smtp.gmail.com with ESMTPSA id n9sm6967152wrv.43.2020.05.21.11.28.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2020 11:28:27 -0700 (PDT)
Date:   Thu, 21 May 2020 18:28:25 +0000
From:   Tomasz Figa <tfiga@chromium.org>
To:     Jerry-ch Chen <Jerry-Ch.chen@mediatek.com>
Cc:     hans.verkuil@cisco.com, laurent.pinchart+renesas@ideasonboard.com,
        matthias.bgg@gmail.com, mchehab@kernel.org, pihsun@chromium.org,
        yuzhao@chromium.org, zwisler@chromium.org,
        linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, Sean.Cheng@mediatek.com,
        sj.huang@mediatek.com, christie.yu@mediatek.com,
        frederic.chen@mediatek.com, jungo.lin@mediatek.com,
        Rynn.Wu@mediatek.com, linux-media@vger.kernel.org,
        srv_heupstream@mediatek.com, devicetree@vger.kernel.org
Subject: Re: [RFC PATCH V4 4/4] platform: mtk-isp: Add Mediatek FD driver
Message-ID: <20200521182825.GA249683@chromium.org>
References: <20191204124732.10932-1-Jerry-Ch.chen@mediatek.com>
 <20191204124732.10932-5-Jerry-Ch.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191204124732.10932-5-Jerry-Ch.chen@mediatek.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jerry,

On Wed, Dec 04, 2019 at 08:47:32PM +0800, Jerry-ch Chen wrote:
> From: Jerry-ch Chen <jerry-ch.chen@mediatek.com>
> 
> This patch adds the driver of Face Detection (FD) unit in
> Mediatek camera system, providing face detection function.
> 
> The mtk-isp directory will contain drivers for multiple IP
> blocks found in Mediatek ISP system. It will include ISP Pass 1
> driver (CAM), sensor interface driver, DIP driver and face
> detection driver.
> 
> Signed-off-by: Jerry-ch Chen <jerry-ch.chen@mediatek.com>
> ---
>  drivers/media/platform/Kconfig                |    2 +
>  drivers/media/platform/Makefile               |    2 +
>  drivers/media/platform/mtk-isp/fd/Kconfig     |   19 +
>  drivers/media/platform/mtk-isp/fd/Makefile    |    5 +
>  drivers/media/platform/mtk-isp/fd/mtk_fd.h    |  149 ++
>  drivers/media/platform/mtk-isp/fd/mtk_fd_40.c | 1279 +++++++++++++++++
>  include/uapi/linux/v4l2-controls.h            |    4 +
>  include/uapi/linux/videodev2.h                |    3 +
>  8 files changed, 1463 insertions(+)
>  create mode 100644 drivers/media/platform/mtk-isp/fd/Kconfig
>  create mode 100644 drivers/media/platform/mtk-isp/fd/Makefile
>  create mode 100644 drivers/media/platform/mtk-isp/fd/mtk_fd.h
>  create mode 100644 drivers/media/platform/mtk-isp/fd/mtk_fd_40.c
> 

Thank you for the patch. Please see my comments inline. Really sorry for
the much delayed review.

[snip]
> +config VIDEO_MEDIATEK_FD
> +	tristate "Mediatek face detection processing function"
> +	depends on VIDEO_V4L2
> +	depends on ARCH_MEDIATEK
> +	select VIDEOBUF2_DMA_CONTIG
> +	select VIDEOBUF2_CORE
> +	select VIDEOBUF2_V4L2
> +	select VIDEOBUF2_MEMOPS
> +	select MEDIA_CONTROLLER
> +	select MTK_SCP
> +
> +	default n
> +	help
> +		Support the Face Detection (FD) feature in the Mediatek
> +		mt8183 Soc.

MT8183?

> +
> +		FD driver is a V4L2 memory-to-memory device driver which
> +		provides hardware accelerated face detection function,
> +		it can detect different sizes of faces in a raw image.

A YUV image I guess?

[snip]
> diff --git a/drivers/media/platform/mtk-isp/fd/mtk_fd.h b/drivers/media/platform/mtk-isp/fd/mtk_fd.h
> new file mode 100644
> index 000000000000..d85bdcb70d6d
> --- /dev/null
> +++ b/drivers/media/platform/mtk-isp/fd/mtk_fd.h
> @@ -0,0 +1,149 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +//
> +// Copyright (c) 2018 MediaTek Inc.
> +
> +#ifndef __MTK_FD_HW_H__
> +#define __MTK_FD_HW_H__
> +
> +#include <linux/completion.h>
> +#include <linux/io.h>
> +#include <linux/types.h>
> +#include <linux/platform_device.h>
> +#include <media/v4l2-ctrls.h>
> +#include <media/v4l2-device.h>
> +#include <media/videobuf2-v4l2.h>
> +
> +#define MTK_FD_OUTPUT_MIN_WIDTH			26U
> +#define MTK_FD_OUTPUT_MIN_HEIGHT		26U
> +#define MTK_FD_OUTPUT_MAX_WIDTH			640U
> +#define MTK_FD_OUTPUT_MAX_HEIGHT		480U
> +
> +#define MTK_FD_HW_FMT_VYUY			2
> +#define MTK_FD_HW_FMT_UYVY			3
> +#define MTK_FD_HW_FMT_YVYU			4
> +#define MTK_FD_HW_FMT_YUYV			5
> +#define MTK_FD_HW_FMT_YVU_2P			6
> +#define MTK_FD_HW_FMT_YUV_2P			7
> +#define MTK_FD_HW_FMT_UNKNOWN			8

What is an unknown format?

> +
> +#define MTK_FD_IPI_CMD_INIT			0
> +#define MTK_FD_IPI_CMD_INIT_ACK			1
> +#define MTK_FD_IPI_CMD_ENQUEUE			2
> +#define MTK_FD_IPI_CMD_ENQ_ACK			3
> +#define MTK_FD_IPI_CMD_EXIT			4
> +#define MTK_FD_IPI_CMD_EXIT_ACK			5
> +#define MTK_FD_IPI_CMD_RESET			6
> +#define MTK_FD_IPI_CMD_RESET_ACK		7
> +
> +#define MTK_FD_REG_OFFSET_HW_ENABLE		0x4
> +#define MTK_FD_REG_OFFSET_INT_EN		0x15c
> +#define MTK_FD_REG_OFFSET_INT_VAL		0x168
> +#define MTK_FD_REG_OFFSET_RESULT		0x178
> +
> +#define MTK_FD_SET_HW_ENABLE			0x111
> +#define MTK_FD_RS_BUF_SIZE			2289664
> +#define MTK_FD_HW_WORK_BUF_SIZE			0x100000

How about using the SZ_1M?

> +#define MTK_FD_MAX_SPEEDUP			7
> +#define MTK_FD_MAX_RESULT_NUM			1026

Perhaps NUM_RESULTS?

> +
> +/* Max scale size counts */
> +#define MTK_FD_SCALE_ARR_NUM			15

Perhaps NUM_SCALE_SIZES?

> +
> +#define MTK_FD_HW_TIMEOUT			1000

What's the unit?

> +
> +enum face_angle {
> +	MTK_FD_FACE_FRONT,
> +	MTK_FD_FACE_RIGHT_50,
> +	MTK_FD_FACE_LEFT_50,
> +	MTK_FD_FACE_RIGHT_90,
> +	MTK_FD_FACE_LEFT_90,
> +	MTK_FD_FACE_ANGLE_NUM,
> +};

This enum seems to define values for the V4L2_CID_MTK_FD_DETECT_POSE
control. Considering that this is an enumeration and the values are
actually integers (-90, -50, 0, 50, 90), perhaps this should be an
INTEGER_MENU control instead?

> +
> +struct fd_buffer {
> +	__u32 scp_addr;	/* used by SCP */
> +	__u32 dma_addr;	/* used by DMA HW */
> +} __packed;
> +
> +struct fd_face_result {
> +	char data[16];
> +};
> +
> +struct fd_user_output {
> +	struct fd_face_result results[MTK_FD_MAX_RESULT_NUM];
> +	__u16 number;

Is this perhaps the number of results? If so, would num_results be a better
name?

> +};

Since this struct is the meta buffer format, it is a part of the userspace
interface and should be defined in a header under include/uapi/linux/.

> +
> +struct user_param {
> +	u8 fd_speedup;
> +	u8 fd_extra_model;
> +	u8 scale_img_num;
> +	u8 src_img_fmt;
> +	__u16 scale_img_width[MTK_FD_SCALE_ARR_NUM];
> +	__u16 scale_img_height[MTK_FD_SCALE_ARR_NUM];
> +	__u16 face_directions[MTK_FD_FACE_ANGLE_NUM];

Is this a user-facing definition or an interface between the kernel driver
and firmware? If the latter, the __ types shouldn't be used.

> +} __packed;
> +
> +struct fd_init_param {
> +	struct fd_buffer fd_manager;
> +	__u32 rs_dma_addr;

Ditto.

> +} __packed;
> +
> +struct fd_enq_param {
> +	__u64 output_vaddr;

Ditto.

> +	struct fd_buffer src_img[2];
> +	struct fd_buffer user_result;
> +	struct user_param user_param;
> +} __packed;
> +
> +struct fd_ack_param {
> +	__u32 ret_code;
> +	__u32 ret_msg;

Ditto.

> +} __packed;
[snip]
> +/*  */

Was there supposed to be a comment here? :)

> +static int mtk_fd_hw_alloc_rs_dma_addr(struct mtk_fd_dev *fd)
> +{
> +	struct device *dev = fd->dev;
> +	void *va;
> +	dma_addr_t dma_handle;
> +
> +	va = dma_alloc_coherent(dev, MTK_FD_RS_BUF_SIZE, &dma_handle,
> +				GFP_KERNEL);
> +	if (!va) {
> +		dev_err(dev, "dma_alloc null va\n");

No need to print errors for memory allocation failures, because one will be
printed automatically.

[snip]
> +static int mtk_fd_hw_connect(struct mtk_fd_dev *fd)
> +{
> +	int ret;
> +
> +	ret = rproc_boot(fd->rproc_handle);
> +

nit: Unnecessary blank line.

[snip]
> +static int mtk_fd_vb2_queue_setup(struct vb2_queue *vq,
> +				  unsigned int *num_buffers,
> +				  unsigned int *num_planes,
> +				  unsigned int sizes[],
> +				  struct device *alloc_devs[])
> +{
> +	struct mtk_fd_ctx *ctx = vb2_get_drv_priv(vq);
> +	unsigned int size[2];
> +	unsigned int plane;
> +
> +	switch (vq->type) {
> +	case V4L2_BUF_TYPE_META_CAPTURE:
> +		size[0] = ctx->dst_fmt.buffersize;
> +		break;
> +	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
> +		size[0] = ctx->src_fmt.plane_fmt[0].sizeimage;
> +		if (*num_planes == 2)
> +			size[1] = ctx->src_fmt.plane_fmt[1].sizeimage;
> +		break;
> +	}

Is this code above needed? The code below sets sizes[] and it uses a for loop,
without opencoded assignment for the second plane.

> +
> +	if (*num_planes > 2)
> +		return -EINVAL;
> +	if (*num_planes == 0) {
> +		if (vq->type == V4L2_BUF_TYPE_META_CAPTURE) {
> +			sizes[0] = ctx->dst_fmt.buffersize;
> +			*num_planes = 1;
> +			return 0;
> +		}
> +
> +		*num_planes = ctx->src_fmt.num_planes;
> +		for (plane = 0; plane < *num_planes; plane++)
> +			sizes[plane] = ctx->src_fmt.plane_fmt[plane].sizeimage;
> +		return 0;
> +	}
> +
> +	for (plane = 0; plane < *num_planes; plane++) {
> +		if (sizes[plane] < size[plane])
> +			return -EINVAL;
> +	}
> +	return 0;
> +}
[snip]
> +static int mtk_fd_enum_fmt_out_mp(struct file *file, void *fh,
> +				  struct v4l2_fmtdesc *f)
> +{
> +	if (f->index >= NUM_FORMATS)

Please use ARRAY_SIZE().

> +		return -EINVAL;
> +
> +	f->pixelformat = mtk_fd_img_fmts[f->index].pixelformat;
> +	return 0;
> +}
> +
> +static void mtk_fd_fill_pixfmt_mp(struct v4l2_pix_format_mplane *dfmt,
> +				  const struct v4l2_pix_format_mplane *sfmt)
> +{
> +	dfmt->field = V4L2_FIELD_NONE;
> +	dfmt->colorspace = V4L2_COLORSPACE_BT2020;
> +	dfmt->num_planes = sfmt->num_planes;
> +	dfmt->ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
> +	dfmt->quantization = V4L2_QUANTIZATION_DEFAULT;
> +	dfmt->xfer_func =
> +		V4L2_MAP_XFER_FUNC_DEFAULT(dfmt->colorspace);
> +
> +	/* Keep user setting as possible */
> +	dfmt->width = clamp(dfmt->width,
> +			    MTK_FD_OUTPUT_MIN_WIDTH,
> +			    MTK_FD_OUTPUT_MAX_WIDTH);
> +	dfmt->height = clamp(dfmt->height,
> +			     MTK_FD_OUTPUT_MIN_HEIGHT,
> +			     MTK_FD_OUTPUT_MAX_HEIGHT);
> +
> +	if (sfmt->num_planes == 2) {
> +		/* NV16M and NV61M has 1 byte per pixel */
> +		dfmt->plane_fmt[0].bytesperline = dfmt->width;
> +		dfmt->plane_fmt[1].bytesperline = dfmt->width;
> +	} else {
> +		/* 2 bytes per pixel */
> +		dfmt->plane_fmt[0].bytesperline = dfmt->width * 2;
> +	}
> +
> +	dfmt->plane_fmt[0].sizeimage =
> +		dfmt->height * dfmt->plane_fmt[0].bytesperline;

Could some of the code above be replaced with v4l2_fill_pixfmt_mp()?

> +}
> +
> +static const struct v4l2_pix_format_mplane *mtk_fd_find_fmt(u32 format)
> +{
> +	unsigned int i;
> +	const struct v4l2_pix_format_mplane *dev_fmt;
> +
> +	for (i = 0; i < NUM_FORMATS; i++) {

Please use ARRAY_SIZE rather than a custom macro.

> +		dev_fmt = &mtk_fd_img_fmts[i];
> +		if (dev_fmt->pixelformat == format)
> +			return dev_fmt;
> +	}
> +
> +	return NULL;
> +}
> +
> +static int mtk_fd_try_fmt_out_mp(struct file *file,
> +				 void *fh,
> +				 struct v4l2_format *f)
> +{
> +	struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
> +	const struct v4l2_pix_format_mplane *fmt;
> +
> +	fmt = mtk_fd_find_fmt(pix_mp->pixelformat);
> +	if (!fmt)
> +		fmt = &mtk_fd_img_fmts[0];	/* Get default img fmt */

nit: Please move the comment to a separate line and add braces.

> +
> +	mtk_fd_fill_pixfmt_mp(pix_mp, fmt);
> +	return 0;
> +}
[snip]
> +static unsigned int get_fd_img_fmt(unsigned int fourcc)
> +{
> +	switch (fourcc) {
> +	case V4L2_PIX_FMT_VYUY:
> +		return MTK_FD_HW_FMT_VYUY;
> +	case V4L2_PIX_FMT_YUYV:
> +		return MTK_FD_HW_FMT_YUYV;
> +	case V4L2_PIX_FMT_YVYU:
> +		return MTK_FD_HW_FMT_YVYU;
> +	case V4L2_PIX_FMT_UYVY:
> +		return MTK_FD_HW_FMT_UYVY;
> +	case V4L2_PIX_FMT_NV16M:
> +		return MTK_FD_HW_FMT_YUV_2P;
> +	case V4L2_PIX_FMT_NV61M:
> +		return MTK_FD_HW_FMT_YVU_2P;
> +	default:
> +		return MTK_FD_HW_FMT_UNKNOWN;

If we want to be paranoid, we can just add a WARN here and return 0.
Shouldn't be a need to define an unknown format.

[snip]
> +static void mtk_fd_fill_user_param(struct user_param *user_param,
> +				   struct v4l2_ctrl_handler *hdl)
> +{
> +	struct v4l2_ctrl *ctrl;
> +	int i;
> +
> +	ctrl = v4l2_ctrl_find(hdl, V4L2_CID_MTK_FD_SCALE_DOWN_IMG_WIDTH);
> +	if (ctrl)
> +		for (i = 0; i < ctrl->elems; i++)
> +			user_param->scale_img_width[i] = ctrl->p_new.p_u16[i];
> +	ctrl = v4l2_ctrl_find(hdl, V4L2_CID_MTK_FD_SCALE_DOWN_IMG_HEIGHT);
> +	if (ctrl)
> +		for (i = 0; i < ctrl->elems; i++)
> +			user_param->scale_img_height[i] = ctrl->p_new.p_u16[i];
> +	ctrl = v4l2_ctrl_find(hdl, V4L2_CID_MTK_FD_SCALE_IMG_NUM);
> +	if (ctrl)
> +		user_param->scale_img_num = ctrl->val;
> +

nit: Either separate the code dealing with all controls from each other, or
none.

> +	ctrl = v4l2_ctrl_find(hdl, V4L2_CID_MTK_FD_DETECT_POSE);
> +	if (ctrl)
> +		for (i = 0; i < ctrl->elems; i++)
> +			user_param->face_directions[i] = ctrl->p_new.p_u16[i];
> +	ctrl = v4l2_ctrl_find(hdl, V4L2_CID_MTK_FD_DETECT_SPEED);
> +	if (ctrl)
> +		user_param->fd_speedup = ctrl->val;
> +	ctrl = v4l2_ctrl_find(hdl, V4L2_CID_MTK_FD_DETECTION_MODEL);
> +	if (ctrl)
> +		user_param->fd_extra_model = ctrl->val;
> +}
> +
> +static void mtk_fd_device_run(void *priv)
> +{
> +	struct mtk_fd_ctx *ctx = priv;
> +	struct mtk_fd_dev *fd = ctx->fd_dev;
> +	struct vb2_v4l2_buffer *src_buf, *dst_buf;
> +	struct fd_enq_param fd_param;
> +	void *plane_vaddr;
> +
> +	src_buf = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
> +	dst_buf = v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
> +
> +	fd_param.src_img[0].dma_addr =
> +		vb2_dma_contig_plane_dma_addr(&src_buf->vb2_buf, 0);
> +	fd_param.user_result.dma_addr =
> +		vb2_dma_contig_plane_dma_addr(&dst_buf->vb2_buf, 0);
> +	plane_vaddr = vb2_plane_vaddr(&dst_buf->vb2_buf, 0);
> +	fd_param.output_vaddr = (u64)(unsigned long)plane_vaddr;

Why is the vaddr needed here? Specfically, it could pose a security problem
if CPU virtual addresses are exchanged with firmware.

> +	fd_param.user_param.src_img_fmt =
> +		get_fd_img_fmt(ctx->src_fmt.pixelformat);
> +	if (ctx->src_fmt.num_planes == 2)
> +		fd_param.src_img[1].dma_addr =
> +			vb2_dma_contig_plane_dma_addr(&src_buf->vb2_buf, 1);

nit: Could this be moved above, to be just below src_img[0] initialization,
for readability reasons?

> +	mtk_fd_fill_user_param(&fd_param.user_param, &ctx->hdl);
> +
> +	/* Complete request controls if any */
> +	v4l2_ctrl_request_complete(src_buf->vb2_buf.req_obj.req, &ctx->hdl);
> +
> +	fd->output = plane_vaddr;
> +	mtk_fd_hw_job_exec(fd, &fd_param);
> +}
> +
> +static struct v4l2_m2m_ops fd_m2m_ops = {
> +	.device_run = mtk_fd_device_run,
> +};
> +
> +static const struct media_device_ops fd_m2m_media_ops = {
> +	.req_validate	= vb2_request_validate,
> +	.req_queue	= v4l2_m2m_request_queue,
> +};
> +
> +static int mtk_fd_video_device_register(struct mtk_fd_dev *fd)
> +{
> +	struct video_device *vfd = &fd->vfd;
> +	struct v4l2_m2m_dev *m2m_dev = fd->m2m_dev;
> +	struct device *dev = fd->dev;
> +	int ret;
> +
> +	vfd->fops = &fd_video_fops;
> +	vfd->release = video_device_release;
> +	vfd->lock = &fd->vfd_lock;
> +	vfd->v4l2_dev = &fd->v4l2_dev;
> +	vfd->vfl_dir = VFL_DIR_M2M;
> +	vfd->device_caps = V4L2_CAP_STREAMING | V4L2_CAP_VIDEO_OUTPUT_MPLANE |
> +		V4L2_CAP_META_CAPTURE;
> +	vfd->ioctl_ops = &mtk_fd_v4l2_video_out_ioctl_ops;
> +
> +	strscpy(vfd->name, dev_driver_string(dev), sizeof(vfd->name));
> +
> +	video_set_drvdata(vfd, fd);
> +
> +	ret = video_register_device(vfd, VFL_TYPE_GRABBER, 0);
> +	if (ret) {
> +		dev_err(dev, "Failed to register video device\n");
> +		goto err_free_dev;
> +	}
> +
> +	ret = v4l2_m2m_register_media_controller(m2m_dev, vfd,
> +					     MEDIA_ENT_F_PROC_VIDEO_STATISTICS);
> +	if (ret) {
> +		dev_err(dev, "Failed to init mem2mem media controller\n");
> +		goto err_unreg_video;
> +	}
> +	return 0;
> +
> +err_unreg_video:
> +	video_unregister_device(vfd);
> +err_free_dev:
> +	video_device_release(vfd);
> +	return ret;
> +}
> +
> +static int mtk_fd_dev_v4l2_init(struct mtk_fd_dev *fd)
> +{
> +	struct media_device *mdev = &fd->mdev;
> +	struct device *dev = fd->dev;
> +	int ret;
> +
> +	ret = v4l2_device_register(dev, &fd->v4l2_dev);
> +	if (ret) {
> +		dev_err(dev, "Failed to register v4l2 device\n");
> +		return ret;
> +	}
> +
> +	fd->m2m_dev = v4l2_m2m_init(&fd_m2m_ops);
> +	if (IS_ERR(fd->m2m_dev)) {
> +		dev_err(dev, "Failed to init mem2mem device\n");
> +		ret = PTR_ERR(fd->m2m_dev);
> +		goto err_unreg_v4l2_dev;
> +	}
> +
> +	mdev->dev = dev;
> +	strscpy(mdev->model, dev_driver_string(dev), sizeof(mdev->model));
> +	snprintf(mdev->bus_info, sizeof(mdev->bus_info),
> +		 "platform:%s", dev_name(dev));
> +	media_device_init(mdev);
> +	mdev->ops = &fd_m2m_media_ops;
> +	fd->v4l2_dev.mdev = mdev;
> +
> +	ret = mtk_fd_video_device_register(fd);
> +	if (ret) {
> +		dev_err(dev, "Failed to register video device\n");
> +		goto err_cleanup_mdev;
> +	}
> +
> +	ret = media_device_register(mdev);
> +	if (ret) {
> +		dev_err(dev, "Failed to register mem2mem media device\n");
> +		goto err_unreg_vdev;
> +	}
> +
> +	return 0;
> +
> +err_unreg_vdev:
> +	v4l2_m2m_unregister_media_controller(fd->m2m_dev);
> +	video_unregister_device(&fd->vfd);
> +	video_device_release(&fd->vfd);

This is inconsistent with the registration, which registers all of these in
a function. Perhaps it would be worth to move this cleanup to a
mtk_fd_video_device_unregister() function?

> +err_cleanup_mdev:
> +	media_device_cleanup(mdev);
> +	v4l2_m2m_release(fd->m2m_dev);
> +err_unreg_v4l2_dev:
> +	v4l2_device_unregister(&fd->v4l2_dev);
> +	return ret;
> +}
> +
> +static void mtk_fd_dev_v4l2_release(struct mtk_fd_dev *fd)
> +{
> +	v4l2_m2m_unregister_media_controller(fd->m2m_dev);
> +	video_unregister_device(&fd->vfd);
> +	video_device_release(&fd->vfd);
> +	media_device_cleanup(&fd->mdev);
> +	v4l2_m2m_release(fd->m2m_dev);
> +	v4l2_device_unregister(&fd->v4l2_dev);
> +}
> +
> +static irqreturn_t mtk_fd_irq(int irq, void *data)
> +{
> +	struct mtk_fd_dev *fd = (struct mtk_fd_dev *)data;
> +
> +	/* must read this register otherwise HW will keep sending irq */
> +	readl(fd->fd_base + MTK_FD_REG_OFFSET_INT_VAL);
> +	fd->output->number = readl(fd->fd_base + MTK_FD_REG_OFFSET_RESULT);
> +	dev_dbg(fd->dev, "mtk_fd_face_num:%d\n", fd->output->number);
> +
> +	mtk_fd_hw_done(fd, VB2_BUF_STATE_DONE);
> +	return IRQ_HANDLED;
> +}
> +
> +static int mtk_fd_hw_get_scp_mem(struct mtk_fd_dev *fd)
> +{
> +	struct device *dev = fd->dev;
> +	dma_addr_t addr;
> +	void *ptr;
> +	u32 ret;
> +
> +	/*
> +	 * Allocate coherent reserved memory for SCP firmware usage.
> +	 * The size of SCP composer's memory is fixed to 0x100000
> +	 * for the requirement of firmware.
> +	 */
> +	ptr = dma_alloc_coherent(&fd->scp_pdev->dev,
> +				 MTK_FD_HW_WORK_BUF_SIZE, &addr, GFP_KERNEL);
> +	if (!ptr)
> +		return -ENOMEM;
> +
> +	fd->scp_mem.scp_addr = addr;
> +	fd->scp_mem_virt_addr = ptr;
> +	dev_info(dev, "scp addr:%pad va:%pK\n", &addr, ptr);

These addresses are nothing a user should be concerned about, so please
don't use the _info level here. If you think this is an important debugging
information, please make it dev_dbg(). Otherwise, please just remove.

> +
> +	/*
> +	 * This reserved memory is also be used by FD HW.
> +	 * Need to get iova address for FD DMA.
> +	 */
> +	addr = dma_map_resource(dev, addr, MTK_FD_HW_WORK_BUF_SIZE,
> +				DMA_TO_DEVICE, DMA_ATTR_SKIP_CPU_SYNC);

Note that the second argument to dma_map_resource() is phys_addr_t, but the
code above passes a DMA address. This works only by luck, because both
physical and SCP DMA address space have the same addresses. To be fully
correct, dma_map_single() needs to be used, with the kernel virtual address
passed to it, but currently it doesn't handle the memory from a reserved
pool. Thus, we can only keep the hack as is, but please add a comment
explaining it, e.g.

/*
 * FIXME: Assume SCP DMA and physical addresses are the same until
 * dma_map_single() is fixed to handle reserved memory allocations.
 */

> +	if (dma_mapping_error(dev, addr)) {
> +		dev_err(dev, "Failed to map scp iova\n");
> +		ret = -ENOMEM;
> +		goto fail_free_mem;
> +	}
> +	fd->scp_mem.dma_addr = addr;
> +	dev_info(dev, "scp iova addr:%pad\n", &addr);

Ditto.

Best regards,
Tomasz
