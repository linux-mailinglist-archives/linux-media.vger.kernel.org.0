Return-Path: <linux-media+bounces-30437-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AF15A9185D
	for <lists+linux-media@lfdr.de>; Thu, 17 Apr 2025 11:52:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 395FD446437
	for <lists+linux-media@lfdr.de>; Thu, 17 Apr 2025 09:52:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64AA7229B37;
	Thu, 17 Apr 2025 09:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FxCQoWWE"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CC37189B8C
	for <linux-media@vger.kernel.org>; Thu, 17 Apr 2025 09:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744883531; cv=none; b=OxBPIRedbI2322kkJ56suMEL9R5yDcmHwdwp1ViVO2tbFKe5/Y61QaluteozNvT+WaLG934ld94JrWC/iq60acSNTby3cTSwyzUzKFksmFy4gkHaaxtKxAEgcv7fxua9kD/2o9xzDmRlLFBvZy89CGjqjxn39+2Jl7t56rIQgzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744883531; c=relaxed/simple;
	bh=gzyB0gehaCw5mwBKeA4kasPlyex+4nSBFbJbR1kusug=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FJfJOw8KYYdL6nkWczaTjst0FRQxf5Lmq62+hqyp2sFUFAY0Bf6XNoJgU2gTNMdQO9y5whcoUEUm15h3AVKFqXvu0s/g7qLvpNfboqH7aZztfwmLJvMzPGQBmnu+/46uXfyZ5ut2yYL3ZWuuOFHgBNDMCjEJKeWN60Qk7sMtaa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FxCQoWWE; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744883528;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8N1zpzvBZKYjt/vb1x99uaabOfxhJmPIjjRyGYjDDU4=;
	b=FxCQoWWEurlqpKLfsRPP3LQs6n8wEhWSf6pp+c5QuTy+WojD9tBKNtNgbKUUuUmyTtQti9
	/vwYZ64aipnnOmlpaDkdg3E2Co8cU0KssAHLQqufNMvw+K9L/t61eRrfXfHgC+BvCZgemG
	cLqkqRIgK52P7WeA2xxvJ2h6e3lm3lM=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-288-PSfwUsl-MbO5nQyaqRiN-g-1; Thu, 17 Apr 2025 05:52:05 -0400
X-MC-Unique: PSfwUsl-MbO5nQyaqRiN-g-1
X-Mimecast-MFC-AGG-ID: PSfwUsl-MbO5nQyaqRiN-g_1744883525
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-ac293748694so48132366b.0
        for <linux-media@vger.kernel.org>; Thu, 17 Apr 2025 02:52:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744883524; x=1745488324;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8N1zpzvBZKYjt/vb1x99uaabOfxhJmPIjjRyGYjDDU4=;
        b=di+Dguqqw7e/OetHWz43hQTTkAaTQ4bbTJPX8bUSDt+ucBvfZjM/22HpniOVkIBgEH
         fhwG9ffvoEBKgf/cfnbcHkgDouoKt1/Wcy0xcuFc8zbMS6sj4EzaiZB2s4DrZyrnfTux
         QgIcX74fhlRsUELdobEqPPptwWwCebdgee4X2gM6O9cDMvt6TxaKc/pE9q7qsUOKSmvX
         2CKqECZnaWR1j4mSffKiUmXXnEg+sURgqeCKt9xX3dlXm0PjI9NTySZkg6V2A/yiIyOO
         85NTwNQJADhJhP4zUkb9xtaQTrjNRe7pws2l+7r0857AMESkQArJjarjOyt4xfwguOOp
         r5Ow==
X-Forwarded-Encrypted: i=1; AJvYcCUNZXXRJQ2ncEZ8jMqafW7mVQ28rxdi3zRryMCQqe+KLrx9P+BVF/3KIKqOGkAG8n7THyArKRvhQWXbTw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzVGOZYorP6LY1aGSosqc8C4kK0uF/ZrGVgbcM9ad+ZuWmr7p5A
	PrOKXpcPqh+pzDCQe27rxal5MumcDNYeTMXGlkYzbVZQnDzkiiMzMn6knG6E+xJbLyCoTSp5Ycq
	8emEQRHaRLhU2yeA6ZNymXEqth/p0CRRazbwXr1ELJeO5dpJh0zStWHk1hTIy
X-Gm-Gg: ASbGncvK7KKqhB6Attv9Tc4RBL1upUDJmEpSkfiG1tss+KjApIxsdL9kZ8wrIoDxQVw
	lbksMPrPQi1+kHy4yNH2DX0jDO9bO55krHLqPS1MThwVHW60ux9UpM63JY+a7QWuPwJNEkLRpb8
	f+KllEzzDN0n6RALa7zstsnbAKncpW5DVwWFSy7cmJpfJB7mM1lw62B9DAqqaBkLANcS8YGySod
	hxwGduG+oeShwrpPmLasO99FbaeUrXeq3vxUBfzgBmS7WKfIHzSrsklQZ4FoufaH7UGKMoakWMR
	JfCL47cBm/jUCHhr6jTK5KiEcKnkCEuIkfinE/rzESmKdNBKVZzK9crzuDz0ClmfBf4lVFORm3o
	gb/FG26f8EX/SUhMNBQcPXSpT1/aMEGk67lnZRWB6r/RUgjMyQZb12UlaYPzS9Q==
X-Received: by 2002:a17:907:9712:b0:ac3:bd68:24f0 with SMTP id a640c23a62f3a-acb428797b2mr517528366b.7.1744883524649;
        Thu, 17 Apr 2025 02:52:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFXNLsP6ifLmKb1ZKvTZ4XUyTG0SnIKVT4eg+KQS6bmOBXd5VrGhu9N8HpD+AYKdhNGaRUTjw==
X-Received: by 2002:a17:907:9712:b0:ac3:bd68:24f0 with SMTP id a640c23a62f3a-acb428797b2mr517525966b.7.1744883524238;
        Thu, 17 Apr 2025 02:52:04 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb3cd6267csm265250166b.9.2025.04.17.02.52.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Apr 2025 02:52:03 -0700 (PDT)
Message-ID: <8e6481f1-031a-454e-82a7-acd03826c915@redhat.com>
Date: Thu, 17 Apr 2025 11:52:02 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/9] platform/x86: int3472: Make regulator supply name
 configurable
To: Andy Shevchenko <andy@kernel.org>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Dan Scally <djrscally@gmail.com>, Alan Stern <stern@rowland.harvard.edu>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Hao Yao <hao.yao@intel.com>,
 Bingbu Cao <bingbu.cao@intel.com>, Duane <duanek@chorus.net>,
 platform-driver-x86@vger.kernel.org, linux-media@vger.kernel.org
References: <20250416124037.90508-1-hdegoede@redhat.com>
 <20250416124037.90508-6-hdegoede@redhat.com>
 <Z__zVTnMbJdkmyf3@smile.fi.intel.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Z__zVTnMbJdkmyf3@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Andy,

On 16-Apr-25 8:13 PM, Andy Shevchenko wrote:
> On Wed, Apr 16, 2025 at 02:40:33PM +0200, Hans de Goede wrote:
>> This is a preparation patch for registering multiple regulators, which
>> requires a different supply-name for each regulator. Make supply-name
>> a parameter to skl_int3472_register_regulator() and use con-id to set it
>> so that the existing int3472_gpio_map remapping can be used with it.
>>
>> Since supply-name is a parameter now, drop the fixed
>> skl_int3472_regulator_map_supplies[] array and instead add lower- and
>> upper-case mappings of the passed-in supply-name to the regulator.
> 
> ...
> 
>> +	for (i = 0, j = 0; i < GPIO_REGULATOR_SUPPLY_MAP_COUNT; i++) {
>> +		const char *supply = i ? regulator->supply_name_upper : supply_name;
> 
> But this won't scale, it seems it relies on the fact that
> GPIO_REGULATOR_SUPPLY_MAP_COUNT <= 2.

Ack, I've added a static_assert(GPIO_REGULATOR_SUPPLY_MAP_COUNT == 2)
just above the for () {} for this for v4, as you suggest below.

> 
>> +		regulator->supply_map[j].supply = supply;
>> +		regulator->supply_map[j].dev_name = int3472->sensor_name;
>>  		j++;
>>  
>>  		if (second_sensor) {
>> -			int3472->regulator.supply_map[j].supply =
>> -				skl_int3472_regulator_map_supplies[i];
>> -			int3472->regulator.supply_map[j].dev_name = second_sensor;
>> +			regulator->supply_map[j].supply = supply;
>> +			regulator->supply_map[j].dev_name = second_sensor;
>>  			j++;
>>  		}
> 
> With that in mind, why not unroll the loop?

That will lead to code duplication wrt the second_sensor handler and
it will make the diff from the previous code bigger, so I've gone
with a static_assert() instead, as suggested below.

> 
>>  	}
> 
> ...
> 
>> +/* lower- and upper-case mapping */
>>  #define GPIO_REGULATOR_SUPPLY_MAP_COUNT				2
> 
> Code seems really relies on this not be bigger than 2, perhaps static assert?

Ack, I've added a static assert for this for v4.

Regards,

Hans


