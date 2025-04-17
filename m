Return-Path: <linux-media+bounces-30436-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BF59BA916E9
	for <lists+linux-media@lfdr.de>; Thu, 17 Apr 2025 10:53:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CDEDB440E5F
	for <lists+linux-media@lfdr.de>; Thu, 17 Apr 2025 08:53:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABF6022576D;
	Thu, 17 Apr 2025 08:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nuuHecBo"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13BE021B9E5
	for <linux-media@vger.kernel.org>; Thu, 17 Apr 2025 08:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744879988; cv=none; b=T/o3BGPuwIXJuyJ/goSOpoAPClNWm/yfFm5dH4mvO/QarHRqEutT8fTkP6OKs6wrwYIpT8qJJSujgkjIdgCBjyaBtvcJ9IGmrZEVQLrt3CjAuT0C628l0CoqEVNlP2PmiJ0jVb96Um3xBDej+trXblavhZ7gQLs9X5QZwnALihs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744879988; c=relaxed/simple;
	bh=ulmDyV6ejDkgRmyzV3e8qxu62ibEhtoFBaAVkVuOShI=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=nTwZm9rXgTzArGluBsrvg1rS0dGJbIv6KpwS61ENfGznnTTR/fdrZEQKaPVB6Qthr3xMJxtxT7KhRcnfLN8VqtkINNvhP24lkawbT03tTY/VEM/CiJSvylBz54cwffWKczIua+MBrmBTFCxAj0UfcaVCV8V6PtWHtA0D9KJ9PMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nuuHecBo; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3914bc3e01aso280648f8f.2
        for <linux-media@vger.kernel.org>; Thu, 17 Apr 2025 01:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744879984; x=1745484784; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EGKAqyuIjX6qKrR5avqIVFacXI3YnxkxDjWkOaT6EAs=;
        b=nuuHecBotzM8tZM7IAP6vZvE0UvxTwGpci3Ilz9r0FAJetn0b4tkqUztg7kb6ArdoB
         B23U4I7J/wgyPJqGAAv42B3BveHOlrUu2tmH1bxHjUAFOZ/U2jxyBxgcLfO5ZFCQ5DOq
         GV372golVoVrIV50un+ThfWytwMaH5ObA2xMjvTIf0OtXmqLZmlgSIZUuVzRYiWXK59t
         5uaPaV+QbhqyKoddTEJD7+OM4hJ3tu9qgGfd8dflX/c5KBQmlw/YHLrFLG0LT9QDsYGv
         4O34hFgk+/WI2DIOytJqkQMiK2ZxhEwhgeQ2lxuIDwv0+sMdd+3TYbCmljJCKD2eQnO/
         ZUIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744879984; x=1745484784;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=EGKAqyuIjX6qKrR5avqIVFacXI3YnxkxDjWkOaT6EAs=;
        b=YhEa1hz91UbJbrvm6aBgKRior9xB9/XEQ23AN2Jpk6TjpOhmD4X56pvqFx4+PUiEf6
         /M/uY5M76pvI/mPETX54EwEj44JJh0h8wQacWJx/3FoKXHzRsdM1VReH98/8X0k95RaI
         Ju0j2Cgm3SO4BdhtaCfcocxJxH6xmA+U2WQFjF1fyKccSv75E6Agb06V/7UjJRpt34TW
         opsX3GGl3gXFZJZpDArhtZbTriNueDVdk8h0C0bnODEGqygkxYxoy7ZwpB3VpwuNmCzg
         KAwumB81klfwVSe1TFOEV0qyCJr0bUizs2/KeLNZ4vOh5PW8RfaH7VV02SU+AeVXDGc5
         qAUg==
X-Gm-Message-State: AOJu0Yz82iKnYZKlNx6m/0IVhRMnqhDYR356ueYT5cQhYc9vza/inc3e
	toHaT1j3ew2huYnfnqOP2xAVGCVOOHaMknBD9bT9Dmx781ohkDFlL52uDAlUfxg=
X-Gm-Gg: ASbGncv2FSdlwTWPQt+IjjjGCW35v5at/NwHdNj0qzRaA4ylsmDrM8ecHcs7tBdTKDl
	OdiNJlRZSkKfEHP/8FgXQipfObP7/1N6572Geund+jZEsg5vykC0QhQm9k7yQIUn+PNLfaw64EB
	AG0LLG8bUAjBCy3usVJ/N45A6GeaP6xkojoUYDMEVA7kDt5SMrzI1pcEr7EqTNsDc/+ErSKF89i
	4wZBWb6hr89x8CU1/Kq5CMOBz8J6NzzjwXnQUArtNkTbqx9WKVzkPFDl4ohYwRyhwUHKmzBcLpo
	YgoqLz84mS2JZ6rNbnSZeMyP7x1VOyXZmblk/av72WhK4x2dO+E=
X-Google-Smtp-Source: AGHT+IHGYZBSyUm6aNN3kVG6WDLNsN53LUSe5EdIFECbYFqnyY0ClZBqXL8OnzRDjYUkhaVCHYNczA==
X-Received: by 2002:a05:6000:402b:b0:39c:1257:dba8 with SMTP id ffacd0b85a97d-39ee5bae6c7mr4229613f8f.56.1744879984239;
        Thu, 17 Apr 2025 01:53:04 -0700 (PDT)
Received: from [172.20.10.3] ([37.166.173.208])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae978023sm19457102f8f.47.2025.04.17.01.53.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Apr 2025 01:53:03 -0700 (PDT)
Message-ID: <68313fff-89d6-4a17-9006-75db971554c0@linaro.org>
Date: Thu, 17 Apr 2025 10:50:47 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v6 7/7] media: platform: qcom/iris: add sm8650 support
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250415-topic-sm8x50-iris-v10-v6-0-8ad319094055@linaro.org>
 <20250415-topic-sm8x50-iris-v10-v6-7-8ad319094055@linaro.org>
 <085acdab-87b0-3a94-72fd-881d517d95cb@quicinc.com>
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
In-Reply-To: <085acdab-87b0-3a94-72fd-881d517d95cb@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16/04/2025 12:25, Dikshita Agarwal wrote:
> 
> 
> On 4/15/2025 7:17 PM, Neil Armstrong wrote:
>> Add support for the SM8650 platform by re-using the SM8550
>> definitions and using the vpu33 ops.
>>
>> Move the reset tables that diffes in a per-SoC platform
>> header, that will contain mode SoC specific data when
>> more codecs are introduced.
>>
>> The SM8650/vpu33 requires more reset lines, but the H.264
>> decoder capabilities are identical.
>>
>> Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org> # x1e Dell
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   .../platform/qcom/iris/iris_platform_common.h      |  1 +
>>   .../media/platform/qcom/iris/iris_platform_gen2.c  | 65 +++++++++++++++++++++-
>>   .../platform/qcom/iris/iris_platform_sm8550.h      | 11 ++++
>>   .../platform/qcom/iris/iris_platform_sm8650.h      | 13 +++++
>>   drivers/media/platform/qcom/iris/iris_probe.c      |  4 ++
>>   5 files changed, 92 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
>> index fdd40fd80178c4c66b37e392d07a0a62f492f108..6bc3a7975b04d612f6c89206eae95dac678695fc 100644
>> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
>> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
>> @@ -35,6 +35,7 @@ enum pipe_type {
>>   
>>   extern struct iris_platform_data sm8250_data;
>>   extern struct iris_platform_data sm8550_data;
>> +extern struct iris_platform_data sm8650_data;
>>   
>>   enum platform_clk_type {
>>   	IRIS_AXI_CLK,
>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
>> index 35d278996c430f2856d0fe59586930061a271c3e..6d1771bd68689d96b5b9087b0ad32b934f7295ee 100644
>> --- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
>> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
>> @@ -10,6 +10,9 @@
>>   #include "iris_platform_common.h"
>>   #include "iris_vpu_common.h"
>>   
>> +#include "iris_platform_sm8550.h"
>> +#include "iris_platform_sm8650.h"
>> +
>>   #define VIDEO_ARCH_LX 1
>>   
>>   static struct platform_inst_fw_cap inst_fw_cap_sm8550[] = {
>> @@ -142,8 +145,6 @@ static const struct icc_info sm8550_icc_table[] = {
>>   	{ "video-mem",  1000, 15000000 },
>>   };
>>   
>> -static const char * const sm8550_clk_reset_table[] = { "bus" };
>> -
>>   static const struct bw_info sm8550_bw_table_dec[] = {
>>   	{ ((4096 * 2160) / 256) * 60, 1608000 },
>>   	{ ((4096 * 2160) / 256) * 30,  826000 },
>> @@ -264,3 +265,63 @@ struct iris_platform_data sm8550_data = {
>>   	.dec_op_int_buf_tbl = sm8550_dec_op_int_buf_tbl,
>>   	.dec_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_op_int_buf_tbl),
>>   };
>> +
>> +/*
>> + * Shares most of SM8550 data except:
>> + * - vpu_ops to iris_vpu33_ops
>> + * - clk_rst_tbl to sm8650_clk_reset_table
>> + * - controller_rst_tbl to sm8650_controller_reset_table
>> + * - fwname to "qcom/vpu/vpu33_p4.mbn"
>> + */
>> +struct iris_platform_data sm8650_data = {
>> +	.get_instance = iris_hfi_gen2_get_instance,
>> +	.init_hfi_command_ops = iris_hfi_gen2_command_ops_init,
>> +	.init_hfi_response_ops = iris_hfi_gen2_response_ops_init,
>> +	.vpu_ops = &iris_vpu33_ops,
>> +	.set_preset_registers = iris_set_sm8550_preset_registers,
>> +	.icc_tbl = sm8550_icc_table,
>> +	.icc_tbl_size = ARRAY_SIZE(sm8550_icc_table),
>> +	.clk_rst_tbl = sm8650_clk_reset_table,
>> +	.clk_rst_tbl_size = ARRAY_SIZE(sm8650_clk_reset_table),
>> +	.controller_rst_tbl = sm8650_controller_reset_table,
>> +	.controller_rst_tbl_size = ARRAY_SIZE(sm8650_controller_reset_table),
>> +	.bw_tbl_dec = sm8550_bw_table_dec,
>> +	.bw_tbl_dec_size = ARRAY_SIZE(sm8550_bw_table_dec),
>> +	.pmdomain_tbl = sm8550_pmdomain_table,
>> +	.pmdomain_tbl_size = ARRAY_SIZE(sm8550_pmdomain_table),
>> +	.opp_pd_tbl = sm8550_opp_pd_table,
>> +	.opp_pd_tbl_size = ARRAY_SIZE(sm8550_opp_pd_table),
>> +	.clk_tbl = sm8550_clk_table,
>> +	.clk_tbl_size = ARRAY_SIZE(sm8550_clk_table),
>> +	/* Upper bound of DMA address range */
>> +	.dma_mask = 0xe0000000 - 1,
>> +	.fwname = "qcom/vpu/vpu33_p4.mbn",
>> +	.pas_id = IRIS_PAS_ID,
>> +	.inst_caps = &platform_inst_cap_sm8550,
>> +	.inst_fw_caps = inst_fw_cap_sm8550,
>> +	.inst_fw_caps_size = ARRAY_SIZE(inst_fw_cap_sm8550),
>> +	.tz_cp_config_data = &tz_cp_config_sm8550,
>> +	.core_arch = VIDEO_ARCH_LX,
>> +	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
>> +	.ubwc_config = &ubwc_config_sm8550,
>> +	.num_vpp_pipe = 4,
>> +	.max_session_count = 16,
>> +	.max_core_mbpf = ((8192 * 4352) / 256) * 2,
>> +	.input_config_params =
>> +		sm8550_vdec_input_config_params,
>> +	.input_config_params_size =
>> +		ARRAY_SIZE(sm8550_vdec_input_config_params),
>> +	.output_config_params =
>> +		sm8550_vdec_output_config_params,
>> +	.output_config_params_size =
>> +		ARRAY_SIZE(sm8550_vdec_output_config_params),
>> +	.dec_input_prop = sm8550_vdec_subscribe_input_properties,
>> +	.dec_input_prop_size = ARRAY_SIZE(sm8550_vdec_subscribe_input_properties),
>> +	.dec_output_prop = sm8550_vdec_subscribe_output_properties,
>> +	.dec_output_prop_size = ARRAY_SIZE(sm8550_vdec_subscribe_output_properties),
>> +
>> +	.dec_ip_int_buf_tbl = sm8550_dec_ip_int_buf_tbl,
>> +	.dec_ip_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_ip_int_buf_tbl),
>> +	.dec_op_int_buf_tbl = sm8550_dec_op_int_buf_tbl,
>> +	.dec_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_op_int_buf_tbl),
>> +};
>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8550.h b/drivers/media/platform/qcom/iris/iris_platform_sm8550.h
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..ac8847edb585e4a9ce6b669a3a5988e7809972af
>> --- /dev/null
>> +++ b/drivers/media/platform/qcom/iris/iris_platform_sm8550.h
>> @@ -0,0 +1,11 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
>> + */
>> +
>> +#ifndef __IRIS_PLATFORM_SM8550_H__
>> +#define __IRIS_PLATFORM_SM8550_H__
>> +
>> +static const char * const sm8550_clk_reset_table[] = { "bus" };
>> +
>> +#endif
> There is no need of iris_platform_sm8550.h, you can keep this entry in
> gen2.c file itself. As we are making that our base.
> You can just have iris_platform_sm8650.h which overrides this entry with
> SOC specific reset requirements for SM8650.

Ok, so this was requested by Vikash, but it seemed weird, but as Dmitry sais
kind of symmetrical and ok in fact.

But I'll respin without this file if you request it.

neil

> 
> Thanks,
> Dikshita
>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8650.h b/drivers/media/platform/qcom/iris/iris_platform_sm8650.h
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..75e9d572e788de043a56cf85a4cb634bd02226b9
>> --- /dev/null
>> +++ b/drivers/media/platform/qcom/iris/iris_platform_sm8650.h
>> @@ -0,0 +1,13 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
>> + */
>> +
>> +#ifndef __IRIS_PLATFORM_SM8650_H__
>> +#define __IRIS_PLATFORM_SM8650_H__
>> +
>> +static const char * const sm8650_clk_reset_table[] = { "bus", "core" };
>> +
>> +static const char * const sm8650_controller_reset_table[] = { "xo" };
>> +
>> +#endif
>> diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
>> index 4f8bce6e2002bffee4c93dcaaf6e52bf4e40992e..7cd8650fbe9c09598670530103e3d5edf32953e7 100644
>> --- a/drivers/media/platform/qcom/iris/iris_probe.c
>> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
>> @@ -345,6 +345,10 @@ static const struct of_device_id iris_dt_match[] = {
>>   			.data = &sm8250_data,
>>   		},
>>   #endif
>> +	{
>> +		.compatible = "qcom,sm8650-iris",
>> +		.data = &sm8650_data,
>> +	},
>>   	{ },
>>   };
>>   MODULE_DEVICE_TABLE(of, iris_dt_match);
>>


