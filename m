Return-Path: <linux-media+bounces-38459-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 22035B11D78
	for <lists+linux-media@lfdr.de>; Fri, 25 Jul 2025 13:27:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3C12F1CE3B11
	for <lists+linux-media@lfdr.de>; Fri, 25 Jul 2025 11:27:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A31552E6137;
	Fri, 25 Jul 2025 11:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="DAENlLPD"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA0AB2114;
	Fri, 25 Jul 2025 11:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753442827; cv=none; b=W2p8q6dHOR4BzIRSVwsvFjQv680YioeMYclcY/sRf+2OcmxcUAoYWKy7766NR35CVxKVbXc6GjQ+7LqG/cydW6qRR5kSGmigbzkmXjydGL5YGFB0pgckH8Jccva9MEWC2s07V3zugE+fsGoiD+Abgo/yu8vDFWDsAA/OYp2pV0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753442827; c=relaxed/simple;
	bh=vUpfv3NBToPXaEKwEi1bexKZA/1zUJNDjLV5DGx0xB4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EoB+8ds7sfTLZwOG8kvq5C8ocid/I6m2oVyOPMiGe5UrBndYDTcPTfPqauisecMJQB/zBIc6Seicg/dtZb3BkXx0841k4V0HzSZ/XWsJOISqKe6fQom1t+qWOXjtA7j8romSZZGw5OkF7ckKq6Wbf5jDEo7uCxfcfMG02nTcUWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=DAENlLPD; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 63C4CC64;
	Fri, 25 Jul 2025 13:26:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1753442784;
	bh=vUpfv3NBToPXaEKwEi1bexKZA/1zUJNDjLV5DGx0xB4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DAENlLPDbaSI36dyRrNiCXPEyCnNSBwwhuWDqVvlC9msIbuEHGKHvThHkJ/vdlsdd
	 Cv3l1D6BiW61TtvYTZxex3hy1svcidWKjXZl52tmdOu34cAgWtGMZEZGbMNZoqH6WE
	 VK5Z7R0wBX8nSURj7Awhhr1sM6eN4GYW3Dwa6o9w=
Date: Fri, 25 Jul 2025 14:26:59 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] media: uvcvideo: Do not re-reference dev->udev
Message-ID: <20250725112659.GC11202@pendragon.ideasonboard.com>
References: <20250725-uvc-nousbdev-v1-0-28f5a1fdf544@chromium.org>
 <20250725-uvc-nousbdev-v1-2-28f5a1fdf544@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250725-uvc-nousbdev-v1-2-28f5a1fdf544@chromium.org>

On Fri, Jul 25, 2025 at 11:01:30AM +0000, Ricardo Ribalda wrote:
> dev->udev is already referenced by the variable udev. Let's use it.

The variable is used in a single location. I would probably have dropped
it instead, but I don't have a strong preference. If you prefer it this
way,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Please let me know if you will send a patch to drop the variable
instead, or if I should merge this one.

> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_driver.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index d09d1286da0f61d5953125df23ed92555585e8f2..209cedeff59e8be2e96ce79c3d395a5a85a336c6 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -882,7 +882,7 @@ static int uvc_parse_vendor_control(struct uvc_device *dev,
>  	unsigned int n, p;
>  	int handled = 0;
>  
> -	switch (le16_to_cpu(dev->udev->descriptor.idVendor)) {
> +	switch (le16_to_cpu(udev->descriptor.idVendor)) {
>  	case 0x046d:		/* Logitech */
>  		if (buffer[1] != 0x41 || buffer[2] != 0x01)
>  			break;

-- 
Regards,

Laurent Pinchart

