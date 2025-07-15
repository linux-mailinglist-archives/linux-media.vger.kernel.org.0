Return-Path: <linux-media+bounces-37822-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C68B069C6
	for <lists+linux-media@lfdr.de>; Wed, 16 Jul 2025 01:15:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D41A84E5EBD
	for <lists+linux-media@lfdr.de>; Tue, 15 Jul 2025 23:15:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D36BB2D0C7C;
	Tue, 15 Jul 2025 23:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="OkSWY44U"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C14929CE1;
	Tue, 15 Jul 2025 23:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752621338; cv=none; b=ax0xdRUKiE4dcCw/EJqcaB+I0cnRgDAi0hbLxkRrDRAp+HNjo9O2cC46ZHo8T3yEIoVWCBYWiod26fysxqm9FOnpfxlRnl5tc8wtRyBMBeWZl39b97+Tp+ASrYY+cEGOTSDkTyrWT0E9kHMEDdxHjtZHA0eDUVZECi8m9LAFnY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752621338; c=relaxed/simple;
	bh=THq+VAUqqtf/9iHap/uJpT8Wkgc5Ws/A7kV1CmO4kS8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ricH+O8Qx2Haf6pFTrW8Y2bM52mhJ3TJK0XWnH6D/cygimsvLATriZCIioIlOp1riyIiVY9yUPQ1a3ClWPSS/Gl+ulkXDSiM4T6hFicfxMtzXYhG6B+z80RRW3dsiBJhiSg3vGROAleyoN57wjBTKY8N7mekX5vt6bl8AmkNc+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=OkSWY44U; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 5D4FA351;
	Wed, 16 Jul 2025 01:15:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1752621301;
	bh=THq+VAUqqtf/9iHap/uJpT8Wkgc5Ws/A7kV1CmO4kS8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OkSWY44UqfrTL7A6Zxlvw8OLmzHevF6j6lJIdzc9wg4DudDhnjMLZm6+/KX+w6Ogl
	 WxXRUoZeHnyk2iyzyaN1ynArU7GgX4Tk0Bdth+XuIS1iuWFLovJVnHj5JqyoQiZ1ME
	 0K2u0ssssQFKH+OhWg6Ur9hf4AvH8PZ4UwtF/SIY=
Date: Wed, 16 Jul 2025 02:15:32 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: uvcvideo: Fix comments in uvc_meta_detect_msxu
Message-ID: <20250715231532.GA13915@pendragon.ideasonboard.com>
References: <20250714-uvc-meta-followup-v1-1-67bd2dc05ef2@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250714-uvc-meta-followup-v1-1-67bd2dc05ef2@chromium.org>

Hi Ricardo,

On Mon, Jul 14, 2025 at 04:45:43PM +0000, Ricardo Ribalda wrote:
> The comments can be more precise. Let's fix them.
> 
> Fixes: 6cb786f040ad ("media: uvcvideo: Auto-set UVC_QUIRK_MSXU_META")
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
> This series fixes the uvc metadata series landed in:
> https://patchwork.linuxtv.org/project/linux-media/patch/998c5fb0-8d32-496c-a1e2-cc9c1a73ede0@kernel.org/
> 
> There is no need to Cc: stable, because the series have not landed in
> any stable kernel.
> ---
>  drivers/media/usb/uvc/uvc_metadata.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_metadata.c b/drivers/media/usb/uvc/uvc_metadata.c
> index 229e08ff323eed9129d835b24ea2e8085bb713b8..2905e46514d74cee09215d86e8eb7ad6e787ece1 100644
> --- a/drivers/media/usb/uvc/uvc_metadata.c
> +++ b/drivers/media/usb/uvc/uvc_metadata.c
> @@ -196,7 +196,10 @@ static int uvc_meta_detect_msxu(struct uvc_device *dev)
>  	if (!data)
>  		return -ENOMEM;
>  
> -	/* Check if the metadata is already enabled. */
> +	/*
> +	 * Check if the metadata is already enabled, or if the device always
> +	 * returns metadata.
> +	 */
>  	ret = uvc_query_ctrl(dev, UVC_GET_CUR, entity->id, dev->intfnum,
>  			     MSXU_CONTROL_METADATA, data, sizeof(*data));
>  	if (ret)
> @@ -208,9 +211,9 @@ static int uvc_meta_detect_msxu(struct uvc_device *dev)
>  	}
>  
>  	/*
> -	 * We have seen devices that require 1 to enable the metadata, others
> -	 * requiring a value != 1 and others requiring a value >1. Luckily for
> -	 * us, the value from GET_MAX seems to work all the time.
> +	 * Set the value of MSXU_CONTROL_METADATA to the value from GET_MAX to
> +	 * enable the production of MSXU metadata.

Let's expand this to tell why we return early when GET_MAX returns 0.

	 * Set the value of MSXU_CONTROL_METADATA to the value reported by
	 * GET_MAX to enable production of MSXU metadata. The GET_MAX request
	 * reports the maximum size of the metadata, if its value is 0 then MSXU
	 * metadata is not supported. For more information, see
	 * https://learn.microsoft.com/en-us/windows-hardware/drivers/stream/uvc-extensions-1-5#2229-metadata-control

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +	 * https://learn.microsoft.com/en-us/windows-hardware/drivers/stream/uvc-extensions-1-5#2229-metadata-control
>  	 */
>  	ret = uvc_query_ctrl(dev, UVC_GET_MAX, entity->id, dev->intfnum,
>  			     MSXU_CONTROL_METADATA, data, sizeof(*data));
> 
> ---
> base-commit: d968e50b5c26642754492dea23cbd3592bde62d8
> change-id: 20250714-uvc-meta-followup-1ccb6e8efc2b

-- 
Regards,

Laurent Pinchart

