Return-Path: <linux-media+bounces-49427-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E59E6CDA001
	for <lists+linux-media@lfdr.de>; Tue, 23 Dec 2025 17:50:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BE009302104D
	for <lists+linux-media@lfdr.de>; Tue, 23 Dec 2025 16:50:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 047D82C11EB;
	Tue, 23 Dec 2025 16:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="gCzqxxKQ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4BA6274B2B
	for <linux-media@vger.kernel.org>; Tue, 23 Dec 2025 16:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766508644; cv=none; b=pdjm+lxOvEjT94FkVjaOS04RnZ8/13OBltH7ChHXpxdAhTg/owuFBZHBNMMPECsLOJC+MUltA3etG3gUpn8mdMQbJ70BwJOmPs7peD+rIwr4vszk42kKlxUMV9e6dX+hUoF59jP2UYBsRbRU+AESQUoWsuEz3PLOnkG8EwcAUWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766508644; c=relaxed/simple;
	bh=DOYu9xEiiwIsdzhK0OS2h+7uJc9hgp0kjZV8Q9k7+jg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P/dw605p37pqrI8r0ltMayRL4zFPCb3DOaHNHr7zCt7Tti244K1ARIqCpRqHdJGKvpML9VoLHUwuz9vx7tsyiUT6fxYhtEy+Athikg67SFJ5G5fVAz4oE6Q/akhpM943GWubanfwm/YXEFSHF6pk7bOsat1Ci19+G3iori67e+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=gCzqxxKQ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-152.bb.dnainternet.fi [81.175.209.152])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id A5483557;
	Tue, 23 Dec 2025 17:50:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1766508629;
	bh=DOYu9xEiiwIsdzhK0OS2h+7uJc9hgp0kjZV8Q9k7+jg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gCzqxxKQBlOGpozHLKZYfJPCViyKHJCG5h7Stemqj2TiXOPfO3Wr4mnZq9R01YbuN
	 KkeflDZjBWVfNzJf/vI41ffzbEK5fUwSugeJ4p7uOU3vLNtoOkq/TnYnpqVhiLfIP4
	 PyNi27r2ih9LJ8hIhnP2KvmuZlwLFZm5jKtXUxmw=
Date: Tue, 23 Dec 2025 18:50:22 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans de Goede <hansg@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mathis Foerst <mathis.foerst@mt.com>, linux-media@vger.kernel.org
Subject: Re: [PATCH v3 13/15] media: mt9m114: Drop start-, stop-streaming
 sequence from initialize
Message-ID: <20251223165022.GK9817@pendragon.ideasonboard.com>
References: <20250629205626.68341-1-hansg@kernel.org>
 <20250629205626.68341-14-hansg@kernel.org>
 <20250702010852.GI17819@pendragon.ideasonboard.com>
 <4e89445e-20eb-4455-9518-d77dce79d473@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4e89445e-20eb-4455-9518-d77dce79d473@kernel.org>

On Tue, Dec 23, 2025 at 02:37:39PM +0100, Hans de Goede wrote:
> On 2-Jul-25 03:08, Laurent Pinchart wrote:
> > On Sun, Jun 29, 2025 at 10:56:23PM +0200, Hans de Goede wrote:
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
> > 
> > Could you please update the commit message with the result of the
> > discussion on v2 ? I'd like to record that mt9m114_power_on() leaves the
> > sensor in the STANDBY state, either because it is already in standby for
> > CSI-2 mode, or with an explicit state change in parallel mode (with the
> > mode configured through the CONFIG pin). That's in my opinion the reason
> > we can drop the ENTER_CONFIG_CHANGE and ENTER_SUSPEND in
> > mt9m114_initialize().
> 
> Ack, I'll add a comment to the code about this and update the commit
> message as requested.
> 
> >> Signed-off-by: Hans de Goede <hansg@kernel.org>
> >> ---
> >>  drivers/media/i2c/mt9m114.c | 19 +++++++++++--------
> >>  1 file changed, 11 insertions(+), 8 deletions(-)
> >>
> >> diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
> >> index 1280d90cd411..ec5e9ce24d1c 100644
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
> >> @@ -781,14 +782,7 @@ static int mt9m114_initialize(struct mt9m114 *sensor)
> >>  	if (ret < 0)
> >>  		return ret;
> >>  
> >> -	ret = mt9m114_set_state(sensor, MT9M114_SYS_STATE_ENTER_CONFIG_CHANGE);
> >> -	if (ret < 0)
> >> -		return ret;
> >> -
> >> -	ret = mt9m114_set_state(sensor, MT9M114_SYS_STATE_ENTER_SUSPEND);
> >> -	if (ret < 0)
> >> -		return ret;
> >> -
> >> +	sensor->config_change_pending = true;
> >>  	return 0;
> >>  }
> >>  
> >> @@ -987,6 +981,7 @@ static int mt9m114_start_streaming(struct mt9m114 *sensor,
> >>  	if (ret)
> >>  		goto error;
> >>  
> >> +	sensor->config_change_pending = false;
> >>  	sensor->streaming = true;
> >>  
> >>  	return 0;
> >> @@ -2315,6 +2310,14 @@ static int __maybe_unused mt9m114_runtime_suspend(struct device *dev)
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
> > 
> > What's the point of this if we're powering the sensor right after ?

(I meant "powering the sensor down")

> The config-change state command is necessary to allow
> the suspend command to succeed.
> 
> Before this initialize() would do the suspend for
> the probe() path and mt9m114_stop_streaming()
> does this after a stop-stream.
> 
> The mean reason is to preserve the old behavior of
> always putting the sensor in suspend, which could
> be useful if the regulators are shared (or just always
> on) and the reset pin is not connected.

True, but that's done in mt9m114_stop_streaming(), isn't it ?

There's still something that bothers me about this patch. The
config_change_pending flag makes the logic hard to follow, it should be
simplified somehow.

Re-reading the code, could we

- drop the mt9m114_initialize() from mt9m114_probe()
- move the mt9m114_initialize() from mt9m114_runtime_resume() to
  mt9m114_start_streaming()
- drop the ENTER_CONFIG_CHANGE and ENTER_SUSPEND from
  mt9m114_initialize()

Am I missing something ?

-- 
Regards,

Laurent Pinchart

