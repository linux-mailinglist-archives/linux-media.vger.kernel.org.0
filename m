Return-Path: <linux-media+bounces-29830-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 731B1A8368D
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 04:36:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 643AB445E52
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 02:36:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E7761E22FC;
	Thu, 10 Apr 2025 02:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="uoUNqbta"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AA341E1A18;
	Thu, 10 Apr 2025 02:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744252559; cv=none; b=i7X4OiThdmkfi1smcPHt4lfb6UZry6U2W6UC48NSxOBJdRISj1RZk7a5q/htGPiGd8FmHx9UCzcsLYMxOXc2OAPArdK34KJnSLBAU9VQZfyFl5dJbbtP7E6PAOQmG0s79HQv2QMUSm1cC8f4ph1YahxkQf5M+0hlZpvC+mLHdgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744252559; c=relaxed/simple;
	bh=C2jv9tWNItA7iInA46uOWtZb4e3MMojFYIw4wznIJrk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VKk+yZa9c6ayYOVhurIYqMPRUFcns4FBnbs1JyJbFZ470Ghku5DqRYPHMVaDeR6XSKw+7fLBihPVtESG/P2d8gE2a9U0/h3kPj24ge5IJn7aFmIIffd+QGXNk/0aS53xxw/lm89BMYN/6gJyyMYSgDAGmIV4DQ2FNtfhpdVlfj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=uoUNqbta; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 867E7496;
	Thu, 10 Apr 2025 04:33:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1744252436;
	bh=C2jv9tWNItA7iInA46uOWtZb4e3MMojFYIw4wznIJrk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uoUNqbtacaFFSbW3YyZJ937OSIKYiaVw1RKdh5xHFVMKZmJB5EXxY+Aof29rl/QNC
	 GO49vQvoZbztLc6x2WOd2llJigAK2j/NPSdA0WoRZ7OcTxzuNhShJc+P9JE28a3dpZ
	 cdHmNKTnN5P91BClRsnsoP8l7me1o3Oh66+XieI8=
Date: Thu, 10 Apr 2025 05:35:29 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] media: rcar-vin: Fix stride setting for RAW8 formats
Message-ID: <20250410023529.GD19277@pendragon.ideasonboard.com>
References: <20250402183302.140055-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250402183302.140055-1-niklas.soderlund+renesas@ragnatech.se>

Hi Niklas,

Thank you for the patch.

On Wed, Apr 02, 2025 at 08:33:02PM +0200, Niklas Söderlund wrote:
> Earlier versions of the datasheet where unclear about the stride setting
> for RAW8 capture formats. Later datasheets clarifies that the stride
> only process in this mode for non-image data. For image data the full
> stride shall be used. Compare section "RAW: 8 Bits and Embedded 8-Bit
> Non-Image Data, User Defined 8-bit Data" vs "RAW: 8 Bits".

I have a hard time telling anything from the documentation. Assuming
you've tested this to be correct,

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> Remove the special case from pixel formats that carry image data and
> treat it as any other image format.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
>  .../media/platform/renesas/rcar-vin/rcar-dma.c   | 16 ----------------
>  1 file changed, 16 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
> index f8394be8a922..fdf0f86c801f 100644
> --- a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
> +++ b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
> @@ -680,22 +680,6 @@ void rvin_crop_scale_comp(struct rvin_dev *vin)
>  
>  	fmt = rvin_format_from_pixel(vin, vin->format.pixelformat);
>  	stride = vin->format.bytesperline / fmt->bpp;
> -
> -	/* For RAW8 format bpp is 1, but the hardware process RAW8
> -	 * format in 2 pixel unit hence configure VNIS_REG as stride / 2.
> -	 */
> -	switch (vin->format.pixelformat) {
> -	case V4L2_PIX_FMT_SBGGR8:
> -	case V4L2_PIX_FMT_SGBRG8:
> -	case V4L2_PIX_FMT_SGRBG8:
> -	case V4L2_PIX_FMT_SRGGB8:
> -	case V4L2_PIX_FMT_GREY:
> -		stride /= 2;
> -		break;
> -	default:
> -		break;
> -	}
> -
>  	rvin_write(vin, stride, VNIS_REG);
>  }
>  

-- 
Regards,

Laurent Pinchart

