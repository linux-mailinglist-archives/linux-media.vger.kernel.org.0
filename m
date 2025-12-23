Return-Path: <linux-media+bounces-49428-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 36858CDA025
	for <lists+linux-media@lfdr.de>; Tue, 23 Dec 2025 17:57:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A680E3029C58
	for <lists+linux-media@lfdr.de>; Tue, 23 Dec 2025 16:57:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2931F3431E7;
	Tue, 23 Dec 2025 16:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pc1XQLCN"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AF2433F36D
	for <linux-media@vger.kernel.org>; Tue, 23 Dec 2025 16:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766509052; cv=none; b=kqT4QXIskxwT3clEQB3bdtUj3Xhsyu0ZjBHk9WA56dxofXIm7+9XV+zaCp31MUBCJ+gFGdT+8PA4d1qTGrXUdMgmafATEwQ9yAzZL4Yf/NqaOkf+Zbn1bVsPrcWlM7mG02GQKPxiwPnnCqrpU6SZdlTuvpEy0i09qc9KKwm7zzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766509052; c=relaxed/simple;
	bh=BMS7W3OEXd0cYh2358WGJ7pwE1II3CuN6PBpl3ugZ8A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bZTtCxCBfDfeLW3eiHves/DK3adcMMGVJrf97YVEK+thj9cxRUyWD0goFajrvC2APptYZSZuxWGMOjnUWbGitvhgGHo96jGFktEM8qZLN4yOzOZPYRtq+a3zEXWYREh4CgV/qluBKjXCT1QdFEfliyRS/SwrEnNnpHrlWtChOVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pc1XQLCN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7203FC113D0;
	Tue, 23 Dec 2025 16:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766509052;
	bh=BMS7W3OEXd0cYh2358WGJ7pwE1II3CuN6PBpl3ugZ8A=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Pc1XQLCNv09wyl3FGqptZ650qFn7MfdJ8xGprYXxqNnSXFXuS7XL9mw6sY1fxTY4G
	 /FADL9nr7/FvQQoy2A6T+eNTPBIf8SVLz2DNPD6WjrH2Hj/4PPGFFakMltF/9C6nA/
	 6ej5ioDJKu799x75++Gs0GWxRjTrP8y/HaFnkHdvel5kh+SR6XIA7S0Heb+O+K1nQT
	 Jg9GtX0ZOk/lBw9KrXyPMVGDFwFS2NeFyUZVPmnn62sUq5YDXLyuIUEatZS1FRh9eC
	 FrJsLMYqs7rQFWvvUi9UZcHjkPxCXKMAvo/vYk+20FxpxH3Au36ANtG68zdZPqruP7
	 4B6ofBXLeE63A==
Message-ID: <d671b240-8e43-48b7-9765-400f536deb5a@kernel.org>
Date: Tue, 23 Dec 2025 17:57:28 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 13/15] media: mt9m114: Drop start-, stop-streaming
 sequence from initialize
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Mathis Foerst <mathis.foerst@mt.com>, linux-media@vger.kernel.org
References: <20250629205626.68341-1-hansg@kernel.org>
 <20250629205626.68341-14-hansg@kernel.org>
 <20250702010852.GI17819@pendragon.ideasonboard.com>
 <4e89445e-20eb-4455-9518-d77dce79d473@kernel.org>
 <20251223165022.GK9817@pendragon.ideasonboard.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20251223165022.GK9817@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 23-Dec-25 5:50 PM, Laurent Pinchart wrote:
> On Tue, Dec 23, 2025 at 02:37:39PM +0100, Hans de Goede wrote:
>> On 2-Jul-25 03:08, Laurent Pinchart wrote:
>>> On Sun, Jun 29, 2025 at 10:56:23PM +0200, Hans de Goede wrote:
>>>> Drop the start-, stop-streaming sequence from initialize.
>>>>
>>>> When streaming is started with a runtime-suspended sensor,
>>>> mt9m114_start_streaming() will runtime-resume the sensor which calls
>>>> mt9m114_initialize() immediately followed by calling
>>>> mt9m114_set_state(ENTER_CONFIG_CHANGE).
>>>>
>>>> This results in the following state changes in quick succession:
>>>>
>>>> mt9m114_set_state(ENTER_CONFIG_CHANGE) -> transitions to STREAMING
>>>> mt9m114_set_state(ENTER_SUSPEND)       -> transitions to SUSPENDED
>>>> mt9m114_set_state(ENTER_CONFIG_CHANGE) -> transitions to STREAMING
>>>>
>>>> these quick state changes confuses the CSI receiver on atomisp devices
>>>> causing streaming to not work.
>>>>
>>>> Drop the state changes from mt9m114_initialize() so that only
>>>> a single mt9m114_set_state(ENTER_CONFIG_CHANGE) call is made
>>>> when streaming is started with a runtime-suspend sensor.
>>>>
>>>> This means that the sensor may have config changes pending when
>>>> mt9m114_runtime_suspend() gets called the first time after mt9m114_probe(),
>>>> when streaming was not started within the 1 second runtime-pm timeout.
>>>> Keep track of this and do the ENTER_CONFIG_CHANGE + ENTER suspend from
>>>> mt9m114_runtime_suspend() if necessary.
>>>
>>> Could you please update the commit message with the result of the
>>> discussion on v2 ? I'd like to record that mt9m114_power_on() leaves the
>>> sensor in the STANDBY state, either because it is already in standby for
>>> CSI-2 mode, or with an explicit state change in parallel mode (with the
>>> mode configured through the CONFIG pin). That's in my opinion the reason
>>> we can drop the ENTER_CONFIG_CHANGE and ENTER_SUSPEND in
>>> mt9m114_initialize().
>>
>> Ack, I'll add a comment to the code about this and update the commit
>> message as requested.
>>
>>>> Signed-off-by: Hans de Goede <hansg@kernel.org>
>>>> ---
>>>>  drivers/media/i2c/mt9m114.c | 19 +++++++++++--------
>>>>  1 file changed, 11 insertions(+), 8 deletions(-)
>>>>
>>>> diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
>>>> index 1280d90cd411..ec5e9ce24d1c 100644
>>>> --- a/drivers/media/i2c/mt9m114.c
>>>> +++ b/drivers/media/i2c/mt9m114.c
>>>> @@ -389,6 +389,7 @@ struct mt9m114 {
>>>>  
>>>>  	unsigned int pixrate;
>>>>  	bool streaming;
>>>> +	bool config_change_pending;
>>>>  	u32 clk_freq;
>>>>  
>>>>  	/* Pixel Array */
>>>> @@ -781,14 +782,7 @@ static int mt9m114_initialize(struct mt9m114 *sensor)
>>>>  	if (ret < 0)
>>>>  		return ret;
>>>>  
>>>> -	ret = mt9m114_set_state(sensor, MT9M114_SYS_STATE_ENTER_CONFIG_CHANGE);
>>>> -	if (ret < 0)
>>>> -		return ret;
>>>> -
>>>> -	ret = mt9m114_set_state(sensor, MT9M114_SYS_STATE_ENTER_SUSPEND);
>>>> -	if (ret < 0)
>>>> -		return ret;
>>>> -
>>>> +	sensor->config_change_pending = true;
>>>>  	return 0;
>>>>  }
>>>>  
>>>> @@ -987,6 +981,7 @@ static int mt9m114_start_streaming(struct mt9m114 *sensor,
>>>>  	if (ret)
>>>>  		goto error;
>>>>  
>>>> +	sensor->config_change_pending = false;
>>>>  	sensor->streaming = true;
>>>>  
>>>>  	return 0;
>>>> @@ -2315,6 +2310,14 @@ static int __maybe_unused mt9m114_runtime_suspend(struct device *dev)
>>>>  	struct v4l2_subdev *sd = dev_get_drvdata(dev);
>>>>  	struct mt9m114 *sensor = ifp_to_mt9m114(sd);
>>>>  
>>>> +	if (sensor->config_change_pending) {
>>>> +		/* mt9m114_set_state() prints errors itself, no need to check */
>>>> +		mt9m114_set_state(sensor,
>>>> +				  MT9M114_SYS_STATE_ENTER_CONFIG_CHANGE);
>>>> +		mt9m114_set_state(sensor,
>>>> +				  MT9M114_SYS_STATE_ENTER_SUSPEND);
>>>> +	}
>>>
>>> What's the point of this if we're powering the sensor right after ?
> 
> (I meant "powering the sensor down")
> 
>> The config-change state command is necessary to allow
>> the suspend command to succeed.
>>
>> Before this initialize() would do the suspend for
>> the probe() path and mt9m114_stop_streaming()
>> does this after a stop-stream.
>>
>> The mean reason is to preserve the old behavior of
>> always putting the sensor in suspend, which could
>> be useful if the regulators are shared (or just always
>> on) and the reset pin is not connected.
> 
> True, but that's done in mt9m114_stop_streaming(), isn't it ?
> 
> There's still something that bothers me about this patch. The
> config_change_pending flag makes the logic hard to follow, it should be
> simplified somehow.
> 
> Re-reading the code, could we
> 
> - drop the mt9m114_initialize() from mt9m114_probe()
> - move the mt9m114_initialize() from mt9m114_runtime_resume() to
>   mt9m114_start_streaming()
> - drop the ENTER_CONFIG_CHANGE and ENTER_SUSPEND from
>   mt9m114_initialize()
> 
> Am I missing something ?

Nope that should work, but at the cost of re-doing
the mt9m114_initialize() when doing stop-stream,
change some things, start-stream. Not that I expect
that to happen often with this sensor, but this is why
I kept the initialize in runtime-resume.

Regards,

Hans



> 


