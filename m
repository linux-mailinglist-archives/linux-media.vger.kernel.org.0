Return-Path: <linux-media+bounces-14914-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D9D592E68F
	for <lists+linux-media@lfdr.de>; Thu, 11 Jul 2024 13:27:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BF72E1F2203D
	for <lists+linux-media@lfdr.de>; Thu, 11 Jul 2024 11:27:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35C4B15ECD6;
	Thu, 11 Jul 2024 11:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IrkFdZvI"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB95716CD04
	for <linux-media@vger.kernel.org>; Thu, 11 Jul 2024 11:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720696955; cv=none; b=fFo78oT2dRUseRwTBAKu61rISI0jiiLsj/VeLiZqQPsJR358bAtkZ0L7Iehjn2jYLP82x1yop8Gc67yLZa+AB5E0wdSXtk6s/gztxdGhuCCfq4yJlHAc9fG2qZqQ9Kod4ck5ymIVxI87nqSKgVzYMWNuRXg9m06FkjPItu0f/bM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720696955; c=relaxed/simple;
	bh=oBDnAag5gQlhrAcOgNYYluUSpvZY5u+u2lJdb7p7nfE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KUJvx9gVpNi/kqAhvSOgs7+NkEYhVqemMRB5XmhHXEgusrmDCQXyBRGpPQo9EpFboHDVZNEPALhvhPhT2IDCmGo4bSUTs04KZCet1dKhQquS91DjLk1NXYw3uNZxI/+VmgeryEBhhZGukkViFRBt19Ji9mkMOUg1i4nw6svyhks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IrkFdZvI; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2ee910d6aaeso7926921fa.1
        for <linux-media@vger.kernel.org>; Thu, 11 Jul 2024 04:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720696952; x=1721301752; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZRrUzB1pBpPbCjosy572/8SxcZFgnM7FQHnyffhGyG0=;
        b=IrkFdZvIxHP0OyROexXgabKbNlMDKnnMwb0JQRfhAFCBOmPdZ2AILejoMasGBVzwiW
         JCTlYW6uoZZ8jPFbi5V2WpWxBPEk/HfvgcR0kEoLavWDgPCaQXhWSo9X+6rXjjmtws+x
         Ce2d3DXV29gaHnASpfjDrVZagHwHSqcX9sIDfmAo4j5u2DBlDIvWSkrvhfBSRZQyU3KU
         5RUyZI4K3YVLS70VThxB12AYTxgblH5VFi1fsNINOadttD0XLLCcdnLCLDFhNRus1oAZ
         lAPWOZ7h+AvlTtXuRiU1XIyc/8gzZpvryqH+eykeLjQvB3d27P7iGrTyw4Xkcbmlqm+t
         qanA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720696952; x=1721301752;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZRrUzB1pBpPbCjosy572/8SxcZFgnM7FQHnyffhGyG0=;
        b=JG1PGA9hfMMFTDW020+kmqifDONjBYL8SqtM0/R5IKNbRaDMPOXScgsfzumwqMcNvI
         iLFPLLLluioHpKn6t5Az0GXYNTZun+ytBRnowXBlCUW6v7z43nQ9+Ox/ROEzGPq1FRB8
         Q/uWDDrKOXh+hC2E+0Nde92Pno9k8XhZ8YR8p0MJ8u/zXIrQhwGPXhc9vMtZuktgl9kZ
         MvnJV69Y8cc7xZmlnQqRlDwLXsZsauiIQG66Jl/czoBpPl+PAIT5dAU9U+EPimQrgvOL
         PRlNh13t37YdKmJLBKnYs0V5EiwSdbUJGyWGu4tJU4pQ4VN9i6tROx2r2/znYGupfnMO
         rgvQ==
X-Forwarded-Encrypted: i=1; AJvYcCXx9GNAo8miQCQngpjtGfuShqfAB55NY1AbfCnLbBNCatkhaK+CAfHJhDCTaoJAU9nPtVDs9GMFOzJhRS+H+/EZ5uwOt6QNIVbkV7U=
X-Gm-Message-State: AOJu0YwQM0Ut+XDAYLgP3BDVKYdWvtqGydchJZzAk3O+mj7iXFtkGDEu
	vldVfUBYBA4FUJmEo2wfhW/C7xy5TCA6Rdv1q5h7yoBLkzCYMDlPH2TxYEfPjDU=
X-Google-Smtp-Source: AGHT+IHe5/f+cNlVXJfd3IJFg2qfPezKjG2oDodKbnqowuFTS/9Cv35Wjs9n9ATrOYrBf/wOUzZj5Q==
X-Received: by 2002:a2e:7307:0:b0:2ee:6cda:637b with SMTP id 38308e7fff4ca-2eeb318aaa8mr51695021fa.35.1720696951745;
        Thu, 11 Jul 2024 04:22:31 -0700 (PDT)
Received: from [192.168.0.3] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4279bc37c05sm11595235e9.35.2024.07.11.04.22.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jul 2024 04:22:31 -0700 (PDT)
Message-ID: <aa20591f-3939-4776-9025-b8d7159f4c63@linaro.org>
Date: Thu, 11 Jul 2024 12:22:30 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] media: ov5675: Elongate reset to first transaction
 minimum gap
To: Quentin Schulz <quentin.schulz@cherry.de>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Jacopo Mondi <jacopo@jmondi.org>
Cc: Johan Hovold <johan@kernel.org>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20240711-linux-next-ov5675-v1-0-69e9b6c62c16@linaro.org>
 <20240711-linux-next-ov5675-v1-2-69e9b6c62c16@linaro.org>
 <fcd0db64-6104-47a6-a482-6aa3eec702bc@cherry.de>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <fcd0db64-6104-47a6-a482-6aa3eec702bc@cherry.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/07/2024 11:40, Quentin Schulz wrote:
> Hi Bryan,
> 
> On 7/11/24 12:20 PM, Bryan O'Donoghue wrote:
>> The ov5675 specification says that the gap between XSHUTDN deassert 
>> and the
>> first I2C transaction should be a minimum of 8192 XVCLK cycles.
>>
>> Right now we use a usleep_rage() that gives a sleep time of between about
>> 430 and 860 microseconds.
>>
>> On the Lenovo X13s we have observed that in about 1/20 cases the current
>> timing is too tight and we start transacting before the ov5675's reset
>> cycle completes, leading to I2C bus transaction failures.
>>
>> The reset racing is sometimes triggered at initial chip probe but, more
>> usually on a subsequent power-off/power-on cycle e.g.
>>
>> [   71.451662] ov5675 24-0010: failed to write reg 0x0103. error = -5
>> [   71.451686] ov5675 24-0010: failed to set plls
>>
>> The current quiescence period we have is too tight, doubling the minimum
>> appears to fix the issue observed on X13s.
>>
>> Fixes: 49d9ad719e89 ("media: ov5675: add device-tree support and 
>> support runtime PM")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> ---
>>   drivers/media/i2c/ov5675.c | 9 +++++++--
>>   1 file changed, 7 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/media/i2c/ov5675.c b/drivers/media/i2c/ov5675.c
>> index 92bd35133a5d..0498f8f3064d 100644
>> --- a/drivers/media/i2c/ov5675.c
>> +++ b/drivers/media/i2c/ov5675.c
>> @@ -1018,8 +1018,13 @@ static int ov5675_power_on(struct device *dev)
>>       gpiod_set_value_cansleep(ov5675->reset_gpio, 0);
>> -    /* 8192 xvclk cycles prior to the first SCCB transation */
>> -    usleep_range(delay_us, delay_us * 2);
>> +    /* The spec calls for a minimum delay of 8192 XVCLK cycles prior to
>> +     * transacting on the I2C bus, which translates to about 430
>> +     * microseconds at 19.2 MHz.
>> +     * Testing shows the range 8192 - 16384 cycles to be unreliable.
>> +     * Grant a more liberal 2x -3x clock cycle grace time.
>> +     */
>> +    usleep_range(delay_us * 2, delay_us * 3);
> 
> Would it make sense to have power_off have the same logic? We do a 
> usleep_range of those same values currently, so keeping them in sync 
> seems to make sense to me.

I have no evidence to suggest there's a problem on the shutdown path, 
that's why I left the quiescence period as-is there.

> Also, I'm wondering if it isn't an issue with the gpio not being high 
> right after gpoiod_set_value_cansleep() returns, i.e. the time it 
> actually takes for the HW to reach the IO level that means "high" for 
> the camera. And that this increased sleep is just a way to mitigate that?

No, that's not what I found.

I tried changing

         usleep_range(2000, 2200);

to
         usleep_range(200000, 220000);

but could still elicit the I2C transaction failure. If the time it took 
for the GPIO to hit logical 1 were the issue then multiplying the reset 
time by 100 would certainly account for that.

// BOD set the chip into reset
         gpiod_set_value_cansleep(ov5675->reset_gpio, 1);

// BOD apply power
         ret = regulator_bulk_enable(OV5675_NUM_SUPPLIES, ov5675->supplies);
         if (ret) {
                 clk_disable_unprepare(ov5675->xvclk);
                 return ret;
         }

         /* Reset pulse should be at least 2ms and reset gpio released 
only once
          * regulators are stable.
          */

// BOD spec specifies 2 milliseconds here not a count of XVCLKs
         usleep_range(2000, 2200);

         gpiod_set_value_cansleep(ov5675->reset_gpio, 0);

// BOD spec calls for a _minimum_ of 8192 XVCLK cycles before I2C
         /* 8192 xvclk cycles prior to the first SCCB transation */
         usleep_range(delay_us, delay_us * 2);

The issue is initiating an I2C transaction too early _after_ reset 
completion not the duration of that reset.

As I stated in the cover letter, I tried a longer reset duration, a 
higher drive-strength on the GPIO as well as I didn't put in my cover 
letter, inverting the logic of the GPIO reset, which unsurprisingly 
didn't work.

No matter how long we hold the chip in reset, unless we give more grace 
time _subsequent_ to the reset before initiating an I2C transaction, we 
will encounter transaction failures.

This is a fairly common and logical fault if you think about it.

XVCLK is providing a clock to the ov5675 core to "do stuff" whatever 
that stuff is. Bring up an internal firmware, lock a fundamental PLL - 
whatever.

If we start an I2C transaction before the hypothetical internal core has 
booted up then - meh no bueno we'll get no transaction response.

That's the error - speaking too soon.

A little like myself in the mornings, cranky before I've had my coffee 
and unresponsive.

;)

> With this patch we essentially postpone the power_on by another 430ms 
> making it almost a full second before we can start using the camera. 
> That's quite a lot I think? We don't have a usecase right now that 
> requires this to be blazing fast (and we anyway would need at the very 
> least 430ms), so take this remark as what it is, a remark.

Not a full second, a millisecond.

8/10ths of 1 millisecond instead of 4/10ths of one millisecond.

19.2MHz is 52.083333333333 nanoseconds per clock

52.083333333333 * 8192 => 426666 nanoseconds => 0.426666 milliseconds or 
426.6 microseconds

So our post reset quiesence minimum @ 19.2MHz moves from 426.6 
microseconds to 853.

> The change looks fine to me even though it feels like a band-aid patch.

I mean it's not a second - if you feel very strongly that 426 
milliseconds * 2 is wrong, I guess I could add some more complex logic 
however I like this simple fix for backporting.

---
bod

