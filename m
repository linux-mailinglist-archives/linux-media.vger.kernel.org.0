Return-Path: <linux-media+bounces-39530-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D905B22038
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 10:05:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 37A3E7ADBC9
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 08:04:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C97E32E0B42;
	Tue, 12 Aug 2025 08:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="VcquJxgZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8DE8274667;
	Tue, 12 Aug 2025 08:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754985941; cv=none; b=Klhe9CgrlkfcG5CR0efW15dUcMxOFtJvYlqpSyX8DaGyacRmEQF1DdxR7oVVzwj3PkmSg9iu30jym40AqOWivFxXua2xsjw93/V69swfRjNd+SOZbrMjc+5FhmR+vSC1LQy9qb7CHVt2UHKQUs9X4Awogb7Nj+WQtWWiTLAFrQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754985941; c=relaxed/simple;
	bh=ZHxDnYoBJhldiohdJcHxz/0M1ZzrdXwX0ExjM5TLD8Q=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:CC:References:
	 In-Reply-To:Content-Type; b=KKAsb76yAnU9q3PI0bNzortiRd/JXgTlnRV4deDfShBXrEH5f4i+uhxjIarEI2mn5G/NqsFb0qzhgAm/7X4aaCk6B3edOvqj5Cnxr8Z2ktwreA8egtetxTjIe57b4tJbcUyLmsriWiqA3EMOHqh/8aDjsE8WAr2u4lL4WPnf8IQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=VcquJxgZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57C5XLft018323;
	Tue, 12 Aug 2025 08:05:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ndvyYkyYVJ1vtKJily9eLGxh8xMaDJ9OlKka8xNcDq4=; b=VcquJxgZHZdculuS
	Onco3+ASE6LfAi6XZAWRT6MIxBYGKFr2eiUvYiIOiCntO4QaSHDzpeSjBpfLPjen
	Mggmyad9ywmlC7J8y4uSqy+NKOde07px1nAqUS7quKjTdSYgwMwBxYi0d8Pmrgcr
	eVztZ+U/u3PBgsA2hFjCFX60kBLVJBTrFNQ4Te/ihn8CKOQj8LKxzHIfdRHQHKBW
	xdN72/1Q2tJFjfNdbpHf9cK3zBJWMMoeb6HiwWGRgBc28p/O0fWnDqWzjiKuufLs
	1mSaGGaUSJ1rDcJG5KRMShVsztvDmsSiMYnyr1MwgrJPrlIkmNYR54b9Fkr5yN+U
	KWS8xA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dy3g79jq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Aug 2025 08:05:28 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57C85RvJ004377
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Aug 2025 08:05:27 GMT
Received: from [10.50.36.96] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 12 Aug
 2025 01:05:23 -0700
Message-ID: <83205cad-14f5-65a1-1818-677335a1ab91@quicinc.com>
Date: Tue, 12 Aug 2025 13:35:20 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Subject: Re: [PATCH v2 3/3] media: iris: Add support for SM8750 (VPU v3.5)
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Vikash Garodia
	<quic_vgarodia@quicinc.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        "Bryan
 O'Donoghue" <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel
	<p.zabel@pengutronix.de>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250804-sm8750-iris-v2-0-6d78407f8078@linaro.org>
 <20250804-sm8750-iris-v2-3-6d78407f8078@linaro.org>
Content-Language: en-US
In-Reply-To: <20250804-sm8750-iris-v2-3-6d78407f8078@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=X4lSKHTe c=1 sm=1 tr=0 ts=689af5c8 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=k3A79mnGPrT8yjkfERsA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAzMSBTYWx0ZWRfX+iqufcsMiORW
 hTE1MUAVcUgEbaTUsjNyBapSAT4Si5OB/nhZQYiwKB1zErR9VIPHpZ4Yt0GWTtVY8OgtIXyzNDE
 mowox5hquB+pfgoQTmEtAsipWlQFEDSjivM3onNYy7l5/FLJLeBj3X0B6/RpTnj2FBvvhXmfx0p
 p7RqN4P/QChQUmKjuznHp6dgSqGAdvdrhENzX3FBKDMvw17deyNRndRHLLdlnHHS4gYyhBXmzmf
 caFsdMmdy70IvCT5LWojHMo+4pdBpr2YX8AY4f26HwH0wehGXt9NW0EsfBy4NcAxhK2RE1dPiZn
 uERJ9nqqg2amnG7f5C13vLKKrSz9Tons4uXqlFWx5AzYrDuncESQG7BQW9y6R8/5DhMlMRY1k1G
 20lVj6/i
X-Proofpoint-GUID: oeLCFs4gPAJnPoe2_1U0YkPs7FN7XrNM
X-Proofpoint-ORIG-GUID: oeLCFs4gPAJnPoe2_1U0YkPs7FN7XrNM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_02,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 adultscore=0
 spamscore=0 bulkscore=0 suspectscore=0 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090031



On 8/4/2025 7:07 PM, Krzysztof Kozlowski wrote:
> Add support for SM8750 Iris codec with major differences against
> previous generation SM8650:
> 
> 1. New clocks and new resets, thus new power up and power down
>    sequences,
> 
> 2. New WRAPPER_IRIS_VCODEC_VPU_WRAPPER_SPARE_0 register programmed
>    during boot-up
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../platform/qcom/iris/iris_platform_common.h      |   6 +-
>  .../media/platform/qcom/iris/iris_platform_gen2.c  |  68 ++++++++++
>  .../platform/qcom/iris/iris_platform_sm8750.h      |  22 ++++
>  drivers/media/platform/qcom/iris/iris_probe.c      |   4 +
>  drivers/media/platform/qcom/iris/iris_vpu3x.c      | 146 +++++++++++++++++++++
>  drivers/media/platform/qcom/iris/iris_vpu_common.c |   4 +
>  drivers/media/platform/qcom/iris/iris_vpu_common.h |   2 +
>  7 files changed, 251 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index adafdce8a856f9c661aabc5ca28f0faceaa93551..fd5a6e69e01cfd00253f4ffb282d40112b93073b 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -38,11 +38,15 @@ extern struct iris_platform_data qcs8300_data;
>  extern struct iris_platform_data sm8250_data;
>  extern struct iris_platform_data sm8550_data;
>  extern struct iris_platform_data sm8650_data;
> +extern struct iris_platform_data sm8750_data;
>  
>  enum platform_clk_type {
> -	IRIS_AXI_CLK,
> +	IRIS_AXI_CLK, /* AXI0 in case of platforms with multiple AXI clocks */
>  	IRIS_CTRL_CLK,
>  	IRIS_HW_CLK,
> +	IRIS_AXI1_CLK,
> +	IRIS_CTRL_FREERUN_CLK,
> +	IRIS_HW_FREERUN_CLK,
>  };
>  
>  struct platform_clk_data {
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> index d3026b2bcb708c7ec31f134f628df7e57b54af4f..c7c384fce2332255ea96da69ef4dc0bc1a24771c 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> @@ -1,6 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0-only
>  /*
>   * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) 2025 Linaro Ltd


I don't see a need to add a copyright here.


>   */
>  
>  #include "iris_core.h"
> @@ -12,6 +13,7 @@
>  
>  #include "iris_platform_qcs8300.h"
>  #include "iris_platform_sm8650.h"
> +#include "iris_platform_sm8750.h"
>  
>  #define VIDEO_ARCH_LX 1
>  
> @@ -463,6 +465,72 @@ struct iris_platform_data sm8650_data = {
>  	.dec_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_op_int_buf_tbl),
>  };
>  

<snip>

> diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8750.h b/drivers/media/platform/qcom/iris/iris_platform_sm8750.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..719056656a5baf48a7bced634d2582629333cf5c
> --- /dev/null
> +++ b/drivers/media/platform/qcom/iris/iris_platform_sm8750.h
> @@ -0,0 +1,22 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2025 Linaro Ltd

Ack.

>  static bool iris_vpu3x_hw_power_collapsed(struct iris_core *core)
>  {
> @@ -225,6 +230,138 @@ static int iris_vpu33_power_off_controller(struct iris_core *core)
>  	return 0;
>  }
>  

<snip>

> +
> +static void iris_vpu35_power_off_hw(struct iris_core *core)
> +{
> +	iris_vpu33_power_off_hardware(core);

JFYI, write to AON_WRAPPER_MVP_NOC_LPI_CONTROL before reading the LPI
status was missing in vpu33 along with a retry logic which will be fixed
with
https://lore.kernel.org/linux-media/20250812-sm8650-power-sequence-fix-v1-1-a51e7f99c56c@quicinc.com/

> +
> +	iris_disable_unprepare_clock(core, IRIS_HW_FREERUN_CLK);
> +	iris_disable_unprepare_clock(core, IRIS_AXI_CLK);
> +}
> +
> +static int iris_vpu35_power_off_controller(struct iris_core *core)
> +{
> +	u32 clk_rst_tbl_size = core->iris_platform_data->clk_rst_tbl_size;
> +	u32 val = 0;
> +	int ret;
> +
> +	writel(MSK_SIGNAL_FROM_TENSILICA | MSK_CORE_POWER_ON, core->reg_base + CPU_CS_X2RPMH);
> +
> +	writel(REQ_POWER_DOWN_PREP, core->reg_base + WRAPPER_IRIS_CPU_NOC_LPI_CONTROL);
> +
> +	ret = readl_poll_timeout(core->reg_base + WRAPPER_IRIS_CPU_NOC_LPI_STATUS,
> +				 val, val & BIT(0), 200, 2000);
> +	if (ret)
> +		goto disable_power;
> +
> +	writel(0x0, core->reg_base + WRAPPER_IRIS_CPU_NOC_LPI_CONTROL);
> +
> +	writel(REQ_POWER_DOWN_PREP, core->reg_base + AON_WRAPPER_MVP_VIDEO_CTL_NOC_LPI_CONTROL);


Read initial status of AON_WRAPPER_MVP_VIDEO_CTL_NOC_LPI_STATUS

based on value, run the retry loop.
This loop runs till the desired LPI state is reached i.e. BIT(0) is set,
and hardware is idle i.e. BIT(1) or BIT(2) are unset. This suggests a
situation where the hardware might be stuck or slow to transition.

This sequence was not needed for SM8650 since it doesn't have
AON_WRAPPER_MVP_VIDEO_CTL_NOC_LPI_CONTROL/STATUS registers.
But required for SM8750, so please add.


> +	ret = readl_poll_timeout(core->reg_base + AON_WRAPPER_MVP_VIDEO_CTL_NOC_LPI_STATUS,
> +				 val, val & (BIT(0) | BIT(1) | BIT(2)), 15, 1000);
> +	if (ret)
> +		goto disable_power> +
> +	writel(0x0, core->reg_base + AON_WRAPPER_MVP_VIDEO_CTL_NOC_LPI_CONTROL);
> +
> +	writel(0x0, core->reg_base + WRAPPER_DEBUG_BRIDGE_LPI_CONTROL);
> +
> +	ret = readl_poll_timeout(core->reg_base + WRAPPER_DEBUG_BRIDGE_LPI_STATUS,
> +				 val, val == 0, 200, 2000);
> +	if (ret)
> +		goto disable_power;
> +
> +disable_power:
> +	iris_disable_unprepare_clock(core, IRIS_CTRL_CLK);
> +	iris_disable_unprepare_clock(core, IRIS_CTRL_FREERUN_CLK);
> +	iris_disable_unprepare_clock(core, IRIS_AXI1_CLK);
> +
> +	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
> +
> +	reset_control_bulk_reset(clk_rst_tbl_size, core->resets);
> +
> +	return 0;
> +}
> +
> +static int iris_vpu35_power_on_controller(struct iris_core *core)
> +{
> +	u32 rst_tbl_size = core->iris_platform_data->clk_rst_tbl_size;
> +	int ret;
> +
> +	ret = iris_enable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
> +	if (ret)
> +		return ret;
> +
> +	ret = reset_control_bulk_reset(rst_tbl_size, core->resets);
> +	if (ret)
> +		goto err_disable_power;


this reset is not needed to power-on this SOC.


> +
> +	ret = iris_prepare_enable_clock(core, IRIS_AXI1_CLK);
> +	if (ret)
> +		goto err_disable_power;
> +
> +	ret = iris_prepare_enable_clock(core, IRIS_CTRL_FREERUN_CLK);
> +	if (ret)
> +		goto err_disable_axi1_clk;
> +
> +	ret = iris_prepare_enable_clock(core, IRIS_CTRL_CLK);
> +	if (ret)
> +		goto err_disable_ctrl_free_clk;
> +
> +	return 0;
> +
> +err_disable_ctrl_free_clk:
> +	iris_disable_unprepare_clock(core, IRIS_CTRL_FREERUN_CLK);
> +err_disable_axi1_clk:
> +	iris_disable_unprepare_clock(core, IRIS_AXI1_CLK);
> +err_disable_power:
> +	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
> +
> +	return ret;
> +}
> +

Thanks,
Dikshita

