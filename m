Return-Path: <linux-media+bounces-15652-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 06FB49433EC
	for <lists+linux-media@lfdr.de>; Wed, 31 Jul 2024 18:13:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 372D01C21067
	for <lists+linux-media@lfdr.de>; Wed, 31 Jul 2024 16:13:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6C711BB6B2;
	Wed, 31 Jul 2024 16:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="X34FkXxG"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C79B1B29A7
	for <linux-media@vger.kernel.org>; Wed, 31 Jul 2024 16:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722442374; cv=none; b=Jwv5KDvTXLtMBbkquD3fic1juLl2Bx7ls/c3fJS+nnbQTF8FO7CiFw0YQssfkb3VTFnOU2BGC0FNhXTX34FaqcSfK6BvMnE+GndqHaUO0WLm2vvkFZYcDa4//nIzRXD9zCLoKAX8Lvoflr8Ko34TrfapB5LdvxfQnZfVdtZmqq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722442374; c=relaxed/simple;
	bh=lcvUNumgCBhCs3ZnEWLbZqaFKAe78KO+4wuzawkdRb4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=trnCNFU7CXVTXfWsSyUHzO2g8VAJ0ugqEEILrqbnj1dHwzxXKp9L/tLKWcqBpGGdtqBhrqG3FLlbiVQ/jqOILN/ARauen25l3RSFs1tg/ymiHuZTXDTFHUbpqMdLnw+yAxiTQ4n9CnSrQl47yWnCmFixjvL9dAdlob9ikYmIhLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=X34FkXxG; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3687f8fcab5so2908805f8f.3
        for <linux-media@vger.kernel.org>; Wed, 31 Jul 2024 09:12:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722442371; x=1723047171; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SFCI0LnaWksWB22UjZyIb2fehmTUcMZdYup0ppfC64w=;
        b=X34FkXxGusxDxL42em2EN6Xck3X+CFeb8jBKQsu1Iv5T0O2YCWf96lbJl7Tmt89lIm
         C16yHriA8gWpTvijkhqjm2az/FTX8KBY/wkBkvIKhrbVIBoENoepm+bxxmIbg96fOBOt
         TTflfxEmo1FrW+HZAQXduCoQXuF8UZK52Zj+lF6K+KGufqfHyzJDNogCcsTVB3F5gqmP
         hIUZptPpyCe2Jvo1hj8d6Jg3QMWvxJRKUgPPqz/etN8yBtUpgX6fUwY9e28gBn2COApk
         ZRtTl8haXN4RmJ5X8z8IWFNRwwn0QV6FfMrbeFpbtl365CoLl+8/bnPfTF8frQMJSv4K
         NqBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722442371; x=1723047171;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SFCI0LnaWksWB22UjZyIb2fehmTUcMZdYup0ppfC64w=;
        b=MKF+swCdxldvOPxaG/XdB0SU8nrZTBWNFpzZfS4VW+oyvBz7dsnYOQkPuOUMB0wMan
         pgaPGK3AMR3WAh5Qh7TSr4dYwU8HNEBgvT+4p7/0KC/WXcepUCIon65nMYrfCkkg0oR+
         fWxTxKLEsn/Eyi/bEt6x6DD1ICXbCtcNhebPfLMcWwD4lBIDFlH7kd8Go9hXDuYTjiHs
         4rjsdQCPQtyuOXMMzRXuhCjTIiOfLOwMHqkgyO8izcqxbYaWnzsvoqvaLmMXMZrPVs7S
         9U7NfQcqllIp7foi/MW7RO0L0dRZ8dtyD/8JWyM90Mn+WqXV3+K54YbZAfITSamVs98C
         vhXw==
X-Forwarded-Encrypted: i=1; AJvYcCX5koYzIRimGMQ8EqxIJlb67ZVKTNonRFkT/ukpWj8hdmkBVQTgY4FL7p19ncupHBp99Ly0v5+VicbnOBRK8XNvCaLY9RdzNSFblxU=
X-Gm-Message-State: AOJu0Yx+I8lIDHvFxR0t9MGLqJ/wdOgpgEOqcocQFW1npbl5PJSgbXhX
	8+OZxPlY5xXpHTk5CiBbQpfWlDxmPTs+w95de5hOXNA4+g4CZ5JqUmajjJ1mftQ=
X-Google-Smtp-Source: AGHT+IF+DWlcc1dX7+4UPVxzcygRhJ7q2mfIicdPSInEzXvyqMTrHJh/itAP4iE8MYhf2kbJri77Kw==
X-Received: by 2002:a5d:64ab:0:b0:369:f7f9:9ee with SMTP id ffacd0b85a97d-36b5ceceeffmr13422042f8f.6.1722442370836;
        Wed, 31 Jul 2024 09:12:50 -0700 (PDT)
Received: from [192.168.0.25] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36b367c0829sm17353573f8f.17.2024.07.31.09.12.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Jul 2024 09:12:50 -0700 (PDT)
Message-ID: <bd6f3613-5a96-438a-a2df-cb2728e30c29@linaro.org>
Date: Wed, 31 Jul 2024 17:12:49 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/13] media: qcom: camss: Add CSID Gen3 support for
 SM8550
To: Depeng Shao <quic_depengs@quicinc.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, rfoss@kernel.org,
 todor.too@gmail.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org
Cc: quic_eberman@quicinc.com, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@quicinc.com,
 Yongsheng Li <quic_yon@quicinc.com>
References: <20240709160656.31146-1-quic_depengs@quicinc.com>
 <20240709160656.31146-10-quic_depengs@quicinc.com>
 <1da50dd1-b170-4775-94fc-19a10b7f9c47@kernel.org>
 <4c8095dd-4f96-4b0e-9282-8bdfb5badbc3@quicinc.com>
 <9255b3e4-874c-4919-b50a-919cf0f42f75@kernel.org>
 <3011c561-d39e-4ce5-a544-33f24ca7a67c@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <3011c561-d39e-4ce5-a544-33f24ca7a67c@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 31/07/2024 16:26, Depeng Shao wrote:
> I'm preparing the next version patches, then I find it is hard to avoid 
> such warning if only apply current patch, since this will be used in the 
> below patch, it will be in structures csid_res_8550 -> sm8550_resources 
> -> camss_dt_match, so I need to add all csid_res_8550, sm8550_resources, 
> camss_dt_match into this patch if I want to avoid the compile warning,
> then I also need to add compatible info for it to avoid sm8550_resources 
> has unused variable warning, but the sm8550_resources structure also 
> need to add other items to make it complete, then the driver will be 
> incomplete but can be probed with this patch.
> 
> { .compatible = "qcom,sm8550-camss", .data = &sm8550_resources },
> 
> https://lore.kernel.org/all/20240709160656.31146-14-quic_depengs@quicinc.com/

Couldn't you just add the public structures at the same time they are 
referenced in &sm8550_resources ?

That way your patchset would progressively apply with no warnings.

---
bod

