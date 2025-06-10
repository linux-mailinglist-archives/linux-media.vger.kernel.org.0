Return-Path: <linux-media+bounces-34415-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 386E6AD3361
	for <lists+linux-media@lfdr.de>; Tue, 10 Jun 2025 12:15:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B71A418970B3
	for <lists+linux-media@lfdr.de>; Tue, 10 Jun 2025 10:16:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B02E28C5B2;
	Tue, 10 Jun 2025 10:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c6BskYG1"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FA4921FF55;
	Tue, 10 Jun 2025 10:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749550550; cv=none; b=ktBqngEFdI2CCRtC//CLAAQEBedvuhI+wcTvETEHTcdEiwH1WMTS5N9bmqyuHawBgZ9x9pk00G+GBubXV64dde+njYqLKrJI+SPuUHysez7vU3YhhgNuqPwVUz+8JTSV+wevT2822Q3pmQhPVpvp8tNXH0JOgNZjbW78HDe0uQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749550550; c=relaxed/simple;
	bh=Ikv5InvFUqaL7MbP3ouhpo3+c7y6BTMPBiByR0rsA8s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gFBagLlX9aBbLwUYA9k6ptnHhKhOjRKbnP7gahx8keIGU/KA0AXCaYWM2Q4Do3i7NbRuNb3gvJgLalgMqEDhBKBn3GaJqZN0R4/S5P0Z7c2MaSvcO2+K5VD73tzbuhE8CsvFm+FmGd1FEC7twEEl0fQlO7OZj1Xuy960s3YzQG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c6BskYG1; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-adb2bb25105so838391766b.0;
        Tue, 10 Jun 2025 03:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749550546; x=1750155346; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cWuWcVj95DVrEthc+5S3mPSfmODoym51F12oODVd7rA=;
        b=c6BskYG1CSOpARgFO3E8sI4pjpbJGP2uTYOstNp97bC45226nuqUvKl3d2/93iYDVo
         BMbvxfSvCx/0Yuaq7dzWi55nFi6sL51jJqF5qZHfajImp+xKjSJHg0stHYlmyH+VM6ke
         dSI1u1PmD6j/lW31UvA3NkH4e27rTuZHq7QjHmxrXR05QMu3BFqycslIskII95QK25mZ
         Kh4o6XwgBoaB9bhFaQyMTYAtbjjgLrUEhEd76terE919xbFUKpzyx1AOft+tBReLjEz1
         FJ3XYc0aT0oy+O5UCjsVNKWaLfGtYYgWlu9YMRB0SLPgs9hukfr/hd4T5wYkSDbatYpd
         80Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749550546; x=1750155346;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cWuWcVj95DVrEthc+5S3mPSfmODoym51F12oODVd7rA=;
        b=lGooiz0ff0wHEgSj/oeVdDau6bHn7M0NTTwnrSe6+cpnjyolH6Mi2JHF6dlVe6x7rp
         lvT+HLKoYUrqSCHio0yrj6kdAa77HaTDpgf16AnODauQ45x+MKFZLRwFtaRDxPaTVpyL
         t59fhzedvj6SZM68rp0bDKc+v8TJ9LV0e7zX9x0kfgzyQ5iLh9Z/P5KuR/oEZ2NvZHip
         B0ge3w5zXHdmcVIlNqjIbLlw/CoKRqOzluYJjxAmjud+U3bKk8MZ7zp16e4DnsFg6nul
         efZKLlRGZlsKc3pj/rHmPIKlqyiaLj+phqumn/djQI4VFKl8wGGr0bK8tUZxjK6ZdKqW
         Vi9A==
X-Forwarded-Encrypted: i=1; AJvYcCUCJyEuOd1on8P8oFDAWTJUaNkFkfyGqhfjOvtFjO4rk3Fq5HcKIqYrHj0uz1AczPSHnP/dtgckT7ODeOI=@vger.kernel.org, AJvYcCWVUc3IFNji+5uxcE71s4dM3fmE4GtkkTPbf90Y2XI1wIk1iP4SN2ClapfMNYYuNoTZeI3KDV57V9tGOf8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwhdpGkyOkxh7gYYl0sQL9XbtZF8SkLuwiNS2C27aZNBQocvH2F
	vZLHoD8o3VqOFfkzJldkmPIL5u1YuN5/KCEXuil3sFaSMgbi0ENi8fXgrpNtVw==
X-Gm-Gg: ASbGncsL9k//c3QZpaFnL6QmJbyOECa3yV1M2xyK/sw9UB3aMDjr3olxjRmjXVsGUT/
	7MOZuYrkd9nXP1SjavJ+Q/TNT9p1+x42QfkPrwZtReWPsnFw06kdms8NSdptiWfa7CuIRlu1S5x
	HapXnH7g3WNKVvZeJdZfGREztT7FnDIU8gxDw7qWVPbSCpDWLO9ehe7ypq9bW6tH0AFFVhPyf+J
	wwWbzUva0K+xl9H3oeCx0yFccEFAZZ3aGa1fkzfKq5OknyqcjZmCmiDA5W0Zw+vnA4+ZLTQFNrR
	Ww7kf0+4zbf9FL8qhtuO7nEZh8CMxXYsMbbFEUlCqiS6FWI9XHe1Fb56mYJ+TQ1NGB0qda3BT+z
	uLA4=
X-Google-Smtp-Source: AGHT+IEp3hJtHppNSirNocg+aJvrAhcCKKcXsQk3rvu0BJeq5i0xfpdXX7zuwLSTIsjisjCvogmnSg==
X-Received: by 2002:a17:906:dc8b:b0:ad2:28be:9a16 with SMTP id a640c23a62f3a-ade1abc4055mr1509061366b.51.1749550546213;
        Tue, 10 Jun 2025 03:15:46 -0700 (PDT)
Received: from [192.168.0.100] ([188.27.131.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1dc3902csm691572166b.125.2025.06.10.03.15.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 03:15:45 -0700 (PDT)
Message-ID: <8efe62a8-2c90-4599-82f3-4e41d8d859aa@gmail.com>
Date: Tue, 10 Jun 2025 13:15:32 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] media: rc: ir-spi: allocate buffer dynamically
To: Sean Young <sean@mess.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250609111715.2572138-1-demonsingur@gmail.com>
 <aEf9b17JU1a5q2hC@gofer.mess.org>
From: Cosmin Tanislav <demonsingur@gmail.com>
Content-Language: en-US
In-Reply-To: <aEf9b17JU1a5q2hC@gofer.mess.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 6/10/25 12:39 PM, Sean Young wrote:
> On Mon, Jun 09, 2025 at 02:17:13PM +0300, Cosmin Tanislav wrote:
>> Replace the static transmit buffer with a dynamically allocated one,
>> removing the limit imposed on the number of pulses to transmit.
>>
>> Calculate the number of pulses for each duration in the received buffer
>> ahead of time, while also adding up the total pulses, to be able to
>> allocate a buffer that perfectly fits the total number of pulses, then
>> populate it.
>>
>> Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
>> ---
>> V3:
>>   * move the allocation to be done per-TX operation
>>
>> V2:
>>   * use devm_krealloc_array
>>
>>   drivers/media/rc/ir-spi.c | 33 ++++++++++++++++++++-------------
>>   1 file changed, 20 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/media/rc/ir-spi.c b/drivers/media/rc/ir-spi.c
>> index 8fc8e496e6aa..50e30e2fae22 100644
>> --- a/drivers/media/rc/ir-spi.c
>> +++ b/drivers/media/rc/ir-spi.c
>> @@ -21,13 +21,11 @@
>>   #define IR_SPI_DRIVER_NAME		"ir-spi"
>>   
>>   #define IR_SPI_DEFAULT_FREQUENCY	38000
>> -#define IR_SPI_MAX_BUFSIZE		 4096
>>   
>>   struct ir_spi_data {
>>   	u32 freq;
>>   	bool negated;
>>   
>> -	u16 tx_buf[IR_SPI_MAX_BUFSIZE];
>>   	u16 pulse;
>>   	u16 space;
>>   
>> @@ -43,37 +41,42 @@ static int ir_spi_tx(struct rc_dev *dev, unsigned int *buffer, unsigned int coun
>>   	unsigned int len = 0;
>>   	struct ir_spi_data *idata = dev->priv;
>>   	struct spi_transfer xfer;
>> +	u16 *tx_buf;
>>   
>>   	/* convert the pulse/space signal to raw binary signal */
>>   	for (i = 0; i < count; i++) {
>> -		unsigned int periods;
>> +		buffer[i] = DIV_ROUND_CLOSEST(buffer[i] * idata->freq, 1000000);
>> +		len += buffer[i];
>> +	}
> 
> This looks great, thank you.
> 
> I do have one concern though. If someone sets a carrier of U32_MAX - 1 then
> this code could be doing largish allocations, spending too long in kernel
> space filling them with data and spi can't send it anyway. Actually
> the kmalloc might fail which doesn't look good in the logs.
> 
> We may have to constrain the carrier to something spi can handle.
> 

The SPI device has a max_speed_hz, maybe we should check that?

It seems to be set based on the spi-max-frequency property in
the device tree node of the SPI device, and uses the max_speed_hz
of the SPI controller as a fallback.

Should I add a separate patch that adds a check in
ir_spi_set_tx_carrier?

if (carrier * 16 > idata->spi->max_speed_hz)
	return -EINVAL.

Something along these lines.

> 
> Sean
> 
>> +
>> +	tx_buf = kmalloc_array(len, sizeof(*tx_buf), GFP_KERNEL);
>> +	if (!tx_buf)
>> +		return -ENOMEM;
>> +
>> +	len = 0;
>> +	for (i = 0; i < count; i++) {
>>   		int j;
>>   		u16 val;
>>   
>> -		periods = DIV_ROUND_CLOSEST(buffer[i] * idata->freq, 1000000);
>> -
>> -		if (len + periods >= IR_SPI_MAX_BUFSIZE)
>> -			return -EINVAL;
>> -
>>   		/*
>>   		 * The first value in buffer is a pulse, so that 0, 2, 4, ...
>>   		 * contain a pulse duration. On the contrary, 1, 3, 5, ...
>>   		 * contain a space duration.
>>   		 */
>>   		val = (i % 2) ? idata->space : idata->pulse;
>> -		for (j = 0; j < periods; j++)
>> -			idata->tx_buf[len++] = val;
>> +		for (j = 0; j < buffer[i]; j++)
>> +			tx_buf[len++] = val;
>>   	}
>>   
>>   	memset(&xfer, 0, sizeof(xfer));
>>   
>>   	xfer.speed_hz = idata->freq * 16;
>> -	xfer.len = len * sizeof(*idata->tx_buf);
>> -	xfer.tx_buf = idata->tx_buf;
>> +	xfer.len = len * sizeof(*tx_buf);
>> +	xfer.tx_buf = tx_buf;
>>   
>>   	ret = regulator_enable(idata->regulator);
>>   	if (ret)
>> -		return ret;
>> +		goto err_free_tx_buf;
>>   
>>   	ret = spi_sync_transfer(idata->spi, &xfer, 1);
>>   	if (ret)
>> @@ -81,6 +84,10 @@ static int ir_spi_tx(struct rc_dev *dev, unsigned int *buffer, unsigned int coun
>>   
>>   	regulator_disable(idata->regulator);
>>   
>> +err_free_tx_buf:
>> +
>> +	kfree(tx_buf);
>> +
>>   	return ret ? ret : count;
>>   }
>>   
>> -- 
>> 2.49.0
>>


