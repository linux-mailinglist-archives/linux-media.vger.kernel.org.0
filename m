Return-Path: <linux-media+bounces-36185-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 92DF9AECEED
	for <lists+linux-media@lfdr.de>; Sun, 29 Jun 2025 19:12:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ABC367A5E09
	for <lists+linux-media@lfdr.de>; Sun, 29 Jun 2025 17:10:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6FB3233D85;
	Sun, 29 Jun 2025 17:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WCBftVkg"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 555656FB9
	for <linux-media@vger.kernel.org>; Sun, 29 Jun 2025 17:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751217117; cv=none; b=a0T67lrWIm38rIVw3nrXV5JFhmRE1V60cR6Gq/lFUi7Hdg0T+HhybYvzXjNPOprxzA4SVmra3ltN3st2wCmQjNbM/d9DSTcDwooenGxRWe/ZNOzpoBkFgrL1/9E5BS7wz3JP374DLWVJIsXJvUddZ4iZO0pah26qiC30D9UuFRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751217117; c=relaxed/simple;
	bh=6kYIq2dfaj3R5rZX59NDYSIS8MUBEYKNt+ZlFkO+TMg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FBnYFrSB6CMgK0dlyjaQrWT3YoYHRAB/y/O8bfgSmed65cBh1h+IQ4w1tP/G9YdhvRS8AiucksPXau8Kq5JSweUZ6EggqIVwJAs4AGBAslzJNXKHQk7ZYJkJqUaO1Q1lfq0xTjAgrKBJllPe3EBo3ErH9z3tccjWnTymPid4crM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WCBftVkg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F109CC4CEEB;
	Sun, 29 Jun 2025 17:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751217117;
	bh=6kYIq2dfaj3R5rZX59NDYSIS8MUBEYKNt+ZlFkO+TMg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WCBftVkglhayBnoY3/6W0P/tv8YV/VtA0fAYlKOGyBEdkdTlCQHyGuYhBUxFV6rE4
	 /68MsyY83lSDsIIrt/3bAlYTo3dEnqbrXkCHbyEpSYvqjsxYxuwmTcppT1dA4UOFdl
	 s7kzwyb78I218Fr9u3VOtZ5bvG1NHWmzTDkKHJWRGKBXRKvFFw+PhcWXI0YRNQs91R
	 fPjcEe1f5//nbW5v/uNPWdHQbWHm+xn3yNBDUm9BmWlqRSudU3MK18anq6xOlpF9kb
	 tPHoEREcvq/CJn6PglHwA7lhEfmnBXQT/u6updMt+ualW0FEf4IGyxJJWkY3svvuUh
	 DLwBqAxgFU+Gw==
Message-ID: <968b4629-68e3-48e4-ba1d-2b8c6bac4926@kernel.org>
Date: Sun, 29 Jun 2025 19:11:54 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/12] media: mt9m114: Drop start-, stop-streaming
 sequence from initialize
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>, Mathis Foerst <mathis.foerst@mt.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
References: <20250531163148.83497-1-hansg@kernel.org>
 <20250531163148.83497-11-hansg@kernel.org>
 <20250603113342.GD27361@pendragon.ideasonboard.com>
Content-Language: en-US, nl
From: Hans de Goede <hansg@kernel.org>
In-Reply-To: <20250603113342.GD27361@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Laurent,

On 3-Jun-25 1:33 PM, Laurent Pinchart wrote:
> Hi Hans,
> 
> Thank you for the patch.
> 
> On Sat, May 31, 2025 at 06:31:45PM +0200, Hans de Goede wrote:
>> Drop the start-, stop-streaming sequence from initialize.
>>
>> When streaming is started with a runtime-suspended sensor,
>> mt9m114_start_streaming() will runtime-resume the sensor which calls
>> mt9m114_initialize() immediately followed by calling
>> mt9m114_set_state(ENTER_CONFIG_CHANGE).
>>
>> This results in the following state changes in quick succession:
>>
>> mt9m114_set_state(ENTER_CONFIG_CHANGE) -> transitions to STREAMING
>> mt9m114_set_state(ENTER_SUSPEND)       -> transitions to SUSPENDED
>> mt9m114_set_state(ENTER_CONFIG_CHANGE) -> transitions to STREAMING
>>
>> these quick state changes confuses the CSI receiver on atomisp devices
>> causing streaming to not work.
>>
>> Drop the state changes from mt9m114_initialize() so that only
>> a single mt9m114_set_state(ENTER_CONFIG_CHANGE) call is made
>> when streaming is started with a runtime-suspend sensor.
>>
>> This means that the sensor may have config changes pending when
>> mt9m114_runtime_suspend() gets called the first time after mt9m114_probe(),
>> when streaming was not started within the 1 second runtime-pm timeout.
>> Keep track of this and do the ENTER_CONFIG_CHANGE + ENTER suspend from
>> mt9m114_runtime_suspend() if necessary.
>>
>> Signed-off-by: Hans de Goede <hansg@kernel.org>
>> ---
>>  drivers/media/i2c/mt9m114.c | 19 +++++++++++--------
>>  1 file changed, 11 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
>> index d954f2be8f0d..c4d3122d698e 100644
>> --- a/drivers/media/i2c/mt9m114.c
>> +++ b/drivers/media/i2c/mt9m114.c
>> @@ -389,6 +389,7 @@ struct mt9m114 {
>>  
>>  	unsigned int pixrate;
>>  	bool streaming;
>> +	bool config_change_pending;
>>  	u32 clk_freq;
>>  
>>  	/* Pixel Array */
>> @@ -782,14 +783,7 @@ static int mt9m114_initialize(struct mt9m114 *sensor)
>>  	if (ret < 0)
>>  		return ret;
>>  
>> -	ret = mt9m114_set_state(sensor, MT9M114_SYS_STATE_ENTER_CONFIG_CHANGE);
>> -	if (ret < 0)
>> -		return ret;
> 
> Entering Config-Change here was meant to ensure the PLL and output mode
> settings get applied. The PLL settings can probably wait until we start
> streaming. For the output mode, I'm slightly concerned that incorrect
> settings could lead to hardware issues, as the sensor starts in parallel
> output mode. I suppose it shouldn't cause any hardware damage, so I
> think we could try to just delay Config-Change until we start streaming.
> 
>> -
>> -	ret = mt9m114_set_state(sensor, MT9M114_SYS_STATE_ENTER_SUSPEND);
>> -	if (ret < 0)
>> -		return ret;
> 
> This bothers me a bit more. As far as I understand, the sensor starts
> streaming right after power on reset, so I'd like to disable streaming
> as quickly as possible.

Actually while working on immediately putting the sensor back in
suspend from probe() I noticed that mt9m114_power_on() puts the
sensor in standby at the end even checks for this:

        /*
         * Before issuing any Set-State command, we must ensure that the sensor
         * reaches the standby mode (either initiated manually above in
         * parallel mode, or automatically after reset in MIPI mode).
         */
        ret = mt9m114_poll_state(sensor, MT9M114_SYS_STATE_STANDBY);
        if (ret < 0)
                goto error_clock;

        return 0;

Which means should not be streaming after power-on. So I believe that
this patch is fine as is and I'm going to keep this version  for v3
of the patch-set.

Regards,

Hans




> 
>> -
>> +	sensor->config_change_pending = true;
>>  	return 0;
>>  }
>>  
>> @@ -976,6 +970,7 @@ static int mt9m114_start_streaming(struct mt9m114 *sensor,
>>  	if (ret)
>>  		goto error;
>>  
>> +	sensor->config_change_pending = false;
>>  	sensor->streaming = true;
>>  
>>  	return 0;
>> @@ -2267,6 +2262,14 @@ static int __maybe_unused mt9m114_runtime_suspend(struct device *dev)
>>  	struct v4l2_subdev *sd = dev_get_drvdata(dev);
>>  	struct mt9m114 *sensor = ifp_to_mt9m114(sd);
>>  
>> +	if (sensor->config_change_pending) {
>> +		/* mt9m114_set_state() prints errors itself, no need to check */
>> +		mt9m114_set_state(sensor,
>> +				  MT9M114_SYS_STATE_ENTER_CONFIG_CHANGE);
>> +		mt9m114_set_state(sensor,
>> +				  MT9M114_SYS_STATE_ENTER_SUSPEND);
>> +	}
>> +
>>  	mt9m114_power_off(sensor);
>>  
>>  	return 0;
> 


