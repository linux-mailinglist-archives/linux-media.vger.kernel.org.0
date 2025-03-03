Return-Path: <linux-media+bounces-27408-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ED2EEA4C94A
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 18:24:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3656417AC78
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 17:16:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C583A214815;
	Mon,  3 Mar 2025 16:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="indBYQiQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47BAF219A68
	for <linux-media@vger.kernel.org>; Mon,  3 Mar 2025 16:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741021184; cv=none; b=bJPBjvqpo9WvA7zzPzMC8DKErpx/vUO/KAXGbKkfNmzv4V4zGJ64ky1Jeb9reNiCgdy7AgSC9CHopXrEmmjIVqU/l4kLTaox4cmJA7pz6Xw6MWwwMh9PcdRYMoc+y28c7lZdrsbnZAT/3bQHhG7znUzFGjrZRHwwbjkTFsXpeTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741021184; c=relaxed/simple;
	bh=oH978JFzs5QlFfeiXA41hwt/41QiwNuuxnrXBUVHP/E=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=RMPOgeAPxtV2E5yIKAaLqC62KCTPYvCG7bMQhSFl5PUx3hcgSqSfShYHgINHccZisxb6I8H2BCY6n7g+8Q7hPAGpr7FewoAhsTwbCr7kjSWI9QdJBRrA4R50g2nN6fjYrtWFGPnvxFoc3SaTBvejar2MfxVQPETYw70HKGVPp30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=indBYQiQ; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4398ec2abc2so42328655e9.1
        for <linux-media@vger.kernel.org>; Mon, 03 Mar 2025 08:59:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741021180; x=1741625980; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rqEytWC5Mz9hcceZZmQuQUkkVtwWYuhWvrPiRd/Fx4k=;
        b=indBYQiQscVvGgwbf2QX7V2S7+pzkSj/JD3P2TGZSscZbFbS52f61gSmv1m9h4m1qo
         spkd3w+ikeeFZx2TD1qYh3+8QM9e4NkUfYDqDWeXQTHUp3vyW+9rdiEE2ETCbdeHgegz
         sFlS4Bjo7mQZa4zR2FoY6pAazFayZDsagyOSwZSsyqtzhWKLBRHM8ThdVLygytbDpb1L
         sIZsGUXjH/hXsYOABN1oKcvooDY0R5WRnyzB6YNYye5HEbklH7ar99AVvJUKCKMN2Y93
         UsvBCisqKC8g+Rqxm7lDNMdF5EAwI6xsLo9ebgQdk+iCO+5eD3JeOSapsztDuSMlhUCa
         HedQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741021180; x=1741625980;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rqEytWC5Mz9hcceZZmQuQUkkVtwWYuhWvrPiRd/Fx4k=;
        b=eBD3B/sFyFoAAagaJKExS0JKEaCoo7P/dzYvdX+9cvTomdOHDj27MIERYS2oQFiyUA
         QuIMmcyPCEt+EjsYc217uHfmf4NkdFWkbsjWkswZBDoTUy9MIq7nQcT6aIf/SqHRQeYX
         z5645R7xATL44tC636m+UCa7G0kzHJpZd1jPMxnMhgUAsavOzFcznWHHfbCR5oQAVjlj
         bZyysQbuVVh7B/jXQAdSNtQR+sd0c/tQJeygWhDbxS4zdBA/f/BUwM/K4N8+tXbtLPc/
         2Df+/QYwqEbp8VS+6QjcuRf0oV4r+YRc+ZXCLa8AsGMnGVvL7f5OTn/Uw5zULKUpSEz+
         LmJA==
X-Forwarded-Encrypted: i=1; AJvYcCWMr35mRMzHVcvsiKkQAMIDswIW1nh//d+Z08fEurt0zYUWlpmbhu8gcfHYvDQHQqT4+NeH7JSjtDeLtw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzPidxD9xlguuMfA7SMp4SEpDGLQvseK9yd86ER6DbxwtoITLfL
	BaxDHpzHCLLWO5bcJ3BgvuaiZs3uH+XM1vdkQB1bzc9kjkwGh0fsBcKQBnDSOCg=
X-Gm-Gg: ASbGncvLYYAza7STeaLzOXovoLm+qsu6QBiD1FqJ7YJYGRI22iSngPcML7xStu12fWh
	9bz2511vYZo5A/7RCj34bDHvi7uFCHXam6BWfOzsYEtiPDpLBKPAZFRF4UjmL1UhvwjxW7sHBrI
	nseOVnoCKBmzGQJPHviKx0FaxzMbfsmknJo5F8biKUNk0um999Lu2KeB3F20Va48yqF5aSiCsIb
	17W4Hk8bk6aCrCrhkxMBgcuPbzrXaVsksxhcp2Af+pmriuxA/XL1jlfNLUVD4k3UsWCrFuArUQo
	duYmmEPXiQ0GLMnvRP83dF5WaIu+M3MbZffTT8hvE86fWYx4He03XyYc5t+cH5d9J8kM1FMRJ9B
	Tt+vMsj54X7za89Wm8B2zJQ==
X-Google-Smtp-Source: AGHT+IHB5e8qHoNaz92JEh8SpwvriHPYxgjOv/OhwXAPTDqbY6gedugAXYtghujiNdzQrADoIS9mEg==
X-Received: by 2002:a05:600c:3b24:b0:439:9496:17df with SMTP id 5b1f17b1804b1-43ba66fee15mr121905145e9.13.1741021180506;
        Mon, 03 Mar 2025 08:59:40 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:1c49:dea2:d749:5015? ([2a01:e0a:982:cbb0:1c49:dea2:d749:5015])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43b694524c6sm171865805e9.0.2025.03.03.08.59.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Mar 2025 08:59:40 -0800 (PST)
Message-ID: <71c8e765-7eb8-4572-8461-30e4761be836@linaro.org>
Date: Mon, 3 Mar 2025 17:59:39 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 3/4] media: platform: qcom/iris: add support for vpu33
To: Philipp Zabel <p.zabel@pengutronix.de>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250225-topic-sm8x50-iris-v10-v1-0-128ef05d9665@linaro.org>
 <20250225-topic-sm8x50-iris-v10-v1-3-128ef05d9665@linaro.org>
 <1fcf08fe37a8e14c4acae445d65bd1503b13b6d2.camel@pengutronix.de>
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
In-Reply-To: <1fcf08fe37a8e14c4acae445d65bd1503b13b6d2.camel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 28/02/2025 17:38, Philipp Zabel wrote:
> On Di, 2025-02-25 at 10:05 +0100, Neil Armstrong wrote:
>> The IRIS acceleration found in the SM8650 platforms uses the vpu33
>> hardware version, and requires a slighly different reset and power off
>> sequences in order to properly get out of runtime suspend.
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   drivers/media/platform/qcom/iris/Makefile          |   1 +
>>   drivers/media/platform/qcom/iris/iris_vpu33.c      | 315 +++++++++++++++++++++
>>   drivers/media/platform/qcom/iris/iris_vpu_common.h |   1 +
>>   3 files changed, 317 insertions(+)
>>
>> diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
>> index 35390534534e93f4617c1036a05ca0921567ba1d..6b64c9988505afd9707c704449d60bb53209229f 100644
>> --- a/drivers/media/platform/qcom/iris/Makefile
>> +++ b/drivers/media/platform/qcom/iris/Makefile
>> @@ -21,6 +21,7 @@ qcom-iris-objs += \
>>                iris_vdec.o \
>>                iris_vpu2.o \
>>                iris_vpu3.o \
>> +             iris_vpu33.o \
>>                iris_vpu_buffer.o \
>>                iris_vpu_common.o \
>>   
>> diff --git a/drivers/media/platform/qcom/iris/iris_vpu33.c b/drivers/media/platform/qcom/iris/iris_vpu33.c
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..128a050f206f99ec0d43b97ff995fa50d5684150
>> --- /dev/null
>> +++ b/drivers/media/platform/qcom/iris/iris_vpu33.c
>> @@ -0,0 +1,315 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
>> + */
>> +
>> +#include <linux/iopoll.h>
>> +#include <linux/reset.h>
>> +
>> +#include "iris_instance.h"
>> +#include "iris_vpu_common.h"
>> +#include "iris_vpu_register_defines.h"
>> +
>> +#define WRAPPER_TZ_BASE_OFFS			0x000C0000
>> +#define AON_BASE_OFFS				0x000E0000
>> +#define AON_MVP_NOC_RESET			0x0001F000
>> +
>> +#define WRAPPER_DEBUG_BRIDGE_LPI_CONTROL	(WRAPPER_BASE_OFFS + 0x54)
>> +#define WRAPPER_DEBUG_BRIDGE_LPI_STATUS		(WRAPPER_BASE_OFFS + 0x58)
>> +#define WRAPPER_IRIS_CPU_NOC_LPI_CONTROL	(WRAPPER_BASE_OFFS + 0x5C)
>> +#define REQ_POWER_DOWN_PREP			BIT(0)
>> +#define WRAPPER_IRIS_CPU_NOC_LPI_STATUS		(WRAPPER_BASE_OFFS + 0x60)
>> +#define WRAPPER_CORE_CLOCK_CONFIG		(WRAPPER_BASE_OFFS + 0x88)
>> +#define CORE_CLK_RUN				0x0
>> +
>> +#define WRAPPER_TZ_CTL_AXI_CLOCK_CONFIG		(WRAPPER_TZ_BASE_OFFS + 0x14)
>> +#define CTL_AXI_CLK_HALT			BIT(0)
>> +#define CTL_CLK_HALT				BIT(1)
>> +
>> +#define WRAPPER_TZ_QNS4PDXFIFO_RESET		(WRAPPER_TZ_BASE_OFFS + 0x18)
>> +#define RESET_HIGH				BIT(0)
>> +
>> +#define CPU_CS_AHB_BRIDGE_SYNC_RESET		(CPU_CS_BASE_OFFS + 0x160)
>> +#define CORE_BRIDGE_SW_RESET			BIT(0)
>> +#define CORE_BRIDGE_HW_RESET_DISABLE		BIT(1)
>> +
>> +#define CPU_CS_X2RPMH				(CPU_CS_BASE_OFFS + 0x168)
>> +#define MSK_SIGNAL_FROM_TENSILICA		BIT(0)
>> +#define MSK_CORE_POWER_ON			BIT(1)
>> +
>> +#define AON_WRAPPER_MVP_NOC_RESET_REQ		(AON_MVP_NOC_RESET + 0x000)
>> +#define VIDEO_NOC_RESET_REQ			(BIT(0) | BIT(1))
>> +
>> +#define AON_WRAPPER_MVP_NOC_RESET_ACK		(AON_MVP_NOC_RESET + 0x004)
>> +
>> +#define VCODEC_SS_IDLE_STATUSN			(VCODEC_BASE_OFFS + 0x70)
>> +
>> +#define AON_WRAPPER_MVP_NOC_LPI_CONTROL		(AON_BASE_OFFS)
>> +#define AON_WRAPPER_MVP_NOC_LPI_STATUS		(AON_BASE_OFFS + 0x4)
>> +
>> +#define AON_WRAPPER_MVP_NOC_CORE_SW_RESET	(AON_BASE_OFFS + 0x18)
>> +#define SW_RESET				BIT(0)
>> +#define AON_WRAPPER_MVP_NOC_CORE_CLK_CONTROL	(AON_BASE_OFFS + 0x20)
>> +#define NOC_HALT				BIT(0)
>> +#define AON_WRAPPER_SPARE			(AON_BASE_OFFS + 0x28)
>> +
>> +#define VCODEC_DMA_SPARE_3 0x87B8
>> +
>> +static int reset_control_bulk_assert_id(int num_rstcs,
>> +					struct reset_control_bulk_data *rstcs,
>> +					char *id)
>> +{
>> +	int i;
>> +
>> +	for (i = 0; i < num_rstcs; ++i) {
>> +		if (!strcmp(rstcs[i].id, id))
>> +			return reset_control_assert(rstcs[i].rstc);
>> +	}
>> +
>> +	return -ENODEV;
>> +}
>> +
>> +static int reset_control_bulk_deassert_id(int num_rstcs,
>> +					  struct reset_control_bulk_data *rstcs,
>> +					  char *id)
>> +{
>> +	int i;
>> +
>> +	for (i = 0; i < num_rstcs; ++i) {
>> +		if (!strcmp(rstcs[i].id, id))
>> +			return reset_control_deassert(rstcs[i].rstc);
>> +	}
>> +
>> +	return -ENODEV;
>> +}
> 
> Please adapt the abstractions instead of working around them. If the
> driver isn't suited for a single reset_control_bulk_data in iris_core,
> split it into multiple groups, or store the resets individually.
> 
> At the very least, this could use constant indices instead of linear
> search with string compares.

It was a first try, I'll think about something better for v2.

Neil

> 
> regards
> Philipp


