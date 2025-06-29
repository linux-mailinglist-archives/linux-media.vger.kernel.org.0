Return-Path: <linux-media+bounces-36224-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C796AED12D
	for <lists+linux-media@lfdr.de>; Sun, 29 Jun 2025 23:06:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8241E1704BB
	for <lists+linux-media@lfdr.de>; Sun, 29 Jun 2025 21:06:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BA3F239597;
	Sun, 29 Jun 2025 21:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="j4NvOYxp"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 027458F54
	for <linux-media@vger.kernel.org>; Sun, 29 Jun 2025 21:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751231155; cv=none; b=nJinZSxGJBXgb0GTUXAz7R++H5qlvPg6iG3MFi0NsndH90m7gpOLYrvk89MqCzn7HRpvw77vxoy33QwT9xOo66vLJUzFtZ5gTopZFkztA7RpBAYvvfR3Ger27scbb5VWuqARNpHBQI9PqwAlw8ZqRrFlVTtzZQ3I7d9+Qn80BsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751231155; c=relaxed/simple;
	bh=N7yCFAOt7ygzoL3t6faz4U7g2CO047R2GVuOnLBy0aE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eU66I8XKjjUP+hvO+93ZMB/bs2e3XlEOwEFYuAy+kxfJaOr28SDLdiqeLiXRz1s8ToV3Q+oYrtcfa0zwelkbFpUk/NslV4PDMhYAJ7EsUhsp/x9P93/7xecWkOkIu/Jr0mOqzR4X/JBqX5dxpP0HdJIftROWrpPZFOOIbNgvm4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=j4NvOYxp; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id A573EC67;
	Sun, 29 Jun 2025 23:05:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1751231130;
	bh=N7yCFAOt7ygzoL3t6faz4U7g2CO047R2GVuOnLBy0aE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j4NvOYxp5Ru2wNK6mbyg0T6qsXvid1LvdRi39BqGufCFvxYto8a8kylG6CxcNIWlS
	 SphFvqMGZuSxdNI46P3lj845lT9Xq+Qu4UFGeKE8DPUmbrkDUus5StQxnUrWd5nzKM
	 5BnDF+p5cAuie8edivLGEmMRLhrrLHX/8qkdXyTE=
Date: Mon, 30 Jun 2025 00:05:27 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans de Goede <hansg@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Mathis Foerst <mathis.foerst@mt.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Subject: Re: [PATCH v2 10/12] media: mt9m114: Drop start-, stop-streaming
 sequence from initialize
Message-ID: <20250629210527.GB2059@pendragon.ideasonboard.com>
References: <20250531163148.83497-1-hansg@kernel.org>
 <20250531163148.83497-11-hansg@kernel.org>
 <20250603113342.GD27361@pendragon.ideasonboard.com>
 <968b4629-68e3-48e4-ba1d-2b8c6bac4926@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <968b4629-68e3-48e4-ba1d-2b8c6bac4926@kernel.org>

On Sun, Jun 29, 2025 at 07:11:54PM +0200, Hans de Goede wrote:
> On 3-Jun-25 1:33 PM, Laurent Pinchart wrote:
> > On Sat, May 31, 2025 at 06:31:45PM +0200, Hans de Goede wrote:
> >> Drop the start-, stop-streaming sequence from initialize.
> >>
> >> When streaming is started with a runtime-suspended sensor,
> >> mt9m114_start_streaming() will runtime-resume the sensor which calls
> >> mt9m114_initialize() immediately followed by calling
> >> mt9m114_set_state(ENTER_CONFIG_CHANGE).
> >>
> >> This results in the following state changes in quick succession:
> >>
> >> mt9m114_set_state(ENTER_CONFIG_CHANGE) -> transitions to STREAMING
> >> mt9m114_set_state(ENTER_SUSPEND)       -> transitions to SUSPENDED
> >> mt9m114_set_state(ENTER_CONFIG_CHANGE) -> transitions to STREAMING
> >>
> >> these quick state changes confuses the CSI receiver on atomisp devices
> >> causing streaming to not work.
> >>
> >> Drop the state changes from mt9m114_initialize() so that only
> >> a single mt9m114_set_state(ENTER_CONFIG_CHANGE) call is made
> >> when streaming is started with a runtime-suspend sensor.
> >>
> >> This means that the sensor may have config changes pending when
> >> mt9m114_runtime_suspend() gets called the first time after mt9m114_probe(),
> >> when streaming was not started within the 1 second runtime-pm timeout.
> >> Keep track of this and do the ENTER_CONFIG_CHANGE + ENTER suspend from
> >> mt9m114_runtime_suspend() if necessary.
> >>
> >> Signed-off-by: Hans de Goede <hansg@kernel.org>
> >> ---
> >>  drivers/media/i2c/mt9m114.c | 19 +++++++++++--------
> >>  1 file changed, 11 insertions(+), 8 deletions(-)
> >>
> >> diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
> >> index d954f2be8f0d..c4d3122d698e 100644
> >> --- a/drivers/media/i2c/mt9m114.c
> >> +++ b/drivers/media/i2c/mt9m114.c
> >> @@ -389,6 +389,7 @@ struct mt9m114 {
> >>  
> >>  	unsigned int pixrate;
> >>  	bool streaming;
> >> +	bool config_change_pending;
> >>  	u32 clk_freq;
> >>  
> >>  	/* Pixel Array */
> >> @@ -782,14 +783,7 @@ static int mt9m114_initialize(struct mt9m114 *sensor)
> >>  	if (ret < 0)
> >>  		return ret;
> >>  
> >> -	ret = mt9m114_set_state(sensor, MT9M114_SYS_STATE_ENTER_CONFIG_CHANGE);
> >> -	if (ret < 0)
> >> -		return ret;
> > 
> > Entering Config-Change here was meant to ensure the PLL and output mode
> > settings get applied. The PLL settings can probably wait until we start
> > streaming. For the output mode, I'm slightly concerned that incorrect
> > settings could lead to hardware issues, as the sensor starts in parallel
> > output mode. I suppose it shouldn't cause any hardware damage, so I
> > think we could try to just delay Config-Change until we start streaming.
> > 
> >> -
> >> -	ret = mt9m114_set_state(sensor, MT9M114_SYS_STATE_ENTER_SUSPEND);
> >> -	if (ret < 0)
> >> -		return ret;
> > 
> > This bothers me a bit more. As far as I understand, the sensor starts
> > streaming right after power on reset, so I'd like to disable streaming
> > as quickly as possible.
> 
> Actually while working on immediately putting the sensor back in
> suspend from probe() I noticed that mt9m114_power_on() puts the
> sensor in standby at the end even checks for this:
> 
>         /*
>          * Before issuing any Set-State command, we must ensure that the sensor
>          * reaches the standby mode (either initiated manually above in
>          * parallel mode, or automatically after reset in MIPI mode).
>          */
>         ret = mt9m114_poll_state(sensor, MT9M114_SYS_STATE_STANDBY);
>         if (ret < 0)
>                 goto error_clock;
> 
>         return 0;
> 
> Which means should not be streaming after power-on. So I believe that
> this patch is fine as is and I'm going to keep this version  for v3
> of the patch-set.

I just realized that this is governed by the external CONFIG pin. When
the pin if pulled up (or left floating, as there's an internal pull-up
resistor), the PLL is automatically configured and the sensor starts
streaming at power up time. When the pin is pulled low, the sensor will
go to the standby state.

I think we can assume that CONFIG will be pulled low when the sensor is
used with the CSI-2 output. For the parallel output, either
configuration is possible. mt9m114_power_on() issues a
MT9M114_SYS_STATE_ENTER_STANDBY in that case.

> >> -
> >> +	sensor->config_change_pending = true;
> >>  	return 0;
> >>  }
> >>  
> >> @@ -976,6 +970,7 @@ static int mt9m114_start_streaming(struct mt9m114 *sensor,
> >>  	if (ret)
> >>  		goto error;
> >>  
> >> +	sensor->config_change_pending = false;
> >>  	sensor->streaming = true;
> >>  
> >>  	return 0;
> >> @@ -2267,6 +2262,14 @@ static int __maybe_unused mt9m114_runtime_suspend(struct device *dev)
> >>  	struct v4l2_subdev *sd = dev_get_drvdata(dev);
> >>  	struct mt9m114 *sensor = ifp_to_mt9m114(sd);
> >>  
> >> +	if (sensor->config_change_pending) {
> >> +		/* mt9m114_set_state() prints errors itself, no need to check */
> >> +		mt9m114_set_state(sensor,
> >> +				  MT9M114_SYS_STATE_ENTER_CONFIG_CHANGE);
> >> +		mt9m114_set_state(sensor,
> >> +				  MT9M114_SYS_STATE_ENTER_SUSPEND);
> >> +	}
> >> +
> >>  	mt9m114_power_off(sensor);
> >>  
> >>  	return 0;

-- 
Regards,

Laurent Pinchart

