Return-Path: <linux-media+bounces-20333-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3C849B0BC5
	for <lists+linux-media@lfdr.de>; Fri, 25 Oct 2024 19:38:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 385252889F4
	for <lists+linux-media@lfdr.de>; Fri, 25 Oct 2024 17:38:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D42320C318;
	Fri, 25 Oct 2024 17:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="OTtqjYFx"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4368D20C312;
	Fri, 25 Oct 2024 17:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729877912; cv=none; b=euEpAVONAhgsvuAVOUIu8S7s5OpqTC59hXo2Sg+4UYPjnag3eJJWJyVos65UVnbU0rpV3RZwL/P/VPpJmrti37PrtHi1lDQ/kXQeou9hatLK3GHauDkV/gMk4Yq1OEUZsk/FdyMu5U861J08cO9EKZwjNuq1ktUiZF8nW4e/zu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729877912; c=relaxed/simple;
	bh=JIWMxgNj6WHJYDUkFodjv6iWoEgWS8OosnNAXEIbcII=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Vcyg04GEL6vvNh3g4IDrZDoMz5wR6O13UA37cvI6R7gieFetj+3tlCuH2KwOW/aR3h8tZ2UTMBoY/7TNPHMfmN2CPK9jsBVLzvEh+VTMU7Nel3NCpZjC/+/c/cyWKrHS1+P5HIoU8duMQCQkdoosD623KVr5D+W0Q5pmA45dLvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=OTtqjYFx; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1729877908;
	bh=JIWMxgNj6WHJYDUkFodjv6iWoEgWS8OosnNAXEIbcII=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=OTtqjYFxksUtlFeKnLm031Pawc/8l6472GbzQvWvct0Ah7CCLB1pIE9+c2HHxeh3b
	 3i4i9yPzlJp7//p6NgvYUer3RfCazxlMdK7UBQ9sWKVzzrZf2E7XjwgVKNUkIIjXED
	 6B5OHLL+h2tFtgcaaBBmq3YT5x1bvBs4/DME1wULPiEQQfkp07yr8qjXxsgKBfO0AO
	 nxcMAsR3gy06zGh/YHqJoB4gnfsE1fWn+f+O1/F7uoQD9IGGzLHQe6zRoy2d2Wl+AK
	 ivtJTpGoIvYLalBPmnuv+LxqlvzM3z7QC4/It1EZFypl3p63ViJTLYFT6TV6H7kvcG
	 j126/rmEfs1gg==
Received: from nicolas-tpx395.lan (unknown [IPv6:2606:6d00:15:862e::7a9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 67B4D17E36AF;
	Fri, 25 Oct 2024 19:38:26 +0200 (CEST)
Message-ID: <35f60c277e6aa1c9095b80bfb18dbfe8bc4539b5.camel@collabora.com>
Subject: Re: [PATCH v6 09/11] media: rkvdec: Add get_image_fmt ops
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Jonas Karlman <jonas@kwiboo.se>, Sebastian Fricke
 <sebastian.fricke@collabora.com>, Ezequiel Garcia
 <ezequiel@vanguardiasur.com.ar>, Mauro Carvalho Chehab
 <mchehab@kernel.org>,  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Alex Bee <knaerzche@gmail.com>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Detlev Casanova
 <detlev.casanova@collabora.com>, Dan Carpenter <dan.carpenter@linaro.org>, 
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Christopher
 Obbard <chris.obbard@collabora.com>
Date: Fri, 25 Oct 2024 13:38:24 -0400
In-Reply-To: <20240909192522.1076704-10-jonas@kwiboo.se>
References: <20240909192522.1076704-1-jonas@kwiboo.se>
	 <20240909192522.1076704-10-jonas@kwiboo.se>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Le lundi 09 septembre 2024 à 19:25 +0000, Jonas Karlman a écrit :
> Add support for a get_image_fmt() ops that return the required image
> format.
> 
> The CAPTURE format is reset when required image format changes and the
> buffer queue is not busy.
> 
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> Tested-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> Tested-by: Christopher Obbard <chris.obbard@collabora.com>

Looks good to me.

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> v6:
> - No change
> 
> v5:
> - Collect t-b tags
> 
> v4:
> - Change fmt_opaque into an image format
> - Split patch into two
> 
> v3:
> - New patch
> ---
>  drivers/staging/media/rkvdec/rkvdec.c | 49 +++++++++++++++++++++++++--
>  drivers/staging/media/rkvdec/rkvdec.h |  2 ++
>  2 files changed, 49 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/media/rkvdec/rkvdec.c b/drivers/staging/media/rkvdec/rkvdec.c
> index 467fc05b347a..8df49ee12820 100644
> --- a/drivers/staging/media/rkvdec/rkvdec.c
> +++ b/drivers/staging/media/rkvdec/rkvdec.c
> @@ -111,15 +111,60 @@ static int rkvdec_try_ctrl(struct v4l2_ctrl *ctrl)
>  {
>  	struct rkvdec_ctx *ctx = container_of(ctrl->handler, struct rkvdec_ctx, ctrl_hdl);
>  	const struct rkvdec_coded_fmt_desc *desc = ctx->coded_fmt_desc;
> +	struct v4l2_pix_format_mplane *pix_mp = &ctx->decoded_fmt.fmt.pix_mp;
> +	enum rkvdec_image_fmt image_fmt;
> +	struct vb2_queue *vq;
> +	int ret;
> +
> +	if (desc->ops->try_ctrl) {
> +		ret = desc->ops->try_ctrl(ctx, ctrl);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	if (!desc->ops->get_image_fmt)
> +		return 0;
>  
> -	if (desc->ops->try_ctrl)
> -		return desc->ops->try_ctrl(ctx, ctrl);
> +	image_fmt = desc->ops->get_image_fmt(ctx, ctrl);
> +	if (ctx->image_fmt == image_fmt)
> +		return 0;
> +
> +	if (rkvdec_is_valid_fmt(ctx, pix_mp->pixelformat, image_fmt))
> +		return 0;
> +
> +	/* format change not allowed when queue is busy */
> +	vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx,
> +			     V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
> +	if (vb2_is_busy(vq))
> +		return -EINVAL;
> +
> +	return 0;
> +}
> +
> +static int rkvdec_s_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +	struct rkvdec_ctx *ctx = container_of(ctrl->handler, struct rkvdec_ctx, ctrl_hdl);
> +	const struct rkvdec_coded_fmt_desc *desc = ctx->coded_fmt_desc;
> +	struct v4l2_pix_format_mplane *pix_mp = &ctx->decoded_fmt.fmt.pix_mp;
> +	enum rkvdec_image_fmt image_fmt;
> +
> +	if (!desc->ops->get_image_fmt)
> +		return 0;
> +
> +	image_fmt = desc->ops->get_image_fmt(ctx, ctrl);
> +	if (ctx->image_fmt == image_fmt)
> +		return 0;
> +
> +	ctx->image_fmt = image_fmt;
> +	if (!rkvdec_is_valid_fmt(ctx, pix_mp->pixelformat, ctx->image_fmt))
> +		rkvdec_reset_decoded_fmt(ctx);
>  
>  	return 0;
>  }
>  
>  static const struct v4l2_ctrl_ops rkvdec_ctrl_ops = {
>  	.try_ctrl = rkvdec_try_ctrl,
> +	.s_ctrl = rkvdec_s_ctrl,
>  };
>  
>  static const struct rkvdec_ctrl_desc rkvdec_h264_ctrl_descs[] = {
> diff --git a/drivers/staging/media/rkvdec/rkvdec.h b/drivers/staging/media/rkvdec/rkvdec.h
> index 6f8cf50c5d99..e466a2753ccf 100644
> --- a/drivers/staging/media/rkvdec/rkvdec.h
> +++ b/drivers/staging/media/rkvdec/rkvdec.h
> @@ -73,6 +73,8 @@ struct rkvdec_coded_fmt_ops {
>  		     struct vb2_v4l2_buffer *dst_buf,
>  		     enum vb2_buffer_state result);
>  	int (*try_ctrl)(struct rkvdec_ctx *ctx, struct v4l2_ctrl *ctrl);
> +	enum rkvdec_image_fmt (*get_image_fmt)(struct rkvdec_ctx *ctx,
> +					       struct v4l2_ctrl *ctrl);
>  };
>  
>  enum rkvdec_image_fmt {


