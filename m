Return-Path: <linux-media+bounces-36093-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C1276AEB71A
	for <lists+linux-media@lfdr.de>; Fri, 27 Jun 2025 14:07:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C000F1C42A98
	for <lists+linux-media@lfdr.de>; Fri, 27 Jun 2025 12:07:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DE722D12E4;
	Fri, 27 Jun 2025 12:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="JuCoJl0b"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D98E82C08D5;
	Fri, 27 Jun 2025 12:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751026016; cv=none; b=ouFW1HWxDtjH8qU5u4rmPWU4Lz9nrnItrelTWiqlIxlSGnzT+kn7cUxJbuFiQsAvzU9Y6isNpZjQD3cCD9fBicN0O73U2X0+uqapFlNt6IgKDIcyjnXP3Wu4BJWToUK4F5QF0JJzfAw7iV8nLcKPuXFYbUgc9SMS+bVHFPY7hpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751026016; c=relaxed/simple;
	bh=t7XzKew5+0lYzbTmoALkz10JRdnJiuTWlYdSxpv78k8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Ioc4aNAMV6tIELmnoKS3rUzMmrDbnX+rNrF8eED91p7H/VbM2j/ny994NCqk4kXoayYHSjjhQ36q70N2VgJAl8rfHsc3cRhP42NaF8j1BaH9LnbhFWgAsTsOJjDKUPnTyUdMCJZS6NGSNo+Ujux4jIpuMYFZPUF9GVvfKl0VIL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=JuCoJl0b; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55RC4DVm014224;
	Fri, 27 Jun 2025 12:06:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hvt4amqmouPmPQltleqmNYS6BYq7CIwa2LE9KyVDFvU=; b=JuCoJl0bn97rsuBV
	ZtKqj9fAL2IVcZW2X5WCKCco3dm1zvHhM6K5+apWrmrDdjpEXkiox4emm4x0n6Rx
	wWA3koQ87bd9fWRSio3pZplN8qkbLbZt2mO6Qm25jHSdmUgu0DEEVftb9uk5G65n
	oXH7OG2gLxp3hBlJjUXh9tcmEDQL/JdMDqj3XtJkMLC8o1J90Q8SlzeOm6MJgmLN
	zSsd7lQvymCLiN/LpB4V0MiFa3+2PLAnXPj9oEmEey6BZOI5o5T3Ycl4lmrdIHlZ
	kWBPDb/Eh42d+Ct5NakRjcnBFJuCARqgKCHYuGPJEQyLfmB04Mt80z5BEGTEAjdM
	mRFAzw==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47emcn0hp4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Jun 2025 12:06:50 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55RC6oJw019415
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Jun 2025 12:06:50 GMT
Received: from [10.50.23.194] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 27 Jun
 2025 05:06:46 -0700
Message-ID: <76492de3-c200-535a-aa1b-c617ba6146f1@quicinc.com>
Date: Fri, 27 Jun 2025 17:36:43 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v5 1/5] media: dt-bindings: venus: Add qcm2290 dt schema
Content-Language: en-US
To: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>, <krzk+dt@kernel.org>,
        <bryan.odonoghue@linaro.org>, <quic_dikshita@quicinc.com>,
        <mchehab@kernel.org>, <robh@kernel.org>, <conor+dt@kernel.org>,
        <konradybcio@kernel.org>, <andersson@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250626135931.700937-1-jorge.ramirez@oss.qualcomm.com>
 <20250626135931.700937-2-jorge.ramirez@oss.qualcomm.com>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <20250626135931.700937-2-jorge.ramirez@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: EiN1Rx7BzmEC0I9Xw9iCP2r7YY8rNIgZ
X-Proofpoint-ORIG-GUID: EiN1Rx7BzmEC0I9Xw9iCP2r7YY8rNIgZ
X-Authority-Analysis: v=2.4 cv=J+eq7BnS c=1 sm=1 tr=0 ts=685e895a cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=EFdyQdsXkkGHEbZHU5cA:9
 a=QEXdDO2ut3YA:10 a=sptkURWiP4Gy88Gu7hUp:22 a=cvBusfyB2V15izCimMoJ:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDEwMCBTYWx0ZWRfX91Ha1w5XgZiL
 LIhSE0YIWrd8nmKCyUV3BQA9mHr/mqyNIGMmrB0awxx8Bj+ujsGJjGYx/tw4B8Q6s0zHIN8oANx
 kQkMmE0sDQfvy4tGkdjDMmZ2e3SKqvT2di9WKe1WQY4/goGVMzJhNBVRPwHCvugcdLQHPR15AOr
 7vLzT6+u1sw8xf4i0yUZgp4YB+EYQPGA+arKlb6w1t5zcP79dNOsL8QP332qb5PmLFiHj+HjQhn
 fa2kRks5Sk60mlKJYr0w2Ccxx514ELwC4n/SgdY9LI/qqqUXZKrKw8GCRZT+L8UxqSSQ0kBPaeq
 d5rS+IPnDQqv0UO58olQoW0eFq3qAVHFASMZ4tIENegFDI2MfaZJu4V8SPeKHaZVsqLbfoikCj9
 lo5hgCkJatGBOf8YgJBpuKSsaKy4U+NDd7DxsmbxXvY8FHyuAzO/MWV/MFp46JqM/2fPm5A4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_04,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxlogscore=999 adultscore=0 impostorscore=0 clxscore=1015
 spamscore=0 malwarescore=0 phishscore=0 priorityscore=1501 suspectscore=0
 mlxscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506270100


On 6/26/2025 7:29 PM, Jorge Ramirez-Ortiz wrote:
> Add a schema for the venus video encoder/decoder on the qcm2290.
> 
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../bindings/media/qcom,qcm2290-venus.yaml    | 127 ++++++++++++++++++
>  1 file changed, 127 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
> new file mode 100644
> index 000000000000..a9f89b545334
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
> @@ -0,0 +1,127 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/qcom,qcm2290-venus.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm QCM2290 Venus video encode and decode accelerators
> +
> +maintainers:
> +  - Vikash Garodia <quic_vgarodia@quicinc.com>
> +
> +description:
> +  The Venus AR50_LITE IP is a video encode and decode accelerator present
> +  on Qualcomm platforms
> +
> +allOf:
> +  - $ref: qcom,venus-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: qcom,qcm2290-venus
> +
> +  power-domains:
> +    maxItems: 3
> +
> +  power-domain-names:
> +    items:
> +      - const: venus
> +      - const: vcodec0
> +      - const: cx
> +
> +  clocks:
> +    maxItems: 6
> +
> +  clock-names:
> +    items:
> +      - const: core
> +      - const: iface
> +      - const: bus
> +      - const: throttle
> +      - const: vcodec0_core
> +      - const: vcodec0_bus
> +
> +  iommus:
> +    minItems: 1
> +    maxItems: 5
2 should be good to support non secure usecases. 5 not needed.
> +
> +  interconnects:
> +    maxItems: 2
> +
> +  interconnect-names:
> +    items:
> +      - const: video-mem
> +      - const: cpu-cfg
> +
> +  operating-points-v2: true
> +  opp-table:
> +    type: object
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
> +    #include <dt-bindings/clock/qcom,gcc-qcm2290.h>
> +    #include <dt-bindings/interconnect/qcom,qcm2290.h>
> +    #include <dt-bindings/interconnect/qcom,rpm-icc.h>
> +    #include <dt-bindings/power/qcom-rpmpd.h>
> +
> +    venus: video-codec@5a00000 {
> +        compatible = "qcom,qcm2290-venus";
> +        reg = <0x5a00000 0xf0000>;
> +        interrupts = <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH>;
> +
> +        power-domains = <&gcc GCC_VENUS_GDSC>,
> +                        <&gcc GCC_VCODEC0_GDSC>,
> +                        <&rpmpd QCM2290_VDDCX>;
> +        power-domain-names = "venus",
> +                             "vcodec0",
> +                             "cx";
> +        operating-points-v2 = <&venus_opp_table>;
> +
> +        clocks = <&gcc GCC_VIDEO_VENUS_CTL_CLK>,
> +                 <&gcc GCC_VIDEO_AHB_CLK>,
> +                 <&gcc GCC_VENUS_CTL_AXI_CLK>,
> +                 <&gcc GCC_VIDEO_THROTTLE_CORE_CLK>,
> +                 <&gcc GCC_VIDEO_VCODEC0_SYS_CLK>,
> +                 <&gcc GCC_VCODEC0_AXI_CLK>;
> +        clock-names = "core",
> +                       "iface",
> +                       "bus",
> +                       "throttle",
> +                       "vcodec0_core",
> +                       "vcodec0_bus";
> +
> +        memory-region = <&pil_video_mem>;
> +        iommus = <&apps_smmu 0x860 0x0>,
> +                 <&apps_smmu 0x880 0x0>,
> +                 <&apps_smmu 0x861 0x04>,
> +                 <&apps_smmu 0x863 0x0>,
> +                 <&apps_smmu 0x804 0xE0>;
update this accordingly.
> +
> +        interconnects = <&mmnrt_virt MASTER_VIDEO_P0 RPM_ALWAYS_TAG
> +                         &bimc SLAVE_EBI1 RPM_ALWAYS_TAG>,
> +                        <&bimc MASTER_APPSS_PROC RPM_ACTIVE_TAG
> +                         &config_noc SLAVE_VENUS_CFG RPM_ACTIVE_TAG>;
> +        interconnect-names = "video-mem",
> +                             "cpu-cfg";
> +
> +        venus_opp_table: opp-table {
> +            compatible = "operating-points-v2";
> +
> +            opp-133000000 {
> +                opp-hz = /bits/ 64 <133000000>;
> +                required-opps = <&rpmpd_opp_low_svs>;
> +            };
This value is incorrect, fix it to 133330000.
> +            opp-240000000 {
> +                opp-hz = /bits/ 64 <240000000>;
> +                required-opps = <&rpmpd_opp_svs>;
Do you see other corners in the reference catalog as well, not just the
downstream code ? OR did you limit this as the usecase do not demand higher corner ?

Regards,
Vikash
> +            };
> +        };
> +    };

