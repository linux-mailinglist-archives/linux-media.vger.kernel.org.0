Return-Path: <linux-media+bounces-25816-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C086A2C850
	for <lists+linux-media@lfdr.de>; Fri,  7 Feb 2025 17:07:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7AD783A6F20
	for <lists+linux-media@lfdr.de>; Fri,  7 Feb 2025 16:07:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C5B91EB18D;
	Fri,  7 Feb 2025 16:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="vCBtW1L/"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF8AC23C8AE;
	Fri,  7 Feb 2025 16:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738944435; cv=none; b=ZMK3k23LLqbvFLpgKuxseMC6rikfPhvJPj07HQYwcXte3+CqHNMs67JKCFXNUm3At+vCUZQRXJ1gXecgYur9D/HhSE4536zRa3fAHF/iReLkhzeExhm1/+M1em0/C/QbkdkNPd/6cXSFKLXwYAsIBfDqUq8VRU0BKgGtdOWdaAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738944435; c=relaxed/simple;
	bh=9RI9R95BCWXByN7ncvud0VHfAmpWEthzFIMhXO66zn8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ozV3bkDrGuE+mjYlDX/0Ml6wgfTe0Sv84Rvqlarx3ajQfkKebnMO581eFJvAWDx07wh3Yhxd6ymsYEYyuRrhrur0/zUawkOBOKShZBNBtzJOGJofiNAjygUPqW6E8o6XQZR82eeK6VWgMImF6onLfnQ3P67R3AVaKqkMCOsFRSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=vCBtW1L/; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (mob-5-90-139-204.net.vodafone.it [5.90.139.204])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6389A2BA;
	Fri,  7 Feb 2025 17:05:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1738944357;
	bh=9RI9R95BCWXByN7ncvud0VHfAmpWEthzFIMhXO66zn8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vCBtW1L/ksNv9dQoWM+M0hzDLOTCMRoRlT6o7+lGHwTiymwxwr9Z3AZNvCzEUYz98
	 OyHt1XKM9lHB4T9yOoCReerLaV7qA7NZpOYxq+oJXFy3HgWlvnHf8HxW3JYqTABbxx
	 w7bO0RM24lSb5p7nxLxc/I9mocZZ7hHAtKraIOfY=
Date: Fri, 7 Feb 2025 17:07:07 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v6 4/5] media: i2c: imx219: Increase minimum LLP to fix
 blocky artefacts
Message-ID: <j4gczp5ch3cz5tvnjolnhwda4vqyztyq24p37ncqaephc45lo2@273oss3pilee>
References: <20250204-imx219_fixes-v6-0-84ffa5030972@ideasonboard.com>
 <20250204-imx219_fixes-v6-4-84ffa5030972@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250204-imx219_fixes-v6-4-84ffa5030972@ideasonboard.com>

Hi Jai

On Tue, Feb 04, 2025 at 12:34:39PM +0530, Jai Luthra wrote:
> The sensor's internal ADC supports a minimum line length of 3448 pixels,
> which may be too small to use with analog binning, where ADC operates on
> two lines together. Switch to a higher minimum line length of 3560
> pixels to fix the blocky artefacts seen with analog binning [1].
>

Very nice finding!

If the new value differs from the default register value in the
datahseet, can we record the reason with a comment ?

> To keep the same default framerate as before for all the modes, lower
> the default fll value to compensate for the increase in llp.

Thanks for handling this

This seems fine to me
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Thanks
  j

>
> [1]: https://github.com/raspberrypi/rpicam-apps/issues/281#issuecomment-1082894118
>
> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> ---
>  drivers/media/i2c/imx219.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> index 8239e7ea8ec03849b339c1f314485266d4c4d8bd..e4aa6e66b673bb7a8942bf8daf27267c2884ec95 100644
> --- a/drivers/media/i2c/imx219.c
> +++ b/drivers/media/i2c/imx219.c
> @@ -74,7 +74,7 @@
>  #define IMX219_FLL_MAX			0xffff
>  #define IMX219_VBLANK_MIN		32
>  #define IMX219_REG_LINE_LENGTH_A	CCI_REG16(0x0162)
> -#define IMX219_LLP_MIN			0x0d78
> +#define IMX219_LLP_MIN			0x0de8
>  #define IMX219_LLP_MAX			0x7ff0
>
>  #define IMX219_REG_X_ADD_STA_A		CCI_REG16(0x0164)
> @@ -286,25 +286,25 @@ static const struct imx219_mode supported_modes[] = {
>  		/* 8MPix 15fps mode */
>  		.width = 3280,
>  		.height = 2464,
> -		.fll_def = 3526,
> +		.fll_def = 3415,
>  	},
>  	{
>  		/* 1080P 30fps cropped */
>  		.width = 1920,
>  		.height = 1080,
> -		.fll_def = 1763,
> +		.fll_def = 1707,
>  	},
>  	{
>  		/* 2x2 binned 30fps mode */
>  		.width = 1640,
>  		.height = 1232,
> -		.fll_def = 1763,
> +		.fll_def = 1707,
>  	},
>  	{
>  		/* 640x480 30fps mode */
>  		.width = 640,
>  		.height = 480,
> -		.fll_def = 1763,
> +		.fll_def = 1707,
>  	},
>  };
>
>
> --
> 2.48.1
>

