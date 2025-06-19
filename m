Return-Path: <linux-media+bounces-35425-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 714C6AE0CCF
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 20:25:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6AB086A3693
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 18:22:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F0F3298258;
	Thu, 19 Jun 2025 18:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="KFbfZ7nc"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCA692417FA;
	Thu, 19 Jun 2025 18:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750356887; cv=none; b=eDno2FGvF1atzuYC0l/Jf8XjjwKsfL5zdDuweblcGZxIHN9e0deYA/7gfYiyDG1rXTeJ4t3d1VyLxAn3NmVU13X5QCUdQ2SDdu2I4LP/yC0cQOmSrsffu9802KkqokGGDg3F4a/ZzY39Jsy+f7IHJdn94aS1l286q3IMuGEs3r4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750356887; c=relaxed/simple;
	bh=eSZoNChqYhwyIiNX+oCll1bQsN3J9sIjRESSxfn8Dvc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=d63o+kSdTuKQ81yLixYuFqxyAeumxYLPJZARiHlvOtLG68+Y+ew9Kwxjy6jtZtLRbAenZzVvv4iRz0EShgx282w6y9kY+pCXnfIuSWI/HwSbV40w6TIpSpa+ygCg+Hw9pxW2bU7PR1io6g490iYjCg0XoOTCW2rb3BOMEjsouFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=KFbfZ7nc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55JCLFKd007075;
	Thu, 19 Jun 2025 18:14:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jWcAAg6TI5glqZYBhjErZuQLZCjvDtjxdpBIQgV87Ps=; b=KFbfZ7ncus2vS9ZD
	+Say/FwWQltNrza1doksaggcTByHY72ZsFsjuA47Ks4/EkZZ6lWPU7jy1eIg+SG9
	zok5dCsVSukrD7sHvDpXl85KpcIHM9Sw5pJcoJvIzDimYQMEhHqEXpePIF6qUbqn
	RnMS6Tqn3lBNLmvkCnU9AJWVvhADrawdplEBDKyCU3keNmQ1B/F/vffp9BaLaQvy
	WIGnQr20Nto5+4aRpOhW841jZaGlKI0Vn+RW6LXaMT1hn5GZgPREvq5bQzOpi/ND
	2POcFQFjiwc6A0euT/fZUsYUaG6gWAL8tO4Pv3xoQGNF1kp8wG1QI6hFIuhBlQDa
	CUlJqQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47c0rvm1eq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Jun 2025 18:14:37 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55JIEagt005117
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Jun 2025 18:14:36 GMT
Received: from [10.50.57.163] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 19 Jun
 2025 11:14:32 -0700
Message-ID: <3035fc55-f422-d0d7-8889-48530dd0748e@quicinc.com>
Date: Thu, 19 Jun 2025 23:44:29 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCHv3] media: venus: protect against spurious interrupts
 during probe
Content-Language: en-US
To: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        <quic_vgarodia@quicinc.com>, <bryan.odonoghue@linaro.org>,
        <mchehab@kernel.org>
CC: <hans.verkuil@cisco.com>, <stanimir.varbanov@linaro.org>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250606152522.4123158-1-jorge.ramirez@oss.qualcomm.com>
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
In-Reply-To: <20250606152522.4123158-1-jorge.ramirez@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE5MDE0OSBTYWx0ZWRfX451ua99n7W6O
 TpWL71lLZXfjBExJL5TkMjuZF0ytjJwbczY2/9PSSIFAkyrSW89NUc25NOQVzoELqqhpWlSWUTB
 AQnRO7j+7iL6OG3ciie+x4nYeUSBenNXjnelY58JiY8SUECbQXHjI1eZuqf2f+L8t3Hb3nafxyF
 QofPqIx4DA16HbISfTBDLCxHSByDddEKGRFvcxGXoIFbOhUieT/pWeXKdfOWAR4vaYjb0CSMj//
 kno+aKvjp5hwD0bFAQBRDbRGzk4jnjeEsGEaddokMGuL2tnebIs6M3zjap6uUGpRAhK9WscmAP3
 c/s/KmPPBwHe0gINQwVzLa2Ay5rPWP1DoKIQyBfRZGvGnW4W5YwiKWV9XqgPWK0kBIycXbaFhbJ
 TCALZVToARpH2IIiQJwQ9W/B0pmU8/6UZT4kjymtqFR5R0j8AYwhDEmW38bHL/c0T8JswA8U
X-Proofpoint-GUID: at_Re-Tbgl27_bHyWfveBRPoGwPVud-y
X-Authority-Analysis: v=2.4 cv=btJMBFai c=1 sm=1 tr=0 ts=6854538d cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=Ez5CtaCykSblQmOPNncA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: at_Re-Tbgl27_bHyWfveBRPoGwPVud-y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-19_06,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 mlxscore=0
 suspectscore=0 clxscore=1015 malwarescore=0 spamscore=0 mlxlogscore=854
 bulkscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506190149



On 6/6/2025 8:55 PM, Jorge Ramirez-Ortiz wrote:
> Make sure the interrupt handler is initialized before the interrupt is
> registered.
> 
> If the IRQ is registered before hfi_create(), it's possible that an
> interrupt fires before the handler setup is complete, leading to a NULL
> dereference.
> 
> This error condition has been observed during system boot on Rb3Gen2.
> 
> Fixes: af2c3834c8ca ("[media] media: venus: adding core part and helper functions")
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> ---
>  v3:
>     Added Fixes tag
>  v2:
>     Fix authorship
>     Fix spelling mistake
>  
>  drivers/media/platform/qcom/venus/core.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
> index d305d74bb152..5bd99d0aafe4 100644
> --- a/drivers/media/platform/qcom/venus/core.c
> +++ b/drivers/media/platform/qcom/venus/core.c
> @@ -424,13 +424,13 @@ static int venus_probe(struct platform_device *pdev)
>  	INIT_DELAYED_WORK(&core->work, venus_sys_error_handler);
>  	init_waitqueue_head(&core->sys_err_done);
>  
> -	ret = devm_request_threaded_irq(dev, core->irq, hfi_isr, venus_isr_thread,
> -					IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
> -					"venus", core);
> +	ret = hfi_create(core, &venus_core_ops);
>  	if (ret)
>  		goto err_core_put;
>  
> -	ret = hfi_create(core, &venus_core_ops);
> +	ret = devm_request_threaded_irq(dev, core->irq, hfi_isr, venus_isr_thread,
> +					IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
> +					"venus", core);
>  	if (ret)
>  		goto err_core_put;
>  
Reviewed-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
Tested-by: Dikshita Agarwal <quic_dikshita@quicinc.com> # RB5

