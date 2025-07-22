Return-Path: <linux-media+bounces-38205-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 46979B0D4B7
	for <lists+linux-media@lfdr.de>; Tue, 22 Jul 2025 10:32:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4CE096C331D
	for <lists+linux-media@lfdr.de>; Tue, 22 Jul 2025 08:32:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB7462C158F;
	Tue, 22 Jul 2025 08:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xfjmor6s"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 607DF239E9C
	for <linux-media@vger.kernel.org>; Tue, 22 Jul 2025 08:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753173142; cv=none; b=mu8wdLgMxMkJY0yJpws247EJaWkX1JrDHL0Km3ASReM7HgVsf5ZGt3TD7PclKH5Ngne1HBZaRycHGXTa2uawy8qNzLeUJ1hGKrTxL7x2f7Uvfz25lUH19ybaEqdQevyNCP770wAIiKhhl1xmvwOgveTEc1NsaEz3s/SRbtkj2t0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753173142; c=relaxed/simple;
	bh=rAgS6t6wG20qiV2by2xORtgcZUviNn8FpaxxBJIUk60=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=bxIojQPYbmWfJxIdzv1+gHrd/O8k3c5VHBwDae09fItMCKeNNoZxVSlBS0ootKFeMrwk30s9i/guOUMiw3+WyCmccMz/oOuueecqcO3Xg/nUFo8rupqp3bAWLhLQe8djzC3MGAsYbULhgI9uUhrKPeQGwTAQuMzaFbIT3o9FhO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xfjmor6s; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-454f428038eso44519865e9.2
        for <linux-media@vger.kernel.org>; Tue, 22 Jul 2025 01:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753173139; x=1753777939; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EmqRihQE4cEXI6g+dRmCaPE8w5nJ7dL9XpOBOkXpgns=;
        b=xfjmor6svATxlZ8LmTGr1Kz+UJlTuyf42SExZT6xP2k5IRtpvKYnU3zc51KFLKd4LY
         DhO+a/BU9307Tg1eP9znKspXzKV7qvox0KHNs3UKr2FJ9Z9j0H74kz8W1JiYtDS/rUY0
         BFpsprylV4JvPDkot+SlkOZd6NKQqDjnNxCIKn6FY6ucsfyd0Sbb7Ydk4VJ3xdEm1ReE
         bcLaxrGmYCSfGeHoHokKxIJ5LjuIFRGv2pwIHpzzr6gj73A7fPxP+SEtFofU7cp49AFu
         riVtijoonipwwopdDsXELOX+ygzJAwDGgj6PNZkIxK7xv5Wpqb3kX6+0PLhP8vH4TcPo
         WiYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753173139; x=1753777939;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=EmqRihQE4cEXI6g+dRmCaPE8w5nJ7dL9XpOBOkXpgns=;
        b=O1hWgwZc7OCCdltiGBv669u2i4475RjhUCiIVqwjpoGSw5X+5EhpBULSr0vDdqPt/8
         iuGsS7yWYfaTahCNkb3etX31YNixC06jjVd7pcX/bGJO7GEJZVxqN6PVWLBrzzq6E3Ou
         lgIJ4GTa2MmEw93LqTIsoJ5/TX8ofb9ph+jrmD7DY7hliYxAsQMEOH21XV2NLrC0RhjN
         IAV4u4UPZbL+0CUDw8bOtXEDSoY2NwqlzmCrdNZ0HCIIRdsWq6XSuhTLvW27qwM3Y9Az
         nVXginoKKtm4OxcYwYkb073wIqn72BCxiayxSAedkpTwVtCyyfQrlZXgNxThhX0KfJUJ
         qfsg==
X-Forwarded-Encrypted: i=1; AJvYcCWOZearQMB0vz9EIrTMEbpxS7Z4qHfJXXAY/dcA34w6/8Ct/omdz/gzl2BijPCfpgi6DniOASc/S5UEQw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxyIIhq+q7gY8nM7cif+5OU3YpQNqBHV+mV+nrCR0wxYGNp/Vbu
	ohq2xflh1DeeFGYORV6WAS91xwsLjutelJhdprV8nUeClK3rp2HXSOKNNAsU/Bc6Y9m5eLkTYll
	DV7aJ
X-Gm-Gg: ASbGncvkauUizd1otiKQnKPM5/79Jw/chNMaBLIS2yE0mOpeQmNjJ9RsdZLm3UNLlpL
	J8LAPaEBPb1DWp1MBcIXh+0G/uk+W9OAr4+dIY8X0temtkxY7SLee4MWLT1PC1yDOokoeVpqXjv
	Nj4qvmWSpqOtSiPIFzphTXNTbymsg9u56GHpFVpWKYLXdNzRs9KW5Eo1UQCAKPBdN1U98xmHJcg
	oBV2WAuKnbimcVt74zNIQ4HwgSsIJvy8gZhMTbnsWmrogXPrP8jzv5HDSDbQadhrgxoxXVCCTDG
	w/zpUhRwyfcYJ47gYMro0ClFN/LKAKclZ/XPg4MStsukz5re71aqiJ2R4llqmCn1f9PBSPsZMqF
	rc60Pb3GXmZnsmeCa82mI9/452Fsi9dtzs1P82A4kSDBePmRyI1y8vQqOqT0yqcRg/8IXIDdyIu
	E=
X-Google-Smtp-Source: AGHT+IGZH+cXUgzHi50tWmYat0JhKpfjMAywO/xvrjiS+LeEv8IM/8RbRGSLqjTRz/gsQJZp0D0k7Q==
X-Received: by 2002:a05:600c:1c88:b0:455:fc16:9ed8 with SMTP id 5b1f17b1804b1-4562e3b9144mr229030715e9.30.1753173138546;
        Tue, 22 Jul 2025 01:32:18 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:bce4:725d:6922:d1ba? ([2a01:e0a:3d9:2080:bce4:725d:6922:d1ba])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4563b5a4055sm126753905e9.5.2025.07.22.01.32.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Jul 2025 01:32:18 -0700 (PDT)
Message-ID: <33d76d7f-ab14-4e76-8ffb-eb370901a046@linaro.org>
Date: Tue, 22 Jul 2025 10:32:15 +0200
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
In-Reply-To: <57501e81-7e9c-4cb1-9a37-18307d1e06ca@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 21/07/2025 18:16, Bryan O'Donoghue wrote:
> On 21/07/2025 16:46, neil.armstrong@linaro.org wrote:
>> On 15/07/2025 11:33, Konrad Dybcio wrote:
>>> On 7/15/25 11:20 AM, Vladimir Zapolskiy wrote:
>>>> On 7/15/25 12:01, Konrad Dybcio wrote:
>>>>> On 7/15/25 8:35 AM, Vladimir Zapolskiy wrote:
>>>>>> On 7/15/25 03:13, Bryan O'Donoghue wrote:
>>>>>>> On 14/07/2025 16:30, Vladimir Zapolskiy wrote:
>>>>>>>>>
>>>>>>>>> I think that is genuinely something we should handle in camss-csid.c
>>>>>>>>> maybe with some meta-data inside of the ports/endpoints..
>>>>>>>>>
>>>>>>>>
>>>>>>>> This is a CSIPHY property, a CSIPHY hardware configuration and a wiring
>>>>>>>> of sensors to a CSIPHY. Where is the relation to CSID here? There is no.
>>>>>>>
>>>>>>> All the PHY really needs to know is the # of lanes in aggregate, which
>>>>>>> physical lanes to map to which logical lanes and the pixel clock.
>>>>>>>
>>>>>>> We should add additional support to the Kernel's D-PHY API parameters
>>>>>>> mechanism to support that physical-to-logical mapping but, that's not
>>>>>>> required for this series or for any currently know upstream user of CAMSS.
>>>>>>>
>>>>>>>> Please share at least a device tree node description, which supports
>>>>>>>> a connection of two sensors to a single CSIPHY, like it shall be done
>>>>>>>> expectedly.
>>>>>>> &camss {
>>>>>>>          port@0 {
>>>>>>>              csiphy0_lanes01_ep: endpoint0 {
>>>>>>>                  data-lanes = <0 1>;
>>>>>>>                  remote-endpoint = <&sensor0_ep>;
>>>>>>>              };
>>>>>>>
>>>>>>>              csiphy0_lanes23_ep: endpoint0 {
>>>>>>>                  data-lanes = <2 3>;
>>>>>>>                  remote-endpoint = <&sensor1_ep>;
>>>>>>>              };
>>>>>>>           };
>>>>>>> };
>>>>>>
>>>>>> Don't you understand that this is broken?.. That's no good.
>>>>>>
>>>>>> Please listen and reread the messages given to you above, your proposed
>>>>>> "solution" does not support by design a valid hardware setup of two
>>>>>> sensors connected to the same CSIPHY.
>>>>>>
>>>>>> I would propose to stop force pushing an uncorrectable dt scheme, it
>>>>>> makes no sense.
>>>>>
>>>>> If all you're asking for is an ability to grab an of_graph reference
>>>>> from the camss (v4l2) driver, you can simply do something along the
>>>>> lines of of_graph_get_remote_port(phy->dev->of_node)
>>>>>
>>>>
>>>> It's not about the driver specifics, my comment is about a proper
>>>> hardware description in dts notation, please see the device tree node
>>>> names.
>>>
>>> I'm a little lost on what you're trying to argue for..
>>>
>>> I could make out:
>>>
>>> 1. "the phy should be a multimedia device"
>>> 2. "There is no ports at all, which makes the device tree node unusable,
>>>     since you can not provide a way to connect any sensors to the phy."
>>>
>>> I don't really understand #1.. maybe that could be the case if the PHY
>>> has a multitude of tunables (which I don't know if it does, but wouldn't
>>> be exactly surprised if it did) that may be usecase/pipeline-specific
>>>
>>> As for #2, I do think it makes sense to connect the sensors to the PHY,
>>> as that's a representation of electrical signals travelling from the
>>> producer to the consumer (plus the data passed in e.g. data-lanes is
>>> directly related to the PHY and necessarily consumed by its driver)
>>
>> The port/endpoint should represent the data flow, and if the signal is the following:
>>
>> sensor -> csiphy -> csid
> 
> I'll be honest.
> 
> I looked at your upstreamed code
> 
> drivers/phy/amlogic/phy-meson-axg-mipi-dphy.c Documentation/devicetree/bindings/parch/arm64/boot/dts/amlogic/meson-khadas-vim3-ts050.dtsoc/meson-axg.dtsi
> 
> And didn't really think CSIPHY needed to be included in the data-graph.

This is DSI, but I understand your point.

The whole key point here is the combo mode, as I understood the combo mode feature
makes the PHY lanes available as 2 separate streams, like if you got 2 "controllers"
attached to the same PHY. So in fact, the PHY should have a single node, but 2 PHY
interfaces in combo mode.

This makes all this controller/phy model very complex to handle and add a lot of
logic in the camss side. Moving the "csiphy" as an independent media device that
can declare up to 2 endpoints in combo mode makes things much simpler, and allows
us to attach each "csiphy" stream to any "controller" side of camss.

Neil

> 
> ---
> bod


