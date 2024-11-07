Return-Path: <linux-media+bounces-21071-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ACF5D9C098F
	for <lists+linux-media@lfdr.de>; Thu,  7 Nov 2024 16:04:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5EA9A1F248ED
	for <lists+linux-media@lfdr.de>; Thu,  7 Nov 2024 15:04:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D305A212181;
	Thu,  7 Nov 2024 15:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="h33k/CuK"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92D7680C02
	for <linux-media@vger.kernel.org>; Thu,  7 Nov 2024 15:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730991883; cv=none; b=PvCSDGJ+hkpUdTIXexLmQHN0zpGJ1JdADnpExMo6IDf014r3YCdBudj7u5HPGI39COpB9mvRVSUS2aEWRXeeZf5Iub9+PoPBz61zF4ddsZRJIVVR1rx33TOecgKW2TgLObGiR++uEW106HZDnFJo7aVSqqnmxBOcg6eet/U9wJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730991883; c=relaxed/simple;
	bh=IweKoLZ0DPzTmKU0/ojOyQK2aOLddZArsMI8apEyTBY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bkZQIY/oFck20CEMv1lL9cczQVLPOfuIVP3z7pIY+Yzckw2jsZ+0rjSs8/CZ9hSa6A+JeK8CfdmiEdi9nB0EoR7eMAcwVysRpkwOD0IIxgpgq2adGUQLUs+lBsN77uvENDpnq35c5KkmO6dR/tFP3mAeICKD6xXMNwSSx0VJ3+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=h33k/CuK; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5854022A;
	Thu,  7 Nov 2024 16:04:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1730991869;
	bh=IweKoLZ0DPzTmKU0/ojOyQK2aOLddZArsMI8apEyTBY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h33k/CuKh+7rAFLa27PzQX718I99vR8ELK+4GSzmRUvmc4cbl0b0/sEW33L7AWC3Y
	 2nqNckP6cai0qvYaVuSTxK1UrHRoCtQ+HQx0RLfw9NwNbhdm++wVFwaDvkQxzyqv4G
	 RbW2FzELJFlhklPUM/hhS9h7z3KG5zNxoO/23wZE=
Date: Thu, 7 Nov 2024 17:04:32 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Benoit Sevens <bsevens@google.com>
Cc: linux-media@vger.kernel.org, gregkh@linuxfoundation.org,
	stable@kernel.org
Subject: Re: [PATCH v1 1/2] media: uvcvideo: Skip parsing frames of type
 UVC_VS_UNDEFINED in uvc_parse_format
Message-ID: <20241107150432.GD31474@pendragon.ideasonboard.com>
References: <20241107142204.1182969-1-bsevens@google.com>
 <20241107142204.1182969-2-bsevens@google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241107142204.1182969-2-bsevens@google.com>

Hi Benoît,

Thank you for the patch.

On Thu, Nov 07, 2024 at 02:22:02PM +0000, Benoit Sevens wrote:
> This can lead to out of bounds writes since frames of this type were not
> taken into account when calculating the size of the frames buffer in
> uvc_parse_streaming.
> 
> Fixes: c0efd232929c ("V4L/DVB (8145a): USB Video Class driver")
> Signed-off-by: Benoit Sevens <bsevens@google.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/usb/uvc/uvc_driver.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index 0fac689c6350..13db0026dc1a 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -371,7 +371,7 @@ static int uvc_parse_format(struct uvc_device *dev,
>  	 * Parse the frame descriptors. Only uncompressed, MJPEG and frame
>  	 * based formats have frame descriptors.
>  	 */
> -	while (buflen > 2 && buffer[1] == USB_DT_CS_INTERFACE &&
> +	while (ftype && buflen > 2 && buffer[1] == USB_DT_CS_INTERFACE &&
>  	       buffer[2] == ftype) {
>  		unsigned int maxIntervalIndex;
>  

-- 
Regards,

Laurent Pinchart

