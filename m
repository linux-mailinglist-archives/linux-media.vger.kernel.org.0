Return-Path: <linux-media+bounces-29169-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E13E4A78318
	for <lists+linux-media@lfdr.de>; Tue,  1 Apr 2025 22:07:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8F8E616B589
	for <lists+linux-media@lfdr.de>; Tue,  1 Apr 2025 20:07:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AD2D20F072;
	Tue,  1 Apr 2025 20:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="RemsOynl";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="AMVCz/UR"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-a4-smtp.messagingengine.com (fout-a4-smtp.messagingengine.com [103.168.172.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 286A91C6FFE;
	Tue,  1 Apr 2025 20:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743538032; cv=none; b=QyDkmga5JMOcDP+E3Wpc+SzxZFT9Pe+iVPaxLiG2ov1PZenOvdn/WzVdVRNkz34PARsvr99F286HRCxEuZtlqj8RhgEFP7l51s6vYEk3U73Rbxa72NTFdxBsmiH5aTjcw6xLts301gX4XFRZEs+AnIU21PC2udFAYUK1M7Zp69A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743538032; c=relaxed/simple;
	bh=uxkiUryZXzJzQHbxZNuFt51EUxDPZm7Zvc6+0WVzJig=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bwiYxvGHX3DP9Z4oy5esvICx6QIdvAeZwAAMh11Avq6DhMS4KkxJQ/5NGB5q3HsI1LjlPpbwRa5ZwBc/X3hUYotB8/d6ysIvD/IzuIdaU3zb4xDIgpPZdFzI4O9yU4U/MqBaXIjrF69IsBoeYboaGQPKqiOlTccAWa/CphZJEtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=RemsOynl; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=AMVCz/UR; arc=none smtp.client-ip=103.168.172.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-02.internal (phl-compute-02.phl.internal [10.202.2.42])
	by mailfout.phl.internal (Postfix) with ESMTP id 28D7B1383D35;
	Tue,  1 Apr 2025 16:07:07 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Tue, 01 Apr 2025 16:07:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1743538027;
	 x=1743624427; bh=k1DvoDhuNKrBI7/G1GtLt9HwA2pa0v/foRHwbFmw8Zw=; b=
	RemsOynlK+pR72Ym/PRY0NgbXGdmyJsAKTi7L6D0CIeEesH1PYWeNHEiUu1CYhFG
	OsmFm0PDdWX0lBCXM7xuXCD5XEI2OGRo7Bt7Gb8ygwQ5cEs89OM0ATxvhD5iNy1z
	9gnz1TMCa7VKcnSUHstOreFgkEX5nBqzxM/uUqpFBc/N50hWhHDCwgygXr0ai1jR
	n4e01Aq4HIsh5U62Qa9Uem17QGoiCVTnqe2SOof4s9P87shYNysDiKL55VqlzPjq
	Fjr4s5efMHX+T5KZqJlKuurdwAOrPwX68xeraYURzw/7C2lXg5K7P4AHg5XMLNAn
	vVfNr/uX9kn1thDwt92nkA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1743538027; x=
	1743624427; bh=k1DvoDhuNKrBI7/G1GtLt9HwA2pa0v/foRHwbFmw8Zw=; b=A
	MVCz/URgTMD0f1Pw5vJVh/HTXEkFqnpM2qIWoXp59nrwRDD1jfJuA/qU4P/Xm6Yu
	WKbvl2RWFPJCV5xJiO7fTOXyiq33RkgfMVm2SiEzkH4rqfr8BNMEZi+CQlitd7yC
	Mx4ZJkbqyf8BtQGsG1qVp/YIiO/HSTbrDKF63Z8v1Y6KE7wLIBEG/NjDWDBvzdPB
	ib0I13d11lrQ7xMALlKxNJB3zE5rJ+gV47f7jGJf1vx8k9tt7RtykGsHzt3Vz7Ve
	5a2Bsfle02lb7Bt2VCF8SfoIbnVmYpE5wL2uKlzGjZepGUJCVDdidhAQr8L4KFW3
	VV0V6hkw6+PRzlRRSNImw==
X-ME-Sender: <xms:akfsZ_8agERgEJkWG1uApEwq8KKbt1UC9IbnM0lHa-LFJqEvY4dmtg>
    <xme:akfsZ7u01o-C5yFSsMk1lYHS1SBRJU8jXjeXEsuxs_3NuE6UvLfSWTmmpSuiACfUS
    AMsEXyphBpUemNGXuQ>
X-ME-Received: <xmr:akfsZ9BNj-IHiktCkpuJvBMHh1UA9W-n33KUA0HLV8XAZf2C0im3dPkRKcRzcjDJMpiF2xBKzMctOMvttWHaQ1EYR11qgY1gEg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddukeefieelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddt
    tdejnecuhfhrohhmpefpihhklhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrsh
    houggvrhhluhhnugesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeev
    teegtddvvdfhtdekgefhfeefheetheekkeegfeejudeiudeuleegtdehkeekteenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdr
    shhouggvrhhluhhnugesrhgrghhnrghtvggthhdrshgvpdhnsggprhgtphhtthhopeeipd
    hmohguvgepshhmthhpohhuthdprhgtphhtthhopehjrggtohhpohdrmhhonhguihdorhgv
    nhgvshgrshesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtoheplhgruhhrvg
    hnthdrphhinhgthhgrrhhtsehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthho
    pehkihgvrhgrnhdrsghinhhghhgrmhdorhgvnhgvshgrshesihguvggrshhonhgsohgrrh
    gurdgtohhmpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhn
    vghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqmhgvughirgesvhhgvghrrdhkvghrnh
    gvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhrvghnvghsrghsqdhsohgtsehvghgv
    rhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:akfsZ7dtkJeN3BXUOr7VT8EmiKZB06krDAps_KBBrGbVjqZaC8453w>
    <xmx:akfsZ0PlCF6XDDkXE5CEedDUABDBv5hoS1k9kbz1aCQ3yJsxmfyKaQ>
    <xmx:akfsZ9lrbvxdaRkR8ZEpzB-h7O7bGuwZfqh_W6IjNDoOP_0TkpgeJw>
    <xmx:akfsZ-tykryvLPVxG1zXIsFh_PpIlSL9eD3Svou9s5Ed70dVrYgTYQ>
    <xmx:a0fsZwA-tutvdKJ_-tBG6D_0H6A1Fct1PDAS0iMiwzWEr63xNN0TTo1z>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 1 Apr 2025 16:07:06 -0400 (EDT)
Date: Tue, 1 Apr 2025 22:07:05 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v7 5/5] media: vsp1: Add VSPX support
Message-ID: <20250401200705.GG1240431@ragnatech.se>
References: <20250401-v4h-iif-v7-0-cc547c0bddd5@ideasonboard.com>
 <20250401-v4h-iif-v7-5-cc547c0bddd5@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250401-v4h-iif-v7-5-cc547c0bddd5@ideasonboard.com>

Hi Jacopo,

Thanks for your work.

On 2025-04-01 16:22:05 +0200, Jacopo Mondi wrote:
> Add support for VSPX, a specialized version of the VSP2 that
> transfer data to the ISP. The VSPX is composed by two RPF units
> to read data from external memory and an IIF instance that performs
> transfer towards the ISP.
> 
> The VSPX is supported through a newly introduced vsp1_vspx.c file that
> exposes two interfaces: vsp1_vspx interface, declared in vsp1_vspx.h
> for the vsp1 core to initialize and cleanup the VSPX, and a vsp1_isp
> interface, declared in include/media/vsp1.h for the ISP driver to
> control the VSPX operations.
> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> ---
>  drivers/media/platform/renesas/vsp1/Makefile    |   1 +
>  drivers/media/platform/renesas/vsp1/vsp1.h      |   1 +
>  drivers/media/platform/renesas/vsp1/vsp1_drv.c  |  13 +-
>  drivers/media/platform/renesas/vsp1/vsp1_regs.h |   1 +
>  drivers/media/platform/renesas/vsp1/vsp1_vspx.c | 604 ++++++++++++++++++++++++
>  drivers/media/platform/renesas/vsp1/vsp1_vspx.h |  86 ++++
>  include/media/vsp1.h                            |  73 +++
>  7 files changed, 778 insertions(+), 1 deletion(-)
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
> index 000000000000..db9707f2b532
> --- /dev/null
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_vspx.c
> @@ -0,0 +1,604 @@
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
> +					 struct vsp1_rwpf *rwpf,
> +					 u32 isp_fourcc,
> +					 unsigned int width,
> +					 unsigned int height)
> +{
> +	struct vsp1_entity *ent = &rwpf->entity;
> +	const struct vsp1_format_info *fmtinfo;
> +	struct v4l2_subdev_format format = {};
> +	u32 vspx_fourcc;
> +	int ret;
> +
> +	switch (isp_fourcc) {
> +	case V4L2_PIX_FMT_GREY:
> +		/* 8 bit RAW Bayer */
> +		vspx_fourcc = V4L2_PIX_FMT_RGB332;
> +		break;
> +	case V4L2_PIX_FMT_Y10:
> +	case V4L2_PIX_FMT_Y12:
> +	case V4L2_PIX_FMT_Y16:
> +		/* 10, 12 and 16 bit RAW Bayer */
> +		vspx_fourcc = V4L2_PIX_FMT_RGB565;
> +		break;
> +	case V4L2_PIX_FMT_XBGR32:
> +		/* ConfigDMA */
> +		vspx_fourcc = V4L2_PIX_FMT_XBGR32;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	fmtinfo = vsp1_get_format_info(vsp1, vspx_fourcc);
> +	if (!fmtinfo) {
> +		dev_dbg(vsp1->dev, "Unsupported pixel format %08x\n",
> +			vspx_fourcc);
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
> +				    dma_addr_t addr, u32 isp_fourcc,
> +				    unsigned int width, unsigned int height,
> +				    unsigned int stride,
> +				    unsigned int iif_sink_pad,
> +				    struct vsp1_dl_list *dl,
> +				    struct vsp1_dl_body *dlb)
> +{
> +	struct vsp1_vspx_pipeline *vspx_pipe = &vsp1->vspx->pipe;
> +	struct vsp1_pipeline *pipe = &vspx_pipe->pipe;
> +	struct vsp1_rwpf *rpf0 = pipe->inputs[0];
> +	int ret;
> +
> +	ret = vsp1_vspx_rwpf_set_subdev_fmt(vsp1, rpf0, isp_fourcc, width,
> +					    height);
> +	if (ret)
> +		return ret;
> +
> +	rpf0->format.plane_fmt[0].bytesperline = stride;
> +
> +	/*
> +	 * Connect RPF0 to the IIF sink pad corresponding to the config or image
> +	 * path.
> +	 */
> +	rpf0->entity.sink_pad = iif_sink_pad;
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
> +/* -----------------------------------------------------------------------------
> + * Interrupt handling
> + */
> +static void vsp1_vspx_pipeline_frame_end(struct vsp1_pipeline *pipe,
> +					 unsigned int completion)
> +{
> +	struct vsp1_vspx_pipeline *vspx_pipe = to_vsp1_vspx_pipeline(pipe);
> +	struct vsp1_vspx *vspx = to_vsp1_vspx(vspx_pipe);
> +
> +	if (vspx_pipe->vspx_frame_end)
> +		vspx_pipe->vspx_frame_end(vspx_pipe->frame_end_data);
> +
> +	/*
> +	 * Set the pipeline state to stopped to ensure the next call to
> +	 * vsp1_pipeline_run() actually starts the VSPX.
> +	 */
> +	scoped_guard(spinlock_irqsave, &pipe->irqlock) {
> +		pipe->state = VSP1_PIPELINE_STOPPED;
> +	}
> +
> +	scoped_guard(spinlock_irqsave, &vspx_pipe->vspx_lock) {
> +		vspx_pipe->processing = false;
> +	}
> +
> +	/* Try schedule a new job from the queue. */
> +	vsp1_isp_job_run(vspx->vsp1->dev);
> +}
> +
> +/* -----------------------------------------------------------------------------
> + * ISP Driver API (include/media/vsp1.h)
> + */
> +
> +/**
> + * vsp1_isp_init() - Initialize the VSPX
> + *
> + * @dev: The VSP1 struct device
> + *
> + * Return: %0 on success or a negative error code on failure
> + */
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
> +	struct vsp1_vspx_pipeline *vspx_pipe = &vsp1->vspx->pipe;
> +	struct vsp1_vspx_job *job, *tmp;
> +
> +	guard(spinlock_irqsave)(&vspx_pipe->jobs_lock);
> +
> +	list_for_each_entry_safe(job, tmp, &vspx_pipe->jobs, job_queue) {
> +		list_del(&job->job_queue);
> +		vsp1_dl_list_put(job->dl);
> +		kfree(job);
> +	}
> +}
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
> +			     bool enable)
> +{
> +	struct vsp1_device *vsp1 = dev_get_drvdata(dev);
> +	struct vsp1_vspx_pipeline *vspx_pipe = &vsp1->vspx->pipe;
> +	struct vsp1_pipeline *pipe = &vspx_pipe->pipe;
> +	u32 value;
> +	int ret;
> +
> +	scoped_guard(spinlock_irqsave, &vspx_pipe->vspx_lock) {
> +		if (vspx_pipe->enabled == enable)
> +			return 0;
> +
> +		vspx_pipe->enabled = enable;
> +	}
> +
> +	if (!enable) {
> +		pipe->state = VSP1_PIPELINE_STOPPED;
> +		vsp1_pipeline_stop(pipe);
> +		vsp1_vspx_release_jobs(vsp1);
> +		vspx_pipe->processing = false;
> +		vspx_pipe->vspx_frame_end = NULL;
> +		vsp1_dlm_reset(pipe->output->dlm);
> +		vsp1_device_put(vsp1);
> +		return 0;
> +	}
> +
> +	if (!frame_end) {
> +		ret = -EINVAL;
> +		goto error_stop_pipe;
> +	}
> +
> +	vspx_pipe->vspx_frame_end = frame_end->vspx_frame_end;
> +	vspx_pipe->frame_end_data = frame_end->frame_end_data;
> +
> +	/* Make sure VSPX is not active. */
> +	value = vsp1_read(vsp1, VI6_CMD(0));
> +	if (value & VI6_CMD_STRCMD) {
> +		dev_err(vsp1->dev,
> +			"%s: Starting of WPF0 already reserved\n", __func__);
> +		ret = -EBUSY;
> +		goto error_stop_pipe;
> +	}
> +
> +	value = vsp1_read(vsp1, VI6_STATUS);
> +	if (value & VI6_STATUS_SYS_ACT(0)) {
> +		dev_err(vsp1->dev,
> +			"%s: WPF0 has not entered idle state\n", __func__);
> +		ret = -EBUSY;
> +		goto error_stop_pipe;
> +	}
> +
> +	/* Enable the VSP1 and prepare for streaming. */
> +	vsp1_pipeline_dump(pipe, "VSPX job");
> +
> +	ret = vsp1_device_get(vsp1);
> +	if (ret < 0)
> +		goto error_stop_pipe;
> +
> +	return 0;
> +
> +error_stop_pipe:
> +	scoped_guard(spinlock_irqsave, &vspx_pipe->vspx_lock) {
> +		vspx_pipe->enabled = false;
> +	}
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(vsp1_isp_start_streaming);
> +
> +/**
> + * vsp1_vspx_job_prepare - Prepare a display list with the content of the buffer
> + *
> + * @dev: The VSP1 struct device
> + * @job: The job description
> + *
> + * Return: %0 on success or a negative error code on failure
> + */
> +int vsp1_isp_job_prepare(struct device *dev,
> +			 const struct vsp1_isp_job_desc *desc)
> +{
> +	struct vsp1_device *vsp1 = dev_get_drvdata(dev);
> +	struct vsp1_vspx_pipeline *vspx_pipe = &vsp1->vspx->pipe;
> +	struct vsp1_pipeline *pipe = &vspx_pipe->pipe;
> +	const struct v4l2_pix_format_mplane *pix_mp;
> +	struct vsp1_dl_list *second_dl = NULL;
> +	struct vsp1_vspx_job *job;
> +	struct vsp1_dl_body *dlb;
> +	struct vsp1_dl_list *dl;
> +	int ret;
> +
> +	/*
> +	 * Populate a display list and append it to the jobs queue.
> +	 * Memory is released when the job is consumed.
> +	 */
> +	job = kmalloc(sizeof(*job), GFP_KERNEL);
> +	if (!job)
> +		return -ENOMEM;
> +
> +	/*
> +	 * Transfer the buffers described in the job: (optional) ConfigDMA and
> +	 * RAW image.
> +	 */
> +
> +	job->dl = vsp1_dl_list_get(pipe->output->dlm);
> +	if (!job->dl) {
> +		ret = -ENOMEM;
> +		goto error_free_job;
> +	}
> +
> +	dl = job->dl;
> +	dlb = vsp1_dl_list_get_body0(dl);
> +
> +	/* Disable RPF1. */
> +	vsp1_dl_body_write(dlb, vsp1->rpf[1]->entity.route->reg,
> +			   VI6_DPR_NODE_UNUSED);
> +
> +	/* Configure IIF routing and enable IIF function */
> +	vsp1_entity_route_setup(pipe->iif, pipe, dlb);
> +	vsp1_entity_configure_stream(pipe->iif, pipe->iif->state, pipe,
> +				     dl, dlb);
> +
> +	/* Configure WPF0 to enable RPF0 as source*/
> +	vsp1_entity_route_setup(&pipe->output->entity, pipe, dlb);
> +	vsp1_entity_configure_stream(&pipe->output->entity,
> +				     pipe->output->entity.state, pipe,
> +				     dl, dlb);
> +
> +	if (desc->config.pairs) {
> +		/*
> +		 * Configure RPF0 for config data. Transfer the number of
> +		 * configuration pairs plus 2 words for the header.
> +		 */
> +		ret = vsp1_vspx_rpf0_configure(vsp1, desc->config.mem,
> +					       V4L2_PIX_FMT_XBGR32,
> +					       desc->config.pairs * 2 + 2, 1,
> +					       desc->config.pairs * 2 + 2,
> +					       VSPX_IIF_SINK_PAD_CONFIG,
> +					       dl, dlb);
> +		if (ret)
> +			goto error_put_dl;
> +
> +		second_dl = vsp1_dl_list_get(pipe->output->dlm);
> +		if (!second_dl) {
> +			ret = -ENOMEM;
> +			goto error_put_dl;
> +		}
> +
> +		dl = second_dl;
> +		dlb = vsp1_dl_list_get_body0(dl);
> +	}
> +
> +	/* Configure RPF0 for RAW image transfer. */
> +	pix_mp = &desc->img.fmt.fmt.pix_mp;
> +	ret = vsp1_vspx_rpf0_configure(vsp1, desc->img.mem,
> +				       pix_mp->pixelformat,
> +				       pix_mp->width, pix_mp->height,
> +				       pix_mp->plane_fmt[0].bytesperline,
> +				       VSPX_IIF_SINK_PAD_IMG, dl, dlb);
> +	if (ret)
> +		goto error_put_dl;
> +
> +	if (second_dl)
> +		vsp1_dl_list_add_chain(job->dl, second_dl);
> +
> +	scoped_guard(spinlock_irqsave, &vspx_pipe->jobs_lock) {
> +		list_add_tail(&job->job_queue, &vspx_pipe->jobs);
> +	}
> +
> +	return 0;
> +
> +error_put_dl:
> +	if (second_dl)
> +		vsp1_dl_list_put(second_dl);
> +	vsp1_dl_list_put(job->dl);
> +error_free_job:
> +	kfree(job);
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(vsp1_isp_job_prepare);
> +
> +/**
> + * vsp1_isp_job_run - Run a buffer transfer on behalf of the ISP
> + *
> + * @dev: The VSP1 struct device
> + */
> +void vsp1_isp_job_run(struct device *dev)
> +{
> +	struct vsp1_device *vsp1 = dev_get_drvdata(dev);
> +	struct vsp1_vspx_pipeline *vspx_pipe = &vsp1->vspx->pipe;
> +	struct vsp1_pipeline *pipe = &vspx_pipe->pipe;
> +	struct vsp1_vspx_job *job;
> +
> +	scoped_guard(spinlock_irqsave, &vspx_pipe->vspx_lock) {
> +
> +		if (vspx_pipe->processing)
> +			return;
> +
> +		/* Extract one job, if available, from the jobs list. */
> +		scoped_guard(spinlock_irqsave, &vspx_pipe->jobs_lock) {
> +			job = list_first_entry_or_null(&vspx_pipe->jobs,
> +						       struct vsp1_vspx_job,
> +						       job_queue);
> +			if (!job)
> +				return;
> +
> +			list_del(&job->job_queue);
> +		}
> +
> +		vspx_pipe->processing = true;
> +		vsp1_dl_list_commit(job->dl, 0);
> +		kfree(job);
> +	}
> +
> +	/* Trigger VSPX processing by setting VI6_CMD[STRCMD]. */
> +	scoped_guard(spinlock_irqsave, &pipe->irqlock) {
> +		vsp1_pipeline_run(pipe);
> +	}
> +}
> +EXPORT_SYMBOL_GPL(vsp1_isp_job_run);
> +
> +/* -----------------------------------------------------------------------------
> + * Initialization and cleanup
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
> +	vspx_pipe->enabled = false;
> +
> +	pipe = &vspx_pipe->pipe;
> +
> +	vsp1_pipeline_init(pipe);
> +
> +	pipe->partitions = 1;
> +	pipe->part_table = &vspx_pipe->partition;
> +	pipe->interlaced = false;
> +	pipe->frame_end = vsp1_vspx_pipeline_frame_end;
> +
> +	INIT_LIST_HEAD(&vspx_pipe->jobs);
> +	spin_lock_init(&vspx_pipe->vspx_lock);
> +	spin_lock_init(&vspx_pipe->jobs_lock);
> +
> +	/*
> +	 * Initialize RPF0 as inputs for VSPX and use it unconditionally for
> +	 * now.
> +	 */
> +	pipe->inputs[0] = vsp1->rpf[0];
> +	pipe->inputs[0]->entity.pipe = pipe;
> +	pipe->inputs[0]->entity.sink = &vsp1->iif->entity;
> +	vsp1_vspx_rwpf_set_subdev_fmt(vsp1, pipe->inputs[0],
> +				      vspx_default_fmt.pixelformat,
> +				      vspx_default_fmt.width,
> +				      vspx_default_fmt.height);
> +	list_add(&pipe->inputs[0]->entity.list_pipe, &pipe->entities);
> +
> +	pipe->iif = &vsp1->iif->entity;
> +	pipe->iif->pipe = pipe;
> +	pipe->iif->sink = &vsp1->wpf[0]->entity;
> +	list_add(&pipe->iif->list_pipe, &pipe->entities);
> +
> +	pipe->output = vsp1->wpf[0];
> +	pipe->output->entity.pipe = pipe;
> +	vsp1_vspx_rwpf_set_subdev_fmt(vsp1, pipe->output,
> +				      vspx_default_fmt.pixelformat,
> +				      vspx_default_fmt.width,
> +				      vspx_default_fmt.height);
> +	list_add(&pipe->output->entity.list_pipe, &pipe->entities);
> +
> +	return 0;
> +}
> +
> +void vsp1_vspx_cleanup(struct vsp1_device *vsp1)
> +{
> +	struct vsp1_vspx_pipeline *vspx_pipe;
> +
> +	vspx_pipe = &vsp1->vspx->pipe;
> +
> +	vsp1_vspx_release_jobs(vsp1);
> +}
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_vspx.h b/drivers/media/platform/renesas/vsp1/vsp1_vspx.h
> new file mode 100644
> index 000000000000..2f68f043075e
> --- /dev/null
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_vspx.h
> @@ -0,0 +1,86 @@
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
> +#include <linux/list.h>
> +#include <linux/spinlock.h>
> +
> +#include <media/vsp1.h>
> +
> +#include "vsp1.h"
> +#include "vsp1_pipe.h"
> +
> +/* Pixel format for ConfigDMA buffers. */
> +#define V4L2_META_FMT_RCAR_V4H	v4l2_fourcc('R', 'C', 'A', '4')
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
> +	spinlock_t vspx_lock;
> +	bool processing;
> +	bool enabled;
> +
> +	/* Protects the jobs list */
> +	spinlock_t jobs_lock;
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
> + * struct vsp1_vspx_job - VSPX transfer job
> + * @dl: Display list populated by vsp1_isp_job_prepare
> + * @job_queue: List handle
> + */
> +struct vsp1_vspx_job {
> +	struct vsp1_dl_list *dl;
> +	struct list_head job_queue;
> +};
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
> +
> +int vsp1_vspx_init(struct vsp1_device *vsp1);
> +void vsp1_vspx_cleanup(struct vsp1_device *vsp1);
> +
> +#endif /* __VSP1_VSPX_H__ */
> diff --git a/include/media/vsp1.h b/include/media/vsp1.h
> index 48f4a5023d81..68e4d9891dff 100644
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
> @@ -117,4 +122,72 @@ void vsp1_du_atomic_flush(struct device *dev, unsigned int pipe_index,
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
> + */
> +struct vsp1_isp_job_desc {
> +	struct {
> +		unsigned int pairs;
> +		dma_addr_t mem;
> +	} config;
> +	struct {
> +		struct v4l2_format fmt;

I wonder if we can't drop this member and use the format passed into 
vsp1_isp_configure()? I think if these two formats ever differed bad 
things would happen no?

> +		dma_addr_t mem;
> +	} img;
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
> +int vsp1_isp_init(struct device *dev);
> +struct device *vsp1_isp_get_bus_master(struct device *dev);
> +int vsp1_isp_alloc_buffers(struct device *dev, size_t size,
> +			   struct vsp1_isp_buffer_desc *buffer_desc);
> +int vsp1_isp_configure(struct device *dev,
> +		       const struct v4l2_pix_format_mplane *fmt);
> +int vsp1_isp_start_streaming(struct device *dev,
> +			     struct vsp1_vspx_frame_end *frame_end,
> +			     bool enable);
> +int vsp1_isp_job_prepare(struct device *dev,
> +			 const struct vsp1_isp_job_desc *desc);
> +void vsp1_isp_job_run(struct device *dev);
> +
>  #endif /* __MEDIA_VSP1_H__ */
> 
> -- 
> 2.48.1
> 

-- 
Kind Regards,
Niklas Söderlund

