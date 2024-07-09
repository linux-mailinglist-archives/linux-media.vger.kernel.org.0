Return-Path: <linux-media+bounces-14776-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E23792BCF3
	for <lists+linux-media@lfdr.de>; Tue,  9 Jul 2024 16:31:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4315B28367F
	for <lists+linux-media@lfdr.de>; Tue,  9 Jul 2024 14:31:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4E561940B2;
	Tue,  9 Jul 2024 14:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="h9recBh0"
X-Original-To: linux-media@vger.kernel.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81CD4358A7;
	Tue,  9 Jul 2024 14:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720535496; cv=none; b=V/VeRwMtbEggqgEMNUtsqCxqGSK24WsKFo8lTJ6Ao4DgHQxxYjau0SN6zCm4k8iGFqKCOx/WlTS0W8HaLwdQNKD080tGAArYoJubmmlaT8KONdhFpl7/w56fJ9nKeVicbOc5RDsc12u5v7fJVJsidt9xvUrR502XGWXIr9saBz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720535496; c=relaxed/simple;
	bh=kbE7E1aC67jpIZ6Ea2GEWtdODIBRtDkbzaxOt3uyn7k=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=srmc5jAUN/tK385wt4lrkizRcj0k31f1fYgnC/E0NTZFj3TbYyC1FahpgtDF2ygRjLfwjdEeV0fUHS1krm4Tkl46cc7YrYGbkOAoyePoLtQm631MGckl9yDmrGeq4BreaD8oR7pVCdQOOEQiyDqXJ+w6DpO2yjJTNcA5ZLVvajw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=h9recBh0; arc=none smtp.client-ip=198.47.19.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 469EUxc4114038;
	Tue, 9 Jul 2024 09:30:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1720535459;
	bh=JEsmcDLJ0df5pbyPMQ8aHuk3Gr51wAKm5Svyaj62YKI=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=h9recBh0fhHIiTFzmoHPN48cWafhcWX6Y6CuNAIHgO8osQEUB7aafTtEyYu3RAPTn
	 Oq+2fCs/wDldfWPEwjIbUSBW0LK4XU1FI2LfwuQtsYBkm+qgy4QJEiisstGKb6rPHT
	 2z9/JGmWVejoZ9/ul1Z7jMhLj/9bMm/CTt0QQIYw=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 469EUxJ7124021
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 9 Jul 2024 09:30:59 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 9
 Jul 2024 09:30:59 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 9 Jul 2024 09:30:59 -0500
Received: from [172.24.227.193] (devarsht.dhcp.ti.com [172.24.227.193] (may be forged))
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 469EUqw5090071;
	Tue, 9 Jul 2024 09:30:52 -0500
Message-ID: <91380590-5450-16bc-ddc0-07f117ed6fe1@ti.com>
Date: Tue, 9 Jul 2024 20:00:51 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 1/6] math.h: Add macros for rounding to closest value
Content-Language: en-US
To: Jiri Slaby <jirislaby@kernel.org>, <mchehab@kernel.org>,
        <hverkuil-cisco@xs4all.nl>, <linux-media@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <sebastian.fricke@collabora.com>,
        <andriy.shevchenko@linux.intel.com>, <jani.nikula@intel.com>,
        <corbet@lwn.net>, <broonie@kernel.org>, <rdunlap@infradead.org>,
        <linux-doc@vger.kernel.org>
CC: <laurent.pinchart@ideasonboard.com>, <praneeth@ti.com>, <nm@ti.com>,
        <vigneshr@ti.com>, <a-bhatia1@ti.com>, <j-luthra@ti.com>,
        <b-brnich@ti.com>, <detheridge@ti.com>, <p-mantena@ti.com>,
        <vijayp@ti.com>, <andi.shyti@linux.intel.com>, <nicolas@ndufresne.ca>,
        <davidgow@google.com>, <dlatypov@google.com>
References: <20240708155943.2314427-1-devarsht@ti.com>
 <20240708155943.2314427-2-devarsht@ti.com>
 <a0e31542-e77b-4efa-959d-f7f5a8719616@kernel.org>
From: Devarsh Thakkar <devarsht@ti.com>
In-Reply-To: <a0e31542-e77b-4efa-959d-f7f5a8719616@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

Hi Jiri,

Thanks for the review.

On 09/07/24 11:29, Jiri Slaby wrote:
> On 08. 07. 24, 17:59, Devarsh Thakkar wrote:
>> Add below rounding related macros:
>>
>> round_closest_up(x, y) : Rounds x to closest multiple of y where y is a
>> power of 2, with a preference to round up in case two nearest values are
>> possible.
>>
>> round_closest_down(x, y) : Rounds x to closest multiple of y where y is a
>> power of 2, with a preference to round down in case two nearest values are
>> possible.
>>
>> roundclosest(x, y) : Rounds x to closest multiple of y, this macro should
>> generally be used only when y is not multiple of 2 as otherwise
>> round_closest* macros should be used which are much faster.
>>
>> Examples:
>>   * round_closest_up(17, 4) = 16
>>   * round_closest_up(15, 4) = 16
>>   * round_closest_up(14, 4) = 16
>>   * round_closest_down(17, 4) = 16
>>   * round_closest_down(15, 4) = 16
>>   * round_closest_down(14, 4) = 12
>>   * roundclosest(21, 5) = 20
> 
> With consistency in mind, why is there no underscore?
> 

This is as per the convention followed in math.h for existing rounding macros
round_up, roundup, round_down, rounddown :

for e.g. It use "_" for macros which work on power of 2 for e.g. we  have
round_down, round_up macros which work on power of 2 and it remove "_" for
normal rounding macros for e.g. rounddown and roundup which are normal
rounding macros.

There was already a discussion around naming convention in previous patch
versions here [1] we aligned on this.

>>   * roundclosest(19, 5) = 20
>>   * roundclosest(17, 5) = 15
>>
>> Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
>> Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>> ---
>> NOTE: This patch is inspired from the Mentor Graphics IPU driver [1]
>> which uses similar macro locally and which is updated in further patch
>> in the series to use this generic macro instead along with other drivers
>> having similar requirements.
>>
>> Link:
>> https://elixir.bootlin.com/linux/v6.8.9/source/drivers/gpu/ipu-v3/ipu-image-convert.c#L480 [1]
>> ---
>>   include/linux/math.h | 63 ++++++++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 63 insertions(+)
>>
>> diff --git a/include/linux/math.h b/include/linux/math.h
>> index dd4152711de7..79e3dfda77fc 100644
>> --- a/include/linux/math.h
>> +++ b/include/linux/math.h
>> @@ -34,6 +34,52 @@
>>    */
>>   #define round_down(x, y) ((x) & ~__round_mask(x, y))
>>   +/**
>> + * round_closest_up - round closest to be multiple of specified value
>> (which is
>> + *                    power of 2) with preference to rounding up
>> + * @x: the value to round
>> + * @y: multiple to round closest to (must be a power of 2)
>> + *
>> + * Rounds @x to closest multiple of @y (which must be a power of 2).
>> + * The value can be either rounded up or rounded down depending upon rounded
>> + * value's closeness to the specified value. If there are two closest possible
>> + * values, i.e. the difference between the specified value and it's rounded up
>> + * and rounded down values is same then preference is given to rounded up
>> + * value.
>> + *
>> + * To perform arbitrary rounding to closest value (not multiple of 2), use
>> + * roundclosest().
>> + *
>> + * Examples:
>> + * * round_closest_up(17, 4) = 16
>> + * * round_closest_up(15, 4) = 16
>> + * * round_closest_up(14, 4) = 16
>> + */
>> +#define round_closest_up(x, y) round_down((x) + (y) / 2, (y))
>> +
>> +/**
>> + * round_closest_down - round closest to be multiple of specified value (which
>> + *            is power of 2) with preference to rounding down
>> + * @x: the value to round
>> + * @y: multiple to round closest to (must be a power of 2)
>> + *
>> + * Rounds @x to closest multiple of @y (which must be a power of 2).
>> + * The value can be either rounded up or rounded down depending upon rounded
>> + * value's closeness to the specified value. If there are two closest possible
>> + * values, i.e. the difference between the specified value and it's rounded up
>> + * and rounded down values is same then preference is given to rounded up
>> + * value.
> 
> Too heavy sentence. Did you mean "its" not "it's"?

Yeah "its" is the correct one.
> 
> What about:
> There can be two closest values. I.e. the difference between the specified
> value and its rounded up and down values is the same. In that case, the
> rounded up value is preferred.
> ?
> 

Yeah this looks good but I would still prefer to prepend to this the text "The
value can be either rounded up or rounded down depending upon rounded value's
closeness to the specified value" just to avoid any confusion as it caused a
bit of confusions in earlier iterations.


> The same for round_closest_up().
> 
>> + *
>> + * To perform arbitrary rounding to closest value (not multiple of 2), use
>> + * roundclosest().
>> + *
>> + * Examples:
>> + * * round_closest_down(17, 4) = 16
>> + * * round_closest_down(15, 4) = 16
>> + * * round_closest_down(14, 4) = 12
>> + */
>> +#define round_closest_down(x, y) round_up((x) - (y) / 2, (y))
>> +
>>   #define DIV_ROUND_UP __KERNEL_DIV_ROUND_UP
>>     #define DIV_ROUND_DOWN_ULL(ll, d) \
>> @@ -77,6 +123,23 @@
>>   }                            \
>>   )
>>   +/**
>> + * roundclosest - round to nearest multiple
>> + * @x: the value to round
>> + * @y: multiple to round nearest to
>> + *
>> + * Rounds @x to nearest multiple of @y.
>> + * The rounded value can be greater than or less than @x depending
> 
> greater or less than
> 

Agreed.

>> + * upon it's nearness to @x.
> 
> "its"
> 
Agreed.

>> If @y will always be a power of 2, consider
> 
> If @y is always a power...
> 

Agreed.

[1]: https://lore.kernel.org/all/Zj42vTpyH71TWeTk@smile.fi.intel.com/

Regards
Devarsh

