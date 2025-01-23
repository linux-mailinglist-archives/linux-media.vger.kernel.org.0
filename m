Return-Path: <linux-media+bounces-25228-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 074CDA1AC27
	for <lists+linux-media@lfdr.de>; Thu, 23 Jan 2025 22:54:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 003F01885001
	for <lists+linux-media@lfdr.de>; Thu, 23 Jan 2025 21:54:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10DDC1CB534;
	Thu, 23 Jan 2025 21:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="WDpHAH55"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 116261ADC62;
	Thu, 23 Jan 2025 21:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737669277; cv=none; b=ZGsmJbMAvp1TE/jiK7ZELbFU97rNL3/Kngd3u7UGpKbQYm3D2giYM/tBjbNmMgP/NujVqPPh4zBe9WDLGOGpQjx2qGEApWfMBhrZniabeqJYJRJnOJFCegMA20xIPS2xc5cuDH3otKRppx4yWc8AIGvutWiUrMhOf1hq2+IYakU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737669277; c=relaxed/simple;
	bh=d0rt5MNXD1iDXaQ8pccuKUttLD6bx9Arzrp/HflZTy0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ROkHeWD0heFEGPDJ2DEJY5bb0vm7Wrpft3nTZ8wSVBDHX6CCW6LdoxZ0dYGnj1X+gJqNjLRPQGwxz/H2+3MwFa1fCJ+HeoTxwQBByCCdNVoVZIWVouc6qxFNPeC8WFp+FBFUwUI9N745+6ZtfZ5QUctmk3fCHlhBwddSfB8Y2gI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=WDpHAH55; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6CBEAD1F;
	Thu, 23 Jan 2025 22:53:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1737669210;
	bh=d0rt5MNXD1iDXaQ8pccuKUttLD6bx9Arzrp/HflZTy0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WDpHAH55seAquznAJklU5PIKveLhvOIpZSB2z3KxfnIdSLGgf8mMxVFhLx1Gh17ED
	 ZQh/U0OCuPJh+ROigN0hFWEWARq2zURqE7ZLzJgWt0pTy+4S0bCf68uUppJKsoSAjK
	 PRVfsV4HtceVPV8ZpnTtomvDlWQsD5JSnTuyQVn8=
Date: Thu, 23 Jan 2025 23:54:23 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 5/6] media: vsp1: rwpf: Support RAW Bayer and ISP config
Message-ID: <20250123215423.GE10642@pendragon.ideasonboard.com>
References: <20250123-v4h-iif-v1-0-7b4e5299939f@ideasonboard.com>
 <20250123-v4h-iif-v1-5-7b4e5299939f@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250123-v4h-iif-v1-5-7b4e5299939f@ideasonboard.com>

Hi Jacopo,

Thank you for the patch.

On Thu, Jan 23, 2025 at 06:04:06PM +0100, Jacopo Mondi wrote:
> With the forthcoming support for VSPX the r/wpf unit will be used
> to perform memory access on the behalf of the ISP units.
> 
> Prepare to support reading from external memory images in RAW Bayer
> format and ISP configuration parameters by expanding the list
> of supported media bus codes.
> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> ---
>  drivers/media/platform/renesas/vsp1/vsp1_rwpf.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c b/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c
> index 93b0ed5fd0da0c6a182dbbfe1e54eb8cfd66c493..75dde92ec35585825eb70c0faa31ff4cb1d4a3d4 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c
> @@ -20,6 +20,23 @@ static const u32 rwpf_mbus_codes[] = {
>  	MEDIA_BUS_FMT_ARGB8888_1X32,
>  	MEDIA_BUS_FMT_AHSV8888_1X32,
>  	MEDIA_BUS_FMT_AYUV8_1X32,
> +	MEDIA_BUS_FMT_SRGGB8_1X8,
> +	MEDIA_BUS_FMT_SGRBG8_1X8,
> +	MEDIA_BUS_FMT_SGBRG8_1X8,
> +	MEDIA_BUS_FMT_SBGGR8_1X8,
> +	MEDIA_BUS_FMT_SRGGB10_1X10,
> +	MEDIA_BUS_FMT_SGRBG10_1X10,
> +	MEDIA_BUS_FMT_SGBRG10_1X10,
> +	MEDIA_BUS_FMT_SBGGR10_1X10,
> +	MEDIA_BUS_FMT_SRGGB12_1X12,
> +	MEDIA_BUS_FMT_SGRBG12_1X12,
> +	MEDIA_BUS_FMT_SGBRG12_1X12,
> +	MEDIA_BUS_FMT_SBGGR12_1X12,
> +	MEDIA_BUS_FMT_SRGGB16_1X16,
> +	MEDIA_BUS_FMT_SGRBG16_1X16,
> +	MEDIA_BUS_FMT_SGBRG16_1X16,
> +	MEDIA_BUS_FMT_SBGGR16_1X16,
> +	MEDIA_BUS_FMT_METADATA_FIXED

Not all RPFs and WPFs should support those extra formats.

>  };
>  
>  /* -----------------------------------------------------------------------------
> 

-- 
Regards,

Laurent Pinchart

