Return-Path: <linux-media+bounces-36324-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 11EB8AEE308
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 17:48:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4A5D017D1D5
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 15:48:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DE8528FFF6;
	Mon, 30 Jun 2025 15:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cHpH5WVj"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4C5028ECE2
	for <linux-media@vger.kernel.org>; Mon, 30 Jun 2025 15:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751298500; cv=none; b=hxbJqqRpV+aHvXJm+QQZ+ypBnTUf2CX2LJeT6JrKFw+DnRXb+JUf6FbqdqAeTcNP49De4ZbAboKKZVeU/8kKnACmZfUh4t0bopOAsFP6BYq9ObQRZ9QG4uFZ46nBiSxthJYGYPoagwl5wM3PfP1eUqL+anMwbu1hnniguMC52fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751298500; c=relaxed/simple;
	bh=SrTihHpN0kG0jDCtReJUG6gpQ81DKH4GugT4xQrChZg=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=n+WtmM+PxEEZdBx+Sn3vdL6k/2uqQQUfyUBEbW5I2Fr9IudB+Jf+7w7iIn2uHOkX5142hMT4eSbEL4+rBnyBA9rw4f/jQOBB2wWdFlHmYBVfEJ9C38lCh39ATGA8t9/REmSN5WV1tE8riSgcy/2Bt8YRL0whZCrQzAh2neb6O/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cHpH5WVj; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-45348bff79fso22926805e9.2
        for <linux-media@vger.kernel.org>; Mon, 30 Jun 2025 08:48:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751298497; x=1751903297; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6OlHCOY15rXV+On91C0R9sl/XKka0cSxQGofrSFmOgI=;
        b=cHpH5WVjTt1cr6xjh9vYIljPYo/R0E+lRJjDXHmpuvA5ls/lUkp6vm7z31LEh3fmRw
         wq0vY8ah6enbdJkxsUtWhbP1+Iz+9AocvUozwTBYSNSk4cZCcCPQOl5IhsjqO1qj9NEj
         43ZJc5KreT3GfO2W7ntEkLOg7VRj8bJbl96zrWWVZo4ROSHIWzGX2LTT1BxE/XFnViIm
         FXasPUkrzzPnVRYb4B1Bz923sFc9ozNw+Sm9So3uRfGPw9C+mK064sGYGSdtK9hBTHQS
         2YHoTC1hkwJdJKuy6Nez8qNnJU3/fYvXcgh3NoOEKUiu/0H/d/WJspluoJEuE9nXoU7+
         CEGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751298497; x=1751903297;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6OlHCOY15rXV+On91C0R9sl/XKka0cSxQGofrSFmOgI=;
        b=mnC5i7AQIAYwAI52k82Bb4yaYQZEzikm1BzdkBWnHIckVIhv5IIn3kNgnQlFuPmsNB
         2qdadlWYCfJqRDybBbiI5vQZi9kGIZRIUfJMJVjEzgYLgf/N1/zBfWRE/iY350c0Q6ox
         IE3iQxw1vJRvl86fFqaNIG1fpzrN9MzqsakBc60rT/KcX8KHkvNdvU81Zr5STpsshC2X
         usEhu26Bq2w6MLaLN3yaUG8PTfW9F62E0UYnyf4vSnz8tgabThNUgoc1EgFH9xD04dd4
         uO8NEjxfXSXAdhmo8aX6xl53ujGLBDmb6uX7HcYxMaHjzJxGpHb9tp6ANIkWSR81S9oN
         IpBg==
X-Gm-Message-State: AOJu0YzUHJzQ+4vEmDbOFZk03aoVBA4AzVmZqK3pUgJCHZpVshgUeSDp
	K/p+Oohr9iETF49sX7G8UPE27XXqJdTgXUUIOZJuAAEKmP6aZBg1RMNvSGX3G4ajbVU=
X-Gm-Gg: ASbGncsZMS3CAf1Rhw6d2e9C31aSjioEeTvRBhVTUO6XNp8RY1PiEsXvBNXJji1ISGd
	UuoFD87S8Zvp8rDiHG5c2IFifkpVKsbD/mMc+IG0E+yItqoeEWtsv3a49RahX3R30S53AZ5Bdfk
	9rZ9yHkZZDCdgGZlm3V94+Ibc44er4iGKjyNgkacTvk2/T82Tz6lZ03URLPyYh89yPPIS3h+Bav
	9aYMusySlu5YpfLQ09OPszZNkL0gtaamXI70ptXSyuwEr3sEC9z1whjPcnCg/YX3TY73P1G2TEX
	+kwF8TJM9tuqPxdGR7cIkG14upkpERn6FUxcLtD/ORU6KmdnLFA9CgiFMGVe9lwxUfdmUeSspeC
	bBKBpMr8Kn903YhTo5eJ+HVSd/8RSMN0XXFqy4M8=
X-Google-Smtp-Source: AGHT+IHzLW+SlgPOT+2drTK9o8qmAHygX6MBC9S6wPNkbxl0aYMlFwvzHCkQ/qfb+DvCPJQuUYMeLA==
X-Received: by 2002:a05:600c:1e87:b0:43c:ea1a:720c with SMTP id 5b1f17b1804b1-453900db0f6mr121999825e9.18.1751298496907;
        Mon, 30 Jun 2025 08:48:16 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:abe8:a49c:efe7:4dfb? ([2a01:e0a:3d9:2080:abe8:a49c:efe7:4dfb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e59ab5sm10525436f8f.82.2025.06.30.08.48.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 08:48:16 -0700 (PDT)
Message-ID: <018415b4-ce63-4baa-b8c5-38dc7f5a1fd2@linaro.org>
Date: Mon, 30 Jun 2025 17:48:15 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 1/5] media: dt-bindings: add non-pixel property in iris
 schema
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250627-video_cb-v3-0-51e18c0ffbce@quicinc.com>
 <20250627-video_cb-v3-1-51e18c0ffbce@quicinc.com>
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
In-Reply-To: <20250627-video_cb-v3-1-51e18c0ffbce@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27/06/2025 17:48, Vikash Garodia wrote:
> Existing definition limits the IOVA to an addressable range of 4GiB, and
> even within that range, some of the space is used by IO registers,
> thereby limiting the available IOVA to even lesser. Video hardware is
> designed to emit different stream-ID for pixel and non-pixel buffers,
> thereby introduce a non-pixel sub node to handle non-pixel stream-ID.
> 
> With this, both iris and non-pixel device can have IOVA range of 0-4GiB
> individually. Certain video usecases like higher video concurrency needs
> IOVA higher than 4GiB.
> 
> Add reference to the reserve-memory schema, which defines reserved IOVA
> regions that are *excluded* from addressable range. Video hardware
> generates different stream IDs based on the predefined range of IOVA
> addresses. Thereby IOVA addresses for firmware and data buffers need to
> be non overlapping. For ex. 0x0-0x25800000 address range is reserved for
> firmware stream-ID, while non-pixel (bitstream) stream-ID can be
> generated by hardware only when bitstream buffers IOVA address is from
> 0x25800000-0xe0000000.
> Non-pixel stream-ID can now be part of the new sub-node, hence iommus in
> iris node can have either 1 entry for pixel stream-id or 2 entries for
> pixel and non-pixel stream-ids.
> 
> Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
> ---
>   .../bindings/media/qcom,sm8550-iris.yaml           | 40 ++++++++++++++++++++--
>   1 file changed, 38 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
> index c79bf2101812d83b99704f38b7348a9f728dff44..4dda2c9ca1293baa7aee3b9ee10aff38d280fe05 100644
> --- a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
> @@ -65,10 +65,31 @@ properties:
>         - const: core
>   
>     iommus:
> +    minItems: 1
>       maxItems: 2
>   
>     dma-coherent: true
>   
> +  non-pixel:
> +    type: object
> +    additionalProperties: false
> +
> +    description:
> +      Non pixel context bank is needed when video hardware have distinct iommus
> +      for non pixel buffers. Non pixel buffers are mainly compressed and
> +      internal buffers.
> +
> +    properties:
> +      iommus:
> +        maxItems: 1
> +
> +      memory-region:
> +        maxItems: 1
> +
> +    required:
> +      - iommus
> +      - memory-region
> +
>     operating-points-v2: true
>   
>     opp-table:
> @@ -86,6 +107,7 @@ required:
>   
>   allOf:
>     - $ref: qcom,venus-common.yaml#
> +  - $ref: /schemas/reserved-memory/reserved-memory.yaml
>     - if:
>         properties:
>           compatible:
> @@ -117,6 +139,16 @@ examples:
>       #include <dt-bindings/power/qcom-rpmpd.h>
>       #include <dt-bindings/power/qcom,rpmhpd.h>
>   
> +    reserved-memory {
> +      #address-cells = <2>;
> +      #size-cells = <2>;
> +
> +      iris_resv: reservation-iris {
> +        iommu-addresses = <&iris_non_pixel 0x0 0x0 0x0 0x25800000>,
> +                          <&iris_non_pixel 0x0 0xe0000000 0x0 0x20000000>;
> +      };
> +    };
> +
>       video-codec@aa00000 {
>           compatible = "qcom,sm8550-iris";
>           reg = <0x0aa00000 0xf0000>;
> @@ -144,12 +176,16 @@ examples:
>           resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>;
>           reset-names = "bus";
>   
> -        iommus = <&apps_smmu 0x1940 0x0000>,
> -                 <&apps_smmu 0x1947 0x0000>;
> +        iommus = <&apps_smmu 0x1947 0x0000>;
>           dma-coherent;
>   
>           operating-points-v2 = <&iris_opp_table>;
>   
> +        iris_non_pixel: non-pixel {

You can drop the label for this node.

Neil

> +            iommus = <&apps_smmu 0x1940 0x0000>;
> +            memory-region = <&iris_resv>;
> +        };
> +
>           iris_opp_table: opp-table {
>               compatible = "operating-points-v2";
>   
> 


