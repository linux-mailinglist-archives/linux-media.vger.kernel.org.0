Return-Path: <linux-media+bounces-28588-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15E8AA6C0E8
	for <lists+linux-media@lfdr.de>; Fri, 21 Mar 2025 18:10:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9DAED3B685F
	for <lists+linux-media@lfdr.de>; Fri, 21 Mar 2025 17:09:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63A9E22D7A8;
	Fri, 21 Mar 2025 17:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="IMooDBDL"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88C921D6DC8;
	Fri, 21 Mar 2025 17:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742576950; cv=none; b=Rg+Jk7+RrAx04phT+8Mt1K2z8O+2bAZshosnz2kh9A0muQS3U6yvG0/UHqkBqOyx2s2IUPb3sx/vr6ZhqtcMvtV1hbxzFvY7umEUWcRptGxsMPbZNR2jqIc7dg77MEb9P5+bHNNdxnMrZ9Y9VHElHPxZVHuJs0sEu+f0AfuoYs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742576950; c=relaxed/simple;
	bh=N7sp3P6xNKaf7f8wQZP5ReSpHb2zIev9y664ZZl3RA4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C9QfpfXceaTXsch/Nn5dUWVvm617Hsyq1KQE/iSwV/0frkZRa3rBYWyZIBJCfSLmMtMThH3gve0d5L0f9098vHAuYRr9BVO5jWr0xy7kMYlElInbD1c+ySyT+Tevyp/I9Sb84h5eLZTp9oCLj7ruWJjyZk6lQElX6UUBl0YIaBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=IMooDBDL; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (unknown [157.231.223.213])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8A2D12C5;
	Fri, 21 Mar 2025 18:07:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1742576836;
	bh=N7sp3P6xNKaf7f8wQZP5ReSpHb2zIev9y664ZZl3RA4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IMooDBDLHcUNSlNbrralMeadIgNZRC83OxIuQUmNP63MQfYhDwD7XrjrO3GFfNOgZ
	 2sNHm4aCzfY1AhclH11awALKQyH7orgCM8tF6+txrv3P9K0tLU0VlrpVFyEB0duEY7
	 vTxSG4mg+OAuzDbMrO6yd343G0740nQM0g4M95U4=
Date: Fri, 21 Mar 2025 19:08:38 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: Re: [PATCH v6 5/7] media: vsp1: rwpf: Initialize image formats
Message-ID: <20250321170838.GA11255@pendragon.ideasonboard.com>
References: <20250321-v4h-iif-v6-0-361e9043026a@ideasonboard.com>
 <20250321-v4h-iif-v6-5-361e9043026a@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250321-v4h-iif-v6-5-361e9043026a@ideasonboard.com>

Hi Jacopo,

Thank you for the patch.

On Fri, Mar 21, 2025 at 04:45:37PM +0100, Jacopo Mondi wrote:
> With the forthcoming support for VSPX the r/wpf unit will be used
> to perform memory access on the behalf of the ISP units.
> 
> Prepare to support reading from external memory images in RAW Bayer
> format and ISP configuration parameters by expanding the list
> of supported media bus codes.
> 
> Store the list of valid mbus code in the rwpf device and initialize it
> in the new vsp1_rwpf_init_formats() function, called by RPFs and WFPs at
> entity creation time.
> 
> Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> Tested-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> 
> ---
> v4->v5:
>   - Drop double empty line
> v2->v3:
>   - Introduce vsp1_rwpf_init_formats()
>   - Store the list of mbus codes at init time instead of computing it
> ---
>  drivers/media/platform/renesas/vsp1/vsp1_rpf.c  |  7 +++
>  drivers/media/platform/renesas/vsp1/vsp1_rwpf.c | 78 +++++++++++++++++++++++--
>  drivers/media/platform/renesas/vsp1/vsp1_rwpf.h |  4 ++
>  drivers/media/platform/renesas/vsp1/vsp1_wpf.c  |  7 +++
>  4 files changed, 90 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_rpf.c b/drivers/media/platform/renesas/vsp1/vsp1_rpf.c
> index 5c8b3ba1bd3c..056491286577 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_rpf.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_rpf.c
> @@ -400,6 +400,13 @@ struct vsp1_rwpf *vsp1_rpf_create(struct vsp1_device *vsp1, unsigned int index)
>  	rpf->entity.type = VSP1_ENTITY_RPF;
>  	rpf->entity.index = index;
>  
> +	ret = vsp1_rwpf_init_formats(vsp1, rpf);
> +	if (ret < 0) {
> +		dev_err(vsp1->dev, "rpf%u: failed to initialize formats\n",
> +			index);
> +		return ERR_PTR(ret);
> +	}
> +
>  	sprintf(name, "rpf.%u", index);
>  	ret = vsp1_entity_init(vsp1, &rpf->entity, name, 2, &vsp1_rwpf_subdev_ops,
>  			       MEDIA_ENT_F_PROC_VIDEO_PIXEL_FORMATTER);
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c b/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c
> index 93b0ed5fd0da..91d70886e64d 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c
> @@ -16,12 +16,47 @@
>  #define RWPF_MIN_WIDTH				1
>  #define RWPF_MIN_HEIGHT				1
>  
> +struct vsp1_rwpf_codes {
> +	const u32 *codes;
> +	unsigned int num_codes;
> +};
> +
>  static const u32 rwpf_mbus_codes[] = {
>  	MEDIA_BUS_FMT_ARGB8888_1X32,
>  	MEDIA_BUS_FMT_AHSV8888_1X32,
>  	MEDIA_BUS_FMT_AYUV8_1X32,
>  };
>  
> +static const struct vsp1_rwpf_codes rwpf_codes = {
> +	.codes = rwpf_mbus_codes,
> +	.num_codes = ARRAY_SIZE(rwpf_mbus_codes),
> +};
> +
> +static const u32 vspx_rpf0_mbus_codes[] = {
> +	MEDIA_BUS_FMT_Y8_1X8,
> +	MEDIA_BUS_FMT_Y10_1X10,
> +	MEDIA_BUS_FMT_Y12_1X12,
> +	MEDIA_BUS_FMT_Y16_1X16,
> +	MEDIA_BUS_FMT_METADATA_FIXED
> +};
> +
> +static const struct vsp1_rwpf_codes vspx_rpf0_codes = {
> +	.codes = vspx_rpf0_mbus_codes,
> +	.num_codes = ARRAY_SIZE(vspx_rpf0_mbus_codes),
> +};
> +
> +static const u32 vspx_rpf1_mbus_codes[] = {
> +	MEDIA_BUS_FMT_Y8_1X8,
> +	MEDIA_BUS_FMT_Y10_1X10,
> +	MEDIA_BUS_FMT_Y12_1X12,
> +	MEDIA_BUS_FMT_Y16_1X16,
> +};
> +
> +static const struct vsp1_rwpf_codes vspx_rpf1_codes = {
> +	.codes = vspx_rpf1_mbus_codes,
> +	.num_codes = ARRAY_SIZE(vspx_rpf1_mbus_codes),
> +};
> +
>  /* -----------------------------------------------------------------------------
>   * V4L2 Subdevice Operations
>   */
> @@ -30,10 +65,12 @@ static int vsp1_rwpf_enum_mbus_code(struct v4l2_subdev *subdev,
>  				    struct v4l2_subdev_state *sd_state,
>  				    struct v4l2_subdev_mbus_code_enum *code)
>  {
> -	if (code->index >= ARRAY_SIZE(rwpf_mbus_codes))
> +	struct vsp1_rwpf *rwpf = to_rwpf(subdev);
> +
> +	if (code->index >= rwpf->mbus_codes->num_codes)
>  		return -EINVAL;
>  
> -	code->code = rwpf_mbus_codes[code->index];
> +	code->code = rwpf->mbus_codes->codes[code->index];
>  
>  	return 0;
>  }
> @@ -69,12 +106,12 @@ static int vsp1_rwpf_set_format(struct v4l2_subdev *subdev,
>  	}
>  
>  	/* Default to YUV if the requested format is not supported. */
> -	for (i = 0; i < ARRAY_SIZE(rwpf_mbus_codes); ++i) {
> -		if (fmt->format.code == rwpf_mbus_codes[i])
> +	for (i = 0; i < rwpf->mbus_codes->num_codes; ++i) {
> +		if (fmt->format.code == rwpf->mbus_codes->codes[i])
>  			break;
>  	}
> -	if (i == ARRAY_SIZE(rwpf_mbus_codes))
> -		fmt->format.code = MEDIA_BUS_FMT_AYUV8_1X32;
> +	if (i == rwpf->mbus_codes->num_codes)
> +		fmt->format.code = rwpf->mbus_codes->codes[0];
>  
>  	format = v4l2_subdev_state_get_format(state, fmt->pad);
>  
> @@ -267,8 +304,37 @@ static const struct v4l2_ctrl_ops vsp1_rwpf_ctrl_ops = {
>  	.s_ctrl = vsp1_rwpf_s_ctrl,
>  };
>  
> +int vsp1_rwpf_init_formats(struct vsp1_device *vsp1, struct vsp1_rwpf *rwpf)
> +{
> +	/* Only VSPX and RPF support reading Bayer data. */
> +	if (!vsp1_feature(vsp1, VSP1_HAS_IIF) ||
> +	    rwpf->entity.type != VSP1_ENTITY_RPF) {
> +		rwpf->mbus_codes = &rwpf_codes;
> +		return 0;
> +	}
> +
> +	/*
> +	 * VSPX only features RPF0 and RPF1. RPF0 supports reading ISP ConfigDMA
> +	 * and Bayer data, RPF1 supports reading Bayer data only.
> +	 */
> +	switch (rwpf->entity.index) {
> +	case 0:
> +		rwpf->mbus_codes = &vspx_rpf0_codes;
> +		break;
> +	case 1:
> +		rwpf->mbus_codes = &vspx_rpf1_codes;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
>  int vsp1_rwpf_init_ctrls(struct vsp1_rwpf *rwpf, unsigned int ncontrols)
>  {
> +	/* Initialize controls. */
> +
>  	v4l2_ctrl_handler_init(&rwpf->ctrls, ncontrols + 1);
>  	v4l2_ctrl_new_std(&rwpf->ctrls, &vsp1_rwpf_ctrl_ops,
>  			  V4L2_CID_ALPHA_COMPONENT, 0, 255, 1, 255);
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_rwpf.h b/drivers/media/platform/renesas/vsp1/vsp1_rwpf.h
> index 5ac9f0a6fafc..64feb4742494 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_rwpf.h
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_rwpf.h
> @@ -30,6 +30,7 @@ struct vsp1_rwpf_memory {
>  	dma_addr_t addr[3];
>  };
>  
> +struct vsp1_rwpf_codes;

I'll add a blank line here.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  struct vsp1_rwpf {
>  	struct vsp1_entity entity;
>  	struct v4l2_ctrl_handler ctrls;
> @@ -39,6 +40,8 @@ struct vsp1_rwpf {
>  	unsigned int max_width;
>  	unsigned int max_height;
>  
> +	const struct vsp1_rwpf_codes *mbus_codes;
> +
>  	struct v4l2_pix_format_mplane format;
>  	const struct vsp1_format_info *fmtinfo;
>  	unsigned int brx_input;
> @@ -81,6 +84,7 @@ struct vsp1_rwpf *vsp1_wpf_create(struct vsp1_device *vsp1, unsigned int index);
>  
>  void vsp1_wpf_stop(struct vsp1_rwpf *wpf);
>  
> +int vsp1_rwpf_init_formats(struct vsp1_device *vsp1, struct vsp1_rwpf *rwpf);
>  int vsp1_rwpf_init_ctrls(struct vsp1_rwpf *rwpf, unsigned int ncontrols);
>  
>  extern const struct v4l2_subdev_ops vsp1_rwpf_subdev_ops;
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_wpf.c b/drivers/media/platform/renesas/vsp1/vsp1_wpf.c
> index da651a882bbb..a32e4b3527db 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_wpf.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_wpf.c
> @@ -548,6 +548,13 @@ struct vsp1_rwpf *vsp1_wpf_create(struct vsp1_device *vsp1, unsigned int index)
>  	wpf->entity.type = VSP1_ENTITY_WPF;
>  	wpf->entity.index = index;
>  
> +	ret = vsp1_rwpf_init_formats(vsp1, wpf);
> +	if (ret < 0) {
> +		dev_err(vsp1->dev, "wpf%u: failed to initialize formats\n",
> +			index);
> +		return ERR_PTR(ret);
> +	}
> +
>  	sprintf(name, "wpf.%u", index);
>  	ret = vsp1_entity_init(vsp1, &wpf->entity, name, 2, &vsp1_rwpf_subdev_ops,
>  			       MEDIA_ENT_F_PROC_VIDEO_PIXEL_FORMATTER);

-- 
Regards,

Laurent Pinchart

