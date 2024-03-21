Return-Path: <linux-media+bounces-7533-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E10F4885FEC
	for <lists+linux-media@lfdr.de>; Thu, 21 Mar 2024 18:39:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 964231F25DF2
	for <lists+linux-media@lfdr.de>; Thu, 21 Mar 2024 17:39:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5216F12BF3E;
	Thu, 21 Mar 2024 17:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="EjzhPX2Q"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06E7F8624C
	for <linux-media@vger.kernel.org>; Thu, 21 Mar 2024 17:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711042783; cv=none; b=P9ejFdiU3fbS9TBzBH590VkP8cpA8CSy1ePvqVVaZ61vw/TIBbePyiNmjSeXud0Vuz061IjwRCEnaZIPbm4Yi5tRUPgjDcQcpXlhMz9Ihwm6qhS+g+TItAAdvskH1SwCfHyQdARJebHbH6f/Qva5qPRfkRF/VGP/fp0QxV47Si4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711042783; c=relaxed/simple;
	bh=JGWYXT6FpVUtskuw7jYaOF/pSAZxOnRaJ5QIkuTYhJg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JlJBfvJgCbY8kpd1W1gXQV/ocWhWNlboizvqTURlFkz8HGMS7MXK+YXm2dMt6pinfO4og2IpvRqmMds9g1skEhIEioZH+gEbQwKOrdS+T+n6S1mgUqL68iKy9LX8FBlDzsnlFzzoQuWIm4raXtnlmmNR47opR0fLo2iIr/XkoAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=EjzhPX2Q; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 710042B3;
	Thu, 21 Mar 2024 18:39:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1711042752;
	bh=JGWYXT6FpVUtskuw7jYaOF/pSAZxOnRaJ5QIkuTYhJg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EjzhPX2Q1owqcwPV99PzBdD4jaBgM+pND/DMZWxdheF9KDbREAW3MRer2BRLqLPv2
	 TDzwF6pRDpFeNHwe+0E8wO6ZxJf4A1NtgHf1XYx9gvxaIm0BYuBl8+VFpaRcFSBavi
	 RVldBGpujWy7Z0HJHPtia8A2+TrAJ+AkPL1FJL1g=
Date: Thu, 21 Mar 2024 19:39:37 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, tomi.valkeinen@ideasonboard.com,
	bingbu.cao@intel.com, hongju.wang@intel.com, hverkuil@xs4all.nl,
	Andrey Konovalov <andrey.konovalov@linaro.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Dmitry Perchanov <dmitry.perchanov@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Alain Volmat <alain.volmat@foss.st.com>
Subject: Re: [PATCH v8 29/38] media: ccs: Remove which parameter from
 ccs_propagate
Message-ID: <20240321173937.GP9582@pendragon.ideasonboard.com>
References: <20240313072516.241106-1-sakari.ailus@linux.intel.com>
 <20240313072516.241106-30-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240313072516.241106-30-sakari.ailus@linux.intel.com>

Hi Sakari,

Thank you for the patch.

On Wed, Mar 13, 2024 at 09:25:07AM +0200, Sakari Ailus wrote:
> ccs_propagate() no longer stores information in the driver's context
> struct. The which parameter can thus be removed.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/media/i2c/ccs/ccs-core.c | 12 +++++-------
>  1 file changed, 5 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
> index a147dbb9f362..838daab212f2 100644
> --- a/drivers/media/i2c/ccs/ccs-core.c
> +++ b/drivers/media/i2c/ccs/ccs-core.c
> @@ -2304,8 +2304,7 @@ static int ccs_get_format(struct v4l2_subdev *subdev,
>  
>  /* Changes require propagation only on sink pad. */
>  static void ccs_propagate(struct v4l2_subdev *subdev,
> -			  struct v4l2_subdev_state *sd_state, int which,
> -			  int target)
> +			  struct v4l2_subdev_state *sd_state, int target)
>  {
>  	struct ccs_subdev *ssd = to_ccs_subdev(subdev);
>  	struct v4l2_rect *comp, *crop;
> @@ -2512,7 +2511,7 @@ static int ccs_set_format(struct v4l2_subdev *subdev,
>  	crop->top = 0;
>  	crop->width = fmt->format.width;
>  	crop->height = fmt->format.height;
> -	ccs_propagate(subdev, sd_state, fmt->which, V4L2_SEL_TGT_CROP);
> +	ccs_propagate(subdev, sd_state, V4L2_SEL_TGT_CROP);
>  
>  	return 0;
>  }
> @@ -2727,7 +2726,7 @@ static int ccs_set_compose(struct v4l2_subdev *subdev,
>  		ccs_set_compose_scaler(subdev, sd_state, sel, sink_crop, comp);
>  
>  	*comp = sel->r;
> -	ccs_propagate(subdev, sd_state, sel->which, V4L2_SEL_TGT_COMPOSE);
> +	ccs_propagate(subdev, sd_state, V4L2_SEL_TGT_COMPOSE);
>  
>  	if (sel->which == V4L2_SUBDEV_FORMAT_ACTIVE)
>  		return ccs_pll_blanking_update(sensor);
> @@ -2817,7 +2816,7 @@ static int ccs_set_crop(struct v4l2_subdev *subdev,
>  	*crop = sel->r;
>  
>  	if (ssd != sensor->pixel_array && sel->pad == CCS_PAD_SINK)
> -		ccs_propagate(subdev, sd_state, sel->which, V4L2_SEL_TGT_CROP);
> +		ccs_propagate(subdev, sd_state, V4L2_SEL_TGT_CROP);
>  
>  	return 0;
>  }
> @@ -3339,7 +3338,6 @@ static int ccs_init_state(struct v4l2_subdev *sd,
>  		v4l2_subdev_state_get_format(sd_state, pad, CCS_STREAM_PIXEL);
>  	struct v4l2_rect *crop =
>  		v4l2_subdev_state_get_crop(sd_state, pad, CCS_STREAM_PIXEL);
> -	bool is_active = !sd->active_state || sd->active_state == sd_state;
>  
>  	ccs_get_native_size(ssd, crop);
>  
> @@ -3357,7 +3355,7 @@ static int ccs_init_state(struct v4l2_subdev *sd,
>  		sensor->csi_format->code : sensor->internal_csi_format->code;
>  	fmt->field = V4L2_FIELD_NONE;
>  
> -	ccs_propagate(sd, sd_state, is_active, V4L2_SEL_TGT_CROP);
> +	ccs_propagate(sd, sd_state, V4L2_SEL_TGT_CROP);
>  
>  	return 0;
>  }

-- 
Regards,

Laurent Pinchart

