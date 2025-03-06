Return-Path: <linux-media+bounces-27709-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A7D0A54B7A
	for <lists+linux-media@lfdr.de>; Thu,  6 Mar 2025 14:06:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8572F1897110
	for <lists+linux-media@lfdr.de>; Thu,  6 Mar 2025 13:06:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEF4120B803;
	Thu,  6 Mar 2025 13:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="CxONpEki"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A861ABA4A;
	Thu,  6 Mar 2025 13:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741266396; cv=none; b=R0ywHulMKPOeggF5a6ba6uODXiiRdc/EU4vxzpc6GUybQyFVK/rI5hp58YyjziJ86q1ClwgM2I8DdcESXSWLnvDTG0pMfBytpLK8m8HOATtLhbQeB2JUAMrDIXn8Lv2xi4IhAC+ElzbGHeBL4U15/RxUXlS//Ljm9KA40vxh+e0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741266396; c=relaxed/simple;
	bh=05kq1eMRvaIhtmWE9GJD+02vqHqhOZBZs/TrbJGcbw0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=mx7VeOJm0w9MaVCdD74vHuT5mh2X0ZLsLmSstFh1UDxVQCV4rH5W8P2rLhO6Lo33z0rNHPlw2Z+z54u24MT/GvffK4yWbhFuemhSmJhyFaBi2yp3w3IlaZV8yXLmN8+MN712GDUsiJ9MCi28jn2pETWLMRYSEbr43hUROwhFpxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=CxONpEki; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 526B3uwg032638;
	Thu, 6 Mar 2025 13:06:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VxXHb35LOULh4A8sx39KXPuXzXo35wD2M/2ohB05WGA=; b=CxONpEkialky4d8V
	NGt5rIq0csN18x7ES1HQn5kFH6stph3ZeVWmxI2zos0+TST12MxrpBGFtc9x3Xze
	URKVoiQUmA/gsKbhG/dsK6q5wU3YoIH3rRi33vBUO1tVXhMcBl81e6LO3bcZDR2d
	EzDiJdvxNu7OWZDJNqwBlOBAJl+QCMMbVh5C8lcYOE/OuByYSv/FVQYdYh3evLru
	8jqQp6A9jwCPWXPDhb+NzLuEo2swIeGmusZdqJCEn5S58hGXGS4QQLxbGim2LCvh
	NVRdKXNl3o+xf9HDF7dgOvro9CuQd+ug9FzzUBFh8rx+wTYHSazkyUA7ut3zYCb/
	eZlHEA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 457aghgcsn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Mar 2025 13:06:27 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 526D6QPx006242
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 6 Mar 2025 13:06:26 GMT
Received: from [10.50.63.230] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 6 Mar 2025
 05:06:22 -0800
Message-ID: <24fd8e60-e782-0625-7d90-513cd2a3ea19@quicinc.com>
Date: Thu, 6 Mar 2025 18:36:19 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 2/7] media: platform: qcom/iris: split
 iris_vpu_power_off_controller in multiple steps
Content-Language: en-US
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Vikash Garodia
	<quic_vgarodia@quicinc.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        "Mauro Carvalho Chehab" <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250305-topic-sm8x50-iris-v10-v2-0-bd65a3fc099e@linaro.org>
 <20250305-topic-sm8x50-iris-v10-v2-2-bd65a3fc099e@linaro.org>
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
In-Reply-To: <20250305-topic-sm8x50-iris-v10-v2-2-bd65a3fc099e@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: sYGI7ZhgtJNcwIwf1YmsDMKAug8apeQg
X-Authority-Analysis: v=2.4 cv=R5D5GcRX c=1 sm=1 tr=0 ts=67c99dd3 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=KKAkSRfTAAAA:8 a=RtGA_KCwJ5yuunl6b9IA:9 a=QEXdDO2ut3YA:10
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: sYGI7ZhgtJNcwIwf1YmsDMKAug8apeQg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-06_05,2025-03-06_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 suspectscore=0 phishscore=0 mlxscore=0 priorityscore=1501 clxscore=1015
 spamscore=0 mlxlogscore=999 malwarescore=0 bulkscore=0 lowpriorityscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503060099



On 3/6/2025 12:35 AM, Neil Armstrong wrote:
> In order to support vpu33, the iris_vpu_power_off_controller needs to be
> reused and extended, but the AON_WRAPPER_MVP_NOC_LPI_CONTROL cannot be
> set from the power_off_controller sequence like vpu2 and vpu3 so
> split the power_off_controller into 3 steps:
> - iris_vpu_power_off_controller_begin
> - iris_vpu_power_off_controller_end
> - iris_vpu_power_off_controller_disable
> 
NAK.
I don't think splitting the API into these small functions is beneficial in
this case, The extracted parts are too trivial to justify separate
functions, and this actually makes the flow harder to follow rather than
improving re-usability or clarity.
If there is no clear or significant re-use case, I'd prefer keeping the
logic consolidated in single API to maintain readability.

Thanks,
Dikshita
> And use them in a common iris_vpu_power_off_controller() for
> vpu2 and vpu3 based platforms.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  drivers/media/platform/qcom/iris/iris_vpu_common.c | 46 ++++++++++++++++------
>  1 file changed, 33 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
> index fe9896d66848cdcd8c67bd45bbf3b6ce4a01ab10..d6ce92f3c7544e44dccca26bf6a4c95a720f9229 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
> @@ -211,33 +211,29 @@ int iris_vpu_prepare_pc(struct iris_core *core)
>  	return -EAGAIN;
>  }
>  
> -static int iris_vpu_power_off_controller(struct iris_core *core)
> +static void iris_vpu_power_off_controller_begin(struct iris_core *core)
>  {
> -	u32 val = 0;
> -	int ret;
> -
>  	writel(MSK_SIGNAL_FROM_TENSILICA | MSK_CORE_POWER_ON, core->reg_base + CPU_CS_X2RPMH);
> +}
>  
> -	writel(REQ_POWER_DOWN_PREP, core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
> -
> -	ret = readl_poll_timeout(core->reg_base + AON_WRAPPER_MVP_NOC_LPI_STATUS,
> -				 val, val & BIT(0), 200, 2000);
> -	if (ret)
> -		goto disable_power;
> +static int iris_vpu_power_off_controller_end(struct iris_core *core)
> +{
> +	u32 val = 0;
> +	int ret;
>  
>  	writel(REQ_POWER_DOWN_PREP, core->reg_base + WRAPPER_IRIS_CPU_NOC_LPI_CONTROL);
>  
>  	ret = readl_poll_timeout(core->reg_base + WRAPPER_IRIS_CPU_NOC_LPI_STATUS,
>  				 val, val & BIT(0), 200, 2000);
>  	if (ret)
> -		goto disable_power;
> +		return ret;
>  
>  	writel(0x0, core->reg_base + WRAPPER_DEBUG_BRIDGE_LPI_CONTROL);
>  
>  	ret = readl_poll_timeout(core->reg_base + WRAPPER_DEBUG_BRIDGE_LPI_STATUS,
>  				 val, val == 0, 200, 2000);
>  	if (ret)
> -		goto disable_power;
> +		return ret;
>  
>  	writel(CTL_AXI_CLK_HALT | CTL_CLK_HALT,
>  	       core->reg_base + WRAPPER_TZ_CTL_AXI_CLOCK_CONFIG);
> @@ -245,10 +241,34 @@ static int iris_vpu_power_off_controller(struct iris_core *core)
>  	writel(0x0, core->reg_base + WRAPPER_TZ_QNS4PDXFIFO_RESET);
>  	writel(0x0, core->reg_base + WRAPPER_TZ_CTL_AXI_CLOCK_CONFIG);
>  
> -disable_power:
> +	return 0;
> +}
> +
> +static void iris_vpu_power_off_controller_disable(struct iris_core *core)
> +{
>  	iris_disable_unprepare_clock(core, IRIS_CTRL_CLK);
>  	iris_disable_unprepare_clock(core, IRIS_AXI_CLK);
>  	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
> +}
> +
> +static int iris_vpu_power_off_controller(struct iris_core *core)
> +{
> +	u32 val = 0;
> +	int ret;
> +
> +	iris_vpu_power_off_controller_begin(core);
> +
> +	writel(REQ_POWER_DOWN_PREP, core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
> +
> +	ret = readl_poll_timeout(core->reg_base + AON_WRAPPER_MVP_NOC_LPI_STATUS,
> +				 val, val & BIT(0), 200, 2000);
> +	if (ret)
> +		goto disable_power;
> +
> +	iris_vpu_power_off_controller_end(core);
> +
> +disable_power:
> +	iris_vpu_power_off_controller_disable(core);
>  
>  	return 0;
>  }
> 

