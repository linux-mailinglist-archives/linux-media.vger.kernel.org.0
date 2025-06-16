Return-Path: <linux-media+bounces-34937-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BA7DADB3AE
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 16:25:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B22E23A6485
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 14:21:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B11F0220F26;
	Mon, 16 Jun 2025 14:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Fsa02vM4"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 719762BF007;
	Mon, 16 Jun 2025 14:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750083496; cv=none; b=QWcrylW7L+2MPNeLr+2UGIs6a6S1QitszyS52UEcjMw5dNBCc+dIUNwVVsyF5n73bS4jYlL3UkSrkQb9u2M1yg5sSJiSqvQ0kMsg2x324OL0+HAw60WPXRiynF0tKBG3fZvZpSE1jovkAy9wXONITBgCpKXc2Yb/iEqQpAzHHto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750083496; c=relaxed/simple;
	bh=g5hkkCFVVy5nrxXUzmyCUC6UU/Y4W+zHRoFgMxj6+C8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=loKgAnJ/OKxuIPL8jvd5xdU/4qXJCf7ePXRn6jisXydj6oDN5kVGZ+Vw1rpa2fj772X5ktYfNtFgAZOV0ON5ovwS8Q0rXLpYBkKatRxmibHGWMFX0TAc1usNKm8W7sHQIYI0KGXKJjC3Rt/6TGTgIGtJfwhjE48lURKOOBTSjpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Fsa02vM4; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id BA83D346;
	Mon, 16 Jun 2025 16:18:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750083480;
	bh=g5hkkCFVVy5nrxXUzmyCUC6UU/Y4W+zHRoFgMxj6+C8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Fsa02vM4rIlIdskUmm7P8u4eBSuBRHcLo1QpPeMzgNmuXGa86y7DXYsYR+2vN5CXz
	 XXN5wborwvmaU2CdeNUnZxgsfow04oYeJq4WQ89f+E+QPFB8RAIVdEzXaypxDJxRtP
	 8141nuT/vHeib1Q/GidC+T8Q1nSpy23XUBpOtoww=
Date: Mon, 16 Jun 2025 17:17:56 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Naushir Patuck <naush@raspberrypi.com>,
	Nick Hollinghurst <nick.hollinghurst@raspberrypi.com>,
	David Plowman <david.plowman@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v7 4/4] media: pisp_be: Fix pm_runtime underrun in probe
Message-ID: <20250616141756.GC32454@pendragon.ideasonboard.com>
References: <20250606-pispbe-mainline-split-jobs-handling-v6-v7-0-46169f0622b7@ideasonboard.com>
 <20250606-pispbe-mainline-split-jobs-handling-v6-v7-4-46169f0622b7@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250606-pispbe-mainline-split-jobs-handling-v6-v7-4-46169f0622b7@ideasonboard.com>

Hi Jacopo,

Thank you for the patch.

On Fri, Jun 06, 2025 at 12:29:24PM +0200, Jacopo Mondi wrote:
> During the probe() routine, the PiSP BE driver needs to power up the
> interface in order to identify and initialize the hardware.
> 
> The driver resumes the interface by calling the
> pispbe_runtime_resume() function directly, without going
> through the pm_runtime helpers, but later suspends it by calling
> pm_runtime_put_autosuspend().
> 
> This causes a PM usage count imbalance at probe time, notified by the
> runtime_pm framework with the below message in the system log:
> 
>  pispbe 1000880000.pisp_be: Runtime PM usage count underflow!
> 
> Fix this by resuming the interface using the pm runtime helpers instead
> of calling the resume function directly and use the pm_runtime framework
> in the probe() error path. While at it, remove manual suspend of the
> interface in the remove() function. The driver cannot be unloaded if in
> use, so simply disable runtime pm.
> 
> To simplify the implementation, make the driver depend on PM as the
> RPI5 platform where the ISP is integrated in uses the PM framework by
> default.
> 
> Fixes: 12187bd5d4f8 ("media: raspberrypi: Add support for PiSP BE")
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> 
> --
> 
> Cc: stable@vger.kernel.org

This should go just below the Fixes: tag.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/platform/raspberrypi/pisp_be/Kconfig   | 1 +
>  drivers/media/platform/raspberrypi/pisp_be/pisp_be.c | 5 ++---
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/raspberrypi/pisp_be/Kconfig b/drivers/media/platform/raspberrypi/pisp_be/Kconfig
> index 46765a2e4c4d..a9e51fd94aad 100644
> --- a/drivers/media/platform/raspberrypi/pisp_be/Kconfig
> +++ b/drivers/media/platform/raspberrypi/pisp_be/Kconfig
> @@ -3,6 +3,7 @@ config VIDEO_RASPBERRYPI_PISP_BE
>  	depends on V4L_PLATFORM_DRIVERS
>  	depends on VIDEO_DEV
>  	depends on ARCH_BCM2835 || COMPILE_TEST
> +	depends on PM
>  	select VIDEO_V4L2_SUBDEV_API
>  	select MEDIA_CONTROLLER
>  	select VIDEOBUF2_DMA_CONTIG
> diff --git a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
> index c25f7d9b404c..e49e4cc322db 100644
> --- a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
> +++ b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
> @@ -1718,7 +1718,7 @@ static int pispbe_probe(struct platform_device *pdev)
>  	pm_runtime_use_autosuspend(pispbe->dev);
>  	pm_runtime_enable(pispbe->dev);
>  
> -	ret = pispbe_runtime_resume(pispbe->dev);
> +	ret = pm_runtime_resume_and_get(pispbe->dev);
>  	if (ret)
>  		goto pm_runtime_disable_err;
>  
> @@ -1740,7 +1740,7 @@ static int pispbe_probe(struct platform_device *pdev)
>  disable_devs_err:
>  	pispbe_destroy_devices(pispbe);
>  pm_runtime_suspend_err:
> -	pispbe_runtime_suspend(pispbe->dev);
> +	pm_runtime_put(pispbe->dev);
>  pm_runtime_disable_err:
>  	pm_runtime_dont_use_autosuspend(pispbe->dev);
>  	pm_runtime_disable(pispbe->dev);
> @@ -1754,7 +1754,6 @@ static void pispbe_remove(struct platform_device *pdev)
>  
>  	pispbe_destroy_devices(pispbe);
>  
> -	pispbe_runtime_suspend(pispbe->dev);
>  	pm_runtime_dont_use_autosuspend(pispbe->dev);
>  	pm_runtime_disable(pispbe->dev);
>  }

-- 
Regards,

Laurent Pinchart

