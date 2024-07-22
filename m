Return-Path: <linux-media+bounces-15280-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D1059396BC
	for <lists+linux-media@lfdr.de>; Tue, 23 Jul 2024 00:55:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 60A861C216FC
	for <lists+linux-media@lfdr.de>; Mon, 22 Jul 2024 22:55:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E97D04776A;
	Mon, 22 Jul 2024 22:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="hov9o8uj"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85AF01401B;
	Mon, 22 Jul 2024 22:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721688931; cv=none; b=VGNjIOXDQkZsxlE1szGNmFmcF3Ou5Ypgos55E4uPkVuaJo2KbBF7gUzVgf7GAA1VY9fCJEM7vAIo4+d3oNsV+XHCLGc8N3GY+LUO8GibkccFAJP/LJLtOJ34AMxEj2+5FZxbhCEnFEn4iRaF71ybtWvV3OU/DgBK/IgCL2ZAm58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721688931; c=relaxed/simple;
	bh=BKRb8joyG1Rwe3eoIdlmXl2NFGDEXCr24Oehf/Eoo8s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Us+l9R0YJhSvqf+RxBCE7aC+uiCGnnaKMlKCgeot3qNRxM57QLKtJP/1v6b4Zmlgwa9vHgL50HiRb5jknoaTO8JxiStuBU40yqbtVcvU1qSeeNkutOOsIqYx/b31th9fx10ere6PATMidk9jKW8ghivuuzJAZ/x+f6nXoYa+Euc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=hov9o8uj; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4DCEE7E2;
	Tue, 23 Jul 2024 00:54:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1721688884;
	bh=BKRb8joyG1Rwe3eoIdlmXl2NFGDEXCr24Oehf/Eoo8s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hov9o8ujPCFMXwZSpRCQmam1QtephDBVB/nHWQpzx5tthLPYu/XZjDnNIvGALSdpQ
	 oIo5TO4FL082nmQNdCK5xqkWCtX4vunKHjlBz4gyTzYQgw+SxIG89M4PIgyGJ7/VlY
	 1O9Ivtpg6BsGUL/ntJoDnSnq3kcdmXukay/viOkg=
Date: Tue, 23 Jul 2024 01:55:07 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Daniel Scally <dan.scally@ideasonboard.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, jacopo.mondi@ideasonboard.com,
	nayden.kanchev@arm.com, robh+dt@kernel.org, mchehab@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	jerome.forissier@linaro.org, kieran.bingham@ideasonboard.com,
	sakari.ailus@iki.fi
Subject: Re: [PATCH v6 12/18] media: platform: Add mali-c55 3a stats devnode
Message-ID: <20240722225507.GC32300@pendragon.ideasonboard.com>
References: <20240709132906.3198927-1-dan.scally@ideasonboard.com>
 <20240709132906.3198927-13-dan.scally@ideasonboard.com>
 <20240722145058.GH5732@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240722145058.GH5732@pendragon.ideasonboard.com>

On Mon, Jul 22, 2024 at 05:51:00PM +0300, Laurent Pinchart wrote:
> Hi Dan,
> 
> Thank you for the patch.
> 
> On Tue, Jul 09, 2024 at 02:29:00PM +0100, Daniel Scally wrote:
> > Add a new code file to govern the 3a statistics capture node.
> > 
> > Acked-by: Nayden Kanchev  <nayden.kanchev@arm.com>
> > Co-developed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> > ---
> > Changes in v6:
> > 
> > 	- Fixed mising includes
> > 	- Minor renames and formatting
> > 	- Reworked mali_c55_stats_metering_complete() so it could only return
> > 	  buffers when both halves of the DMA read were done
> > 	- Terminate dma transfers on streamoff
> > 	
> > Changes in v5:
> > 
> > 	- New patch
> > 
> >  drivers/media/platform/arm/mali-c55/Makefile  |   1 +
> >  .../platform/arm/mali-c55/mali-c55-common.h   |  29 ++
> >  .../platform/arm/mali-c55/mali-c55-core.c     |  15 +
> >  .../platform/arm/mali-c55/mali-c55-isp.c      |  11 +
> >  .../arm/mali-c55/mali-c55-registers.h         |   3 +
> >  .../platform/arm/mali-c55/mali-c55-stats.c    | 373 ++++++++++++++++++
> >  6 files changed, 432 insertions(+)
> >  create mode 100644 drivers/media/platform/arm/mali-c55/mali-c55-stats.c
> > 
> > diff --git a/drivers/media/platform/arm/mali-c55/Makefile b/drivers/media/platform/arm/mali-c55/Makefile
> > index 9178ac35e50e..b5a22d414479 100644
> > --- a/drivers/media/platform/arm/mali-c55/Makefile
> > +++ b/drivers/media/platform/arm/mali-c55/Makefile
> > @@ -4,6 +4,7 @@ mali-c55-y := mali-c55-capture.o \
> >  	      mali-c55-core.o \
> >  	      mali-c55-isp.o \
> >  	      mali-c55-resizer.o \
> > +	      mali-c55-stats.o \
> >  	      mali-c55-tpg.o
> >  
> >  obj-$(CONFIG_VIDEO_MALI_C55) += mali-c55.o
> > diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-common.h b/drivers/media/platform/arm/mali-c55/mali-c55-common.h
> > index f7764a938e9f..136c785c68ba 100644
> > --- a/drivers/media/platform/arm/mali-c55/mali-c55-common.h
> > +++ b/drivers/media/platform/arm/mali-c55/mali-c55-common.h
> > @@ -49,6 +49,7 @@ enum mali_c55_isp_pads {
> >  	MALI_C55_ISP_PAD_SINK_VIDEO,
> >  	MALI_C55_ISP_PAD_SOURCE_VIDEO,
> >  	MALI_C55_ISP_PAD_SOURCE_BYPASS,
> > +	MALI_C55_ISP_PAD_SOURCE_STATS,
> >  	MALI_C55_ISP_NUM_PADS,
> >  };
> >  
> > @@ -160,6 +161,29 @@ struct mali_c55_cap_dev {
> >  	bool streaming;
> >  };
> >  
> > +struct mali_c55_stats_buf {
> > +	struct vb2_v4l2_buffer vb;
> > +	unsigned int segments_remaining;
> > +	struct list_head queue;
> > +	bool failed;
> > +};
> > +
> > +struct mali_c55_stats {
> > +	struct mali_c55 *mali_c55;
> > +	struct video_device vdev;
> > +	struct dma_chan *channel;
> > +	struct vb2_queue queue;
> > +	struct media_pad pad;
> > +	/* Mutex to provide to vb2 */
> > +	struct mutex lock;
> > +
> > +	struct {
> > +		/* Spinlock to guard buffer queue */
> > +		spinlock_t lock;
> > +		struct list_head queue;
> > +	} buffers;
> > +};
> > +
> >  enum mali_c55_config_spaces {
> >  	MALI_C55_CONFIG_PING,
> >  	MALI_C55_CONFIG_PONG,
> > @@ -202,6 +226,7 @@ struct mali_c55 {
> >  	struct mali_c55_isp isp;
> >  	struct mali_c55_resizer resizers[MALI_C55_NUM_RSZS];
> >  	struct mali_c55_cap_dev cap_devs[MALI_C55_NUM_CAP_DEVS];
> > +	struct mali_c55_stats stats;
> >  
> >  	struct mali_c55_context context;
> >  	enum mali_c55_config_spaces next_config;
> > @@ -229,6 +254,8 @@ int mali_c55_register_resizers(struct mali_c55 *mali_c55);
> >  void mali_c55_unregister_resizers(struct mali_c55 *mali_c55);
> >  int mali_c55_register_capture_devs(struct mali_c55 *mali_c55);
> >  void mali_c55_unregister_capture_devs(struct mali_c55 *mali_c55);
> > +int mali_c55_register_stats(struct mali_c55 *mali_c55);
> > +void mali_c55_unregister_stats(struct mali_c55 *mali_c55);
> >  struct mali_c55_context *mali_c55_get_active_context(struct mali_c55 *mali_c55);
> >  void mali_c55_set_plane_done(struct mali_c55_cap_dev *cap_dev,
> >  			     enum mali_c55_planes plane);
> > @@ -243,5 +270,7 @@ const struct mali_c55_isp_fmt *
> >  mali_c55_isp_get_mbus_config_by_code(u32 code);
> >  const struct mali_c55_isp_fmt *
> >  mali_c55_isp_get_mbus_config_by_index(u32 index);
> > +void mali_c55_stats_fill_buffer(struct mali_c55 *mali_c55,
> > +				enum mali_c55_config_spaces cfg_space);
> >  
> >  #endif /* _MALI_C55_COMMON_H */
> > diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-core.c b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
> > index dbc07d12d3a3..eedc8f450184 100644
> > --- a/drivers/media/platform/arm/mali-c55/mali-c55-core.c
> > +++ b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
> > @@ -374,6 +374,16 @@ static int mali_c55_create_links(struct mali_c55 *mali_c55)
> >  		}
> >  	}
> >  
> > +	ret = media_create_pad_link(&mali_c55->isp.sd.entity,
> > +				    MALI_C55_ISP_PAD_SOURCE_STATS,
> > +				    &mali_c55->stats.vdev.entity, 0,
> > +				    MEDIA_LNK_FL_ENABLED);
> > +	if (ret) {
> > +		dev_err(mali_c55->dev,
> > +			"failed to link ISP and 3a stats node\n");
> > +		goto err_remove_links;
> > +	}
> > +
> >  	return 0;
> >  
> >  err_remove_links:
> > @@ -388,6 +398,7 @@ static void mali_c55_unregister_entities(struct mali_c55 *mali_c55)
> >  	mali_c55_unregister_isp(mali_c55);
> >  	mali_c55_unregister_resizers(mali_c55);
> >  	mali_c55_unregister_capture_devs(mali_c55);
> > +	mali_c55_unregister_stats(mali_c55);
> >  }
> >  
> >  static int mali_c55_register_entities(struct mali_c55 *mali_c55)
> > @@ -410,6 +421,10 @@ static int mali_c55_register_entities(struct mali_c55 *mali_c55)
> >  	if (ret)
> >  		goto err_unregister_entities;
> >  
> > +	ret = mali_c55_register_stats(mali_c55);
> > +	if (ret)
> > +		goto err_unregister_entities;
> > +
> >  	ret = mali_c55_create_links(mali_c55);
> >  	if (ret)
> >  		goto err_unregister_entities;
> > diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-isp.c b/drivers/media/platform/arm/mali-c55/mali-c55-isp.c
> > index f784983a4ccc..2f450c00300a 100644
> > --- a/drivers/media/platform/arm/mali-c55/mali-c55-isp.c
> > +++ b/drivers/media/platform/arm/mali-c55/mali-c55-isp.c
> > @@ -5,6 +5,8 @@
> >   * Copyright (C) 2024 Ideas on Board Oy
> >   */
> >  
> > +#include <linux/media/arm/mali-c55-config.h>
> > +
> >  #include <linux/delay.h>
> >  #include <linux/iopoll.h>
> >  #include <linux/property.h>
> > @@ -460,6 +462,14 @@ static int mali_c55_isp_init_state(struct v4l2_subdev *sd,
> >  	in_crop->width = MALI_C55_DEFAULT_WIDTH;
> >  	in_crop->height = MALI_C55_DEFAULT_HEIGHT;
> >  
> > +	src_fmt = v4l2_subdev_state_get_format(state,
> > +					       MALI_C55_ISP_PAD_SOURCE_STATS);
> > +
> > +	src_fmt->width = sizeof(struct mali_c55_stats_buffer);
> > +	src_fmt->height = 1;
> 
> According to
> https://docs.kernel.org/userspace-api/media/v4l/subdev-formats.html#metadata-formats,
> width and height should be set to 0 for MEDIA_BUS_FMT_METADATA_FIXED. I
> haven't checked if v4l2-compliance expects this, we may have
> discrepancies between the API documentation and the existing
> implementations in the kernel and userspace. In any case, this should be
> sorted out, either by fixing the kernel code and enforcing the
> requirement in v4l2-compliance, or fixing the documentation.
> 
> > +	src_fmt->field = V4L2_FIELD_NONE;
> > +	src_fmt->code = MEDIA_BUS_FMT_METADATA_FIXED;
> > +
> >  	return 0;
> >  }
> >  
> > @@ -490,6 +500,7 @@ int mali_c55_register_isp(struct mali_c55 *mali_c55)
> >  						       MEDIA_PAD_FL_MUST_CONNECT;
> >  	isp->pads[MALI_C55_ISP_PAD_SOURCE_VIDEO].flags = MEDIA_PAD_FL_SOURCE;
> >  	isp->pads[MALI_C55_ISP_PAD_SOURCE_BYPASS].flags = MEDIA_PAD_FL_SOURCE;
> > +	isp->pads[MALI_C55_ISP_PAD_SOURCE_STATS].flags = MEDIA_PAD_FL_SOURCE;
> >  
> >  	ret = media_entity_pads_init(&sd->entity, MALI_C55_ISP_NUM_PADS,
> >  				     isp->pads);
> > diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-registers.h b/drivers/media/platform/arm/mali-c55/mali-c55-registers.h
> > index 0a391f8a043e..e72e749b81d5 100644
> > --- a/drivers/media/platform/arm/mali-c55/mali-c55-registers.h
> > +++ b/drivers/media/platform/arm/mali-c55/mali-c55-registers.h
> > @@ -103,6 +103,9 @@ enum mali_c55_interrupts {
> >  #define MALI_C55_VC_START(v)				((v) & 0xffff)
> >  #define MALI_C55_VC_SIZE(v)				(((v) & 0xffff) << 16)
> >  
> > +#define MALI_C55_REG_1024BIN_HIST			0x054a8
> > +#define MALI_C55_1024BIN_HIST_SIZE			4096
> > +
> >  /* Ping/Pong Configuration Space */
> >  #define MALI_C55_REG_BASE_ADDR				0x18e88
> >  #define MALI_C55_REG_BYPASS_0				0x18eac
> > diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-stats.c b/drivers/media/platform/arm/mali-c55/mali-c55-stats.c
> > new file mode 100644
> > index 000000000000..38a17fb5d052
> > --- /dev/null
> > +++ b/drivers/media/platform/arm/mali-c55/mali-c55-stats.c
> > @@ -0,0 +1,373 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * ARM Mali-C55 ISP Driver - 3A Statistics capture device
> > + *
> > + * Copyright (C) 2023 Ideas on Board Oy
> > + */
> > +
> > +#include <linux/container_of.h>
> > +#include <linux/dev_printk.h>
> > +#include <linux/dmaengine.h>
> > +#include <linux/list.h>
> > +#include <linux/media/arm/mali-c55-config.h>
> > +#include <linux/mutex.h>
> > +#include <linux/spinlock.h>
> > +#include <linux/string.h>
> > +
> > +#include <media/media-entity.h>
> > +#include <media/v4l2-dev.h>
> > +#include <media/v4l2-event.h>
> > +#include <media/v4l2-fh.h>
> > +#include <media/v4l2-ioctl.h>
> > +#include <media/videobuf2-core.h>
> > +#include <media/videobuf2-dma-contig.h>
> > +
> > +#include "mali-c55-common.h"
> > +#include "mali-c55-registers.h"
> > +
> > +static const unsigned int metering_space_addrs[] = {
> > +	[MALI_C55_CONFIG_PING] = 0x095ac,
> > +	[MALI_C55_CONFIG_PONG] = 0x2156c,
> > +};
> > +
> > +static int mali_c55_stats_enum_fmt_meta_cap(struct file *file, void *fh,
> > +					    struct v4l2_fmtdesc *f)
> > +{
> > +	if (f->index)
> > +		return -EINVAL;
> > +
> > +	f->pixelformat = V4L2_META_FMT_MALI_C55_STATS;
> > +
> > +	return 0;
> > +}
> > +
> > +static int mali_c55_stats_g_fmt_meta_cap(struct file *file, void *fh,
> > +					 struct v4l2_format *f)
> > +{
> > +	static const struct v4l2_meta_format mfmt = {
> > +		.dataformat = V4L2_META_FMT_MALI_C55_STATS,
> > +		.buffersize = sizeof(struct mali_c55_stats_buffer)
> > +	};
> > +
> > +	f->fmt.meta = mfmt;
> > +
> > +	return 0;
> > +}
> > +
> > +static int mali_c55_stats_querycap(struct file *file,
> > +				   void *priv, struct v4l2_capability *cap)
> > +{
> > +	strscpy(cap->driver, MALI_C55_DRIVER_NAME, sizeof(cap->driver));
> > +	strscpy(cap->card, "ARM Mali-C55 ISP", sizeof(cap->card));
> > +
> > +	return 0;
> > +}
> > +
> > +static const struct v4l2_ioctl_ops mali_c55_stats_v4l2_ioctl_ops = {
> > +	.vidioc_reqbufs = vb2_ioctl_reqbufs,
> > +	.vidioc_querybuf = vb2_ioctl_querybuf,
> > +	.vidioc_create_bufs = vb2_ioctl_create_bufs,
> > +	.vidioc_qbuf = vb2_ioctl_qbuf,
> > +	.vidioc_expbuf = vb2_ioctl_expbuf,
> > +	.vidioc_dqbuf = vb2_ioctl_dqbuf,
> > +	.vidioc_prepare_buf = vb2_ioctl_prepare_buf,
> > +	.vidioc_streamon = vb2_ioctl_streamon,
> > +	.vidioc_streamoff = vb2_ioctl_streamoff,
> > +	.vidioc_enum_fmt_meta_cap = mali_c55_stats_enum_fmt_meta_cap,
> > +	.vidioc_g_fmt_meta_cap = mali_c55_stats_g_fmt_meta_cap,
> > +	.vidioc_s_fmt_meta_cap = mali_c55_stats_g_fmt_meta_cap,
> > +	.vidioc_try_fmt_meta_cap = mali_c55_stats_g_fmt_meta_cap,
> > +	.vidioc_querycap = mali_c55_stats_querycap,
> > +	.vidioc_subscribe_event = v4l2_ctrl_subscribe_event,
> > +	.vidioc_unsubscribe_event = v4l2_event_unsubscribe,
> > +};
> > +
> > +static const struct v4l2_file_operations mali_c55_stats_v4l2_fops = {
> > +	.owner = THIS_MODULE,
> > +	.unlocked_ioctl = video_ioctl2,
> > +	.open = v4l2_fh_open,
> > +	.release = vb2_fop_release,
> > +	.poll = vb2_fop_poll,
> > +	.mmap = vb2_fop_mmap,
> > +};
> > +
> > +static int
> > +mali_c55_stats_queue_setup(struct vb2_queue *q, unsigned int *num_buffers,
> > +			   unsigned int *num_planes, unsigned int sizes[],
> > +			   struct device *alloc_devs[])
> > +{
> > +	struct mali_c55_stats *stats = vb2_get_drv_priv(q);
> > +
> > +	if (*num_planes && *num_planes > 1)
> > +		return -EINVAL;
> > +
> > +	if (sizes[0] && sizes[0] < sizeof(struct mali_c55_stats_buffer))
> > +		return -EINVAL;
> > +
> > +	*num_planes = 1;
> > +
> > +	if (!sizes[0])
> > +		sizes[0] = sizeof(struct mali_c55_stats_buffer);
> > +
> > +	if (stats->channel)
> > +		alloc_devs[0] = stats->channel->device->dev;
> > +
> > +	return 0;
> > +}
> > +
> > +static void mali_c55_stats_buf_queue(struct vb2_buffer *vb)
> > +{
> > +	struct mali_c55_stats *stats = vb2_get_drv_priv(vb->vb2_queue);
> > +	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
> > +	struct mali_c55_stats_buf *buf = container_of(vbuf,
> > +						struct mali_c55_stats_buf, vb);
> > +
> > +	vb2_set_plane_payload(vb, 0, sizeof(struct mali_c55_stats_buffer));
> > +	buf->segments_remaining = 2;
> > +	buf->failed = false;
> > +
> > +	spin_lock(&stats->buffers.lock);
> > +	list_add_tail(&buf->queue, &stats->buffers.queue);
> > +	spin_unlock(&stats->buffers.lock);
> > +}
> > +
> > +static int mali_c55_stats_start_streaming(struct vb2_queue *q,
> > +					  unsigned int count)
> > +{
> > +	struct mali_c55_stats *stats = vb2_get_drv_priv(q);
> > +	struct mali_c55 *mali_c55 = stats->mali_c55;
> > +	int ret;
> > +
> > +	ret = video_device_pipeline_start(&stats->vdev,
> > +					  &stats->mali_c55->pipe);
> > +	if (ret)
> > +		return ret;
> > +
> > +	if (mali_c55->pipe.start_count == mali_c55->pipe.required_count) {
> > +		ret = v4l2_subdev_enable_streams(&mali_c55->isp.sd,
> > +						 MALI_C55_ISP_PAD_SOURCE_VIDEO,
> > +						 BIT(0));
> > +		if (ret)
> > +			goto err_stop_pipeline;
> > +	}
> > +
> > +	return 0;
> > +
> > +err_stop_pipeline:
> > +	video_device_pipeline_stop(&stats->vdev);
> > +
> > +	return ret;
> > +}
> > +
> > +static void mali_c55_stats_stop_streaming(struct vb2_queue *q)
> > +{
> > +	struct mali_c55_stats *stats = vb2_get_drv_priv(q);
> > +	struct mali_c55_stats_buf *buf, *tmp;
> > +
> > +	dmaengine_terminate_sync(stats->channel);
> > +
> > +	spin_lock(&stats->buffers.lock);
> > +
> > +	list_for_each_entry_safe(buf, tmp, &stats->buffers.queue, queue) {
> > +		list_del(&buf->queue);
> > +		vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_ERROR);
> > +	}
> > +
> > +	spin_unlock(&stats->buffers.lock);
> > +
> > +	video_device_pipeline_stop(&stats->vdev);

There's a lack of symmetry here, you call v4l2_subdev_enable_streams()
in mali_c55_stats_start_streaming() but you don't call
v4l2_subdev_disable_streams() anywhere. Is that intentional ?

> > +}
> > +
> > +static const struct vb2_ops mali_c55_stats_vb2_ops = {
> > +	.queue_setup = mali_c55_stats_queue_setup,
> > +	.buf_queue = mali_c55_stats_buf_queue,
> > +	.wait_prepare = vb2_ops_wait_prepare,
> > +	.wait_finish = vb2_ops_wait_finish,
> > +	.start_streaming = mali_c55_stats_start_streaming,
> > +	.stop_streaming = mali_c55_stats_stop_streaming,
> > +};
> > +
> > +static void
> > +mali_c55_stats_metering_complete(void *param,
> > +				 const struct dmaengine_result *result)
> > +{
> > +	struct mali_c55_stats_buf *buf = param;
> > +
> > +	if (result->result != DMA_TRANS_NOERROR)
> > +		buf->failed = true;
> > +
> > +	if (!--buf->segments_remaining)
> > +		vb2_buffer_done(&buf->vb.vb2_buf, buf->failed ?
> > +				VB2_BUF_STATE_ERROR : VB2_BUF_STATE_DONE);
> > +}
> > +
> > +static int mali_c55_stats_dma_xfer(struct mali_c55_stats *stats, dma_addr_t src,
> > +				   dma_addr_t dst,
> > +				   struct mali_c55_stats_buf *buf,
> > +				   size_t length)
> > +{
> > +	struct dma_async_tx_descriptor *tx;
> > +	dma_cookie_t cookie;
> > +
> > +	tx = dmaengine_prep_dma_memcpy(stats->channel, dst, src, length, 0);
> > +	if (!tx) {
> > +		dev_err(stats->mali_c55->dev, "failed to prep stats DMA\n");
> > +		return -EIO;
> > +	}
> > +
> > +	tx->callback_result = mali_c55_stats_metering_complete;
> > +	tx->callback_param = buf;
> > +
> > +	cookie = dmaengine_submit(tx);
> > +	if (dma_submit_error(cookie)) {
> > +		dev_err(stats->mali_c55->dev, "failed to submit stats DMA\n");
> > +		return -EIO;
> > +	}
> > +
> > +	dma_async_issue_pending(stats->channel);

You could possibly lower the overhead a bit by calling
dma_async_issue_pending() only once after submitting the two transfers.
It may not make any real difference though, I don't recall the details.

> > +	return 0;
> > +}
> > +
> > +void mali_c55_stats_fill_buffer(struct mali_c55 *mali_c55,
> > +				enum mali_c55_config_spaces cfg_space)
> > +{
> > +	struct mali_c55_context *ctx = mali_c55_get_active_context(mali_c55);
> > +	struct mali_c55_stats *stats = &mali_c55->stats;
> > +	struct mali_c55_stats_buf *buf = NULL;
> > +	dma_addr_t src, dst;
> > +	size_t length;
> > +	int ret;
> > +
> > +	spin_lock(&stats->buffers.lock);
> > +	if (!list_empty(&stats->buffers.queue)) {
> > +		buf = list_first_entry(&stats->buffers.queue,
> > +				       struct mali_c55_stats_buf, queue);
> > +		list_del(&buf->queue);
> > +	}
> > +	spin_unlock(&stats->buffers.lock);
> > +
> > +	if (!buf)
> > +		return;
> > +
> > +	buf->vb.sequence = mali_c55->isp.frame_sequence;
> > +	buf->vb.vb2_buf.timestamp = ktime_get_boottime_ns();
> > +
> > +	/*
> > +	 * There are in fact two noncontiguous sections of the ISP's
> > +	 * memory space that hold statistics for 3a algorithms to use: A
> > +	 * section in each config space and a global section holding
> > +	 * histograms which is double buffered and so holds data for the
> > +	 * last frame. We need to read both.
> > +	 */
> > +	src = ctx->base + MALI_C55_REG_1024BIN_HIST;
> > +	dst = vb2_dma_contig_plane_dma_addr(&buf->vb.vb2_buf, 0);
> > +
> > +	ret = mali_c55_stats_dma_xfer(stats, src, dst, buf,
> > +				      MALI_C55_1024BIN_HIST_SIZE);
> > +	if (ret)
> > +		goto err_fail_buffer;
> > +
> > +	src = ctx->base + metering_space_addrs[cfg_space];
> > +	dst += MALI_C55_1024BIN_HIST_SIZE;
> > +
> > +	length = sizeof(struct mali_c55_stats_buffer) - MALI_C55_1024BIN_HIST_SIZE;
> > +	ret = mali_c55_stats_dma_xfer(stats, src, dst, buf, length);
> > +	if (ret) {
> > +		dmaengine_terminate_sync(stats->channel);
> > +		goto err_fail_buffer;
> > +	}
> > +
> > +	return;
> > +
> > +err_fail_buffer:
> > +	vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_ERROR);
> > +}
> > +
> > +void mali_c55_unregister_stats(struct mali_c55 *mali_c55)
> > +{
> > +	struct mali_c55_stats *stats = &mali_c55->stats;
> > +
> > +	if (!video_is_registered(&stats->vdev))
> > +		return;
> > +
> > +	vb2_video_unregister_device(&stats->vdev);
> > +	media_entity_cleanup(&stats->vdev.entity);
> > +	dma_release_channel(stats->channel);
> > +	mutex_destroy(&stats->lock);
> > +}
> > +
> > +int mali_c55_register_stats(struct mali_c55 *mali_c55)
> > +{
> > +	struct mali_c55_stats *stats = &mali_c55->stats;
> > +	struct video_device *vdev = &stats->vdev;
> > +	struct vb2_queue *vb2q = &stats->queue;
> > +	dma_cap_mask_t mask;
> > +	int ret;
> > +
> > +	mutex_init(&stats->lock);
> > +	INIT_LIST_HEAD(&stats->buffers.queue);
> > +
> > +	dma_cap_zero(mask);
> > +	dma_cap_set(DMA_MEMCPY, mask);
> > +
> > +	stats->channel = dma_request_channel(mask, 0, NULL);
> > +	if (!stats->channel) {
> > +		ret = -ENODEV;
> > +		goto err_destroy_mutex;
> > +	}
> > +
> > +	stats->pad.flags = MEDIA_PAD_FL_SINK;
> > +	ret = media_entity_pads_init(&stats->vdev.entity, 1, &stats->pad);
> > +	if (ret)
> > +		goto err_release_dma_channel;
> > +
> > +	vb2q->type = V4L2_BUF_TYPE_META_CAPTURE;
> > +	vb2q->io_modes = VB2_MMAP | VB2_DMABUF;
> > +	vb2q->drv_priv = stats;
> > +	vb2q->mem_ops = &vb2_dma_contig_memops;
> > +	vb2q->ops = &mali_c55_stats_vb2_ops;
> > +	vb2q->buf_struct_size = sizeof(struct mali_c55_stats_buf);
> > +	vb2q->min_queued_buffers = 1;
> > +	vb2q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
> > +	vb2q->lock = &stats->lock;
> > +	vb2q->dev = stats->channel->device->dev;
> > +
> > +	ret = vb2_queue_init(vb2q);
> > +	if (ret) {
> > +		dev_err(mali_c55->dev, "stats vb2 queue init failed\n");
> > +		goto err_cleanup_entity;
> > +	}
> > +
> > +	strscpy(stats->vdev.name, "mali-c55 3a stats", sizeof(stats->vdev.name));
> > +	vdev->release = video_device_release_empty;

Not a good idea at all, but I won't ask you to fix object lifetime
management in V4L2 as a prerequisite to merging this driver :-)

With those issues addressed,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> > +	vdev->fops = &mali_c55_stats_v4l2_fops;
> > +	vdev->ioctl_ops = &mali_c55_stats_v4l2_ioctl_ops;
> > +	vdev->lock = &stats->lock;
> > +	vdev->v4l2_dev = &mali_c55->v4l2_dev;
> > +	vdev->queue = &stats->queue;
> > +	vdev->device_caps = V4L2_CAP_META_CAPTURE | V4L2_CAP_STREAMING;
> > +	vdev->vfl_dir = VFL_DIR_RX;
> > +	video_set_drvdata(vdev, stats);
> > +
> > +	ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
> > +	if (ret) {
> > +		dev_err(mali_c55->dev,
> > +			"failed to register stats video device\n");
> > +		goto err_release_vb2q;
> > +	}
> > +
> > +	stats->mali_c55 = mali_c55;
> > +
> > +	return 0;
> > +
> > +err_release_vb2q:
> > +	vb2_queue_release(vb2q);
> > +err_cleanup_entity:
> > +	media_entity_cleanup(&stats->vdev.entity);
> > +err_release_dma_channel:
> > +	dma_release_channel(stats->channel);
> > +err_destroy_mutex:
> > +	mutex_destroy(&stats->lock);
> > +
> > +	return ret;
> > +}

-- 
Regards,

Laurent Pinchart

