Return-Path: <linux-media+bounces-13350-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC9F190A0CD
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2024 01:26:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 11CCF281E2E
	for <lists+linux-media@lfdr.de>; Sun, 16 Jun 2024 23:26:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FDDB73451;
	Sun, 16 Jun 2024 23:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="v7pXrCCX"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B275149658
	for <linux-media@vger.kernel.org>; Sun, 16 Jun 2024 23:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718580394; cv=none; b=mVwes+08DJTvKNtLYqgCtpQSY+ZD6SzMlOMBDDUHs/4C1b3e/gcC1WBfcv+8uvjjlwf2eJM1V6q3wuaMu2Q1RtJdK9qHrE2kXP7GGtwEXI0KQnduvKxSVRJUfz8Sy03KEr2uPfUUXxBaW/+OqAIKUa9+Vl9K0Eb1pXsSniOmAtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718580394; c=relaxed/simple;
	bh=ERUtfhAHVMYSb25THubBmQfW/Y2xs/PZsW5zeFY0y1Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F8/Hm+piB4roO4RCXqcgdRMV/XD+u1gxOgYQ/HGeCBdXqKZNphuoIJK9Yzcppbf/vCAho8qDyzBGiGqaR4FfPXbawEKdINkAgjZl6aA3y27kaJ+NAZxzzRMFugr5KDoyQJkAXlejBoqQgPENHvKo1U7hcy4z69skjONFyYmbpEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=v7pXrCCX; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D1C57A9A;
	Mon, 17 Jun 2024 01:26:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718580375;
	bh=ERUtfhAHVMYSb25THubBmQfW/Y2xs/PZsW5zeFY0y1Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=v7pXrCCXdu6v9WQbCWCQsF1bAjPpfYPcUYxIN0fTzvrNykJoTIL4imo7Obwjne+Ze
	 zcKWa3TMlxqAGKm4PmSWY2mhINlTvODEjIl58tzcpGCZezHgPWCRdLGr3ZSPiurDQR
	 mcWouTcmyJWA3GvjXCY9F5PB3GO9obKKUSchDNs4=
Date: Mon, 17 Jun 2024 02:26:10 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Subject: Re: [PATCH] media: uvcvideo: fix the bandwdith quirk on USB 3.x
Message-ID: <20240616232610.GH4782@pendragon.ideasonboard.com>
References: <20240414190040.2255a0bc@foxbook>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240414190040.2255a0bc@foxbook>

Hi Michal,

Thank you for the patch.

On Sun, Apr 14, 2024 at 07:00:40PM +0200, Michal Pecio wrote:
> The bandwidth fixup quirk doesn't know that SuperSpeed exists and has
> the same 8 service intervals per millisecond as High Speed, hence its
> calculations are wrong.
> 
> Assume that all speeds from HS up use 8 intervals per millisecond.
> 
> No further changes are needed, updated code has been confirmed to work
> with all speeds from FS to SS.
> 
> Signed-off-by: Michal Pecio <michal.pecio@gmail.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/usb/uvc/uvc_video.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> index 28dde08ec6c5..4b86bef06a52 100644
> --- a/drivers/media/usb/uvc/uvc_video.c
> +++ b/drivers/media/usb/uvc/uvc_video.c
> @@ -214,13 +214,13 @@ static void uvc_fixup_video_ctrl(struct uvc_streaming *stream,
>  		 * Compute a bandwidth estimation by multiplying the frame
>  		 * size by the number of video frames per second, divide the
>  		 * result by the number of USB frames (or micro-frames for
> -		 * high-speed devices) per second and add the UVC header size
> -		 * (assumed to be 12 bytes long).
> +		 * high- and super-speed devices) per second and add the UVC
> +		 * header size (assumed to be 12 bytes long).
>  		 */
>  		bandwidth = frame->wWidth * frame->wHeight / 8 * format->bpp;
>  		bandwidth *= 10000000 / interval + 1;
>  		bandwidth /= 1000;
> -		if (stream->dev->udev->speed == USB_SPEED_HIGH)
> +		if (stream->dev->udev->speed >= USB_SPEED_HIGH)
>  			bandwidth /= 8;
>  		bandwidth += 12;
>  

-- 
Regards,

Laurent Pinchart

