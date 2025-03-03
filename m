Return-Path: <linux-media+bounces-27409-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A94EDA4C960
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 18:27:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CC17316AE9B
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 17:18:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2F0D23ED6C;
	Mon,  3 Mar 2025 17:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YyhMCfz9"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34A6D2144C3
	for <linux-media@vger.kernel.org>; Mon,  3 Mar 2025 17:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741021424; cv=none; b=WCGm1vEyzKB8tCTr306YKaeH2Ug8glGFzbISF9bWH4D8H5dKgbvSmx2oCMLwjeflUcRmHuDt3MXmKqBBV8KdqNmxKnoktyz3B/cVx5lRQx9eoBf6evV3rRToMN2Gt5+Xc0azAtog2VmjzKjvvNn7jo1tevCl8K9nE9fg2ET04fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741021424; c=relaxed/simple;
	bh=GvokUAQtkkNe/nhzRAoGGafvW7hRfXZL+Qub0ygrecE=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=B1+sQTJgbrxhENPCyRbJTMW1QXSKCqaUZykyduQ7nyDxhSxwTcGGuKqK8QYO6jn6MwBPvRxyzzLY3BowMvw0pRqeN8D3rSXUnt/YM2ZNi52RXgQZtSKirLVPJLk4KktCFWR2jgBOMCWM1DRPzmFjxnhrz/N6MF2jWNM7ecDNQUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YyhMCfz9; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4398ec2abc2so42369315e9.1
        for <linux-media@vger.kernel.org>; Mon, 03 Mar 2025 09:03:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741021419; x=1741626219; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WttFvxMnC39t+/uLxm6NMSdvdaSmYQi6clvcuXpgabg=;
        b=YyhMCfz9ZQRIZ4KyZlVa6tSMt+dm/pQEqIFiWFEmfsLRyR6TZSD5Pp3fl34sKmSq3R
         DyOcmu+JNfDX/dCaEluDkU3wImfPESqABAOMo4c/fHQ8mTTreLjRZH1OOwJ7JxtB9Z7C
         W9yuz5gcbgRV0pC452YQx0BCdwcN8t+TAD7PZFLTvLAIZlF9HwTGGqfGIu2e7WEyS+Km
         HpxICI+ka+hJtgAGoXHLage0e/7zqXB4rTfE7+oUi59bx2dPFlhn6tdS2OKettesaTVu
         wKN1lxcp7OU7wkgBT3U1qfJT7EVXNyzSmxke207oBBXF1pytrBBzb+HrlNKCWBcEnNkv
         VtcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741021419; x=1741626219;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=WttFvxMnC39t+/uLxm6NMSdvdaSmYQi6clvcuXpgabg=;
        b=II7kWElDi2fYfMBjTxUfUF8rQrdizSWzQNfpX6arE2NUeTBalxaAiDJQzmWN0EBBb2
         18UNokVwbeFtXsnctBxiIShXceWR/pyNrCZJwk5uHjXT5R8gv3H+zhRlKNf6+RNFTtuA
         ovTRMyPr83sWJ1Rj8g/73c86RwSZfwrVfdwET7hZdCpUiMr8wZorosEDhck2cn6UOB1Q
         QZC4ruvB0kUF51xZwQ5kDem3Rm5/fT1VDJy+vCpx7jKHAqn1aXw49ziSSh7EzSCjVoje
         bjNB/AiNu3gl+KwYEdN2DOltBsgki7KoSTYnMTtK+Nn5fmnIQ22yGEDiLUzWFOEMvnLX
         2tiQ==
X-Forwarded-Encrypted: i=1; AJvYcCUyV+kgGD/L6Ps8H4jsRvph+RZWuBKj4Q6vDZc18b6lfsxh4wT7u7db3tLSMpfxPNn6igY8XrEgSVESxg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyXTG65Dq2JjyMTiTJRL3U2jCMe9zd2LVLJuZ3/sPpFTWAd7OOD
	IITyzc0L2IvG8u/Q8Kx9quhK0tx0d0GRLe0NO/mmF3ztd9j54TBrRJFSzZKhy8Y=
X-Gm-Gg: ASbGncvK4RKWCQueXVHqb9fyt9MXxVAbOtj8dIPoObqhCl4jPqa/thrt9h4d+qcFb+X
	zas9jwABTNvvQN6NMNPOA+Y8gZuTQrAeSglEiBfnDXvShso/jwhf3RIJmTKrWudOdULcsV4SOQc
	uEBxMZlYM2srCj/O3+5TFRFfdLbIcy3PEhYqcsQ0B/eXQ0jTESwgYrn7u6jywdxeAnB0WIJ7t7I
	evWrMfd6wVGEcfcngexQ/jj/l2vgUNIxatXnnCxiwqP7GSwnVXLk3cT/e/vWd2jyFBcrTfynVJX
	Tjs92/h33NKWSqks9JVzoZyHvQL3fkgcXW+DNxQb+X+H6JRIFv8fR1fbjbcpyxe8Lxz03Xjmj1M
	9qUPcl+0sYuKqK9JSQishAA==
X-Google-Smtp-Source: AGHT+IHvufe3CgpiIdDLoT9kc1+CaUchsJQ6hh+/zfRty/L4HVn0ED12FkFk55fe9K8lX9Y14D1zUQ==
X-Received: by 2002:a05:600c:1c8e:b0:43a:b0ac:b10c with SMTP id 5b1f17b1804b1-43ba6744a10mr97126385e9.26.1741021419214;
        Mon, 03 Mar 2025 09:03:39 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:1c49:dea2:d749:5015? ([2a01:e0a:982:cbb0:1c49:dea2:d749:5015])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bc743f649sm23415205e9.27.2025.03.03.09.03.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Mar 2025 09:03:38 -0800 (PST)
Message-ID: <d94e52a9-b678-4750-a85a-39d06acfe13d@linaro.org>
Date: Mon, 3 Mar 2025 18:03:37 +0100
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
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250225-topic-sm8x50-iris-v10-v1-0-128ef05d9665@linaro.org>
 <20250225-topic-sm8x50-iris-v10-v1-3-128ef05d9665@linaro.org>
 <97a85e55-93b1-764c-9566-2cff7420918c@quicinc.com>
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
In-Reply-To: <97a85e55-93b1-764c-9566-2cff7420918c@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 28/02/2025 12:39, Dikshita Agarwal wrote:
> 
> 
> On 2/25/2025 2:35 PM, Neil Armstrong wrote:
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
>> +
>> +static bool iris_vpu33_hw_power_collapsed(struct iris_core *core)
>> +{
>> +	u32 value, pwr_status;
>> +
>> +	value = readl(core->reg_base + WRAPPER_CORE_POWER_STATUS);
>> +	pwr_status = value & BIT(1);
>> +
>> +	return pwr_status ? false : true;
>> +}
>> +
>> +static void iris_vpu33_power_off_hardware(struct iris_core *core)
>> +{
>> +	u32 reg_val = 0, value, i;
>> +	int ret;
>> +	int count = 0;
>> +
>> +	if (iris_vpu33_hw_power_collapsed(core))
>> +		goto disable_power;
>> +
>> +	value = readl(core->reg_base + WRAPPER_CORE_CLOCK_CONFIG);
>> +	if (value)
>> +		writel(CORE_CLK_RUN, core->reg_base + WRAPPER_CORE_CLOCK_CONFIG);
>> +
>> +	value = readl(core->reg_base + VCODEC_DMA_SPARE_3);
>> +	value |= BIT(0);
>> +	writel(value, core->reg_base + VCODEC_DMA_SPARE_3)> +
>> +	for (i = 0; i < core->iris_platform_data->num_vpp_pipe; i++) {
>> +		ret = readl_poll_timeout(core->reg_base + VCODEC_SS_IDLE_STATUSN + 4 * i,
>> +					 reg_val, reg_val & 0x400000, 2000, 20000);
>> +		if (ret)
>> +			goto disable_power;
>> +	}
>> +
>> +	/* set MNoC to low power, set PD_NOC_QREQ (bit 0) */
>> +	value = readl(core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
>> +	value |= BIT(0);
>> +	writel(value, core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
>> +
>> +	value = readl(core->reg_base + AON_WRAPPER_MVP_NOC_LPI_STATUS);
>> +
>> +	while ((!(value & BIT(0))) && (value & BIT(1) || value & BIT(2))) {
>> +		value = readl(core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
>> +		value &= ~BIT(0);
>> +		writel(value, core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
>> +
>> +		usleep_range(10, 20);
>> +
>> +		value = readl(core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
>> +		value |= BIT(0);
>> +		writel(value, core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
>> +
>> +		usleep_range(10, 20);
>> +
>> +		value = readl(core->reg_base + AON_WRAPPER_MVP_NOC_LPI_STATUS);
>> +
>> +		++count;
>> +		if (count >= 1000)
>> +			break;
>> +	}
>> +
>> +	if (count < 1000) {
>> +		value = readl(core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
>> +		value &= ~BIT(0);
>> +		writel(value, core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
>> +	}
>> +
>> +	writel(VIDEO_NOC_RESET_REQ, core->reg_base + AON_WRAPPER_MVP_NOC_RESET_REQ);
>> +
>> +	ret = readl_poll_timeout(core->reg_base + AON_WRAPPER_MVP_NOC_RESET_ACK,
>> +				 reg_val, reg_val & 0x3, 200, 2000);
>> +	if (ret)
>> +		goto disable_power;
>> +> +	writel(0x0, core->reg_base + AON_WRAPPER_MVP_NOC_RESET_REQ);
>> +
>> +	ret = readl_poll_timeout(core->reg_base + AON_WRAPPER_MVP_NOC_RESET_ACK,
>> +				 reg_val, !(reg_val & 0x3), 200, 2000);
>> +	if (ret)
>> +		goto disable_power;
>> +> +	writel(CORE_BRIDGE_SW_RESET | CORE_BRIDGE_HW_RESET_DISABLE,
>> +	       core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
>> +	writel(CORE_BRIDGE_HW_RESET_DISABLE, core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
>> +	writel(0x0, core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
>> +
>> +disable_power:
>> +	iris_vpu_power_off_hw(core);
>> +}
>> +
>> +static int iris_vpu33_power_off_controller(struct iris_core *core)
>> +{
>> +	u32 rst_tbl_size = core->iris_platform_data->clk_rst_tbl_size;
>> +	u32 val = 0;
>> +	int ret;
>> +
>> +	writel(MSK_SIGNAL_FROM_TENSILICA | MSK_CORE_POWER_ON, core->reg_base + CPU_CS_X2RPMH);
>> +
>> +	writel(REQ_POWER_DOWN_PREP, core->reg_base + WRAPPER_IRIS_CPU_NOC_LPI_CONTROL);
>> +
>> +	ret = readl_poll_timeout(core->reg_base + WRAPPER_IRIS_CPU_NOC_LPI_STATUS,
>> +				 val, val & BIT(0), 200, 2000);
>> +	if (ret)
>> +		goto disable_power;
>> +
>> +	writel(0x0, core->reg_base + WRAPPER_DEBUG_BRIDGE_LPI_CONTROL);
>> +
>> +	ret = readl_poll_timeout(core->reg_base + WRAPPER_DEBUG_BRIDGE_LPI_STATUS,
>> +				 val, val == 0, 200, 2000);
>> +	if (ret)
>> +		goto disable_power;
>> +
>> +	writel(CTL_AXI_CLK_HALT | CTL_CLK_HALT,
>> +	       core->reg_base + WRAPPER_TZ_CTL_AXI_CLOCK_CONFIG);
>> +	writel(RESET_HIGH, core->reg_base + WRAPPER_TZ_QNS4PDXFIFO_RESET);
>> +	writel(0x0, core->reg_base + WRAPPER_TZ_QNS4PDXFIFO_RESET);
>> +	writel(0x0, core->reg_base + WRAPPER_TZ_CTL_AXI_CLOCK_CONFIG);
>> +
> The code till here in this API is common with
> iris_vpu_power_off_controller(), please check the possibility of reusing it.

Not exactly, the common code sets WRAPPER_IRIS_CPU_NOC_LPI_CONTROL, which
is not in the vpu33 sequence, not sure how I'll be able to reuse it.

Neil

>> +	reset_control_bulk_assert_id(rst_tbl_size, core->resets, "bus");
>> +	reset_control_bulk_assert_id(rst_tbl_size, core->resets, "core");
>> +	usleep_range(1000, 1100);
>> +	reset_control_bulk_deassert_id(rst_tbl_size, core->resets, "bus");
>> +	reset_control_bulk_deassert_id(rst_tbl_size, core->resets, "core");
>> +
>> +	/* Disable MVP NoC clock */
>> +	val = readl(core->reg_base + AON_WRAPPER_MVP_NOC_CORE_CLK_CONTROL);
>> +	val |= NOC_HALT;
>> +	writel(val, core->reg_base + AON_WRAPPER_MVP_NOC_CORE_CLK_CONTROL);
>> +
>> +	/* enable MVP NoC reset */
>> +	val = readl(core->reg_base + AON_WRAPPER_MVP_NOC_CORE_SW_RESET);
>> +	val |= SW_RESET;
>> +	writel(val, core->reg_base + AON_WRAPPER_MVP_NOC_CORE_SW_RESET);
>> +
>> +	/* poll AON spare register bit0 to become zero with 50ms timeout */
>> +	ret = readl_poll_timeout(core->reg_base + AON_WRAPPER_SPARE,
>> +				 val, (val & BIT(0)) == 0, 1000, 50000);
>> +	if (ret)
>> +		goto disable_power;
>> +
>> +	/* enable bit(1) to avoid cvp noc xo reset */
>> +	val = readl(core->reg_base + AON_WRAPPER_SPARE);
>> +	val |= BIT(1);
>> +	writel(val, core->reg_base + AON_WRAPPER_SPARE);
>> +
>> +	reset_control_bulk_assert_id(rst_tbl_size, core->resets, "xo");
>> +
>> +	/* De-assert MVP NoC reset */
>> +	val = readl(core->reg_base + AON_WRAPPER_MVP_NOC_CORE_SW_RESET);
>> +	val &= ~SW_RESET;
>> +	writel(val, core->reg_base + AON_WRAPPER_MVP_NOC_CORE_SW_RESET);
>> +
>> +	usleep_range(80, 100);
>> +	reset_control_bulk_deassert_id(rst_tbl_size, core->resets, "xo");
>> +
>> +	/* reset AON spare register */
>> +	writel(0, core->reg_base + AON_WRAPPER_SPARE);
>> +
>> +	/* Enable MVP NoC clock */
>> +	val = readl(core->reg_base + AON_WRAPPER_MVP_NOC_CORE_CLK_CONTROL);
>> +	val &= ~NOC_HALT;
>> +	writel(val, core->reg_base + AON_WRAPPER_MVP_NOC_CORE_CLK_CONTROL);
>> +
>> +	iris_disable_unprepare_clock(core, IRIS_CTRL_CLK);
>> +
>> +disable_power:
>> +	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
>> +	iris_disable_unprepare_clock(core, IRIS_AXI_CLK);
>> +
>> +	return 0;
>> +}
>> +
>> +static u64 iris_vpu33_calculate_frequency(struct iris_inst *inst, size_t data_size)
>> +{
>> +	struct platform_inst_caps *caps = inst->core->iris_platform_data->inst_caps;
>> +	struct v4l2_format *inp_f = inst->fmt_src;
>> +	u32 height, width, mbs_per_second, mbpf;
>> +	u64 fw_cycles, fw_vpp_cycles;
>> +	u64 vsp_cycles, vpp_cycles;
>> +	u32 fps = DEFAULT_FPS;
>> +
>> +	width = max(inp_f->fmt.pix_mp.width, inst->crop.width);
>> +	height = max(inp_f->fmt.pix_mp.height, inst->crop.height);
>> +
>> +	mbpf = NUM_MBS_PER_FRAME(height, width);
>> +	mbs_per_second = mbpf * fps;
>> +
>> +	fw_cycles = fps * caps->mb_cycles_fw;
>> +	fw_vpp_cycles = fps * caps->mb_cycles_fw_vpp;
>> +
>> +	vpp_cycles = mult_frac(mbs_per_second, caps->mb_cycles_vpp, (u32)inst->fw_caps[PIPE].value);
>> +	/* 21 / 20 is minimum overhead factor */
>> +	vpp_cycles += max(div_u64(vpp_cycles, 20), fw_vpp_cycles);
>> +
>> +	/* 1.059 is multi-pipe overhead */
>> +	if (inst->fw_caps[PIPE].value > 1)
>> +		vpp_cycles += div_u64(vpp_cycles * 59, 1000);
>> +
>> +	vsp_cycles = fps * data_size * 8;
>> +	vsp_cycles = div_u64(vsp_cycles, 2);
>> +	/* VSP FW overhead 1.05 */
>> +	vsp_cycles = div_u64(vsp_cycles * 21, 20);
>> +
>> +	if (inst->fw_caps[STAGE].value == STAGE_1)
>> +		vsp_cycles = vsp_cycles * 3;
>> +
>> +	return max3(vpp_cycles, vsp_cycles, fw_cycles);
>> +}
>> +
> This is exactly same as vpu3 calculation, pls reuse.

Ack

>> +static int iris_vpu33_reset_controller(struct iris_core *core)
>> +{
>> +	u32 rst_tbl_size = core->iris_platform_data->clk_rst_tbl_size;
>> +
>> +	reset_control_bulk_assert_id(rst_tbl_size, core->resets, "bus");
>> +	reset_control_bulk_assert_id(rst_tbl_size, core->resets, "core");
>> +
>> +	usleep_range(1000, 1100);
>> +
>> +	reset_control_bulk_deassert_id(rst_tbl_size, core->resets, "bus");
>> +	reset_control_bulk_deassert_id(rst_tbl_size, core->resets, "core");
>> +
>> +	return 0;
>> +}
>> +
> should be replacable with reset_control_bulk_reset. pls revisit.

>> +const struct vpu_ops iris_vpu33_ops = {
>> +	.reset_controller = iris_vpu33_reset_controller,
>> +	.power_off_hw = iris_vpu33_power_off_hardware,
>> +	.power_off_controller = iris_vpu33_power_off_controller,
>> +	.calc_freq = iris_vpu33_calculate_frequency,
>> +};
> you can rename vpu3.c to vpu3x.c and move these ops to same file, this way
> common API can be reused and no need of redinfing the macros as well.

I'll see how it turns out.

Thanks,
Neil

> 
> Thanks,
> Dikshita
>> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.h b/drivers/media/platform/qcom/iris/iris_vpu_common.h
>> index c948d8b5aee87ccf1fd53c5518a27294232d8fb8..c4d02a3b884881eb033dc0342f948848adae2819 100644
>> --- a/drivers/media/platform/qcom/iris/iris_vpu_common.h
>> +++ b/drivers/media/platform/qcom/iris/iris_vpu_common.h
>> @@ -10,6 +10,7 @@ struct iris_core;
>>   
>>   extern const struct vpu_ops iris_vpu2_ops;
>>   extern const struct vpu_ops iris_vpu3_ops;
>> +extern const struct vpu_ops iris_vpu33_ops;
>>   
>>   struct vpu_ops {
>>   	int (*reset_controller)(struct iris_core *core);
>>


