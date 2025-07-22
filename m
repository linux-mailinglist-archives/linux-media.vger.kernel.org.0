Return-Path: <linux-media+bounces-38211-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0009DB0D6C0
	for <lists+linux-media@lfdr.de>; Tue, 22 Jul 2025 12:04:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D0FC17B445C
	for <lists+linux-media@lfdr.de>; Tue, 22 Jul 2025 10:01:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04EF02E62B9;
	Tue, 22 Jul 2025 10:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="F274qOZ5"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80B6B2E5B3A
	for <linux-media@vger.kernel.org>; Tue, 22 Jul 2025 10:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753178404; cv=none; b=RDH6zgiQ9fUCQEOEiXpWEvs+bRleip5wfFz6U3IORkmaWSifpC3Dh0H7DieyPjZlaVYQctPEdvh5gSZiHnYGp1DaObnDdEYvJn21MBFpTb+ZCYt3c6JCoEx+HkLj90+KMlJz32h4yehPJzmPWsG3WDD/TH1f/oLkxsHw2GvXWjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753178404; c=relaxed/simple;
	bh=l9j2EV2tpH6xu+YOscGGd1tAx9tRjSTtnP2IboucQDk=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=ns7JURp6Vnc/08P8Fbl5eM929/WgWEMyQcY/WwSW3I684BnoHWsjqiY2Ra9pB+r1LCk8h2Dbduntjzic9NZ8IEGPJI2LEGeqLtnZuYdWdkMaWOSBACLEUuZ+NmA3nU4A5RXLO78cwG6dJKoC6yRJlWMYq/hN5yU/dBB4O1yoC70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=F274qOZ5; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-455b00283a5so31956775e9.0
        for <linux-media@vger.kernel.org>; Tue, 22 Jul 2025 03:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753178401; x=1753783201; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B9mVbnLu7a1SKXyW78ldUvJa6+GK0T8z2V8R3kTNrD4=;
        b=F274qOZ5agzEmzUN7yQ8cFkFMCdb65/i3OlE2Cqe/K81aZQPq4bsEADh9BMesOEQYD
         IHV9tS82OFkQGqjEPCDUwryjMglTgw2w2WwREREAiCIFm0NtStNHmjMACdH56DBGdKQN
         6tiok5z4R8gR+1UyVQTXd+uWYncS0lJ5qViXemn/N7Bb07q7I7gmGX7D/InNVNxuraVs
         sTqLi4kGPPGwmFs2GoXuJbT820vpMpSCnTspHaP0D+0TNCrSThZrZz5PMubiFNCFOMv9
         qm97iFQ8evKPh+J3mccoxx+WOpepkdbU3ORdnQb3fqinbV/7nWIJlMtIZnDbs848hqsD
         UuFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753178401; x=1753783201;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=B9mVbnLu7a1SKXyW78ldUvJa6+GK0T8z2V8R3kTNrD4=;
        b=qsob07dktxP1o7CxWEZhuAigy6KM5TLd93KBesGNXzmeuJMfvODX86wwUsU0DMXspm
         eXHsV7BaaDb4B1nhMb1TKdmDaVW9U+s1+RgFmVksRrYrjJx+Vggfo1nyx/BHdWXSgyv5
         R/KBQGEsNRlbkk0f1fu+RoSKIblq3rfrtldAf+pjhOwAYHiQAkUmp4rcg8SaL/vVi/C+
         ogYYpe04h5rsYpXWXDqqHQqwptHVJxWy10lkHOY0XCgtJhI4o9ubeWsDP0Ols9wDb8W4
         aCZSavc+2v2oKkbCcQvd2xDwKJCFZyze/3oFNsY9ax5yEmflPBNvxGZSgWNd9bfvS0D+
         Zgbw==
X-Forwarded-Encrypted: i=1; AJvYcCUGgGm3jSQ3s6+xmOqdyj6u80Kfuo5lsD5svdYnBsyPAfVK8eKlEN3sf9m/bptae5wYbUFOI1BrOLBtYg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8HXAbfDkdSV7LuPgpysdHisHJfMHu4iS8/SD8O3JINEUUjrDi
	/tzs8997VRkNlD45yUGlpFpH9XXmRoo2C5y9Oypi9juDDQ8NvNQsgfKshqscX1Mgefk=
X-Gm-Gg: ASbGncudDxMhSqcphMsRU/yopu6zZGOiWX/A/uB9hpHJnh1L54SbHzEJ5K0XZ89zcrZ
	u+a0daC34c3jxVLmpmgtvH8jCfzBhacZ0uqWHH2KvEq+v23cYl6H4OZ/MwVWLYxlsdx/k9yxdki
	qDGJledjlPR1sJgTZxPJ58JfJPYBryemg3M9tOaXvKti+X+wpv88nM77YsCuZZ/kK7vrFO05VQj
	wsYLy44E9zWENGNpeVWfShBPGpPhXVhEU8hjCS8sZCLVgJeJfyf3hSVVRaMcASShrnob9qOKL3B
	ZPJONF6OSl7rxq3l2MI8R1NJcwYZGo/9bnXNCylHqbdGAf9uXa9nVGSTUJK2TLzJ6luQN+8pe70
	Jp2CmBLuucAu+0Ixos05WwhnnYSChu0soPFmboHpQVlYoOENUdZy+sd7Z42dDWyhHPSV6nmHYRv
	0=
X-Google-Smtp-Source: AGHT+IGcJyJZcZl6JmFdEcmEQZt5L5wILaf0S4QQxyjYW5ekrqujhnwASeqFRVCxYUAXxFw93P/L3A==
X-Received: by 2002:a05:6000:4b09:b0:3b5:f168:5e60 with SMTP id ffacd0b85a97d-3b61b0f1eadmr11797144f8f.19.1753178400603;
        Tue, 22 Jul 2025 03:00:00 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:bce4:725d:6922:d1ba? ([2a01:e0a:3d9:2080:bce4:725d:6922:d1ba])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4562e88476csm189714485e9.21.2025.07.22.02.59.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Jul 2025 03:00:00 -0700 (PDT)
Message-ID: <84eea632-02d8-4b7f-a4ca-36ce7159a170@linaro.org>
Date: Tue, 22 Jul 2025 11:59:59 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/2] phy: qcom-mipi-csi2: Add a CSI2 MIPI D-PHY driver
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250710-x1e-csi2-phy-v1-0-74acbb5b162b@linaro.org>
 <20250710-x1e-csi2-phy-v1-2-74acbb5b162b@linaro.org>
 <11b573d5-ce4d-476c-b94c-216d427cd838@linaro.org>
 <08261aa4-689b-4d6b-bfd2-221c1976d254@linaro.org>
 <a7f64b31-4767-4281-b452-a2bc5351d745@mleia.com>
 <c93624bb-ee7b-45ac-8b53-b5391f11c9c9@linaro.org>
 <eac3a877-a4aa-4789-9013-ab8b6c91e0f3@linaro.org>
 <0a12879f-dc4a-47fb-87a0-ac4b8bcd4d75@linaro.org>
 <53a19b1d-5665-4937-a07c-5dd1fcde06c5@linaro.org>
 <3b760685-97db-46e3-80a3-7fad69ad31cd@oss.qualcomm.com>
 <94b75177-9401-4e0c-966b-5847a29cb6f7@linaro.org>
 <427548c0-b0e3-4462-a15e-bd7843f00c7f@oss.qualcomm.com>
 <3UXVZ6ANM9mDjVdMV4SXsiIx_pT3S1lp3RC_Q7mh_o7jF2dpYsni1Sl2TAWv6OCMCRTFmi9aE6BxDquGkOnwEg==@protonmail.internalid>
 <8b908a20-0bf3-447d-82ea-a5ecee1bf54c@linaro.org>
 <57501e81-7e9c-4cb1-9a37-18307d1e06ca@linaro.org>
 <33d76d7f-ab14-4e76-8ffb-eb370901a046@linaro.org>
 <4edefe21-27b6-4884-befa-ddb451bb9376@linaro.org>
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
In-Reply-To: <4edefe21-27b6-4884-befa-ddb451bb9376@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22/07/2025 11:08, Bryan O'Donoghue wrote:
> On 22/07/2025 09:32, Neil Armstrong wrote:
>> The whole key point here is the combo mode, as I understood the combo mode feature
>> makes the PHY lanes available as 2 separate streams, like if you got 2 "controllers"
>> attached to the same PHY. So in fact, the PHY should have a single node, but 2 PHY
>> interfaces in combo mode.
>>
>> This makes all this controller/phy model very complex to handle and add a lot of
>> logic in the camss side. Moving the "csiphy" as an independent media device that
>> can declare up to 2 endpoints in combo mode makes things much simpler, and allows
>> us to attach each "csiphy" stream to any "controller" side of camss.
> 
> I think there should be a generic extension to PHY/linux-media to support that instead of something Qualcomm specific.

Can you point out what's missing ? AFAIK it's more a matter of proper representation of all
the CAMSS components with a proper ports/endpoint graph design that adding new kernel APIs.

Neil

> 
> The first task is qcom/CAMSS specific which is separate the CSIPHYs out from the CAMSS block - done in this series and do so in a way that doesn't break the existing ABI - done in the context of adding Hamoa/x1e.
> 
> The second step should be to extend the existing linux-media and PHY API to support multiple sensors on the same CSIPHY in a generic way.
> 
> If you want to ship me some hardware, I'll help.
> 
> ---
> bod


