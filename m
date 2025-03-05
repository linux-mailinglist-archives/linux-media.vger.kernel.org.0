Return-Path: <linux-media+bounces-27536-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7709A4F579
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 04:36:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1A0D03AB575
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 03:36:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E674188722;
	Wed,  5 Mar 2025 03:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="HwUTOWsR"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 035DE2E336F;
	Wed,  5 Mar 2025 03:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741145785; cv=none; b=U+wbCUpzYIjhLABVvQNTV5TLBsJHm6oEagQAkE8PBj46WU1uI9j38AXWuyZw+bwFUcfTxHvSx12OrMQwmOPZvHhg+/dv7EyrRUlA3eUbj4J82rbi8tZw2q4YVAjcnHisKnzEt2m5JDCyQ20VP1xjK9FM19NdUp17V4WURkbZYXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741145785; c=relaxed/simple;
	bh=FAdIKs12OIOAXa8pI/oADgOqCxGO3VcDJM8ZKpW4Qpw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Z+NQM5YICdOPDwfu6aJxIpOaIIYwvoUGQDXTdjbDEm8r+LaH2uGAfpnRek8ybcGd1gNf4zwoRyDqbNcyrCvv3RYIp1iVLv+HCSEbttyXUysw9wexv3SK7guWFGsaWAOMq9GSj1zpJWCbSmpA3MewGo7kjgCbCMfDVCYlaIRtDkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=HwUTOWsR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 524NAsXQ008881;
	Wed, 5 Mar 2025 03:36:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qGlyt/X/wwAgJXkcM5Q6jmBwjUTmlJa6H1clN4lhgY4=; b=HwUTOWsR4ZGcdOWL
	wU2iYcXearOTPKyCvSJ15tMW2+b368FJ/s6c98kQTE8jZI8gXiVKOjUpVhbItAtL
	bKOGidyrg62Ce7k53yhvK0BASsG15dDbFrlUxq/Bh0EfBp8T6Fh5QbY4r/m1GXX/
	J3gA+2NtTQiUL7Zasj7sW9L2v2rZe0fGdam51gVfoVtq/SmdlWatHEVQXaPxR1gh
	IYAf2NvTbnPWvcBHbP81WcnbFrookDhAjAYci4gBC+0csR3H/JqDnZW0N8pFGZcK
	lbABHG77p1AWJxuFXFxbrMepG1+LurQLlDYpsICcPeaHZFp4q7BvCTtckajf0ap0
	D2h0/w==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 455p6v3ygt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Mar 2025 03:36:18 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5253aHF1012134
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 5 Mar 2025 03:36:17 GMT
Received: from [10.216.10.45] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 4 Mar 2025
 19:36:13 -0800
Message-ID: <3dae6b0c-1f03-80c5-f2e6-b66aa2b522f6@quicinc.com>
Date: Wed, 5 Mar 2025 09:06:09 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 1/8] media: dt-bindings: Document SC8280XP/SM8350 Venus
Content-Language: en-US
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Stanimir Varbanov
	<stanimir.k.varbanov@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Johan Hovold
	<johan+linaro@kernel.org>
References: <20250304-b4-linux-media-comitters-sc8280xp-venus-v1-0-279c7ea55493@linaro.org>
 <20250304-b4-linux-media-comitters-sc8280xp-venus-v1-1-279c7ea55493@linaro.org>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <20250304-b4-linux-media-comitters-sc8280xp-venus-v1-1-279c7ea55493@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: o1zKbYKGtmarEgjafm6a5fYA-e8hVLs0
X-Proofpoint-ORIG-GUID: o1zKbYKGtmarEgjafm6a5fYA-e8hVLs0
X-Authority-Analysis: v=2.4 cv=fatXy1QF c=1 sm=1 tr=0 ts=67c7c6b2 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=gEfo2CItAAAA:8
 a=GN-lJdo5b5kOjZEooHoA:9 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-05_02,2025-03-04_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 lowpriorityscore=0 mlxlogscore=999 mlxscore=0 adultscore=0 suspectscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503050025


On 3/4/2025 6:37 PM, Bryan O'Donoghue wrote:
> From: Konrad Dybcio <konradybcio@kernel.org>
> 
> Both of these SoCs implement an IRIS2 block, with SC8280XP being able
> to clock it a bit higher.
> 
> Document it.
> 
> Signed-off-by: Konrad Dybcio <konradybcio@kernel.org>
> Link: https://lore.kernel.org/r/20230731-topic-8280_venus-v1-1-8c8bbe1983a5@linaro.org
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> [ bod: dropped dts video-encoder/video-decoder ]
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  .../bindings/media/qcom,sm8350-venus.yaml          | 119 +++++++++++++++++++++
>  1 file changed, 119 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8350-venus.yaml b/Documentation/devicetree/bindings/media/qcom,sm8350-venus.yaml
> new file mode 100644
> index 0000000000000..352ad85ae50cd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/qcom,sm8350-venus.yaml
> @@ -0,0 +1,119 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/qcom,sm8350-venus.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm SM8350 Venus video encode and decode accelerators
Again, what is the need to introduce a new bindings for sm8350 and how different
is this with sm8250 ?
> +
> +maintainers:
> +  - Konrad Dybcio <konradybcio@kernel.org>
> +
> +description: |
> +  The Venus Iris2 IP is a video encode and decode accelerator present
> +  on Qualcomm platforms
> +
> +allOf:
> +  - $ref: qcom,venus-common.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,sc8280xp-venus
> +      - qcom,sm8350-venus
> +
> +  clocks:
> +    maxItems: 3
> +
> +  clock-names:
> +    items:
> +      - const: iface
> +      - const: core
> +      - const: vcodec0_core
> +
> +  resets:
> +    maxItems: 1
> +
> +  reset-names:
> +    items:
> +      - const: core
> +
> +  power-domains:
> +    maxItems: 3
> +
> +  power-domain-names:
> +    items:
> +      - const: venus
> +      - const: vcodec0
> +      - const: mx
> +
> +  interconnects:
> +    maxItems: 3
> +
> +  interconnect-names:
> +    items:
> +      - const: cpu-cfg
> +      - const: video-mem
> +      - const: video-llcc
> +
> +  operating-points-v2: true
> +  opp-table:
> +    type: object
> +
> +  iommus:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - power-domain-names
> +  - iommus
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/qcom,gcc-sm8350.h>
> +    #include <dt-bindings/clock/qcom,sm8350-videocc.h>
> +    #include <dt-bindings/interconnect/qcom,icc.h>
> +    #include <dt-bindings/interconnect/qcom,sm8350.h>
> +    #include <dt-bindings/power/qcom-rpmpd.h>
> +
> +    venus: video-codec@aa00000 {
> +        compatible = "qcom,sm8350-venus";
> +        reg = <0x0aa00000 0x100000>;
> +        interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
> +
> +        clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
> +                 <&videocc VIDEO_CC_MVS0C_CLK>,
> +                 <&videocc VIDEO_CC_MVS0_CLK>;
> +        clock-names = "iface",
> +                      "core",
> +                      "vcodec0_core";
> +
> +        resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>;
> +        reset-names = "core";
> +
> +        power-domains = <&videocc MVS0C_GDSC>,
> +                        <&videocc MVS0_GDSC>,
> +                        <&rpmhpd SM8350_MX>;
> +        power-domain-names = "venus",
> +                             "vcodec0",
> +                             "mx";
> +
> +        interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
> +                         &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
> +                        <&mmss_noc MASTER_VIDEO_P0 QCOM_ICC_TAG_ALWAYS
> +                         &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
> +                        <&mmss_noc MASTER_VIDEO_P0 QCOM_ICC_TAG_ALWAYS
> +                         &gem_noc SLAVE_LLCC QCOM_ICC_TAG_ALWAYS>;
> +        interconnect-names = "cpu-cfg",
> +                             "video-mem",
> +                             "video-llcc";
> +
> +        operating-points-v2 = <&venus_opp_table>;
> +        iommus = <&apps_smmu 0x2100 0x400>;
> +        memory-region = <&pil_video_mem>;
> +
> +        status = "disabled";
> +    };
> 
Regards,
Vikash

