Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3380C76A8EC
	for <lists+linux-media@lfdr.de>; Tue,  1 Aug 2023 08:24:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231587AbjHAGYG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Aug 2023 02:24:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231589AbjHAGXb (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 1 Aug 2023 02:23:31 -0400
Received: from fd01.gateway.ufhost.com (fd01.gateway.ufhost.com [61.152.239.71])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 539F31BFD;
        Mon, 31 Jul 2023 23:23:11 -0700 (PDT)
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
        (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
        (Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
        by fd01.gateway.ufhost.com (Postfix) with ESMTP id 2163E8008;
        Tue,  1 Aug 2023 14:23:09 +0800 (CST)
Received: from EXMBX073.cuchost.com (172.16.6.83) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 1 Aug
 2023 14:23:09 +0800
Received: from [192.168.1.218] (180.164.60.184) by EXMBX073.cuchost.com
 (172.16.6.83) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 1 Aug
 2023 14:23:08 +0800
Message-ID: <7c4e63e7-ce28-139f-373d-0fecca6839b9@starfivetech.com>
Date:   Tue, 1 Aug 2023 14:23:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v7 4/6] media: starfive: camss: Add video driver
Content-Language: en-US
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        <bryan.odonoghue@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Eugen Hristev <eugen.hristev@collabora.com>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
CC:     <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <changhuang.liang@starfivetech.com>
References: <20230619112838.19797-1-jack.zhu@starfivetech.com>
 <20230619112838.19797-5-jack.zhu@starfivetech.com>
 <8e381fd6-9475-88fc-9159-927f119a8b9c@xs4all.nl>
From:   Jack Zhu <jack.zhu@starfivetech.com>
In-Reply-To: <8e381fd6-9475-88fc-9159-927f119a8b9c@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [180.164.60.184]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX073.cuchost.com
 (172.16.6.83)
X-YovoleRuleAgent: yovoleflag
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

Thank you for your comments.

On 2023/7/27 16:49, Hans Verkuil wrote:
> On 19/06/2023 13:28, Jack Zhu wrote:
>> Add video driver for StarFive Camera Subsystem.
>> 
>> Signed-off-by: Jack Zhu <jack.zhu@starfivetech.com>
>> ---
>>  .../media/platform/starfive/camss/Makefile    |   4 +-
>>  .../media/platform/starfive/camss/stf_video.c | 724 ++++++++++++++++++
>>  .../media/platform/starfive/camss/stf_video.h |  92 +++
>>  3 files changed, 819 insertions(+), 1 deletion(-)
>>  create mode 100644 drivers/media/platform/starfive/camss/stf_video.c
>>  create mode 100644 drivers/media/platform/starfive/camss/stf_video.h
>> 
>> diff --git a/drivers/media/platform/starfive/camss/Makefile b/drivers/media/platform/starfive/camss/Makefile
>> index d56ddd078a71..eb457917a914 100644
>> --- a/drivers/media/platform/starfive/camss/Makefile
>> +++ b/drivers/media/platform/starfive/camss/Makefile
>> @@ -3,6 +3,8 @@
>>  # Makefile for StarFive Camera Subsystem driver
>>  #
>>  
>> -starfive-camss-objs += stf_camss.o
>> +starfive-camss-objs += \
>> +		stf_camss.o \
>> +		stf_video.o
>>  
>>  obj-$(CONFIG_VIDEO_STARFIVE_CAMSS) += starfive-camss.o
>> diff --git a/drivers/media/platform/starfive/camss/stf_video.c b/drivers/media/platform/starfive/camss/stf_video.c
>> new file mode 100644
>> index 000000000000..2e6472fe51c6
>> --- /dev/null
>> +++ b/drivers/media/platform/starfive/camss/stf_video.c
>> @@ -0,0 +1,724 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * stf_video.c
>> + *
>> + * StarFive Camera Subsystem - V4L2 device node
>> + *
>> + * Copyright (C) 2021-2023 StarFive Technology Co., Ltd.
>> + */
>> +
>> +#include <linux/pm_runtime.h>
>> +#include <media/v4l2-ctrls.h>
>> +#include <media/v4l2-event.h>
>> +#include <media/v4l2-mc.h>
>> +#include <media/videobuf2-dma-contig.h>
>> +
>> +#include "stf_camss.h"
>> +#include "stf_video.h"
>> +
>> +static const struct stfcamss_format_info formats_pix_wr[] = {
>> +	{
>> +		.code = MEDIA_BUS_FMT_SRGGB10_1X10,
>> +		.pixelformat = V4L2_PIX_FMT_SRGGB10,
>> +		.planes = 1,
>> +		.vsub = { 1 },
>> +		.bpp = 10,
>> +	},
>> +	{
>> +		.code = MEDIA_BUS_FMT_SGRBG10_1X10,
>> +		.pixelformat = V4L2_PIX_FMT_SGRBG10,
>> +		.planes = 1,
>> +		.vsub = { 1 },
>> +		.bpp = 10,
>> +	},
>> +	{
>> +		.code = MEDIA_BUS_FMT_SGBRG10_1X10,
>> +		.pixelformat = V4L2_PIX_FMT_SGBRG10,
>> +		.planes = 1,
>> +		.vsub = { 1 },
>> +		.bpp = 10,
>> +	},
>> +	{
>> +		.code = MEDIA_BUS_FMT_SBGGR10_1X10,
>> +		.pixelformat = V4L2_PIX_FMT_SBGGR10,
>> +		.planes = 1,
>> +		.vsub = { 1 },
>> +		.bpp = 10,
>> +	},
>> +};
>> +
>> +static const struct stfcamss_format_info formats_pix_isp[] = {
>> +	{
>> +		.code = MEDIA_BUS_FMT_Y12_1X12,
>> +		.pixelformat = V4L2_PIX_FMT_NV12,
>> +		.planes = 2,
>> +		.vsub = { 1, 2 },
>> +		.bpp = 8,
>> +	},
>> +};
>> +
>> +/* -----------------------------------------------------------------------------
>> + * Helper functions
>> + */
>> +
>> +static int video_find_format(u32 code, u32 pixelformat,
>> +			     struct stfcamss_video *video)
>> +{
>> +	unsigned int i;
>> +
>> +	for (i = 0; i < video->nformats; ++i) {
>> +		if (video->formats[i].code == code &&
>> +		    video->formats[i].pixelformat == pixelformat)
>> +			return i;
>> +	}
>> +
>> +	for (i = 0; i < video->nformats; ++i)
>> +		if (video->formats[i].code == code)
>> +			return i;
>> +
>> +	for (i = 0; i < video->nformats; ++i)
>> +		if (video->formats[i].pixelformat == pixelformat)
>> +			return i;
>> +
>> +	return -EINVAL;
>> +}
>> +
>> +static int __video_try_fmt(struct stfcamss_video *video, struct v4l2_format *f)
>> +{
>> +	struct v4l2_pix_format *pix;
>> +	const struct stfcamss_format_info *fi;
>> +	u32 width, height;
>> +	u32 bpl;
>> +	unsigned int i;
>> +
>> +	pix = &f->fmt.pix;
>> +
>> +	for (i = 0; i < video->nformats; i++)
>> +		if (pix->pixelformat == video->formats[i].pixelformat)
>> +			break;
>> +
>> +	if (i == video->nformats)
>> +		i = 0; /* default format */
>> +
>> +	fi = &video->formats[i];
>> +	width = pix->width;
>> +	height = pix->height;
>> +
>> +	memset(pix, 0, sizeof(*pix));
>> +
>> +	pix->pixelformat = fi->pixelformat;
>> +	pix->width = clamp_t(u32, width, STFCAMSS_FRAME_MIN_WIDTH,
>> +			     STFCAMSS_FRAME_MAX_WIDTH);
>> +	pix->height = clamp_t(u32, height, STFCAMSS_FRAME_MIN_HEIGHT,
>> +			      STFCAMSS_FRAME_MAX_HEIGHT);
>> +	bpl = pix->width * fi->bpp / 8;
>> +	bpl = ALIGN(bpl, video->bpl_alignment);
>> +	pix->bytesperline = bpl;
>> +
>> +	for (i = 0; i < fi->planes; ++i)
>> +		pix->sizeimage += bpl * pix->height / fi->vsub[i];
>> +
>> +	pix->field = V4L2_FIELD_NONE;
>> +	pix->colorspace = V4L2_COLORSPACE_SRGB;
>> +	pix->flags = 0;
>> +	pix->ycbcr_enc =
>> +		V4L2_MAP_YCBCR_ENC_DEFAULT(pix->colorspace);
>> +	pix->quantization = V4L2_MAP_QUANTIZATION_DEFAULT(true,
>> +							  pix->colorspace,
>> +							  pix->ycbcr_enc);
>> +	pix->xfer_func = V4L2_MAP_XFER_FUNC_DEFAULT(pix->colorspace);
>> +
>> +	return 0;
>> +}
>> +
>> +static int stf_video_init_format(struct stfcamss_video *video)
>> +{
>> +	int ret;
>> +	struct v4l2_format format = {
>> +		.type = video->type,
>> +		.fmt.pix = {
>> +			.width = 1920,
>> +			.height = 1080,
>> +			.pixelformat = V4L2_PIX_FMT_RGB565,
>> +		},
>> +	};
>> +
>> +	ret = __video_try_fmt(video, &format);
>> +
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	video->active_fmt = format;
>> +
>> +	return 0;
>> +}
>> +
>> +/* -----------------------------------------------------------------------------
>> + * Video queue operations
>> + */
>> +
>> +static int video_queue_setup(struct vb2_queue *q,
>> +			     unsigned int *num_buffers,
>> +			     unsigned int *num_planes,
>> +			     unsigned int sizes[],
>> +			     struct device *alloc_devs[])
>> +{
>> +	struct stfcamss_video *video = vb2_get_drv_priv(q);
>> +	const struct v4l2_pix_format *format = &video->active_fmt.fmt.pix;
>> +
>> +	if (*num_planes) {
>> +		if (*num_planes != 1)
>> +			return -EINVAL;
>> +
>> +		if (sizes[0] < format->sizeimage)
>> +			return -EINVAL;
>> +	}
>> +
>> +	*num_planes = 1;
>> +	sizes[0] = format->sizeimage;
>> +	if (!sizes[0])
>> +		dev_err(video->stfcamss->dev,
>> +			"%s: error size is zero!!!\n", __func__);
>> +
>> +	dev_dbg(video->stfcamss->dev, "planes = %d, size = %d\n",
>> +		*num_planes, sizes[0]);
>> +
>> +	return 0;
>> +}
>> +
>> +static int video_buf_init(struct vb2_buffer *vb)
>> +{
>> +	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
>> +	struct stfcamss_video *video = vb2_get_drv_priv(vb->vb2_queue);
>> +	struct stfcamss_buffer *buffer =
>> +		container_of(vbuf, struct stfcamss_buffer, vb);
>> +	const struct v4l2_pix_format *fmt = &video->active_fmt.fmt.pix;
>> +	dma_addr_t *paddr;
>> +
>> +	paddr = vb2_plane_cookie(vb, 0);
>> +	buffer->addr[0] = *paddr;
>> +
>> +	if (fmt->pixelformat == V4L2_PIX_FMT_NV12 ||
>> +	    fmt->pixelformat == V4L2_PIX_FMT_NV21 ||
>> +	    fmt->pixelformat == V4L2_PIX_FMT_NV16 ||
>> +	    fmt->pixelformat == V4L2_PIX_FMT_NV61)
>> +		buffer->addr[1] =
>> +			buffer->addr[0] + fmt->bytesperline * fmt->height;
>> +
>> +	return 0;
>> +}
>> +
>> +static int video_buf_prepare(struct vb2_buffer *vb)
>> +{
>> +	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
>> +	struct stfcamss_video *video = vb2_get_drv_priv(vb->vb2_queue);
>> +	const struct v4l2_pix_format *fmt = &video->active_fmt.fmt.pix;
>> +
>> +	if (fmt->sizeimage > vb2_plane_size(vb, 0)) {
>> +		dev_err(video->stfcamss->dev,
>> +			"sizeimage = %d, plane size = %d\n",
>> +			fmt->sizeimage, (unsigned int)vb2_plane_size(vb, 0));
>> +		return -EINVAL;
>> +	}
>> +	vb2_set_plane_payload(vb, 0, fmt->sizeimage);
>> +
>> +	vbuf->field = V4L2_FIELD_NONE;
>> +
>> +	return 0;
>> +}
>> +
>> +static void video_buf_queue(struct vb2_buffer *vb)
>> +{
>> +	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
>> +	struct stfcamss_video *video = vb2_get_drv_priv(vb->vb2_queue);
>> +	struct stfcamss_buffer *buffer =
>> +		container_of(vbuf, struct stfcamss_buffer, vb);
>> +
>> +	video->ops->queue_buffer(video, buffer);
>> +}
>> +
>> +/*
>> + * video_mbus_to_pix - Convert v4l2_mbus_framefmt to v4l2_pix_format
>> + * @mbus: v4l2_mbus_framefmt format (input)
>> + * @pix: v4l2_pix_format_mplane format (output)
>> + * @f: a pointer to formats array element to be used for the conversion
>> + * @alignment: bytesperline alignment value
>> + *
>> + * Fill the output pix structure with information from the input mbus format.
>> + *
>> + * Return 0 on success or a negative error code otherwise
>> + */
>> +static int video_mbus_to_pix(const struct v4l2_mbus_framefmt *mbus,
>> +			     struct v4l2_pix_format *pix,
>> +			     const struct stfcamss_format_info *f,
>> +			     unsigned int alignment)
>> +{
>> +	u32 bytesperline;
>> +	unsigned int i;
>> +
>> +	memset(pix, 0, sizeof(*pix));
>> +	v4l2_fill_pix_format(pix, mbus);
>> +	pix->pixelformat = f->pixelformat;
>> +	bytesperline = pix->width * f->bpp / 8;
>> +	bytesperline = ALIGN(bytesperline, alignment);
>> +	pix->bytesperline = bytesperline;
>> +
>> +	for (i = 0; i < f->planes; ++i)
>> +		pix->sizeimage += bytesperline * pix->height / f->vsub[i];
>> +
>> +	return 0;
>> +}
>> +
>> +static struct v4l2_subdev *video_remote_subdev(struct stfcamss_video *video,
>> +					       u32 *pad)
>> +{
>> +	struct media_pad *remote;
>> +
>> +	remote = media_pad_remote_pad_first(&video->pad);
>> +
>> +	if (!remote || !is_media_entity_v4l2_subdev(remote->entity))
>> +		return NULL;
>> +
>> +	if (pad)
>> +		*pad = remote->index;
>> +
>> +	return media_entity_to_v4l2_subdev(remote->entity);
>> +}
>> +
>> +static int video_get_subdev_format(struct stfcamss_video *video,
>> +				   struct v4l2_format *format)
>> +{
>> +	struct v4l2_pix_format *pix = &video->active_fmt.fmt.pix;
>> +	struct v4l2_subdev_format fmt;
>> +	struct v4l2_subdev *subdev;
>> +	u32 pixelformat;
>> +	u32 pad;
>> +	int ret;
>> +
>> +	subdev = video_remote_subdev(video, &pad);
>> +	if (!subdev)
>> +		return -EPIPE;
>> +
>> +	fmt.pad = pad;
>> +	fmt.which = V4L2_SUBDEV_FORMAT_ACTIVE;
>> +
>> +	ret = v4l2_subdev_call(subdev, pad, get_fmt, NULL, &fmt);
>> +	if (ret)
>> +		return ret;
>> +
>> +	pixelformat = pix->pixelformat;
>> +	ret = video_find_format(fmt.format.code, pixelformat, video);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	format->type = video->type;
>> +
>> +	return video_mbus_to_pix(&fmt.format, &format->fmt.pix,
>> +				 &video->formats[ret], video->bpl_alignment);
>> +}
>> +
>> +static int video_check_format(struct stfcamss_video *video)
>> +{
>> +	struct v4l2_pix_format *pix = &video->active_fmt.fmt.pix;
>> +	struct v4l2_format format;
>> +	struct v4l2_pix_format *sd_pix = &format.fmt.pix;
>> +	int ret;
>> +
>> +	sd_pix->pixelformat = pix->pixelformat;
>> +	ret = video_get_subdev_format(video, &format);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	if (pix->pixelformat != sd_pix->pixelformat ||
>> +	    pix->height != sd_pix->height ||
>> +	    pix->width != sd_pix->width ||
>> +	    pix->field != format.fmt.pix.field) {
>> +		dev_err(video->stfcamss->dev,
>> +			"not match:\n"
>> +			"pixelformat: 0x%x <-> 0x%x\n"
>> +			"height: %d <-> %d\n"
>> +			"field: %d <-> %d\n",
>> +			pix->pixelformat, sd_pix->pixelformat,
>> +			pix->height, sd_pix->height,
>> +			pix->field, format.fmt.pix.field);
>> +		return -EPIPE;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int video_start_streaming(struct vb2_queue *q, unsigned int count)
>> +{
>> +	struct stfcamss_video *video = vb2_get_drv_priv(q);
>> +	struct video_device *vdev = &video->vdev;
>> +	struct media_entity *entity;
>> +	struct media_pad *pad;
>> +	struct v4l2_subdev *subdev;
>> +	int ret;
>> +
>> +	ret = video_device_pipeline_start(vdev, &video->stfcamss->pipe);
>> +	if (ret < 0) {
>> +		dev_err(video->stfcamss->dev,
>> +			"Failed to media_pipeline_start: %d\n", ret);
> 
> This doesn't call flush_buffers to return the buffers back to the QUEUED state.
> 
> You do that correctly elsewhere in this function, but you missed this case.
> 

OK, I will fix it.

>> +		return ret;
>> +	}
>> +
>> +	ret = video_check_format(video);
>> +	if (ret < 0)
>> +		goto error;
>> +
>> +	ret = pm_runtime_resume_and_get(video->stfcamss->dev);
>> +	if (ret < 0) {
>> +		dev_err(video->stfcamss->dev, "power up failed %d\n", ret);
>> +		goto error;
>> +	}
>> +
>> +	entity = &vdev->entity;
>> +	while (1) {
>> +		pad = &entity->pads[0];
>> +		if (!(pad->flags & MEDIA_PAD_FL_SINK))
>> +			break;
>> +
>> +		pad = media_pad_remote_pad_first(pad);
>> +		if (!pad || !is_media_entity_v4l2_subdev(pad->entity))
>> +			break;
>> +
>> +		entity = pad->entity;
>> +		subdev = media_entity_to_v4l2_subdev(entity);
>> +
>> +		ret = v4l2_subdev_call(subdev, video, s_stream, 1);
>> +		if (ret < 0 && ret != -ENOIOCTLCMD)
>> +			goto err_pm_put;
>> +	}
>> +	return 0;
>> +
>> +err_pm_put:
>> +	pm_runtime_put(video->stfcamss->dev);
>> +error:
>> +	video_device_pipeline_stop(vdev);
>> +	video->ops->flush_buffers(video, VB2_BUF_STATE_QUEUED);
>> +	return ret;
>> +}
>> +
>> +static void video_stop_streaming(struct vb2_queue *q)
>> +{
>> +	struct stfcamss_video *video = vb2_get_drv_priv(q);
>> +	struct video_device *vdev = &video->vdev;
>> +	struct media_entity *entity;
>> +	struct media_pad *pad;
>> +	struct v4l2_subdev *subdev;
>> +	int ret;
>> +
>> +	entity = &vdev->entity;
>> +	while (1) {
>> +		pad = &entity->pads[0];
>> +		if (!(pad->flags & MEDIA_PAD_FL_SINK))
>> +			break;
>> +
>> +		pad = media_pad_remote_pad_first(pad);
>> +		if (!pad || !is_media_entity_v4l2_subdev(pad->entity))
>> +			break;
>> +
>> +		entity = pad->entity;
>> +		subdev = media_entity_to_v4l2_subdev(entity);
>> +
>> +		v4l2_subdev_call(subdev, video, s_stream, 0);
>> +	}
>> +
>> +	ret = pm_runtime_put(video->stfcamss->dev);
>> +	if (ret < 0)
>> +		dev_err(video->stfcamss->dev, "power down failed:%d\n", ret);
>> +
>> +	video_device_pipeline_stop(vdev);
>> +	video->ops->flush_buffers(video, VB2_BUF_STATE_ERROR);
>> +}
>> +
>> +static const struct vb2_ops stf_video_vb2_q_ops = {
>> +	.queue_setup     = video_queue_setup,
>> +	.wait_prepare    = vb2_ops_wait_prepare,
>> +	.wait_finish     = vb2_ops_wait_finish,
>> +	.buf_init        = video_buf_init,
>> +	.buf_prepare     = video_buf_prepare,
>> +	.buf_queue       = video_buf_queue,
>> +	.start_streaming = video_start_streaming,
>> +	.stop_streaming  = video_stop_streaming,
>> +};
>> +
>> +/* -----------------------------------------------------------------------------
>> + * V4L2 ioctls
>> + */
>> +
>> +static int video_querycap(struct file *file, void *fh,
>> +			  struct v4l2_capability *cap)
>> +{
>> +	strscpy(cap->driver, "stf camss", sizeof(cap->driver));
>> +	strscpy(cap->card, "Starfive Camera Subsystem", sizeof(cap->card));
>> +
>> +	return 0;
>> +}
>> +
>> +static int video_get_pfmt_by_index(struct stfcamss_video *video, int ndx)
>> +{
>> +	int i, j, k;
>> +
>> +	/* find index "i" of "k"th unique pixelformat in formats array */
>> +	k = -1;
>> +	for (i = 0; i < video->nformats; i++) {
>> +		for (j = 0; j < i; j++) {
>> +			if (video->formats[i].pixelformat ==
>> +			    video->formats[j].pixelformat)
>> +				break;
>> +		}
>> +
>> +		if (j == i)
>> +			k++;
>> +
>> +		if (k == ndx)
>> +			return i;
>> +	}
>> +
>> +	return -EINVAL;
>> +}
>> +
>> +static int video_get_pfmt_by_mcode(struct stfcamss_video *video, u32 mcode)
>> +{
>> +	int i;
>> +
>> +	for (i = 0; i < video->nformats; i++) {
>> +		if (video->formats[i].code == mcode)
>> +			return i;
>> +	}
>> +
>> +	return -EINVAL;
>> +}
>> +
>> +static int video_enum_fmt(struct file *file, void *fh, struct v4l2_fmtdesc *f)
>> +{
>> +	struct stfcamss_video *video = video_drvdata(file);
>> +	int i;
>> +
>> +	if (f->type != video->type)
>> +		return -EINVAL;
>> +	if (f->index >= video->nformats)
>> +		return -EINVAL;
>> +
>> +	if (f->mbus_code) {
>> +		/* Each entry in formats[] table has unique mbus_code */
>> +		if (f->index > 0)
>> +			return -EINVAL;
>> +
>> +		i = video_get_pfmt_by_mcode(video, f->mbus_code);
>> +	} else {
>> +		i = video_get_pfmt_by_index(video, f->index);
>> +	}
>> +
>> +	if (i < 0)
>> +		return -EINVAL;
>> +
>> +	f->pixelformat = video->formats[i].pixelformat;
>> +
>> +	return 0;
>> +}
>> +
>> +static int video_enum_framesizes(struct file *file, void *fh,
>> +				 struct v4l2_frmsizeenum *fsize)
>> +{
>> +	struct stfcamss_video *video = video_drvdata(file);
>> +	int i;
>> +
>> +	if (fsize->index)
>> +		return -EINVAL;
>> +
>> +	for (i = 0; i < video->nformats; i++) {
>> +		if (video->formats[i].pixelformat == fsize->pixel_format)
>> +			break;
>> +	}
>> +
>> +	if (i == video->nformats)
>> +		return -EINVAL;
>> +
>> +	fsize->type = V4L2_FRMSIZE_TYPE_CONTINUOUS;
>> +	fsize->stepwise.min_width = STFCAMSS_FRAME_MIN_WIDTH;
>> +	fsize->stepwise.max_width = STFCAMSS_FRAME_MAX_WIDTH;
>> +	fsize->stepwise.min_height = STFCAMSS_FRAME_MIN_HEIGHT;
>> +	fsize->stepwise.max_height = STFCAMSS_FRAME_MAX_HEIGHT;
>> +	fsize->stepwise.step_width = 1;
>> +	fsize->stepwise.step_height = 1;
>> +
>> +	return 0;
>> +}
>> +
>> +static int video_g_fmt(struct file *file, void *fh, struct v4l2_format *f)
>> +{
>> +	struct stfcamss_video *video = video_drvdata(file);
>> +
>> +	*f = video->active_fmt;
>> +
>> +	return 0;
>> +}
>> +
>> +static int video_s_fmt(struct file *file, void *fh, struct v4l2_format *f)
>> +{
>> +	struct stfcamss_video *video = video_drvdata(file);
>> +	int ret;
>> +
>> +	if (vb2_is_busy(&video->vb2_q))
>> +		return -EBUSY;
>> +
>> +	ret = __video_try_fmt(video, f);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	video->active_fmt = *f;
>> +
>> +	return 0;
>> +}
>> +
>> +static int video_try_fmt(struct file *file, void *fh, struct v4l2_format *f)
>> +{
>> +	struct stfcamss_video *video = video_drvdata(file);
>> +
>> +	return __video_try_fmt(video, f);
>> +}
>> +
>> +static const struct v4l2_ioctl_ops stf_vid_ioctl_ops = {
>> +	.vidioc_querycap                = video_querycap,
>> +	.vidioc_enum_fmt_vid_cap        = video_enum_fmt,
>> +	.vidioc_enum_fmt_vid_out        = video_enum_fmt,
>> +	.vidioc_enum_framesizes         = video_enum_framesizes,
>> +	.vidioc_g_fmt_vid_cap           = video_g_fmt,
>> +	.vidioc_s_fmt_vid_cap           = video_s_fmt,
>> +	.vidioc_try_fmt_vid_cap         = video_try_fmt,
>> +	.vidioc_g_fmt_vid_out           = video_g_fmt,
>> +	.vidioc_s_fmt_vid_out           = video_s_fmt,
>> +	.vidioc_try_fmt_vid_out         = video_try_fmt,
>> +	.vidioc_reqbufs                 = vb2_ioctl_reqbufs,
>> +	.vidioc_querybuf                = vb2_ioctl_querybuf,
>> +	.vidioc_qbuf                    = vb2_ioctl_qbuf,
>> +	.vidioc_expbuf                  = vb2_ioctl_expbuf,
>> +	.vidioc_dqbuf                   = vb2_ioctl_dqbuf,
>> +	.vidioc_create_bufs             = vb2_ioctl_create_bufs,
>> +	.vidioc_prepare_buf             = vb2_ioctl_prepare_buf,
>> +	.vidioc_streamon                = vb2_ioctl_streamon,
>> +	.vidioc_streamoff               = vb2_ioctl_streamoff,
>> +};
>> +
>> +/* -----------------------------------------------------------------------------
>> + * V4L2 file operations
>> + */
>> +
>> +static const struct v4l2_file_operations stf_vid_fops = {
>> +	.owner          = THIS_MODULE,
>> +	.unlocked_ioctl = video_ioctl2,
>> +	.open           = v4l2_fh_open,
>> +	.release        = vb2_fop_release,
>> +	.poll           = vb2_fop_poll,
>> +	.mmap           = vb2_fop_mmap,
>> +	.read           = vb2_fop_read,
>> +};
>> +
>> +/* -----------------------------------------------------------------------------
>> + * STFCAMSS video core
>> + */
>> +
>> +static void stf_video_release(struct video_device *vdev)
>> +{
>> +	struct stfcamss_video *video = video_get_drvdata(vdev);
>> +
>> +	media_entity_cleanup(&vdev->entity);
>> +
>> +	mutex_destroy(&video->q_lock);
>> +	mutex_destroy(&video->lock);
>> +}
>> +
>> +int stf_video_register(struct stfcamss_video *video,
>> +		       struct v4l2_device *v4l2_dev, const char *name)
>> +{
>> +	struct video_device *vdev;
>> +	struct vb2_queue *q;
>> +	struct media_pad *pad = &video->pad;
>> +	int ret;
>> +
>> +	vdev = &video->vdev;
>> +
>> +	mutex_init(&video->q_lock);
>> +
>> +	q = &video->vb2_q;
>> +	q->drv_priv = video;
>> +	q->mem_ops = &vb2_dma_contig_memops;
>> +	q->ops = &stf_video_vb2_q_ops;
>> +	q->type = video->type;
>> +	q->io_modes = VB2_DMABUF | VB2_MMAP | VB2_READ;
> 
> VB2_READ support does not generally make sense for uncompressed video since
> read() always requires a memcpy, and that makes it very inefficient.
> 
> It doesn't hurt though, so it is up to you whether or not you want this.
> 

Yes, we would like to retain this feature to meet some possible special needs.

>> +	q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
>> +	q->buf_struct_size = sizeof(struct stfcamss_buffer);
>> +	q->dev = video->stfcamss->dev;
>> +	q->lock = &video->q_lock;
>> +	q->min_buffers_needed = STFCAMSS_MIN_BUFFERS;
>> +	ret = vb2_queue_init(q);
>> +	if (ret < 0) {
>> +		dev_err(video->stfcamss->dev,
>> +			"Failed to init vb2 queue: %d\n", ret);
>> +		goto err_vb2_init;
>> +	}
>> +
>> +	pad->flags = MEDIA_PAD_FL_SINK;
>> +	ret = media_entity_pads_init(&vdev->entity, 1, pad);
>> +	if (ret < 0) {
>> +		dev_err(video->stfcamss->dev,
>> +			"Failed to init video entity: %d\n", ret);
>> +		goto err_vb2_init;
>> +	}
>> +
>> +	mutex_init(&video->lock);
>> +
>> +	if (video->id == STF_V_LINE_WR) {
>> +		video->formats = formats_pix_wr;
>> +		video->nformats = ARRAY_SIZE(formats_pix_wr);
>> +		video->bpl_alignment = 8;
>> +	} else {
>> +		video->formats = formats_pix_isp;
>> +		video->nformats = ARRAY_SIZE(formats_pix_isp);
>> +		video->bpl_alignment = 1;
>> +	}
>> +
>> +	ret = stf_video_init_format(video);
>> +	if (ret < 0) {
>> +		dev_err(video->stfcamss->dev,
>> +			"Failed to init format: %d\n", ret);
>> +		goto err_vid_init_format;
>> +	}
>> +
>> +	vdev->fops = &stf_vid_fops;
>> +	vdev->ioctl_ops = &stf_vid_ioctl_ops;
>> +	vdev->device_caps = V4L2_CAP_VIDEO_CAPTURE;
>> +	vdev->vfl_dir = VFL_DIR_RX;
>> +	vdev->device_caps |= V4L2_CAP_STREAMING | V4L2_CAP_READWRITE;
>> +	vdev->release = stf_video_release;
>> +	vdev->v4l2_dev = v4l2_dev;
>> +	vdev->queue = &video->vb2_q;
>> +	vdev->lock = &video->lock;
>> +	strscpy(vdev->name, name, sizeof(vdev->name));
>> +
>> +	ret = video_register_device(vdev, VFL_TYPE_VIDEO, video->id);
>> +	if (ret < 0) {
>> +		dev_err(video->stfcamss->dev,
>> +			"Failed to register video device: %d\n", ret);
>> +		goto err_vid_reg;
>> +	}
>> +
>> +	video_set_drvdata(vdev, video);
>> +	return 0;
>> +
>> +err_vid_reg:
>> +err_vid_init_format:
>> +	media_entity_cleanup(&vdev->entity);
>> +	mutex_destroy(&video->lock);
>> +err_vb2_init:
>> +	mutex_destroy(&video->q_lock);
>> +	return ret;
>> +}
>> +
>> +void stf_video_unregister(struct stfcamss_video *video)
>> +{
>> +	vb2_video_unregister_device(&video->vdev);
>> +}
>> diff --git a/drivers/media/platform/starfive/camss/stf_video.h b/drivers/media/platform/starfive/camss/stf_video.h
>> new file mode 100644
>> index 000000000000..60323c23a40c
>> --- /dev/null
>> +++ b/drivers/media/platform/starfive/camss/stf_video.h
>> @@ -0,0 +1,92 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +/*
>> + * stf_video.h
>> + *
>> + * StarFive Camera Subsystem - V4L2 device node
>> + *
>> + * Copyright (C) 2021-2023 StarFive Technology Co., Ltd.
>> + */
>> +
>> +#ifndef STF_VIDEO_H
>> +#define STF_VIDEO_H
>> +
>> +#include <linux/list.h>
>> +#include <linux/mutex.h>
>> +#include <linux/videodev2.h>
>> +#include <media/v4l2-dev.h>
>> +#include <media/v4l2-fh.h>
>> +#include <media/v4l2-ioctl.h>
>> +#include <media/videobuf2-v4l2.h>
>> +
>> +#define STFCAMSS_FRAME_MIN_WIDTH		64
>> +#define STFCAMSS_FRAME_MAX_WIDTH		1920
>> +#define STFCAMSS_FRAME_MIN_HEIGHT		64
>> +#define STFCAMSS_FRAME_MAX_HEIGHT		1080
>> +#define STFCAMSS_FRAME_WIDTH_ALIGN_8		8
>> +#define STFCAMSS_FRAME_WIDTH_ALIGN_128		128
>> +#define STFCAMSS_MIN_BUFFERS			2
>> +
>> +#define STFCAMSS_MAX_ENTITY_NAME_LEN		27
>> +
>> +enum stf_v_line_id {
>> +	STF_V_LINE_WR = 0,
>> +	STF_V_LINE_ISP,
>> +	STF_V_LINE_MAX,
>> +};
>> +
>> +struct stfcamss_buffer {
>> +	struct vb2_v4l2_buffer vb;
>> +	dma_addr_t addr[3];
>> +	struct list_head queue;
>> +};
>> +
>> +struct fract {
>> +	u8 numerator;
>> +	u8 denominator;
>> +};
>> +
>> +/*
>> + * struct stfcamss_format_info - ISP media bus format information
>> + * @code: V4L2 media bus format code
>> + * @pixelformat: V4L2 pixel format FCC identifier
>> + * @planes: Number of planes
>> + * @vsub: Vertical subsampling (for each plane)
>> + * @bpp: Bits per pixel when stored in memory (for each plane)
>> + */
>> +struct stfcamss_format_info {
>> +	u32 code;
>> +	u32 pixelformat;
>> +	u8 planes;
>> +	u8 vsub[3];
>> +	u8 bpp;
>> +};
>> +
>> +struct stfcamss_video {
>> +	struct stfcamss *stfcamss;
>> +	u8 id;
>> +	struct vb2_queue vb2_q;
>> +	struct video_device vdev;
>> +	struct media_pad pad;
>> +	struct v4l2_format active_fmt;
>> +	enum v4l2_buf_type type;
>> +	const struct stfcamss_video_ops *ops;
>> +	struct mutex lock;	 /* serialize device access */
>> +	struct mutex q_lock;	 /* protects the queue */
>> +	unsigned int bpl_alignment;
>> +	const struct stfcamss_format_info *formats;
>> +	unsigned int nformats;
>> +};
>> +
>> +struct stfcamss_video_ops {
>> +	int (*queue_buffer)(struct stfcamss_video *vid,
>> +			    struct stfcamss_buffer *buf);
>> +	int (*flush_buffers)(struct stfcamss_video *vid,
>> +			     enum vb2_buffer_state state);
>> +};
>> +
>> +int stf_video_register(struct stfcamss_video *video,
>> +		       struct v4l2_device *v4l2_dev, const char *name);
>> +
>> +void stf_video_unregister(struct stfcamss_video *video);
>> +
>> +#endif /* STF_VIDEO_H */
> 
> Regards,
> 
> 	Hans

-- 
Regards,

Jack Zhu
