Return-Path: <linux-media+bounces-33240-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 84B0FAC1EFA
	for <lists+linux-media@lfdr.de>; Fri, 23 May 2025 10:54:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F2A361B67A77
	for <lists+linux-media@lfdr.de>; Fri, 23 May 2025 08:55:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AEA3223DC6;
	Fri, 23 May 2025 08:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="vF7e7yia"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 173961EF368;
	Fri, 23 May 2025 08:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747990480; cv=none; b=mLkbICU8kVpm2cPnRKcVwehfEDjBWz9xWewQeAFaso6YnOG0RhMVuAQxZ78hk75QoPX98TUHXQIVK31q+VXAwDzSfh95IWfomIwuEfON+Gd/KaPmkI/jLGaU71eTLZQyDyVdF+Q9uP3FanjH1wqxNpLouQFkbiSi4SAn8L1LKGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747990480; c=relaxed/simple;
	bh=MjxuTkhnVdJdm2Od9+U+j0GCwsGx+2VCONvDGKbMvIA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JYlQyZzhSwbAFxwEfysSNrAz0uoNvamZJ7jRlLFy1avnPn0EYuWcxpuQANyB22ZDnu2JD1mZGtbiD6M8UwuY3rlM9DHzki73TiXRMYf+Qt1sbAuMQE8EnXypxk8sXGntz7iMwF0CnQRimcHJC8FnXy7FHyLgo+TqRi05GdaBdCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=vF7e7yia; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (179.218-130-109.adsl-dyn.isp.belgacom.be [109.130.218.179])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0EEF1346;
	Fri, 23 May 2025 10:54:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1747990455;
	bh=MjxuTkhnVdJdm2Od9+U+j0GCwsGx+2VCONvDGKbMvIA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vF7e7yiamqBNkdZYhOw6lRl1ylQIV/fQnbEiuQNW3mPCxy0cyyHUGxr34f6eLM5jz
	 ANJcpNrNdpWaAqEeBtmWfGwulGSlzrp7f1GZg3G+KTJj0MBItj3mjGKAjBsRLgCf9n
	 OxwUaJWXkaDJHCCu1JMWtskavXR1aPOdrl/lXj/I=
Date: Fri, 23 May 2025 10:54:30 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] media: uvcvideo: Refactor uvc_queue_streamon
Message-ID: <20250523085430.GB7516@pendragon.ideasonboard.com>
References: <20250509-uvc-followup-v1-0-73bcde30d2b5@chromium.org>
 <20250509-uvc-followup-v1-2-73bcde30d2b5@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250509-uvc-followup-v1-2-73bcde30d2b5@chromium.org>

Hi Ricardo,

Thank you for the patch.

On Fri, May 09, 2025 at 06:24:14PM +0000, Ricardo Ribalda wrote:
> Do uvc_pm_get before we call uvc_queue_streamon. Although the current
> code is correct, uvc_ioctl_streamon is allways called after uvc_pm_get,
> this change makes the code more resiliant to future changes.
> 
> Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

I've reviewed this as part of a separate series, and I'll copy

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

here for patchwork to pick.

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

