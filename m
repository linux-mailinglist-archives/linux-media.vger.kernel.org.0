Return-Path: <linux-media+bounces-33656-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AE9DAC8D40
	for <lists+linux-media@lfdr.de>; Fri, 30 May 2025 13:58:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6D7091889797
	for <lists+linux-media@lfdr.de>; Fri, 30 May 2025 11:58:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED1D022A813;
	Fri, 30 May 2025 11:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="iS5+W6B7"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69D3F221566;
	Fri, 30 May 2025 11:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748606305; cv=none; b=m2v1QU0YUFqb4ClmBF/++NWsGEMEDKHlB+br/oMyWvqbwU92BClEcKivjjzu4elR83B6+cnnbSJ0bgbGDvG/6hs8Jzvq0jQnAxM5crNroU5KAb7AA2X1NZBYf5FHgaRkRBI7qWOqHA6fHejCBM0h/P2L5QYEKyXvavKA4MA7gIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748606305; c=relaxed/simple;
	bh=Q09kJEccQ9ehv/UlvNwuXD0ZbzoJ84GZhOVmRxyiVi8=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=oaHSXHN4Oz6/peq/3CgpVar1L5XFJg9gpjfQySaq47JMB06CeLWqvl9E0v6IHB26HN8UsMEA2Iw8QpUxjMkeVOCVupCZPZnpiD9vafZ9Mpnqqt6Jzoo8l3cx0y+ptj63GQw2GRbglZfmiUqh9edVVuP4dvedZIaX43Z3ebJ2dqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=iS5+W6B7; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5E02689A;
	Fri, 30 May 2025 13:57:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1748606273;
	bh=Q09kJEccQ9ehv/UlvNwuXD0ZbzoJ84GZhOVmRxyiVi8=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=iS5+W6B7mtkRL6TxMjibedoVjCoMI9IbC5+t4ts0idW3XHZapz7cBdRHZIir7D0It
	 nmt9EKMz2d6t1NMRUTTeX9fcsK6HNN57EbYMJUDaxm8ei6UCogeFChW0j4/IZ0Frov
	 OBY55vKcWJG219yFeDfmR0ylvvU78wF16nySvYOk=
Message-ID: <4ea2b464-81d8-486d-bce1-540e1cecb87b@ideasonboard.com>
Date: Fri, 30 May 2025 14:58:17 +0300
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

This one breaks RAW8 for me (V4H, streams, GMSL2 + imx219 sensors). How
did you test this?

 Tomi


