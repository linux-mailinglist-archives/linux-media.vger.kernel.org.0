Return-Path: <linux-media+bounces-22070-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 519579D93A2
	for <lists+linux-media@lfdr.de>; Tue, 26 Nov 2024 09:57:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9FD93B240ED
	for <lists+linux-media@lfdr.de>; Tue, 26 Nov 2024 08:57:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C8CF1B4129;
	Tue, 26 Nov 2024 08:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="XCoYbHGA"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 085C41A0BEE;
	Tue, 26 Nov 2024 08:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732611437; cv=none; b=grG45AYhy3mLroF3kDezaZcvbneJm31NHWdp4II7eoEGmPnmYfmhdsVd/328yn22ukB4pzOKmD0GaPZeA4e5FcUU+S4gxYP10LOBKYVNSlaoFLXCAQ6qj4rf1aWfg/mRvVS1FyJ4WyPoUl8oslf09/oue5lMCnXPCKK6S+7Vosk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732611437; c=relaxed/simple;
	bh=yABONN/cJSffrgHThdWC+NfnzKB5d3BfPj7D/yuXOrA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=MuwymaYCNOof0KW/JgxNeEDDlXOux9jTKVrCqKaXVEhF6TcAugtLpf7WZ0EguQmex+0KYY/2ZtaBrXM0dmsov4wY6tvJdRgqEKR4vO0NLM4fjgSqCy4tyAkmNAqm0PiRNj/sqLDnr82riYje+dZBUYk1PxTH7uHu3QMaGNbZSbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=XCoYbHGA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AQ5F23n032567;
	Tue, 26 Nov 2024 08:57:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HUiQvzko3bTbQsafYmiYwTnwsUc5wu4JTYmoq2PMWJ4=; b=XCoYbHGAy/xwLe+4
	a97FhftnFmAa8WLxrnPu1Ax0VJeqeCeMXniP62Td2Bv8SvFgcGkRqYYlT/gAZu5s
	+C7g8Gv9ZIDR3B6o9ohPxMFIFcnhBThUpzIokF4ir7tZwewwT1eGoUtFUFr42GEg
	WcbPd70FWoLZHEszZi7Gc5/rZd3tPUHbmbCoPio/LeoYGPWdHmnGqw0JxNpO5pF1
	N2x7ZBRRcjgXi3Wd7W5EHQEaXY79XOpcThlsJ8GIB8qlVbMeMSiQtE+/MMw1+Ot4
	Q+ztDLEjpA9+Au0CXNr3xuMylvg+XxEnRrNSGI7/k8FH8f4o47uBzLZ0k+DStLRV
	612t5w==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 434ts1jdgp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 26 Nov 2024 08:57:10 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AQ8vA5L014395
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 26 Nov 2024 08:57:10 GMT
Received: from [10.231.216.103] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 26 Nov
 2024 00:57:07 -0800
Message-ID: <7df4fded-8c20-4562-9a18-2a122733dfae@quicinc.com>
Date: Tue, 26 Nov 2024 16:57:02 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] dt-bindings: qcom,qcs615-venus: add support for
 video hardware
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Vikash Garodia
	<quic_vgarodia@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20241125-add-venus-for-qcs615-v3-0-5a376b97a68e@quicinc.com>
 <20241125-add-venus-for-qcs615-v3-1-5a376b97a68e@quicinc.com>
 <kdyhkb3tt2lgfuopz7twxjwpfur6vuezaqlc7s7aozkz6ek2as@m2nvqcb5ww4u>
Content-Language: en-US
From: Renjiang Han <quic_renjiang@quicinc.com>
In-Reply-To: <kdyhkb3tt2lgfuopz7twxjwpfur6vuezaqlc7s7aozkz6ek2as@m2nvqcb5ww4u>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: mTpTnNxTMLiau9fa5vnqRadTCpP3hPU4
X-Proofpoint-ORIG-GUID: mTpTnNxTMLiau9fa5vnqRadTCpP3hPU4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 lowpriorityscore=0 mlxlogscore=999 spamscore=0 adultscore=0 malwarescore=0
 impostorscore=0 phishscore=0 priorityscore=1501 mlxscore=0 suspectscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411260069


On 11/26/2024 12:12 AM, Dmitry Baryshkov wrote:
> On Mon, Nov 25, 2024 at 11:04:49AM +0530, Renjiang Han wrote:
>> Add support for Qualcomm video acceleration hardware used for video
>> stream decoding and encoding on QCOM QCS615.
>>
>> Signed-off-by: Renjiang Han <quic_renjiang@quicinc.com>
>> ---
>>   .../bindings/media/qcom,qcs615-venus.yaml          | 182 +++++++++++++++++++++
>>   1 file changed, 182 insertions(+)
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
> Please extend sc7180-venus.yaml instead. No need to duplicate
> unnecessary things.

Thanks for your review. But I'm sorry I can't get it. The devicetree for

qcs615-venus is in qcs615.dtsi. I'm not sure how to use sc7180-venus.yaml

instead.

>> +
>> +  power-domains:
>> +    minItems: 2
>> +    maxItems: 3
> So, is it 2 or 3? You don't have legacy here, so you should know an
> exact number.
Got it. Both minItems and maxItems should be 3. I'll update with next 
version.
>
>> +
>> +  power-domain-names:
>> +    minItems: 2
> And this one also can go away.
OK. Thanks for pointing it out. I'll remove this minItems with next 
version.
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
-- 
Best Regards,
Renjiang


