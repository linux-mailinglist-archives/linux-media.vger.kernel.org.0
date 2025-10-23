Return-Path: <linux-media+bounces-45414-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EE8CC0240D
	for <lists+linux-media@lfdr.de>; Thu, 23 Oct 2025 17:52:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 05C5A4EFB28
	for <lists+linux-media@lfdr.de>; Thu, 23 Oct 2025 15:52:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 981A3248F5A;
	Thu, 23 Oct 2025 15:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aKa4W6bC"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F692219313
	for <linux-media@vger.kernel.org>; Thu, 23 Oct 2025 15:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761234741; cv=none; b=NJKKBQ2cCZOF3ZKc2qA0WMg+dl8CS/42+Zg5cqZPYjuHRtBkYmcLWR5ovyQgJFIlB0bPtHDf9kryvCw6V6qUfdi0EXHN8NUuq5B9zpXHI/tUyhlW6FKzeTG+okBdxH4txcISRmX3GVOUljTb3au7gZU8aFaTvZhjDaIovS5dEOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761234741; c=relaxed/simple;
	bh=/3CbpEOkquEFRZXO7OtlGagVjAj11Ngk10f0x7gY8XY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=ssTE97Iid7zA9l7HRbgum+XV2095QxQm9q2zjdpkD4NgbV7w81uVvFQJqnvitJvxC6oFMhmR2NbXyg+XRwWoQiq2iBvj+MFDqhNhBH7d73gd8fQBsQUdexanv+ytd5gn60HHmvJUdMH5g7icYf9ZS6KqFxfMXfiO9Lj2XygOytk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aKa4W6bC; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-475c696ab23so5950305e9.1
        for <linux-media@vger.kernel.org>; Thu, 23 Oct 2025 08:52:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761234737; x=1761839537; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IV/TUoUQECmT72wzxIDblt/fT6nwBO4K7PlTRVcSh2g=;
        b=aKa4W6bCMnimceKsIoqkGp/8MQI1AHrnp/i91ASxxLcLV2756u/zj8it5ytrSiQDOr
         T/apIzeaF5ubqPCdZmCKtuZJCsziCIXZ0OrpSU7MiBl2+6v0zMM5LZAAlTuz1uL6yxFl
         5PZY+gepYe1zoTBQNJIbTjxLQ6LJ3vYVfushLaVEe1DZ88y/3wHfSuCOs9FTXSXhIRzH
         z9VIwodBz3HgaEVV6NXY3lOM7LISa5BJmp5Y/1iA5tFXLtHJy4f2ob58APCPe8LCLAHO
         mt/ZTGA8V8aM47YvrmjKI3qrf/ty3nu7amtaZ5aPXLov9eziiKxD/6B+icsYug7MuDdQ
         V3tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761234737; x=1761839537;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=IV/TUoUQECmT72wzxIDblt/fT6nwBO4K7PlTRVcSh2g=;
        b=CsNNqkjauD4s43wrB0KVqOV76vGp5lkbbBe8iE2dlXx0HNuKcNh59+SyDxw3UhiyUU
         zoMkxyKjk+C9pWZpVL5YolYFFBho8PEtLLrshoTIj8vS724YVIKZK1vPD6q7Hny50/QO
         cciVvn9wzBZWmYEu5FDyuAz1pGN0UH1vkhnQeMa8o+66pPRHda++1d6nbQjGMiR459zp
         1S6HladT3ZJCxmcGGK3u7xFM1EM5p5gYNbtcdpytlFkd8OtUmO/1eT7R/2SOfW49jVgj
         DIkX5xxpmYoYb8Wny33i4u5oGLiWhK4ZJb03kmMRg+bZtRNPi8p394tHxUKd3WbPhbXr
         hGNA==
X-Forwarded-Encrypted: i=1; AJvYcCV/T0pX4RMsC5uT4EegkNDuIB+bKhOGNSK9jyQYVPIjTxIZEfS6YGG5j5RwKTXwFauXO3gFoxk6KtLsMA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxDJvskT/JdMF68bgYWKmh1ReTL504Tnzwhb3fDpy5LyTHG4f7+
	dZTEM52Qk00MEc5nKKsWVP5v9T1u9xERVtgS+9H82KWL11NiRXwFQkW/byfAkSJDnxU=
X-Gm-Gg: ASbGnctNBbO8LU5MHtIgwkZf5u3QsP0wMnpCmYwAKPLJg2q4jfGFZTXnrpgJhJuVA2j
	4mUDPOlHgKnCmR2vHpDgp/CjUKrG1AicmI9RgLLzjb6SCwqXtoSzup5KoBDNpuI70/WYWsg5bRF
	ZtyE2dU/j5ZwWvZWSl35DJSa7NMa92htn7M2ifscpfj0ZU49Lq5VSbYwQBPEv336PFUoIp4uAvP
	cxls65IX7Ixgf9Dm2jeUy2ovWHa0rRaa7kwiDFUxS1x8qfDNIkWojh5CMHvysCY7A/fCWos8CxF
	ZqZfVwq+8+o6E17PjRh6LdozZUPzjNJjLy1DPEgOJzm9dfEr3HLQBsaRqaTuE/98blhsdZLayLt
	xGqc8cTQ8sY1hSJMmSujtCh1JQtVA3sElDXA0fAb24H8U6q0PrL9mdbzJ/9kEIDvLPrhYVR6VVc
	4a+bxQCperUZqYaa5Je2YncUbKcdFda35S68CN4U7GZiH19jvxMs37CxNJI5Ko
X-Google-Smtp-Source: AGHT+IEc0pbxUIJDBgUkF8fr1kGeOYgyh3Pe4JCIXBH5v+qPkcsU0FyNcMfViW5zwHCgfhXuIM2aMQ==
X-Received: by 2002:a05:600c:870b:b0:471:9da:5252 with SMTP id 5b1f17b1804b1-47117919c1cmr199371855e9.29.1761234737381;
        Thu, 23 Oct 2025 08:52:17 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:a1bd:ad6d:e81:795e? ([2a01:e0a:3d9:2080:a1bd:ad6d:e81:795e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475caf2eb9csm43541485e9.14.2025.10.23.08.52.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Oct 2025 08:52:17 -0700 (PDT)
Message-ID: <5cac5efa-af84-4027-b6ca-b8865615d874@linaro.org>
Date: Thu, 23 Oct 2025 17:52:16 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 0/4] media: qcom: camss: Add Qualcomm SM8650 CAMSS
 support
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Bryan O'Donoghue <bod@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20251017031131.2232687-1-vladimir.zapolskiy@linaro.org>
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
In-Reply-To: <20251017031131.2232687-1-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/17/25 05:11, Vladimir Zapolskiy wrote:
> The Qualcomm SM8650 SoC contains a camera subsystem IP, which is
> got supported in the platform device tree by this change series.
> 
> Qualcomm SM8650 CAMSS contains:
> * 6 x CSIPHY,
> * 3 x CSID, 2 x CSID Lite,
> * 3 x IFE, 2 x IFE Lite.
> 
> Previously there was a version of SM8650 CAMSS dt bindings only sent for
> review, but it did not get any reviews from MSM or DT maintainers, this
> series is a fresh respin, and it includes the driver specific changes.
> 
> The CAMSS changes were tested on SM8650-HDK and SM8650-QRD boards
> and SM5JN1 image sensor.
> 
> Link to v2 version of the SM8650 CAMSS dt bindings changeset:
> - https://lore.kernel.org/linux-media/20250423221954.1926453-1-vladimir.zapolskiy@linaro.org/
> 
> Changes from v2 to v3:
> * dropped excessive clock resourses,
> * dropped MCLK dts changes from the series, it will be added along
>    with board specific changes,
> * the suggested comment to squash supply properties is not considered, since
>    CSIPHYs on SM8650 boards have different supplies to different CSIPHYs,
> * added a CAMSS driver change and CSIPHY configuration specific to SM8650,
> * rebased on top of v6.18-rc1
> 
> Link to v1 version of the changeset:
> - https://lore.kernel.org/linux-media/20250312001132.1832655-1-vladimir.zapolskiy@linaro.org
> 
> Changes from v1 to v2:
> * to support a regex in port property names replaced 'properties' with
>    'patternProperties', a sanity check shall pass now, thanks to Dmitry,
> * added a few new line separators between property groups in sm8650.dtsi
>    and qcom,sm8650-camss.yaml dt bindings documentation, thanks to Bryan,
> * added the fourth interrupt cell value needed for v6.15, thanks to Neil,
> * added a given Reviewed-by tag to one of the patches, thanks to Bryan,
> * rebased for v6.16.
> 
> 
> Vladimir Zapolskiy (4):
>    dt-bindings: media: Describe Qualcomm SM8650 CAMSS IP
>    media: qcom: camss: Add Qualcomm SM8650 CAMSS support
>    media: qcom: camss: Add CSIPHY 2.2.0 lane configuration for SM8650
>    arm64: dts: qcom: sm8650: Add CAMSS device tree node
> 
>   .../bindings/media/qcom,sm8650-camss.yaml     | 375 ++++++++++++++++++
>   arch/arm64/boot/dts/qcom/sm8650.dtsi          | 180 +++++++++
>   .../qcom/camss/camss-csiphy-3ph-1-0.c         | 102 +++++
>   drivers/media/platform/qcom/camss/camss-vfe.c |   2 +
>   drivers/media/platform/qcom/camss/camss.c     | 326 +++++++++++++++
>   drivers/media/platform/qcom/camss/camss.h     |   1 +
>   6 files changed, 986 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/media/qcom,sm8650-camss.yaml
> 

Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD

