Return-Path: <linux-media+bounces-20330-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F73F9B0B92
	for <lists+linux-media@lfdr.de>; Fri, 25 Oct 2024 19:31:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6360C1C21142
	for <lists+linux-media@lfdr.de>; Fri, 25 Oct 2024 17:31:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62E4020D4F8;
	Fri, 25 Oct 2024 17:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="OG4V+Fcl"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A2A320D4E4;
	Fri, 25 Oct 2024 17:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729876865; cv=none; b=mENuUOkeFver4wa0N10Twt6cIuGNcfcYw2rgaW1TuxB9vtSh+reA+uxfMt9hwqPj6d951IuH8gZy5wLpIWdptBqfd4pOi//ZfneH9/LJ8fvq5VpU80Sw/l2BRy+xCiwSwcRswlPGelWYUZZTYFDJ+uNUYJxo9U214rxYs6FnYZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729876865; c=relaxed/simple;
	bh=/FAcDI/56mYIWBh5/V5Q2gqst/uvYSXDchwxmhBfEhU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=G16Yum2BcqIEF5t7m0xVd5hALMjgqFzBF7UoKzKcgTgDVWHpnTFqdyBnlhew1hkVCH4SJBBriUcInaDLb3efiUPWTIN8VEqKkQm2v0fFUN9rRVfGwXSUkQVOjo80i6EDVXvR0+8QBUHoZ3HCQ89Tkcd87ihE8800HnNFBUstKxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=OG4V+Fcl; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1729876859;
	bh=/FAcDI/56mYIWBh5/V5Q2gqst/uvYSXDchwxmhBfEhU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=OG4V+Fcln6jxQpBt/7+/Z7ji7O5uATDtsuTictsFXoj0tXYhiOt0b/vcQU8XhjykW
	 Ty21nRZG44TSNlKJzAGzheyVDOcZYO+rUcZEZu1zHrMjrSHsGSlczxuoBaZ3zM7Gcz
	 A1qNyUtLKEAlNeWgvUGkoX5BA/MUj+YZNguLMhWBIxy+ICT5bmcuBN+wtmB+EXOqDb
	 coCTxG9QAS3LFcCGCPtfXTGlJUZ2ADIbcS3JxaHMFDukH1hVoS5Sn62ZpZjUZ1mlMP
	 v2aWK8W1nmdWihdptvRdhEi/eRUAgNLljSnIFoYV0ulX/z3JRbI1xhe9r/uxs6K/GL
	 vzcwN6euhq6IQ==
Received: from nicolas-tpx395.lan (unknown [IPv6:2606:6d00:15:862e::7a9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7491717E3683;
	Fri, 25 Oct 2024 19:20:57 +0200 (CEST)
Message-ID: <70a13bcfda7565efc1cf7117a559edfed5318819.camel@collabora.com>
Subject: Re: [PATCH v6 01/11] media: v4l2-common: Add helpers to calculate
 bytesperline and sizeimage
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Jonas Karlman <jonas@kwiboo.se>, Sebastian Fricke
 <sebastian.fricke@collabora.com>, Ezequiel Garcia
 <ezequiel@vanguardiasur.com.ar>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Alex Bee <knaerzche@gmail.com>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Detlev Casanova
 <detlev.casanova@collabora.com>, Dan Carpenter <dan.carpenter@linaro.org>, 
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Christopher
 Obbard <chris.obbard@collabora.com>
Date: Fri, 25 Oct 2024 13:20:55 -0400
In-Reply-To: <20240909192522.1076704-2-jonas@kwiboo.se>
References: <20240909192522.1076704-1-jonas@kwiboo.se>
	 <20240909192522.1076704-2-jonas@kwiboo.se>
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

Le lundi 09 septembre 2024 à 19:24 +0000, Jonas Karlman a écrit :
> Add helper functions to calculate plane bytesperline and sizeimage,
> these new helpers consider bpp div, block width and height when
> calculating plane bytesperline and sizeimage.
> 
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> Tested-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> Tested-by: Christopher Obbard <chris.obbard@collabora.com>
> ---
> v6:
> - No change
> 
> v5:
> - Collect t-b tags
> 
> v4:
> - No change
> 
> v3:
> - Consider bpp_div in calculation
> ---
>  drivers/media/v4l2-core/v4l2-common.c | 78 +++++++++++++--------------
>  1 file changed, 39 insertions(+), 39 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
> index 0a2f4f0d0a07..8ad04d48a023 100644
> --- a/drivers/media/v4l2-core/v4l2-common.c
> +++ b/drivers/media/v4l2-core/v4l2-common.c
> @@ -357,6 +357,34 @@ static inline unsigned int v4l2_format_block_height(const struct v4l2_format_inf
>  	return info->block_h[plane];
>  }
>  
> +static inline unsigned int v4l2_format_plane_width(const struct v4l2_format_info *info, int plane,

nit: What would you think of naming this one v4l2_format_plane_stride() ? As the
returned value is in bytes, not in pixels. (I'm not a huge fan of
_bytesperline(), but would seem valid and consistent too).

With or without this, I'm happy to see this land:

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> +						   unsigned int width)
> +{
> +	unsigned int hdiv = plane ? info->hdiv : 1;
> +	unsigned int aligned_width =
> +		ALIGN(width, v4l2_format_block_width(info, plane));
> +
> +	return DIV_ROUND_UP(aligned_width, hdiv) *
> +	       info->bpp[plane] / info->bpp_div[plane];
> +}
> +
> +static inline unsigned int v4l2_format_plane_height(const struct v4l2_format_info *info, int plane,
> +						    unsigned int height)
> +{
> +	unsigned int vdiv = plane ? info->vdiv : 1;
> +	unsigned int aligned_height =
> +		ALIGN(height, v4l2_format_block_height(info, plane));
> +
> +	return DIV_ROUND_UP(aligned_height, vdiv);
> +}
> +
> +static inline unsigned int v4l2_format_plane_size(const struct v4l2_format_info *info, int plane,
> +						  unsigned int width, unsigned int height)
> +{
> +	return v4l2_format_plane_width(info, plane, width) *
> +	       v4l2_format_plane_height(info, plane, height);
> +}
> +
>  void v4l2_apply_frmsize_constraints(u32 *width, u32 *height,
>  				    const struct v4l2_frmsize_stepwise *frmsize)
>  {
> @@ -392,37 +420,19 @@ int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_mplane *pixfmt,
>  
>  	if (info->mem_planes == 1) {
>  		plane = &pixfmt->plane_fmt[0];
> -		plane->bytesperline = ALIGN(width, v4l2_format_block_width(info, 0)) * info->bpp[0] / info->bpp_div[0];
> +		plane->bytesperline = v4l2_format_plane_width(info, 0, width);
>  		plane->sizeimage = 0;
>  
> -		for (i = 0; i < info->comp_planes; i++) {
> -			unsigned int hdiv = (i == 0) ? 1 : info->hdiv;
> -			unsigned int vdiv = (i == 0) ? 1 : info->vdiv;
> -			unsigned int aligned_width;
> -			unsigned int aligned_height;
> -
> -			aligned_width = ALIGN(width, v4l2_format_block_width(info, i));
> -			aligned_height = ALIGN(height, v4l2_format_block_height(info, i));
> -
> -			plane->sizeimage += info->bpp[i] *
> -				DIV_ROUND_UP(aligned_width, hdiv) *
> -				DIV_ROUND_UP(aligned_height, vdiv) / info->bpp_div[i];
> -		}
> +		for (i = 0; i < info->comp_planes; i++)
> +			plane->sizeimage +=
> +				v4l2_format_plane_size(info, i, width, height);
>  	} else {
>  		for (i = 0; i < info->comp_planes; i++) {
> -			unsigned int hdiv = (i == 0) ? 1 : info->hdiv;
> -			unsigned int vdiv = (i == 0) ? 1 : info->vdiv;
> -			unsigned int aligned_width;
> -			unsigned int aligned_height;
> -
> -			aligned_width = ALIGN(width, v4l2_format_block_width(info, i));
> -			aligned_height = ALIGN(height, v4l2_format_block_height(info, i));
> -
>  			plane = &pixfmt->plane_fmt[i];
>  			plane->bytesperline =
> -				info->bpp[i] * DIV_ROUND_UP(aligned_width, hdiv) / info->bpp_div[i];
> -			plane->sizeimage =
> -				plane->bytesperline * DIV_ROUND_UP(aligned_height, vdiv);
> +				v4l2_format_plane_width(info, i, width);
> +			plane->sizeimage = plane->bytesperline *
> +				v4l2_format_plane_height(info, i, height);
>  		}
>  	}
>  	return 0;
> @@ -446,22 +456,12 @@ int v4l2_fill_pixfmt(struct v4l2_pix_format *pixfmt, u32 pixelformat,
>  	pixfmt->width = width;
>  	pixfmt->height = height;
>  	pixfmt->pixelformat = pixelformat;
> -	pixfmt->bytesperline = ALIGN(width, v4l2_format_block_width(info, 0)) * info->bpp[0] / info->bpp_div[0];
> +	pixfmt->bytesperline = v4l2_format_plane_width(info, 0, width);
>  	pixfmt->sizeimage = 0;
>  
> -	for (i = 0; i < info->comp_planes; i++) {
> -		unsigned int hdiv = (i == 0) ? 1 : info->hdiv;
> -		unsigned int vdiv = (i == 0) ? 1 : info->vdiv;
> -		unsigned int aligned_width;
> -		unsigned int aligned_height;
> -
> -		aligned_width = ALIGN(width, v4l2_format_block_width(info, i));
> -		aligned_height = ALIGN(height, v4l2_format_block_height(info, i));
> -
> -		pixfmt->sizeimage += info->bpp[i] *
> -			DIV_ROUND_UP(aligned_width, hdiv) *
> -			DIV_ROUND_UP(aligned_height, vdiv) / info->bpp_div[i];
> -	}
> +	for (i = 0; i < info->comp_planes; i++)
> +		pixfmt->sizeimage +=
> +			v4l2_format_plane_size(info, i, width, height);
>  	return 0;
>  }
>  EXPORT_SYMBOL_GPL(v4l2_fill_pixfmt);


