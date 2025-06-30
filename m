Return-Path: <linux-media+bounces-36349-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7607AAEEA04
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 00:10:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ACA153BD1E0
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 22:09:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98DAF28C031;
	Mon, 30 Jun 2025 22:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="RL89DStq"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AB1A253350;
	Mon, 30 Jun 2025 22:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751321393; cv=none; b=fWR8SzdGgTfDMH2InkH34Tw6uPQLWO8rPlk1sL3IaqXyt/jLYt2vG+BFVimNAbvfqqOhuboocFOZAXvC7c90FLdUwUDG2wB4H5C35DoY1LE1iPV6ILf8Iq7Ag584QDhvm2Rg8kAF/KwG/BxfBP1EHLdM5A54aLSCiMooMTltQkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751321393; c=relaxed/simple;
	bh=BunDYpz6CivJtXJ6Ep6qUVEGCQ60ZFk86DGMDme+kgk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l7Q7lvkGmKCJz7MZ9xBpvDwPv/PVcjqY+LmxyVZTHCXRfftkVymbE1v/9GIDZhdW1VVZUI3SafXE/IqcaKyrMhEIAbAeOuatWcMBW/K6qn2EGyhrp4K0C5FGkvPeRD8pCHsZ4IR29LbpenBpQTLWA4hdnna2NzUdUkVtjzbZpYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=RL89DStq; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 4CA00169;
	Tue,  1 Jul 2025 00:09:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1751321367;
	bh=BunDYpz6CivJtXJ6Ep6qUVEGCQ60ZFk86DGMDme+kgk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RL89DStqP4zYsQyh3OIPjSxwYbWiqYEdpifU8oSDuNU8gwaV3TrOVN7FeoylgLDMt
	 hYIuVQbYf30Z6vcKkujH/WIzBioehHy8OZbo90Xov5IIWTFf2N0AE8ZJ/GrbRIOjBi
	 AQMYdadg9CGMBMPi/pkdTJTSJUrEIstevEuDIAHM=
Date: Tue, 1 Jul 2025 01:09:23 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>, Hans de Goede <hansg@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 5/8] media: uvcvideo: Turn on the camera if
 V4L2_EVENT_SUB_FL_SEND_INITIAL
Message-ID: <20250630220923.GA15184@pendragon.ideasonboard.com>
References: <20250630-uvc-grannular-invert-v3-0-abd5cb5c45b7@chromium.org>
 <20250630-uvc-grannular-invert-v3-5-abd5cb5c45b7@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250630-uvc-grannular-invert-v3-5-abd5cb5c45b7@chromium.org>

On Mon, Jun 30, 2025 at 02:20:30PM +0000, Ricardo Ribalda wrote:
> If we subscribe to an event with V4L2_EVENT_SUB_FL_SEND_INITIAL, the
> driver needs to report back some values that require the camera to be
> powered on. But VIDIOC_SUBSCRIBE_EVENT is not part of the ioctls that
> turn on the camera.
> 
> We could unconditionally turn on the camera during
> VIDIOC_SUBSCRIBE_EVENT, but it is more efficient to turn it on only
> during V4L2_EVENT_SUB_FL_SEND_INITIAL, which we believe is not a common
> usecase.
> 
> To avoid a list_del if uvc_pm_get() fails, we move list_add_tail to the
> end of the function.
> 
> Reviewed-by: Hans de Goede <hansg@kernel.org>
> Fixes: d1b618e79548 ("media: uvcvideo: Do not turn on the camera for some ioctls")
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_ctrl.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index 303b7509ec47964dc1bf0e28127075b4a3867511..e84aaf130c73403a6c818deceadf404a2975c816 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -2072,18 +2072,23 @@ static int uvc_ctrl_add_event(struct v4l2_subscribed_event *sev, unsigned elems)
>  		goto done;
>  	}
>  
> -	list_add_tail(&sev->node, &mapping->ev_subs);
>  	if (sev->flags & V4L2_EVENT_SUB_FL_SEND_INITIAL) {
>  		struct v4l2_event ev;
>  		u32 changes = V4L2_EVENT_CTRL_CH_FLAGS;
>  		s32 val = 0;
>  
> +		ret = uvc_pm_get(handle->chain->dev);
> +		if (ret)
> +			goto done;
> +
>  		if (uvc_ctrl_mapping_is_compound(mapping) ||
>  		    __uvc_ctrl_get(handle->chain, ctrl, mapping, &val) == 0)
>  			changes |= V4L2_EVENT_CTRL_CH_VALUE;
>  
>  		uvc_ctrl_fill_event(handle->chain, &ev, ctrl, mapping, val,
>  				    changes);
> +
> +		uvc_pm_put(handle->chain->dev);

Add a blank line here.

>  		/*
>  		 * Mark the queue as active, allowing this initial event to be
>  		 * accepted.
> @@ -2092,6 +2097,7 @@ static int uvc_ctrl_add_event(struct v4l2_subscribed_event *sev, unsigned elems)
>  		v4l2_event_queue_fh(sev->fh, &ev);
>  	}
>  
> +	list_add_tail(&sev->node, &mapping->ev_subs);

And here.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  done:
>  	mutex_unlock(&handle->chain->ctrl_mutex);
>  	return ret;
> 

-- 
Regards,

Laurent Pinchart

