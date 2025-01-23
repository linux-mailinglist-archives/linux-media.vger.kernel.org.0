Return-Path: <linux-media+bounces-25227-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4B21A1AC1B
	for <lists+linux-media@lfdr.de>; Thu, 23 Jan 2025 22:50:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1412016C9CC
	for <lists+linux-media@lfdr.de>; Thu, 23 Jan 2025 21:50:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A03B1CAA9F;
	Thu, 23 Jan 2025 21:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="EQitMZAf"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C93931ADC62;
	Thu, 23 Jan 2025 21:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737669033; cv=none; b=fqoqEfxaRE8HM2iaAhsaLvrOPWHTPM4VwZ9M0nG7Ss9ZzV0SZb46bI6ndH0swODXIBs6RAm0XFXl8AaKv1uC8+FQFi4PNgEhk8uGG2+FQV31r4MUls2pJdFLvfsFr90ernn+uAdeYlGOofJPQSudKpZkigyaVPN6jSDaJp8/Er8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737669033; c=relaxed/simple;
	bh=75k6qi8rPAhTTR1SBrXzFni4owaaPxd7OKe4JkW7Xe4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nmejHdP4QnIDSLoUazQTKLHS4DC4DTDN+IEna2jomdd5LuIBGtmpDx2eBRzcXVIxliwuZrxs8FLvYQVd2t/REbFoINxnPbR5Uu4yJ65vRwv37latsVsf1WQ1K/f+5EVMoupqipGzWgRHg/iLZgNwwjmsq5+Uk2lwYb0Sd7Ya/hA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=EQitMZAf; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1D83BD1F;
	Thu, 23 Jan 2025 22:49:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1737668966;
	bh=75k6qi8rPAhTTR1SBrXzFni4owaaPxd7OKe4JkW7Xe4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EQitMZAf1zOvnAUU+7lfalASlqS9EjX8Y1cual7R12pTk99Pg6vmr0aq/hvpzIChP
	 Hd/vxk6YL9w4sGFCw3o/7fpdL52uZUaUnyHXnmoCMEz1V6FT6voM5ENSSWoT7TZ7Ax
	 fWNcnoBYsYBjn3qLyZcA6XVp5GAJl07Cw7XfsPUI=
Date: Thu, 23 Jan 2025 23:50:19 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 4/6] media: vsp1: rwpf: Break out format handling
Message-ID: <20250123215019.GD10642@pendragon.ideasonboard.com>
References: <20250123-v4h-iif-v1-0-7b4e5299939f@ideasonboard.com>
 <20250123-v4h-iif-v1-4-7b4e5299939f@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250123-v4h-iif-v1-4-7b4e5299939f@ideasonboard.com>

Hi Jacopo,

Thank you for the patch.

On Thu, Jan 23, 2025 at 06:04:05PM +0100, Jacopo Mondi wrote:
> The current implementation of the r/wpf format handling assumes
> three formats to be supported in the RGB/YUV space.
> 
> With the forthcoming support for VSPX the r/wpf units will be
> used to fetch from exteranal memory images in RAW Bayer format

s/exteranal/external/

> and buffers of ISP configuration parameters.
> 
> Prepare for adding support for these new formats by breaking
> out the list of supported media bus codes in the vsp1_rwpf.c
> file.
> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/media/platform/renesas/vsp1/vsp1_rwpf.c | 25 ++++++++++++++-----------
>  1 file changed, 14 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c b/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c
> index 9d38203e73d00b82a1a7db0353e2f0b5a94084f6..93b0ed5fd0da0c6a182dbbfe1e54eb8cfd66c493 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c
> @@ -16,6 +16,12 @@
>  #define RWPF_MIN_WIDTH				1
>  #define RWPF_MIN_HEIGHT				1
>  
> +static const u32 rwpf_mbus_codes[] = {
> +	MEDIA_BUS_FMT_ARGB8888_1X32,
> +	MEDIA_BUS_FMT_AHSV8888_1X32,
> +	MEDIA_BUS_FMT_AYUV8_1X32,
> +};
> +
>  /* -----------------------------------------------------------------------------
>   * V4L2 Subdevice Operations
>   */
> @@ -24,16 +30,10 @@ static int vsp1_rwpf_enum_mbus_code(struct v4l2_subdev *subdev,
>  				    struct v4l2_subdev_state *sd_state,
>  				    struct v4l2_subdev_mbus_code_enum *code)
>  {
> -	static const unsigned int codes[] = {
> -		MEDIA_BUS_FMT_ARGB8888_1X32,
> -		MEDIA_BUS_FMT_AHSV8888_1X32,
> -		MEDIA_BUS_FMT_AYUV8_1X32,
> -	};
> -
> -	if (code->index >= ARRAY_SIZE(codes))
> +	if (code->index >= ARRAY_SIZE(rwpf_mbus_codes))
>  		return -EINVAL;
>  
> -	code->code = codes[code->index];
> +	code->code = rwpf_mbus_codes[code->index];
>  
>  	return 0;
>  }
> @@ -57,6 +57,7 @@ static int vsp1_rwpf_set_format(struct v4l2_subdev *subdev,
>  	struct vsp1_rwpf *rwpf = to_rwpf(subdev);
>  	struct v4l2_subdev_state *state;
>  	struct v4l2_mbus_framefmt *format;
> +	unsigned int i;
>  	int ret = 0;
>  
>  	mutex_lock(&rwpf->entity.lock);
> @@ -68,9 +69,11 @@ static int vsp1_rwpf_set_format(struct v4l2_subdev *subdev,
>  	}
>  
>  	/* Default to YUV if the requested format is not supported. */
> -	if (fmt->format.code != MEDIA_BUS_FMT_ARGB8888_1X32 &&
> -	    fmt->format.code != MEDIA_BUS_FMT_AHSV8888_1X32 &&
> -	    fmt->format.code != MEDIA_BUS_FMT_AYUV8_1X32)
> +	for (i = 0; i < ARRAY_SIZE(rwpf_mbus_codes); ++i) {
> +		if (fmt->format.code == rwpf_mbus_codes[i])
> +			break;
> +	}
> +	if (i == ARRAY_SIZE(rwpf_mbus_codes))
>  		fmt->format.code = MEDIA_BUS_FMT_AYUV8_1X32;
>  
>  	format = v4l2_subdev_state_get_format(state, fmt->pad);
> 

-- 
Regards,

Laurent Pinchart

