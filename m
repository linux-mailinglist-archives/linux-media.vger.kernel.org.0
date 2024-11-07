Return-Path: <linux-media+bounces-21084-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 42D959C1149
	for <lists+linux-media@lfdr.de>; Thu,  7 Nov 2024 22:51:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 750E21C214A5
	for <lists+linux-media@lfdr.de>; Thu,  7 Nov 2024 21:51:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01E8021893D;
	Thu,  7 Nov 2024 21:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ON1Eja4m"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4482218929;
	Thu,  7 Nov 2024 21:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731016274; cv=none; b=GDTX30okW/R19tXD9EaEYESc2kv1EcKxHf1xN7t+7aqF3qcTjivGDefMdq2J32kFdjRVwrbyXURdIJJ2BI1Viedsw0XTCI1p9FyzS3CKzgWUQX0lhKlmr+RjmF8io87D6nbaNxo2iQfu9GtCrGw9RtHYbkqdVV0pUoUCdruKTmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731016274; c=relaxed/simple;
	bh=gnfMehFRVgC3i7JZlRyYVOEofZhOBk9nr7mH0h+jCQU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rms2vpuIcRrhU4PZ86gkYx5t+vG1MH8WknvhJOiKAavlpG9/W3sQdz1p0c+HT8H1d6n87VvXXv25Np/ZtfAk34apPzDYjK59/bLQgD87QtAi+G72mC8mydewGr2ow1SfyDZfM5k0GBrCRM7M8wcsV5fdq33YpgT4uNLYTDvrTCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ON1Eja4m; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A8B5C792;
	Thu,  7 Nov 2024 22:51:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1731016261;
	bh=gnfMehFRVgC3i7JZlRyYVOEofZhOBk9nr7mH0h+jCQU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ON1Eja4mVSkyAxLdcbciHncKvFErykxTb1wG1oXOsap+ugjMen/ij+cgkTF3yYHUo
	 p+voyfYD7XbI35GPB6mpkgUqqaSovylKrnpPbVNTzIxULW5EJYFhxZHG72FX5ngyuV
	 2PrCf3R1rsv/fVJqInPXxRJDdlckdMtvhtD5wI0M=
Date: Thu, 7 Nov 2024 23:51:04 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: uvcvideo: Reorder uvc_status_init()
Message-ID: <20241107215104.GH31474@pendragon.ideasonboard.com>
References: <20241022-order_status-v1-1-3904fafca340@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241022-order_status-v1-1-3904fafca340@chromium.org>

Hi Ricardo,

Thank you for the patch.

On Tue, Oct 22, 2024 at 08:37:13AM +0000, Ricardo Ribalda wrote:
> Only initialize the input device if the interrupt endpoint has been
> properly initialized.
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/usb/uvc/uvc_status.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_status.c b/drivers/media/usb/uvc/uvc_status.c
> index 06c867510c8f..02c90acf6964 100644
> --- a/drivers/media/usb/uvc/uvc_status.c
> +++ b/drivers/media/usb/uvc/uvc_status.c
> @@ -262,8 +262,6 @@ int uvc_status_init(struct uvc_device *dev)
>  	if (ep == NULL)
>  		return 0;
>  
> -	uvc_input_init(dev);
> -
>  	dev->status = kzalloc(sizeof(*dev->status), GFP_KERNEL);
>  	if (!dev->status)
>  		return -ENOMEM;
> @@ -289,6 +287,8 @@ int uvc_status_init(struct uvc_device *dev)
>  		dev->status, sizeof(*dev->status), uvc_status_complete,
>  		dev, interval);
>  
> +	uvc_input_init(dev);
> +
>  	return 0;
>  }
>  
> 
> ---
> base-commit: 698b6e3163bafd61e1b7d13572e2c42974ac85ec
> change-id: 20241022-order_status-b1d985f7423c

-- 
Regards,

Laurent Pinchart

