Return-Path: <linux-media+bounces-44378-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AFCEBD8392
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 10:40:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3ABDE4FA94F
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 08:40:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22FA430FC28;
	Tue, 14 Oct 2025 08:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Iwy+EznP"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACFE026FA4B
	for <linux-media@vger.kernel.org>; Tue, 14 Oct 2025 08:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760431243; cv=none; b=S80escgf8cfZkFStx6FOquuw3bO/7fMTkO7CR/bVngI0fwXUlwTBamPgVEmNfMPpGIUSFWsoTr8eAo7IV3koPZBoH+PUdzeJb913m6KbP8k+eW2T0wTlgLj4mQqJtXWJhTAJnoUqLJEFaFegMoqC5j2E7tKhbXHH6mI/reoKiAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760431243; c=relaxed/simple;
	bh=TndOlSdT95UlcUJaunSQHZ73ZZXRqzhfr+2roSZndts=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=F5XHtoLZWZU0RcwD+VB430D4D6w6eNmVHIzScyUlE475yNVcpnxKv+Q3+ryjllKuEK9RMVLdI8dEu620gDaa7th48uJMAoK/1Kp2GLUHb9GPLz35NYuo4IKryilB0asl3shYrV6Cs/RhyjioFtPPyaKF+FBw/7KSUqpyjhIjf5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Iwy+EznP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59E87Hus005377
	for <linux-media@vger.kernel.org>; Tue, 14 Oct 2025 08:40:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e0lBHZjW4Nqh3Y78+2kAAI6SB4C9VOdQTWThro0j6dA=; b=Iwy+EznPi41jd4PN
	jBq0cazI0u+/77vK9DkTqOna1EToQIlbFDPt580xUhMQM2+5pRpu2BQIiamkosd0
	FSewwRScVPH16pVFoLK+Pe++AXU0BkoGmkhslQxU5vtpkZFJh0ti0fBH6ohdtGlA
	c+N2vq/tOtLeMaJzPYqKOC+muQ9n76GDfB8whAZoEDP2dn2dnwig/wou+zh/opb/
	bdery5qslGJ5BsMMEXMrQ2F0X8FzxqAqpdBx5aVN/DPK76shV4VDjfmbPYArT7+t
	6iMaaGDXf/Fj1Au6+EokFX28uKB+sAzQ6K1fkx7lTrxHWkAQ3orf4ZSiWQp8jDsr
	ySC+Uw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfbhyrqj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 14 Oct 2025 08:40:40 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3304def7909so9045434a91.3
        for <linux-media@vger.kernel.org>; Tue, 14 Oct 2025 01:40:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760431238; x=1761036038;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e0lBHZjW4Nqh3Y78+2kAAI6SB4C9VOdQTWThro0j6dA=;
        b=vBvuLnZkQFmbRfUWNvNkDg0jXTzIQOTvyI09e91LS8r9Yl35ruh59c+qxikT8TOYTN
         6NQF45WyPyStLUUTy5063NDq9PLzYJAopnhjpi6M3VA4uJm0oGb5j56slHpRmYgFme00
         4ds1xjjQwIjK6LIUUv7rL6Sp/Aons3XRJAhATkrC4uS7/wknxVc4AWAaAmKiBLOzUzQv
         fEOhNzHnS2tOVesx610V1r937huk7t46vnOXlXT6+Ykp19wOgNzkEVobM5aUJKHtEi1V
         L+4TDwsDB2m0/TSCdGFaVjNHUKji/dCkAw7fMYmWQWttd1Ld++CL2f/SBYENKOGZaFW1
         jj4w==
X-Gm-Message-State: AOJu0YyD7qVn/wKfdEEKbtEZha9DL/NVxQgG6uqBig3dx33Oo14gKBcc
	fqMzNfI54RYTMK2s7ZlIXNtJPFVGYxihzlVntquC4Y0J4s5ins4mxWI5Lyy95s7MayMjnt1jDUj
	PJ75RuxbEw+uxFBbkF9DOf2z3dp5sN/aCP/3MhL9faWlrG2aItLIlHPhurUY3ByX7DdkMaR5oLQ
	==
X-Gm-Gg: ASbGncv1Gcp/M1Ca58Y4iqYZ7ZVVH5VqcJWQ1HWPLx4/8lC3IkRaUWCnXZxT7ZiaBIB
	EO9AfO/e8qwpQ0rwTcfRKADQYhUDcvl3ZRAWmt5x8U3RM15RB+DJQxNwc3zsWx76ZdODnzSr+0P
	GBZg60RinkmseaR86EKkbbhu/u5gII3+97jrhyL5AJ7UbVo3QiGp5B46PFXMD+FftLOVQ9dBRqk
	OhIVhzF6RK2igwMUrAmjHEw7ULdmhL6RpH6J4IBt+2jQS6NI5GZQJrxz1tG22z224za4p8Cuaqn
	gZzIH4u231GX4GLQlt9z5p995nTOKSJ5ml6jrJxoIxo/KjUhKPmrFPfd2kJ4wMTqY9GhsMgf
X-Received: by 2002:a17:90b:4c88:b0:32e:59ef:f403 with SMTP id 98e67ed59e1d1-33b513b4b5cmr36367222a91.17.1760431238345;
        Tue, 14 Oct 2025 01:40:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFyuJ0AQVSW9HrfUfYRJdSSW9YMDbY+7vSKqX2NNGvLMI++1PPQFj33hZtMzUd0RFY+wGqucg==
X-Received: by 2002:a17:90b:4c88:b0:32e:59ef:f403 with SMTP id 98e67ed59e1d1-33b513b4b5cmr36367155a91.17.1760431237617;
        Tue, 14 Oct 2025 01:40:37 -0700 (PDT)
Received: from [10.0.0.3] ([106.222.229.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b61a4bafesm15631518a91.11.2025.10.14.01.40.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Oct 2025 01:40:37 -0700 (PDT)
Message-ID: <664d5589-46a2-a592-3e7c-01f255613f2f@oss.qualcomm.com>
Date: Tue, 14 Oct 2025 14:10:33 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Subject: Re: [PATCH v3 8/8] media: iris: enable support for SC7280 platform
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251013-iris-sc7280-v3-0-f3bceb77a250@oss.qualcomm.com>
 <20251013-iris-sc7280-v3-8-f3bceb77a250@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20251013-iris-sc7280-v3-8-f3bceb77a250@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX55wyhFVfhC7X
 XAVt+PfacgPSOou5TFg9Cro/dFLL/XHgHqf0BZncOgF/5yZOYQmiJZXcC6W2uyRDvFm+fYaD2wo
 Qn8g7BvdU2v826iS4rCu5k9+/Mzzy9P/CdjnTAiGXKMpnyrGj7p3Nbw9/qwnnOE8zZRrwpXY659
 vLXxmqQl1N5jONEImx2pOCnbqPAx4pBO1yguSnZUXOzMHySMLXrutlHwkS9KQ719B5+v9+nECqw
 J8XJfikWetjXDLgPWIgAUlMINfCxrn+fAcXBZkE5teREfI9heGJHVZJUd1MOweBeFLVHhDlnBZO
 VkUr2pR4wl9ckDMfF0JH+mwGlA2qCNxn3w8vFa0sZpe2lYDGvekv19RsgvUpSNnCIgrQBPIqSDr
 6BAWAxkoLPYSbGBhQYy+GVV8+EWjRA==
X-Proofpoint-ORIG-GUID: Oh9CpLSvdAGv-7fCBiEhVBC8I5FVvRSj
X-Authority-Analysis: v=2.4 cv=bodBxUai c=1 sm=1 tr=0 ts=68ee0c88 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=L4UNg9I9cQSOxNpRiiGXlA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=7b6Sf04faytPFaYNhJoA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: Oh9CpLSvdAGv-7fCBiEhVBC8I5FVvRSj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110018



On 10/13/2025 7:39 AM, Dmitry Baryshkov wrote:
> As a part of migrating code from the old Venus driver to the new Iris
> one, add support for the SC7280 platform. It is very similar to SM8250,
> but it (currently) uses no reset controls (there is an optional
> GCC-generated reset, it will be added later) and no AON registers
> region. Extend the VPU ops to support optional clocks and skip the AON
> shutdown for this platform.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  .../platform/qcom/iris/iris_platform_common.h      |  4 ++
>  .../media/platform/qcom/iris/iris_platform_gen1.c  | 52 ++++++++++++++++++++++
>  .../platform/qcom/iris/iris_platform_sc7280.h      | 27 +++++++++++
>  drivers/media/platform/qcom/iris/iris_probe.c      |  4 ++
>  drivers/media/platform/qcom/iris/iris_resources.c  |  2 +-
>  drivers/media/platform/qcom/iris/iris_vpu2.c       |  6 +++
>  drivers/media/platform/qcom/iris/iris_vpu_common.c | 34 ++++++++++----
>  7 files changed, 119 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index 104ff38219e30e6d52476d44b54338c55ef2ca7b..43cd6bf94ab600e53f983c9e11b63dc0a572e6ad 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -42,6 +42,7 @@ enum pipe_type {
>  };
>  
>  extern const struct iris_platform_data qcs8300_data;
> +extern const struct iris_platform_data sc7280_data;
>  extern const struct iris_platform_data sm8250_data;
>  extern const struct iris_platform_data sm8550_data;
>  extern const struct iris_platform_data sm8650_data;
> @@ -50,7 +51,9 @@ extern const struct iris_platform_data sm8750_data;
>  enum platform_clk_type {
>  	IRIS_AXI_CLK, /* AXI0 in case of platforms with multiple AXI clocks */
>  	IRIS_CTRL_CLK,
> +	IRIS_AHB_CLK,
>  	IRIS_HW_CLK,
> +	IRIS_HW_AXI_CLK,

s/IRIS_HW_AXI_CLK/IRIS_HW_AHB_CLK

>  	IRIS_AXI1_CLK,
>  	IRIS_CTRL_FREERUN_CLK,
>  	IRIS_HW_FREERUN_CLK,
> @@ -230,6 +233,7 @@ struct iris_platform_data {
>  	u32 hw_response_timeout;
>  	struct ubwc_config_data *ubwc_config;
>  	u32 num_vpp_pipe;
> +	bool no_aon;
>  	u32 max_session_count;
>  	/* max number of macroblocks per frame supported */
>  	u32 max_core_mbpf;
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen1.c b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
> index 2b3b8bd00a6096acaae928318d9231847ec89855..828864902501aef072d60935fe57019a70dcb9f4 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_gen1.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
> @@ -12,6 +12,8 @@
>  #include "iris_vpu_buffer.h"
>  #include "iris_vpu_common.h"
>  
> +#include "iris_platform_sc7280.h"
> +
>  #define BITRATE_MIN		32000
>  #define BITRATE_MAX		160000000
>  #define BITRATE_PEAK_DEFAULT	(BITRATE_DEFAULT * 2)
> @@ -364,3 +366,53 @@ const struct iris_platform_data sm8250_data = {
>  	.enc_ip_int_buf_tbl = sm8250_enc_ip_int_buf_tbl,
>  	.enc_ip_int_buf_tbl_size = ARRAY_SIZE(sm8250_enc_ip_int_buf_tbl),
>  };
> +
> +const struct iris_platform_data sc7280_data = {
> +	.get_instance = iris_hfi_gen1_get_instance,
> +	.init_hfi_command_ops = &iris_hfi_gen1_command_ops_init,
> +	.init_hfi_response_ops = iris_hfi_gen1_response_ops_init,
> +	.get_vpu_buffer_size = iris_vpu_buf_size,
> +	.vpu_ops = &iris_vpu2_ops,
> +	.set_preset_registers = iris_set_sm8250_preset_registers,
> +	.icc_tbl = sm8250_icc_table,
> +	.icc_tbl_size = ARRAY_SIZE(sm8250_icc_table),
> +	.bw_tbl_dec = sc7280_bw_table_dec,
> +	.bw_tbl_dec_size = ARRAY_SIZE(sc7280_bw_table_dec),
> +	.pmdomain_tbl = sm8250_pmdomain_table,
> +	.pmdomain_tbl_size = ARRAY_SIZE(sm8250_pmdomain_table),
> +	.opp_pd_tbl = sc7280_opp_pd_table,
> +	.opp_pd_tbl_size = ARRAY_SIZE(sc7280_opp_pd_table),
> +	.clk_tbl = sc7280_clk_table,
> +	.clk_tbl_size = ARRAY_SIZE(sc7280_clk_table),
> +	/* Upper bound of DMA address range */
> +	.dma_mask = 0xe0000000 - 1,
> +	.fwname = "qcom/vpu/vpu20_p1.mbn",
> +	.pas_id = IRIS_PAS_ID,
> +	.inst_caps = &platform_inst_cap_sm8250,
> +	.inst_fw_caps_dec = inst_fw_cap_sm8250_dec,
> +	.inst_fw_caps_dec_size = ARRAY_SIZE(inst_fw_cap_sm8250_dec),
> +	.inst_fw_caps_enc = inst_fw_cap_sm8250_enc,
> +	.inst_fw_caps_enc_size = ARRAY_SIZE(inst_fw_cap_sm8250_enc),
> +	.tz_cp_config_data = &tz_cp_config_sm8250,
> +	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
> +	.num_vpp_pipe = 4,

num_vpp_pipe would be 1 for this.

> +	.no_aon = true,
> +	.max_session_count = 16,
> +	.max_core_mbpf = NUM_MBS_8K,
> +	.max_core_mbps = ((7680 * 4320) / 256) * 60,
> +	.dec_input_config_params_default =
> +		sm8250_vdec_input_config_param_default,
> +	.dec_input_config_params_default_size =
> +		ARRAY_SIZE(sm8250_vdec_input_config_param_default),
> +	.enc_input_config_params = sm8250_venc_input_config_param,
> +	.enc_input_config_params_size =
> +		ARRAY_SIZE(sm8250_venc_input_config_param),
> +
> +	.dec_ip_int_buf_tbl = sm8250_dec_ip_int_buf_tbl,
> +	.dec_ip_int_buf_tbl_size = ARRAY_SIZE(sm8250_dec_ip_int_buf_tbl),
> +	.dec_op_int_buf_tbl = sm8250_dec_op_int_buf_tbl,
> +	.dec_op_int_buf_tbl_size = ARRAY_SIZE(sm8250_dec_op_int_buf_tbl),
> +
> +	.enc_ip_int_buf_tbl = sm8250_enc_ip_int_buf_tbl,
> +	.enc_ip_int_buf_tbl_size = ARRAY_SIZE(sm8250_enc_ip_int_buf_tbl),
> +};
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_sc7280.h b/drivers/media/platform/qcom/iris/iris_platform_sc7280.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..f2dea77f2805f48ab00822fe9d70ffafadc47494
> --- /dev/null
> +++ b/drivers/media/platform/qcom/iris/iris_platform_sc7280.h
> @@ -0,0 +1,27 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +
> +#ifndef __IRIS_PLATFORM_SC7280_H__
> +#define __IRIS_PLATFORM_SC7280_H__
> +
> +static const struct bw_info sc7280_bw_table_dec[] = {
> +	{ ((3840 * 2160) / 256) * 60, 1896000, },
> +	{ ((3840 * 2160) / 256) * 30,  968000, },
> +	{ ((1920 * 1080) / 256) * 60,  618000, },
> +	{ ((1920 * 1080) / 256) * 30,  318000, },
> +};
> +
> +static const char * const sc7280_opp_pd_table[] = { "cx" };
> +
> +static const struct platform_clk_data sc7280_clk_table[] = {
> +	{IRIS_CTRL_CLK,    "core"         },
> +	{IRIS_AXI_CLK,     "bus"          },

s/bus/iface

> +	{IRIS_AHB_CLK,     "iface"        },

s/iface/bus

> +	{IRIS_HW_CLK,      "vcodec_core"  },
> +	{IRIS_HW_AXI_CLK,  "vcodec_bus"   },

s/IRIS_HW_AXI_CLK/IRIS_HW_AHB_CLK

Please rename at all relevant places.

Thanks,
Dikshita

> +};
> +
> +#endif
> diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
> index 00e99be16e087c4098f930151fd76cd381d721ce..9bc9b34c2576581635fa8d87eed1965657eb3eb3 100644
> --- a/drivers/media/platform/qcom/iris/iris_probe.c
> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
> @@ -357,6 +357,10 @@ static const struct of_device_id iris_dt_match[] = {
>  		.data = &qcs8300_data,
>  	},
>  #if (!IS_ENABLED(CONFIG_VIDEO_QCOM_VENUS))
> +	{
> +		.compatible = "qcom,sc7280-venus",
> +		.data = &sc7280_data,
> +	},
>  	{
>  		.compatible = "qcom,sm8250-venus",
>  		.data = &sm8250_data,
> diff --git a/drivers/media/platform/qcom/iris/iris_resources.c b/drivers/media/platform/qcom/iris/iris_resources.c
> index cf32f268b703c1c042a9bcf146e444fff4f4990d..164490c49c95ee048670981fdab014d20436ef85 100644
> --- a/drivers/media/platform/qcom/iris/iris_resources.c
> +++ b/drivers/media/platform/qcom/iris/iris_resources.c
> @@ -112,7 +112,7 @@ int iris_prepare_enable_clock(struct iris_core *core, enum platform_clk_type clk
>  
>  	clock = iris_get_clk_by_type(core, clk_type);
>  	if (!clock)
> -		return -EINVAL;
> +		return -ENOENT;
>  
>  	return clk_prepare_enable(clock);
>  }
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu2.c b/drivers/media/platform/qcom/iris/iris_vpu2.c
> index de7d142316d2dc9ab0c4ad9cc8161c87ac949b4c..9c103a2e4e4eafee101a8a9b168fdc8ca76e277d 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu2.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu2.c
> @@ -3,9 +3,15 @@
>   * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
>   */
>  
> +#include <linux/bits.h>
> +#include <linux/iopoll.h>
> +#include <linux/reset.h>
> +
>  #include "iris_instance.h"
>  #include "iris_vpu_common.h"
>  
> +#include "iris_vpu_register_defines.h"
> +
>  static u64 iris_vpu2_calc_freq(struct iris_inst *inst, size_t data_size)
>  {
>  	struct platform_inst_caps *caps = inst->core->iris_platform_data->inst_caps;
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
> index 2d6548e47d47967c1c110489cb8088130fb625fd..f8fd120873ccdcb5239985d0d6a8bbda144a98f6 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
> @@ -179,12 +179,14 @@ int iris_vpu_power_off_controller(struct iris_core *core)
>  
>  	writel(MSK_SIGNAL_FROM_TENSILICA | MSK_CORE_POWER_ON, core->reg_base + CPU_CS_X2RPMH);
>  
> -	writel(REQ_POWER_DOWN_PREP, core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
> +	if (!core->iris_platform_data->no_aon) {
> +		writel(REQ_POWER_DOWN_PREP, core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
>  
> -	ret = readl_poll_timeout(core->reg_base + AON_WRAPPER_MVP_NOC_LPI_STATUS,
> -				 val, val & BIT(0), 200, 2000);
> -	if (ret)
> -		goto disable_power;
> +		ret = readl_poll_timeout(core->reg_base + AON_WRAPPER_MVP_NOC_LPI_STATUS,
> +					 val, val & BIT(0), 200, 2000);
> +		if (ret)
> +			goto disable_power;
> +	}
>  
>  	writel(REQ_POWER_DOWN_PREP, core->reg_base + WRAPPER_IRIS_CPU_NOC_LPI_CONTROL);
>  
> @@ -207,6 +209,7 @@ int iris_vpu_power_off_controller(struct iris_core *core)
>  	writel(0x0, core->reg_base + WRAPPER_TZ_CTL_AXI_CLOCK_CONFIG);
>  
>  disable_power:
> +	iris_disable_unprepare_clock(core, IRIS_AHB_CLK);
>  	iris_disable_unprepare_clock(core, IRIS_CTRL_CLK);
>  	iris_disable_unprepare_clock(core, IRIS_AXI_CLK);
>  	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
> @@ -218,6 +221,7 @@ void iris_vpu_power_off_hw(struct iris_core *core)
>  {
>  	dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN], false);
>  	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
> +	iris_disable_unprepare_clock(core, IRIS_HW_AXI_CLK);
>  	iris_disable_unprepare_clock(core, IRIS_HW_CLK);
>  }
>  
> @@ -251,11 +255,17 @@ int iris_vpu_power_on_controller(struct iris_core *core)
>  
>  	ret = iris_prepare_enable_clock(core, IRIS_CTRL_CLK);
>  	if (ret)
> -		goto err_disable_clock;
> +		goto err_disable_axi_clock;
> +
> +	ret = iris_prepare_enable_clock(core, IRIS_AHB_CLK);
> +	if (ret && ret != -ENOENT)
> +		goto err_disable_ctrl_clock;
>  
>  	return 0;
>  
> -err_disable_clock:
> +err_disable_ctrl_clock:
> +	iris_disable_unprepare_clock(core, IRIS_CTRL_CLK);
> +err_disable_axi_clock:
>  	iris_disable_unprepare_clock(core, IRIS_AXI_CLK);
>  err_disable_power:
>  	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
> @@ -275,13 +285,19 @@ int iris_vpu_power_on_hw(struct iris_core *core)
>  	if (ret)
>  		goto err_disable_power;
>  
> +	ret = iris_prepare_enable_clock(core, IRIS_HW_AXI_CLK);
> +	if (ret && ret != -ENOENT)
> +		goto err_disable_hw_clock;
> +
>  	ret = dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN], true);
>  	if (ret)
> -		goto err_disable_clock;
> +		goto err_disable_hw_axi_clock;
>  
>  	return 0;
>  
> -err_disable_clock:
> +err_disable_hw_axi_clock:
> +	iris_disable_unprepare_clock(core, IRIS_HW_AXI_CLK);
> +err_disable_hw_clock:
>  	iris_disable_unprepare_clock(core, IRIS_HW_CLK);
>  err_disable_power:
>  	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
> 

