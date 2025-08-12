Return-Path: <linux-media+bounces-39526-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C92F3B2200A
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 09:57:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CA53D68735F
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 07:56:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 286FB2E172C;
	Tue, 12 Aug 2025 07:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Fob5rg5a"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5E8D2DECD2;
	Tue, 12 Aug 2025 07:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754985339; cv=none; b=YcGuhlHzGBGXu87JYPSX4/Q3bz3XHIRGRq4P6RmHNrVqcNBuDNYlQwm4GtWosvXf7Xy53R0WcEuFXP5YFN/GuZ1anMuDJyxsEbgWIaio/RUuJpGt+QIqbyZ+Dy2dsGpFOEB5F3tJSF/GIS6vAjtEeleN8bvUI+DxPP6JJWYcq7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754985339; c=relaxed/simple;
	bh=WR9zbpUeW6K0+9bkN6ytzYWgRt4/+A1lJKLEW8A3NVk=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:CC:References:
	 In-Reply-To:Content-Type; b=N2ocLEGxxY4NOSmCAjmXP0a/92GJdiWR9l6kBxEFcJoxTAlsSXaHOLbgFRVFNXqubEbPSarO3Wir/27ny/BrOXgD8aLQFKfhhKBIofwb3Y8F8cbKAHt+EOTtguNedsxvSTFdwMO5PEFt3Im0mPRGJ/7o2LK28h7/b6WHnAGFY0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Fob5rg5a; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57C5C0TM013114;
	Tue, 12 Aug 2025 07:55:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eqJxD8M3VSm8TRe08EtFgf0a8BABKU7/3MGq4jGw81Y=; b=Fob5rg5a9O1rOQCG
	01j9YOL2lm6zU0ioWeNYODp11qiRxhDvUBDuVsSRJ2Nros6ucHBXS4nNKOyoxEMl
	DNoWvbnyVeMopgqua6bOSzJ/28fJm6bg9A04LGgYp6yatlK5XVgYw9bc4t5lBtrR
	MKbmnZTT2o/BHCpIMt7sUnS56W9REavtadmByC2vQ9xOcqU4xEoAaq1smbpxxuuE
	/+b8QoVLG08zvCqoz+cdAzVjUJe2S0reUq2iX/30ltOIQsGiLJspjbIyoqX09byO
	WPTBTGGJIUL1tEniplkOOecMzzPeYvn9/UQobembLh3zlTxZDwqX6uxVQ6cj88YS
	B49Urw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dupmqe5c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Aug 2025 07:55:28 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57C7tR0p009638
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Aug 2025 07:55:27 GMT
Received: from [10.50.36.96] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 12 Aug
 2025 00:55:22 -0700
Message-ID: <2d6af3a8-059d-571f-359f-aaccf93f033e@quicinc.com>
Date: Tue, 12 Aug 2025 13:25:19 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Subject: Re: [PATCH v2 2/3] media: iris: Split power on per variants
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
 <20250804-sm8750-iris-v2-2-6d78407f8078@linaro.org>
Content-Language: en-US
In-Reply-To: <20250804-sm8750-iris-v2-2-6d78407f8078@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=bY5rUPPB c=1 sm=1 tr=0 ts=689af370 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=KKAkSRfTAAAA:8
 a=COk6AnOGAAAA:8 a=bSX0Cy9lciFp89yyxH8A:9 a=QEXdDO2ut3YA:10
 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: YvsYy9qsnHrM09QnmlU9sNXsFDTjRYIR
X-Proofpoint-ORIG-GUID: YvsYy9qsnHrM09QnmlU9sNXsFDTjRYIR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAwMCBTYWx0ZWRfX5SrdkHsPIBQU
 YldRuz3zjS5Yw2Fu+Y+HM3If5j4sivBnonUnRFR1qpW+s5DhP6PW0G9SUZ93OYfyKLOCcvq+n2y
 5rtV+2AS9AIkRYN4Izj9MCVSqFt/btWJHkua/4cuiOZ4v6FPvWwYdrvezoFGFNSfojzv4jvjapo
 AcykrRQ5aLkmSpf6OB5Fz02CnixPs/YY8VfEq/q7YBXTjpBatr3oxXUm5HLa6VEJvrpNM0T08mX
 L+NjSRXh1A871dZ1MZLK5wV5Aab1vIw8OvLqwyIr+mJ0hpwQtcjlaAhQaVmOOsAnkSP6SRS0R7b
 kNo4dokeC7QHpyG7eEI8WGGfnNVXYvmxDjyTEMPtFU0Uy64zhGnaaeOlGVB085dL5xKO3hkuuJ/
 RDsjbFWv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_02,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 clxscore=1015 phishscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090000



On 8/4/2025 7:07 PM, Krzysztof Kozlowski wrote:
> Current devices use same power up sequence, but starting with Qualcomm
> SM8750 (VPU v3.5) the sequence will grow quite a bit, so allow
> customizing it.  No functional change so far for existing devices.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/media/platform/qcom/iris/iris_vpu2.c       | 2 ++
>  drivers/media/platform/qcom/iris/iris_vpu3x.c      | 4 ++++
>  drivers/media/platform/qcom/iris/iris_vpu_common.c | 8 ++++----
>  drivers/media/platform/qcom/iris/iris_vpu_common.h | 4 ++++
>  4 files changed, 14 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu2.c b/drivers/media/platform/qcom/iris/iris_vpu2.c
> index 7cf1bfc352d34b897451061b5c14fbe90276433d..de7d142316d2dc9ab0c4ad9cc8161c87ac949b4c 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu2.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu2.c
> @@ -34,6 +34,8 @@ static u64 iris_vpu2_calc_freq(struct iris_inst *inst, size_t data_size)
>  
>  const struct vpu_ops iris_vpu2_ops = {
>  	.power_off_hw = iris_vpu_power_off_hw,
> +	.power_on_hw = iris_vpu_power_on_hw,
>  	.power_off_controller = iris_vpu_power_off_controller,
> +	.power_on_controller = iris_vpu_power_on_controller,
>  	.calc_freq = iris_vpu2_calc_freq,
>  };
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu3x.c b/drivers/media/platform/qcom/iris/iris_vpu3x.c
> index 9b7c9a1495ee2f51c60b1142b2ed4680ff798f0a..c235112057aa7b7eab1995737541b7a8276ff18b 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu3x.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu3x.c
> @@ -264,12 +264,16 @@ static u64 iris_vpu3x_calculate_frequency(struct iris_inst *inst, size_t data_si
>  
>  const struct vpu_ops iris_vpu3_ops = {
>  	.power_off_hw = iris_vpu3_power_off_hardware,
> +	.power_on_hw = iris_vpu_power_on_hw,
>  	.power_off_controller = iris_vpu_power_off_controller,
> +	.power_on_controller = iris_vpu_power_on_controller,
>  	.calc_freq = iris_vpu3x_calculate_frequency,
>  };
>  
>  const struct vpu_ops iris_vpu33_ops = {
>  	.power_off_hw = iris_vpu33_power_off_hardware,
> +	.power_on_hw = iris_vpu_power_on_hw,
>  	.power_off_controller = iris_vpu33_power_off_controller,
> +	.power_on_controller = iris_vpu_power_on_controller,
>  	.calc_freq = iris_vpu3x_calculate_frequency,
>  };
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
> index 42a7c53ce48eb56a4210c7e25c707a1b0881a8ce..6c51002f72ab3d9e16d5a2a50ac712fac91ae25c 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
> @@ -271,7 +271,7 @@ void iris_vpu_power_off(struct iris_core *core)
>  		disable_irq_nosync(core->irq);
>  }
>  
> -static int iris_vpu_power_on_controller(struct iris_core *core)
> +int iris_vpu_power_on_controller(struct iris_core *core)
>  {
>  	u32 rst_tbl_size = core->iris_platform_data->clk_rst_tbl_size;
>  	int ret;
> @@ -302,7 +302,7 @@ static int iris_vpu_power_on_controller(struct iris_core *core)
>  	return ret;
>  }
>  
> -static int iris_vpu_power_on_hw(struct iris_core *core)
> +int iris_vpu_power_on_hw(struct iris_core *core)
>  {
>  	int ret;
>  
> @@ -337,11 +337,11 @@ int iris_vpu_power_on(struct iris_core *core)
>  	if (ret)
>  		goto err;
>  
> -	ret = iris_vpu_power_on_controller(core);
> +	ret = core->iris_platform_data->vpu_ops->power_on_controller(core);
>  	if (ret)
>  		goto err_unvote_icc;
>  
> -	ret = iris_vpu_power_on_hw(core);
> +	ret = core->iris_platform_data->vpu_ops->power_on_hw(core);
>  	if (ret)
>  		goto err_power_off_ctrl;
>  
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.h b/drivers/media/platform/qcom/iris/iris_vpu_common.h
> index 93b7fa27be3bfa1cf6a3e83cc192cdb89d63575f..d95b305ca5a89ba8f08aefb6e6acd9ea4a721a8b 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_common.h
> @@ -14,7 +14,9 @@ extern const struct vpu_ops iris_vpu33_ops;
>  
>  struct vpu_ops {
>  	void (*power_off_hw)(struct iris_core *core);
> +	int (*power_on_hw)(struct iris_core *core);
>  	int (*power_off_controller)(struct iris_core *core);
> +	int (*power_on_controller)(struct iris_core *core);
>  	u64 (*calc_freq)(struct iris_inst *inst, size_t data_size);
>  };
>  
> @@ -23,6 +25,8 @@ void iris_vpu_raise_interrupt(struct iris_core *core);
>  void iris_vpu_clear_interrupt(struct iris_core *core);
>  int iris_vpu_watchdog(struct iris_core *core, u32 intr_status);
>  int iris_vpu_prepare_pc(struct iris_core *core);
> +int iris_vpu_power_on_controller(struct iris_core *core);
> +int iris_vpu_power_on_hw(struct iris_core *core);
>  int iris_vpu_power_on(struct iris_core *core);
>  int iris_vpu_power_off_controller(struct iris_core *core);
>  void iris_vpu_power_off_hw(struct iris_core *core);
> 

Reviewed-by: Dikshita Agarwal <quic_dikshita@quicinc.com>

