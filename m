Return-Path: <linux-media+bounces-15279-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B18B0939657
	for <lists+linux-media@lfdr.de>; Tue, 23 Jul 2024 00:15:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EBAB51C2189A
	for <lists+linux-media@lfdr.de>; Mon, 22 Jul 2024 22:15:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A656482CA;
	Mon, 22 Jul 2024 22:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="kY6UxrE/"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F82745025;
	Mon, 22 Jul 2024 22:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721686502; cv=none; b=FTsUC7tHQHVM8qht6uuj904DwCufxs15StuJmvJz/5pYMkCd71n4Y0F+bVDjiI+mDV09C/9GKNlsTRfTXdsGZdQaWt/3OWqr9qb3hKdICmxcGAdxx1re5SBNwILBvvkL4Gh9BV4BgLDQtHabVNroX7e41BhgftOmiUcsxbO/X2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721686502; c=relaxed/simple;
	bh=znh1QIGYmvB/aC53MfJ9UM9CuX6s2b/DNV/U1E4VOJI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M+T7jLzv3Ktd7U7w7T6XtCvGK0BlXqNvKjQMFP9OwIwBrH6eBvOPASt/GkyDzi2NkT7RuZzq2+fYudm1hmWXi33It2PAa2V27uOsw6jK30a9rha9P3NMaPyTWUQHc1SxjdtmKJsB71q6uropKl1wP2AjsXZa8QN24OvZH5nBHCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=kY6UxrE/; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DBCEC4CD;
	Tue, 23 Jul 2024 00:14:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1721686458;
	bh=znh1QIGYmvB/aC53MfJ9UM9CuX6s2b/DNV/U1E4VOJI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kY6UxrE/Sn9bj107+EB/JQth3kIm97JlyUAcNDkKQHHyVJtmyFON6SDE4Obh9rP+h
	 Jql68JmhrOzBVM4gRedi4R8iKXG6A5AC22Gcx1K0Qmrdw/seuNet8w6WFasKKCf7+d
	 zyR38olf/gHrkKeOGiYND+5LZHFrTYC6v2nQbVhc=
Date: Tue, 23 Jul 2024 01:14:41 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Daniel Scally <dan.scally@ideasonboard.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, jacopo.mondi@ideasonboard.com,
	nayden.kanchev@arm.com, robh+dt@kernel.org, mchehab@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	jerome.forissier@linaro.org, kieran.bingham@ideasonboard.com,
	sakari.ailus@iki.fi
Subject: Re: [PATCH v6 05/18] media: v4l2-common: Add RAW14 format info
Message-ID: <20240722221441.GB32300@pendragon.ideasonboard.com>
References: <20240709132906.3198927-1-dan.scally@ideasonboard.com>
 <20240709132906.3198927-6-dan.scally@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240709132906.3198927-6-dan.scally@ideasonboard.com>

Hi Dan,

Thank you for the patch.

On Tue, Jul 09, 2024 at 02:28:53PM +0100, Daniel Scally wrote:
> Add entries to v4l2_format_info describing the 14-bit bayer
> formats so that they can be used in drivers.
> 
> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> Changes in v6:
> 
> 	- New patch
> 
>  drivers/media/v4l2-core/v4l2-common.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
> index c5d5704af5ee..fe33221e6c02 100644
> --- a/drivers/media/v4l2-core/v4l2-common.c
> +++ b/drivers/media/v4l2-core/v4l2-common.c
> @@ -331,6 +331,10 @@ const struct v4l2_format_info *v4l2_format_info(u32 format)
>  		{ .format = V4L2_PIX_FMT_SGBRG12,	.pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
>  		{ .format = V4L2_PIX_FMT_SGRBG12,	.pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
>  		{ .format = V4L2_PIX_FMT_SRGGB12,	.pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
> +		{ .format = V4L2_PIX_FMT_SBGGR14,	.pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
> +		{ .format = V4L2_PIX_FMT_SGBRG14,	.pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
> +		{ .format = V4L2_PIX_FMT_SGRBG14,	.pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
> +		{ .format = V4L2_PIX_FMT_SRGGB14,	.pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
>  		{ .format = V4L2_PIX_FMT_SBGGR16,	.pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
>  		{ .format = V4L2_PIX_FMT_SGBRG16,	.pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
>  		{ .format = V4L2_PIX_FMT_SGRBG16,	.pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
> -- 
> 2.34.1
> 

-- 
Regards,

Laurent Pinchart

