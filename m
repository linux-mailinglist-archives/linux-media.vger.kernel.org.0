Return-Path: <linux-media+bounces-32868-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E874ABD0D9
	for <lists+linux-media@lfdr.de>; Tue, 20 May 2025 09:48:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 28C6A7B2233
	for <lists+linux-media@lfdr.de>; Tue, 20 May 2025 07:46:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CACDB25E83C;
	Tue, 20 May 2025 07:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yS+pi9es"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C95825DD18
	for <linux-media@vger.kernel.org>; Tue, 20 May 2025 07:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747727234; cv=none; b=FVyLt7IiSMZiIqdpqiPoF2ocoIRdVcmGCRs9pw069Zj9s2lxR/gBMaihW6GneTtYYvbJUMkd9uHTQlFsOwZCyHCBBPULt/OioPYZgw5UL+YQ5W+LfQVaAfOfL2yNV9VXMfpOsYIXiyS1pyoGiZjcXeRw8if2514w4axD8GD5uGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747727234; c=relaxed/simple;
	bh=CQKXTh+yOMIZtQUJ/0Y2SeTA3aVkmSKk5cNZ9ONeNcE=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:References:
	 In-Reply-To:Content-Type; b=SHcfjM14iyM23tqpiL2d6Z96A0fxOvZj0I63XtEShrZcb8z5dB5n5DGdNqdyUSlTZRr40wvD0Tf9GL1MEzdLgv4Xxgo8rEW/HOH5XVQk0Ad/Vqavqz07nTvwQ+WrQK2pAC3NaFVhjzRKB1DQ97TRkfJvUbUWCKYQPk3NlCXrYH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yS+pi9es; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43d04dc73b7so57384815e9.3
        for <linux-media@vger.kernel.org>; Tue, 20 May 2025 00:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747727231; x=1748332031; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vhQUwhnYU7FI75x6CtVnKEX/XR74SbbKqPe6yi9d5HE=;
        b=yS+pi9esHPzn9P8cnOK0HW60xsUX6K6tzLe8q0f3h37mVMk1RnkJ090KPSSiy2RLK/
         CDFgoxrs4K0hqcjSsY5d1p3WwaRgZiFsMV88Ae4OK4amOsSmaif6iPbDNsLvJpzOXrPJ
         CpVIUgL0pmsqW5KMjHjx5v91//4ov5zOVIweUvY7jov1lohcDzhaxiN9DoSwV+7p+ze7
         xQFDqKNUQkqFvS6HLFWOLCJL94bCIH2uNqWUf3bC0PXF+PceY7No7OxUktmb9FjlY3yJ
         8TC+7ifxs6i1CMpaoHJcvAbB03jEdh8Ubk6Y6ZYuTvtO0bJJinMSy6snbUnod4S8W7Gc
         YouQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747727231; x=1748332031;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vhQUwhnYU7FI75x6CtVnKEX/XR74SbbKqPe6yi9d5HE=;
        b=in+lsbxjbeOOZx6EIKA4woJA4xmEZ0MbaQm5ZtZNRptwWoV18J+e6k5YrpzCxHq5rO
         UP355hQre6bmKn7rA8RGgXjusi937/8TDKRvUKnlY6FwWazwEaEUZ0wUrz2AIasHhp7I
         6pOaO8zKE1L8Ko+KV0TC/CHW9qI3L75TsrM7MgtS7biW1UgoLN2UkKHGxil9Bx+SoLMg
         VETqctdo8NlGXrqgCVwkmjPwnyjESIAStQZyJmq0exkhrcTCiWjRAx14tXvjHRJHI6kr
         QP/yhqKjJg4YooLeIhqAdnKOOwjGNZ55qgE3S2RcFtYHLs1bG/3eqmNhLw0BF6X+OGXA
         pm6Q==
X-Forwarded-Encrypted: i=1; AJvYcCWyJaxn+E64d9Ge0Ix6/29uD2ZBDq0lo5Q2feq+zendvWJT8PJ1/egdIAwq6YF+BKDQlPJGRskWdqtKdw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwzqUzdmUNi/ttEzCtKu5IquGIVm53yHjvQTmTPF7y/986Vy4yX
	CRsprRy9qrMik/zYS7ufU4n8ghyjFp5HOqk2IXIGcZn98YFQfpg5UXCMgAuDQGMu9vw=
X-Gm-Gg: ASbGncuI4XDXhVsVhdE4+SsfxiI3xB6Ck45p/IEbk1mGYCJ3+IMtzcVruL35dKGXV9b
	ztqkU0Xy1tim2dk7Yl3bbMzo+zHsR7aAzAI4tGymuP+s+qMbWxbIwrODyKeNtkbv0fKtFTyJzKG
	DxKXxzhc8HoP3nHmcynWcc3t+CwVuHGBIP0yaSGrMXoN/gGc4Oyd4me/83rx55RfSFHb9nsQ43s
	/Gv6+NgqOKgNTbyn95HyFYgknXHSrqVlvCYtTDhM3lv03mhYWNSXGvnH+exl9Jm3KAdn/nrjARJ
	KevH/zozmEoxQHGXnPEDaJph4trMDWHormCTeS5AbwK2oPbq6Oy5fvMyRC4ppXZ9QYoQo5l/4fE
	2NV9W6FXR0An0n1DjtKE7s8S+mz6u
X-Google-Smtp-Source: AGHT+IFvrNxWWONN6fA7Izq7hKuoATdvJpsXif6rxp8mTFRfU9yuDA1SyNE9rZHKlxR6ynqs0C9K/A==
X-Received: by 2002:a05:600c:3e88:b0:43c:fbbf:7bf1 with SMTP id 5b1f17b1804b1-442fd6724bbmr165087985e9.30.1747727230609;
        Tue, 20 May 2025 00:47:10 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:fb2e:6266:4e39:ce68? ([2a01:e0a:3d9:2080:fb2e:6266:4e39:ce68])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca8874bsm15599930f8f.67.2025.05.20.00.47.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 00:47:10 -0700 (PDT)
Message-ID: <0c88d9e3-a6d4-4a28-a96f-d09da34b78d2@linaro.org>
Date: Tue, 20 May 2025 09:47:09 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 1/3] media: qcom: camss: vfe: Stop spamming logs with
 version
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250520060310.7543-4-krzysztof.kozlowski@linaro.org>
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
In-Reply-To: <20250520060310.7543-4-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20/05/2025 08:03, Krzysztof Kozlowski wrote:
> Camss drivers spam kernel dmesg with 64 useless messages during boot:
> 
>    qcom-camss acb7000.isp: VFE:1 HW Version = 3.0.2
>    qcom-camss acb7000.isp: VFE:2 HW Version = 2.4.0
> 
> All of these messages are the same, so it makes no sense to print same
> information 32 times.
> 
> The driver does not use read version at all, so if it was needed for any
> real debugging purpose it would be provided via debugfs interface.
> However even then printing this is pointless, because version of
> hardware block is deducible from the compatible.  Fix the code to adhere
> to Linux kernel coding style: being silent on success.  For the same
> reasons this should not be even dbg message (see driver development
> debug guide: "In almost all cases the debug statements shouldn't be
> upstreamed").
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
<snip>

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

