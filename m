Return-Path: <linux-media+bounces-15199-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CBE08938098
	for <lists+linux-media@lfdr.de>; Sat, 20 Jul 2024 12:02:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4A9771F21DD2
	for <lists+linux-media@lfdr.de>; Sat, 20 Jul 2024 10:02:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD8F67E792;
	Sat, 20 Jul 2024 10:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="UGqLdvc9"
X-Original-To: linux-media@vger.kernel.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0767929A2;
	Sat, 20 Jul 2024 10:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.248
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721469756; cv=none; b=pTPnASwKBqaA/Zu7PYphROZg+2RPHo9stTmhloArBWU9ynR+mWgwXFwGeq0VWHhsfZr2pRFzV8bFqfGxN5FhjXqYa4aDaRusvlP2Wq0RiGlfqZ1cGNlLe6J0RniZqcsuPhvNw8tluN4IAin7ufr5wQVeIngE6H7n2FYpgcaRU4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721469756; c=relaxed/simple;
	bh=TdgC1DumvO3cTlhncpZT+dQdYCgP8kFCxJBqjpYwm7M=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=VwT3zwfzX3c1Anhfkk+s6aY/I7u75oxoN5HrA7bfMkk1eZB2IMfPqLOW8/AmN9T6Bc1IEzqLu3+svZVk6s4Elb9TSbPfEM7tU60dt7+yFCC4NOY+bkQWPjKLct8KAlwhdrawE2hqOxH/CvlLgHlb+eIxz5OKls/A5onYQT1fUYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=UGqLdvc9; arc=none smtp.client-ip=198.47.23.248
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 46KA22Cg066837;
	Sat, 20 Jul 2024 05:02:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1721469722;
	bh=6JTac/kdbI/faRkxndDnZRZM2W2p9sv96m2Wf45ymFs=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=UGqLdvc9md/tR3tkdYoeCFk4555ujsRcpxsB+PFQUSsI3h7+x3LQR8tkp4PWVf+Ex
	 CdfVletzNWBvjJSayOrsg0/TY4v1DRz+2oe7TRR9HHgq7Y/qwGWDngedGWuclvrltU
	 eCyi7zzgDOndNbyp5ZTvrjA9D6+qMZVXGTaiz6rU=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 46KA22Vn004145
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sat, 20 Jul 2024 05:02:02 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sat, 20
 Jul 2024 05:02:02 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sat, 20 Jul 2024 05:02:02 -0500
Received: from [10.249.130.181] ([10.249.130.181])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 46KA1qHA099904;
	Sat, 20 Jul 2024 05:01:53 -0500
Message-ID: <87e07706-03dc-42a2-b3fe-eaae24aa3c97@ti.com>
Date: Sat, 20 Jul 2024 15:31:51 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] math.h: Add macros for rounding to closest value
To: Nikolay Borisov <nik.borisov@suse.com>, <mchehab@kernel.org>,
        <hverkuil-cisco@xs4all.nl>, <linux-media@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <sebastian.fricke@collabora.com>,
        <andriy.shevchenko@linux.intel.com>, <jani.nikula@intel.com>,
        <jirislaby@kernel.org>, <corbet@lwn.net>, <broonie@kernel.org>,
        <rdunlap@infradead.org>, <linux-doc@vger.kernel.org>
CC: <laurent.pinchart@ideasonboard.com>, <praneeth@ti.com>, <nm@ti.com>,
        <vigneshr@ti.com>, <a-bhatia1@ti.com>, <j-luthra@ti.com>,
        <b-brnich@ti.com>, <detheridge@ti.com>, <p-mantena@ti.com>,
        <vijayp@ti.com>, <andi.shyti@linux.intel.com>, <nicolas@ndufresne.ca>,
        <davidgow@google.com>, <dlatypov@google.com>
References: <20240708155943.2314427-1-devarsht@ti.com>
 <20240708155943.2314427-2-devarsht@ti.com>
 <4bf68f34-8a68-458f-9db2-c05b1b6bb711@suse.com>
Content-Language: en-US
From: Devarsh Thakkar <devarsht@ti.com>
In-Reply-To: <4bf68f34-8a68-458f-9db2-c05b1b6bb711@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

Hi Nikolay,

Sorry for the delay.

On 09/07/24 14:19, Nikolay Borisov wrote:
> 
> 
> On 8.07.24 г. 18:59 ч., Devarsh Thakkar wrote:
>> Add below rounding related macros:
>>
>> round_closest_up(x, y) : Rounds x to closest multiple of y where y is a
>> power of 2, with a preference to round up in case two nearest values are
>> possible.
>>
>> round_closest_down(x, y) : Rounds x to closest multiple of y where y is a
>> power of 2, with a preference to round down in case two nearest values
>> are
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
>> + * The value can be either rounded up or rounded down depending upon
>> rounded
>> + * value's closeness to the specified value. If there are two closest
>> possible
>> + * values, i.e. the difference between the specified value and it's
>> rounded up
>> + * and rounded down values is same then preference is given to
>> rounded up
>> + * value.
>> + *
>> + * To perform arbitrary rounding to closest value (not multiple of
>> 2), use
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
>> + * round_closest_down - round closest to be multiple of specified
>> value (which
>> + *            is power of 2) with preference to rounding down
>> + * @x: the value to round
>> + * @y: multiple to round closest to (must be a power of 2)
>> + *
>> + * Rounds @x to closest multiple of @y (which must be a power of 2).
>> + * The value can be either rounded up or rounded down depending upon
>> rounded
>> + * value's closeness to the specified value. If there are two closest
>> possible
>> + * values, i.e. the difference between the specified value and it's
>> rounded up
>> + * and rounded down values is same then preference is given to
>> rounded up
>> + * value.
>> + *
>> + * To perform arbitrary rounding to closest value (not multiple of
>> 2), use
>> + * roundclosest().
>> + *
>> + * Examples:
>> + * * round_closest_down(17, 4) = 16
>> + * * round_closest_down(15, 4) = 16
>> + * * round_closest_down(14, 4) = 12
>> + */
>> +#define round_closest_down(x, y) round_up((x) - (y) / 2, (y))
> 
> This is already identical to the existing round_down, no ?
> 

Nopes both are different as described in the comments, round_down rounds
down to next specified power of 2, but round_closest_down rounds to
closest multiple of the specified power (which could be higher or lower)
and if there are two closest multiples then it gives preference to lower
value as shown in below examples :
 - round_closest_down(15, 4) = 16
 - round_down(15,4) = 12
 - round_closest_down(14, 4) = 12
 - round_closest_up(14, 4) = 16

Regards
Devarsh

