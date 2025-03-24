Return-Path: <linux-media+bounces-28643-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AF49A6E0CA
	for <lists+linux-media@lfdr.de>; Mon, 24 Mar 2025 18:27:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7166116FD3A
	for <lists+linux-media@lfdr.de>; Mon, 24 Mar 2025 17:27:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8EAB263F21;
	Mon, 24 Mar 2025 17:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ok8PTegO"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74CB515E96;
	Mon, 24 Mar 2025 17:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742837245; cv=none; b=EFy8Fi0/N6hhAM5iGA3Ui1u1SCdX14oNW3jCyWNSYS7IAu9HOp+Fsj/jrttlGbvSl0hq3Tih9agx+22NRcSLyIwrFaUIcZ7NtvthRW/RIPzvEQa/4Ra+nSOdDZAf8gzSg3uK/BGXH25BEzHDjH1debiBOhfoNxac8PckV+6j+Ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742837245; c=relaxed/simple;
	bh=0Tvvm8ZnQIl4slqEl36R0UVDVEEfYUl+/rV6B/nHGLU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h0ETkesFSS53qisc/CewPGTyGh0nIV3TgfJs16ZN4h6CnGAZPoba/kn2eqIj/Jrno5hsi4McteOcaFP4BJEI/GKOjowbjYEXtp+kZKSqLGqaAv6gcdKb9mJ78MtZzW4O7QN2T7cyP4BhIfiXDZulr9R+Iiqp1mzhyiFlWyq0tfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ok8PTegO; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B7038455;
	Mon, 24 Mar 2025 18:25:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1742837134;
	bh=0Tvvm8ZnQIl4slqEl36R0UVDVEEfYUl+/rV6B/nHGLU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ok8PTegOSip0xa1dUFL1RIJTBf7uH8yTrNdHg86mjQmAMuzghdn7FUnWi4oMa85xn
	 VyKfFV3U6WMTryLtvM5BSBeTLbs4Lu+Tp9cfs3FhOg+lG+OweN9/75d/6jygwBZwdV
	 Xj6wkMsq+JDpWZs1kzGE3PpDWRerWhXxLSqfa8TU=
Date: Mon, 24 Mar 2025 19:26:58 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2] media: vsp1: Add VSPX support
Message-ID: <20250324172658.GL22890@pendragon.ideasonboard.com>
References: <20250319-v4h-vspx-v2-1-33b0e659a5f8@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250319-v4h-vspx-v2-1-33b0e659a5f8@ideasonboard.com>

Hi Jacopo,

Thank you for the patch.

On Wed, Mar 19, 2025 at 04:36:56PM +0100, Jacopo Mondi wrote:
> Add support for VSPX, a specialized version of the VSP2 that
> transfer data to the ISP. The VSPX is composed by two RPF units

s/transfer/transfers/
s/composed by/composed of/

> to read data from external memory and an IIF instance that performs
> transfer towards the ISP.
> 
> The VSPX is supported through a newly introduced vsp1_vspx.c file that
> exposes two interfaces: vsp1_vspx interface, declared in vsp1_vspx.h
> for the vsp1 core to initialize and cleanup the VSPX, and a vsp1_isp
> interface, declared in include/media/vsp1.h for the ISP driver to
> control the VSPX operations.

I have a bit of a hard time reviewing the API exposed to the ISP without
seeing how it gets used, so I'll start with a partial review.

> Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> ---
> Add a driver for Rensas VSP2 VSPX function.
> The VSPX transfer image and config data to the ISP.
> ---
> Changes in v2:
> - Completed documentation of vspx ISP interface in vsp1.h
> - Link to v1: https://lore.kernel.org/r/20250319-v4h-vspx-v1-1-83761280071b@ideasonboard.com
> ---
>  drivers/media/platform/renesas/vsp1/Makefile    |   1 +
>  drivers/media/platform/renesas/vsp1/vsp1.h      |   1 +
>  drivers/media/platform/renesas/vsp1/vsp1_drv.c  |  13 +-
>  drivers/media/platform/renesas/vsp1/vsp1_pipe.c |   6 +
>  drivers/media/platform/renesas/vsp1/vsp1_regs.h |   1 +
>  drivers/media/platform/renesas/vsp1/vsp1_vspx.c | 526 ++++++++++++++++++++++++
>  drivers/media/platform/renesas/vsp1/vsp1_vspx.h |  76 ++++
>  include/media/vsp1.h                            | 138 +++++++
>  8 files changed, 761 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/renesas/vsp1/Makefile b/drivers/media/platform/renesas/vsp1/Makefile
> index de8c802e1d1a..2057c8f7be47 100644
> --- a/drivers/media/platform/renesas/vsp1/Makefile
> +++ b/drivers/media/platform/renesas/vsp1/Makefile
> @@ -6,5 +6,6 @@ vsp1-y					+= vsp1_clu.o vsp1_hsit.o vsp1_lut.o
>  vsp1-y					+= vsp1_brx.o vsp1_sru.o vsp1_uds.o
>  vsp1-y					+= vsp1_hgo.o vsp1_hgt.o vsp1_histo.o
>  vsp1-y					+= vsp1_iif.o vsp1_lif.o vsp1_uif.o
> +vsp1-y					+= vsp1_vspx.o
>  
>  obj-$(CONFIG_VIDEO_RENESAS_VSP1)	+= vsp1.o
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1.h b/drivers/media/platform/renesas/vsp1/vsp1.h
> index 263024639dd2..1872e403f26b 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1.h
> +++ b/drivers/media/platform/renesas/vsp1/vsp1.h
> @@ -110,6 +110,7 @@ struct vsp1_device {
>  	struct media_entity_operations media_ops;
>  
>  	struct vsp1_drm *drm;
> +	struct vsp1_vspx *vspx;
>  };
>  
>  int vsp1_device_get(struct vsp1_device *vsp1);
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_drv.c b/drivers/media/platform/renesas/vsp1/vsp1_drv.c
> index d13e9b31aa7c..e338ab8af292 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_drv.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_drv.c
> @@ -38,6 +38,7 @@
>  #include "vsp1_uds.h"
>  #include "vsp1_uif.h"
>  #include "vsp1_video.h"
> +#include "vsp1_vspx.h"
>  
>  /* -----------------------------------------------------------------------------
>   * Interrupt Handling
> @@ -488,7 +489,10 @@ static int vsp1_create_entities(struct vsp1_device *vsp1)
>  
>  		ret = media_device_register(mdev);
>  	} else {
> -		ret = vsp1_drm_init(vsp1);
> +		if (vsp1->info->version == VI6_IP_VERSION_MODEL_VSPX_GEN4)
> +			ret = vsp1_vspx_init(vsp1);
> +		else
> +			ret = vsp1_drm_init(vsp1);
>  	}
>  
>  done:
> @@ -846,6 +850,13 @@ static const struct vsp1_device_info vsp1_device_infos[] = {
>  		.uif_count = 2,
>  		.wpf_count = 1,
>  		.num_bru_inputs = 5,
> +	}, {
> +		.version = VI6_IP_VERSION_MODEL_VSPX_GEN4,
> +		.model = "VSP2-X",
> +		.gen = 4,
> +		.features = VSP1_HAS_IIF,
> +		.rpf_count = 2,
> +		.wpf_count = 1,
>  	},
>  };
>  
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_pipe.c b/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
> index a51061738edc..12ede30e0af7 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
> @@ -24,6 +24,7 @@
>  #include "vsp1_pipe.h"
>  #include "vsp1_rwpf.h"
>  #include "vsp1_uds.h"
> +#include "vsp1_vspx.h"
>  
>  /* -----------------------------------------------------------------------------
>   * Helper Functions
> @@ -100,6 +101,11 @@ static const struct vsp1_format_info vsp1_video_formats[] = {
>  	  VI6_RPF_DSWAP_P_WDS,
>  	  1, { 16, 0, 0 }, false, false, 1, 1, false },
>  
> +	/* R-Car V4H Metadata format: Maps on ARGB888 */

s/Maps on/Maps to/

> +	{ V4L2_META_FMT_RCAR_V4H, MEDIA_BUS_FMT_METADATA_FIXED,
> +	  VI6_FMT_ARGB_8888, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS,
> +	  1, { 32, 0, 0 }, false, false, 1, 1, false },
> +
>  	{ V4L2_PIX_FMT_RGB332, MEDIA_BUS_FMT_ARGB8888_1X32,
>  	  VI6_FMT_RGB_332, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
>  	  VI6_RPF_DSWAP_P_WDS | VI6_RPF_DSWAP_P_BTS,
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_regs.h b/drivers/media/platform/renesas/vsp1/vsp1_regs.h
> index 86e47c2d991f..10cfbcd1b6e0 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_regs.h
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_regs.h
> @@ -799,6 +799,7 @@
>  #define VI6_IP_VERSION_MODEL_VSPDL_GEN3	(0x19 << 8)
>  #define VI6_IP_VERSION_MODEL_VSPBS_GEN3	(0x1a << 8)
>  #define VI6_IP_VERSION_MODEL_VSPD_GEN4	(0x1c << 8)
> +#define VI6_IP_VERSION_MODEL_VSPX_GEN4	(0x1d << 8)
>  /* RZ/G2L SoCs have no version register, So use 0x80 as the model version */
>  #define VI6_IP_VERSION_MODEL_VSPD_RZG2L	(0x80 << 8)
>  
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_vspx.c b/drivers/media/platform/renesas/vsp1/vsp1_vspx.c
> new file mode 100644
> index 000000000000..b6dce5f50fed
> --- /dev/null
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_vspx.c
> @@ -0,0 +1,526 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * vsp1_vspx.c  --  R-Car Gen 4 VSPX
> + *
> + * Copyright (C) 2025 Ideas On Board Oy
> + * Copyright (C) 2025 Renesas Electronics Corporation
> + */
> +
> +#include "vsp1_vspx.h"
> +
> +#include <linux/cleanup.h>
> +#include <linux/device.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/slab.h>
> +#include <linux/spinlock.h>
> +
> +#include <media/media-entity.h>
> +#include <media/v4l2-subdev.h>
> +#include <media/vsp1.h>
> +
> +#include "vsp1.h"
> +#include "vsp1_dl.h"
> +#include "vsp1_iif.h"
> +#include "vsp1_pipe.h"
> +#include "vsp1_rwpf.h"
> +
> +#define VSPX_RPF_SINK_PAD_IMG		0
> +#define VSPX_RPF_SINK_PAD_CONFIG	2
> +
> +static const struct v4l2_pix_format_mplane vspx_default_fmt = {
> +	.width = 1920,
> +	.height = 1080,
> +	.pixelformat = V4L2_PIX_FMT_SRGGB8,
> +	.field = V4L2_FIELD_NONE,
> +	.num_planes = 1,
> +	.plane_fmt = {
> +		[0] = {
> +			.sizeimage = 1920 * 1080,
> +			.bytesperline = 1920,
> +		},
> +	},
> +};
> +
> +/*
> + * Apply the given width, height and fourcc to the subdevice inside the
> + * VSP1 entity.
> + */
> +static int vsp1_vspx_rwpf_set_subdev_fmt(struct vsp1_device *vsp1,
> +					 struct vsp1_rwpf *rwpf, u32 fourcc,
> +					 unsigned int width,
> +					 unsigned int height)
> +{
> +	struct vsp1_entity *ent = &rwpf->entity;
> +	const struct vsp1_format_info *fmtinfo;
> +	struct v4l2_subdev_format format = {};
> +	int ret;
> +
> +	fmtinfo = vsp1_get_format_info(vsp1, fourcc);
> +	if (!fmtinfo) {
> +		dev_dbg(vsp1->dev, "Unsupported pixel format %08x\n", fourcc);
> +		return -EINVAL;
> +	}
> +
> +	rwpf->fmtinfo = fmtinfo;
> +
> +	format.which = V4L2_SUBDEV_FORMAT_ACTIVE;
> +	format.pad = RWPF_PAD_SINK;
> +	format.format.width = width;
> +	format.format.height = height;
> +	format.format.field = V4L2_FIELD_NONE;
> +	format.format.code = fmtinfo->mbus;
> +
> +	ret = v4l2_subdev_call(&ent->subdev, pad, set_fmt, NULL, &format);
> +	if (ret < 0)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +/*
> + * Configure RPF0 for ConfigDMA or RAW image transfer.
> + */
> +static int vsp1_vspx_rpf0_configure(struct vsp1_device *vsp1,
> +				    dma_addr_t addr, u32 fourcc,
> +				    unsigned int width, unsigned int height,
> +				    unsigned int rpf_sink_pad,

The variable name is a bit misleading, this is the sink pad of the
entity connected to the RPF output, i.e. the IIF. I'd name it
iif_sink_pad, and rename the VSPX_RPF_SINK_PAD_* macros. Those macros
should be moved to vsp1_iif.h (probably in patch "[PATCH v6 1/7] media:
vsp1: Add support IIF ISP Interface").

> +				    struct vsp1_dl_list *dl,
> +				    struct vsp1_dl_body *dlb)
> +{
> +	const struct vsp1_format_info *fmtinfo;
> +	struct vsp1_vspx_pipeline *vspx_pipe;
> +	struct vsp1_pipeline *pipe;
> +	struct vsp1_rwpf *rpf0;

You can write

	struct vsp1_pipeline *pipe = &vsp1->vspx->pipe.pipe;
	struct vsp1_rwpf *rpf0 = pipe->inputs[0];
	const struct vsp1_format_info *fmtinfo;

> +	int ret;
> +
> +	vspx_pipe = &vsp1->vspx->pipe;
> +	pipe = &vspx_pipe->pipe;
> +	rpf0 = pipe->inputs[0];

And drop this.

> +
> +	ret = vsp1_vspx_rwpf_set_subdev_fmt(vsp1, rpf0, fourcc, width, height);
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * The RPF0 sink pad is used to configure the entity routing table
> +	 * and compute stride.

This should also be updated, maybe to

	 * Connect RPF0 to the IIF sink pad corresponding to the config or image
	 * path.

> +	 */
> +	rpf0->entity.sink_pad = rpf_sink_pad;
> +
> +	if (rpf_sink_pad == VSPX_RPF_SINK_PAD_CONFIG) {
> +		/* ConfigDMA is a 1-D buffer with 4 bytes entries. */
> +		rpf0->format.plane_fmt[0].bytesperline = 4;

This doesn't seem right.

> +	} else {
> +		/* fmtinfo is valid as per vsp1_vspx_rwpf_set_subdev_fmt(). */
> +		fmtinfo = vsp1_get_format_info(vsp1, fourcc);
> +		rpf0->format.plane_fmt[0].bytesperline = width *
> +					       (7 + fmtinfo->bpp[0]) / 8;

The stride should be passed by the caller, likely using
job->img.fmt.fmt.pix_mp.bytesperline. For symmetry, I would also pass
the config stride from the caller to this function, as you pass the
width.

> +	}
> +
> +	pipe->part_table[0].rpf[0].width = width;
> +	pipe->part_table[0].rpf[0].height = height;
> +
> +	rpf0->mem.addr[0] = addr;
> +	rpf0->mem.addr[1] = 0;
> +	rpf0->mem.addr[2] = 0;
> +
> +	vsp1_entity_route_setup(&rpf0->entity, pipe, dlb);
> +	vsp1_entity_configure_stream(&rpf0->entity, rpf0->entity.state, pipe,
> +				     dl, dlb);
> +	vsp1_entity_configure_partition(&rpf0->entity, pipe,
> +					&pipe->part_table[0], dl, dlb);
> +
> +	return 0;
> +}
> +
> +static int vsp1_vspx_job_schedule(struct vsp1_device *vsp1)
> +{
> +	struct vsp1_dl_list *second_dl = NULL;
> +	struct vsp1_vspx_pipeline *vspx_pipe;
> +	struct vsp1_dl_list *first_dl;
> +	struct vsp1_isp_job_desc *job;
> +	struct vsp1_pipeline *pipe;
> +	struct vsp1_dl_body *dlb;
> +	struct vsp1_dl_list *dl;
> +	unsigned long flags;
> +	int ret = 0;
> +
> +	vspx_pipe = &vsp1->vspx->pipe;
> +	pipe = &vspx_pipe->pipe;
> +
> +	mutex_lock(&vspx_pipe->vspx_lock);

I think you can use

	guard(mutex, &vspx_pipe->vspx_lock);

and drop the error_unlock_and_return label. Similary, with

	struct vsp1_isp_job_desc *job  __free(kfree) = NULL;

you could drop the error_free_and_unlock label. The ret variable
wouldn't need to be initialized in that case.

This being said, as Niklas pointed out, this function is called from
interrupt context, so you need a spinlock instead. There's lots of work
being done here to be run in an interrupt handler. It would be better to
create the display list in user context (from vsp1_isp_queue_job()) and
only commit it in this function.

> +	if (vspx_pipe->processing)
> +		goto error_unlock_and_return;
> +
> +	/* Extract one job, if available, from the jobs list. */
> +	scoped_guard(mutex, &vspx_pipe->jobs_lock) {
> +		job = list_first_entry_or_null(&vspx_pipe->jobs,
> +					       struct vsp1_isp_job_desc,
> +					       job_queue);
> +		if (!job)
> +			goto error_unlock_and_return;
> +
> +		list_del(&job->job_queue);
> +	}
> +
> +	/*
> +	 * Transfer the buffers described in the job: (optional) ConfigDMA and
> +	 * RAW image.
> +	 */
> +
> +	first_dl = vsp1_dl_list_get(pipe->output->dlm);
> +
> +	dl = first_dl;
> +	dlb = vsp1_dl_list_get_body0(dl);
> +
> +	/* Disable RPF1. */
> +	vsp1_dl_body_write(dlb, vsp1->rpf[1]->entity.route->reg,
> +			   VI6_DPR_NODE_UNUSED);
> +
> +	/* Configure IIF routing and enable IIF function */
> +	vsp1_entity_route_setup(pipe->iif, pipe, dlb);
> +	vsp1_entity_configure_stream(pipe->iif, pipe->iif->state, pipe,
> +				     first_dl, dlb);
> +
> +	/* Configure WPF0 to enable RPF0 as source*/
> +	vsp1_entity_route_setup(&pipe->output->entity, pipe, dlb);
> +	vsp1_entity_configure_stream(&pipe->output->entity,
> +				     pipe->output->entity.state, pipe,
> +				     first_dl, dlb);
> +
> +	if (job->config.pairs) {
> +		/*
> +		 * Configure RPF0 for config data. Transfer the number of
> +		 * configuration pairs plus 2 words for the header.
> +		 */
> +		ret = vsp1_vspx_rpf0_configure(vsp1, job->config.mem,
> +					       V4L2_META_FMT_RCAR_V4H,
> +					       job->config.pairs * 2 + 2, 1,
> +					       VSPX_RPF_SINK_PAD_CONFIG,
> +					       dl, dlb);
> +		if (ret)
> +			goto error_free_and_unlock;
> +
> +		second_dl = vsp1_dl_list_get(pipe->output->dlm);
> +
> +		dl = second_dl;
> +		dlb = vsp1_dl_list_get_body0(dl);
> +	}
> +
> +	/* Configure RPF0 for RAW image transfer. */
> +	ret = vsp1_vspx_rpf0_configure(vsp1, job->img.mem,
> +				       job->img.fmt.fmt.pix_mp.pixelformat,
> +				       job->img.fmt.fmt.pix_mp.width,
> +				       job->img.fmt.fmt.pix_mp.height,
> +				       VSPX_RPF_SINK_PAD_IMG, dl, dlb);
> +	if (ret)
> +		goto error_free_and_unlock;
> +
> +	if (second_dl)
> +		vsp1_dl_list_add_chain(first_dl, second_dl);
> +
> +	vsp1_dl_list_commit(first_dl, 0);
> +
> +	vspx_pipe->processing = true;
> +	mutex_unlock(&vspx_pipe->vspx_lock);
> +
> +	kfree(job);
> +
> +	/* Trigger VSPX processing by setting VI6_CMD[STRCMD]. */
> +	spin_lock_irqsave(&pipe->irqlock, flags);
> +	vsp1_pipeline_run(pipe);
> +	spin_unlock_irqrestore(&pipe->irqlock, flags);

You can use a scoped guard. Same below.

> +
> +	return 0;
> +
> +error_free_and_unlock:
> +	kfree(job);
> +error_unlock_and_return:
> +	mutex_unlock(&vspx_pipe->vspx_lock);
> +
> +	return ret;
> +}
> +
> +/*******************************************************************************
> + * Interrupt handling
> + */

Following the driver coding style,

/* -----------------------------------------------------------------------------
 * Interrupt handling
 */

Same below.

> +static void vsp1_vspx_pipeline_frame_end(struct vsp1_pipeline *pipe,
> +					 unsigned int completion)
> +{
> +	struct vsp1_vspx_pipeline *vspx_pipe = to_vsp1_vspx_pipeline(pipe);
> +	struct vsp1_vspx *vspx = to_vsp1_vspx(vspx_pipe);
> +	struct vsp1_device *vsp1 = vspx->vsp1;

This is used in a single place below, where you can use vspx->vsp1
without declaring a local variable.

> +	unsigned long flags;
> +
> +	if (vspx_pipe->vspx_frame_end)
> +		vspx_pipe->vspx_frame_end(vspx_pipe->frame_end_data);
> +
> +	/*
> +	 * Set the pipeline state to stopped to ensure the next call to
> +	 * vsp1_pipeline_run() actually starts the VSPX.
> +	 */
> +	spin_lock_irqsave(&pipe->irqlock, flags);
> +	pipe->state = VSP1_PIPELINE_STOPPED;
> +	spin_unlock_irqrestore(&pipe->irqlock, flags);
> +
> +	scoped_guard(mutex, &vspx_pipe->vspx_lock)
> +		vspx_pipe->processing = false;

As this is a relatively new construct we'll need to figure out the
coding style. The absence of curly braces looks weird to me, I would
have written

	scoped_guard(mutex, &vspx_pipe->vspx_lock) {
		vspx_pipe->processing = false;
	}

> +
> +	/* Try schedule a new job from the queue. */
> +	vsp1_vspx_job_schedule(vsp1);
> +}
> +
> +/*******************************************************************************
> + * vsp1_isp interface (include/media/vsp1.h)

I'd write "ISP Driver API" to match vsp1_drm.c.

> + */
> +
> +int vsp1_isp_init(struct device *dev)
> +{
> +	struct vsp1_device *vsp1 = dev_get_drvdata(dev);
> +
> +	if (!vsp1)
> +		return -EPROBE_DEFER;
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(vsp1_isp_init);
> +
> +struct device *vsp1_isp_get_bus_master(struct device *dev)
> +{
> +	struct vsp1_device *vsp1 = dev_get_drvdata(dev);
> +
> +	if (!vsp1)
> +		return ERR_PTR(-ENODEV);
> +
> +	return vsp1->bus_master;
> +}
> +EXPORT_SYMBOL_GPL(vsp1_isp_get_bus_master);
> +
> +int vsp1_isp_alloc_buffers(struct device *dev, size_t size,
> +			   struct vsp1_isp_buffer_desc *buffer_desc)
> +{
> +	struct device *bus_master = vsp1_isp_get_bus_master(dev);
> +
> +	if (IS_ERR_OR_NULL(bus_master))
> +		return -ENODEV;
> +
> +	buffer_desc->cpu_addr = dma_alloc_coherent(bus_master, size,
> +						   &buffer_desc->dma_addr,
> +						   GFP_KERNEL);
> +	if (IS_ERR_OR_NULL(buffer_desc->cpu_addr))
> +		return -EINVAL;
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(vsp1_isp_alloc_buffers);
> +
> +int vsp1_isp_configure(struct device *dev,
> +		       const struct v4l2_pix_format_mplane *fmt)
> +{
> +	struct vsp1_device *vsp1 = dev_get_drvdata(dev);
> +	struct vsp1_vspx_pipeline *vspx_pipe;
> +	struct vsp1_pipeline *pipe;
> +	int ret;
> +
> +	vspx_pipe = &vsp1->vspx->pipe;
> +	pipe = &vspx_pipe->pipe;
> +
> +	guard(mutex)(&vspx_pipe->vspx_lock);
> +
> +	/*
> +	 * Apply the same format to the RPF0 and WPF0 so that the partition
> +	 * calculation results in a single partition.
> +	 */
> +	ret = vsp1_vspx_rwpf_set_subdev_fmt(vsp1, pipe->inputs[0],
> +					    fmt->pixelformat, fmt->width,
> +					    fmt->height);
> +	if (ret)
> +		return ret;
> +
> +	ret = vsp1_vspx_rwpf_set_subdev_fmt(vsp1, pipe->output, fmt->pixelformat,
> +					    fmt->width, fmt->height);
> +	if (ret)
> +		return ret;
> +
> +	vsp1_pipeline_calculate_partition(pipe, &pipe->part_table[0],
> +					  fmt->width, 0);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(vsp1_isp_configure);
> +
> +static void vsp1_vspx_release_jobs(struct vsp1_device *vsp1)
> +{
> +	struct vsp1_isp_job_desc *job, *tmp;
> +	struct vsp1_vspx_pipeline *vspx_pipe;
> +
> +	vspx_pipe = &vsp1->vspx->pipe;
> +
> +	guard(mutex)(&vspx_pipe->jobs_lock);
> +
> +	list_for_each_entry_safe(job, tmp, &vspx_pipe->jobs, job_queue) {
> +		list_del(&job->job_queue);
> +		kfree(job);
> +	}
> +}
> +
> +static void vsp1_isp_stop_streaming(struct vsp1_device *vsp1)
> +{
> +	struct vsp1_vspx_pipeline *vspx_pipe = &vsp1->vspx->pipe;
> +	struct vsp1_pipeline *pipe = &vspx_pipe->pipe;
> +
> +	pipe->state = VSP1_PIPELINE_STOPPED;
> +	vsp1_pipeline_stop(pipe);
> +	vsp1_vspx_release_jobs(vsp1);
> +	vspx_pipe->processing = false;
> +	vspx_pipe->vspx_frame_end = NULL;
> +	vsp1_device_put(vsp1);
> +}
> +
> +int vsp1_isp_start_streaming(struct device *dev,
> +			     struct vsp1_vspx_frame_end *frame_end,
> +			     bool enable)
> +{
> +	struct vsp1_device *vsp1 = dev_get_drvdata(dev);
> +	struct vsp1_vspx_pipeline *vspx_pipe;
> +	struct vsp1_pipeline *pipe;
> +	u32 value;
> +	int ret;
> +
> +	vspx_pipe = &vsp1->vspx->pipe;
> +	pipe = &vspx_pipe->pipe;
> +
> +	guard(mutex)(&vspx_pipe->vspx_lock);
> +
> +	if (!enable) {
> +		vsp1_isp_stop_streaming(vsp1);
> +		return 0;
> +	}
> +
> +	if (!frame_end)
> +		return -EINVAL;
> +
> +	vspx_pipe->vspx_frame_end = frame_end->vspx_frame_end;
> +	vspx_pipe->frame_end_data = frame_end->frame_end_data;
> +
> +	/* Make sure VSPX is not active. */
> +	value = vsp1_read(vsp1, VI6_CMD(0));
> +	if (value & VI6_CMD_STRCMD) {
> +		dev_err(vsp1->dev,
> +			"%s: Starting of WPF0 already reserved\n", __func__);
> +		return -EBUSY;
> +	}
> +
> +	value = vsp1_read(vsp1, VI6_STATUS);
> +	if (value & VI6_STATUS_SYS_ACT(0)) {
> +		dev_err(vsp1->dev,
> +			"%s: WPF0 has not entered idle state\n", __func__);
> +		return -EBUSY;
> +	}
> +
> +	/* Enable the VSP1 and prepare for streaming. */
> +	vsp1_pipeline_dump(pipe, "VSPX job");
> +
> +	ret = vsp1_device_get(vsp1);
> +	if (ret < 0)
> +		return ret;
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(vsp1_isp_start_streaming);
> +
> +int vsp1_isp_queue_job(struct device *dev, const struct vsp1_isp_job_desc *job)
> +{
> +	struct vsp1_device *vsp1 = dev_get_drvdata(dev);
> +	struct vsp1_vspx_pipeline *vspx_pipe = &vsp1->vspx->pipe;
> +	struct vsp1_isp_job_desc *newjob;
> +
> +	/*
> +	 * Copy the job description and append it to the jobs queue.
> +	 * Memory is released when the job is consumed.
> +	 */
> +	newjob = kmalloc(sizeof(*newjob), GFP_KERNEL);
> +	if (!newjob)
> +		return -ENOMEM;
> +
> +	*newjob = *job;
> +
> +	scoped_guard(mutex, &vspx_pipe->jobs_lock)
> +		list_add_tail(&newjob->job_queue, &vspx_pipe->jobs);
> +
> +	vsp1_vspx_job_schedule(vsp1);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(vsp1_isp_queue_job);

Any reason for this one not being GPL ?

> +
> +/*******************************************************************************
> + * vsp1_vspx interface (drivers/media/platform/renesas/vsp1/vsp1_vspx.h)

I'd just write "Initialization & cleanup".

> + */
> +
> +int vsp1_vspx_init(struct vsp1_device *vsp1)
> +{
> +	struct vsp1_vspx_pipeline *vspx_pipe;
> +	struct vsp1_pipeline *pipe;
> +
> +	vsp1->vspx = devm_kzalloc(vsp1->dev, sizeof(*vsp1->vspx), GFP_KERNEL);
> +	if (!vsp1->vspx)
> +		return -ENOMEM;
> +
> +	vsp1->vspx->vsp1 = vsp1;
> +
> +	vspx_pipe = &vsp1->vspx->pipe;
> +	vspx_pipe->processing = false;
> +
> +	pipe = &vspx_pipe->pipe;
> +
> +	vsp1_pipeline_init(pipe);
> +
> +	pipe->partitions = 1;
> +	pipe->part_table = &vspx_pipe->partition;
> +	pipe->interlaced = 0;

This is a boolean field, you can use false.

> +	pipe->frame_end = vsp1_vspx_pipeline_frame_end;
> +
> +	INIT_LIST_HEAD(&vspx_pipe->jobs);
> +	mutex_init(&vspx_pipe->vspx_lock);
> +	mutex_init(&vspx_pipe->jobs_lock);
> +
> +	pipe->output = vsp1->wpf[0];
> +	pipe->output->entity.pipe = pipe;
> +	vsp1_vspx_rwpf_set_subdev_fmt(vsp1, pipe->output,
> +				      vspx_default_fmt.pixelformat,
> +				      vspx_default_fmt.width,
> +				      vspx_default_fmt.height);
> +	list_add_tail(&pipe->output->entity.list_pipe, &pipe->entities);
> +
> +	pipe->iif = &vsp1->iif->entity;
> +	pipe->iif->pipe = pipe;
> +	pipe->iif->sink = &pipe->output->entity;

	pipe->iif->sink_pad = RWPF_PAD_SINK;

for clarity.

> +	list_add(&pipe->iif->list_pipe, &pipe->entities);
> +
> +	/*
> +	 * Initialize RPF0 as inputs for VSPX and use it unconditionally for
> +	 * now.
> +	 */
> +	pipe->inputs[0] = vsp1->rpf[0];
> +	pipe->inputs[0]->entity.pipe = pipe;
> +	pipe->inputs[0]->entity.sink = pipe->iif;
> +	vsp1_vspx_rwpf_set_subdev_fmt(vsp1, pipe->inputs[0],
> +				      vspx_default_fmt.pixelformat,
> +				      vspx_default_fmt.width,
> +				      vspx_default_fmt.height);
> +	list_add_tail(&pipe->inputs[0]->entity.list_pipe, &pipe->entities);

I think you can use list_add() for all three entities, to have the
pipe->entities list sorted in source to sink order.

> +
> +	return 0;
> +}
> +
> +void vsp1_vspx_cleanup(struct vsp1_device *vsp1)
> +{
> +	struct vsp1_vspx_pipeline *vspx_pipe;
> +
> +	vspx_pipe = &vsp1->vspx->pipe;

	struct vsp1_vspx_pipeline *vspx_pipe = &vsp1->vspx->pipe;

> +
> +	vsp1_vspx_release_jobs(vsp1);
> +
> +	mutex_destroy(&vspx_pipe->jobs_lock);

You should also destroy vspx_lock.

> +}
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_vspx.h b/drivers/media/platform/renesas/vsp1/vsp1_vspx.h
> new file mode 100644
> index 000000000000..69f73e1addba
> --- /dev/null
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_vspx.h
> @@ -0,0 +1,76 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +/*
> + * vsp1_vspx.h  --  R-Car Gen 4 VSPX
> + *
> + * Copyright (C) 2025 Ideas On Board Oy
> + * Copyright (C) 2025 Renesas Electronics Corporation
> + */
> +#ifndef __VSP1_VSPX_H__
> +#define __VSP1_VSPX_H__
> +
> +#include <linux/container_of.h>
> +#include <linux/device.h>

Is device.h needed ?

> +#include <linux/list.h>
> +#include <linux/mutex.h>
> +
> +#include <media/vsp1.h>

This header doesn't seem needed either.

> +
> +#include "vsp1.h"
> +#include "vsp1_pipe.h"
> +
> +/* Pixel format for ConfigDMA buffers. */
> +#define V4L2_META_FMT_RCAR_V4H	v4l2_fourcc('R', 'C', 'A', '4')

V4L2 formats belong to UAPI headers. I understand the format is used
internally only though. The commit message, or the comment above, should
explain why this is fine.

You should include the header that defines v4l2_fourcc.

Thinking more about this, we could simply avoid adding this new formats,
and instead use V4L2_PIX_FMT_XBGR32 in vsp1_vspx_job_schedule() with an
appropriate comment.

> +
> +/*
> + * struct vsp1_vspx_pipeline - VSPX pipeline
> + * @pipe: the VSP1 pipeline
> + * @partition: the pre-calculated partition used by the pipeline
> + * @vspx_lock: protect access to the VSPX configuration
> + * @processing: VSPX busy flag
> + * @jobs_lock: protect the jobs queue
> + * @jobs: jobs queue
> + * @vspx_frame_end: frame end callback
> + * @frame_end_data: data for the frame end callback
> + */
> +struct vsp1_vspx_pipeline {
> +	struct vsp1_pipeline pipe;
> +	struct vsp1_partition partition;
> +
> +	/* Protects the pipeline configuration */
> +	struct mutex vspx_lock;
> +	bool processing;
> +
> +	/* Protects the jobs list */
> +	struct mutex jobs_lock;
> +	struct list_head jobs;
> +
> +	void (*vspx_frame_end)(void *frame_end_data);
> +	void *frame_end_data;
> +};
> +
> +static inline struct vsp1_vspx_pipeline *
> +to_vsp1_vspx_pipeline(struct vsp1_pipeline *pipe)
> +{
> +	return container_of(pipe, struct vsp1_vspx_pipeline, pipe);
> +}
> +
> +/*
> + * struct vsp1_vspx - VSPX device
> + * @vsp1: the VSP1 device
> + * @pipe: the VSPX pipeline
> + */
> +struct vsp1_vspx {
> +	struct vsp1_device *vsp1;
> +	struct vsp1_vspx_pipeline pipe;
> +};
> +
> +static inline struct vsp1_vspx *
> +to_vsp1_vspx(struct vsp1_vspx_pipeline *vspx_pipe)
> +{
> +	return container_of(vspx_pipe, struct vsp1_vspx, pipe);
> +}

I think all of the above could be moved to vsp1_vspx.c to provide better
encapsulation and avoid exposing internals. I know vsp1_drm.h has a
similar structure, which should probably be fixed too (not as part of
this patch).

> +
> +int vsp1_vspx_init(struct vsp1_device *vsp1);
> +void vsp1_vspx_cleanup(struct vsp1_device *vsp1);
> +
> +#endif /* __VSP1_VSPX_H__ */
> diff --git a/include/media/vsp1.h b/include/media/vsp1.h
> index 48f4a5023d81..668f5896503b 100644
> --- a/include/media/vsp1.h
> +++ b/include/media/vsp1.h
> @@ -9,12 +9,17 @@
>  #ifndef __MEDIA_VSP1_H__
>  #define __MEDIA_VSP1_H__
>  
> +#include <linux/list.h>
>  #include <linux/scatterlist.h>
>  #include <linux/types.h>
>  #include <linux/videodev2.h>
>  
>  struct device;
>  
> +/*******************************************************************************
> + * VSP1 DU interface
> + */
> +
>  int vsp1_du_init(struct device *dev);
>  
>  #define VSP1_DU_STATUS_COMPLETE		BIT(0)
> @@ -117,4 +122,137 @@ void vsp1_du_atomic_flush(struct device *dev, unsigned int pipe_index,
>  int vsp1_du_map_sg(struct device *dev, struct sg_table *sgt);
>  void vsp1_du_unmap_sg(struct device *dev, struct sg_table *sgt);
>  
> +/*******************************************************************************
> + * VSP1 ISP interface
> + */
> +
> +/**
> + * struct vsp1_isp_buffer_desc - Describe a buffer allocated by VSPX
> + *
> + * @cpu_addr: CPU-mapped address of a buffer allocated by VSPX
> + * @dma_addr: bus address of a buffer allocated by VSPX
> + */
> +struct vsp1_isp_buffer_desc {
> +	void *cpu_addr;
> +	dma_addr_t dma_addr;
> +};
> +
> +/**
> + * struct vsp1_isp_job_desc - Describe a VSPX buffer transfer request
> + *
> + * Describe a transfer request for the VSPX to perform on behalf of the ISP.
> + * The transfer job descriptor contains an optional ConfigDMA buffer and
> + * one RAW image buffer. Set config.pairs to 0 if no ConfigDMA buffer should
> + * be transferred.
> + *
> + * @config: ConfigDMA buffer
> + * @config.pairs: number of reg-value pairs in the ConfigDMA buffer
> + * @config.mem: bus address of the ConfigDMA buffer
> + * @img: RAW image buffer
> + * @img.fmt: RAW image format
> + * @img.mem: bus address of the RAW image buffer
> + * @job_queue: list handle
> + */
> +struct vsp1_isp_job_desc {
> +	struct {
> +		unsigned int pairs;
> +		dma_addr_t mem;
> +	} config;
> +	struct {
> +		struct v4l2_format fmt;
> +		dma_addr_t mem;
> +	} img;
> +	struct list_head job_queue;
> +};
> +
> +/**
> + * struct vsp1_vspx_frame_end - VSPX frame end callback data
> + *
> + * @vspx_frame_end: Frame end callback. Called after a transfer job has been
> + *		    completed. If the job includes both a ConfigDMA and a
> + *		    RAW image, the callback is called after both have been
> + *		    transferred
> + * @frame_end_data: Frame end callback data, passed to vspx_frame_end
> + */
> +struct vsp1_vspx_frame_end {
> +	void (*vspx_frame_end)(void *data);
> +	void *frame_end_data;
> +};
> +
> +/**
> + * vsp1_isp_init() - Initialize the VSPX
> + *
> + * @dev: The VSP1 struct device
> + *
> + * Return: %0 on success or a negative error code on failure
> + */

Functions for the DU API are documented in vsp1_drm.c, I would do the
same for the ISP API and move the documentation to vsp1_vspx.c.

> +int vsp1_isp_init(struct device *dev);
> +
> +/**
> + * vsp1_isp_get_bus_master - Get VSPX bus master
> + *
> + * The VSPX access memory through an FCPX instance. When allocating memory
> + * buffers that will have to be accessed by the VSPX the 'struct device' of
> + * the FCPX should be used. Use this function to get a reference to it.
> + *
> + * @dev: The VSP1 struct device
> + *
> + * Return: a pointer to the bus master's device
> + */
> +struct device *vsp1_isp_get_bus_master(struct device *dev);
> +
> +/**
> + * vsp1_isp_alloc_buffers - Allocate buffers in the VSPX address space
> + *
> + * Allocate buffers that will be later accessed by the VSPX.
> + *
> + * @dev: The VSP1 struct device
> + * @size: The size of the buffer to be allocated by the VSPX
> + * @buffer_desc: The allocated buffer description, will be filled with the
> + *		 buffer CPU-mapped address and the bus address
> + *
> + * Return: %0 on success or a negative error code on failure
> + */
> +int vsp1_isp_alloc_buffers(struct device *dev, size_t size,
> +			   struct vsp1_isp_buffer_desc *buffer_desc);
> +
> +/**
> + * vsp1_isp_configure - Configure the VSPX with the RAW image format
> + *
> + * Apply to the VSPX RPF/WPF the size of the RAW image that will be transferred
> + * to the ISP.
> + *
> + * @dev: The VSP1 struct device
> + * @fmt: The RAW image format description
> + *
> + * Return: %0 on success or a negative error code on failure
> + */
> +int vsp1_isp_configure(struct device *dev,
> +		       const struct v4l2_pix_format_mplane *fmt);
> +
> +/**
> + * vsp1_isp_start_streaming - Start processing VSPX jobs
> + *
> + * Start the VSPX and prepare for accepting buffer transfer job requests.
> + *
> + * @dev: The VSP1 struct device
> + * @frame_end: The frame end callback description
> + * @enable: The enable/disable streaming flag
> + *
> + * Return: %0 on success or a negative error code on failure
> + */
> +int vsp1_isp_start_streaming(struct device *dev,
> +			     struct vsp1_vspx_frame_end *frame_end,
> +			     bool enable);
> +
> +/**
> + * vsp1_isp_queue_job - Queue a buffer transfer job request
> + *
> + * @dev: The VSP1 struct device
> + * @job: The job description
> + *
> + * Return: %0 on success or a negative error code on failure
> + */
> +int vsp1_isp_queue_job(struct device *dev, const struct vsp1_isp_job_desc *job);
> +
>  #endif /* __MEDIA_VSP1_H__ */
> 
> ---
> base-commit: f2151613e040973c868d28c8b00885dfab69eb75
> change-id: 20250228-v4h-vspx-6a537fc83806
> prerequisite-change-id: 20250123-v4h-iif-a1dda640c95d:v5
> prerequisite-patch-id: 700c4bf62e4d8fbd61bf2d7f0289ad6a62ff37d1
> prerequisite-patch-id: 4af28f0fe9d553b6834c9340969dc9b1c69ceeb9
> prerequisite-patch-id: ce124996dcd23a437d4d6e1d8e8511a2381ef7b2
> prerequisite-patch-id: 1aef52a94a4b67ac092e1d182110cfaad573fec2
> prerequisite-patch-id: 51b2930186407e748f27042bdc314d3ecadd5b2c
> prerequisite-patch-id: bbdd47075847923c82dbf7a547d0cf8e6b145677
> prerequisite-patch-id: 91ae1a6a845e756ca98e35e1902fd223f1c5ec3d

-- 
Regards,

Laurent Pinchart

