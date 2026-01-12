Return-Path: <linux-media+bounces-50432-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A03D3D11D82
	for <lists+linux-media@lfdr.de>; Mon, 12 Jan 2026 11:25:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 17B0B30AE7A0
	for <lists+linux-media@lfdr.de>; Mon, 12 Jan 2026 10:21:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 943A92C235B;
	Mon, 12 Jan 2026 10:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hdh8Voq+"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 093F62C08DB;
	Mon, 12 Jan 2026 10:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768213282; cv=none; b=PuWkLL4BpnnsqrCUL7SJsV+ne1M/fMfYW/xLxZpZz1HFaTk4aPaVAYcyefDHnDh9UeARhEgRMJ+DUkWtF27F3ymHVzmhwLN5MCYUkRz5Wat1uxFSAmCw/Iy0o4VWsVfP39ETOo89xZ27Cti8qyjDC5hovz3gPKmIDlKeo3MU+sM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768213282; c=relaxed/simple;
	bh=vKpPUMFC3eUJI4SvcRU4rRlFHOT+XJ6WHhXufn8wyxY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WLQhXHtPRIEQqEHjWnN+nXLalVJB60Zny31VPTeMKFLI5/N9A7FIJQ8nr1b4PrP7xPD92LV2OccFJqHOzb5GVasxX+EKWqvdVMBBTIMZQdGyuyuwoZQZAcpjEon9LpACey+dvYO1Gc1bQFcM30R2BSlOVI5fk6zeVPSwEzHRYf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hdh8Voq+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3880C16AAE;
	Mon, 12 Jan 2026 10:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768213281;
	bh=vKpPUMFC3eUJI4SvcRU4rRlFHOT+XJ6WHhXufn8wyxY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hdh8Voq+G1ydir0FkSuc030n9G+x3CGwUMKApFrTxKQVLdjYLPgVhAkngzD/WiUzE
	 u7dD+OciUQyDuxNchDH0jxFAI3t+wfhdc8mArdf5AbP7kHEkeSIT+batUK2sJpiTLN
	 t2g4PCNSXXeMFm+5Adp8gSrBZVXdeh1ePSJJbWcfiWX58zytYAeghEHfoQer2qS4Mb
	 0UP53Av1WGY/Qq6CgfR7SfmusNnDkeq5MOh/qiCSRLumrLCk1xPdZy5oO+9TIN/3By
	 U1yh7bXmbMUkJg4phR6attqW4rqk8AWGD4otOXwmDJCpUzLvgiqagSu5IA5jdh8v7G
	 p1uIDnRjsr7og==
Message-ID: <ca5e24d7-94ea-47f0-9e02-cb6ecb3b9b24@kernel.org>
Date: Mon, 12 Jan 2026 10:21:18 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] media: i2c: imx412: wait for NVM read (T7) before
 programming mode registers
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: mchehab@kernel.org, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <tjF2Z2nt6dR-T_d-5cSpzZqItgoMsUzNmUBQ-jucG9SMQ9Q4y9cCrW4aya-hRJR0dQG-q63OBmZajTWMbxfeUA==@protonmail.internalid>
 <20260109044913.3310-1-wenmeng.liu@oss.qualcomm.com>
 <dc68db73-163e-4443-b334-31e2ae529e99@kernel.org>
 <1344ad43-a4c4-4e37-ae4e-eddd2c577b3f@oss.qualcomm.com>
 <aWS5qIA1Hfrr-3Yb@kekkonen.localdomain>
 <Q_aYRmvRyFExck1x7KCq3R5cFB8HTgFftErKAzEIWCCKIgXQuS1IZxzlbX7RbGoZ0M-IGKyellEXIdniJzgQcg==@protonmail.internalid>
 <468ce093-7704-4497-a538-c54baacbd8ae@oss.qualcomm.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <468ce093-7704-4497-a538-c54baacbd8ae@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/01/2026 10:09, Wenmeng Liu wrote:
>>>> This delay should go at the end of the operation that requires the delay
>>>> not at the start of the streaming operation.
>> I would have thought that, too, but I understand there's an issue with an
>> Arducam module. It's also not exactly clear to me if all other registers
>> are writable at the sensor identification time or is the required delay
>> only concerning starting streaming (I'd hope so).
>>
> Hi Sakari,
> 
> I tried adding a read ID at the end of power_on func and found that it
> could only read the ID during probe; subsequent attempts during stream
> on would fail to read every power on read.
> 
> [   11.298460] imx412 2-001a: read reg chip id: 577
> [   11.310703] imx412 2-001a: read reg chip id: 577
> [   35.392396] imx412 2-001a: read reg failed ret = -5
> [   39.583990] imx412 2-001a: read reg failed ret = -5

This "smell wrong" points to the power_on() sequence not being correct.

You should be able to read the identity register at the end of 
power_on() every single time, if not, power_on - isn't working.

In fact, looking at the power_on() sequence, I'd say we should have put 
reset 1, switched on power, and clock and then taken the part out of reset.

You should be able to put exactly the same delay into power_on() and 
have the same result as having no delay in power_on() instead having it 
in start_streaming().

Are you sure something else isn't happening - a reset line, pm_runtime .. ?

I think either power_off() is happening without you knowing it or more 
likely the reset line logic in the power_on() sequence isn't correct, 
which is why detecting the chip then fails.

---
bod

