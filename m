Return-Path: <linux-media+bounces-21091-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CD979C13DA
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2024 03:08:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7E5571C218BF
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2024 02:08:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5753208DA;
	Fri,  8 Nov 2024 02:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="m5g+dz8r"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B978714A90;
	Fri,  8 Nov 2024 02:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731031683; cv=none; b=mMAAsbba+CXBN3+sbBNCPvKxVQf1oa5qxP2RDhrK7o5s1H7P9KZeiby9i7XMXryJLLDifhK+A8WcK2gflReCOBJhNiG42fUNtf+GT9htOK9kRV05EwaAsWfvziBUjx9hds1MXEoIuUwaD7bxG0b8bofVBGTFwcSB4fYwK1LGGi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731031683; c=relaxed/simple;
	bh=GBlFgNyLIiwebIT5W5E/o9wErknb68YSBxU3zr4lWBc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E6wvZZfFBGZFjl+yAxK180UIiZASX8bgEEMSuvdCBnmt/p7zb42OMzKMM+Y9QCZ/tLanQjIBu5NiSzX7bwb356GrR/2jsHU8wzypmMTtpkM//h7VMfCNZaRieaC6RuTEmVB2El07PQmPp77BOzKi4r/XVVgpd2K5qmXxZVQpVCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=m5g+dz8r; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6DB7A353;
	Fri,  8 Nov 2024 03:07:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1731031669;
	bh=GBlFgNyLIiwebIT5W5E/o9wErknb68YSBxU3zr4lWBc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m5g+dz8rpRC4n1TWkGv1m8FhwRMjzOpUAtRN8KtmO7C4ar8DCyP/nNwCN+bcF3Ig2
	 +Y6Utgl2+bjhh5M5Ml7XiQhqpiEmOk6fSE+/GixM/Tlsj+n/pD9PAVKikPgzAexAG8
	 NVAjPnQ2VnAEHbudHpRqgAZSyoLk+PoQvuSLUcW0=
Date: Fri, 8 Nov 2024 04:07:51 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: chenchangcheng <ccc194101@163.com>
Cc: mchehab@kernel.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] media: uvcvideo:Create input device for all uvc devices
 with status endpoints.
Message-ID: <20241108020751.GE32614@pendragon.ideasonboard.com>
References: <20241108015658.471109-1-ccc194101@163.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241108015658.471109-1-ccc194101@163.com>

Hello,

On Fri, Nov 08, 2024 at 09:56:58AM +0800, chenchangcheng wrote:
> Some applications need to check if there is an input device on the camera
> before proceeding to the next step. When there is no input device,
> the application will report an error.

As Mauro previously mentioned, this seems to be an application issue,
not a kernel issue. You should fix the application.

> Create input device for all uvc devices with status endpoints.
> and only when bTriggerSupport and bTriggerUsage are one are
> allowed to report camera button.
> 
> Fixes: 3bc22dc66a4f ("media: uvcvideo: Only create input devs if hw supports it")
> Signed-off-by: chenchangcheng <ccc194101@163.com>
> ---
>  drivers/media/usb/uvc/uvc_status.c | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_status.c b/drivers/media/usb/uvc/uvc_status.c
> index a78a88c710e2..177640c6a813 100644
> --- a/drivers/media/usb/uvc/uvc_status.c
> +++ b/drivers/media/usb/uvc/uvc_status.c
> @@ -44,9 +44,6 @@ static int uvc_input_init(struct uvc_device *dev)
>  	struct input_dev *input;
>  	int ret;
>  
> -	if (!uvc_input_has_button(dev))
> -		return 0;
> -
>  	input = input_allocate_device();
>  	if (input == NULL)
>  		return -ENOMEM;
> @@ -110,10 +107,12 @@ static void uvc_event_streaming(struct uvc_device *dev,
>  		if (len <= offsetof(struct uvc_status, streaming))
>  			return;
>  
> -		uvc_dbg(dev, STATUS, "Button (intf %u) %s len %d\n",
> -			status->bOriginator,
> -			status->streaming.button ? "pressed" : "released", len);
> -		uvc_input_report_key(dev, KEY_CAMERA, status->streaming.button);
> +		if (uvc_input_has_button(dev)) {
> +			uvc_dbg(dev, STATUS, "Button (intf %u) %s len %d\n",
> +				status->bOriginator,
> +				status->streaming.button ? "pressed" : "released", len);
> +			uvc_input_report_key(dev, KEY_CAMERA, status->streaming.button);
> +		}
>  	} else {
>  		uvc_dbg(dev, STATUS, "Stream %u error event %02x len %d\n",
>  			status->bOriginator, status->bEvent, len);
> 
> base-commit: ff7afaeca1a15fbeaa2c4795ee806c0667bd77b2

-- 
Regards,

Laurent Pinchart

