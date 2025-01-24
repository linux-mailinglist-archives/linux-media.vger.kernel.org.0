Return-Path: <linux-media+bounces-25266-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D4E59A1B6D5
	for <lists+linux-media@lfdr.de>; Fri, 24 Jan 2025 14:34:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 810033AD504
	for <lists+linux-media@lfdr.de>; Fri, 24 Jan 2025 13:34:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6527435958;
	Fri, 24 Jan 2025 13:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="SwyhQR/H"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 436D579C0;
	Fri, 24 Jan 2025 13:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737725691; cv=none; b=lM9GqCu5oor+NITeSeWTl1jwLMw4sL3oEA4IWQUaeL77Dw0iXiGliB71oGIQI7rlFykYH9R0ue+b4ip9kSVMVUTNTq4NrC2GJng+NdVC8UBrL5d0JnjpPobjGz5chzupt3fYDQUAxWFTPYj+bn7lbR2Bt2KpVqbuZzM5IAdwjmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737725691; c=relaxed/simple;
	bh=5DONNukeEmxIRlXdEAqlTxNIsN42ueSRMR00ZmzuspI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IlNEsIrYC/8iOp/71xa5MGZbXTafa03uq7mLfsARzPE9xznNYWO+SWiNyHmygdMKP1pXMpaXjl7Nb9IWVy6sD/8UPoO8O8+j9gHA5WfJRmGdqV9Z/WBNv1MhcuiYmNhOKidx/p/Vka97j6bUce8w7tFkImmoB5R2QI8PVuyrYSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=SwyhQR/H; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 30633465;
	Fri, 24 Jan 2025 14:33:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1737725624;
	bh=5DONNukeEmxIRlXdEAqlTxNIsN42ueSRMR00ZmzuspI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SwyhQR/HggmYkL0ufFa33nJ0XgouEP72yJwDzyKVDSWw1ZThNG68umUxUHNXlyeJf
	 ZsS3FKbFA8+8541Xeh/TZBivFO9oTA1HhZpFYDGgXRsBp+eZmZR5BnCjrPsyt+bmo/
	 jb75RjGZ/bLohm6vtlYFz8TgA3WQWjVKydLw25R0=
Message-ID: <92c7ee5b-3495-4398-99dd-881c704c64c1@ideasonboard.com>
Date: Fri, 24 Jan 2025 15:34:44 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/19] media: i2c: ds90ub960: Add RX port iteration
 support
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, Devarsh Thakkar <devarsht@ti.com>,
 Jai Luthra <jai.luthra@ideasonboard.com>
References: <20250110-ub9xx-improvements-v1-0-e0b9a1f644da@ideasonboard.com>
 <20250110-ub9xx-improvements-v1-12-e0b9a1f644da@ideasonboard.com>
 <Z4fE-qD7QvNiwOeH@kekkonen.localdomain>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <Z4fE-qD7QvNiwOeH@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 15/01/2025 16:23, Sakari Ailus wrote:
> Moi,
> 
> On Fri, Jan 10, 2025 at 11:14:12AM +0200, Tomi Valkeinen wrote:
>> The driver does a lot of iteration over the RX ports with for loops. In
>> most cases the driver will skip unused RX ports. Also, in the future
>> patches the FPD-Link IV support will be refreshed with TI's latest init
>> sequences which involves a lot of additional iterations over the RX
>> ports, often only for FPD-Link IV ports.
>>
>> To make the iteration simpler and to make it clearer what we're
>> iterating over (all or only-active, all or only-fpd4), add macros and
>> support functions for iterating the RX ports. Use the macros in the
>> driver, replacing the for loops.
>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>> ---
>>   drivers/media/i2c/ds90ub960.c | 260 ++++++++++++++++++++++--------------------
>>   1 file changed, 135 insertions(+), 125 deletions(-)
>>
>> diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.c
>> index bca858172942..02e22ae813fa 100644
>> --- a/drivers/media/i2c/ds90ub960.c
>> +++ b/drivers/media/i2c/ds90ub960.c
>> @@ -649,6 +649,63 @@ static const struct ub960_format_info *ub960_find_format(u32 code)
>>   	return NULL;
>>   }
>>   
>> +struct ub960_rxport_iter {
>> +	unsigned int nport;
>> +	struct ub960_rxport *rxport;
>> +};
>> +
>> +enum ub960_iter_flags {
>> +	UB960_ITER_ACTIVE_ONLY = BIT(0),
>> +	UB960_ITER_FPD4_ONLY = BIT(1),
>> +};
>> +
>> +static struct ub960_rxport_iter ub960_iter_rxport(struct ub960_data *priv,
>> +						  struct ub960_rxport_iter it,
>> +						  enum ub960_iter_flags flags)
>> +{
>> +	for (; it.nport < priv->hw_data->num_rxports; it.nport++) {
>> +		it.rxport = priv->rxports[it.nport];
>> +
>> +		if ((flags & UB960_ITER_ACTIVE_ONLY) && !it.rxport)
>> +			continue;
>> +
>> +		if ((flags & UB960_ITER_FPD4_ONLY) &&
>> +		    it.rxport->cdr_mode != RXPORT_CDR_FPD4)
>> +			continue;
>> +
>> +		return it;
>> +	}
>> +
>> +	it.rxport = NULL;
>> +
>> +	return it;
>> +}
>> +
>> +#define for_each_rxport(priv)                                                 \
> 
> it should be also an argument to the macro as it's visible outside it.
> 
> And wouldn't it be reasonable to use a pointer instead for the purpsoe?

You mean something like:

   struct ub960_rxport_iter it = { 0 };

   for_each_rxport(priv, &it) { }

Then we leak the iterator, and I really hate it. I've fixed numerous 
bugs caused by such cases.

  Tomi

> 
>> +	for (struct ub960_rxport_iter it =                                    \
>> +		     ub960_iter_rxport(priv, (struct ub960_rxport_iter){ 0 }, \
>> +				       0);                                    \
>> +	     it.nport < (priv)->hw_data->num_rxports;                         \
>> +	     it.nport++, it = ub960_iter_rxport(priv, it, 0))
>> +
>> +#define for_each_active_rxport(priv)                                          \
>> +	for (struct ub960_rxport_iter it =                                    \
>> +		     ub960_iter_rxport(priv, (struct ub960_rxport_iter){ 0 }, \
>> +				       UB960_ITER_ACTIVE_ONLY);               \
>> +	     it.nport < (priv)->hw_data->num_rxports;                         \
>> +	     it.nport++, it = ub960_iter_rxport(priv, it,                     \
>> +						UB960_ITER_ACTIVE_ONLY))
>> +
>> +#define for_each_active_rxport_fpd4(priv)                                     \
>> +	for (struct ub960_rxport_iter it =                                    \
>> +		     ub960_iter_rxport(priv, (struct ub960_rxport_iter){ 0 }, \
>> +				       UB960_ITER_ACTIVE_ONLY |               \
>> +					       UB960_ITER_FPD4_ONLY);         \
>> +	     it.nport < (priv)->hw_data->num_rxports;                         \
>> +	     it.nport++, it = ub960_iter_rxport(priv, it,                     \
>> +						UB960_ITER_ACTIVE_ONLY |      \
>> +							UB960_ITER_FPD4_ONLY))
> 


