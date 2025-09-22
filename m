Return-Path: <linux-media+bounces-42937-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 61913B90E56
	for <lists+linux-media@lfdr.de>; Mon, 22 Sep 2025 13:56:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 18C167AC01F
	for <lists+linux-media@lfdr.de>; Mon, 22 Sep 2025 11:55:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6BC1305967;
	Mon, 22 Sep 2025 11:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="WkaMXQeu"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EA4B7464;
	Mon, 22 Sep 2025 11:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758542194; cv=none; b=kUcjGhohXjI4Enu/gsIBf/sFx1A8Q1x/KEb2mPkfTF34pxMcNGw2RcYdjh4qRn12bNGKVHxQIsfY5hiAFvWydzwrAW8vOp2QVL924EUj/E4KYUsUqzXr+YyrbRvWOkjEJvT7odjLW6gY1o+XROlPZpawJYAYcz/0CVwOH3ttc6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758542194; c=relaxed/simple;
	bh=ybSCxxTpBT2bbqNWagok58CggAmd8OGTfGj9T9+5rm0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Etk0q2ak5em5tqubCVHS8gl3gaGiZ44AGJPIcpMH4Af3gKsw6b7iPdLbIMTNf5+cKO/R38fELTZF6Xd4fqtZKPa3k+E0DPA45ubAaDJTYxEdtXA0KCSBF7xLLqOK/89qfGZiLrqjjv66gOLhMSg7YzC+jPxDEPe4noaUlXr2L8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=WkaMXQeu; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5CC9B446;
	Mon, 22 Sep 2025 13:55:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1758542107;
	bh=ybSCxxTpBT2bbqNWagok58CggAmd8OGTfGj9T9+5rm0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WkaMXQeuY0MfnF+XyMQxQFYbUFgUFHV9mZtZOd0pxeyAoqNfrsaO2lYAb64XveBl5
	 nD0cr7rvzZL75XCfVm7p7U0r90R/5IWPdK0tULPS/KDPHJ0qDfURs2KOe2+bsuwovE
	 R7Bg4sTEZrXAR1RwbOLlLbKOs6A8WCJOd5T1HPaw=
Message-ID: <4becc7fc-fe25-4f7c-9434-399b1c2c3cce@ideasonboard.com>
Date: Mon, 22 Sep 2025 14:56:25 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 01/16] media: ti: j721e-csi2rx: Remove word size
 alignment on frame width
To: Rishikesh Donadkar <r-donadkar@ti.com>, jai.luthra@linux.dev,
 laurent.pinchart@ideasonboard.com, mripard@kernel.org
Cc: y-abhilashchandra@ti.com, devarsht@ti.com, s-jain1@ti.com,
 vigneshr@ti.com, mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 p.zabel@pengutronix.de, conor+dt@kernel.org, sakari.ailus@linux.intel.com,
 hverkuil-cisco@xs4all.nl, jai.luthra@ideasonboard.com,
 changhuang.liang@starfivetech.com, jack.zhu@starfivetech.com,
 sjoerd@collabora.com, hverkuil+cisco@kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20250911102832.1583440-1-r-donadkar@ti.com>
 <20250911102832.1583440-2-r-donadkar@ti.com>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <20250911102832.1583440-2-r-donadkar@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 11/09/2025 13:28, Rishikesh Donadkar wrote:
> j721e-csi2rx driver has a limitation of frame width being a multiple
> word size. However, there is no such limitation imposed by the
> hardware [1].
> 
> Remove this limitation from the driver.
> 
> Link: https://www.ti.com/lit/pdf/spruj16
> Reviewed-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
> Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
> ---
>  .../platform/ti/j721e-csi2rx/j721e-csi2rx.c   | 23 ++++---------------
>  1 file changed, 4 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> index 3992f8b754b7..6a981b5f5d51 100644
> --- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> +++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> @@ -250,19 +250,12 @@ static void ti_csi2rx_fill_fmt(const struct ti_csi2rx_fmt *csi_fmt,
>  			       struct v4l2_format *v4l2_fmt)
>  {
>  	struct v4l2_pix_format *pix = &v4l2_fmt->fmt.pix;
> -	unsigned int pixels_in_word;
> -
> -	pixels_in_word = PSIL_WORD_SIZE_BYTES * 8 / csi_fmt->bpp;

The define for PSIL_WORD_SIZE_BYTES can also be removed, if I'm not
mistaken.

I assume this has been tested, but I'm still a bit curious. Usually
these kind of lines of code don't just appear out of nowhere. You linked
to AM62Ax docs. None of the other SoCs have any limitations here either?

PSIL_WORD_SIZE_BYTES hints to a system DMA level limit, not CSI-2 RX
limit, so I wonder if some earlier SoCs had such limitations in the DMA?

 Tomi

>  
>  	/* Clamp width and height to sensible maximums (16K x 16K) */
>  	pix->width = clamp_t(unsigned int, pix->width,
> -			     pixels_in_word,
> -			     MAX_WIDTH_BYTES * 8 / csi_fmt->bpp);
> +			     1, MAX_WIDTH_BYTES * 8 / csi_fmt->bpp);
>  	pix->height = clamp_t(unsigned int, pix->height, 1, MAX_HEIGHT_LINES);
>  
> -	/* Width should be a multiple of transfer word-size */
> -	pix->width = rounddown(pix->width, pixels_in_word);
> -
>  	v4l2_fmt->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
>  	pix->pixelformat = csi_fmt->fourcc;
>  	pix->bytesperline = pix->width * (csi_fmt->bpp / 8);
> @@ -360,23 +353,15 @@ static int ti_csi2rx_enum_framesizes(struct file *file, void *fh,
>  				     struct v4l2_frmsizeenum *fsize)
>  {
>  	const struct ti_csi2rx_fmt *fmt;
> -	unsigned int pixels_in_word;
>  
>  	fmt = find_format_by_fourcc(fsize->pixel_format);
>  	if (!fmt || fsize->index != 0)
>  		return -EINVAL;
>  
> -	/*
> -	 * Number of pixels in one PSI-L word. The transfer happens in multiples
> -	 * of PSI-L word sizes.
> -	 */
> -	pixels_in_word = PSIL_WORD_SIZE_BYTES * 8 / fmt->bpp;
> -
>  	fsize->type = V4L2_FRMSIZE_TYPE_STEPWISE;
> -	fsize->stepwise.min_width = pixels_in_word;
> -	fsize->stepwise.max_width = rounddown(MAX_WIDTH_BYTES * 8 / fmt->bpp,
> -					      pixels_in_word);
> -	fsize->stepwise.step_width = pixels_in_word;
> +	fsize->stepwise.min_width = 1;
> +	fsize->stepwise.max_width = MAX_WIDTH_BYTES * 8 / fmt->bpp;
> +	fsize->stepwise.step_width = 1;
>  	fsize->stepwise.min_height = 1;
>  	fsize->stepwise.max_height = MAX_HEIGHT_LINES;
>  	fsize->stepwise.step_height = 1;


