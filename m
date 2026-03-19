Return-Path: <linux-media+bounces-56351-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4EcgNZsivGnQswIAu9opvQ
	(envelope-from <linux-media+bounces-56351-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 17:21:47 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 49AC62CEB09
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 17:21:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 37E4632A7CE1
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 16:09:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 812FF3E5585;
	Thu, 19 Mar 2026 16:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BlSZz7ff"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFAC8374748
	for <linux-media@vger.kernel.org>; Thu, 19 Mar 2026 16:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773936528; cv=none; b=WrEDGcXM7s+q4OZB/jnvcqs5U3mNk7HaVNSQfq5iGlx0JNS/qYXjpuoxLTSRQ5NqjLj8kXN7feCEmcgOQEPuUWMLb773IsTeRPgweOeO4ypntYQsQm4IA8LkOYPIpHMlnRBdYzZCZ4nwYDVtyivGZLABGMm6h8VPiG6ZeW2T+TI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773936528; c=relaxed/simple;
	bh=rlEF8rcoZ9Yhxjn4MZvft47PJFAScntl55etVD10l7M=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=ek+Bp6Vi6tuKTsJ4Whd3Ss30szvZ3wWyArPnoFGaOsNYVh3gzXAG/rw0BwGs2um91Zk+sduGKHqoLQ51XLqYCENtVJmfKqGFF2t8y529ZebLvzNtAJqoSPfA4NcSTxSAEM/BWasS7kGRczhuK/77EgiZIYfLAvcNXBXV8y0+Xv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BlSZz7ff; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-43b3f91a7abso632857f8f.1
        for <linux-media@vger.kernel.org>; Thu, 19 Mar 2026 09:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773936525; x=1774541325; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ICb79d2+sHzdxc1vylZi/q9n6G5oRRdWGzOcbuBbee0=;
        b=BlSZz7ffp92m2agJsQU9Ik3tmkBuCTY67uOumaHHmDo5VbLfkoTMCrs1WZVkMmBxPx
         kZj43YiLtz2ud52GvLRP6AjYFBsAExgS3U26E6qnac2KLf9Eg/WDgAqeYdZcLIRqX091
         z8vF1N81pnXMN2COHqfGHR2fEOPOcCjaaR+QztB36DDelxJ8vHalGt28+xA0gO1xfre8
         bs3qOvTJNP82HUPDyPbux7S5XokeWa+cub7rsy04qVmiz3UU2kyGhaAgSYpzJrq4RzGm
         2MQ65kvUEp9mgTPtInonnGRrioEvLEsIkU2xRPIWVu2bF9eF3Uu5+dZWrHJYrjfHlWOL
         BpDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773936525; x=1774541325;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ICb79d2+sHzdxc1vylZi/q9n6G5oRRdWGzOcbuBbee0=;
        b=r5rnBBK/sn8i+fPWMQE3t01AO2k6Xixt9sNhxsoZcAi3PSM3CeZ7LZk7lQC5RWxOEW
         04UVOBHfpSYpA/ihgVURpiW9yZS1e1P/BIES18p8r6+9g7tLOb+/aT0Rm7KcaglSYiTJ
         1uJ3J7jSdPS1NRzcfDDSREZ2h1FHYSENPRvid4gkYi70Jeg7ptg2kR2inFbPt2lIJj09
         ofZIFiRp4eomjVK40unwoVqr0M0zUht5GSxGCB50Ic7V5AZ7SgBEQXPT1C66zbRxy7ca
         hTHYJqiSNPTZT75gKYo6tGTBbWHw1jBpn5fl3bGGpDlfTTL0w4c4CyKZ0LuenqYWs8HY
         jpJQ==
X-Forwarded-Encrypted: i=1; AJvYcCUtVE+yblyHnBKNQseRS/Tb+w3tXx5TdxPHOyMhyBCnNDYgNbzRCpfxm4JY5FwGiKavBr7DDV+FwZv+oQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YysTAsIVzO6Nktm+eThu/s8umzpPDbiHka5J7rlkIheJqGotH6y
	k/3p0HLSOuccIpR4nUWg8fVQKwbqgXa9dMui/Bsp7tIDSvyJi5RMIX27qqiag0F4t9M=
X-Gm-Gg: ATEYQzwLD624DrAGYwnGIhKZ7qX0jz8ntVjd6b1UhDvo0ze0QpAAXYMGcsssm3AEssN
	rglRMNuGFDGG1EXyW7jil8cAKY13V1KGdIwlCRboBjJjy+kfUqtHWUp246YYoqUH54Je2VzLzYb
	BfT+eKJmsCPQ8xIxF/ggtTTf2OrZUfi04pqaOH9O5R3oX6+dPHE5gkK2BejfwT4JXVnyAhcgybb
	7MNaryr9mgMLaI04wzn+gzNWExEyAJZX63IXIVzZp5pcQetsISI1KO+NJ3k49FAizAls/EG4lFz
	xs5ZJXuKkC7N825PzHyuSYxFweCnOINOB2IXT9nX8hO2GS4enLrX/XENLnkfH2FDANe5FP225sS
	/vuiuF4PiqHSM2WKKMrwXk5b7UjxJPwOgtxj7gjh3qdko6IRQwO2wQCYlaxry0HgWtEUmRSbquW
	rEkTvjkTyNxhZIJTyAk3Pqm37M0RoRDmEo88MK1DPQwCQ7hLJoVvCG2/QKrOj/DVmU5tfWPfD71
	7CX4CY=
X-Received: by 2002:a05:6000:2511:b0:43b:4faf:a49f with SMTP id ffacd0b85a97d-43b527cb31amr14507158f8f.50.1773936523323;
        Thu, 19 Mar 2026 09:08:43 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:8e54:fbaf:8cb6:e9f7? ([2a01:e0a:106d:1080:8e54:fbaf:8cb6:e9f7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b51899617sm17403918f8f.31.2026.03.19.09.08.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2026 09:08:42 -0700 (PDT)
Message-ID: <7eda931a-f30e-4e01-a130-996ec7f450d1@linaro.org>
Date: Thu, 19 Mar 2026 17:08:42 +0100
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
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Bryan O'Donoghue <bod@kernel.org>,
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
In-Reply-To: <f3c62284-ac78-42c6-a4f0-cd984b7124cd@linaro.org>
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
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-56351-lists,linux-media=lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
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
X-Rspamd-Queue-Id: 49AC62CEB09
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/19/26 16:18, Bryan O'Donoghue wrote:
> On 19/03/2026 14:56, Vladimir Zapolskiy wrote:
>>> There's no reason to remove that from CAMSS - it would be an ABI break
>>> in user-space anyway.
>>
>> If technically CAMSS CSIPHY could be excluded from the list of CAMSS media
>> subdevices, then for the sake of simplification it should be done for all
>> supported platforms in advance, such a change will be independent from this
>> particular phy series, and vice versa, this CAMSS only driver change will
>> prepare a ground for media-less CAMSS CSIPHY device drivers, hence it shall
>> precede this particular CAMSS CSIPHY series.
>>
>> For backward compatibility with userspace a noop stub will be good enough,
>> it's not an issue at all.
> 
> The standalone PHY driver doesn't require removing the CSIPHY media
> entity from CAMSS. They serve different purposes and coexist - its important to have a NOP from user-space perspective for legacy and indeed for new implementations.
> 
> How the PHY gets represented in the kernel is of zero interest to user-sapce.
> 
> That said, stubbing out the media entity is independent work that can happen in any order and IMO is a separate debate. Whether or not CSIPHY init sequences live inside of a monolithic CAMSS driver or live inside off a discrete csiphy driver is not related to the media graph.
> 
> Happy to have that debate - and if indicated, carefully apply patches separately.

So what does this actually solves ?

Neil

> 
> ---
> bod


