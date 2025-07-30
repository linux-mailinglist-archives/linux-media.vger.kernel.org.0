Return-Path: <linux-media+bounces-38656-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EEF19B15B4B
	for <lists+linux-media@lfdr.de>; Wed, 30 Jul 2025 11:15:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B738E18C047F
	for <lists+linux-media@lfdr.de>; Wed, 30 Jul 2025 09:15:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5EC026CE28;
	Wed, 30 Jul 2025 09:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Cmssj2vS"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2C8919BBC;
	Wed, 30 Jul 2025 09:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753866899; cv=none; b=r3/URJpWZXLWaRFivhBMXaG+lfg/nj5JLeRtLuCTNX/MJxQMT7bIcT9wxGhYN2s8hHkmf1ICK2GclklubSzongYOi+D+ZyVV9aO+RaEbFD2BvfkZkgjIugEZkenpnKH33DYc6Y6DWdM+pzauWQbRfaoEU8DNnJdgjScWmOVujmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753866899; c=relaxed/simple;
	bh=kJO0vzOaPSzZxij2RzFRAkEe3cNJ0y+SKvCYc8G3+ug=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=K2JStLoQ0gy5DJQmH2D1bWW6mkQgtD8hZs6LWf7XZVbBk6jAYuq1us7/FJPN6bHsqC8vCq7NNd6so1lsdUNQaHwNNr92N794YyV9na6QZGwM8qasxf9NX8WBbsmjfSsVDWBjOGT/iMryka5grzMM25hMRfpCEISH7XZ8lZpjAIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Cmssj2vS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56U7ZiNM029390;
	Wed, 30 Jul 2025 09:14:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Klm1jGxRU1aBci00RNv4sJxrp2NGO1/0bQLdFIYy0jg=; b=Cmssj2vS39HDYSon
	6RuOHWvH9Z3ZT47yHTJboU01oa6MRHmXB+8yAuaNM2Q8u3lQIDpvN4SRXAyjlpL3
	NJ6FPxJLw5dyPicRq2sDjdzIc2tGCzVKl0d3CmkfGg/H1/gFhiLaSBuvlHMJJq2q
	LrvxFm6P6TBWB4ULp0nWDejpRH+TsnHzhk5x3SiZqQmIlUjquBMpoM7kpwaCKYtI
	/CUb0e35vyTf4T6R37MXz4UNgvIpZUf1zmJS9tBUViX9SIc7FsRYjUxbN9fnKgrb
	IjhgyJRSJ1jF4GU6nYHS689Cx2SntOcIxZIMeLF2LGcgnoI1P5/+eq6q+SlS4g4/
	/OvlAQ==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484qda31wp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Jul 2025 09:14:44 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56U9EhJr019108
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Jul 2025 09:14:43 GMT
Received: from [10.206.106.133] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 30 Jul
 2025 02:14:37 -0700
Message-ID: <a5fa79e2-0c44-48fc-b863-46b4c0a599d5@quicinc.com>
Date: Wed, 30 Jul 2025 14:44:28 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/9] media: dt-bindings: Add qcom,sa8775p-camss
 compatible
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, <rfoss@kernel.org>,
        <todor.too@gmail.com>, <mchehab@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <hverkuil-cisco@xs4all.nl>,
        <cros-qcom-dts-watchers@chromium.org>, <catalin.marinas@arm.com>,
        <will@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <quic_svankada@quicinc.com>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Wenmeng Liu
	<quic_wenmliu@quicinc.com>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
References: <20250703171938.3606998-1-quic_vikramsa@quicinc.com>
 <20250703171938.3606998-4-quic_vikramsa@quicinc.com>
 <6560f783-c50d-4509-8937-f76553c8bbb4@linaro.org>
Content-Language: en-US
From: Vikram Sharma <quic_vikramsa@quicinc.com>
In-Reply-To: <6560f783-c50d-4509-8937-f76553c8bbb4@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: v8jHdNx2afGSSyMdTfKddhFo2WaQ7qWv
X-Authority-Analysis: v=2.4 cv=Pfv/hjhd c=1 sm=1 tr=0 ts=6889e284 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=gEfo2CItAAAA:8
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=YL23fqL2OaiSwc5Xt98A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=sptkURWiP4Gy88Gu7hUp:22
 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: v8jHdNx2afGSSyMdTfKddhFo2WaQ7qWv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzMwMDA2MyBTYWx0ZWRfX0cqdAFItWKx1
 J8rgA7jnDYyvBKOyDuC/7jCt+ySNBmuxCH32c8lJhaI+IJAigQaGE+lfXWOsgJvyNmaTYbNb5fd
 RwFbFGOVyGERPKmYjHK8lu159xMO0ZCWE7RCwLUmaUp/36LYHGoadKEcBIvr/jOYhU4/tbIWINT
 nNwxh1p19VHP8sPkQsf8HdFLP6rg0fV5kapfWJ++XaoqkvV5e2uoOM+VwfDkR/k/Yecd2BSoM6l
 r/SxmpRUrStysojd8oTK7myFZzHUGQ49lHPcoA0PaNsznVPD8uzmTzla7ExODKldQI2y2Njum1K
 Hum7Zi5AItR+4AlgitxnS+UmuPAdZDqjxcEJdTw5Gx1ASm/0vyZ50/uY91HMXqr8PHizKl8cCsQ
 NMBAfyHNTGT3fCJgVuOgMXXbCROEzCZPgtDUrB5ySyJLlu42c9wligZLwNOO2yu2Z5qi/etu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-30_03,2025-07-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 clxscore=1015 adultscore=0 priorityscore=1501 mlxscore=0
 spamscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507300063


On 7/28/2025 7:17 PM, Bryan O'Donoghue wrote:
> WARNING: This email originated from outside of Qualcomm. Please be 
> wary of any links or attachments, and do not enable macros.
>
> On 03/07/2025 18:19, Vikram Sharma wrote:
>> Add the compatible string "qcom,sa8775p-camss" to support the
>> Camera Subsystem (CAMSS) on the Qualcomm SA8775P platform.
>>
>> The SA8775P platform provides:
>> - 2 x VFE (version 690), each with 3 RDI
>> - 5 x VFE Lite (version 690), each with 6 RDI
>> - 2 x CSID (version 690)
>> - 5 x CSID Lite (version 690)
>> - 4 x CSIPHY (version 690)
>> - 3 x TPG
>>
>> SA8775P is the first Qualcomm SoC to introduce a CSIPHY-based
>> Test Pattern Generator (TPG).
>>
>> Co-developed-by: Wenmeng Liu <quic_wenmliu@quicinc.com>
>> Signed-off-by: Wenmeng Liu <quic_wenmliu@quicinc.com>
>> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
>>   .../bindings/media/qcom,sa8775p-camss.yaml    | 361 ++++++++++++++++++
>>   1 file changed, 361 insertions(+)
>>   create mode 100644 
>> Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml
>>
>> diff --git 
>> a/Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml 
>> b/Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml
>> new file mode 100644
>> index 000000000000..b9f351546cd1
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml
>> @@ -0,0 +1,361 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/media/qcom,sa8775p-camss.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm SA8775P CAMSS ISP
>> +
>> +maintainers:
>> +  - Vikram Sharma <quic_vikramsa@quicinc.com>
>> +
>> +description:
>> +  The CAMSS IP is a CSI decoder and ISP present on Qualcomm platforms.
>> +
>> +properties:
>> +  compatible:
>> +    const: qcom,sa8775p-camss
>> +
>> +  reg:
>> +    maxItems: 22
>> +
>> +  reg-names:
>> +    items:
>> +      - const: csid0
>> +      - const: csid1
>> +      - const: csid_lite0
>> +      - const: csid_lite1
>> +      - const: csid_lite2
>> +      - const: csid_lite3
>> +      - const: csid_lite4
>> +      - const: csid_wrapper
>> +      - const: csiphy0
>> +      - const: csiphy1
>> +      - const: csiphy2
>> +      - const: csiphy3
>> +      - const: tpg0
>> +      - const: tpg1
>> +      - const: tpg2
>> +      - const: vfe0
>> +      - const: vfe1
>> +      - const: vfe_lite0
>> +      - const: vfe_lite1
>> +      - const: vfe_lite2
>> +      - const: vfe_lite3
>> +      - const: vfe_lite4
>> +
>> +  clocks:
>> +    maxItems: 28
>> +
>> +  clock-names:
>> +    items:
>> +      - const: camnoc_axi
>> +      - const: core_ahb
>> +      - const: cpas_ahb
>> +      - const: cpas_fast_ahb_clk
>> +      - const: cpas_vfe_lite
>> +      - const: cpas_vfe0
>> +      - const: cpas_vfe1
>> +      - const: csid
>> +      - const: csiphy0
>> +      - const: csiphy0_timer
>> +      - const: csiphy1
>> +      - const: csiphy1_timer
>> +      - const: csiphy2
>> +      - const: csiphy2_timer
>> +      - const: csiphy3
>> +      - const: csiphy3_timer
>> +      - const: csiphy_rx
>> +      - const: gcc_axi_hf
>> +      - const: gcc_axi_sf
>> +      - const: icp_ahb
>> +      - const: vfe0
>> +      - const: vfe0_fast_ahb
>> +      - const: vfe1
>> +      - const: vfe1_fast_ahb
>> +      - const: vfe_lite
>> +      - const: vfe_lite_ahb
>> +      - const: vfe_lite_cphy_rx
>> +      - const: vfe_lite_csid
>> +
>> +  interrupts:
>> +    maxItems: 21
>> +
>> +  interrupt-names:
>> +    items:
>> +      - const: csid0
>> +      - const: csid1
>> +      - const: csid_lite0
>> +      - const: csid_lite1
>> +      - const: csid_lite2
>> +      - const: csid_lite3
>> +      - const: csid_lite4
>> +      - const: csiphy0
>> +      - const: csiphy1
>> +      - const: csiphy2
>> +      - const: csiphy3
>> +      - const: tpg0
>> +      - const: tpg1
>> +      - const: tpg2
>> +      - const: vfe0
>> +      - const: vfe1
>> +      - const: vfe_lite0
>> +      - const: vfe_lite1
>> +      - const: vfe_lite2
>> +      - const: vfe_lite3
>> +      - const: vfe_lite4
>> +
>> +  interconnects:
>> +    maxItems: 2
>> +
>> +  interconnect-names:
>> +    items:
>> +      - const: ahb
>> +      - const: hf_0
>> +
>> +  iommus:
>> +    maxItems: 1
>> +
>> +  power-domains:
>> +    items:
>> +      - description: Titan GDSC - Titan ISP Block, Global 
>> Distributed Switch Controller.
>> +
>> +  power-domain-names:
>> +    items:
>> +      - const: top
>> +
>> +  vdda-phy-supply:
>> +    description:
>> +      Phandle to a regulator supply to PHY core block.
>> +
>> +  vdda-pll-supply:
>> +    description:
>> +      Phandle to 1.8V regulator supply to PHY refclk pll block.
>> +
>> +  ports:
>> +    $ref: /schemas/graph.yaml#/properties/ports
>> +
>> +    description:
>> +      CSI input ports.
>> +
>> +    patternProperties:
>> +      "^port@[0-3]+$":
>> +        $ref: /schemas/graph.yaml#/$defs/port-base
>> +        unevaluatedProperties: false
>> +        description:
>> +          Input port for receiving CSI data on CSIPHY 0-3.
>> +
>> +        properties:
>> +          endpoint:
>> +            $ref: video-interfaces.yaml#
>> +            unevaluatedProperties: false
>> +
>> +            properties:
>> +              data-lanes:
>> +                minItems: 1
>> +                maxItems: 4
>> +
>> +            required:
>> +              - data-lanes
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - reg-names
>> +  - clocks
>> +  - clock-names
>> +  - interrupts
>> +  - interrupt-names
>> +  - interconnects
>> +  - interconnect-names
>> +  - iommus
>> +  - power-domains
>> +  - power-domain-names
>> +  - vdda-phy-supply
>> +  - vdda-pll-supply
>> +  - ports
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/qcom,sa8775p-camcc.h>
>> +    #include <dt-bindings/clock/qcom,sa8775p-gcc.h>
>> +    #include <dt-bindings/interconnect/qcom,sa8775p-rpmh.h>
>> +    #include <dt-bindings/interconnect/qcom,icc.h>
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    #include <dt-bindings/power/qcom-rpmpd.h>
>> +
>> +    soc {
>> +        #address-cells = <2>;
>> +        #size-cells = <2>;
>> +
>> +        isp@ac7a000 {
>> +            compatible = "qcom,sa8775p-camss";
>> +
>> +            reg = <0x0 0xac7a000 0x0 0x0f00>,
>> +                  <0x0 0xac7c000 0x0 0x0f00>,
>> +                  <0x0 0xac84000 0x0 0x0f00>,
>> +                  <0x0 0xac88000 0x0 0x0f00>,
>> +                  <0x0 0xac8c000 0x0 0x0f00>,
>> +                  <0x0 0xac90000 0x0 0x0f00>,
>> +                  <0x0 0xac94000 0x0 0x0f00>,
>> +                  <0x0 0xac78000 0x0 0x1000>,
>> +                  <0x0 0xac9c000 0x0 0x2000>,
>> +                  <0x0 0xac9e000 0x0 0x2000>,
>> +                  <0x0 0xaca0000 0x0 0x2000>,
>> +                  <0x0 0xaca2000 0x0 0x2000>,
>> +                  <0x0 0xacac000 0x0 0x0400>,
>> +                  <0x0 0xacad000 0x0 0x0400>,
>> +                  <0x0 0xacae000 0x0 0x0400>,
>> +                  <0x0 0xac4d000 0x0 0xd000>,
>> +                  <0x0 0xac5a000 0x0 0xd000>,
>> +                  <0x0 0xac85000 0x0 0x0d00>,
>> +                  <0x0 0xac89000 0x0 0x0d00>,
>> +                  <0x0 0xac8d000 0x0 0x0d00>,
>> +                  <0x0 0xac91000 0x0 0x0d00>,
>> +                  <0x0 0xac95000 0x0 0x0d00>;
>> +            reg-names = "csid0",
>> +                        "csid1",
>> +                        "csid_lite0",
>> +                        "csid_lite1",
>> +                        "csid_lite2",
>> +                        "csid_lite3",
>> +                        "csid_lite4",
>> +                        "csid_wrapper",
>
> csid_wrapper is IMO the "main" register bank and as such should come
> first in the list of registers.
>
> Please update this description to reflect, remembering to amend your
> isp@address here and in your dts.

Thanks for your comment Bryan.

As per our earlier discussion we agreed to keep it as per 8550. Please 
confirm if we need to change that?
https://lore.kernel.org/all/b1ea0500-595f-48d6-9358-649c25fd4ee9@linaro.org/#t

>
>> +                        "csiphy0",
>> +                        "csiphy1",
>> +                        "csiphy2",
>> +                        "csiphy3",
>> +                        "tpg0",
>> +                        "tpg1",
>> +                        "tpg2",
>> +                        "vfe0",
>> +                        "vfe1",
>> +                        "vfe_lite0",
>> +                        "vfe_lite1",
>> +                        "vfe_lite2",
>> +                        "vfe_lite3",
>> +                        "vfe_lite4";
>> +
>> +            clocks = <&camcc CAM_CC_CAMNOC_AXI_CLK>,
>> +                     <&camcc CAM_CC_CORE_AHB_CLK>,
>> +                     <&camcc CAM_CC_CPAS_AHB_CLK>,
>> +                     <&camcc CAM_CC_CPAS_FAST_AHB_CLK>,
>> +                     <&camcc CAM_CC_CPAS_IFE_LITE_CLK>,
>> +                     <&camcc CAM_CC_CPAS_IFE_0_CLK>,
>> +                     <&camcc CAM_CC_CPAS_IFE_1_CLK>,
>> +                     <&camcc CAM_CC_CSID_CLK>,
>> +                     <&camcc CAM_CC_CSIPHY0_CLK>,
>> +                     <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
>> +                     <&camcc CAM_CC_CSIPHY1_CLK>,
>> +                     <&camcc CAM_CC_CSI1PHYTIMER_CLK>,
>> +                     <&camcc CAM_CC_CSIPHY2_CLK>,
>> +                     <&camcc CAM_CC_CSI2PHYTIMER_CLK>,
>> +                     <&camcc CAM_CC_CSIPHY3_CLK>,
>> +                     <&camcc CAM_CC_CSI3PHYTIMER_CLK>,
>> +                     <&camcc CAM_CC_CSID_CSIPHY_RX_CLK>,
>> +                     <&gcc GCC_CAMERA_HF_AXI_CLK>,
>> +                     <&gcc GCC_CAMERA_SF_AXI_CLK>,
>> +                     <&camcc CAM_CC_ICP_AHB_CLK>,
>> +                     <&camcc CAM_CC_IFE_0_CLK>,
>> +                     <&camcc CAM_CC_IFE_0_FAST_AHB_CLK>,
>> +                     <&camcc CAM_CC_IFE_1_CLK>,
>> +                     <&camcc CAM_CC_IFE_1_FAST_AHB_CLK>,
>> +                     <&camcc CAM_CC_IFE_LITE_CLK>,
>> +                     <&camcc CAM_CC_IFE_LITE_AHB_CLK>,
>> +                     <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>,
>> +                     <&camcc CAM_CC_IFE_LITE_CSID_CLK>;
>> +            clock-names = "camnoc_axi",
>> +                          "core_ahb",
>> +                          "cpas_ahb",
>> +                          "cpas_fast_ahb_clk",
>> +                          "cpas_vfe_lite",
>> +                          "cpas_vfe0",
>> +                          "cpas_vfe1",
>> +                          "csid",
>> +                          "csiphy0",
>> +                          "csiphy0_timer",
>> +                          "csiphy1",
>> +                          "csiphy1_timer",
>> +                          "csiphy2",
>> +                          "csiphy2_timer",
>> +                          "csiphy3",
>> +                          "csiphy3_timer",
>> +                          "csiphy_rx",
>> +                          "gcc_axi_hf",
>> +                          "gcc_axi_sf",
>> +                          "icp_ahb",
>> +                          "vfe0",
>> +                          "vfe0_fast_ahb",
>> +                          "vfe1",
>> +                          "vfe1_fast_ahb",
>> +                          "vfe_lite",
>> +                          "vfe_lite_ahb",
>> +                          "vfe_lite_cphy_rx",
>> +                          "vfe_lite_csid";
>> +
>> +            interrupts = <GIC_SPI 565 IRQ_TYPE_EDGE_RISING>,
>> +                         <GIC_SPI 564 IRQ_TYPE_EDGE_RISING>,
>> +                         <GIC_SPI 468 IRQ_TYPE_EDGE_RISING>,
>> +                         <GIC_SPI 359 IRQ_TYPE_EDGE_RISING>,
>> +                         <GIC_SPI 759 IRQ_TYPE_EDGE_RISING>,
>> +                         <GIC_SPI 758 IRQ_TYPE_EDGE_RISING>,
>> +                         <GIC_SPI 604 IRQ_TYPE_EDGE_RISING>,
>> +                         <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>,
>> +                         <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>,
>> +                         <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>,
>> +                         <GIC_SPI 448 IRQ_TYPE_EDGE_RISING>,
>> +                         <GIC_SPI 545 IRQ_TYPE_EDGE_RISING>,
>> +                         <GIC_SPI 546 IRQ_TYPE_EDGE_RISING>,
>> +                         <GIC_SPI 547 IRQ_TYPE_EDGE_RISING>,
>> +                         <GIC_SPI 465 IRQ_TYPE_EDGE_RISING>,
>> +                         <GIC_SPI 467 IRQ_TYPE_EDGE_RISING>,
>> +                         <GIC_SPI 469 IRQ_TYPE_EDGE_RISING>,
>> +                         <GIC_SPI 360 IRQ_TYPE_EDGE_RISING>,
>> +                         <GIC_SPI 761 IRQ_TYPE_EDGE_RISING>,
>> +                         <GIC_SPI 760 IRQ_TYPE_EDGE_RISING>,
>> +                         <GIC_SPI 605 IRQ_TYPE_EDGE_RISING>;
>> +            interrupt-names = "csid0",
>> +                              "csid1",
>> +                              "csid_lite0",
>> +                              "csid_lite1",
>> +                              "csid_lite2",
>> +                              "csid_lite3",
>> +                              "csid_lite4",
>> +                              "csiphy0",
>> +                              "csiphy1",
>> +                              "csiphy2",
>> +                              "csiphy3",
>> +                              "tpg0",
>> +                              "tpg1",
>> +                              "tpg2",
>> +                              "vfe0",
>> +                              "vfe1",
>> +                              "vfe_lite0",
>> +                              "vfe_lite1",
>> +                              "vfe_lite2",
>> +                              "vfe_lite3",
>> +                              "vfe_lite4";
>> +
>> +            interconnects = <&gem_noc MASTER_APPSS_PROC 
>> QCOM_ICC_TAG_ACTIVE_ONLY
>> +                             &config_noc SLAVE_CAMERA_CFG 
>> QCOM_ICC_TAG_ACTIVE_ONLY>,
>> +                            <&mmss_noc MASTER_CAMNOC_HF 
>> QCOM_ICC_TAG_ALWAYS
>> +                             &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
>> +            interconnect-names = "ahb",
>> +                                 "hf_0";
>> +
>> +            iommus = <&apps_smmu 0x3400 0x20>;
>> +
>> +            power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
>> +            power-domain-names = "top";
>> +
>> +            vdda-phy-supply = <&vreg_l4a_0p88>;
>> +            vdda-pll-supply = <&vreg_l1c_1p2>;
>> +
>> +            ports {
>> +                #address-cells = <1>;
>> +                #size-cells = <0>;
>> +            };
>> +        };
>> +    };
>
> Otherwise that this looks fine, please fix and then add.
>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

