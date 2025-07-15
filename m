Return-Path: <linux-media+bounces-37780-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 23E95B05ADC
	for <lists+linux-media@lfdr.de>; Tue, 15 Jul 2025 15:08:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ECE7E17067E
	for <lists+linux-media@lfdr.de>; Tue, 15 Jul 2025 13:08:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD94E2E2F06;
	Tue, 15 Jul 2025 13:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yB0QQ4uf"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 666D62E175C
	for <linux-media@vger.kernel.org>; Tue, 15 Jul 2025 13:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752584905; cv=none; b=eYWDerzIwb747/5xYYeDuLxp1od0siYBgHtgh16YcdHULrpBLKgAuQQ59KnYhIiFig5wbcOh4k9xZOgiNGqLGKXMDVktAh0IzJq99/tzd/24NnhnBYliSO6lNA0U2FTNsTQBMFmOGEFGLT/duFFRizZOO7aa7qCLMayQgXbUFM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752584905; c=relaxed/simple;
	bh=WnK15eyFGnOOiCqP/4GEMlvDMj+juzHnpjX7yiY+mlw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cfpXegGD9NoFdYRkoPNP2ZBDDZhe7ESKHjltgfjT8WIiHG1/Wrko2wfbEnZE1PUe1V1Kh9a5weYN20cHchdmINUrPiM52eH3sjZiua7rUof/cchAtx5wocso4PJ9JIjmVmDfhmEAV1UWst6w6bsptxMSYRg5avS9x/9pHj+395g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yB0QQ4uf; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-32b2f369031so6155181fa.2
        for <linux-media@vger.kernel.org>; Tue, 15 Jul 2025 06:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752584901; x=1753189701; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gq36CP0MCDZZzeTcntw2nMahOQrUrL9LQjFqfs8ZNN8=;
        b=yB0QQ4ufMICg9Tf92uXHeDJK04V4HnNAd700fo/W6dWenTiVqN8T5/1qy84FP3obzV
         20W1i3Wmxl37UmJX2z8+j6Ogk7NOIPFlzAYHPrACh0fbXga+B3GkdP3KG7L8ECoqQajs
         KJpc8TQtkD7wEdcRFpaxi5pxjFVzn8f0r3CwG3LL/C9lzR7mvzBJjsVeNl5xx0dosUKD
         nSRv1RRxFYSBAGFXfNKBNU0CskHhxyC3PHQpPVv0R4Xcf7nFJPqyLyCDmEz37ATAaApP
         Bgg2kx/Zp9Titou62DEjEN1SyJOK1Kmi6TZuQ1M+Xo0YLTOvSfgWXGP4RTDzgm6ILhuY
         ETUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752584901; x=1753189701;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gq36CP0MCDZZzeTcntw2nMahOQrUrL9LQjFqfs8ZNN8=;
        b=REjRuQFzf3Go6Le32iDeNQZF3PM4ty4Qy/rPP7ucPVl9NIoz1qCw86DgK2+pdmPAOz
         HObygjNvdm57EpCe64+VSNDxeVDZ1RM76dGI7UBf1iWaGV7ecRewObDr0ec4mw2tOmf0
         1aCBLBbQfDP3wMNHsgV0/AYGVyxLfDr4ZfjOjW2NXd/dvTe2uqlzs6Q7ZYuzRU24jRSn
         Nv+VUzh+f6RjaPnbIXZH2UX+KeXrjsUSjAnYVJ/k3QbpvZNZg+zZ6IM7QfIpaT2bSlfI
         FpbjYqP4sQJYIayLaXYyrUs7CEh8ZxbdRmf1dVPK+MXw3S381jL4ye1hWcuujsf6LO69
         flsg==
X-Forwarded-Encrypted: i=1; AJvYcCWsLIStDcMMTZ12jGONUyWJWnMsi2UvVP+zk5HcB+XqpOyr1PKveU8W/rWqixICg2isKOMq4sawbJqPSw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyw1z+70LWx6Oub7tSwTueCrDotIuA20zM4qJSVFMtRCAz3sTvI
	XqcLUzlG9X26hLhoMfmH38XksLxIPxADWpLIE23T8DLKaHwu8a4xEE1Zw0iVQu4ym3M=
X-Gm-Gg: ASbGncvjexvY0v8pleNvQi16izyPjFFa5HuFfSDdQaVV+vHiTWVeFWR08csC7YwaLmJ
	Y5+PWwt762nOaklsWQdfoWwuea02OqYmDEM5KZCUjaDxf5Wx33C0xUViK1Q/F00ZZgusZ7x7IE8
	EYXhgAk3KjzfDBePgov4mr7iQW3FO5inrPilGAYM0BIamhzxTs2YWoWzbZof7HPwLkz584X7OE4
	2uA65sCNXQacsUGix4AXunTn4B/g9tMFNsmbpdLKbxVRvubkS6MdCgz7rcXBn8f7L90O8D+Zys7
	/4CpOaQMSbtRH1UM7ZB1uZcXLgfQk+g6ph0nc4GYq096sktlduvtsJk47KUHi21wNe4nOLxfoGo
	3t3KWI82Vl06Si2RKogRzf7jJR5ONvStBtfrVQBD+WnV7FZq7igjupLdH2xhic8ubDRqHOID6uy
	nj
X-Google-Smtp-Source: AGHT+IHMVeoHz8y2i5KJdatSFzaiHdlhoX4K7Fmxq+ulokvZuQc+6Z5CQPHMAkcSdnhIcDc9V2Ge5Q==
X-Received: by 2002:a05:6512:3a8e:b0:556:2e02:6957 with SMTP id 2adb3069b0e04-55a1fdd8762mr204686e87.9.1752584899957;
        Tue, 15 Jul 2025 06:08:19 -0700 (PDT)
Received: from [192.168.1.100] (88-112-128-43.elisa-laajakaista.fi. [88.112.128.43])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55943b5fa81sm2301334e87.142.2025.07.15.06.08.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Jul 2025 06:08:19 -0700 (PDT)
Message-ID: <f753f088-474b-41bb-82d3-6684bea2f87e@linaro.org>
Date: Tue, 15 Jul 2025 16:08:18 +0300
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
To: Bryan O'Donoghue <bod.linux@nxsw.ie>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
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
 <GbVC82h7wSXQsAJh8XybKorKYy9wupjQLndjf_uYNXOZnk1UqS_tT4Yg9gzf8X3Kn55Mt5bXfcFrHtyMoFZ4-A==@protonmail.internalid>
 <a4ebdf5c-8d4f-4994-afd9-22c8d889fe97@linaro.org>
 <4281887a-e7c0-43bc-9e72-96f0e432c58f@nxsw.ie>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <4281887a-e7c0-43bc-9e72-96f0e432c58f@nxsw.ie>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/15/25 14:16, Bryan O'Donoghue wrote:
> On 15/07/2025 11:27, Vladimir Zapolskiy wrote:
>>>> 1. This is an incorrect assumption, unfortunately it was not discussed
>>>> previously for whatever reason, good news now it gets a discussion under
>>>> drivers/phy changeset.
>>> Perhaps you can explain why ?
>> It's quite easy, sensors are not connected to CSIDs. Moreover data flows
>> from any sensor can be processed on any CSID, there is no static hardware
>> links, which are attempted to be introduced.
> 
> This statement is not correct.

Please elaborate, what statement above is not correct?

> The port@ in CAMSS pertains to the camss-csiphy device not to the
> camss-csid device, so there is no hard link to any specific CSID in the
> dts scheme here.

And here it's just a confirmation that my statement above is correct,
so please be consistent, and especially in any kind of accusations like
you've just given above.

Any of ports in CAMSS device tree are properties of CSIPHY IPs, and ports
are not the properties of CSID or whatever is left in CAMSS after the
extraction.

If CSIPHYs are extracted from CAMSS into its own device tree node, so all
CSIPHY only properties shall be removed from CAMSS, like CSIPHY reg,
interrupts, clocks and ports as well.

-- 
Best wishes,
Vladimir

