Return-Path: <linux-media+bounces-33213-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D98AC15F6
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 23:40:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C1E2EA4241E
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 21:40:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4921B25743A;
	Thu, 22 May 2025 21:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="j5s00vs4"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3736C2571B5;
	Thu, 22 May 2025 21:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747950012; cv=none; b=eY4M5kDzrPPGi3sczA9MGFUgiIlul+XjHHWr05TQPd793KrdRk17AS1w5JiTS/5Ni2fUSuTVBPnBGcp937mrw42tOfFxM7F+Mvw7u+8ycPxs0J44VRuEzV7rgLDl497tKQ7/uZFD+77e8z25GV6KX7mlr+jM+q2IRVs4FQ5OrHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747950012; c=relaxed/simple;
	bh=h+ATXU0i9Nh+4a1PAb88ZJp8oEnYCnU5NA+KeuSvGTg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mOuT53k82A7Pv/jwx3AvGdREe1lP4ySs7AcAIJhjbtsX+C5I8Bg7RvJ5GnVioj6WG66aqKudqdY6gtE3x3qvMIttV8gYcjkOprdU/bUazIkkMuAXAnS4cdvRSNPBTKIjEwYvPjjq7Z6/wOJt0IwZvGg4/FFHMIsjBPyo9ulDrAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=j5s00vs4; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (179.218-130-109.adsl-dyn.isp.belgacom.be [109.130.218.179])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 40C1E605;
	Thu, 22 May 2025 23:39:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1747949987;
	bh=h+ATXU0i9Nh+4a1PAb88ZJp8oEnYCnU5NA+KeuSvGTg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j5s00vs4DiaQbBTXGt5YmD+P4c/anilboo1XGLK76A9ITW+pFdJK5cfApunHCsSb2
	 k6XhWFJuWPIzB5LHgzGzfYLxrkQGEJky+D95hlsU7axrDT7Ga7Juwke7Qwxyj1oiU6
	 FaWUJrxRT2xPnOj4+KyBp2mlsFiGbHDKmuWwEGeQ=
Date: Thu, 22 May 2025 23:40:02 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Hans de Goede <hdegoede@redhat.com>, Hans Verkuil <hans@jjverkuil.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] media: uvcvideo: Refactor uvc_queue_streamon
Message-ID: <20250522214002.GY12514@pendragon.ideasonboard.com>
References: <20250522-uvc-fop-v1-0-3bfe7a00f31d@chromium.org>
 <20250522-uvc-fop-v1-1-3bfe7a00f31d@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250522-uvc-fop-v1-1-3bfe7a00f31d@chromium.org>

Hi Ricardo,

Thank you for the patch.

On Thu, May 22, 2025 at 05:58:46PM +0000, Ricardo Ribalda wrote:
> Do uvc_pm_get before we call uvc_queue_streamon. Although the current
> code is correct, uvc_ioctl_streamon is allways called after uvc_pm_get,
> this change makes the code more resiliant to future changes.
> 
> Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/usb/uvc/uvc_v4l2.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> index 668a4e9d772c6d91f045ca75e2744b3a6c69da6b..862b4e34e5b629cf324479a9bb59ebe8784ccd5d 100644
> --- a/drivers/media/usb/uvc/uvc_v4l2.c
> +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> @@ -853,15 +853,16 @@ static int uvc_ioctl_streamon(struct file *file, void *fh,
>  	if (handle->is_streaming)
>  		return 0;
>  
> -	ret = uvc_queue_streamon(&stream->queue, type);
> +	ret = uvc_pm_get(stream->dev);
>  	if (ret)
>  		return ret;
>  
> -	ret = uvc_pm_get(stream->dev);
> +	ret = uvc_queue_streamon(&stream->queue, type);
>  	if (ret) {
> -		uvc_queue_streamoff(&stream->queue, type);
> +		uvc_pm_put(stream->dev);
>  		return ret;
>  	}
> +
>  	handle->is_streaming = true;
>  
>  	return 0;

-- 
Regards,

Laurent Pinchart

