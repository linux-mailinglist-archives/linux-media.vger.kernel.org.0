Return-Path: <linux-media+bounces-15203-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BC347938103
	for <lists+linux-media@lfdr.de>; Sat, 20 Jul 2024 13:37:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4FB5D1F219F1
	for <lists+linux-media@lfdr.de>; Sat, 20 Jul 2024 11:37:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47D88127B56;
	Sat, 20 Jul 2024 11:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="w4/nb9un"
X-Original-To: linux-media@vger.kernel.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE29F5F87D;
	Sat, 20 Jul 2024 11:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721475438; cv=none; b=m/JTsz+IP4TD2PO1NtQhcK5HAVNooyBBbnrPA4+nz75vsUhFclWROdH6JQTUU0m+9p6Oj2WX94j3uJSkzqGNWExIJGaMj9yOjEo5dWeAD7XUu2M8pyzprPriIaJPZpQMZFactlPvdqobxAUvZO5h0rEV/S1DU5UJ8WHZAR7BqzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721475438; c=relaxed/simple;
	bh=5FDYeONxUxiiC0lbx2CmB2p4yq5Vd6FXV9/hZnwi6sU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=pfivpYAz/e8Sypy9QlB/qSWe6qYs74rHiA8DumxfgGAiahid4wgl6g0LHGkeoxfNI8d4UtA017AV+X3rRgGR9lXRV/NXTcuK1UEk187drq6xi+vTGq38aJXszuZt0Mq7Pg7Y1EDF5TXio6qtL6QbO9Wo0AgLn0vfZiJT70Fqp+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=w4/nb9un; arc=none smtp.client-ip=198.47.23.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 46KBan6n087600;
	Sat, 20 Jul 2024 06:36:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1721475409;
	bh=CvaFrM/QiVs3wfdeBm4WwaABqJuyMohvRzu6bICgHVU=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=w4/nb9unjLO5I24DQIxXpkJFY3kRzpqLPyWHZkR9GdhyXYpgM5Uwx3PZLpF66vLN/
	 4dQaF0q2cVzHaM1lmGPrrDOMoRENA+O0dxMV8x/dG5rxms3nOlRY39ZMbbLGOf8MZq
	 a3Svb4dZNARbnnKdF14NYb3wsjxkQLNz7DdwBKCE=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 46KBanr5102474
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sat, 20 Jul 2024 06:36:49 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sat, 20
 Jul 2024 06:36:49 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sat, 20 Jul 2024 06:36:48 -0500
Received: from [10.249.130.181] ([10.249.130.181])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 46KBadCC109258;
	Sat, 20 Jul 2024 06:36:40 -0500
Message-ID: <9e1cf069-43ba-4f49-8d2d-1cc9c16bd65e@ti.com>
Date: Sat, 20 Jul 2024 17:06:38 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] math.h: Add macros for rounding to closest value
To: Dave Martin <Dave.Martin@arm.com>
CC: <mchehab@kernel.org>, <hverkuil-cisco@xs4all.nl>,
        <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <sebastian.fricke@collabora.com>, <andriy.shevchenko@linux.intel.com>,
        <jani.nikula@intel.com>, <jirislaby@kernel.org>, <corbet@lwn.net>,
        <broonie@kernel.org>, <rdunlap@infradead.org>,
        <linux-doc@vger.kernel.org>, <laurent.pinchart@ideasonboard.com>,
        <praneeth@ti.com>, <nm@ti.com>, <vigneshr@ti.com>, <a-bhatia1@ti.com>,
        <j-luthra@ti.com>, <b-brnich@ti.com>, <detheridge@ti.com>,
        <p-mantena@ti.com>, <vijayp@ti.com>, <andi.shyti@linux.intel.com>,
        <nicolas@ndufresne.ca>, <davidgow@google.com>, <dlatypov@google.com>
References: <20240708155943.2314427-1-devarsht@ti.com>
 <20240708155943.2314427-2-devarsht@ti.com> <Zo1w0Z57Y0NlcK6m@e133380.arm.com>
Content-Language: en-US
From: Devarsh Thakkar <devarsht@ti.com>
In-Reply-To: <Zo1w0Z57Y0NlcK6m@e133380.arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

Hi Dave,

Thanks for the review.

On 09/07/24 22:48, Dave Martin wrote:
> On Mon, Jul 08, 2024 at 09:29:38PM +0530, Devarsh Thakkar wrote:
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
>>  * round_closest_up(17, 4) = 16
>>  * round_closest_up(15, 4) = 16
>>  * round_closest_up(14, 4) = 16
>>  * round_closest_down(17, 4) = 16
>>  * round_closest_down(15, 4) = 16
>>  * round_closest_down(14, 4) = 12
>>  * roundclosest(21, 5) = 20
>>  * roundclosest(19, 5) = 20
>>  * roundclosest(17, 5) = 15
>>
>> Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
>> Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>> ---
>> NOTE: This patch is inspired from the Mentor Graphics IPU driver [1]
>> which uses similar macro locally and which is updated in further patch
>> in the series to use this generic macro instead along with other drivers
>> having similar requirements.
>>
>> Link: https://elixir.bootlin.com/linux/v6.8.9/source/drivers/gpu/ipu-v3/ipu-image-convert.c#L480 [1]
>> ---
>>  include/linux/math.h | 63 ++++++++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 63 insertions(+)
>>
>> diff --git a/include/linux/math.h b/include/linux/math.h
>> index dd4152711de7..79e3dfda77fc 100644
>> --- a/include/linux/math.h
>> +++ b/include/linux/math.h
>> @@ -34,6 +34,52 @@
>>   */
>>  #define round_down(x, y) ((x) & ~__round_mask(x, y))
>>  
>> +/**
>> + * round_closest_up - round closest to be multiple of specified value (which is
>> + *                    power of 2) with preference to rounding up
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
>> + *			is power of 2) with preference to rounding down
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
>> + * * round_closest_down(17, 4) = 16
>> + * * round_closest_down(15, 4) = 16
>> + * * round_closest_down(14, 4) = 12
>> + */
>> +#define round_closest_down(x, y) round_up((x) - (y) / 2, (y))
>> +
> 
> Naming aside, is there an actual use case for having both roundclosest()
> and round_closest_up() today?
> 

Both the macros are different, roundclosest is for arbitrary rounding
(not multiple of 2) where round_closest_up/down are optimized for
rounding to values which are powers of 2. So where there is a surety
that rounding value would be power of 2, round_closest* macros are
recommended. Regarding the use-cases, there are drivers already using
such type of macros locally [1] and new drivers such as [2] required it,
so we aligned to have generic macros for all rounding to nearest value
scenarios (this patch was earlier part of another series with 7
revisions, see the discussions here [2]).


> (i.e., is there any potential caller that would actually care about the
> rounding direction for borderline cases?)

I think a transparent scheme is better where caller should be aware of
rounding direction for borderline cases too so that it gets predictable
values w.r.t what it requested for rather than leaving it ambiguous. For
e.g. in this patchset [3], it suited more to use round_closest_down
instead of round_closest_up keeping in mind hw constraints and use-case
requirements, but same might not be true for other drivers. Same was
aligned in earlier patch submissions too [2].


> 
>>  #define DIV_ROUND_UP __KERNEL_DIV_ROUND_UP
>>  
>>  #define DIV_ROUND_DOWN_ULL(ll, d) \
>> @@ -77,6 +123,23 @@
>>  }							\
>>  )
>>  
>> +/**
>> + * roundclosest - round to nearest multiple
>> + * @x: the value to round
>> + * @y: multiple to round nearest to
>> + *
>> + * Rounds @x to nearest multiple of @y.
>> + * The rounded value can be greater than or less than @x depending
>> + * upon it's nearness to @x. If @y will always be a power of 2, consider
>> + * using the faster round_closest_up() or round_closest_down().
>> + *
>> + * Examples:
>> + * * roundclosest(21, 5) = 20
>> + * * roundclosest(19, 5) = 20
>> + * * roundclosest(17, 5) = 15
>> + */
>> +#define roundclosest(x, y) rounddown((x) + (y) / 2, (y))
> 
> Won't this go wrong if (x) + (y) / 2 overflows?  This may happen even in
> some cases where the correctly rounded value would be in range.
> 

Yes I think it is possible, it actually depends upon the datatype of x.
But anyways, I could make it as below which would yield the same result
as arguments are non-multiple of 2:

#define roundclosest(x, y) roundup((x) - (y) / 2, (y))


> The existing rounddown() already leaves something to be desired IIUC: if
> given a negative dividend, it looks like it actually rounds up, at least
> on some arches.  But maybe people don't use it that way very often.
> Perhaps I'm missing something.

I am not sure about above.

[1]:
https://elixir.bootlin.com/linux/v6.10/source/drivers/gpu/ipu-v3/ipu-image-convert.c#L480
https://elixir.bootlin.com/linux/v6.10/source/drivers/staging/media/ipu3/ipu3-css-params.c#L443
https://lore.kernel.org/all/ZlTt-YWzyRyhmT9n@smile.fi.intel.com/

[2]:
https://lore.kernel.org/all/7e3ad816-6a2a-4e02-9b41-03a8562812ad@ti.com/#r
https://lore.kernel.org/all/ZkISG6p1tn9Do-xY@smile.fi.intel.com/#r
https://lore.kernel.org/all/ZlTt-YWzyRyhmT9n@smile.fi.intel.com/
https://lore.kernel.org/all/ZmHDWeuezCEgj20m@smile.fi.intel.com/
https://lore.kernel.org/all/ZloMFfGKLry6EWNL@smile.fi.intel.com/

[3]:
https://lore.kernel.org/all/20240708155943.2314427-7-devarsht@ti.com/

Regards
Devarsh

