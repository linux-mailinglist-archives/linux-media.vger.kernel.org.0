Return-Path: <linux-media+bounces-34316-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DFCD8AD14E4
	for <lists+linux-media@lfdr.de>; Sun,  8 Jun 2025 23:53:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E5A2D3AA691
	for <lists+linux-media@lfdr.de>; Sun,  8 Jun 2025 21:52:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB40925A2DA;
	Sun,  8 Jun 2025 21:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RfSTpyZ+"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61BDB1372;
	Sun,  8 Jun 2025 21:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749419594; cv=none; b=MmPV9zMdyPnVNwXc4FMaXLa+Db2vCy3SVQUaGVHKF6RHW+taPeUkVJoxPmei7gA3s/1vkRx8jCR5gC1mDyIPzfDOKrilu5hZ2KXPoyzxShe7eoFCqeX5+BkSX5GQ5LvK3f8V/ArRmDUFNN6giLpsnMAW2pYQeIfTiynpt4/8MRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749419594; c=relaxed/simple;
	bh=wOquQRKcqCTvElOurCE/UoM3j19NupLZVOftDa6RwX8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L3z7UAB81COUu4N08mUU88S/Wp2rfzQtJOxwRqWVeUtqQ7H08bhu93E3rrAugclRxVFRXzMWV9JD6P+0uKR/g345FR2ym3HsR0Kwrhy2STcApp2nY6eOsPKlfFq4kd8SQ/Jtz2uFtN58WwGN0xSK8kEcTPfdv/8AWnusO3GgeLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RfSTpyZ+; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-60179d8e65fso2159391a12.0;
        Sun, 08 Jun 2025 14:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749419591; x=1750024391; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4NduPR+gg4BA8Uu7aYd3QeksMa8DB1S3qK6CG6TmcMY=;
        b=RfSTpyZ+P4nDn2Frni3COdwblCaHja2IeHetxftgO18nRE/0oZxXL/8R8IDrzaYFM4
         SWs2i2gBEYKvTfX5gX+dNU++kjcc55tOPkwsq4Om6rdxBJxa2H8QrAvpHt0PEX9FXnV2
         Jwk67jMmctD5Brd8Lu0a1+KK1WvaSz05oD7wZLRIcwoc/tcI8kUYpgnqbXhEOgg21DsU
         Gre93e84uC5pJT+H23+2BeIlu4Xhgr+DNe2HDfrazoLJIU8jQnnIjIvM8bDJ3SJUlI+K
         8ryVXT29Z7Hoxr5BbmRyN2PRdUGFc8MWaNRzFC2V6SmyGCHfU8ulDZylUtDmqG83Jj/A
         p9fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749419591; x=1750024391;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4NduPR+gg4BA8Uu7aYd3QeksMa8DB1S3qK6CG6TmcMY=;
        b=phftKw5Kwh1mb6BKlyYXROOpaxb2qk0kZybnKPiSSs/ld7ssThvzNe5RCK9rMSnVPR
         hmeK3sHn3KR1/iGPl8uMoBtLodkVChADT4VB9j0ncEN8dIldwnljxB/jzQSXlhjSBWMi
         Vy+gUFSq5l+QS5JT+lzYj1Ab/k7HzYt95avPKFUEoS5ahnuQolBuEQ60SIRDX5BUWttI
         qTUKobeKsd1etasgRFZGK7H8+ZWyIqFZIn0a1fYmkbjUJRM2Rbu0hZhk92qHdKeyW+Sx
         RRWpOKyY/8m1Z0ZiKZiRXzTipMfr3nRh624HyIWvdm353jEkwDeSUM7tWmoUaak1Dade
         JgLQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWFn5woFvuGL/TMXBOeuuupAXsZKhCNqPgTq2O3V6Ljcfc9wQrFWCfVQK+UiCCytUi9odDPb+SzjfSGR8=@vger.kernel.org, AJvYcCWaEMhftm2j4yV8DjIRPSsjP4latfHsxeYFSzvajEfw/eB8QDMq5mXaiLCDMxtb8z4G6uz5dEzI404Ode4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwHQYS0+ykXC4r0oWpI2HX0l6hF3SgQt+KA3L1GUHuqcx377i4t
	m+ihJXf+Qd99uSm6aaFGbBQpnxpoYJXuZVduDOfr1GvFMZZuICi3Ppxn
X-Gm-Gg: ASbGncs4zP3p65epwYMAFHgMG2DBew+jtyTHX1A4gjiovN/VpQ6xq1qZFZXk02SiTYD
	v5jIU+TTGvm57GQVkAD1T9pch29Ce7PAlmZt7+kuJtmnKGRUBQTQEHBo7nLseUTWlv3Bg5AKEBp
	J7MhI7wx38PnSb5cfsqeUL1t6jEVjlJVM8bzDcasU42UUJOI41Chdwc0Bbh+okWkVEq5+CTPyLZ
	/6126Tb2doUkkdZMMk6xPicAzzbjZyEehp1Wflpdfh9uFPEZCYTcO4j++SOG/IpE0DaMUGfoFmV
	0ANP5iN4ZcJEH0k/ODmmcbB0b9Tjt0JC3C0PWQuTnxp+JsnBTTgGhOuOgXRz47fBUurC
X-Google-Smtp-Source: AGHT+IEhIWM4jqRZI65dNRncFhmR3kABVmoPpBzqZie0cZ3iQ1dBZ9kp1yY8bfVpBdqgvR9LtTP69g==
X-Received: by 2002:a05:6402:1941:b0:607:f557:73b1 with SMTP id 4fb4d7f45d1cf-607f5578da3mr900563a12.5.1749419590378;
        Sun, 08 Jun 2025 14:53:10 -0700 (PDT)
Received: from [192.168.0.100] ([188.27.131.45])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-607783de2bcsm3812831a12.68.2025.06.08.14.53.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Jun 2025 14:53:09 -0700 (PDT)
Message-ID: <f6730384-92ca-4f3d-8316-996edc2750fa@gmail.com>
Date: Mon, 9 Jun 2025 00:52:56 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] media: rc: ir-spi: reallocate buffer dynamically
To: Sean Young <sean@mess.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250608191536.2181756-1-demonsingur@gmail.com>
 <aEXxs4xsNR7Srdvx@gofer.mess.org>
From: Cosmin Tanislav <demonsingur@gmail.com>
Content-Language: en-US
In-Reply-To: <aEXxs4xsNR7Srdvx@gofer.mess.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 6/8/25 11:25 PM, Sean Young wrote:
> On Sun, Jun 08, 2025 at 10:15:33PM +0300, Cosmin Tanislav wrote:
>> Replace the static transmit buffer with a dynamically allocated one,
>> allowing the buffer to grow as needed based on the length of the
>> message being transmitted.
>>
>> Introduce a helper function ir_buf_realloc() to manage the allocation
>> and reallocation of the buffer. Use it during probe to preallocate
>> a buffer matching the original static buffer, then reallocate it as
>> needed, with an overhead to avoid frequent reallocations.
>>
>> Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
>> ---
>> V2:
>>   * use devm_krealloc_array
>>
>>   drivers/media/rc/ir-spi.c | 32 +++++++++++++++++++++++++++++---
>>   1 file changed, 29 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/media/rc/ir-spi.c b/drivers/media/rc/ir-spi.c
>> index 8fc8e496e6aa..2f931950e107 100644
>> --- a/drivers/media/rc/ir-spi.c
>> +++ b/drivers/media/rc/ir-spi.c
>> @@ -27,7 +27,8 @@ struct ir_spi_data {
>>   	u32 freq;
>>   	bool negated;
>>   
>> -	u16 tx_buf[IR_SPI_MAX_BUFSIZE];
>> +	u16 *tx_buf;
>> +	size_t tx_len;
>>   	u16 pulse;
>>   	u16 space;
>>   
>> @@ -36,6 +37,26 @@ struct ir_spi_data {
>>   	struct regulator *regulator;
>>   };
>>   
>> +static int ir_buf_realloc(struct ir_spi_data *idata, size_t len)
>> +{
>> +	u16 *tx_buf;
>> +
>> +	if (len <= idata->tx_len)
>> +		return 0;
>> +
>> +	len = max(len, idata->tx_len + IR_SPI_MAX_BUFSIZE);
>> +
>> +	tx_buf = devm_krealloc_array(&idata->spi->dev, idata->tx_buf, len,
>> +				     sizeof(*idata->tx_buf), GFP_KERNEL);
>> +	if (!tx_buf)
>> +		return -ENOMEM;
>> +
>> +	idata->tx_buf = tx_buf;
>> +	idata->tx_len = len;
>> +
>> +	return 0;
>> +}
>> +
>>   static int ir_spi_tx(struct rc_dev *dev, unsigned int *buffer, unsigned int count)
>>   {
>>   	int i;
>> @@ -52,8 +73,9 @@ static int ir_spi_tx(struct rc_dev *dev, unsigned int *buffer, unsigned int coun
>>   
>>   		periods = DIV_ROUND_CLOSEST(buffer[i] * idata->freq, 1000000);
>>   
>> -		if (len + periods >= IR_SPI_MAX_BUFSIZE)
>> -			return -EINVAL;
>> +		ret = ir_buf_realloc(idata, len + periods);
> 
> You're reallocating in a loop. That causes a lot of churn.
> 

I'm allocating in a loop indeed, but I add at least IR_SPI_MAX_BUFSIZE
each time the new length exceeds the existing length. This should cut
down on the amount of allocations.

In my testing, controlling various devices around the house using IR,
I haven't exceeded two allocations, aka 8192. But having this static
size in place prevents bigger transfers from being done.

>> +		if (ret)
>> +			return ret;
>>   
>>   		/*
>>   		 * The first value in buffer is a pulse, so that 0, 2, 4, ...
>> @@ -153,6 +175,10 @@ static int ir_spi_probe(struct spi_device *spi)
>>   
>>   	idata->freq = IR_SPI_DEFAULT_FREQUENCY;
>>   
>> +	ret = ir_buf_realloc(idata, IR_SPI_MAX_BUFSIZE);
>> +	if (ret)
>> +		return ret;
>> +
> 
> By default, you're allocating IR_SPI_MAX_BUFSIZE already at probe time. So
> until someone does a transmit, you haven't saved any memory compared to
> before. In fact, the text size will be more so things are worse.
> 
> It might make sense to allocate IR_SPI_MAX_BUFSIZE once for each transmit;
> most drivers do an allocation per transmit which is perfectly acceptable.
> 

My reasoning was not to save memory, but to allow transfers bigger than
IR_SPI_MAX_BUFSIZE, which currently is 4096. Note that that's periods,
not number of pulses/spaces.

If you want an allocation per transfer then we should compute the total
period size and allocate a big enough buffer to fit all the periods.

Each pulse/space value translates to a different period (depending on
the carrier frequency) so we'd have to compute it once ahead of time
to allocate the periods buffer, and once again afterwards.

To avoid doing the period finding two times we could reuse the passed in
buffer to hold the calculated period, but we'd still be iterating two
times over the passed in buffer.

> 
> Thanks,
> 
> Sean
> 
>>   	return devm_rc_register_device(dev, idata->rc);
>>   }
>>   
>> -- 
>> 2.49.0


