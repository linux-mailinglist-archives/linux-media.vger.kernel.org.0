Return-Path: <linux-media+bounces-13528-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C8D890CA49
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2024 13:50:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 905F829066B
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2024 11:50:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CC5C74E11;
	Tue, 18 Jun 2024 11:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="sKqTwHS/"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9934817C8;
	Tue, 18 Jun 2024 11:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718709819; cv=none; b=kKh0GraIJaMwdKWLK2jpUkr3Ejgwm2QDvFMF9ojPYzvHAmhGmkMkjXINQg34haHZyT9dONsJWHWmaOqaxoMOw4GYKy1lQcag5tvOKO2gFtqkPvbkE6maP5TzYdBIE2wQt1QSyrp8NQenfGQyTD9/Vvevi+N1PZnbN3pjOYS0C3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718709819; c=relaxed/simple;
	bh=NNHzNKLClWwfGDAInMczbJZ+2tSeGgfB3hlvbo3N3uU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E01WTkGQU/9pAV35evb639TReYcgejrfCGql4YRix/kpySIZbnQQVX0u/fZGBZRJ09rXswJ3u8lqrhwNe8ZbKtnSdSohQLaVtG7sEx+B+c2aweHu1GO9IEDP+F8WvCJ6qv7GrWurzrIoBJtgg7QQR6CyYepgt3IjhX1iUWP2o1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=sKqTwHS/; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6ADA27E1;
	Tue, 18 Jun 2024 13:23:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718709798;
	bh=NNHzNKLClWwfGDAInMczbJZ+2tSeGgfB3hlvbo3N3uU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sKqTwHS/WY04+yfGyItYoz6fb/hcEEqSeRO9xc7jMK8gN+UAJi5acJaGuJkUUtsF/
	 lB8oYzu99hnQa8acbXAlUfgVWyIQZAKWqJ3W2tD1MTQXmGjn8n4ssA/91Itvt37o/t
	 pPaDmr4w7J5PETYvNLkWUFOVtI6A2/2bw6N041JM=
Date: Tue, 18 Jun 2024 13:23:33 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Sakari Ailus <sakari.ailus@iki.fi>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [RFC PATCH v1 14/19] media: renesas: vsp1: Get configuration
 from partition instead of state
Message-ID: <6ixii6fdmkpwmqr3a2w3otiml5jcev2vvlbwzjiktu7ry5akh6@f3qssur6yd7z>
References: <20231122043009.2741-1-laurent.pinchart+renesas@ideasonboard.com>
 <20231122043009.2741-15-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231122043009.2741-15-laurent.pinchart+renesas@ideasonboard.com>

Hi Laurent

On Wed, Nov 22, 2023 at 06:30:04AM GMT, Laurent Pinchart wrote:
> Entities access various piece of information from the entity state when

s/entity state/subdev state/

> configuring a partition. The same data is available through the
> partition structure passed to the .configure_partition() operation. Use
> it to avoid accessing the state, which will simplify moving to the V4L2
> subdev active state API.

I would move this after 10/19 and possibily considering squashing the
two. The overall diff of the 2 patches combined is pretty understandable.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  .../media/platform/renesas/vsp1/vsp1_rpf.c    | 35 +++++++++----------
>  .../media/platform/renesas/vsp1/vsp1_uds.c    |  6 +---
>  .../media/platform/renesas/vsp1/vsp1_wpf.c    | 18 +++-------
>  3 files changed, 23 insertions(+), 36 deletions(-)
>
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_rpf.c b/drivers/media/platform/renesas/vsp1/vsp1_rpf.c
> index 862751616646..b4558670b46f 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_rpf.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_rpf.c
> @@ -289,7 +289,7 @@ static void rpf_configure_partition(struct vsp1_entity *entity,
>  	struct vsp1_device *vsp1 = rpf->entity.vsp1;
>  	const struct vsp1_format_info *fmtinfo = rpf->fmtinfo;
>  	const struct v4l2_pix_format_mplane *format = &rpf->format;
> -	struct v4l2_rect crop;
> +	struct v4l2_rect crop = partition->rpf[rpf->entity.index];
>
>  	/*
>  	 * Source size and crop offsets.
> @@ -299,22 +299,6 @@ static void rpf_configure_partition(struct vsp1_entity *entity,
>  	 * offsets are needed, as planes 2 and 3 always have identical
>  	 * strides.
>  	 */
> -	crop = *v4l2_subdev_state_get_crop(rpf->entity.state, RWPF_PAD_SINK);
> -
> -	/*
> -	 * Partition Algorithm Control
> -	 *
> -	 * The partition algorithm can split this frame into multiple
> -	 * slices. We must scale our partition window based on the pipe
> -	 * configuration to match the destination partition window.
> -	 * To achieve this, we adjust our crop to provide a 'sub-crop'
> -	 * matching the expected partition window. Only 'left' and
> -	 * 'width' need to be adjusted.
> -	 */
> -	if (pipe->partitions > 1) {
> -		crop.width = partition->rpf[rpf->entity.index].width;
> -		crop.left += partition->rpf[rpf->entity.index].left;
> -	}
>
>  	if (pipe->interlaced) {
>  		crop.height = round_down(crop.height / 2, fmtinfo->vsub);
> @@ -369,8 +353,23 @@ static void rpf_partition(struct vsp1_entity *entity,
>  			  struct v4l2_rect *window)
>  {
>  	struct vsp1_rwpf *rpf = to_rwpf(&entity->subdev);
> +	struct v4l2_rect *rpf_rect = &partition->rpf[rpf->entity.index];
>
> -	partition->rpf[rpf->entity.index] = *window;
> +	/*
> +	 * Partition Algorithm Control
> +	 *
> +	 * The partition algorithm can split this frame into multiple slices. We
> +	 * must adjust our partition window based on the pipe configuration to
> +	 * match the destination partition window. To achieve this, we adjust
> +	 * our crop to provide a 'sub-crop' matching the expected partition
> +	 * window.
> +	 */
> +	*rpf_rect = *v4l2_subdev_state_get_crop(entity->state, RWPF_PAD_SINK);
> +
> +	if (pipe->partitions > 1) {
> +		rpf_rect->width = window->width;
> +		rpf_rect->left += window->left;
> +	}
>  }
>
>  static const struct vsp1_entity_operations rpf_entity_ops = {
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_uds.c b/drivers/media/platform/renesas/vsp1/vsp1_uds.c
> index 4a14fd3baac1..e5953d86c17c 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_uds.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_uds.c
> @@ -305,10 +305,6 @@ static void uds_configure_partition(struct vsp1_entity *entity,
>  				    struct vsp1_dl_body *dlb)
>  {
>  	struct vsp1_uds *uds = to_uds(&entity->subdev);
> -	const struct v4l2_mbus_framefmt *output;
> -
> -	output = v4l2_subdev_state_get_format(uds->entity.state,
> -					      UDS_PAD_SOURCE);
>
>  	/* Input size clipping. */
>  	vsp1_uds_write(uds, dlb, VI6_UDS_HSZCLIP, VI6_UDS_HSZCLIP_HCEN |
> @@ -320,7 +316,7 @@ static void uds_configure_partition(struct vsp1_entity *entity,
>  	vsp1_uds_write(uds, dlb, VI6_UDS_CLIP_SIZE,
>  		       (partition->uds_source.width
>  				<< VI6_UDS_CLIP_SIZE_HSIZE_SHIFT) |
> -		       (output->height
> +		       (partition->uds_source.height

As I read this 'output' used to be the current format on the sink pad
and we use the height from there.

Now we use 'patrition->uds_source.height' which I read being
initialized in uds_partition() to:

	partition->uds_source = *window;

With 'window' being the parameter passed to uds_partition().

Is this correct ?

>  				<< VI6_UDS_CLIP_SIZE_VSIZE_SHIFT));
>  }
>
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_wpf.c b/drivers/media/platform/renesas/vsp1/vsp1_wpf.c
> index f8d1e2f47691..5c363ff1d36c 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_wpf.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_wpf.c
> @@ -370,7 +370,6 @@ static void wpf_configure_partition(struct vsp1_entity *entity,
>  	struct vsp1_rwpf *wpf = to_rwpf(&entity->subdev);
>  	struct vsp1_device *vsp1 = wpf->entity.vsp1;
>  	struct vsp1_rwpf_memory mem = wpf->mem;
> -	const struct v4l2_mbus_framefmt *sink_format;
>  	const struct v4l2_pix_format_mplane *format = &wpf->format;
>  	const struct vsp1_format_info *fmtinfo = wpf->fmtinfo;
>  	unsigned int width;
> @@ -380,20 +379,13 @@ static void wpf_configure_partition(struct vsp1_entity *entity,
>  	unsigned int flip;
>  	unsigned int i;
>
> -	sink_format = v4l2_subdev_state_get_format(wpf->entity.state,
> -						   RWPF_PAD_SINK);
> -	width = sink_format->width;
> -	height = sink_format->height;
> -	left = 0;
> -
>  	/*
> -	 * Cropping. The partition algorithm can split the image into
> -	 * multiple slices.
> +	 * Cropping. The partition algorithm can split the image into multiple
> +	 * slices.
>  	 */
> -	if (pipe->partitions > 1) {
> -		width = partition->wpf.width;
> -		left = partition->wpf.left;
> -	}
> +	width = partition->wpf.width;
> +	left = partition->wpf.left;
> +	height = partition->wpf.height;

Same question as per the uds module

Thanks
  j

>
>  	vsp1_wpf_write(wpf, dlb, VI6_WPF_HSZCLIP, VI6_WPF_SZCLIP_EN |
>  		       (0 << VI6_WPF_SZCLIP_OFST_SHIFT) |
> --
> Regards,
>
> Laurent Pinchart
>
>

