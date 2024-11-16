Return-Path: <linux-media+bounces-21482-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 692819CFFEF
	for <lists+linux-media@lfdr.de>; Sat, 16 Nov 2024 17:47:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EF828B24D05
	for <lists+linux-media@lfdr.de>; Sat, 16 Nov 2024 16:47:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B65218BB8E;
	Sat, 16 Nov 2024 16:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="L+PLrd+y"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CA822AC17;
	Sat, 16 Nov 2024 16:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731775637; cv=none; b=ILUlzXDnOkSriyEMIznMYYoIfXV4fxadkt89fzoOyZlDVG/fbbPAluhMlonmba6TdGrUaf+yjquxzc51B+6Md2Q8LBOcHeyD68Hv33qRR74NxfYAaB0IUhJBtGbNmDVUyKQ8QMZOvMeQ1Ijl1rC4bTr9pPSYjTdfJ0bCD6k/S5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731775637; c=relaxed/simple;
	bh=GLcVPaLmUS7m9p/it7TURICZLmfddMNJJXnI/2o1WMw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oKlCR3ZersoYqF5+gCq6YN8Xxmv8NlJm7XZ2mslMIzku7DGD5pMRbKymVD3SzdsYKggk5ZIm6BMy9/mWfo16VzipHrfmHZra5GdMpO7SPE3KmvvY2SbehHg1WYHRv3EmBYHT/OFNzEAPGVIWEmAXAfdauRUxK7tgWV5LW5irO+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=L+PLrd+y; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id F23F73DC;
	Sat, 16 Nov 2024 17:46:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1731775618;
	bh=GLcVPaLmUS7m9p/it7TURICZLmfddMNJJXnI/2o1WMw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L+PLrd+yakC+Orm08ZiglY8DtED/wQ56YOSZkoGWrJsZjByYz6v6bcf+XsRhjA/7w
	 PF8Re+NW2NGhIW8IL88C+zcnnX2QlG2Hve1OAZijtrMfTF5/16EPLLOaYl1dbu9Z0F
	 OGBsePkFIdp/cjXB/1QiITd4fxGK83ZQDA8rLws4=
Date: Sat, 16 Nov 2024 18:47:05 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Alexandru Ardelean <aardelean@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	manivannan.sadhasivam@linaro.org, sakari.ailus@linux.intel.com,
	mchehab@kernel.org, kieran.bingham@ideasonboard.com,
	naush@raspberrypi.com
Subject: Re: [PATCH v2] drivers: media: imx296: Add standby delay during probe
Message-ID: <20241116164705.GC12409@pendragon.ideasonboard.com>
References: <20241115142021.574402-1-aardelean@baylibre.com>
 <20241115180717.10820-1-aardelean@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241115180717.10820-1-aardelean@baylibre.com>

Hi Alexandru, Naush,

Thank you for the patch.

On Fri, Nov 15, 2024 at 08:07:17PM +0200, Alexandru Ardelean wrote:
> From: Naushir Patuck <naush@raspberrypi.com>
> 
> Add a 2-5ms delay when coming out of standby and before reading the
> sensor info register durning probe, as instructed by the datasheet. This
> standby delay is already present when the sensor starts streaming.
> 
> During a cold-boot, reading the IMX296_SENSOR_INFO register would often
> return a value of 0x0000, if this delay is not present before.
> 
> Fixes: cb33db2b6ccfe ("media: i2c: IMX296 camera sensor driver")
> Tested-by: Alexandru Ardelean <aardelean@baylibre.com>
> Signed-off-by: Naushir Patuck <naush@raspberrypi.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> 
> Changelog v1 -> v2:
> * https://lore.kernel.org/linux-media/20241115142021.574402-1-aardelean@baylibre.com/
> * Technically, this is not a true V2, but rather a new patch
>   - But in V1, the attempt was to fix an issue found with the upstream
>     IMX296 driver, which was pointed out by Kieran that it was already
>     fixed (more elegantly) in the RPi tree.
>   - The standby delay helps during a cold-boot so that the driver can read
>     the IMX296_SENSOR_INFO register. If the delay isn't present the value
>     read is 0xx0000.
>   - Original patch can be found:
>     https://github.com/raspberrypi/linux/commit/7713ce38e6a26425ace3a57b3d03ba0125c16f89
>   - From the original patch of Naushir Patuck,
>     - Added comment 
>       -------
>       During a cold-boot, reading the IMX296_SENSOR_INFO register would often 
>       return a value of 0x0000, if this delay is not present before.
>       -------
>     - Added 'Tested-by: Alexandru Ardelean <aardelean@baylibre.com>
>     - Added 'Fixes: cb33db2b6ccfe ("media: i2c: IMX296 camera sensor driver")'
> 
>  drivers/media/i2c/imx296.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/media/i2c/imx296.c b/drivers/media/i2c/imx296.c
> index f942f66fa664..395bfe4fb23d 100644
> --- a/drivers/media/i2c/imx296.c
> +++ b/drivers/media/i2c/imx296.c
> @@ -940,6 +940,8 @@ static int imx296_identify_model(struct imx296 *sensor)
>  		return ret;
>  	}
>  
> +	usleep_range(2000, 5000);
> +
>  	ret = imx296_read(sensor, IMX296_SENSOR_INFO);
>  	if (ret < 0) {
>  		dev_err(sensor->dev, "failed to read sensor information (%d)\n",

-- 
Regards,

Laurent Pinchart

