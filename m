Return-Path: <linux-media+bounces-39115-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FB3BB1E65A
	for <lists+linux-media@lfdr.de>; Fri,  8 Aug 2025 12:17:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 61DC116D1ED
	for <lists+linux-media@lfdr.de>; Fri,  8 Aug 2025 10:17:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 102A82741AC;
	Fri,  8 Aug 2025 10:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="fZ99G8Rw"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06EC51C84BD;
	Fri,  8 Aug 2025 10:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754648227; cv=none; b=lmDiZr8f3yVUIm8N73pxuk6PW05lUkH1peJxOnYzea1gI6wry/CmipYdQlN+YmzswEfxJ2XCZgEVfCkmvSZtmS3RyHUOAQgBBEyibX1QFX5/UE61VN8SHN0tmCybdkXdzrft0A8tewB/Miu3yx5OhMrhf55AoV9GPM4WnuckQRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754648227; c=relaxed/simple;
	bh=pBtlx30DlGGiT0qekfjLzgoaDxlODacYEiku5RDNi1c=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=q89MXvOJWhYDe5rpHAEpmXYXi/e8tnAMvZfQhiEY+MHxk8aqT8XP/dzV7WzW0AR+m2tYqzFHuLSFdmT4KZTya1aYxGQpbhqfGmS4wG/Cv0Z/0TgN+LZdIQGZ9b8xVvU4tYqQ8JHj7n/p7XGTD80xzJI6/N7CvdHBpe12F2Wr1as=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=fZ99G8Rw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5789b9jC003725;
	Fri, 8 Aug 2025 10:17:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	31nZnBnGsMQuwKRZIs+cCWVpTz3692lXfa4ND3VWwjQ=; b=fZ99G8RwToK+EObK
	pIbRHCZRiY1i1funmKeIk1UXRgoPyUuANF8dcZPMk65mjepfkhb4+uirovJ1Wi1a
	3rz7Qu36IOLvlBiNyibiy2Vk2CJMvmPJJDfUOMwqsT/6v+QpFhZ7yOicYKX8sQo4
	KC0nnInjtjzwJblKQQKrgV5fAseBLgDZR9UD8m4cBxM8YnjJXcvxFVJKcA1aV8b2
	zUXS7nFGA2uHALNjxw/tZ/V6URJc23zKOVeqBEusISeCWt3E74e5Stj0DqKg/C/G
	eGcu8F97q5C8xAcgnUBpXQTbjF+msGHMUD980e6TyL0Sr+5145x+tJ2D4sQqZ3/L
	/mYnBA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpybhtwy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 08 Aug 2025 10:17:02 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 578AH1RK015151
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 8 Aug 2025 10:17:01 GMT
Received: from [10.50.49.153] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Fri, 8 Aug
 2025 03:16:57 -0700
Message-ID: <9f45d585-dce7-a85f-88a9-ae5be770f0b9@quicinc.com>
Date: Fri, 8 Aug 2025 15:46:53 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v9 5/8] media: venus: core: Sort dt_match alphabetically.
Content-Language: en-US
To: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        <quic_vgarodia@quicinc.com>, <bryan.odonoghue@linaro.org>,
        <krzk+dt@kernel.org>, <konradybcio@kernel.org>,
        <dmitry.baryshkov@oss.qualcomm.com>, <mchehab@kernel.org>,
        <robh@kernel.org>, <andersson@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250808085300.1403570-1-jorge.ramirez@oss.qualcomm.com>
 <20250808085300.1403570-6-jorge.ramirez@oss.qualcomm.com>
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
In-Reply-To: <20250808085300.1403570-6-jorge.ramirez@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOSBTYWx0ZWRfX8qofJIihRSL8
 t2f9frVeACuBOFmaDTwJ5WS8sSvb6DthYzmp1772VV0A3BStG+mzZIz8vdh5RFWdaApIyjMVKWz
 h86d7r9GmrLPrhDmWAvil4RH/AdNNHJlOg2P5VOGjcqTxlvYCHu2PWuMSku8AjUFqFHHuRdvGku
 982jgbz3d3a7mtQ+VAuDs0QA0UGrubOnbtIdZmlfV+W4U3SOWfId+Zo9yp3GLSIIwExdSoRe3uZ
 t9Xoizz8v2HUiDuN1NrA9G3USUuzC6IMpbdX9fH6JI77/3R74sk6LcFl6vQEthmmW2ChKqfQ0e3
 j4RC1ypobB4NOtCuWBq3L6ERsl6Wpvem6XSrHLXcyHE3Vmgvg5j5Ghedea2BPSX4STIhthTjNo6
 QdqB/h7Y
X-Proofpoint-GUID: Sl4XkiCHBFh7bQ0O6R991-hCTbeUPq-7
X-Authority-Analysis: v=2.4 cv=EavIQOmC c=1 sm=1 tr=0 ts=6895ce9e cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8
 a=-6-pJR-52uRdxqPPKNUA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: Sl4XkiCHBFh7bQ0O6R991-hCTbeUPq-7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-08_03,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 adultscore=0 bulkscore=0
 phishscore=0 spamscore=0 suspectscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508060009



On 8/8/2025 2:22 PM, Jorge Ramirez-Ortiz wrote:
> From: Jorge Ramirez-Ortiz <jorge@foundries.io>
> 
> Correctly sort the array of venus_dt_match entries.
> 
> Signed-off-by: Jorge Ramirez-Ortiz <jorge@foundries.io>
> ---
>  drivers/media/platform/qcom/venus/core.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
> index adc38fbc9d79..9604a7eed49d 100644
> --- a/drivers/media/platform/qcom/venus/core.c
> +++ b/drivers/media/platform/qcom/venus/core.c
> @@ -1074,11 +1074,11 @@ static const struct of_device_id venus_dt_match[] = {
>  	{ .compatible = "qcom,msm8916-venus", .data = &msm8916_res, },
>  	{ .compatible = "qcom,msm8996-venus", .data = &msm8996_res, },
>  	{ .compatible = "qcom,msm8998-venus", .data = &msm8998_res, },
> +	{ .compatible = "qcom,sc7180-venus", .data = &sc7180_res, },
> +	{ .compatible = "qcom,sc7280-venus", .data = &sc7280_res, },
>  	{ .compatible = "qcom,sdm660-venus", .data = &sdm660_res, },
>  	{ .compatible = "qcom,sdm845-venus", .data = &sdm845_res, },
>  	{ .compatible = "qcom,sdm845-venus-v2", .data = &sdm845_res_v2, },
> -	{ .compatible = "qcom,sc7180-venus", .data = &sc7180_res, },
> -	{ .compatible = "qcom,sc7280-venus", .data = &sc7280_res, },
>  	{ .compatible = "qcom,sm8250-venus", .data = &sm8250_res, },
>  	{ }
>  };

Reviewed-by: Dikshita Agarwal <quic_dikshita@quicinc.com>

Thanks,
Dikshita

