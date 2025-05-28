Return-Path: <linux-media+bounces-33535-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B609AC6C77
	for <lists+linux-media@lfdr.de>; Wed, 28 May 2025 17:06:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 92B723AA1AE
	for <lists+linux-media@lfdr.de>; Wed, 28 May 2025 15:05:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3180028B4FC;
	Wed, 28 May 2025 15:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="mphqvwv1"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25EAA286898;
	Wed, 28 May 2025 15:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748444773; cv=none; b=EAFPBwTD8TvqaLE1peRhD18xYA9xE/aR+LUPkjzZQ9UnhY5eSVd1TSXcOHRF2b4REIiMNpQbcanvyY0if5hCXPbiU/9RYH7HDUbZ6twAasmR//397wbcEsglHGj1djzHPOI8ut57NFfvJUwsPDNj0WyJqm/p9csNKGZCUlB0jFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748444773; c=relaxed/simple;
	bh=duUiFtXaUSateOiV7jP//tXBHZXn+BnoXm+5uWm4fho=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TTt1NLaQwIczSJ0qn+iJk6mIC2eBRzsjsTBpK5tcad//fK/Kk6wdLkb2GnicLKpKnu3yrOxQgv+k0z9ND84F/+oeUOM9j4S5/aJOar5on6gz0zlDkbmCWGmAh9e27Ap2pidpIlXdDzGHOQpsEdgS4xSZ7QZQBXxousSBFbU6FJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=mphqvwv1; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (mob-5-90-143-118.net.vodafone.it [5.90.143.118])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4DA98D0;
	Wed, 28 May 2025 17:05:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1748444742;
	bh=duUiFtXaUSateOiV7jP//tXBHZXn+BnoXm+5uWm4fho=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mphqvwv1dnXd2+rdxSDCWfWnRGVwstfIsp+gyvK9yXzn/BxtlE8q0SbzBxCCg7/eL
	 PICrNnRE0rQXIVd1UvJKodzqIx2r6bHGNnoCTj/BevlS4nahYca1V3sH4H2AA79ChN
	 748i7Gtkki/KvOa0htO2NXR+y1wGBQr+8m2LOuc4=
Date: Wed, 28 May 2025 17:06:05 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH 7/7] media: renesas: vsp1: Implement control events
Message-ID: <xqxmi6exvtmlhjtfti2thgdkgrpy673vvl5v4cfz2q25bsfzt6@cnhg7p4aaqmm>
References: <20250429235322.29826-1-laurent.pinchart+renesas@ideasonboard.com>
 <20250429235322.29826-8-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250429235322.29826-8-laurent.pinchart+renesas@ideasonboard.com>

Hi Laurent

On Wed, Apr 30, 2025 at 02:53:22AM +0300, Laurent Pinchart wrote:
> The V4L2 API requires drivers that expose controls to implement control
> notification events. This is enforced by v4l2-compliance. Add event
> handling to the VSP1 entities that create controls to fix the compliance
> failures.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Thanks
  j

> ---
>  drivers/media/platform/renesas/vsp1/vsp1_brx.c    | 1 +
>  drivers/media/platform/renesas/vsp1/vsp1_clu.c    | 1 +
>  drivers/media/platform/renesas/vsp1/vsp1_entity.c | 9 +++++++++
>  drivers/media/platform/renesas/vsp1/vsp1_entity.h | 2 ++
>  drivers/media/platform/renesas/vsp1/vsp1_histo.c  | 1 +
>  drivers/media/platform/renesas/vsp1/vsp1_lut.c    | 1 +
>  drivers/media/platform/renesas/vsp1/vsp1_rwpf.c   | 1 +
>  drivers/media/platform/renesas/vsp1/vsp1_sru.c    | 1 +
>  8 files changed, 17 insertions(+)
>
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_brx.c b/drivers/media/platform/renesas/vsp1/vsp1_brx.c
> index 911359faa600..b1a2c68e9944 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_brx.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_brx.c
> @@ -269,6 +269,7 @@ static const struct v4l2_subdev_pad_ops brx_pad_ops = {
>  };
>
>  static const struct v4l2_subdev_ops brx_ops = {
> +	.core	= &vsp1_entity_core_ops,
>  	.pad    = &brx_pad_ops,
>  };
>
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_clu.c b/drivers/media/platform/renesas/vsp1/vsp1_clu.c
> index a56c038a2c71..04c466c4da81 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_clu.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_clu.c
> @@ -130,6 +130,7 @@ static const struct v4l2_subdev_pad_ops clu_pad_ops = {
>  };
>
>  static const struct v4l2_subdev_ops clu_ops = {
> +	.core	= &vsp1_entity_core_ops,
>  	.pad    = &clu_pad_ops,
>  };
>
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_entity.c b/drivers/media/platform/renesas/vsp1/vsp1_entity.c
> index a3d4bf2887ec..27c172788621 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_entity.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_entity.c
> @@ -12,6 +12,7 @@
>
>  #include <media/media-entity.h>
>  #include <media/v4l2-ctrls.h>
> +#include <media/v4l2-event.h>
>  #include <media/v4l2-subdev.h>
>
>  #include "vsp1.h"
> @@ -389,6 +390,11 @@ static const struct v4l2_subdev_internal_ops vsp1_entity_internal_ops = {
>  	.init_state = vsp1_entity_init_state,
>  };
>
> +const struct v4l2_subdev_core_ops vsp1_entity_core_ops = {
> +	.subscribe_event = v4l2_ctrl_subdev_subscribe_event,
> +	.unsubscribe_event = v4l2_event_subdev_unsubscribe,
> +};
> +
>  /* -----------------------------------------------------------------------------
>   * Media Operations
>   */
> @@ -629,6 +635,9 @@ int vsp1_entity_init(struct vsp1_device *vsp1, struct vsp1_entity *entity,
>  	subdev->entity.ops = &vsp1->media_ops;
>  	subdev->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
>
> +	if (ops->core == &vsp1_entity_core_ops)
> +		subdev->flags |= V4L2_SUBDEV_FL_HAS_EVENTS;
> +
>  	snprintf(subdev->name, sizeof(subdev->name), "%s %s",
>  		 dev_name(vsp1->dev), name);
>
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_entity.h b/drivers/media/platform/renesas/vsp1/vsp1_entity.h
> index 5542f6446b16..626fb1d5d470 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_entity.h
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_entity.h
> @@ -142,6 +142,8 @@ static inline struct vsp1_entity *to_vsp1_entity(struct v4l2_subdev *subdev)
>  	return container_of(subdev, struct vsp1_entity, subdev);
>  }
>
> +extern const struct v4l2_subdev_core_ops vsp1_entity_core_ops;
> +
>  int vsp1_entity_init(struct vsp1_device *vsp1, struct vsp1_entity *entity,
>  		     const char *name, unsigned int num_pads,
>  		     const struct v4l2_subdev_ops *ops, u32 function);
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_histo.c b/drivers/media/platform/renesas/vsp1/vsp1_histo.c
> index a1b3671a0873..158d01aa5e81 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_histo.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_histo.c
> @@ -370,6 +370,7 @@ static const struct v4l2_subdev_pad_ops histo_pad_ops = {
>  };
>
>  static const struct v4l2_subdev_ops histo_ops = {
> +	.core	= &vsp1_entity_core_ops,
>  	.pad    = &histo_pad_ops,
>  };
>
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_lut.c b/drivers/media/platform/renesas/vsp1/vsp1_lut.c
> index 2ec4d596465d..94bdedcc5c92 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_lut.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_lut.c
> @@ -106,6 +106,7 @@ static const struct v4l2_subdev_pad_ops lut_pad_ops = {
>  };
>
>  static const struct v4l2_subdev_ops lut_ops = {
> +	.core	= &vsp1_entity_core_ops,
>  	.pad    = &lut_pad_ops,
>  };
>
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c b/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c
> index bd97fc75eb5b..32b018e21f57 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c
> @@ -351,6 +351,7 @@ static const struct v4l2_subdev_pad_ops vsp1_rwpf_pad_ops = {
>  };
>
>  const struct v4l2_subdev_ops vsp1_rwpf_subdev_ops = {
> +	.core	= &vsp1_entity_core_ops,
>  	.pad    = &vsp1_rwpf_pad_ops,
>  };
>
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_sru.c b/drivers/media/platform/renesas/vsp1/vsp1_sru.c
> index e821eac1cbc2..30b482a160c2 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_sru.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_sru.c
> @@ -250,6 +250,7 @@ static const struct v4l2_subdev_pad_ops sru_pad_ops = {
>  };
>
>  static const struct v4l2_subdev_ops sru_ops = {
> +	.core	= &vsp1_entity_core_ops,
>  	.pad    = &sru_pad_ops,
>  };
>
> --
> Regards,
>
> Laurent Pinchart
>
>

