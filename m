Return-Path: <linux-media+bounces-13591-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9825390DA1E
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2024 18:57:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EC3BC1F241A0
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2024 16:57:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B97D13AD04;
	Tue, 18 Jun 2024 16:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="UJBTc3Th"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3CD01CA80;
	Tue, 18 Jun 2024 16:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718729829; cv=none; b=mdGwpj1ExhQXmFSXiZyUASUysw/UFWd1qANZqsB5vzuukAgNFC2JwzrTWnI3vNK7h9QveYKDaErlLlgYCxGvO5O5wKc88BRhAbNe0jFtsB5Vl8gmMh1QWy7wUAHd5QWSynZCKz4QLK2F/3JGDhU8zEJ4v9FFZtIFyMQAcJz6l/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718729829; c=relaxed/simple;
	bh=yjjb8n+k9MaT+EWJEN5lTyAjKE+50SbZkG7KYcdvumY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M8MhsuM5YuNEI9i4iNuNpRTfN7soBXj8faC8aixVK3MNFY86Cbcplxx4Mk/D654H3f4msBvODZNXv0+5po19FfMZU30kiet4+U7P45s/C8ULn1zCN3v2TlMQdkxru01zlZD7xIJoaMLwOBkh9SStSfMf1Chn4T9mcCo4BE+JKH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=UJBTc3Th; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D281E564;
	Tue, 18 Jun 2024 18:56:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718729808;
	bh=yjjb8n+k9MaT+EWJEN5lTyAjKE+50SbZkG7KYcdvumY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UJBTc3ThMIgqoa5kwVAs0Z8R/w5zRJygWit/x2qU70ayoZuYc20ETyi+ibnrbtm1+
	 ccTkJc6FZowhX5DWMEg99+RKUH1Qr7Swx4bZvyk6XX2/EPKEZUFFrrzo1XxIpQxxU1
	 6D0W+NTyEGNCVlqnakjZ+Q2hbLvGKt2U9qDk6BE4=
Date: Tue, 18 Jun 2024 18:57:02 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Sakari Ailus <sakari.ailus@iki.fi>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [RFC PATCH v1 19/19] media: renesas: vsp1: Rename all
 v4l2_subdev_state variables to 'state'
Message-ID: <b534v3vbd5uqs44vzyt23soiy5btiymk2zxe3dnvacrt5tcabe@5mb72pw7g2cu>
References: <20231122043009.2741-1-laurent.pinchart+renesas@ideasonboard.com>
 <20231122043009.2741-20-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231122043009.2741-20-laurent.pinchart+renesas@ideasonboard.com>

Hi Laurent

On Wed, Nov 22, 2023 at 06:30:09AM GMT, Laurent Pinchart wrote:
> The driver names variables (including function parameters) of
> struct *v4l2_subdev_state type either 'state' or 'sd_state'. Rename them
> all to 'state' for consistency.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

here you go.. :)

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Thanks
   j
> ---
>  .../media/platform/renesas/vsp1/vsp1_brx.c    | 15 +++++------
>  .../media/platform/renesas/vsp1/vsp1_clu.c    | 16 ++++++------
>  .../media/platform/renesas/vsp1/vsp1_entity.c |  8 +++---
>  .../media/platform/renesas/vsp1/vsp1_entity.h |  2 +-
>  .../media/platform/renesas/vsp1/vsp1_hgo.c    |  6 ++---
>  .../media/platform/renesas/vsp1/vsp1_hgt.c    |  6 ++---
>  .../media/platform/renesas/vsp1/vsp1_histo.c  | 26 +++++++++----------
>  .../media/platform/renesas/vsp1/vsp1_hsit.c   |  8 +++---
>  .../media/platform/renesas/vsp1/vsp1_lif.c    | 16 ++++++------
>  .../media/platform/renesas/vsp1/vsp1_lut.c    | 14 +++++-----
>  .../media/platform/renesas/vsp1/vsp1_rpf.c    | 10 +++----
>  .../media/platform/renesas/vsp1/vsp1_rwpf.c   |  6 ++---
>  .../media/platform/renesas/vsp1/vsp1_sru.c    | 26 +++++++++----------
>  .../media/platform/renesas/vsp1/vsp1_uds.c    | 26 +++++++++----------
>  .../media/platform/renesas/vsp1/vsp1_uif.c    | 16 ++++++------
>  .../media/platform/renesas/vsp1/vsp1_wpf.c    | 10 +++----
>  16 files changed, 105 insertions(+), 106 deletions(-)
>
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_brx.c b/drivers/media/platform/renesas/vsp1/vsp1_brx.c
> index 435c317ad05e..53c97bef44c1 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_brx.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_brx.c
> @@ -65,7 +65,7 @@ static const struct v4l2_ctrl_ops brx_ctrl_ops = {
>   */
>
>  static int brx_enum_mbus_code(struct v4l2_subdev *subdev,
> -			      struct v4l2_subdev_state *sd_state,
> +			      struct v4l2_subdev_state *state,
>  			      struct v4l2_subdev_mbus_code_enum *code)
>  {
>  	static const unsigned int codes[] = {
> @@ -73,12 +73,12 @@ static int brx_enum_mbus_code(struct v4l2_subdev *subdev,
>  		MEDIA_BUS_FMT_AYUV8_1X32,
>  	};
>
> -	return vsp1_subdev_enum_mbus_code(subdev, sd_state, code, codes,
> +	return vsp1_subdev_enum_mbus_code(subdev, state, code, codes,
>  					  ARRAY_SIZE(codes));
>  }
>
>  static int brx_enum_frame_size(struct v4l2_subdev *subdev,
> -			       struct v4l2_subdev_state *sd_state,
> +			       struct v4l2_subdev_state *state,
>  			       struct v4l2_subdev_frame_size_enum *fse)
>  {
>  	if (fse->index)
> @@ -97,7 +97,7 @@ static int brx_enum_frame_size(struct v4l2_subdev *subdev,
>  }
>
>  static void brx_try_format(struct vsp1_brx *brx,
> -			   struct v4l2_subdev_state *sd_state,
> +			   struct v4l2_subdev_state *state,
>  			   unsigned int pad, struct v4l2_mbus_framefmt *fmt)
>  {
>  	struct v4l2_mbus_framefmt *format;
> @@ -112,8 +112,7 @@ static void brx_try_format(struct vsp1_brx *brx,
>
>  	default:
>  		/* The BRx can't perform format conversion. */
> -		format = v4l2_subdev_state_get_format(sd_state,
> -						      BRX_PAD_SINK(0));
> +		format = v4l2_subdev_state_get_format(state, BRX_PAD_SINK(0));
>  		fmt->code = format->code;
>  		break;
>  	}
> @@ -240,7 +239,7 @@ static const struct v4l2_subdev_ops brx_ops = {
>   */
>
>  static void brx_configure_stream(struct vsp1_entity *entity,
> -				 struct v4l2_subdev_state *sd_state,
> +				 struct v4l2_subdev_state *state,
>  				 struct vsp1_pipeline *pipe,
>  				 struct vsp1_dl_list *dl,
>  				 struct vsp1_dl_body *dlb)
> @@ -250,7 +249,7 @@ static void brx_configure_stream(struct vsp1_entity *entity,
>  	unsigned int flags;
>  	unsigned int i;
>
> -	format = v4l2_subdev_state_get_format(sd_state, brx->entity.source_pad);
> +	format = v4l2_subdev_state_get_format(state, brx->entity.source_pad);
>
>  	/*
>  	 * The hardware is extremely flexible but we have no userspace API to
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_clu.c b/drivers/media/platform/renesas/vsp1/vsp1_clu.c
> index 4aa52b71e857..bf88db8f4ff2 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_clu.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_clu.c
> @@ -123,28 +123,28 @@ static const unsigned int clu_codes[] = {
>  };
>
>  static int clu_enum_mbus_code(struct v4l2_subdev *subdev,
> -			      struct v4l2_subdev_state *sd_state,
> +			      struct v4l2_subdev_state *state,
>  			      struct v4l2_subdev_mbus_code_enum *code)
>  {
> -	return vsp1_subdev_enum_mbus_code(subdev, sd_state, code, clu_codes,
> +	return vsp1_subdev_enum_mbus_code(subdev, state, code, clu_codes,
>  					  ARRAY_SIZE(clu_codes));
>  }
>
>  static int clu_enum_frame_size(struct v4l2_subdev *subdev,
> -			       struct v4l2_subdev_state *sd_state,
> +			       struct v4l2_subdev_state *state,
>  			       struct v4l2_subdev_frame_size_enum *fse)
>  {
> -	return vsp1_subdev_enum_frame_size(subdev, sd_state, fse,
> +	return vsp1_subdev_enum_frame_size(subdev, state, fse,
>  					   CLU_MIN_SIZE,
>  					   CLU_MIN_SIZE, CLU_MAX_SIZE,
>  					   CLU_MAX_SIZE);
>  }
>
>  static int clu_set_format(struct v4l2_subdev *subdev,
> -			  struct v4l2_subdev_state *sd_state,
> +			  struct v4l2_subdev_state *state,
>  			  struct v4l2_subdev_format *fmt)
>  {
> -	return vsp1_subdev_set_pad_format(subdev, sd_state, fmt, clu_codes,
> +	return vsp1_subdev_set_pad_format(subdev, state, fmt, clu_codes,
>  					  ARRAY_SIZE(clu_codes),
>  					  CLU_MIN_SIZE, CLU_MIN_SIZE,
>  					  CLU_MAX_SIZE, CLU_MAX_SIZE);
> @@ -170,7 +170,7 @@ static const struct v4l2_subdev_ops clu_ops = {
>   */
>
>  static void clu_configure_stream(struct vsp1_entity *entity,
> -				 struct v4l2_subdev_state *sd_state,
> +				 struct v4l2_subdev_state *state,
>  				 struct vsp1_pipeline *pipe,
>  				 struct vsp1_dl_list *dl,
>  				 struct vsp1_dl_body *dlb)
> @@ -182,7 +182,7 @@ static void clu_configure_stream(struct vsp1_entity *entity,
>  	 * The yuv_mode can't be changed during streaming. Cache it internally
>  	 * for future runtime configuration calls.
>  	 */
> -	format = v4l2_subdev_state_get_format(sd_state, CLU_PAD_SINK);
> +	format = v4l2_subdev_state_get_format(state, CLU_PAD_SINK);
>  	clu->yuv_mode = format->code == MEDIA_BUS_FMT_AYUV8_1X32;
>  }
>
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_entity.c b/drivers/media/platform/renesas/vsp1/vsp1_entity.c
> index 5f9a67f6df68..66308659ffc0 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_entity.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_entity.c
> @@ -70,13 +70,13 @@ void vsp1_entity_route_setup(struct vsp1_entity *entity,
>  }
>
>  void vsp1_entity_configure_stream(struct vsp1_entity *entity,
> -				  struct v4l2_subdev_state *sd_state,
> +				  struct v4l2_subdev_state *state,
>  				  struct vsp1_pipeline *pipe,
>  				  struct vsp1_dl_list *dl,
>  				  struct vsp1_dl_body *dlb)
>  {
>  	if (entity->ops->configure_stream)
> -		entity->ops->configure_stream(entity, sd_state, pipe, dl, dlb);
> +		entity->ops->configure_stream(entity, state, pipe, dl, dlb);
>  }
>
>  void vsp1_entity_configure_frame(struct vsp1_entity *entity,
> @@ -268,7 +268,7 @@ int vsp1_subdev_set_pad_format(struct v4l2_subdev *subdev,
>  }
>
>  static int vsp1_entity_init_state(struct v4l2_subdev *subdev,
> -				  struct v4l2_subdev_state *sd_state)
> +				  struct v4l2_subdev_state *state)
>  {
>  	unsigned int pad;
>
> @@ -278,7 +278,7 @@ static int vsp1_entity_init_state(struct v4l2_subdev *subdev,
>  			.pad = pad,
>  		};
>
> -		v4l2_subdev_call(subdev, pad, set_fmt, sd_state, &format);
> +		v4l2_subdev_call(subdev, pad, set_fmt, state, &format);
>  	}
>
>  	return 0;
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_entity.h b/drivers/media/platform/renesas/vsp1/vsp1_entity.h
> index 8c150c41a623..411d264448d9 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_entity.h
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_entity.h
> @@ -145,7 +145,7 @@ void vsp1_entity_route_setup(struct vsp1_entity *entity,
>  			     struct vsp1_dl_body *dlb);
>
>  void vsp1_entity_configure_stream(struct vsp1_entity *entity,
> -				  struct v4l2_subdev_state *sd_state,
> +				  struct v4l2_subdev_state *state,
>  				  struct vsp1_pipeline *pipe,
>  				  struct vsp1_dl_list *dl,
>  				  struct vsp1_dl_body *dlb);
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_hgo.c b/drivers/media/platform/renesas/vsp1/vsp1_hgo.c
> index 3d3b7da9f8ec..561c86e889a9 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_hgo.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_hgo.c
> @@ -130,7 +130,7 @@ static const struct v4l2_ctrl_config hgo_num_bins_control = {
>   */
>
>  static void hgo_configure_stream(struct vsp1_entity *entity,
> -				 struct v4l2_subdev_state *sd_state,
> +				 struct v4l2_subdev_state *state,
>  				 struct vsp1_pipeline *pipe,
>  				 struct vsp1_dl_list *dl,
>  				 struct vsp1_dl_body *dlb)
> @@ -141,8 +141,8 @@ static void hgo_configure_stream(struct vsp1_entity *entity,
>  	unsigned int hratio;
>  	unsigned int vratio;
>
> -	crop = v4l2_subdev_state_get_crop(sd_state, HISTO_PAD_SINK);
> -	compose = v4l2_subdev_state_get_compose(sd_state, HISTO_PAD_SINK);
> +	crop = v4l2_subdev_state_get_crop(state, HISTO_PAD_SINK);
> +	compose = v4l2_subdev_state_get_compose(state, HISTO_PAD_SINK);
>
>  	vsp1_hgo_write(hgo, dlb, VI6_HGO_REGRST, VI6_HGO_REGRST_RCLEA);
>
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_hgt.c b/drivers/media/platform/renesas/vsp1/vsp1_hgt.c
> index 2968aae7ba82..d26433fe54c6 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_hgt.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_hgt.c
> @@ -126,7 +126,7 @@ static const struct v4l2_ctrl_config hgt_hue_areas = {
>   */
>
>  static void hgt_configure_stream(struct vsp1_entity *entity,
> -				 struct v4l2_subdev_state *sd_state,
> +				 struct v4l2_subdev_state *state,
>  				 struct vsp1_pipeline *pipe,
>  				 struct vsp1_dl_list *dl,
>  				 struct vsp1_dl_body *dlb)
> @@ -140,8 +140,8 @@ static void hgt_configure_stream(struct vsp1_entity *entity,
>  	u8 upper;
>  	unsigned int i;
>
> -	crop = v4l2_subdev_state_get_crop(sd_state, HISTO_PAD_SINK);
> -	compose = v4l2_subdev_state_get_compose(sd_state, HISTO_PAD_SINK);
> +	crop = v4l2_subdev_state_get_crop(state, HISTO_PAD_SINK);
> +	compose = v4l2_subdev_state_get_compose(state, HISTO_PAD_SINK);
>
>  	vsp1_hgt_write(hgt, dlb, VI6_HGT_REGRST, VI6_HGT_REGRST_RCLEA);
>
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_histo.c b/drivers/media/platform/renesas/vsp1/vsp1_histo.c
> index ec3ca0b7916c..c45bdcf2f001 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_histo.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_histo.c
> @@ -170,7 +170,7 @@ static const struct vb2_ops histo_video_queue_qops = {
>   */
>
>  static int histo_enum_mbus_code(struct v4l2_subdev *subdev,
> -				struct v4l2_subdev_state *sd_state,
> +				struct v4l2_subdev_state *state,
>  				struct v4l2_subdev_mbus_code_enum *code)
>  {
>  	struct vsp1_histogram *histo = subdev_to_histo(subdev);
> @@ -180,19 +180,19 @@ static int histo_enum_mbus_code(struct v4l2_subdev *subdev,
>  		return 0;
>  	}
>
> -	return vsp1_subdev_enum_mbus_code(subdev, sd_state, code,
> +	return vsp1_subdev_enum_mbus_code(subdev, state, code,
>  					  histo->formats,
>  					  histo->num_formats);
>  }
>
>  static int histo_enum_frame_size(struct v4l2_subdev *subdev,
> -				 struct v4l2_subdev_state *sd_state,
> +				 struct v4l2_subdev_state *state,
>  				 struct v4l2_subdev_frame_size_enum *fse)
>  {
>  	if (fse->pad != HISTO_PAD_SINK)
>  		return -EINVAL;
>
> -	return vsp1_subdev_enum_frame_size(subdev, sd_state, fse,
> +	return vsp1_subdev_enum_frame_size(subdev, state, fse,
>  					   HISTO_MIN_SIZE,
>  					   HISTO_MIN_SIZE, HISTO_MAX_SIZE,
>  					   HISTO_MAX_SIZE);
> @@ -243,13 +243,13 @@ static int histo_get_selection(struct v4l2_subdev *subdev,
>  }
>
>  static int histo_set_crop(struct v4l2_subdev *subdev,
> -			  struct v4l2_subdev_state *sd_state,
> +			  struct v4l2_subdev_state *state,
>  			  struct v4l2_subdev_selection *sel)
>  {
>  	struct v4l2_mbus_framefmt *format;
>
>  	/* The crop rectangle must be inside the input frame. */
> -	format = v4l2_subdev_state_get_format(sd_state, HISTO_PAD_SINK);
> +	format = v4l2_subdev_state_get_format(state, HISTO_PAD_SINK);
>  	sel->r.left = clamp_t(unsigned int, sel->r.left, 0, format->width - 1);
>  	sel->r.top = clamp_t(unsigned int, sel->r.top, 0, format->height - 1);
>  	sel->r.width = clamp_t(unsigned int, sel->r.width, HISTO_MIN_SIZE,
> @@ -258,14 +258,14 @@ static int histo_set_crop(struct v4l2_subdev *subdev,
>  				format->height - sel->r.top);
>
>  	/* Set the crop rectangle and reset the compose rectangle. */
> -	*v4l2_subdev_state_get_crop(sd_state, sel->pad) = sel->r;
> -	*v4l2_subdev_state_get_compose(sd_state, sel->pad) = sel->r;
> +	*v4l2_subdev_state_get_crop(state, sel->pad) = sel->r;
> +	*v4l2_subdev_state_get_compose(state, sel->pad) = sel->r;
>
>  	return 0;
>  }
>
>  static int histo_set_compose(struct v4l2_subdev *subdev,
> -			     struct v4l2_subdev_state *sd_state,
> +			     struct v4l2_subdev_state *state,
>  			     struct v4l2_subdev_selection *sel)
>  {
>  	struct v4l2_rect *compose;
> @@ -280,7 +280,7 @@ static int histo_set_compose(struct v4l2_subdev *subdev,
>  	sel->r.left = 0;
>  	sel->r.top = 0;
>
> -	crop = v4l2_subdev_state_get_crop(sd_state, sel->pad);
> +	crop = v4l2_subdev_state_get_crop(state, sel->pad);
>
>  	/*
>  	 * Clamp the width and height to acceptable values first and then
> @@ -305,7 +305,7 @@ static int histo_set_compose(struct v4l2_subdev *subdev,
>  	ratio = 1 << (crop->height * 2 / sel->r.height / 3);
>  	sel->r.height = crop->height / ratio;
>
> -	compose = v4l2_subdev_state_get_compose(sd_state, sel->pad);
> +	compose = v4l2_subdev_state_get_compose(state, sel->pad);
>  	*compose = sel->r;
>
>  	return 0;
> @@ -327,7 +327,7 @@ static int histo_set_selection(struct v4l2_subdev *subdev,
>  }
>
>  static int histo_set_format(struct v4l2_subdev *subdev,
> -			    struct v4l2_subdev_state *sd_state,
> +			    struct v4l2_subdev_state *state,
>  			    struct v4l2_subdev_format *fmt)
>  {
>  	struct vsp1_histogram *histo = subdev_to_histo(subdev);
> @@ -342,7 +342,7 @@ static int histo_set_format(struct v4l2_subdev *subdev,
>  		return 0;
>  	}
>
> -	return vsp1_subdev_set_pad_format(subdev, sd_state, fmt,
> +	return vsp1_subdev_set_pad_format(subdev, state, fmt,
>  					  histo->formats, histo->num_formats,
>  					  HISTO_MIN_SIZE, HISTO_MIN_SIZE,
>  					  HISTO_MAX_SIZE, HISTO_MAX_SIZE);
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_hsit.c b/drivers/media/platform/renesas/vsp1/vsp1_hsit.c
> index c41691c2bf71..0aedaff58019 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_hsit.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_hsit.c
> @@ -34,7 +34,7 @@ static inline void vsp1_hsit_write(struct vsp1_hsit *hsit,
>   */
>
>  static int hsit_enum_mbus_code(struct v4l2_subdev *subdev,
> -			       struct v4l2_subdev_state *sd_state,
> +			       struct v4l2_subdev_state *state,
>  			       struct v4l2_subdev_mbus_code_enum *code)
>  {
>  	struct vsp1_hsit *hsit = to_hsit(subdev);
> @@ -52,10 +52,10 @@ static int hsit_enum_mbus_code(struct v4l2_subdev *subdev,
>  }
>
>  static int hsit_enum_frame_size(struct v4l2_subdev *subdev,
> -				struct v4l2_subdev_state *sd_state,
> +				struct v4l2_subdev_state *state,
>  				struct v4l2_subdev_frame_size_enum *fse)
>  {
> -	return vsp1_subdev_enum_frame_size(subdev, sd_state, fse,
> +	return vsp1_subdev_enum_frame_size(subdev, state, fse,
>  					   HSIT_MIN_SIZE,
>  					   HSIT_MIN_SIZE, HSIT_MAX_SIZE,
>  					   HSIT_MAX_SIZE);
> @@ -115,7 +115,7 @@ static const struct v4l2_subdev_ops hsit_ops = {
>   */
>
>  static void hsit_configure_stream(struct vsp1_entity *entity,
> -				  struct v4l2_subdev_state *sd_state,
> +				  struct v4l2_subdev_state *state,
>  				  struct vsp1_pipeline *pipe,
>  				  struct vsp1_dl_list *dl,
>  				  struct vsp1_dl_body *dlb)
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_lif.c b/drivers/media/platform/renesas/vsp1/vsp1_lif.c
> index edbc634a378c..271ee8fd2b91 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_lif.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_lif.c
> @@ -40,28 +40,28 @@ static const unsigned int lif_codes[] = {
>  };
>
>  static int lif_enum_mbus_code(struct v4l2_subdev *subdev,
> -			      struct v4l2_subdev_state *sd_state,
> +			      struct v4l2_subdev_state *state,
>  			      struct v4l2_subdev_mbus_code_enum *code)
>  {
> -	return vsp1_subdev_enum_mbus_code(subdev, sd_state, code, lif_codes,
> +	return vsp1_subdev_enum_mbus_code(subdev, state, code, lif_codes,
>  					  ARRAY_SIZE(lif_codes));
>  }
>
>  static int lif_enum_frame_size(struct v4l2_subdev *subdev,
> -			       struct v4l2_subdev_state *sd_state,
> +			       struct v4l2_subdev_state *state,
>  			       struct v4l2_subdev_frame_size_enum *fse)
>  {
> -	return vsp1_subdev_enum_frame_size(subdev, sd_state, fse,
> +	return vsp1_subdev_enum_frame_size(subdev, state, fse,
>  					   LIF_MIN_SIZE,
>  					   LIF_MIN_SIZE, LIF_MAX_SIZE,
>  					   LIF_MAX_SIZE);
>  }
>
>  static int lif_set_format(struct v4l2_subdev *subdev,
> -			  struct v4l2_subdev_state *sd_state,
> +			  struct v4l2_subdev_state *state,
>  			  struct v4l2_subdev_format *fmt)
>  {
> -	return vsp1_subdev_set_pad_format(subdev, sd_state, fmt, lif_codes,
> +	return vsp1_subdev_set_pad_format(subdev, state, fmt, lif_codes,
>  					  ARRAY_SIZE(lif_codes),
>  					  LIF_MIN_SIZE, LIF_MIN_SIZE,
>  					  LIF_MAX_SIZE, LIF_MAX_SIZE);
> @@ -83,7 +83,7 @@ static const struct v4l2_subdev_ops lif_ops = {
>   */
>
>  static void lif_configure_stream(struct vsp1_entity *entity,
> -				 struct v4l2_subdev_state *sd_state,
> +				 struct v4l2_subdev_state *state,
>  				 struct vsp1_pipeline *pipe,
>  				 struct vsp1_dl_list *dl,
>  				 struct vsp1_dl_body *dlb)
> @@ -94,7 +94,7 @@ static void lif_configure_stream(struct vsp1_entity *entity,
>  	unsigned int obth;
>  	unsigned int lbth;
>
> -	format = v4l2_subdev_state_get_format(sd_state, LIF_PAD_SOURCE);
> +	format = v4l2_subdev_state_get_format(state, LIF_PAD_SOURCE);
>
>  	switch (entity->vsp1->version & VI6_IP_VERSION_MODEL_MASK) {
>  	case VI6_IP_VERSION_MODEL_VSPD_GEN2:
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_lut.c b/drivers/media/platform/renesas/vsp1/vsp1_lut.c
> index 7abe5aa5de28..ebe4cb03a7a8 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_lut.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_lut.c
> @@ -99,28 +99,28 @@ static const unsigned int lut_codes[] = {
>  };
>
>  static int lut_enum_mbus_code(struct v4l2_subdev *subdev,
> -			      struct v4l2_subdev_state *sd_state,
> +			      struct v4l2_subdev_state *state,
>  			      struct v4l2_subdev_mbus_code_enum *code)
>  {
> -	return vsp1_subdev_enum_mbus_code(subdev, sd_state, code, lut_codes,
> +	return vsp1_subdev_enum_mbus_code(subdev, state, code, lut_codes,
>  					  ARRAY_SIZE(lut_codes));
>  }
>
>  static int lut_enum_frame_size(struct v4l2_subdev *subdev,
> -			       struct v4l2_subdev_state *sd_state,
> +			       struct v4l2_subdev_state *state,
>  			       struct v4l2_subdev_frame_size_enum *fse)
>  {
> -	return vsp1_subdev_enum_frame_size(subdev, sd_state, fse,
> +	return vsp1_subdev_enum_frame_size(subdev, state, fse,
>  					   LUT_MIN_SIZE,
>  					   LUT_MIN_SIZE, LUT_MAX_SIZE,
>  					   LUT_MAX_SIZE);
>  }
>
>  static int lut_set_format(struct v4l2_subdev *subdev,
> -			  struct v4l2_subdev_state *sd_state,
> +			  struct v4l2_subdev_state *state,
>  			  struct v4l2_subdev_format *fmt)
>  {
> -	return vsp1_subdev_set_pad_format(subdev, sd_state, fmt, lut_codes,
> +	return vsp1_subdev_set_pad_format(subdev, state, fmt, lut_codes,
>  					  ARRAY_SIZE(lut_codes),
>  					  LUT_MIN_SIZE, LUT_MIN_SIZE,
>  					  LUT_MAX_SIZE, LUT_MAX_SIZE);
> @@ -146,7 +146,7 @@ static const struct v4l2_subdev_ops lut_ops = {
>   */
>
>  static void lut_configure_stream(struct vsp1_entity *entity,
> -				 struct v4l2_subdev_state *sd_state,
> +				 struct v4l2_subdev_state *state,
>  				 struct vsp1_pipeline *pipe,
>  				 struct vsp1_dl_list *dl,
>  				 struct vsp1_dl_body *dlb)
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_rpf.c b/drivers/media/platform/renesas/vsp1/vsp1_rpf.c
> index 32b3710d0985..66a6f2eb2ae3 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_rpf.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_rpf.c
> @@ -48,7 +48,7 @@ static inline void vsp1_rpf_write(struct vsp1_rwpf *rpf,
>   */
>
>  static void rpf_configure_stream(struct vsp1_entity *entity,
> -				 struct v4l2_subdev_state *sd_state,
> +				 struct v4l2_subdev_state *state,
>  				 struct vsp1_pipeline *pipe,
>  				 struct vsp1_dl_list *dl,
>  				 struct vsp1_dl_body *dlb)
> @@ -81,8 +81,8 @@ static void rpf_configure_stream(struct vsp1_entity *entity,
>  	vsp1_rpf_write(rpf, dlb, VI6_RPF_SRCM_PSTRIDE, pstride);
>
>  	/* Format */
> -	sink_format = v4l2_subdev_state_get_format(sd_state, RWPF_PAD_SINK);
> -	source_format = v4l2_subdev_state_get_format(sd_state, RWPF_PAD_SOURCE);
> +	sink_format = v4l2_subdev_state_get_format(state, RWPF_PAD_SINK);
> +	source_format = v4l2_subdev_state_get_format(state, RWPF_PAD_SOURCE);
>
>  	infmt = VI6_RPF_INFMT_CIPM
>  	      | (fmtinfo->hwfmt << VI6_RPF_INFMT_RDFMT_SHIFT);
> @@ -350,7 +350,7 @@ static void rpf_configure_partition(struct vsp1_entity *entity,
>  }
>
>  static void rpf_partition(struct vsp1_entity *entity,
> -			  struct v4l2_subdev_state *sd_state,
> +			  struct v4l2_subdev_state *state,
>  			  struct vsp1_pipeline *pipe,
>  			  struct vsp1_partition *partition,
>  			  unsigned int partition_idx,
> @@ -368,7 +368,7 @@ static void rpf_partition(struct vsp1_entity *entity,
>  	 * our crop to provide a 'sub-crop' matching the expected partition
>  	 * window.
>  	 */
> -	*rpf_rect = *v4l2_subdev_state_get_crop(sd_state, RWPF_PAD_SINK);
> +	*rpf_rect = *v4l2_subdev_state_get_crop(state, RWPF_PAD_SINK);
>
>  	if (pipe->partitions > 1) {
>  		rpf_rect->width = window->width;
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c b/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c
> index e4edce3bf584..1745e7d714f9 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c
> @@ -21,7 +21,7 @@
>   */
>
>  static int vsp1_rwpf_enum_mbus_code(struct v4l2_subdev *subdev,
> -				    struct v4l2_subdev_state *sd_state,
> +				    struct v4l2_subdev_state *state,
>  				    struct v4l2_subdev_mbus_code_enum *code)
>  {
>  	static const unsigned int codes[] = {
> @@ -39,12 +39,12 @@ static int vsp1_rwpf_enum_mbus_code(struct v4l2_subdev *subdev,
>  }
>
>  static int vsp1_rwpf_enum_frame_size(struct v4l2_subdev *subdev,
> -				     struct v4l2_subdev_state *sd_state,
> +				     struct v4l2_subdev_state *state,
>  				     struct v4l2_subdev_frame_size_enum *fse)
>  {
>  	struct vsp1_rwpf *rwpf = to_rwpf(subdev);
>
> -	return vsp1_subdev_enum_frame_size(subdev, sd_state, fse,
> +	return vsp1_subdev_enum_frame_size(subdev, state, fse,
>  					   RWPF_MIN_WIDTH,
>  					   RWPF_MIN_HEIGHT, rwpf->max_width,
>  					   rwpf->max_height);
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_sru.c b/drivers/media/platform/renesas/vsp1/vsp1_sru.c
> index 0c324623699a..342ca8a28125 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_sru.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_sru.c
> @@ -106,7 +106,7 @@ static const struct v4l2_ctrl_config sru_intensity_control = {
>   */
>
>  static int sru_enum_mbus_code(struct v4l2_subdev *subdev,
> -			      struct v4l2_subdev_state *sd_state,
> +			      struct v4l2_subdev_state *state,
>  			      struct v4l2_subdev_mbus_code_enum *code)
>  {
>  	static const unsigned int codes[] = {
> @@ -114,7 +114,7 @@ static int sru_enum_mbus_code(struct v4l2_subdev *subdev,
>  		MEDIA_BUS_FMT_AYUV8_1X32,
>  	};
>
> -	return vsp1_subdev_enum_mbus_code(subdev, sd_state, code, codes,
> +	return vsp1_subdev_enum_mbus_code(subdev, state, code, codes,
>  					  ARRAY_SIZE(codes));
>  }
>
> @@ -151,7 +151,7 @@ static int sru_enum_frame_size(struct v4l2_subdev *subdev,
>  }
>
>  static void sru_try_format(struct vsp1_sru *sru,
> -			   struct v4l2_subdev_state *sd_state,
> +			   struct v4l2_subdev_state *state,
>  			   unsigned int pad, struct v4l2_mbus_framefmt *fmt)
>  {
>  	struct v4l2_mbus_framefmt *format;
> @@ -171,7 +171,7 @@ static void sru_try_format(struct vsp1_sru *sru,
>
>  	case SRU_PAD_SOURCE:
>  		/* The SRU can't perform format conversion. */
> -		format = v4l2_subdev_state_get_format(sd_state, SRU_PAD_SINK);
> +		format = v4l2_subdev_state_get_format(state, SRU_PAD_SINK);
>  		fmt->code = format->code;
>
>  		/*
> @@ -240,7 +240,7 @@ static const struct v4l2_subdev_ops sru_ops = {
>   */
>
>  static void sru_configure_stream(struct vsp1_entity *entity,
> -				 struct v4l2_subdev_state *sd_state,
> +				 struct v4l2_subdev_state *state,
>  				 struct vsp1_pipeline *pipe,
>  				 struct vsp1_dl_list *dl,
>  				 struct vsp1_dl_body *dlb)
> @@ -251,8 +251,8 @@ static void sru_configure_stream(struct vsp1_entity *entity,
>  	struct v4l2_mbus_framefmt *output;
>  	u32 ctrl0;
>
> -	input = v4l2_subdev_state_get_format(sd_state, SRU_PAD_SINK);
> -	output = v4l2_subdev_state_get_format(sd_state, SRU_PAD_SOURCE);
> +	input = v4l2_subdev_state_get_format(state, SRU_PAD_SINK);
> +	output = v4l2_subdev_state_get_format(state, SRU_PAD_SOURCE);
>
>  	if (input->code == MEDIA_BUS_FMT_ARGB8888_1X32)
>  		ctrl0 = VI6_SRU_CTRL0_PARAM2 | VI6_SRU_CTRL0_PARAM3
> @@ -273,14 +273,14 @@ static void sru_configure_stream(struct vsp1_entity *entity,
>  }
>
>  static unsigned int sru_max_width(struct vsp1_entity *entity,
> -				  struct v4l2_subdev_state *sd_state,
> +				  struct v4l2_subdev_state *state,
>  				  struct vsp1_pipeline *pipe)
>  {
>  	struct v4l2_mbus_framefmt *input;
>  	struct v4l2_mbus_framefmt *output;
>
> -	input = v4l2_subdev_state_get_format(sd_state, SRU_PAD_SINK);
> -	output = v4l2_subdev_state_get_format(sd_state, SRU_PAD_SOURCE);
> +	input = v4l2_subdev_state_get_format(state, SRU_PAD_SINK);
> +	output = v4l2_subdev_state_get_format(state, SRU_PAD_SOURCE);
>
>  	/*
>  	 * The maximum input width of the SRU is 288 input pixels, but 32
> @@ -294,7 +294,7 @@ static unsigned int sru_max_width(struct vsp1_entity *entity,
>  }
>
>  static void sru_partition(struct vsp1_entity *entity,
> -			  struct v4l2_subdev_state *sd_state,
> +			  struct v4l2_subdev_state *state,
>  			  struct vsp1_pipeline *pipe,
>  			  struct vsp1_partition *partition,
>  			  unsigned int partition_idx,
> @@ -303,8 +303,8 @@ static void sru_partition(struct vsp1_entity *entity,
>  	struct v4l2_mbus_framefmt *input;
>  	struct v4l2_mbus_framefmt *output;
>
> -	input = v4l2_subdev_state_get_format(sd_state, SRU_PAD_SINK);
> -	output = v4l2_subdev_state_get_format(sd_state, SRU_PAD_SOURCE);
> +	input = v4l2_subdev_state_get_format(state, SRU_PAD_SINK);
> +	output = v4l2_subdev_state_get_format(state, SRU_PAD_SOURCE);
>
>  	/* Adapt if SRUx2 is enabled. */
>  	if (input->width != output->width) {
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_uds.c b/drivers/media/platform/renesas/vsp1/vsp1_uds.c
> index ddf624f30b92..e36720c41143 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_uds.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_uds.c
> @@ -111,7 +111,7 @@ static unsigned int uds_compute_ratio(unsigned int input, unsigned int output)
>   */
>
>  static int uds_enum_mbus_code(struct v4l2_subdev *subdev,
> -			      struct v4l2_subdev_state *sd_state,
> +			      struct v4l2_subdev_state *state,
>  			      struct v4l2_subdev_mbus_code_enum *code)
>  {
>  	static const unsigned int codes[] = {
> @@ -119,7 +119,7 @@ static int uds_enum_mbus_code(struct v4l2_subdev *subdev,
>  		MEDIA_BUS_FMT_AYUV8_1X32,
>  	};
>
> -	return vsp1_subdev_enum_mbus_code(subdev, sd_state, code, codes,
> +	return vsp1_subdev_enum_mbus_code(subdev, state, code, codes,
>  					  ARRAY_SIZE(codes));
>  }
>
> @@ -150,7 +150,7 @@ static int uds_enum_frame_size(struct v4l2_subdev *subdev,
>  }
>
>  static void uds_try_format(struct vsp1_uds *uds,
> -			   struct v4l2_subdev_state *sd_state,
> +			   struct v4l2_subdev_state *state,
>  			   unsigned int pad, struct v4l2_mbus_framefmt *fmt)
>  {
>  	struct v4l2_mbus_framefmt *format;
> @@ -170,7 +170,7 @@ static void uds_try_format(struct vsp1_uds *uds,
>
>  	case UDS_PAD_SOURCE:
>  		/* The UDS scales but can't perform format conversion. */
> -		format = v4l2_subdev_state_get_format(sd_state, UDS_PAD_SINK);
> +		format = v4l2_subdev_state_get_format(state, UDS_PAD_SINK);
>  		fmt->code = format->code;
>
>  		uds_output_limits(format->width, &minimum, &maximum);
> @@ -227,7 +227,7 @@ static const struct v4l2_subdev_ops uds_ops = {
>   */
>
>  static void uds_configure_stream(struct vsp1_entity *entity,
> -				 struct v4l2_subdev_state *sd_state,
> +				 struct v4l2_subdev_state *state,
>  				 struct vsp1_pipeline *pipe,
>  				 struct vsp1_dl_list *dl,
>  				 struct vsp1_dl_body *dlb)
> @@ -239,8 +239,8 @@ static void uds_configure_stream(struct vsp1_entity *entity,
>  	unsigned int vscale;
>  	bool multitap;
>
> -	input = v4l2_subdev_state_get_format(sd_state, UDS_PAD_SINK);
> -	output = v4l2_subdev_state_get_format(sd_state, UDS_PAD_SOURCE);
> +	input = v4l2_subdev_state_get_format(state, UDS_PAD_SINK);
> +	output = v4l2_subdev_state_get_format(state, UDS_PAD_SOURCE);
>
>  	hscale = uds_compute_ratio(input->width, output->width);
>  	vscale = uds_compute_ratio(input->height, output->height);
> @@ -296,15 +296,15 @@ static void uds_configure_partition(struct vsp1_entity *entity,
>  }
>
>  static unsigned int uds_max_width(struct vsp1_entity *entity,
> -				  struct v4l2_subdev_state *sd_state,
> +				  struct v4l2_subdev_state *state,
>  				  struct vsp1_pipeline *pipe)
>  {
>  	const struct v4l2_mbus_framefmt *output;
>  	const struct v4l2_mbus_framefmt *input;
>  	unsigned int hscale;
>
> -	input = v4l2_subdev_state_get_format(sd_state, UDS_PAD_SINK);
> -	output = v4l2_subdev_state_get_format(sd_state, UDS_PAD_SOURCE);
> +	input = v4l2_subdev_state_get_format(state, UDS_PAD_SINK);
> +	output = v4l2_subdev_state_get_format(state, UDS_PAD_SOURCE);
>  	hscale = output->width / input->width;
>
>  	/*
> @@ -330,7 +330,7 @@ static unsigned int uds_max_width(struct vsp1_entity *entity,
>   */
>
>  static void uds_partition(struct vsp1_entity *entity,
> -			  struct v4l2_subdev_state *sd_state,
> +			  struct v4l2_subdev_state *state,
>  			  struct vsp1_pipeline *pipe,
>  			  struct vsp1_partition *partition,
>  			  unsigned int partition_idx,
> @@ -339,8 +339,8 @@ static void uds_partition(struct vsp1_entity *entity,
>  	const struct v4l2_mbus_framefmt *output;
>  	const struct v4l2_mbus_framefmt *input;
>
> -	input = v4l2_subdev_state_get_format(sd_state, UDS_PAD_SINK);
> -	output = v4l2_subdev_state_get_format(sd_state, UDS_PAD_SOURCE);
> +	input = v4l2_subdev_state_get_format(state, UDS_PAD_SINK);
> +	output = v4l2_subdev_state_get_format(state, UDS_PAD_SOURCE);
>
>  	partition->uds_sink.width = window->width * input->width
>  				  / output->width;
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_uif.c b/drivers/media/platform/renesas/vsp1/vsp1_uif.c
> index 4361be5d91c4..9739fefa8260 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_uif.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_uif.c
> @@ -54,28 +54,28 @@ static const unsigned int uif_codes[] = {
>  };
>
>  static int uif_enum_mbus_code(struct v4l2_subdev *subdev,
> -			      struct v4l2_subdev_state *sd_state,
> +			      struct v4l2_subdev_state *state,
>  			      struct v4l2_subdev_mbus_code_enum *code)
>  {
> -	return vsp1_subdev_enum_mbus_code(subdev, sd_state, code, uif_codes,
> +	return vsp1_subdev_enum_mbus_code(subdev, state, code, uif_codes,
>  					  ARRAY_SIZE(uif_codes));
>  }
>
>  static int uif_enum_frame_size(struct v4l2_subdev *subdev,
> -			       struct v4l2_subdev_state *sd_state,
> +			       struct v4l2_subdev_state *state,
>  			       struct v4l2_subdev_frame_size_enum *fse)
>  {
> -	return vsp1_subdev_enum_frame_size(subdev, sd_state, fse,
> +	return vsp1_subdev_enum_frame_size(subdev, state, fse,
>  					   UIF_MIN_SIZE,
>  					   UIF_MIN_SIZE, UIF_MAX_SIZE,
>  					   UIF_MAX_SIZE);
>  }
>
>  static int uif_set_format(struct v4l2_subdev *subdev,
> -			    struct v4l2_subdev_state *sd_state,
> +			    struct v4l2_subdev_state *state,
>  			    struct v4l2_subdev_format *fmt)
>  {
> -	return vsp1_subdev_set_pad_format(subdev, sd_state, fmt, uif_codes,
> +	return vsp1_subdev_set_pad_format(subdev, state, fmt, uif_codes,
>  					  ARRAY_SIZE(uif_codes),
>  					  UIF_MIN_SIZE, UIF_MIN_SIZE,
>  					  UIF_MAX_SIZE, UIF_MAX_SIZE);
> @@ -161,7 +161,7 @@ static const struct v4l2_subdev_ops uif_ops = {
>   */
>
>  static void uif_configure_stream(struct vsp1_entity *entity,
> -				 struct v4l2_subdev_state *sd_state,
> +				 struct v4l2_subdev_state *state,
>  				 struct vsp1_pipeline *pipe,
>  				 struct vsp1_dl_list *dl,
>  				 struct vsp1_dl_body *dlb)
> @@ -174,7 +174,7 @@ static void uif_configure_stream(struct vsp1_entity *entity,
>  	vsp1_uif_write(uif, dlb, VI6_UIF_DISCOM_DOCMPMR,
>  		       VI6_UIF_DISCOM_DOCMPMR_SEL(9));
>
> -	crop = v4l2_subdev_state_get_crop(sd_state, UIF_PAD_SINK);
> +	crop = v4l2_subdev_state_get_crop(state, UIF_PAD_SINK);
>
>  	left = crop->left;
>  	width = crop->width;
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_wpf.c b/drivers/media/platform/renesas/vsp1/vsp1_wpf.c
> index 6ba0d57de890..8792b41f307a 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_wpf.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_wpf.c
> @@ -226,7 +226,7 @@ static int wpf_configure_writeback_chain(struct vsp1_rwpf *wpf,
>  }
>
>  static void wpf_configure_stream(struct vsp1_entity *entity,
> -				 struct v4l2_subdev_state *sd_state,
> +				 struct v4l2_subdev_state *state,
>  				 struct vsp1_pipeline *pipe,
>  				 struct vsp1_dl_list *dl,
>  				 struct vsp1_dl_body *dlb)
> @@ -241,8 +241,8 @@ static void wpf_configure_stream(struct vsp1_entity *entity,
>  	u32 srcrpf = 0;
>  	int ret;
>
> -	sink_format = v4l2_subdev_state_get_format(sd_state, RWPF_PAD_SINK);
> -	source_format = v4l2_subdev_state_get_format(sd_state, RWPF_PAD_SOURCE);
> +	sink_format = v4l2_subdev_state_get_format(state, RWPF_PAD_SINK);
> +	source_format = v4l2_subdev_state_get_format(state, RWPF_PAD_SOURCE);
>
>  	/* Format */
>  	if (!pipe->lif || wpf->writeback) {
> @@ -492,7 +492,7 @@ static void wpf_configure_partition(struct vsp1_entity *entity,
>  }
>
>  static unsigned int wpf_max_width(struct vsp1_entity *entity,
> -				  struct v4l2_subdev_state *sd_state,
> +				  struct v4l2_subdev_state *state,
>  				  struct vsp1_pipeline *pipe)
>  {
>  	struct vsp1_rwpf *wpf = to_rwpf(&entity->subdev);
> @@ -501,7 +501,7 @@ static unsigned int wpf_max_width(struct vsp1_entity *entity,
>  }
>
>  static void wpf_partition(struct vsp1_entity *entity,
> -			  struct v4l2_subdev_state *sd_state,
> +			  struct v4l2_subdev_state *state,
>  			  struct vsp1_pipeline *pipe,
>  			  struct vsp1_partition *partition,
>  			  unsigned int partition_idx,
> --
> Regards,
>
> Laurent Pinchart
>
>

