Return-Path: <linux-media+bounces-31126-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BC7BEA9E3A0
	for <lists+linux-media@lfdr.de>; Sun, 27 Apr 2025 16:49:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1C48A1701EC
	for <lists+linux-media@lfdr.de>; Sun, 27 Apr 2025 14:49:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AF121B3937;
	Sun, 27 Apr 2025 14:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="P6w/79a0"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38DCF256D;
	Sun, 27 Apr 2025 14:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745765357; cv=none; b=VU32vICBOIHv5RsnrrzvZHnzYRUYKUhWY2EckkpaxVSyrS/67+ijruVf8n7iUNcGAP0tommJuHnLNWXQedPtJx+dyUSPgKqR4jXR6Un+19NUg0GY6Zz9CO2oCgWYcB1oG5T9VlfqQ6sCNHJ3akqIq/SXqGTRrYNylj970fCuKjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745765357; c=relaxed/simple;
	bh=0a42uMHCJ6tn6btSKVR6Lqwkol5igzhpYqwX4QopxA0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=UubUFqqf5nTGWbDoF6yOOmC1bDGVUNzwBaBw2LqpJGgqpJ+hz7Uqn420X3/ewbtX0Am0LkcU8+vuhsukWS0rhk2M1ozaZob6Ho243jAsMJaAmpYte/ei9NIno+oOUAyw+OY/OQXeDDb9lTHyMOhRE2aZEgI+N9Xnr2Dw2dmAPXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=P6w/79a0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53QMdEZ8018043;
	Sun, 27 Apr 2025 14:49:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rAfxxbLFTHijIeHRc6MHPm6CxODoOnFMVCXXJq5grxM=; b=P6w/79a076a4qOqb
	CGgwW0cRH5TKww8JT7f66OF053CDIroMEOePUQ0j/lZXT998SgtuZhf23AR6PekW
	YF/kJ/AZz1tw609z8IJ1kB+abmq/TTvG9wyV391F1a1n4ukOWnDg6TcyiQ+5Xs4Y
	N9CmqjfBSvwIBYGQnmQFX1VjwXjm75Q4ZCeWv0jiyEF6knSsfaPudpW9a4G4fXxm
	Ma5cDPa1WUF/QJbjqGB6B3nG38xPw85QB6npvZOGAnFJjf9KLjGximR8LxTZpalg
	XEPj8wQX66cc9tXUxdNsiZ+cK49b0eL1z3LutZlP04lutbfR6SK7r+Y+1xZ8I5Vv
	aue5kw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468qq5c4wy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 27 Apr 2025 14:49:12 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53REnBCt008055
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 27 Apr 2025 14:49:11 GMT
Received: from [10.50.44.234] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 27 Apr
 2025 07:49:06 -0700
Message-ID: <3427ceb9-7f95-729a-48f8-5837d5bad8fe@quicinc.com>
Date: Sun, 27 Apr 2025 20:19:02 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v5 2/5] media: iris: fix the order of compat strings
Content-Language: en-US
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250424-qcs8300_iris-v5-0-f118f505c300@quicinc.com>
 <20250424-qcs8300_iris-v5-2-f118f505c300@quicinc.com>
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
In-Reply-To: <20250424-qcs8300_iris-v5-2-f118f505c300@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: G4pbjCk6Wzgjjsm2yvs4SnInsUREZjS6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI3MDEyMiBTYWx0ZWRfX8mhre1YF4jIo FJ9HINvv28yfXa/xi1kLTa0F4ucqQ8MNNz0AfxSmCdnuYhVzh3E2DW+xaAYrIK9wXJcCaTuqsgu JAH49phNwvTE2hNLEUjRz0vqPfsdTNcWemxyiIRb7E9U1Am//9o41k/xEubM5NkPohjUZEap3eE
 G8H/GrGr63Pq0rEsuzFwlwGwrHoRg9ZPxqhwY83blyZ2yJSdhjg0GLc/wlM8BuRIspILrHy4Ww5 nMWw4QZmxtp9nlXjO75eh8mWez6eI9HxNy9VyWzjNyWgZicmkjVziO2F8wmpDnDLyKQ58snEmrY 1Rc/S+jbLDr8O4dIAPaHwSaXoc/kSpFtIOG7bUARKZ8NpBMbk6Z3R5FYiKoGYxI8uvgyvDDkbt1
 6yG9q4a9ji72DRLw6Ctxa+ivicSYYtqjERtIDMLChrCE33xP9+sEkkr2f/odsaOuWQoDW3oP
X-Authority-Analysis: v=2.4 cv=QP1oRhLL c=1 sm=1 tr=0 ts=680e43e8 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=P3qF7pMSZMhhegKZg4MA:9
 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: G4pbjCk6Wzgjjsm2yvs4SnInsUREZjS6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-27_05,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 clxscore=1015 mlxlogscore=999 lowpriorityscore=0 adultscore=0 mlxscore=0
 bulkscore=0 phishscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504270122



On 4/24/2025 2:20 PM, Vikash Garodia wrote:
> Fix the order of compatible strings to make it in alpha numeric order.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
> ---
>  drivers/media/platform/qcom/iris/iris_probe.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
> index 7cd8650fbe9c09598670530103e3d5edf32953e7..fa3b9c9b1493e4165f8c6d9c1cc0b76d3dfa9b7b 100644
> --- a/drivers/media/platform/qcom/iris/iris_probe.c
> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
> @@ -335,16 +335,16 @@ static const struct dev_pm_ops iris_pm_ops = {
>  };
>  
>  static const struct of_device_id iris_dt_match[] = {
> +#if (!IS_ENABLED(CONFIG_VIDEO_QCOM_VENUS))
> +	{
> +		.compatible = "qcom,sm8250-venus",
> +		.data = &sm8250_data,
> +	},
> +#endif
>  	{
>  		.compatible = "qcom,sm8550-iris",
>  		.data = &sm8550_data,
>  	},
> -#if (!IS_ENABLED(CONFIG_VIDEO_QCOM_VENUS))
> -		{
> -			.compatible = "qcom,sm8250-venus",
> -			.data = &sm8250_data,
> -		},
> -#endif
>  	{
>  		.compatible = "qcom,sm8650-iris",
>  		.data = &sm8650_data,
> 
Reviewed-by: Dikshita Agarwal <quic_dikshita@quicinc.com>

