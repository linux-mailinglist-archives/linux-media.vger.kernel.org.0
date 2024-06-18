Return-Path: <linux-media+bounces-13510-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AF5A90C8B5
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2024 13:13:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E6C3328174F
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2024 11:13:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81D4920C5BB;
	Tue, 18 Jun 2024 09:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="KTujCQbV"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6532820C5AF;
	Tue, 18 Jun 2024 09:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718704726; cv=none; b=pfVcYg+OamZ3QhNWngfL+OCVS3sYozHMgo2+209T2lAJta0NjdzLX/zT/FGLWhhnVgPkSb2rHb74ZgdEkqTgO/3rFZXLAMjeJH6Agg50GAbIeUj0kJ3bcVfC9sjeDV/fJjUWfFt4EwKhvUrkuMoWQ09G7/guzy64reVAgWk7/hE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718704726; c=relaxed/simple;
	bh=Cqvz2nNrwc6Rgj49ukjeTY0BjYoeFD5Z2iHL1sbd8NE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZJCkymzWe6I0/QxHgdimqg/HeXtDkLkF6w8yg3rBx+ljnnP66o5X8bqu/jPxg3RlHLUjfsMLlSbXN5GEPvuXCzgY9IEc9aAeYQu+TV49lzxUE6Bll/AgufpBhfxo9Y65PJjH+JDpc5sDalIYEkyc3Z7eEuqSw+nCTgYGekWF/nY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=KTujCQbV; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0E067564;
	Tue, 18 Jun 2024 11:58:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718704705;
	bh=Cqvz2nNrwc6Rgj49ukjeTY0BjYoeFD5Z2iHL1sbd8NE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KTujCQbV3aKUfB6zbKs4HR75LUp+ZpzODyf1/IYeag5cRxJEhWl3Nmi5yRk9Dg3L0
	 1m9EbpsyBwrvtZB/4QotzqpZtMx7DM8/1X8qjpcDmL35lG/lsiHm0u0uvHpjkZMc4R
	 mNhQODExrTTmUzjd80BHlWNKdoGRDImKukw+cngI=
Date: Tue, 18 Jun 2024 11:58:40 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Sakari Ailus <sakari.ailus@iki.fi>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [RFC PATCH v1 03/19] media: renesas: vsp1: Drop
 vsp1_rwpf_get_crop() wrapper
Message-ID: <m4rm7jis6wc6eel6f4qkfpt2ublgd4ktji4d36wutfji5dsdbt@ntmwujeg35nd>
References: <20231122043009.2741-1-laurent.pinchart+renesas@ideasonboard.com>
 <20231122043009.2741-4-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231122043009.2741-4-laurent.pinchart+renesas@ideasonboard.com>

Hi Laurent

On Wed, Nov 22, 2023 at 06:29:53AM GMT, Laurent Pinchart wrote:
> From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>
> The vsp1_rwpf_get_crop() function is just a wrapper around
> v4l2_subdev_state_get_crop() without any added value. Drop it and call
> v4l2_subdev_state_get_crop() directly.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Thanks
  j

> ---
>  drivers/media/platform/renesas/vsp1/vsp1_rpf.c  |  2 +-
>  drivers/media/platform/renesas/vsp1/vsp1_rwpf.c | 12 +++---------
>  drivers/media/platform/renesas/vsp1/vsp1_rwpf.h |  3 ---
>  3 files changed, 4 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_rpf.c b/drivers/media/platform/renesas/vsp1/vsp1_rpf.c
> index 4efcec5253d6..3e62638fdce6 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_rpf.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_rpf.c
> @@ -298,7 +298,7 @@ static void rpf_configure_partition(struct vsp1_entity *entity,
>  	 * offsets are needed, as planes 2 and 3 always have identical
>  	 * strides.
>  	 */
> -	crop = *vsp1_rwpf_get_crop(rpf, rpf->entity.state);
> +	crop = *v4l2_subdev_state_get_crop(rpf->entity.state, RWPF_PAD_SINK);
>
>  	/*
>  	 * Partition Algorithm Control
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c b/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c
> index 574623a48a3d..9d38203e73d0 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c
> @@ -16,12 +16,6 @@
>  #define RWPF_MIN_WIDTH				1
>  #define RWPF_MIN_HEIGHT				1
>
> -struct v4l2_rect *vsp1_rwpf_get_crop(struct vsp1_rwpf *rwpf,
> -				     struct v4l2_subdev_state *sd_state)
> -{
> -	return v4l2_subdev_state_get_crop(sd_state, RWPF_PAD_SINK);
> -}
> -
>  /* -----------------------------------------------------------------------------
>   * V4L2 Subdevice Operations
>   */
> @@ -105,7 +99,7 @@ static int vsp1_rwpf_set_format(struct v4l2_subdev *subdev,
>  		struct v4l2_rect *crop;
>
>  		/* Update the sink crop rectangle. */
> -		crop = vsp1_rwpf_get_crop(rwpf, state);
> +		crop = v4l2_subdev_state_get_crop(state, RWPF_PAD_SINK);
>  		crop->left = 0;
>  		crop->top = 0;
>  		crop->width = fmt->format.width;
> @@ -152,7 +146,7 @@ static int vsp1_rwpf_get_selection(struct v4l2_subdev *subdev,
>
>  	switch (sel->target) {
>  	case V4L2_SEL_TGT_CROP:
> -		sel->r = *vsp1_rwpf_get_crop(rwpf, state);
> +		sel->r = *v4l2_subdev_state_get_crop(state, RWPF_PAD_SINK);
>  		break;
>
>  	case V4L2_SEL_TGT_CROP_BOUNDS:
> @@ -222,7 +216,7 @@ static int vsp1_rwpf_set_selection(struct v4l2_subdev *subdev,
>  	sel->r.height = min_t(unsigned int, sel->r.height,
>  			      format->height - sel->r.top);
>
> -	crop = vsp1_rwpf_get_crop(rwpf, state);
> +	crop = v4l2_subdev_state_get_crop(state, RWPF_PAD_SINK);
>  	*crop = sel->r;
>
>  	/* Propagate the format to the source pad. */
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_rwpf.h b/drivers/media/platform/renesas/vsp1/vsp1_rwpf.h
> index e0d212c70b2f..5ac9f0a6fafc 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_rwpf.h
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_rwpf.h
> @@ -85,7 +85,4 @@ int vsp1_rwpf_init_ctrls(struct vsp1_rwpf *rwpf, unsigned int ncontrols);
>
>  extern const struct v4l2_subdev_ops vsp1_rwpf_subdev_ops;
>
> -struct v4l2_rect *vsp1_rwpf_get_crop(struct vsp1_rwpf *rwpf,
> -				     struct v4l2_subdev_state *sd_state);
> -
>  #endif /* __VSP1_RWPF_H__ */
> --
> Regards,
>
> Laurent Pinchart
>
>

