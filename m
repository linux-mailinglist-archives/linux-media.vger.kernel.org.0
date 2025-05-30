Return-Path: <linux-media+bounces-33657-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3918AC8D55
	for <lists+linux-media@lfdr.de>; Fri, 30 May 2025 14:09:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 718507A440D
	for <lists+linux-media@lfdr.de>; Fri, 30 May 2025 12:07:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D7E022ACFB;
	Fri, 30 May 2025 12:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="XaOl3FJ1"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE28F21CA1C;
	Fri, 30 May 2025 12:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748606942; cv=none; b=HWJD+4XDPE6JospCmtyI6j5qrKn34a+Lm5mqxeunSD5lRLuibwcGAz4FWNfb/QfGo451FfuKZO/AYz5y7RQZY2Ok7pG3RxxmWsbM38o9L8ZnWdSQdwPSU6nXchyCsU1rpZRPBuBCgPMv2fedEYIX1Ozi1WF357zu83flbvGrFMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748606942; c=relaxed/simple;
	bh=aGKmdWDo6AjEAjmm5qJD+uoDVfL5gYDm36emMKgChNo=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=WdRWVMKpvC86dZYmTI2Q1j7VFG2Z93gO3WD9XyaAYdP8nk6Iy0uu0LrDWLdZmpvVoDCIt7y8DWiBQqOj3FSDQ6+OYrY6xmaCq5YM7ZvqcW5XzPOPEp5I2JOj5zUxdsieD8oLUkIc3kZXlCqj5lle3hxPQArgMfEdVvLutrJFvBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=XaOl3FJ1; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2969B82E;
	Fri, 30 May 2025 14:08:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1748606911;
	bh=aGKmdWDo6AjEAjmm5qJD+uoDVfL5gYDm36emMKgChNo=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=XaOl3FJ1WglSuAYnOUcr6UXjuYRMPDS/5J+g89EQWdeIt9Ov8TV4fT/KtDxPAYnlf
	 0A/SJ+m3VdZh6CZwtDzYfVCdsw9i3AKfFIlL25BiK39v4l/Z9LCp+3lcvnf03W/hak
	 a+acx34SbBfRuBf0tNKUzF1h5ojhJWb1C1BpqvJs=
Message-ID: <62b34d44-14d3-4096-ba13-edd53bd3eb7c@ideasonboard.com>
Date: Fri, 30 May 2025 15:08:56 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: rcar-vin: Fix stride setting for RAW8 formats
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?=
 <niklas.soderlund+renesas@ragnatech.se>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20250402183302.140055-1-niklas.soderlund+renesas@ragnatech.se>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
In-Reply-To: <20250402183302.140055-1-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 02/04/2025 21:33, Niklas Söderlund wrote:
> Earlier versions of the datasheet where unclear about the stride setting
> for RAW8 capture formats. Later datasheets clarifies that the stride
> only process in this mode for non-image data. For image data the full
> stride shall be used. Compare section "RAW: 8 Bits and Embedded 8-Bit
> Non-Image Data, User Defined 8-bit Data" vs "RAW: 8 Bits".

Looking at the V4H manual, I see:

"
RAW: 8 Bits and Embedded 8-Bit Non-Image Data, User Defined 8-bit Data

The 8-bit RAW image data format, Embedded 8-bit non image data and User
Defined 8-bit data format are shown below. Notes: 1. These data are
transferred by 2-Byte unit.
"

and

"
RAW: 8 Bits (16 Bits/Pixel) Data

The 8-bit RAW (16 bits/pixel) image data format is shown below.
Notes: 1. These data are transferred by 2-Byte unit.
"

I don't see "RAW: 8 Bits". In both cases above the text says "2-byte unit".

 Tomi

> 
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


