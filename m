Return-Path: <linux-media+bounces-12861-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A33BC90226E
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2024 15:09:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 12617B23053
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2024 13:09:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 968E481ACA;
	Mon, 10 Jun 2024 13:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="pW5Ox50I"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AC28DDC0;
	Mon, 10 Jun 2024 13:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718024974; cv=none; b=ln8B4ihJ23ioEbXMEM3X9yl37ICoKsuLo6arGHdCFa6DrxcT9q1vMA+4SvypLvnh+nc+4Te3JG8yxLrFDHdFolQZhE0hxl1z1MeWwd7v5BdVEoj1KUBMEAVwPHpJvSsuwrZb0kYp7jsLWno8AOtgDi4NP/Qi3qRSxlYkXLdE9iY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718024974; c=relaxed/simple;
	bh=P3HR2KD0zqsJGS2R7ct1yLvmTw5LrC648wwAWEh3bUg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fxs7ihslj9bOonxRzpklYUIWfgJUK/bGDth29KqQuBs+Vz+vt1oBw3V6JWvqpSzhkeaPhUezRg2jQJYHNb9eVUj3N05sV/RNCci7/VF21Q3xFlf5n6nx3SCFTzpTwW9w0KakXqUbaIZOjJ6M3H1hB1m+yjUNCrnmwiL2cB6Cs4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=pW5Ox50I; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A85A1397;
	Mon, 10 Jun 2024 15:09:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718024957;
	bh=P3HR2KD0zqsJGS2R7ct1yLvmTw5LrC648wwAWEh3bUg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pW5Ox50IAYhuClLVzAgESOCNu/rD3nRuNXCwV7pNawUfPV3JQPRAxzLLKT9teYaOd
	 0VNKnzH+GB/Lz0LgrkUon2N/ANy5yBl/nTA8LShcM2ofu05uMjRCNA7dMowBoc3bAz
	 XNhTD2V8481Nc5LOuTjQeFRnaN0JWhivSHPYaA78=
Date: Mon, 10 Jun 2024 16:09:10 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] media: uvcvideo: Enforce alignment of frame and
 interval
Message-ID: <20240610130910.GA12787@pendragon.ideasonboard.com>
References: <20240404-uvc-align-v2-1-9e104b0ecfbd@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240404-uvc-align-v2-1-9e104b0ecfbd@chromium.org>

Hi Ricardo,

Thank you for the patch.

On Thu, Apr 04, 2024 at 05:56:18PM +0000, Ricardo Ribalda wrote:
> Struct uvc_frame and interval (u32*) are packaged together on
> streaming->formats on a single contiguous allocation.
> 
> Right now they allocated right after uvc_format, without taking into

s/they/they are/

> consideration their required alignment.
> 
> This is working fine because both structures have a field with a
> pointer, but it will stop working when the sizeof() of any of those
> structs is not a multiple of the sizeof(void*).
> 
> Enforce that alignment during the allocation.
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
> This is better than 3 allocations, and do not have any performance
> penalty.
> 
> I have tried this patch printing the size and the address of the
> pointers in the old and the new mode, and it looks the same.
> 
> [    2.235223] drivers/media/usb/uvc/uvc_driver.c:694 uvc_parse_streaming 432
> [    2.235249] drivers/media/usb/uvc/uvc_driver.c:704 uvc_parse_streaming 432
> [    2.235256] drivers/media/usb/uvc/uvc_driver.c:714 uvc_parse_streaming 00000000d32087cc 00000000d3803788
> [    2.235265] drivers/media/usb/uvc/uvc_driver.c:720 uvc_parse_streaming 00000000d32087cc 00000000d3803788
> ---
> Changes in v2: Thanks Laurent.
> - Enforce alignment during allocation instead of using __aligned()
>   macros.
> - Link to v1: https://lore.kernel.org/r/20230501-uvc-align-v1-1-0f713e4b84c3@chromium.org
> ---
>  drivers/media/usb/uvc/uvc_driver.c | 20 +++++++++++++++-----
>  1 file changed, 15 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index 7aefa76a42b31..7d9844ba3b205 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -663,16 +663,26 @@ static int uvc_parse_streaming(struct uvc_device *dev,
>  		goto error;
>  	}
>  
> -	size = nformats * sizeof(*format) + nframes * sizeof(*frame)
> -	     + nintervals * sizeof(*interval);
> +	/*
> +	 * Allocate memory for the formats, the frames and the intervals,
> +	 * plus any required padding to guarantee that everything has the
> +	 * correct alignment.
> +	 */
> +	size = nformats * sizeof(*format);
> +	size = ALIGN(size, __alignof__(*frame)) + nframes * sizeof(*frame);
> +	size = ALIGN(size, __alignof__(*interval))
> +	       + nintervals * sizeof(*interval);

You have two extra spaces here. I'll fix when applying.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +
>  	format = kzalloc(size, GFP_KERNEL);
> -	if (format == NULL) {
> +	if (!format) {
>  		ret = -ENOMEM;
>  		goto error;
>  	}
>  
> -	frame = (struct uvc_frame *)&format[nformats];
> -	interval = (u32 *)&frame[nframes];
> +	frame = (void *)format + nformats * sizeof(*format);
> +	frame = PTR_ALIGN(frame, __alignof__(*frame));
> +	interval = (void *)frame + nframes * sizeof(*frame);
> +	interval = PTR_ALIGN(interval, __alignof__(*interval));
>  
>  	streaming->format = format;
>  	streaming->nformats = nformats;
> 
> ---
> base-commit: 58390c8ce1bddb6c623f62e7ed36383e7fa5c02f
> change-id: 20230501-uvc-align-6ff202b68dab

-- 
Regards,

Laurent Pinchart

