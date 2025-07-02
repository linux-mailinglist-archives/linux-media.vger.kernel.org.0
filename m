Return-Path: <linux-media+bounces-36492-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 98B38AF07C5
	for <lists+linux-media@lfdr.de>; Wed,  2 Jul 2025 03:09:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0E7D1176D61
	for <lists+linux-media@lfdr.de>; Wed,  2 Jul 2025 01:09:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D84581459F6;
	Wed,  2 Jul 2025 01:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="XWD3TGv/"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6D2A13AA2A
	for <linux-media@vger.kernel.org>; Wed,  2 Jul 2025 01:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751418562; cv=none; b=rvsGZRyAW8l5NWw1AIyGil/pIDceudEmAujOIk2yc5YUrXfzs2OtHmlMUcAvq5IeuZ0qc/XD3TVRS8drmHREEFVpATu1YHx2vsMLXujKFkfrfcG2nyjb6E0HNk9TvPWbFzI3yttc4n+AstKiDKNwJumBYqjz658QblQ6kkkcyuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751418562; c=relaxed/simple;
	bh=2FZuT5qNsadfEL8+Kvq2mA6GMKfPnSYzOFZyt73VDHo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oKXoNbBrrZoDrvpy0dqt03oimmVjbWisPlrdAs+r5O3rybedwCW1vy4QKlRWnXDeOky05s7CVz6LWBjAv6lIMd/LVOIt/2YSf4+yB6WpuEgewU9qBCBW2Sq32rDqHOp8cAwjkCc/K7IgFGdpQhtpMpsmO/7t6+UaEEMPURBXtmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=XWD3TGv/; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 6A1B8C75;
	Wed,  2 Jul 2025 03:08:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1751418536;
	bh=2FZuT5qNsadfEL8+Kvq2mA6GMKfPnSYzOFZyt73VDHo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XWD3TGv/ozC31iWn95kaKXTdWZee8pUHufx1b0Fg/O59TMUfhIGkgIonHINOpk54A
	 yqLfw2c8ZV5XE0dnVsUSkIhyPHStQ8I8lgnCCVLGV+0Twhaw3VFa388Ps7ug1i9Ad4
	 IUhL1nLUmcTp6VZCPlYQka/UMuZ42UoflS8MrKP8=
Date: Wed, 2 Jul 2025 04:08:52 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans de Goede <hansg@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mathis Foerst <mathis.foerst@mt.com>, linux-media@vger.kernel.org
Subject: Re: [PATCH v3 13/15] media: mt9m114: Drop start-, stop-streaming
 sequence from initialize
Message-ID: <20250702010852.GI17819@pendragon.ideasonboard.com>
References: <20250629205626.68341-1-hansg@kernel.org>
 <20250629205626.68341-14-hansg@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250629205626.68341-14-hansg@kernel.org>

Hi Hans,

Thank you for the patch.

On Sun, Jun 29, 2025 at 10:56:23PM +0200, Hans de Goede wrote:
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

Could you please update the commit message with the result of the
discussion on v2 ? I'd like to record that mt9m114_power_on() leaves the
sensor in the STANDBY state, either because it is already in standby for
CSI-2 mode, or with an explicit state change in parallel mode (with the
mode configured through the CONFIG pin). That's in my opinion the reason
we can drop the ENTER_CONFIG_CHANGE and ENTER_SUSPEND in
mt9m114_initialize().

> Signed-off-by: Hans de Goede <hansg@kernel.org>
> ---
>  drivers/media/i2c/mt9m114.c | 19 +++++++++++--------
>  1 file changed, 11 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
> index 1280d90cd411..ec5e9ce24d1c 100644
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
> @@ -781,14 +782,7 @@ static int mt9m114_initialize(struct mt9m114 *sensor)
>  	if (ret < 0)
>  		return ret;
>  
> -	ret = mt9m114_set_state(sensor, MT9M114_SYS_STATE_ENTER_CONFIG_CHANGE);
> -	if (ret < 0)
> -		return ret;
> -
> -	ret = mt9m114_set_state(sensor, MT9M114_SYS_STATE_ENTER_SUSPEND);
> -	if (ret < 0)
> -		return ret;
> -
> +	sensor->config_change_pending = true;
>  	return 0;
>  }
>  
> @@ -987,6 +981,7 @@ static int mt9m114_start_streaming(struct mt9m114 *sensor,
>  	if (ret)
>  		goto error;
>  
> +	sensor->config_change_pending = false;
>  	sensor->streaming = true;
>  
>  	return 0;
> @@ -2315,6 +2310,14 @@ static int __maybe_unused mt9m114_runtime_suspend(struct device *dev)
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

What's the point of this if we're powering the sensor right after ?

> +
>  	mt9m114_power_off(sensor);
>  
>  	return 0;

-- 
Regards,

Laurent Pinchart

