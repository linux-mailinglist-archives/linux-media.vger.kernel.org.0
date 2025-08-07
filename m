Return-Path: <linux-media+bounces-39058-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 89FC4B1D9CA
	for <lists+linux-media@lfdr.de>; Thu,  7 Aug 2025 16:17:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A5136584A42
	for <lists+linux-media@lfdr.de>; Thu,  7 Aug 2025 14:17:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 679C41A2390;
	Thu,  7 Aug 2025 14:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="a3JgVtHg"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 136402B2DA
	for <linux-media@vger.kernel.org>; Thu,  7 Aug 2025 14:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754576238; cv=none; b=lx1PLrbG6MnlJNZvugJ/RHDYXxSY3SJSiXBvgAZ0eXDK27vUNPwxtShmd9vx3UM/5aFajfurCm8RA1Z+xsGjp3SkKRqgTZ0iMWEYsTgyZ2g/2gYcVsK9MJlmtdi0HFBv6rdRk3LSYbQHhiC6Qe0FhYfSIsxSI2HAHbsus4ZYljg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754576238; c=relaxed/simple;
	bh=J8ImUBo6k11PmLTRi9ueapBPrpFIObd3Z5925Bgdke4=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=bccxuKu+YRwDh0N5qGRFkaIsyMV7G9BB0hRe85BIFV2dN5eZW5bOxWui9zLfa6xUZ9fnfNEHmA9uWr0BTzZUsZSichFDTOeVGWsC0FfIDqjmnWQlitMian3yx10236TUw26s2S8FmuAnILs6wh570GUcL/MwwiOeSGmpGxjoikg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=a3JgVtHg; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3b7862bd22bso1076288f8f.1
        for <linux-media@vger.kernel.org>; Thu, 07 Aug 2025 07:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754576234; x=1755181034; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5DMkxCmKEcDzAQwWDeiQkackfhplB7h7dFl1ES31WYs=;
        b=a3JgVtHgE05Y2/8YHSse7V//BxupdCTBLBfdsfzeI1lkH5JZUfqonEW0R4JsXf/2pv
         vH4bLPWFzjLESKdX1V27RQQ4MTku9zSymn8vEkjDL3TlQNajfDtuOVapYjscWTduJcpU
         twCjDK1GGCp3eRjHJIseylLAJdhYmS800vise2j6mi84pxJBCHNVToRnilqc8ZxsXssX
         JHfyJSArrbciZ715J4vA9po8XG39h4XB0YYvo6ouqo7kB2nALeCFQJj5pAl9wgJhgwz0
         wLMoU3WjS1XrNsLQNMp/rbMqDa0gIyscU/ch8IbjJCIz+4y2G6DuFAJg/tSmyJDZR0LH
         oY8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754576234; x=1755181034;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5DMkxCmKEcDzAQwWDeiQkackfhplB7h7dFl1ES31WYs=;
        b=rnoAYAyTBli7kQMOjpOqHTwqlrrPUBOorf013Rb4331etk/g2hKgoFjHpWIXroy6GJ
         7pG9hU6tRdWM06Lg6tz87x9pyCIx0RzgJTeOx/FFCp+01xpNPpdgYPQYftMH0skIgxWJ
         tMQs0o85ujGemjMZT49yNFMaynmLOxkAYzZtW9wS69pDwnkaovqdodvovPLDFaNOU9s6
         Jdv67anxnSPDRkSYWD3lD/4qLezqKEFGjH6MvDNsftubOW7DuPg7j6e2YECM9XG389vg
         1fVSu1vnSKEi6oUxv4eZdO7eIj254HpFUNCgYQTe38+7QATD6gPbGPp1XBxdGb6tU2ne
         cXdA==
X-Forwarded-Encrypted: i=1; AJvYcCVpEM4rif9feErrWG68cbwchgn7cpz8sPqlKyvEowr+/pnr6LjjIJeSPbSEgi7zTbr9Zb2IAlEV7u8wyA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyvK5JiaajYQxsG3Ci5lpOqdq5VBP/m6ABVTHSDeSv1Tki3Nh9V
	hPFzS3Kk98LS34Todhbgu9Tfi+iIPJTdeKu8avx7vwsPyy8xy9mvKaADT84tLsCFUrE=
X-Gm-Gg: ASbGncu06rtAPaJym/vt5kMi+/lHxeDZkspy9kqJIUK1MlyoEYSOLcJo9tOojWZaeA8
	ybHUMT4YtD1HqLxvp/LfJZKlmv5/JnLMpVP/VYW8T8nzsBnAwLqzfbLz52F+JJQ4Oh+XtG26UL2
	SATo7EV2LBaO1hrznhlzRdE6JEuwxVaA6KD1Gy3LAT+SkWUa8YyFr9DQK2Om7ThyO5wBWOSvxme
	f/TImQ93aSXkyHbKv0RoI/4LkBTU7s/kJ9oLU6Fhy1Oebrsvzqd8YYC/wTrOLIehyeell5bJNTV
	dGQUbP6UAIaSrYef59OEj3oSR2FkAaHtSlZ1PaD3xrq9FNMMb5J0kqCbH27YP3eVppnpN+60Skq
	oU2A+H+6QMPp+KZIx3urCGz23O46SW6mbztyXcqd2ktzZbROzwf/hXQH/b5PMtBfaJUfYSpWQgC
	U=
X-Google-Smtp-Source: AGHT+IFz6uCC0YYRe9nWXy3/iGewWRQEgH33Nf36nFwo6jhM8HFNPyL4Wp6EentkfsIY4v5Ki9fvjg==
X-Received: by 2002:a05:6000:2c01:b0:3a5:8991:64b7 with SMTP id ffacd0b85a97d-3b8f97f50c7mr3782203f8f.26.1754576234128;
        Thu, 07 Aug 2025 07:17:14 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:5bf9:b40c:d741:ea95? ([2a01:e0a:3d9:2080:5bf9:b40c:d741:ea95])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c4533f1sm27292199f8f.42.2025.08.07.07.17.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Aug 2025 07:17:13 -0700 (PDT)
Message-ID: <eb42d052-1fe0-49a2-9a83-05c5a5b7394e@linaro.org>
Date: Thu, 7 Aug 2025 16:17:12 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 09/10] [RFT] arm64: dts: qcom: sm8250: extend CAMSS with
 new CSIPHY subdevices
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20250612011531.2923701-1-vladimir.zapolskiy@linaro.org>
 <20250612011531.2923701-10-vladimir.zapolskiy@linaro.org>
 <dcc33f04-1b19-47d7-aca2-03d38173b6b6@linaro.org>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <dcc33f04-1b19-47d7-aca2-03d38173b6b6@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 07/08/2025 14:37, Bryan O'Donoghue wrote:
> On 12/06/2025 02:15, Vladimir Zapolskiy wrote:
>> Following the new device tree bindings for CAMSS IPs introduce csiphy2
>> device tree node under SM8250 CAMSS, which allows to perform camera
>> tests of the model on an RB5 board with an attached vision mezzanine.
>>
>> Note that the optional 'phys' property is deliberately not added.
>>
>> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>> ---
>> For testing only, do not merge.
>>
>>   arch/arm64/boot/dts/qcom/sm8250.dtsi | 14 ++++++++++++++
>>   1 file changed, 14 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
>> index f0d18fd37aaf..401a32679580 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
>> @@ -4613,6 +4613,10 @@ camss: camss@ac6a000 {
>>                            "cam_sf_0_mnoc",
>>                            "cam_sf_icp_mnoc";
>> +            #address-cells = <2>;
>> +            #size-cells = <2>;
>> +            ranges;
>> +
>>               ports {
>>                   #address-cells = <1>;
>>                   #size-cells = <0>;
>> @@ -4641,6 +4645,16 @@ port@5 {
>>                       reg = <5>;
>>                   };
>>               };
>> +
>> +            csiphy2: phy@ac6e000 {
>> +                compatible = "qcom,csiphy";
>> +                reg = <0 0x0ac6e000 0 0x1000>;
>> +                clocks = <&camcc CAM_CC_CSIPHY2_CLK>,
>> +                     <&camcc CAM_CC_CSI2PHYTIMER_CLK>;
>> +                clock-names = "csiphy", "csiphy_timer";
>> +                interrupts = <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>;
>> +                #phy-cells = <0>;
>> +            };
>>           };
> I don't think we should make this change, for CAMSS in general and specifically for sm8250.
> 
> Instead I think we should go this way:
> 
> https://lore.kernel.org/linux-media/20250710-x1e-csi2-phy-v1-1-74acbb5b162b@linaro.org/
> 
> With separate standalone nodes, and reuse of the upstream PHY API.
> 
> I believe you have a series for the 8650, please rebase on
> 
> https://lore.kernel.org/linux-media/20250710-x1e-csi2-phy-v1-1-74acbb5b162b@linaro.org/
> 
> and
> 
> https://lore.kernel.org/linux-media/20250711-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-0-0bc5da82f526@linaro.org
> 
> V2 of the CSIPHY above will incorporate feedback from Neil and yourself on adding endpoint@ to the PHY however I think we need to have a conversation about standards compliance at attaching two sensors to one CSIPHY without VCs or TDM.

The PHY is able to setup 2 lanes as clock and connect 2 sensors over the 5 lanes available, like for example:
- lane0: cam0 data0
- lane1: cam0 data1
- lane2: cam1 data0
- lane3: cam1 clk
- lane4: cam0 clk

Any lane mapping is compliant. There some Meta slides about that at:
https://www.edge-ai-vision.com/wp-content/uploads/2024/09/T2R10_Kumaran-Ayyalluseshagiri-Viswanathan_Meta_2024.pdf slide 13

Neil

> 
> ---
> bod


