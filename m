Return-Path: <linux-media+bounces-11211-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D32F8C1089
	for <lists+linux-media@lfdr.de>; Thu,  9 May 2024 15:42:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BFB38285173
	for <lists+linux-media@lfdr.de>; Thu,  9 May 2024 13:42:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DAAA158A21;
	Thu,  9 May 2024 13:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DV1+yRPe"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3640413174D
	for <linux-media@vger.kernel.org>; Thu,  9 May 2024 13:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715262153; cv=none; b=qZR7j5/upMeqtn1/X0Vm3/fFHRcNOCegQY6QQ+FecDe8387uPnKIUdzpdsFme+Z3u/6/OtRqzw84ubAo8Ps1AIQoE0sYSDJuIWovSFtx6nQkdaKYzePfwrmOMwdum0PB4/xkfKJOGEZ7nNbulLg8eBxNVQL461tTk8xh042AeQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715262153; c=relaxed/simple;
	bh=0NIvRMYtx8hbJpLtVBoxk9n5/2kYTPG+1DLhyl1Yfso=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qiZAixBIkw+t/cuLvHsvQ2bl0Vhfu9uIVHGI85HA6nwGX/VbOugwLFyTQd8O8CNZUEkqA6b1RrNKWcIK0XMSzY+0k70dYcc4WDt3AA34SywQPe3Xk4kZDtUx9Y2684i4IYV4oGscJmvINl9hsaW7kRxQw26IGzAlK5q6xBNdink=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DV1+yRPe; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1715262150;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JtKBQafgj6T/uQYQcX8zbaBm1158ukporHHeqRvSARA=;
	b=DV1+yRPenjRpiixmCMJ1sfIhkLUQjP6UMz+KXQ2Sl1MVKylsXBEftlmVZZDks/hdfmk4Yd
	O5gF+9h2e2nflEtrN+XeO5KCRxkTiu9J0wU0Nvyf5BzMc8/XCNIJvnwQaRhFPSGXvJP+m/
	5XPOXWl8LCrqkwr+rg3Ga4DJKaouPw8=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-594-jzmwYEsKMJWeNo1wcZzGDQ-1; Thu, 09 May 2024 09:42:28 -0400
X-MC-Unique: jzmwYEsKMJWeNo1wcZzGDQ-1
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-572babec6c6so2077440a12.0
        for <linux-media@vger.kernel.org>; Thu, 09 May 2024 06:42:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715262147; x=1715866947;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JtKBQafgj6T/uQYQcX8zbaBm1158ukporHHeqRvSARA=;
        b=bUY2Q5o4m0ajJdIENX277RhD4UQ0+jw11cMgXqf/G2b1pdHfr/ILZYGgKXx1iuEENn
         etC65vdh6RSNRhZehvdE/mM2F+3034i1nG4/y+Z9FDuArY6WYYi5TzMwi5mrlgVmEYRj
         BDOEb4YBQQfFcD3OLRf6yBYCerQqHeAV2o+9upPetPBvgtX6eXR1I4mLUOoYC2UekXFV
         uv2bh3AvfS5ig0DvgAshTiBRiQAbrN23O59rzQNoUXxqtJeMAK75nyOLMDETTO5OtSa1
         WNtlNBn0smbsYkSE5YoC6XHdnzbdBMK6LLRe72572MRYVlkKmqyxsSAaC6rTFMrZH+yW
         D4Ug==
X-Forwarded-Encrypted: i=1; AJvYcCUDu5/lKxGXBKdAuTqqA8etdxTx6NnSmmRgwnQIgPZmsNLbVse/QhDgup7Q0/VNpQ22gYldF05z9CAkdMz6LWEivm30i7hkR/mWSqs=
X-Gm-Message-State: AOJu0YxcoFZGPRCITR90uAkAi1rW6RpnVQyHhNPKl+4VifRUmSphYRld
	dZEGdZlDR7dJ1Ot/5AIou5nu4vN/Q8GSAxCL5GZOUYGyohDm19NmCmBQHAr+2S/9R+IurY3k/ug
	XTabKYV00NnZqo99ertLfqOFpZ+PTNlmgI/7MuOVVlmKFF1ePQHUXuLtlLMgbApxUa8SE
X-Received: by 2002:a50:a6c4:0:b0:572:a7c8:f12b with SMTP id 4fb4d7f45d1cf-5733285d594mr2094297a12.13.1715262147325;
        Thu, 09 May 2024 06:42:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFRLuGSJKEguvSbKSFYEyewoPOt/A79IZRIqvHuEe9G4qd3+O9nsUyPVsFH4gObHszF2raQ3Q==
X-Received: by 2002:a50:a6c4:0:b0:572:a7c8:f12b with SMTP id 4fb4d7f45d1cf-5733285d594mr2094286a12.13.1715262146919;
        Thu, 09 May 2024 06:42:26 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5733c2c7d6esm713073a12.72.2024.05.09.06.42.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 May 2024 06:42:26 -0700 (PDT)
Message-ID: <f74981e4-ad5c-415d-9f1a-d03a8194db25@redhat.com>
Date: Thu, 9 May 2024 15:42:25 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: ov2740: Ensure proper reset sequence on probe()
To: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Bingbu Cao <bingbu.cao@intel.com>, Tianshu Qiu <tian.shu.qiu@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
References: <20240506132438.278920-1-hdegoede@redhat.com>
 <Zjy2ksnLCvKuWv4u@linux.intel.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Zjy2ksnLCvKuWv4u@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Stanislaw,

On 5/9/24 1:42 PM, Stanislaw Gruszka wrote:
> On Mon, May 06, 2024 at 03:24:38PM +0200, Hans de Goede wrote:
>> Before this commit on probe() the driver would do:
>>
>> reset=1                // from probe() calling gpiod_get(GPIOD_OUT_HIGH)
>> reset=0                // from resume()
>> msleep(20)             // from resume()
>>
>> So if reset was 0 before getting the GPIO the reset line would only be
>> driven high for a very short time and sometimes there would be errors
>> reading the id register afterwards.
>>
>> Add a msleep(20) after getting the reset line to ensure the sensor is
>> properly reset:
>>
>> reset=1                // from probe() calling gpiod_get(GPIOD_OUT_HIGH)
>> msleep(20)             // from probe()
>> reset=0                // from resume()
>> msleep(20)             // from resume()
>>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> 
> Tested-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
> 
> This fixes this issue:
> 
> [    7.742633] ov2740 i2c-INT3474:01: chip id mismatch: 2740 != 0
> [    7.742638] ov2740 i2c-INT3474:01: error -ENXIO: failed to find sensor
> 
> for me as well.

Thank you for testing.

However there is still the issue of the sensor not always starting to
stream reliably being discussed here:

https://github.com/intel/ipu6-drivers/issues/187

I have been thinking about this and I think that something like this
should fix this, can you give this a try (with the patch to disable
runtime-pm reverted) :

diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index c48dbcde9877..58818bcfe086 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -1294,7 +1294,14 @@ static int ov2740_suspend(struct device *dev)
 	struct ov2740 *ov2740 = to_ov2740(sd);
 
 	gpiod_set_value_cansleep(ov2740->reset_gpio, 1);
+	/*
+	 * Ensure reset is asserted for at least 20 ms before disabling the clk.
+	 * This also assures reset is properly asserted for 20 ms when a runtime
+	 * suspend is immediately followed by a runtime resume.
+	 */
+	msleep(20);
 	clk_disable_unprepare(ov2740->clk);
+
 	return 0;
 }
 
@@ -1308,6 +1315,9 @@ static int ov2740_resume(struct device *dev)
 	if (ret)
 		return ret;
 
+	/* Give clk time to stabilize */
+	msleep(20);
+
 	gpiod_set_value_cansleep(ov2740->reset_gpio, 0);
 	msleep(20);
 

Hopefully this will fix the start / stop stream issues when runtime
pm is enabled.

Regards,

Hans




>> ---
>>  drivers/media/i2c/ov2740.c | 9 ++++++++-
>>  1 file changed, 8 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
>> index 57906df7be4e..c48dbcde9877 100644
>> --- a/drivers/media/i2c/ov2740.c
>> +++ b/drivers/media/i2c/ov2740.c
>> @@ -1333,9 +1333,16 @@ static int ov2740_probe(struct i2c_client *client)
>>  		return dev_err_probe(dev, ret, "failed to check HW configuration\n");
>>  
>>  	ov2740->reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
>> -	if (IS_ERR(ov2740->reset_gpio))
>> +	if (IS_ERR(ov2740->reset_gpio)) {
>>  		return dev_err_probe(dev, PTR_ERR(ov2740->reset_gpio),
>>  				     "failed to get reset GPIO\n");
>> +	} else if (ov2740->reset_gpio) {
>> +		/*
>> +		 * Ensure reset is asserted for at least 20 ms before
>> +		 * ov2740_resume() deasserts it.
>> +		 */
>> +		msleep(20);
>> +	}
>>  
>>  	ov2740->clk = devm_clk_get_optional(dev, "clk");
>>  	if (IS_ERR(ov2740->clk))
>> -- 
>> 2.44.0
>>
> 


