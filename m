Return-Path: <linux-media+bounces-10805-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1521A8BC3BD
	for <lists+linux-media@lfdr.de>; Sun,  5 May 2024 22:51:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 42BD7B21B36
	for <lists+linux-media@lfdr.de>; Sun,  5 May 2024 20:51:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E62874427;
	Sun,  5 May 2024 20:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="h67GlyKS"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA29520319;
	Sun,  5 May 2024 20:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714942255; cv=none; b=NfB2sFe2SIxSsLIeArUcy+Aa3MLPhDnU8S5xyE/lgruFG6zDkZ1TUQc3NEaXEscIH1Fal6spDqXM9P06FcYBREGl8Xc33bfXzoEni1S22tN32eHUWkRBwzTNk04IH5DLsxuw9cwJfZ9QyszpoQhH9z7lbLBAr9TO7a0qA7AkzS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714942255; c=relaxed/simple;
	bh=cDiiDkPmuBQewXzrjATUKiA581VSJ6vyeECz8ismKKg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NehD+n3q9wgaYCk+LJxz6SDllEHELkQDbPqS9gVdcb0Lz/brmx0Qq1gyw5Q4i85hY+xk36byP7vHgRgZoP+UyQ9dcyQdbyJ9+xkmGgDqR/XApSJwmKoYQs0B2a1x+1UXz3o0ShXXwfVVpi5Va6qSRKAwKD2g6TG+lkuFtnbKfBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=h67GlyKS; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6073E63B;
	Sun,  5 May 2024 22:50:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1714942249;
	bh=cDiiDkPmuBQewXzrjATUKiA581VSJ6vyeECz8ismKKg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h67GlyKSmoqx79PklNUvA2UJi5m11W4zmJ00cYKFmJjS1/vsd12RBgHqlr9uD9V6g
	 FEt02nYaU8TjjFevIeopYbUgE+0akeZMPto0fgtBEg3Hz88RQAq1M13dDJzLUrZI2d
	 QgtJad2Sdv4LoUmAzLuw3ZqMwiZK1eWP9WRejmUQ=
Date: Sun, 5 May 2024 23:50:43 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 01/11] media: rcar-vin: Fix YUYV8_1X16 handling for CSI-2
Message-ID: <20240505205043.GA25518@pendragon.ideasonboard.com>
References: <20240503155127.105235-1-jacopo.mondi@ideasonboard.com>
 <20240503155127.105235-2-jacopo.mondi@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240503155127.105235-2-jacopo.mondi@ideasonboard.com>

Hi Jacopo,

Thank you for the patch.

On Fri, May 03, 2024 at 05:51:16PM +0200, Jacopo Mondi wrote:
> The YUYV8_1X16 and UYVY8_1X16 formats are treated as 'ITU-R
> BT.601/BT.1358 16-bit YCbCr-422 input' (YUV16 - 0x5) in the R-Car VIN
> driver and are thus disallowed when capturing frames from the R-Car
> CSI-2 interface according to the hardware manual.
> 
> As the 1X16 format variants are meant to be used with serial busses they
> have to be treated as 'YCbCr-422 8-bit data input' (0x1) when capturing
> from CSI-2, which is a valid setting for CSI-2.
> 
> Commit 78b3f9d75a62 ("media: rcar-vin: Add check that input interface
> and format are valid") disallowed capturing YUV16 when using the CSI-2
> interface. Fix this by using YUV8_BT601 for YCbCr422 when CSI-2 is in
> use.
> 
> Fixes: 78b3f9d75a62 ("media: rcar-vin: Add check that input interface and format are valid")
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
>  .../media/platform/renesas/rcar-vin/rcar-dma.c   | 16 +++++++++++++---
>  1 file changed, 13 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
> index e2c40abc6d3d..21d5b2815e86 100644
> --- a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
> +++ b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
> @@ -742,12 +742,22 @@ static int rvin_setup(struct rvin_dev *vin)
>  	 */
>  	switch (vin->mbus_code) {
>  	case MEDIA_BUS_FMT_YUYV8_1X16:
> -		/* BT.601/BT.1358 16bit YCbCr422 */
> -		vnmc |= VNMC_INF_YUV16;
> +		if (vin->is_csi)
> +			/* YCbCr422 8-bit */
> +			vnmc |= VNMC_INF_YUV8_BT601;
> +		else
> +			/* BT.601/BT.1358 16bit YCbCr422 */
> +			vnmc |= VNMC_INF_YUV16;
>  		input_is_yuv = true;
>  		break;
>  	case MEDIA_BUS_FMT_UYVY8_1X16:
> -		vnmc |= VNMC_INF_YUV16 | VNMC_YCAL;
> +		if (vin->is_csi)
> +			/* YCbCr422 8-bit */
> +			vnmc |= VNMC_INF_YUV8_BT601;
> +		else
> +			/* BT.601/BT.1358 16bit YCbCr422 */
> +			vnmc |= VNMC_INF_YUV16;
> +		vnmc |= VNMC_YCAL;

You could also write

	case MEDIA_BUS_FMT_UYVY8_1X16:
		vnmc |= VNMC_YCAL;
		fallthrough;
	case MEDIA_BUS_FMT_YUYV8_1X16:
		if (vin->is_csi)
			/* YCbCr422 8-bit */
			vnmc |= VNMC_INF_YUV8_BT601;
		else
			/* BT.601/BT.1358 16bit YCbCr422 */
			vnmc |= VNMC_INF_YUV16;
		input_is_yuv = true;
		break;

Up to you.

On a side note, CSI-2 isn't supposed to support
MEDIA_BUS_FMT_YUYV8_1X16. The native format is MEDIA_BUS_FMT_UYVY8_1X16.
I wonder if we should trim down the list of supported formats. That's a
candidate for another patch though.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

>  		input_is_yuv = true;
>  		break;
>  	case MEDIA_BUS_FMT_UYVY8_2X8:

-- 
Regards,

Laurent Pinchart

