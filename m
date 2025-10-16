Return-Path: <linux-media+bounces-44738-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id DB570BE3944
	for <lists+linux-media@lfdr.de>; Thu, 16 Oct 2025 15:03:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id AD1E8507233
	for <lists+linux-media@lfdr.de>; Thu, 16 Oct 2025 13:01:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7D93335BB0;
	Thu, 16 Oct 2025 13:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H4Pu6sI6"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AA62335BA2
	for <linux-media@vger.kernel.org>; Thu, 16 Oct 2025 13:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760619679; cv=none; b=FyF2lX8/TthZD7fn8brqHJJUjN/EVHk7JSBgZBEJph1KOcjwmpVp3ItAkeGvrEbi9GzjraKc6TDYqt6A3KeB4bNBlxdTw1px1XdzWoprhk5I6FDw9VJX03a+BkfmGQADtiPgQr+bvsuKNCo1rmZ3/aCzi6TKmVRSSZ1X61/5E10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760619679; c=relaxed/simple;
	bh=qXb1XoO8Rcab2MwMwV+iHpjwImn+WrVqCpt7sZr6S+I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HHhsFnG1fBu0BAnmRsdDIrQ+n0IHVGw/iYBXz3nT26QQvqfhsNXwns0U3cm/L66xkQrskOVexbnixGBKIjPBnueHV7CxWOirTruXJu8qwMTc76wDS6XtFyMoM4qe6mWUcxQe0JK8UZG5lTLNaay/1T9VYnfn0sTT5uFCKs/0GZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H4Pu6sI6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59G6UrU8004003
	for <linux-media@vger.kernel.org>; Thu, 16 Oct 2025 13:01:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lOoCmU3FK8p4YHctcwVkp7NyEzPdsNMWVTf99V0SNrE=; b=H4Pu6sI6SfYCZoNv
	DPzGruOLqKRTVLTOaFOMP/wSawUuQWp5R4UxceBhvYN1+FUAApxbbc94dzXkZTsJ
	NU4iy4adLXNlts40YBdM7eVJtrtpK9I9ki8qDC9vDxiqEbhfeAZPsUbTWCUK8WW1
	Bx0Li/FZK63IiZv0UvPveSiB1MFgchv7bJJMZNytdUnnTZG7wh60z56eTjZiU8hi
	f9UchSdO+pMJW4hOTRq3TFniAZfqiDZvfNKIhlxfDAP/P0R+sCyY8KCZrtyxo6ot
	GaoGch/EbtJKoOyozGWzn/gC1Y65M5FkPDuvu/NJR8p07rY20ehN+35/8snnjyEB
	vYb7TA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49s6mwtmtd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 16 Oct 2025 13:01:16 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-89022a2981eso78615085a.3
        for <linux-media@vger.kernel.org>; Thu, 16 Oct 2025 06:01:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760619675; x=1761224475;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lOoCmU3FK8p4YHctcwVkp7NyEzPdsNMWVTf99V0SNrE=;
        b=oVFuj4xmFZ1Y3gCm6qNKK9TmaerueXsh7+e0LzR89P9V77ES1ABUmLp0VVIBTZHfPq
         FN6PgJIZ9WQZdvnwqgDbrDB1z9nzDyN1NIAEIXkm9Xwyng21AUYDPEwuoKCNKoLg4AX+
         iSi5+TUNvEETuxD4PScMJPNfqt3aewFFcDyrIrnOKTlnO3Po+xkHP6Dzv6twk1t4y8bZ
         rXk12tseiSlF5Ml+4UJ0KupxF3WWreYAt9b1LOKRWDA9VRBjOnQWkoSDtBmYmaUDPQbq
         MQr02bLlMHG/eJED/4UdPW7TCBxGsT6dO8XwCQn3R+De1+x7CdJHVDfH8y/eIx5xbc2f
         KOeg==
X-Gm-Message-State: AOJu0YwzHKTvL9RP0wJKXaMb5uRxNL2jeQsuSVkbBOa5bja/Sa8d7zhR
	j+hLw/ROVFZqC0LK7nuRumL9uk6vqNpvoH8FugtC+ft+DZ12ZvG0m/l4XxMBKa09z44zVosKDZe
	y3clYqaY1L8wXsi4BnN2U4ed5FkFeU8JK7zXLHEK0yQJXDz/pGQ1yU3PXLsK0JbyruQ==
X-Gm-Gg: ASbGncvTfcstztb8d+th1HavajpLxIxUO13SJn0+3iLEC7KpT7fhL5pq/WhddDxeQUL
	b/u7YsctSG8zpzXlBzUTPRlsN3xaZKvFVfRBFPJuI2LdhSI1mUw4pO9wEtiCE7MTZU4nPkpAtQJ
	IpxS2vYd510X08XCh2XlzJ8FYV+u7xOWSBFyZ1pTA8Uh7HIH0nahqJa93asDfsUAZzuDNxcbA84
	aE2ctpnuVHwbRWI/SRd4M+xAckbXKbVNFGbi2ANaS7oZZQ+YSNwpe+SOJzx0ZdaUkiTUqmKL4hC
	4B+BWQs88hwiwJ+6NPrictmO3nkUztN8Aa+QLCsJ005v9liiK9z97EPRVBCuuMDMzwhIX2ROtP2
	1XU6//V+yumdAAtokEdXkfSx6bneGSGq8f/3JUYZK+6VTFH6hkjvwbwgzhjD7A3I=
X-Received: by 2002:a05:620a:45a6:b0:852:b230:2202 with SMTP id af79cd13be357-88354ea76afmr4310590185a.49.1760619671207;
        Thu, 16 Oct 2025 06:01:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE1cYR672WhfNwRUL4xIcz1CTBk3GVUXvgO9v8Ao4Y5P8X2lqJHJSvMIx09uSEnclFHZLcREw==
X-Received: by 2002:a05:620a:45a6:b0:852:b230:2202 with SMTP id af79cd13be357-88354ea76afmr4310491085a.49.1760619663149;
        Thu, 16 Oct 2025 06:01:03 -0700 (PDT)
Received: from [10.111.161.126] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-88f38bf1f80sm190854185a.55.2025.10.16.06.00.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Oct 2025 06:01:02 -0700 (PDT)
Message-ID: <b4489d48-6ce3-4a48-a374-3852f4afc71e@oss.qualcomm.com>
Date: Thu, 16 Oct 2025 21:00:54 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] media: dt-bindings: Add qcom,sm6150-camss
To: Bryan O'Donoghue <bod@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251016-sm6150-camss-v1-0-e7f64ac32370@oss.qualcomm.com>
 <20251016-sm6150-camss-v1-1-e7f64ac32370@oss.qualcomm.com>
 <edcdb19f-619b-4dc8-b3d2-8d54c9594aeb@kernel.org>
Content-Language: en-US
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
In-Reply-To: <edcdb19f-619b-4dc8-b3d2-8d54c9594aeb@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEzMDA4MyBTYWx0ZWRfX/wvJACkkriBQ
 c8Bhtlnqxa1N4zK1Q3FJKBAw9bDfQXrCu7lUPJkAr0kThIVMq5KZ6nFpLlQKLaThR+LC8xzHdKx
 u8Xz8rqOJeCXezRbewtDAMfBoCPd3nof7RIIBo+4Tpq7bpvXCO44yxQkl/7fq6LQBMDhRuDKzbr
 pngslxmhT5QZrJZDdoRltv66NTe0lgxaVfH8csEr3SQs/Jre2tTJbxhRiUohLvgvvagAzuI0Ntu
 bhxgEjxAFnofzugGpbZ1ywuVBqe43DHBx8d3R+z5ZLApHPmSbXbNGR0HNbLUjOYmNn/YKKb0+yh
 xxbtRI1NUcNAvkf9uqXUhTSQ4MHcad8MLqynly41MmGORi11yJyIZ0pntFKL1bklzj+kXNuZKxU
 lxo0kAUGQhU84ljyLywJmBP/SAcIKA==
X-Authority-Analysis: v=2.4 cv=Fr4IPmrq c=1 sm=1 tr=0 ts=68f0ec9c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=tlDJjdemDny6dp0K7XAA:9
 a=8-qNIi-7vQFwNDMI:21 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: W-m3tmXfMpvxNxBZQ9l5GetnjpOttEXn
X-Proofpoint-ORIG-GUID: W-m3tmXfMpvxNxBZQ9l5GetnjpOttEXn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-16_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 spamscore=0 phishscore=0 malwarescore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510130083



On 10/16/2025 6:43 PM, Bryan O'Donoghue wrote:
> On 16/10/2025 11:22, Wenmeng Liu wrote:
>> Add bindings for qcom,sm6150-camss in order to support the camera
>> subsystem found in Qualcomm Talos EVK board.
> 
> Understood you are doing this to support the Talos EVK but the yaml 
> should describe the specific SoC.
> 
ACK>>
>> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
>> ---
>>   .../bindings/media/qcom,sm6150-camss.yaml          | 283 +++++++++++ 
>> ++++++++++
>>   1 file changed, 283 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/media/qcom,sm6150- 
>> camss.yaml b/Documentation/devicetree/bindings/media/qcom,sm6150- 
>> camss.yaml
>> new file mode 100644
>> index 
>> 0000000000000000000000000000000000000000..758bed0970f2ceee7df30b579a0f60d583a9230c
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/media/qcom,sm6150-camss.yaml
>> @@ -0,0 +1,283 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/media/qcom,sm6150-camss.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm SM6150 Camera Subsystem (CAMSS)
>> +
>> +maintainers:
>> +  - Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
>> +
>> +description:
>> +  The CAMSS IP is a CSI decoder and ISP present on Qualcomm platforms.
>> +
>> +properties:
>> +  compatible:
>> +    const: qcom,sm6150-camss
>> +
>> +  reg:
>> +    maxItems: 9
>> +
>> +  reg-names:
>> +    items:
>> +      - const: csid0
>> +      - const: csid1
>> +      - const: csid_lite
>> +      - const: csiphy0
>> +      - const: csiphy1
>> +      - const: csiphy2
>> +      - const: vfe0
>> +      - const: vfe1
>> +      - const: vfe_lite
>> +
>> +  clocks:
>> +    maxItems: 21
>> +
>> +  clock-names:
>> +    items:
>> +      - const: camnoc_axi
>> +      - const: cpas_ahb
>> +      - const: csiphy0
>> +      - const: csiphy0_timer
>> +      - const: csiphy1
>> +      - const: csiphy1_timer
>> +      - const: csiphy2
>> +      - const: csiphy2_timer
>> +      - const: gcc_axi_hf
>> +      - const: soc_ahb
>> +      - const: vfe0
>> +      - const: vfe0_axi
>> +      - const: vfe0_cphy_rx
>> +      - const: vfe0_csid
>> +      - const: vfe1
>> +      - const: vfe1_axi
>> +      - const: vfe1_cphy_rx
>> +      - const: vfe1_csid
>> +      - const: vfe_lite
>> +      - const: vfe_lite_cphy_rx
>> +      - const: vfe_lite_csid
>> +
>> +  interrupts:
>> +    maxItems: 9
>> +
>> +  interrupt-names:
>> +    items:
>> +      - const: csid0
>> +      - const: csid1
>> +      - const: csid_lite
>> +      - const: csiphy0
>> +      - const: csiphy1
>> +      - const: csiphy2
>> +      - const: vfe0
>> +      - const: vfe1
>> +      - const: vfe_lite
>> +
>> +  interconnects:
>> +    maxItems: 2
>> +
>> +  interconnect-names:
>> +    items:
>> +      - const: ahb
>> +      - const: hf_mnoc
>> +
>> +  iommus:
>> +    maxItems: 1
>> +
>> +  power-domains:
>> +    items:
>> +      - description: IFE0 GDSC - Image Front End, Global Distributed 
>> Switch Controller.
>> +      - description: IFE1 GDSC - Image Front End, Global Distributed 
>> Switch Controller.
>> +      - description: Titan GDSC - Titan ISP Block, Global Distributed 
>> Switch Controller.
>> +
>> +  power-domain-names:
>> +    items:
>> +      - const: ife0
>> +      - const: ife1
>> +      - const: top
>> +
>> +  vdd-csiphy-1p2-supply:
>> +    description:
>> +      Phandle to a 1.2V regulator supply to CSI PHYs.
>> +
>> +  vdd-csiphy-1p8-supply:
>> +    description:
>> +      Phandle to 1.8V regulator supply to CSI PHYs pll block.
>> +
>> +  ports:
>> +    $ref: /schemas/graph.yaml#/properties/ports
>> +
>> +    description:
>> +      CSI input ports.
>> +
>> +    patternProperties:
>> +      "^port@[0-2]+$":
>> +        $ref: /schemas/graph.yaml#/$defs/port-base
>> +        unevaluatedProperties: false
>> +
>> +        description:
>> +          Input port for receiving CSI data from a CSIPHY.
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
>> +  - vdd-csiphy-1p2-supply
>> +  - vdd-csiphy-1p8-supply
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/qcom,rpmh.h>
>> +    #include <dt-bindings/clock/qcom,qcs615-camcc.h>
>> +    #include <dt-bindings/clock/qcom,qcs615-gcc.h>
> 
> rpmh should come after qcs615.
> 
ACK>> +    #include <dt-bindings/interconnect/qcom,icc.h>
>> +    #include <dt-bindings/interconnect/qcom,qcs615-rpmh.h>
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    #include <dt-bindings/power/qcom-rpmpd.h>
>> +
>> +    soc {
>> +        #address-cells = <2>;
>> +        #size-cells = <2>;
>> +
>> +        camss: isp@acb3000 {
>> +            compatible = "qcom,sm6150-camss";
>> +
>> +            reg = <0x0 0x0acb3000 0x0 0x1000>,
>> +                  <0x0 0x0acba000 0x0 0x1000>,
>> +                  <0x0 0x0acc8000 0x0 0x1000>,
>> +                  <0x0 0x0ac65000 0x0 0x1000>,
>> +                  <0x0 0x0ac66000 0x0 0x1000>,
>> +                  <0x0 0x0ac67000 0x0 0x1000>,
>> +                  <0x0 0x0acaf000 0x0 0x4000>,
>> +                  <0x0 0x0acb6000 0x0 0x4000>,
>> +                  <0x0 0x0acc4000 0x0 0x4000>;
>> +            reg-names = "csid0",
>> +                        "csid1",
>> +                        "csid_lite",
>> +                        "csiphy0",
>> +                        "csiphy1",
>> +                        "csiphy2",
>> +                        "vfe0",
>> +                        "vfe1",
>> +                        "vfe_lite";
>> +
>> +            clocks = <&camcc CAM_CC_CAMNOC_AXI_CLK>,
>> +                     <&camcc CAM_CC_CPAS_AHB_CLK>,
>> +                     <&camcc CAM_CC_CSIPHY0_CLK>,
>> +                     <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
>> +                     <&camcc CAM_CC_CSIPHY1_CLK>,
>> +                     <&camcc CAM_CC_CSI1PHYTIMER_CLK>,
>> +                     <&camcc CAM_CC_CSIPHY2_CLK>,
>> +                     <&camcc CAM_CC_CSI2PHYTIMER_CLK>,
>> +                     <&gcc GCC_CAMERA_HF_AXI_CLK>,
>> +                     <&camcc CAM_CC_SOC_AHB_CLK>,
>> +                     <&camcc CAM_CC_IFE_0_CLK>,
>> +                     <&camcc CAM_CC_IFE_0_AXI_CLK>,
>> +                     <&camcc CAM_CC_IFE_0_CPHY_RX_CLK>,
>> +                     <&camcc CAM_CC_IFE_0_CSID_CLK>,
>> +                     <&camcc CAM_CC_IFE_1_CLK>,
>> +                     <&camcc CAM_CC_IFE_1_AXI_CLK>,
>> +                     <&camcc CAM_CC_IFE_1_CPHY_RX_CLK>,
>> +                     <&camcc CAM_CC_IFE_1_CSID_CLK>,
>> +                     <&camcc CAM_CC_IFE_LITE_CLK>,
>> +                     <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>,
>> +                     <&camcc CAM_CC_IFE_LITE_CSID_CLK>;
>> +
>> +            clock-names = "camnoc_axi",
>> +                          "cpas_ahb",
>> +                          "csiphy0",
>> +                          "csiphy0_timer",
>> +                          "csiphy1",
>> +                          "csiphy1_timer",
>> +                          "csiphy2",
>> +                          "csiphy2_timer",
>> +                          "gcc_axi_hf",
>> +                          "soc_ahb",
>> +                          "vfe0",
>> +                          "vfe0_axi",
>> +                          "vfe0_cphy_rx",
>> +                          "vfe0_csid",
>> +                          "vfe1",
>> +                          "vfe1_axi",
>> +                          "vfe1_cphy_rx",
>> +                          "vfe1_csid",
>> +                          "vfe_lite",
>> +                          "vfe_lite_cphy_rx",
>> +                          "vfe_lite_csid";
>> +
>> +            interconnects = <&gem_noc MASTER_APPSS_PROC 
>> QCOM_ICC_TAG_ACTIVE_ONLY
>> +                             &config_noc SLAVE_CAMERA_CFG 
>> QCOM_ICC_TAG_ACTIVE_ONLY>,
>> +                            <&mmss_noc MASTER_CAMNOC_HF0 
>> QCOM_ICC_TAG_ALWAYS
>> +                             &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
>> +            interconnect-names = "ahb",
>> +                                 "hf_mnoc";
>> +
>> +            interrupts = <GIC_SPI 464 IRQ_TYPE_EDGE_RISING>,
>> +                         <GIC_SPI 466 IRQ_TYPE_EDGE_RISING>,
>> +                         <GIC_SPI 468 IRQ_TYPE_EDGE_RISING>,
>> +                         <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>,
>> +                         <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>,
>> +                         <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>,
>> +                         <GIC_SPI 465 IRQ_TYPE_EDGE_RISING>,
>> +                         <GIC_SPI 467 IRQ_TYPE_EDGE_RISING>,
>> +                         <GIC_SPI 469 IRQ_TYPE_EDGE_RISING>;
>> +            interrupt-names = "csid0",
>> +                              "csid1",
>> +                              "csid_lite",
>> +                              "csiphy0",
>> +                              "csiphy1",
>> +                              "csiphy2",
>> +                              "vfe0",
>> +                              "vfe1",
>> +                              "vfe_lite";
>> +
>> +            iommus = <&apps_smmu 0x820 0x40>;
>> +
>> +            power-domains = <&camcc IFE_0_GDSC>,
>> +                            <&camcc IFE_1_GDSC>,
>> +                            <&camcc TITAN_TOP_GDSC>;
>> +            power-domain-names = "ife0",
>> +                                 "ife1",
>> +                                 "top";
>> +
>> +            vdd-csiphy-1p2-supply = <&vreg_l11a_1p2>;
>> +            vdd-csiphy-1p8-supply = <&vreg_l12a_1p8>;
>> +
>> +            ports {
>> +                #address-cells = <1>;
>> +                #size-cells = <0>;
>> +
>> +                port@0 {
>> +                    reg = <0>;
>> +                    csiphy_ep0: endpoint {
>> +                        data-lanes = <0 1>;
>> +                        remote-endpoint = <&sensor_ep>;
>> +                    };
>> +                };
>> +            };
>> +        };
>> +    };
>>
> 

will update in next version.

Thanks,
Wenmeng


