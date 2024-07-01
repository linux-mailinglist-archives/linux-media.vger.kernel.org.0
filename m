Return-Path: <linux-media+bounces-14475-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0501F91E37F
	for <lists+linux-media@lfdr.de>; Mon,  1 Jul 2024 17:12:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 84BA61F227A2
	for <lists+linux-media@lfdr.de>; Mon,  1 Jul 2024 15:12:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1D4616C86D;
	Mon,  1 Jul 2024 15:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="W08jRvtP"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFE8528F1;
	Mon,  1 Jul 2024 15:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719846747; cv=none; b=hCmYDCf4qBiFtWrfAjz16AGY3YACl6qBqaKYxojCQFxJJgnz8jdjX7XSPeEf+PPMYzwZR+TWbgEL4NyVBonmOBxDdHWcEUhwkcOseyKAnU23UhcVcB/6Ug2DVWCc3Nn02aD8k50gtExlrmHBugs627T/G1tdbxvP+1QrznMa0iY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719846747; c=relaxed/simple;
	bh=1ZIGOmC8lG5hTPZRDfcPjGuwtIGFS+qwD+pN7NGKaRU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eP3d3bw8vTauh8H9A3ZQsYKn1xPMx/IfdOEKJHBdr7be7Nn1qWhKsqSX5aWPqbtbRGqGtl8/RNWd21DHIRRzwS4n37vfafJ2LHOoMKreO9l/cVjyQCAQ4S7/qDc6j3+RTr92l1wCU0DlQnTY6TnjkI3FUT48MiuH5kZgUeVxBbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=W08jRvtP; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8F0B563D;
	Mon,  1 Jul 2024 17:11:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1719846710;
	bh=1ZIGOmC8lG5hTPZRDfcPjGuwtIGFS+qwD+pN7NGKaRU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=W08jRvtPKSORktaJeBeyc4KFoKl0ufCuL5KtXK+VD9GHrHYx9PJVxGvKtEIeIseQh
	 PKzBgqdhRzjBUsQPaUikhDumn4nMtAIACHYYGLWUJddrAyAzGhPzhS5500Qemg96Qk
	 O/SqvU4GfMszLpHLGZZZ12PlUNkBWnIJsyiPRvy4=
Message-ID: <8554a3aa-59c3-4ad8-8443-7ad38794afd7@ideasonboard.com>
Date: Mon, 1 Jul 2024 16:12:12 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 10/16] media: platform: Add mali-c55 3a stats devnode
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, jacopo.mondi@ideasonboard.com,
 nayden.kanchev@arm.com, robh+dt@kernel.org, mchehab@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 jerome.forissier@linaro.org, kieran.bingham@ideasonboard.com,
 sakari.ailus@iki.fi
References: <20240529152858.183799-1-dan.scally@ideasonboard.com>
 <20240529152858.183799-11-dan.scally@ideasonboard.com>
 <20240616211946.GD7378@pendragon.ideasonboard.com>
 <655c2e5e-c56a-45d1-ab51-498ef9c26a19@ideasonboard.com>
 <20240629150415.GI30900@pendragon.ideasonboard.com>
Content-Language: en-US
From: Dan Scally <dan.scally@ideasonboard.com>
Autocrypt: addr=dan.scally@ideasonboard.com; keydata=
 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
In-Reply-To: <20240629150415.GI30900@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Laurent

On 29/06/2024 16:04, Laurent Pinchart wrote:
> Hi Dan,
>
> On Thu, Jun 20, 2024 at 04:10:01PM +0100, Daniel Scally wrote:
>> On 16/06/2024 22:19, Laurent Pinchart wrote:
>>> On Wed, May 29, 2024 at 04:28:52PM +0100, Daniel Scally wrote:
>>>> Add a new code file to govern the 3a statistics capture node.
>>>>
>>>> Acked-by: Nayden Kanchev  <nayden.kanchev@arm.com>
>>>> Co-developed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
>>>> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
>>>> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
>>>> ---
>>>> Changes in v5:
>>>>
>>>> 	- New patch
>>>>
>>>>    drivers/media/platform/arm/mali-c55/Makefile  |   3 +-
>>>>    .../platform/arm/mali-c55/mali-c55-common.h   |  28 ++
>>>>    .../platform/arm/mali-c55/mali-c55-core.c     |  15 +
>>>>    .../platform/arm/mali-c55/mali-c55-isp.c      |   1 +
>>>>    .../arm/mali-c55/mali-c55-registers.h         |   3 +
>>>>    .../platform/arm/mali-c55/mali-c55-stats.c    | 350 ++++++++++++++++++
>>>>    6 files changed, 399 insertions(+), 1 deletion(-)
>>>>    create mode 100644 drivers/media/platform/arm/mali-c55/mali-c55-stats.c
>>>>
>>>> diff --git a/drivers/media/platform/arm/mali-c55/Makefile b/drivers/media/platform/arm/mali-c55/Makefile
>>>> index 77dcb2fbf0f4..cd5a64bf0c62 100644
>>>> --- a/drivers/media/platform/arm/mali-c55/Makefile
>>>> +++ b/drivers/media/platform/arm/mali-c55/Makefile
>>>> @@ -4,6 +4,7 @@ mali-c55-y := mali-c55-capture.o \
>>>>    	      mali-c55-core.o \
>>>>    	      mali-c55-isp.o \
>>>>    	      mali-c55-tpg.o \
>>>> -	      mali-c55-resizer.o
>>>> +	      mali-c55-resizer.o \
>>>> +	      mali-c55-stats.o
>>>>    
>>>>    obj-$(CONFIG_VIDEO_MALI_C55) += mali-c55.o
>>>> diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-common.h b/drivers/media/platform/arm/mali-c55/mali-c55-common.h
>>>> index 2d0c4d152beb..44119e04009b 100644
>>>> --- a/drivers/media/platform/arm/mali-c55/mali-c55-common.h
>>>> +++ b/drivers/media/platform/arm/mali-c55/mali-c55-common.h
>>>> @@ -79,6 +79,7 @@ enum mali_c55_isp_pads {
>>>>    	MALI_C55_ISP_PAD_SINK_VIDEO,
>>>>    	MALI_C55_ISP_PAD_SOURCE,
>>>>    	MALI_C55_ISP_PAD_SOURCE_BYPASS,
>>>> +	MALI_C55_ISP_PAD_SOURCE_3A,
>>> Functions and structures are named with a "stats" suffix, let's call
>>> this MALI_C55_ISP_PAD_SOURCE_STATS.
>>>
>>>>    	MALI_C55_ISP_NUM_PADS,
>>>>    };
>>>>    
>>>> @@ -194,6 +195,28 @@ struct mali_c55_cap_dev {
>>>>    	bool streaming;
>>>>    };
>>>>    
>>>> +struct mali_c55_stats_buf {
>>>> +	struct vb2_v4l2_buffer vb;
>>>> +	spinlock_t lock;
>>> All locks require a comment to document what they protect. Same below.
>>>
>>>> +	unsigned int segments_remaining;
>>>> +	struct list_head queue;
>>>> +	bool failed;
>>>> +};
>>>> +
>>>> +struct mali_c55_stats {
>>>> +	struct mali_c55 *mali_c55;
>>>> +	struct video_device vdev;
>>>> +	struct dma_chan *channel;
>>>> +	struct vb2_queue queue;
>>>> +	struct media_pad pad;
>>>> +	struct mutex lock;
>>>> +
>>>> +	struct {
>>>> +		spinlock_t lock;
>>>> +		struct list_head queue;
>>>> +	} buffers;
>>>> +};
>>>> +
>>>>    enum mali_c55_config_spaces {
>>>>    	MALI_C55_CONFIG_PING,
>>>>    	MALI_C55_CONFIG_PONG,
>>>> @@ -224,6 +247,7 @@ struct mali_c55 {
>>>>    	struct mali_c55_isp isp;
>>>>    	struct mali_c55_resizer resizers[MALI_C55_NUM_RZRS];
>>>>    	struct mali_c55_cap_dev cap_devs[MALI_C55_NUM_CAP_DEVS];
>>>> +	struct mali_c55_stats stats;
>>>>    
>>>>    	struct list_head contexts;
>>>>    	enum mali_c55_config_spaces next_config;
>>>> @@ -245,6 +269,8 @@ int mali_c55_register_resizers(struct mali_c55 *mali_c55);
>>>>    void mali_c55_unregister_resizers(struct mali_c55 *mali_c55);
>>>>    int mali_c55_register_capture_devs(struct mali_c55 *mali_c55);
>>>>    void mali_c55_unregister_capture_devs(struct mali_c55 *mali_c55);
>>>> +int mali_c55_register_stats(struct mali_c55 *mali_c55);
>>>> +void mali_c55_unregister_stats(struct mali_c55 *mali_c55);
>>>>    struct mali_c55_ctx *mali_c55_get_active_context(struct mali_c55 *mali_c55);
>>>>    void mali_c55_set_plane_done(struct mali_c55_cap_dev *cap_dev,
>>>>    			     enum mali_c55_planes plane);
>>>> @@ -262,5 +288,7 @@ mali_c55_isp_fmt_next(const struct mali_c55_isp_fmt *fmt);
>>>>    bool mali_c55_isp_is_format_supported(unsigned int mbus_code);
>>>>    #define for_each_mali_isp_fmt(fmt)\
>>>>    	for ((fmt) = NULL; ((fmt) = mali_c55_isp_fmt_next((fmt)));)
>>>> +void mali_c55_stats_fill_buffer(struct mali_c55 *mali_c55,
>>>> +				enum mali_c55_config_spaces cfg_space);
>>>>    
>>>>    #endif /* _MALI_C55_COMMON_H */
>>>> diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-core.c b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
>>>> index 50caf5ee7474..9ea70010876c 100644
>>>> --- a/drivers/media/platform/arm/mali-c55/mali-c55-core.c
>>>> +++ b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
>>>> @@ -337,6 +337,16 @@ static int mali_c55_create_links(struct mali_c55 *mali_c55)
>>>>    		}
>>>>    	}
>>>>    
>>>> +	ret = media_create_pad_link(&mali_c55->isp.sd.entity,
>>>> +			MALI_C55_ISP_PAD_SOURCE_3A,
>>>> +			&mali_c55->stats.vdev.entity, 0,
>>>> +			MEDIA_LNK_FL_ENABLED | MEDIA_LNK_FL_IMMUTABLE);
>>>> +	if (ret) {
>>>> +		dev_err(mali_c55->dev,
>>>> +			"failed to link ISP and 3a stats node\n");
>>> s/3a stats/stats/
>>>
>>>> +		goto err_remove_links;
>>>> +	}
>>>> +
>>>>    	return 0;
>>>>    
>>>>    err_remove_links:
>>>> @@ -350,6 +360,7 @@ static void mali_c55_unregister_entities(struct mali_c55 *mali_c55)
>>>>    	mali_c55_unregister_isp(mali_c55);
>>>>    	mali_c55_unregister_resizers(mali_c55);
>>>>    	mali_c55_unregister_capture_devs(mali_c55);
>>>> +	mali_c55_unregister_stats(mali_c55);
>>>>    }
>>>>    
>>>>    static int mali_c55_register_entities(struct mali_c55 *mali_c55)
>>>> @@ -372,6 +383,10 @@ static int mali_c55_register_entities(struct mali_c55 *mali_c55)
>>>>    	if (ret)
>>>>    		goto err_unregister_entities;
>>>>    
>>>> +	ret = mali_c55_register_stats(mali_c55);
>>>> +	if (ret)
>>>> +		goto err_unregister_entities;
>>>> +
>>>>    	ret = mali_c55_create_links(mali_c55);
>>>>    	if (ret)
>>>>    		goto err_unregister_entities;
>>>> diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-isp.c b/drivers/media/platform/arm/mali-c55/mali-c55-isp.c
>>>> index ea8b7b866e7a..94876fba3353 100644
>>>> --- a/drivers/media/platform/arm/mali-c55/mali-c55-isp.c
>>>> +++ b/drivers/media/platform/arm/mali-c55/mali-c55-isp.c
>>>> @@ -564,6 +564,7 @@ int mali_c55_register_isp(struct mali_c55 *mali_c55)
>>>>    	isp->pads[MALI_C55_ISP_PAD_SINK_VIDEO].flags = MEDIA_PAD_FL_SINK;
>>>>    	isp->pads[MALI_C55_ISP_PAD_SOURCE].flags = MEDIA_PAD_FL_SOURCE;
>>>>    	isp->pads[MALI_C55_ISP_PAD_SOURCE_BYPASS].flags = MEDIA_PAD_FL_SOURCE;
>>>> +	isp->pads[MALI_C55_ISP_PAD_SOURCE_3A].flags = MEDIA_PAD_FL_SOURCE;
>>>>    
>>>>    	ret = media_entity_pads_init(&sd->entity, MALI_C55_ISP_NUM_PADS,
>>>>    				     isp->pads);
>>>> diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-registers.h b/drivers/media/platform/arm/mali-c55/mali-c55-registers.h
>>>> index cb27abde2aa5..eb3719245ec3 100644
>>>> --- a/drivers/media/platform/arm/mali-c55/mali-c55-registers.h
>>>> +++ b/drivers/media/platform/arm/mali-c55/mali-c55-registers.h
>>>> @@ -68,6 +68,9 @@
>>>>    #define MALI_C55_VC_START(v)				((v) & 0xffff)
>>>>    #define MALI_C55_VC_SIZE(v)				(((v) & 0xffff) << 16)
>>>>    
>>>> +#define MALI_C55_REG_1024BIN_HIST			0x054a8
>>>> +#define MALI_C55_1024BIN_HIST_SIZE			4096
>>>> +
>>>>    /* Ping/Pong Configuration Space */
>>>>    #define MALI_C55_REG_BASE_ADDR				0x18e88
>>>>    #define MALI_C55_REG_BYPASS_0				0x18eac
>>>> diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-stats.c b/drivers/media/platform/arm/mali-c55/mali-c55-stats.c
>>>> new file mode 100644
>>>> index 000000000000..aa40480ed814
>>>> --- /dev/null
>>>> +++ b/drivers/media/platform/arm/mali-c55/mali-c55-stats.c
>>>> @@ -0,0 +1,350 @@
>>>> +// SPDX-License-Identifier: GPL-2.0
>>>> +/*
>>>> + * ARM Mali-C55 ISP Driver - 3A Statistics capture device
>>>> + *
>>>> + * Copyright (C) 2023 Ideas on Board Oy
>>>> + */
>>>> +
>>>> +#include <linux/dmaengine.h>
>>>> +#include <linux/media/arm/mali-c55-config.h>
>>>> +#include <linux/spinlock.h>
>>> You're missing some headers here, for
>>>
>>> container_of()
>>> dev_err()
>>> list_*()
>>> mutex_init()
>>> strscpy()
>>> strscpy()
>>>
>>>> +
>>>> +#include <media/media-entity.h>
>>>> +#include <media/v4l2-dev.h>
>>>> +#include <media/v4l2-event.h>
>>>> +#include <media/v4l2-fh.h>
>>>> +#include <media/v4l2-ioctl.h>
>>>> +#include <media/videobuf2-core.h>
>>>> +#include <media/videobuf2-dma-contig.h>
>>>> +
>>>> +#include "mali-c55-common.h"
>>>> +#include "mali-c55-registers.h"
>>>> +
>>>> +static unsigned int metering_space_addrs[] = {
>>> const
>>>
>>>> +	[MALI_C55_CONFIG_PING] = 0x095AC,
>>>> +	[MALI_C55_CONFIG_PONG] = 0x2156C,
>>> Lower-case hex constants.
>>>
>>>> +};
>>>> +
>>>> +static int mali_c55_stats_enum_fmt_meta_cap(struct file *file, void *fh,
>>>> +					    struct v4l2_fmtdesc *f)
>>>> +{
>>>> +	if (f->index || f->type != V4L2_BUF_TYPE_META_CAPTURE)
>>>> +		return -EINVAL;
>>>> +
>>>> +	f->pixelformat = V4L2_META_FMT_MALI_C55_3A_STATS;
>>> The format could be called V4L2_META_FMT_MALI_C55_STATS. While most
>>> statistics are related to one of the 3A algorithms, I think it would be
>>> better to name this generically. It's name bikeshedding only of course.
>>>
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +
>>>> +static int mali_c55_stats_g_fmt_meta_cap(struct file *file, void *fh,
>>>> +					 struct v4l2_format *f)
>>>> +{
>>>> +	static const struct v4l2_meta_format mfmt = {
>>>> +		.dataformat = V4L2_META_FMT_MALI_C55_3A_STATS,
>>>> +		.buffersize = sizeof(struct mali_c55_stats_buffer)
>>>> +	};
>>>> +
>>>> +	if (f->type != V4L2_BUF_TYPE_META_CAPTURE)
>>>> +		return -EINVAL;
>>>> +
>>>> +	f->fmt.meta = mfmt;
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +
>>>> +static int mali_c55_stats_querycap(struct file *file,
>>>> +				   void *priv, struct v4l2_capability *cap)
>>>> +{
>>>> +	strscpy(cap->driver, MALI_C55_DRIVER_NAME, sizeof(cap->driver));
>>>> +	strscpy(cap->card, "ARM Mali-C55 ISP", sizeof(cap->card));
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +
>>>> +static const struct v4l2_ioctl_ops mali_c55_stats_v4l2_ioctl_ops = {
>>>> +	.vidioc_reqbufs = vb2_ioctl_reqbufs,
>>>> +	.vidioc_querybuf = vb2_ioctl_querybuf,
>>>> +	.vidioc_create_bufs = vb2_ioctl_create_bufs,
>>>> +	.vidioc_qbuf = vb2_ioctl_qbuf,
>>>> +	.vidioc_expbuf = vb2_ioctl_expbuf,
>>>> +	.vidioc_dqbuf = vb2_ioctl_dqbuf,
>>>> +	.vidioc_prepare_buf = vb2_ioctl_prepare_buf,
>>>> +	.vidioc_streamon = vb2_ioctl_streamon,
>>>> +	.vidioc_streamoff = vb2_ioctl_streamoff,
>>>> +	.vidioc_enum_fmt_meta_cap = mali_c55_stats_enum_fmt_meta_cap,
>>>> +	.vidioc_g_fmt_meta_cap = mali_c55_stats_g_fmt_meta_cap,
>>>> +	.vidioc_s_fmt_meta_cap = mali_c55_stats_g_fmt_meta_cap,
>>>> +	.vidioc_try_fmt_meta_cap = mali_c55_stats_g_fmt_meta_cap,
>>>> +	.vidioc_querycap = mali_c55_stats_querycap,
>>>> +	.vidioc_subscribe_event = v4l2_ctrl_subscribe_event,
>>>> +	.vidioc_unsubscribe_event = v4l2_event_unsubscribe,
>>>> +};
>>>> +
>>>> +static const struct v4l2_file_operations mali_c55_stats_v4l2_fops = {
>>>> +	.owner = THIS_MODULE,
>>>> +	.unlocked_ioctl = video_ioctl2,
>>>> +	.open = v4l2_fh_open,
>>>> +	.release = vb2_fop_release,
>>>> +	.poll = vb2_fop_poll,
>>>> +	.mmap = vb2_fop_mmap,
>>>> +};
>>>> +
>>>> +static int
>>>> +mali_c55_stats_queue_setup(struct vb2_queue *q, unsigned int *num_buffers,
>>>> +			   unsigned int *num_planes, unsigned int sizes[],
>>>> +			   struct device *alloc_devs[])
>>>> +{
>>>> +	struct mali_c55_stats *stats = vb2_get_drv_priv(q);
>>>> +
>>>> +	if (*num_planes && *num_planes > 1)
>>>> +		return -EINVAL;
>>>> +
>>>> +	if (sizes[0] && sizes[0] != sizeof(struct mali_c55_stats_buffer))
>>>> +		return -EINVAL;
>>>> +
>>>> +	*num_planes = 1;
>>>> +	sizes[0] = sizeof(struct mali_c55_stats_buffer);
>>>> +
>>>> +	if (stats->channel)
>>>> +		alloc_devs[0] = stats->channel->device->dev;
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +
>>>> +static void mali_c55_stats_buf_queue(struct vb2_buffer *vb)
>>>> +{
>>>> +	struct mali_c55_stats *stats = vb2_get_drv_priv(vb->vb2_queue);
>>>> +	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
>>>> +	struct mali_c55_stats_buf *buf = container_of(vbuf,
>>>> +						struct mali_c55_stats_buf, vb);
>>>> +
>>>> +	vb2_set_plane_payload(vb, 0, sizeof(struct mali_c55_stats_buffer));
>>>> +	buf->segments_remaining = 2;
>>>> +	buf->failed = false;
>>>> +
>>>> +	spin_lock(&stats->buffers.lock);
>>> Isn't the DMA completion handler run from IRQ context ? If so you'll
>>> need to use spin_lock_irq() here and in the other function that are
>>> not called with interrupts disabled.
>> They're run in the bottom half of the interrupt handler; I'm under the
>> impression that that means the interrupts aren't disabled, and it's
>> safe to do...is that mistaken?
> I'm talking about the DMA completion handler, called by the DMA engine
> subsystem, not the IRQs of the C55 itself.


Ah! I follow you now sorry. Hm, that's an interesting thought...I think for the PL330 the answer is 
no; the interrupt handler wakes a thread that runs the callbacks for any DMA transfers that are 
completed...I don't know that that's a design rule we can rely on though so possibly it's better to 
be safe. Is there a disadvantage to using spin_lock_irq() outside of IRQ context?

>
>>>> +	list_add_tail(&buf->queue, &stats->buffers.queue);
>>>> +	spin_unlock(&stats->buffers.lock);
>>>> +}
>>>> +
>>>> +static void mali_c55_stats_stop_streaming(struct vb2_queue *q)
>>>> +{
>>>> +	struct mali_c55_stats *stats = vb2_get_drv_priv(q);
>>>> +	struct mali_c55_stats_buf *buf, *tmp;
>>>> +
>>>> +	spin_lock(&stats->buffers.lock);
>>>> +
>>>> +	list_for_each_entry_safe(buf, tmp, &stats->buffers.queue, queue) {
>>>> +		list_del(&buf->queue);
>>>> +		vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_ERROR);
>>>> +	}
>>>> +
>>>> +	spin_unlock(&stats->buffers.lock);
>>>> +}
>>>> +
>>>> +static const struct vb2_ops mali_c55_stats_vb2_ops = {
>>>> +	.queue_setup = mali_c55_stats_queue_setup,
>>>> +	.buf_queue = mali_c55_stats_buf_queue,
>>>> +	.wait_prepare = vb2_ops_wait_prepare,
>>>> +	.wait_finish = vb2_ops_wait_finish,
>>>> +	.stop_streaming = mali_c55_stats_stop_streaming,
>>>> +};
>>>> +
>>>> +static void
>>>> +mali_c55_stats_metering_complete(void *param,
>>>> +				 const struct dmaengine_result *result)
>>>> +{
>>>> +	struct mali_c55_stats_buf *buf = param;
>>>> +
>>>> +	spin_lock(&buf->lock);
>>> I wonder if this is needed. Can the DMA engine call the completion
>>> handlers of two sequential DMA transfers in parallel ?
>> The DMA engine that's on the system we have can't...I wasn't sure
>> whether that was generically true.
> I think it is, but please double-check.
>
>>>> +
>>>> +	if (buf->failed)
>>>> +		goto out_unlock;
>>>> +
>>>> +	buf->vb.vb2_buf.timestamp = ktime_get_boottime_ns();
>>>> +
>>>> +	if (result->result != DMA_TRANS_NOERROR) {
>>>> +		buf->failed = true;
>>>> +		vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_ERROR);
>>> This will possibly return the buffer to userspace after the first DMA
>>> transfer. Userspace could then requeue the buffer to the kernel before
>>> the completion of the second DMA transfer. That will cause trouble. I
>>> think you should instead do something like
>>>
>>> 	spin_lock(&buf->lock);
>>>
>>> 	if (result->result != DMA_TRANS_NOERROR)
>>> 		buf->failed = true;
>>>
>>> 	if (!--buf->segments_remaining) {
>>> 		buf->vb.vb2_buf.timestamp = ktime_get_boottime_ns();
>>> 		vb2_buffer_done(&buf->vb.vb2_buf, buf->failed ?
>>> 				VB2_BUF_STATE_ERROR : VB2_BUF_STATE_DONE);
>>> 	}
>>>
>>> 	spin_unlock(&buf->lock);
>>>
>>> The
>>>
>>> 	buf->vb.vb2_buf.timestamp = ktime_get_boottime_ns();
>>>
>>> line could also be moved to mali_c55_stats_fill_buffer(), which would
>>> make sure the timestamp is filled in case of DMA submission failures.
>> Okedokey
>>
>>>> +		goto out_unlock;
>>>> +	}
>>>> +
>>>> +	if (!--buf->segments_remaining)
>>>> +		vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_DONE);
>>>> +
>>>> +out_unlock:
>>>> +	spin_unlock(&buf->lock);
>>>> +}
>>>> +
>>>> +static int mali_c55_stats_dma_xfer(struct mali_c55_stats *stats, dma_addr_t src,
>>>> +				   dma_addr_t dst,
>>>> +				   struct mali_c55_stats_buf *buf,
>>>> +				   size_t length,
>>>> +				   void (*callback)(void *, const struct dmaengine_result *result))
>>> The same callback is used for both invocations of this function, you can
>>> drop the parameter and hardcode it below.
>> Yeah, not even sure now why I had a parameter.
>>
>>>> +{
>>>> +	struct dma_async_tx_descriptor *tx;
>>>> +	dma_cookie_t cookie;
>>>> +
>>>> +	tx = dmaengine_prep_dma_memcpy(stats->channel, dst, src, length, 0);
>>>> +	if (!tx) {
>>>> +		dev_err(stats->mali_c55->dev, "failed to prep stats DMA\n");
>>>> +		return -EIO;
>>>> +	}
>>>> +
>>>> +	tx->callback_result = callback;
>>>> +	tx->callback_param = buf;
>>>> +
>>>> +	cookie = dmaengine_submit(tx);
>>>> +	if (dma_submit_error(cookie)) {
>>>> +		dev_err(stats->mali_c55->dev, "failed to submit stats DMA\n");
>>>> +		return -EIO;
>>>> +	}
>>>> +
>>>> +	dma_async_issue_pending(stats->channel);
>>>> +	return 0;
>>>> +}
>>>> +
>>>> +void mali_c55_stats_fill_buffer(struct mali_c55 *mali_c55,
>>>> +				enum mali_c55_config_spaces cfg_space)
>>>> +{
>>>> +	struct mali_c55_ctx *ctx = mali_c55_get_active_context(mali_c55);
>>>> +	struct mali_c55_stats *stats = &mali_c55->stats;
>>>> +	struct mali_c55_stats_buf *buf = NULL;
>>>> +	dma_addr_t src, dst;
>>>> +	int ret;
>>>> +
>>>> +	spin_lock(&stats->buffers.lock);
>>>> +	if (!list_empty(&stats->buffers.queue)) {
>>>> +		buf = list_first_entry(&stats->buffers.queue,
>>>> +				       struct mali_c55_stats_buf, queue);
>>>> +		list_del(&buf->queue);
>>>> +	}
>>>> +	spin_unlock(&stats->buffers.lock);
>>>> +
>>>> +	if (!buf)
>>>> +		return;
>>>> +
>>>> +	buf->vb.sequence = mali_c55->isp.frame_sequence;
>>>> +
>>>> +	/*
>>>> +	 * There are infact two noncontiguous sections of the ISP's
>>> s/infact/in fact/
>>>
>>>> +	 * memory space that hold statistics for 3a algorithms to use. A
>>> s/use. A/use: a/
>>>
>>>> +	 * section in each config space and a global section holding
>>>> +	 * histograms which is double buffered and so holds data for the
>>>> +	 * last frame. We need to read both.
>>>> +	 */
>>>> +	src = ctx->base + MALI_C55_REG_1024BIN_HIST;
>>>> +	dst = vb2_dma_contig_plane_dma_addr(&buf->vb.vb2_buf, 0);
>>>> +
>>>> +	ret = mali_c55_stats_dma_xfer(stats, src, dst, buf,
>>>> +				      MALI_C55_1024BIN_HIST_SIZE,
>>>> +				      mali_c55_stats_metering_complete);
>>>> +	if (ret)
>>>> +		goto err_fail_buffer;
>>>> +
>>>> +	src = ctx->base + metering_space_addrs[cfg_space];
>>>> +	dst += MALI_C55_1024BIN_HIST_SIZE;
>>>> +
>>>> +	ret = mali_c55_stats_dma_xfer(
>>>> +		stats, src, dst, buf,
>>>> +		sizeof(struct mali_c55_stats_buffer) - MALI_C55_1024BIN_HIST_SIZE,
>>>> +		mali_c55_stats_metering_complete);
>>>> +	if (ret) {
>>>> +		dmaengine_terminate_sync(stats->channel);
>>>> +		goto err_fail_buffer;
>>>> +	}
>>> I think you will need to terminate DMA transfers at stream off time.
>>>
>>>> +
>>>> +	return;
>>>> +
>>>> +err_fail_buffer:
>>>> +	vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_ERROR);
>>>> +}
>>>> +
>>>> +void mali_c55_unregister_stats(struct mali_c55 *mali_c55)
>>>> +{
>>>> +	struct mali_c55_stats *stats = &mali_c55->stats;
>>>> +
>>>> +	if (!video_is_registered(&stats->vdev))
>>>> +		return;
>>>> +
>>>> +	vb2_video_unregister_device(&stats->vdev);
>>>> +	media_entity_cleanup(&stats->vdev.entity);
>>>> +	dma_release_channel(stats->channel);
>>>> +	mutex_destroy(&stats->lock);
>>>> +}
>>>> +
>>>> +int mali_c55_register_stats(struct mali_c55 *mali_c55)
>>>> +{
>>>> +	struct mali_c55_stats *stats = &mali_c55->stats;
>>>> +	struct video_device *vdev = &stats->vdev;
>>>> +	struct vb2_queue *vb2q = &stats->queue;
>>>> +	dma_cap_mask_t mask;
>>>> +	int ret;
>>>> +
>>>> +	mutex_init(&stats->lock);
>>>> +	INIT_LIST_HEAD(&stats->buffers.queue);
>>>> +
>>>> +	dma_cap_zero(mask);
>>>> +	dma_cap_set(DMA_MEMCPY, mask);
>>>> +
>>>> +	stats->channel = dma_request_channel(mask, 0, NULL);
>>> Do we need a CPU fallback in case no DMA is available ?
>> Yes, actually.
>>
>>> I'm still very curious to know how long it takes to perform the DMA
>>> transfer, compared to copying the data with the CPU, and especially
>>> compared to the frame duration.
>> On my list of things to test and report :)
> Looking forward to it :-)
>
>>>> +	if (!stats->channel) {
>>>> +		ret = -ENODEV;
>>>> +		goto err_destroy_mutex;
>>>> +	}
>>>> +
>>>> +	stats->pad.flags = MEDIA_PAD_FL_SINK;
>>>> +	ret = media_entity_pads_init(&stats->vdev.entity, 1, &stats->pad);
>>>> +	if (ret)
>>>> +		goto err_release_dma_channel;
>>>> +
>>>> +	vb2q->type = V4L2_BUF_TYPE_META_CAPTURE;
>>>> +	vb2q->io_modes = VB2_MMAP | VB2_DMABUF;
>>>> +	vb2q->drv_priv = stats;
>>>> +	vb2q->mem_ops = &vb2_dma_contig_memops;
>>>> +	vb2q->ops = &mali_c55_stats_vb2_ops;
>>>> +	vb2q->buf_struct_size = sizeof(struct mali_c55_stats_buf);
>>>> +	vb2q->min_queued_buffers = 1;
>>>> +	vb2q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
>>>> +	vb2q->lock = &stats->lock;
>>>> +	vb2q->dev = mali_c55->dev;
>>> That's not the right device. The device that performs the DMA operation
>>> is the DMA engine, and that's what you need to pass to vb2. Otherwise
>>> the DMA address returned by vb2_dma_contig_plane_dma_addr() will be
>>> mapped to the ISP device, not the DMA engine. In practice, if neither
>>> are behind an IOMMU, things will likely work, but when that's not the
>>> case, run into problems.
>>>
>>>> +
>>>> +	ret = vb2_queue_init(vb2q);
>>>> +	if (ret) {
>>>> +		dev_err(mali_c55->dev, "stats vb2 queue init failed\n");
>>>> +		goto err_cleanup_entity;
>>>> +	}
>>>> +
>>>> +	strscpy(stats->vdev.name, "mali-c55 3a stats", sizeof(stats->vdev.name));
>>> s/3a //
>>>
>>>> +	vdev->release = video_device_release_empty;
>>> That's never right. You should refcount the data structures to ensure
>>> proper lifetime management.
>>>
>>>> +	vdev->fops = &mali_c55_stats_v4l2_fops;
>>>> +	vdev->ioctl_ops = &mali_c55_stats_v4l2_ioctl_ops;
>>>> +	vdev->lock = &stats->lock;
>>>> +	vdev->v4l2_dev = &mali_c55->v4l2_dev;
>>>> +	vdev->queue = &stats->queue;
>>>> +	vdev->device_caps = V4L2_CAP_META_CAPTURE | V4L2_CAP_STREAMING;
>>>> +	vdev->vfl_dir = VFL_DIR_RX;
>>>> +	video_set_drvdata(vdev, stats);
>>>> +
>>>> +	ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
>>>> +	if (ret) {
>>>> +		dev_err(mali_c55->dev,
>>>> +			"failed to register stats video device\n");
>>>> +		goto err_release_vb2q;
>>>> +	}
>>>> +
>>>> +	stats->mali_c55 = mali_c55;
>>>> +
>>>> +	return 0;
>>>> +
>>>> +err_release_vb2q:
>>>> +	vb2_queue_release(vb2q);
>>>> +err_cleanup_entity:
>>>> +	media_entity_cleanup(&stats->vdev.entity);
>>>> +err_release_dma_channel:
>>>> +	dma_release_channel(stats->channel);
>>>> +err_destroy_mutex:
>>>> +	mutex_destroy(&stats->lock);
>>>> +
>>>> +	return ret;
>>>> +}

