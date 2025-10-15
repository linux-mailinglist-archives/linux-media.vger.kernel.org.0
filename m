Return-Path: <linux-media+bounces-44640-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F8DBBE1088
	for <lists+linux-media@lfdr.de>; Thu, 16 Oct 2025 01:32:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id F18BE4E2511
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 23:32:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A602E2D47FD;
	Wed, 15 Oct 2025 23:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KpVCN8fg"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DF8C2FDC40
	for <linux-media@vger.kernel.org>; Wed, 15 Oct 2025 23:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760571142; cv=none; b=a4vQy/2VmZp+5H21Hmyo8LpTM0z2dgvbb1o1LyFDk5b+mChN7hi0Rhs4lGceLissqEN5nRSzq2lRGSokVfqA6ZVG5RG7nRSljgaihZczNvjdjTu0x/ZWbsglnitUQDjPlpYSuYQO91x20dsjmn5BucKNHXO+vEwB7mbAvsZxt5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760571142; c=relaxed/simple;
	bh=E+hpu09ROQFdd1Em57oWayPsfVLzQBtFlkrFf6LFmYU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fOwmE84QjQL9Afk+qVF56JpjbYlM8EasehN59mxhLlEqzm3uAG8UUIFpWgAymicDvnyTmRH5uLgLqBroHLKdrVw6IrR1PN/S8IRswJuZIbKbBH7l/1lhYDHeZBH2uxMwmQPNQDH+jRkuOSsb5BLmCkVyW3h3OAY12OwhmQGuu8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KpVCN8fg; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-58af7f8b8b3so15760e87.1
        for <linux-media@vger.kernel.org>; Wed, 15 Oct 2025 16:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760571138; x=1761175938; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bpPxh0gcuqDsiBGhGT8nfnZ05AHmMsVAlwdJ8sk5caw=;
        b=KpVCN8fg0eKg+zdhFi9pvlUG710HlDdM9sObq1jqHgTkTO3Ygjm4sKpnY8I63B2aaI
         QX6BGdY0/A/RfprOLYqyuaCrIfVE2N+tpQZ89WJ7BOJUuKOFqBQt3LoXpr5plqKcIk/v
         YBZ5vpfrSOTY4V4JlM2uEqtny6WW9AKCHbxUOniJliz3Aa/4cMgkFk2DUpNuLnUwmc/G
         l1mgpnWyH9J4UcRAy9M8POCKBihBmKBAkG4hqv3BiFYxV0VG6J5sRThHoRwuMZnqiCWF
         j9N6eHE6pf/KM/iuFgf+5bGbCUFiOAhyafIXlYEtgmmRXOkYP7cwAEpSoeoO6jFcx0Ha
         OVZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760571138; x=1761175938;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bpPxh0gcuqDsiBGhGT8nfnZ05AHmMsVAlwdJ8sk5caw=;
        b=DjvPWlFomk6ce10mV4/DG8loeeL+wYXeQdMhIU/HUrstUtlfPQLj3NmjBHCfXJehF3
         iVLM4GW7cWFBY/gZbrBqXDqLVI2xaGkbDEdcjH9/Uhx2M/3I3Q1GXLiYI1pCu1xhSTjk
         iBaMLgSt73MyQf4ff+4uXeJahKU0AbFc60KrrzP67rqiFJWdGXiCMPB5B4coJ5ItKKae
         ghk19mdyZX0rh9GGGkhZ8AfwiABigHkaWxKIMjBqNcQKUtDkmfJUbhpEfxi7e4V6K79m
         fskFaGfFeBRcw8trsVzJ1SAliBP7fqucWLPwqRK5Wr56DV6+r0FAa7rBiOM7CdeJBkHQ
         1FrA==
X-Forwarded-Encrypted: i=1; AJvYcCXIySVICXsPWdbD49mrV8sE47fUS0INw5CKGmz0JVSdnGHK1udaGmwUh258yhC8NKQJrXEs2NRo/QqyPQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwK+0HmMDxSVqwdN/c398PJoID4DsNkd2HHoGvle81mIAWbPykR
	+M5uMXUbUrmTV8mm/wxQEFr8Eoq694nCzT64Lw7oJZjaICWqvWsSKGaj0ttDlJXmUfU=
X-Gm-Gg: ASbGncs527CT99632Yp3cYzm1t/ZmJz7zREFb0Xalp/BQ0qqG7oF3Yflk35Y7KTaGEv
	/OOBw3n/j+K40OoRM30jizfCAVyi/ViL4FDvOfghZgS9R3RRO0VjdqZCkOQwaD6e1uRBRi4XDwo
	2Dge6O+itskgKMTNL3MF+wUZ0IJj42vnp9ETcpgxUqobW4bY4QCRgvavsKecD6yl/AZ84T+EfXi
	ta7GFnJTZ/LFqkszn5T+MSLdNEpeo1BHDMT/e0myHlaR7Cw41z9oQqn48Lt9M9cB5+h7NQJ49QY
	H2a5jHCK2PQn9WxHVkUJiVNGNaJr+xFE1j1/VpX1rugvQdg1To2TZSNckbVH/Y4gNoHaMwdO7rT
	wPaoztRDxjTanLr9Vp4Ew7k/5PH6Rkofjt6wpKOnOaY9TGZIYEwVXrTlxSP2RnnpfsgccgnHH14
	tRKv+faNvSmh4/EpDnS7HKdKhfHE5Sle4MJXA/PTfpt6LHR22TviFHC1mSwu4=
X-Google-Smtp-Source: AGHT+IFhmCfc/iqqM/lx8OD9acToPRRAMIUni22wMDWOAc8jc/Nu4v4J+9jAJJcyPXA90FdVyjEthA==
X-Received: by 2002:a05:6512:682:b0:57d:c562:1f78 with SMTP id 2adb3069b0e04-5906d8ed17dmr5015764e87.5.1760571138323;
        Wed, 15 Oct 2025 16:32:18 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3762e77cc6asm50763801fa.2.2025.10.15.16.32.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Oct 2025 16:32:17 -0700 (PDT)
Message-ID: <a0d9389b-67a5-458a-858b-ffdd95f7ccc6@linaro.org>
Date: Thu, 16 Oct 2025 02:32:15 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] dt-bindings: media: camss: Add
 qcom,kaanapali-camss binding
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, aiqun.yu@oss.qualcomm.com,
 tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
 yijie.yang@oss.qualcomm.com, Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
 Atiya Kailany <atiya.kailany@oss.qualcomm.com>
References: <20251014-add-support-for-camss-on-kaanapali-v2-0-f5745ba2dff9@oss.qualcomm.com>
 <20251014-add-support-for-camss-on-kaanapali-v2-2-f5745ba2dff9@oss.qualcomm.com>
 <dce1018c-6165-407c-8f3d-40859cb36b11@linaro.org>
 <0b6c157a-3d8d-4251-a704-31f8369f6a4e@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <0b6c157a-3d8d-4251-a704-31f8369f6a4e@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/16/25 00:43, Bryan O'Donoghue wrote:
> On 15/10/2025 20:45, Vladimir Zapolskiy wrote:
>>> +  power-domains:
>>> +    items:
>>> +      - description:
>>> +          TFE0 GDSC - Thin Front End, Global Distributed Switch
>>> Controller.
>>> +      - description:
>>> +          TFE1 GDSC - Thin Front End, Global Distributed Switch
>>> Controller.
>>> +      - description:
>>> +          TFE2 GDSC - Thin Front End, Global Distributed Switch
>>> Controller.
>>> +      - description:
>>> +          Titan GDSC - Titan ISP Block Global Distributed Switch
>>> Controller.
>>> +
>>> +  power-domain-names:
>>> +    items:
>>> +      - const: tfe0
>>> +      - const: tfe1
>>> +      - const: tfe2
>>
>> Please remove all 'tfeX' power domains, they are not going to be utilized
>> any time soon.
>>
>> When 'power-domains' list is just a single Titan GDSC, 'power-domain-names'
>> property is not needed.
> 
> Each one of these TFEs powers an individually power-collapsible TFEs.
> 
> This is also so with the other xFE power-domains on previous SoC
> generations.

This is false, for instance there is no management of SFEx power domains
in SM8550 or X1E80100 CAMSS in the upstrem, neither there is no management
of SBI, IPE, BPS, CPP and so on GDSC power domans given by CAMCCs.

TFEx is no more special, if it's unused, then it should not be added.

> 
> You'll need the TFEx power-domain to process any data on TFEx with the
> 'lite' versions being tied to the TOP GDSC.

When it is needed, the documentation will be updated accordingly, right now
it is unknown what a data processing on TFEx looks like, it might happen
that there will be separate device tree nodes for TFEx.

TFEx power domains shall be removed right now, unti; a usecase in the upstream
CAMSS appears to use them, I haven't seen such code at the moment.

-- 
Best wishes,
Vladimir

