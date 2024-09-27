Return-Path: <linux-media+bounces-18717-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D887988C8D
	for <lists+linux-media@lfdr.de>; Sat, 28 Sep 2024 00:44:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8A759B216B4
	for <lists+linux-media@lfdr.de>; Fri, 27 Sep 2024 22:44:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCDD81B4C3B;
	Fri, 27 Sep 2024 22:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="nlYTQUxZ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D402A1B3F3B;
	Fri, 27 Sep 2024 22:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727477038; cv=none; b=Usfl6VmtKvdY/WNlBI/rtpiI/FKk57iRhVAYetsYnorDLldXYwQaoOZM6bq95P4n0AHyQ960nClnJdNJu6M8INYVWn54GiSqAnSDZF3/ZsGfY4J0xvVchUfahQBlVpquU2vpliZBcVwX0hAa6XTdhnUH3T+plbriS6NdSo4fzTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727477038; c=relaxed/simple;
	bh=/sqnA994NVHSDF6pd/PyYxZGdORPpDMqP41T6JddIX0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i+5VJJjQAK6Da5W/K19OdeC/aczow8bcGxpwCrFlbVKDUmaWTRxLfgIP4ISYTo3zKYhJwUzsz3oxvW50PjbMTGlpyunMkzeEZzmaOfJDe/3+bFd8n43aPexKBlPl6EA520llariyaxeiD3hAOYHbdafOZ6pDe1f2A6BeJpt+L1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=nlYTQUxZ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1D260161;
	Sat, 28 Sep 2024 00:42:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1727476946;
	bh=/sqnA994NVHSDF6pd/PyYxZGdORPpDMqP41T6JddIX0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nlYTQUxZIxYqPov1iYF97nogTzx4G1zCjEkXSEYnDNiTcMGBHwOZx/E8XlY1qgoy0
	 TiEU9xOWNtZBQ5q3jSy1bZiLceBlbTB/nm5HGd9VfSbBnUKPoqv/NS20s9bj+dSD/R
	 66Xvl6ME94+tj/u4u6+mY5G+6KeNzKvPofibRXf4=
Date: Sat, 28 Sep 2024 01:43:52 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v2 08/16] media: platform: rzg2l-cru: rzg2l-video: Use
 MIPI CSI-2 data types for ICnMC_INF definitions
Message-ID: <20240927224352.GH12322@pendragon.ideasonboard.com>
References: <20240910175357.229075-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240910175357.229075-9-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240910175357.229075-9-prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi Prabhakar,

Thank you for the patch.

On Tue, Sep 10, 2024 at 06:53:49PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> The INF field in the ICnMC register accepts data type codes as specified
> in the MIPI CSI-2 v2.1 specification. This patch introduces the
> `ICnMC_INF()` macro to use the MIPI CSI-2 data types, which are available
> in the `media/mipi-csi2.h` header.
> 
> Suggested-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> index 9ab7ef33c9da..de88c0fab961 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> @@ -15,6 +15,7 @@
>  #include <linux/delay.h>
>  #include <linux/pm_runtime.h>
>  
> +#include <media/mipi-csi2.h>
>  #include <media/v4l2-ioctl.h>
>  #include <media/videobuf2-dma-contig.h>
>  
> @@ -77,8 +78,7 @@
>  /* CRU Image Processing Main Control Register */
>  #define ICnMC				0x208
>  #define ICnMC_CSCTHR			BIT(5)
> -#define ICnMC_INF_YUV8_422		(0x1e << 16)
> -#define ICnMC_INF_USER			(0x30 << 16)
> +#define ICnMC_INF(x)			((x) << 16)
>  #define ICnMC_VCSEL(x)			((x) << 22)
>  #define ICnMC_INF_MASK			GENMASK(21, 16)
>  
> @@ -307,12 +307,12 @@ static void rzg2l_cru_csi2_setup(struct rzg2l_cru_dev *cru, bool *input_is_yuv,
>  
>  	switch (ip_sd_fmt->code) {
>  	case MEDIA_BUS_FMT_UYVY8_1X16:
> -		icnmc = ICnMC_INF_YUV8_422;
> +		icnmc = ICnMC_INF(MIPI_CSI2_DT_YUV422_8B);
>  		*input_is_yuv = true;
>  		break;
>  	default:
>  		*input_is_yuv = false;
> -		icnmc = ICnMC_INF_USER;
> +		icnmc = ICnMC_INF(MIPI_CSI2_DT_USER_DEFINED(0));
>  		break;
>  	}
>  

-- 
Regards,

Laurent Pinchart

