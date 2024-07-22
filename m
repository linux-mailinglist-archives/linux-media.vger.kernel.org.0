Return-Path: <linux-media+bounces-15270-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F47D93921F
	for <lists+linux-media@lfdr.de>; Mon, 22 Jul 2024 18:00:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EB3F71F22460
	for <lists+linux-media@lfdr.de>; Mon, 22 Jul 2024 16:00:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 356D316E89B;
	Mon, 22 Jul 2024 15:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="TehHH975"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7217134B6;
	Mon, 22 Jul 2024 15:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721663993; cv=none; b=plkQ0Olxn0gFgrmn/CYFnxHuFckPSX/KOIT2RGwN1nt93AbQdKFuwIFd+E6pfx5b0+nkUhvPGtyYndGWVIag86vmGjQMawRywqGSrKz8HRZBQnfaCLxJ42YfQFqQUaBTBQNfL7yszvPWjEjIn/fwfM47+HG6cxHYRn0JjjHbWLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721663993; c=relaxed/simple;
	bh=5WE7riyHH8tTSLlTB5/MivrJO8NWV9Zqny9CItb3Dyk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VXDsGF+SEovODnkGW/fKflftOWA/VAnOyJfz1kCYu/6WAwPW14+C/sJzqUp8AkONevqQ1XNwN0tpqS0RzC9gG6osrqF6oHuyNfuxDkHZBXJASV63FbFmm2j/y2ZorLAf7GUl3T6beh+yv2h6+xKAdmyjoLBIHP9jYVXh3AzVPd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=TehHH975; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (mob-5-90-43-135.net.vodafone.it [5.90.43.135])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 10E812B3;
	Mon, 22 Jul 2024 17:59:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1721663948;
	bh=5WE7riyHH8tTSLlTB5/MivrJO8NWV9Zqny9CItb3Dyk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TehHH975ybx1a3Z/ZkQz0TDu0AOxWeymgowTX9MWsbGKWQG/HCWsruvhfrmtiCd3n
	 tlgIamuOGFtZlfC7tpUwaO3yTvdqzu/qVCaRCGDGO+H36CTs6vMHQjoCByBn7LqsSt
	 jjzC0RiZBJ3RVbMyQTmMlmLea9HniIlvYgIL+7Ms=
Date: Mon, 22 Jul 2024 17:59:46 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Nick Hollinghurst <nick.hollinghurst@raspberrypi.org>, Naushir Patuck <naush@raspberrypi.com>, 
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, David Plowman <david.plowman@raspberrypi.com>, 
	linux-media@vger.kernel.org, kernel-list@raspberrypi.com, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: raspberrypi: VIDEO_RASPBERRYPI_PISP_BE should
 depend on ARCH_BCM2835
Message-ID: <ol5jiqwo26s6nrl3a3x4qcs7etxkbzbaz24lah2vgdsfj7qifr@5wnrk3tjr6n4>
References: <8e1c6c3a32919603072bb7278c66b4d469f7e762.1721661958.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <8e1c6c3a32919603072bb7278c66b4d469f7e762.1721661958.git.geert+renesas@glider.be>

Hi Geert

On Mon, Jul 22, 2024 at 05:28:28PM GMT, Geert Uytterhoeven wrote:
> Currently, the Raspberry Pi PiSP Backend (BE) ISP is only present on the
> Broadcom BCM2712-based Raspberry Pi 5.  Hence add a dependency on
                                        ^ nit: double space

> ARCH_BCM2835, to prevent asking the user about this driver when
> configuring a kernel without Broadcom BCM2835 family support.  The

double space before "The" as well

> dependency can be relaxed if/when the encoder appears on other SoC
> families.

we can surely lift this requirement in the unlikely event this happens

Thanks
Acked-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

>
> Fixes: 12187bd5d4f8c128 ("media: raspberrypi: Add support for PiSP BE")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  drivers/media/platform/raspberrypi/pisp_be/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/media/platform/raspberrypi/pisp_be/Kconfig b/drivers/media/platform/raspberrypi/pisp_be/Kconfig
> index 38c0f8305d620d83..46765a2e4c4d1573 100644
> --- a/drivers/media/platform/raspberrypi/pisp_be/Kconfig
> +++ b/drivers/media/platform/raspberrypi/pisp_be/Kconfig
> @@ -2,6 +2,7 @@ config VIDEO_RASPBERRYPI_PISP_BE
>  	tristate "Raspberry Pi PiSP Backend (BE) ISP driver"
>  	depends on V4L_PLATFORM_DRIVERS
>  	depends on VIDEO_DEV
> +	depends on ARCH_BCM2835 || COMPILE_TEST
>  	select VIDEO_V4L2_SUBDEV_API
>  	select MEDIA_CONTROLLER
>  	select VIDEOBUF2_DMA_CONTIG
> --
> 2.34.1
>

