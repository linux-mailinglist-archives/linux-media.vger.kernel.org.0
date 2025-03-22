Return-Path: <linux-media+bounces-28594-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 495D3A6CA14
	for <lists+linux-media@lfdr.de>; Sat, 22 Mar 2025 13:14:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BFED1484601
	for <lists+linux-media@lfdr.de>; Sat, 22 Mar 2025 12:14:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E614E21B9D5;
	Sat, 22 Mar 2025 12:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="SZSr/8ei";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Pr2DMtKD"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-b3-smtp.messagingengine.com (fout-b3-smtp.messagingengine.com [202.12.124.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D39C1519BA;
	Sat, 22 Mar 2025 12:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742645661; cv=none; b=jNdtDDeWIYI63ZRLi19LhFh3juKuUvqHup58tnTmRXKYusd5TWB27AMEu1UdNd12OjjhJgkU2iTuguRTEvaOLQzXBEkwMaN3H7LyN47h8I4poE2s3JxrL2ol8fF8SDu2NV/85uoKe4M0PtfafP0ntfnObJJW44BhjXH2WNUOADY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742645661; c=relaxed/simple;
	bh=H9ih0kYdRsdKNVUhGPB2BamdqKGlwg6ReNg1LjyCVm8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ErvLp/FcgxERi2IiueTTDAjd4MgfgqAB4JeZQOVvLVqFsb2ohF85pVv1WGRHmMCQYF3NtWJAC08y4WMGNzIG0Y/oMvz4UCYqmllYZoVuo8cg+N4YAoe1qVpPpB30+lWwbnJM97jK7fVAtdoT3/efy00qLR+ymDKEE6hNSnTLfs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=SZSr/8ei; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Pr2DMtKD; arc=none smtp.client-ip=202.12.124.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id 037BD114017C;
	Sat, 22 Mar 2025 08:14:14 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Sat, 22 Mar 2025 08:14:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1742645654;
	 x=1742732054; bh=5xj59TRmf3RdGcUWakJmCFxw3FpSI1kP0IWL27cQCqE=; b=
	SZSr/8eiIaBTIMX76gA0AMQWu7dcUVZYbvvOr+asF5DOCzDadLkiijpTvMRTD9YG
	lIVuem6LyDNKBuohlppR6vs9VZgmgdeX/VrDiZOyw+FuqRIHXkITCfrsV2WDWNLc
	jDRCrMrIdyqk6uAhRnGSroPLrEUxeKL38+pgn4YerVhECiSwX85c32VPcjLTzAro
	pSL8Y07coCKrzkrVv7A669zVfKrcIUSArXM7iV6/VKzNI9MJbSMPd4Low8zZCGL6
	Wmu19DE/tROH/orBq4BE1sr2V/UtyLC17KUZi00JALS/+BBLO51kXety+35fcKeJ
	X7AqhG/qNF7Nq4kTOjsIgA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1742645654; x=
	1742732054; bh=5xj59TRmf3RdGcUWakJmCFxw3FpSI1kP0IWL27cQCqE=; b=P
	r2DMtKDkaPTCFMk6q0W8BERyS1RciqOczU4ZzPO17+ovdzWNSIobSBL6xRLI35pe
	vg4Q9oErHAYQiFXA+Qm/F1L3TmVu0RXoRrqYzPP2z1TGpEXUtqyO7ZIaliC2aD6W
	guDDKmzbo/ntoxYY4gBzTgaihvkpeGU+ge9WJzQdTHRDpe0V9NmNHA5Kzx500fo1
	27ns0CWa2KOeUUg55WqcuZ8un+ryAtvt+e/MXk7yFAqtR81gxVQttYn+HUDJTejE
	LtiLxUxc+gqFT9Q8sYubnZ8ul1RXyNDyj5Us2cSuNHsEvZyMb2bDCZIzWoRyS3zx
	HOrWh7/twXcwElxNAPJkQ==
X-ME-Sender: <xms:lqneZ31VMVgpZ3-aEgvxjEmzmW_mprDFGJQaEZKc65BmLHkCbbd_bA>
    <xme:lqneZ2HQAV2WEJUUB7Fuz1vuxd5QEKBLUCk2c34uIq0NtX7hwk3xcmh-stbYvi_aP
    HYfQ9jvJckEb3SHV7Y>
X-ME-Received: <xmr:lqneZ343yWlkJ1Pwfb_zmWlGmXU9LL-8TIVyu8jct7o393OoOnflJOiZC8ZzliG4RqDFAvfEZ-tofIocId8woVSijyCICIf7PQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduheefleegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddt
    tdejnecuhfhrohhmpefpihhklhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrsh
    houggvrhhluhhnugesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeff
    tdegfeevfefguedtveevlefgleekuedvfeeggfefheefieejhedulefhjeekgfenucffoh
    hmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghr
    rghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhsohguvghrlhhunhgusehrrghgnhgrth
    gvtghhrdhsvgdpnhgspghrtghpthhtohepjedpmhhouggvpehsmhhtphhouhhtpdhrtghp
    thhtohepjhgrtghophhordhmohhnughiodhrvghnvghsrghssehiuggvrghsohhnsghorg
    hrugdrtghomhdprhgtphhtthhopehlrghurhgvnhhtrdhpihhntghhrghrthesihguvggr
    shhonhgsohgrrhgurdgtohhmpdhrtghpthhtohepkhhivghrrghnrdgsihhnghhhrghmod
    hrvghnvghsrghssehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehmtghh
    vghhrggssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlh
    esvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhmvgguihgr
    sehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrhgvnhgvsh
    grshdqshhotgesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:lqneZ81Ak4PxeK9AFK6r8D66Wgo3xs8YLW8f0Hz3b4AucgVdH6ZteQ>
    <xmx:lqneZ6GJKhGQZEYoYEIa_BD8hSE5B4BvqFWrTCWSYsK9oBgYTYOIsg>
    <xmx:lqneZ9_bFYZuRKqGOM6G0ZsBkl5Hhlsg_6kEzDpS-3o-AN5fXSF2Ig>
    <xmx:lqneZ3mJCkFGOFMxFPWHS1FQM0up-S3dhgI1GbPCwDFM1j6wFYx4bw>
    <xmx:lqneZ900dF94ryZgbSXjdsxWN2sLLfiLE_r7kBOkpmtK9r3-0JHc7eMI>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 22 Mar 2025 08:14:13 -0400 (EDT)
Date: Sat, 22 Mar 2025 13:14:11 +0100
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3] media: vsp1: Add VSPX support
Message-ID: <20250322121411.GA2537282@ragnatech.se>
References: <20250321-v4h-vspx-v3-1-be4796d28387@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250321-v4h-vspx-v3-1-be4796d28387@ideasonboard.com>

Hi Jacopo,

Thanks for your work.

On 2025-03-21 16:46:40 +0100, Jacopo Mondi wrote:
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
> Add a driver for Rensas VSP2 VSPX function.
> The VSPX transfer image and config data to the ISP.
> ---
> Changes in v3:
> - Small fixup in stride calculation
> - Link to v2: https://lore.kernel.org/r/20250319-v4h-vspx-v2-1-33b0e659a5f8@ideasonboard.com
> 
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
> index 000000000000..74e21fdfa14f
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
> +				    struct vsp1_dl_list *dl,
> +				    struct vsp1_dl_body *dlb)
> +{
> +	const struct vsp1_format_info *fmtinfo;
> +	struct vsp1_vspx_pipeline *vspx_pipe;
> +	struct vsp1_pipeline *pipe;
> +	struct vsp1_rwpf *rpf0;
> +	int ret;
> +
> +	vspx_pipe = &vsp1->vspx->pipe;
> +	pipe = &vspx_pipe->pipe;
> +	rpf0 = pipe->inputs[0];
> +
> +	ret = vsp1_vspx_rwpf_set_subdev_fmt(vsp1, rpf0, fourcc, width, height);
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * The RPF0 sink pad is used to configure the entity routing table
> +	 * and compute stride.
> +	 */
> +	rpf0->entity.sink_pad = rpf_sink_pad;
> +
> +	if (rpf_sink_pad == VSPX_RPF_SINK_PAD_CONFIG) {
> +		/* ConfigDMA is a 1-D buffer with 4 bytes entries. */
> +		rpf0->format.plane_fmt[0].bytesperline = 4;
> +	} else {
> +		/* fmtinfo is valid as per vsp1_vspx_rwpf_set_subdev_fmt(). */
> +		fmtinfo = vsp1_get_format_info(vsp1, fourcc);
> +		rpf0->format.plane_fmt[0].bytesperline = width *
> +					       ((7 + fmtinfo->bpp[0]) / 8);
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
> +static void vsp1_vspx_pipeline_frame_end(struct vsp1_pipeline *pipe,
> +					 unsigned int completion)
> +{
> +	struct vsp1_vspx_pipeline *vspx_pipe = to_vsp1_vspx_pipeline(pipe);
> +	struct vsp1_vspx *vspx = to_vsp1_vspx(vspx_pipe);
> +	struct vsp1_device *vsp1 = vspx->vsp1;
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
> +
> +	/* Try schedule a new job from the queue. */
> +	vsp1_vspx_job_schedule(vsp1);
> +}
> +
> +/*******************************************************************************
> + * vsp1_isp interface (include/media/vsp1.h)
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

This function can be called from interrupt context...

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

...so this lock can't be a mutex,

I also get a invalid wait context for this lock which I suspect is due 
to the locks in the rcar-isp are spinlocks (as they too might be used in 
interrupt context).

[   50.805351] =============================
[   50.806022] [ BUG: Invalid wait context ]
[   50.806696] 6.14.0-rc7-arm64-renesas-07618-gf054efcd7a77-dirty #30 Tainted: G        W
[   50.808139] -----------------------------
[   50.808822] yavta/259 is trying to lock:
[   50.809495] ffff000444001388 (&vspx_pipe->vspx_lock){+.+.}-{4:4}, at: vsp1_isp_start_streaming+0x38/0x138
[   50.811090] other info that might help us debug this:
[   50.811916] context-{5:5}
[   50.812436] 2 locks held by yavta/259:
[   50.813101]  #0: ffff0004436a6420 (&io->lock){+.+.}-{4:4}, at: __video_do_ioctl+0xec/0x4a0
[   50.814553]  #1: ffff0004436a6e68 (&core->lock){....}-{3:3}, at: risp_core_start_streaming+0x48/0x3a8
[   50.816126] stack backtrace:
[   50.816687] CPU: 1 UID: 0 PID: 259 Comm: yavta Tainted: G        W          6.14.0-rc7-arm64-renesas-07618-gf054efcd7a77-dirty #30
[   50.816694] Tainted: [W]=WARN
[   50.816696] Hardware name: Renesas White Hawk Single board based on r8a779g2 (DT)
[   50.816699] Call trace:
[   50.816701]  show_stack+0x14/0x20 (C)
[   50.816712]  dump_stack_lvl+0x6c/0x90
[   50.816719]  dump_stack+0x14/0x1c
[   50.816723]  __lock_acquire+0xdfc/0x1584
[   50.816731]  lock_acquire+0x1c4/0x33c
[   50.816735]  __mutex_lock+0xa4/0x4b4
[   50.816742]  mutex_lock_nested+0x20/0x28
[   50.816746]  vsp1_isp_start_streaming+0x38/0x138
[   50.816748]  risp_core_start_streaming+0x31c/0x3a8
[   50.816752]  risp_io_start_streaming+0x5c/0x108
[   50.816757]  vb2_start_streaming+0x64/0x168
[   50.816760]  vb2_core_streamon+0xd0/0x1b4
[   50.816763]  vb2_ioctl_streamon+0x50/0x94
[   50.816766]  v4l_streamon+0x20/0x28
[   50.816770]  __video_do_ioctl+0x40c/0x4a0
[   50.816774]  video_usercopy+0x2ec/0x870
[   50.816778]  video_ioctl2+0x14/0x30
[   50.816782]  v4l2_ioctl+0x3c/0x60
[   50.816786]  __arm64_sys_ioctl+0x94/0xc8
[   50.816795]  invoke_syscall+0x44/0x100
[   50.816800]  el0_svc_common.constprop.0+0x3c/0xe0
[   50.816804]  do_el0_svc+0x18/0x20
[   50.816807]  el0_svc+0x3c/0xec
[   50.816812]  el0t_64_sync_handler+0x104/0x138
[   50.816817]  el0t_64_sync+0x154/0x158

> +		list_add_tail(&newjob->job_queue, &vspx_pipe->jobs);
> +
> +	vsp1_vspx_job_schedule(vsp1);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(vsp1_isp_queue_job);
> +
> +/*******************************************************************************
> + * vsp1_vspx interface (drivers/media/platform/renesas/vsp1/vsp1_vspx.h)
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
> +
> +	mutex_destroy(&vspx_pipe->jobs_lock);
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
> +#include <linux/list.h>
> +#include <linux/mutex.h>
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
> prerequisite-change-id: 20250123-v4h-iif-a1dda640c95d:v6
> prerequisite-patch-id: 700c4bf62e4d8fbd61bf2d7f0289ad6a62ff37d1
> prerequisite-patch-id: 4af28f0fe9d553b6834c9340969dc9b1c69ceeb9
> prerequisite-patch-id: ce124996dcd23a437d4d6e1d8e8511a2381ef7b2
> prerequisite-patch-id: 1aef52a94a4b67ac092e1d182110cfaad573fec2
> prerequisite-patch-id: 51b2930186407e748f27042bdc314d3ecadd5b2c
> prerequisite-patch-id: c7eb50ff53b84bedd92139048901c8f412519822
> prerequisite-patch-id: 91ae1a6a845e756ca98e35e1902fd223f1c5ec3d
> 
> Best regards,
> -- 
> Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> 

-- 
Kind Regards,
Niklas Söderlund

