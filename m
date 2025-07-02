Return-Path: <linux-media+bounces-36618-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 47248AF5FD1
	for <lists+linux-media@lfdr.de>; Wed,  2 Jul 2025 19:21:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4F951188A5CB
	for <lists+linux-media@lfdr.de>; Wed,  2 Jul 2025 17:21:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED325303DD7;
	Wed,  2 Jul 2025 17:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ne3wbLSp"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0F4B301130;
	Wed,  2 Jul 2025 17:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751476847; cv=none; b=Ny9IDzOfWXzTxQmMjs5HLaMni5vIH6yE6A89HzpQpWalOEKg0gBMF4yDOXwT4kAmceTuhwxlYgPlaIdJySUeKsLqF63i+UOQ7HPlMKu4OdWR43OPfa3/BFXYwkbnSmw2G7kPyoBFgeuQSIbEZbcQzQ0aN/lZDEFNcjSqT7jHVvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751476847; c=relaxed/simple;
	bh=+54uhqLwJcHQwTHHQMidXNth1tuspznqeURDP+ZUXg8=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=YQzN6EZhEk8fe2V1V2f3tsf+C0DOoKFtB4lpxHzisLRGS13Zi1I37lpC+htIRDtvRc8N42x7QisOV5+puz2hLiyQgl9zr5yVYnzkTTh3s1hvacXv/LiRiZQ5pGvinfLhPTGosS3h8DRyJWdK5qww10uQMLROue6YEOrdXGaLvoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ne3wbLSp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 562Da69V032129;
	Wed, 2 Jul 2025 17:20:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EXDpNIn/bppQCuAzGEeFfZyrQ2cEw5aYYhoByhgfN78=; b=ne3wbLSpy3ijsL4t
	XKBopICfM131NRKz3w164XjKzbxiCdUCmyiKbR6wCtbD1XPWiSIVF+9t0bX7LQel
	KMjxFgfsztSL0LzpO9rZeInwke3ilLLz5FXOtiw10r9VJ5R8Uaz4TJfK35RstDsi
	ShIjg6YhK1GQRvNoKSUN0zgArfXSfh6ECAS7wMEICjehxH5kfNSme28BLAvmw0Cs
	16NKTopJdxEbm9mlxJ2RPJ9nOeL3kisccTw0C8Hm3doLl0ljgzZl5sNEzsZ28rhz
	e8EDztrMPSzr7b/H7lg75lcIzmN+F9PoKtKG43wlLiCJKiD+lqhxZSwzEVw+ziyz
	ZUOlww==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j63kdmmr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Jul 2025 17:20:39 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 562HKdlH025303
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 2 Jul 2025 17:20:39 GMT
Received: from [10.50.58.161] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 2 Jul 2025
 10:20:36 -0700
Message-ID: <7ee61b56-4c93-f6e2-d405-9f88f69af675@quicinc.com>
Date: Wed, 2 Jul 2025 22:50:22 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] media: iris: Be explicit in naming of VPU2 power off
 handlers
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Dikshita Agarwal
	<quic_dikshita@quicinc.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        "Bryan
 O'Donoghue" <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250702134227.211104-2-krzysztof.kozlowski@linaro.org>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <20250702134227.211104-2-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=ZKfXmW7b c=1 sm=1 tr=0 ts=68656a67 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=KKAkSRfTAAAA:8
 a=sF5NrI78e988phRYh04A:9 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDE0MyBTYWx0ZWRfXycOIxpcOXCFr
 yX6CTMo8jXmaPwP/J4U/sBgISMQevmhqg4N+yaqxtI3tO9NPHp3A1OgKv3scSKQIorGrxfexQzi
 H9HZE0iNdN94Yq9IsSCsO0SkS+ty1uScxtnb/YEZzWbxB/iKt+5rRgCvlPJ8BUKDS/5jufHxMVv
 CUmyNNLzMiWvGYWn6Rtup/NqPqp5R0IBoEvjxrHDrJjOiYey7oJ4ltL7UJ85An3Lz6DaQmo5kwH
 tWY/MlXhQO9Z3FyJm9YLn28hskK1z/P8CeXCSoXMZOCqZgHd5B2Lo4Y5vXX0Q1632quAHMro9Pi
 E7jgZzbzksJrnEnKNde/0okxp0EQVQrctVYMJwNQXZ6oXd3RrrSvxRTZBy1uSQ8OdsMdgaVTbkS
 shcfr5PWXAB+ckLCv5ZbrrgulmqtuBRM6oLNTYJU+e1S3csGWAwLiSFE9tTWhyzR7INxcZH3
X-Proofpoint-ORIG-GUID: KzXHRB-WDLJd4dFPmDIjBTWHLLa4mEtn
X-Proofpoint-GUID: KzXHRB-WDLJd4dFPmDIjBTWHLLa4mEtn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-02_02,2025-07-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 mlxlogscore=999 spamscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507020143


On 7/2/2025 7:12 PM, Krzysztof Kozlowski wrote:
> Driver implements different callbacks for power off hardware
> (.power_off_hw) and power off controller (.power_off_controller):
> 
>  - iris_vpu_power_off_hw + iris_vpu_power_off_controller,
>  - iris_vpu3_power_off_hardware,
>  - iris_vpu33_power_off_hardware + iris_vpu33_power_off_controller,
> 
> The first group (iris_vpu_power_off_hw() and
> iris_vpu_power_off_controller()) is used on older VPU2 designs but also
> called from newer ones: iris_vpu3_power_off_hardware() calls
> iris_vpu_power_off_controller().
> 
> In the same time there is wrapper iris_vpu_power_off() which calls
> respective callbacks (the VPU2, VPU3 etc).
> 
> Let's make it more obvious which function is a generic wrapper over
> specific VPU/platform callbacks (iris_vpu_power_off()) and which one is
> the callback by adding "2" to callbacks used on VPU2.  No functional
> changes.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/media/platform/qcom/iris/iris_vpu2.c       | 4 ++--
>  drivers/media/platform/qcom/iris/iris_vpu3x.c      | 6 +++---
>  drivers/media/platform/qcom/iris/iris_vpu_common.c | 4 ++--
>  drivers/media/platform/qcom/iris/iris_vpu_common.h | 4 ++--
>  4 files changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu2.c b/drivers/media/platform/qcom/iris/iris_vpu2.c
> index 7cf1bfc352d3..2570e65816f6 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu2.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu2.c
> @@ -33,7 +33,7 @@ static u64 iris_vpu2_calc_freq(struct iris_inst *inst, size_t data_size)
>  }
>  
>  const struct vpu_ops iris_vpu2_ops = {
> -	.power_off_hw = iris_vpu_power_off_hw,
> -	.power_off_controller = iris_vpu_power_off_controller,
> +	.power_off_hw = iris_vpu2_power_off_hw,
> +	.power_off_controller = iris_vpu2_power_off_controller,
There was a reason to name it as VPU* independent, as it can be used for
multiple VPUs. There isn't any VPU specific code within iris_vpu_power_off_hw
that it needs to be associated to any VPU.

>  	.calc_freq = iris_vpu2_calc_freq,
>  };
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu3x.c b/drivers/media/platform/qcom/iris/iris_vpu3x.c
> index 9b7c9a1495ee..a2c8a1650153 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu3x.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu3x.c
> @@ -104,7 +104,7 @@ static void iris_vpu3_power_off_hardware(struct iris_core *core)
>  	writel(0x0, core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
>  
>  disable_power:
> -	iris_vpu_power_off_hw(core);
> +	iris_vpu2_power_off_hw(core);
Again, its like VPU3 does something specific and then reuses the common handling.

I do not see a point in making this change.

Regards,
Vikash
>  }
>  
>  static void iris_vpu33_power_off_hardware(struct iris_core *core)
> @@ -142,7 +142,7 @@ static void iris_vpu33_power_off_hardware(struct iris_core *core)
>  	writel(0x0, core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
>  
>  disable_power:
> -	iris_vpu_power_off_hw(core);
> +	iris_vpu2_power_off_hw(core);
>  }
>  
>  static int iris_vpu33_power_off_controller(struct iris_core *core)
> @@ -264,7 +264,7 @@ static u64 iris_vpu3x_calculate_frequency(struct iris_inst *inst, size_t data_si
>  
>  const struct vpu_ops iris_vpu3_ops = {
>  	.power_off_hw = iris_vpu3_power_off_hardware,
> -	.power_off_controller = iris_vpu_power_off_controller,
> +	.power_off_controller = iris_vpu2_power_off_controller,
>  	.calc_freq = iris_vpu3x_calculate_frequency,
>  };
>  
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
> index 42a7c53ce48e..22f190e0c7c6 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
> @@ -211,7 +211,7 @@ int iris_vpu_prepare_pc(struct iris_core *core)
>  	return -EAGAIN;
>  }
>  
> -int iris_vpu_power_off_controller(struct iris_core *core)
> +int iris_vpu2_power_off_controller(struct iris_core *core)
>  {
>  	u32 val = 0;
>  	int ret;
> @@ -253,7 +253,7 @@ int iris_vpu_power_off_controller(struct iris_core *core)
>  	return 0;
>  }
>  
> -void iris_vpu_power_off_hw(struct iris_core *core)
> +void iris_vpu2_power_off_hw(struct iris_core *core)
>  {
>  	dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN], false);
>  	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.h b/drivers/media/platform/qcom/iris/iris_vpu_common.h
> index 93b7fa27be3b..8f63f243dd0d 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_common.h
> @@ -24,8 +24,8 @@ void iris_vpu_clear_interrupt(struct iris_core *core);
>  int iris_vpu_watchdog(struct iris_core *core, u32 intr_status);
>  int iris_vpu_prepare_pc(struct iris_core *core);
>  int iris_vpu_power_on(struct iris_core *core);
> -int iris_vpu_power_off_controller(struct iris_core *core);
> -void iris_vpu_power_off_hw(struct iris_core *core);
> +int iris_vpu2_power_off_controller(struct iris_core *core);
> +void iris_vpu2_power_off_hw(struct iris_core *core);
>  void iris_vpu_power_off(struct iris_core *core);
>  
>  #endif

