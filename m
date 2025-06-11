Return-Path: <linux-media+bounces-34545-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C7269AD6021
	for <lists+linux-media@lfdr.de>; Wed, 11 Jun 2025 22:36:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C6AEB7AC51C
	for <lists+linux-media@lfdr.de>; Wed, 11 Jun 2025 20:34:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEC152BDC3D;
	Wed, 11 Jun 2025 20:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N0sx+0CV"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EEE6289E02;
	Wed, 11 Jun 2025 20:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749674140; cv=none; b=AokCANqo7xmz534fI+4VOVp/fsuc01hY+z1trHmMarCiBqrYCkbotwdMkXqy5e9HfP/ZylrBKglW+OvQe39SiS/NZoL04aSlVKSIfH44ZQy6Pm96pR18OgUu8jHQnkrv6NaHvcHhTbZB3HCx/BZdbxISFCQMuVNyW0IvDdiw0KA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749674140; c=relaxed/simple;
	bh=UWzOtwBkzFTAX1XQVmEYt9ONcEQYAZhOwW9hM4qI8/U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QI6PbPfK9+cw95NmSijrVQ7TRZQD8JavKBgquhm7QPFyw1Es6bu2jq8+wVgXEicib6XoeH+yIRyM5NBWt8dAwEe8c8y4LfOVC8hqnU9LyS/Jq/Z1XFsXSK5gWXM71LyY1u+Jd47LzbfNyt1iXPyAOoBVTg9wUQSkqqo7R7bTq1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N0sx+0CV; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ade326e366dso38237366b.3;
        Wed, 11 Jun 2025 13:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749674136; x=1750278936; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=At0v4b7YF+lz56liCT0TD8XJeosOM2DTEwQ2PKPGb1I=;
        b=N0sx+0CVC4y+SHR3xZJdqXGFa1IF9gA+tARQ/N29B8CP5nt5ZXSwhCEaKSl6M1/02H
         TD+iBKyt3OpXFpz8ExxrkvAW1jStZQU1HxudEdY3ZVBMtxWb7gpnhnBkVaWNM4MXBqbJ
         v+1/dKGTmOkwpKk6stjziB02d/UDXgWyTiGXvzDrZnHDPb9D4Z+/1WGtj+6moQz6Xo2j
         SkcBnsV0XGte1widiBgE8jNOkiid1w++9ezABRhEg2htg/j47oZ1HJAdB9CCYP5jx1a1
         3KoZuMhSCu8AQpdxNueCa/FFQv9E0U1UhlDCC10YyB/wq1h6eTVk4lk/chldJ+/x2bKx
         jebQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749674136; x=1750278936;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=At0v4b7YF+lz56liCT0TD8XJeosOM2DTEwQ2PKPGb1I=;
        b=oGWSOteJbGYGIp4DboOVmJkwsx3O/nbsgm/aeCpveydBgdncCN1Y/KL665vY+G6zpr
         O05S41WyIUnryZgg0Eod8UmGJfr66Rb8/oqZqWpS0NoJGjv5jk1dXLyrOEwOkTKV/QZ0
         qq0yz/4M6qkuscDtYQM8W20uYQM33D/JiRCoVjk/KwQX86CJn+9FdCvBHjV2JM0d7swf
         9B0nE6I4/kW9gEmzRZL8CnToXjn559b80ToDF2AXRUwPJKlvKquEdNq6YFr9fstFc+mb
         fGS4bNz6YAp/nZ9aRYJN/mQ3nf86xzeMBj10jl03M0CQIY1Tiv2RULCR0byAJt8B1w24
         r7Cg==
X-Forwarded-Encrypted: i=1; AJvYcCU/KMoqlhKSnZ/RCoRi8lJzFs8UzG/+4NTxxuTzeSfDedp9eRnODQMDoClfRZ1Q/G1JnEOeRr8w14hX/HA=@vger.kernel.org, AJvYcCUwhx/bw4ziBDtHECniQW42XmKBnYDr6NXrFXnXrxRfAccamYsGZoXh9EcUY5wJIM5zCMw7rkI1aVqkaVI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyf/VtaB+YPFLCrsLe8FTRdHJ/ch0Xhx+5QcitotwhGLPgHGU+D
	9gCAkprR5OBgSNrGGTVvs82ff3riJhP3jchuH6GIx1J2mXJoSMT5prlInb+5pQ==
X-Gm-Gg: ASbGncsxQqjpTmS7pjkO11sKfiNE1c49TvZ60lwQpD8C5rtfTxFWFV9Q7bXzvyhDuj4
	ZVRSzFhpf2iL3yFlETfZInTLZ7t9cLW6ZLX/8RoTh9EHSFF2yUMFmqDs+b6txY4X/b5mBwb5yBa
	mhfQ3GBbXjzLr/qMT3hSFS3HPbblHRcA02xiVOfsOm/BRpQSNpt62t5Jv1uM5I/yFnoIPbo2fVQ
	+SFUgzbmPWnIKoQAPUKxyzGAu4LHZqRYs3cY8QCGZKq4viYIC8JjueOtxegwTkghVKJRIZanLnG
	smg32xqxqRECraI1/rS2EhCcYZ1sIHsv5jXjgUAdViaTxqiW2UpWjHvalG3SxGx8qhT8
X-Google-Smtp-Source: AGHT+IE7r4VxnplmHLn4myMCwk6cGuYpxGzpXAyTTMaaASVBB65E4xgnfGDM5tV9doAzWYMPNiHWkA==
X-Received: by 2002:a17:906:6a10:b0:ad8:a935:b90b with SMTP id a640c23a62f3a-adea93b051fmr54157166b.28.1749674135628;
        Wed, 11 Jun 2025 13:35:35 -0700 (PDT)
Received: from [192.168.0.100] ([188.27.131.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adeadb23fa8sm6475566b.94.2025.06.11.13.35.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jun 2025 13:35:35 -0700 (PDT)
Message-ID: <24d63ec4-a037-46fd-bbc1-9be2bef34c2b@gmail.com>
Date: Wed, 11 Jun 2025 23:35:21 +0300
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
From: Cosmin Tanislav <demonsingur@gmail.com>
Content-Language: en-US
In-Reply-To: <aEnifhd1M6oJjy1S@gofer.mess.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 6/11/25 11:09 PM, Sean Young wrote:
> On Wed, Jun 11, 2025 at 02:23:44PM +0300, Cosmin Tanislav wrote:
>> Carrier frequency is currently unconstrained, allowing the SPI transfer
>> to be allocated and filled only for it to be later rejected by the SPI
>> controller since the frequency is too large.
>>
>> Add a check to constrain the carrier frequency inside
>> ir_spi_set_tx_carrier().
>>
>> Also, move the number of bits per pulse to a macro since it is not used
>> in multiple places.
>>
>> Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
>> ---
>>   drivers/media/rc/ir-spi.c | 6 +++++-
>>   1 file changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/rc/ir-spi.c b/drivers/media/rc/ir-spi.c
>> index 50e30e2fae22..bf731204c81e 100644
>> --- a/drivers/media/rc/ir-spi.c
>> +++ b/drivers/media/rc/ir-spi.c
>> @@ -21,6 +21,7 @@
>>   #define IR_SPI_DRIVER_NAME		"ir-spi"
>>   
>>   #define IR_SPI_DEFAULT_FREQUENCY	38000
>> +#define IR_SPI_BITS_PER_PULSE		16
>>   
>>   struct ir_spi_data {
>>   	u32 freq;
>> @@ -70,7 +71,7 @@ static int ir_spi_tx(struct rc_dev *dev, unsigned int *buffer, unsigned int coun
>>   
>>   	memset(&xfer, 0, sizeof(xfer));
>>   
>> -	xfer.speed_hz = idata->freq * 16;
>> +	xfer.speed_hz = idata->freq * IR_SPI_BITS_PER_PULSE;
>>   	xfer.len = len * sizeof(*tx_buf);
>>   	xfer.tx_buf = tx_buf;
>>   
>> @@ -98,6 +99,9 @@ static int ir_spi_set_tx_carrier(struct rc_dev *dev, u32 carrier)
>>   	if (!carrier)
>>   		return -EINVAL;
>>   
>> +	if (carrier * IR_SPI_BITS_PER_PULSE > idata->spi->max_speed_hz)
>> +		return -EINVAL;
> 
> Just a nitpick.
> 
> I think carrier * IR_SPI_BITS_PER_PULSE could overflow, and then the check
> wouldn't work. It might be better to do:
> 
> 	if (carrier > idata->spi->max_speed_hz / IR_SPI_BITS_PER_PULSE)
> 
> However since IR_SPI_BITS_PER_PULSE is 16, which is just a shift left by 4,
> I don't think this can be abused in any useful way.
> 

I have another concern regarding overflow, inside ir_spi_tx().

DIV_ROUND_CLOSEST() is called with buffer[i] * idata->freq and 1000000.
buffer[i] comes from userspace, it's the number of microseconds for this
pulse. It's unsigned int. lirc core already checks that each element
is not bigger than 500000 microseconds. Issue is, at 500000, it would
take a carrier frequency as low as 8590 to overflow the unsigned int.

Maybe it would make sense to switch this one to mult_frac()? But we
would lose rounding.

mult_frac(buffer[i], idata->freq, 1000000)

Optionally, we could cast buffer[i] to u64/unsigned long long, and use
DIV_ROUND_CLOSEST_ULL.

DIV_ROUND_CLOSEST_ULL((u64)buffer[i] * idata->freq, 1000000)

Let me know what you think.

> 
> Sean
> 
>> +
>>   	idata->freq = carrier;
>>   
>>   	return 0;
>> -- 
>> 2.49.0
>>


