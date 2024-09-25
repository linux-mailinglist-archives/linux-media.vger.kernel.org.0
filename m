Return-Path: <linux-media+bounces-18567-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C72B9866D9
	for <lists+linux-media@lfdr.de>; Wed, 25 Sep 2024 21:27:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 79CFAB2113E
	for <lists+linux-media@lfdr.de>; Wed, 25 Sep 2024 19:27:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B721143C63;
	Wed, 25 Sep 2024 19:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Ld3+j3zf"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70B521422D4;
	Wed, 25 Sep 2024 19:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727292436; cv=none; b=m/6zILwIqZMaxXnxPr4FMKUnOiGAGZdlCiuyQ4uMp6q1p14BrqUpMD11JfVdT9eF0ao5ryI5j56+HfJ7BpbOHbLCmqq9CKcbCFpzSMxa1Hdkelo3BM4QrxJYEna8sGnfBIqmOwRsSJ4oKU75eCmbyM+jVNJujkIFPJkF2cOYpgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727292436; c=relaxed/simple;
	bh=d02yL61bwHOdp2ulyVt5n0+M1sAtTilcRj4+vN96hPY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lMw70OxuMAi6Zsf20TW5kSS6WY71KQCRZeDY46l6We5TrEBwOPYjebPp0fFgKJKDsPyNf+dvYYaYmXcRMUs3EklP4ioL6NejOlTjEJVOK71sPy1pBdOfy4HXwFp2/I7FvmhBtPfaCTdC8GOuv0oXmBVoIbqzDcxiC73AGmiHKIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Ld3+j3zf; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8F4DC7E2;
	Wed, 25 Sep 2024 21:25:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1727292345;
	bh=d02yL61bwHOdp2ulyVt5n0+M1sAtTilcRj4+vN96hPY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ld3+j3zfSBPtVBGa+hdHpuhuyjqtBcQJpKcfxFGXGL7U60zdQfI6rUxvwBHD19Irk
	 NR0zHezb+887NwFa6tl+gQZniG39pKi9Sy8pxeNJgN4Qoqov+2nBTodmFqcyX9ps80
	 EMtqtVI68iBmk/CTpzXYZApsn0ntS63gAYcBh6n4=
Date: Wed, 25 Sep 2024 22:27:11 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Tomasz Figa <tfiga@chromium.org>,
	Alan Stern <stern@rowland.harvard.edu>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Sean Paul <seanpaul@chromium.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: Re: [PATCH v6 4/4] media: uvcvideo: Exit early if there is not
 int_urb
Message-ID: <20240925192711.GE30399@pendragon.ideasonboard.com>
References: <20240614-guenter-mini-v6-0-7b7fdc3b21b3@chromium.org>
 <20240614-guenter-mini-v6-4-7b7fdc3b21b3@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240614-guenter-mini-v6-4-7b7fdc3b21b3@chromium.org>

Hi Ricardo,

Thank you for the patch.

On Fri, Jun 14, 2024 at 12:41:30PM +0000, Ricardo Ribalda wrote:
> If there is no int_urb there is no need to do a clean stop.
> 
> Also we avoid calling usb_kill_urb(NULL). It is properly handled by the
> usb framework, but it is not polite.
> 
> Now that we are at it, fix the code style in uvc_status_start() for
> consistency.
> 
> Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/usb/uvc/uvc_status.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_status.c b/drivers/media/usb/uvc/uvc_status.c
> index 8fd8250110e2..9108522beea6 100644
> --- a/drivers/media/usb/uvc/uvc_status.c
> +++ b/drivers/media/usb/uvc/uvc_status.c
> @@ -308,7 +308,7 @@ static int __uvc_status_start(struct uvc_device *dev, gfp_t flags)
>  {
>  	lockdep_assert_held(&dev->status_lock);
>  
> -	if (dev->int_urb == NULL)
> +	if (!dev->int_urb)
>  		return 0;
>  
>  	return usb_submit_urb(dev->int_urb, flags);
> @@ -320,6 +320,9 @@ static void __uvc_status_stop(struct uvc_device *dev)
>  
>  	lockdep_assert_held(&dev->status_lock);
>  
> +	if (!dev->int_urb)
> +		return;
> +
>  	/*
>  	 * Prevent the asynchronous control handler from requeing the URB. The
>  	 * barrier is needed so the flush_status change is visible to other
> 

-- 
Regards,

Laurent Pinchart

