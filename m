Return-Path: <linux-media+bounces-26750-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C85EA4122C
	for <lists+linux-media@lfdr.de>; Mon, 24 Feb 2025 00:07:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AC4F8188F973
	for <lists+linux-media@lfdr.de>; Sun, 23 Feb 2025 23:07:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A4FD200B8A;
	Sun, 23 Feb 2025 23:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="lLccXvM6"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 130608828
	for <linux-media@vger.kernel.org>; Sun, 23 Feb 2025 23:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740352031; cv=none; b=f1T3TSi9WUwjQWrRRlfC1QuYTvRW8KM6b8/cDNlqhCIsTpIorfxLJyWzghDVZt04bZIIg2Bc82X1SmRtXZFXB01Egvg0RMYkb9xGWESGsV8qCvgUoBc6PaxNXUkwkwLNxILMukmmPXerMfFaqMAQNPWqN/E18WuNDUmkC0AQugI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740352031; c=relaxed/simple;
	bh=bbv36lVgbCBDut9gJA8tK0hWDYnyIpq6kABbRroWdMk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tHSe/uE/5ABVeP/JGqT9slfng2pZzADWp+Mo7zNBhIcF/N5WCjJaLr9wtFhh9QQL0ssWN0eQOOxOBbUAM/x+g1NpgIKcwo1m/aJDRRXCLTViAnerDy2k5p2J9sCwcZcZUoRq5W9+hpEBYLg5ydLMiuDX7cYfvqoRa1Xti3W/pLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=lLccXvM6; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DC156353;
	Mon, 24 Feb 2025 00:05:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1740351941;
	bh=bbv36lVgbCBDut9gJA8tK0hWDYnyIpq6kABbRroWdMk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lLccXvM6PA1+3siu+EfPPKTOscxBWSxub2OQ4tFCouOCNjW7kzvIN+cWpUOnQBh5v
	 XbakEYVnmrbUE/9861nuKSbLGM56zf7ON8/1A/uHuAUPJqw16lA4nC5Kbq+VJ2rYkr
	 TXYY2wecAV6P07NaNTPPgwo9cpElfnCtBggYaL+k=
Date: Mon, 24 Feb 2025 01:06:49 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Mehdi Djait <mehdi.djait@linux.intel.com>
Cc: sakari.ailus@linux.intel.com, dave.stevenson@raspberrypi.com,
	tomi.valkeinen@ideasonboard.com, linux-media@vger.kernel.org
Subject: Re: [PATCH] media: i2c: imx219: Add support for 'clock-frequency'
 parsing
Message-ID: <20250223230649.GD16159@pendragon.ideasonboard.com>
References: <20250220154909.152538-1-mehdi.djait@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250220154909.152538-1-mehdi.djait@linux.intel.com>

Hi Mehdi,

Thank you for the patch.

On Thu, Feb 20, 2025 at 04:49:09PM +0100, Mehdi Djait wrote:
> Make the clock producer reference lookup optional
> 
> Add support for ACPI-based platforms by parsing the 'clock-frequency'
> property when no clock producer is available
> 
> Signed-off-by: Mehdi Djait <mehdi.djait@linux.intel.com>
> ---
>  drivers/media/i2c/imx219.c | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> index 2d54cea113e1..a876a6d80a47 100644
> --- a/drivers/media/i2c/imx219.c
> +++ b/drivers/media/i2c/imx219.c
> @@ -1103,12 +1103,22 @@ static int imx219_probe(struct i2c_client *client)
>  				     "failed to initialize CCI\n");
>  
>  	/* Get system clock (xclk) */
> -	imx219->xclk = devm_clk_get(dev, NULL);
> +	imx219->xclk = devm_clk_get_optional(dev, NULL);
>  	if (IS_ERR(imx219->xclk))
>  		return dev_err_probe(dev, PTR_ERR(imx219->xclk),
>  				     "failed to get xclk\n");
>  
> -	imx219->xclk_freq = clk_get_rate(imx219->xclk);
> +	if (imx219->xclk) {
> +		imx219->xclk_freq = clk_get_rate(imx219->xclk);
> +	} else {
> +		ret = fwnode_property_read_u32(dev_fwnode(dev),
> +					       "clock-frequency",
> +					       &imx219->xclk_freq);
> +		if (ret)
> +			return dev_err_probe(dev, ret,
> +					     "failed to get clock frequency");
> +	}
> +

This doesn't seem specific to the imx219 driver. Could you turn this
into a generic V4L2 sensor helper that would take a struct device and a
clock name, and return the frequency, either retrieved from the clock,
or from the clock-frequency property as a fallback ?

Some drivers will also need to control the clock, so the clock should
probably be returned too.

>  	if (imx219->xclk_freq != IMX219_XCLK_FREQ)
>  		return dev_err_probe(dev, -EINVAL,
>  				     "xclk frequency not supported: %d Hz\n",

-- 
Regards,

Laurent Pinchart

