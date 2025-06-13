Return-Path: <linux-media+bounces-34735-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 144BBAD8883
	for <lists+linux-media@lfdr.de>; Fri, 13 Jun 2025 11:53:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0C871189E1F1
	for <lists+linux-media@lfdr.de>; Fri, 13 Jun 2025 09:53:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F68F2C159D;
	Fri, 13 Jun 2025 09:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HM4OzTYn"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 230582C1580;
	Fri, 13 Jun 2025 09:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749808387; cv=none; b=OgZelyDMbg+JpJwCSfsiwqpvY50egvGIFu8LZ5hrmJc0/l8mRQbG0Kkzs7/CnRsNEcO89b6l6LcKdoTfsIK2HhiglEl5fKIlXV3HhJ59FQym0TCHluAPgDaTSb6aIEtBv4fIXLcMKE7ywxfE4GWovzAfzIJTk5ZWrcI8MJSmh7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749808387; c=relaxed/simple;
	bh=hUJxX0q5CFfsXoIHx51jTmVpqXAJOxfYSA5FvAAMvgY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u614ledyjH05X0Hvk/1kjUVv0L5Xi887MAnfWjtNpb7H9hVuL3MQfTqIyg0bbJtQmY2IEAdNwB/gm2eLiLaZ/Q6jtJdtpteADGmCR8XeCPPUYAODK6x0iwboatzb5EjFuEBrwWD6GdmaaZHylWKkgpGUO9TgK/zZm6Je+Z7b9fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HM4OzTYn; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4531e146a24so12556125e9.0;
        Fri, 13 Jun 2025 02:53:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749808383; x=1750413183; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Xyo+7GGR+jO4iGOBW4Z/TKY9eY6R1F/muL7R/tMtDNs=;
        b=HM4OzTYnZ+yyKuNOM3YeBEIHQf54ebB7fKWNHD0XFfLiNfrKOxBHE9WpWPkpx9InAg
         3LJELmuSCctMye6w9/XX/KFDaQP8niURdjAEDQUZhYuQe38DAO9uW8EbbFSHn0EVDh5T
         37fVGrRQuOrRopdJXkTpE3FKBDmG/GbxmSjy3Qv4UsTNp34b5cOM7inWRYisWBWWhahu
         BATfALT/WcQbrTk/bGNCWCyDzgYBOCmyxfi692gotl+zzmQy9fOBAFt2e6PcK2t9h6rl
         CD0p5sAuOu1HcJAYKQiXkCKBUvQZZehLvLSUPQn4NCy6A4yZqtyTgr4K9V92lLc9E617
         n1ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749808383; x=1750413183;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Xyo+7GGR+jO4iGOBW4Z/TKY9eY6R1F/muL7R/tMtDNs=;
        b=nBG/LvXy9cVhy9refBh3yyMh5lNc3PJ18GeFrS/J4hcF7+uFMljSWWM8XcB8ztpQtf
         E/N7cFIpAjDyCVIxMgN427LXVKvqNL3GImdJ9XK0hxpF68o4/x5GuSfAH/at6akwGZXX
         wns75vpT9nYBxMj52+95w7UYAuVluk3DiqduK16P5++ziPkHvytX1sPVGF4m5P3EChM2
         9AJ37bXBeKWkc1auqW+fiGek1jn9egn5DHbg52Q42cvT/NSxB/TuyqPZjzCJ4bElbbvv
         LjOFDZSXV7DPxb3hocvyLNDjQcHW6iXXIBzNShQ6Weqsg5d5HJrb8UFTzg9LuzL3WZVf
         Y98g==
X-Forwarded-Encrypted: i=1; AJvYcCV/vCsSSDbY+nZ0s3qZYSIR6MmbOP+jsjKUnNhf22yIhtidJjOTx10jp9cogz6iSKe3s8VzZOqpaqBhRc0=@vger.kernel.org, AJvYcCXVgZjB7xIsTXYl+Ue8z5blfKy74jx9XOaPae8c2WfoAG19PiVFDSfdtl749BdAibOaxGFL8qXK2ZIBhKI=@vger.kernel.org
X-Gm-Message-State: AOJu0YygYPCozpLUxscD5A4ysx6nQ5j0lyDGmzynVi0rely2Hx+t17KE
	DLQogX92g40MLOU7y/Njbz7BvKP0bZFfDdKm06sOdMg88r4xEPnTXyv2
X-Gm-Gg: ASbGnctehMnfFUkeE5nkgwmCPn8hz+LknSsnBjoHa6RaE6JAAEFlHVKRyFS5oHc/Xvr
	T235apPM0LjmkYSg9QyVGhdYgTBh/sCQ4lCEccwHIGLqSwzBT+ZBGBhd9dhTMns8ZQMFYVa9p2T
	/uTkKv95UY2oFE8wy5voNbL4fkegmmndSBX8e2tGpZdKsom+ZryE5zg4y8mvsmIb0lCbvshz+DM
	OqFdh1yK+uXG07n/pELXtGoeVGSsLp3QjJK5lnRzKcKT1O8YwPtGL7HEyPC1LoyCiwN5xksiBcb
	N3J3nn/3QFhMpoocDtf/Lpao4bRGChxRqzSc33JSFHBTIXPdQmkSddVCb54jeSdy/c1H
X-Google-Smtp-Source: AGHT+IFdb7Ay3ozgwpgU4ZdzOdTPlDR45RKqzBhxzOQnxYFLKBh3pa+w++/vw82iseUkRveafMPbyw==
X-Received: by 2002:a05:600c:1906:b0:451:e394:8920 with SMTP id 5b1f17b1804b1-45334b76ae0mr20407155e9.27.1749808383142;
        Fri, 13 Jun 2025 02:53:03 -0700 (PDT)
Received: from [192.168.0.100] ([188.27.131.45])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e13c19esm47183345e9.25.2025.06.13.02.53.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jun 2025 02:53:02 -0700 (PDT)
Message-ID: <e882896f-1350-4f6e-a878-361a6e72426b@gmail.com>
Date: Fri, 13 Jun 2025 12:52:49 +0300
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
 <94bc5863-f831-47b6-8bfd-57a807c8fe23@gmail.com>
 <aEvvu2sez981pM6Q@gofer.mess.org>
From: Cosmin Tanislav <demonsingur@gmail.com>
Content-Language: en-US
In-Reply-To: <aEvvu2sez981pM6Q@gofer.mess.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 6/13/25 12:30 PM, Sean Young wrote:
> On Thu, Jun 12, 2025 at 11:20:28PM +0300, Cosmin Tanislav wrote:
>> On 6/12/25 11:10 PM, Sean Young wrote:
>>> On Thu, Jun 12, 2025 at 09:02:59PM +0100, Sean Young wrote:
>>>> On Wed, Jun 11, 2025 at 11:35:21PM +0300, Cosmin Tanislav wrote:
>>>>> On 6/11/25 11:09 PM, Sean Young wrote:
>>>>>> On Wed, Jun 11, 2025 at 02:23:44PM +0300, Cosmin Tanislav wrote:
>>>>>>> Carrier frequency is currently unconstrained, allowing the SPI transfer
>>>>>>> to be allocated and filled only for it to be later rejected by the SPI
>>>>>>> controller since the frequency is too large.
>>>>>>>
>>>>>>> Add a check to constrain the carrier frequency inside
>>>>>>> ir_spi_set_tx_carrier().
>>>>>>>
>>>>>>> Also, move the number of bits per pulse to a macro since it is not used
>>>>>>> in multiple places.
>>>>>>>
>>>>>>> Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
>>>>>>> ---
>>>>>>>     drivers/media/rc/ir-spi.c | 6 +++++-
>>>>>>>     1 file changed, 5 insertions(+), 1 deletion(-)
>>>>>>>
>>>>>>> diff --git a/drivers/media/rc/ir-spi.c b/drivers/media/rc/ir-spi.c
>>>>>>> index 50e30e2fae22..bf731204c81e 100644
>>>>>>> --- a/drivers/media/rc/ir-spi.c
>>>>>>> +++ b/drivers/media/rc/ir-spi.c
>>>>>>> @@ -21,6 +21,7 @@
>>>>>>>     #define IR_SPI_DRIVER_NAME		"ir-spi"
>>>>>>>     #define IR_SPI_DEFAULT_FREQUENCY	38000
>>>>>>> +#define IR_SPI_BITS_PER_PULSE		16
>>>>>>>     struct ir_spi_data {
>>>>>>>     	u32 freq;
>>>>>>> @@ -70,7 +71,7 @@ static int ir_spi_tx(struct rc_dev *dev, unsigned int *buffer, unsigned int coun
>>>>>>>     	memset(&xfer, 0, sizeof(xfer));
>>>>>>> -	xfer.speed_hz = idata->freq * 16;
>>>>>>> +	xfer.speed_hz = idata->freq * IR_SPI_BITS_PER_PULSE;
>>>>>>>     	xfer.len = len * sizeof(*tx_buf);
>>>>>>>     	xfer.tx_buf = tx_buf;
>>>>>>> @@ -98,6 +99,9 @@ static int ir_spi_set_tx_carrier(struct rc_dev *dev, u32 carrier)
>>>>>>>     	if (!carrier)
>>>>>>>     		return -EINVAL;
>>>>>>> +	if (carrier * IR_SPI_BITS_PER_PULSE > idata->spi->max_speed_hz)
>>>>>>> +		return -EINVAL;
>>>>>>
>>>>>> Just a nitpick.
>>>>>>
>>>>>> I think carrier * IR_SPI_BITS_PER_PULSE could overflow, and then the check
>>>>>> wouldn't work. It might be better to do:
>>>>>>
>>>>>> 	if (carrier > idata->spi->max_speed_hz / IR_SPI_BITS_PER_PULSE)
>>>>>>
>>>>>> However since IR_SPI_BITS_PER_PULSE is 16, which is just a shift left by 4,
>>>>>> I don't think this can be abused in any useful way.
>>>>>>
>>>>>
>>>>> I have another concern regarding overflow, inside ir_spi_tx().
>>>>>
>>>>> DIV_ROUND_CLOSEST() is called with buffer[i] * idata->freq and 1000000.
>>>>> buffer[i] comes from userspace, it's the number of microseconds for this
>>>>> pulse. It's unsigned int. lirc core already checks that each element
>>>>> is not bigger than 500000 microseconds. Issue is, at 500000, it would
>>>>> take a carrier frequency as low as 8590 to overflow the unsigned int.
>>>>
>>>> Interesting, you are right.
>>>>
>>>>> Maybe it would make sense to switch this one to mult_frac()? But we
>>>>> would lose rounding.
>>>>>
>>>>> mult_frac(buffer[i], idata->freq, 1000000)
>>>>>
>>>>> Optionally, we could cast buffer[i] to u64/unsigned long long, and use
>>>>> DIV_ROUND_CLOSEST_ULL.
>>>>>
>>>>> DIV_ROUND_CLOSEST_ULL((u64)buffer[i] * idata->freq, 1000000)
>>>>>
>>>>> Let me know what you think.
>>>>
>>>> I've given it some thought and I'm not sure there is a better solution. It's
>>>> an edge case of course, but we should deal with it correctly.
>>>
>>> Actually could we use check_mul_overflow() for this?
>>>
>>
>> I think we're better off using DIV_ROUND_CLOSEST_ULL(), since after the
>> multiplication, there's a division by 1000000, which might bring us back
>> in 32-bit territory, even if the multiplication overflowed. If we use
>> check_mul_overflow(), we would just invalidate a case that would have
>> worked fine.
> 
> I don't have a strong opinion on this, but in the current code the overflow
> is not detected and garbage is sent, right?
> 

Yes, that's the current situation. idata->freq can be at most 8590
knowing buffer[i] is limited to 500000:

0xFFFFFFFF / 500000 ~= 8590

If we switch to u64 for the multiplication, idata->freq can be larger
than the u32 max value without overflowing the multiplication:

0xFFFFFFFFFFFFFFFF / 500000 ~= 36893488147420 > 4294967295 (u32 limit)

Now, knowing that buffer[i] is max 500000, and freq is u32,
the max value of the whole DIV_ROUND_CLOSEST_ULL() call would be:

500000 * 0xFFFFFFFF / 1000000 ~= 2147483648

Which fits fine in u32, seeing how 500000 is half of 1000000.

> 
> Sean


