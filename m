Return-Path: <linux-media+bounces-50844-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D031D2E187
	for <lists+linux-media@lfdr.de>; Fri, 16 Jan 2026 09:35:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 647F53085043
	for <lists+linux-media@lfdr.de>; Fri, 16 Jan 2026 08:34:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F894307AC2;
	Fri, 16 Jan 2026 08:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hXabDyZ2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OvsjcRNM"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43B353033F1
	for <linux-media@vger.kernel.org>; Fri, 16 Jan 2026 08:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768552471; cv=none; b=F79RRi0iYv9I4elWDvTYSYdEK+ijE9cejiZmsTH3IH/Hlc7ZTz0F+V3qWiLKataJOHeYh3W0KN4pafiDN1p0jKLb7osthIEb/OQo3yGWU0QX7OBU7GRc8kkgvqw6WottU4LMFRTbZJTNCzb4JXRv6uji0Yk10/eXGG33EfTKdiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768552471; c=relaxed/simple;
	bh=AgvUAbPqleTF+bvSeUFP5QtroUDWiTtUGgc/oDofEmU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UxkbjgZde6UlnBNn5GlWIlvfE4l2A3RVeRDvBRkJr1F7alneb/phtShEiwaqbCnTB+4VRyO6C0GeM6tPEWPmcva20MQkB5Ta2R0HDS3ZuPjxBIocsoYtanchUCW0WUY2IVg2k8GcBeCxh5Sdv/Yt1EG+xQIyNo1LN6jETb0kEiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hXabDyZ2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OvsjcRNM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60G7txk13596324
	for <linux-media@vger.kernel.org>; Fri, 16 Jan 2026 08:34:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M09NfFq7Qcp5En4G04EchSnWL0qU/hS/cGMF+zc9G4A=; b=hXabDyZ2TBeZlXXl
	jtP4nYTQsqMYMs0HOxPMXQKxc5YWG3YEVmVG0XPQea7fMtB48UK1BccRr6uiK936
	WhJEBKipMvfECaxR9Tdd/macY8/LIVjUpElvrjSm5ujg2shuoK62Wa0X+YHnxXuR
	NcNxAU7DBYhlCysvPpB3/q5/o7EvSzgrSWzWknJcmr60KeSQ6kPKPBpUKTz1tv3Q
	DhaTBsnI40+XXZfd0FwPcWMCYOJJjAcyET/5nWzrikGtF+QmwOoCCa4Fbm9M9C26
	lifaKVDY5VbPHvQqxxGkgaXMkrXtoDt7Fs9wrkaVT8fjNCn7AzeY8TrUYOiO5C/t
	WzMOYw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq96rsdvs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 16 Jan 2026 08:34:28 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-890587d4e87so51444266d6.0
        for <linux-media@vger.kernel.org>; Fri, 16 Jan 2026 00:34:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768552467; x=1769157267; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M09NfFq7Qcp5En4G04EchSnWL0qU/hS/cGMF+zc9G4A=;
        b=OvsjcRNMTtNamHHATkeO2KDWd/q3RDcFyd5ulJzWkTpESCSy3R/exGzGXxsl1OEClk
         hsuUjIFYUGJBBCnrKg/z4aJtPXhOD0bGTDYEkRecCEs6Tr1O0Ve3Pf9ZRmDi2SVgEkg1
         PTHDd6i4qi1/JNYeHmmqWhiw5h3KCC/pyZicLIVLi/s6Cu6qElWqwNmT5LK9oAnm/26V
         kuTgztEV/TPW+Fy/+pZ7vSZ/WP9ShPQIj67cJfg69CAqOmwWYKaDZNdbkfZVq31jWwbR
         FzlPiH12Upz8L1lOpjFdAk40U5V1OsJ3W3qOveJPNBrMPZqTBHGYWfmkeY3QDAfC3ITf
         IefQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768552467; x=1769157267;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M09NfFq7Qcp5En4G04EchSnWL0qU/hS/cGMF+zc9G4A=;
        b=C7Kg/izDlpW0mESN1Jp6gJuoDcOsqnZrAFF/njHjtq9/3ob7CMp+9k4pjBMBElFduE
         Lj1jbj1oiFa1EW3+bWlVrtMz7l4PmRwjm3luHn5XEJpdAxhSer9niA8TgGQDqX1d7N/U
         2p986HGsAAbEC4zHJ/O6XQ0VlTIaHhzoqLi5SF81M+f79v9KK9vqD7MLa7uZl/Jx3HRC
         XnZS94WMycmBdMxW46pCQAEa0XT/ooMGiifTI84ckkBjRI7KMwIccsZIaS/nNUsZZ9tX
         rUzE3JWsfdvrZDI/gFW+XTvI2jS+0wsUdGQiW9wUeL24wYbMV4X5YqXsupeIzLdN40q6
         BG0A==
X-Forwarded-Encrypted: i=1; AJvYcCWqmKfQmzVPHQ7Q1+7aFsc9kx+ayV4nRl/xuYOIftLV4r+2IfE+bQ2QBi/tESgVvQAklyhj4ryL0vxyQA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzFW5lX0ieJ5y/Lri/8EJNV2E1PIdJiX6tv1XdfbFB6SWDzAE8J
	PILItqR5/ajuVyK46jOMkfboHTMrTKH3ZsnMerQtBEZQY98M+d3lBvdFjvctPavfwO1mkwu7Xy6
	ZXXDHHm7oHmANMOBEPtJONxKsIrX+pL7FdGfTIjqibD1GpFb2755BdDW62+f0qymThQ==
X-Gm-Gg: AY/fxX7szhkin2HCe3V7ofXG6GU75efAWfriFA79wK1FD6Cm+PBdzVUtpT2ny/zulkA
	JAf+fGijx+cuCt9WX7onIvuvs4VA50QnWT3FEGGEBvLJlbmXm4Uvvar4dMZLQ2sqFa/kX1nc2jn
	VPBQ2Hua2ANzO+dkBExptWUR7ztZ0WiIjCv16ZThsKkfZDLn/cnnk5o6dziv5MDXMoZ0krqFX2s
	5hmZP5n7B8kubAprZJxnL9S2HWnNlnpPd0cibmirzYZu3o75S/7IYEB9bw40vhbrsXG11hVbQrS
	iCsIL2jQ6Q/Ry6GJg73LQ1SiC0rQekfmqllbsKTo78oSFFYklA3k/iToT9+8Yt0P9AuCn49M2E3
	6JfRayzVHVRZ9sFLqtZ6WTpvsQcYJEmNFtw7AJZdOe3YoI/Vt4pBGuoMXqES8jYK137Cm5X1dJQ
	==
X-Received: by 2002:a05:6214:130e:b0:786:8f81:42f with SMTP id 6a1803df08f44-8942dd88ec0mr34294896d6.39.1768552467162;
        Fri, 16 Jan 2026 00:34:27 -0800 (PST)
X-Received: by 2002:a05:6214:130e:b0:786:8f81:42f with SMTP id 6a1803df08f44-8942dd88ec0mr34294616d6.39.1768552466704;
        Fri, 16 Jan 2026 00:34:26 -0800 (PST)
Received: from [10.111.171.115] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8942e6040casm19565916d6.21.2026.01.16.00.34.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Jan 2026 00:34:25 -0800 (PST)
Message-ID: <025cefd3-888b-4744-bde3-2d5c007db66f@oss.qualcomm.com>
Date: Fri, 16 Jan 2026 16:34:16 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/5] dt-bindings: i2c: qcom-cci: Document sm6150
 compatible
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20260115-sm6150_evk-v3-0-81526dd15543@oss.qualcomm.com>
 <20260115-sm6150_evk-v3-2-81526dd15543@oss.qualcomm.com>
 <20260116-malachite-spaniel-of-refinement-af22ae@quoll>
Content-Language: en-US
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
In-Reply-To: <20260116-malachite-spaniel-of-refinement-af22ae@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDA2MSBTYWx0ZWRfX9C1wNX0/8WF5
 kBiSByAxTuzKh8b33hQ7CkbR5ypnrRbUKFq+ffeLMT9BIlm85lQ3ilY7d5TaRfExdqsWDpnW4u8
 mJkt5B60M9icjO9mpeK4CCbxuB24nAcZkJ7jHK1kNLd781dt+eFr2kLwR+g5cC/7NOYLQAdDzBA
 zjDE34iPlOxANeEj/uRcWnplv1JldMTyN3DbZPLaFq/54dchAvcV3VHjwemgaiLi1baDBAFwRH+
 rjqK1jsFbIQLvMFmJN6ZUjYZK1N1aCt3O6Joby+qQdpIpypazEvJ+EZtmwqnRda5uJQ3VGwFBC/
 xuMvbtYmxAwUz7YH9V3oC6PMYEDM/892MLTTJCUxEKsq/nhTdvPHrkz0Dnptpjt2c5TEWdec7lZ
 BRi5MrTKOIzEe+WaHlAbf7LzIZeK5qziXUwWrxdVmX4AF2hlMXMtGIqBXJ3I/wSdC43qg+TxZGN
 a6ezzLna9TSsvBnQoVg==
X-Proofpoint-ORIG-GUID: MHMjPczIevACgdBXIStD8pMpYptuBnEd
X-Proofpoint-GUID: MHMjPczIevACgdBXIStD8pMpYptuBnEd
X-Authority-Analysis: v=2.4 cv=TsTrRTXh c=1 sm=1 tr=0 ts=6969f814 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=-6nChnoGJk84s89d4NQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_02,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601160061



On 1/16/2026 4:28 PM, Krzysztof Kozlowski wrote:
> On Thu, Jan 15, 2026 at 06:12:38PM +0800, Wenmeng Liu wrote:
>> Add the sm6150 CCI device string compatible.
>>
>> SM6150 include three clock:
>> bus: Bus clock responsible for data transfer.
>> iface: Interface clock responsible for register read and write.
>> cci: Clock for CCI core operations.
>>
>> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
>> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>> ---
>>   .../devicetree/bindings/i2c/qcom,i2c-cci.yaml          | 18 ++++++++++++++++++
>>   1 file changed, 18 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
>> index a3fe1eea6aece9685674feaa5ec53765c1ce23d8..3472670fdc908ef8f3b3afc68ff437c0435b69a7 100644
>> --- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
>> +++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
>> @@ -33,6 +33,7 @@ properties:
>>                 - qcom,sc8280xp-cci
>>                 - qcom,sdm670-cci
>>                 - qcom,sdm845-cci
>> +              - qcom,sm6150-cci
>>                 - qcom,sm6350-cci
>>                 - qcom,sm8250-cci
>>                 - qcom,sm8450-cci
>> @@ -263,6 +264,23 @@ allOf:
>>               - const: cpas_ahb
>>               - const: cci
>>   
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            enum:
>> +              - qcom,sm6150-cci
>> +    then:
>> +      properties:
>> +        clocks:
>> +          minItems: 3
>> +          maxItems: 3
>> +        clock-names:
>> +          items:
>> +            - const: bus
>> +            - const: iface
>> +            - const: cci
> 
> So basically the same as camnoc_axi+cpas_ahb+cci, so just put it into
> existing enum with qcom,sm8550-cci.
> 
> I asked for this at v1.
> https://lore.kernel.org/all/43efa6fd-53c3-4680-8aca-7b37089ca295@kernel.org/
> 
> 
> Best regards,
> Krzysztof
> 
I raised this question in the previous version.
And got reply as:


---
me:

+                       clocks = <&camcc CAM_CC_SOC_AHB_CLK>,
+                                <&camcc CAM_CC_CPAS_AHB_CLK>,
+                                <&camcc CAM_CC_CCI_CLK>;
+                       clock-names = "camnoc_axi",
+                                     "cpas_ahb",
+                                     "cci";


         clocks = <&camcc CAM_CC_SOC_AHB_CLK>,
         clock-names = "camnoc_axi";

If this is acceptable, I will update it this way in the next version.
---
Loic:

No, the idea is to name the clock from the device’s perspective.
For example, from the CCI perspective, you typically have:
- A core clock, clocking the logic, which could be named 'core' (but
'cci' here is ok)
- Clocks related to the bus interfaces (such as AHB or AXI), which
could be named 'iface...' or 'bus...'.

This approach clearly identifies the role of each clock and keeps
naming consistent, without depending on where the clock originates or
its source name.

 From that standpoint, some of the existing bus clock names defined in
qcom,i2c-cci.yaml are not ideal. You can find better naming in bindings
like qcom,i2c-qup.yaml or qcom,i2c-geni-qcom.yaml.
---


         clocks = <&camcc CAM_CC_SOC_AHB_CLK>,
         clock-names = "camnoc_axi";

so is this acceptable?


Thanks,
Wenmeng




