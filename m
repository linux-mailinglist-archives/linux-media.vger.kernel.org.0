Return-Path: <linux-media+bounces-20459-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D84099B3AE2
	for <lists+linux-media@lfdr.de>; Mon, 28 Oct 2024 20:58:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7DC411F218B3
	for <lists+linux-media@lfdr.de>; Mon, 28 Oct 2024 19:58:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 534351DFDA6;
	Mon, 28 Oct 2024 19:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="lBYeQE5d"
X-Original-To: linux-media@vger.kernel.org
Received: from gofer.mess.org (gofer.mess.org [88.97.38.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 515DB18EFE0;
	Mon, 28 Oct 2024 19:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=88.97.38.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730145524; cv=none; b=eBYZ8U582ESr6bN1qA8RpljPbp/8VL1MyqzDg27EuiUKEyEpDw9F5oFVBG4VDOgRxnVfcHaF4x1UZ/yN6aIwr1KaeyaTW49qNH3gPvJAfsjaazZnN3dB/axvSmn4SQaT2+GqOi+RBb0JWORvMFzQQjXTYedxmh2h7IQ3Js8ESCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730145524; c=relaxed/simple;
	bh=mupsOZZGrluRvU7cSZ7krt1ma7qCAMbyzWbQDwdXUnU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FSXPku+/r+j3LJp4EieXGqcZhD4wU6q641ybux4uD83ZiNSr/76D56fDzgH/geBxb6uK9S+1CEwAtOV19ujzN50jm0FiqlQJcP25GgF378EyHoGL/lpX9esVjHFTR7Ag1fs2Vi4FNIXwDBrpURuw0DvelRuMDwbgzEvqMTw/zSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=lBYeQE5d; arc=none smtp.client-ip=88.97.38.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mess.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1730145519; bh=mupsOZZGrluRvU7cSZ7krt1ma7qCAMbyzWbQDwdXUnU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lBYeQE5dpHOxFG/t09hhIZR+mCZPyytWeRcFYMGSfgmlcfO7Z6VFjqdAzTYpMEibz
	 P1wi0dhJIUrMzqyDkHdBANGJMw7a1pkFQlIQU+lrZZ7UPTzEs+1vIHk9ZOilmQ6YcJ
	 Wqxgq+B6B+zX8wy+8BJxvuKlcalvOn2Tul/rol7RRuP0H1W1HldD5xNVDzoaJlwOk1
	 dnVdycfWsq+iC9E8OPEUBp2vper03+H3a4q7cPUHlqVKKUOJRwa312jVcG7mw2lxp4
	 mXSeUQSa2FTsWY3azMGmMjFW1Crzx5ffy+tb2fuk/5gsTZbGGY1c47IXV56E1WP7M/
	 p44ktW4R4bqFA==
Received: by gofer.mess.org (Postfix, from userid 1000)
	id CC6791000C4; Mon, 28 Oct 2024 19:58:39 +0000 (GMT)
Date: Mon, 28 Oct 2024 19:58:39 +0000
From: Sean Young <sean@mess.org>
To: linux@treblig.org
Cc: awalls@md.metrocast.net, mchehab@kernel.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] media: cx18: Remove unused cx18_reset_ir_gpio
Message-ID: <Zx_s76gUaQwAxzip@gofer.mess.org>
References: <20241012233932.255211-1-linux@treblig.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241012233932.255211-1-linux@treblig.org>

On Sun, Oct 13, 2024 at 12:39:32AM +0100, linux@treblig.org wrote:
> From: "Dr. David Alan Gilbert" <linux@treblig.org>
> 
> cx18_reset_ir_gpio() has been unused in tree since 2009
> commit eefe1010a465 ("V4L/DVB (10759): cx18: Convert GPIO connected
> functions to act as v4l2_subdevices")
> 
> It has a comment saying it's exported for use by 'lirc_pvr150' but I don't
> see any sign of it in the lirc git, and I see it removed support
> for lirc_i2c.c 'Flavors of the Hauppage PVR-150...' in 2014.
> 
> Remove it.

Interesting, I can't find any call site either. The ir-i2c-kbd driver could
potentially use this, but it would to know the correct v4l2_dev for the
device; also there are devices other than the cx18 which use the same IR
module, so they would not have a way to force a reset or need a different
mechanism (e.g. ivtv driver).

So I don't understand how this could be wired up or how it was ever wired
up.

This could be great because if done correctly, we could remove the
VIDIOC_INT_RESET ioctl completely. Then again, I don't know how often the
device hangs. With the current driver the IR module I don't know of any
hangs -- maybe the ioctl could just go anyway.


Sean

> 
> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
> ---
>  drivers/media/pci/cx18/cx18-gpio.c | 15 ---------------
>  drivers/media/pci/cx18/cx18-gpio.h |  1 -
>  2 files changed, 16 deletions(-)
> 
> diff --git a/drivers/media/pci/cx18/cx18-gpio.c b/drivers/media/pci/cx18/cx18-gpio.c
> index c85eb8d25837..485a6cbeb15a 100644
> --- a/drivers/media/pci/cx18/cx18-gpio.c
> +++ b/drivers/media/pci/cx18/cx18-gpio.c
> @@ -305,21 +305,6 @@ int cx18_gpio_register(struct cx18 *cx, u32 hw)
>  	return v4l2_device_register_subdev(&cx->v4l2_dev, sd);
>  }
>  
> -void cx18_reset_ir_gpio(void *data)
> -{
> -	struct cx18 *cx = to_cx18(data);
> -
> -	if (cx->card->gpio_i2c_slave_reset.ir_reset_mask == 0)
> -		return;
> -
> -	CX18_DEBUG_INFO("Resetting IR microcontroller\n");
> -
> -	v4l2_subdev_call(&cx->sd_resetctrl,
> -			 core, reset, CX18_GPIO_RESET_Z8F0811);
> -}
> -EXPORT_SYMBOL(cx18_reset_ir_gpio);
> -/* This symbol is exported for use by lirc_pvr150 for the IR-blaster */
> -
>  /* Xceive tuner reset function */
>  int cx18_reset_tuner_gpio(void *dev, int component, int cmd, int value)
>  {
> diff --git a/drivers/media/pci/cx18/cx18-gpio.h b/drivers/media/pci/cx18/cx18-gpio.h
> index 0fa4c7ad2286..8d5797dea7f5 100644
> --- a/drivers/media/pci/cx18/cx18-gpio.h
> +++ b/drivers/media/pci/cx18/cx18-gpio.h
> @@ -17,5 +17,4 @@ enum cx18_gpio_reset_type {
>  	CX18_GPIO_RESET_XC2028  = 2,
>  };
>  
> -void cx18_reset_ir_gpio(void *data);
>  int cx18_reset_tuner_gpio(void *dev, int component, int cmd, int value);
> -- 
> 2.47.0
> 

