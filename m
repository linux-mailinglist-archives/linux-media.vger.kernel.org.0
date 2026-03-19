Return-Path: <linux-media+bounces-56355-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IP6lLEc4vGl3uwIAu9opvQ
	(envelope-from <linux-media+bounces-56355-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 18:54:15 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B43B2D0592
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 18:54:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3774A3007CAC
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 17:42:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F07DA3F1652;
	Thu, 19 Mar 2026 17:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VZ1ErVZo"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C65E23F164A
	for <linux-media@vger.kernel.org>; Thu, 19 Mar 2026 17:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773942006; cv=none; b=F1N+Bt8BO4Tu+M0adlD0Mk20uXKDZpqyIz+h3T9R4beWwP5ok9NflCNAA4LfoxO4Io7/WUj5P3OKLAaSgnCdnnuhGAEvuLcZp3SqO7JCquYKPXnf6IPTXWNABx75j8pOqv+HkLxfeMSm5f7T6nY1hXOjwPoyyUiHxXu42K5nMrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773942006; c=relaxed/simple;
	bh=K8lUyo5z6V19brJx0RL+7buzN6w590v5sjtJQ6fEL78=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=JHQz5YYgTfZ4ZSk4QxQN2DxK31fNTozleIm4rXGKySglD2UUSd1or604U/Rkf7pyKiXzUlCEftSWpWJ+T12dk4egpbwbIPRKqBX8vOojiMEQH05rCvjlTa5zUZftXUwpB3Y356Pa5SHwrhDlp7X5S61Y0cnSXK7SvR4Pfj7xjxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VZ1ErVZo; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4853e1ce427so12858205e9.3
        for <linux-media@vger.kernel.org>; Thu, 19 Mar 2026 10:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773941998; x=1774546798; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4DcGpNehVMlOMwMq5jxWCnF0zEBU9hVO79S4un3Z6Go=;
        b=VZ1ErVZo9C2Nph80eujHIrMc6+MeGojb9RHnGuCbQy0Cv7U45JVutMbIqAIGn65eyo
         jx96wkinj0HeP2BcO6UTqmD4Mcu6NmFyGZPutV/qtnVhaCSV3gGMTRksmzDHmlb3QkAy
         IOLgftmvF0MH8U0lhjwEsVYvfMQnn9kbvrxxWXDGrGwwUD5TwGNQGSSlXagu0iy7zkD7
         C+shDIL0mCa1pnVlSFokTH++I3T+Wh63g54moNQ+s9y9f6EpwAGTmqw5ONyqe2icnAwg
         dNTAuVIJPoUDtZAWxxdBqsvFJ2k0UMIsVle2fJLGRcRlNkV0gsp5CPI7Azmz9vq9nNRb
         MIJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773941998; x=1774546798;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4DcGpNehVMlOMwMq5jxWCnF0zEBU9hVO79S4un3Z6Go=;
        b=m7sKDMkitAVMEHUjFUP8CNdT3m0wcYxW/Z8lgaB+ryICkGQFbXPKe6fRSld/0hvwJm
         fQ6UILnmY3s5NuhjBTEj0Z/56gjR14a4a6RPcPR7AZjfRMpXeHOnuevE89DW9KqKIzjq
         vI9hNii/RpZjUw/OrZZYZwOHIaThqTjjPoRXZ4Jr7yiTrD2K9Da8+KNrIVRihqXJFupR
         yY5cgA/IkbPxZevS/cRHJpcIhNEyghshLHT8NMDx7sSBGxTrn6R/801q9D99YIMBTzRA
         5J+IsxE39df94sMw+OI+VZpIEUXUb5kas4SD986tX0o9287YsSBoFhzMIHAq4UDx8hJN
         ZE6Q==
X-Forwarded-Encrypted: i=1; AJvYcCVXkLrLDXDXsZ7UTTcBDAbE4x+ESuhZdYVUBHuiTy5hC2bu8+aZMz5WMuu5MrPsZKSr7LWCcpdbz7KzpA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxBudMQjdsLqjdpOsOSGJktK89RieEDpcVBvj9Q/PWyhTgaEp+s
	dsLVkdtne3MKUsOvf4y6c8buC3kxQ2kCV7rdMhjyCmRZ74h9czAZSOSvZIEwqHq8lzg=
X-Gm-Gg: ATEYQzxCwy36bl7ZH8Btguh+COjklz5F62v/rlKWX4Jf4ltkqhE3gAlLnqQdtQcA3a5
	fFYIQnW+hJs8VWAqPf7udyCP7sDMh9cCRYfxn821Q47U7elh/BO8tCw5IEzMgerYol7uAMLnYRB
	NLOYPZmvu/yOiUDVKWovrRrwjNkM+gKpXs4ge33ivHpASlOxcaom9PH2YxmUvhVxsHMYj179Uxk
	t3/TiFpsep/uBinwuB3EEApNRuyGLgTUpcKpWOaQoBmrzqM90AScP04WQzVX3Ej1Ei8AZ4YJhrA
	qTUubZuGKSyLqPTdslR5Yhux6HCLwlswL2jpC14Ct96MRmEpLANwwNRH2/klJsaXBVSf8Zkmlig
	EO6HXg0ySUrnkCF8G+z5/prPlVJ3oY2InKe0bB3w3EjJJ2s/SF2O52DRIR3tPZ8oCBEee/B776K
	HqQY7sF9Tm/89OcT4yZ7PqndpsJEziCkM2YSGDTg1DSRgPH3OCrsRPOKv31Tqkk87PENdAjWEq6
	VD6
X-Received: by 2002:a05:600c:3d90:b0:485:4535:73d with SMTP id 5b1f17b1804b1-486f442e607mr132291005e9.2.1773941997619;
        Thu, 19 Mar 2026 10:39:57 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:55fd:bfb9:c88:691c? ([2a01:e0a:106d:1080:55fd:bfb9:c88:691c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486fc4d90f4sm49410245e9.1.2026.03.19.10.39.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2026 10:39:57 -0700 (PDT)
Message-ID: <117d9294-87ce-4060-9c8b-71190b649e64@linaro.org>
Date: Thu, 19 Mar 2026 18:39:56 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 2/2] phy: qcom-mipi-csi2: Add a CSI2 MIPI DPHY driver
To: Bryan O'Donoghue <bod@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260315-x1e-csi2-phy-v4-0-90c09203888d@linaro.org>
 <20260315-x1e-csi2-phy-v4-2-90c09203888d@linaro.org>
 <3f11de22-b729-4d06-b6c8-18e649e1979c@linaro.org>
 <80ddc2b4-d6f8-4e8d-a45e-69c05d100aa2@linaro.org>
 <16b10f17-ecd3-4cdd-ac3f-f64127d60ace@linaro.org>
 <ulenfus552ggobis4gmi7eh27tikdaxbgm2oj63b5l2vemlfxc@ib5f2xaqurj6>
 <26XTdUyQTB41Oc4D5HnMtSm_QpZRjlkljQRJVw-u1Zp3Ltn9s4LVU-LQkP6drdl3Z3GGssLCCbsVYPFEqssHcQ==@protonmail.internalid>
 <65e06b2e-eeb9-45af-97ac-4ae60f652361@linaro.org>
 <9578400d-30ac-4d8c-9295-ee4ec8af3b2c@kernel.org>
 <d6616fc0-75fb-47e2-96cd-ae81fa1a8e82@linaro.org>
 <f3c62284-ac78-42c6-a4f0-cd984b7124cd@linaro.org>
 <7eda931a-f30e-4e01-a130-996ec7f450d1@linaro.org>
 <a42f837c-4b90-4e0f-a98f-793fbd20a140@kernel.org>
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
In-Reply-To: <a42f837c-4b90-4e0f-a98f-793fbd20a140@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-56355-lists,linux-media=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Queue-Id: 5B43B2D0592
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/19/26 17:56, Bryan O'Donoghue wrote:
> On 19/03/2026 16:08, Neil Armstrong wrote:
>> On 3/19/26 16:18, Bryan O'Donoghue wrote:
>>> On 19/03/2026 14:56, Vladimir Zapolskiy wrote:
>>>>> There's no reason to remove that from CAMSS - it would be an ABI break
>>>>> in user-space anyway.
>>>>
>>>> If technically CAMSS CSIPHY could be excluded from the list of CAMSS media
>>>> subdevices, then for the sake of simplification it should be done for all
>>>> supported platforms in advance, such a change will be independent from this
>>>> particular phy series, and vice versa, this CAMSS only driver change will
>>>> prepare a ground for media-less CAMSS CSIPHY device drivers, hence it shall
>>>> precede this particular CAMSS CSIPHY series.
>>>>
>>>> For backward compatibility with userspace a noop stub will be good enough,
>>>> it's not an issue at all.
>>>
>>> The standalone PHY driver doesn't require removing the CSIPHY media
>>> entity from CAMSS. They serve different purposes and coexist - its important to have a NOP from user-space perspective for legacy and indeed for new implementations.
>>>
>>> How the PHY gets represented in the kernel is of zero interest to user-sapce.
>>>
>>> That said, stubbing out the media entity is independent work that can happen in any order and IMO is a separate debate. Whether or not CSIPHY init sequences live inside of a monolithic CAMSS driver or live inside off a discrete csiphy driver is not related to the media graph.
>>>
>>> Happy to have that debate - and if indicated, carefully apply patches separately.
>>
>> So what does this actually solves ?
>>
>> Neil
> Per-PHY voltage rails, per-PHY power domains and per-PHY OPP scaling.
> 
> Using the PHY API instead of rolling our own, as well as separate nodes in the DT.
> 
> We've been getting away with power-domains, opp scaling etc by sheer luck. The feedback from the list alone now addressed in this driver makes the conversion worthwhile.

The PHY API doesn't solve that, having proper nodes solves that, you could add a separate csiphy node, add a port/endpoint between camss and the csiphy and attach a camss aux driver to the node, and it would have the same effect with little code change.
And this could be done for all the CAMSS hardware elements incrementally, and if you wish the move the electrical phy part under the phy API then you just spin a PHY aux driver controlled by the csiphy media element.

I understand you find it simpler to use the phys property in camss, but it has plenty of drawbacks like not be able to describe data link properties specific to the CSIPHY properties or easily describe new hardware layouts without having a fixed association table between phy-names and whatever CAMSS media elements interconnections.

My question would be that if we were to completely split out the CAMSS into several separate nodes linked with port/endpoint graph, to which hardware element the phys would be associated to ? is there a fixed connection between a CSID and a CSIPHY ? is seems the CSID gen2 & gen3 can actually connect to different CSIPHY meaning a CSIPHY is a not simple electrical PHY but can be dynamically connected to different consumers.
There's no way we can handle that with the PHY API.

Neil

> 
> ---
> bod


