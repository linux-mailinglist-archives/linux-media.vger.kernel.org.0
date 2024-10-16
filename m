Return-Path: <linux-media+bounces-19760-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CDDF9A0946
	for <lists+linux-media@lfdr.de>; Wed, 16 Oct 2024 14:24:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C967C285CE9
	for <lists+linux-media@lfdr.de>; Wed, 16 Oct 2024 12:24:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BF1B208218;
	Wed, 16 Oct 2024 12:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="BEwr5Vnp"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAA5C1B395B;
	Wed, 16 Oct 2024 12:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729081461; cv=none; b=NeR3Duav+BGUTJ9z2KRp/DpbiQG0DsJPE/kcIoEweI94mDLuZBeuzOrWVeu0B/CQzuyEM67MCHi1gLdZlergqW/QCIRPhc6tMB1idI4CFWVM/TERnmqUXoDhXF1SQE8+xujAH9mGOkjbGt7dcH4ryY0O6bj5dS9aMQe/yRhU3j0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729081461; c=relaxed/simple;
	bh=kH5BtO/zE87wMv0J2TZqjDXRAmciintOpO0+hSBh5gI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XMpXMa7AB8OFpgLFOYA+bSYNu+K+/WKyIUxbZHKMXux4y+51nn4PiQjkrvq1/tHo/jHcDPeEAwLTRcVRcFBn6C8ZDaVm1jT19uwH9OLOkaL5Lu/KWw0rvyMPmwje/nDUbvsW/EaASJGybjdVllasp2/1tcyFapXNHE15c44APz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=BEwr5Vnp; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 872E883D;
	Wed, 16 Oct 2024 14:22:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1729081348;
	bh=kH5BtO/zE87wMv0J2TZqjDXRAmciintOpO0+hSBh5gI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=BEwr5Vnpr4Un36EBny9MrfnyjLw/9zW/yIA3Nl2LkbtylckjJfgRRBOttBfOZ6z5X
	 Eu9/mJSlJWLit89Lq3ea00MykL2QKwxMYZK6oMzYACqAfR/mxf+ezBKAWuLj789q5k
	 oK0gYvAnxLOnVv8pKgqE3P2Ym1pIaCnVDZGmJJh8=
Message-ID: <d839bbd7-c6c5-424d-9f8b-fe8d0f61e7ba@ideasonboard.com>
Date: Wed, 16 Oct 2024 13:24:06 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] platform/x86: int3472: Add board data for Dell 7212
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: linux-media@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 anders.ruke@gmail.com, sakari.ailus@linux.intel.com,
 Hans de Goede <hdegoede@redhat.com>, hverkuil-cisco@xs4all.nl
References: <20241015211958.1465909-1-dan.scally@ideasonboard.com>
 <20241015211958.1465909-3-dan.scally@ideasonboard.com>
 <fcb92c2d-f422-ef97-721e-f59b5e026474@linux.intel.com>
Content-Language: en-US
From: Dan Scally <dan.scally@ideasonboard.com>
Autocrypt: addr=dan.scally@ideasonboard.com; keydata=
 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
In-Reply-To: <fcb92c2d-f422-ef97-721e-f59b5e026474@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Afternoon - thanks for the review

On 16/10/2024 12:58, Ilpo Järvinen wrote:
> On Tue, 15 Oct 2024, Daniel Scally wrote:
>
>> The Dell 7212 Rugged Extreme Tablet pairs an OV5670 sensor with the
>> Intel IPU3 ISP. The sensor is powered by a TPS68470 PMIC, and so we
>> need some board data to describe how to configure the GPIOs and
>> regulators to run the sensor.
>>
>> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
>> ---
>>   .../x86/intel/int3472/tps68470_board_data.c   | 128 ++++++++++++++++++
>>   1 file changed, 128 insertions(+)
>>
>> diff --git a/drivers/platform/x86/intel/int3472/tps68470_board_data.c b/drivers/platform/x86/intel/int3472/tps68470_board_data.c
>> index 322237e056f3..d28053733bd2 100644
>> --- a/drivers/platform/x86/intel/int3472/tps68470_board_data.c
>> +++ b/drivers/platform/x86/intel/int3472/tps68470_board_data.c
>> @@ -129,6 +129,109 @@ static const struct tps68470_regulator_platform_data surface_go_tps68470_pdata =
>>   	},
>>   };
>>   
>> +/* Settings for Dell 7212 Tablet */
>> +
>> +static struct regulator_consumer_supply int3479_vsio_consumer_supplies[] = {
>> +	REGULATOR_SUPPLY("avdd", "i2c-INT3479:00"),
>> +};
>> +
>> +static struct regulator_consumer_supply int3479_aux1_consumer_supplies[] = {
>> +	REGULATOR_SUPPLY("dvdd", "i2c-INT3479:00"),
>> +};
>> +
>> +static struct regulator_consumer_supply int3479_aux2_consumer_supplies[] = {
>> +	REGULATOR_SUPPLY("dovdd", "i2c-INT3479:00"),
>> +};
>> +
>> +static const struct regulator_init_data dell_7212_tps68470_core_reg_init_data = {
>> +	.constraints = {
>> +		.min_uV = 1200000,
>> +		.max_uV = 1200000,
>> +		.apply_uV = 1,
>> +		.valid_ops_mask = REGULATOR_CHANGE_STATUS,
>> +	},
>> +	.num_consumer_supplies = 0,
>> +	.consumer_supplies = NULL
> Add comma to any non-terminator entry.
Ack
>
>> +};
>> +
>> +static const struct regulator_init_data dell_7212_tps68470_ana_reg_init_data = {
>> +	.constraints = {
>> +		.min_uV = 2815200,
>> +		.max_uV = 2815200,
>> +		.apply_uV = 1,
>> +		.valid_ops_mask = REGULATOR_CHANGE_STATUS,
>> +	},
>> +	.num_consumer_supplies = 0,
>> +	.consumer_supplies = NULL
>> +};
>> +
>> +static const struct regulator_init_data dell_7212_tps68470_vcm_reg_init_data = {
>> +	.constraints = {
>> +		.min_uV = 2815200,
>> +		.max_uV = 2815200,
>> +		.apply_uV = 1,
>> +		.valid_ops_mask = REGULATOR_CHANGE_STATUS,
>> +	},
>> +	.num_consumer_supplies = 0,
>> +	.consumer_supplies = NULL
>> +};
> This looks exactly identical to dell_7212_tps68470_ana_reg_init_data.

It is the same currently, but only because I've not added the consumers yet - largely because the 
sensor/vcm combination that will consume these lines needs additional driver work anyway. When 
they're done I'd plan to add consumer definitions for these regulators too.


Thanks

Dan

>
>> +static const struct regulator_init_data dell_7212_tps68470_vio_reg_init_data = {
>> +	.constraints = {
>> +		.min_uV = 1800600,
>> +		.max_uV = 1800600,
>> +		.apply_uV = 1,
>> +		.valid_ops_mask = REGULATOR_CHANGE_STATUS,
>> +	},
>> +	.num_consumer_supplies = 0,
>> +	.consumer_supplies = NULL,
>> +};
>> +
>> +static const struct regulator_init_data dell_7212_tps68470_vsio_reg_init_data = {
>> +	.constraints = {
>> +		.min_uV = 1800600,
>> +		.max_uV = 1800600,
>> +		.apply_uV = 1,
>> +		.valid_ops_mask = REGULATOR_CHANGE_STATUS,
>> +	},
>> +	.num_consumer_supplies = ARRAY_SIZE(int3479_vsio_consumer_supplies),
>> +	.consumer_supplies = int3479_vsio_consumer_supplies,
>> +};
>> +
>> +static const struct regulator_init_data dell_7212_tps68470_aux1_reg_init_data = {
>> +	.constraints = {
>> +		.min_uV = 1213200,
>> +		.max_uV = 1213200,
>> +		.apply_uV = 1,
>> +		.valid_ops_mask = REGULATOR_CHANGE_STATUS,
>> +	},
>> +	.num_consumer_supplies = ARRAY_SIZE(int3479_aux1_consumer_supplies),
>> +	.consumer_supplies = int3479_aux1_consumer_supplies,
>> +};
>> +
>> +static const struct regulator_init_data dell_7212_tps68470_aux2_reg_init_data = {
>> +	.constraints = {
>> +		.min_uV = 1800600,
>> +		.max_uV = 1800600,
>> +		.apply_uV = 1,
>> +		.valid_ops_mask = REGULATOR_CHANGE_STATUS,
>> +	},
>> +	.num_consumer_supplies = ARRAY_SIZE(int3479_aux2_consumer_supplies),
>> +	.consumer_supplies = int3479_aux2_consumer_supplies,
>> +};
>> +
>> +static const struct tps68470_regulator_platform_data dell_7212_tps68470_pdata = {
>> +	.reg_init_data = {
>> +		[TPS68470_CORE] = &dell_7212_tps68470_core_reg_init_data,
>> +		[TPS68470_ANA]  = &dell_7212_tps68470_ana_reg_init_data,
>> +		[TPS68470_VCM]  = &dell_7212_tps68470_vcm_reg_init_data,
>> +		[TPS68470_VIO] = &dell_7212_tps68470_vio_reg_init_data,
> Inconsistent spaces.
>

