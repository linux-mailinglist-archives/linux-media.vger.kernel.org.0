Return-Path: <linux-media+bounces-36325-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 83BAEAEE319
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 17:55:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9D77E7A55CB
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 15:54:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 393CF28F95F;
	Mon, 30 Jun 2025 15:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aL9hfgBd"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1AB325C6E7
	for <linux-media@vger.kernel.org>; Mon, 30 Jun 2025 15:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751298930; cv=none; b=rjsKj8NLHobyApdAs4FXvJ5gn49obAGGr1ksZD0EtpAUjoDKCBPBPbQ9J/Ng4BTFphgKIx0CImbi78+QDBrZeCA1AaJiqHUVC2x5q3IAbU+4yuCXw1J9bLenW1mT/vZ8+OkMlDFIs29UmgwkFXKz8oUP7v7NDeJYUV7tcCU3rGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751298930; c=relaxed/simple;
	bh=dkm1VkSYIXq2i+j+TBxX/R3W+5XAHuqA0KPiJGf+tk8=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=qinQtCJXrxqFDtb9GyEDOT3xCZqQIdtddfeNJW5FfnN+dZsyd2tGpTgYL2j3t8V2KSBWmjnYaMyfa+U+70upvS/FdyLKK9zD6h9LqanV6G3qJ3uj4hMdWcVWFtJUjmhZwEl5xLLaSTfuLjOhdPQfwd7n2yGSLm56uZ+QxPNpj0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aL9hfgBd; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-450cf0120cdso23601095e9.2
        for <linux-media@vger.kernel.org>; Mon, 30 Jun 2025 08:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751298927; x=1751903727; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NKu8cGWr+68gHqtckpC2Luem6Zfvd9abbXfE5F+45NE=;
        b=aL9hfgBdNmBJVcNQTcFrSjBqhhGLPsQ+ivPqDU7zD02Ll9KR5BTIKrOeZsdoAqf2ry
         eNZrbwspZwzrO/dXvepqanY613HLl2hcnoLURoAh7A9Lf+qfYRUcSAIGw8NhsXa7otC4
         SrZwOinW+MeMdH8RvTCAqDCU6HKhvlRByPuQ09m2+6Xf+O9TexQ1vSkc6hdUHxZUHHIb
         AI9rA4mjBoN+wE54AMHOkHEvnftr2Z3p+eLeAWvpv2/sFnOm0adc7ZIpBecfE0audU2k
         MJMFFiDLz3R9lzmTOyPgI795Vf16+5JYLmRaZpbhEfwNSb/KDWtLF+uQ25qTPFqKHdMP
         dWbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751298927; x=1751903727;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=NKu8cGWr+68gHqtckpC2Luem6Zfvd9abbXfE5F+45NE=;
        b=KzLg9DSy5YF2yKGgI/JHcyPDTBTdVox5gQ71x9Q8Zpr3pTYGGt5Z1eHEFGLFl9zxL3
         CvhpmVhyxzN5reAE6YLLAsh/+pNo/ZHr5mVdbXwcDjyi68aWFCjCcQzvLR9YukgbEWPA
         0QEvF5wBYVhKLTHqS4jSQK16fUbEyFvm56Y5O7KYjiyFlIsWIiGkJ71kz2AlveZA7lJm
         sqoyGgzBaRHRzBf40wd+MRNgWRXnQyePUOrjZC5kSjNwHr39lxL4fovmNtmBmAZJFoR4
         taDV9h9vuCePSP/h/6OD0uyrq0e9yB1Fj+PNYnbZaDRUgV9AlVXsQ5LfnF92J3NmXwJp
         kJ6g==
X-Gm-Message-State: AOJu0Ywg17tHTjcdL8cRGyd9ypCirdilA+cdAyueQ0D/pCSIqNeEDO1Y
	5gxztFXxQd+GbzENGzniU7/eqe2uPrnZjZilgotw+0BpC8rTj8oYJD9LALAd4JA60M0=
X-Gm-Gg: ASbGncsZm3r676j+niUmEclJWZMq2fTIQnnXRBCwkghwxreIdMtk8ShmI7CLgJ0LW1k
	ZkhXuCAzqUvovTtDOoi5cCh5OZ0mrUG6R9EizXEzdWr8/YVYEBcCLo2YVAD+PhB5zFERiSwHnPW
	7qnyKlar8HmQvGWSq8hiPqW0+eVtVvxFw+qWTXtOIha+eV2yc+su+efkMxVVBC0njqY0FAuU8TO
	RPNcu4MoYt+vQ9av6yBR6r+1TB49eJ+v37Qyd0ubi88xLUTN00PFdmbkz9PAFwQ7kPQ89J/ksIe
	CUwlQJNys51355v8WXSk5y/4zKT+oX2ZcSGk/orDhcnTsGxMwIJWsY1EO1oAxmzleUzDGv+ofb/
	Huo6WRe7Nlp4uQ+V/DSkEB4Z1kbgPE0kVhT3P5W0=
X-Google-Smtp-Source: AGHT+IGcZJvqgodwu6og/PQrCUHlDvqPoVw5PfMCF40QrXxTmeW826ig0xIT3x2Elxqae+KzMW5ARA==
X-Received: by 2002:a05:600c:3e8e:b0:442:e9ec:4654 with SMTP id 5b1f17b1804b1-4538ee5ce0cmr137016225e9.8.1751298927122;
        Mon, 30 Jun 2025 08:55:27 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:abe8:a49c:efe7:4dfb? ([2a01:e0a:3d9:2080:abe8:a49c:efe7:4dfb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e599bdsm10530457f8f.84.2025.06.30.08.55.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 08:55:26 -0700 (PDT)
Message-ID: <8089100e-ed0e-4f79-a1c6-d06955c8d8f1@linaro.org>
Date: Mon, 30 Jun 2025 17:55:26 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 0/5] Introduce "non-pixel" sub node within iris video
 node
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250627-video_cb-v3-0-51e18c0ffbce@quicinc.com>
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
In-Reply-To: <20250627-video_cb-v3-0-51e18c0ffbce@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 27/06/2025 17:48, Vikash Garodia wrote:
> This series introduces a sub node "non-pixel" within iris video node.
> Video driver registers this sub node as a platform device and configure
> it for DMA operations. All non pixel buffers, i.e bitstream, HFI queues
> and internal buffers related to bitstream processing, would be managed
> by this non_pixel device.
> 
> Purpose to add this sub-node:
> Iris device limits the IOVA to an addressable range of 4GiB, and even
> within that range, some of the space is used by IO registers, thereby
> limiting the available IOVA to even lesser. For certain video usecase,
> this limited range in not sufficient enough, hence it brings the need to
> extend the possibility of higher IOVA range.
> 
> Video hardware is designed to emit different stream-ID for pixel and
> non-pixel buffers, thereby introduce a non-pixel sub node to handle
> non-pixel stream-ID into a separate platform device.
> With this, both iris and non-pixel device can have IOVA range of
> approximately 0-4GiB individually for each device, thereby doubling the
> range of addressable IOVA.
> 
> Tested on SM8550 and SA8775p hardwares.

Is there any test to validate this works correctly?

Neil

> 
> Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
> ---
> Changes in v3:
> - Add info about change in iommus binding (Thanks Krzysztof)
> - Link to v2: https://lore.kernel.org/r/20250627-video_cb-v2-0-3931c3f49361@quicinc.com
> 
> Changes in v2:
> - Add ref to reserve-memory schema and drop it from redefining it in
> iris schema (Thanks Krzysztof)
> - Drop underscores and add info about non pixel buffers (Thanks Dmitry)
> - Link to v1: https://lore.kernel.org/r/20250620-video_cb-v1-0-9bcac1c8800c@quicinc.com
> 
> ---
> Vikash Garodia (5):
>        media: dt-bindings: add non-pixel property in iris schema
>        media: iris: register and configure non-pixel node as platform device
>        media: iris: use np_dev as preferred DMA device in HFI queue management
>        media: iris: select appropriate DMA device for internal buffers
>        media: iris: configure DMA device for vb2 queue on OUTPUT plane
> 
>   .../bindings/media/qcom,sm8550-iris.yaml           | 40 ++++++++++++++++-
>   drivers/media/platform/qcom/iris/iris_buffer.c     | 15 ++++++-
>   drivers/media/platform/qcom/iris/iris_core.h       |  2 +
>   drivers/media/platform/qcom/iris/iris_hfi_queue.c  | 20 ++++++---
>   drivers/media/platform/qcom/iris/iris_probe.c      | 50 +++++++++++++++++++++-
>   drivers/media/platform/qcom/iris/iris_vb2.c        |  4 ++
>   6 files changed, 119 insertions(+), 12 deletions(-)
> ---
> base-commit: 8d2b7fde56597ca912f5daaf3ab58915458ba1fc
> change-id: 20250619-video_cb-ea872d6e6627
> 
> Best regards,


