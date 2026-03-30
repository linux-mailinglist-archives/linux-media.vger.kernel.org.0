Return-Path: <linux-media+bounces-57577-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AD3aFYlBymky7AUAu9opvQ
	(envelope-from <linux-media+bounces-57577-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 11:25:29 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A21B235821F
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 11:25:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 976643019923
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 09:17:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 924903B27E2;
	Mon, 30 Mar 2026 09:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bMsKl8Q+"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C16D38946E
	for <linux-media@vger.kernel.org>; Mon, 30 Mar 2026 09:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774862233; cv=none; b=tjfRjrlaIVYUZEIW3l3G8goeT79kKpITO2a7QRHasTEoOeBFwuA21CLVoIZJO+LC6KQfK/YDSJCQKXiH8btef1zSx2rkt8cSENAx8KEOKEIRSUOBGEgVrxEvXGnGI8y8BuBId/wvu+1TKsYg8H83NNVxtcK8nVj45FZ/M3dvmjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774862233; c=relaxed/simple;
	bh=/7NiGOUpT1kZQYxs4aI+8rPIELPQb2KrHP9xTjm5odM=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=UfhCup7iw2L01Vz5nFRvYf664PdfrB+VNYGCHFvuW4YmsbU3v3jy07yVIh22Vvdk/5N9PeCSPqXBhOt3PmRdzVo6cz2yAgXioU/j63+yzi7ryY5f7ctez77FvKPAKIf9arhp4VwxTjF5HcyNfiRwNnMwJQwkWJY3E+8XiJeTfgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bMsKl8Q+; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-43b8982c2f4so2097455f8f.2
        for <linux-media@vger.kernel.org>; Mon, 30 Mar 2026 02:17:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774862230; x=1775467030; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4VOM/b3KwJ3A3R51aHiZRtwvN8eEVduEBIFhFs9QUVY=;
        b=bMsKl8Q+cfN32buqujoEaQ8WeAc1fhcUwmEk/5mLZdYefvx5rLfbTTXcVHUebbUjJD
         HN44tmM0Rmb/nOS/goSGmlvc6Vv/wC6LIv0YCIKCXcEPD+ZHxk815ayvrw8e+kZrQZJ2
         MR6mPMrEVXooL2nLPc4JZZbHJAz1HbK1JrBU1mBSVdoFoG2WV/gI9jwXE/iJ4OMX86/x
         1yr+BO49Vb0RO5wZ8CyjWsq1kCTmzYyfGXjncpRBWqM12tAYkmcpJ7UlzF+R34+oc1OC
         MzoLPRc/xi60DpDCoKgtoa/aMWC7jzHwXpyoCBLgEIZ9TIkbU5h3Ro8WO6suMrbJQMLw
         Pzxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774862230; x=1775467030;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4VOM/b3KwJ3A3R51aHiZRtwvN8eEVduEBIFhFs9QUVY=;
        b=a64Go5BVJ0GAMDqPPwe9a8jcWij37j/mWhqKX6Uc6+dJHXv0jhLkyFwB2zW8cQQeMc
         Z/5dm0Z8XCzq0bItGPNZxyKgS1y1H1UnjsVLdjo1tnscLzvTbYC49qUcpJWbvQ3xD9J6
         FAnVruTQoCk1dWnLd78zHtORIYHoSH5aGTn2KBiOthkfP+cY/RTORwd/5UYwKQsFO+hu
         f/uNAXqxlHfad1VE7RFAIoYXbhBu9qGvlTtqtEfQHPAXEWVtr+wk0WWiAn27WuYmus4q
         7n82Rdt3tLJKVfUfVA8C4EcbU1qgU6mhHfZG+fgH0abOFshsDiChQtlmsI/nKggntsWz
         n8lA==
X-Forwarded-Encrypted: i=1; AJvYcCWjscru+doH+1plJjhiV0fyJmvG+d8OP3BqZlc5ozEb98dDk7EY5GuqrTP/oEq6oVNc20ns9kbn7y9Upw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwEE47X0T+UhBiAHpWNF8Ft5R4K2kihrsKnSiIOjIELmjAvHrlM
	8VyGx8Jv3B704tdcvSCvWV/qkerpUjRP+olE2fnjJKk2xftuboilRGixOULAbEr7ZoM=
X-Gm-Gg: ATEYQzxxPgtoER5hDLhQDcNvk3f7oqpqyAeXBr0CmoQD9ssZj6/GFW+HQmRL8vjdt+g
	69lRqNsllIQwlTepnZ9Ip9YCS68AxD0RSwxqKNQ+Zeyu2UQNqthHtqbcSGtdvXx29S9sk3Yp/Lc
	SQTK6VCFO2PVHg7i23rIWPT0dajzRy2vcuniWCDrxxba6pdUEhXO6cu/8chlJZCuoxNYC3v1R2p
	19bC16xPAjDVcz8DygCAlg/Gatgbmrrvu8ijbWf+89CedqjyrgKcb+xuCGwH6Ph7Mo/NNZWP7aj
	CYHnZUCSa0PI8do6mgcjjV9QiHOyacXalLpLiAFo8I/iIQXDEIrlSJ70tUy0N+z1frtLIVhUQ07
	WRWzJLvDC/PVN6sXIVtCu4Hbf/fRyD8OxK/YI8xeVPF7M9tjUBO6Zy0P5lKufzwqhiggDBMivhh
	p2sWT8QpXHoW0EeIQ5aliclVD44KUDHPCOiNEjtjetw/1Pi72b7E79jSY/C6NOSpuYe/UOCh2SE
	DNFFHI=
X-Received: by 2002:a05:6000:2f87:b0:43c:ff58:35c2 with SMTP id ffacd0b85a97d-43cff583701mr5346372f8f.20.1774862229397;
        Mon, 30 Mar 2026 02:17:09 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:cb3c:d0d2:870b:6ad0? ([2a01:e0a:106d:1080:cb3c:d0d2:870b:6ad0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf21e2628sm19089838f8f.6.2026.03.30.02.17.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 02:17:09 -0700 (PDT)
Message-ID: <76ea03d0-d41b-4880-a48c-06570eb089ed@linaro.org>
Date: Mon, 30 Mar 2026 11:17:08 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v5 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Vinod Koul
 <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Bryan O'Donoghue <bod@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260326-x1e-csi2-phy-v5-0-0c0fc7f5c01b@linaro.org>
 <20260326-x1e-csi2-phy-v5-1-0c0fc7f5c01b@linaro.org>
 <7712fbdd-a225-49f0-aeb9-ebcbb9d5abac@oss.qualcomm.com>
 <da3ed78d-fb5e-4820-95d6-527d540cf03e@linaro.org>
 <1f38187a-9464-4aa9-b70a-03b767349d56@linaro.org>
 <c5278028-dfe9-4d09-970a-a25977967bdd@linaro.org>
 <016c03b8-27c3-41dc-a630-8e7095db1f88@linaro.org>
 <456ded59-d13e-4b61-975b-97ca48b5e771@linaro.org>
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
In-Reply-To: <456ded59-d13e-4b61-975b-97ca48b5e771@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-57577-lists,linux-media=lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:replyto,linaro.org:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	HAS_REPLYTO(0.00)[neil.armstrong@linaro.org];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Queue-Id: A21B235821F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/30/26 11:02, Bryan O'Donoghue wrote:
> On 30/03/2026 08:49, Neil Armstrong wrote:
>> On 3/27/26 18:42, Bryan O'Donoghue wrote:
>>> On 27/03/2026 15:28, Neil Armstrong wrote:
>>>>> To be frankly honest you can make an argument for it either way. However my honestly held position is analysing other upstream implementations connecting to the PHY means we can't make the PHY device a drivers/phy device - it would have to be a V4L2 device and then for me the question is why is that even required ?
>>>>
>>>> This is plain wrong, DT definition is different from software implementation, you can do whatever you want if you describe HW accurately.
>>>
>>> I'm not sure what point it is you are trying to make here. Are you trying to say drivers/phy is OK with you but you want an endpoint ? If so, please just say so.
>>
>> I'm against using the "phys = <>" property in the CAMSS to reference the PHYs, a "PHY" in the classic terminology is tied to a single consumer, and if it can be shared to multiple consumer you must model a mux or whatever in the middle.
> 
> The CSIPHY-to-CSID routing is runtime-configurable and is already managed by the media controller framework.

This is not compatible with the PHY bindings if you don't have a defined MUX device in the middle, it's wrong. You're hiding the muxing details in the CAMSS blob node.

> 
> DT describes static hardware connections. The dynamic mux is a software concern, not a hardware description concern.

DT must describe the possible interconnections between the nodes, if a PHY can be used by multiple hardware components, it must be described.

> 
> 
>> The PHY API as an internal software implementation is probably fine, even if it makes implementation of split mode much much harder and doesn't really solve anything, you can just call init()/poweron()/ poweroff()/exit() directly from the CSIPHY media callbacks.
> 
> Great.
> 
>>> I can see an argument for that hence my response to Konrad, I just don't see why its a Qualcomm specific argument and of course understood stuff bubbles up in review, we have a public debate and come to a consensus - that's a good thing.
>>>
>>> However, I'd want wider buy-in and understanding that endpoints in the PHYs is a more accurate description of the data-flow.
>>
>> It is, and it was designed for that, and extensively used in the media DT representation, so I wonder here you would not use it...
>> In an ideal world, you would add nodes for each CAMSS hw elements and adds port/endpoints links between all nodes to describe the data graph, this would be used to construct the media controller graph, and make it much easier supporting new hardware.
> 
> Yes but be pragmatic Neil. The first step in making the monolith into sub-nodes is the CSIPHY.

I am, and I agree it's fine to do it step by step.

> 
> Once the CSIPHY is in, we can follow on with adding new nodes that way IPE, BPS, ICP, JPEG whatever and also work on implementing the old stuff in that new way.

I agree on the approach, I never said otherwise, but you need to have the big picture in mind.

When you'll have the CSID subnodes, where will you add the phys properties ? you'll keep them in the CAMSS top node ? add all CSIPHY to all CSID nodes ? this is wrong and this needs to be fixed now.

> 
> 
>>
>>>
>>> We've been applying DT bindings aplenty without that so far. So we would establish new CSI2 PHY bindings should represent the sensor endpoints.
>>
>> We've been using a dummy representation of CAMM in a single node with only endpoints connecting to the sensors and hiding all the hardware layout in code, it doesn't scale and makes supporting new HW hard.
>> I mean this is common sense, why would we continue to stick to the current CAMSS bindings ???
> 
> We _won't_ I just don't support a big bang integration. Progressive changes over a longer timeline make the transition manageable, without accepting endless sub-standard stuff in the meantime or holding up all new SoC submission unless/until.
> 
> I mean there is a CAMSS meeting which I've been running for nearly a year now that both you and Vlad are invited to where we have been discussing this for months...
> 
> Anyway one conclusion of that is we want to transition to individual nodes for everything.
> 
> PHY is the first step which I'm taking because its easier for me as CAMSS maintainer to convince the CAMSS maintainer to take the relevant patches.
> 
> drivers/phy notwithstanding.

As I said I agree on the progressive approach, not the PHY DT bindins approach.

> 
>>>
>>> Is that what you want ?
>>>
>>>> The CSIPHYs are not tied to a single "consumer" block, they can be connected to different consumers at runtime, which is not something classic PHY devices are designed for. So they are de facto a media element in the dynamic camera pipeline.
>>>
>>> The existing CAMSS binding and media graph are not changed by this series.
>>
>> This is not my point, I don't care about the software implementation at all, I care about accurate hardware representation. Using the "phys = <>" property does not describe hardware accurately.
>>
>> In other words: The CSIPHY are not connected to CAMSS. This is _not_ true, tying the CSIPHYs to the CAMSS block hides the real data muxing in software.
>>
>> Please remind DT is used by multiple operating systems, and properly describing hardware in DT will help have good software support over all OSes, not just Linux.
>>
>>>
>>>> And actually Rob Herring asked use to define the complete data flow, it was a strong requirement. I don't see why we wouldn't here.
>>>
>>> I'm implementing feedback from Rob.
>>>
>>> https://lore.kernel.org/linux-media/20250710230846.GA44483- robh@kernel.org/
>>
>> Where did he ask using the PHY DT bindings ? Is he aware those CSIPHYs are muxed to multiple consumers which are burried in the CAMSS code ?
> 
> I freely admit to taking the initiative of phys = <> but Neil there is _no_change_ to the media graph and the "mux" is a runtime configuration that is one register in the CSID.

Honestly I don't care about the userspace media graph, this is a software problem and we can totally make the transition seamless if we want.

Don't limit the DT hardware description because of a software userspace ABI breakage, this approach is not the right one.

> 
> You seriously want a mux device in the kernel to model one bit in a register ?

Why not ? We have drivers that even toggles even single bit to solve those kind of situations.

Physically they're a mux to route the CSIPHY to the consumers, it's a fact... even if it's a register or a single bit.

> 
> No.
> 
>>>
>>> To me, here is where we stand:
>>>
>>> - Individual nodes - we all agree that
>>> - As sub-nodes - I think the majority agrees this Krzsztof, Dmitry
>>>    I'm fine with it too.
>>> - drivers/phy - I think we are accepting this is also fine ?
>>
>> Like I said this adds a supplementary API layer for no reason and will make life harder, but I don't care personally.
>>
>>> - endpoints should flow into the PHY and then back to the controller
>>>
>>> I get that argument. In fact I _like_ that argument at least I like my conception of that argument.
>>>
>>> I'll stipulate to that argument meaning then that, new CSI2 PHYs shall include endpoints for this purpose globally.
>>>
>>> As I've said before, there's nothing Qualcomm specific about this discussion, really.
>>
>> There is, because the current Qualcomm CAMSS bindings are insufficient and should be entirely redesigned from the ground up to properly describe the HW.
> 
> The long term plan is to do that. Discussed extensively with the Qcom teams delivering CAMSS, even invited community members along.
> 
> Here are the meeting notes - its all in the public domain
> 
> https://docs.google.com/document/d/1yUwWHaKLuovKVgGTzvKm68K1zS6xBONVzjOsRjDl03U/edit?tab=t.0#heading=h.mtbm7qfohwfs
> 
> ---
> bod


