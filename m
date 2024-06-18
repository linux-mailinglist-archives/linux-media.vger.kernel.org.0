Return-Path: <linux-media+bounces-13511-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EB6AD90C8B8
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2024 13:13:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 989CD285675
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2024 11:13:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD3551AD481;
	Tue, 18 Jun 2024 10:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ldzvAATI"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C927F158A20;
	Tue, 18 Jun 2024 10:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718704803; cv=none; b=pAW+4k88omiqR7tzSoLgEJc6zzNoq6KXa91w4UBw2MoqSGHIyueW6+idk6pUOX+VwVmV562+7S7KC20RkwtQy01vIi6hzH35XFIPVM+0BH9Nq2HWMt8StsAlQuJNMyQR1CVkQ/q41moTjB6OrHOCubgpuGsm8JseyB88+DGFURQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718704803; c=relaxed/simple;
	bh=gOksFzGUFU+cBumxtm8iGlbqGQrllsZ6cQJQVlLp6S0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IkWmBtT6O7tJV3S56cUxfbutwZvpeBEdhRvkrSPLf0WrgTHmYo0ZFdKamMGK9Oex0N7f+SirSCQcVkom+MBL8l3UpyRag4QZQV0bIzl4B7Ajx/RYTytMMHsg2QWPbTFX6HwTxFFNO87tZts0BGsEzOQM7Dsto9VJWhEk8zLjumk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ldzvAATI; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id CA47B564;
	Tue, 18 Jun 2024 11:59:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718704782;
	bh=gOksFzGUFU+cBumxtm8iGlbqGQrllsZ6cQJQVlLp6S0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ldzvAATI6HClnoqjycl1k5U40OAnJldH6Lbg2nPCA98lE34oAZfzUdSsQ4/qA4taI
	 b+bVMrWcydYyUvtCNcHwSuSMwGkdWzLiOwt86YqaFSmo169AtER1DvDCMax2qGH8Bw
	 iTIun6XgvEmhc8wFrojKucjonYAHq8tQ9RpnJpQ4=
Date: Tue, 18 Jun 2024 11:59:57 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Sakari Ailus <sakari.ailus@iki.fi>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [RFC PATCH v1 04/19] media: renesas: vsp1: Drop
 brx_get_compose() wrapper
Message-ID: <j2rmeiug46xvakomhqwyeieo32xgh5v5pvpx6lsk5bpig5xfon@osj5puw7jljl>
References: <20231122043009.2741-1-laurent.pinchart+renesas@ideasonboard.com>
 <20231122043009.2741-5-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231122043009.2741-5-laurent.pinchart+renesas@ideasonboard.com>

Hi Laurent

On Wed, Nov 22, 2023 at 06:29:54AM GMT, Laurent Pinchart wrote:
> From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>
> The brx_get_compose() function is just a wrapper around
> v4l2_subdev_state_get_compose() without any added value. Drop it and
> call v4l2_subdev_state_get_compose() directly.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Thanks
  j

> ---
>  drivers/media/platform/renesas/vsp1/vsp1_brx.c | 13 +++----------
>  1 file changed, 3 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_brx.c b/drivers/media/platform/renesas/vsp1/vsp1_brx.c
> index 0eb4d8fe4285..05940d0427bf 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_brx.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_brx.c
> @@ -96,13 +96,6 @@ static int brx_enum_frame_size(struct v4l2_subdev *subdev,
>  	return 0;
>  }
>
> -static struct v4l2_rect *brx_get_compose(struct vsp1_brx *brx,
> -					 struct v4l2_subdev_state *sd_state,
> -					 unsigned int pad)
> -{
> -	return v4l2_subdev_state_get_compose(sd_state, pad);
> -}
> -
>  static void brx_try_format(struct vsp1_brx *brx,
>  			   struct v4l2_subdev_state *sd_state,
>  			   unsigned int pad, struct v4l2_mbus_framefmt *fmt)
> @@ -157,7 +150,7 @@ static int brx_set_format(struct v4l2_subdev *subdev,
>  	if (fmt->pad != brx->entity.source_pad) {
>  		struct v4l2_rect *compose;
>
> -		compose = brx_get_compose(brx, state, fmt->pad);
> +		compose = v4l2_subdev_state_get_compose(state, fmt->pad);
>  		compose->left = 0;
>  		compose->top = 0;
>  		compose->width = format->width;
> @@ -204,7 +197,7 @@ static int brx_get_selection(struct v4l2_subdev *subdev,
>  			return -EINVAL;
>
>  		mutex_lock(&brx->entity.lock);
> -		sel->r = *brx_get_compose(brx, state, sel->pad);
> +		sel->r = *v4l2_subdev_state_get_compose(state, sel->pad);
>  		mutex_unlock(&brx->entity.lock);
>  		return 0;
>
> @@ -253,7 +246,7 @@ static int brx_set_selection(struct v4l2_subdev *subdev,
>  	sel->r.width = format->width;
>  	sel->r.height = format->height;
>
> -	compose = brx_get_compose(brx, state, sel->pad);
> +	compose = v4l2_subdev_state_get_compose(state, sel->pad);
>  	*compose = sel->r;
>
>  done:
> --
> Regards,
>
> Laurent Pinchart
>
>

