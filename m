Return-Path: <linux-media+bounces-34000-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B3A06ACC585
	for <lists+linux-media@lfdr.de>; Tue,  3 Jun 2025 13:34:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0E06E188F6C7
	for <lists+linux-media@lfdr.de>; Tue,  3 Jun 2025 11:34:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11E2922A804;
	Tue,  3 Jun 2025 11:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="DWvV5HUb"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E63C4AD5E
	for <linux-media@vger.kernel.org>; Tue,  3 Jun 2025 11:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748950435; cv=none; b=DP65PJrxNnzyf6JmNmzdFDB9eOILl65pNJs25P+BnGm+SwdOWE8R5Ic1DYcoRwxWOJBnfEIshJIwjk/72wszOMKdwyLUbmQdOgQwlCxcNwP/yX1AiRSuF9GfKVsEM8g29GffzMEzqRxSF7n87i/JOSCGbbYHGdGYNiQ3arnjha0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748950435; c=relaxed/simple;
	bh=FGdqyQQ6XNBJn5RdUELo9lMb0fR4wat6FlRgVWR72QE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ED8MJGdSDiUDMilgvbTmM+SMWZhZbxtHlx6eHWVGJVHT0tC9yoJiocBRkkwCCVpXjLfmasW2l4YrQe9P2QBwkTVmKDffVkFYGY/6bn1BflJixk1FIz7QlDa/WBOh+PTtoqmTrcLU5s+zSxcwnJLyq0WEgeWHuqwHoxJjD5g/xBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=DWvV5HUb; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id AEF4B496;
	Tue,  3 Jun 2025 13:33:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1748950429;
	bh=FGdqyQQ6XNBJn5RdUELo9lMb0fR4wat6FlRgVWR72QE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DWvV5HUbnDVACyG2N4HVZyfz4H/6vs/QWttWpeqJPfYcsOKzIJwl8AD5cT1TFLP3D
	 mUFFqfyAlHwRk8exgNON3SlY/wO9XyOp4UauT/HgKad0ZKK4j8mLF5octW69utUAzw
	 bTb7dzc89bDArKnHfIT7fqpom8FCr5l9eGDsgtng=
Date: Tue, 3 Jun 2025 14:33:42 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans de Goede <hansg@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Mathis Foerst <mathis.foerst@mt.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Subject: Re: [PATCH v2 10/12] media: mt9m114: Drop start-, stop-streaming
 sequence from initialize
Message-ID: <20250603113342.GD27361@pendragon.ideasonboard.com>
References: <20250531163148.83497-1-hansg@kernel.org>
 <20250531163148.83497-11-hansg@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250531163148.83497-11-hansg@kernel.org>

Hi Hans,

Thank you for the patch.

On Sat, May 31, 2025 at 06:31:45PM +0200, Hans de Goede wrote:
> Drop the start-, stop-streaming sequence from initialize.
> 
> When streaming is started with a runtime-suspended sensor,
> mt9m114_start_streaming() will runtime-resume the sensor which calls
> mt9m114_initialize() immediately followed by calling
> mt9m114_set_state(ENTER_CONFIG_CHANGE).
> 
> This results in the following state changes in quick succession:
> 
> mt9m114_set_state(ENTER_CONFIG_CHANGE) -> transitions to STREAMING
> mt9m114_set_state(ENTER_SUSPEND)       -> transitions to SUSPENDED
> mt9m114_set_state(ENTER_CONFIG_CHANGE) -> transitions to STREAMING
> 
> these quick state changes confuses the CSI receiver on atomisp devices
> causing streaming to not work.
> 
> Drop the state changes from mt9m114_initialize() so that only
> a single mt9m114_set_state(ENTER_CONFIG_CHANGE) call is made
> when streaming is started with a runtime-suspend sensor.
> 
> This means that the sensor may have config changes pending when
> mt9m114_runtime_suspend() gets called the first time after mt9m114_probe(),
> when streaming was not started within the 1 second runtime-pm timeout.
> Keep track of this and do the ENTER_CONFIG_CHANGE + ENTER suspend from
> mt9m114_runtime_suspend() if necessary.
> 
> Signed-off-by: Hans de Goede <hansg@kernel.org>
> ---
>  drivers/media/i2c/mt9m114.c | 19 +++++++++++--------
>  1 file changed, 11 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
> index d954f2be8f0d..c4d3122d698e 100644
> --- a/drivers/media/i2c/mt9m114.c
> +++ b/drivers/media/i2c/mt9m114.c
> @@ -389,6 +389,7 @@ struct mt9m114 {
>  
>  	unsigned int pixrate;
>  	bool streaming;
> +	bool config_change_pending;
>  	u32 clk_freq;
>  
>  	/* Pixel Array */
> @@ -782,14 +783,7 @@ static int mt9m114_initialize(struct mt9m114 *sensor)
>  	if (ret < 0)
>  		return ret;
>  
> -	ret = mt9m114_set_state(sensor, MT9M114_SYS_STATE_ENTER_CONFIG_CHANGE);
> -	if (ret < 0)
> -		return ret;

Entering Config-Change here was meant to ensure the PLL and output mode
settings get applied. The PLL settings can probably wait until we start
streaming. For the output mode, I'm slightly concerned that incorrect
settings could lead to hardware issues, as the sensor starts in parallel
output mode. I suppose it shouldn't cause any hardware damage, so I
think we could try to just delay Config-Change until we start streaming.

> -
> -	ret = mt9m114_set_state(sensor, MT9M114_SYS_STATE_ENTER_SUSPEND);
> -	if (ret < 0)
> -		return ret;

This bothers me a bit more. As far as I understand, the sensor starts
streaming right after power on reset, so I'd like to disable streaming
as quickly as possible.

> -
> +	sensor->config_change_pending = true;
>  	return 0;
>  }
>  
> @@ -976,6 +970,7 @@ static int mt9m114_start_streaming(struct mt9m114 *sensor,
>  	if (ret)
>  		goto error;
>  
> +	sensor->config_change_pending = false;
>  	sensor->streaming = true;
>  
>  	return 0;
> @@ -2267,6 +2262,14 @@ static int __maybe_unused mt9m114_runtime_suspend(struct device *dev)
>  	struct v4l2_subdev *sd = dev_get_drvdata(dev);
>  	struct mt9m114 *sensor = ifp_to_mt9m114(sd);
>  
> +	if (sensor->config_change_pending) {
> +		/* mt9m114_set_state() prints errors itself, no need to check */
> +		mt9m114_set_state(sensor,
> +				  MT9M114_SYS_STATE_ENTER_CONFIG_CHANGE);
> +		mt9m114_set_state(sensor,
> +				  MT9M114_SYS_STATE_ENTER_SUSPEND);
> +	}
> +
>  	mt9m114_power_off(sensor);
>  
>  	return 0;

-- 
Regards,

Laurent Pinchart

