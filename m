Return-Path: <linux-media+bounces-23866-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BAE999F9181
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 12:40:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C0DF91894AF7
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 11:40:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEBFA1C3029;
	Fri, 20 Dec 2024 11:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MGi4yXlL"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37578182B4
	for <linux-media@vger.kernel.org>; Fri, 20 Dec 2024 11:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734694837; cv=none; b=tm+INk1OWx1NgBhREZwp0+CAydQr/jsRc1xA13Vi5VXUhu+JrzhTLefxUrnsMsZA8kCTFUNWBTJCJz58dH/72I+yTePA1jXfc9WaVxs/TJW6Wk875+FwDs6rEXqGyL/h4RrnePepbxnE71lLmBlN55+Nf863wBMDcK5UWNQtbk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734694837; c=relaxed/simple;
	bh=ldD5uiO25ZNmZN7Q+ZrsNd7P/+RBzGVg32YXeRxVdLM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X7os9Ia0awbD24q34MDl0k1jYuIB2JCz/a756vn4bd21iHzq5h2nWjlf8rw/4q1qh8ykCat0s4O4eN6YzVi5iJQmVOVO8VlstwjZQ5NmDFGJkrxovaVX9OjSoXhCdlk3dI99R1qsaTEbDPGTfIUlxhissZdqFPRZthZaOANWEbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MGi4yXlL; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734694834;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qk8XQRYu0eNZv4wPVohc60a/NSkoeQiM4qYI1F99DIw=;
	b=MGi4yXlLvBASkQ/uyYlSGVxZhlDbZMaJejiSJeszFRghAfpV4k8HyB3gLIfhMgEdZHiooY
	8L7ov3at5EHHb1C5C+uvm7Bzcma+CXf1omr7XveZmqmT4mJIdFlKHlFlNIzS6Z6dLVjxcK
	2HV+fk8gio8P3SHMbumRzbIbmDOZ4ak=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-35-ukbkUlL-OW2WeY5-En4T-w-1; Fri, 20 Dec 2024 06:40:32 -0500
X-MC-Unique: ukbkUlL-OW2WeY5-En4T-w-1
X-Mimecast-MFC-AGG-ID: ukbkUlL-OW2WeY5-En4T-w
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-aa6a831f93cso181501466b.1
        for <linux-media@vger.kernel.org>; Fri, 20 Dec 2024 03:40:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734694831; x=1735299631;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qk8XQRYu0eNZv4wPVohc60a/NSkoeQiM4qYI1F99DIw=;
        b=smp1T5UDdzhoL3+8KuhrA7QWKER/hqoRN+W0MuxUbWRvbak3pwoLTeaTKffxbzFI4R
         WNK45jJKe42XEI+3RS3rmQwEHTdKzsNjVBd3wGo1nrn4bzA2nR8TWtueHvqGQJh3fQNn
         8ZGsWW2SY5uvIA9g833ceWF4bRO7Ir0gYb4RC9xqzubB1+t0UX3G0ji+J6eJ+U3xoIAr
         y312wze15oXGGeuEJ0SN6NCx2KM2OaEektXpHH9XXcre3G9EGcOFNQOjIaYnEJLHSC0T
         J0q4ADPe+8NEUmZsGBX2CZjXAdVqtQBzsGNPMUDP7IBRwTm67SW8mNsNUFvG30WpfhV5
         ZpBQ==
X-Forwarded-Encrypted: i=1; AJvYcCX6UWgZaVNdbXQWEEsXYVD4AqQzc9Cer4Az5gJBWsNngT/LCmOUtEgewD8PA3SWTKJ5YNJFas4uLln6iw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxI/M/PlGhfgeYnf8OYsaK/ZoEr2LCd1c9iVNP/yof76m3bIlGR
	1+p/R2J2ZnbGE4LfqgcRRUmJ56zV0DGWE+o06uG4SkzpabHbttTV3lEqUILAbOYQijKoqNwK1Jc
	jeK383VrLCwJMIls5gIJ38/EiWm1P2ePqhQxcyXYFbewLZ7C5OEHuwxi9w+ln
X-Gm-Gg: ASbGncvudVWlu+KFnwwhDMEp633Mv6b8ZfdfFcUJu4P2kMahOzUZi1VmkrTJ59s+b/M
	Zkkot1aECOcojnYVlLBC3cUs9+l1WIn1edC+4KqbJKLpha3MvmPWVaCnbfElwbdB/n4dioTgfzf
	+vUZQyR8I4EhICrEZQSCTyK51e/36x33/wcRevmfzkQjBH+rQw58o+86TTwx+jhK4GLwJqlgUai
	Yrh0OgF1uYnpIOPSP9n7+uG3cZvalagI62r25lq3TJ2apNiYGIYPu6evsC4dRnZGY0o4Fk1Fjx4
	Bd1GqeAqSmNRJK2GZ6YC9vFpfPjOoThz3KK36RUaPrGrDYVwho+VB0ss3+rezgt6d0fYzlSZUjk
	R/k4ChyeotZa5rmPHpPbMQcMCyjH2wwQ=
X-Received: by 2002:a17:907:980d:b0:aac:439:fc0 with SMTP id a640c23a62f3a-aac33e42730mr243246466b.51.1734694830866;
        Fri, 20 Dec 2024 03:40:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEEMl6K0J6B9b2DI674dvR94uwCtbeE9QAE/ruowerm2kfknGwVhHYZXg+m5tQT6cjnroWErQ==
X-Received: by 2002:a17:907:980d:b0:aac:439:fc0 with SMTP id a640c23a62f3a-aac33e42730mr243244166b.51.1734694830506;
        Fri, 20 Dec 2024 03:40:30 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f06c7a8sm169998466b.182.2024.12.20.03.40.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Dec 2024 03:40:30 -0800 (PST)
Message-ID: <968db262-0fda-4746-a204-281e45209771@redhat.com>
Date: Fri, 20 Dec 2024 12:40:29 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] media: ov2740: Add regulator support
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Tianshu Qiu <tian.shu.qiu@intel.com>, Bingbu Cao <bingbu.cao@intel.com>,
 linux-media@vger.kernel.org
References: <20241128152338.4583-1-hdegoede@redhat.com>
 <20241128152338.4583-5-hdegoede@redhat.com>
 <Z1v4kRgTtWbi8u6r@kekkonen.localdomain>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Z1v4kRgTtWbi8u6r@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 13-Dec-24 10:04 AM, Sakari Ailus wrote:
> Hi Hans,
> 
> Thanks for the set.
> 
> On Thu, Nov 28, 2024 at 04:23:38PM +0100, Hans de Goede wrote:
>> On some designs the regulators for the AVDD / DOVDD / DVDD power rails
>> are controlled by Linux.
>>
>> Add support to the driver for getting regulators for these 3 rails and
>> for enabling these regulators when necessary.
>>
>> The datasheet specifies a delay of 0ns between enabling the regulators,
>> IOW they can all 3 be enabled at the same time. This allows using the bulk
>> regulator API.
>>
>> The regulator core will provide dummy regulators for the 3 power-rails
>> when necessary.
>>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>  drivers/media/i2c/ov2740.c | 30 +++++++++++++++++++++++++++---
>>  1 file changed, 27 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
>> index 14d0a0588cc2..c766c1f83e12 100644
>> --- a/drivers/media/i2c/ov2740.c
>> +++ b/drivers/media/i2c/ov2740.c
>> @@ -11,6 +11,7 @@
>>  #include <linux/pm_runtime.h>
>>  #include <linux/nvmem-provider.h>
>>  #include <linux/regmap.h>
>> +#include <linux/regulator/consumer.h>
>>  #include <media/v4l2-ctrls.h>
>>  #include <media/v4l2-device.h>
>>  #include <media/v4l2-fwnode.h>
>> @@ -76,6 +77,14 @@
>>  /* OTP registers from sensor */
>>  #define OV2740_REG_OTP_CUSTOMER		0x7010
>>  
>> +static const char * const ov2740_supply_name[] = {
>> +	"AVDD",
>> +	"DOVDD",
>> +	"DVDD",
>> +};
>> +
>> +#define OV2740_NUM_SUPPLIES ARRAY_SIZE(ov2740_supply_name)
>> +
>>  struct nvm_data {
>>  	struct nvmem_device *nvmem;
>>  	struct regmap *regmap;
>> @@ -523,10 +532,11 @@ struct ov2740 {
>>  	struct v4l2_ctrl *hblank;
>>  	struct v4l2_ctrl *exposure;
>>  
>> -	/* GPIOs, clocks */
>> +	/* GPIOs, clocks, regulators */
>>  	struct gpio_desc *reset_gpio;
>>  	struct gpio_desc *powerdown_gpio;
>>  	struct clk *clk;
>> +	struct regulator_bulk_data supplies[OV2740_NUM_SUPPLIES];
> 
> This would be cleaner with plain ARRAY_SIZE(). Same below. I.e. the macro
> is redundant.

Ok, I will change this for v2.



> 
>>  
>>  	/* Current mode */
>>  	const struct ov2740_mode *cur_mode;
>> @@ -1309,6 +1319,7 @@ static int ov2740_suspend(struct device *dev)
>>  	gpiod_set_value_cansleep(ov2740->reset_gpio, 1);
>>  	gpiod_set_value_cansleep(ov2740->powerdown_gpio, 1);
>>  	clk_disable_unprepare(ov2740->clk);
>> +	regulator_bulk_disable(OV2740_NUM_SUPPLIES, ov2740->supplies);
>>  	return 0;
>>  }
>>  
>> @@ -1318,10 +1329,16 @@ static int ov2740_resume(struct device *dev)
>>  	struct ov2740 *ov2740 = to_ov2740(sd);
>>  	int ret;
>>  
>> -	ret = clk_prepare_enable(ov2740->clk);
>> +	ret = regulator_bulk_enable(OV2740_NUM_SUPPLIES, ov2740->supplies);
>>  	if (ret)
>>  		return ret;
>>  
>> +	ret = clk_prepare_enable(ov2740->clk);
>> +	if (ret) {
>> +		regulator_bulk_disable(OV2740_NUM_SUPPLIES, ov2740->supplies);
>> +		return ret;
>> +	}
>> +
>>  	gpiod_set_value_cansleep(ov2740->powerdown_gpio, 0);
>>  	gpiod_set_value_cansleep(ov2740->reset_gpio, 0);
>>  	msleep(20);
>> @@ -1334,7 +1351,7 @@ static int ov2740_probe(struct i2c_client *client)
>>  	struct device *dev = &client->dev;
>>  	struct ov2740 *ov2740;
>>  	bool full_power;
>> -	int ret;
>> +	int i, ret;
> 
> unsigned int i

ack.

Regards,

Hans




