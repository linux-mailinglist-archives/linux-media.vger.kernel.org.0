Return-Path: <linux-media+bounces-47341-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 28250C6CB9B
	for <lists+linux-media@lfdr.de>; Wed, 19 Nov 2025 05:26:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5468E4F41B6
	for <lists+linux-media@lfdr.de>; Wed, 19 Nov 2025 04:23:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE5EA2FDC41;
	Wed, 19 Nov 2025 04:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="NHfC3EVr"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAA7F4503B;
	Wed, 19 Nov 2025 04:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763526153; cv=none; b=YbR48SqQf/jpTJege4y4Zwr1UNWGXctivrAC4E42W8BBkek8w6JvrLCtQkPLzqiA7W8DnenTQ0AleydNMQNoyCHMkVx6Tx3/N6nHV23DnSVUBEQNOyPvZ3fmIYFe4j21kEqRHimpNrckNFLeUaNHx2bg23ecCnB4MuM8iq2/jMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763526153; c=relaxed/simple;
	bh=qp03+Oj8VKIgjXFNghRslYZhVH+RPCBxKwdWf3+U5QQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iOaK6nW5T8UTXo92cB2MMB+mNcjxFuBAoyJZemdQ+7ADSqpeg0L6P0vyOf8W4oIfI1epKT6fZLcaLh2Jr6+v5XBO0G7xiGC7EuptzmoeQcs3KHUyWUrjaN0cb9VHFpCxSQy0kTdeXvzQKzA1wwDFO+4/zIzoPn8UmArNO8O5nxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=NHfC3EVr; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (unknown [205.220.129.225])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 713B3195E;
	Wed, 19 Nov 2025 05:20:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1763526026;
	bh=qp03+Oj8VKIgjXFNghRslYZhVH+RPCBxKwdWf3+U5QQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NHfC3EVrYvRNq9BXJK9JzqXl6Q4SLboihpNHIWWL58pEWZkxLLAJOJSyOpShY71dy
	 kBCptYTwML4nFE0HxT0XEmuyEhAhAtULg/9cR9effChZEDR+qlnSpZo8wXMfh9czwr
	 0SRndtgl+rCzUFHiO2CD0DfeWNl4EA/bt7+8KtsI=
Date: Wed, 19 Nov 2025 13:21:56 +0900
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH 3/4] media: uvcvideo: Announce deprecation intentions for
 UVCIOC_CTRL_MAP
Message-ID: <20251119042156.GK10711@pendragon.ideasonboard.com>
References: <20251117-uvcdynctrl-v1-0-aed70eadf3d8@chromium.org>
 <20251117-uvcdynctrl-v1-3-aed70eadf3d8@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251117-uvcdynctrl-v1-3-aed70eadf3d8@chromium.org>

Hi Ricardo,

Thank you for the patch.

On Mon, Nov 17, 2025 at 08:14:18PM +0000, Ricardo Ribalda wrote:
> The UVCIOC_CTRL_MAP lets userspace create a mapping for a custom
> control.
> 
> This mapping is usually created by the uvcdynctrl userspace utility. We
> would like to get the mappings into the driver instead.
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  Documentation/userspace-api/media/drivers/uvcvideo.rst | 2 ++
>  drivers/media/usb/uvc/uvc_v4l2.c                       | 4 ++++
>  2 files changed, 6 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/drivers/uvcvideo.rst b/Documentation/userspace-api/media/drivers/uvcvideo.rst
> index dbb30ad389ae4d53bc734b4269ebea20ecdd7535..b09d2f8ba66ecde67f1e35fd77858a505ad44eb1 100644
> --- a/Documentation/userspace-api/media/drivers/uvcvideo.rst
> +++ b/Documentation/userspace-api/media/drivers/uvcvideo.rst
> @@ -109,6 +109,8 @@ IOCTL reference
>  UVCIOC_CTRL_MAP - Map a UVC control to a V4L2 control
>  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>  
> +**This IOCTL is deprecated and will be eventually removed**
> +
>  Argument: struct uvc_xu_control_mapping
>  
>  **Description**:
> diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> index 9e4a251eca88085a1b4e0e854370015855be92ee..03c64b5698bf4331fed8437fa6e9c726a07450bd 100644
> --- a/drivers/media/usb/uvc/uvc_v4l2.c
> +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> @@ -1044,6 +1044,8 @@ static long uvc_ioctl_default(struct file *file, void *priv, bool valid_prio,
>  	switch (cmd) {
>  	/* Dynamic controls. */
>  	case UVCIOC_CTRL_MAP:
> +		pr_warn_once("uvcvideo: " DEPRECATED
> +			     "UVCIOC_CTRL_MAP ioctl will be eventually removed.\n");
>  		return uvc_ioctl_xu_ctrl_map(chain, arg);
>  
>  	case UVCIOC_CTRL_QUERY:
> @@ -1158,6 +1160,8 @@ static long uvc_v4l2_compat_ioctl32(struct file *file,
>  
>  	switch (cmd) {
>  	case UVCIOC_CTRL_MAP32:
> +		pr_warn_once("uvcvideo: " DEPRECATED
> +			     "UVCIOC_CTRL_MAP32 ioctl will be eventually removed.\n");
>  		ret = uvc_v4l2_get_xu_mapping(&karg.xmap, up);
>  		if (ret)
>  			break;

-- 
Regards,

Laurent Pinchart

