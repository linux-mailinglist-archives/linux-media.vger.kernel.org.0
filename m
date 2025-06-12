Return-Path: <linux-media+bounces-34683-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 932CDAD7C4E
	for <lists+linux-media@lfdr.de>; Thu, 12 Jun 2025 22:21:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 369837B06E2
	for <lists+linux-media@lfdr.de>; Thu, 12 Jun 2025 20:19:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B9012D663C;
	Thu, 12 Jun 2025 20:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T8GdCIpL"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A8D7101DE;
	Thu, 12 Jun 2025 20:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749759646; cv=none; b=fkNcvVAFpQM5vOaScFUsBq+S1UxE7ODNGGLTNlxwVNqEe8yPmQij19lIzQG/eyvJw5JWHdD8uguX0PExlhT1ymkEUM1nWi9uQ0iWT84haawEhd2z+sZNsni9K2KWIKKL/ERzReBXP/xr8eW1fm1JqJM2zRrxs9ktCyDKt9Hc4KY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749759646; c=relaxed/simple;
	bh=9gkjW7xi6IVUWESy4BP6oMJU0q5wWqoKZ42Xygu9pJA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nNEPv08Kjl/FtImDrM3OkffDxrMEyDP/b+1siVP3sfz6on1ouKGNuQZeFVkZ0phbvFtkH3qjnx8pE9rYm4jcp4tDZQ6w20gVNJL1gqjbBKOsAARSEdH1gsKsqPQEZVmPXMZObe1C7AEBCJzWNk0zmyMOSb38h33WXPn8pTkcFXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T8GdCIpL; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-adb47e0644dso245146666b.0;
        Thu, 12 Jun 2025 13:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749759643; x=1750364443; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=orcx6zrQJcOSZR07OyN10ERaBkQyXvgUQIhnZhJKmpU=;
        b=T8GdCIpLvS7sfqd9V7wT29SOBtB4EJL5JUPScdFEtpS50HHw0PLcFJ3mTNdVD5l06J
         iJneOg2RJMrMnuZBRSgt6L8P9EalfTocVAt0UMG/IgwsNnEUkhyO7ONegxKc5kqc5Iue
         TSKwXbFSk7AxhgBUGUZdBYM7sXB8Z5UI0cquwWtlgE9vPs7SrSdOoNIl+fflQYUHWoDq
         osf4oa2yrQHOAC/Jhfp9ncaxKDWtPW/k/JqZz1GF1UZB9Pq7/qnJYVzEqVZV8pZL3RLE
         qyCK58RFl9GLRCRRrg7794mHr8NlQT5PM2s2k22M6fBUH4chdYpOUPPPmIagHIvB4OUz
         w4MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749759643; x=1750364443;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=orcx6zrQJcOSZR07OyN10ERaBkQyXvgUQIhnZhJKmpU=;
        b=Ruu0fWFz5r6EZPg1c/p2mWlgxP/XdOU/HbAp021YrScftWMeYCHbMBdHKQAiue9+aG
         U4is5gL4VI7coCDgbEAVu52DZnjbXJDCKLesYN3/grBiYT+TtR5HFLclkpuOj99AG0On
         nGYsI+3+YehLlt4Awxo7zcaYdRnYSqH9wOxxKkNVl7G4pb72KzxrQSZuCxYO5NeJBp+C
         K/l73JdBME34LQkwpoOUCV43psqPL3qZcARKHWJt6uHtlv4e6ibUDfYgPjfJpR9HwugC
         3ivgvhVsSMd/bieh3iCtl6XjzXz9tt2k0A+RKTomhWaV2LQbQAsMMGuhWsC3i8mRXWCm
         xgzA==
X-Forwarded-Encrypted: i=1; AJvYcCW/EsgpnKgMXWAbhcI/E8B6kEVJeXoCYfZ0A3XfR5IDwB+ErHSmLFizPE490HZh6xGVeULQz0vkX0YlurU=@vger.kernel.org, AJvYcCWtaUTX8keJcVQm6wfBmuu6jZqqDJDwTdiM6gqbKlxxzFafZrn+O83hvnKmH5QQMxBnXITCmFW3NiNny84=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzgt50K5m+cv26eV0/T+HZIF4+zE561WwEufBcqBrweOZIivETl
	nGIJmQcIHE72NMEOAzZ54hLgukZ84URNeRU2P+qKPhWDzX7toueeF6UQUgCk5A==
X-Gm-Gg: ASbGncu2slRdbQ1y3QJDUG1/xvE0IUJOSUzaIbr/N0T+AkjC43ursAXpU9mb2iIPNSu
	CPMe2otaPoTfLfZ2wSA1mcgIB4cQpa5VDSOmcuV8PcosMeMYS4VUP/w7852JkahEdWxFGRfL/QN
	zEPuDPFNHKVCxaaWd7n2AsrCWjHp+py6TZI+HFAYxLNghiIQF8ysXQgFZ/WqKWfCcB/glwdvd7O
	gHMMAosW+okwuo3dyEwZdzPRDTlN/0VMFydcW60EI24gnuQ8vMqnBRiWKoT1xaOFjTIEXRKr+w5
	WY9iEh4/0bjzz+Vy3ay9ie5zea8jVICtan/TKNmdO6157/0ZzuEX6As33uLW2GchagXy
X-Google-Smtp-Source: AGHT+IEshUXueRCMaMREKrJ7bVTdJwg0gwvNamkJLbeSXFlvQhLK6OONZ7MP8XeUbU27vjnp1U4bng==
X-Received: by 2002:a17:907:708:b0:add:fb5f:75b with SMTP id a640c23a62f3a-adec889b8ffmr33955866b.2.1749759643104;
        Thu, 12 Jun 2025 13:20:43 -0700 (PDT)
Received: from [192.168.0.100] ([188.27.131.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec8982f4esm15266166b.176.2025.06.12.13.20.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jun 2025 13:20:42 -0700 (PDT)
Message-ID: <94bc5863-f831-47b6-8bfd-57a807c8fe23@gmail.com>
Date: Thu, 12 Jun 2025 23:20:28 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] media: rc: ir-spi: constrain carrier frequency
To: Sean Young <sean@mess.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250611112348.3576093-1-demonsingur@gmail.com>
 <20250611112348.3576093-3-demonsingur@gmail.com>
 <aEnifhd1M6oJjy1S@gofer.mess.org>
 <24d63ec4-a037-46fd-bbc1-9be2bef34c2b@gmail.com>
 <aEsycgtDxrypTU0v@gofer.mess.org> <aEs0Qr3O5myydP_L@gofer.mess.org>
From: Cosmin Tanislav <demonsingur@gmail.com>
Content-Language: en-US
In-Reply-To: <aEs0Qr3O5myydP_L@gofer.mess.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

c

On 6/12/25 11:10 PM, Sean Young wrote:
> On Thu, Jun 12, 2025 at 09:02:59PM +0100, Sean Young wrote:
>> On Wed, Jun 11, 2025 at 11:35:21PM +0300, Cosmin Tanislav wrote:
>>> On 6/11/25 11:09 PM, Sean Young wrote:
>>>> On Wed, Jun 11, 2025 at 02:23:44PM +0300, Cosmin Tanislav wrote:
>>>>> Carrier frequency is currently unconstrained, allowing the SPI transfer
>>>>> to be allocated and filled only for it to be later rejected by the SPI
>>>>> controller since the frequency is too large.
>>>>>
>>>>> Add a check to constrain the carrier frequency inside
>>>>> ir_spi_set_tx_carrier().
>>>>>
>>>>> Also, move the number of bits per pulse to a macro since it is not used
>>>>> in multiple places.
>>>>>
>>>>> Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
>>>>> ---
>>>>>    drivers/media/rc/ir-spi.c | 6 +++++-
>>>>>    1 file changed, 5 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/drivers/media/rc/ir-spi.c b/drivers/media/rc/ir-spi.c
>>>>> index 50e30e2fae22..bf731204c81e 100644
>>>>> --- a/drivers/media/rc/ir-spi.c
>>>>> +++ b/drivers/media/rc/ir-spi.c
>>>>> @@ -21,6 +21,7 @@
>>>>>    #define IR_SPI_DRIVER_NAME		"ir-spi"
>>>>>    #define IR_SPI_DEFAULT_FREQUENCY	38000
>>>>> +#define IR_SPI_BITS_PER_PULSE		16
>>>>>    struct ir_spi_data {
>>>>>    	u32 freq;
>>>>> @@ -70,7 +71,7 @@ static int ir_spi_tx(struct rc_dev *dev, unsigned int *buffer, unsigned int coun
>>>>>    	memset(&xfer, 0, sizeof(xfer));
>>>>> -	xfer.speed_hz = idata->freq * 16;
>>>>> +	xfer.speed_hz = idata->freq * IR_SPI_BITS_PER_PULSE;
>>>>>    	xfer.len = len * sizeof(*tx_buf);
>>>>>    	xfer.tx_buf = tx_buf;
>>>>> @@ -98,6 +99,9 @@ static int ir_spi_set_tx_carrier(struct rc_dev *dev, u32 carrier)
>>>>>    	if (!carrier)
>>>>>    		return -EINVAL;
>>>>> +	if (carrier * IR_SPI_BITS_PER_PULSE > idata->spi->max_speed_hz)
>>>>> +		return -EINVAL;
>>>>
>>>> Just a nitpick.
>>>>
>>>> I think carrier * IR_SPI_BITS_PER_PULSE could overflow, and then the check
>>>> wouldn't work. It might be better to do:
>>>>
>>>> 	if (carrier > idata->spi->max_speed_hz / IR_SPI_BITS_PER_PULSE)
>>>>
>>>> However since IR_SPI_BITS_PER_PULSE is 16, which is just a shift left by 4,
>>>> I don't think this can be abused in any useful way.
>>>>
>>>
>>> I have another concern regarding overflow, inside ir_spi_tx().
>>>
>>> DIV_ROUND_CLOSEST() is called with buffer[i] * idata->freq and 1000000.
>>> buffer[i] comes from userspace, it's the number of microseconds for this
>>> pulse. It's unsigned int. lirc core already checks that each element
>>> is not bigger than 500000 microseconds. Issue is, at 500000, it would
>>> take a carrier frequency as low as 8590 to overflow the unsigned int.
>>
>> Interesting, you are right.
>>
>>> Maybe it would make sense to switch this one to mult_frac()? But we
>>> would lose rounding.
>>>
>>> mult_frac(buffer[i], idata->freq, 1000000)
>>>
>>> Optionally, we could cast buffer[i] to u64/unsigned long long, and use
>>> DIV_ROUND_CLOSEST_ULL.
>>>
>>> DIV_ROUND_CLOSEST_ULL((u64)buffer[i] * idata->freq, 1000000)
>>>
>>> Let me know what you think.
>>
>> I've given it some thought and I'm not sure there is a better solution. It's
>> an edge case of course, but we should deal with it correctly.
> 
> Actually could we use check_mul_overflow() for this?
> 

I think we're better off using DIV_ROUND_CLOSEST_ULL(), since after the
multiplication, there's a division by 1000000, which might bring us back
in 32-bit territory, even if the multiplication overflowed. If we use
check_mul_overflow(), we would just invalidate a case that would have
worked fine.

> Just an idea.
> 
> 
> Sean


