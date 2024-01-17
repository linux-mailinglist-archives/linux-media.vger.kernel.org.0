Return-Path: <linux-media+bounces-3789-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FFB38303A4
	for <lists+linux-media@lfdr.de>; Wed, 17 Jan 2024 11:31:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 94F511F21D92
	for <lists+linux-media@lfdr.de>; Wed, 17 Jan 2024 10:31:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E48661D54E;
	Wed, 17 Jan 2024 10:29:28 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 858031F5E7;
	Wed, 17 Jan 2024 10:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705487368; cv=none; b=U8s4TF7+NaIiN3gXwRAOhj9TDnkr8qE56dJzk7EbtwDDg22ZmWFhyDtTjJRO7tD3M307Vv+3wb12a0shdn2NLIGmg8g3Pop0GQVRQamS+bRdSVbifgp9DN+Zp36Lx3qa/8PvEzNQNtRuc/CgHnCCTSXr5ZKe1EVw10rko3ILrSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705487368; c=relaxed/simple;
	bh=wGm0GeCoKjkKWIyy318foy9jft9H/LSPp8OA2t2bKFA=;
	h=Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 Content-Language:To:References:From:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding; b=Y4cBsbczDfcvSlSfJI84fAGboZw8BNWsxAiRdFAa/5qzJD1IwjgvbRbvGxlVTHl3iu83PZMI0xN/utV6qo9fhqUpsddvWrEDN3iefaANjSPFssF4hMvwdM9ctykIXzEsTcxmr3l9t2L5yg+3GAqcG1ICyoZh84Cp0LofkTGcQHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB40DC433F1;
	Wed, 17 Jan 2024 10:29:23 +0000 (UTC)
Message-ID: <8bf60348-4867-40c3-945b-7cc5103d3617@xs4all.nl>
Date: Wed, 17 Jan 2024 11:29:22 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 14/15] media: imx-asrc: Add memory to memory driver
Content-Language: en-US, nl
To: Shengjiu Wang <shengjiu.wang@nxp.com>, sakari.ailus@iki.fi,
 tfiga@chromium.org, m.szyprowski@samsung.com, mchehab@kernel.org,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
 nicoleotsuka@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org,
 linuxppc-dev@lists.ozlabs.org
References: <1700637838-6743-1-git-send-email-shengjiu.wang@nxp.com>
 <1700637838-6743-15-git-send-email-shengjiu.wang@nxp.com>
From: Hans Verkuil <hverkuil@xs4all.nl>
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
In-Reply-To: <1700637838-6743-15-git-send-email-shengjiu.wang@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Some small comments:

On 22/11/2023 08:23, Shengjiu Wang wrote:
> Implement the ASRC memory to memory function using
> the v4l2 framework, user can use this function with
> v4l2 ioctl interface.
> 
> User send the output and capture buffer to driver and
> driver store the converted data to the capture buffer.
> 
> This feature can be shared by ASRC and EASRC drivers
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  drivers/media/platform/nxp/Kconfig    |   13 +
>  drivers/media/platform/nxp/Makefile   |    1 +
>  drivers/media/platform/nxp/imx-asrc.c | 1264 +++++++++++++++++++++++++
>  3 files changed, 1278 insertions(+)
>  create mode 100644 drivers/media/platform/nxp/imx-asrc.c
> 
> diff --git a/drivers/media/platform/nxp/Kconfig b/drivers/media/platform/nxp/Kconfig
> index 40e3436669e2..8d0ca335601f 100644
> --- a/drivers/media/platform/nxp/Kconfig
> +++ b/drivers/media/platform/nxp/Kconfig
> @@ -67,3 +67,16 @@ config VIDEO_MX2_EMMAPRP
>  
>  source "drivers/media/platform/nxp/dw100/Kconfig"
>  source "drivers/media/platform/nxp/imx-jpeg/Kconfig"
> +
> +config VIDEO_IMX_ASRC
> +	tristate "NXP i.MX ASRC M2M support"
> +	depends on V4L_MEM2MEM_DRIVERS
> +	depends on MEDIA_SUPPORT
> +	select VIDEOBUF2_DMA_CONTIG
> +	select V4L2_MEM2MEM_DEV
> +	select MEDIA_CONTROLLER
> +	help
> +	    Say Y if you want to add ASRC M2M support for NXP CPUs.
> +	    It is a complement for ASRC M2P and ASRC P2M features.
> +	    This option is only useful for out-of-tree drivers since
> +	    in-tree drivers select it automatically.
> diff --git a/drivers/media/platform/nxp/Makefile b/drivers/media/platform/nxp/Makefile
> index 4d90eb713652..1325675e34f5 100644
> --- a/drivers/media/platform/nxp/Makefile
> +++ b/drivers/media/platform/nxp/Makefile
> @@ -9,3 +9,4 @@ obj-$(CONFIG_VIDEO_IMX8MQ_MIPI_CSI2) += imx8mq-mipi-csi2.o
>  obj-$(CONFIG_VIDEO_IMX_MIPI_CSIS) += imx-mipi-csis.o
>  obj-$(CONFIG_VIDEO_IMX_PXP) += imx-pxp.o
>  obj-$(CONFIG_VIDEO_MX2_EMMAPRP) += mx2_emmaprp.o
> +obj-$(CONFIG_VIDEO_IMX_ASRC) += imx-asrc.o
> diff --git a/drivers/media/platform/nxp/imx-asrc.c b/drivers/media/platform/nxp/imx-asrc.c
> new file mode 100644
> index 000000000000..db4d45d5ba59
> --- /dev/null
> +++ b/drivers/media/platform/nxp/imx-asrc.c
> @@ -0,0 +1,1264 @@
> +// SPDX-License-Identifier: GPL-2.0
> +//
> +// Copyright (C) 2014-2016 Freescale Semiconductor, Inc.
> +// Copyright (C) 2019-2023 NXP
> +//
> +// Freescale ASRC Memory to Memory (M2M) driver
> +
> +#include <linux/dma/imx-dma.h>
> +#include <linux/pm_runtime.h>
> +#include <media/v4l2-ctrls.h>
> +#include <media/v4l2-device.h>
> +#include <media/v4l2-event.h>
> +#include <media/v4l2-fh.h>
> +#include <media/v4l2-ioctl.h>
> +#include <media/v4l2-mem2mem.h>
> +#include <media/videobuf2-dma-contig.h>
> +#include <sound/dmaengine_pcm.h>
> +#include <sound/fsl_asrc_common.h>
> +
> +#define V4L_CAP OUT
> +#define V4L_OUT IN
> +
> +#define ASRC_xPUT_DMA_CALLBACK(dir) \
> +	(((dir) == V4L_OUT) ? asrc_input_dma_callback \
> +	: asrc_output_dma_callback)
> +
> +#define DIR_STR(dir) (dir) == V4L_OUT ? "out" : "cap"
> +
> +/* Maximum output and capture buffer size */
> +#define ASRC_M2M_BUFFER_SIZE (512 * 1024)
> +
> +/* Maximum output and capture period size */
> +#define ASRC_M2M_PERIOD_SIZE (48 * 1024)
> +
> +struct asrc_pair_m2m {
> +	struct fsl_asrc_pair *pair;
> +	struct asrc_m2m *m2m;
> +	struct v4l2_fh fh;
> +	struct v4l2_ctrl_handler ctrl_handler;
> +	int channels[2];
> +	unsigned int sequence[2];
> +	s64 src_rate_off_prev;		/* Q31.32 */
> +	s64 dst_rate_off_prev;		/* Q31.32 */
> +	s64 src_rate_off_cur;		/* Q31.32 */
> +	s64 dst_rate_off_cur;		/* Q31.32 */
> +};
> +
> +struct asrc_m2m {
> +	struct fsl_asrc_m2m_pdata pdata;
> +	struct v4l2_device v4l2_dev;
> +	struct v4l2_m2m_dev *m2m_dev;
> +	struct video_device *dec_vdev;
> +	struct mutex mlock; /* v4l2 ioctls serialization */
> +	struct platform_device *pdev;
> +#ifdef CONFIG_MEDIA_CONTROLLER
> +	struct media_device	mdev;
> +#endif
> +};
> +
> +static u32 formats[] = {
> +	V4L2_AUDIO_FMT_S8,
> +	V4L2_AUDIO_FMT_S16_LE,
> +	V4L2_AUDIO_FMT_U16_LE,
> +	V4L2_AUDIO_FMT_S24_LE,
> +	V4L2_AUDIO_FMT_S24_3LE,
> +	V4L2_AUDIO_FMT_U24_LE,
> +	V4L2_AUDIO_FMT_U24_3LE,
> +	V4L2_AUDIO_FMT_S32_LE,
> +	V4L2_AUDIO_FMT_U32_LE,
> +	V4L2_AUDIO_FMT_S20_3LE,
> +	V4L2_AUDIO_FMT_U20_3LE,
> +	V4L2_AUDIO_FMT_FLOAT_LE,
> +	V4L2_AUDIO_FMT_IEC958_SUBFRAME_LE,
> +};
> +
> +#define NUM_FORMATS ARRAY_SIZE(formats)
> +
> +static const s64 asrc_v1_m2m_rates[] = {
> +	5512, 8000, 11025, 12000, 16000,
> +	22050, 24000, 32000, 44100,
> +	48000, 64000, 88200, 96000,
> +	128000, 176400, 192000,
> +};
> +
> +static const s64 asrc_v2_m2m_rates[] = {
> +	8000, 11025, 12000, 16000,
> +	22050, 24000, 32000, 44100,
> +	48000, 64000, 88200, 96000,
> +	128000, 176400, 192000, 256000,
> +	352800, 384000, 705600, 768000,
> +};
> +
> +static u32 find_fourcc(snd_pcm_format_t format)
> +{
> +	snd_pcm_format_t fmt;
> +	unsigned int k;
> +
> +	for (k = 0; k < NUM_FORMATS; k++) {
> +		fmt = v4l2_fourcc_to_audfmt(formats[k]);
> +		if (fmt == format)
> +			return formats[k];
> +	}
> +
> +	return 0;
> +}
> +
> +static snd_pcm_format_t find_format(u32 fourcc)
> +{
> +	unsigned int k;
> +
> +	for (k = 0; k < NUM_FORMATS; k++) {
> +		if (formats[k] == fourcc)
> +			return v4l2_fourcc_to_audfmt(formats[k]);
> +	}
> +
> +	return 0;
> +}
> +
> +static int asrc_check_format(struct asrc_pair_m2m *pair_m2m, u8 dir, u32 format)
> +{
> +	struct asrc_m2m *m2m = pair_m2m->m2m;
> +	struct fsl_asrc_m2m_pdata *pdata = &m2m->pdata;
> +	struct fsl_asrc_pair *pair = pair_m2m->pair;
> +	snd_pcm_format_t fmt;
> +	u64 format_bit = 0;
> +	int i;
> +
> +	for (i = 0; i < NUM_FORMATS; ++i) {
> +		if (formats[i] == format) {
> +			fmt = v4l2_fourcc_to_audfmt(formats[i]);
> +			format_bit = pcm_format_to_bits(fmt);
> +			break;
> +		}
> +	}
> +
> +	if (dir == IN && !(format_bit & pdata->fmt_in))
> +		return find_fourcc(pair->sample_format[V4L_OUT]);
> +	if (dir == OUT && !(format_bit & pdata->fmt_out))
> +		return find_fourcc(pair->sample_format[V4L_CAP]);
> +
> +	return format;
> +}
> +
> +static int asrc_check_channel(struct asrc_pair_m2m *pair_m2m, u8 dir, u32 channels)
> +{
> +	struct asrc_m2m *m2m = pair_m2m->m2m;
> +	struct fsl_asrc_m2m_pdata *pdata = &m2m->pdata;
> +	struct fsl_asrc_pair *pair = pair_m2m->pair;
> +
> +	if (channels < pdata->chan_min || channels > pdata->chan_max)
> +		return pair->channels;
> +
> +	return channels;
> +}
> +
> +static inline struct asrc_pair_m2m *asrc_m2m_fh_to_ctx(struct v4l2_fh *fh)
> +{
> +	return container_of(fh, struct asrc_pair_m2m, fh);
> +}
> +
> +/**
> + * asrc_read_last_fifo: read all the remaining data from FIFO
> + *	@pair: Structure pointer of fsl_asrc_pair
> + *	@dma_vaddr: virtual address of capture buffer
> + *	@length: payload length of capture buffer
> + */
> +static void asrc_read_last_fifo(struct fsl_asrc_pair *pair, void *dma_vaddr, u32 *length)
> +{
> +	struct fsl_asrc *asrc = pair->asrc;
> +	enum asrc_pair_index index = pair->index;
> +	u32 i, reg, size, t_size = 0, width;
> +	u32 *reg32 = NULL;
> +	u16 *reg16 = NULL;
> +	u8  *reg24 = NULL;
> +
> +	width = snd_pcm_format_physical_width(pair->sample_format[V4L_CAP]);
> +	if (width == 32)
> +		reg32 = dma_vaddr + *length;
> +	else if (width == 16)
> +		reg16 = dma_vaddr + *length;
> +	else
> +		reg24 = dma_vaddr + *length;
> +retry:
> +	size = asrc->get_output_fifo_size(pair);
> +	if (size + *length > ASRC_M2M_BUFFER_SIZE)
> +		goto end;
> +
> +	for (i = 0; i < size * pair->channels; i++) {
> +		regmap_read(asrc->regmap, asrc->get_fifo_addr(OUT, index), &reg);
> +		if (reg32) {
> +			*reg32++ = reg;
> +		} else if (reg16) {
> +			*reg16++ = (u16)reg;
> +		} else {
> +			*reg24++ = (u8)reg;
> +			*reg24++ = (u8)(reg >> 8);
> +			*reg24++ = (u8)(reg >> 16);
> +		}
> +	}
> +	t_size += size;
> +
> +	/* In case there is data left in FIFO */
> +	if (size)
> +		goto retry;
> +end:
> +	/* Update payload length */
> +	if (reg32)
> +		*length += t_size * pair->channels * 4;
> +	else if (reg16)
> +		*length += t_size * pair->channels * 2;
> +	else
> +		*length += t_size * pair->channels * 3;
> +}
> +
> +static int asrc_m2m_start_streaming(struct vb2_queue *q, unsigned int count)
> +{
> +	struct asrc_pair_m2m *pair_m2m = vb2_get_drv_priv(q);
> +	struct fsl_asrc_pair *pair = pair_m2m->pair;
> +	struct asrc_m2m *m2m = pair_m2m->m2m;
> +	struct fsl_asrc *asrc = pair->asrc;
> +	struct device *dev = &m2m->pdev->dev;
> +	struct vb2_v4l2_buffer *buf;
> +	bool request_flag = false;
> +	int ret;
> +
> +	dev_dbg(dev, "Start streaming pair=%p, %d\n", pair, q->type);
> +
> +	ret = pm_runtime_get_sync(dev);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to power up asrc\n");
> +		goto err_pm_runtime;
> +	}
> +
> +	/* Request asrc pair/context */
> +	if (!pair->req_pair) {
> +		/* flag for error handler of this function */
> +		request_flag = true;
> +
> +		ret = asrc->request_pair(pair->channels, pair);
> +		if (ret) {
> +			dev_err(dev, "failed to request pair: %d\n", ret);
> +			goto err_request_pair;
> +		}
> +
> +		ret = asrc->m2m_prepare(pair);
> +		if (ret) {
> +			dev_err(dev, "failed to start pair part one: %d\n", ret);
> +			goto err_start_part_one;
> +		}
> +
> +		pair->req_pair = true;
> +	}
> +
> +	/* Request dma channels */
> +	if (V4L2_TYPE_IS_OUTPUT(q->type)) {
> +		pair_m2m->sequence[V4L_OUT] = 0;
> +		pair->dma_chan[V4L_OUT] = asrc->get_dma_channel(pair, IN);
> +		if (!pair->dma_chan[V4L_OUT]) {
> +			dev_err(dev, "[ctx%d] failed to get input DMA channel\n", pair->index);
> +			ret = -EBUSY;
> +			goto err_dma_channel;
> +		}
> +	} else {
> +		pair_m2m->sequence[V4L_CAP] = 0;
> +		pair->dma_chan[V4L_CAP] = asrc->get_dma_channel(pair, OUT);
> +		if (!pair->dma_chan[V4L_CAP]) {
> +			dev_err(dev, "[ctx%d] failed to get output DMA channel\n", pair->index);
> +			ret = -EBUSY;
> +			goto err_dma_channel;
> +		}
> +	}
> +
> +	v4l2_m2m_update_start_streaming_state(pair_m2m->fh.m2m_ctx, q);
> +
> +	return 0;
> +
> +err_dma_channel:
> +	if (request_flag && asrc->m2m_unprepare)
> +		asrc->m2m_unprepare(pair);
> +err_start_part_one:
> +	if (request_flag)
> +		asrc->release_pair(pair);
> +err_request_pair:
> +	pm_runtime_put_sync(dev);
> +err_pm_runtime:
> +	/* Release buffers */
> +	if (V4L2_TYPE_IS_OUTPUT(q->type)) {
> +		while ((buf = v4l2_m2m_src_buf_remove(pair_m2m->fh.m2m_ctx)))
> +			v4l2_m2m_buf_done(buf, VB2_BUF_STATE_QUEUED);
> +	} else {
> +		while ((buf = v4l2_m2m_dst_buf_remove(pair_m2m->fh.m2m_ctx)))
> +			v4l2_m2m_buf_done(buf, VB2_BUF_STATE_QUEUED);
> +	}
> +	return ret;
> +}
> +
> +static void asrc_m2m_stop_streaming(struct vb2_queue *q)
> +{
> +	struct asrc_pair_m2m *pair_m2m = vb2_get_drv_priv(q);
> +	struct asrc_m2m *m2m = pair_m2m->m2m;
> +	struct fsl_asrc_pair *pair = pair_m2m->pair;
> +	struct fsl_asrc *asrc = pair->asrc;
> +	struct device *dev = &m2m->pdev->dev;
> +
> +	dev_dbg(dev, "Stop streaming pair=%p, %d\n", pair, q->type);
> +
> +	v4l2_m2m_update_stop_streaming_state(pair_m2m->fh.m2m_ctx, q);
> +
> +	/* Stop & release pair/context */
> +	if (asrc->m2m_stop)
> +		asrc->m2m_stop(pair);
> +
> +	if (pair->req_pair) {
> +		if (asrc->m2m_unprepare)
> +			asrc->m2m_unprepare(pair);
> +		asrc->release_pair(pair);
> +		pair->req_pair = false;
> +	}
> +
> +	/* Release dma channel */
> +	if (V4L2_TYPE_IS_OUTPUT(q->type)) {
> +		if (pair->dma_chan[V4L_OUT])
> +			dma_release_channel(pair->dma_chan[V4L_OUT]);
> +	} else {
> +		if (pair->dma_chan[V4L_CAP])
> +			dma_release_channel(pair->dma_chan[V4L_CAP]);
> +	}
> +
> +	pm_runtime_put_sync(dev);
> +}
> +
> +static int asrc_m2m_queue_setup(struct vb2_queue *q,
> +				unsigned int *num_buffers, unsigned int *num_planes,
> +				unsigned int sizes[], struct device *alloc_devs[])
> +{
> +	struct asrc_pair_m2m *pair_m2m = vb2_get_drv_priv(q);
> +	struct fsl_asrc_pair *pair = pair_m2m->pair;
> +	u32 size;
> +
> +	/*
> +	 * The capture buffer size depends on output buffer size
> +	 * and the convert ratio.
> +	 *
> +	 * Here just use a fix length for capture and output buffer.
> +	 * User need to care about it.
> +	 */
> +	if (V4L2_TYPE_IS_OUTPUT(q->type))
> +		size = pair->buf_len[V4L_OUT];
> +	else
> +		size = pair->buf_len[V4L_CAP];
> +
> +	if (*num_planes)
> +		return sizes[0] < size ? -EINVAL : 0;
> +
> +	*num_planes = 1;
> +	sizes[0] = size;
> +
> +	return 0;
> +}
> +
> +static void asrc_m2m_buf_queue(struct vb2_buffer *vb)
> +{
> +	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
> +	struct asrc_pair_m2m *pair_m2m = vb2_get_drv_priv(vb->vb2_queue);
> +
> +	/* queue buffer */
> +	v4l2_m2m_buf_queue(pair_m2m->fh.m2m_ctx, vbuf);
> +}
> +
> +static const struct vb2_ops asrc_m2m_qops = {
> +	.wait_prepare		= vb2_ops_wait_prepare,
> +	.wait_finish		= vb2_ops_wait_finish,
> +	.start_streaming	= asrc_m2m_start_streaming,
> +	.stop_streaming		= asrc_m2m_stop_streaming,
> +	.queue_setup		= asrc_m2m_queue_setup,
> +	.buf_queue		= asrc_m2m_buf_queue,
> +};
> +
> +/* Init video buffer queue for src and dst. */
> +static int asrc_m2m_queue_init(void *priv, struct vb2_queue *src_vq,
> +			       struct vb2_queue *dst_vq)
> +{
> +	struct asrc_pair_m2m *pair_m2m = priv;
> +	struct asrc_m2m *m2m = pair_m2m->m2m;
> +	int ret;
> +
> +	src_vq->type = V4L2_BUF_TYPE_AUDIO_OUTPUT;
> +	src_vq->io_modes = VB2_MMAP | VB2_DMABUF;
> +	src_vq->drv_priv = pair_m2m;
> +	src_vq->buf_struct_size = sizeof(struct v4l2_m2m_buffer);
> +	src_vq->ops = &asrc_m2m_qops;
> +	src_vq->mem_ops = &vb2_dma_contig_memops;
> +	src_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
> +	src_vq->lock = &m2m->mlock;
> +	src_vq->dev = &m2m->pdev->dev;
> +	src_vq->min_buffers_needed = 1;

Drop this line, it is not needed.

> +
> +	ret = vb2_queue_init(src_vq);
> +	if (ret)
> +		return ret;
> +
> +	dst_vq->type = V4L2_BUF_TYPE_AUDIO_CAPTURE;
> +	dst_vq->io_modes = VB2_MMAP | VB2_DMABUF;
> +	dst_vq->drv_priv = pair_m2m;
> +	dst_vq->buf_struct_size = sizeof(struct v4l2_m2m_buffer);
> +	dst_vq->ops = &asrc_m2m_qops;
> +	dst_vq->mem_ops = &vb2_dma_contig_memops;
> +	dst_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
> +	dst_vq->lock = &m2m->mlock;
> +	dst_vq->dev = &m2m->pdev->dev;
> +	dst_vq->min_buffers_needed = 1;

Ditto.

> +
> +	ret = vb2_queue_init(dst_vq);
> +	return ret;
> +}
> +
> +static int asrc_m2m_op_s_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +	struct asrc_pair_m2m *pair_m2m =
> +		container_of(ctrl->handler, struct asrc_pair_m2m, ctrl_handler);
> +	struct fsl_asrc_pair *pair = pair_m2m->pair;
> +	int ret = 0;
> +
> +	switch (ctrl->id) {
> +	case V4L2_CID_M2M_AUDIO_SOURCE_RATE:
> +		pair->rate[V4L_OUT] = ctrl->qmenu_int[ctrl->val];
> +		break;
> +	case V4L2_CID_M2M_AUDIO_DEST_RATE:
> +		pair->rate[V4L_CAP] = ctrl->qmenu_int[ctrl->val];
> +		break;
> +	case V4L2_CID_M2M_AUDIO_SOURCE_RATE_OFFSET:
> +		pair_m2m->src_rate_off_cur = *ctrl->p_new.p_s64;
> +		break;
> +	case V4L2_CID_M2M_AUDIO_DEST_RATE_OFFSET:
> +		pair_m2m->dst_rate_off_cur = *ctrl->p_new.p_s64;
> +		break;
> +	default:
> +		ret = -EINVAL;
> +		break;
> +	}
> +
> +	return ret;
> +}
> +
> +static const struct v4l2_ctrl_ops asrc_m2m_ctrl_ops = {
> +	.s_ctrl = asrc_m2m_op_s_ctrl,
> +};
> +
> +static const struct v4l2_ctrl_config asrc_src_rate_off_control = {
> +	.ops = &asrc_m2m_ctrl_ops,
> +	.id = V4L2_CID_M2M_AUDIO_SOURCE_RATE_OFFSET,
> +	.name = "Audio Source Sample Rate Offset",
> +	.type = V4L2_CTRL_TYPE_INTEGER64,
> +	.min = v4l2_ctrl_fp_compose(-128, 0, 32),
> +	.max = v4l2_ctrl_fp_compose(127, 0xffffffff, 32),
> +	.def = 0,
> +	.step = 1,
> +	.flags = V4L2_CTRL_FLAG_UPDATE,

I don't think you need this flag. Or did I miss something?

> +	.fraction_bits = 32,
> +};
> +
> +static const struct v4l2_ctrl_config asrc_dst_rate_off_control = {
> +	.ops = &asrc_m2m_ctrl_ops,
> +	.id = V4L2_CID_M2M_AUDIO_DEST_RATE_OFFSET,
> +	.name = "Audio Dest Sample Rate Offset",
> +	.type = V4L2_CTRL_TYPE_INTEGER64,
> +	.min = v4l2_ctrl_fp_compose(-128, 0, 32),
> +	.max = v4l2_ctrl_fp_compose(127, 0xffffffff, 32),
> +	.def = 0,
> +	.step = 1,
> +	.flags = V4L2_CTRL_FLAG_UPDATE,

Ditto.

> +	.fraction_bits = 32,
> +};
> +
> +/* system callback for open() */
> +static int asrc_m2m_open(struct file *file)
> +{
> +	struct asrc_m2m *m2m = video_drvdata(file);
> +	struct fsl_asrc *asrc = m2m->pdata.asrc;
> +	struct video_device *vdev = video_devdata(file);
> +	struct fsl_asrc_pair *pair;
> +	struct asrc_pair_m2m *pair_m2m;
> +	int ret = 0;
> +
> +	if (mutex_lock_interruptible(&m2m->mlock))
> +		return -ERESTARTSYS;
> +
> +	pair = kzalloc(sizeof(*pair) + asrc->pair_priv_size, GFP_KERNEL);
> +	if (!pair) {
> +		ret = -ENOMEM;
> +		goto err_alloc_pair;
> +	}
> +
> +	pair_m2m = kzalloc(sizeof(*pair_m2m), GFP_KERNEL);
> +	if (!pair_m2m) {
> +		ret = -ENOMEM;
> +		goto err_alloc_pair_m2m;
> +	}
> +
> +	pair->private = (void *)pair + sizeof(struct fsl_asrc_pair);
> +	pair->asrc = asrc;
> +
> +	pair->buf_len[V4L_OUT] = ASRC_M2M_BUFFER_SIZE;
> +	pair->buf_len[V4L_CAP] = ASRC_M2M_BUFFER_SIZE;
> +
> +	pair->channels = 2;
> +	pair->rate[V4L_OUT] = 8000;
> +	pair->rate[V4L_CAP] = 8000;
> +	pair->sample_format[V4L_OUT] = SNDRV_PCM_FORMAT_S16_LE;
> +	pair->sample_format[V4L_CAP] = SNDRV_PCM_FORMAT_S16_LE;
> +
> +	init_completion(&pair->complete[V4L_OUT]);
> +	init_completion(&pair->complete[V4L_CAP]);
> +
> +	v4l2_fh_init(&pair_m2m->fh, vdev);
> +	v4l2_fh_add(&pair_m2m->fh);
> +	file->private_data = &pair_m2m->fh;
> +
> +	pair_m2m->pair = pair;
> +	pair_m2m->m2m = m2m;
> +	/* m2m context init */
> +	pair_m2m->fh.m2m_ctx = v4l2_m2m_ctx_init(m2m->m2m_dev, pair_m2m,
> +						 asrc_m2m_queue_init);
> +	if (IS_ERR(pair_m2m->fh.m2m_ctx)) {
> +		ret = PTR_ERR(pair_m2m->fh.m2m_ctx);
> +		goto err_ctx_init;
> +	}
> +
> +	v4l2_ctrl_handler_init(&pair_m2m->ctrl_handler, 4);
> +
> +	if (m2m->pdata.rate_min == 5512) {
> +		v4l2_ctrl_new_int_menu(&pair_m2m->ctrl_handler, &asrc_m2m_ctrl_ops,
> +				       V4L2_CID_M2M_AUDIO_SOURCE_RATE,
> +				       ARRAY_SIZE(asrc_v1_m2m_rates) - 1, 1, asrc_v1_m2m_rates);
> +		v4l2_ctrl_new_int_menu(&pair_m2m->ctrl_handler, &asrc_m2m_ctrl_ops,
> +				       V4L2_CID_M2M_AUDIO_DEST_RATE,
> +				       ARRAY_SIZE(asrc_v1_m2m_rates) - 1, 1, asrc_v1_m2m_rates);
> +	} else {
> +		v4l2_ctrl_new_int_menu(&pair_m2m->ctrl_handler, &asrc_m2m_ctrl_ops,
> +				       V4L2_CID_M2M_AUDIO_SOURCE_RATE,
> +				       ARRAY_SIZE(asrc_v2_m2m_rates) - 1, 0, asrc_v2_m2m_rates);
> +		v4l2_ctrl_new_int_menu(&pair_m2m->ctrl_handler, &asrc_m2m_ctrl_ops,
> +				       V4L2_CID_M2M_AUDIO_DEST_RATE,
> +				       ARRAY_SIZE(asrc_v2_m2m_rates) - 1, 0, asrc_v2_m2m_rates);
> +	}
> +
> +	v4l2_ctrl_new_custom(&pair_m2m->ctrl_handler, &asrc_src_rate_off_control, NULL);
> +	v4l2_ctrl_new_custom(&pair_m2m->ctrl_handler, &asrc_dst_rate_off_control, NULL);
> +
> +	if (pair_m2m->ctrl_handler.error) {
> +		ret = pair_m2m->ctrl_handler.error;
> +		v4l2_ctrl_handler_free(&pair_m2m->ctrl_handler);
> +		goto err_ctrl_handler;
> +	}
> +
> +	pair_m2m->fh.ctrl_handler = &pair_m2m->ctrl_handler;
> +
> +	mutex_unlock(&m2m->mlock);
> +
> +	return 0;
> +
> +err_ctrl_handler:
> +	v4l2_m2m_ctx_release(pair_m2m->fh.m2m_ctx);
> +err_ctx_init:
> +	v4l2_fh_del(&pair_m2m->fh);
> +	v4l2_fh_exit(&pair_m2m->fh);
> +	kfree(pair_m2m);
> +err_alloc_pair_m2m:
> +	kfree(pair);
> +err_alloc_pair:
> +	mutex_unlock(&m2m->mlock);
> +	return ret;
> +}
> +
> +static int asrc_m2m_release(struct file *file)
> +{
> +	struct asrc_m2m *m2m = video_drvdata(file);
> +	struct asrc_pair_m2m *pair_m2m = asrc_m2m_fh_to_ctx(file->private_data);
> +	struct fsl_asrc_pair *pair = pair_m2m->pair;
> +
> +	mutex_lock(&m2m->mlock);
> +	v4l2_ctrl_handler_free(&pair_m2m->ctrl_handler);
> +	v4l2_m2m_ctx_release(pair_m2m->fh.m2m_ctx);
> +	v4l2_fh_del(&pair_m2m->fh);
> +	v4l2_fh_exit(&pair_m2m->fh);
> +	kfree(pair_m2m);
> +	kfree(pair);
> +	mutex_unlock(&m2m->mlock);
> +
> +	return 0;
> +}
> +
> +static const struct v4l2_file_operations asrc_m2m_fops = {
> +	.owner          = THIS_MODULE,
> +	.open           = asrc_m2m_open,
> +	.release        = asrc_m2m_release,
> +	.poll           = v4l2_m2m_fop_poll,
> +	.unlocked_ioctl = video_ioctl2,
> +	.mmap           = v4l2_m2m_fop_mmap,
> +};
> +
> +static int asrc_m2m_querycap(struct file *file, void *priv,
> +			     struct v4l2_capability *cap)
> +{
> +	strscpy(cap->driver, M2M_DRV_NAME, sizeof(cap->driver));
> +	strscpy(cap->card, M2M_DRV_NAME, sizeof(cap->card));
> +	snprintf(cap->bus_info, sizeof(cap->bus_info),
> +		 "platform:%s", M2M_DRV_NAME);

No need to fill in bus_info, it should be done for you.

> +	cap->device_caps = V4L2_CAP_STREAMING | V4L2_CAP_AUDIO_M2M;
> +
> +	return 0;
> +}
> +
> +static int enum_fmt(struct v4l2_fmtdesc *f, u64 fmtbit)
> +{
> +	snd_pcm_format_t fmt;
> +	int i, num;
> +
> +	num = 0;
> +
> +	for (i = 0; i < NUM_FORMATS; ++i) {
> +		fmt = v4l2_fourcc_to_audfmt(formats[i]);
> +		if (pcm_format_to_bits(fmt) & fmtbit) {
> +			if (num == f->index)
> +				break;
> +			/*
> +			 * Correct type but haven't reached our index yet,
> +			 * just increment per-type index
> +			 */
> +			++num;
> +		}
> +	}
> +
> +	if (i < NUM_FORMATS) {
> +		/* Format found */
> +		f->pixelformat = formats[i];
> +		return 0;
> +	}
> +
> +	return -EINVAL;
> +}
> +
> +static int asrc_m2m_enum_fmt_aud_cap(struct file *file, void *fh,
> +				     struct v4l2_fmtdesc *f)
> +{
> +	struct asrc_pair_m2m *pair_m2m = asrc_m2m_fh_to_ctx(fh);
> +	struct asrc_m2m *m2m = pair_m2m->m2m;
> +
> +	return enum_fmt(f, m2m->pdata.fmt_out);
> +}
> +
> +static int asrc_m2m_enum_fmt_aud_out(struct file *file, void *fh,
> +				     struct v4l2_fmtdesc *f)
> +{
> +	struct asrc_pair_m2m *pair_m2m = asrc_m2m_fh_to_ctx(fh);
> +	struct asrc_m2m *m2m = pair_m2m->m2m;
> +
> +	return enum_fmt(f, m2m->pdata.fmt_in);
> +}
> +
> +static int asrc_m2m_g_fmt_aud_cap(struct file *file, void *fh,
> +				  struct v4l2_format *f)
> +{
> +	struct asrc_pair_m2m *pair_m2m = asrc_m2m_fh_to_ctx(fh);
> +	struct fsl_asrc_pair *pair = pair_m2m->pair;
> +
> +	f->fmt.audio.channels = pair->channels;
> +	f->fmt.audio.buffersize = pair->buf_len[V4L_CAP];
> +	f->fmt.audio.audioformat = find_fourcc(pair->sample_format[V4L_CAP]);
> +
> +	return 0;
> +}
> +
> +static int asrc_m2m_g_fmt_aud_out(struct file *file, void *fh,
> +				  struct v4l2_format *f)
> +{
> +	struct asrc_pair_m2m *pair_m2m = asrc_m2m_fh_to_ctx(fh);
> +	struct fsl_asrc_pair *pair = pair_m2m->pair;
> +
> +	f->fmt.audio.channels = pair->channels;
> +	f->fmt.audio.buffersize = pair->buf_len[V4L_OUT];
> +	f->fmt.audio.audioformat = find_fourcc(pair->sample_format[V4L_OUT]);
> +
> +	return 0;
> +}
> +
> +/* output for asrc */
> +static int asrc_m2m_s_fmt_aud_cap(struct file *file, void *fh,
> +				  struct v4l2_format *f)
> +{
> +	struct asrc_pair_m2m *pair_m2m = asrc_m2m_fh_to_ctx(fh);
> +	struct fsl_asrc_pair *pair = pair_m2m->pair;
> +	struct asrc_m2m *m2m = pair_m2m->m2m;
> +	struct device *dev = &m2m->pdev->dev;
> +
> +	f->fmt.audio.audioformat = asrc_check_format(pair_m2m, OUT, f->fmt.audio.audioformat);
> +	f->fmt.audio.channels = asrc_check_channel(pair_m2m, OUT, f->fmt.audio.channels);
> +
> +	if (pair_m2m->channels[V4L_CAP] > 0 &&
> +	    pair_m2m->channels[V4L_CAP] != f->fmt.audio.channels) {
> +		dev_err(dev, "channels don't match for cap and out\n");
> +		return -EINVAL;
> +	}
> +
> +	pair_m2m->channels[V4L_CAP] = f->fmt.audio.channels;
> +	pair->channels = f->fmt.audio.channels;
> +	pair->sample_format[V4L_CAP] = find_format(f->fmt.audio.audioformat);
> +
> +	return 0;
> +}
> +
> +/* input for asrc */
> +static int asrc_m2m_s_fmt_aud_out(struct file *file, void *fh,
> +				  struct v4l2_format *f)
> +{
> +	struct asrc_pair_m2m *pair_m2m = asrc_m2m_fh_to_ctx(fh);
> +	struct fsl_asrc_pair *pair = pair_m2m->pair;
> +	struct asrc_m2m *m2m = pair_m2m->m2m;
> +	struct device *dev = &m2m->pdev->dev;
> +
> +	f->fmt.audio.audioformat = asrc_check_format(pair_m2m, IN, f->fmt.audio.audioformat);
> +	f->fmt.audio.channels = asrc_check_channel(pair_m2m, IN, f->fmt.audio.channels);
> +	if (pair_m2m->channels[V4L_OUT] > 0 &&
> +	    pair_m2m->channels[V4L_OUT] != f->fmt.audio.channels) {
> +		dev_err(dev, "channels don't match for cap and out\n");
> +		return -EINVAL;
> +	}
> +
> +	pair_m2m->channels[V4L_OUT] = f->fmt.audio.channels;
> +	pair->channels = f->fmt.audio.channels;
> +	pair->sample_format[V4L_OUT] = find_format(f->fmt.audio.audioformat);
> +
> +	return 0;
> +}
> +
> +static int asrc_m2m_try_fmt_audio_cap(struct file *file, void *fh,
> +				      struct v4l2_format *f)
> +{
> +	struct asrc_pair_m2m *pair_m2m = asrc_m2m_fh_to_ctx(fh);
> +
> +	f->fmt.audio.audioformat = asrc_check_format(pair_m2m, OUT, f->fmt.audio.audioformat);
> +	f->fmt.audio.channels = asrc_check_channel(pair_m2m, OUT, f->fmt.audio.channels);
> +
> +	return 0;
> +}
> +
> +static int asrc_m2m_try_fmt_audio_out(struct file *file, void *fh,
> +				      struct v4l2_format *f)
> +{
> +	struct asrc_pair_m2m *pair_m2m = asrc_m2m_fh_to_ctx(fh);
> +
> +	f->fmt.audio.audioformat = asrc_check_format(pair_m2m, IN, f->fmt.audio.audioformat);
> +	f->fmt.audio.channels = asrc_check_channel(pair_m2m, IN, f->fmt.audio.channels);
> +
> +	return 0;
> +}
> +
> +static const struct v4l2_ioctl_ops asrc_m2m_ioctl_ops = {
> +	.vidioc_querycap		= asrc_m2m_querycap,
> +
> +	.vidioc_enum_fmt_audio_cap	= asrc_m2m_enum_fmt_aud_cap,
> +	.vidioc_enum_fmt_audio_out	= asrc_m2m_enum_fmt_aud_out,
> +
> +	.vidioc_g_fmt_audio_cap		= asrc_m2m_g_fmt_aud_cap,
> +	.vidioc_g_fmt_audio_out		= asrc_m2m_g_fmt_aud_out,
> +
> +	.vidioc_s_fmt_audio_cap		= asrc_m2m_s_fmt_aud_cap,
> +	.vidioc_s_fmt_audio_out		= asrc_m2m_s_fmt_aud_out,
> +
> +	.vidioc_try_fmt_audio_cap	= asrc_m2m_try_fmt_audio_cap,
> +	.vidioc_try_fmt_audio_out	= asrc_m2m_try_fmt_audio_out,
> +
> +	.vidioc_qbuf			= v4l2_m2m_ioctl_qbuf,
> +	.vidioc_dqbuf			= v4l2_m2m_ioctl_dqbuf,
> +
> +	.vidioc_create_bufs		= v4l2_m2m_ioctl_create_bufs,
> +	.vidioc_prepare_buf		= v4l2_m2m_ioctl_prepare_buf,
> +	.vidioc_reqbufs			= v4l2_m2m_ioctl_reqbufs,
> +	.vidioc_querybuf		= v4l2_m2m_ioctl_querybuf,
> +	.vidioc_streamon		= v4l2_m2m_ioctl_streamon,
> +	.vidioc_streamoff		= v4l2_m2m_ioctl_streamoff,
> +	.vidioc_subscribe_event		= v4l2_ctrl_subscribe_event,
> +	.vidioc_unsubscribe_event	= v4l2_event_unsubscribe,
> +};
> +
> +/* dma complete callback */
> +static void asrc_input_dma_callback(void *data)
> +{
> +	struct fsl_asrc_pair *pair = (struct fsl_asrc_pair *)data;
> +
> +	complete(&pair->complete[V4L_OUT]);
> +}
> +
> +/* dma complete callback */
> +static void asrc_output_dma_callback(void *data)
> +{
> +	struct fsl_asrc_pair *pair = (struct fsl_asrc_pair *)data;
> +
> +	complete(&pair->complete[V4L_CAP]);
> +}
> +
> +/* config dma channel */
> +static int asrc_dmaconfig(struct asrc_pair_m2m *pair_m2m,
> +			  struct dma_chan *chan,
> +			  u32 dma_addr, dma_addr_t buf_addr, u32 buf_len,
> +			  int dir, int width)
> +{
> +	struct fsl_asrc_pair *pair = pair_m2m->pair;
> +	struct fsl_asrc *asrc = pair->asrc;
> +	struct asrc_m2m *m2m = pair_m2m->m2m;
> +	struct device *dev = &m2m->pdev->dev;
> +	struct dma_slave_config slave_config;
> +	enum dma_slave_buswidth buswidth;
> +	unsigned int sg_len, max_period_size;
> +	struct scatterlist *sg;
> +	int ret, i;
> +
> +	switch (width) {
> +	case 8:
> +		buswidth = DMA_SLAVE_BUSWIDTH_1_BYTE;
> +		break;
> +	case 16:
> +		buswidth = DMA_SLAVE_BUSWIDTH_2_BYTES;
> +		break;
> +	case 24:
> +		buswidth = DMA_SLAVE_BUSWIDTH_3_BYTES;
> +		break;
> +	case 32:
> +		buswidth = DMA_SLAVE_BUSWIDTH_4_BYTES;
> +		break;
> +	default:
> +		dev_err(dev, "invalid word width\n");
> +		return -EINVAL;
> +	}
> +
> +	memset(&slave_config, 0, sizeof(slave_config));
> +	if (dir == V4L_OUT) {
> +		slave_config.direction = DMA_MEM_TO_DEV;
> +		slave_config.dst_addr = dma_addr;
> +		slave_config.dst_addr_width = buswidth;
> +		slave_config.dst_maxburst = asrc->m2m_get_maxburst(IN, pair);
> +	} else {
> +		slave_config.direction = DMA_DEV_TO_MEM;
> +		slave_config.src_addr = dma_addr;
> +		slave_config.src_addr_width = buswidth;
> +		slave_config.src_maxburst = asrc->m2m_get_maxburst(OUT, pair);
> +	}
> +
> +	ret = dmaengine_slave_config(chan, &slave_config);
> +	if (ret) {
> +		dev_err(dev, "failed to config dmaengine for %s task: %d\n",
> +			DIR_STR(dir), ret);
> +		return -EINVAL;
> +	}
> +
> +	max_period_size = rounddown(ASRC_M2M_PERIOD_SIZE, width * pair->channels / 8);
> +	/* scatter gather mode */
> +	sg_len = buf_len / max_period_size;
> +	if (buf_len % max_period_size)
> +		sg_len += 1;
> +
> +	sg = kmalloc_array(sg_len, sizeof(*sg), GFP_KERNEL);
> +	if (!sg)
> +		return -ENOMEM;
> +
> +	sg_init_table(sg, sg_len);
> +	for (i = 0; i < (sg_len - 1); i++) {
> +		sg_dma_address(&sg[i]) = buf_addr + i * max_period_size;
> +		sg_dma_len(&sg[i]) = max_period_size;
> +	}
> +	sg_dma_address(&sg[i]) = buf_addr + i * max_period_size;
> +	sg_dma_len(&sg[i]) = buf_len - i * max_period_size;
> +
> +	pair->desc[dir] = dmaengine_prep_slave_sg(chan, sg, sg_len,
> +						  slave_config.direction,
> +						  DMA_PREP_INTERRUPT);
> +	kfree(sg);
> +	if (!pair->desc[dir]) {
> +		dev_err(dev, "failed to prepare dmaengine for %s task\n", DIR_STR(dir));
> +		return -EINVAL;
> +	}
> +
> +	pair->desc[dir]->callback = ASRC_xPUT_DMA_CALLBACK(dir);
> +	pair->desc[dir]->callback_param = pair;
> +
> +	return 0;
> +}
> +
> +static void asrc_m2m_set_ratio_mod(struct asrc_pair_m2m *pair_m2m)
> +{
> +	struct fsl_asrc_pair *pair = pair_m2m->pair;
> +	struct fsl_asrc *asrc = pair->asrc;
> +	s32 src_rate_int, dst_rate_int;
> +	s64 src_rate_frac;
> +	s64 dst_rate_frac;
> +	u64 src_rate, dst_rate;
> +	u64 ratio_pre, ratio_cur;
> +	s64 ratio_diff;
> +
> +	if (!asrc->m2m_set_ratio_mod)
> +		return;
> +
> +	if (pair_m2m->src_rate_off_cur == pair_m2m->src_rate_off_prev &&
> +	    pair_m2m->dst_rate_off_cur == pair_m2m->dst_rate_off_prev)
> +		return;
> +
> +	/*
> +	 * use maximum rate 768kHz as limitation, then we can shift right 21 bit for
> +	 * division
> +	 */
> +	src_rate_int = pair->rate[V4L_OUT];
> +	src_rate_frac = pair_m2m->src_rate_off_prev;
> +
> +	src_rate = ((s64)src_rate_int << 32) + src_rate_frac;
> +
> +	dst_rate_int = pair->rate[V4L_CAP];
> +	dst_rate_frac = pair_m2m->dst_rate_off_prev;
> +
> +	dst_rate = ((s64)dst_rate_int << 32) + dst_rate_frac;
> +	dst_rate >>= 21;
> +	do_div(src_rate, dst_rate);
> +	ratio_pre = src_rate;
> +
> +	src_rate_frac = pair_m2m->src_rate_off_cur;
> +	src_rate = ((s64)src_rate_int << 32) + src_rate_frac;
> +
> +	dst_rate_frac = pair_m2m->dst_rate_off_cur;
> +	dst_rate = ((s64)dst_rate_int << 32) + dst_rate_frac;
> +	dst_rate >>= 21;
> +	do_div(src_rate, dst_rate);
> +	ratio_cur = src_rate;
> +
> +	ratio_diff = ratio_cur - ratio_pre;
> +	asrc->m2m_set_ratio_mod(pair, ratio_diff << 10);
> +
> +	pair_m2m->src_rate_off_prev = pair_m2m->src_rate_off_cur;
> +	pair_m2m->dst_rate_off_prev = pair_m2m->dst_rate_off_cur;
> +}
> +
> +/* main function of converter */
> +static void asrc_m2m_device_run(void *priv)
> +{
> +	struct asrc_pair_m2m *pair_m2m = priv;
> +	struct fsl_asrc_pair *pair = pair_m2m->pair;
> +	struct asrc_m2m *m2m = pair_m2m->m2m;
> +	struct fsl_asrc *asrc = pair->asrc;
> +	struct device *dev = &m2m->pdev->dev;
> +	enum asrc_pair_index index = pair->index;
> +	struct vb2_v4l2_buffer *src_buf, *dst_buf;
> +	unsigned int out_buf_len;
> +	unsigned int cap_dma_len;
> +	unsigned int width;
> +	u32 fifo_addr;
> +	int ret;
> +
> +	/* set ratio mod */
> +	asrc_m2m_set_ratio_mod(pair_m2m);
> +
> +	src_buf = v4l2_m2m_next_src_buf(pair_m2m->fh.m2m_ctx);
> +	dst_buf = v4l2_m2m_next_dst_buf(pair_m2m->fh.m2m_ctx);
> +
> +	src_buf->sequence = pair_m2m->sequence[V4L_OUT]++;
> +	dst_buf->sequence = pair_m2m->sequence[V4L_CAP]++;
> +
> +	width = snd_pcm_format_physical_width(pair->sample_format[V4L_OUT]);
> +	fifo_addr = asrc->paddr + asrc->get_fifo_addr(IN, index);
> +	out_buf_len = vb2_get_plane_payload(&src_buf->vb2_buf, 0);
> +	if (out_buf_len < width * pair->channels / 8 ||
> +	    out_buf_len > ASRC_M2M_BUFFER_SIZE ||
> +	    out_buf_len % (width * pair->channels / 8)) {
> +		dev_err(dev, "out buffer size is error: [%d]\n", out_buf_len);
> +		goto end;
> +	}
> +
> +	/* dma config for output dma channel */
> +	ret = asrc_dmaconfig(pair_m2m,
> +			     pair->dma_chan[V4L_OUT],
> +			     fifo_addr,
> +			     vb2_dma_contig_plane_dma_addr(&src_buf->vb2_buf, 0),
> +			     out_buf_len, V4L_OUT, width);
> +	if (ret) {
> +		dev_err(dev, "out dma config error\n");
> +		goto end;
> +	}
> +
> +	width = snd_pcm_format_physical_width(pair->sample_format[V4L_CAP]);
> +	fifo_addr = asrc->paddr + asrc->get_fifo_addr(OUT, index);
> +	cap_dma_len = asrc->m2m_calc_out_len(pair, out_buf_len);
> +	if (cap_dma_len > 0 && cap_dma_len <= ASRC_M2M_BUFFER_SIZE) {
> +		/* dma config for capture dma channel */
> +		ret = asrc_dmaconfig(pair_m2m,
> +				     pair->dma_chan[V4L_CAP],
> +				     fifo_addr,
> +				     vb2_dma_contig_plane_dma_addr(&dst_buf->vb2_buf, 0),
> +				     cap_dma_len, V4L_CAP, width);
> +		if (ret) {
> +			dev_err(dev, "cap dma config error\n");
> +			goto end;
> +		}
> +	} else if (cap_dma_len > ASRC_M2M_BUFFER_SIZE) {
> +		dev_err(dev, "cap buffer size error\n");
> +		goto end;
> +	}
> +
> +	reinit_completion(&pair->complete[V4L_OUT]);
> +	reinit_completion(&pair->complete[V4L_CAP]);
> +
> +	/* Submit DMA request */
> +	dmaengine_submit(pair->desc[V4L_OUT]);
> +	dma_async_issue_pending(pair->desc[V4L_OUT]->chan);
> +	if (cap_dma_len > 0) {
> +		dmaengine_submit(pair->desc[V4L_CAP]);
> +		dma_async_issue_pending(pair->desc[V4L_CAP]->chan);
> +	}
> +
> +	asrc->m2m_start(pair);
> +
> +	if (!wait_for_completion_interruptible_timeout(&pair->complete[V4L_OUT], 10 * HZ)) {
> +		dev_err(dev, "out DMA task timeout\n");
> +		goto end;
> +	}
> +
> +	if (cap_dma_len > 0) {
> +		if (!wait_for_completion_interruptible_timeout(&pair->complete[V4L_CAP], 10 * HZ)) {
> +			dev_err(dev, "cap DMA task timeout\n");
> +			goto end;
> +		}
> +	}
> +
> +	/* read the last words from FIFO */
> +	asrc_read_last_fifo(pair, vb2_plane_vaddr(&dst_buf->vb2_buf, 0), &cap_dma_len);
> +	/* update payload length for capture */
> +	vb2_set_plane_payload(&dst_buf->vb2_buf, 0, cap_dma_len);
> +
> +end:
> +	src_buf = v4l2_m2m_src_buf_remove(pair_m2m->fh.m2m_ctx);
> +	dst_buf = v4l2_m2m_dst_buf_remove(pair_m2m->fh.m2m_ctx);
> +
> +	v4l2_m2m_buf_done(src_buf, VB2_BUF_STATE_DONE);
> +	v4l2_m2m_buf_done(dst_buf, VB2_BUF_STATE_DONE);
> +
> +	v4l2_m2m_job_finish(m2m->m2m_dev, pair_m2m->fh.m2m_ctx);
> +}
> +
> +static int asrc_m2m_job_ready(void *priv)
> +{
> +	struct asrc_pair_m2m *pair_m2m = priv;
> +
> +	if (v4l2_m2m_num_src_bufs_ready(pair_m2m->fh.m2m_ctx) > 0 &&
> +	    v4l2_m2m_num_dst_bufs_ready(pair_m2m->fh.m2m_ctx) > 0) {
> +		return 1;
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct v4l2_m2m_ops asrc_m2m_ops = {
> +	.job_ready = asrc_m2m_job_ready,
> +	.device_run = asrc_m2m_device_run,
> +};
> +
> +static const struct media_device_ops asrc_m2m_media_ops = {
> +	.req_validate = vb2_request_validate,
> +	.req_queue = v4l2_m2m_request_queue,
> +};
> +
> +static int asrc_m2m_probe(struct platform_device *pdev)
> +{
> +	struct fsl_asrc_m2m_pdata *data = pdev->dev.platform_data;
> +	struct device *dev = &pdev->dev;
> +	struct asrc_m2m *m2m;
> +	int ret;
> +
> +	m2m = devm_kzalloc(dev, sizeof(*m2m), GFP_KERNEL);
> +	if (!m2m)
> +		return -ENOMEM;
> +
> +	m2m->pdata = *data;
> +	m2m->pdev = pdev;
> +
> +	ret = v4l2_device_register(dev, &m2m->v4l2_dev);
> +	if (ret) {
> +		dev_err(dev, "failed to register v4l2 device\n");
> +		goto err_register;
> +	}
> +
> +	m2m->m2m_dev = v4l2_m2m_init(&asrc_m2m_ops);
> +	if (IS_ERR(m2m->m2m_dev)) {
> +		ret = PTR_ERR(m2m->m2m_dev);
> +		dev_err_probe(dev, ret, "failed to register v4l2 device\n");
> +		goto err_m2m;
> +	}
> +
> +	m2m->dec_vdev = video_device_alloc();
> +	if (!m2m->dec_vdev) {
> +		ret = -ENOMEM;
> +		goto err_vdev_alloc;
> +	}
> +
> +	mutex_init(&m2m->mlock);
> +
> +	m2m->dec_vdev->fops = &asrc_m2m_fops;
> +	m2m->dec_vdev->ioctl_ops = &asrc_m2m_ioctl_ops;
> +	m2m->dec_vdev->minor = -1;
> +	m2m->dec_vdev->release = video_device_release;
> +	m2m->dec_vdev->lock = &m2m->mlock; /* lock for ioctl serialization */
> +	m2m->dec_vdev->v4l2_dev = &m2m->v4l2_dev;
> +	m2m->dec_vdev->vfl_dir = VFL_DIR_M2M;
> +	m2m->dec_vdev->device_caps = V4L2_CAP_STREAMING | V4L2_CAP_AUDIO_M2M;
> +
> +#ifdef CONFIG_MEDIA_CONTROLLER
> +	m2m->mdev.dev = &pdev->dev;
> +	strscpy(m2m->mdev.model, M2M_DRV_NAME, sizeof(m2m->mdev.model));
> +	snprintf(m2m->mdev.bus_info, sizeof(m2m->mdev.bus_info),
> +		 "platform:%s", M2M_DRV_NAME);
> +	media_device_init(&m2m->mdev);
> +	m2m->mdev.ops = &asrc_m2m_media_ops;
> +	m2m->v4l2_dev.mdev = &m2m->mdev;
> +#endif
> +
> +	ret = video_register_device(m2m->dec_vdev, VFL_TYPE_AUDIO, -1);
> +	if (ret) {
> +		dev_err_probe(dev, ret, "failed to register video device\n");
> +		goto err_vdev_register;
> +	}
> +
> +#ifdef CONFIG_MEDIA_CONTROLLER
> +	ret = v4l2_m2m_register_media_controller(m2m->m2m_dev, m2m->dec_vdev,
> +						 MEDIA_ENT_F_PROC_AUDIO_RESAMPLER);
> +	if (ret) {
> +		dev_err_probe(dev, ret, "Failed to init mem2mem media controller\n");
> +		goto error_v4l2;
> +	}
> +
> +	ret = media_device_register(&m2m->mdev);
> +	if (ret) {
> +		dev_err_probe(dev, ret, "Failed to register mem2mem media device\n");
> +		goto error_m2m_mc;
> +	}
> +#endif
> +
> +	video_set_drvdata(m2m->dec_vdev, m2m);
> +	platform_set_drvdata(pdev, m2m);
> +	pm_runtime_enable(&pdev->dev);
> +
> +	return 0;
> +
> +#ifdef CONFIG_MEDIA_CONTROLLER
> +error_m2m_mc:
> +	v4l2_m2m_unregister_media_controller(m2m->m2m_dev);
> +#endif
> +error_v4l2:
> +	video_unregister_device(m2m->dec_vdev);
> +err_vdev_register:
> +	video_device_release(m2m->dec_vdev);
> +err_vdev_alloc:
> +	v4l2_m2m_release(m2m->m2m_dev);
> +err_m2m:
> +	v4l2_device_unregister(&m2m->v4l2_dev);
> +err_register:
> +	return ret;
> +}
> +
> +static void asrc_m2m_remove(struct platform_device *pdev)
> +{
> +	struct asrc_m2m *m2m = platform_get_drvdata(pdev);
> +
> +	pm_runtime_disable(&pdev->dev);
> +#ifdef CONFIG_MEDIA_CONTROLLER
> +	media_device_unregister(&m2m->mdev);
> +	v4l2_m2m_unregister_media_controller(m2m->m2m_dev);
> +#endif
> +	video_unregister_device(m2m->dec_vdev);
> +	video_device_release(m2m->dec_vdev);
> +	v4l2_m2m_release(m2m->m2m_dev);
> +	v4l2_device_unregister(&m2m->v4l2_dev);
> +}
> +
> +#ifdef CONFIG_PM_SLEEP
> +/* suspend callback for m2m */
> +static int asrc_m2m_suspend(struct device *dev)
> +{
> +	struct asrc_m2m *m2m = dev_get_drvdata(dev);
> +	struct fsl_asrc *asrc = m2m->pdata.asrc;
> +	struct fsl_asrc_pair *pair;
> +	unsigned long lock_flags;
> +	int i;
> +
> +	for (i = 0; i < PAIR_CTX_NUM; i++) {
> +		spin_lock_irqsave(&asrc->lock, lock_flags);
> +		pair = asrc->pair[i];
> +		if (!pair || !pair->req_pair) {
> +			spin_unlock_irqrestore(&asrc->lock, lock_flags);
> +			continue;
> +		}
> +		if (!completion_done(&pair->complete[V4L_OUT])) {
> +			if (pair->dma_chan[V4L_OUT])
> +				dmaengine_terminate_all(pair->dma_chan[V4L_OUT]);
> +			asrc_input_dma_callback((void *)pair);
> +		}
> +		if (!completion_done(&pair->complete[V4L_CAP])) {
> +			if (pair->dma_chan[V4L_CAP])
> +				dmaengine_terminate_all(pair->dma_chan[V4L_CAP]);
> +			asrc_output_dma_callback((void *)pair);
> +		}
> +
> +		if (asrc->m2m_pair_suspend)
> +			asrc->m2m_pair_suspend(pair);
> +
> +		spin_unlock_irqrestore(&asrc->lock, lock_flags);
> +	}
> +
> +	return 0;
> +}
> +
> +static int asrc_m2m_resume(struct device *dev)
> +{
> +	struct asrc_m2m *m2m = dev_get_drvdata(dev);
> +	struct fsl_asrc *asrc = m2m->pdata.asrc;
> +	struct fsl_asrc_pair *pair;
> +	unsigned long lock_flags;
> +	int i;
> +
> +	for (i = 0; i < PAIR_CTX_NUM; i++) {
> +		spin_lock_irqsave(&asrc->lock, lock_flags);
> +		pair = asrc->pair[i];
> +		if (!pair || !pair->req_pair) {
> +			spin_unlock_irqrestore(&asrc->lock, lock_flags);
> +			continue;
> +		}
> +		if (asrc->m2m_pair_resume)
> +			asrc->m2m_pair_resume(pair);
> +
> +		spin_unlock_irqrestore(&asrc->lock, lock_flags);
> +	}
> +
> +	return 0;
> +}
> +#endif
> +
> +static const struct dev_pm_ops asrc_m2m_pm_ops = {
> +	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(asrc_m2m_suspend,
> +				      asrc_m2m_resume)
> +};
> +
> +static const struct platform_device_id asrc_m2m_driver_ids[] __always_unused = {
> +	{ .name = M2M_DRV_NAME },
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(platform, asrc_m2m_driver_ids);
> +
> +static struct platform_driver asrc_m2m_driver = {
> +	.probe  = asrc_m2m_probe,
> +	.remove_new = asrc_m2m_remove,
> +	.id_table = asrc_m2m_driver_ids,
> +	.driver = {
> +		.name = M2M_DRV_NAME,
> +		.pm = &asrc_m2m_pm_ops,
> +	},
> +};
> +module_platform_driver(asrc_m2m_driver);
> +
> +MODULE_DESCRIPTION("Freescale ASRC M2M driver");
> +MODULE_LICENSE("GPL");

Regards,

	Hans

