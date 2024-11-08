Return-Path: <linux-media+bounces-21180-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F17FC9C20D0
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2024 16:42:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2D2411C221BD
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2024 15:42:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E92A921B433;
	Fri,  8 Nov 2024 15:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="cbFXexrC"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9A601EF0BD
	for <linux-media@vger.kernel.org>; Fri,  8 Nov 2024 15:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731080566; cv=none; b=AD7ubrGPqpMCML5EZ7TYE/Ikrkzuv58unAgsujLmbap1MKHtLARzM4w+iOtOP+EtwbAUOPfTFN0P+FUTm0dey7yhdiPJrzPzRbFW/+vJJ5IKl6AMXi7nb4s/uZu4mJoA/kCDxib9qJAQZZQZ0FwcXADcr3nU8mudYw8ncyayuhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731080566; c=relaxed/simple;
	bh=KPf50oOHQMYR2x0VoTVcyrJxHprdaQRq1DdEMG+7L8k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WpuJ3IarNBBgi8Rc+G6D/aIuwDDkMN/MiWLzrBDyZbelKtnDZKEM8OLY/8tYT4H1Bg+nFjyechDQ6TqNUAT/tJazxp86EidoyrnY13qA9gsfDhHZdm8C3ABc/BTzjMnt043BKcLUZrf5nrI46BG9s5m3hUQJNIyT4gX4N6vG2l0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=cbFXexrC; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 37FD22E0;
	Fri,  8 Nov 2024 16:42:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1731080553;
	bh=KPf50oOHQMYR2x0VoTVcyrJxHprdaQRq1DdEMG+7L8k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cbFXexrCvGMh19O+JWgLxqREuQKKfBu/aQRhnXsnS42IyeEegy7TwryfZXm6xSiRr
	 xF0fJH+XChRL5Rp+/9ERwtNPV5M9aALtuoBIvqyIWVISRLgIktq5mZudz3tqRug1uX
	 7PCYTA5HDZtYqrxwH8c3fARel46/pmbBLp2Jf/YU=
Date: Fri, 8 Nov 2024 17:42:36 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Isaac Scott <isaac.scott@ideasonboard.com>
Cc: mchehab@kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH 1/3] media: uvcvideo: Introduce header length
Message-ID: <20241108154236.GA8784@pendragon.ideasonboard.com>
References: <20241108142310.19794-1-isaac.scott@ideasonboard.com>
 <20241108142310.19794-2-isaac.scott@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241108142310.19794-2-isaac.scott@ideasonboard.com>

Hi Isaac,

Thank you for the patch.

On Fri, Nov 08, 2024 at 02:23:08PM +0000, Isaac Scott wrote:
> The uvc_video_decode_start function returns the first byte of the header,
> which is in fact the length of the header. Improve readability by using an
> appropriately named variable.
> 
> Signed-off-by: Isaac Scott <isaac.scott@ideasonboard.com>
> ---
>  drivers/media/usb/uvc/uvc_video.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> index e00f38dd07d9..2fb9f2b59afc 100644
> --- a/drivers/media/usb/uvc/uvc_video.c
> +++ b/drivers/media/usb/uvc/uvc_video.c
> @@ -1117,6 +1117,7 @@ static int uvc_video_decode_start(struct uvc_streaming *stream,
>  		struct uvc_buffer *buf, const u8 *data, int len)
>  {
>  	u8 fid;
> +	u8 header_len = data[0];

Is there a guarantee at this point, before the sanity checks below, that
len is not zero, that is, that it's safe to read data[0] ?

>  
>  	/*
>  	 * Sanity checks:
> @@ -1212,7 +1213,7 @@ static int uvc_video_decode_start(struct uvc_streaming *stream,
>  
>  	stream->last_fid = fid;
>  
> -	return data[0];
> +	return header_len;
>  }
>  
>  static inline enum dma_data_direction uvc_stream_dir(

-- 
Regards,

Laurent Pinchart

