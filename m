Return-Path: <linux-media+bounces-34326-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F406FAD1651
	for <lists+linux-media@lfdr.de>; Mon,  9 Jun 2025 02:38:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BB56A3A9884
	for <lists+linux-media@lfdr.de>; Mon,  9 Jun 2025 00:37:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54F6417597;
	Mon,  9 Jun 2025 00:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="pwuXG8b7"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FD462F37;
	Mon,  9 Jun 2025 00:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749429486; cv=none; b=rr6/diFYN9gpSpoM6MMr3ycPhp/p/bBOuiwtsR2idYc8EuGrE1grykDx025WietohIw4vCSjdbNoNOZfFfH8zGCTnfXfB920pZDUz1r4ug3O2Veuw/EBct6gnsljia7yEzcstanM6IgEOaD5ATGTuDD40aUK9Do3O75oNXTQcqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749429486; c=relaxed/simple;
	bh=VNImrDurwZK0+nYH5ILKXX5q7TG/MFOjxrqpLuoNmTI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZXRaZRfFyFWx7iKPU4n5nNJxOHRCQPyd3BQeRFkhJpI2+3YTrMil70Iz7/F6bE0m6q4q7ChPUxzTyhyNxnMKDWfoMnPYERSmUeea0ZABW3sXWNygmsZpzUpEjZrGtIg0uJDUAEP7EDG4v5jX0JpHKMKNQs5kIOua3sGLpkdyYUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=pwuXG8b7; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 33C923D5;
	Mon,  9 Jun 2025 02:37:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1749429477;
	bh=VNImrDurwZK0+nYH5ILKXX5q7TG/MFOjxrqpLuoNmTI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pwuXG8b7/mU1AjzKo96JkUt8kxMaGNh6RAw5ecbjkKIdCngiaVh+4DHxUN0JixM8w
	 Xv2trPT3CrltYX6iZyzNIAxh89GroguvRpnrAV1/qqERIBzk+AI3Yi+rFyJkpmv8Wq
	 VkGfv4ATvf4/93cY30rB5LsY7Z8TjOlDGg3rR/Ls=
Date: Mon, 9 Jun 2025 03:37:51 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>,
	Naushir Patuck <naush@raspberrypi.com>, linux-media@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: bcm2835-unicam: Remove RGB24 support
Message-ID: <20250609003751.GD14545@pendragon.ideasonboard.com>
References: <20250606-rpi-unicam-rgb-bgr-fix-v1-1-9930b963f3eb@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250606-rpi-unicam-rgb-bgr-fix-v1-1-9930b963f3eb@kernel.org>

Hi Maxime,

Thank you for the patch.

On Fri, Jun 06, 2025 at 04:53:03PM +0200, Maxime Ripard wrote:
> The RGB24 V4L2 format is defined as a pixel format with 8 bits per
> components, with the components being in the red, green, and blue order
> from left to right.
> 
> The RGB MIPI-CSI2 is defined in the specification (Section 11.3.1,
> RGB888) with blue coming first, then green, then red. So the opposite of
> what V4L2 means by RGB.
> 
> Since the hardware cannot reorder the components, this means that when
> selecting the RGB24 format, you get inverted red and blue components
> compared to what you'd expect.
> 
> The driver already supports BGR24, so we can simply remove the RGB24
> format from the driver.

The only reason I could think of to explain why the driver exposes
V4L2_PIX_FMT_RGB24 is to support CSI-2 sources that transfer RGB888 data
with a non-standard order. I don't know what hardware would do that.
Dave, Naush, do you recall why this pixel format is supported by the
unicam driver ?

> Fixes: 392cd78d495f ("media: bcm2835-unicam: Add support for CCP2/CSI2 camera interface")
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/media/platform/broadcom/bcm2835-unicam.c | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/drivers/media/platform/broadcom/bcm2835-unicam.c b/drivers/media/platform/broadcom/bcm2835-unicam.c
> index f10064107d543caf867249d0566a0f42d6d8c4c6..1f549019efd53c9aae83193e74f1a3601ebf274d 100644
> --- a/drivers/media/platform/broadcom/bcm2835-unicam.c
> +++ b/drivers/media/platform/broadcom/bcm2835-unicam.c
> @@ -338,15 +338,10 @@ static const struct unicam_format_info unicam_image_formats[] = {
>  	/* RGB Formats */
>  		.fourcc		= V4L2_PIX_FMT_RGB565, /* gggbbbbb rrrrrggg */
>  		.code		= MEDIA_BUS_FMT_RGB565_1X16,
>  		.depth		= 16,
>  		.csi_dt		= MIPI_CSI2_DT_RGB565,
> -	}, {
> -		.fourcc		= V4L2_PIX_FMT_RGB24, /* rgb */
> -		.code		= MEDIA_BUS_FMT_RGB888_1X24,
> -		.depth		= 24,
> -		.csi_dt		= MIPI_CSI2_DT_RGB888,
>  	}, {
>  		.fourcc		= V4L2_PIX_FMT_BGR24, /* bgr */
>  		.code		= MEDIA_BUS_FMT_BGR888_1X24,
>  		.depth		= 24,
>  		.csi_dt		= MIPI_CSI2_DT_RGB888,
> 
> ---
> base-commit: 0ff41df1cb268fc69e703a08a57ee14ae967d0ca
> change-id: 20250606-rpi-unicam-rgb-bgr-fix-d1b6f46a75ad

-- 
Regards,

Laurent Pinchart

