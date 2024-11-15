Return-Path: <linux-media+bounces-21445-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AF509CCFAF
	for <lists+linux-media@lfdr.de>; Fri, 15 Nov 2024 01:34:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 31EC12825D3
	for <lists+linux-media@lfdr.de>; Fri, 15 Nov 2024 00:34:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DF3838DC0;
	Fri, 15 Nov 2024 00:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="WAirH+7v"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 769AE1E4A9;
	Fri, 15 Nov 2024 00:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731630855; cv=none; b=tLsdRRTOmosKivr5jHvIROcD6QVeWDJ6rQk8p4xOucArwxoxAk+PNedOfbJqtI1GFDYlOy30YxRBtQA3QPXMOU/sch6woAlQvL0NmBKWpFCtIasbC7WGAOQp8Du0Eojghi1EXZvdB4bG51h84RuC9mNe4Uz0sIWdZFQdNGNVA9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731630855; c=relaxed/simple;
	bh=rBoI67vQ1EQnkFX0pf9Pdh59absDICM5ehoSjvK93Yo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QfZTe6hKdvbbtUgBtz64jVGldBD7n4dMAQo5Jth77f4gYxy8/uEbQQ2wMkicJ+znoQKLrgtrWWY9esK3vm55UciwJ1zfSNB94a5xwpq9hfRV+uwE5JJjK2cmCQI4x/ePKnL/GqVZ1L48v1Ccx2J+n2dSIe1TR7uRxCQB5aBiyjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=WAirH+7v; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C3225502;
	Fri, 15 Nov 2024 01:33:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1731630838;
	bh=rBoI67vQ1EQnkFX0pf9Pdh59absDICM5ehoSjvK93Yo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WAirH+7vP92sL8PRYkVG6wUSgeP3KVGSVpbQ4DLNOPFYelz2l5oB53V32hemL6Psg
	 8qg15DRTZrHvlCQgybLTO4I8OheDcpfN3eKDAj7Y+hCuiBC5sDZ1yBLEst4ga/5OYV
	 68hpwfNPcrcSyOiDx+44GNnAECxHMcMsPOyCX6g4=
Date: Fri, 15 Nov 2024 02:34:03 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] media: uvcvideo: Fix event flags in uvc_ctrl_send_events
Message-ID: <20241115003403.GP26171@pendragon.ideasonboard.com>
References: <20241114-uvc-fix-event-v1-1-6c580ccf0766@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241114-uvc-fix-event-v1-1-6c580ccf0766@chromium.org>

Hi Ricardo,

Thank you for the patch.

On Thu, Nov 14, 2024 at 12:17:51PM +0000, Ricardo Ribalda wrote:
> If there is an event that needs the V4L2_EVENT_CTRL_CH_FLAGS flag, all
> the following events will have that flag, regardless if they need it or
> not.
> 
> This is because we keep using the same variable all the time and we do
> not reset its original value.
> 
> Cc: stable@vger.kernel.org
> Fixes: 805e9b4a06bf ("[media] uvcvideo: Send control change events for slave ctrls when the master changes")
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Good catch.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/usb/uvc/uvc_ctrl.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index e59a463c2761..5314e7864c49 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -1626,13 +1626,13 @@ static void uvc_ctrl_send_events(struct uvc_fh *handle,
>  {
>  	struct uvc_control_mapping *mapping;
>  	struct uvc_control *ctrl;
> -	u32 changes = V4L2_EVENT_CTRL_CH_VALUE;
>  	unsigned int i;
>  	unsigned int j;
>  
>  	for (i = 0; i < xctrls_count; ++i) {
> -		ctrl = uvc_find_control(handle->chain, xctrls[i].id, &mapping);
> +		u32 changes = V4L2_EVENT_CTRL_CH_VALUE;
>  
> +		ctrl = uvc_find_control(handle->chain, xctrls[i].id, &mapping);
>  		if (ctrl->info.flags & UVC_CTRL_FLAG_ASYNCHRONOUS)
>  			/* Notification will be sent from an Interrupt event. */
>  			continue;
> 
> ---
> base-commit: b14257abe7057def6127f6fb2f14f9adc8acabdb
> change-id: 20241114-uvc-fix-event-272df1585bb3

-- 
Regards,

Laurent Pinchart

