Return-Path: <linux-media+bounces-23750-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3595A9F7161
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2024 01:31:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 88A8116BBA9
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2024 00:31:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A580C147;
	Thu, 19 Dec 2024 00:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="BOeXeI4q"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B15E917C;
	Thu, 19 Dec 2024 00:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734568298; cv=none; b=ZmflPLMFCEgxOa1yNR0ud7FWdt81xUV5L7nUpXx+v8ww2jR5amqLToCAtqaZyiVPmDfL/bYthuAyKU7eimIn6ef1to9344Ul8LGuyzcuhij823nAyCHyCKbdnQTX1JfTFgweJ/ytQPNtjEqYjop6gIIYxYrZSfyQY86uAxcx9ZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734568298; c=relaxed/simple;
	bh=458Zc6Ghcfg+BFioM/6Ofe2hH2TQki88zvKFUqlUd38=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RdUlqnY8ddiJBl7fszMOGSxd7ZvQGcRBlrM6mdCymzmt7H3xWDc3w+nprqIb/v7b18ARBOZuRFnUTmcbgsPrNdCNXDYdlcfZJyu9RhIb18etghK+N0yw4cQYJdQdYqjxwouHA34JUb7u5COMryAvkua5W25J51PX86RTcE5XuOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=BOeXeI4q; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5D67F163;
	Thu, 19 Dec 2024 01:30:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1734568256;
	bh=458Zc6Ghcfg+BFioM/6Ofe2hH2TQki88zvKFUqlUd38=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BOeXeI4q6JNqBn3lN/gT3hMEVfU6Wsm3nhK2RASlAxrC5aJrMvq60QLWL32AsWpbP
	 EXgZGvDdPQI1HLz4dOcrWLe6OfB0WLFvXPInzeDZTWSNQ+lGgmzZZe8RBdQUIl7x9Z
	 IOtDcQUz0dDivqyW5Ar1/FmFwwR9OigwA4vqpbog=
Date: Thu, 19 Dec 2024 02:31:30 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 5/5] media: uvcvideo: Flush the control cache when we
 get an event
Message-ID: <20241219003130.GJ5518@pendragon.ideasonboard.com>
References: <20241203-uvc-fix-async-v6-0-26c867231118@chromium.org>
 <20241203-uvc-fix-async-v6-5-26c867231118@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241203-uvc-fix-async-v6-5-26c867231118@chromium.org>

Hi Ricardo,

Thank you for the patch.

On Tue, Dec 03, 2024 at 09:20:12PM +0000, Ricardo Ribalda wrote:
> Asynchronous controls trigger an event when they have completed their
> operation.
> 
> This can make that the control cached value does not match the value in
> the device.
> 
> Let's flush the cache to be on the safe side.
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_ctrl.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index 3dc9b7a49f64..db29e0e8bfd4 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -1622,6 +1622,9 @@ void uvc_ctrl_status_event(struct uvc_video_chain *chain,
>  
>  	mutex_lock(&chain->ctrl_mutex);
>  
> +	/* Flush the control cache, the data might have changed. */
> +	ctrl->loaded = 0;
> +

That's better, covered by ctrl_mutex. There are however quite a few code
paths through which ctrl->loaded is accessed without holding the mutex
:-( Not a candidate for this series, but this should eventually be
fixed.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  	handle = ctrl->handle;
>  	if (handle)
>  		uvc_ctrl_set_handle(handle, ctrl, NULL);
> 

-- 
Regards,

Laurent Pinchart

