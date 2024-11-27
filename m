Return-Path: <linux-media+bounces-22131-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D91659DA395
	for <lists+linux-media@lfdr.de>; Wed, 27 Nov 2024 09:09:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6A1A6B23DE7
	for <lists+linux-media@lfdr.de>; Wed, 27 Nov 2024 08:09:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2FF817E01B;
	Wed, 27 Nov 2024 08:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="AN7uGXa9"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70AF1F9DD;
	Wed, 27 Nov 2024 08:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732694969; cv=none; b=Sy44SPGG40MPr4n/CbHpvk/5PiASB1pZAEASwzSgN7ewIhaRFBFk4aQh6B7jP4SosvI/2VvqgAmKVVxKCu3YVoH0VhRHmCrPx27trMgWhoB/BQicQ4G7IqtQS42VZdST7n4rT4UUJG2pAncAU1AJu5tCrm/cge3xMeTmyAnCjKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732694969; c=relaxed/simple;
	bh=mTg9tZC7LMWARirVkp2tgjszza5J6ky+tDCfhVwybNk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=KZlAuKW5rStYFedFYn4H0DqPpGpOsK0iDW4J6njYXjc7SmsKfeD2MU9e8Cw0Ni23socFim7SGIIQD0531WqZTVXmwGVlb60+BmQTyIWyGus6yHOkfcPXQfT2Qilh6+i7vsF8Pts+VvfWKbl+iNO2PVNbnAYSDCLniUcv65HSJcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=AN7uGXa9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AQKKsVh005586;
	Wed, 27 Nov 2024 08:09:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MUAHhdHAf2t93uxt485cg44h7fCaiLX3yajm5iAoMg4=; b=AN7uGXa9sgPONeYU
	NWBO7elUwqx2tloBLgDnBk6MhyCwAxnv8tD0HJr4rn/J+4ZYp0xYeSPCwTN4raaz
	XJk5goP90wy6C9pj9eTBhJQ2xz5mNK2VE65olQXlSUL1xSit+0K3RZIi733xGKxT
	9QtY0x22MbLdzTlMOb7XHff5G6M++Sw7Zg8U7zOkAVSS7oZjQ2hgfoFJhJgYnVi/
	cMqKt2lxRSIHy26MaYEKCL2I7SQvyzU0sGjUGiXw5c+yX4ic0bLMhqDF52HvYQHF
	8VINoOiULhFBUGoAN5EAdCNa6/IHXC+Rr0EFNAyveZ2QA6ph+xT2/qHpFofF/l1w
	341nvw==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 435cmqu2mr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Nov 2024 08:09:21 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AR89KBB005056
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Nov 2024 08:09:20 GMT
Received: from [10.204.100.69] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 27 Nov
 2024 00:09:16 -0800
Message-ID: <f4e48aab-2d1c-bbf1-3ee8-596a502fe7ed@quicinc.com>
Date: Wed, 27 Nov 2024 13:39:13 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v3 1/4] dt-bindings: qcom,qcs615-venus: add support for
 video hardware
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Renjiang Han
	<quic_renjiang@quicinc.com>
CC: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bryan O'Donoghue
	<bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Rob Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor Dooley" <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        "Konrad Dybcio" <konradybcio@kernel.org>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20241125-add-venus-for-qcs615-v3-0-5a376b97a68e@quicinc.com>
 <20241125-add-venus-for-qcs615-v3-1-5a376b97a68e@quicinc.com>
 <kdyhkb3tt2lgfuopz7twxjwpfur6vuezaqlc7s7aozkz6ek2as@m2nvqcb5ww4u>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <kdyhkb3tt2lgfuopz7twxjwpfur6vuezaqlc7s7aozkz6ek2as@m2nvqcb5ww4u>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: pdcOjsJW3LZwXM8wZDVrrQJK63Yw64zr
X-Proofpoint-ORIG-GUID: pdcOjsJW3LZwXM8wZDVrrQJK63Yw64zr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 spamscore=0
 lowpriorityscore=0 mlxscore=0 phishscore=0 malwarescore=0 mlxlogscore=999
 impostorscore=0 bulkscore=0 adultscore=0 suspectscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411270066


On 11/25/2024 9:42 PM, Dmitry Baryshkov wrote:
> On Mon, Nov 25, 2024 at 11:04:49AM +0530, Renjiang Han wrote:
>> Add support for Qualcomm video acceleration hardware used for video
>> stream decoding and encoding on QCOM QCS615.
>>
>> Signed-off-by: Renjiang Han <quic_renjiang@quicinc.com>
>> ---
>>  .../bindings/media/qcom,qcs615-venus.yaml          | 182 +++++++++++++++++++++
>>  1 file changed, 182 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/media/qcom,qcs615-venus.yaml b/Documentation/devicetree/bindings/media/qcom,qcs615-venus.yaml
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..7a3a01ff06d8b62bc2424a0a24857c86c6865f89
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/media/qcom,qcs615-venus.yaml
>> @@ -0,0 +1,182 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/media/qcom,qcs615-venus.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm QCS615 Venus video encode and decode accelerators
>> +
>> +maintainers:
>> +  - Stanimir Varbanov <stanimir.k.varbanov@gmail.com>
>> +  - Vikash Garodia <quic_vgarodia@quicinc.com>
>> +
>> +description:
>> +  The Venus IP is a video encode and decode accelerator present
>> +  on Qualcomm platforms
>> +
>> +allOf:
>> +  - $ref: qcom,venus-common.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    const: qcom,qcs615-venus
> 
> Please extend sc7180-venus.yaml instead. No need to duplicate
> unnecessary things.
Exactly, we should reuse the sc7180 bindings for this.

Regards,
Vikash
> 
>> +
>> +  power-domains:
>> +    minItems: 2
>> +    maxItems: 3
> 
> So, is it 2 or 3? You don't have legacy here, so you should know an
> exact number.
> 
>> +
>> +  power-domain-names:
>> +    minItems: 2
> 
> And this one also can go away.
> 
>> +    items:
>> +      - const: venus
>> +      - const: vcodec0
>> +      - const: cx
>> +
>> +  clocks:
>> +    maxItems: 5
>> +
>> +  clock-names:
>> +    items:
>> +      - const: core
>> +      - const: iface
>> +      - const: bus
>> +      - const: vcodec0_core
>> +      - const: vcodec0_bus
>> +
>> +  iommus:
>> +    maxItems: 1
>> +
>> +  memory-region:
>> +    maxItems: 1
>> +
>> +  interconnects:
>> +    maxItems: 2
>> +
>> +  interconnect-names:
>> +    items:
>> +      - const: video-mem
>> +      - const: cpu-cfg
>> +
>> +  operating-points-v2: true
>> +
>> +  opp-table:
>> +    type: object
>> +
>> +  video-decoder:
>> +    type: object
>> +
>> +    additionalProperties: false
>> +
>> +    properties:
>> +      compatible:
>> +        const: venus-decoder
>> +
>> +    required:
>> +      - compatible
>> +
>> +  video-encoder:
>> +    type: object
>> +
>> +    additionalProperties: false
>> +
>> +    properties:
>> +      compatible:
>> +        const: venus-encoder
>> +
>> +    required:
>> +      - compatible
>> +
>> +required:
>> +  - compatible
>> +  - power-domain-names
>> +  - iommus
>> +  - video-decoder
>> +  - video-encoder
>> +
>> +unevaluatedProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    #include <dt-bindings/clock/qcom,qcs615-videocc.h>
>> +    #include <dt-bindings/interconnect/qcom,qcs615-rpmh.h>
>> +    #include <dt-bindings/power/qcom,rpmhpd.h>
>> +
>> +    venus: video-codec@aa00000 {
>> +        compatible = "qcom,qcs615-venus";
>> +        reg = <0xaa00000 0x100000>;
>> +        interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
>> +
>> +        clocks = <&videocc VIDEO_CC_VENUS_CTL_CORE_CLK>,
>> +                 <&videocc VIDEO_CC_VENUS_AHB_CLK>,
>> +                 <&videocc VIDEO_CC_VENUS_CTL_AXI_CLK>,
>> +                 <&videocc VIDEO_CC_VCODEC0_CORE_CLK>,
>> +                 <&videocc VIDEO_CC_VCODEC0_AXI_CLK>;
>> +        clock-names = "core",
>> +                      "iface",
>> +                      "bus",
>> +                      "vcodec0_core",
>> +                      "vcodec0_bus";
>> +
>> +        power-domains = <&videocc VENUS_GDSC>,
>> +                        <&videocc VCODEC0_GDSC>,
>> +                        <&rpmhpd RPMHPD_CX>;
>> +        power-domain-names = "venus",
>> +                             "vcodec0",
>> +                             "cx";
>> +
>> +        operating-points-v2 = <&venus_opp_table>;
>> +
>> +        interconnects = <&mmss_noc MASTER_VIDEO_P0 0
>> +                         &mc_virt SLAVE_EBI1 0>,
>> +                        <&gem_noc MASTER_APPSS_PROC 0
>> +                         &config_noc SLAVE_VENUS_CFG 0>;
>> +        interconnect-names = "video-mem",
>> +                             "cpu-cfg";
>> +
>> +        iommus = <&apps_smmu 0xe40 0x20>;
>> +
>> +        memory-region = <&pil_video_mem>;
>> +
>> +        video-decoder {
>> +            compatible = "venus-decoder";
>> +        };
>> +
>> +        video-encoder {
>> +            compatible = "venus-encoder";
>> +        };
>> +
>> +        venus_opp_table: opp-table {
>> +            compatible = "operating-points-v2";
>> +
>> +            opp-133330000 {
>> +                opp-hz = /bits/ 64 <133330000>;
>> +                required-opps = <&rpmhpd_opp_low_svs>;
>> +            };
>> +
>> +            opp-240000000 {
>> +                opp-hz = /bits/ 64 <240000000>;
>> +                required-opps = <&rpmhpd_opp_svs>;
>> +            };
>> +
>> +            opp-300000000 {
>> +                opp-hz = /bits/ 64 <300000000>;
>> +                required-opps = <&rpmhpd_opp_svs_l1>;
>> +            };
>> +
>> +            opp-380000000 {
>> +                opp-hz = /bits/ 64 <380000000>;
>> +                required-opps = <&rpmhpd_opp_nom>;
>> +            };
>> +
>> +            opp-410000000 {
>> +                opp-hz = /bits/ 64 <410000000>;
>> +                required-opps = <&rpmhpd_opp_turbo>;
>> +            };
>> +
>> +            opp-460000000 {
>> +                opp-hz = /bits/ 64 <460000000>;
>> +                required-opps = <&rpmhpd_opp_turbo_l1>;
>> +            };
>> +        };
>> +    };
>>
>> -- 
>> 2.34.1
>>
> 

