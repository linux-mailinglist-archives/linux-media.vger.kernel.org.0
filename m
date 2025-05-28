Return-Path: <linux-media+bounces-33529-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CADA7AC6C0D
	for <lists+linux-media@lfdr.de>; Wed, 28 May 2025 16:44:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 615089E0F52
	for <lists+linux-media@lfdr.de>; Wed, 28 May 2025 14:44:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E081E288CBA;
	Wed, 28 May 2025 14:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="bM8dFwGq"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAE1727877B;
	Wed, 28 May 2025 14:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748443416; cv=none; b=RsYQ1h0mprgwq8JZdIaf2rfJ8aDnxDsa+K0kOfaqgCXVTZMiqG6NEd+hEdmpI/REz+VRwSkePoqEQnUOSi5C4nghRST27galVUzlTkIvzO4uhM7nzIFVmByxjRF5G3S532K4zs+ANTGChtLtIsTjYfC4Suf+WMg67RZcG1MtiSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748443416; c=relaxed/simple;
	bh=9+y0DnRDMF+S3QvwTSQ2rsmQZKxQOXn60XDDXT99Rok=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HFTXbfuYWbSxoehfBgWEPMwvFDknq25a8efsm6YoIzJ4eaYyRWNU95kyuEO9QGnG+1xeXQU7tcnj+PuQ0VpzeLnK1A5sZvNcOv+yUgI/L4jrKYmwdwNTd73w35TwP8mrL4eY/HLrf4XgH1eDLj7N76UjC0W8x4Too4PLd2jFqkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=bM8dFwGq; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (mob-5-90-143-118.net.vodafone.it [5.90.143.118])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A0B98FE;
	Wed, 28 May 2025 16:43:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1748443385;
	bh=9+y0DnRDMF+S3QvwTSQ2rsmQZKxQOXn60XDDXT99Rok=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bM8dFwGqwADqXlQ0CMiKnVpPV/VDqI6K2uz3er7vWx2i+IQeFyGOPSOtewdOc/cKY
	 GRbxAY9YoYeHWGr2lwGuwyG4okyw5oEGOurOAi80FyzBG/XfsgJjcORwgvRFNPVsdP
	 r/QAP8DFvLo9Ml4u+YX6epAGRhOLZshND07PGVkY=
Date: Wed, 28 May 2025 16:43:28 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH 2/7] media: renesas: vsp1: Store size limits in
 vsp1_entity
Message-ID: <fzug4mjmnstedc4wmx3krelhxoudfauu3xokc6kmr2qioznybj@3t6qjqyrwguj>
References: <20250429235322.29826-1-laurent.pinchart+renesas@ideasonboard.com>
 <20250429235322.29826-3-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250429235322.29826-3-laurent.pinchart+renesas@ideasonboard.com>

Hi Laurent

On Wed, Apr 30, 2025 at 02:53:17AM +0300, Laurent Pinchart wrote:
> Most entities use the vsp1_subdev_enum_frame_size() and
> vsp1_subdev_set_pad_format() helper functions to implement the
> corresponding subdev operations. Both helpers are given the minimum and
> maximum sizes supported by the entity as arguments, requiring each
> entity to implement a wrapper.
>
> Replace the function arguments with storing the size limits in the
> vsp1_entity structure. This allows dropping most of the
> .enum_frame_size() and .set_fmt() wrappers in entities.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  .../media/platform/renesas/vsp1/vsp1_brx.c    |  4 +++
>  .../media/platform/renesas/vsp1/vsp1_clu.c    | 32 ++++---------------
>  .../media/platform/renesas/vsp1/vsp1_entity.c | 31 ++++++------------
>  .../media/platform/renesas/vsp1/vsp1_entity.h | 12 +++----
>  .../media/platform/renesas/vsp1/vsp1_histo.c  | 12 +++----
>  .../media/platform/renesas/vsp1/vsp1_hsit.c   | 15 +++------
>  .../media/platform/renesas/vsp1/vsp1_lif.c    | 26 ++++-----------
>  .../media/platform/renesas/vsp1/vsp1_lut.c    | 32 ++++---------------
>  .../media/platform/renesas/vsp1/vsp1_rpf.c    |  5 ++-
>  .../media/platform/renesas/vsp1/vsp1_rwpf.c   | 19 +++--------
>  .../media/platform/renesas/vsp1/vsp1_rwpf.h   |  3 --
>  .../media/platform/renesas/vsp1/vsp1_sru.c    |  4 +++
>  .../media/platform/renesas/vsp1/vsp1_uds.c    |  4 +++
>  .../media/platform/renesas/vsp1/vsp1_uif.c    | 26 ++++-----------
>  .../media/platform/renesas/vsp1/vsp1_wpf.c    | 10 +++---
>  15 files changed, 76 insertions(+), 159 deletions(-)
>
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_brx.c b/drivers/media/platform/renesas/vsp1/vsp1_brx.c
> index 3890adc8073e..dd651cef93e4 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_brx.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_brx.c
> @@ -410,6 +410,10 @@ struct vsp1_brx *vsp1_brx_create(struct vsp1_device *vsp1,
>  	brx->entity.type = type;
>  	brx->entity.codes = brx_codes;
>  	brx->entity.num_codes = ARRAY_SIZE(brx_codes);
> +	brx->entity.min_width = BRX_MIN_SIZE;
> +	brx->entity.max_width = BRX_MAX_SIZE;
> +	brx->entity.min_height = BRX_MIN_SIZE;
> +	brx->entity.max_height = BRX_MAX_SIZE;
>
>  	if (type == VSP1_ENTITY_BRU) {
>  		num_pads = vsp1->info->num_bru_inputs + 1;
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_clu.c b/drivers/media/platform/renesas/vsp1/vsp1_clu.c
> index a16c9c941512..a56c038a2c71 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_clu.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_clu.c
> @@ -113,7 +113,7 @@ static const struct v4l2_ctrl_config clu_mode_control = {
>  };
>
>  /* -----------------------------------------------------------------------------
> - * V4L2 Subdevice Pad Operations
> + * V4L2 Subdevice Operations
>   */
>
>  static const unsigned int clu_codes[] = {
> @@ -122,33 +122,11 @@ static const unsigned int clu_codes[] = {
>  	MEDIA_BUS_FMT_AYUV8_1X32,
>  };
>
> -static int clu_enum_frame_size(struct v4l2_subdev *subdev,
> -			       struct v4l2_subdev_state *sd_state,
> -			       struct v4l2_subdev_frame_size_enum *fse)
> -{
> -	return vsp1_subdev_enum_frame_size(subdev, sd_state, fse,
> -					   CLU_MIN_SIZE, CLU_MIN_SIZE,
> -					   CLU_MAX_SIZE, CLU_MAX_SIZE);
> -}
> -
> -static int clu_set_format(struct v4l2_subdev *subdev,
> -			  struct v4l2_subdev_state *sd_state,
> -			  struct v4l2_subdev_format *fmt)
> -{
> -	return vsp1_subdev_set_pad_format(subdev, sd_state, fmt,
> -					  CLU_MIN_SIZE, CLU_MIN_SIZE,
> -					  CLU_MAX_SIZE, CLU_MAX_SIZE);
> -}
> -
> -/* -----------------------------------------------------------------------------
> - * V4L2 Subdevice Operations
> - */
> -
>  static const struct v4l2_subdev_pad_ops clu_pad_ops = {
>  	.enum_mbus_code = vsp1_subdev_enum_mbus_code,
> -	.enum_frame_size = clu_enum_frame_size,
> +	.enum_frame_size = vsp1_subdev_enum_frame_size,
>  	.get_fmt = vsp1_subdev_get_pad_format,
> -	.set_fmt = clu_set_format,
> +	.set_fmt = vsp1_subdev_set_pad_format,
>  };
>
>  static const struct v4l2_subdev_ops clu_ops = {
> @@ -239,6 +217,10 @@ struct vsp1_clu *vsp1_clu_create(struct vsp1_device *vsp1)
>  	clu->entity.type = VSP1_ENTITY_CLU;
>  	clu->entity.codes = clu_codes;
>  	clu->entity.num_codes = ARRAY_SIZE(clu_codes);
> +	clu->entity.min_width = CLU_MIN_SIZE;
> +	clu->entity.min_height = CLU_MIN_SIZE;
> +	clu->entity.max_width = CLU_MAX_SIZE;
> +	clu->entity.max_height = CLU_MAX_SIZE;
>
>  	ret = vsp1_entity_init(vsp1, &clu->entity, "clu", 2, &clu_ops,
>  			       MEDIA_ENT_F_PROC_VIDEO_LUT);
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_entity.c b/drivers/media/platform/renesas/vsp1/vsp1_entity.c
> index e658a6ee5793..0d4fe0028b13 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_entity.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_entity.c
> @@ -222,10 +222,6 @@ int vsp1_subdev_enum_mbus_code(struct v4l2_subdev *subdev,
>   * @subdev: V4L2 subdevice
>   * @sd_state: V4L2 subdev state
>   * @fse: Frame size enumeration
> - * @min_width: Minimum image width
> - * @min_height: Minimum image height
> - * @max_width: Maximum image width
> - * @max_height: Maximum image height
>   *
>   * This function implements the subdev enum_frame_size pad operation for
>   * entities that do not support scaling or cropping. It reports the given
> @@ -234,9 +230,7 @@ int vsp1_subdev_enum_mbus_code(struct v4l2_subdev *subdev,
>   */
>  int vsp1_subdev_enum_frame_size(struct v4l2_subdev *subdev,
>  				struct v4l2_subdev_state *sd_state,
> -				struct v4l2_subdev_frame_size_enum *fse,
> -				unsigned int min_width, unsigned int min_height,
> -				unsigned int max_width, unsigned int max_height)
> +				struct v4l2_subdev_frame_size_enum *fse)
>  {
>  	struct vsp1_entity *entity = to_vsp1_entity(subdev);
>  	struct v4l2_subdev_state *state;
> @@ -257,10 +251,10 @@ int vsp1_subdev_enum_frame_size(struct v4l2_subdev *subdev,
>  	}
>
>  	if (fse->pad == 0) {
> -		fse->min_width = min_width;
> -		fse->max_width = max_width;
> -		fse->min_height = min_height;
> -		fse->max_height = max_height;
> +		fse->min_width = entity->min_width;
> +		fse->max_width = entity->max_width;
> +		fse->min_height = entity->min_height;
> +		fse->max_height = entity->max_height;
>  	} else {
>  		/*
>  		 * The size on the source pad are fixed and always identical to
> @@ -282,22 +276,15 @@ int vsp1_subdev_enum_frame_size(struct v4l2_subdev *subdev,
>   * @subdev: V4L2 subdevice
>   * @sd_state: V4L2 subdev state
>   * @fmt: V4L2 subdev format
> - * @min_width: Minimum image width
> - * @min_height: Minimum image height
> - * @max_width: Maximum image width
> - * @max_height: Maximum image height
>   *
>   * This function implements the subdev set_fmt pad operation for entities that
>   * do not support scaling or cropping. It defaults to the first supported media
>   * bus code if the requested code isn't supported, clamps the size to the
> - * supplied minimum and maximum, and propagates the sink pad format to the
> - * source pad.
> + * entity's limits, and propagates the sink pad format to the source pad.
>   */
>  int vsp1_subdev_set_pad_format(struct v4l2_subdev *subdev,
>  			       struct v4l2_subdev_state *sd_state,
> -			       struct v4l2_subdev_format *fmt,
> -			       unsigned int min_width, unsigned int min_height,
> -			       unsigned int max_width, unsigned int max_height)
> +			       struct v4l2_subdev_format *fmt)
>  {
>  	struct vsp1_entity *entity = to_vsp1_entity(subdev);
>  	struct v4l2_subdev_state *state;
> @@ -334,9 +321,9 @@ int vsp1_subdev_set_pad_format(struct v4l2_subdev *subdev,
>  	format->code = i < entity->num_codes
>  		     ? entity->codes[i] : entity->codes[0];
>  	format->width = clamp_t(unsigned int, fmt->format.width,
> -				min_width, max_width);
> +				entity->min_width, entity->max_width);
>  	format->height = clamp_t(unsigned int, fmt->format.height,
> -				 min_height, max_height);
> +				 entity->min_height, entity->max_height);
>  	format->field = V4L2_FIELD_NONE;
>
>  	format->colorspace = fmt->format.colorspace;
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_entity.h b/drivers/media/platform/renesas/vsp1/vsp1_entity.h
> index 6b42fd5ad7e8..5542f6446b16 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_entity.h
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_entity.h
> @@ -114,6 +114,10 @@ struct vsp1_entity {
>
>  	const u32 *codes;
>  	unsigned int num_codes;
> +	unsigned int min_width;
> +	unsigned int min_height;
> +	unsigned int max_width;
> +	unsigned int max_height;
>
>  	struct vsp1_pipeline *pipe;
>
> @@ -182,16 +186,12 @@ int vsp1_subdev_get_pad_format(struct v4l2_subdev *subdev,
>  			       struct v4l2_subdev_format *fmt);
>  int vsp1_subdev_set_pad_format(struct v4l2_subdev *subdev,
>  			       struct v4l2_subdev_state *sd_state,
> -			       struct v4l2_subdev_format *fmt,
> -			       unsigned int min_width, unsigned int min_height,
> -			       unsigned int max_width, unsigned int max_height);
> +			       struct v4l2_subdev_format *fmt);
>  int vsp1_subdev_enum_mbus_code(struct v4l2_subdev *subdev,
>  			       struct v4l2_subdev_state *sd_state,
>  			       struct v4l2_subdev_mbus_code_enum *code);
>  int vsp1_subdev_enum_frame_size(struct v4l2_subdev *subdev,
>  				struct v4l2_subdev_state *sd_state,
> -				struct v4l2_subdev_frame_size_enum *fse,
> -				unsigned int min_w, unsigned int min_h,
> -				unsigned int max_w, unsigned int max_h);
> +				struct v4l2_subdev_frame_size_enum *fse);
>
>  #endif /* __VSP1_ENTITY_H__ */
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_histo.c b/drivers/media/platform/renesas/vsp1/vsp1_histo.c
> index 631751dbc6d3..a1b3671a0873 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_histo.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_histo.c
> @@ -182,9 +182,7 @@ static int histo_enum_frame_size(struct v4l2_subdev *subdev,
>  	if (fse->pad != HISTO_PAD_SINK)
>  		return -EINVAL;
>
> -	return vsp1_subdev_enum_frame_size(subdev, sd_state, fse,
> -					   HISTO_MIN_SIZE, HISTO_MIN_SIZE,
> -					   HISTO_MAX_SIZE, HISTO_MAX_SIZE);
> +	return vsp1_subdev_enum_frame_size(subdev, sd_state, fse);
>  }
>
>  static int histo_get_selection(struct v4l2_subdev *subdev,
> @@ -359,9 +357,7 @@ static int histo_set_format(struct v4l2_subdev *subdev,
>  		return 0;
>  	}
>
> -	return vsp1_subdev_set_pad_format(subdev, sd_state, fmt,
> -					  HISTO_MIN_SIZE, HISTO_MIN_SIZE,
> -					  HISTO_MAX_SIZE, HISTO_MAX_SIZE);
> +	return vsp1_subdev_set_pad_format(subdev, sd_state, fmt);
>  }
>
>  static const struct v4l2_subdev_pad_ops histo_pad_ops = {
> @@ -498,6 +494,10 @@ int vsp1_histogram_init(struct vsp1_device *vsp1, struct vsp1_histogram *histo,
>  	histo->entity.type = type;
>  	histo->entity.codes = formats;
>  	histo->entity.num_codes = num_formats;
> +	histo->entity.min_width = HISTO_MIN_SIZE;
> +	histo->entity.min_height = HISTO_MIN_SIZE;
> +	histo->entity.max_width = HISTO_MAX_SIZE;
> +	histo->entity.max_height = HISTO_MAX_SIZE;
>
>  	ret = vsp1_entity_init(vsp1, &histo->entity, name, 2, &histo_ops,
>  			       MEDIA_ENT_F_PROC_VIDEO_STATISTICS);
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_hsit.c b/drivers/media/platform/renesas/vsp1/vsp1_hsit.c
> index 927dc185b8f7..8260934db789 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_hsit.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_hsit.c
> @@ -57,15 +57,6 @@ static int hsit_enum_mbus_code(struct v4l2_subdev *subdev,
>  	return 0;
>  }
>
> -static int hsit_enum_frame_size(struct v4l2_subdev *subdev,
> -				struct v4l2_subdev_state *sd_state,
> -				struct v4l2_subdev_frame_size_enum *fse)
> -{
> -	return vsp1_subdev_enum_frame_size(subdev, sd_state, fse,
> -					   HSIT_MIN_SIZE, HSIT_MIN_SIZE,
> -					   HSIT_MAX_SIZE, HSIT_MAX_SIZE);
> -}
> -
>  static int hsit_set_format(struct v4l2_subdev *subdev,
>  			   struct v4l2_subdev_state *sd_state,
>  			   struct v4l2_subdev_format *fmt)
> @@ -126,7 +117,7 @@ static int hsit_set_format(struct v4l2_subdev *subdev,
>
>  static const struct v4l2_subdev_pad_ops hsit_pad_ops = {
>  	.enum_mbus_code = hsit_enum_mbus_code,
> -	.enum_frame_size = hsit_enum_frame_size,
> +	.enum_frame_size = vsp1_subdev_enum_frame_size,
>  	.get_fmt = vsp1_subdev_get_pad_format,
>  	.set_fmt = hsit_set_format,
>  };
> @@ -181,6 +172,10 @@ struct vsp1_hsit *vsp1_hsit_create(struct vsp1_device *vsp1, bool inverse)
>
>  	hsit->entity.codes = hsit_codes;
>  	hsit->entity.num_codes = ARRAY_SIZE(hsit_codes);
> +	hsit->entity.min_width = HSIT_MIN_SIZE;
> +	hsit->entity.min_height = HSIT_MIN_SIZE;
> +	hsit->entity.max_width = HSIT_MAX_SIZE;
> +	hsit->entity.max_height = HSIT_MAX_SIZE;
>
>  	ret = vsp1_entity_init(vsp1, &hsit->entity, inverse ? "hsi" : "hst",
>  			       2, &hsit_ops,
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_lif.c b/drivers/media/platform/renesas/vsp1/vsp1_lif.c
> index 6c1cbe2d8524..1ebb88b3e4c9 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_lif.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_lif.c
> @@ -39,29 +39,11 @@ static const unsigned int lif_codes[] = {
>  	MEDIA_BUS_FMT_AYUV8_1X32,
>  };
>
> -static int lif_enum_frame_size(struct v4l2_subdev *subdev,
> -			       struct v4l2_subdev_state *sd_state,
> -			       struct v4l2_subdev_frame_size_enum *fse)
> -{
> -	return vsp1_subdev_enum_frame_size(subdev, sd_state, fse,
> -					   LIF_MIN_SIZE, LIF_MIN_SIZE,
> -					   LIF_MAX_SIZE, LIF_MAX_SIZE);
> -}
> -
> -static int lif_set_format(struct v4l2_subdev *subdev,
> -			  struct v4l2_subdev_state *sd_state,
> -			  struct v4l2_subdev_format *fmt)
> -{
> -	return vsp1_subdev_set_pad_format(subdev, sd_state, fmt,
> -					  LIF_MIN_SIZE, LIF_MIN_SIZE,
> -					  LIF_MAX_SIZE, LIF_MAX_SIZE);
> -}
> -
>  static const struct v4l2_subdev_pad_ops lif_pad_ops = {
>  	.enum_mbus_code = vsp1_subdev_enum_mbus_code,
> -	.enum_frame_size = lif_enum_frame_size,
> +	.enum_frame_size = vsp1_subdev_enum_frame_size,
>  	.get_fmt = vsp1_subdev_get_pad_format,
> -	.set_fmt = lif_set_format,
> +	.set_fmt = vsp1_subdev_set_pad_format,
>  };
>
>  static const struct v4l2_subdev_ops lif_ops = {
> @@ -154,6 +136,10 @@ struct vsp1_lif *vsp1_lif_create(struct vsp1_device *vsp1, unsigned int index)
>  	lif->entity.index = index;
>  	lif->entity.codes = lif_codes;
>  	lif->entity.num_codes = ARRAY_SIZE(lif_codes);
> +	lif->entity.min_width = LIF_MIN_SIZE;
> +	lif->entity.min_height = LIF_MIN_SIZE;
> +	lif->entity.max_width = LIF_MAX_SIZE;
> +	lif->entity.max_height = LIF_MAX_SIZE;
>
>  	/*
>  	 * The LIF is never exposed to userspace, but media entity registration
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_lut.c b/drivers/media/platform/renesas/vsp1/vsp1_lut.c
> index 46c79cdccd69..2ec4d596465d 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_lut.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_lut.c
> @@ -89,7 +89,7 @@ static const struct v4l2_ctrl_config lut_table_control = {
>  };
>
>  /* -----------------------------------------------------------------------------
> - * V4L2 Subdevice Pad Operations
> + * V4L2 Subdevice Operations
>   */
>
>  static const unsigned int lut_codes[] = {
> @@ -98,33 +98,11 @@ static const unsigned int lut_codes[] = {
>  	MEDIA_BUS_FMT_AYUV8_1X32,
>  };
>
> -static int lut_enum_frame_size(struct v4l2_subdev *subdev,
> -			       struct v4l2_subdev_state *sd_state,
> -			       struct v4l2_subdev_frame_size_enum *fse)
> -{
> -	return vsp1_subdev_enum_frame_size(subdev, sd_state, fse,
> -					   LUT_MIN_SIZE, LUT_MIN_SIZE,
> -					   LUT_MAX_SIZE, LUT_MAX_SIZE);
> -}
> -
> -static int lut_set_format(struct v4l2_subdev *subdev,
> -			  struct v4l2_subdev_state *sd_state,
> -			  struct v4l2_subdev_format *fmt)
> -{
> -	return vsp1_subdev_set_pad_format(subdev, sd_state, fmt,
> -					  LUT_MIN_SIZE, LUT_MIN_SIZE,
> -					  LUT_MAX_SIZE, LUT_MAX_SIZE);
> -}
> -
> -/* -----------------------------------------------------------------------------
> - * V4L2 Subdevice Operations
> - */
> -
>  static const struct v4l2_subdev_pad_ops lut_pad_ops = {
>  	.enum_mbus_code = vsp1_subdev_enum_mbus_code,
> -	.enum_frame_size = lut_enum_frame_size,
> +	.enum_frame_size = vsp1_subdev_enum_frame_size,
>  	.get_fmt = vsp1_subdev_get_pad_format,
> -	.set_fmt = lut_set_format,
> +	.set_fmt = vsp1_subdev_set_pad_format,
>  };
>
>  static const struct v4l2_subdev_ops lut_ops = {
> @@ -200,6 +178,10 @@ struct vsp1_lut *vsp1_lut_create(struct vsp1_device *vsp1)
>  	lut->entity.type = VSP1_ENTITY_LUT;
>  	lut->entity.codes = lut_codes;
>  	lut->entity.num_codes = ARRAY_SIZE(lut_codes);
> +	lut->entity.min_width = LUT_MIN_SIZE;
> +	lut->entity.min_height = LUT_MIN_SIZE;
> +	lut->entity.max_width = LUT_MAX_SIZE;
> +	lut->entity.max_height = LUT_MAX_SIZE;
>
>  	ret = vsp1_entity_init(vsp1, &lut->entity, "lut", 2, &lut_ops,
>  			       MEDIA_ENT_F_PROC_VIDEO_LUT);
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_rpf.c b/drivers/media/platform/renesas/vsp1/vsp1_rpf.c
> index 9f2744af54bc..f23a0f770474 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_rpf.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_rpf.c
> @@ -418,12 +418,11 @@ struct vsp1_rwpf *vsp1_rpf_create(struct vsp1_device *vsp1, unsigned int index)
>  	if (rpf == NULL)
>  		return ERR_PTR(-ENOMEM);
>
> -	rpf->max_width = RPF_MAX_WIDTH;
> -	rpf->max_height = RPF_MAX_HEIGHT;
> -
>  	rpf->entity.ops = &rpf_entity_ops;
>  	rpf->entity.type = VSP1_ENTITY_RPF;
>  	rpf->entity.index = index;
> +	rpf->entity.max_width = RPF_MAX_WIDTH;
> +	rpf->entity.max_height = RPF_MAX_HEIGHT;
>
>  	sprintf(name, "rpf.%u", index);
>  	ret = vsp1_entity_init(vsp1, &rpf->entity, name, 2, &vsp1_rwpf_subdev_ops,
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c b/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c
> index 304a2f618777..83ff2c266038 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c
> @@ -44,17 +44,6 @@ static int vsp1_rwpf_enum_mbus_code(struct v4l2_subdev *subdev,
>  	return 0;
>  }
>
> -static int vsp1_rwpf_enum_frame_size(struct v4l2_subdev *subdev,
> -				     struct v4l2_subdev_state *sd_state,
> -				     struct v4l2_subdev_frame_size_enum *fse)
> -{
> -	struct vsp1_rwpf *rwpf = to_rwpf(subdev);
> -
> -	return vsp1_subdev_enum_frame_size(subdev, sd_state, fse,
> -					   RWPF_MIN_WIDTH, RWPF_MIN_HEIGHT,
> -					   rwpf->max_width, rwpf->max_height);
> -}
> -
>  static int vsp1_rwpf_set_format(struct v4l2_subdev *subdev,
>  				struct v4l2_subdev_state *sd_state,
>  				struct v4l2_subdev_format *fmt)
> @@ -125,9 +114,9 @@ static int vsp1_rwpf_set_format(struct v4l2_subdev *subdev,
>
>  	format->code = fmt->format.code;
>  	format->width = clamp_t(unsigned int, fmt->format.width,
> -				RWPF_MIN_WIDTH, rwpf->max_width);
> +				RWPF_MIN_WIDTH, rwpf->entity.max_width);
>  	format->height = clamp_t(unsigned int, fmt->format.height,
> -				 RWPF_MIN_HEIGHT, rwpf->max_height);
> +				 RWPF_MIN_HEIGHT, rwpf->entity.max_height);
>  	format->field = V4L2_FIELD_NONE;
>
>  	format->colorspace = fmt->format.colorspace;
> @@ -275,7 +264,7 @@ static int vsp1_rwpf_set_selection(struct v4l2_subdev *subdev,
>
>  static const struct v4l2_subdev_pad_ops vsp1_rwpf_pad_ops = {
>  	.enum_mbus_code = vsp1_rwpf_enum_mbus_code,
> -	.enum_frame_size = vsp1_rwpf_enum_frame_size,
> +	.enum_frame_size = vsp1_subdev_enum_frame_size,
>  	.get_fmt = vsp1_subdev_get_pad_format,
>  	.set_fmt = vsp1_rwpf_set_format,
>  	.get_selection = vsp1_rwpf_get_selection,
> @@ -312,6 +301,8 @@ int vsp1_rwpf_init_ctrls(struct vsp1_rwpf *rwpf, unsigned int ncontrols)
>  {
>  	rwpf->entity.codes = rwpf_codes;
>  	rwpf->entity.num_codes = ARRAY_SIZE(rwpf_codes);
> +	rwpf->entity.min_width = RWPF_MIN_WIDTH;
> +	rwpf->entity.min_height = RWPF_MIN_HEIGHT;

I wonder if it wouldn't be clearer to initialize both min and max in
the wpf an rpf modules, took me a bit to grasp where max sizes where
set

>
>  	v4l2_ctrl_handler_init(&rwpf->ctrls, ncontrols + 1);
>  	v4l2_ctrl_new_std(&rwpf->ctrls, &vsp1_rwpf_ctrl_ops,
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_rwpf.h b/drivers/media/platform/renesas/vsp1/vsp1_rwpf.h
> index 5ac9f0a6fafc..1a65ff141501 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_rwpf.h
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_rwpf.h
> @@ -36,9 +36,6 @@ struct vsp1_rwpf {
>
>  	struct vsp1_video *video;
>
> -	unsigned int max_width;
> -	unsigned int max_height;
> -
>  	struct v4l2_pix_format_mplane format;
>  	const struct vsp1_format_info *fmtinfo;
>  	unsigned int brx_input;
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_sru.c b/drivers/media/platform/renesas/vsp1/vsp1_sru.c
> index 8e587efc0dc2..1dc34e6a510d 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_sru.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_sru.c
> @@ -364,6 +364,10 @@ struct vsp1_sru *vsp1_sru_create(struct vsp1_device *vsp1)
>  	sru->entity.type = VSP1_ENTITY_SRU;
>  	sru->entity.codes = sru_codes;
>  	sru->entity.num_codes = ARRAY_SIZE(sru_codes);
> +	sru->entity.min_width = SRU_MIN_SIZE;
> +	sru->entity.max_width = SRU_MAX_SIZE;
> +	sru->entity.min_height = SRU_MIN_SIZE;
> +	sru->entity.max_height = SRU_MAX_SIZE;
>
>  	ret = vsp1_entity_init(vsp1, &sru->entity, "sru", 2, &sru_ops,
>  			       MEDIA_ENT_F_PROC_VIDEO_SCALER);
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_uds.c b/drivers/media/platform/renesas/vsp1/vsp1_uds.c
> index 928b09e20add..8006d49ffbea 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_uds.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_uds.c
> @@ -404,6 +404,10 @@ struct vsp1_uds *vsp1_uds_create(struct vsp1_device *vsp1, unsigned int index)
>  	uds->entity.index = index;
>  	uds->entity.codes = uds_codes;
>  	uds->entity.num_codes = ARRAY_SIZE(uds_codes);
> +	uds->entity.min_width = UDS_MIN_SIZE;
> +	uds->entity.max_width = UDS_MAX_SIZE;
> +	uds->entity.min_height = UDS_MIN_SIZE;
> +	uds->entity.max_height = UDS_MAX_SIZE;
>
>  	sprintf(name, "uds.%u", index);
>  	ret = vsp1_entity_init(vsp1, &uds->entity, name, 2, &uds_ops,
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_uif.c b/drivers/media/platform/renesas/vsp1/vsp1_uif.c
> index e1bb6c709721..3aefe5c9d421 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_uif.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_uif.c
> @@ -53,24 +53,6 @@ static const unsigned int uif_codes[] = {
>  	MEDIA_BUS_FMT_AYUV8_1X32,
>  };
>
> -static int uif_enum_frame_size(struct v4l2_subdev *subdev,
> -			       struct v4l2_subdev_state *sd_state,
> -			       struct v4l2_subdev_frame_size_enum *fse)
> -{
> -	return vsp1_subdev_enum_frame_size(subdev, sd_state, fse,
> -					   UIF_MIN_SIZE, UIF_MIN_SIZE,
> -					   UIF_MAX_SIZE, UIF_MAX_SIZE);
> -}
> -
> -static int uif_set_format(struct v4l2_subdev *subdev,
> -			    struct v4l2_subdev_state *sd_state,
> -			    struct v4l2_subdev_format *fmt)
> -{
> -	return vsp1_subdev_set_pad_format(subdev, sd_state, fmt,
> -					  UIF_MIN_SIZE, UIF_MIN_SIZE,
> -					  UIF_MAX_SIZE, UIF_MAX_SIZE);
> -}
> -
>  static int uif_get_selection(struct v4l2_subdev *subdev,
>  			     struct v4l2_subdev_state *sd_state,
>  			     struct v4l2_subdev_selection *sel)
> @@ -162,9 +144,9 @@ static int uif_set_selection(struct v4l2_subdev *subdev,
>
>  static const struct v4l2_subdev_pad_ops uif_pad_ops = {
>  	.enum_mbus_code = vsp1_subdev_enum_mbus_code,
> -	.enum_frame_size = uif_enum_frame_size,
> +	.enum_frame_size = vsp1_subdev_enum_frame_size,
>  	.get_fmt = vsp1_subdev_get_pad_format,
> -	.set_fmt = uif_set_format,
> +	.set_fmt = vsp1_subdev_set_pad_format,
>  	.get_selection = uif_get_selection,
>  	.set_selection = uif_set_selection,
>  };
> @@ -242,6 +224,10 @@ struct vsp1_uif *vsp1_uif_create(struct vsp1_device *vsp1, unsigned int index)
>  	uif->entity.index = index;
>  	uif->entity.codes = uif_codes;
>  	uif->entity.num_codes = ARRAY_SIZE(uif_codes);
> +	uif->entity.min_width = UIF_MIN_SIZE;
> +	uif->entity.min_height = UIF_MIN_SIZE;
> +	uif->entity.max_width = UIF_MAX_SIZE;
> +	uif->entity.max_height = UIF_MAX_SIZE;
>
>  	/* The datasheet names the two UIF instances UIF4 and UIF5. */
>  	sprintf(name, "uif.%u", index + 4);
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_wpf.c b/drivers/media/platform/renesas/vsp1/vsp1_wpf.c
> index 49af637c8186..349acdae83c7 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_wpf.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_wpf.c
> @@ -525,7 +525,7 @@ static unsigned int wpf_max_width(struct vsp1_entity *entity,
>  {
>  	struct vsp1_rwpf *wpf = to_rwpf(&entity->subdev);
>
> -	return wpf->flip.rotate ? 256 : wpf->max_width;
> +	return wpf->flip.rotate ? 256 : wpf->entity.max_width;
>  }
>
>  static void wpf_partition(struct vsp1_entity *entity,
> @@ -562,11 +562,11 @@ struct vsp1_rwpf *vsp1_wpf_create(struct vsp1_device *vsp1, unsigned int index)
>  		return ERR_PTR(-ENOMEM);
>
>  	if (vsp1->info->gen == 2) {
> -		wpf->max_width = WPF_GEN2_MAX_WIDTH;
> -		wpf->max_height = WPF_GEN2_MAX_HEIGHT;
> +		wpf->entity.max_width = WPF_GEN2_MAX_WIDTH;
> +		wpf->entity.max_height = WPF_GEN2_MAX_HEIGHT;
>  	} else {
> -		wpf->max_width = WPF_GEN3_MAX_WIDTH;
> -		wpf->max_height = WPF_GEN3_MAX_HEIGHT;
> +		wpf->entity.max_width = WPF_GEN3_MAX_WIDTH;
> +		wpf->entity.max_height = WPF_GEN3_MAX_HEIGHT;

Minor thing though
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Thanks
  j

>  	}
>
>  	wpf->entity.ops = &wpf_entity_ops;
> --
> Regards,
>
> Laurent Pinchart
>
>

