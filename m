Return-Path: <linux-media+bounces-29898-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 119F0A83DC4
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 11:04:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4842C4C417C
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 09:01:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39D4D20DD51;
	Thu, 10 Apr 2025 09:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="u9Bpe9a4"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80B9720C473
	for <linux-media@vger.kernel.org>; Thu, 10 Apr 2025 09:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744275689; cv=none; b=F3kaNNRG+MrWnOIgmH0J19S7K0Yuyyrj2BkwOzALT8y+EYjMqpno6tVL3j3sEuCmPhdJM94BKDN92BR3fff1MzVMlLkWcYNl8eS+5rkDfySJx2jB1htevWJiG2sQD6SbUxiQDWymS3VOP7AFO34RnzR5gO69ZTTlY9LP2xt56rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744275689; c=relaxed/simple;
	bh=2VneLB8/xCuP6Q1rawp6bZVIX/46Zf8DzoFjno1k0yc=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=cYdJxAz5lDBqSqHDsdg6TiD/2YQXLkpgqxlX8KYesO3giu4ouThtGRPXMDK6bJFZFf4XWrVLhtnP77Fv0wQNOKHppvT4Jab2bI/sVlC4ZKX1ltyGxKopI0UGMYaLkEXfZ8cxubfsdqP53iMN6pR8hXw6ELhqqT3F965Xom8p0JU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=u9Bpe9a4; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4394a823036so5781445e9.0
        for <linux-media@vger.kernel.org>; Thu, 10 Apr 2025 02:01:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744275686; x=1744880486; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oh8/If+oBEjrA7bnRqmKCZXwh8GIaPRWwY+4IzOPAWY=;
        b=u9Bpe9a4IZTYow8Ovu3x43ruXNe2ZyC7HDEJINTePqLdo8HidO0/9wH0IxjZ9Goz/7
         TG9E3jUJuS5pQH5Ejg2EPcF0T9TMecWl40fpTZQ6PWP29YeLy2DGnXwKw30DuckuLHJY
         snqddyrJy8CRTZb/5Ba9r8o6H/jlu9JnVCEkrrzuCVxQ8omCmeA63XIqakDzSOUFkn8Z
         YaKPvcdVcak7Qxv6N+WpEQCTK3H6HcaQq5J0TPw3YJFWlX9H3nTPReGpvi+U1dCj1x8Y
         EHwFeNWgUj6FL/L9wvhs5CEZnx8IELqdn2Gj35YO6RzConkClP8j03yG7Cf2YQruA57p
         ElZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744275686; x=1744880486;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=oh8/If+oBEjrA7bnRqmKCZXwh8GIaPRWwY+4IzOPAWY=;
        b=ZZJuoFGJPbH5Yb3ZCR5pfbXrW2LcfEu/3eEZqHmU0oFlcmNyYYqrfDWBo8UDEyj9zK
         eYGY+nTtpWpUXVFFBqaS+9ITJKRgWOUF+29slAr2zI8NRCLNUMKMpA9waGyNPnk4tFM+
         AfQVBnj+nT+ZVooXUwwua6WSSHmc0y39SSMkp74hgV2Od0Giq7hfDLHss1YaMPXb41Qa
         tnAqJ8eYScANvNNQaqDG06N2oossaSg1Id6wyX4GlRw3wrF4UZfGbp96yp+GlhkDgmas
         Gr6zaoZcGMsB6yml6R8xolfjr8MiiopzdSpcZQ01plJU4C+pL31ItJp1mVYT1JQB+VMD
         oTow==
X-Gm-Message-State: AOJu0Yxk63RUc4oUfTs1SI17IcsFjhYdh2K7JmQdKEhFvPMT+JqTqpnp
	ZXsLd11/+v9my5hZyLFg+aSH3BZuFGiRd8E6Tok736P3Z5+gTXghSWZEYAOun/0=
X-Gm-Gg: ASbGncuB52B4Jlh+A7fySkW0KpWLsW4MqgpXE4FuRCFEwFEpfM7Cf/DfHN6dMsNVoIw
	EiatovCY5Z5zLI3I1GpgZcYuhrA0vv021+IKcVLRiQrem5X6vphXGpI6/2KCiLmyW3d5tvreTT0
	hqhe2LAhhdnPuFj8Sah92RpiqvBKISQHqgmV5bjvs39yWDtEsGyiBX814sFH0NfQu0qABeJ/gxA
	QxAc7dVyQlU/7o9wfL1aNiOteYGxLRPe9tlpZ3L7jRZh39U5L/eJEK+/E3HuJwA5tODu3hrPFS/
	TrCkqb756unMv5wF5CvXO0Kb0Wbr1JqvrDxZKH52sfiBgKUzlo1937aZvaa2fZJcqQtehPDO5Ja
	mDXwUtoLirWxW5XJn9g==
X-Google-Smtp-Source: AGHT+IGtOq7myY4YJoi4d1yK1mMfcXZ0/5kdRDE4Co36xHftaRobcvo3Am7x0j49xmwISyb9r7/LGg==
X-Received: by 2002:a05:600c:3b9f:b0:43c:eec7:eab7 with SMTP id 5b1f17b1804b1-43f2d7b8143mr17238855e9.11.1744275685639;
        Thu, 10 Apr 2025 02:01:25 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:1a13:cd5d:5261:ebfe? ([2a01:e0a:3d9:2080:1a13:cd5d:5261:ebfe])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39d893776dfsm4204227f8f.33.2025.04.10.02.01.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Apr 2025 02:01:25 -0700 (PDT)
Message-ID: <1550c870-188e-4b41-b17c-2009cda41ffc@linaro.org>
Date: Thu, 10 Apr 2025 11:01:24 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v4 6/6] media: platform: qcom/iris: add sm8650 support
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20250409-topic-sm8x50-iris-v10-v4-0-40e411594285@linaro.org>
 <20250409-topic-sm8x50-iris-v10-v4-6-40e411594285@linaro.org>
 <36e25d6e-36de-fec6-e54d-0683503c7a09@quicinc.com>
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
In-Reply-To: <36e25d6e-36de-fec6-e54d-0683503c7a09@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09/04/2025 18:57, Vikash Garodia wrote:
> Hi Neil,
> 
> On 4/9/2025 8:08 PM, Neil Armstrong wrote:
>> Add support for the SM8650 platform by re-using the SM8550
>> definitions and using the vpu33 ops.
>>
>> The SM8650/vpu33 requires more reset lines, but the H.264
>> decoder capabilities are identical.
>>
>> Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org> # x1e Dell
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   .../platform/qcom/iris/iris_platform_common.h      |  1 +
>>   .../platform/qcom/iris/iris_platform_sm8550.c      | 64 ++++++++++++++++++++++
>>   drivers/media/platform/qcom/iris/iris_probe.c      |  4 ++
>>   3 files changed, 69 insertions(+)
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
>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8550.c b/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
>> index 35d278996c430f2856d0fe59586930061a271c3e..d0f8fa960d53367023e41bc5807ba3f8beae2efc 100644
>> --- a/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
>> +++ b/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
>> @@ -144,6 +144,10 @@ static const struct icc_info sm8550_icc_table[] = {
>>   
>>   static const char * const sm8550_clk_reset_table[] = { "bus" };
>>   
>> +static const char * const sm8650_clk_reset_table[] = { "bus", "core" };
>> +
>> +static const char * const sm8650_controller_reset_table[] = { "xo" };
>> +
>>   static const struct bw_info sm8550_bw_table_dec[] = {
>>   	{ ((4096 * 2160) / 256) * 60, 1608000 },
>>   	{ ((4096 * 2160) / 256) * 30,  826000 },
>> @@ -264,3 +268,63 @@ struct iris_platform_data sm8550_data = {
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
> While i was extending the data for QCS8300 (one another iris-v3 variant), i
> realize that this file iris_platform_sm8550.c is getting dumped with all SOC
> platform data. It would be a good idea at this point to split it into something
> like this
> 1. Introduce SOC specific c file and move the respective SOC platform data to
> it, for ex, in this case sm8650_data
> 2. Move the common structs from iris_platform_sm8550.c to
> iris_platform_common.h. This way more SOCs getting added in future, can include
> the common header to reuse them, otherwise it would end up using 8550.c for all
> future SOC.
> 
> Share your comments if you have any better approach to manage/re-use these
> platform data considering more SOCs getting added.

Right, yes the architecture is fine, but I don't feel iris_platform_common is the right
place, perhaps we could introduce a platform_catalog.c where we could place all the common
platform data and reuse them from the platform_<soc>.c files ?

I can design prototype on top of this patchset as an RFC.

Neil

> 
> Regards,
> Vikash
> 
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


