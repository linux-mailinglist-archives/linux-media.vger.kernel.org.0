Return-Path: <linux-media+bounces-28602-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E0E4DA6D506
	for <lists+linux-media@lfdr.de>; Mon, 24 Mar 2025 08:25:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E13043A5C5C
	for <lists+linux-media@lfdr.de>; Mon, 24 Mar 2025 07:23:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A9D62512F2;
	Mon, 24 Mar 2025 07:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ZY/ipM75"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85EBB250C17;
	Mon, 24 Mar 2025 07:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742801005; cv=none; b=Ulfym+WtmLKCb44syBeTfskJ+cNp7Rnwv0V5RMI1ZY6Iyk/80Us/st3NnJIObOG1M5VsqMTHQlQA2N5D0DrUUV4frBqIv8p5e1jdSH/HQhv8yAw6d0lY8gUqAP3RERpRCzM/XSgkAOtJVObJkUSLiQuK91AUJerdY58kJ7cTajU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742801005; c=relaxed/simple;
	bh=YXWjgc+LtkFVwK54Fq+jXzkI+tzud1ifstmjVonNXxM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ISySjJaAjVqImEEK0xA8zOynXmDZBbQUZfipsYlMX9RhDSGGvLI1ttWQIjZqrIlRwof9TvuEeE/7+myFcQIi1sAJQyIrlqae4XURHC/KKaQTIJkAHimf4zVRY6PnyDnP+2hh5EvGQe8gtqi0wUSJvuIFqs22aCB9aAziRDgjm0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ZY/ipM75; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52O6d8sN001035;
	Mon, 24 Mar 2025 07:23:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JRHqQk8vUkI56yBzwoURTXxt6b+rm+AdYrcH5GWCykg=; b=ZY/ipM75hRxFjndJ
	WRie34kRmlLI2ceLJYsZutZR8H4zwdhT5OvEY9vWQ2vkegMA2nJFGwmaKsVIWT/Y
	amGijDHnVKlFenb7y5RllIK08iYONXuFfsQjtGxY618+YD6mvg4uqfgnbHIWvwu2
	wip6pxpvuwSnb3E78wD/qfsULdvBPK+PKiEDUO6JlfutzTFnNeEnlCxhhL9S/LZW
	w9JYqd730wAG3edcGDwyeXBnKtl2NxPHsanznF0F6zH7VDtrYMm0RbzctaQY1uwQ
	vZju2rN/t4h7SWscE+kAYfR+R5hEPOLDTqIxw8rn03cnr5wUkZyrUczUyd6AaclJ
	Cj63gA==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45hne5ucta-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Mar 2025 07:23:14 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52O7NExn022764
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Mar 2025 07:23:14 GMT
Received: from [10.204.100.69] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 24 Mar
 2025 00:23:10 -0700
Message-ID: <b9f8dc30-7f6a-ecd5-16d1-678d9f2004cd@quicinc.com>
Date: Mon, 24 Mar 2025 12:53:07 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 1/7] dt-bindings: media: qcom,sm8550-iris: document
 SM8650 IRIS accelerator
Content-Language: en-US
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Dikshita Agarwal
	<quic_dikshita@quicinc.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        "Mauro Carvalho Chehab" <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250305-topic-sm8x50-iris-v10-v2-0-bd65a3fc099e@linaro.org>
 <20250305-topic-sm8x50-iris-v10-v2-1-bd65a3fc099e@linaro.org>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <20250305-topic-sm8x50-iris-v10-v2-1-bd65a3fc099e@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 30eiHm5MOBdHn0bwt5wRAuxAG4EPuWXS
X-Proofpoint-ORIG-GUID: 30eiHm5MOBdHn0bwt5wRAuxAG4EPuWXS
X-Authority-Analysis: v=2.4 cv=JvPxrN4C c=1 sm=1 tr=0 ts=67e10862 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8
 a=EHIPYe3-PrpxJ9E0mfMA:9 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-24_03,2025-03-21_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 suspectscore=0 phishscore=0 impostorscore=0 adultscore=0 clxscore=1015
 mlxscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503240052


On 3/6/2025 12:35 AM, Neil Armstrong wrote:
> Document the IRIS video decoder and encoder accelerator found in the
> SM8650 platform, it requires 2 more reset lines in addition to the
> properties required for the SM8550 platform.
> 
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
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
Reviewed-by: Vikash Garodia <quic_vgarodia@quicinc.com>

