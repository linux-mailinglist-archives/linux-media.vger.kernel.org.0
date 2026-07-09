Return-Path: <linux-media+bounces-67131-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id rg9zEo9rT2qngQIAu9opvQ
	(envelope-from <linux-media+bounces-67131-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 11:36:15 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C8B2872F03B
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 11:36:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=dpBu6r71;
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67131-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67131-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 66259302FA15
	for <lists+linux-media@lfdr.de>; Thu,  9 Jul 2026 09:36:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2A573EFD30;
	Thu,  9 Jul 2026 09:36:05 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70CAE3EB818;
	Thu,  9 Jul 2026 09:36:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783589765; cv=none; b=f1BKPjY3oZdPWoLdo6xSyDot/oke4GmX2Six3XjiF+k98Q+gzaH/SJEtW5KBB0oPEZbOZLB4pUt+DB1nNbadm+4IvVas8whbEmjNSu+MHcDEJ+0ODdKt/GWzo4Pd1z5kE4vcdeTFoGYJvuCa+ROOKmMHFsApK7Pjio0dxQQLaQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783589765; c=relaxed/simple;
	bh=nFcqrRp7FRCCS7USJ00/+VfM73AB3ZkvQ4qBTbz6vDU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CNRoDvis/D7E0ggHKrglEoy+E0e5STcG2O261NoLTno37L2Hb9bI2xI7bOQwe9OHmdsCwkUNWG5ad1UYUCvTwltT8TUfwEPQ+kAJ2YV3fI+I/0yTqRkZLj1JYrY7ohI3q0hJ/WxhDUY36Fv03JQWdtUGR4cKZmn+WZhEseZ7XmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=dpBu6r71; arc=none smtp.client-ip=213.167.242.64
Received: from ideasonboard.com (net-93-65-100-155.cust.vodafonedsl.it [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id BAEF6448;
	Thu,  9 Jul 2026 11:35:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1783589710;
	bh=nFcqrRp7FRCCS7USJ00/+VfM73AB3ZkvQ4qBTbz6vDU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dpBu6r71ZABL+Ox3pW2XWzV/xb0bu5kxfrWwbVwYFmg2FXy4DHee4kWgyWC2EXK8B
	 efOb3MqbxIVNIU1mNphj64NZOTuPsx+0Stxr1PjGydkZPRNCPqJoX9PoV8gWoH/HCT
	 FvQmg7eMbO1i/VKKI24vH3+RR9iq07eSqh6B9ubI=
Date: Thu, 9 Jul 2026 11:35:58 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org, 
	biju.das.jz@bp.renesas.com, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Hans Verkuil <hverkuil+cisco@kernel.org>, Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mehdi Djait <mehdi.djait@linux.intel.com>, Sven =?utf-8?Q?P=C3=BCschel?= <s.pueschel@pengutronix.de>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Isaac Scott <isaac.scott@ideasonboard.com>, 
	Paul Cercueil <paul@crapouillou.net>, Daniel Scally <dan.scally+renesas@ideasonboard.com>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/4] media: v4l2-common: Add
 v4l2_fill_pixfmt_aligned() helper
Message-ID: <ak9pPzjABetdgUiq@zed>
References: <20260708161406.396183-1-tommaso.merciai.xr@bp.renesas.com>
 <20260708161406.396183-3-tommaso.merciai.xr@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260708161406.396183-3-tommaso.merciai.xr@bp.renesas.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-67131-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:tommaso.merciai.xr@bp.renesas.com,m:tomm.merciai@gmail.com,m:linux-renesas-soc@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:jacopo.mondi@ideasonboard.com,m:mchehab@kernel.org,m:hverkuil+cisco@kernel.org,m:nicolas.dufresne@collabora.com,m:sakari.ailus@linux.intel.com,m:laurent.pinchart@ideasonboard.com,m:mehdi.djait@linux.intel.com,m:s.pueschel@pengutronix.de,m:m.szyprowski@samsung.com,m:isaac.scott@ideasonboard.com,m:paul@crapouillou.net,m:dan.scally+renesas@ideasonboard.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:tommmerciai@gmail.com,m:hverkuil@kernel.org,m:dan.scally@ideasonboard.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,bp.renesas.com,ideasonboard.com,kernel.org,collabora.com,linux.intel.com,pengutronix.de,samsung.com,crapouillou.net];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco,renesas];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:from_mime,ideasonboard.com:email,ideasonboard.com:dkim,zed:mid,renesas.com:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C8B2872F03B

Hi Tommaso

On Wed, Jul 08, 2026 at 06:14:03PM +0200, Tommaso Merciai wrote:
> Add v4l2_fill_pixfmt_aligned(), a variant of v4l2_fill_pixfmt()
> that accepts a stride_alignment parameter, mirroring the existing
> v4l2_fill_pixfmt_mp() / v4l2_fill_pixfmt_mp_aligned() pair.
>
> v4l2_fill_pixfmt() is refactored to call v4l2_fill_pixfmt_aligned()
> with stride_alignment=1, preserving its existing behaviour.
>
> The new helper is needed by drivers whose DMA engine requires the
> line stride to be a multiple of a specific value, such as the
> Renesas RZ/G3E CRU which requires 128-byte alignment.
>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> ---
> v2->v3:
>  - No changes, just moved to from PATCH 3/4 to PATCH 2/4
>
> v1->v2:
>  - Move v4l2_fill_pixfmt() into v4l2-common.h as inline wrapper
>  - Add v4l2_fill_pixfmt_aligned() helper documentation.
>
>  drivers/media/v4l2-core/v4l2-common.c | 12 +++++----
>  include/media/v4l2-common.h           | 38 +++++++++++++++++++++++++--
>  2 files changed, 43 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
> index 54995ba8c20d..2ce4f1c20fbc 100644
> --- a/drivers/media/v4l2-core/v4l2-common.c
> +++ b/drivers/media/v4l2-core/v4l2-common.c
> @@ -537,8 +537,8 @@ int v4l2_fill_pixfmt_mp_aligned(struct v4l2_pix_format_mplane *pixfmt,
>  }
>  EXPORT_SYMBOL_GPL(v4l2_fill_pixfmt_mp_aligned);
>
> -int v4l2_fill_pixfmt(struct v4l2_pix_format *pixfmt, u32 pixelformat,
> -		     u32 width, u32 height)
> +int v4l2_fill_pixfmt_aligned(struct v4l2_pix_format *pixfmt, u32 pixelformat,
> +			     u32 width, u32 height, u8 stride_alignment)
>  {
>  	const struct v4l2_format_info *info;
>  	int i;
> @@ -554,15 +554,17 @@ int v4l2_fill_pixfmt(struct v4l2_pix_format *pixfmt, u32 pixelformat,
>  	pixfmt->width = width;
>  	pixfmt->height = height;
>  	pixfmt->pixelformat = pixelformat;
> -	pixfmt->bytesperline = v4l2_format_plane_stride(info, 0, width, 1);
> +	pixfmt->bytesperline = v4l2_format_plane_stride(info, 0, width,
> +							stride_alignment);
>  	pixfmt->sizeimage = 0;
>
>  	for (i = 0; i < info->comp_planes; i++)
>  		pixfmt->sizeimage +=
> -			v4l2_format_plane_size(info, i, width, height, 1);
> +			v4l2_format_plane_size(info, i, width, height,
> +					       stride_alignment);
>  	return 0;
>  }
> -EXPORT_SYMBOL_GPL(v4l2_fill_pixfmt);
> +EXPORT_SYMBOL_GPL(v4l2_fill_pixfmt_aligned);
>
>  #ifdef CONFIG_MEDIA_CONTROLLER
>  static s64 v4l2_get_link_freq_ctrl(struct v4l2_ctrl_handler *handler,
> diff --git a/include/media/v4l2-common.h b/include/media/v4l2-common.h
> index 749fe38c134e..be4dd9762196 100644
> --- a/include/media/v4l2-common.h
> +++ b/include/media/v4l2-common.h
> @@ -554,8 +554,42 @@ static inline bool v4l2_is_format_bayer(const struct v4l2_format_info *f)
>  const struct v4l2_format_info *v4l2_format_info(u32 format);
>  void v4l2_apply_frmsize_constraints(u32 *width, u32 *height,
>  				    const struct v4l2_frmsize_stepwise *frmsize);
> -int v4l2_fill_pixfmt(struct v4l2_pix_format *pixfmt, u32 pixelformat,
> -		     u32 width, u32 height);
> +
> +/**
> + * v4l2_fill_pixfmt_aligned - Fill in a &struct v4l2_pix_format with stride
> + *	alignment requirements.

nit:
I was about to suggest "No '.' at the end of the function's brief to
match the existing style" but I see the devm_v4l2_sensor_clk_get_legacy
has it. However the majority of the other functions don't, so maybe
consider dropping it.

> + *
> + * @pixfmt: pointer to the &struct v4l2_pix_format to be filled
> + * @pixelformat: the V4L2 pixel format (V4L2_PIX_FMT_*)
> + * @width: image width in pixels
> + * @height: image height in pixels
> + * @stride_alignment: stride alignment in bytes, must be a power of 2
> + *
> + * Fills all fields of @pixfmt for the given pixel format, dimensions, and
> + * stride alignment. Only formats stored in a single memory plane are
> + * supported; returns -EINVAL for multi-memory-plane formats.
> + *
> + * @pixfmt->bytesperline is set to the stride of the primary (plane 0) plane,
> + * rounded up to a multiple of @stride_alignment. For formats that store
> + * multiple component planes in a single memory buffer (e.g. NV12), the
> + * alignment applied to each component plane's stride is scaled relative to
> + * @stride_alignment so that the chroma stride remains consistently derivable

Does this rather mean that

"For formats that store multiple component planes in a single memory
buffer (e.g. NV12), the alignment applied to each component plane is
the first plane @stride_alignment scaled by the plane's sub-sampling
ratio" or have I mis-read this ?

> + * from the luma stride. @pixfmt->bytesperline therefore reflects only the
> + * primary plane stride.
> + *
> + * @pixfmt->sizeimage is set to the total size in bytes of all component planes.

maybe s/component // ?

> + *
> + * Return: 0 on success, -EINVAL if @pixelformat is unknown or uses multiple
> + *	memory planes.

Do you need this tab ?

> + */
> +int v4l2_fill_pixfmt_aligned(struct v4l2_pix_format *pixfmt, u32 pixelformat,
> +			     u32 width, u32 height, u8 stride_alignment);
> +
> +static inline int v4l2_fill_pixfmt(struct v4l2_pix_format *pixfmt,
> +				   u32 pixelformat, u32 width, u32 height)
> +{
> +	return v4l2_fill_pixfmt_aligned(pixfmt, pixelformat, width, height, 1);
> +}

All minors or nit-picking
Reviewed-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>

Thanks
  j

>
>  /* @stride_alignment is a power of 2 value in bytes */
>  int v4l2_fill_pixfmt_mp_aligned(struct v4l2_pix_format_mplane *pixfmt,
> --
> 2.54.0
>
>

