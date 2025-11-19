Return-Path: <linux-media+bounces-47361-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E9A66C6DB2C
	for <lists+linux-media@lfdr.de>; Wed, 19 Nov 2025 10:25:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id C3BAC2E0CB
	for <lists+linux-media@lfdr.de>; Wed, 19 Nov 2025 09:23:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE2C633CE87;
	Wed, 19 Nov 2025 09:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="liVwAC0G"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31ABE333422
	for <linux-media@vger.kernel.org>; Wed, 19 Nov 2025 09:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763544081; cv=none; b=IVjR1ziWtPIHaXXxq8PPR/EAljj/heSAmenerUbUfWSr25slfbjyEWCye4a46OMhnKnHLoh2SWsZAWF8Rb76yuISM3oQzUh5VWBhLQxlQ5jOhrZDsCox/huRUZFJvNOKG3CXRDCTufUgXM5osS4txOpsl6mVtLq/Gee2X/FOZnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763544081; c=relaxed/simple;
	bh=ysHoD2V6QmDrsbZxLhHBQRVYzpYnrirbcyD+E9hQgAE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OD6XMygsXWaEv0ZzzvAinNxQqVFuqe0q1X0UgFk3nKTu26wlzJdj/J3B1d3HUH+2Mc2PuXSZf9cN3j5iN1fqqcCPmt+dW5hOCx48MNnb5X+qDm8UocecOMSYAI4WKbkXncKwfMymD9kUdp37G8QvE+rBMnhEEf9p7TDd76TOVAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=liVwAC0G; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-477b5e0323bso1724915e9.0
        for <linux-media@vger.kernel.org>; Wed, 19 Nov 2025 01:21:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763544077; x=1764148877; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=njTxfWaQF2JlsHc74k37zSym9rCLYQzSeRXrqIHcEO0=;
        b=liVwAC0GIUrWk+8kijzAAs/rDtCgj6bxIhNgTni7XZIqbjLpfiZqwM+z/LKHVB6iym
         rI9qkk+mVG2friRZgGaj50jZaE2wnK7jW6o9rNLzckrYkfXeOMdN9v9Zh3eOu+Yqou/d
         QGRm+bzbIVSnJBwLJY4nYzHgPcl6szF5gZX2JFqHQ4Cwp2OD1DYL4PESb9UGKmr+YsfO
         e2VHGAPqPch9udQc70eTJtg9uv6DhP4fiUTAkZo15PuW2eDvZ7hzeE0iSKeFoREY7xT/
         TjOA1Li49JhifsKmpLZFuHyZ/SG30Sbmi4qOB0y9W/tBYrS2sKQFSQphubxpjGI5Xmcd
         i0NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763544077; x=1764148877;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=njTxfWaQF2JlsHc74k37zSym9rCLYQzSeRXrqIHcEO0=;
        b=hZVOyxYXn1Lm+I2jxwttCozD//HXRWcBHQ0hc6JE7bVXXmyGf5oAkdJ9RTQiI1S8WD
         /sw74/dCELEeTY2ta8Lguv5vQbcPVUkCQV8qTzuBLtNIroNL2Kb0xcnY0O6SQRV5UdSH
         WyYbhO6xyvliC9Tm1S5h8QnXJas+dnrVTm6HeUy2l8A79kGPNwDsUezmPHV9z5KI8O5h
         1GkfIpCz7cBpxikVlulbpqGdHVoPEN9KqnT0fEZXmIcgiPDvicocIF7YKaJKClH8+R2m
         WX6oD/tNadu8LhlyQ9ryjJT5+ud72jn6AKgw2zwyTmoC9vfwUTIkrZ3boNNfa0NOn71E
         ud6g==
X-Forwarded-Encrypted: i=1; AJvYcCVLxdyU4rryCGJmMmTolNU/LuCdA21UzzlDBFa0f1Y8TCUXO09Au4mG6BdHElfvAqpaWJUhLt/szhKiDg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwXTGLLgn/M9lM/whJnHYd/orCsTnjq0eW3pOmyuBc6WxhACwTJ
	kNXH4lvEUjAEpgw+SpaUP5W9rC1xdEmjFyTBksJdJtroIrHh8pZVx2R9IykTWDuMB78=
X-Gm-Gg: ASbGncunHN2ouwG9pjyIBvKnjs3/Xm8UHfePdwkacDOLhf9Sl+WMdMj71w0E5r5GHio
	EWZ7ZOfTsyri29q8XU8U8eDNNMZEyoKW/qlQJYlfgf5LQ23LOgb7RjHsAYGt00Vt7GuQaL7P8BS
	/O6wWe2Ko/9UtuecbBIq+VTZ2bszxd0uGP+UM+o+tjSAWydL6ZGvBY7RbR3fDsIZZ6u7bDJz0j2
	VJno13Qoz+qnUhpwh5M104p/0F1OYxmblVoWfN4/io1t1UeAobohu96PQ8S9NTaazOmCEmLT/Ah
	8dgsOTILn2rsQ+tmJSW4Q4yXuskLnxTdr79x8xtZCYOMK3jux3eISABwDmsDCUQuMkCyxXsqn56
	NRpSZR8tGxqCXaRbIwonpnOgLbEoeug6G4gaRwABsCEYfhOEDSOA3r/YIZbrW/npYYRlfFAfV3V
	ljfsDzlDC+zQuh9JD+ZWRb1a7PPIzvKebfP1opkQINr3+DXOezp4An9f71XvezTz0=
X-Google-Smtp-Source: AGHT+IHmsjj7F7wNvxEVFVBnZtV/69ZlLKN5HcQfFKyy5s5hRiqe2uifjwwdJXNEwrLRP0KbzoOJGQ==
X-Received: by 2002:a05:600c:b93:b0:475:ddad:c3a9 with SMTP id 5b1f17b1804b1-477b18efb58mr17616265e9.13.1763544077488;
        Wed, 19 Nov 2025 01:21:17 -0800 (PST)
Received: from [192.168.0.27] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477b13f53f2sm32651735e9.1.2025.11.19.01.21.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Nov 2025 01:21:16 -0800 (PST)
Message-ID: <fa8ddb59-079a-41c8-b75d-c7a9d40e7da3@linaro.org>
Date: Wed, 19 Nov 2025 09:21:11 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/5] media: dt-bindings: Add CAMSS device for Kaanapali
To: Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
 trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
 Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
 Atiya Kailany <atiya.kailany@oss.qualcomm.com>
References: <20251113-add-support-for-camss-on-kaanapali-v6-0-1e6038785a8e@oss.qualcomm.com>
 <20251113-add-support-for-camss-on-kaanapali-v6-1-1e6038785a8e@oss.qualcomm.com>
 <bd899586-f714-4d2e-95e3-6abf124e75a4@linaro.org>
 <37d0f89f-69be-45a7-90fa-347d6a3800bf@oss.qualcomm.com>
 <2d7ac7e8-ab69-44a6-b732-3657abf3a5a6@oss.qualcomm.com>
 <1f320bc6-ba7b-476a-b9fa-b5333f66530f@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <1f320bc6-ba7b-476a-b9fa-b5333f66530f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18/11/2025 21:45, Vijay Kumar Tumati wrote:
>>> Hi Bryan, HLOS does not have access to those registers. They are 
>>> configured by the Hyp.
>> If that's hyp, please add them. We already have platforms without
>> Gunyah. Remember, bindings are defined once and for good and I wouldn't
>> call it impossible that someone would want to run that configuration on
>> Kaanapali some day
>>
>> Konrad
> 
> Sure, if that's the standard. But even on systems without Gunyah (say, 
> KVM/PKVM), these will not be configured from HLOS in the regular flow. 
> It will be done from TZ.

By the bootloader/s or by runtime TZ app ?

---
bod

