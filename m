Return-Path: <linux-media+bounces-17636-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B8CA96CE89
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2024 07:42:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5F3B9B24739
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2024 05:41:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEF12188A1F;
	Thu,  5 Sep 2024 05:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="mMiWpch9"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EA5A79F5;
	Thu,  5 Sep 2024 05:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725514906; cv=none; b=pY+tiG9CIYGcixiHhChC+dxCAIVkCuxoLr0w7NgmDeomAna1P6cUek4uaaAEsbaSrRSqhiChDxheOyzEgca2V6hpm/bEA+ByWE6NkT9VY7uspjbTzQfekerzWXhH3T0+esipwyU5jwT9CHXpdPn00t1OZ4q2ww5ZgcuVmvUkEk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725514906; c=relaxed/simple;
	bh=7fFc1zSvjwiXncP6/ZRpa5RwYh4v2D5d2HlqTprTYrw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=YsxfRBGzHVybAUyWccjT72WBqQwwt31/Of9dUmnmb0gcBY6KL1v7ZaZ9JCzy0IaJSkmdOKcTWYbtIl4FDjtcbjK6x/8Oqsaet15Do9NXc5ovaN9tX+Xvwa8MLZaWyJLqvQowN8tAr+Zp/GUCde1VLZYR2wfxwKnz8ynZgufnIBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=mMiWpch9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 484M1ha1025039;
	Thu, 5 Sep 2024 05:41:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Qtd/Z535wUt/myw/OVUIdpGtB0U1J8fBSnU7aIFPpxI=; b=mMiWpch9AQLtW/x+
	EOMqA/697PUnLYCw2GTFliBrkPDUgOspk9AiYzy9jptJI6YsvjOwAMcq3lw9DjEh
	ftr2NrXoiLGJeXKR4u7e1QtGZAjbrJZ/AspR5yklcJcJ3Owbd6sb6lrcUNPQ3cOM
	8ISwYThUFgwd+PDsGPfUO9j5k6zq92d1adPuugAL4K7WOZsOAsPXhI3ea3c7x224
	VIO4WaV40q3FoPLegEsSaeel3HaPJyr+AQuyRxcZJXSGNmAfiY50DLZ/7sdFyezz
	gZKzCQvkGL3TCPBQxymenhxmOcs/uXs57OI12rN0YcN6CNEXJyxabAE9H/xy4bdA
	bqoNsQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41buxfcq5w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Sep 2024 05:41:36 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4855fZQF009576
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 5 Sep 2024 05:41:35 GMT
Received: from [10.216.46.64] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 4 Sep 2024
 22:41:31 -0700
Message-ID: <19a30fae-0e3b-05eb-871b-f0f131c81b9b@quicinc.com>
Date: Thu, 5 Sep 2024 11:11:28 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 01/29] dt-bindings: media: Add sm8550 dt schema
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Vikash Garodia
	<quic_vgarodia@quicinc.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        "Mauro Carvalho Chehab" <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20240827-iris_v3-v3-0-c5fdbbe65e70@quicinc.com>
 <20240827-iris_v3-v3-1-c5fdbbe65e70@quicinc.com>
 <618f4890-bdb5-48f0-b487-5123f167c322@kernel.org>
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
In-Reply-To: <618f4890-bdb5-48f0-b487-5123f167c322@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: vpixDDWCbveKs3CALTM_DbBTyRPy8G44
X-Proofpoint-ORIG-GUID: vpixDDWCbveKs3CALTM_DbBTyRPy8G44
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-05_04,2024-09-04_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 malwarescore=0
 adultscore=0 clxscore=1011 mlxlogscore=999 lowpriorityscore=0 phishscore=0
 bulkscore=0 mlxscore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2409050040



On 8/27/2024 4:12 PM, Krzysztof Kozlowski wrote:
> On 27/08/2024 12:05, Dikshita Agarwal via B4 Relay wrote:
>> From: Dikshita Agarwal <quic_dikshita@quicinc.com>
>>
>> Add a schema description for the iris video encoder/decoder
>> on sm8550.
> 
> A nit, subject: drop second/last, redundant "dt sche,a". The
> "dt-bindings" prefix is already stating that these are bindings/dt schema.
> See also:
> https://elixir.bootlin.com/linux/v6.7-rc8/source/Documentation/devicetree/bindings/submitting-patches.rst#L18
> 
> And subject is neither correct nor complete. You did not add here SM8550
> SoC, but SM8550 Iris. Plus what is SM8550? TI SM8550? Samsung SM8550?
> 
> You have entire commit subject to say briefly such details without
> repeating obvious "dt schema".
> 
Sure, will update the commit text with better description in next patch.
>>
>> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
>> ---
>>  .../bindings/media/qcom,sm8550-iris.yaml           | 162 +++++++++++++++++++++
>>  1 file changed, 162 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
>> new file mode 100644
>> index 000000000000..a7aa6a6190cf
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
>> @@ -0,0 +1,162 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm IRIS video encode and decode accelerators
> 
> IRIS or Iris? Why it is every time written differently?
> 
> If IRIS then explain the acronym in description.
> 
It should be iris, will make consistent throughout the file.
>> +
>> +maintainers:
>> +  - Vikash Garodia <quic_vgarodia@quicinc.com>
>> +  - Dikshita Agarwal <quic_dikshita@quicinc.com>
>> +
>> +description: |
> 
> Do not need '|' unless you need to preserve formatting.
> 
Ok.
>> +  The Iris video processing unit is a video encode and decode accelerator
>> +  present on Qualcomm platforms.
>> +
>> +allOf:
>> +  - $ref: qcom,venus-common.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    oneOf:
> 
> Drop oneOf
> 
This was added so that in future we can add new compatible to the list
where the same driver supports a different SOC with different compatible.
is this not the correct way of doing it?
>> +      - enum:
>> +          - qcom,sm8550-iris
>> +
>> +  power-domains:
>> +    maxItems: 4
>> +
>> +  power-domain-names:
>> +    oneOf:
> 
> Drop oneOf
>
Sure

>> +      - items:
>> +          - const: venus
>> +          - const: vcodec0
>> +          - const: mxc
>> +          - const: mmcx
>> +
>> +  clocks:
>> +    maxItems: 3
>> +
>> +  clock-names:
>> +    items:
>> +      - const: iface
>> +      - const: core
>> +      - const: vcodec0_core
>> +
>> +  interconnects:
>> +    maxItems: 2
>> +
>> +  interconnect-names:
>> +    items:
>> +      - const: cpu-cfg
>> +      - const: video-mem
>> +
>> +  resets:
>> +    maxItems: 1
>> +
>> +  reset-names:
>> +    items:
>> +      - const: bus
>> +
>> +  iommus:
>> +    maxItems: 2
>> +
>> +  dma-coherent: true
>> +
>> +  operating-points-v2: true
>> +
>> +  opp-table:
>> +    type: object
>> +
>> +required:
>> +  - compatible
>> +  - power-domain-names
>> +  - interconnects
>> +  - interconnect-names
>> +  - resets
>> +  - reset-names
>> +  - iommus
>> +  - dma-coherent
>> +
>> +unevaluatedProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/qcom,rpmh.h>
>> +    #include <dt-bindings/clock/qcom,sm8550-gcc.h>
>> +    #include <dt-bindings/clock/qcom,sm8450-videocc.h>
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    #include <dt-bindings/interconnect/qcom,icc.h>
>> +    #include <dt-bindings/interconnect/qcom,sm8550-rpmh.h>
>> +    #include <dt-bindings/power/qcom-rpmpd.h>
>> +    #include <dt-bindings/power/qcom,rpmhpd.h>
>> +
>> +    iris: video-codec@aa00000 {
> 
> Drop unused label
> 
This was referred from existing driver, if its not valid, can remove the
iris label.
>> +        compatible = "qcom,sm8550-iris";
>> +
> 
> No blank line here
Ok, will remove.
> 
>> +        reg = <0x0aa00000 0xf0000>;
>> +        interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
>> +
>> +        power-domains = <&videocc VIDEO_CC_MVS0C_GDSC>,
>> +                        <&videocc VIDEO_CC_MVS0_GDSC>,
>> +                        <&rpmhpd RPMHPD_MXC>,
>> +                        <&rpmhpd RPMHPD_MMCX>;
>> +        power-domain-names = "venus", "vcodec0", "mxc", "mmcx";
>> +
>> +        clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
>> +                 <&videocc VIDEO_CC_MVS0C_CLK>,
>> +                 <&videocc VIDEO_CC_MVS0_CLK>;
>> +        clock-names = "iface", "core", "vcodec0_core";
>> +
>> +        interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
>> +                         &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ALWAYS>,
>> +                        <&mmss_noc MASTER_VIDEO QCOM_ICC_TAG_ALWAYS
>> +                         &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
>> +        interconnect-names = "cpu-cfg", "video-mem";
>> +
>> +        memory-region = <&video_mem>;
>> +
>> +        resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>;
>> +        reset-names = "bus";
>> +
>> +        iommus = <&apps_smmu 0x1940 0x0000>,
>> +                 <&apps_smmu 0x1947 0x0000>;
>> +        dma-coherent;
>> +
>> +        operating-points-v2 = <&iris_opp_table>;
>> +
>> +        iris_opp_table: opp-table {
>> +            compatible = "operating-points-v2";
>> +
>> +            opp-240000000 {
>> +                opp-hz = /bits/ 64 <240000000>;
>> +                required-opps = <&rpmhpd_opp_svs>,
>> +                                <&rpmhpd_opp_low_svs>;
>> +            };
>> +
>> +            opp-338000000 {
>> +                opp-hz = /bits/ 64 <338000000>;
>> +                required-opps = <&rpmhpd_opp_svs>,
>> +                                <&rpmhpd_opp_svs>;
>> +            };
>> +
>> +            opp-366000000 {
>> +                opp-hz = /bits/ 64 <366000000>;
>> +                required-opps = <&rpmhpd_opp_svs_l1>,
>> +                                <&rpmhpd_opp_svs_l1>;
>> +            };
>> +
>> +            opp-444000000 {
>> +                opp-hz = /bits/ 64 <444000000>;
>> +                required-opps = <&rpmhpd_opp_turbo>,
>> +                                <&rpmhpd_opp_turbo>;
>> +            };
>> +
>> +            opp-533333334 {
>> +                opp-hz = /bits/ 64 <533333334>;
>> +                required-opps = <&rpmhpd_opp_turbo_l1>,
>> +                                <&rpmhpd_opp_turbo_l1>;
>> +           };
> 
> Fix the indentation above.
Sure, will fix.
> 
>> +        };
>> +    };
>> +...
>>
> 
> Best regards,
> Krzysztof
> 
> 

Thanks,
Dikshita

