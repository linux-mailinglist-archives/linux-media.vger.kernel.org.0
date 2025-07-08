Return-Path: <linux-media+bounces-37141-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CD15AFD291
	for <lists+linux-media@lfdr.de>; Tue,  8 Jul 2025 18:48:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CEF7518944AD
	for <lists+linux-media@lfdr.de>; Tue,  8 Jul 2025 16:45:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F5B22E5B19;
	Tue,  8 Jul 2025 16:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="K7V9cthW"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 484572E54C8;
	Tue,  8 Jul 2025 16:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751993069; cv=none; b=Fp9U28JEO4Uc2OIO9nD3eWf/dVC9CNC7AvbnbUjqqCvKIIbH3AOkITl4tgJSJDstOdZOlrlDrPeO6yuST6yh6b15rXJzj0yScpVU4VNg3d1wowDO6Yql+uMZxc9OiWD2/GuYaHv5kVWKUsh0P2YhrBiIbQ5rg9mIer+KFoPqy7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751993069; c=relaxed/simple;
	bh=Uy6/ZiGNXgHfIB5TgE3/viq7cNwZuVQdmxHA3l5Q360=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=He9PCHxcTJUl7jgWuLYyMuYsMNgU3diRqQ2qVK3qMU+CPKmDRxfyjAMtKTJMsQri2tIbecTXGld1cdRSocH13y2R2qtkOu/SZOnuuKTHk3MeNFJJR5m5Nqn1g/vRUkDDDUT315FjQ1r95+E5MR8dZNOHRn0t6qggR2rZSjxzK6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=K7V9cthW; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id B53E1838;
	Tue,  8 Jul 2025 18:43:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1751993038;
	bh=Uy6/ZiGNXgHfIB5TgE3/viq7cNwZuVQdmxHA3l5Q360=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K7V9cthWAeOOxNJYowo9Sqf085LVfa7mePEdvEhfYUjc0Prmu5MXnzNgIGWhwu2Bd
	 niaTPkQV7ifzH3NXBIm7wFGuSCyplzVsth8D5/LNKLu1Sx64XSR6oTXrGAZZfjznBD
	 xNBzKpNW0avoET/LvC1wNmNADpOY749nxocvd2Wc=
Date: Tue, 8 Jul 2025 19:43:58 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Desnes Nunes <desnesn@redhat.com>
Cc: hansg@kernel.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@kernel.org
Subject: Re: [PATCH v3] media: uvcvideo: avoid variable shadowing in
 uvc_ctrl_cleanup_fh
Message-ID: <20250708164358.GB23181@pendragon.ideasonboard.com>
References: <20250708144628.273384-1-desnesn@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250708144628.273384-1-desnesn@redhat.com>

Hi Desnes,

Thank you for the patch.

On Tue, Jul 08, 2025 at 11:46:28AM -0300, Desnes Nunes wrote:
> This avoids a variable loop shadowing occurring between the local loop
> iterating through the uvc_entity's controls and the global one going
> through the pending async controls of the file handle

s/handle/handle./

(easily handled when applying the patch, no need to resend)

> Cc: stable@kernel.org
> Fixes: 10acb9101355 ("media: uvcvideo: Increase/decrease the PM counter per IOCTL")

I think CI will ask for Cc to go after Fixes. If so that can also be
handled when applying.

> Signed-off-by: Desnes Nunes <desnesn@redhat.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/usb/uvc/uvc_ctrl.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index 303b7509ec47..6b9486749c3f 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -3299,7 +3299,6 @@ int uvc_ctrl_init_device(struct uvc_device *dev)
>  void uvc_ctrl_cleanup_fh(struct uvc_fh *handle)
>  {
>  	struct uvc_entity *entity;
> -	int i;
>  
>  	guard(mutex)(&handle->chain->ctrl_mutex);
>  
> @@ -3317,7 +3316,7 @@ void uvc_ctrl_cleanup_fh(struct uvc_fh *handle)
>  	if (!WARN_ON(handle->pending_async_ctrls))
>  		return;
>  
> -	for (i = 0; i < handle->pending_async_ctrls; i++)
> +	for (unsigned int i = 0; i < handle->pending_async_ctrls; i++)
>  		uvc_pm_put(handle->stream->dev);
>  }
>  

-- 
Regards,

Laurent Pinchart

