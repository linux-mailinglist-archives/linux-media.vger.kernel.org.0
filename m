Return-Path: <linux-media+bounces-15605-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AC966942732
	for <lists+linux-media@lfdr.de>; Wed, 31 Jul 2024 08:53:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2DBCD1F22050
	for <lists+linux-media@lfdr.de>; Wed, 31 Jul 2024 06:53:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01C091A4B34;
	Wed, 31 Jul 2024 06:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="vfp7g2QV"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 637184EB38;
	Wed, 31 Jul 2024 06:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722408790; cv=none; b=kozpya4m2hFOUdAmXDduvUzrqk1c3WrqgXKUzI1JM/yjncIGL39a6NeuifUJfW0evi8kfWsPYHM0qNDIDg926G4xznMUpM1N+5+QJAcCg37+9lbbEfi2xGxvTeJY5pLZ3OGBY1rYaL+PG69eoWthC9T3eE8+IjNb2cNjYeRW3i0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722408790; c=relaxed/simple;
	bh=rudCKI+p5Nu4HWZyae2Ij3YeF/fwXFC5uO2AYkNyuFE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uEs8l4QBCfhH1AGhEqw18FujE+mpzUKUl/8qQt3UoW/D3KQfwARIurqzXUPa9B+Rr4WihbuWZlNIwZZLh6ySubiON4Z13Z7SnRpRMZ/uL5aJohFAmb8UD78nnnvS327HUkLRsUP8WxOGc8rDV1fdpX24ljwoYsH9mtkmTLxxSS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=vfp7g2QV; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (mob-109-118-80-99.net.vodafone.it [109.118.80.99])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id F0EA97E4;
	Wed, 31 Jul 2024 08:52:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1722408737;
	bh=rudCKI+p5Nu4HWZyae2Ij3YeF/fwXFC5uO2AYkNyuFE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vfp7g2QVSim3GS/RUle8eIZw/G2b2QEKwnRYkoZoYElORIpkJMENKmcKXeDkjC45N
	 sFrV4zUUPyWcL5KO0GFhKTBjVvqUFmGDSZnkKfc7yR3N3X0ERlsaNLCkXBKxs144ht
	 dJiyug25svfIRkG18bQIiOpxa/bgZkH5ax5ReOjw=
Date: Wed, 31 Jul 2024 08:53:00 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Daniel Scally <dan.scally@ideasonboard.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	jacopo.mondi@ideasonboard.com, nayden.kanchev@arm.com, robh+dt@kernel.org, mchehab@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, jerome.forissier@linaro.org, 
	kieran.bingham@ideasonboard.com, sakari.ailus@iki.fi
Subject: Re: [PATCH v6 17/18] media: platform: Add mali-c55 parameters video
 node
Message-ID: <frso2idgvzjhhnfqyyw5nd5fpfptq6v4rrfj7nuhgnmpb3pe53@qeyigo5wjyi6>
References: <20240709132906.3198927-1-dan.scally@ideasonboard.com>
 <20240709132906.3198927-18-dan.scally@ideasonboard.com>
 <20240730221616.GG8146@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240730221616.GG8146@pendragon.ideasonboard.com>

Hi Laurent

On Wed, Jul 31, 2024 at 01:16:16AM GMT, Laurent Pinchart wrote:
> Hi Dan,
>
> Thank you for the patch.
>
> On Tue, Jul 09, 2024 at 02:29:05PM +0100, Daniel Scally wrote:
> > Add a new code file to the mali-c55 driver that registers an output
> > video node for userspace to queue buffers of parameters to. Handlers
> > are included to program the statistics generation plus the white
> > balance, black level correction and mesh shading correction blocks.
> >
> > Update the rest of the driver to register and link the new video node
> >
> > Acked-by: Nayden Kanchev  <nayden.kanchev@arm.com>
> > Co-developed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> > ---
> > Changes in v6:
> >
> > 	- Used a union to generalise the block pointer rather than resorting to
> > 	  casting everywhere - fantastic idea Sakari, this made it much cleaner.
> > 	- Reworked the loop in mali_c55_params_write_config() so that we can be
> > 	  sure there's remaining space for the next block header.
> >
> > Changes in v5:
> >
> > 	- New patch
> >
> >  drivers/media/platform/arm/mali-c55/Makefile  |   1 +
> >  .../platform/arm/mali-c55/mali-c55-common.h   |  20 +
> >  .../platform/arm/mali-c55/mali-c55-core.c     |  23 +
> >  .../platform/arm/mali-c55/mali-c55-isp.c      |  21 +-
> >  .../platform/arm/mali-c55/mali-c55-params.c   | 671 ++++++++++++++++++
> >  .../arm/mali-c55/mali-c55-registers.h         | 128 ++++
> >  6 files changed, 863 insertions(+), 1 deletion(-)
> >  create mode 100644 drivers/media/platform/arm/mali-c55/mali-c55-params.c
> >
> > diff --git a/drivers/media/platform/arm/mali-c55/Makefile b/drivers/media/platform/arm/mali-c55/Makefile
> > index b5a22d414479..d5718b0b23e0 100644
> > --- a/drivers/media/platform/arm/mali-c55/Makefile
> > +++ b/drivers/media/platform/arm/mali-c55/Makefile
> > @@ -3,6 +3,7 @@
> >  mali-c55-y := mali-c55-capture.o \
> >  	      mali-c55-core.o \
> >  	      mali-c55-isp.o \
> > +	      mali-c55-params.o \
> >  	      mali-c55-resizer.o \
> >  	      mali-c55-stats.o \
> >  	      mali-c55-tpg.o
> > diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-common.h b/drivers/media/platform/arm/mali-c55/mali-c55-common.h
> > index 136c785c68ba..66a46a7c0547 100644
> > --- a/drivers/media/platform/arm/mali-c55/mali-c55-common.h
> > +++ b/drivers/media/platform/arm/mali-c55/mali-c55-common.h
> > @@ -50,6 +50,7 @@ enum mali_c55_isp_pads {
> >  	MALI_C55_ISP_PAD_SOURCE_VIDEO,
> >  	MALI_C55_ISP_PAD_SOURCE_BYPASS,
> >  	MALI_C55_ISP_PAD_SOURCE_STATS,
> > +	MALI_C55_ISP_PAD_SINK_PARAMS,
> >  	MALI_C55_ISP_NUM_PADS,
> >  };
> >
> > @@ -184,6 +185,21 @@ struct mali_c55_stats {
> >  	} buffers;
> >  };
> >
> > +struct mali_c55_params {
> > +	struct mali_c55 *mali_c55;
> > +	struct video_device vdev;
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
> > @@ -226,6 +242,7 @@ struct mali_c55 {
> >  	struct mali_c55_isp isp;
> >  	struct mali_c55_resizer resizers[MALI_C55_NUM_RSZS];
> >  	struct mali_c55_cap_dev cap_devs[MALI_C55_NUM_CAP_DEVS];
> > +	struct mali_c55_params params;
> >  	struct mali_c55_stats stats;
> >
> >  	struct mali_c55_context context;
> > @@ -256,6 +273,8 @@ int mali_c55_register_capture_devs(struct mali_c55 *mali_c55);
> >  void mali_c55_unregister_capture_devs(struct mali_c55 *mali_c55);
> >  int mali_c55_register_stats(struct mali_c55 *mali_c55);
> >  void mali_c55_unregister_stats(struct mali_c55 *mali_c55);
> > +int mali_c55_register_params(struct mali_c55 *mali_c55);
> > +void mali_c55_unregister_params(struct mali_c55 *mali_c55);
> >  struct mali_c55_context *mali_c55_get_active_context(struct mali_c55 *mali_c55);
> >  void mali_c55_set_plane_done(struct mali_c55_cap_dev *cap_dev,
> >  			     enum mali_c55_planes plane);
> > @@ -272,5 +291,6 @@ const struct mali_c55_isp_fmt *
> >  mali_c55_isp_get_mbus_config_by_index(u32 index);
> >  void mali_c55_stats_fill_buffer(struct mali_c55 *mali_c55,
> >  				enum mali_c55_config_spaces cfg_space);
> > +void mali_c55_params_write_config(struct mali_c55 *mali_c55);
> >
> >  #endif /* _MALI_C55_COMMON_H */
> > diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-core.c b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
> > index ed0db34767a4..55b3cbf53791 100644
> > --- a/drivers/media/platform/arm/mali-c55/mali-c55-core.c
> > +++ b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
> > @@ -384,6 +384,16 @@ static int mali_c55_create_links(struct mali_c55 *mali_c55)
> >  		goto err_remove_links;
> >  	}
> >
> > +	ret = media_create_pad_link(&mali_c55->params.vdev.entity, 0,
> > +				    &mali_c55->isp.sd.entity,
> > +				    MALI_C55_ISP_PAD_SINK_PARAMS,
> > +				    MEDIA_LNK_FL_ENABLED);
>
> Should this be immutable, or do you think it makes sense to support
> operating the ISP without parameters ? I know we did so when developing
> the driver to test the initial code, but are there real use cases now ?
>
> > +	if (ret) {
> > +		dev_err(mali_c55->dev,
> > +			"failed to link ISP and parameters video node\n");
> > +		goto err_remove_links;
> > +	}
> > +
> >  	return 0;
> >
> >  err_remove_links:
> > @@ -398,6 +408,7 @@ static void mali_c55_unregister_entities(struct mali_c55 *mali_c55)
> >  	mali_c55_unregister_isp(mali_c55);
> >  	mali_c55_unregister_resizers(mali_c55);
> >  	mali_c55_unregister_capture_devs(mali_c55);
> > +	mali_c55_unregister_params(mali_c55);
> >  	mali_c55_unregister_stats(mali_c55);
> >  }
> >
> > @@ -421,6 +432,10 @@ static int mali_c55_register_entities(struct mali_c55 *mali_c55)
> >  	if (ret)
> >  		goto err_unregister_entities;
> >
> > +	ret = mali_c55_register_params(mali_c55);
> > +	if (ret)
> > +		goto err_unregister_entities;
> > +
> >  	ret = mali_c55_register_stats(mali_c55);
> >  	if (ret)
> >  		goto err_unregister_entities;
> > @@ -620,6 +635,14 @@ static irqreturn_t mali_c55_isr(int irq, void *context)
> >  			curr_config >>= ffs(MALI_C55_REG_PING_PONG_READ_MASK) - 1;
> >  			next_config = curr_config ^ 1;
> >
> > +			/*
> > +			 * Write the configuration parameters received from
> > +			 * userspace into the configuration buffer, which will
> > +			 * be transferred to the 'next' active config space at
> > +			 * by mali_c55_swap_next_config().
> > +			 */
> > +			mali_c55_params_write_config(mali_c55);
> > +
> >  			/*
> >  			 * The ordering of these two is currently important as
> >  			 * mali_c55_stats_fill_buffer() is asynchronous whereas
> > diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-isp.c b/drivers/media/platform/arm/mali-c55/mali-c55-isp.c
> > index 2f450c00300a..40d7ef6eda22 100644
> > --- a/drivers/media/platform/arm/mali-c55/mali-c55-isp.c
> > +++ b/drivers/media/platform/arm/mali-c55/mali-c55-isp.c
> > @@ -132,6 +132,7 @@ static int mali_c55_isp_start(struct mali_c55 *mali_c55)
> >  				 cfg->bypass ? MALI_C55_ISP_RAW_BYPASS_BYPASS_MASK :
> >  					     0x00);
> >
> > +	mali_c55_params_write_config(mali_c55);
> >  	ret = mali_c55_config_write(ctx, MALI_C55_CONFIG_PING);
> >  	if (ret) {
> >  		dev_err(mali_c55->dev, "failed to write ISP config\n");
> > @@ -464,12 +465,17 @@ static int mali_c55_isp_init_state(struct v4l2_subdev *sd,
> >
> >  	src_fmt = v4l2_subdev_state_get_format(state,
> >  					       MALI_C55_ISP_PAD_SOURCE_STATS);
> > +	sink_fmt = v4l2_subdev_state_get_format(state,
> > +						MALI_C55_ISP_PAD_SINK_PARAMS);
> >
> >  	src_fmt->width = sizeof(struct mali_c55_stats_buffer);
> >  	src_fmt->height = 1;
> >  	src_fmt->field = V4L2_FIELD_NONE;
> >  	src_fmt->code = MEDIA_BUS_FMT_METADATA_FIXED;
> >
> > +	*sink_fmt = *src_fmt;
>
> I would initialize the fields individually, I think the code would be
> clearer.
>
> > +	sink_fmt->width = sizeof(struct mali_c55_params_buffer);
> > +
> >  	return 0;
> >  }
> >
> > @@ -477,8 +483,20 @@ static const struct v4l2_subdev_internal_ops mali_c55_isp_internal_ops = {
> >  	.init_state = mali_c55_isp_init_state,
> >  };
> >
> > +static int mali_c55_subdev_link_validate(struct media_link *link)
> > +{
> > +	/*
> > +	 * Skip validation for the parameters sink pad, as the source is not
> > +	 * a subdevice.
> > +	 */
> > +	if (link->sink->index == MALI_C55_ISP_PAD_SINK_PARAMS)
> > +		return 0;
> > +
> > +	return v4l2_subdev_link_validate(link);
> > +}
> > +
> >  static const struct media_entity_operations mali_c55_isp_media_ops = {
> > -	.link_validate		= v4l2_subdev_link_validate,
> > +	.link_validate		= mali_c55_subdev_link_validate,
> >  };
> >
> >  int mali_c55_register_isp(struct mali_c55 *mali_c55)
> > @@ -501,6 +519,7 @@ int mali_c55_register_isp(struct mali_c55 *mali_c55)
> >  	isp->pads[MALI_C55_ISP_PAD_SOURCE_VIDEO].flags = MEDIA_PAD_FL_SOURCE;
> >  	isp->pads[MALI_C55_ISP_PAD_SOURCE_BYPASS].flags = MEDIA_PAD_FL_SOURCE;
> >  	isp->pads[MALI_C55_ISP_PAD_SOURCE_STATS].flags = MEDIA_PAD_FL_SOURCE;
> > +	isp->pads[MALI_C55_ISP_PAD_SINK_PARAMS].flags = MEDIA_PAD_FL_SINK;
> >
> >  	ret = media_entity_pads_init(&sd->entity, MALI_C55_ISP_NUM_PADS,
> >  				     isp->pads);
> > diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-params.c b/drivers/media/platform/arm/mali-c55/mali-c55-params.c
> > new file mode 100644
> > index 000000000000..c0ca4a759653
> > --- /dev/null
> > +++ b/drivers/media/platform/arm/mali-c55/mali-c55-params.c
> > @@ -0,0 +1,671 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * ARM Mali-C55 ISP Driver - Configuration parameters output device
> > + *
> > + * Copyright (C) 2024 Ideas on Board Oy
> > + */
> > +#include <linux/media/arm/mali-c55-config.h>
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
> > +typedef void (*mali_c55_block_handler)(struct mali_c55 *mali_c55,
> > +				       union mali_c55_params_block block);
> > +
> > +struct mali_c55_block_handler {
> > +	size_t size;
> > +	mali_c55_block_handler handler;
> > +};
> > +
> > +static void mali_c55_params_sensor_offs(struct mali_c55 *mali_c55,
> > +					union mali_c55_params_block block)
> > +{
> > +	struct mali_c55_params_sensor_off_preshading *p = block.sensor_offs;
> > +	__u32 global_offset;
> > +
> > +	if (!block.header->enabled)
> > +		return;
> > +
> > +	if (!(p->chan00 || p->chan01 || p->chan10 || p->chan11))
> > +		return;
> > +
> > +	mali_c55_ctx_write(mali_c55, MALI_C55_REG_SENSOR_OFF_PRE_SHA_00,
> > +			   p->chan00 & MALI_C55_SENSOR_OFF_PRE_SHA_MASK);
> > +	mali_c55_ctx_write(mali_c55, MALI_C55_REG_SENSOR_OFF_PRE_SHA_01,
> > +			   p->chan01 & MALI_C55_SENSOR_OFF_PRE_SHA_MASK);
> > +	mali_c55_ctx_write(mali_c55, MALI_C55_REG_SENSOR_OFF_PRE_SHA_10,
> > +			   p->chan10 & MALI_C55_SENSOR_OFF_PRE_SHA_MASK);
> > +	mali_c55_ctx_write(mali_c55, MALI_C55_REG_SENSOR_OFF_PRE_SHA_11,
> > +			   p->chan11 & MALI_C55_SENSOR_OFF_PRE_SHA_MASK);
> > +
> > +	/*
> > +	 * The average offset is applied as a global offset for the digital
> > +	 * gain block
> > +	 */
> > +	global_offset = (p->chan00 + p->chan01 + p->chan10 + p->chan11) >> 2;
> > +	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_DIGITAL_GAIN_OFFSET,
> > +				 MALI_C55_DIGITAL_GAIN_OFFSET_MASK,
> > +				 global_offset);
> > +
> > +	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_BYPASS_3,
> > +				 MALI_C55_REG_BYPASS_3_SENSOR_OFFSET_PRE_SH,
> > +				 0x00);
> > +}
> > +
> > +static void mali_c55_params_aexp_hist(struct mali_c55 *mali_c55,
> > +				      union mali_c55_params_block block)
> > +{
> > +	u32 disable_mask;
> > +	u32 disable_val;
> > +	u32 base;
> > +
> > +	if (block.header->type == MALI_C55_PARAM_BLOCK_AEXP_HIST) {
> > +		disable_mask = MALI_C55_AEXP_HIST_DISABLE_MASK;
> > +		disable_val = MALI_C55_AEXP_HIST_DISABLE;
> > +		base = MALI_C55_REG_AEXP_HIST_BASE;
> > +	} else {
> > +		disable_mask = MALI_C55_AEXP_IHIST_DISABLE_MASK;
> > +		disable_val = MALI_C55_AEXP_IHIST_DISABLE;
> > +		base = MALI_C55_REG_AEXP_IHIST_BASE;
> > +	}
> > +	struct mali_c55_params_aexp_hist *params = block.aexp_hist;
> > +
> > +	if (!block.header->enabled) {
> > +		mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_METERING_CONFIG,
> > +					 disable_mask, disable_val);
> > +		return;
> > +	}
> > +
> > +	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_METERING_CONFIG,
> > +				 disable_mask, false);
> > +
> > +	mali_c55_ctx_update_bits(mali_c55, base + MALI_C55_AEXP_HIST_SKIP_OFFSET,
> > +				 MALI_C55_AEXP_HIST_SKIP_X_MASK, params->skip_x);
> > +	mali_c55_ctx_update_bits(mali_c55, base + MALI_C55_AEXP_HIST_SKIP_OFFSET,
> > +				 MALI_C55_AEXP_HIST_OFFSET_X_MASK,
> > +				 MALI_C55_AEXP_HIST_OFFSET_X(params->offset_x));
> > +	mali_c55_ctx_update_bits(mali_c55, base + MALI_C55_AEXP_HIST_SKIP_OFFSET,
> > +				 MALI_C55_AEXP_HIST_SKIP_Y_MASK,
> > +				 MALI_C55_AEXP_HIST_SKIP_Y(params->skip_y));
> > +	mali_c55_ctx_update_bits(mali_c55, base + MALI_C55_AEXP_HIST_SKIP_OFFSET,
> > +				 MALI_C55_AEXP_HIST_OFFSET_Y_MASK,
> > +				 MALI_C55_AEXP_HIST_OFFSET_Y(params->offset_y));
> > +
> > +	mali_c55_ctx_update_bits(mali_c55, base + MALI_C55_AEXP_HIST_SCALE_OFFSET,
> > +				 MALI_C55_AEXP_HIST_SCALE_BOTTOM_MASK,
> > +				 params->scale_bottom);
> > +	mali_c55_ctx_update_bits(mali_c55, base + MALI_C55_AEXP_HIST_SCALE_OFFSET,
> > +				 MALI_C55_AEXP_HIST_SCALE_TOP_MASK,
> > +				 MALI_C55_AEXP_HIST_SCALE_TOP(params->scale_top));
> > +
> > +	mali_c55_ctx_update_bits(mali_c55, base + MALI_C55_AEXP_HIST_PLANE_MODE_OFFSET,
> > +				 MALI_C55_AEXP_HIST_PLANE_MODE_MASK,
> > +				 params->plane_mode);
> > +
> > +	if (block.header->type == MALI_C55_PARAM_BLOCK_AEXP_HIST)
> > +		mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_METERING_CONFIG,
> > +					 MALI_C55_AEXP_HIST_SWITCH_MASK,
> > +					 MALI_C55_AEXP_HIST_SWITCH(params->tap_point));
> > +}
> > +
> > +static void
> > +mali_c55_params_aexp_hist_weights(struct mali_c55 *mali_c55,
> > +				  union mali_c55_params_block block)
> > +{
> > +	struct mali_c55_params_aexp_weights *params = block.aexp_weights;
> > +	u32 base;
> > +
> > +	if (!block.header->enabled)
> > +		return;
> > +
> > +	base = block.header->type == MALI_C55_PARAM_BLOCK_AEXP_HIST_WEIGHTS ?
> > +				      MALI_C55_REG_AEXP_HIST_BASE :
> > +				      MALI_C55_REG_AEXP_IHIST_BASE;
> > +
> > +	mali_c55_ctx_update_bits(mali_c55,
> > +				 base + MALI_C55_AEXP_HIST_NODES_USED_OFFSET,
> > +				 MALI_C55_AEXP_HIST_NODES_USED_HORIZ_MASK,
> > +				 params->nodes_used_horiz);
> > +	mali_c55_ctx_update_bits(mali_c55,
> > +				 base + MALI_C55_AEXP_HIST_NODES_USED_OFFSET,
> > +				 MALI_C55_AEXP_HIST_NODES_USED_VERT_MASK,
> > +				 MALI_C55_AEXP_HIST_NODES_USED_VERT(params->nodes_used_vert));
> > +
> > +	/*
> > +	 * The zone weights array is a 225-element array of u8 values, but that
> > +	 * is a bit annoying to handle given the ISP expects 32-bit writes. We
> > +	 * just reinterpret it as a 57-element array of 32-bit values for the
> > +	 * purposes of this transaction (the 3 bytes of additional space at the
> > +	 * end of the write is just padding for the array of weights in the ISP
> > +	 * memory space anyway, so there's no risk of overwriting other
> > +	 * registers).
> > +	 */
> > +	for (unsigned int i = 0; i < 57; i++) {
> > +		u32 val = ((u32 *)params->zone_weights)[i]
> > +			    & MALI_C55_AEXP_HIST_ZONE_WEIGHT_MASK;
> > +		u32 addr = base + MALI_C55_AEXP_HIST_ZONE_WEIGHTS_OFFSET + (4 * i);
> > +
> > +		mali_c55_ctx_write(mali_c55, addr, val);
> > +	}
> > +}
> > +
> > +static void mali_c55_params_digital_gain(struct mali_c55 *mali_c55,
> > +					 union mali_c55_params_block block)
> > +{
> > +	struct mali_c55_params_digital_gain *dgain = block.digital_gain;
> > +
> > +	/*
> > +	 * If the block is flagged as disabled we write a gain of 1.0, which in
> > +	 * Q5.8 format is 256.
> > +	 */
> > +	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_DIGITAL_GAIN,
> > +				 MALI_C55_DIGITAL_GAIN_MASK,
> > +				 block.header->enabled ? dgain->gain : 256);
> > +}
> > +
> > +static void mali_c55_params_awb_gains(struct mali_c55 *mali_c55,
> > +				      union mali_c55_params_block block)
> > +{
> > +	struct mali_c55_params_awb_gains *gains = block.awb_gains;
> > +
> > +	/*
> > +	 * There are two places AWB gains can be set in the ISP; one affects the
> > +	 * image output data and the other affects the statistics for the
> > +	 * AEXP-0 tap point.
> > +	 */
> > +	u32 addr1 = block.header->type == MALI_C55_PARAM_BLOCK_AWB_GAINS ?
> > +					   MALI_C55_REG_AWB_GAINS1 :
> > +					   MALI_C55_REG_AWB_GAINS1_AEXP;
> > +	u32 addr2 = block.header->type == MALI_C55_PARAM_BLOCK_AWB_GAINS ?
> > +					   MALI_C55_REG_AWB_GAINS2 :
> > +					   MALI_C55_REG_AWB_GAINS2_AEXP;
> > +
> > +	mali_c55_ctx_update_bits(mali_c55, addr1, MALI_C55_AWB_GAIN00_MASK,
> > +				 gains->gain00);
> > +	mali_c55_ctx_update_bits(mali_c55, addr1, MALI_C55_AWB_GAIN01_MASK,
> > +				 MALI_C55_AWB_GAIN01(gains->gain01));
> > +	mali_c55_ctx_update_bits(mali_c55, addr2, MALI_C55_AWB_GAIN10_MASK,
> > +				 gains->gain10);
> > +	mali_c55_ctx_update_bits(mali_c55, addr2, MALI_C55_AWB_GAIN11_MASK,
> > +				 MALI_C55_AWB_GAIN11(gains->gain11));
> > +}
> > +
> > +static void mali_c55_params_awb_config(struct mali_c55 *mali_c55,
> > +				       union mali_c55_params_block block)
> > +{
> > +	struct mali_c55_params_awb_config *params = block.awb_config;
> > +
> > +	if (!block.header->enabled) {
> > +		mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_METERING_CONFIG,
> > +					 MALI_C55_AWB_DISABLE_MASK,
> > +					 MALI_C55_AWB_DISABLE_MASK);
> > +		return;
> > +	}
> > +
> > +	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_METERING_CONFIG,
> > +				 MALI_C55_AWB_DISABLE_MASK, false);
> > +
> > +	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_AWB_STATS_MODE,
> > +				 MALI_C55_AWB_STATS_MODE_MASK, params->stats_mode);
> > +
> > +	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_AWB_WHITE_LEVEL,
> > +				 MALI_C55_AWB_WHITE_LEVEL_MASK, params->white_level);
> > +	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_AWB_BLACK_LEVEL,
> > +				 MALI_C55_AWB_BLACK_LEVEL_MASK, params->black_level);
> > +
> > +	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_AWB_CR_MAX,
> > +				 MALI_C55_AWB_CR_MAX_MASK, params->cr_max);
> > +	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_AWB_CR_MIN,
> > +				 MALI_C55_AWB_CR_MIN_MASK, params->cr_min);
> > +	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_AWB_CB_MAX,
> > +				 MALI_C55_AWB_CB_MAX_MASK, params->cb_max);
> > +	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_AWB_CB_MIN,
> > +				 MALI_C55_AWB_CB_MIN_MASK, params->cb_min);
> > +
> > +	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_AWB_NODES_USED,
> > +				 MALI_C55_AWB_NODES_USED_HORIZ_MASK,
> > +				 params->nodes_used_horiz);
> > +	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_AWB_NODES_USED,
> > +				 MALI_C55_AWB_NODES_USED_VERT_MASK,
> > +				 MALI_C55_AWB_NODES_USED_VERT(params->nodes_used_vert));
> > +
> > +	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_AWB_CR_HIGH,
> > +				 MALI_C55_AWB_CR_HIGH_MASK, params->cr_high);
> > +	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_AWB_CR_LOW,
> > +				 MALI_C55_AWB_CR_LOW_MASK, params->cr_low);
> > +	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_AWB_CB_HIGH,
> > +				 MALI_C55_AWB_CB_HIGH_MASK, params->cb_high);
> > +	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_AWB_CB_LOW,
> > +				 MALI_C55_AWB_CB_LOW_MASK, params->cb_low);
> > +
> > +	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_METERING_CONFIG,
> > +				 MALI_C55_AWB_SWITCH_MASK,
> > +				 MALI_C55_AWB_SWITCH(params->tap_point));
> > +}
> > +
> > +static void mali_c55_params_lsc_config(struct mali_c55 *mali_c55,
> > +				       union mali_c55_params_block block)
> > +{
> > +	struct mali_c55_params_mesh_shading_config *params = block.shading_config;
> > +	unsigned int i;
> > +	u32 addr;
> > +
> > +	if (!block.header->enabled) {
> > +		mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_MESH_SHADING_CONFIG,
> > +					 MALI_C55_MESH_SHADING_ENABLE_MASK,
> > +					 false);
> > +		return;
> > +	}
> > +
> > +	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_MESH_SHADING_CONFIG,
> > +				 MALI_C55_MESH_SHADING_ENABLE_MASK, true);
> > +	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_MESH_SHADING_CONFIG,
> > +				 MALI_C55_MESH_SHADING_MESH_SHOW_MASK,
> > +				 MALI_C55_MESH_SHADING_MESH_SHOW(params->mesh_show));
> > +	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_MESH_SHADING_CONFIG,
> > +				 MALI_C55_MESH_SHADING_SCALE_MASK,
> > +				 MALI_C55_MESH_SHADING_SCALE(params->mesh_scale));
> > +	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_MESH_SHADING_CONFIG,
> > +				 MALI_C55_MESH_SHADING_PAGE_R_MASK,
> > +				 MALI_C55_MESH_SHADING_PAGE_R(params->mesh_page_r));
> > +	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_MESH_SHADING_CONFIG,
> > +				 MALI_C55_MESH_SHADING_PAGE_G_MASK,
> > +				 MALI_C55_MESH_SHADING_PAGE_G(params->mesh_page_g));
> > +	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_MESH_SHADING_CONFIG,
> > +				 MALI_C55_MESH_SHADING_PAGE_B_MASK,
> > +				 MALI_C55_MESH_SHADING_PAGE_B(params->mesh_page_b));
> > +	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_MESH_SHADING_CONFIG,
> > +				 MALI_C55_MESH_SHADING_MESH_WIDTH_MASK,
> > +				 MALI_C55_MESH_SHADING_MESH_WIDTH(params->mesh_width));
> > +	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_MESH_SHADING_CONFIG,
> > +				 MALI_C55_MESH_SHADING_MESH_HEIGHT_MASK,
> > +				 MALI_C55_MESH_SHADING_MESH_HEIGHT(params->mesh_height));
> > +
> > +	for (i = 0; i < MALI_C55_NUM_MESH_SHADING_ELEMENTS; i++) {
> > +		addr = MALI_C55_REG_MESH_SHADING_TABLES + (i * 4);
> > +		mali_c55_ctx_write(mali_c55, addr, params->mesh[i]);
> > +	}
> > +}
> > +
> > +static void mali_c55_params_lsc_selection(struct mali_c55 *mali_c55,
> > +					  union mali_c55_params_block block)
> > +{
> > +	struct mali_c55_params_mesh_shading_selection *params =
> > +		block.shading_selection;
> > +
> > +	if (!block.header->enabled)
> > +		return;
> > +
> > +	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_MESH_SHADING_ALPHA_BANK,
> > +				 MALI_C55_MESH_SHADING_ALPHA_BANK_R_MASK,
> > +				 params->mesh_alpha_bank_r);
> > +	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_MESH_SHADING_ALPHA_BANK,
> > +				 MALI_C55_MESH_SHADING_ALPHA_BANK_G_MASK,
> > +				 MALI_C55_MESH_SHADING_ALPHA_BANK_G(params->mesh_alpha_bank_g));
> > +	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_MESH_SHADING_ALPHA_BANK,
> > +				 MALI_C55_MESH_SHADING_ALPHA_BANK_B_MASK,
> > +				 MALI_C55_MESH_SHADING_ALPHA_BANK_B(params->mesh_alpha_bank_b));
> > +
> > +	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_MESH_SHADING_ALPHA,
> > +				 MALI_C55_MESH_SHADING_ALPHA_R_MASK,
> > +				 params->mesh_alpha_r);
> > +	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_MESH_SHADING_ALPHA,
> > +				 MALI_C55_MESH_SHADING_ALPHA_G_MASK,
> > +				 MALI_C55_MESH_SHADING_ALPHA_G(params->mesh_alpha_g));
> > +	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_MESH_SHADING_ALPHA,
> > +				 MALI_C55_MESH_SHADING_ALPHA_B_MASK,
> > +				 MALI_C55_MESH_SHADING_ALPHA_B(params->mesh_alpha_b));
> > +
> > +	mali_c55_ctx_update_bits(mali_c55,
> > +				 MALI_C55_REG_MESH_SHADING_MESH_STRENGTH,
> > +				 MALI_c55_MESH_STRENGTH_MASK,
> > +				 params->mesh_strength);
> > +}
> > +
> > +static const struct mali_c55_block_handler mali_c55_block_handlers[] = {
> > +	[MALI_C55_PARAM_BLOCK_SENSOR_OFFS] = {
> > +		.size = sizeof(struct mali_c55_params_sensor_off_preshading),
> > +		.handler = &mali_c55_params_sensor_offs,
> > +	},
> > +	[MALI_C55_PARAM_BLOCK_AEXP_HIST] = {
> > +		.size = sizeof(struct mali_c55_params_aexp_hist),
> > +		.handler = &mali_c55_params_aexp_hist,
> > +	},
> > +	[MALI_C55_PARAM_BLOCK_AEXP_IHIST] = {
> > +		.size = sizeof(struct mali_c55_params_aexp_hist),
> > +		.handler = &mali_c55_params_aexp_hist,
> > +	},
> > +	[MALI_C55_PARAM_BLOCK_AEXP_HIST_WEIGHTS] = {
> > +		.size = sizeof(struct mali_c55_params_aexp_weights),
> > +		.handler = &mali_c55_params_aexp_hist_weights,
> > +	},
> > +	[MALI_C55_PARAM_BLOCK_AEXP_IHIST_WEIGHTS] = {
> > +		.size = sizeof(struct mali_c55_params_aexp_weights),
> > +		.handler = &mali_c55_params_aexp_hist_weights,
> > +	},
> > +	[MALI_C55_PARAM_BLOCK_DIGITAL_GAIN] = {
> > +		.size = sizeof(struct mali_c55_params_digital_gain),
> > +		.handler = &mali_c55_params_digital_gain,
> > +	},
> > +	[MALI_C55_PARAM_BLOCK_AWB_GAINS] = {
> > +		.size = sizeof(struct mali_c55_params_awb_gains),
> > +		.handler = &mali_c55_params_awb_gains,
> > +	},
> > +	[MALI_C55_PARAM_BLOCK_AWB_CONFIG] = {
> > +		.size = sizeof(struct mali_c55_params_awb_config),
> > +		.handler = &mali_c55_params_awb_config,
> > +	},
> > +	[MALI_C55_PARAM_BLOCK_AWB_GAINS_AEXP] = {
> > +		.size = sizeof(struct mali_c55_params_awb_gains),
> > +		.handler = &mali_c55_params_awb_gains,
> > +	},
> > +	[MALI_C55_PARAM_MESH_SHADING_CONFIG] = {
> > +		.size = sizeof(struct mali_c55_params_mesh_shading_config),
> > +		.handler = &mali_c55_params_lsc_config,
> > +	},
> > +	[MALI_C55_PARAM_MESH_SHADING_SELECTION] = {
> > +		.size = sizeof(struct mali_c55_params_mesh_shading_selection),
> > +		.handler = &mali_c55_params_lsc_selection,
> > +	},
> > +};
> > +
> > +static int mali_c55_params_enum_fmt_meta_out(struct file *file, void *fh,
> > +					     struct v4l2_fmtdesc *f)
> > +{
> > +	if (f->index)
> > +		return -EINVAL;
> > +
> > +	f->pixelformat = V4L2_META_FMT_MALI_C55_PARAMS;
> > +
> > +	return 0;
> > +}
> > +
> > +static int mali_c55_params_g_fmt_meta_out(struct file *file, void *fh,
> > +					  struct v4l2_format *f)
> > +{
> > +	static const struct v4l2_meta_format mfmt = {
> > +		.dataformat = V4L2_META_FMT_MALI_C55_PARAMS,
> > +		.buffersize = sizeof(struct mali_c55_params_buffer),
> > +	};
> > +
> > +	f->fmt.meta = mfmt;
> > +
> > +	return 0;
> > +}
> > +
> > +static int mali_c55_params_querycap(struct file *file,
> > +				    void *priv, struct v4l2_capability *cap)
> > +{
> > +	strscpy(cap->driver, MALI_C55_DRIVER_NAME, sizeof(cap->driver));
> > +	strscpy(cap->card, "ARM Mali-C55 ISP", sizeof(cap->card));
> > +
> > +	return 0;
> > +}
> > +
> > +static const struct v4l2_ioctl_ops mali_c55_params_v4l2_ioctl_ops = {
> > +	.vidioc_reqbufs = vb2_ioctl_reqbufs,
> > +	.vidioc_querybuf = vb2_ioctl_querybuf,
> > +	.vidioc_create_bufs = vb2_ioctl_create_bufs,
> > +	.vidioc_qbuf = vb2_ioctl_qbuf,
> > +	.vidioc_expbuf = vb2_ioctl_expbuf,
> > +	.vidioc_dqbuf = vb2_ioctl_dqbuf,
> > +	.vidioc_prepare_buf = vb2_ioctl_prepare_buf,
> > +	.vidioc_streamon = vb2_ioctl_streamon,
> > +	.vidioc_streamoff = vb2_ioctl_streamoff,
> > +	.vidioc_enum_fmt_meta_out = mali_c55_params_enum_fmt_meta_out,
> > +	.vidioc_g_fmt_meta_out = mali_c55_params_g_fmt_meta_out,
> > +	.vidioc_s_fmt_meta_out = mali_c55_params_g_fmt_meta_out,
> > +	.vidioc_try_fmt_meta_out = mali_c55_params_g_fmt_meta_out,
> > +	.vidioc_querycap = mali_c55_params_querycap,
> > +	.vidioc_subscribe_event = v4l2_ctrl_subscribe_event,
> > +	.vidioc_unsubscribe_event = v4l2_event_unsubscribe,
> > +};
> > +
> > +static const struct v4l2_file_operations mali_c55_params_v4l2_fops = {
> > +	.owner = THIS_MODULE,
> > +	.unlocked_ioctl = video_ioctl2,
> > +	.open = v4l2_fh_open,
> > +	.release = vb2_fop_release,
> > +	.poll = vb2_fop_poll,
> > +	.mmap = vb2_fop_mmap,
> > +};
> > +
> > +static int
> > +mali_c55_params_queue_setup(struct vb2_queue *q, unsigned int *num_buffers,
> > +			    unsigned int *num_planes, unsigned int sizes[],
> > +			    struct device *alloc_devs[])
> > +{
> > +	if (*num_planes && *num_planes > 1)
> > +		return -EINVAL;
> > +
> > +	if (sizes[0] && sizes[0] < sizeof(struct mali_c55_params_buffer))
> > +		return -EINVAL;
> > +
> > +	*num_planes = 1;
> > +
> > +	if (!sizes[0])
> > +		sizes[0] = sizeof(struct mali_c55_params_buffer);
> > +
> > +	return 0;
> > +}
> > +
> > +static void mali_c55_params_buf_queue(struct vb2_buffer *vb)
> > +{
> > +	struct mali_c55_params *params = vb2_get_drv_priv(vb->vb2_queue);
> > +	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
> > +	struct mali_c55_buffer *buf = container_of(vbuf,
> > +						   struct mali_c55_buffer, vb);
> > +
> > +	vb2_set_plane_payload(vb, 0, sizeof(struct mali_c55_params_buffer));
> > +
> > +	spin_lock(&params->buffers.lock);
> > +	list_add_tail(&buf->queue, &params->buffers.queue);
> > +	spin_unlock(&params->buffers.lock);
> > +}
> > +
> > +static int mali_c55_params_start_streaming(struct vb2_queue *q,
> > +					   unsigned int count)
> > +{
> > +	struct mali_c55_params *params = vb2_get_drv_priv(q);
> > +	struct mali_c55 *mali_c55 = params->mali_c55;
> > +	int ret;
> > +
> > +	ret = video_device_pipeline_start(&params->vdev,
> > +					  &params->mali_c55->pipe);
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
> > +	video_device_pipeline_stop(&params->vdev);
>
> When a failure happens you need to return all queued buffers to vb2 in
> the QUEUED state.
>
> > +
> > +	return ret;
> > +}
> > +
> > +static void mali_c55_params_stop_streaming(struct vb2_queue *q)
> > +{
> > +	struct mali_c55_params *params = vb2_get_drv_priv(q);
> > +	struct mali_c55_buffer *buf, *tmp;
> > +
> > +	spin_lock(&params->buffers.lock);
> > +
> > +	list_for_each_entry_safe(buf, tmp, &params->buffers.queue, queue) {
> > +		list_del(&buf->queue);
> > +		vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_ERROR);
> > +	}
>
> This can be turned into a helper function that takes the state as an
> argument, to be used in the start_streaming error path. It may even be
> possible to share the helper with all video devices in this driver.
>
> > +
> > +	spin_unlock(&params->buffers.lock);
> > +
> > +	video_device_pipeline_stop(&params->vdev);
>
> I think you need to stop the ISP too, if this is the first video device
> being stopped. You should return buffers to vb2 only after stopping the
> ISP.
>
> This may be fixed by stopping the ISP, but currently I think you're
> racing with mali_c55_params_write_config()
>
> > +}
> > +
> > +static const struct vb2_ops mali_c55_params_vb2_ops = {
> > +	.queue_setup = mali_c55_params_queue_setup,
> > +	.buf_queue = mali_c55_params_buf_queue,
> > +	.wait_prepare = vb2_ops_wait_prepare,
> > +	.wait_finish = vb2_ops_wait_finish,
> > +	.start_streaming = mali_c55_params_start_streaming,
> > +	.stop_streaming = mali_c55_params_stop_streaming,
> > +};
> > +
> > +void mali_c55_params_write_config(struct mali_c55 *mali_c55)
> > +{
> > +	struct mali_c55_params *params = &mali_c55->params;
> > +	enum vb2_buffer_state state = VB2_BUF_STATE_DONE;
> > +	struct mali_c55_params_buffer *config;
> > +	struct mali_c55_buffer *buf;
> > +	size_t block_offset = 0;
> > +	size_t max_offset;
> > +
> > +	spin_lock(&params->buffers.lock);
> > +
> > +	buf = list_first_entry_or_null(&params->buffers.queue,
> > +				       struct mali_c55_buffer, queue);
> > +	if (buf)
> > +		list_del(&buf->queue);
> > +	spin_unlock(&params->buffers.lock);
> > +
> > +	if (!buf)
> > +		return;
>
> If this happens we'll lose synchronization. I suppose we can't do much
> about this, we really need a request-based API.
>
> > +
> > +	buf->vb.sequence = mali_c55->isp.frame_sequence;
> > +	config = vb2_plane_vaddr(&buf->vb.vb2_buf, 0);
> > +
> > +	if (config->total_size > MALI_C55_PARAMS_MAX_SIZE) {
> > +		dev_dbg(mali_c55->dev, "Invalid parameters buffer size %u\n",
> > +			config->total_size);
> > +		state = VB2_BUF_STATE_ERROR;
> > +		goto err_buffer_done;
> > +	}
> > +
> > +	max_offset = config->total_size - sizeof(struct mali_c55_params_block_header);
> > +
> > +	/* Walk the list of parameter blocks and process them. */
> > +	while (block_offset < max_offset) {
> > +		const struct mali_c55_block_handler *block_handler;
> > +		union mali_c55_params_block block;
> > +
> > +		block = (union mali_c55_params_block)
> > +			 &config->data[block_offset];
> > +
> > +		if (block.header->type >= MALI_C55_PARAM_BLOCK_SENTINEL) {
> > +			dev_dbg(mali_c55->dev, "Invalid parameters block type\n");
> > +			state = VB2_BUF_STATE_ERROR;
> > +			goto err_buffer_done;
> > +		}
> > +
> > +		if (block_offset + block.header->size >= config->total_size) {
> > +			dev_dbg(mali_c55->dev, "Parameters block too large\n");
> > +			state = VB2_BUF_STATE_ERROR;
> > +			goto err_buffer_done;
> > +		}
> > +
> > +		block_handler = &mali_c55_block_handlers[block.header->type];
> > +		if (block.header->size != block_handler->size) {
> > +			dev_dbg(mali_c55->dev, "Invalid parameters block size\n");
> > +			state = VB2_BUF_STATE_ERROR;
> > +			goto err_buffer_done;
> > +		}
>
> Most of the validation should be done with the buffer is queued.
> Furthermore, you need to make a copy of the data. See the latest version
> of the rkisp1 extensible parameters format series. There may be other
> recent improvements in that series worth copying here.
>
> > +
> > +		block_handler->handler(mali_c55, block);
> > +
> > +		block_offset += block.header->size;
> > +	}
> > +
> > +err_buffer_done:
> > +	vb2_buffer_done(&buf->vb.vb2_buf, state);
> > +}
> > +
> > +void mali_c55_unregister_params(struct mali_c55 *mali_c55)
> > +{
> > +	struct mali_c55_params *params = &mali_c55->params;
> > +
> > +	if (!video_is_registered(&params->vdev))
> > +		return;
> > +
> > +	vb2_video_unregister_device(&params->vdev);
> > +	media_entity_cleanup(&params->vdev.entity);
> > +	mutex_destroy(&params->lock);
> > +}
> > +
> > +int mali_c55_register_params(struct mali_c55 *mali_c55)
> > +{
> > +	struct mali_c55_params *params = &mali_c55->params;
> > +	struct video_device *vdev = &params->vdev;
> > +	struct vb2_queue *vb2q = &params->queue;
> > +	int ret;
> > +
> > +	mutex_init(&params->lock);
> > +	INIT_LIST_HEAD(&params->buffers.queue);
> > +
> > +	params->pad.flags = MEDIA_PAD_FL_SOURCE;
> > +	ret = media_entity_pads_init(&params->vdev.entity, 1, &params->pad);
> > +	if (ret)
> > +		goto err_destroy_mutex;
> > +
> > +	vb2q->type = V4L2_BUF_TYPE_META_OUTPUT;
> > +	vb2q->io_modes = VB2_MMAP | VB2_DMABUF;
> > +	vb2q->drv_priv = params;
> > +	vb2q->mem_ops = &vb2_dma_contig_memops;
> > +	vb2q->ops = &mali_c55_params_vb2_ops;
> > +	vb2q->buf_struct_size = sizeof(struct mali_c55_buffer);
> > +	vb2q->min_queued_buffers = 1;
> > +	vb2q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
> > +	vb2q->lock = &params->lock;
> > +	vb2q->dev = mali_c55->dev;
> > +
> > +	ret = vb2_queue_init(vb2q);
> > +	if (ret) {
> > +		dev_err(mali_c55->dev, "params vb2 queue init failed\n");
> > +		goto err_cleanup_entity;
> > +	}
> > +
> > +	strscpy(params->vdev.name, "mali-c55 3a params",
> > +		sizeof(params->vdev.name));
> > +	vdev->release = video_device_release_empty;
> > +	vdev->fops = &mali_c55_params_v4l2_fops;
> > +	vdev->ioctl_ops = &mali_c55_params_v4l2_ioctl_ops;
> > +	vdev->lock = &params->lock;
> > +	vdev->v4l2_dev = &mali_c55->v4l2_dev;
> > +	vdev->queue = &params->queue;
> > +	vdev->device_caps = V4L2_CAP_META_OUTPUT | V4L2_CAP_STREAMING;
>
> Shouldn't you set V4L2_CAP_IO_MC and implement media bus code-based
> format enumeration ?

The params (and stats) nodes support a single format, what's the point
of performing media bus code based filtering ?

