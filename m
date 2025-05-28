Return-Path: <linux-media+bounces-33532-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C9610AC6C3F
	for <lists+linux-media@lfdr.de>; Wed, 28 May 2025 16:50:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E599B3A17B2
	for <lists+linux-media@lfdr.de>; Wed, 28 May 2025 14:49:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 112B028B3F6;
	Wed, 28 May 2025 14:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="CRRa6qxD"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBF99283FE2;
	Wed, 28 May 2025 14:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748443797; cv=none; b=G2gCgpm3PHRu4u/OFbr02ziQaY1kvvUYAapwRXkDrR9hGSSdca2bXtJGgC+0+O8myGyydfy0+ty9n7iEOpstcmZrsdaxW179dwMpCE5QPjYdWmLSla+MlaeReEFSyCV18LQKTWkyCmf8IIto3WC3wy+j4unj4ixmd6Ld0kDmYIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748443797; c=relaxed/simple;
	bh=Cuh/6R44KGsTlla1BgN0c1S59isCCVvH3FVbhM5UVjw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dZ/n1H2KrAGSERB2h86KKHnr4i2B7JcemBWnAx/RuvztoI9QcrXAuM8XjYk+0ew8CyBrbFkt80ew04h9xWzJhaxwt+ohs8cZsl7eAp7oRNACKX7h8j2I7JtuI2PFPX8sGIFQ1vzwCbE9SW7fp8ztx6DqBwV8pCN+2I4oTq0oFIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=CRRa6qxD; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (mob-5-90-143-118.net.vodafone.it [5.90.143.118])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id CE50AFE;
	Wed, 28 May 2025 16:49:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1748443768;
	bh=Cuh/6R44KGsTlla1BgN0c1S59isCCVvH3FVbhM5UVjw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CRRa6qxDYBDviyBDbRw0t5CsuflevJyXSWCZE1JUsZci3bnLw5xxNx2jqWhytWld0
	 RMuZflp8wzc1ZMQI/CJwO6ZV4rbWXJ3aspeUjevJUkm3MeQsb7u4/za6FQt21ftl+J
	 YAYeK270fsNy+485gS1V2atSm+8iB9sqgL5UHgZA=
Date: Wed, 28 May 2025 16:49:50 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH 4/7] media: renesas: vsp1: Fix RPF sink alignment for YUV
 formats
Message-ID: <cjzbwptea7hee67jcf5mtzolunqo33vvr47a7elb4kdzlbzdmf@e54d5mwqep4a>
References: <20250429235322.29826-1-laurent.pinchart+renesas@ideasonboard.com>
 <20250429235322.29826-5-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250429235322.29826-5-laurent.pinchart+renesas@ideasonboard.com>

Hi Laurent

On Wed, Apr 30, 2025 at 02:53:19AM +0300, Laurent Pinchart wrote:
> When reading YUV formats from memory, the hardware requires the crop
> rectangle size and position to be aligned to multiples of two, depending
> on the horizontal and vertical subsampling factors. The driver doesn't
> enforce this, leading to incorrect operation.
>
> As the crop rectangle is implemented on the RPF subdev's sink pad,
> enforcing the constraint conditionally based on the subsampling factors
> is difficult, as those are only known by the RPF video device. We could
> perform the check at pipeline validation time, but that could lead to
> confusing -EPIPE errors. As there is very few use cases for odd crop
> offsets and sizes with non-subsampled YUV, take the easier and more
> user-friendly route of enforcing the constraint on all YUV formats.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  .../media/platform/renesas/vsp1/vsp1_rwpf.c   | 41 ++++++++++++-------
>  1 file changed, 26 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c b/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c
> index 83ff2c266038..61f7e13ebeee 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c
> @@ -117,6 +117,17 @@ static int vsp1_rwpf_set_format(struct v4l2_subdev *subdev,
>  				RWPF_MIN_WIDTH, rwpf->entity.max_width);
>  	format->height = clamp_t(unsigned int, fmt->format.height,
>  				 RWPF_MIN_HEIGHT, rwpf->entity.max_height);
> +
> +	/*
> +	 * For YUV formats on the RPF, restrict the size to multiples of 2 to
> +	 * avoid shifting the color plane.
> +	 */
> +	if (rwpf->entity.type == VSP1_ENTITY_RPF &&
> +	    format->code == MEDIA_BUS_FMT_AYUV8_1X32) {
> +		format->width = ALIGN(format->width, 2);
> +		format->height = ALIGN(format->height, 2);

ALIGN aligns up right ? Is it ok or is it better to read 1 pixel less
than reading memory outside of the region the user asked for ?

> +	}
> +
>  	format->field = V4L2_FIELD_NONE;
>
>  	format->colorspace = fmt->format.colorspace;
> @@ -231,23 +242,23 @@ static int vsp1_rwpf_set_selection(struct v4l2_subdev *subdev,
>  	/* Make sure the crop rectangle is entirely contained in the image. */
>  	format = v4l2_subdev_state_get_format(state, RWPF_PAD_SINK);
>
> -	/*
> -	 * Restrict the crop rectangle coordinates to multiples of 2 to avoid
> -	 * shifting the color plane.
> -	 */
> -	if (format->code == MEDIA_BUS_FMT_AYUV8_1X32) {
> -		sel->r.left = ALIGN(sel->r.left, 2);
> -		sel->r.top = ALIGN(sel->r.top, 2);
> -		sel->r.width = round_down(sel->r.width, 2);
> -		sel->r.height = round_down(sel->r.height, 2);
> -	}
> -
>  	sel->r.left = min_t(unsigned int, sel->r.left, format->width - 2);
>  	sel->r.top = min_t(unsigned int, sel->r.top, format->height - 2);
> -	sel->r.width = min_t(unsigned int, sel->r.width,
> -			     format->width - sel->r.left);
> -	sel->r.height = min_t(unsigned int, sel->r.height,
> -			      format->height - sel->r.top);
> +	sel->r.width = clamp_t(unsigned int, sel->r.width, RWPF_MIN_WIDTH,
> +			       format->width - sel->r.left);
> +	sel->r.height = clamp_t(unsigned int, sel->r.height, RWPF_MIN_HEIGHT,
> +				format->height - sel->r.top);
> +
> +	/*
> +	 * For YUV formats, restrict the crop rectangle coordinates to multiples
> +	 * of 2 to avoid shifting the color plane.
> +	 */
> +	if (format->code == MEDIA_BUS_FMT_AYUV8_1X32) {
> +		sel->r.left = round_down(sel->r.left, 2);
> +		sel->r.top = round_down(sel->r.top, 2);
> +		sel->r.width = ALIGN(sel->r.width, 2);
> +		sel->r.height = ALIGN(sel->r.height, 2);

The existing code did

		sel->r.left = ALIGN(sel->r.left, 2);
		sel->r.top = ALIGN(sel->r.top, 2);
		sel->r.width = round_down(sel->r.width, 2);
		sel->r.height = round_down(sel->r.height, 2);

is it intentional ?

> +	}
>
>  	crop = v4l2_subdev_state_get_crop(state, RWPF_PAD_SINK);
>  	*crop = sel->r;
> --
> Regards,
>
> Laurent Pinchart
>
>

