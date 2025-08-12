Return-Path: <linux-media+bounces-39608-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A0FC6B22CE0
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 18:14:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DB0C31AA5B15
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 16:09:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6127C305E30;
	Tue, 12 Aug 2025 16:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JQ52cMjo"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03CC3156CA
	for <linux-media@vger.kernel.org>; Tue, 12 Aug 2025 16:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755014925; cv=none; b=LrW5moOaBrXCWU4JskFSzaZG1DFq6WXPZ4DD5FghffYjldaRRMgS59zWmPEzm8U+1Q/4Um9/D3WQBrS7cafMXz1A5+1t2zP2SgKX2eUEDFNkd8pvN2PVD8o6M4ZIq7s1IEguCtiUNIWSX8VaHT11efYFHz2uHbcjdWPlebd6ReE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755014925; c=relaxed/simple;
	bh=FpIvkzJnxRWf+RK44t2QTwvE47J9fQgcxUAuyJ4Zm3w=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=bXdBxGRE73rjECSG5fAttJh/ngcohN4NyfqvRBOJq0FLGgwjKRoMNBR20ArnXpYSm6OP7EyPyKjBB1Cu+YEHgyVX9aIKU/KbLTgSGYnzrYpBtDcHkFogKLtd9/WDx0of3WZFswxZTvgR4RiZrsiF2Y1z27wXJ+6BBR2/64uFXio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JQ52cMjo; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-459ddada9b1so52554905e9.0
        for <linux-media@vger.kernel.org>; Tue, 12 Aug 2025 09:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755014922; x=1755619722; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BFSWMsjZodOzDrOuJCoS7BkVLEszHuWpZmYI2ozmnzw=;
        b=JQ52cMjobvIUJUk1wn8S3wSV9N6BnjcpKSP4P+bG3OHlI4nkvsskZIOc9D7i6xpmOE
         4We//eeq8gJlmlTg2HASCEkAizK0YiGVW2ZgJKmtkg/t6hvHJInuxvNBwSfxONDcX9PL
         4aNY5nE84/bCQLOXV4fMv8g53igD+oAvejgbJzBWXPzUoMkPBqtzniRJAQGlz9D3TauF
         QR7g4iSsBl3SYobX9yFAB6Qj0JIpvmcWXRtYfaRPCVzH/pis9D3MU8ebDsb58KjldGLa
         l3qbdD5ZHDz8sJAIdJFzdxT2ZG0nm+60ObmKWEBSl71VRkRSl0zzBP3E28tuviyJ9s3w
         ao8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755014922; x=1755619722;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=BFSWMsjZodOzDrOuJCoS7BkVLEszHuWpZmYI2ozmnzw=;
        b=Gf731tpNqDic4DD3MXYmFWK5w7q4o7elb9FY3rbAj7Tcnw5r+xL1dbuJ9koKpKJjYH
         e/F0drds3leEU9op6XUVbcOg5W2oQ42uQxtk3ZRUIJK635FLlgjwXRLoW0Q9eLW8okXv
         YPIJC3zzUpjabivUrTmaaoFFqalO7Lh4g4iJCeQik/X9JKkupQaxp+p4VrApIPA0/Z5p
         wqKGohILyIyDD9kb9rwOVic+gey59CY3NR3UboSAONHofavpZ4YXa9L2+q27Nj+7XMNb
         P9/VzW9OLOInMblwQesrg1T/gnb255+WWhzxY0grh1Ww3FCysrj7dFdoKJnrfsokMJ64
         xc6w==
X-Forwarded-Encrypted: i=1; AJvYcCW8FywM09IKxaQWsDeoPuMRfjEG3G+7BDe2dU2bbZj1X1TmI2bzHcWx4LjL3VQcJGtSA8Me/lZzw44TUw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxaKj+koNWO43Izgev5ttNcj5eNpVB4j4iP7QVy8jGfapio1l+6
	TNAyGy9TDsEtS59ObkhS7BDicpN+WA7lK3QYUp1GPuTZeQ7jeqcgYCdGOVNbCXYYzDM=
X-Gm-Gg: ASbGnctHc5J0+nPFsCPpZkBaR0AuL8TUb6oxrU8GZ/d2sP0XJKXirwhYbV7zvLqawrh
	0uuWHX/PZFvZY/Q4It4raa0M2c4lCvMMRE5yBSLqU+t7pwVlqO9kn/NKkE0nK/a7nwQXgEY52El
	GK5P7BapSSp1FiMD6YA594Gp8r+qsPrmF88iIrUVjz0arALf2XyMsaGwObGzqplGNIQ1NhB8Gnh
	UojKsmTEOZt96FoANrsK1iXwAQd/ZmHqmLAQwOKdJKt5EreMkZR2M1JP7a+O23n1auAIN2YH2Cf
	BLgy3zbw0bFgw8tfU8XDA/qqWu+U1Ea1ykDVrGr8x7jnOFQmXKAWqNYpU1Lpv0WeNVWz55xHALd
	dGlx23WFnTo8JQGjBbDCgOcXYr9oXecVEtZDTGXERDw84QRaClBk5m2cuDMS18vlNYbEB3BzeQJ
	IRod46B7JJHw==
X-Google-Smtp-Source: AGHT+IGWhSp2YqDcC+/Jt+aP3cE7/6QMFB+yYZoU2vCD1m9RO2LLMzcUXXdfrtNNkB+uXFFUtvtc/g==
X-Received: by 2002:a05:600c:1c88:b0:456:11cc:360d with SMTP id 5b1f17b1804b1-45a15b17f2amr3800875e9.9.1755014921954;
        Tue, 12 Aug 2025 09:08:41 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:9086:bd36:16a7:1f8b? ([2a01:e0a:3d9:2080:9086:bd36:16a7:1f8b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459e5843021sm328553675e9.3.2025.08.12.09.08.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Aug 2025 09:08:41 -0700 (PDT)
Message-ID: <8b8207bf-e841-4033-8356-dffa2c2e2d25@linaro.org>
Date: Tue, 12 Aug 2025 18:08:41 +0200
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
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Bryan O'Donoghue <bod@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250710-x1e-csi2-phy-v1-0-74acbb5b162b@linaro.org>
 <20250710-x1e-csi2-phy-v1-2-74acbb5b162b@linaro.org>
 <d7949778-73c4-4575-8db3-a3724f75eb38@linaro.org>
 <16e4883a-a056-46c3-a7c7-a87ff5da89a1@linaro.org>
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
In-Reply-To: <16e4883a-a056-46c3-a7c7-a87ff5da89a1@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12/08/2025 17:05, Bryan O'Donoghue wrote:
> On 12/08/2025 14:39, neil.armstrong@linaro.org wrote:
>>> +    .clk_freq = {
>>> +        zero,
>>
>> It seems clang doesn't like this at all:
>> drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c:486:3: error: initializer element is not a compile-time constant
>>                  zero,
>>                  ^~~~
>> 1 error generated.
> 
> Weirdly I compile with clang..

The tuxmake log is available at https://storage.tuxsuite.com/public/linaro/neil.armstrong/builds/31Boss31K6meeYAxqhJUZo8yhwK/build.log

It uses clang-16

Neil

> 
> thx though
> 
> ---
> bod


