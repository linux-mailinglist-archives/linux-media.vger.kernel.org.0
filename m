Return-Path: <linux-media+bounces-42637-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D22ABB5A1E2
	for <lists+linux-media@lfdr.de>; Tue, 16 Sep 2025 22:09:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6F8D21BC77D8
	for <lists+linux-media@lfdr.de>; Tue, 16 Sep 2025 20:09:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CCA32DF15A;
	Tue, 16 Sep 2025 20:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="ckISlrv+"
X-Original-To: linux-media@vger.kernel.org
Received: from out-182.mta0.migadu.com (out-182.mta0.migadu.com [91.218.175.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDBA52D9EE5
	for <linux-media@vger.kernel.org>; Tue, 16 Sep 2025 20:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758053347; cv=none; b=cz32lgdCZ+odafTHiWmBBQ7Dvxg7x0+hAQLn3DMUJVKusJ0AgjRDjCx8SPSTyPeWRNFIFyIVPEU62e7q/k+4FjUCzGhJsA4H4MxXdWSmPbFhqK6JQoBcO+rXn1MzdtWapVDwkIu15hLygmu2IE1tSY3Et0WJKTyPhtD7tAt8EzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758053347; c=relaxed/simple;
	bh=CV94P1G6PAbXUYBZXtbDVt4H7gF8ZfJUS0/eyqgvHFM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tag4VhcYFR3+A1zkezKlBx/HTLLDm4IRtM+9Aeqjv91eBjDj3qu/xoqKD611PQEputJ239EVjnmGzf8jqXOm6IoiMcSX9HfbM8cqlRrA0A74G9eEkQdpGIaUT6ad/FFgs54TLTke8xDlVxjGubBnat8a0LLShtWpX2noJU2Csys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=ckISlrv+; arc=none smtp.client-ip=91.218.175.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Message-ID: <fad5cb33-0e7c-499b-bad7-bbdacca8076a@packett.cool>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1758053331;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SHtwMr5+ZMiaqfj6m6kVuvNj2Y2evNdPg6uV1F0bJNA=;
	b=ckISlrv+FoQ3Emync9HM87QOztyL5MLDKkY9+yDg5rpd1E6Ww3PwuRJm35Ehia4bkKowAd
	RN0gXd09gfVm7wC+5FpJgFB+HgT28UfsW3g75d1QknnRK8+uns/q/PGJYyHQLmfKPq1vkq
	87mSGmNshUirOiW4awpGJ+a/q5DVsBBqyiJMROJo1ksT0v8QHUPId4nzqd/V3UyLZh5u3p
	5+E0wGCmSFFhfDIEltrosZZz+EQqVhAnDxVBLTWHpJu1hochZ4wlZDQ2MF1Y8KBnx2CGQf
	TMZ5S6k0dNsy0MBDpEu2GcEMwxuV2wQpqtRzNNENGSA3HAy4PPma1btuMNbVVg==
Date: Tue, 16 Sep 2025 17:08:44 -0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 7/7] media: i2c: dw9719: Fix power on/off sequence
To: =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 Daniel Scally <djrscally@gmail.com>, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250817-dw9719-v1-0-426f46c69a5a@apitzsch.eu>
 <20250817-dw9719-v1-7-426f46c69a5a@apitzsch.eu>
 <aKLZ39IzI_azrDIu@kekkonen.localdomain>
 <550f28a9aa82a28beb35fd3490dbe08928ba9eed.camel@apitzsch.eu>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Val Packett <val@packett.cool>
In-Reply-To: <550f28a9aa82a28beb35fd3490dbe08928ba9eed.camel@apitzsch.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


On 9/15/25 5:48 PM, André Apitzsch wrote:
> Hi Sakari,
>
> @Val, please see below.
>
> Am Montag, dem 18.08.2025 um 07:44 +0000 schrieb Sakari Ailus:
>> Hi André,
>>
>> On Sun, Aug 17, 2025 at 07:09:26PM +0200, André Apitzsch via B4 Relay
>> wrote:
>>>   	u64 val;
>>>   	int ret;
>>>   	int err;
>>> @@ -109,13 +116,15 @@ static int dw9719_power_up(struct
>>> dw9719_device *dw9719, bool detect)
>>>   	if (ret)
>>>   		return ret;
>>>   
>>> -	/* Jiggle SCL pin to wake up device */
>>> -	reg_pwr = (dw9719->model == DW9718S) ? DW9718S_PD :
>>> DW9719_CONTROL;
>>> -	cci_write(dw9719->regmap, reg_pwr, DW9719_SHUTDOWN, &ret);
>>> -	fsleep(100);
>>> +	/*
>>> +	 * Need 100us to transition from SHUTDOWN to STANDBY.
>>> +	 * Jiggle the SCL pin to wake up the device (even when the
>>> regulator
>>> +	 * is shared) and wait double the time to be sure, then
>>> retry the write.
>> Why double? Isn't the datasheet correct when it comes to the power-on
>> sequence?
>>
> I haven't noticed any problems during power-up of DW9761. However,
> according to the commit message, there seems be an issue with DW9718S.
> But I don't own the device and cannot test it.
>
> Maybe Val can provided some additional information.

I haven't had access to the datasheet for the DW9718S, so this was all 
deduced experimentally. By "to be sure" I meant that I literally raised 
the timeout "just in case", not based on actual issues.

The actually important change was expecting the failure on the write and 
not erroring out.

Thanks,
~val


