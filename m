Return-Path: <linux-media+bounces-6385-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E83B871087
	for <lists+linux-media@lfdr.de>; Mon,  4 Mar 2024 23:59:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 34B411F23B69
	for <lists+linux-media@lfdr.de>; Mon,  4 Mar 2024 22:59:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 172147C0A4;
	Mon,  4 Mar 2024 22:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="wPdHG5cx"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D79C37C088
	for <linux-media@vger.kernel.org>; Mon,  4 Mar 2024 22:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709593151; cv=none; b=pOtjgdnd800cUAbxG8vNwo6COSH6q41DIVaonGaBhKQbrZJpDXmuv19ZP+CVVnhG1LypSOhYLmcS+Ljuf08sug6qyHgn+aIsS2ut4ZitJzRqg1z8EWeBD++/gaDcipZBvvmEcfPs/mQ+4BWruZdQzizEEDrFuDCwadRlfGPCc8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709593151; c=relaxed/simple;
	bh=jEnHyjfIsYKMUJShP8MhNbYb2FU3xXufNw0+5OgUipA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nXITwkg/OmzxisC0lX//NULXXY6YNnzopgl+Q0QP33NRmFBNXAZcdUSjpZ2m/7WTiqV0YK2GnABfIUjL30dS2mGnGFEgyjgVpI77j2TpUCyPXkQy4ouU0Og7DexqucGJ8E9gv2PjqDR7z1BenelDMw8aAP/2fKRUWKUpPUwZ/28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=wPdHG5cx; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (89-27-53-110.bb.dnainternet.fi [89.27.53.110])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6929F22E8;
	Mon,  4 Mar 2024 23:58:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1709593129;
	bh=jEnHyjfIsYKMUJShP8MhNbYb2FU3xXufNw0+5OgUipA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=wPdHG5cx/6yqUpCk4w/Y1Y2OlnKjer1CfIaTAmCgAg//nrUZNssOO+oT0bzapiUjG
	 ED9Js3kE20y6+WAk5pQR9QT6THclk2ycLFHGpnAfVsUncZQvOw+JKDfwBcuQJvjFr4
	 3rZ/VwvhBinoZwfx7qupFuKAKAThUK70FrjrqEz8=
Date: Tue, 5 Mar 2024 00:59:07 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, hverkuil@xs4all.nl
Subject: Re: [PATCH 1/1] media: Kconfig: Select MEDIA_CONTROLLER for
 VIDEO_V4L2_SUBDEV_API
Message-ID: <20240304225907.GA12503@pendragon.ideasonboard.com>
References: <20240304185125.33713-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240304185125.33713-1-sakari.ailus@linux.intel.com>

Hi Sakari,

Thank you for the patch.

On Mon, Mar 04, 2024 at 08:51:25PM +0200, Sakari Ailus wrote:
> MEDIA_CONTROLLER has no dependencies and VIDEO_V4L2_SUBDEV_API depends on
> it. Select MEDIA_CONTROLLER instead of depending on it. This way Kconfig
> options elsewhere do only need to select VIDEO_V4L2_SUBDEV_API, not both.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
> Mostly untested but seems reasonable. MEDIA_CONTROLLER has no dependencies
> anymore.

It seems reasonable to me too, but I think it would make sense to drop
in the same patch the manual selection of MEDIA_CONTROLLER for the
Kconfig symbols that already select VIDEO_V4L2_SUBDEV_API.

>  drivers/media/v4l2-core/Kconfig | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/v4l2-core/Kconfig b/drivers/media/v4l2-core/Kconfig
> index 331b8e535e5b..d55eff3f31b0 100644
> --- a/drivers/media/v4l2-core/Kconfig
> +++ b/drivers/media/v4l2-core/Kconfig
> @@ -10,7 +10,8 @@ config VIDEO_V4L2_I2C
>  
>  config VIDEO_V4L2_SUBDEV_API
>  	bool
> -	depends on VIDEO_DEV && MEDIA_CONTROLLER
> +	depends on VIDEO_DEV
> +	select MEDIA_CONTROLLER
>  	help
>  	  Enables the V4L2 sub-device pad-level userspace API used to configure
>  	  video format, size and frame rate between hardware blocks.

-- 
Regards,

Laurent Pinchart

