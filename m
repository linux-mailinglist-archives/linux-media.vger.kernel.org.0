Return-Path: <linux-media+bounces-38725-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C53B8B1846E
	for <lists+linux-media@lfdr.de>; Fri,  1 Aug 2025 17:04:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 46D921AA6D8E
	for <lists+linux-media@lfdr.de>; Fri,  1 Aug 2025 15:05:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C27A26CE06;
	Fri,  1 Aug 2025 15:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="WwYqkPiE"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E4504690;
	Fri,  1 Aug 2025 15:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754060685; cv=none; b=TWK9IYAOE4oOu5C5NEAZE92aLK+XUxxJBMH8itCUVG3diM8zTXr96POCW+QCRJlNny2q78JI65pScE0lJjX4Lv8iMz2y71yZuycM6RUh0E1yj+2qnD6jElmDIcJoMHACL5oIoVEfEFv9LCqGtIaxJISa7M7e7J9nTBHViri7ncI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754060685; c=relaxed/simple;
	bh=Vadfzlp9MbquX9B59YPI3u/2j5NnNq3Cu7kaG4CwMpY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oRDJeUZjPbQlHbzIP2yTqkyIauoTqvN0c1jNsC1/VXqAXk3gQIWp7RG68biUcMoequ/ME+5CL9y6HjqhnwJdYfytJQy+XYLNZXwe6TRVkdz0nzDiRrGZQSoLEwLOCgBrFXdW1lvI7U5R4NBrlQhgh2OErP1EOBcwapf0zoVnDeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=WwYqkPiE; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id C709E594;
	Fri,  1 Aug 2025 17:03:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754060636;
	bh=Vadfzlp9MbquX9B59YPI3u/2j5NnNq3Cu7kaG4CwMpY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WwYqkPiEiW9ZZmwdwmo7bTPJ3cMHZgtKzZEFvtyKK0fv7SLZuf6IxwZQT3PVqak3E
	 b5M4h+yHOLH3QAQ1Qj4uahOZq00WYLandThT/lCRM1UJs7t3zGVBnM9xERrk1ZxwMV
	 SA4+pKw+KmGiLPzEdbrwZ1yICPCHM3CaxkrPmT78=
Date: Fri, 1 Aug 2025 18:04:30 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Imene Jaziri <imenjazirii18@gmail.com>
Cc: linux-media@vger.kernel.org, hansg@kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: uvcvideo: Log driver load in uvc_probe function
Message-ID: <20250801150430.GC4906@pendragon.ideasonboard.com>
References: <20250801145326.28560-1-imenjazirii18@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250801145326.28560-1-imenjazirii18@gmail.com>

Hi,

On Fri, Aug 01, 2025 at 03:53:26PM +0100, Imene Jaziri wrote:
> Add a pr_info() in the uvc_probe function to trace when the
> uvcvideo driver is loaded. This is for learning purposes.

What part of the learning instructions you are following instructed you
to submit this patch to kernel mailing lists ? We are regularly spammed
by similar patches, which indicates the instructions are not clear
enough.

> Signed-off-by: Imene Jaziri <imenjazirii18@gmail.com>
> ---
>  drivers/media/usb/uvc/uvc_driver.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index da24a655ab68..4e5d1d636640 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -2170,7 +2170,6 @@ static int uvc_probe(struct usb_interface *intf,
>  		(const struct uvc_device_info *)id->driver_info;
>  	int function;
>  	int ret;
> -
>  	/* Allocate memory for the device and initialize it. */
>  	dev = kzalloc(sizeof(*dev), GFP_KERNEL);
>  	if (dev == NULL)
> @@ -2188,7 +2187,7 @@ static int uvc_probe(struct usb_interface *intf,
>  	dev->info = info ? info : &uvc_quirk_none;
>  	dev->quirks = uvc_quirks_param == -1
>  		    ? dev->info->quirks : uvc_quirks_param;
> -
> +	pr_info("I changed uvcvideo driver in the Linux Kernel\n");
>  	if (id->idVendor && id->idProduct)
>  		uvc_dbg(dev, PROBE, "Probing known UVC device %s (%04x:%04x)\n",
>  			udev->devpath, id->idVendor, id->idProduct);

-- 
Regards,

Laurent Pinchart

