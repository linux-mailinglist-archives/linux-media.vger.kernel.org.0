Return-Path: <linux-media+bounces-27229-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C843A49913
	for <lists+linux-media@lfdr.de>; Fri, 28 Feb 2025 13:21:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 571683AE575
	for <lists+linux-media@lfdr.de>; Fri, 28 Feb 2025 12:21:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B99BC26AAB3;
	Fri, 28 Feb 2025 12:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="KQ11s5eK"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEEF91C5496;
	Fri, 28 Feb 2025 12:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740745299; cv=none; b=ctXJ5KQ/MScxzNCedKwrizfD4FvWcGbYhKqSQzcW/gtsOmCyvklWKICMrqaxPgOKm05R7eqO7mTDxIdfwfGXm7wx640edFkO/LdOc9zcCgKNwlmFKVpBvVz3tg1U1011Sf7mAtW+2jZUvIV4RA0DBvyIba33m/agqFeo1IU5B98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740745299; c=relaxed/simple;
	bh=1RHJBZDUXUBHP6vghQwxWM/sTBLxUHPQEENb08kH4dg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=uL1aEz3hMdVKXVewhkU7hE1ZId7J/w2gsXU3tJdW3mFkWLvxk96Mz63BcyXzOx4w+xFGZxO2mldWf5T+4w9LFqx6aiznPJDvticpxdjAZk/S8TbBvWK7tFXeLCz7S1E4Bq6WZ9dXDQxj6fmCpLQcFhYXaEH1qkpauaWT2V13XnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=KQ11s5eK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51SAX5uq019994;
	Fri, 28 Feb 2025 12:21:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1o1floG5tGSMr5ewIwV/3Fh48FgSUhrdTDL/EgcEvvc=; b=KQ11s5eK90l80CDI
	72tF5GtIYUQXzHig3AXEVXFI4VTo7ndB++ae1UaMnOrGI6Nko0wyWGG9kwDD1mFK
	84YvpqO44H/hCkcRVtE/dA+fluNr/SM43LEc5IMzTfjQbIaULj0djdkDhqV5NG+E
	HndI9qQ59KCoCiDhxOULv/L51zSTJ0WkwEOio5/Sayr48/Wcny5INI4vEizMZq82
	JneHePm5HSExZ2bnwev7xoDpNSE1ATBRsrHKwixp7SD88de8eISdw2Sdq04SbmmG
	4uXCDDSR98bSkPJMqlLl6gyXQppfmFSWtfcjQcikMHa4aQnpove9D4jjgzDAI310
	uRFGKQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4539upgn7y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Feb 2025 12:21:30 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51SCLTuR032368
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Feb 2025 12:21:29 GMT
Received: from [10.50.19.252] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 28 Feb
 2025 04:21:25 -0800
Message-ID: <9799775e-f754-f717-538a-cfea3dbc794b@quicinc.com>
Date: Fri, 28 Feb 2025 17:51:21 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/4] dt-bindings: media: qcom,sm8550-iris: document SM8650
 IRIS accelerator
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
CC: <linux-arm-msm@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250225-topic-sm8x50-iris-v10-v1-0-128ef05d9665@linaro.org>
 <20250225-topic-sm8x50-iris-v10-v1-1-128ef05d9665@linaro.org>
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
In-Reply-To: <20250225-topic-sm8x50-iris-v10-v1-1-128ef05d9665@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: jzhqKxnEf_1tHWXcjbEJKXeH8GShUwxN
X-Proofpoint-GUID: jzhqKxnEf_1tHWXcjbEJKXeH8GShUwxN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-28_02,2025-02-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 adultscore=0 phishscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0
 impostorscore=0 mlxscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502280089



On 2/25/2025 2:35 PM, Neil Armstrong wrote:
> Document the IRIS video decoder and encoder accelerator found in the
> SM8650 platform, it requires 2 more reset lines in addition to the
> properties required for the SM8550 platform.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  .../bindings/media/qcom,sm8550-iris.yaml           | 33 ++++++++++++++++++----
>  1 file changed, 28 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
> index e424ea84c211f473a799481fd5463a16580187ed..536cf458dcb08141e5a1ec8c3df964196e599a57 100644
> --- a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
> @@ -14,12 +14,11 @@ description:
>    The iris video processing unit is a video encode and decode accelerator
>    present on Qualcomm platforms.
>  
> -allOf:
> -  - $ref: qcom,venus-common.yaml#
> -
>  properties:
>    compatible:
> -    const: qcom,sm8550-iris
> +    enum:
> +      - qcom,sm8550-iris
> +      - qcom,sm8650-iris
>  
>    power-domains:
>      maxItems: 4
> @@ -49,11 +48,15 @@ properties:
>        - const: video-mem
>  
>    resets:
> -    maxItems: 1
> +    minItems: 1
> +    maxItems: 3
>  
>    reset-names:
> +    minItems: 1
>      items:
>        - const: bus
> +      - const: xo
> +      - const: core
>  
>    iommus:
>      maxItems: 2
> @@ -75,6 +78,26 @@ required:
>    - iommus
>    - dma-coherent
>  
> +allOf:
> +  - $ref: qcom,venus-common.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          enum:
> +            - qcom,sm8650-iris
> +    then:
> +      properties:
> +        resets:
> +          minItems: 3
> +        reset-names:
> +          minItems: 3
> +    else:
> +      properties:
> +        resets:
> +          maxItems: 1
> +        reset-names:
> +          maxItems: 1
> +
>  unevaluatedProperties: false
>  
>  examples:
> 
Since we are using same binding for SM8550 and SM8650, I think, it would be
good to rename this file to qcom,iris-commom.yaml

Thanks,
Dikshita

