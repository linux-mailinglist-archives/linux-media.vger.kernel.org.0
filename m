Return-Path: <linux-media+bounces-36180-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC3A3AECE58
	for <lists+linux-media@lfdr.de>; Sun, 29 Jun 2025 17:39:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D0FDF3B4F37
	for <lists+linux-media@lfdr.de>; Sun, 29 Jun 2025 15:38:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDE0120468E;
	Sun, 29 Jun 2025 15:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b++x8Ffu"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56DC243147
	for <linux-media@vger.kernel.org>; Sun, 29 Jun 2025 15:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751211539; cv=none; b=mVcbPMlna6GqSWj6XOaDj9QhdyVNmg6jSO5U/vnGdRXidIkIxIXS58Dj5fPH8MvW1BEiCADP3/gETs8lszzoOM5WvUUG7a4wJUGAvjGH/OqxYFIcNXrRXCQSS9KObm70YMqS0Ln/YBZiUs7bfbHk+sWYgUvMRrBQ2yYzPY+bJlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751211539; c=relaxed/simple;
	bh=3Q6GImyYN69ONOQA10gjhIP0ghQf8hUuW9TOCdRS7TE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QJ6OVvoERBxBgPB9XYZb4/nCsvm6MO69oeY31EZQEhzuXs3lEFjo8ltv//zuj5c/p4uz99GTKSEenUG/g474/s1q+biEBAhhBborWbrqkZyONHgQ4arKEOP8CVDe+6zXCFba/GI+AC/xKJIMnmySNPb7YvIPwe8kjK7oQKYlOaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b++x8Ffu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A971CC4CEEB;
	Sun, 29 Jun 2025 15:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751211538;
	bh=3Q6GImyYN69ONOQA10gjhIP0ghQf8hUuW9TOCdRS7TE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=b++x8Ffu5cZzj2eeMSUZMm+sPt8YofhUoS/2xcDVLzmdZvWUbVp3XMbx2G7UBDVOH
	 dvsgVVAWkcIC7rQhEv/uc50waaM96QIjeB4oWE2oJzUtgyc749L+U61qrP3G2oDgSo
	 yhkpupgiyi9Hv/3FK29fU7hZvb5Ubh9/Y62mh+cha3UVJ3zQR4W1iWsCrh11n0Kp1W
	 PyAwo9XxcSb9XNh/z1Qj6Cfh9HRHHECCWb7OLF0KUJKxRuAWHYY0Uj/CSPoGxu7znn
	 mV5ZtrP23daWa43F/xjbtVvAJE2bVU1C4/O7ARQ+gcUKY8ztpcLVSnR4rJJCdfHWt/
	 s+QsyKIIV4jFw==
Message-ID: <845d7894-34c7-4a10-9cac-dc00fc0935fd@kernel.org>
Date: Sun, 29 Jun 2025 17:38:55 +0200
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

I tried doing the MT9M114_SYS_STATE_ENTER_SUSPEND without a prior
MT9M114_SYS_STATE_ENTER_CONFIG_CHANGE but that does not work, then
mt9m114_poll_command() times out.

Also I believe that the start/stop/start streaming vs just a
single start streaming is actually causing the issues on atomisp
devices.

Normally we only come out of runtime-suspend from
mt9m114_start_streaming() so in this case there is no issue
with not disabling streaming from mt9m114_initialize().

The only case where the sensor would be streaming when
we do not want it would be after the power-up +
mt9m114_initialize() from probe().

And we can get the desired "disable streaming
as quickly as possible." by forcing a runtime-suspend
from probe() directly after mt9m114_initialize() instead
of waiting for the auto runtimesuspend.

I'll make probe() immediately runtime-suspend the sensor
after mt9m114_initialize() in the next version.

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


