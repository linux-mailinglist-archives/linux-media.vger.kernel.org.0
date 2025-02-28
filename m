Return-Path: <linux-media+bounces-27232-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 72414A4997C
	for <lists+linux-media@lfdr.de>; Fri, 28 Feb 2025 13:37:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C5FC33AB38E
	for <lists+linux-media@lfdr.de>; Fri, 28 Feb 2025 12:37:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A88DC26B2A9;
	Fri, 28 Feb 2025 12:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lWSlAYD7"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A91FA26B2BD
	for <linux-media@vger.kernel.org>; Fri, 28 Feb 2025 12:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740746213; cv=none; b=ZOYpmnjzhUgquzRlE6dXFMCAlyTb+pO9mRQAi/mxhkcc8WcDWe9ZUCYNsXGE1wuQjMWGp4HSUiI+sOw6G1YSLRk+Uhp+gSbqcsHutMKXFTJjVYYQoKeTupuaiY+6IZMypAtqO5jxLQRLa0jzNmA+Qn4z4bnz9c3eGGVwOH3AZQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740746213; c=relaxed/simple;
	bh=t1VnN8328NlYzq1iq6gLc/Hy3NUPG5L9W8w/hEkCFzM=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=udBnAKpFxjBnAiiXwnn1JwpjEjSDFmqp19QlhEqqj84gI9KWJXLOfo62RYD4WA/4BiQCYvHJScHYPhfzyXceyuim5XIQh6VuJB9chG3Qe6WbcIAXk7TQip2BfTbkKEqZZtDVwux/i3f/zMK+KfcF9uTYB2WY/PRtwUnysfmeRI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lWSlAYD7; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4394a0c65fcso21529715e9.1
        for <linux-media@vger.kernel.org>; Fri, 28 Feb 2025 04:36:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740746209; x=1741351009; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GTX2OoBoCZWWUzLe/NFcn/6wSduWkagg9IGE3kQbiCA=;
        b=lWSlAYD7XqrqbXEY8fRPs7vo41tSYzZjrDYH/L3ER21pCqdodfdO1UAM8WAyzp6ohd
         cWRKDyHeWTpCqOY3yNUQ87PRZtERAU5Ur8j+wOD1P2M91E3B/zwa+WnuI//cPrCDcv2i
         DISjFxuzqQ59IacI3Im1ub8XjgGMkcqEUXgmQD0T1dwpLUeVpdOjjD9uEX0sJkOPL/nP
         1zbHHw5rRZKG6brTnOzGy/xByeIrYplRiaBMpbGnNeidsa5q0AMpvOgI54UlZ45tc8E3
         s4PrGRNk40qL9ewNNXFHAXourfIzvAoBVsTlVSRj3YXGkNZByokJ0scQuMp2PDWlXw+4
         Dv3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740746209; x=1741351009;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=GTX2OoBoCZWWUzLe/NFcn/6wSduWkagg9IGE3kQbiCA=;
        b=SMk/3gltuB/gqU49OfF9dq+O85shHAljGvxdxK6j1jPjPhPmN+37jtqi22goSm5h3R
         /0+FFYlDmmpfvFmM2VLSSiS5Gwf8jQVj0xdlXJ93K4Y/x9b+RcRyHt/pjp6mSUxhE+C6
         nVfLGRCMx9paQ4YncDaV/WUccXYilpViRMXR3Zp5nmDsJZ7YlLZKRIjxbgOs5S0Oe/TT
         e8Ijc1dUFqyXfla4XDQl5M2uVuv+vZzCAWl9S1KHbmAVdZwBK3YySGIkmX1/1Z4bouMu
         Bb4hEp2Id/PdYDhicQ9Wi1UklQmNpKnUaqW+YUE3Mag/y7NASGz1XzD22u+NHHNST6AC
         LchQ==
X-Forwarded-Encrypted: i=1; AJvYcCWd+4kRxfPCoCKyYF0PnueZoFhXwj1nCVIK3eYFGN0G5EiPpOagL0JT6ZY3toXfRyQZ2FGO6O6qRUIYdQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxkNeVOE+/YM6c88afRWCtwreoxq7kS9GdGB1UBP+gWW3bZQkKn
	jifmiHateyn3PVRiVOanQqBWW+Jqricqko0VYDSIwT9jvfvY0l4Uge9qL0Qj+lGY2xpJFg1WOS7
	b
X-Gm-Gg: ASbGnctYn08NoVCRcoUm2gfxhviQ0mLHcUopgEExfzDUR+Ob3u6sI5QG4UBTGmh799M
	BLiXcom+93Jo1EkpBCAsj4Av9Y/iUlfZ/OX0Dl0TrB7QeyhMHZX+akeCdgGEWm9Pxb6GbTpOiZA
	YDqKbqL6XfX8No0sQ1om0LJ+PZtdcgfWjfd6/z7I1DVQe8S/OsqSNMjsQ8m+CuRq/B6sSMtL7oB
	thjnQ3tJE9ENxuuWckihPiVSUm0k6SmjLNniWwnwFAXY4sQ0TrVNVIE72sd1TSBUwXtxKtvk+Pu
	TAALXSdGqbrYR45y0+cBlaqHnTy256MBgKXaecxYaUrS6T19P8iCqiWHOxNi+DnsAWOpefM69q9
	qTrs=
X-Google-Smtp-Source: AGHT+IGJeaWh2AFLoCns6uInmEiFYCAdJD5yRpUAb31Sry+7WJ2O27eo1SiUw0kTuj3PZ0t7MAq8HA==
X-Received: by 2002:a05:600c:1d8e:b0:439:b565:f457 with SMTP id 5b1f17b1804b1-43ba675c3afmr27956905e9.27.1740746208991;
        Fri, 28 Feb 2025 04:36:48 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:c728:ed22:3bb8:f351? ([2a01:e0a:982:cbb0:c728:ed22:3bb8:f351])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43b736f839asm55473615e9.2.2025.02.28.04.36.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Feb 2025 04:36:48 -0800 (PST)
Message-ID: <4286e8a9-9162-4af2-8b23-c6f0390b8235@linaro.org>
Date: Fri, 28 Feb 2025 13:36:48 +0100
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
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250225-topic-sm8x50-iris-v10-v1-0-128ef05d9665@linaro.org>
 <20250225-topic-sm8x50-iris-v10-v1-3-128ef05d9665@linaro.org>
 <81ddeed3-0fa3-076a-8f73-f41aa9f24b88@quicinc.com>
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
In-Reply-To: <81ddeed3-0fa3-076a-8f73-f41aa9f24b88@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 28/02/2025 13:09, Vikash Garodia wrote:
> Hello Neil,
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
>> +	writel(value, core->reg_base + VCODEC_DMA_SPARE_3);
> DMA_SPARE_3 register programming here can be skipped. This register is about
> halting the DMA trasaction during power off, but did not yield desired result
> during our internal trials.

OK, thanks for reporting that!

>> +
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
> Again, above programming of LPI registers can be limited to below
> 
> readl_poll_timeout(core->reg_base + AON_WRAPPER_MVP_NOC_LPI_STATUS, reg_val,
> reg_val & 0x1, 200, 2000);
> 
> writel(BIT(0), core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);

Ack, will use that

> 	
>> +
>> +	writel(VIDEO_NOC_RESET_REQ, core->reg_base + AON_WRAPPER_MVP_NOC_RESET_REQ);
>> +
>> +	ret = readl_poll_timeout(core->reg_base + AON_WRAPPER_MVP_NOC_RESET_ACK,
>> +				 reg_val, reg_val & 0x3, 200, 2000);
>> +	if (ret)
>> +		goto disable_power;
>> +
>> +	writel(0x0, core->reg_base + AON_WRAPPER_MVP_NOC_RESET_REQ);
>> +
>> +	ret = readl_poll_timeout(core->reg_base + AON_WRAPPER_MVP_NOC_RESET_ACK,
>> +				 reg_val, !(reg_val & 0x3), 200, 2000);
>> +	if (ret)
>> +		goto disable_power;
> Above NOC_RESET handling does not look applicable to SM8650, could you recheck ?

Indeed it's not, I'll remove it,

Thanks,
Neil

> 
> Regards,
> Vikash
>> +
>> +	writel(CORE_BRIDGE_SW_RESET | CORE_BRIDGE_HW_RESET_DISABLE,
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
>> +const struct vpu_ops iris_vpu33_ops = {
>> +	.reset_controller = iris_vpu33_reset_controller,
>> +	.power_off_hw = iris_vpu33_power_off_hardware,
>> +	.power_off_controller = iris_vpu33_power_off_controller,
>> +	.calc_freq = iris_vpu33_calculate_frequency,
>> +};
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


