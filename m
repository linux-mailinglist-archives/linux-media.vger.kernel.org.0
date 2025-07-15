Return-Path: <linux-media+bounces-37767-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 244FBB057C4
	for <lists+linux-media@lfdr.de>; Tue, 15 Jul 2025 12:28:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 04EDE4E0726
	for <lists+linux-media@lfdr.de>; Tue, 15 Jul 2025 10:27:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B502F2D7807;
	Tue, 15 Jul 2025 10:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SilQHJBj"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40D8D2D6626
	for <linux-media@vger.kernel.org>; Tue, 15 Jul 2025 10:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752575273; cv=none; b=d+/R3ni3R76gC8I9m3UIm1rAYpDDOvAHwWJxSGIUEs9aukEJ0uI3HsPnpx8NMH7zN09xTTUl5aCdCZFeMwdTmitfvY1mhBgmMA0UvklKQCAK44bBPcDVXCa9x0l5UEjpiw0Tu7vQgsK5qH/ynTXhXI16EkwxSJ9lNxMPI33sYGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752575273; c=relaxed/simple;
	bh=9GliLAWN9yboDvyuwIIOcsrA/WXw2EdBByjduEbn3pc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pYRFqCJ3YPdw4xM5Z8EGOLb5YkhLRPQdxnD6HoVXwhRkETZi2wc1NVOdNFNe2WxNUM4Pb/W0dJDti8NxI0E0wlUA6sMUSIroApeyB7UCIu2/Pj9S0ZuRHIvLpp2Hf4NsWVpHA4Ll74F6H+/YQmYwQp150UwUOkAL8WdhM8q27CA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SilQHJBj; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-55a1da7ee7fso114471e87.1
        for <linux-media@vger.kernel.org>; Tue, 15 Jul 2025 03:27:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752575269; x=1753180069; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i/2pXjO/4cLFhq1C0pbXxCDCYXatFBoRRv1ycMlT/jo=;
        b=SilQHJBj/vOqL2aZ1mynhuBa3YlbWYnp2VWNJYIrwqNE/FiZt8SD2CcZIOup7J7CKP
         cTWeZ8gySjx+ZEZUyrT2d9BaM7Dfq/Zayj8ZB6rlvffMuPzE9p8LTRiaoBseKw2QXuoq
         9ytrGvYbCt+pDQUPfjFfBVWp51uSvffrYeAp76EHe0Wu6IaA0fXhRWWcTvgoEU6aNAIR
         7WQ0XvPJwkoHHHItSF3Euzb7DXAfVh7Xq8yS8FOkcKBlciBoW6Ek3cFPHYMoSCs2zFSP
         2rvnH0eqFUtEvRWTlPBaimsXBLWSd9XJsIK0mTOhi8FUK1A3o6dm5A6gHbOJulrhG7dE
         t4Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752575269; x=1753180069;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i/2pXjO/4cLFhq1C0pbXxCDCYXatFBoRRv1ycMlT/jo=;
        b=peobaQUe7SYgw/fLIBMxj4A33mPFBMxwYOdgpZg2Lx76sniLvmICkFZ+U5iVW7B9gr
         QPj602pdJGYiI7d/66ibCCdhP8wmsMzzdLeFIx7Qog2EN78yZLQJ5gpmIFRaC0Celbnf
         vgArD95x1nwemcTLcJa3enDzuNcJDlWw0wTWvKE7ttL40E1MqPh+Hssj1UzuVF8/yobV
         jPyKcquMMQ54oQYrrGVZexUbBWJ2wympDxeIBENpcF7smyLBoQnjYjxdu1cmfD1hHJos
         /krRCoiR0eQVdgPWuih6FeKXi9DTLanAUPVVIupw2g7DBhrz1fC7VoCNIPbjANfkLYqb
         3RQw==
X-Forwarded-Encrypted: i=1; AJvYcCXkvIzpfTdszS8GFoVWfiKg76hUkLyYIPXQmwVhvA2K1zQvdx6XX+jbicwSLom2z/1+1f08AKkBZa1scw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7U27KhNTVQ5xTIAEq/ke94x213xutJi4z2kO+T3JUg5NMNm8J
	wuW5x6oGjLkV+QNrU6+iKT0idFYPkW4kjU9Q5vuy4/TS5AM0DpVQsTujJGJ9ASHviPE=
X-Gm-Gg: ASbGncvYzQZYMpQCIiM8uZJjpz6v8h0+n/jLnWOc0hp8GGNUcMS/veUUg5gXUe3w6mg
	hxkhBuwrN5u3AH97+v7JCznCJXm8Wl3CgHkO07IWZBpDV4yi44Qqt+5LsPXXBEyQXgvSrAPziqV
	+D+FZ+LP+fTSDGoGOye3c+uKBGo4TQkoT01a4d6Ma/uzlq/dngX2S3ftRADSu01YEhnVX8hsrGM
	npRYJRiXHaikD26rd51A2Arf+TcpxrX32EDnKBiPUskUjgZE9h4zk7gZnDILpD1zZnkwHGnuwlV
	NMDi2mkUWD9fiLoL/X1S2o/zbQMJLE+VFv+vBQW/WZfl5BrDLY1VNaOSvgtPAPWqmvstM6RE0b3
	qjX7Eg5iQzooghFFh72As+uLKdk8+9ZDH9yqfrDdoKlIGXPGOsTByYHs04MUZ2YIOMNdJwSO3xC
	fUzlzRl+0scw4=
X-Google-Smtp-Source: AGHT+IGB+l68nNmN+r0g2875eUAVEOWrNNxT+B1p1QscYHqf8lqIHRGyo9DMLsNHAwQ5NssRAlfp8Q==
X-Received: by 2002:a05:6512:e88:b0:54f:c2ab:c6be with SMTP id 2adb3069b0e04-55a1fd90378mr115569e87.7.1752575269207;
        Tue, 15 Jul 2025 03:27:49 -0700 (PDT)
Received: from [192.168.1.100] (88-112-128-43.elisa-laajakaista.fi. [88.112.128.43])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5593c7bd725sm2259718e87.14.2025.07.15.03.27.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Jul 2025 03:27:48 -0700 (PDT)
Message-ID: <a4ebdf5c-8d4f-4994-afd9-22c8d889fe97@linaro.org>
Date: Tue, 15 Jul 2025 13:27:47 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 00/15] Add dt-bindings and dtsi changes for CAMSS on
 x1e80100 silicon
Content-Language: ru-RU
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250711-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-0-0bc5da82f526@linaro.org>
 <9361e954-e2c9-41c6-be4c-12b0e4f367f5@linaro.org>
 <ae0a309f-7e52-4d3c-8f26-989f22da5b07@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <ae0a309f-7e52-4d3c-8f26-989f22da5b07@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 7/15/25 11:48, Bryan O'Donoghue wrote:
> On 15/07/2025 07:53, Vladimir Zapolskiy wrote:
>>>     Finally I believe we should contine to have endpoints go from the
>>> sensor
>>>     to CAMSS not the PHY as CAMSS' CSI decoder is the consumer of the data
>>>     not the PHY.
>>>
>>
>> 1. This is an incorrect assumption, unfortunately it was not discussed
>> previously for whatever reason, good news now it gets a discussion under
>> drivers/phy changeset.
> 
> Perhaps you can explain why ?

It's quite easy, sensors are not connected to CSIDs. Moreover data flows
from any sensor can be processed on any CSID, there is no static hardware
links, which are attempted to be introduced.

This is a similar review:

https://lore.kernel.org/all/427548c0-b0e3-4462-a15e-bd7843f00c7f@oss.qualcomm.com/

> Taking the example of other setups similar to CAMSS I believe as laid
> out above we should have
> 
> - Dedicated CSIPHY nodes

I see no problem here.

> - Use the upstream PHY API

I see no problem here as well.

> I believe individual CSIPHY nodes and endpoints from sensor to CSID are
> more consistent with established upstream schema.
> 
>> 2. The whole new changes for legacy/new CSIPHY support is not present
>> in v1-v6 of this changeset, it just appears out of nowhere in the v7,
>> and since it is broken it should be removed from v8 expectedly.
> Broken how though ?
> 
>> It's a pity to realize that instead of providing any review comments
>> for the CSIPHY support series sent to you one month ago a lot of time
>> is wastefully burnt on a broken by design change development.
> 
> I've been working on this on-and-off since the end of April:
> Link:
> https://lore.kernel.org/linux-media/c5cf0155-f839-4db9-b865-d39b56bb1e0a@linaro.org
> 
> The length of time isn't a good argument to apply a patch but, of course
> its annoying.

My experienced frustration is that I didn't get a maintainer's response
for more than one month:

https://lore.kernel.org/all/20250612011531.2923701-1-vladimir.zapolskiy@linaro.org/

> The rationale here is:
> 

A stitch in time saves nine.

You may start now a technical discussion right on the series above, then
I will make my best to fix any issues and send v2 following the regular
development process.

-- 
Best wishes,
Vladimir

