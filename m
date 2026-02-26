Return-Path: <linux-media+bounces-53631-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yAIeJt+voGnUlgQAu9opvQ
	(envelope-from <linux-media+bounces-53631-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 21:41:03 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 018181AF381
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 21:41:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4F5DA303CE89
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 20:40:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74B0C46AF0C;
	Thu, 26 Feb 2026 20:40:08 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from rmisp-mx-out2.tele.net (rmisp-mx-out2.tele.net [194.208.23.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE09046AEE8;
	Thu, 26 Feb 2026 20:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.208.23.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772138408; cv=none; b=VtuoXzULZ/K7kWsIeoA5uv1V5ptUvp8FrL7CB7fm/67EyVtlhpki7UTMHZxdHNBxfdFqxtJXB6vj8OQ0IFaX9xsZwhvaFg5kdLs7W1BFTNk2/rMj9ztreE8GEvYC2NL4YBU/7//NoamC9FHnIk6qJYZmXCGMgvOM1qSc8AKRv5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772138408; c=relaxed/simple;
	bh=GCmwn/kQgjd7pmbmC2CnW8tui0zGBQnByWldr++m6G8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NWC4eCTIsCfxo9pRpyPYbhMLc5OiM1HYgiOkAaBWYf1WoDitA7goPXVBCWY6YfxIshaOomIK/4KgeFSmJSYqOr5lUrLaynzF9Yv1SYZcR1HwCtH9V1gR4G66Y7tw3V6KwESaXwEe0di9x9xDu0ahsrdrUMR717V3U1sDMW8L9uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at; spf=fail smtp.mailfrom=emfend.at; arc=none smtp.client-ip=194.208.23.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=emfend.at
Received: from [192.168.0.207] (194-208-208-245.tele.net [194.208.208.245])
	by rmisp-mx-out2.tele.net (Postfix) with ESMTPA id 29EDF10E3CA8;
	Thu, 26 Feb 2026 21:30:13 +0100 (CET)
Message-ID: <215f5ff5-0751-4074-9353-dcb5d3c63833@emfend.at>
Date: Thu, 26 Feb 2026 21:30:08 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/8] media: i2c: ov08d10: add support for reset and power
 management
To: Philipp Zabel <p.zabel@pengutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jimmy Su <jimmy.su@intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, bsp-development.geo@leica-geosystems.com
References: <20260226-ov08d10-v1-0-c3a916368123@emfend.at>
 <20260226-ov08d10-v1-3-c3a916368123@emfend.at>
 <6a63b27e567d854e8459bc3a31d99e2d01cd1dd6.camel@pengutronix.de>
Content-Language: de-DE
From: Matthias Fend <matthias.fend@emfend.at>
In-Reply-To: <6a63b27e567d854e8459bc3a31d99e2d01cd1dd6.camel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53631-lists,linux-media=lfdr.de];
	DMARC_NA(0.00)[emfend.at];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[matthias.fend@emfend.at,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.992];
	RCPT_COUNT_SEVEN(0.00)[11];
	R_DKIM_NA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[emfend.at:mid,emfend.at:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 018181AF381
X-Rspamd-Action: no action

Hi Philipp,

thanks for your feedback.

Am 26.02.2026 um 11:13 schrieb Philipp Zabel:
> On Do, 2026-02-26 at 09:56 +0100, Matthias Fend wrote:
>> Add support for the required power supplies as well as the control of an
>> optional sensor reset.
>>
>> Signed-off-by: Matthias Fend <matthias.fend@emfend.at>
>> ---
>>   drivers/media/i2c/ov08d10.c | 104 +++++++++++++++++++++++++++++++++++++++++---
>>   1 file changed, 97 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/media/i2c/ov08d10.c b/drivers/media/i2c/ov08d10.c
>> index cfe18dcde174ddc1f198cb2aaa6b4a3b34045508..4dba264488b3e1950016deb3fa34732871cc34fc 100644
>> --- a/drivers/media/i2c/ov08d10.c
>> +++ b/drivers/media/i2c/ov08d10.c
> [...]
>> @@ -1379,6 +1442,7 @@ static int ov08d10_probe(struct i2c_client *client)
>>   {
>>   	struct ov08d10 *ov08d10;
>>   	unsigned long freq;
>> +	unsigned int i;
>>   	int ret;
>>   
>>   	ov08d10 = devm_kzalloc(&client->dev, sizeof(*ov08d10), GFP_KERNEL);
>> @@ -1404,12 +1468,32 @@ static int ov08d10_probe(struct i2c_client *client)
>>   		return ret;
>>   	}
>>   
>> +	ov08d10->reset = devm_reset_control_get_optional(ov08d10->dev, NULL);
> 
> Please use devm_reset_control_get_optional_exclusive() directly.

ACK

> 
>> +	if (IS_ERR(ov08d10->reset))
>> +		return dev_err_probe(ov08d10->dev, PTR_ERR(ov08d10->reset),
>> +				     "failed to get reset\n");
>> +	reset_control_assert(ov08d10->reset);
>> +
>> +	for (i = 0; i < ARRAY_SIZE(ov08d10_supply_names); i++)
>> +		ov08d10->supplies[i].supply = ov08d10_supply_names[i];
>> +
>> +	ret = devm_regulator_bulk_get(ov08d10->dev,
>> +				      ARRAY_SIZE(ov08d10->supplies),
>> +				      ov08d10->supplies);
>> +	if (ret)
>> +		return dev_err_probe(ov08d10->dev, ret,
>> +				     "failed to get regulators\n");
>> +
>>   	v4l2_i2c_subdev_init(&ov08d10->sd, client, &ov08d10_subdev_ops);
>>   
>> +	ret = ov08d10_power_on(ov08d10->dev);
>> +	if (ret)
>> +		return dev_err_probe(ov08d10->dev, ret, "failed to power on\n");
>> +
>>   	ret = ov08d10_identify_module(ov08d10);
>>   	if (ret) {
>>   		dev_err(ov08d10->dev, "failed to find sensor: %d", ret);
>> -		return ret;
>> +		goto probe_error_power_off;
>>   	}
>>   
>>   	mutex_init(&ov08d10->mutex);
>> @@ -1430,6 +1514,9 @@ static int ov08d10_probe(struct i2c_client *client)
>>   		goto probe_error_v4l2_ctrl_handler_free;
>>   	}
>>   
>> +	pm_runtime_set_active(ov08d10->dev);
>> +	pm_runtime_enable(ov08d10->dev);
>> +
>>   	ret = v4l2_async_register_subdev_sensor(&ov08d10->sd);
>>   	if (ret < 0) {
>>   		dev_err(ov08d10->dev, "failed to register V4L2 subdev: %d",
>> @@ -1437,26 +1524,28 @@ static int ov08d10_probe(struct i2c_client *client)
>>   		goto probe_error_media_entity_cleanup;
>>   	}
>>   
>> -	/*
>> -	 * Device is already turned on by i2c-core with ACPI domain PM.
>> -	 * Enable runtime PM and turn off the device.
>> -	 */
> 
> The commit message does not explain why this comment is dropped.

I didn't find the comment particularly helpful and since other sensors 
manage without it and there's now more than just ACPI, and "turn off" 
happens later, I thought it was fine to just drop the comment.

If you think it should still be included, I'd be happy to change it.

> 
>> -	pm_runtime_set_active(ov08d10->dev);
>> -	pm_runtime_enable(ov08d10->dev);
>>   	pm_runtime_idle(ov08d10->dev);
>>   
>>   	return 0;
>>   
>>   probe_error_media_entity_cleanup:
>> +	pm_runtime_disable(ov08d10->dev);
>> +	pm_runtime_set_suspended(ov08d10->dev);
> 
> Does this do the correct thing if v4l2_async_register_subdev_sensor()
> returns -EPROBE_DEFER (for example via privacy led) and then it probes
> a second time? It looks like the assumption pm_runtime_set_active()
> doesn't hold then.

At least it works as expected for me. But as mentioned, I don't have an 
ACPI hardware setup available. Does your point maybe refer to ACPI, or 
what exactly do you mean?
To me, it now looks very similar to other Omnivision ACPI drivers – do 
you perhaps have a specific suggestion for what should be changed?

Thanks a lot
  ~Matthias

> 
>>   	media_entity_cleanup(&ov08d10->sd.entity);
>>   
>>   probe_error_v4l2_ctrl_handler_free:
>>   	v4l2_ctrl_handler_free(ov08d10->sd.ctrl_handler);
>>   	mutex_destroy(&ov08d10->mutex);
>>   
>> +probe_error_power_off:
>> +	ov08d10_power_off(ov08d10->dev);
>> +
>>   	return ret;
>>   }
> 
> regards
> Philipp


