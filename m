Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A3826FBED4
	for <lists+linux-media@lfdr.de>; Thu, 14 Nov 2019 05:58:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727109AbfKNE6Y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Nov 2019 23:58:24 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:42679 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727113AbfKNE6Y (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Nov 2019 23:58:24 -0500
Received: by mail-pf1-f194.google.com with SMTP id s5so3281348pfh.9
        for <linux-media@vger.kernel.org>; Wed, 13 Nov 2019 20:58:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=MsjE6fAIsvrGFLIC/5ewT9a/XMTKi+S+irE5QiBGTMY=;
        b=N1FbFWUQ18jzayjuB6lDDmLX04Pir7E0+yj3E/MyxgGpRfGzKvzj4lgZzUffZwHWMa
         UkUXayqmN7GX5wmoHmH6e6F6jBidVEP9volSXEU+9PC0Q476XA4HvNqpjRAm0GbznhFn
         NtOB4KJp4vw73tIu+0gNIf3jbwAqR8EQK/xFk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=MsjE6fAIsvrGFLIC/5ewT9a/XMTKi+S+irE5QiBGTMY=;
        b=MRJ/8XsudRUkQBAxbVw/hBHqIgAazn0IdP2KDElW6zzP/JXl23ag0tx27dtVyvisSF
         bS+D6gl4p9AsQOpB3kHFrT1n4Ve3bXm5j42P1usXm40dXra8uvJ2aoBNlUwA5kYE5yfn
         br9xmQNAOVpE9VfYOnPbvCPDq2m8TZGR5LT+tfnneJT3avbrO/+ZReGeyf/n9/+uvfc4
         3TpsTWVwf8KjZICM0paWkv1fsFobcDeA8ZTqUOuAFxJgPn/gwetBJVcy8EcWDzvd91Rt
         2G4Juv0W9ACNuT51i1O4S4g1OOgEBbkccmzVugnt8PzU5Ezdq3oNTVi3vv2QyR/E45Ze
         1wbA==
X-Gm-Message-State: APjAAAWjloNPJjjMPSZ+QbrKfGgTVm2RIBiFKf4iqtINWZstC2XpmljT
        /hBn2yUNumophEkCA0Ih4zHfhWZM82U=
X-Google-Smtp-Source: APXvYqyZbh1z54NKX3w5zWaWiNUDdhxN86tdQvI+67PfNbfDgzn1DLMpQPaQQP7TXwE3hmyONpWSeg==
X-Received: by 2002:a62:1841:: with SMTP id 62mr8499769pfy.108.1573707499169;
        Wed, 13 Nov 2019 20:58:19 -0800 (PST)
Received: from pihsun-z840.tpe.corp.google.com ([2401:fa00:1:10:7889:7a43:f899:134c])
        by smtp.gmail.com with ESMTPSA id b24sm4787753pfi.148.2019.11.13.20.58.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Nov 2019 20:58:18 -0800 (PST)
Subject: Re: [RFC PATCH V3 4/5] platform: mtk-isp: Add Mediatek DIP driver
To:     frederic.chen@mediatek.com, hans.verkuil@cisco.com,
        laurent.pinchart+renesas@ideasonboard.com, tfiga@chromium.org,
        matthias.bgg@gmail.com, mchehab@kernel.org
Cc:     shik@chromium.org, devicetree@vger.kernel.org,
        Sean.Cheng@mediatek.com, Rynn.Wu@mediatek.com,
        Allan.Yang@mediatek.com, srv_heupstream@mediatek.com,
        holmes.chiou@mediatek.com, suleiman@chromium.org,
        Jerry-ch.Chen@mediatek.com, jungo.lin@mediatek.com,
        sj.huang@mediatek.com, yuzhao@chromium.org,
        linux-mediatek@lists.infradead.org, zwisler@chromium.org,
        christie.yu@mediatek.com, linux-arm-kernel@lists.infradead.org,
        linux-media@vger.kernel.org
References: <20190909192244.9367-1-frederic.chen@mediatek.com>
 <20190909192244.9367-5-frederic.chen@mediatek.com>
From:   Pi-Hsun Shih <pihsun@chromium.org>
Message-ID: <f8475e25-efec-b27d-7344-195ac46482ee@chromium.org>
Date:   Thu, 14 Nov 2019 12:58:13 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190909192244.9367-5-frederic.chen@mediatek.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 9/10/19 3:22 AM, frederic.chen@mediatek.com wrote:
> From: Frederic Chen <frederic.chen@mediatek.com>
> 
> This patch adds the driver of Digital Image Processing (DIP)
> unit in Mediatek ISP system, providing image format
> conversion, resizing, and rotation features.
> 
> The mtk-isp directory will contain drivers for multiple IP
> blocks found in Mediatek ISP system. It will include ISP
> Pass 1 driver(CAM), sensor interface driver, DIP driver and
> face detection driver.
> 
> Signed-off-by: Frederic Chen <frederic.chen@mediatek.com>
> ---
>   drivers/media/platform/mtk-isp/Makefile       |    7 +
>   .../media/platform/mtk-isp/isp_50/Makefile    |    7 +
>   .../platform/mtk-isp/isp_50/dip/Makefile      |   18 +
>   .../platform/mtk-isp/isp_50/dip/mtk_dip-dev.c |  650 +++++
>   .../platform/mtk-isp/isp_50/dip/mtk_dip-dev.h |  566 +++++
>   .../platform/mtk-isp/isp_50/dip/mtk_dip-hw.h  |  156 ++
>   .../platform/mtk-isp/isp_50/dip/mtk_dip-sys.c |  521 ++++
>   .../mtk-isp/isp_50/dip/mtk_dip-v4l2.c         | 2255 +++++++++++++++++
>   8 files changed, 4180 insertions(+)
>   create mode 100644 drivers/media/platform/mtk-isp/Makefile
>   create mode 100644 drivers/media/platform/mtk-isp/isp_50/Makefile
>   create mode 100644 drivers/media/platform/mtk-isp/isp_50/dip/Makefile
>   create mode 100644 drivers/media/platform/mtk-isp/isp_50/dip/mtk_dip-dev.c
>   create mode 100644 drivers/media/platform/mtk-isp/isp_50/dip/mtk_dip-dev.h
>   create mode 100644 drivers/media/platform/mtk-isp/isp_50/dip/mtk_dip-hw.h
>   create mode 100644 drivers/media/platform/mtk-isp/isp_50/dip/mtk_dip-sys.c
>   create mode 100644 drivers/media/platform/mtk-isp/isp_50/dip/mtk_dip-v4l2.c
> 
> diff --git a/drivers/media/platform/mtk-isp/Makefile b/drivers/media/platform/mtk-isp/Makefile
> new file mode 100644
> index 000000000000..b08d3bdf2800
> --- /dev/null
> +++ b/drivers/media/platform/mtk-isp/Makefile
> @@ -0,0 +1,7 @@
> +# SPDX-License-Identifier: GPL-2.0
> +#
> +# Copyright (C) 2019 MediaTek Inc.
> +#
> +
> +obj-y += isp_50/
> +
> diff --git a/drivers/media/platform/mtk-isp/isp_50/Makefile b/drivers/media/platform/mtk-isp/isp_50/Makefile
> new file mode 100644
> index 000000000000..564c3889c34c
> --- /dev/null
> +++ b/drivers/media/platform/mtk-isp/isp_50/Makefile
> @@ -0,0 +1,7 @@
> +# SPDX-License-Identifier: GPL-2.0
> +#
> +# Copyright (C) 2019 MediaTek Inc.
> +#
> +
> +obj-$(CONFIG_VIDEO_MEDIATEK_ISP_DIP) += dip/
> +
> diff --git a/drivers/media/platform/mtk-isp/isp_50/dip/Makefile b/drivers/media/platform/mtk-isp/isp_50/dip/Makefile
> new file mode 100644
> index 000000000000..99e760d7d5a9
> --- /dev/null
> +++ b/drivers/media/platform/mtk-isp/isp_50/dip/Makefile
> @@ -0,0 +1,18 @@
> +# SPDX-License-Identifier: GPL-2.0
> +#
> +# Copyright (C) 2019 MediaTek Inc.
> +#
> +
> +$(info $(srctree))
> +ccflags-y += -I$(srctree)/drivers/media/platform/mtk-mdp3
> +
> +obj-$(CONFIG_VIDEO_MEDIATEK_ISP_DIP) += mtk_dip-v4l2.o
> +
> +# Utilities to provide frame-based streaming model
> +# with v4l2 user interfaces and alloc context managing
> +# memory shared between ISP and coprocessor
> +mtk_dip_util-objs := \
> +mtk_dip-dev.o \
> +mtk_dip-sys.o
> +
> +obj-$(CONFIG_VIDEO_MEDIATEK_ISP_DIP) += mtk_dip_util.o
> diff --git a/drivers/media/platform/mtk-isp/isp_50/dip/mtk_dip-dev.c b/drivers/media/platform/mtk-isp/isp_50/dip/mtk_dip-dev.c
> new file mode 100644
> index 000000000000..d964ae0c4700
> --- /dev/null
> +++ b/drivers/media/platform/mtk-isp/isp_50/dip/mtk_dip-dev.c
> @@ -0,0 +1,650 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2018 MediaTek Inc.
> + *
> + * Author: Frederic Chen <frederic.chen@mediatek.com>
> + *
> + */
> +
> +#include <linux/dma-mapping.h>
> +#include <linux/platform_device.h>
> +#include <media/videobuf2-dma-contig.h>
> +#include <media/v4l2-event.h>
> +#include "mtk_dip-dev.h"
> +#include "mtk-mdp3-regs.h"
> +#include "mtk-img-ipi.h"
> +
> +int mtk_dip_pipe_init(struct mtk_dip_dev *dip_dev, struct mtk_dip_pipe *pipe,
> +		      const struct mtk_dip_pipe_desc *setting)
> +{
> +	int ret, i;
> +
> +	pipe->dip_dev = dip_dev;
> +	pipe->desc = setting;
> +	pipe->nodes_enabled = 0;
> +	pipe->nodes_streaming = 0;
> +
> +	atomic_set(&pipe->pipe_job_sequence, 0);
> +	INIT_LIST_HEAD(&pipe->pipe_job_running_list);
> +	INIT_LIST_HEAD(&pipe->pipe_job_pending_list);
> +	spin_lock_init(&pipe->job_lock);
> +	mutex_init(&pipe->lock);
> +
> +	for (i = 0; i < pipe->desc->total_queues; i++) {
> +		pipe->nodes[i].desc = &pipe->desc->queue_descs[i];
> +		pipe->nodes[i].flags = pipe->nodes[i].desc->flags;
> +		spin_lock_init(&pipe->nodes[i].buf_list_lock);
> +		INIT_LIST_HEAD(&pipe->nodes[i].buf_list);
> +
> +		if (pipe->nodes[i].flags & MEDIA_LNK_FL_ENABLED)
> +			pipe->nodes_enabled |= 1 << i;
> +
> +		pipe->nodes[i].crop.left = 0;
> +		pipe->nodes[i].crop.top = 0;
> +		pipe->nodes[i].crop.width =
> +			pipe->nodes[i].desc->frmsizeenum->stepwise.max_width;
> +		pipe->nodes[i].crop.height =
> +			pipe->nodes[i].desc->frmsizeenum->stepwise.max_height;
> +		pipe->nodes[i].compose.left = 0;
> +		pipe->nodes[i].compose.top = 0;
> +		pipe->nodes[i].compose.width =
> +			pipe->nodes[i].desc->frmsizeenum->stepwise.max_width;
> +		pipe->nodes[i].compose.height =
> +			pipe->nodes[i].desc->frmsizeenum->stepwise.max_height;
> +	}
> +
> +	ret = mtk_dip_pipe_v4l2_register(pipe, &dip_dev->mdev,
> +					 &dip_dev->v4l2_dev);
> +	if (ret) {
> +		dev_err(pipe->dip_dev->dev,
> +			"%s: failed(%d) to create V4L2 devices\n",
> +			pipe->desc->name, ret);
> +
> +		goto err_destroy_pipe_lock;
> +	}
> +
> +	return 0;
> +
> +err_destroy_pipe_lock:
> +	mutex_destroy(&pipe->lock);
> +
> +	return ret;
> +}
> +
> +int mtk_dip_pipe_release(struct mtk_dip_pipe *pipe)
> +{
> +	mtk_dip_pipe_v4l2_unregister(pipe);
> +	mutex_destroy(&pipe->lock);
> +
> +	return 0;
> +}
> +
> +int mtk_dip_pipe_next_job_id(struct mtk_dip_pipe *pipe)
> +{
> +	int global_job_id = atomic_inc_return(&pipe->pipe_job_sequence);
> +
> +	return (global_job_id & 0x0000ffff) | (pipe->desc->id << 16);
> +}
> +
> +struct mtk_dip_request *mtk_dip_pipe_get_running_job(struct mtk_dip_pipe *pipe,
> +						     int id)
> +{
> +	struct mtk_dip_request *req;
> +
> +	spin_lock(&pipe->job_lock);

 From testing, the job_lock can be acquired in interrupt context (by 
cmdq), so this should be spin_lock_irqsave or there might be spinlock 
recursion error.
(Also same for other spin_lock / spin_unlock usage)

> +	list_for_each_entry(req,
> +			    &pipe->pipe_job_running_list, list) {
> +		if (req->id == id) {
> +			spin_unlock(&pipe->job_lock);
> +			return req;
> +		}
> +	}
> +	spin_unlock(&pipe->job_lock);
> +
> +	return NULL;
> +}
> +
> +void mtk_dip_pipe_remove_job(struct mtk_dip_request *req)
> +{
> +	spin_lock(&req->dip_pipe->job_lock);
> +	list_del(&req->list);
> +	req->dip_pipe->num_jobs = req->dip_pipe->num_jobs - 1;
> +	spin_unlock(&req->dip_pipe->job_lock);
> +}
> +
> +void mtk_dip_pipe_job_finish(struct mtk_dip_request *req,
> +			     enum vb2_buffer_state vbf_state)
> +{
> +	struct mtk_dip_pipe *pipe = req->dip_pipe;
> +	struct mtk_dip_dev_buffer *in_buf;
> +	int i;
> +
> +	in_buf = req->buf_map[MTK_DIP_VIDEO_NODE_ID_RAW_OUT];
> +
> +	for (i = 0; i < pipe->desc->total_queues; i++) {
> +		struct mtk_dip_dev_buffer *dev_buf = req->buf_map[i];
> +		struct mtk_dip_video_device *node;
> +
> +		if (!dev_buf)
> +			continue;
> +
> +		if (dev_buf != in_buf)
> +			dev_buf->vbb.vb2_buf.timestamp =
> +				in_buf->vbb.vb2_buf.timestamp;
> +
> +		vb2_buffer_done(&dev_buf->vbb.vb2_buf, vbf_state);
> +
> +		node = mtk_dip_vbq_to_node(dev_buf->vbb.vb2_buf.vb2_queue);
> +		spin_lock(&node->buf_list_lock);
> +		list_del(&dev_buf->list);
> +		spin_unlock(&node->buf_list_lock);
> +	}
> +}
> +
> +static u32 dip_pass1_fmt_get_stride(struct v4l2_pix_format_mplane *mfmt,
> +				    const struct mtk_dip_dev_format *fmt,
> +				    unsigned int plane)
> +{
> +	unsigned int width = ALIGN(mfmt->width, 4);
> +	unsigned int pixel_bits = fmt->row_depth[0];
> +	unsigned int bpl, ppl;
> +
> +	ppl = DIV_ROUND_UP(width * fmt->depth[0], fmt->row_depth[0]);
> +	bpl = DIV_ROUND_UP(ppl * pixel_bits, 8);
> +
> +	return ALIGN(bpl, fmt->pass_1_align);
> +}
> +
> +/* Stride that is accepted by MDP HW */
> +static u32 dip_mdp_fmt_get_stride(struct v4l2_pix_format_mplane *mfmt,
> +				  const struct mtk_dip_dev_format *fmt,
> +				  unsigned int plane)
> +{
> +	enum mdp_color c = fmt->mdp_color;
> +	u32 bytesperline = (mfmt->width * fmt->row_depth[plane]) / 8;
> +	u32 stride = (bytesperline * DIP_MCOLOR_BITS_PER_PIXEL(c))
> +		/ fmt->row_depth[0];
> +
> +	if (plane == 0)
> +		return stride;
> +
> +	if (plane < DIP_MCOLOR_GET_PLANE_COUNT(c)) {
> +		if (DIP_MCOLOR_IS_BLOCK_MODE(c))
> +			stride = stride / 2;
> +		return stride;
> +	}
> +
> +	return 0;
> +}
> +
> +/* Stride that is accepted by MDP HW of format with contiguous planes */
> +static u32
> +dip_mdp_fmt_get_stride_contig(const struct mtk_dip_dev_format *fmt,
> +			      u32 pix_stride, unsigned int plane)
> +{
> +	enum mdp_color c = fmt->mdp_color;
> +	u32 stride = pix_stride;
> +
> +	if (plane == 0)
> +		return stride;
> +
> +	if (plane < DIP_MCOLOR_GET_PLANE_COUNT(c)) {
> +		stride = stride >> DIP_MCOLOR_GET_H_SUBSAMPLE(c);
> +		if (DIP_MCOLOR_IS_UV_COPLANE(c) && !DIP_MCOLOR_IS_BLOCK_MODE(c))
> +			stride = stride * 2;
> +		return stride;
> +	}
> +
> +	return 0;
> +}
> +
> +/* Plane size that is accepted by MDP HW */
> +static u32
> +dip_mdp_fmt_get_plane_size(const struct mtk_dip_dev_format *fmt,
> +			   u32 stride, u32 height, unsigned int plane)
> +{
> +	enum mdp_color c = fmt->mdp_color;
> +	u32 bytesperline;
> +
> +	bytesperline = (stride * fmt->row_depth[0])
> +		/ DIP_MCOLOR_BITS_PER_PIXEL(c);
> +
> +	if (plane == 0)
> +		return bytesperline * height;
> +	if (plane < DIP_MCOLOR_GET_PLANE_COUNT(c)) {
> +		height = height >> DIP_MCOLOR_GET_V_SUBSAMPLE(c);
> +		if (DIP_MCOLOR_IS_BLOCK_MODE(c))
> +			bytesperline = bytesperline * 2;
> +		return bytesperline * height;
> +	}
> +
> +	return 0;
> +}
> +
> +static int mtk_dip_pipe_get_stride(struct mtk_dip_pipe *pipe,
> +				   struct v4l2_pix_format_mplane *mfmt,
> +				   const struct mtk_dip_dev_format *dfmt,
> +				   int plane, const char *buf_name)
> +{
> +	int bpl;
> +
> +	if (dfmt->pass_1_align)
> +		bpl = dip_pass1_fmt_get_stride(mfmt, dfmt, plane);
> +	else
> +		bpl = dip_mdp_fmt_get_stride(mfmt, dfmt, plane);
> +
> +	return bpl;
> +}
> +
> +void mtk_dip_pipe_try_fmt(struct mtk_dip_pipe *pipe,
> +			  struct mtk_dip_video_device *node,
> +			  struct v4l2_format *fmt,
> +			  const struct v4l2_format *ufmt,
> +			  const struct mtk_dip_dev_format *dfmt)
> +{
> +	int i;
> +
> +	fmt->type = ufmt->type;
> +	fmt->fmt.pix_mp.width =
> +		clamp_val(ufmt->fmt.pix_mp.width,
> +			  node->desc->frmsizeenum->stepwise.min_width,
> +			  node->desc->frmsizeenum->stepwise.max_width);
> +	fmt->fmt.pix_mp.height =
> +		clamp_val(ufmt->fmt.pix_mp.height,
> +			  node->desc->frmsizeenum->stepwise.min_height,
> +			  node->desc->frmsizeenum->stepwise.max_height);
> +	fmt->fmt.pix_mp.num_planes = ufmt->fmt.pix_mp.num_planes;
> +	fmt->fmt.pix_mp.field = V4L2_FIELD_NONE;
> +
> +	if (ufmt->fmt.pix_mp.quantization != V4L2_QUANTIZATION_FULL_RANGE)
> +		fmt->fmt.pix_mp.quantization = V4L2_QUANTIZATION_DEFAULT;
> +	else
> +		fmt->fmt.pix_mp.quantization =  ufmt->fmt.pix_mp.quantization;
> +
> +	if (ufmt->fmt.pix_mp.colorspace < 0xFF)
> +		fmt->fmt.pix_mp.colorspace = ufmt->fmt.pix_mp.colorspace;
> +	else
> +		fmt->fmt.pix_mp.colorspace = V4L2_COLORSPACE_DEFAULT;
> +
> +	/* Only MDP 0 and MDP 1 allow the color space change */
> +	if (node->desc->id != MTK_DIP_VIDEO_NODE_ID_MDP0_CAPTURE &&
> +	    node->desc->id != MTK_DIP_VIDEO_NODE_ID_MDP1_CAPTURE) {
> +		fmt->fmt.pix_mp.quantization = V4L2_QUANTIZATION_FULL_RANGE;
> +		fmt->fmt.pix_mp.colorspace = V4L2_COLORSPACE_DEFAULT;
> +	}
> +
> +	fmt->fmt.pix_mp.pixelformat = dfmt->format;
> +	fmt->fmt.pix_mp.num_planes = dfmt->num_planes;
> +	fmt->fmt.pix_mp.ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
> +	fmt->fmt.pix_mp.field = V4L2_FIELD_NONE;
> +
> +	for (i = 0; i < fmt->fmt.pix_mp.num_planes; ++i) {
> +		unsigned int stride;
> +		unsigned int sizeimage;
> +
> +		stride = mtk_dip_pipe_get_stride(pipe, &fmt->fmt.pix_mp,
> +						 dfmt, i, node->desc->name);
> +		if (dfmt->pass_1_align)
> +			sizeimage = stride * fmt->fmt.pix_mp.height;
> +		else
> +			sizeimage = DIV_ROUND_UP(stride *
> +						 fmt->fmt.pix_mp.height *
> +						 dfmt->depth[i],
> +						 dfmt->row_depth[i]);
> +
> +		fmt->fmt.pix_mp.plane_fmt[i].sizeimage = sizeimage;
> +		fmt->fmt.pix_mp.plane_fmt[i].bytesperline = stride;
> +	}
> +}
> +
> +static void set_meta_fmt(struct mtk_dip_pipe *pipe,
> +			 struct v4l2_meta_format *fmt,
> +			 const struct mtk_dip_dev_format *dev_fmt)
> +{
> +	fmt->dataformat = dev_fmt->format;
> +
> +	if (dev_fmt->buffer_size <= 0)
> +		fmt->buffersize =
> +			MTK_DIP_DEV_META_BUF_DEFAULT_SIZE;
> +	else
> +		fmt->buffersize = dev_fmt->buffer_size;
> +}
> +
> +void mtk_dip_pipe_load_default_fmt(struct mtk_dip_pipe *pipe,
> +				   struct mtk_dip_video_device *node,
> +				   struct v4l2_format *fmt)
> +{
> +	int idx = node->desc->default_fmt_idx;
> +
> +	if (idx >= node->desc->num_fmts) {
> +		dev_err(pipe->dip_dev->dev,
> +			"%s:%s: invalid idx(%d), must < num_fmts(%d)\n",
> +			__func__, node->desc->name, idx, node->desc->num_fmts);
> +
> +		idx = 0;
> +	}
> +
> +	fmt->type = node->desc->buf_type;
> +	if (mtk_dip_buf_is_meta(node->desc->buf_type)) {
> +		set_meta_fmt(pipe, &fmt->fmt.meta,
> +			     &node->desc->fmts[idx]);
> +	} else {
> +		fmt->fmt.pix_mp.width = node->desc->default_width;
> +		fmt->fmt.pix_mp.height = node->desc->default_height;
> +		mtk_dip_pipe_try_fmt(pipe, node, fmt, fmt,
> +				     &node->desc->fmts[idx]);
> +	}
> +}
> +
> +const struct mtk_dip_dev_format*
> +mtk_dip_pipe_find_fmt(struct mtk_dip_pipe *pipe,
> +		      struct mtk_dip_video_device *node,
> +		      u32 format)
> +{
> +	int i;
> +
> +	for (i = 0; i < node->desc->num_fmts; i++) {
> +		if (node->desc->fmts[i].format == format)
> +			return &node->desc->fmts[i];
> +	}
> +
> +	return NULL;
> +}
> +
> +static enum mdp_ycbcr_profile
> +mtk_dip_map_ycbcr_prof_mplane(struct v4l2_pix_format_mplane *pix_mp,
> +			      u32 mdp_color)
> +{
> +	switch (pix_mp->colorspace) {
> +	case V4L2_COLORSPACE_DEFAULT:
> +		if (pix_mp->quantization == V4L2_QUANTIZATION_FULL_RANGE)
> +			return MDP_YCBCR_PROFILE_FULL_BT601;
> +		return MDP_YCBCR_PROFILE_BT601;
> +	case V4L2_COLORSPACE_JPEG:
> +		return MDP_YCBCR_PROFILE_JPEG;
> +	case V4L2_COLORSPACE_REC709:
> +	case V4L2_COLORSPACE_DCI_P3:
> +		if (pix_mp->quantization == V4L2_QUANTIZATION_FULL_RANGE)
> +			return MDP_YCBCR_PROFILE_FULL_BT709;
> +		return MDP_YCBCR_PROFILE_BT709;
> +	case V4L2_COLORSPACE_BT2020:
> +		if (pix_mp->quantization == V4L2_QUANTIZATION_FULL_RANGE)
> +			return MDP_YCBCR_PROFILE_FULL_BT2020;
> +		return MDP_YCBCR_PROFILE_BT2020;
> +	}
> +
> +	if (DIP_MCOLOR_IS_RGB(mdp_color))
> +		return MDP_YCBCR_PROFILE_FULL_BT601;
> +
> +	if (pix_mp->quantization == V4L2_QUANTIZATION_FULL_RANGE)
> +		return MDP_YCBCR_PROFILE_FULL_BT601;
> +
> +	return MDP_YCBCR_PROFILE_BT601;
> +}
> +
> +static inline int
> +mtk_dip_is_contig_mp_buffer(struct mtk_dip_dev_buffer *dev_buf)
> +{
> +	return !(dev_buf->dev_fmt->num_cplanes == 1);
> +}
> +
> +static void mtk_dip_fill_ipi_img_param_mp(struct mtk_dip_pipe *pipe,
> +					  struct img_image_buffer *b,
> +					  struct mtk_dip_dev_buffer *dev_buf,
> +					  char *buf_name)
> +{
> +	struct v4l2_pix_format_mplane *pix_mp = &dev_buf->fmt.fmt.pix_mp;
> +	const struct mtk_dip_dev_format *mdp_fmt = dev_buf->dev_fmt;
> +	unsigned int i;
> +	unsigned int total_plane_size = 0;
> +
> +	b->usage = dev_buf->dma_port;
> +	b->format.colorformat = dev_buf->dev_fmt->mdp_color;
> +	b->format.width = dev_buf->fmt.fmt.pix_mp.width;
> +	b->format.height = dev_buf->fmt.fmt.pix_mp.height;
> +	b->format.ycbcr_prof =
> +		mtk_dip_map_ycbcr_prof_mplane(pix_mp,
> +					      dev_buf->dev_fmt->mdp_color);
> +
> +	for (i = 0; i < pix_mp->num_planes; ++i) {
> +		u32 stride = pix_mp->plane_fmt[i].bytesperline;
> +
> +		/*
> +		 * We use dip_mdp_fmt_get_plane_size() to get the plane sizes of
> +		 * non-M multiple plane image buffers. In this case,
> +		 * pix_mp->plane_fmt[0].sizeimage is the total size of all
> +		 * b->format.plane_fmt[i].
> +		 */
> +		b->format.plane_fmt[i].stride = stride;
> +		b->format.plane_fmt[i].size =
> +			dip_mdp_fmt_get_plane_size(mdp_fmt, stride,
> +						   pix_mp->height, i);
> +		b->iova[i] = dev_buf->isp_daddr[i];
> +		total_plane_size += b->format.plane_fmt[i].size;
> +	}
> +
> +	if (!mtk_dip_is_contig_mp_buffer(dev_buf))
> +		return;
> +
> +	for (; i < DIP_MCOLOR_GET_PLANE_COUNT(b->format.colorformat); ++i) {
> +		u32 stride = dip_mdp_fmt_get_stride_contig
> +				(mdp_fmt, b->format.plane_fmt[0].stride, i);
> +
> +		b->format.plane_fmt[i].stride = stride;
> +		b->format.plane_fmt[i].size =
> +			dip_mdp_fmt_get_plane_size(mdp_fmt, stride,
> +						   pix_mp->height, i);
> +		b->iova[i] = b->iova[i - 1] + b->format.plane_fmt[i - 1].size;
> +		total_plane_size += b->format.plane_fmt[i].size;
> +	}
> +}
> +
> +static void mtk_dip_fill_input_ipi_param(struct mtk_dip_pipe *pipe,
> +					 struct img_input *iin,
> +					 struct mtk_dip_dev_buffer *dev_buf,
> +					 char *buf_name)
> +{
> +	mtk_dip_fill_ipi_img_param_mp(pipe, &iin->buffer, dev_buf, buf_name);
> +}
> +
> +static void mtk_dip_fill_output_ipi_param(struct mtk_dip_pipe *pipe,
> +					  struct img_output *iout,
> +					  struct mtk_dip_dev_buffer *buf_out,
> +					  struct mtk_dip_dev_buffer *buf_in,
> +					  char *buf_name)
> +{
> +	mtk_dip_fill_ipi_img_param_mp(pipe, &iout->buffer, buf_out, buf_name);
> +	iout->crop.left = 0;
> +	iout->crop.top = 0;
> +	iout->crop.width = buf_in->fmt.fmt.pix_mp.width;
> +	iout->crop.height = buf_in->fmt.fmt.pix_mp.height;
> +	iout->crop.left_subpix = 0;
> +	iout->crop.top_subpix = 0;
> +	iout->crop.width_subpix = 0;
> +	iout->crop.height_subpix = 0;
> +	iout->rotation = 0;
> +}
> +
> +static u32 mtk_dip_to_fixed(u32 *r, struct v4l2_fract *f)
> +{
> +	u32 q;
> +
> +	if (f->denominator == 0) {
> +		*r = 0;
> +		return 0;
> +	}
> +
> +	q = f->numerator / f->denominator;
> +	*r = (((u64)f->numerator - q * f->denominator) << IMG_SUBPIXEL_SHIFT)
> +		/ f->denominator;
> +	return q;
> +}
> +
> +static void mtk_dip_set_src_crop(struct img_crop *c, struct mtk_dip_crop *crop)
> +{
> +	c->left = crop->c.left
> +		+ mtk_dip_to_fixed(&c->left_subpix, &crop->left_subpix);
> +	c->top = crop->c.top
> +		+ mtk_dip_to_fixed(&c->top_subpix, &crop->top_subpix);
> +	c->width = crop->c.width
> +		+ mtk_dip_to_fixed(&c->width_subpix, &crop->width_subpix);
> +	c->height = crop->c.height
> +		+ mtk_dip_to_fixed(&c->height_subpix, &crop->height_subpix);
> +}
> +
> +static void mtk_dip_set_orientation(struct img_output *out,
> +				    s32 rotation, bool hflip, bool vflip)
> +{
> +	u8 flip = 0;
> +
> +	if (hflip)
> +		flip ^= 1;
> +	if (vflip) {
> +		/*
> +		 * A vertical flip is equivalent to
> +		 * a 180-degree rotation with a horizontal flip
> +		 */
> +		rotation += 180;
> +		flip ^= 1;
> +	}
> +
> +	out->rotation = rotation % 360;
> +	if (flip != 0)
> +		out->flags |= IMG_CTRL_FLAG_HFLIP;
> +	else
> +		out->flags &= ~IMG_CTRL_FLAG_HFLIP;
> +}
> +
> +static void mtk_dip_set_crop_config(struct mtk_dip_dev *dip_dev,
> +				    struct mtk_dip_dev_buffer *dev_buf_out,
> +				    struct img_output *iout, char *buf_name)
> +{
> +	iout->buffer.format.width = dev_buf_out->compose.width;
> +	iout->buffer.format.height = dev_buf_out->compose.height;
> +
> +	mtk_dip_set_src_crop(&iout->crop, &dev_buf_out->crop);
> +}
> +
> +static void mtk_dip_set_rotate_config(struct mtk_dip_dev *dip_dev,
> +				      struct mtk_dip_dev_buffer *dev_buf_in,
> +				  struct mtk_dip_dev_buffer *dev_buf_out,
> +				  struct img_output *iout, char *buf_name)
> +{
> +	mtk_dip_set_orientation(iout, dev_buf_out->rotation,
> +				dev_buf_out->hflip, dev_buf_out->vflip);
> +}
> +
> +void mtk_dip_pipe_ipi_params_config(struct mtk_dip_request *req)
> +{
> +	struct mtk_dip_pipe *pipe = req->dip_pipe;
> +	int buf_out_idx;
> +	int buf_in_idx;
> +	struct img_ipi_frameparam *dip_param = &req->img_fparam.frameparam;
> +	struct mtk_dip_dev_buffer *buf_in;
> +	struct mtk_dip_dev_buffer *buf_out;
> +	struct mtk_dip_dev_buffer *buf_tuning;
> +	int i = 0;
> +	int mdp_ids[2] = {MTK_DIP_VIDEO_NODE_ID_MDP0_CAPTURE,
> +			  MTK_DIP_VIDEO_NODE_ID_MDP1_CAPTURE};
> +	char *mdp_names[2] = {"mdp0", "mdp1"};
> +
> +	memset(dip_param, 0, sizeof(*dip_param));
> +	dip_param->index = req->id;
> +	dip_param->type = STREAM_ISP_IC;
> +
> +	/* Tuning buffer */
> +	buf_tuning =
> +		req->buf_map[MTK_DIP_VIDEO_NODE_ID_TUNING_OUT];
> +	if (buf_tuning) {
> +		dip_param->tuning_data.pa =
> +			(uint32_t)buf_tuning->scp_daddr[0];
> +		dip_param->tuning_data.present = true;
> +		dip_param->tuning_data.iova =
> +			(uint32_t)buf_tuning->isp_daddr[0];
> +	}
> +
> +	buf_in_idx = 0;
> +
> +	/*
> +	 * Raw-in buffer
> +	 * The input buffer is guaranteed by .request_validate()
> +	 */
> +	buf_in = req->buf_map[MTK_DIP_VIDEO_NODE_ID_RAW_OUT];
> +	mtk_dip_fill_input_ipi_param
> +		(pipe, &dip_param->inputs[buf_in_idx++],
> +		 buf_in, "RAW");
> +
> +	/* NR buffer (optional input) */
> +	if (req->buf_map[MTK_DIP_VIDEO_NODE_ID_NR_OUT])
> +		mtk_dip_fill_input_ipi_param
> +			(pipe, &dip_param->inputs[buf_in_idx++],
> +			 req->buf_map[MTK_DIP_VIDEO_NODE_ID_NR_OUT],
> +			 "NR");
> +
> +	/* Shading buffer (optional input)*/
> +	if (req->buf_map[MTK_DIP_VIDEO_NODE_ID_SHADING_OUT])
> +		mtk_dip_fill_input_ipi_param
> +			(pipe, &dip_param->inputs[buf_in_idx++],
> +			 req->buf_map[MTK_DIP_VIDEO_NODE_ID_SHADING_OUT],
> +			 "Shading");
> +
> +	/* MDP buffers */
> +	buf_out_idx = 0;
> +
> +	for (i = 0; i < ARRAY_SIZE(mdp_ids); i++) {
> +		buf_out =
> +			req->buf_map[mdp_ids[i]];
> +		if (buf_out) {
> +			struct img_output *iout =
> +				&dip_param->outputs[buf_out_idx++];
> +
> +			mtk_dip_fill_output_ipi_param(pipe, iout, buf_out,
> +						      buf_in, mdp_names[i]);
> +			mtk_dip_set_crop_config(pipe->dip_dev, buf_out,
> +						iout, mdp_names[i]);
> +
> +			/* MDP 0 support rotation */
> +			if (i == 0)
> +				mtk_dip_set_rotate_config(pipe->dip_dev,
> +							  buf_in, buf_out, iout,
> +							  mdp_names[i]);
> +		}
> +	}
> +
> +	/* IMG2O buffer */
> +	buf_out = req->buf_map[MTK_DIP_VIDEO_NODE_ID_IMG2_CAPTURE];
> +	if (req->buf_map[MTK_DIP_VIDEO_NODE_ID_IMG2_CAPTURE])
> +		mtk_dip_fill_output_ipi_param
> +			(pipe, &dip_param->outputs[buf_out_idx++],
> +			 buf_out, buf_in, "IMG2O");
> +
> +	/* IMG3O buffer */
> +	buf_out = req->buf_map[MTK_DIP_VIDEO_NODE_ID_IMG3_CAPTURE];
> +	if (buf_out)
> +		mtk_dip_fill_output_ipi_param
> +			(pipe, &dip_param->outputs[buf_out_idx++],
> +			 buf_out, buf_in, "IMG3O");
> +
> +	dip_param->num_outputs = buf_out_idx;
> +	dip_param->num_inputs = buf_in_idx;
> +}
> +
> +void mtk_dip_pipe_try_enqueue(struct mtk_dip_pipe *pipe)
> +{
> +	struct mtk_dip_request *req, *tmp_req;
> +
> +	if (!pipe->streaming)
> +		return;
> +
> +	spin_lock(&pipe->job_lock);
> +	list_for_each_entry_safe(req, tmp_req,
> +				 &pipe->pipe_job_pending_list, list) {
> +		list_del(&req->list);
> +		pipe->num_pending_jobs--;
> +		list_add_tail(&req->list,
> +			      &pipe->pipe_job_running_list);
> +		pipe->num_jobs++;
> +		mtk_dip_hw_enqueue(pipe->dip_dev, req);
> +	}
> +	spin_unlock(&pipe->job_lock);
> +}
> diff --git a/drivers/media/platform/mtk-isp/isp_50/dip/mtk_dip-dev.h b/drivers/media/platform/mtk-isp/isp_50/dip/mtk_dip-dev.h
> new file mode 100644
> index 000000000000..54da4fed95b4
> --- /dev/null
> +++ b/drivers/media/platform/mtk-isp/isp_50/dip/mtk_dip-dev.h
> @@ -0,0 +1,566 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (c) 2018 MediaTek Inc.
> + *
> + * Author: Frederic Chen <frederic.chen@mediatek.com>
> + *
> + */
> +
> +#ifndef _MTK_DIP_DEV_H_
> +#define _MTK_DIP_DEV_H_
> +
> +#include <linux/types.h>
> +#include <linux/platform_device.h>
> +#include <media/v4l2-ctrls.h>
> +#include <media/v4l2-subdev.h>
> +#include <media/v4l2-device.h>
> +#include <linux/videodev2.h>
> +#include <media/videobuf2-core.h>
> +#include <media/videobuf2-v4l2.h>
> +#include "mtk_dip-hw.h"
> +
> +#define MTK_DIP_PIPE_ID_PREVIEW			0
> +#define MTK_DIP_PIPE_ID_CAPTURE			1
> +#define MTK_DIP_PIPE_ID_REPROCESS		2
> +#define MTK_DIP_PIPE_ID_TOTAL_NUM		3
> +
> +#define MTK_DIP_VIDEO_NODE_ID_RAW_OUT		0
> +#define MTK_DIP_VIDEO_NODE_ID_TUNING_OUT	1
> +#define MTK_DIP_VIDEO_NODE_ID_NR_OUT		2
> +#define MTK_DIP_VIDEO_NODE_ID_SHADING_OUT	3
> +#define MTK_DIP_VIDEO_NODE_ID_MDP0_CAPTURE	4
> +#define MTK_DIP_VIDEO_NODE_ID_MDP1_CAPTURE	5
> +#define MTK_DIP_VIDEO_NODE_ID_IMG2_CAPTURE	6
> +#define MTK_DIP_VIDEO_NODE_ID_IMG3_CAPTURE	7
> +#define MTK_DIP_VIDEO_NODE_ID_TOTAL_NUM		8
> +
> +#define MTK_DIP_OUTPUT_MIN_WIDTH		2U
> +#define MTK_DIP_OUTPUT_MIN_HEIGHT		2U
> +#define MTK_DIP_OUTPUT_MAX_WIDTH		5376U
> +#define MTK_DIP_OUTPUT_MAX_HEIGHT		4032U
> +#define MTK_DIP_CAPTURE_MIN_WIDTH		2U
> +#define MTK_DIP_CAPTURE_MIN_HEIGHT		2U
> +#define MTK_DIP_CAPTURE_MAX_WIDTH		5376U
> +#define MTK_DIP_CAPTURE_MAX_HEIGHT		4032U
> +
> +#define MTK_DIP_DEV_META_BUF_DEFAULT_SIZE	(1024 * 128)
> +#define MTK_DIP_DEV_META_BUF_POOL_MAX_SIZE	(1024 * 1024 * 16)
> +
> +/**
> + * struct mtk_dip_dev_format - DIP buffer format
> + * @format:	the corresponding V4L2 pixel format
> + * @mdp_color:	color information setting
> + * @depth:	bytes per pixel of the format
> + * @row_depth:	bits per pixel
> + * @num_planes:	the number of planes
> + * @num_cplanes:	the number of color planes carried in a
> + *			single v4l2 plane
> + * @flags:	flags setting which will be passed to media_create_pad_link()
> + * @buffer_size:	the buffer size of the buffer. It is used when it is
> + *			a meta type format.
> + * @pass_1_align:	the alignment setting of the stride .If pass_1_align
> + *			is greater than 0, the stride must be align with it.
> + *
> + * The structure defines the DIP internal buffer format information. The fields
> + * is used in V4L2 try/set format calculation flow.
> + */
> +struct mtk_dip_dev_format {
> +	u32 format;
> +	u32 mdp_color;
> +	u8 depth[VIDEO_MAX_PLANES];
> +	u8 row_depth[VIDEO_MAX_PLANES];
> +	u8 num_planes;
> +	u8 num_cplanes;
> +	u32 flags;
> +	u32 buffer_size;
> +	u8 pass_1_align;
> +};
> +
> +/**
> + * struct mtk_dip_crop - DIP crop setting
> + * @c:	crop region
> + * @left_subpix: the left subpixel part of the corp region
> + * @top_subpix: the top subpixel part of the corp region
> + * @width_subpix: the width subpixel part of the corp region
> + * @height_subpix: the height subpixel part of the corp region
> + *
> + * The structure includes the crop setting which can be passed to
> + * DIP hardware.
> + */
> +struct mtk_dip_crop {
> +	struct v4l2_rect	c;
> +	struct v4l2_fract	left_subpix;
> +	struct v4l2_fract	top_subpix;
> +	struct v4l2_fract	width_subpix;
> +	struct v4l2_fract	height_subpix;
> +};
> +
> +/**
> + * struct mtk_dip_dev_buffer - Buffer information used by DIP
> + * @vbb:	the vb2 buffer associated
> + * @fmt:	the corresponding v4l2 format
> + * @dev_fmt:	the DIP internal format
> + * @pipe_job_id: the global id of the request owned the buffer
> + * @isp_daddr:	the address which can be used by ISP hardware
> + * @scp_daddr:	the address which can be used in coprocessor
> + * @dma_port:	dma port id of the buffer
> + * @crop:	corp setting of the buffer
> + * @compose:	compose setting of the buffer
> + * @rotation:	rotation degree of the buffer
> + * @hflip:	need horizontal flip or not
> + * @vflip:	need vertical flip or not
> + *
> + * The structure includes the Buffer setting which can be used by
> + * DIP hardware.
> + */
> +struct mtk_dip_dev_buffer {
> +	struct vb2_v4l2_buffer vbb;
> +	struct v4l2_format fmt;
> +	const struct mtk_dip_dev_format *dev_fmt;
> +	int pipe_job_id;
> +	dma_addr_t isp_daddr[VB2_MAX_PLANES];
> +	dma_addr_t scp_daddr[VB2_MAX_PLANES];
> +	unsigned int dma_port;
> +	struct mtk_dip_crop crop;
> +	struct v4l2_rect compose;
> +	int rotation;
> +	int hflip;
> +	int vflip;
> +	struct list_head list;
> +};
> +
> +/**
> + * struct mtk_dip_pipe_desc - dip pipe descriptor
> + * @name:	name of the pipe, which will be used as a part of the video
> + *		device and sub device name
> + * @id:		the id of the pipe
> + * @queue_descs:	the setting of the queues belong to this pipe
> + * @total_queues: the number of queue/video nodes supported by this pipe
> + *
> + * The structure describes the pipe of DIP. A pipe may contains a raw output
> + * video device and at least one MDP capture device.
> + */
> +struct mtk_dip_pipe_desc {
> +	const char *name;
> +	int id;
> +	const struct mtk_dip_video_device_desc *queue_descs;
> +	int total_queues;
> +};
> +
> +/**
> + * struct mtk_dip_video_device_desc - video device descriptor
> + * @name:	name of the video device
> + * @id:		the id of the video device
> + * @buf_type:	buffer type of the video device
> + * @cap:	device capabilities
> + * @smem_alloc:	use the co-processor and CPU shared memory allocator or not
> + * @supports_ctrls: support ctrl handler or not. If it is true, The DIP driver
> + *		    initialized the ctrl handler for this video node.
> + * @fmts:	buffer format supported by this video device
> + * @num_fmts:	total number of buffer format supported by this video device
> + * @description: description of the video device. It will be returned when
> + *		 V4L2 enum_fmt calls
> + * @dma_port:	dma port id associated to this video device
> + * @frmsizeenum: frame size supported
> + * @ops:	v4l2_ioctl_ops pointer used by this video device
> + * @vb2_ops:	vb2_ops pointer used by this video device
> + * @flags:	flags used in media_create_intf_link()
> + * @default_fmt_idx: indeciate the default format with index of @fmts
> + *
> + * The structure describes the video device setting of DIP, which are used to
> + * register the video devices and support the related V4L2 and VB2 operations.
> + */
> +struct mtk_dip_video_device_desc {
> +	const char *name;
> +	int id;
> +	u32 buf_type;
> +	u32 cap;
> +	int smem_alloc;
> +	int supports_ctrls;
> +	const struct mtk_dip_dev_format *fmts;
> +	int num_fmts;
> +	const char *description;
> +	int default_width;
> +	int default_height;
> +	unsigned int dma_port;
> +	const struct v4l2_frmsizeenum *frmsizeenum;
> +	const struct v4l2_ioctl_ops *ops;
> +	const struct vb2_ops *vb2_ops;
> +	u32 flags;
> +	int default_fmt_idx;
> +};
> +
> +/**
> + * struct mtk_dip_dev_queue - dip's video device queue
> + * @vbq:	vb2_queue of the dip's video device
> + * @lock:		serializes vb2 queue and video device operations.
> + * @dev_fmt:	buffer format of the video device
> + *
> + * The structure supports a vb2_queue of dip's video device with the DIP's
> + * internal buffer format.
> + */
> +struct mtk_dip_dev_queue {
> +	struct vb2_queue vbq;
> +	/* Serializes vb2 queue and video device operations */
> +	struct mutex lock;
> +	const struct mtk_dip_dev_format *dev_fmt;
> +};
> +
> +/**
> + * struct mtk_dip_video_device - DIP's video device
> + * @vdev:	video_device of the dip's video device
> + * @dev_q:	the mtk_dip_dev_queue providing vb2 device queue for the
> + *		video device
> + * @vdev_fmt:	the current v4l2 format of the video device
> + * @vdev_pad:	the pad connected to the dip sub device of the pipe
> + * @pad_fmt:	the pad format of vdev_pad
> + * @ctrl_handler: the v4l2_ctrl_handler of the video device. Only the video
> + *		  device supporting rotation initialized the handler.
> + * @flags:	the flags recording the link status between the video device
> + *		and the sub device of the pipe
> + * @desc:	setting of the video device. The driver initialize the video
> + *		device according to the settings.
> + * @buf_list:	the list of vb2 buffers enqueued through this video device
> + * @buf_list_lock: protect the in-device buffer list
> + * @crop:	crop setting of the video device
> + * @compose:	compose setting the video device
> + * @rotation:	rotation setting of the video device
> + *
> + * The structure extends video_device and integrates the vb2 queue, a media_pad
> + * connected to DIP's sub device, and a v4l2_ctrl_handler to handling ctrl.
> + */
> +struct mtk_dip_video_device {
> +	struct video_device vdev;
> +	struct mtk_dip_dev_queue dev_q;
> +	struct v4l2_format vdev_fmt;
> +	struct media_pad vdev_pad;
> +	struct v4l2_mbus_framefmt pad_fmt;
> +	struct v4l2_ctrl_handler ctrl_handler;
> +	u32 flags;
> +	const struct mtk_dip_video_device_desc *desc;
> +	struct list_head buf_list;
> +	/* the list of vb2 buffers enqueued through this video device */
> +	spinlock_t buf_list_lock;
> +	struct v4l2_rect crop;
> +	struct v4l2_rect compose;
> +	int rotation;
> +};
> +
> +/**
> + * struct mtk_dip_pipe - DIP's pipe
> + * @dip_dev:	the dip driver device instance
> + * @mtk_dip_video_device: the video devices of the pipe. The entry must be NULL
> + *			  if there is no video devices for the ID
> + * @nodes_streaming:	bitmask records the video devices which are streaming
> + * @nodes_enabled:	bitmask records the video devices which are enabled
> + * @streaming:		true if the pipe is streaming
> + * @subdev:		sub device connected to the output and capture video
> + *			device named as the pipe's name
> + * @pipe_job_sequence:	the last sequence number of the pipe jobs
> + * @pipe_job_pending_list: the list saving jobs before it has been put into
> + *			   running state by mtk_dip_pipe_try_enqueue().
> + * @num_pending_jobs:	number of jobs in pipe_job_pending_list
> + * @pipe_job_running_list: the list saving jobs already scheduled into DIP
> + * @num_jobs:		number of jobs in pipe_job_running_list
> + * @lock:		serializes pipe's stream on/off and buffers enqueue
> + *			operations
> + * @job_lock:		protect the pipe job list
> + * @desc:		the settings of the pipe
> + *
> + * The structure represents a DIP pipe. A pipe may contains a raw output
> + * video device and at least one MDP capture device.
> + */
> +struct mtk_dip_pipe {
> +	struct mtk_dip_dev *dip_dev;
> +	struct mtk_dip_video_device nodes[MTK_DIP_VIDEO_NODE_ID_TOTAL_NUM];
> +	unsigned int nodes_streaming;
> +	unsigned int nodes_enabled;
> +	int streaming;
> +	struct media_pad *subdev_pads;
> +	struct media_pipeline pipeline;
> +	struct v4l2_subdev subdev;
> +	atomic_t pipe_job_sequence;
> +	struct list_head pipe_job_pending_list;
> +	int num_pending_jobs;
> +	struct list_head pipe_job_running_list;
> +	int num_jobs;
> +	/*serializes pipe's stream on/off and buffers enqueue operations*/
> +	struct mutex lock;
> +	spinlock_t job_lock; /* protect the pipe job list */
> +	const struct mtk_dip_pipe_desc *desc;
> +};
> +
> +/**
> + * struct mtk_dip_dev - DIP's device instance
> + * @dev:	the device structure of DIP
> + * @mdev:	media device of DIP. All video devices and sub devices of
> + *		DIP are registered to the media device.
> + * @v4l2_dev:	v4l2_device representing the device-level status of DIP
> + * @dip_pipe:	pipes of the DIP device. For example, capture, preview and
> + *		reprocessing pipes.
> + * @clks:	clocks required by DIP hardware
> + * @num_clks:	the total number of clocks of DIP hardware
> + * @composer_wq:	The work queue for jobs which are going to be sent to
> + *			coprocessor.
> + * @num_composing: number of jobs in SCP
> + * @mdp_wq:	the work queue for jobs which are going to be sent to MDP
> + *		driver and GCE hardware.
> + *
> + * @flushing_waitq:	the waiting queue to keep the process which are
> + *			waiting for the jobs in SCP to be finished.
> + * @mdpcb_wq:	the work queue for jobs with abnormal status back from MDP/GCE
> + *		, it need to pass to SCP to check the error status instead of
> + *		returning the buffer to user directly.
> + * @mdp_pdev:	mdp platform device which handling the MDP part jobs and
> + *		pass the task to GCE hardware.
> + * @scp_pdev:	SCP platform device which handling the commands to and from
> + *		coprocessor
> + * @rproc_handle:	remote processor handle to control SCP
> + * @dip_freebufferlist:	free working buffer list
> + * @working_buf_mem_scp_daddr:	the SCP caddress of the memory area of working
> + *				buffers
> + * @working_buf_mem_vaddr:	the cpu address of the memory area of working
> + *				buffers
> + * @working_buf_mem_isp_daddr:	the isp dma address of the memory area of
> + *				working buffers
> + * @working_buf_mem_size:	total size in bytes of the memory area of
> + *				working buffers
> + * @working_buf:	the working buffers of DIP
> + *
> + * @dip_enqueue_cnt:	it is used to create the sequence number of the job
> + *			which is already enqueued to DIP.
> + * @dip_stream_cnt:	the number of streaming pipe in DIP
> + * @hw_op_lock:		serialize request operation to DIP coprocessor and
> + *			hardware
> + * @sem:		To restrict the max number of request be send to SCP.
> + *
> + * The structure maintains DIP's device level status.
> + */
> +struct mtk_dip_dev {
> +	struct device *dev;
> +	struct media_device mdev;
> +	struct v4l2_device v4l2_dev;
> +	struct mtk_dip_pipe dip_pipe[MTK_DIP_PIPE_ID_TOTAL_NUM];
> +	struct clk_bulk_data clks[MTK_DIP_CLK_NUM];
> +	int num_clks;
> +	struct workqueue_struct *composer_wq;
> +	struct workqueue_struct *mdp_wq;
> +	wait_queue_head_t flushing_waitq;
> +	atomic_t num_composing;
> +	struct workqueue_struct *mdpcb_wq;
> +	struct platform_device *mdp_pdev;
> +	struct platform_device *scp_pdev;
> +	struct rproc *rproc_handle;
> +	struct mtk_dip_hw_working_buf_list dip_freebufferlist;
> +	dma_addr_t working_buf_mem_scp_daddr;
> +	void *working_buf_mem_vaddr;
> +	dma_addr_t working_buf_mem_isp_daddr;
> +	int working_buf_mem_size;
> +	struct mtk_dip_hw_subframe working_buf[DIP_SUB_FRM_DATA_NUM];
> +	atomic_t dip_enqueue_cnt;
> +	int dip_stream_cnt;
> +	/* To serialize request opertion to DIP co-procrosser and hadrware */
> +	struct mutex hw_op_lock;
> +	/* To restrict the max number of request be send to SCP */
> +	struct semaphore sem;
> +};
> +
> +/**
> + * struct mtk_dip_request - DIP's request
> + * @req:	the media_request object of the request
> + * @dip_pipe:	the pipe owning of the request; a request can only belongs one
> + *		DIP pipe
> + * @id:		the unique job id in DIP
> + * @buf_map:	the buffers of the request. The entry should be NULL if the
> + *		corresponding video device doesn't enqueue the buffer.
> + * @img_fparam:	frame related parameters which will be passed to coprocessor
> + * @fw_work:	work_struct used to be sent to composer_wq of mtk_dip_dev
> + * @mdp_work:	work_struct used to be sent to mdp_wq of mtk_dip_dev
> + * @mdpcb_work:	work_struct used to be sent to mdpcb_wq of mtk_dip_dev.
> + *		It is used only in error handling flow.
> + * @working_buf: working buffer of the request
> + * @buf_count:	the number of buffers in the request
> + *
> + * The structure extends media_request and integrates a map of the buffers,
> + * and the working buffer pointers. It is the job instance used in DIP's
> + * drivers.
> + */
> +struct mtk_dip_request {
> +	struct media_request req;
> +	struct mtk_dip_pipe *dip_pipe;
> +	int id;
> +	struct mtk_dip_dev_buffer *buf_map[MTK_DIP_VIDEO_NODE_ID_TOTAL_NUM];
> +	struct img_frameparam img_fparam;
> +	struct work_struct fw_work;
> +	struct work_struct mdp_work;
> +	struct work_struct mdpcb_work;
> +	struct mtk_dip_hw_subframe *working_buf;
> +	atomic_t buf_count;
> +	struct list_head list;
> +};
> +
> +int mtk_dip_dev_media_register(struct device *dev,
> +			       struct media_device *media_dev);
> +
> +void mtk_dip_dev_v4l2_release(struct mtk_dip_dev *dip_dev);
> +
> +int mtk_dip_dev_v4l2_register(struct device *dev,
> +			      struct media_device *media_dev,
> +			      struct v4l2_device *v4l2_dev);
> +
> +int mtk_dip_pipe_v4l2_register(struct mtk_dip_pipe *pipe,
> +			       struct media_device *media_dev,
> +			       struct v4l2_device *v4l2_dev);
> +
> +void mtk_dip_pipe_v4l2_unregister(struct mtk_dip_pipe *pipe);
> +
> +int mtk_dip_pipe_queue_buffers(struct media_request *req, int initial);
> +
> +int mtk_dip_pipe_init(struct mtk_dip_dev *dip_dev, struct mtk_dip_pipe *pipe,
> +		      const struct mtk_dip_pipe_desc *setting);
> +
> +void mtk_dip_pipe_ipi_params_config(struct mtk_dip_request *req);
> +
> +int mtk_dip_pipe_release(struct mtk_dip_pipe *pipe);
> +
> +struct mtk_dip_request *
> +mtk_dip_pipe_get_running_job(struct mtk_dip_pipe *pipe,
> +			     int id);
> +
> +void mtk_dip_pipe_remove_job(struct mtk_dip_request *req);
> +
> +int mtk_dip_pipe_next_job_id(struct mtk_dip_pipe *pipe);
> +
> +void mtk_dip_pipe_debug_job(struct mtk_dip_pipe *pipe,
> +			    struct mtk_dip_request *req);
> +
> +void mtk_dip_pipe_job_finish(struct mtk_dip_request *req,
> +			     enum vb2_buffer_state vbf_state);
> +
> +const struct mtk_dip_dev_format *
> +mtk_dip_pipe_find_fmt(struct mtk_dip_pipe *pipe,
> +		      struct mtk_dip_video_device *node,
> +		      u32 format);
> +
> +void mtk_dip_pipe_try_fmt(struct mtk_dip_pipe *pipe,
> +			  struct mtk_dip_video_device *node,
> +			  struct v4l2_format *fmt,
> +			  const struct v4l2_format *ufmt,
> +			  const struct mtk_dip_dev_format *dfmt);
> +
> +void mtk_dip_pipe_load_default_fmt(struct mtk_dip_pipe *pipe,
> +				   struct mtk_dip_video_device *node,
> +				   struct v4l2_format *fmt_to_fill);
> +
> +void mtk_dip_pipe_try_enqueue(struct mtk_dip_pipe *pipe);
> +
> +void mtk_dip_hw_enqueue(struct mtk_dip_dev *dip_dev,
> +			struct mtk_dip_request *req);
> +
> +int mtk_dip_hw_streamoff(struct mtk_dip_pipe *pipe);
> +
> +int mtk_dip_hw_streamon(struct mtk_dip_pipe *pipe);
> +
> +int mtk_dip_hw_working_buf_pool_init(struct mtk_dip_dev *dip_dev);
> +
> +void mtk_dip_hw_working_buf_pool_release(struct mtk_dip_dev *dip_dev);
> +
> +static inline struct mtk_dip_pipe*
> +mtk_dip_dev_get_pipe(struct mtk_dip_dev *dip_dev, unsigned int pipe_id)
> +{
> +	if (pipe_id < 0 && pipe_id >= MTK_DIP_PIPE_ID_TOTAL_NUM)
> +		return NULL;
> +
> +	return &dip_dev->dip_pipe[pipe_id];
> +}
> +
> +static inline struct mtk_dip_video_device*
> +mtk_dip_file_to_node(struct file *file)
> +{
> +	return container_of(video_devdata(file),
> +			    struct mtk_dip_video_device, vdev);
> +}
> +
> +static inline struct mtk_dip_pipe*
> +mtk_dip_subdev_to_pipe(struct v4l2_subdev *sd)
> +{
> +	return container_of(sd, struct mtk_dip_pipe, subdev);
> +}
> +
> +static inline struct mtk_dip_dev*
> +mtk_dip_mdev_to_dev(struct media_device *mdev)
> +{
> +	return container_of(mdev, struct mtk_dip_dev, mdev);
> +}
> +
> +static inline struct mtk_dip_video_device*
> +mtk_dip_vbq_to_node(struct vb2_queue *vq)
> +{
> +	return container_of(vq, struct mtk_dip_video_device, dev_q.vbq);
> +}
> +
> +static inline struct mtk_dip_dev_buffer*
> +mtk_dip_vb2_buf_to_dev_buf(struct vb2_buffer *vb)
> +{
> +	return container_of(vb, struct mtk_dip_dev_buffer, vbb.vb2_buf);
> +}
> +
> +static inline struct mtk_dip_request*
> +mtk_dip_media_req_to_dip_req(struct media_request *req)
> +{
> +	return container_of(req, struct mtk_dip_request, req);
> +}
> +
> +static inline struct mtk_dip_request*
> +mtk_dip_hw_fw_work_to_req(struct work_struct *fw_work)
> +{
> +	return container_of(fw_work, struct mtk_dip_request, fw_work);
> +}
> +
> +static inline struct mtk_dip_request*
> +mtk_dip_hw_mdp_work_to_req(struct work_struct *mdp_work)
> +{
> +	return container_of(mdp_work, struct mtk_dip_request, mdp_work);
> +}
> +
> +static inline struct mtk_dip_request *
> +mtk_dip_hw_mdpcb_work_to_req(struct work_struct *mdpcb_work)
> +{
> +	return container_of(mdpcb_work, struct mtk_dip_request, mdpcb_work);
> +}
> +
> +static inline int mtk_dip_buf_is_meta(u32 type)
> +{
> +	return type == V4L2_BUF_TYPE_META_CAPTURE ||
> +		type == V4L2_BUF_TYPE_META_OUTPUT;
> +}
> +
> +static inline int mtk_dip_pipe_get_pipe_from_job_id(int id)
> +{
> +	return (id >> 16) & 0x0000ffff;
> +}
> +
> +static inline void
> +mtk_dip_wbuf_to_ipi_img_sw_addr(struct img_sw_addr *ipi_addr,
> +				struct mtk_dip_hw_working_buf *wbuf)
> +{
> +	ipi_addr->pa = (u32)wbuf->scp_daddr;
> +}
> +
> +static inline void
> +mtk_dip_wbuf_to_ipi_img_addr(struct img_addr *ipi_addr,
> +			     struct mtk_dip_hw_working_buf *wbuf)
> +{
> +	ipi_addr->pa = (u32)wbuf->scp_daddr;
> +	ipi_addr->iova = (u32)wbuf->isp_daddr;
> +}
> +
> +static inline void
> +mtk_dip_wbuf_to_ipi_tuning_addr(struct tuning_addr *ipi_addr,
> +				struct mtk_dip_hw_working_buf *wbuf)
> +{
> +	ipi_addr->pa = (u32)wbuf->scp_daddr;
> +	ipi_addr->iova = (u32)wbuf->isp_daddr;
> +}
> +
> +#endif /* _MTK_DIP_DEV_H_ */
> diff --git a/drivers/media/platform/mtk-isp/isp_50/dip/mtk_dip-hw.h b/drivers/media/platform/mtk-isp/isp_50/dip/mtk_dip-hw.h
> new file mode 100644
> index 000000000000..9a414fd91094
> --- /dev/null
> +++ b/drivers/media/platform/mtk-isp/isp_50/dip/mtk_dip-hw.h
> @@ -0,0 +1,156 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (c) 2018 MediaTek Inc.
> + *
> + * Author: Frederic Chen <frederic.chen@mediatek.com>
> + *         Holmes Chiou <holmes.chiou@mediatek.com>
> + *
> + */
> +
> +#ifndef _MTK_DIP_HW_H_
> +#define _MTK_DIP_HW_H_
> +
> +#include <linux/clk.h>
> +#include "mtk-img-ipi.h"
> +
> +#define MTK_DIP_CLK_NUM			2
> +
> +#define DIP_COMPOSING_MAX_NUM		3
> +#define DIP_FRM_SZ			(84 * 1024)
> +#define DIP_SUB_FRM_SZ			(20 * 1024)
> +#define DIP_TUNING_SZ			(32 * 1024)
> +#define DIP_COMP_SZ			(28 * 1024)
> +#define DIP_FRAMEPARAM_SZ		(4 * 1024)
> +
> +#define DIP_TUNING_OFFSET		DIP_SUB_FRM_SZ
> +#define DIP_COMP_OFFSET			(DIP_TUNING_OFFSET + DIP_TUNING_SZ)
> +#define DIP_FRAMEPARAM_OFFSET		(DIP_COMP_OFFSET + DIP_COMP_SZ)
> +#define DIP_SUB_FRM_DATA_NUM		32
> +
> +/*
> + * MDP native color code
> + * Plane count: 1, 2, 3
> + * H-subsample: 0, 1, 2
> + * V-subsample: 0, 1
> + * Color group: 0-RGB, 1-YUV, 2-raw
> + */
> +#define DIP_MDP_COLOR(PACKED, LOOSE, VIDEO, PLANE, HF, VF, BITS, GROUP, SWAP, \
> +	ID) \
> +	(((PACKED) << 27) | ((LOOSE) << 26) | ((VIDEO) << 23) |\
> +	((PLANE) << 21) | ((HF) << 19) | ((VF) << 18) | ((BITS) << 8) |\
> +	((GROUP) << 6) | ((SWAP) << 5) | ((ID) << 0))
> +
> +#define DIP_MCOLOR_IS_BLOCK_MODE(c)	((0x00800000 & (c)) >> 23)
> +#define DIP_MCOLOR_GET_PLANE_COUNT(c)	((0x00600000 & (c)) >> 21)
> +#define DIP_MCOLOR_GET_H_SUBSAMPLE(c)	((0x00180000 & (c)) >> 19)
> +#define DIP_MCOLOR_GET_V_SUBSAMPLE(c)	((0x00040000 & (c)) >> 18)
> +#define DIP_MCOLOR_BITS_PER_PIXEL(c)	((0x0003ff00 & (c)) >>  8)
> +#define DIP_MCOLOR_GET_GROUP(c)		((0x000000c0 & (c)) >>  6)
> +#define DIP_MCOLOR_IS_RGB(c)		(DIP_MCOLOR_GET_GROUP(c) == 0)
> +#define DIP_MCOLOR_IS_YUV(c)		(DIP_MCOLOR_GET_GROUP(c) == 1)
> +#define DIP_MCOLOR_IS_UV_COPLANE(c)	((DIP_MCOLOR_GET_PLANE_COUNT(c) == \
> +					  2) && \
> +					 DIP_MCOLOR_IS_YUV(c))
> +
> +enum DIP_MDP_COLOR {
> +	DIP_MCOLOR_UNKNOWN	= 0,
> +
> +	DIP_MCOLOR_FULLG8_RGGB = DIP_MDP_COLOR(0, 0, 0, 1, 0, 0, 8, 2, 0, 21),
> +	DIP_MCOLOR_FULLG8_GRBG = DIP_MDP_COLOR(0, 0, 0, 1, 0, 1, 8, 2, 0, 21),
> +	DIP_MCOLOR_FULLG8_GBRG = DIP_MDP_COLOR(0, 0, 0, 1, 1, 0, 8, 2, 0, 21),
> +	DIP_MCOLOR_FULLG8_BGGR = DIP_MDP_COLOR(0, 0, 0, 1, 1, 1, 8, 2, 0, 21),
> +	DIP_MCOLOR_FULLG8      = DIP_MCOLOR_FULLG8_BGGR,
> +
> +	DIP_MCOLOR_FULLG10_RGGB = DIP_MDP_COLOR(0, 0, 0, 1, 0, 0, 10, 2, 0, 21),
> +	DIP_MCOLOR_FULLG10_GRBG = DIP_MDP_COLOR(0, 0, 0, 1, 0, 1, 10, 2, 0, 21),
> +	DIP_MCOLOR_FULLG10_GBRG = DIP_MDP_COLOR(0, 0, 0, 1, 1, 0, 10, 2, 0, 21),
> +	DIP_MCOLOR_FULLG10_BGGR = DIP_MDP_COLOR(0, 0, 0, 1, 1, 1, 10, 2, 0, 21),
> +	DIP_MCOLOR_FULLG10	= DIP_MCOLOR_FULLG10_BGGR,
> +
> +	DIP_MCOLOR_FULLG12_RGGB = DIP_MDP_COLOR(0, 0, 0, 1, 0, 0, 12, 2, 0, 21),
> +	DIP_MCOLOR_FULLG12_GRBG = DIP_MDP_COLOR(0, 0, 0, 1, 0, 1, 12, 2, 0, 21),
> +	DIP_MCOLOR_FULLG12_GBRG = DIP_MDP_COLOR(0, 0, 0, 1, 1, 0, 12, 2, 0, 21),
> +	DIP_MCOLOR_FULLG12_BGGR = DIP_MDP_COLOR(0, 0, 0, 1, 1, 1, 12, 2, 0, 21),
> +	DIP_MCOLOR_FULLG12	= DIP_MCOLOR_FULLG12_BGGR,
> +
> +	DIP_MCOLOR_FULLG14_RGGB = DIP_MDP_COLOR(0, 0, 0, 1, 0, 0, 14, 2, 0, 21),
> +	DIP_MCOLOR_FULLG14_GRBG = DIP_MDP_COLOR(0, 0, 0, 1, 0, 1, 14, 2, 0, 21),
> +	DIP_MCOLOR_FULLG14_GBRG = DIP_MDP_COLOR(0, 0, 0, 1, 1, 0, 14, 2, 0, 21),
> +	DIP_MCOLOR_FULLG14_BGGR = DIP_MDP_COLOR(0, 0, 0, 1, 1, 1, 14, 2, 0, 21),
> +	DIP_MCOLOR_FULLG14	= DIP_MCOLOR_FULLG14_BGGR,
> +
> +	DIP_MCOLOR_BAYER8_RGGB  = DIP_MDP_COLOR(0, 0, 0, 1, 0, 0, 8, 2, 0, 20),
> +	DIP_MCOLOR_BAYER8_GRBG  = DIP_MDP_COLOR(0, 0, 0, 1, 0, 1, 8, 2, 0, 20),
> +	DIP_MCOLOR_BAYER8_GBRG  = DIP_MDP_COLOR(0, 0, 0, 1, 1, 0, 8, 2, 0, 20),
> +	DIP_MCOLOR_BAYER8_BGGR  = DIP_MDP_COLOR(0, 0, 0, 1, 1, 1, 8, 2, 0, 20),
> +	DIP_MCOLOR_BAYER8	= DIP_MCOLOR_BAYER8_BGGR,
> +
> +	DIP_MCOLOR_BAYER10_RGGB = DIP_MDP_COLOR(0, 0, 0, 1, 0, 0, 10, 2, 0, 20),
> +	DIP_MCOLOR_BAYER10_GRBG = DIP_MDP_COLOR(0, 0, 0, 1, 0, 1, 10, 2, 0, 20),
> +	DIP_MCOLOR_BAYER10_GBRG = DIP_MDP_COLOR(0, 0, 0, 1, 1, 0, 10, 2, 0, 20),
> +	DIP_MCOLOR_BAYER10_BGGR = DIP_MDP_COLOR(0, 0, 0, 1, 1, 1, 10, 2, 0, 20),
> +	DIP_MCOLOR_BAYER10	= DIP_MCOLOR_BAYER10_BGGR,
> +
> +	DIP_MCOLOR_BAYER12_RGGB = DIP_MDP_COLOR(0, 0, 0, 1, 0, 0, 12, 2, 0, 20),
> +	DIP_MCOLOR_BAYER12_GRBG = DIP_MDP_COLOR(0, 0, 0, 1, 0, 1, 12, 2, 0, 20),
> +	DIP_MCOLOR_BAYER12_GBRG = DIP_MDP_COLOR(0, 0, 0, 1, 1, 0, 12, 2, 0, 20),
> +	DIP_MCOLOR_BAYER12_BGGR = DIP_MDP_COLOR(0, 0, 0, 1, 1, 1, 12, 2, 0, 20),
> +	DIP_MCOLOR_BAYER12	= DIP_MCOLOR_BAYER12_BGGR,
> +
> +	DIP_MCOLOR_BAYER14_RGGB = DIP_MDP_COLOR(0, 0, 0, 1, 0, 0, 14, 2, 0, 20),
> +	DIP_MCOLOR_BAYER14_GRBG = DIP_MDP_COLOR(0, 0, 0, 1, 0, 1, 14, 2, 0, 20),
> +	DIP_MCOLOR_BAYER14_GBRG = DIP_MDP_COLOR(0, 0, 0, 1, 1, 0, 14, 2, 0, 20),
> +	DIP_MCOLOR_BAYER14_BGGR = DIP_MDP_COLOR(0, 0, 0, 1, 1, 1, 14, 2, 0, 20),
> +	DIP_MCOLOR_BAYER14	= DIP_MCOLOR_BAYER14_BGGR,
> +
> +	DIP_MCOLOR_UYVY		= DIP_MDP_COLOR(0, 0, 0, 1, 1, 0, 16, 1, 0, 4),
> +	DIP_MCOLOR_VYUY		= DIP_MDP_COLOR(0, 0, 0, 1, 1, 0, 16, 1, 1, 4),
> +	DIP_MCOLOR_YUYV		= DIP_MDP_COLOR(0, 0, 0, 1, 1, 0, 16, 1, 0, 5),
> +	DIP_MCOLOR_YVYU		= DIP_MDP_COLOR(0, 0, 0, 1, 1, 0, 16, 1, 1, 5),
> +
> +	DIP_MCOLOR_I420		= DIP_MDP_COLOR(0, 0, 0, 3, 1, 1,  8, 1, 0, 8),
> +	DIP_MCOLOR_YV12		= DIP_MDP_COLOR(0, 0, 0, 3, 1, 1,  8, 1, 1, 8),
> +
> +	DIP_MCOLOR_NV12		= DIP_MDP_COLOR(0, 0, 0, 2, 1, 1,  8, 1, 0, 12),
> +};
> +
> +#define FRAME_STATE_INIT	0
> +#define FRAME_STATE_HW_TIMEOUT	1
> +
> +#define STREAM_UNKNOWN		0
> +#define STREAM_BITBLT		1
> +#define STREAM_GPU_BITBLT	2
> +#define STREAM_DUAL_BITBLT	3
> +#define STREAM_2ND_BITBLT	4
> +#define STREAM_ISP_IC		5
> +#define STREAM_ISP_VR		6
> +#define STREAM_ISP_ZSD		7
> +#define STREAM_ISP_IP		8
> +#define STREAM_ISP_VSS		9
> +#define STREAM_ISP_ZSD_SLOW	10
> +#define STREAM_WPE		11
> +#define STREAM_WPE2		12
> +
> +struct mtk_dip_hw_working_buf {
> +	dma_addr_t scp_daddr;
> +	void *vaddr;
> +	dma_addr_t isp_daddr;
> +};
> +
> +struct mtk_dip_hw_subframe {
> +	struct mtk_dip_hw_working_buf buffer;
> +	int size;
> +	struct mtk_dip_hw_working_buf config_data;
> +	struct mtk_dip_hw_working_buf tuning_buf;
> +	struct mtk_dip_hw_working_buf frameparam;
> +	struct list_head list_entry;
> +};
> +
> +struct mtk_dip_hw_working_buf_list {
> +	struct list_head list;
> +	u32 cnt;
> +	spinlock_t lock; /* protect the list and cnt */
> +};
> +
> +#endif /* _MTK_DIP_HW_H_ */
> +
> diff --git a/drivers/media/platform/mtk-isp/isp_50/dip/mtk_dip-sys.c b/drivers/media/platform/mtk-isp/isp_50/dip/mtk_dip-sys.c
> new file mode 100644
> index 000000000000..9a0456342fcd
> --- /dev/null
> +++ b/drivers/media/platform/mtk-isp/isp_50/dip/mtk_dip-sys.c
> @@ -0,0 +1,521 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2018 MediaTek Inc.
> + *
> + * Author: Frederic Chen <frederic.chen@mediatek.com>
> + *         Holmes Chiou <holmes.chiou@mediatek.com>
> + *
> + */
> +
> +#include <linux/device.h>
> +#include <linux/dma-iommu.h>
> +#include <linux/freezer.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/remoteproc.h>
> +#include <linux/remoteproc/mtk_scp.h>
> +#include <linux/slab.h>
> +#include <linux/spinlock.h>
> +#include <linux/wait.h>
> +#include "mtk-mdp3-cmdq.h"
> +#include "mtk_dip-dev.h"
> +#include "mtk_dip-hw.h"
> +
> +int mtk_dip_hw_working_buf_pool_init(struct mtk_dip_dev *dip_dev)
> +{
> +	int i;
> +	const int working_buf_size = round_up(DIP_FRM_SZ, PAGE_SIZE);
> +	phys_addr_t working_buf_paddr;
> +
> +	INIT_LIST_HEAD(&dip_dev->dip_freebufferlist.list);
> +	spin_lock_init(&dip_dev->dip_freebufferlist.lock);
> +	dip_dev->dip_freebufferlist.cnt = 0;
> +
> +	dip_dev->working_buf_mem_size = DIP_SUB_FRM_DATA_NUM *
> +		working_buf_size;
> +	dip_dev->working_buf_mem_vaddr =
> +		dma_alloc_coherent(&dip_dev->scp_pdev->dev,
> +				   dip_dev->working_buf_mem_size,
> +				   &dip_dev->working_buf_mem_scp_daddr,
> +				   GFP_KERNEL);
> +	if (!dip_dev->working_buf_mem_vaddr) {
> +		dev_err(dip_dev->dev,
> +			"memory alloc size %ld failed\n",
> +			dip_dev->working_buf_mem_size);
> +		return -ENOMEM;
> +	}
> +
> +	/*
> +	 * We got the incorrect physical address mapped when
> +	 * using dma_map_single() so I used dma_map_page_attrs()
> +	 * directly to workaround here.
> +	 *
> +	 * When I use dma_map_single() to map the address, the
> +	 * physical address retrieved back with iommu_get_domain_for_dev()
> +	 * and iommu_iova_to_phys() was not equal to the
> +	 * SCP dma address (it should be the same as the physical address
> +	 * since we don't have iommu), and was shifted by 0x4000000.
> +	 */
> +	working_buf_paddr = dip_dev->working_buf_mem_scp_daddr;
> +
> +	dip_dev->working_buf_mem_isp_daddr =
> +		dma_map_resource(dip_dev->dev, working_buf_paddr,
> +				 dip_dev->working_buf_mem_size,
> +				 DMA_BIDIRECTIONAL, DMA_ATTR_SKIP_CPU_SYNC);
> +	if (dma_mapping_error(dip_dev->dev,
> +			      dip_dev->working_buf_mem_isp_daddr)) {
> +		dev_err(dip_dev->dev,
> +			"failed to map buffer: s_daddr(%pad)\n",
> +			&dip_dev->working_buf_mem_scp_daddr);
> +		dma_free_coherent(&dip_dev->scp_pdev->dev,
> +				  dip_dev->working_buf_mem_size,
> +				  dip_dev->working_buf_mem_vaddr,
> +				  dip_dev->working_buf_mem_scp_daddr);
> +
> +		return -ENOMEM;
> +	}
> +
> +	for (i = 0; i < DIP_SUB_FRM_DATA_NUM; i++) {
> +		struct mtk_dip_hw_subframe *buf = &dip_dev->working_buf[i];
> +		int offset;
> +
> +		/*
> +		 * Total: 0 ~ 72 KB
> +		 * SubFrame: 0 ~ 16 KB
> +		 */
> +		offset = i * working_buf_size;
> +		buf->buffer.scp_daddr =
> +			dip_dev->working_buf_mem_scp_daddr + offset;
> +		buf->buffer.vaddr =
> +			dip_dev->working_buf_mem_vaddr + offset;
> +		buf->buffer.isp_daddr =
> +			dip_dev->working_buf_mem_isp_daddr + offset;
> +		buf->size = working_buf_size;
> +
> +		/* Tuning: 16 ~ 48 KB */
> +		buf->tuning_buf.scp_daddr =
> +			buf->buffer.scp_daddr + DIP_TUNING_OFFSET;
> +		buf->tuning_buf.vaddr =
> +			buf->buffer.vaddr + DIP_TUNING_OFFSET;
> +		buf->tuning_buf.isp_daddr =
> +			buf->buffer.isp_daddr + DIP_TUNING_OFFSET;
> +
> +		/* Config_data: 48 ~ 72 KB */
> +		buf->config_data.scp_daddr =
> +			buf->buffer.scp_daddr + DIP_COMP_OFFSET;
> +		buf->config_data.vaddr = buf->buffer.vaddr + DIP_COMP_OFFSET;
> +
> +		/* Frame parameters: 72 ~ 76 KB */
> +		buf->frameparam.scp_daddr =
> +			buf->buffer.scp_daddr + DIP_FRAMEPARAM_OFFSET;
> +		buf->frameparam.vaddr =
> +			buf->buffer.vaddr + DIP_FRAMEPARAM_OFFSET;
> +
> +		list_add_tail(&buf->list_entry,
> +			      &dip_dev->dip_freebufferlist.list);
> +		dip_dev->dip_freebufferlist.cnt++;
> +	}
> +
> +	return 0;
> +}
> +
> +void mtk_dip_hw_working_buf_pool_release(struct mtk_dip_dev *dip_dev)
> +{
> +	/* All the buffer should be in the freebufferlist when release */
> +	dma_unmap_resource(dip_dev->dev,
> +			   dip_dev->working_buf_mem_isp_daddr,
> +			   dip_dev->working_buf_mem_size, DMA_BIDIRECTIONAL,
> +			   DMA_ATTR_SKIP_CPU_SYNC);
> +
> +	dma_free_coherent(&dip_dev->scp_pdev->dev,
> +			  dip_dev->working_buf_mem_size,
> +			  dip_dev->working_buf_mem_vaddr,
> +			  dip_dev->working_buf_mem_scp_daddr);
> +}
> +
> +static void mtk_dip_hw_working_buf_free(struct mtk_dip_dev *dip_dev,
> +					struct mtk_dip_hw_subframe *working_buf)
> +{
> +	if (!working_buf)
> +		return;
> +
> +	spin_lock(&dip_dev->dip_freebufferlist.lock);
> +	list_add_tail(&working_buf->list_entry,
> +		      &dip_dev->dip_freebufferlist.list);
> +	dip_dev->dip_freebufferlist.cnt++;
> +	spin_unlock(&dip_dev->dip_freebufferlist.lock);
> +}
> +
> +static struct mtk_dip_hw_subframe*
> +mtk_dip_hw_working_buf_alloc(struct mtk_dip_dev *dip_dev)
> +{
> +	struct mtk_dip_hw_subframe *working_buf;
> +
> +	spin_lock(&dip_dev->dip_freebufferlist.lock);
> +	if (list_empty(&dip_dev->dip_freebufferlist.list)) {
> +		spin_unlock(&dip_dev->dip_freebufferlist.lock);
> +		return NULL;
> +	}
> +
> +	working_buf = list_first_entry(&dip_dev->dip_freebufferlist.list,
> +				       struct mtk_dip_hw_subframe, list_entry);
> +	list_del(&working_buf->list_entry);
> +	dip_dev->dip_freebufferlist.cnt--;
> +	spin_unlock(&dip_dev->dip_freebufferlist.lock);
> +
> +	return working_buf;
> +}
> +
> +static void mtk_dip_notify(struct mtk_dip_request *req)
> +{
> +	struct mtk_dip_dev *dip_dev = req->dip_pipe->dip_dev;
> +	struct mtk_dip_pipe *pipe = req->dip_pipe;
> +	struct img_ipi_frameparam *iparam = &req->img_fparam.frameparam;
> +	enum vb2_buffer_state vbf_state;
> +
> +	if (iparam->state != FRAME_STATE_HW_TIMEOUT)
> +		vbf_state = VB2_BUF_STATE_DONE;
> +	else
> +		vbf_state = VB2_BUF_STATE_ERROR;
> +
> +	pm_runtime_mark_last_busy(dip_dev->dev);
> +	pm_runtime_put_autosuspend(dip_dev->dev);
> +
> +	/*
> +	 * The job may be aleady removed by streamoff, so I need to check
> +	 * it by id here.
> +	 */
> +	if (mtk_dip_pipe_get_running_job(pipe, req->id)) {
> +		mtk_dip_pipe_remove_job(req);
> +		mtk_dip_pipe_job_finish(req, vbf_state);
> +		mtk_dip_hw_working_buf_free(dip_dev, req->working_buf);
> +		req->working_buf = NULL;
> +		wake_up(&dip_dev->flushing_waitq);
> +	}
> +}
> +
> +static void mdp_cb_timeout_worker(struct work_struct *work)
> +{
> +	struct mtk_dip_request *req = mtk_dip_hw_mdpcb_work_to_req(work);
> +	struct img_ipi_param ipi_param;
> +
> +	ipi_param.usage = IMG_IPI_DEBUG;
> +	scp_ipi_send(req->dip_pipe->dip_dev->scp_pdev, SCP_IPI_DIP,
> +		     &ipi_param, sizeof(ipi_param), 0);
> +	mtk_dip_notify(req);
> +}
> +
> +/* Maybe in IRQ context of cmdq */
> +static void dip_mdp_cb_func(struct cmdq_cb_data data)
> +{
> +	struct mtk_dip_request *req;
> +	struct mtk_dip_dev *dip_dev;
> +
> +	if (!data.data) {
> +		pr_err("%s: data->data is NULL\n",
> +		       __func__);
> +		return;
> +	}
> +
> +	req = data.data;
> +	dip_dev = req->dip_pipe->dip_dev;
> +
> +	dev_dbg(dip_dev->dev, "%s: req(%p), idx(%d), no(%d), s(%d), n_in(%d), n_out(%d)\n",
> +		__func__, req, req->img_fparam.frameparam.index,
> +		req->img_fparam.frameparam.frame_no,
> +		req->img_fparam.frameparam.state,
> +		req->img_fparam.frameparam.num_inputs,
> +		req->img_fparam.frameparam.num_outputs);
> +
> +	if (data.sta != CMDQ_CB_NORMAL) {
> +		dev_err(dip_dev->dev, "%s: frame no(%d) HW timeout\n",
> +			__func__, req->img_fparam.frameparam.frame_no);
> +		req->img_fparam.frameparam.state = FRAME_STATE_HW_TIMEOUT;
> +		INIT_WORK(&req->mdpcb_work, mdp_cb_timeout_worker);
> +		queue_work(req->dip_pipe->dip_dev->mdpcb_wq,
> +			   &req->mdpcb_work);
> +	} else {
> +		mtk_dip_notify(req);
> +	}
> +}
> +
> +static void dip_runner_func(struct work_struct *work)
> +{
> +	struct mtk_dip_request *req = mtk_dip_hw_mdp_work_to_req(work);
> +	struct mtk_dip_dev *dip_dev = req->dip_pipe->dip_dev;
> +	struct img_config *config_data =
> +		(struct img_config *)req->working_buf->config_data.vaddr;
> +
> +	/*
> +	 * Call MDP/GCE API to do HW excecution
> +	 * Pass the framejob to MDP driver
> +	 */
> +	pm_runtime_get_sync(dip_dev->dev);
> +	mdp_cmdq_sendtask(dip_dev->mdp_pdev, config_data,
> +			  &req->img_fparam.frameparam, NULL, false,
> +			  dip_mdp_cb_func, req);
> +}
> +
> +static void dip_scp_handler(void *data, unsigned int len, void *priv)
> +{
> +	int job_id;
> +	struct mtk_dip_pipe *pipe;
> +	int pipe_id;
> +	struct mtk_dip_request *req;
> +	struct img_ipi_frameparam *frameparam;
> +	struct mtk_dip_dev *dip_dev = (struct mtk_dip_dev *)priv;
> +	struct img_ipi_param *ipi_param;
> +	u32 num;
> +
> +	if (WARN_ONCE(!data, "%s: failed due to NULL data\n", __func__))
> +		return;
> +
> +	if (WARN_ONCE(len == sizeof(ipi_param),
> +		      "%s: len(%d) not match ipi_param\n", __func__))
> +		return;
> +
> +	ipi_param = (struct img_ipi_param *)data;
> +	if (ipi_param->usage == IMG_IPI_INIT)
> +		return;
> +
> +	if (ipi_param->usage != IMG_IPI_FRAME) {
> +		dev_warn(dip_dev->dev,
> +			 "%s: recevied unknown ipi_param, usage(%d)\n",
> +			 __func__, ipi_param->usage);
> +		return;
> +	}
> +
> +	job_id = ipi_param->frm_param.handle;
> +	pipe_id = mtk_dip_pipe_get_pipe_from_job_id(job_id);
> +	pipe = mtk_dip_dev_get_pipe(dip_dev, pipe_id);
> +	if (!pipe) {
> +		dev_warn(dip_dev->dev,
> +			 "%s: get invalid img_ipi_frameparam index(%d) from firmware\n",
> +			 __func__, job_id);
> +		return;
> +	}
> +
> +	req = mtk_dip_pipe_get_running_job(pipe, job_id);
> +	if (WARN_ONCE(!req, "%s: frame_no(%d) is lost\n", __func__, job_id))
> +		return;
> +
> +	frameparam = req->working_buf->frameparam.vaddr;
> +	req->img_fparam.frameparam = *frameparam;
> +	num = atomic_dec_return(&dip_dev->num_composing);
> +	up(&dip_dev->sem);
> +
> +	dev_dbg(dip_dev->dev,
> +		"%s: frame_no(%d) is back, index(%d), composing num(%d)\n",
> +		__func__, frameparam->frame_no, frameparam->index, num);
> +
> +	INIT_WORK(&req->mdp_work, dip_runner_func);
> +	queue_work(dip_dev->mdp_wq, &req->mdp_work);
> +}
> +
> +static void dip_composer_workfunc(struct work_struct *work)
> +{
> +	struct mtk_dip_request *req = mtk_dip_hw_fw_work_to_req(work);
> +	struct mtk_dip_dev *dip_dev = req->dip_pipe->dip_dev;
> +	struct img_ipi_param ipi_param;
> +	struct mtk_dip_hw_subframe *buf;
> +	int ret;
> +
> +	down(&dip_dev->sem);
> +
> +	buf = mtk_dip_hw_working_buf_alloc(req->dip_pipe->dip_dev);
> +	if (!buf) {
> +		dev_err(req->dip_pipe->dip_dev->dev,
> +			"%s:%s:req(%p): no free working buffer available\n",
> +			__func__, req->dip_pipe->desc->name, req);
> +	}
> +
> +	req->working_buf = buf;
> +	mtk_dip_wbuf_to_ipi_img_addr(&req->img_fparam.frameparam.subfrm_data,
> +				     &buf->buffer);
> +	memset(buf->buffer.vaddr, 0, DIP_SUB_FRM_SZ);
> +	mtk_dip_wbuf_to_ipi_img_sw_addr(&req->img_fparam.frameparam.config_data,
> +					&buf->config_data);
> +	memset(buf->config_data.vaddr, 0, DIP_COMP_SZ);
> +
> +	if (!req->img_fparam.frameparam.tuning_data.present) {
> +		/*
> +		 * When user enqueued without tuning buffer,
> +		 * it would use driver internal buffer.
> +		 */
> +		dev_dbg(dip_dev->dev,
> +			"%s: frame_no(%d) has no tuning_data\n",
> +			__func__, req->img_fparam.frameparam.frame_no);
> +
> +		mtk_dip_wbuf_to_ipi_tuning_addr
> +				(&req->img_fparam.frameparam.tuning_data,
> +				 &buf->tuning_buf);
> +		memset(buf->tuning_buf.vaddr, 0, DIP_TUNING_SZ);
> +	}
> +
> +	mtk_dip_wbuf_to_ipi_img_sw_addr(&req->img_fparam.frameparam.self_data,
> +					&buf->frameparam);
> +	memcpy(buf->frameparam.vaddr, &req->img_fparam.frameparam,
> +	       sizeof(req->img_fparam.frameparam));
> +	ipi_param.usage = IMG_IPI_FRAME;
> +	ipi_param.frm_param.handle = req->id;
> +	ipi_param.frm_param.scp_addr = (u32)buf->frameparam.scp_daddr;
> +
> +	mutex_lock(&dip_dev->hw_op_lock);
> +	atomic_inc(&dip_dev->num_composing);
> +	ret = scp_ipi_send(dip_dev->scp_pdev, SCP_IPI_DIP, &ipi_param,
> +			   sizeof(ipi_param), 0);
> +	if (ret) {
> +		dev_err(dip_dev->dev,
> +			"%s: frame_no(%d) send SCP_IPI_DIP_FRAME failed %d\n",
> +			__func__, req->img_fparam.frameparam.frame_no, ret);
> +		mtk_dip_pipe_remove_job(req);
> +		mtk_dip_pipe_job_finish(req, VB2_BUF_STATE_ERROR);
> +		mtk_dip_hw_working_buf_free(dip_dev, req->working_buf);
> +		req->working_buf = NULL;
> +		wake_up(&dip_dev->flushing_waitq);
> +	}
> +	mutex_unlock(&dip_dev->hw_op_lock);
> +
> +	dev_dbg(dip_dev->dev,
> +		"%s: frame_no(%d),idx(0x%x), composing num(%d)\n",
> +		__func__, req->img_fparam.frameparam.frame_no,
> +		req->img_fparam.frameparam.index,
> +		atomic_read(&dip_dev->num_composing));
> +}
> +
> +static int mtk_dip_hw_flush_pipe_jobs(struct mtk_dip_pipe *pipe)
> +{
> +	struct mtk_dip_request *req;
> +	struct list_head job_list = LIST_HEAD_INIT(job_list);
> +	int num;
> +	int ret;
> +
> +	spin_lock(&pipe->job_lock);
> +	list_splice_init(&pipe->pipe_job_running_list, &job_list);
> +	pipe->num_jobs = 0;
> +	spin_unlock(&pipe->job_lock);
> +
> +	ret = wait_event_freezable_timeout
> +		(pipe->dip_dev->flushing_waitq,
> +		 !(num = atomic_read(&pipe->dip_dev->num_composing)),
> +		 msecs_to_jiffies(1000 / 30 * DIP_COMPOSING_MAX_NUM * 3));
> +	if (!ret && num) {
> +		dev_err(pipe->dip_dev->dev,
> +			"%s: flushing is aborted, num(%d)\n",
> +			__func__, num);
> +		return -EINVAL;
> +	}
> +
> +	list_for_each_entry(req, &job_list, list)
> +		mtk_dip_pipe_job_finish(req, VB2_BUF_STATE_ERROR);
> +
> +	return 0;
> +}
> +
> +static int mtk_dip_hw_connect(struct mtk_dip_dev *dip_dev)
> +{
> +	int ret;
> +	struct img_ipi_param ipi_param;
> +
> +	pm_runtime_get_sync(dip_dev->dev);
> +	scp_ipi_register(dip_dev->scp_pdev, SCP_IPI_DIP, dip_scp_handler,
> +			 dip_dev);
> +	memset(&ipi_param, 0, sizeof(ipi_param));
> +	ipi_param.usage = IMG_IPI_INIT;
> +
> +	ret = scp_ipi_send(dip_dev->scp_pdev, SCP_IPI_DIP, &ipi_param,
> +			   sizeof(ipi_param), 200);
> +	if (ret) {
> +		dev_err(dip_dev->dev, "%s: send SCP_IPI_DIP_FRAME failed %d\n",
> +			__func__, ret);
> +		return -EBUSY;
> +	}
> +	pm_runtime_mark_last_busy(dip_dev->dev);
> +	pm_runtime_put_autosuspend(dip_dev->dev);
> +
> +	return 0;
> +}
> +
> +static void mtk_dip_hw_disconnect(struct mtk_dip_dev *dip_dev)
> +{
> +	struct img_ipi_param ipi_param;
> +	int ret;
> +
> +	ipi_param.usage = IMG_IPI_DEINIT;
> +	ret = scp_ipi_send(dip_dev->scp_pdev, SCP_IPI_DIP, &ipi_param,
> +			   sizeof(ipi_param), 0);
> +	if (ret) {
> +		dev_err(dip_dev->dev,
> +			"%s: SCP IMG_IPI_DEINIT failed(%d)\n", __func__, ret);
> +	}
> +
> +	scp_ipi_unregister(dip_dev->scp_pdev, SCP_IPI_DIP);
> +}
> +
> +int mtk_dip_hw_streamon(struct mtk_dip_pipe *pipe)
> +{
> +	struct mtk_dip_dev *dip_dev = pipe->dip_dev;
> +	int ret;
> +
> +	mutex_lock(&dip_dev->hw_op_lock);
> +	if (!dip_dev->dip_stream_cnt) {
> +		ret = mtk_dip_hw_connect(pipe->dip_dev);
> +		if (ret) {
> +			dev_err(pipe->dip_dev->dev,
> +				"%s:%s: pipe(%d) connect to dip_hw failed\n",
> +				__func__, pipe->desc->name, pipe->desc->id);
> +
> +			mutex_unlock(&dip_dev->hw_op_lock);
> +
> +			return ret;
> +		}
> +	}
> +	dip_dev->dip_stream_cnt++;
> +	mutex_unlock(&dip_dev->hw_op_lock);
> +
> +	pipe->streaming = 1;
> +	mtk_dip_pipe_try_enqueue(pipe);
> +
> +	return 0;
> +}
> +
> +int mtk_dip_hw_streamoff(struct mtk_dip_pipe *pipe)
> +{
> +	struct mtk_dip_dev *dip_dev = pipe->dip_dev;
> +	int ret;
> +
> +	pipe->streaming = 0;
> +
> +	ret = mtk_dip_hw_flush_pipe_jobs(pipe);
> +	if (WARN_ON(ret != 0)) {
> +		dev_err(dip_dev->dev,
> +			"%s:%s: mtk_dip_hw_flush_pipe_jobs, ret(%d)\n",
> +			__func__, pipe->desc->name, ret);
> +	}
> +
> +	/* Stop the hardware if there is no streaming pipe */
> +	mutex_lock(&dip_dev->hw_op_lock);
> +	dip_dev->dip_stream_cnt--;
> +	if (!dip_dev->dip_stream_cnt)
> +		mtk_dip_hw_disconnect(dip_dev);
> +
> +	mutex_unlock(&dip_dev->hw_op_lock);
> +
> +	return 0;
> +}
> +
> +void mtk_dip_hw_enqueue(struct mtk_dip_dev *dip_dev,
> +			struct mtk_dip_request *req)
> +{
> +	struct img_ipi_frameparam *frameparams = &req->img_fparam.frameparam;
> +
> +	mtk_dip_pipe_ipi_params_config(req);
> +	frameparams->state = FRAME_STATE_INIT;
> +	frameparams->frame_no = atomic_inc_return(&dip_dev->dip_enqueue_cnt);
> +
> +	dev_dbg(dip_dev->dev,
> +		"%s: hw job id(%d), frame_no(%d) into worklist\n",
> +		__func__, frameparams->index, frameparams->frame_no);
> +
> +	INIT_WORK(&req->fw_work, dip_composer_workfunc);
> +	queue_work(dip_dev->composer_wq, &req->fw_work);
> +}
> diff --git a/drivers/media/platform/mtk-isp/isp_50/dip/mtk_dip-v4l2.c b/drivers/media/platform/mtk-isp/isp_50/dip/mtk_dip-v4l2.c
> new file mode 100644
> index 000000000000..57a016438960
> --- /dev/null
> +++ b/drivers/media/platform/mtk-isp/isp_50/dip/mtk_dip-v4l2.c
> @@ -0,0 +1,2255 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2018 MediaTek Inc.
> + *
> + * Author: Frederic Chen <frederic.chen@mediatek.com>
> + *
> + */
> +
> +#include <linux/platform_device.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/remoteproc.h>
> +#include <linux/remoteproc/mtk_scp.h>
> +#include <linux/videodev2.h>
> +#include <media/videobuf2-dma-contig.h>
> +#include <media/v4l2-ioctl.h>
> +#include <media/v4l2-subdev.h>
> +#include <media/v4l2-event.h>
> +#include "mtk_dip-dev.h"
> +#include "mtk_dip-hw.h"
> +#include "mtk-mdp3-cmdq.h"
> +
> +static int mtk_dip_subdev_open(struct v4l2_subdev *sd,
> +			       struct v4l2_subdev_fh *fh)
> +{
> +	int i;
> +	struct mtk_dip_pipe *pipe = mtk_dip_subdev_to_pipe(sd);
> +
> +	for (i = 0; i < pipe->desc->total_queues; i++) {
> +		*v4l2_subdev_get_try_format(&pipe->subdev, fh->pad, i) =
> +			pipe->nodes[i].pad_fmt;
> +		*v4l2_subdev_get_try_crop(&pipe->subdev, fh->pad, i) =
> +			pipe->nodes[i].crop;
> +	}
> +
> +	return 0;
> +}
> +
> +static int mtk_dip_subdev_s_stream(struct v4l2_subdev *sd,
> +				   int enable)
> +{
> +	struct mtk_dip_pipe *pipe = mtk_dip_subdev_to_pipe(sd);
> +	int ret;
> +
> +	if (enable) {
> +		ret = mtk_dip_hw_streamon(pipe);
> +		if (ret)
> +			dev_err(pipe->dip_dev->dev,
> +				"%s:%s: pipe(%d) streamon failed\n",
> +				__func__, pipe->desc->name, pipe->desc->id);
> +	} else {
> +		ret = mtk_dip_hw_streamoff(pipe);
> +		if (ret)
> +			dev_err(pipe->dip_dev->dev,
> +				"%s:%s: pipe(%d) streamon off with errors\n",
> +				__func__, pipe->desc->name, pipe->desc->id);
> +	}
> +
> +	return ret;
> +}
> +
> +static int mtk_dip_subdev_get_fmt(struct v4l2_subdev *sd,
> +				  struct v4l2_subdev_pad_config *cfg,
> +				  struct v4l2_subdev_format *fmt)
> +{
> +	struct mtk_dip_pipe *dip_pipe = mtk_dip_subdev_to_pipe(sd);
> +	struct v4l2_mbus_framefmt *mf;
> +	u32 pad = fmt->pad;
> +
> +	if (pad == MTK_DIP_VIDEO_NODE_ID_TUNING_OUT)
> +		return -EINVAL;
> +
> +	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
> +		fmt->format = dip_pipe->nodes[pad].pad_fmt;
> +	} else {
> +		mf = v4l2_subdev_get_try_format(sd, cfg, pad);
> +		fmt->format = *mf;
> +	}
> +
> +	return 0;
> +}
> +
> +static int mtk_dip_subdev_set_fmt(struct v4l2_subdev *sd,
> +				  struct v4l2_subdev_pad_config *cfg,
> +				  struct v4l2_subdev_format *fmt)
> +{
> +	struct mtk_dip_pipe *dip_pipe = mtk_dip_subdev_to_pipe(sd);
> +	struct v4l2_mbus_framefmt *mf;
> +	u32 pad = fmt->pad;
> +	struct mtk_dip_video_device *node = &dip_pipe->nodes[pad];
> +
> +	if (pad == MTK_DIP_VIDEO_NODE_ID_TUNING_OUT)
> +		return -EINVAL;
> +
> +	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY)
> +		mf = v4l2_subdev_get_try_format(sd, cfg, pad);
> +	else
> +		mf = &dip_pipe->nodes[pad].pad_fmt;
> +
> +	fmt->format.code = mf->code;
> +	fmt->format.width =
> +		clamp_val(fmt->format.width,
> +			  node->desc->frmsizeenum->stepwise.min_width,
> +			  node->desc->frmsizeenum->stepwise.max_width);
> +	fmt->format.height =
> +		clamp_val(fmt->format.height,
> +			  node->desc->frmsizeenum->stepwise.min_height,
> +			  node->desc->frmsizeenum->stepwise.max_height);
> +
> +	*mf = fmt->format;
> +
> +	return 0;
> +}
> +
> +static int mtk_dip_subdev_get_selection(struct v4l2_subdev *sd,
> +					struct v4l2_subdev_pad_config *cfg,
> +					struct v4l2_subdev_selection *sel)
> +{
> +	struct v4l2_rect *try_sel, *r;
> +	struct mtk_dip_pipe *dip_pipe = mtk_dip_subdev_to_pipe(sd);
> +
> +	if (sel->pad != MTK_DIP_VIDEO_NODE_ID_MDP0_CAPTURE &&
> +	    sel->pad != MTK_DIP_VIDEO_NODE_ID_MDP1_CAPTURE) {
> +		dev_dbg(dip_pipe->dip_dev->dev,
> +			"g_select failed(%s:%d):not support\n",
> +			dip_pipe->nodes[sel->pad].desc->name, sel->pad);
> +		return -EINVAL;
> +	}
> +
> +	switch (sel->target) {
> +	case V4L2_SEL_TGT_CROP:
> +		try_sel = v4l2_subdev_get_try_crop(sd, cfg, sel->pad);
> +		r = &dip_pipe->nodes[sel->pad].crop;  /* effective resolution */
> +		break;
> +	default:
> +		dev_dbg(dip_pipe->dip_dev->dev,
> +			"s_select failed(%s:%d):target(%d) not support\n",
> +			dip_pipe->nodes[sel->pad].desc->name, sel->pad,
> +			sel->target);
> +		return -EINVAL;
> +	}
> +
> +	if (sel->which == V4L2_SUBDEV_FORMAT_TRY)
> +		sel->r = *try_sel;
> +	else
> +		sel->r = *r;
> +
> +	return 0;
> +}
> +
> +static int mtk_dip_subdev_set_selection(struct v4l2_subdev *sd,
> +					struct v4l2_subdev_pad_config *cfg,
> +					struct v4l2_subdev_selection *sel)
> +{
> +	struct v4l2_rect *rect, *try_sel;
> +	struct mtk_dip_pipe *dip_pipe = mtk_dip_subdev_to_pipe(sd);
> +
> +	if (sel->pad != MTK_DIP_VIDEO_NODE_ID_MDP0_CAPTURE &&
> +	    sel->pad != MTK_DIP_VIDEO_NODE_ID_MDP1_CAPTURE) {
> +		dev_dbg(dip_pipe->dip_dev->dev,
> +			"g_select failed(%s:%d):not support\n",
> +			dip_pipe->nodes[sel->pad].desc->name, sel->pad);
> +		return -EINVAL;
> +	}
> +
> +	switch (sel->target) {
> +	case V4L2_SEL_TGT_CROP:
> +		try_sel = v4l2_subdev_get_try_crop(sd, cfg, sel->pad);
> +		rect = &dip_pipe->nodes[sel->pad].crop;
> +		break;
> +	default:
> +		dev_dbg(dip_pipe->dip_dev->dev,
> +			"s_select failed(%s:%d):target(%d) not support\n",
> +			dip_pipe->nodes[sel->pad].desc->name, sel->pad,
> +			sel->target);
> +		return -EINVAL;
> +	}
> +
> +	if (sel->which == V4L2_SUBDEV_FORMAT_TRY)
> +		*try_sel = sel->r;
> +	else
> +		*rect = sel->r;
> +
> +	return 0;
> +}
> +
> +static int mtk_dip_link_setup(struct media_entity *entity,
> +			      const struct media_pad *local,
> +			      const struct media_pad *remote,
> +			      u32 flags)
> +{
> +	struct mtk_dip_pipe *pipe =
> +		container_of(entity, struct mtk_dip_pipe, subdev.entity);
> +	u32 pad = local->index;
> +
> +	WARN_ON(entity->obj_type != MEDIA_ENTITY_TYPE_V4L2_SUBDEV);
> +	WARN_ON(pad >= pipe->desc->total_queues);
> +
> +	mutex_lock(&pipe->lock);
> +
> +	if (flags & MEDIA_LNK_FL_ENABLED)
> +		pipe->nodes_enabled |= 1 << pad;
> +	else
> +		pipe->nodes_enabled &= ~(1 << pad);
> +
> +	pipe->nodes[pad].flags &= ~MEDIA_LNK_FL_ENABLED;
> +	pipe->nodes[pad].flags |= flags & MEDIA_LNK_FL_ENABLED;
> +
> +	mutex_unlock(&pipe->lock);
> +
> +	return 0;
> +}
> +
> +static int mtk_dip_vb2_meta_buf_prepare(struct vb2_buffer *vb)
> +{
> +	struct mtk_dip_pipe *pipe = vb2_get_drv_priv(vb->vb2_queue);
> +	struct mtk_dip_video_device *node = mtk_dip_vbq_to_node(vb->vb2_queue);
> +	struct device *dev = pipe->dip_dev->dev;
> +	const struct v4l2_format *fmt = &node->vdev_fmt;
> +
> +	if (vb->planes[0].length < fmt->fmt.meta.buffersize) {
> +		dev_dbg(dev,
> +			"%s:%s:%s: size error(user:%d, required:%d)\n",
> +			__func__, pipe->desc->name, node->desc->name,
> +			vb->planes[0].length, fmt->fmt.meta.buffersize);
> +		return -EINVAL;
> +	}
> +
> +	if (vb->planes[0].bytesused != fmt->fmt.meta.buffersize) {
> +		dev_err(dev,
> +			"%s:%s:%s: bytesused(%d) must be %d\n",
> +			__func__, pipe->desc->name, node->desc->name,
> +			vb->planes[0].bytesused,
> +			fmt->fmt.meta.buffersize);
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static int mtk_dip_vb2_video_buf_prepare(struct vb2_buffer *vb)
> +{
> +	struct mtk_dip_pipe *pipe = vb2_get_drv_priv(vb->vb2_queue);
> +	struct mtk_dip_video_device *node = mtk_dip_vbq_to_node(vb->vb2_queue);
> +	struct device *dev = pipe->dip_dev->dev;
> +	const struct v4l2_format *fmt = &node->vdev_fmt;
> +	unsigned int size;
> +	int i;
> +
> +	for (i = 0; i < vb->num_planes; i++) {
> +		size = fmt->fmt.pix_mp.plane_fmt[i].sizeimage;
> +		if (vb->planes[i].length < size) {
> +			dev_dbg(dev,
> +				"%s:%s:%s: size error(user:%d, max:%d)\n",
> +				__func__, pipe->desc->name, node->desc->name,
> +				vb->planes[i].length, size);
> +			return -EINVAL;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static int mtk_dip_vb2_buf_out_validate(struct vb2_buffer *vb)
> +{
> +	struct vb2_v4l2_buffer *v4l2_buf = to_vb2_v4l2_buffer(vb);
> +
> +	if (v4l2_buf->field == V4L2_FIELD_ANY)
> +		v4l2_buf->field = V4L2_FIELD_NONE;
> +
> +	if (v4l2_buf->field != V4L2_FIELD_NONE)
> +		return -EINVAL;
> +
> +	return 0;
> +}
> +
> +static int mtk_dip_vb2_meta_buf_init(struct vb2_buffer *vb)
> +{
> +	struct mtk_dip_dev_buffer *dev_buf = mtk_dip_vb2_buf_to_dev_buf(vb);
> +	struct mtk_dip_pipe *pipe = vb2_get_drv_priv(vb->vb2_queue);
> +	struct mtk_dip_video_device *node = mtk_dip_vbq_to_node(vb->vb2_queue);
> +	phys_addr_t buf_paddr;
> +
> +	dev_buf->scp_daddr[0] = vb2_dma_contig_plane_dma_addr(vb, 0);
> +	buf_paddr = dev_buf->scp_daddr[0];
> +	dev_buf->isp_daddr[0] =	dma_map_resource(pipe->dip_dev->dev,
> +						 buf_paddr,
> +						 vb->planes[0].length,
> +						 DMA_BIDIRECTIONAL,
> +						 DMA_ATTR_SKIP_CPU_SYNC);
> +	if (dma_mapping_error(pipe->dip_dev->dev,
> +			      dev_buf->isp_daddr[0])) {
> +		dev_err(pipe->dip_dev->dev,
> +			"%s:%s: failed to map buffer: s_daddr(%pad)\n",
> +			pipe->desc->name, node->desc->name,
> +			&dev_buf->scp_daddr[0]);
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static int mtk_dip_vb2_video_buf_init(struct vb2_buffer *vb)
> +{
> +	struct mtk_dip_dev_buffer *dev_buf = mtk_dip_vb2_buf_to_dev_buf(vb);
> +	int i;
> +
> +	for (i = 0; i < vb->num_planes; i++) {
> +		dev_buf->scp_daddr[i] = 0;
> +		dev_buf->isp_daddr[i] =	vb2_dma_contig_plane_dma_addr(vb, i);
> +	}
> +
> +	return 0;
> +}
> +
> +static void mtk_dip_vb2_queue_meta_buf_cleanup(struct vb2_buffer *vb)
> +{
> +	struct mtk_dip_dev_buffer *dev_buf = mtk_dip_vb2_buf_to_dev_buf(vb);
> +	struct mtk_dip_pipe *pipe = vb2_get_drv_priv(vb->vb2_queue);
> +
> +	dma_unmap_resource(pipe->dip_dev->dev, dev_buf->isp_daddr[0],
> +			   vb->planes[0].length, DMA_BIDIRECTIONAL,
> +			   DMA_ATTR_SKIP_CPU_SYNC);
> +}
> +
> +static void mtk_dip_vb2_buf_queue(struct vb2_buffer *vb)
> +{
> +	struct mtk_dip_dev_buffer *dev_buf = mtk_dip_vb2_buf_to_dev_buf(vb);
> +	struct mtk_dip_request *req = mtk_dip_media_req_to_dip_req(vb->request);
> +	struct mtk_dip_video_device *node =
> +		mtk_dip_vbq_to_node(vb->vb2_queue);
> +	struct mtk_dip_dev *dip_dev = dip_dev;
> +	int buf_count;
> +
> +	dev_buf->fmt = node->vdev_fmt;
> +	dev_buf->dev_fmt = node->dev_q.dev_fmt;
> +	dev_buf->dma_port = node->desc->dma_port;
> +	dev_buf->rotation = node->rotation;
> +	dev_buf->crop.c = node->crop;
> +	dev_buf->compose = node->compose;
> +
> +	spin_lock(&node->buf_list_lock);
> +	list_add_tail(&dev_buf->list, &node->buf_list);
> +	spin_unlock(&node->buf_list_lock);
> +
> +	buf_count = atomic_dec_return(&req->buf_count);
> +	if (!buf_count) {
> +		mutex_lock(&req->dip_pipe->lock);
> +		mtk_dip_pipe_try_enqueue(req->dip_pipe);
> +		mutex_unlock(&req->dip_pipe->lock);
> +	}
> +}
> +
> +static int mtk_dip_vb2_meta_queue_setup(struct vb2_queue *vq,
> +					unsigned int *num_buffers,
> +					unsigned int *num_planes,
> +					unsigned int sizes[],
> +					struct device *alloc_devs[])
> +{
> +	struct mtk_dip_video_device *node = mtk_dip_vbq_to_node(vq);
> +	const struct v4l2_format *fmt = &node->vdev_fmt;
> +	unsigned int size;
> +
> +	if (!*num_planes)
> +		*num_planes = 1;
> +
> +	if (sizes[0] <= 0)
> +		size = fmt->fmt.meta.buffersize;
> +
> +	*num_buffers = clamp_val(*num_buffers, 1, VB2_MAX_FRAME);
> +
> +	return 0;
> +}
> +
> +static int mtk_dip_vb2_video_queue_setup(struct vb2_queue *vq,
> +					 unsigned int *num_buffers,
> +					 unsigned int *num_planes,
> +					 unsigned int sizes[],
> +					 struct device *alloc_devs[])
> +{
> +	struct mtk_dip_pipe *pipe = vb2_get_drv_priv(vq);
> +	struct mtk_dip_video_device *node = mtk_dip_vbq_to_node(vq);
> +	const struct v4l2_format *fmt = &node->vdev_fmt;
> +	int i;
> +
> +	if (!*num_planes)
> +		*num_planes = 1;
> +
> +	for (i = 0; i < *num_planes; i++) {
> +		if (sizes[i] <= 0) {
> +			dev_dbg(pipe->dip_dev->dev,
> +				"%s:%s:%s: invalid buf: %u < %u\n",
> +				__func__, pipe->desc->name,
> +				node->desc->name, sizes[i],
> +				fmt->fmt.pix_mp.plane_fmt[i].sizeimage);
> +			sizes[i] = fmt->fmt.pix_mp.plane_fmt[i].sizeimage;
> +		}
> +
> +		*num_buffers = clamp_val(*num_buffers, 1, VB2_MAX_FRAME);
> +	}
> +
> +	return 0;
> +}
> +
> +static void mtk_dip_return_all_buffers(struct mtk_dip_pipe *pipe,
> +				       struct mtk_dip_video_device *node,
> +				       enum vb2_buffer_state state)
> +{
> +	struct mtk_dip_dev_buffer *b, *b0;
> +
> +	spin_lock(&node->buf_list_lock);
> +	list_for_each_entry_safe(b, b0, &node->buf_list, list) {
> +		list_del(&b->list);
> +		vb2_buffer_done(&b->vbb.vb2_buf, state);
> +	}
> +	spin_unlock(&node->buf_list_lock);
> +}
> +
> +static int mtk_dip_vb2_start_streaming(struct vb2_queue *vq, unsigned int count)
> +{
> +	struct mtk_dip_pipe *pipe = vb2_get_drv_priv(vq);
> +	struct mtk_dip_video_device *node = mtk_dip_vbq_to_node(vq);
> +	int ret;
> +
> +	mutex_lock(&pipe->lock);
> +	if (!pipe->nodes_streaming) {
> +		ret = media_pipeline_start(&node->vdev.entity, &pipe->pipeline);
> +		if (ret < 0) {
> +			dev_err(pipe->dip_dev->dev,
> +				"%s:%s: media_pipeline_start failed(%d)\n",
> +				pipe->desc->name, node->desc->name, ret);
> +			goto fail_return_bufs;
> +		}
> +	}
> +
> +	if (!(node->flags & MEDIA_LNK_FL_ENABLED)) {
> +		dev_err(pipe->dip_dev->dev,
> +			"%s:%s: stream on failed, node is not enabled\n",
> +			pipe->desc->name, node->desc->name);
> +
> +		ret = -ENOLINK;
> +		goto fail_stop_pipeline;
> +	}
> +
> +	pipe->nodes_streaming |= 1 << node->desc->id;
> +	if (pipe->nodes_streaming == pipe->nodes_enabled) {
> +		/* Start streaming of the whole pipeline */
> +		ret = v4l2_subdev_call(&pipe->subdev, video, s_stream, 1);
> +		if (ret < 0) {
> +			dev_err(pipe->dip_dev->dev,
> +				"%s:%s: sub dev s_stream(1) failed(%d)\n",
> +				pipe->desc->name, node->desc->name, ret);
> +
> +			goto fail_stop_pipeline;
> +		}
> +	}
> +
> +	mutex_unlock(&pipe->lock);
> +
> +	return 0;
> +
> +fail_stop_pipeline:
> +	media_pipeline_stop(&node->vdev.entity);
> +
> +fail_return_bufs:
> +	mtk_dip_return_all_buffers(pipe, node, VB2_BUF_STATE_QUEUED);
> +	mutex_unlock(&pipe->lock);
> +
> +	return ret;
> +}
> +
> +static void mtk_dip_vb2_stop_streaming(struct vb2_queue *vq)
> +{
> +	struct mtk_dip_pipe *pipe = vb2_get_drv_priv(vq);
> +	struct mtk_dip_video_device *node = mtk_dip_vbq_to_node(vq);
> +	int ret;
> +
> +	mutex_lock(&pipe->lock);
> +
> +	if (pipe->streaming) {
> +		ret = v4l2_subdev_call(&pipe->subdev, video, s_stream, 0);
> +		if (ret)
> +			dev_err(pipe->dip_dev->dev,
> +				"%s:%s: sub dev s_stream(0) failed(%d)\n",
> +				pipe->desc->name, node->desc->name, ret);
> +	}
> +
> +	pipe->nodes_streaming &= ~(1 << node->desc->id);
> +	if (!pipe->nodes_streaming)
> +		media_pipeline_stop(&node->vdev.entity);
> +
> +	mtk_dip_return_all_buffers(pipe, node, VB2_BUF_STATE_ERROR);
> +
> +	mutex_unlock(&pipe->lock);
> +}
> +
> +static void mtk_dip_vb2_request_complete(struct vb2_buffer *vb)
> +{
> +	struct mtk_dip_video_device *node = mtk_dip_vbq_to_node(vb->vb2_queue);
> +
> +	v4l2_ctrl_request_complete(vb->req_obj.req,
> +				   &node->ctrl_handler);
> +}
> +
> +static int mtk_dip_videoc_querycap(struct file *file, void *fh,
> +				   struct v4l2_capability *cap)
> +{
> +	struct mtk_dip_pipe *pipe = video_drvdata(file);
> +
> +	snprintf(cap->driver, sizeof(cap->driver), "%s %s",
> +		 dev_driver_string(pipe->dip_dev->dev), pipe->desc->name);
> +	snprintf(cap->card, sizeof(cap->card), "%s %s",
> +		 dev_driver_string(pipe->dip_dev->dev), pipe->desc->name);
> +	snprintf(cap->bus_info, sizeof(cap->bus_info),
> +		 "platform:%s", dev_name(pipe->dip_dev->mdev.dev));
> +
> +	return 0;
> +}
> +
> +static int mtk_dip_videoc_try_fmt(struct file *file, void *fh,
> +				  struct v4l2_format *f)
> +{
> +	struct mtk_dip_pipe *pipe = video_drvdata(file);
> +	struct mtk_dip_video_device *node = mtk_dip_file_to_node(file);
> +	const struct mtk_dip_dev_format *dev_fmt;
> +	struct v4l2_format try_fmt;
> +
> +	memset(&try_fmt, 0, sizeof(try_fmt));
> +
> +	dev_fmt = mtk_dip_pipe_find_fmt(pipe, node,
> +					f->fmt.pix_mp.pixelformat);
> +	if (!dev_fmt) {
> +		dev_fmt = &node->desc->fmts[node->desc->default_fmt_idx];
> +		dev_dbg(pipe->dip_dev->dev,
> +			"%s:%s:%s: dev_fmt(%d) not found, use default(%d)\n",
> +			__func__, pipe->desc->name, node->desc->name,
> +			f->fmt.pix_mp.pixelformat, dev_fmt->format);
> +	}
> +
> +	mtk_dip_pipe_try_fmt(pipe, node, &try_fmt, f, dev_fmt);
> +	*f = try_fmt;
> +
> +	return 0;
> +}
> +
> +static int mtk_dip_videoc_g_fmt(struct file *file, void *fh,
> +				struct v4l2_format *f)
> +{
> +	struct mtk_dip_video_device *node = mtk_dip_file_to_node(file);
> +
> +	*f = node->vdev_fmt;
> +
> +	return 0;
> +}
> +
> +static int mtk_dip_videoc_s_fmt(struct file *file, void *fh,
> +				struct v4l2_format *f)
> +{
> +	struct mtk_dip_video_device *node = mtk_dip_file_to_node(file);
> +	struct mtk_dip_pipe *pipe = video_drvdata(file);
> +	const struct mtk_dip_dev_format *dev_fmt;
> +
> +	if (pipe->streaming || vb2_is_busy(&node->dev_q.vbq))
> +		return -EBUSY;
> +
> +	dev_fmt = mtk_dip_pipe_find_fmt(pipe, node,
> +					f->fmt.pix_mp.pixelformat);
> +	if (!dev_fmt) {
> +		dev_fmt = &node->desc->fmts[node->desc->default_fmt_idx];
> +		dev_dbg(pipe->dip_dev->dev,
> +			"%s:%s:%s: dev_fmt(%d) not found, use default(%d)\n",
> +			__func__, pipe->desc->name, node->desc->name,
> +			f->fmt.pix_mp.pixelformat, dev_fmt->format);
> +	}
> +
> +	memset(&node->vdev_fmt, 0, sizeof(node->vdev_fmt));
> +
> +	mtk_dip_pipe_try_fmt(pipe, node, &node->vdev_fmt, f, dev_fmt);
> +	*f = node->vdev_fmt;
> +
> +	node->dev_q.dev_fmt = dev_fmt;
> +	node->vdev_fmt = *f;
> +	node->crop.left = 0; /* reset crop setting of nodes */
> +	node->crop.top = 0;
> +	node->crop.width = f->fmt.pix_mp.width;
> +	node->crop.height = f->fmt.pix_mp.height;
> +	node->compose.left = 0;
> +	node->compose.top = 0;
> +	node->compose.width = f->fmt.pix_mp.width;
> +	node->compose.height = f->fmt.pix_mp.height;
> +
> +	return 0;
> +}
> +
> +static int mtk_dip_videoc_enum_framesizes(struct file *file, void *priv,
> +					  struct v4l2_frmsizeenum *sizes)
> +{
> +	struct mtk_dip_pipe *pipe = video_drvdata(file);
> +	struct mtk_dip_video_device *node = mtk_dip_file_to_node(file);
> +	const struct mtk_dip_dev_format *dev_fmt;
> +
> +	dev_fmt = mtk_dip_pipe_find_fmt(pipe, node, sizes->pixel_format);
> +
> +	if (!dev_fmt || sizes->index)
> +		return -EINVAL;
> +
> +	sizes->type = node->desc->frmsizeenum->type;
> +	sizes->stepwise.max_width =
> +		node->desc->frmsizeenum->stepwise.max_width;
> +	sizes->stepwise.min_width =
> +		node->desc->frmsizeenum->stepwise.min_width;
> +	sizes->stepwise.max_height =
> +		node->desc->frmsizeenum->stepwise.max_height;
> +	sizes->stepwise.min_height =
> +		node->desc->frmsizeenum->stepwise.min_height;
> +	sizes->stepwise.step_height =
> +		node->desc->frmsizeenum->stepwise.step_height;
> +	sizes->stepwise.step_width =
> +		node->desc->frmsizeenum->stepwise.step_width;
> +
> +	return 0;
> +}
> +
> +static int mtk_dip_videoc_enum_fmt(struct file *file, void *fh,
> +				   struct v4l2_fmtdesc *f)
> +{
> +	struct mtk_dip_video_device *node = mtk_dip_file_to_node(file);
> +
> +	if (f->index >= node->desc->num_fmts)
> +		return -EINVAL;
> +
> +	strscpy(f->description, node->desc->description,
> +		sizeof(f->description));
> +	f->pixelformat = node->desc->fmts[f->index].format;
> +	f->flags = 0;
> +
> +	return 0;
> +}
> +
> +static int mtk_dip_meta_enum_format(struct file *file, void *fh,
> +				    struct v4l2_fmtdesc *f)
> +{
> +	struct mtk_dip_video_device *node = mtk_dip_file_to_node(file);
> +
> +	if (f->index > 0)
> +		return -EINVAL;
> +
> +	strscpy(f->description, node->desc->description,
> +		sizeof(f->description));
> +
> +	f->pixelformat = node->vdev_fmt.fmt.meta.dataformat;
> +	f->flags = 0;
> +
> +	return 0;
> +}
> +
> +static int mtk_dip_videoc_g_meta_fmt(struct file *file, void *fh,
> +				     struct v4l2_format *f)
> +{
> +	struct mtk_dip_video_device *node = mtk_dip_file_to_node(file);
> +	*f = node->vdev_fmt;
> +
> +	return 0;
> +}
> +
> +static int mtk_dip_video_device_s_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +	struct mtk_dip_video_device *node =
> +		container_of(ctrl->handler,
> +			     struct mtk_dip_video_device, ctrl_handler);
> +
> +	if (ctrl->id != V4L2_CID_ROTATE) {
> +		pr_debug("[%s] doesn't support ctrl(%d)\n",
> +			 node->desc->name, ctrl->id);
> +		return -EINVAL;
> +	}
> +
> +	node->rotation = ctrl->val;
> +
> +	return 0;
> +}
> +
> +/******************** function pointers ********************/
> +
> +static const struct v4l2_subdev_internal_ops mtk_dip_subdev_internal_ops = {
> +	.open = mtk_dip_subdev_open,
> +};
> +
> +static const struct v4l2_subdev_video_ops mtk_dip_subdev_video_ops = {
> +	.s_stream = mtk_dip_subdev_s_stream,
> +};
> +
> +static const struct v4l2_subdev_pad_ops mtk_dip_subdev_pad_ops = {
> +	.link_validate = v4l2_subdev_link_validate_default,
> +	.get_fmt = mtk_dip_subdev_get_fmt,
> +	.set_fmt = mtk_dip_subdev_set_fmt,
> +	.get_selection = mtk_dip_subdev_get_selection,
> +	.set_selection = mtk_dip_subdev_set_selection,
> +};
> +
> +static const struct v4l2_subdev_ops mtk_dip_subdev_ops = {
> +	.video = &mtk_dip_subdev_video_ops,
> +	.pad = &mtk_dip_subdev_pad_ops,
> +};
> +
> +static const struct media_entity_operations mtk_dip_media_ops = {
> +	.link_setup = mtk_dip_link_setup,
> +	.link_validate = v4l2_subdev_link_validate,
> +};
> +
> +static struct media_request *mtk_dip_request_alloc(struct media_device *mdev)
> +{
> +	struct mtk_dip_request *dip_req;
> +
> +	dip_req = kzalloc(sizeof(*dip_req), GFP_KERNEL);
> +
> +	return &dip_req->req;
> +}
> +
> +static void mtk_dip_request_free(struct media_request *req)
> +{
> +	struct mtk_dip_request *dip_req = mtk_dip_media_req_to_dip_req(req);
> +
> +	kfree(dip_req);
> +}
> +
> +static int mtk_dip_vb2_request_validate(struct media_request *req)
> +{
> +	struct media_request_object *obj;
> +	struct mtk_dip_dev *dip_dev = mtk_dip_mdev_to_dev(req->mdev);
> +	struct mtk_dip_request *dip_req = mtk_dip_media_req_to_dip_req(req);
> +	struct mtk_dip_pipe *pipe = NULL;
> +	struct mtk_dip_pipe *pipe_prev = NULL;
> +	struct mtk_dip_dev_buffer **map = dip_req->buf_map;
> +	int buf_count = 0;
> +
> +	memset(map, 0, sizeof(dip_req->buf_map));
> +
> +	list_for_each_entry(obj, &req->objects, list) {
> +		struct vb2_buffer *vb;
> +		struct mtk_dip_dev_buffer *dev_buf;
> +		struct mtk_dip_video_device *node;
> +
> +		if (!vb2_request_object_is_buffer(obj))
> +			continue;
> +
> +		vb = container_of(obj, struct vb2_buffer, req_obj);
> +		node = mtk_dip_vbq_to_node(vb->vb2_queue);
> +		pipe = vb2_get_drv_priv(vb->vb2_queue);
> +		if (pipe_prev && pipe != pipe_prev) {
> +			dev_dbg(dip_dev->dev,
> +				"%s:%s:%s:found buf of different pipes(%p,%p)\n",
> +				__func__, node->desc->name,
> +				req->debug_str, pipe, pipe_prev);
> +			return -EINVAL;
> +		}
> +
> +		pipe_prev = pipe;
> +		dev_buf = mtk_dip_vb2_buf_to_dev_buf(vb);
> +		dip_req->buf_map[node->desc->id] = dev_buf;
> +		buf_count++;
> +	}
> +
> +	if (!pipe) {
> +		dev_dbg(dip_dev->dev,
> +			"%s: no buffer in the request(%p)\n",
> +			req->debug_str, req);
> +
> +		return -EINVAL;
> +	}
> +
> +	if (!map[MTK_DIP_VIDEO_NODE_ID_RAW_OUT] ||
> +	    (!map[MTK_DIP_VIDEO_NODE_ID_MDP0_CAPTURE] &&
> +	     !map[MTK_DIP_VIDEO_NODE_ID_MDP1_CAPTURE] &&
> +	     !map[MTK_DIP_VIDEO_NODE_ID_IMG3_CAPTURE])) {
> +		dev_dbg(dip_dev->dev,
> +			"won't trigger hw job: raw(%p), mdp0(%p), mdp1(%p), img3(%p)\n",
> +			map[MTK_DIP_VIDEO_NODE_ID_RAW_OUT],
> +			map[MTK_DIP_VIDEO_NODE_ID_MDP0_CAPTURE],
> +			map[MTK_DIP_VIDEO_NODE_ID_MDP1_CAPTURE],
> +			map[MTK_DIP_VIDEO_NODE_ID_IMG3_CAPTURE]);
> +		return -EINVAL;
> +	}
> +
> +	atomic_set(&dip_req->buf_count, buf_count);
> +	dip_req->id = mtk_dip_pipe_next_job_id(pipe);
> +	dip_req->dip_pipe = pipe;
> +
> +	return vb2_request_validate(req);
> +}
> +
> +static void mtk_dip_vb2_request_queue(struct media_request *req)
> +{
> +	struct mtk_dip_request *dip_req = mtk_dip_media_req_to_dip_req(req);
> +	struct mtk_dip_pipe *pipe = dip_req->dip_pipe;
> +
> +	spin_lock(&pipe->job_lock);
> +	list_add_tail(&dip_req->list, &pipe->pipe_job_pending_list);
> +	pipe->num_pending_jobs++;
> +	spin_unlock(&pipe->job_lock);
> +
> +	vb2_request_queue(req);
> +}
> +
> +static const struct media_device_ops mtk_dip_media_req_ops = {
> +	.req_validate = mtk_dip_vb2_request_validate,
> +	.req_queue = mtk_dip_vb2_request_queue,
> +	.req_alloc = mtk_dip_request_alloc,
> +	.req_free = mtk_dip_request_free,
> +};
> +
> +static const struct v4l2_ctrl_ops mtk_dip_video_device_ctrl_ops = {
> +	.s_ctrl = mtk_dip_video_device_s_ctrl,
> +};
> +
> +static const struct vb2_ops mtk_dip_vb2_meta_ops = {
> +	.buf_queue = mtk_dip_vb2_buf_queue,
> +	.queue_setup = mtk_dip_vb2_meta_queue_setup,
> +	.buf_init = mtk_dip_vb2_meta_buf_init,
> +	.buf_prepare  = mtk_dip_vb2_meta_buf_prepare,
> +	.buf_out_validate = mtk_dip_vb2_buf_out_validate,
> +	.buf_cleanup = mtk_dip_vb2_queue_meta_buf_cleanup,
> +	.start_streaming = mtk_dip_vb2_start_streaming,
> +	.stop_streaming = mtk_dip_vb2_stop_streaming,
> +	.wait_prepare = vb2_ops_wait_prepare,
> +	.wait_finish = vb2_ops_wait_finish,
> +	.buf_request_complete = mtk_dip_vb2_request_complete,
> +};
> +
> +static const struct vb2_ops mtk_dip_vb2_video_ops = {
> +	.buf_queue = mtk_dip_vb2_buf_queue,
> +	.queue_setup = mtk_dip_vb2_video_queue_setup,
> +	.buf_init = mtk_dip_vb2_video_buf_init,
> +	.buf_prepare  = mtk_dip_vb2_video_buf_prepare,
> +	.buf_out_validate = mtk_dip_vb2_buf_out_validate,
> +	.start_streaming = mtk_dip_vb2_start_streaming,
> +	.stop_streaming = mtk_dip_vb2_stop_streaming,
> +	.wait_prepare = vb2_ops_wait_prepare,
> +	.wait_finish = vb2_ops_wait_finish,
> +	.buf_request_complete = mtk_dip_vb2_request_complete,
> +};
> +
> +static const struct v4l2_file_operations mtk_dip_v4l2_fops = {
> +	.unlocked_ioctl = video_ioctl2,
> +	.open = v4l2_fh_open,
> +	.release = vb2_fop_release,
> +	.poll = vb2_fop_poll,
> +	.mmap = vb2_fop_mmap,
> +#ifdef CONFIG_COMPAT
> +	.compat_ioctl32 = v4l2_compat_ioctl32,
> +#endif
> +};
> +
> +int mtk_dip_dev_media_register(struct device *dev,
> +			       struct media_device *media_dev)
> +{
> +	int ret;
> +
> +	media_dev->dev = dev;
> +	strlcpy(media_dev->model, dev_driver_string(dev),
> +		sizeof(media_dev->model));
> +	snprintf(media_dev->bus_info, sizeof(media_dev->bus_info),
> +		 "platform:%s", dev_name(dev));
> +	media_dev->hw_revision = 0;
> +	media_dev->ops = &mtk_dip_media_req_ops;
> +	media_device_init(media_dev);
> +
> +	ret = media_device_register(media_dev);
> +	if (ret) {
> +		dev_err(dev, "failed to register media device (%d)\n", ret);
> +		media_device_unregister(media_dev);
> +		media_device_cleanup(media_dev);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int mtk_dip_video_device_v4l2_register(struct mtk_dip_pipe *pipe,
> +					      struct mtk_dip_video_device *node)
> +{
> +	struct vb2_queue *vbq = &node->dev_q.vbq;
> +	struct video_device *vdev = &node->vdev;
> +	struct media_link *link;
> +	int ret;
> +
> +	mutex_init(&node->dev_q.lock);
> +
> +	vdev->device_caps = node->desc->cap;
> +	vdev->ioctl_ops = node->desc->ops;
> +	node->vdev_fmt.type = node->desc->buf_type;
> +	mtk_dip_pipe_load_default_fmt(pipe, node, &node->vdev_fmt);
> +
> +	node->pad_fmt.width = node->vdev_fmt.fmt.pix_mp.width;
> +	node->pad_fmt.height = node->vdev_fmt.fmt.pix_mp.height;
> +	node->pad_fmt.code = MEDIA_BUS_FMT_FIXED;
> +	node->pad_fmt.field = node->vdev_fmt.fmt.pix_mp.field;
> +	node->pad_fmt.colorspace = node->vdev_fmt.fmt.pix_mp.colorspace;
> +	node->pad_fmt.quantization = node->vdev_fmt.fmt.pix_mp.quantization;
> +	node->crop.left = 0;
> +	node->crop.top = 0;
> +	node->crop.width = node->vdev_fmt.fmt.pix_mp.width;
> +	node->crop.height = node->vdev_fmt.fmt.pix_mp.height;
> +	node->compose.left = 0;
> +	node->compose.top = 0;
> +	node->compose.width = node->vdev_fmt.fmt.pix_mp.width;
> +	node->compose.height = node->vdev_fmt.fmt.pix_mp.height;
> +
> +	ret = media_entity_pads_init(&vdev->entity, 1, &node->vdev_pad);
> +	if (ret) {
> +		dev_err(pipe->dip_dev->dev,
> +			"failed initialize media entity (%d)\n", ret);
> +		goto err_mutex_destroy;
> +	}
> +
> +	node->vdev_pad.flags = V4L2_TYPE_IS_OUTPUT(node->desc->buf_type) ?
> +		MEDIA_PAD_FL_SOURCE : MEDIA_PAD_FL_SINK;
> +
> +	vbq->type = node->vdev_fmt.type;
> +	vbq->io_modes = VB2_MMAP | VB2_DMABUF;
> +	vbq->ops = node->desc->vb2_ops;
> +	vbq->mem_ops = &vb2_dma_contig_memops;
> +	vbq->supports_requests = true;
> +	vbq->buf_struct_size = sizeof(struct mtk_dip_dev_buffer);
> +	vbq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
> +	vbq->min_buffers_needed = 0;
> +	vbq->drv_priv = pipe;
> +	vbq->lock = &node->dev_q.lock;
> +
> +	ret = vb2_queue_init(vbq);
> +	if (ret) {
> +		dev_err(pipe->dip_dev->dev,
> +			"%s:%s:%s: failed to init vb2 queue(%d)\n",
> +			__func__, pipe->desc->name, node->desc->name,
> +			ret);
> +		goto err_media_entity_cleanup;
> +	}
> +
> +	snprintf(vdev->name, sizeof(vdev->name), "%s %s %s",
> +		 dev_driver_string(pipe->dip_dev->dev), pipe->desc->name,
> +		 node->desc->name);
> +	vdev->entity.name = vdev->name;
> +	vdev->entity.function = MEDIA_ENT_F_IO_V4L;
> +	vdev->entity.ops = NULL;
> +	vdev->release = video_device_release_empty;
> +	vdev->fops = &mtk_dip_v4l2_fops;
> +	vdev->lock = &node->dev_q.lock;
> +	if (node->desc->supports_ctrls)
> +		vdev->ctrl_handler = &node->ctrl_handler;
> +	else
> +		vdev->ctrl_handler = NULL;
> +	vdev->v4l2_dev = &pipe->dip_dev->v4l2_dev;
> +	vdev->queue = &node->dev_q.vbq;
> +	vdev->vfl_dir = V4L2_TYPE_IS_OUTPUT(node->desc->buf_type) ?
> +		VFL_DIR_TX : VFL_DIR_RX;
> +
> +	if (node->desc->smem_alloc)
> +		vdev->queue->dev = &pipe->dip_dev->scp_pdev->dev;
> +	else
> +		vdev->queue->dev = pipe->dip_dev->dev;
> +
> +	video_set_drvdata(vdev, pipe);
> +
> +	ret = video_register_device(vdev, VFL_TYPE_GRABBER, -1);
> +	if (ret) {
> +		dev_err(pipe->dip_dev->dev,
> +			"failed to register video device (%d)\n", ret);
> +		goto err_vb2_queue_release;
> +	}
> +
> +	if (V4L2_TYPE_IS_OUTPUT(node->desc->buf_type))
> +		ret = media_create_pad_link(&vdev->entity, 0,
> +					    &pipe->subdev.entity,
> +					    node->desc->id, node->flags);
> +	else
> +		ret = media_create_pad_link(&pipe->subdev.entity,
> +					    node->desc->id, &vdev->entity,
> +					    0, node->flags);
> +	if (ret)
> +		goto err_video_unregister_device;
> +
> +	vdev->intf_devnode = media_devnode_create(&pipe->dip_dev->mdev,
> +						  MEDIA_INTF_T_V4L_VIDEO, 0,
> +						  VIDEO_MAJOR, vdev->minor);
> +	if (!vdev->intf_devnode) {
> +		ret = -ENOMEM;
> +		goto err_rm_links;
> +	}
> +
> +	link = media_create_intf_link(&vdev->entity,
> +				      &vdev->intf_devnode->intf,
> +				      node->flags);
> +	if (!link) {
> +		ret = -ENOMEM;
> +		goto err_rm_devnode;
> +	}
> +
> +	return 0;
> +
> +err_rm_devnode:
> +	media_devnode_remove(vdev->intf_devnode);
> +
> +err_rm_links:
> +	media_entity_remove_links(&vdev->entity);
> +
> +err_video_unregister_device:
> +	video_unregister_device(vdev);
> +
> +err_vb2_queue_release:
> +	vb2_queue_release(&node->dev_q.vbq);
> +
> +err_media_entity_cleanup:
> +	media_entity_cleanup(&node->vdev.entity);
> +
> +err_mutex_destroy:
> +	mutex_destroy(&node->dev_q.lock);
> +
> +	return ret;
> +}
> +
> +static int mtk_dip_pipe_v4l2_ctrl_init(struct mtk_dip_pipe *dip_pipe)
> +{
> +	int i, ret;
> +	struct mtk_dip_video_device *ctrl_node;
> +
> +	for (i = 0; i < MTK_DIP_VIDEO_NODE_ID_TOTAL_NUM; i++) {
> +		ctrl_node = &dip_pipe->nodes[i];
> +		if (!ctrl_node->desc->supports_ctrls)
> +			continue;
> +
> +		v4l2_ctrl_handler_init(&ctrl_node->ctrl_handler, 1);
> +		v4l2_ctrl_new_std(&ctrl_node->ctrl_handler,
> +				  &mtk_dip_video_device_ctrl_ops,
> +				  V4L2_CID_ROTATE, 0, 270, 90, 0);
> +		ret = ctrl_node->ctrl_handler.error;
> +		if (ret) {
> +			dev_err(dip_pipe->dip_dev->dev,
> +				"%s create rotate ctrl failed:(%d)",
> +				ctrl_node->desc->name, ret);
> +			goto err_free_ctrl_handlers;
> +		}
> +	}
> +
> +	return 0;
> +
> +err_free_ctrl_handlers:
> +	for (; i >= 0; i--) {
> +		ctrl_node = &dip_pipe->nodes[i];
> +		if (!ctrl_node->desc->supports_ctrls)
> +			continue;
> +		v4l2_ctrl_handler_free(&ctrl_node->ctrl_handler);
> +	}
> +
> +	return ret;
> +}
> +
> +static void mtk_dip_pipe_v4l2_ctrl_release(struct mtk_dip_pipe *dip_pipe)
> +{
> +	struct mtk_dip_video_device *ctrl_node =
> +		&dip_pipe->nodes[MTK_DIP_VIDEO_NODE_ID_MDP0_CAPTURE];
> +
> +	v4l2_ctrl_handler_free(&ctrl_node->ctrl_handler);
> +}
> +
> +int mtk_dip_pipe_v4l2_register(struct mtk_dip_pipe *pipe,
> +			       struct media_device *media_dev,
> +			       struct v4l2_device *v4l2_dev)
> +{
> +	int i, ret;
> +
> +	ret = mtk_dip_pipe_v4l2_ctrl_init(pipe);
> +	if (ret) {
> +		dev_err(pipe->dip_dev->dev,
> +			"%s: failed(%d) to initialize ctrls\n",
> +			pipe->desc->name, ret);
> +
> +		return ret;
> +	}
> +
> +	pipe->streaming = 0;
> +
> +	/* Initialize subdev media entity */
> +	pipe->subdev_pads = devm_kcalloc(pipe->dip_dev->dev,
> +					 pipe->desc->total_queues,
> +					 sizeof(*pipe->subdev_pads),
> +					 GFP_KERNEL);
> +	if (!pipe->subdev_pads) {
> +		dev_err(pipe->dip_dev->dev,
> +			"failed to alloc pipe->subdev_pads (%d)\n", ret);
> +		ret = -ENOMEM;
> +		goto err_release_ctrl;
> +	}
> +	ret = media_entity_pads_init(&pipe->subdev.entity,
> +				     pipe->desc->total_queues,
> +				     pipe->subdev_pads);
> +	if (ret) {
> +		dev_err(pipe->dip_dev->dev,
> +			"failed initialize subdev media entity (%d)\n", ret);
> +		goto err_free_subdev_pads;
> +	}
> +
> +	/* Initialize subdev */
> +	v4l2_subdev_init(&pipe->subdev, &mtk_dip_subdev_ops);
> +
> +	pipe->subdev.entity.function =
> +		MEDIA_ENT_F_PROC_VIDEO_PIXEL_FORMATTER;
> +	pipe->subdev.entity.ops = &mtk_dip_media_ops;
> +	pipe->subdev.flags =
> +		V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_HAS_EVENTS;
> +	pipe->subdev.ctrl_handler = NULL;
> +	pipe->subdev.internal_ops = &mtk_dip_subdev_internal_ops;
> +
> +	for (i = 0; i < pipe->desc->total_queues; i++)
> +		pipe->subdev_pads[i].flags =
> +			V4L2_TYPE_IS_OUTPUT(pipe->nodes[i].desc->buf_type) ?
> +			MEDIA_PAD_FL_SINK : MEDIA_PAD_FL_SOURCE;
> +
> +	snprintf(pipe->subdev.name, sizeof(pipe->subdev.name),
> +		 "%s", pipe->desc->name);
> +	v4l2_set_subdevdata(&pipe->subdev, pipe);
> +
> +	ret = v4l2_device_register_subdev(&pipe->dip_dev->v4l2_dev,
> +					  &pipe->subdev);
> +	if (ret) {
> +		dev_err(pipe->dip_dev->dev,
> +			"failed initialize subdev (%d)\n", ret);
> +		goto err_media_entity_cleanup;
> +	}
> +
> +	/* Create video nodes and links */
> +	for (i = 0; i < pipe->desc->total_queues; i++) {
> +		ret = mtk_dip_video_device_v4l2_register(pipe,
> +							 &pipe->nodes[i]);
> +		if (ret)
> +			goto err_unregister_subdev;
> +	}
> +
> +	return 0;
> +
> +err_unregister_subdev:
> +	v4l2_device_unregister_subdev(&pipe->subdev);
> +
> +err_media_entity_cleanup:
> +	media_entity_cleanup(&pipe->subdev.entity);
> +
> +err_free_subdev_pads:
> +	devm_kfree(pipe->dip_dev->dev, pipe->subdev_pads);
> +
> +err_release_ctrl:
> +	mtk_dip_pipe_v4l2_ctrl_release(pipe);
> +
> +	return ret;
> +}
> +
> +void mtk_dip_pipe_v4l2_unregister(struct mtk_dip_pipe *pipe)
> +{
> +	unsigned int i;
> +
> +	for (i = 0; i < pipe->desc->total_queues; i++) {
> +		video_unregister_device(&pipe->nodes[i].vdev);
> +		vb2_queue_release(&pipe->nodes[i].dev_q.vbq);
> +		media_entity_cleanup(&pipe->nodes[i].vdev.entity);
> +		mutex_destroy(&pipe->nodes[i].dev_q.lock);
> +	}
> +
> +	v4l2_device_unregister_subdev(&pipe->subdev);
> +	media_entity_cleanup(&pipe->subdev.entity);
> +	mtk_dip_pipe_v4l2_ctrl_release(pipe);
> +}
> +
> +/********************************************
> + * MTK DIP V4L2 Settings *
> + ********************************************/
> +
> +static const struct v4l2_ioctl_ops mtk_dip_v4l2_video_out_ioctl_ops = {
> +	.vidioc_querycap = mtk_dip_videoc_querycap,
> +
> +	.vidioc_enum_framesizes = mtk_dip_videoc_enum_framesizes,
> +	.vidioc_enum_fmt_vid_out = mtk_dip_videoc_enum_fmt,
> +	.vidioc_g_fmt_vid_out_mplane = mtk_dip_videoc_g_fmt,
> +	.vidioc_s_fmt_vid_out_mplane = mtk_dip_videoc_s_fmt,
> +	.vidioc_try_fmt_vid_out_mplane = mtk_dip_videoc_try_fmt,
> +
> +	.vidioc_reqbufs = vb2_ioctl_reqbufs,
> +	.vidioc_create_bufs = vb2_ioctl_create_bufs,
> +	.vidioc_prepare_buf = vb2_ioctl_prepare_buf,
> +	.vidioc_querybuf = vb2_ioctl_querybuf,
> +	.vidioc_qbuf = vb2_ioctl_qbuf,
> +	.vidioc_dqbuf = vb2_ioctl_dqbuf,
> +	.vidioc_streamon = vb2_ioctl_streamon,
> +	.vidioc_streamoff = vb2_ioctl_streamoff,
> +	.vidioc_expbuf = vb2_ioctl_expbuf,
> +
> +	.vidioc_subscribe_event = v4l2_ctrl_subscribe_event,
> +	.vidioc_unsubscribe_event = v4l2_event_unsubscribe,
> +};
> +
> +static const struct v4l2_ioctl_ops mtk_dip_v4l2_video_cap_ioctl_ops = {
> +	.vidioc_querycap = mtk_dip_videoc_querycap,
> +
> +	.vidioc_enum_framesizes = mtk_dip_videoc_enum_framesizes,
> +	.vidioc_enum_fmt_vid_cap = mtk_dip_videoc_enum_fmt,
> +	.vidioc_g_fmt_vid_cap_mplane = mtk_dip_videoc_g_fmt,
> +	.vidioc_s_fmt_vid_cap_mplane = mtk_dip_videoc_s_fmt,
> +	.vidioc_try_fmt_vid_cap_mplane = mtk_dip_videoc_try_fmt,
> +
> +	.vidioc_reqbufs = vb2_ioctl_reqbufs,
> +	.vidioc_create_bufs = vb2_ioctl_create_bufs,
> +	.vidioc_prepare_buf = vb2_ioctl_prepare_buf,
> +	.vidioc_querybuf = vb2_ioctl_querybuf,
> +	.vidioc_qbuf = vb2_ioctl_qbuf,
> +	.vidioc_dqbuf = vb2_ioctl_dqbuf,
> +	.vidioc_streamon = vb2_ioctl_streamon,
> +	.vidioc_streamoff = vb2_ioctl_streamoff,
> +	.vidioc_expbuf = vb2_ioctl_expbuf,
> +
> +	.vidioc_subscribe_event = v4l2_ctrl_subscribe_event,
> +	.vidioc_unsubscribe_event = v4l2_event_unsubscribe,
> +};
> +
> +static const struct v4l2_ioctl_ops mtk_dip_v4l2_meta_out_ioctl_ops = {
> +	.vidioc_querycap = mtk_dip_videoc_querycap,
> +
> +	.vidioc_enum_fmt_meta_out = mtk_dip_meta_enum_format,
> +	.vidioc_g_fmt_meta_out = mtk_dip_videoc_g_meta_fmt,
> +	.vidioc_s_fmt_meta_out = mtk_dip_videoc_g_meta_fmt,
> +	.vidioc_try_fmt_meta_out = mtk_dip_videoc_g_meta_fmt,
> +
> +	.vidioc_reqbufs = vb2_ioctl_reqbufs,
> +	.vidioc_create_bufs = vb2_ioctl_create_bufs,
> +	.vidioc_prepare_buf = vb2_ioctl_prepare_buf,
> +	.vidioc_querybuf = vb2_ioctl_querybuf,
> +	.vidioc_qbuf = vb2_ioctl_qbuf,
> +	.vidioc_dqbuf = vb2_ioctl_dqbuf,
> +	.vidioc_streamon = vb2_ioctl_streamon,
> +	.vidioc_streamoff = vb2_ioctl_streamoff,
> +	.vidioc_expbuf = vb2_ioctl_expbuf,
> +};
> +
> +static const struct mtk_dip_dev_format fw_param_fmts[] = {
> +	{
> +		.format = V4L2_META_FMT_MTISP_PARAMS,
> +		.buffer_size = 1024 * (128 + 288),
> +	},
> +};
> +
> +static const struct mtk_dip_dev_format lcei_fmts[] = {
> +	{
> +		.format = V4L2_PIX_FMT_MTISP_SBGGR8,
> +		.mdp_color = DIP_MCOLOR_BAYER8,
> +		.depth = { 8 },
> +		.row_depth = { 8 },
> +		.num_planes = 1,
> +		.num_cplanes = 1,
> +	},
> +};
> +
> +static const struct mtk_dip_dev_format in_fmts[] = {
> +	{
> +		.format = V4L2_PIX_FMT_VYUY,
> +		.mdp_color = DIP_MCOLOR_VYUY,
> +		.depth	 = { 16 },
> +		.row_depth = { 16 },
> +		.num_planes = 1,
> +		.num_cplanes = 1,
> +	},
> +	{
> +		.format = V4L2_PIX_FMT_YUYV,
> +		.mdp_color = DIP_MCOLOR_YUYV,
> +		.depth	 = { 16 },
> +		.row_depth = { 16 },
> +		.num_planes = 1,
> +		.num_cplanes = 1,
> +	},
> +	{
> +		.format = V4L2_PIX_FMT_YVYU,
> +		.mdp_color = DIP_MCOLOR_YVYU,
> +		.depth	 = { 16 },
> +		.row_depth = { 16 },
> +		.num_planes = 1,
> +		.num_cplanes = 1,
> +	},
> +	{
> +		.format = V4L2_PIX_FMT_NV12,
> +		.mdp_color = DIP_MCOLOR_NV12,
> +		.depth = { 12 },
> +		.row_depth = { 8 },
> +		.num_planes = 1,
> +		.num_cplanes = 2,
> +	},
> +	{
> +		.format = V4L2_PIX_FMT_MTISP_SBGGR8,
> +		.mdp_color = DIP_MCOLOR_BAYER8_BGGR,
> +		.depth = { 8 },
> +		.row_depth = { 8 },
> +		.num_planes = 1,
> +		.num_cplanes = 1,
> +		.pass_1_align = 4,
> +	},
> +	{
> +		.format = V4L2_PIX_FMT_MTISP_SGBRG8,
> +		.mdp_color = DIP_MCOLOR_BAYER8_GBRG,
> +		.depth = { 8 },
> +		.row_depth = { 8 },
> +		.num_planes = 1,
> +		.num_cplanes = 1,
> +		.pass_1_align = 4,
> +	},
> +	{
> +		.format = V4L2_PIX_FMT_MTISP_SGRBG8,
> +		.mdp_color = DIP_MCOLOR_BAYER8_GRBG,
> +		.depth = { 8 },
> +		.row_depth = { 8 },
> +		.num_planes = 1,
> +		.num_cplanes = 1,
> +		.pass_1_align = 4,
> +	},
> +	{
> +		.format = V4L2_PIX_FMT_MTISP_SRGGB8,
> +		.mdp_color = DIP_MCOLOR_BAYER8_RGGB,
> +		.depth = { 8 },
> +		.row_depth = { 8 },
> +		.num_planes = 1,
> +		.num_cplanes = 1,
> +		.pass_1_align = 4,
> +	},
> +	{
> +		.format = V4L2_PIX_FMT_MTISP_SBGGR8F,
> +		.mdp_color = DIP_MCOLOR_FULLG8_BGGR,
> +		.depth = { 12 },
> +		.row_depth = { 8},
> +		.num_planes = 1,
> +		.num_cplanes = 1,
> +		.pass_1_align = 8,
> +	},
> +	{
> +		.format = V4L2_PIX_FMT_MTISP_SGBRG8F,
> +		.mdp_color = DIP_MCOLOR_FULLG8_GBRG,
> +		.depth = { 12 },
> +		.row_depth = { 8 },
> +		.num_planes = 1,
> +		.num_cplanes = 1,
> +		.pass_1_align = 8,
> +	},
> +	{
> +		.format = V4L2_PIX_FMT_MTISP_SGRBG8F,
> +		.mdp_color = DIP_MCOLOR_FULLG8_GRBG,
> +		.depth = { 12 },
> +		.row_depth = { 8 },
> +		.num_planes = 1,
> +		.num_cplanes = 1,
> +		.pass_1_align = 8,
> +	},
> +	{
> +		.format = V4L2_PIX_FMT_MTISP_SRGGB8F,
> +		.mdp_color = DIP_MCOLOR_FULLG8_RGGB,
> +		.depth = { 12 },
> +		.row_depth = { 8 },
> +		.num_planes = 1,
> +		.num_cplanes = 1,
> +		.pass_1_align = 8,
> +	},
> +	{
> +		.format = V4L2_PIX_FMT_MTISP_SBGGR10,
> +		.mdp_color = DIP_MCOLOR_BAYER10_BGGR,
> +		.depth = { 10 },
> +		.row_depth = { 10 },
> +		.num_planes = 1,
> +		.num_cplanes = 1,
> +		.pass_1_align = 4,
> +	},
> +	{
> +		.format = V4L2_PIX_FMT_MTISP_SGBRG10,
> +		.mdp_color = DIP_MCOLOR_BAYER10_GBRG,
> +		.depth = { 10 },
> +		.row_depth = { 10 },
> +		.num_planes = 1,
> +		.num_cplanes = 1,
> +		.pass_1_align = 4,
> +	},
> +	{
> +		.format = V4L2_PIX_FMT_MTISP_SGRBG10,
> +		.mdp_color = DIP_MCOLOR_BAYER10_GRBG,
> +		.depth = { 10 },
> +		.row_depth = { 10 },
> +		.num_planes = 1,
> +		.num_cplanes = 1,
> +		.pass_1_align = 4,
> +	},
> +	{
> +		.format = V4L2_PIX_FMT_MTISP_SRGGB10,
> +		.mdp_color = DIP_MCOLOR_BAYER10_RGGB,
> +		.depth = { 10 },
> +		.row_depth = { 10 },
> +		.num_planes = 1,
> +		.num_cplanes = 1,
> +		.pass_1_align = 4,
> +	},
> +	{
> +		.format = V4L2_PIX_FMT_MTISP_SBGGR10F,
> +		.mdp_color = DIP_MCOLOR_FULLG10_BGGR,
> +		.depth = { 15 },
> +		.row_depth = { 10 },
> +		.num_planes = 1,
> +		.num_cplanes = 1,
> +		.pass_1_align = 4,
> +	},
> +	{
> +		.format = V4L2_PIX_FMT_MTISP_SGBRG10F,
> +		.mdp_color = DIP_MCOLOR_FULLG10_GBRG,
> +		.depth = { 15 },
> +		.row_depth = { 10 },
> +		.num_planes = 1,
> +		.num_cplanes = 1,
> +		.pass_1_align = 4,
> +	},
> +	{
> +		.format = V4L2_PIX_FMT_MTISP_SGRBG10F,
> +		.mdp_color = DIP_MCOLOR_FULLG10_GRBG,
> +		.depth = { 15 },
> +		.row_depth = { 10 },
> +		.num_planes = 1,
> +		.num_cplanes = 1,
> +		.pass_1_align = 4,
> +	},
> +	{
> +		.format = V4L2_PIX_FMT_MTISP_SRGGB10F,
> +		.mdp_color = DIP_MCOLOR_FULLG10_RGGB,
> +		.depth = { 15 },
> +		.row_depth = { 10 },
> +		.num_planes = 1,
> +		.num_cplanes = 1,
> +		.pass_1_align = 4,
> +	},
> +	{
> +		.format = V4L2_PIX_FMT_MTISP_SBGGR12,
> +		.mdp_color = DIP_MCOLOR_BAYER12_BGGR,
> +		.depth = { 12 },
> +		.row_depth = { 12 },
> +		.num_planes = 1,
> +		.num_cplanes = 1,
> +		.pass_1_align = 4,
> +	},
> +	{
> +		.format = V4L2_PIX_FMT_MTISP_SGBRG12,
> +		.mdp_color = DIP_MCOLOR_BAYER12_GBRG,
> +		.depth = { 12 },
> +		.row_depth = { 12 },
> +		.num_planes = 1,
> +		.num_cplanes = 1,
> +		.pass_1_align = 4,
> +	},
> +	{
> +		.format = V4L2_PIX_FMT_MTISP_SGRBG12,
> +		.mdp_color = DIP_MCOLOR_BAYER12_GRBG,
> +		.depth = { 12 },
> +		.row_depth = { 12 },
> +		.num_planes = 1,
> +		.num_cplanes = 1,
> +		.pass_1_align = 4,
> +	},
> +	{
> +		.format = V4L2_PIX_FMT_MTISP_SRGGB12,
> +		.mdp_color = DIP_MCOLOR_BAYER12_RGGB,
> +		.depth = { 12 },
> +		.row_depth = { 12 },
> +		.num_planes = 1,
> +		.num_cplanes = 1,
> +		.pass_1_align = 4,
> +	},
> +	{
> +		.format = V4L2_PIX_FMT_MTISP_SBGGR12F,
> +		.mdp_color = DIP_MCOLOR_FULLG12_BGGR,
> +		.depth = { 18 },
> +		.row_depth = { 12 },
> +		.num_planes = 1,
> +		.num_cplanes = 1,
> +		.pass_1_align = 8,
> +	},
> +	{
> +		.format = V4L2_PIX_FMT_MTISP_SGBRG12F,
> +		.mdp_color = DIP_MCOLOR_FULLG12_GBRG,
> +		.depth = { 18 },
> +		.row_depth = { 12 },
> +		.num_planes = 1,
> +		.num_cplanes = 1,
> +		.pass_1_align = 8,
> +	},
> +	{
> +		.format = V4L2_PIX_FMT_MTISP_SGRBG12F,
> +		.mdp_color = DIP_MCOLOR_FULLG12_GRBG,
> +		.depth = { 18 },
> +		.row_depth = { 12 },
> +		.num_planes = 1,
> +		.num_cplanes = 1,
> +		.pass_1_align = 8,
> +	},
> +	{
> +		.format = V4L2_PIX_FMT_MTISP_SRGGB12F,
> +		.mdp_color = DIP_MCOLOR_FULLG12_RGGB,
> +		.depth = { 18 },
> +		.row_depth = { 12 },
> +		.num_planes = 1,
> +		.num_cplanes = 1,
> +		.pass_1_align = 8,
> +	},
> +	{
> +		.format = V4L2_PIX_FMT_MTISP_SBGGR14F,
> +		.mdp_color = DIP_MCOLOR_FULLG14_BGGR,
> +		.depth = { 21 },
> +		.row_depth = { 14 },
> +		.num_planes = 1,
> +		.num_cplanes = 1,
> +		.pass_1_align = 8,
> +	},
> +	{
> +		.format = V4L2_PIX_FMT_MTISP_SGBRG14F,
> +		.mdp_color = DIP_MCOLOR_FULLG14_GBRG,
> +		.depth = { 21 },
> +		.row_depth = { 14 },
> +		.num_planes = 1,
> +		.num_cplanes = 1,
> +		.pass_1_align = 8,
> +	},
> +	{
> +		.format = V4L2_PIX_FMT_MTISP_SGRBG14F,
> +		.mdp_color = DIP_MCOLOR_FULLG14_GRBG,
> +		.depth = { 21 },
> +		.row_depth = { 14 },
> +		.num_planes = 1,
> +		.num_cplanes = 1,
> +		.pass_1_align = 8,
> +	},
> +	{
> +		.format = V4L2_PIX_FMT_MTISP_SRGGB14F,
> +		.mdp_color = DIP_MCOLOR_FULLG14_RGGB,
> +		.depth = { 21 },
> +		.row_depth = { 14 },
> +		.num_planes = 1,
> +		.num_cplanes = 1,
> +		.pass_1_align = 8,
> +	},
> +	{
> +		.format	= V4L2_PIX_FMT_YUV420M,
> +		.mdp_color	= DIP_MCOLOR_I420,
> +		.depth		= { 8, 2, 2 },
> +		.row_depth	= { 8, 4, 4 },
> +		.num_planes	= 3,
> +		.num_cplanes = 1,
> +	},
> +	{
> +		.format	= V4L2_PIX_FMT_YVU420M,
> +		.mdp_color	= DIP_MCOLOR_YV12,
> +		.depth		= { 8, 2, 2 },
> +		.row_depth	= { 8, 4, 4 },
> +		.num_planes	= 3,
> +		.num_cplanes = 1,
> +	},
> +	{
> +		.format	= V4L2_PIX_FMT_NV12M,
> +		.mdp_color	= DIP_MCOLOR_NV12,
> +		.depth		= { 8, 4 },
> +		.row_depth	= { 8, 8 },
> +		.num_planes	= 2,
> +		.num_cplanes = 1,
> +	},
> +};
> +
> +static const struct mtk_dip_dev_format mdp_fmts[] = {
> +	{
> +		.format = V4L2_PIX_FMT_VYUY,
> +		.mdp_color = DIP_MCOLOR_VYUY,
> +		.depth = { 16 },
> +		.row_depth = { 16 },
> +		.num_planes = 1,
> +		.num_cplanes = 1,
> +	},
> +	{
> +		.format = V4L2_PIX_FMT_YUYV,
> +		.mdp_color = DIP_MCOLOR_YUYV,
> +		.depth = { 16 },
> +		.row_depth = { 16 },
> +		.num_planes = 1,
> +		.num_cplanes = 1,
> +	},
> +	{
> +		.format = V4L2_PIX_FMT_YVYU,
> +		.mdp_color = DIP_MCOLOR_YVYU,
> +		.depth = { 16 },
> +		.row_depth = { 16 },
> +		.num_planes = 1,
> +		.num_cplanes = 1,
> +	},
> +	{
> +		.format = V4L2_PIX_FMT_YVU420,
> +		.mdp_color = DIP_MCOLOR_YV12,
> +		.depth = { 12 },
> +		.row_depth = { 8 },
> +		.num_planes = 1,
> +		.num_cplanes = 3,
> +	},
> +	{
> +		.format = V4L2_PIX_FMT_NV12,
> +		.mdp_color = DIP_MCOLOR_NV12,
> +		.depth = { 12 },
> +		.row_depth = { 8 },
> +		.num_planes = 1,
> +		.num_cplanes = 2,
> +	},
> +	{
> +		.format	= V4L2_PIX_FMT_YUV420M,
> +		.mdp_color	= DIP_MCOLOR_I420,
> +		.depth		= { 8, 2, 2 },
> +		.row_depth	= { 8, 4, 4 },
> +		.num_planes	= 3,
> +		.num_cplanes = 1,
> +	},
> +	{
> +		.format	= V4L2_PIX_FMT_YVU420M,
> +		.mdp_color	= DIP_MCOLOR_YV12,
> +		.depth		= { 8, 2, 2 },
> +		.row_depth	= { 8, 4, 4 },
> +		.num_planes	= 3,
> +		.num_cplanes = 1,
> +	},
> +	{
> +		.format	= V4L2_PIX_FMT_NV12M,
> +		.mdp_color	= DIP_MCOLOR_NV12,
> +		.depth		= { 8, 4 },
> +		.row_depth	= { 8, 8 },
> +		.num_planes	= 2,
> +		.num_cplanes = 1,
> +	}
> +};
> +
> +static const struct mtk_dip_dev_format img2_fmts[] = {
> +	{
> +		.format = V4L2_PIX_FMT_YUYV,
> +		.mdp_color = DIP_MCOLOR_YUYV,
> +		.depth = { 16 },
> +		.row_depth = { 16 },
> +		.num_planes = 1,
> +		.num_cplanes = 1,
> +	},
> +};
> +
> +static const struct mtk_dip_dev_format img3_fmts[] = {
> +	{
> +		.format = V4L2_PIX_FMT_VYUY,
> +		.mdp_color = DIP_MCOLOR_VYUY,
> +		.depth = { 16 },
> +		.row_depth = { 16 },
> +		.num_planes = 1,
> +		.num_cplanes = 1,
> +	},
> +	{
> +		.format = V4L2_PIX_FMT_YUYV,
> +		.mdp_color = DIP_MCOLOR_YUYV,
> +		.depth = { 16 },
> +		.row_depth = { 16 },
> +		.num_planes = 1,
> +		.num_cplanes = 1,
> +	},
> +	{
> +		.format = V4L2_PIX_FMT_YVYU,
> +		.mdp_color = DIP_MCOLOR_YVYU,
> +		.depth = { 16 },
> +		.row_depth = { 16 },
> +		.num_planes = 1,
> +		.num_cplanes = 1,
> +	},
> +	{
> +		.format = V4L2_PIX_FMT_YVU420,
> +		.mdp_color = DIP_MCOLOR_YV12,
> +		.depth = { 12 },
> +		.row_depth = { 8 },
> +		.num_planes = 1,
> +		.num_cplanes = 3,
> +	},
> +	{
> +		.format = V4L2_PIX_FMT_NV12,
> +		.mdp_color = DIP_MCOLOR_NV12,
> +		.depth = { 12 },
> +		.row_depth = { 8 },
> +		.num_planes = 1,
> +		.num_cplanes = 2,
> +	}
> +};
> +
> +static const struct v4l2_frmsizeenum in_frmsizeenum = {
> +	.type = V4L2_FRMSIZE_TYPE_CONTINUOUS,
> +	.stepwise.max_width = MTK_DIP_CAPTURE_MAX_WIDTH,
> +	.stepwise.min_width = MTK_DIP_CAPTURE_MIN_WIDTH,
> +	.stepwise.max_height = MTK_DIP_CAPTURE_MAX_HEIGHT,
> +	.stepwise.min_height = MTK_DIP_CAPTURE_MIN_HEIGHT,
> +	.stepwise.step_height = 1,
> +	.stepwise.step_width = 1,
> +};
> +
> +static const struct v4l2_frmsizeenum out_frmsizeenum = {
> +	.type = V4L2_FRMSIZE_TYPE_CONTINUOUS,
> +	.stepwise.max_width = MTK_DIP_OUTPUT_MAX_WIDTH,
> +	.stepwise.min_width = MTK_DIP_OUTPUT_MIN_WIDTH,
> +	.stepwise.max_height = MTK_DIP_OUTPUT_MAX_HEIGHT,
> +	.stepwise.min_height = MTK_DIP_OUTPUT_MIN_HEIGHT,
> +	.stepwise.step_height = 1,
> +	.stepwise.step_width = 1,
> +};
> +
> +static const struct mtk_dip_video_device_desc
> +queues_setting[MTK_DIP_VIDEO_NODE_ID_TOTAL_NUM] = {
> +	{
> +		.id = MTK_DIP_VIDEO_NODE_ID_RAW_OUT,
> +		.name = "Raw Input",
> +		.cap = V4L2_CAP_VIDEO_OUTPUT_MPLANE | V4L2_CAP_STREAMING,
> +		.buf_type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
> +		.smem_alloc = 0,
> +		.flags = MEDIA_LNK_FL_ENABLED,
> +		.fmts = in_fmts,
> +		.num_fmts = ARRAY_SIZE(in_fmts),
> +		.default_fmt_idx = 4,
> +		.default_width = MTK_DIP_OUTPUT_MAX_WIDTH,
> +		.default_height = MTK_DIP_OUTPUT_MAX_HEIGHT,
> +		.dma_port = 0,
> +		.frmsizeenum = &in_frmsizeenum,
> +		.ops = &mtk_dip_v4l2_video_out_ioctl_ops,
> +		.vb2_ops = &mtk_dip_vb2_video_ops,
> +		.description = "Main image source",
> +	},
> +	{
> +		.id = MTK_DIP_VIDEO_NODE_ID_TUNING_OUT,
> +		.name = "Tuning",
> +		.cap = V4L2_CAP_META_OUTPUT | V4L2_CAP_STREAMING,
> +		.buf_type = V4L2_BUF_TYPE_META_OUTPUT,
> +		.smem_alloc = 1,
> +		.flags = 0,
> +		.fmts = fw_param_fmts,
> +		.num_fmts = ARRAY_SIZE(fw_param_fmts),
> +		.default_fmt_idx = 0,
> +		.dma_port = 0,
> +		.frmsizeenum = &in_frmsizeenum,
> +		.ops = &mtk_dip_v4l2_meta_out_ioctl_ops,
> +		.vb2_ops = &mtk_dip_vb2_meta_ops,
> +		.description = "Tuning data",
> +	},
> +	{
> +		.id = MTK_DIP_VIDEO_NODE_ID_NR_OUT,
> +		.name = "NR Input",
> +		.cap = V4L2_CAP_VIDEO_OUTPUT_MPLANE | V4L2_CAP_STREAMING,
> +		.buf_type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
> +		.smem_alloc = 0,
> +		.flags = MEDIA_LNK_FL_DYNAMIC,
> +		.fmts = img3_fmts,
> +		.num_fmts = ARRAY_SIZE(img3_fmts),
> +		.default_fmt_idx = 1,
> +		.default_width = MTK_DIP_CAPTURE_MAX_WIDTH,
> +		.default_height = MTK_DIP_CAPTURE_MAX_HEIGHT,
> +		.dma_port = 1,
> +		.vb2_ops = &mtk_dip_vb2_video_ops,
> +		.frmsizeenum = &in_frmsizeenum,
> +		.ops = &mtk_dip_v4l2_video_out_ioctl_ops,
> +		.vb2_ops = &mtk_dip_vb2_video_ops,
> +		.description = "NR image source",
> +	},
> +	{
> +		.id = MTK_DIP_VIDEO_NODE_ID_SHADING_OUT,
> +		.name = "Shading",
> +		.cap = V4L2_CAP_VIDEO_OUTPUT_MPLANE | V4L2_CAP_STREAMING,
> +		.buf_type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
> +		.smem_alloc = 0,
> +		.flags = MEDIA_LNK_FL_DYNAMIC,
> +		.fmts = lcei_fmts,
> +		.num_fmts = ARRAY_SIZE(lcei_fmts),
> +		.default_fmt_idx = 0,
> +		.default_width = MTK_DIP_CAPTURE_MAX_WIDTH,
> +		.default_height = MTK_DIP_CAPTURE_MAX_HEIGHT,
> +		.dma_port = 2,
> +		.frmsizeenum = &in_frmsizeenum,
> +		.ops = &mtk_dip_v4l2_video_out_ioctl_ops,
> +		.vb2_ops = &mtk_dip_vb2_video_ops,
> +		.description = "Shading image source",
> +	},
> +	{
> +		.id = MTK_DIP_VIDEO_NODE_ID_MDP0_CAPTURE,
> +		.name = "MDP0",
> +		.cap = V4L2_CAP_VIDEO_CAPTURE_MPLANE | V4L2_CAP_STREAMING,
> +		.buf_type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
> +		.smem_alloc = 0,
> +		.supports_ctrls = true,
> +		.flags = MEDIA_LNK_FL_DYNAMIC,
> +		.fmts = mdp_fmts,
> +		.num_fmts = ARRAY_SIZE(mdp_fmts),
> +		.default_fmt_idx = 1,
> +		.default_width = MTK_DIP_CAPTURE_MAX_WIDTH,
> +		.default_height = MTK_DIP_CAPTURE_MAX_HEIGHT,
> +		.dma_port = 0,
> +		.frmsizeenum = &out_frmsizeenum,
> +		.ops = &mtk_dip_v4l2_video_cap_ioctl_ops,
> +		.vb2_ops = &mtk_dip_vb2_video_ops,
> +		.description = "Output quality enhanced image",
> +	},
> +	{
> +		.id = MTK_DIP_VIDEO_NODE_ID_MDP1_CAPTURE,
> +		.name = "MDP1",
> +		.cap = V4L2_CAP_VIDEO_CAPTURE_MPLANE | V4L2_CAP_STREAMING,
> +		.buf_type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
> +		.smem_alloc = 0,
> +		.flags = MEDIA_LNK_FL_DYNAMIC,
> +		.fmts = mdp_fmts,
> +		.num_fmts = ARRAY_SIZE(mdp_fmts),
> +		.default_fmt_idx = 1,
> +		.default_width = MTK_DIP_CAPTURE_MAX_WIDTH,
> +		.default_height = MTK_DIP_CAPTURE_MAX_HEIGHT,
> +		.dma_port = 0,
> +		.frmsizeenum = &out_frmsizeenum,
> +		.ops = &mtk_dip_v4l2_video_cap_ioctl_ops,
> +		.vb2_ops = &mtk_dip_vb2_video_ops,
> +		.description = "Output quality enhanced image",
> +
> +	},
> +	{
> +		.id = MTK_DIP_VIDEO_NODE_ID_IMG2_CAPTURE,
> +		.name = "IMG2",
> +		.cap = V4L2_CAP_VIDEO_CAPTURE_MPLANE | V4L2_CAP_STREAMING,
> +		.buf_type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
> +		.smem_alloc = 0,
> +		.flags = MEDIA_LNK_FL_DYNAMIC,
> +		.fmts = img2_fmts,
> +		.num_fmts = ARRAY_SIZE(img2_fmts),
> +		.default_fmt_idx = 0,
> +		.default_width = MTK_DIP_CAPTURE_MAX_WIDTH,
> +		.default_height = MTK_DIP_CAPTURE_MAX_WIDTH,
> +		.dma_port = 1,
> +		.frmsizeenum = &out_frmsizeenum,
> +		.ops = &mtk_dip_v4l2_video_cap_ioctl_ops,
> +		.vb2_ops = &mtk_dip_vb2_video_ops,
> +		.description = "Output quality enhanced image",
> +	},
> +	{
> +		.id = MTK_DIP_VIDEO_NODE_ID_IMG3_CAPTURE,
> +		.name = "IMG3",
> +		.cap = V4L2_CAP_VIDEO_CAPTURE_MPLANE | V4L2_CAP_STREAMING,
> +		.buf_type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
> +		.smem_alloc = 0,
> +		.flags = MEDIA_LNK_FL_DYNAMIC,
> +		.fmts = img3_fmts,
> +		.num_fmts = ARRAY_SIZE(img3_fmts),
> +		.default_fmt_idx = 1,
> +		.default_width = MTK_DIP_CAPTURE_MAX_WIDTH,
> +		.default_height = MTK_DIP_CAPTURE_MAX_WIDTH,
> +		.dma_port = 2,
> +		.frmsizeenum = &out_frmsizeenum,
> +		.ops = &mtk_dip_v4l2_video_cap_ioctl_ops,
> +		.vb2_ops = &mtk_dip_vb2_video_ops,
> +		.description = "Output quality enhanced image",
> +
> +	},
> +
> +};
> +
> +static const struct mtk_dip_pipe_desc
> +pipe_settings[MTK_DIP_PIPE_ID_TOTAL_NUM] = {
> +	{
> +		.name = "preview",
> +		.id = MTK_DIP_PIPE_ID_PREVIEW,
> +		.queue_descs = queues_setting,
> +		.total_queues = ARRAY_SIZE(queues_setting),
> +	},
> +	{
> +		.name = "capture",
> +		.id = MTK_DIP_PIPE_ID_CAPTURE,
> +		.queue_descs = queues_setting,
> +		.total_queues = ARRAY_SIZE(queues_setting),
> +
> +	},
> +	{
> +		.name = "reprocess",
> +		.id = MTK_DIP_PIPE_ID_REPROCESS,
> +		.queue_descs = queues_setting,
> +		.total_queues = ARRAY_SIZE(queues_setting),
> +	},
> +};
> +
> +static void mtk_dip_dev_media_unregister(struct mtk_dip_dev *dip_dev)
> +{
> +	media_device_unregister(&dip_dev->mdev);
> +	media_device_cleanup(&dip_dev->mdev);
> +}
> +
> +static int mtk_dip_dev_v4l2_init(struct mtk_dip_dev *dip_dev)
> +{
> +	struct media_device *media_dev = &dip_dev->mdev;
> +	struct v4l2_device *v4l2_dev = &dip_dev->v4l2_dev;
> +	int i;
> +	int ret;
> +
> +	ret = mtk_dip_dev_media_register(dip_dev->dev, media_dev);
> +	if (ret) {
> +		dev_err(dip_dev->dev,
> +			"%s: media device register failed(%d)\n",
> +			__func__, ret);
> +		return ret;
> +	}
> +
> +	v4l2_dev->mdev = media_dev;
> +	v4l2_dev->ctrl_handler = NULL;
> +
> +	ret = v4l2_device_register(dip_dev->dev, v4l2_dev);
> +	if (ret) {
> +		dev_err(dip_dev->dev,
> +			"%s: v4l2 device register failed(%d)\n",
> +			__func__, ret);
> +		goto err_release_media_device;
> +	}
> +
> +	for (i = 0; i < MTK_DIP_PIPE_ID_TOTAL_NUM; i++) {
> +		ret = mtk_dip_pipe_init(dip_dev, &dip_dev->dip_pipe[i],
> +					&pipe_settings[i]);
> +		if (ret) {
> +			dev_err(dip_dev->dev,
> +				"%s: Pipe id(%d) init failed(%d)\n",
> +				dip_dev->dip_pipe[i].desc->name,
> +				i, ret);
> +			goto err_release_pipe;
> +		}
> +	}
> +
> +	ret = v4l2_device_register_subdev_nodes(&dip_dev->v4l2_dev);
> +	if (ret) {
> +		dev_err(dip_dev->dev,
> +			"failed to register subdevs (%d)\n", ret);
> +		goto err_release_pipe;
> +	}
> +
> +	return 0;
> +
> +err_release_pipe:
> +	for (i--; i >= 0; i--)
> +		mtk_dip_pipe_release(&dip_dev->dip_pipe[i]);
> +
> +	v4l2_device_unregister(v4l2_dev);
> +
> +err_release_media_device:
> +	mtk_dip_dev_media_unregister(dip_dev);
> +
> +	return ret;
> +}
> +
> +void mtk_dip_dev_v4l2_release(struct mtk_dip_dev *dip_dev)
> +{
> +	int i;
> +
> +	for (i = 0; i < MTK_DIP_PIPE_ID_TOTAL_NUM; i++)
> +		mtk_dip_pipe_release(&dip_dev->dip_pipe[i]);
> +
> +	v4l2_device_unregister(&dip_dev->v4l2_dev);
> +	media_device_unregister(&dip_dev->mdev);
> +	media_device_cleanup(&dip_dev->mdev);
> +}
> +
> +static int mtk_dip_res_init(struct platform_device *pdev,
> +			    struct mtk_dip_dev *dip_dev)
> +{
> +	int ret;
> +
> +	dip_dev->mdp_pdev = mdp_get_plat_device(pdev);
> +	if (!dip_dev->mdp_pdev) {
> +		dev_err(dip_dev->dev,
> +			"%s: failed to get MDP device\n",
> +			__func__);
> +		return -EINVAL;
> +	}
> +
> +	dip_dev->mdpcb_wq =
> +		alloc_ordered_workqueue("%s",
> +					__WQ_LEGACY | WQ_MEM_RECLAIM |
> +					WQ_FREEZABLE,
> +					"mdp_callback");
> +	if (!dip_dev->mdpcb_wq) {
> +		dev_err(dip_dev->dev,
> +			"%s: unable to alloc mdpcb workqueue\n", __func__);
> +		ret = -ENOMEM;
> +		goto destroy_mdpcb_wq;
> +	}
> +
> +	dip_dev->composer_wq =
> +		alloc_ordered_workqueue("%s",
> +					__WQ_LEGACY | WQ_MEM_RECLAIM |
> +					WQ_FREEZABLE,
> +					"dip_composer");
> +	if (!dip_dev->composer_wq) {
> +		dev_err(dip_dev->dev,
> +			"%s: unable to alloc composer workqueue\n", __func__);
> +		ret = -ENOMEM;
> +		goto destroy_dip_composer_wq;
> +	}
> +
> +	dip_dev->mdp_wq =
> +		alloc_ordered_workqueue("%s",
> +					__WQ_LEGACY | WQ_MEM_RECLAIM |
> +					WQ_FREEZABLE,
> +					"dip_runner");
> +	if (!dip_dev->mdp_wq) {
> +		dev_err(dip_dev->dev,
> +			"%s: unable to alloc dip_runner\n", __func__);
> +		ret = -ENOMEM;
> +		goto destroy_dip_runner_wq;
> +	}
> +
> +	init_waitqueue_head(&dip_dev->flushing_waitq);
> +
> +	return 0;
> +
> +destroy_dip_runner_wq:
> +	destroy_workqueue(dip_dev->mdp_wq);
> +
> +destroy_dip_composer_wq:
> +	destroy_workqueue(dip_dev->composer_wq);
> +
> +destroy_mdpcb_wq:
> +	destroy_workqueue(dip_dev->mdpcb_wq);
> +
> +	return ret;
> +}
> +
> +static void mtk_dip_res_release(struct mtk_dip_dev *dip_dev)
> +{
> +	flush_workqueue(dip_dev->mdp_wq);
> +	destroy_workqueue(dip_dev->mdp_wq);
> +	dip_dev->mdp_wq = NULL;
> +
> +	flush_workqueue(dip_dev->mdpcb_wq);
> +	destroy_workqueue(dip_dev->mdpcb_wq);
> +	dip_dev->mdpcb_wq = NULL;
> +
> +	flush_workqueue(dip_dev->composer_wq);
> +	destroy_workqueue(dip_dev->composer_wq);
> +	dip_dev->composer_wq = NULL;
> +
> +	atomic_set(&dip_dev->num_composing, 0);
> +	atomic_set(&dip_dev->dip_enqueue_cnt, 0);
> +}
> +
> +static int mtk_dip_probe(struct platform_device *pdev)
> +{
> +	struct mtk_dip_dev *dip_dev;
> +	phandle rproc_phandle;
> +	int ret;
> +
> +	dip_dev = devm_kzalloc(&pdev->dev, sizeof(*dip_dev), GFP_KERNEL);
> +	if (!dip_dev)
> +		return -ENOMEM;
> +
> +	dip_dev->dev = &pdev->dev;
> +	dev_set_drvdata(&pdev->dev, dip_dev);
> +	dip_dev->dip_stream_cnt = 0;
> +	dip_dev->clks[0].id = "larb5";
> +	dip_dev->clks[1].id = "dip";
> +	dip_dev->num_clks = ARRAY_SIZE(dip_dev->clks);
> +	ret = devm_clk_bulk_get(&pdev->dev, dip_dev->num_clks, dip_dev->clks);
> +	if (ret) {
> +		dev_err(&pdev->dev, "Failed to get LARB5 and DIP clks:%d\n",
> +			ret);
> +		return ret;
> +	}
> +
> +	dip_dev->scp_pdev = scp_get_pdev(pdev);
> +	if (!dip_dev->scp_pdev) {
> +		dev_err(dip_dev->dev,
> +			"%s: failed to get scp device\n",
> +			__func__);
> +		return -EINVAL;
> +	}
> +
> +	if (of_property_read_u32(dip_dev->dev->of_node, "mediatek,scp",
> +				 &rproc_phandle)) {
> +		dev_err(dip_dev->dev,
> +			"%s: could not get scp device\n",
> +			__func__);
> +		return -EINVAL;
> +	}
> +
> +	dip_dev->rproc_handle = rproc_get_by_phandle(rproc_phandle);
> +	if (!dip_dev->rproc_handle) {
> +		dev_err(dip_dev->dev,
> +			"%s: could not get DIP's rproc_handle\n",
> +			__func__);
> +		return -EINVAL;
> +	}
> +
> +	atomic_set(&dip_dev->dip_enqueue_cnt, 0);
> +	atomic_set(&dip_dev->num_composing, 0);
> +	mutex_init(&dip_dev->hw_op_lock);
> +	/* Limited by the co-processor side's stack size */
> +	sema_init(&dip_dev->sem, DIP_COMPOSING_MAX_NUM);
> +
> +	ret = mtk_dip_hw_working_buf_pool_init(dip_dev);
> +	if (ret) {
> +		dev_err(&pdev->dev, "working buffer init failed(%d)\n", ret);
> +		return ret;
> +	}
> +
> +	ret = mtk_dip_dev_v4l2_init(dip_dev);
> +	if (ret) {
> +		mtk_dip_hw_working_buf_pool_release(dip_dev);
> +		dev_err(&pdev->dev, "v4l2 init failed(%d)\n", ret);
> +
> +		goto err_release_working_buf_pool;
> +	}
> +
> +	ret = mtk_dip_res_init(pdev, dip_dev);
> +	if (ret) {
> +		dev_err(dip_dev->dev,
> +			"%s: mtk_dip_res_init failed(%d)\n", __func__, ret);
> +
> +		ret = -EBUSY;
> +		goto err_release_deinit_v4l2;
> +	}
> +
> +	pm_runtime_set_autosuspend_delay(&pdev->dev, 1000 / 30 *
> +					 DIP_COMPOSING_MAX_NUM * 3 *
> +					 USEC_PER_MSEC);
> +	pm_runtime_use_autosuspend(&pdev->dev);
> +	pm_runtime_enable(&pdev->dev);
> +
> +	return 0;
> +
> +err_release_deinit_v4l2:
> +	mtk_dip_dev_v4l2_release(dip_dev);
> +err_release_working_buf_pool:
> +	mtk_dip_hw_working_buf_pool_release(dip_dev);
> +
> +	return ret;
> +}
> +
> +static int mtk_dip_remove(struct platform_device *pdev)
> +{
> +	struct mtk_dip_dev *dip_dev = dev_get_drvdata(&pdev->dev);
> +
> +	mtk_dip_res_release(dip_dev);
> +	pm_runtime_disable(&pdev->dev);
> +	mtk_dip_dev_v4l2_release(dip_dev);
> +	mtk_dip_hw_working_buf_pool_release(dip_dev);
> +	mutex_destroy(&dip_dev->hw_op_lock);
> +
> +	return 0;
> +}
> +
> +static int __maybe_unused mtk_dip_runtime_suspend(struct device *dev)
> +{
> +	struct mtk_dip_dev *dip_dev = dev_get_drvdata(dev);
> +
> +	rproc_shutdown(dip_dev->rproc_handle);
> +	clk_bulk_disable_unprepare(dip_dev->num_clks,
> +				   dip_dev->clks);
> +
> +	return 0;
> +}
> +
> +static int __maybe_unused mtk_dip_runtime_resume(struct device *dev)
> +{
> +	struct mtk_dip_dev *dip_dev = dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret = clk_bulk_prepare_enable(dip_dev->num_clks,
> +				      dip_dev->clks);
> +	if (ret) {
> +		dev_err(dip_dev->dev,
> +			"%s: failed to enable dip clks(%d)\n",
> +			__func__, ret);
> +		return ret;
> +	}
> +
> +	ret = rproc_boot(dip_dev->rproc_handle);
> +	if (ret) {
> +		dev_err(dev, "%s: FW load failed(rproc:%p):%d\n",
> +			__func__, dip_dev->rproc_handle,	ret);
> +		clk_bulk_disable_unprepare(dip_dev->num_clks,
> +					   dip_dev->clks);
> +
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int __maybe_unused mtk_dip_pm_suspend(struct device *dev)
> +{
> +	struct mtk_dip_dev *dip_dev = dev_get_drvdata(dev);
> +	int ret, num;
> +
> +	if (pm_runtime_suspended(dev))
> +		return 0;
> +
> +	ret = wait_event_timeout
> +		(dip_dev->flushing_waitq,
> +		 !(num = atomic_read(&dip_dev->num_composing)),
> +		 msecs_to_jiffies(1000 / 30 * DIP_COMPOSING_MAX_NUM * 3));
> +	if (!ret && num) {
> +		dev_err(dev, "%s: flushing SCP job timeout, num(%d)\n",
> +			__func__, num);
> +
> +		return -EBUSY;
> +	}
> +
> +	ret = pm_runtime_force_suspend(dev);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +static int __maybe_unused mtk_dip_pm_resume(struct device *dev)
> +{
> +	int ret;
> +
> +	if (pm_runtime_suspended(dev))
> +		return 0;
> +
> +	ret = pm_runtime_force_resume(dev);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +static const struct dev_pm_ops mtk_dip_pm_ops = {
> +	SET_SYSTEM_SLEEP_PM_OPS(mtk_dip_pm_suspend, mtk_dip_pm_resume)
> +	SET_RUNTIME_PM_OPS(mtk_dip_runtime_suspend, mtk_dip_runtime_resume,
> +			   NULL)
> +};
> +
> +static const struct of_device_id mtk_dip_of_match[] = {
> +	{ .compatible = "mediatek,mt8183-dip", },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, mtk_dip_of_match);
> +
> +static struct platform_driver mtk_dip_driver = {
> +	.probe   = mtk_dip_probe,
> +	.remove  = mtk_dip_remove,
> +	.driver  = {
> +		.name = "mtk-cam-dip",
> +		.pm = &mtk_dip_pm_ops,
> +		.of_match_table = of_match_ptr(mtk_dip_of_match),
> +	}
> +};
> +
> +module_platform_driver(mtk_dip_driver);
> +
> +MODULE_AUTHOR("Frederic Chen <frederic.chen@mediatek.com>");
> +MODULE_LICENSE("GPL v2");
> +MODULE_DESCRIPTION("Mediatek DIP driver");
> +
> 
> 
