Return-Path: <linux-media+bounces-31320-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D5E5AA0D53
	for <lists+linux-media@lfdr.de>; Tue, 29 Apr 2025 15:18:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D00824863AF
	for <lists+linux-media@lfdr.de>; Tue, 29 Apr 2025 13:18:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E9132D1925;
	Tue, 29 Apr 2025 13:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Qv9dgL3h"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D82014D70E
	for <linux-media@vger.kernel.org>; Tue, 29 Apr 2025 13:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745932702; cv=none; b=ipcQfwZthS9svrm9UkhfqKCVSWFPebNT7aopblaQtX2T/RS9w9H9Uf8OaXzc7G8CYq6c51Hv50GkqcXBo47xi/ZmQPVYpplS+8pFKsWvR8r5sPMC6OYpLgS20PyU7CyKiOm/arOB/WCBx730Xh9HzDVUn03nnCzhpRxhVP24RM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745932702; c=relaxed/simple;
	bh=7GuFmJlJkpyEj+Xz5PCNI0n7N2g2U0yxS9UydMYaeqU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=npCqq5nK5OE3DyXzCTRx5vXYE8pgPM3aU8KBPPE49dHi35cr9MppQQYmGF8aljoTyULeHfK4ZMIarQjY/zQrySjAVmd6AKhTxixro5AOMc5TxgJEmx++zJdOzM4m2B6Je3OVrPGUpWLv9gzRmbPgeIBozrkzKSZyS0prUj5yvi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Qv9dgL3h; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4394a0c65fcso59009035e9.1
        for <linux-media@vger.kernel.org>; Tue, 29 Apr 2025 06:18:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745932699; x=1746537499; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2XlQd2/HEe5mbj/2V1eX51IsWAdpjepiCj86XBPTjGQ=;
        b=Qv9dgL3hUdK1A6yducaIN5zKNYmfXlzrP6Cg/QyhBk/ULdYlxQvgTZMGL0a+65AD7C
         ZIvANg00xgIei4ahZa5fZspLKTD8PKtW7ph8/elCToGs+mvGJw3h1GJJ2+qHdlFfOarL
         ydEkvOE68e8+YDj0qQqgzl9JjrZzKNTuzdM7/A/SH8HvXf1OoScFmjauYRktdZB76thl
         6lz0/MV5Q2tOP5LOrE6RFW+R7DgYBMe8tRahmLiCWkembDMyg042JW1qut2BhDeOIMrl
         yFh+IvfsMJocrMMmynyL7xy8yg1HZEosySjN9IN7z0c5VzruFYXV5hfssMHCn63cj7ZS
         5n2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745932699; x=1746537499;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2XlQd2/HEe5mbj/2V1eX51IsWAdpjepiCj86XBPTjGQ=;
        b=owwEYQMKjdRI//zrPFqYN22PqZMmTM54t5ZmKlER+n88n5mTMWJd07Vwif4DGGiyBg
         3g899+9bY6vjEkbP26KSi9STLEGenb2H0y+W54hqm5pYIwvDHXVl7O3z1Of748KfCCEr
         ayct+iG9PQb5I4xcpU+4YTXkwlnWYDFugYf6KCu/+MezDk+xxA0HzSr4pFcGrA+ikQYc
         LTO4Qd9QT+7dknRvGZhFPWr9c+nyJQv6KrziXt3UnSrwzSHf7lNP5Uh/YizSLPUteVaB
         BUjqSaoOFcp8ocXltVrE7EUWbWa/gmWtBh9THbaUarArHNxKtlPZw7EPsO0PuiNRxD6t
         canw==
X-Forwarded-Encrypted: i=1; AJvYcCXvhi+R+WGxPaz85aja5pZ4b49ryjKzZeVkML7VeDYLFyEZsj2eVzjCeCYM7ydotGd1ONW1xVh77M//lg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzkv2l6VeLvvDwFZPj0ioINS4Bw9VHOy+0QkcIUxnOIOuIzn0B5
	OFqhCRgx+Pmyc40zUqq5kz6YjAvn1NB4n4hdCD/Dp3eEZstvlxhRufGfajiHNOzR43YCGVV14sf
	ycZc=
X-Gm-Gg: ASbGncvKUUOKzyFuOgoXaIkPJJPl2JHDI/yaZS5afzisajNriCDt7YyF39MV8ZXX7cJ
	cBd5l8L+bOyz04p4FAgpg9VEMVdJOTYbzt36Ygpr28s3+wmU2mk5s7TdlhN3kPi1SdiXPTJg3fp
	3JVdZM/KBr4QnwSioivprkObTpo9rA+XXaz85RXRFT0XApGA7tklPvO7TfisaTC+0sTs+DtoaOE
	zDj6/n9kOIw0VbHd+tQpW8FDeXiPzGOc6t3qxSEad6h+cUaI9YgrqbsSiAFooZKizcvytICz9Cu
	Yq5yeO5Qqb+jOsnceuMnuhKrmbG+wiKXsnn46UgbXX58n8JzEsiGHHu3yPZtTiC0pNaPMmCUM50
	LD+SKcw==
X-Google-Smtp-Source: AGHT+IG+VQ+1R+K2OB7YlKrxn+da+IIVh40TXy88JJghKE4J3gyi0OFrpnjF7OqWP2RlC1qDNZ6eCg==
X-Received: by 2002:a05:600c:4e51:b0:43c:ec28:d31b with SMTP id 5b1f17b1804b1-440ab79f582mr146937895e9.10.1745932699387;
        Tue, 29 Apr 2025 06:18:19 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-440a5310ad2sm155816935e9.21.2025.04.29.06.18.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 06:18:18 -0700 (PDT)
Message-ID: <c5cf0155-f839-4db9-b865-d39b56bb1e0a@linaro.org>
Date: Tue, 29 Apr 2025 14:18:18 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/6] media: dt-bindings: Add qcom,qcm2290-camss
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: rfoss@kernel.org, konradybcio@kernel.org, andersson@kernel.org,
 krzk+dt@kernel.org, robh@kernel.org, linux-arm-msm@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 dmitry.baryshkov@oss.qualcomm.com
References: <20250423072044.234024-1-loic.poulain@oss.qualcomm.com>
 <20250423072044.234024-6-loic.poulain@oss.qualcomm.com>
 <20250424-versatile-brown-chowchow-dfc4a9@kuoka>
 <CAFEp6-0iXCPn80Y0s6Hoq2MjgNa+OYJEr0oWSKuXtah_OF6cAQ@mail.gmail.com>
 <e82a8733-a3b9-43de-9142-7454bc57474c@kernel.org>
 <CAFEp6-3EA5dQJCsZYaqr_ySV1hV7kY+53jTo9ZaX6kx3rq7LYQ@mail.gmail.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <CAFEp6-3EA5dQJCsZYaqr_ySV1hV7kY+53jTo9ZaX6kx3rq7LYQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 29/04/2025 14:08, Loic Poulain wrote:
>> OK. This however starts new questions: why aren't there separate nodes
>> for the CSI PHY controllers? These are separate blocks with their own
>> address space, own power rails, own interrupts and own clocks.
>>
>>> (both of the above are supplied together without individual control)
>>> - VDD_A_CAMSS_PLL_1P8
>> This does not need voltage name then.
> I've been trying to follow the various threads on this topic, but it
> seems there's no consensus yet. So wouldn't it be more practical
> to use the regular/simple bindings, similar to those used for the SM8250?
> - vdda-phy-supply
> - vdda-pll-supply
> 
> I understand that more complex bindings, including voltage, CSIPHY
> index, etc., are not necessary here, + this will likely be replaced

The thing is we know that a single rail for all phys is not correct.

The choices are

1. Continue on as before
2. Do something interim re: my proposal on
    csiphy#-XpY-supply @ 0.9, 1.2 and/or 1.8 per PHY
3. Move to defined PHY nodes like just about every other PHY in qcom let
    alone linux -> dsi, usb, ethernet

Its pretty clear from the DT people which way we should go.

So, I've already started working on making individual PHY nodes based on 
our recent conversations.

I think tbh that we should push merging new SoCs and just solve this 
problem outright.

We can aim to merge the remainder of x1e, as well as all of qcm2290 and 
sm8650 for 6.17 then with the new PHY structure.

---
bod

