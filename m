Return-Path: <linux-media+bounces-26889-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FC5BA43429
	for <lists+linux-media@lfdr.de>; Tue, 25 Feb 2025 05:34:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C44581678B7
	for <lists+linux-media@lfdr.de>; Tue, 25 Feb 2025 04:34:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EFC81885B8;
	Tue, 25 Feb 2025 04:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="Nn/qGNw8"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4266D4314B;
	Tue, 25 Feb 2025 04:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740458049; cv=pass; b=T1Inc91pnYXYPzfcdEg2o1X77yZfjEBOXRXp0Z4M4fZLc81WRKFw7DWZOih+pfA58rpBUOV65buE8+WTOlPrl+iXRKryY2IKsHtuYGdSnDFFIXY+BP0nvwtvMVAdAH5wHvhNoRjJiWOijChunW8oT0e4bhuHlqyoliessLBmWaA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740458049; c=relaxed/simple;
	bh=gTe5v8l1VH5gFAihYrwP2eBOVzREeDC09z/rFJ76vwI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uOMkJ4r5lDmxvxJ1milYJIlLWna38QumctJawBAzNfcZ84s0hzbmVtm4gtRA5PtAB4pPc+oiyyB5R/Zu/I+S27IMxRRew8rb+kriyh9Kuwq5wwlg6kPz7ybJoO2mfkQ6daEu2ZmxhIrj6adQSRKPHdTvXVveedaXb1Pf5R/ctOg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b=Nn/qGNw8; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1740457998; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=TXii39EQ5FAcgTEj4t8f8Lscd+8BiUzu0W5uN1Na7ScGR2yEikZAA8ZNqwOQDiYIwG9RU64j6PKsWJNO2cdoQmrOu3vDLCVEEuQ7ATEstXr7UEAlfuRSs5Ie2C2lp4VardGB5SAJPwzBok6e/Qo1xRaWE2ApfR9igji0df96UPM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1740457998; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=7G/gL85HWy7cmw4nvxOEIPjq5uTYWJrzYdeG9NWQ2D4=; 
	b=FLbvR+uuHZ+WIJYV4POO8u5AFVgwVSvFbfwq9WxWHNJbzoeId+haUJ9uGO16NQdYubKazI8GxmkH7Z4qm958/cycUY5GNCL0z2lXbqXrKrr8QBJZCJugKRu0pzhi5hzmoXpx6gBOmCueiXvl6SwJKTGtEoF0nDBgckvaEHx3j6w=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
	dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1740457998;
	s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=7G/gL85HWy7cmw4nvxOEIPjq5uTYWJrzYdeG9NWQ2D4=;
	b=Nn/qGNw8+b8b4bq3FTOoaUXdECu6NGK43rgGUCLotPGDYa4dyqNejQ02vtCiiSXm
	tH5tGCO+N/dYiF3p0XS2u5DuWQSKta/oIxwiakgndhvIUPoOqdpZ5utzEkHHKgXAUaV
	OiaKqWflSGQ08lUG6zzIV0yvDlbb1y+2HTCXI/Gw=
Received: by mx.zohomail.com with SMTPS id 1740457996648580.9844468334069;
	Mon, 24 Feb 2025 20:33:16 -0800 (PST)
Message-ID: <268834ba-f6fe-4f7b-a211-7ee2b8f0bd46@collabora.com>
Date: Tue, 25 Feb 2025 07:33:09 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 4/6] media: platform: synopsys: Add support for HDMI
 input driver
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Shreeya Patel <shreeya.patel@collabora.com>, Heiko Stuebner
 <heiko@sntech.de>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@xs4all.nl>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, jose.abreu@synopsys.com, nelson.costa@synopsys.com,
 shawn.wen@rock-chips.com, nicolas.dufresne@collabora.com,
 Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: kernel@collabora.com, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, Tim Surber <me@timsurber.de>
References: <20250223173019.303518-1-dmitry.osipenko@collabora.com>
 <20250223173019.303518-5-dmitry.osipenko@collabora.com>
 <88b02c37-6741-459b-b966-d6d58d1f9b6f@wanadoo.fr>
 <c30a291b-c81b-4da1-a0ae-270d323b28e3@collabora.com>
 <bc1f5334-b0fb-4e81-979d-feb17886ac40@wanadoo.fr>
 <d13f13ac-1501-4427-b6d3-ee161eeb932a@collabora.com>
 <29687c3c-d983-4d1f-8cde-fde82df84e0e@wanadoo.fr>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Content-Language: en-US
In-Reply-To: <29687c3c-d983-4d1f-8cde-fde82df84e0e@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 2/24/25 22:16, Christophe JAILLET wrote:
> Le 24/02/2025 à 05:19, Dmitry Osipenko a écrit :
>> On 2/24/25 00:11, Christophe JAILLET wrote:
>>>>>
>>>>>> +    ret = cec_register_adapter(cec->adap, cec->dev);
>>>>>> +    if (ret < 0) {
>>>>>> +        dev_err(cec->dev, "cec register adapter failed\n");
>>>>>> +        cec_unregister_adapter(cec->adap);
>>>>>
>>>>> Is it needed to call cec_unregister_adapter() when
>>>>> cec_register_adapter() fails?
>>>>
>>>> Yes, it's confusing, but unregister is needed to free the adapter
>>>> properly, it's prepared to do it. Thanks for the review.
>>>>
>>>
>>> I don't know this API, so you'll get the last word, but
>>> cec_unregister_adapter() does not seem to do that many things in such a
>>> case, unless I miss something. See [1].
>>>
>>> CJ
>>>
>>> [1]: https://elixir.bootlin.com/linux/v6.14-rc3/source/drivers/media/
>>> cec/core/cec-core.c#L370
>>
>> On a second look, apparently you're right and
>> cec_notifier_cec_adap_unregister() should be used there.
>>
> 
> So, maybe in the .remove() function as well?

Nah, cec_unregister_adap shall be used on removal. It itself unregs
notifiers and etc.

-- 
Best regards,
Dmitry

