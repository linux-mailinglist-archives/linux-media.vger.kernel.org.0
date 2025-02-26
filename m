Return-Path: <linux-media+bounces-27097-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0465CA46C9C
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 21:40:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BA18A188C025
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 20:40:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67085238142;
	Wed, 26 Feb 2025 20:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="uUJUF/yQ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E918B2755E3;
	Wed, 26 Feb 2025 20:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740602423; cv=none; b=pRrm9xaTKe43ho2u5QNYtIRPOVAI9xaykB+UbVEMArl0qDO8aQ8hl3TwnSnyejMxsij0HxI7hiekhryOVkVT5gjArmjZtsGfA/lppUIEGPIQ85PT8aW1lA498yZPi9RIFYdRLpfHRvRc8uXd7zsIt4u9CAmofqD2US19lWoOTu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740602423; c=relaxed/simple;
	bh=TXJqXbK1vX8NmA7FEpqCUeP7RrAU0Ywxmcnb5iP26BM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GDAMklgIoxeafqhgjUmBf4fnN+tsqCm9ZBaOg7oi/bdkvmEFZ1mZ7g8+mUQYxVKzbV8iofvDpaIdhvQiE20gQBax0RaVtOHinD1DF+uPTqOddRVwA0R6UIsoSqdakQBFWkRnw1pWmwH/jwkmyLlFVD0m7QvBceWZXmZKCE2YY0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=uUJUF/yQ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (unknown [IPv6:2a00:6020:448c:6c00:2b29:76dc:a5a9:647c])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C9C1949E;
	Wed, 26 Feb 2025 21:38:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1740602325;
	bh=TXJqXbK1vX8NmA7FEpqCUeP7RrAU0Ywxmcnb5iP26BM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uUJUF/yQUab2QYU+TOwjAEATLWKwxseYippfVXxx28KOGRWekBNjBD6MfnddV6k/Q
	 4gVA6WRE24YhBqVeORCByYnjzVTex42lX0ZP7k+K1/hHsN4pS+c27Q3Xs0KL/K6EGR
	 gZx/e9/4UfYTtyXwXjnFKsKeG8hj7yWf5VE0LxPo=
Date: Wed, 26 Feb 2025 21:40:11 +0100
From: Stefan Klug <stefan.klug@ideasonboard.com>
To: libcamera-devel@lists.libcamera.org, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Paul Elder <paul.elder@ideasonboard.com>, Dafna Hirschfeld <dafna@fastmail.com>, 
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH] media: rkisp1: Apply full quantization when color space
 JPEG is requested
Message-ID: <zgs5b6fuyzuihrvsgkm3xxrv4gr6g2umw6lvafqetzsnizmxc5@6jvux4xfnyep>
References: <20250226192413.2903243-1-stefan.klug@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250226192413.2903243-1-stefan.klug@ideasonboard.com>

Hi all,

unfortunately I was tricked by my own observations and this patch
doesn't actually fix the problem. So please ignore. I'll post a proper
fix soon.

Sorry for the noise.

Best regards,
Stefan

On Wed, Feb 26, 2025 at 08:23:53PM +0100, Stefan Klug wrote:
> When color space V4L2_COLORSPACE_JPEG is requested the ISP incorrectly
> sets the output quantization to V4L2_QUANTIZATION_LIM_RANGE. Fix that by
> applying the default quantization for the requested color space.
> 
> Fixes: c1ec5efba080 ("media: rkisp1: Allow setting all color space fields on ISP source pad")
> Signed-off-by: Stefan Klug <stefan.klug@ideasonboard.com>
> ---
>  drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> index d94917211828..98635d875ac4 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> @@ -646,7 +646,7 @@ static void rkisp1_isp_set_src_fmt(struct rkisp1_isp *isp,
>  
>  	/*
>  	 * Copy the color space for the sink pad. When converting from Bayer to
> -	 * YUV, default to a limited quantization range.
> +	 * YUV, default to the default quantization range of the color space.
>  	 */
>  	src_fmt->colorspace = sink_fmt->colorspace;
>  	src_fmt->xfer_func = sink_fmt->xfer_func;
> @@ -654,7 +654,8 @@ static void rkisp1_isp_set_src_fmt(struct rkisp1_isp *isp,
>  
>  	if (sink_info->pixel_enc == V4L2_PIXEL_ENC_BAYER &&
>  	    src_info->pixel_enc == V4L2_PIXEL_ENC_YUV)
> -		src_fmt->quantization = V4L2_QUANTIZATION_LIM_RANGE;
> +		src_fmt->quantization = V4L2_MAP_QUANTIZATION_DEFAULT(
> +			false, sink_fmt->colorspace, sink_fmt->ycbcr_enc);
>  	else
>  		src_fmt->quantization = sink_fmt->quantization;
>  
> -- 
> 2.43.0
> 
> 

