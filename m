Return-Path: <linux-media+bounces-32891-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A99E9ABD42C
	for <lists+linux-media@lfdr.de>; Tue, 20 May 2025 12:06:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CC59E1BA0D64
	for <lists+linux-media@lfdr.de>; Tue, 20 May 2025 10:06:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBAE526A1AF;
	Tue, 20 May 2025 10:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="hK/CVbQK"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6294F1DA61B;
	Tue, 20 May 2025 10:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747735577; cv=none; b=Y/iPWNBNzNjMlJ5XUrQz7gTd2uPfTqYzmGVrrusgSsP5aOVDvR6HhpGdQtkX21E2VDjvZb628AQZXbNDhAlu5OfL84N/qQJztP3XT3cFOPafZHkX3G8Y3Q1g4D0ngdsfJLnP08ctdu6UOyyMC04dQ8gPv4DnMAOCt1R0bRw5tkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747735577; c=relaxed/simple;
	bh=5HGG96sR50qBMFKjH4JLAfCrzk2f8PlejJm9E9I6rVg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=WqpF2+4TIprzcva3qiYHlaxCy/oZLp7J9P5/dPS5e5pAcgZ+skC+K3vRFVS7hrlAiL/7VAkXesA2CHotG60uoajaqhjxHL+frUIsBlKbOUeAZs2QBWxd41NDF6VRjSeTFV7SwGYDIqCOXzZs7N1L8pBQxSkUr0w953tWV1esQWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=hK/CVbQK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54K6sp35002440;
	Tue, 20 May 2025 10:06:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r1KNAJY3aLWyKXm+mLJG7J0OW+d01MKlpgcVNELfy9Y=; b=hK/CVbQKhyOj0pQD
	R67SctE4lXzP5QVwRIoI0WSHCkChwZ02LnQEMOfUxYFXDkIlpthTdOfdfasmTAGm
	o7AWmrLYZw4GJX10aVHF/yb5vlj/ZQbF88KxO3h29hwlzNs+f8gMZwwX2Ijeor98
	B35UrDmAFe1eUCFmHOJhgwD15TbOt/B807+lEC/tZPEWJna9by3yz/E6RmAG5S9i
	48uFm5/mj/tQ/4MM5a1UBQI1d4TzTVyrS/GBO6kZ9HEp8QeXngW1ccrMVTu/vHtb
	uQ7qaPpBmP0n+MnUGU332oCZECA30vnnP4XPxiAbqMgEYJa8YQILOuwbvCzuL5Zp
	2wRVOw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46r1atkn99-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 May 2025 10:06:08 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54KA679o022759
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 May 2025 10:06:07 GMT
Received: from [10.253.11.26] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 20 May
 2025 03:06:02 -0700
Message-ID: <c0cbed41-2f9b-4058-a6b0-c0180086040d@quicinc.com>
Date: Tue, 20 May 2025 18:06:00 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: qcs615: Enable camss for
 qcs615-adp-air
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>, <bryan.odonoghue@linaro.org>,
        <todor.too@gmail.com>, <rfoss@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>
References: <20250520-qcs615-adp-air-camss-v1-0-ac25ca137d34@quicinc.com>
 <20250520-qcs615-adp-air-camss-v1-2-ac25ca137d34@quicinc.com>
 <19efba52-7cb4-4c7e-9c97-779214d3ea2a@kernel.org>
Content-Language: en-US
From: Wenmeng Liu <quic_wenmliu@quicinc.com>
In-Reply-To: <19efba52-7cb4-4c7e-9c97-779214d3ea2a@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=OfqYDgTY c=1 sm=1 tr=0 ts=682c5410 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8
 a=COk6AnOGAAAA:8 a=rlooa1Aa0xMcXynD98YA:9 a=QEXdDO2ut3YA:10
 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: weHgOEQ1mVTd3hceqZZCwFdb83Jr49zM
X-Proofpoint-GUID: weHgOEQ1mVTd3hceqZZCwFdb83Jr49zM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDA4MiBTYWx0ZWRfX8VSBQBMvRBlt
 HAcRleFD5V0KRMJ12+wXAcwXL6LzenBbtcyXb22owV8BYVw//waMmtl/3HIAWa3m3w39R0QYUAx
 OiJ9y4Falp0d8iSClFlIHeVruYL464t6PPVXPnn0wPmc0IeNF6/9vcPk+2pzGVfqkYIOYAmxs7N
 nDYLeul8Cr8hp3q380p0twjTUkJjAyFgp3diE8eWdRbNVGXjIF1X6OBlpRnMZsc/A9BOj+wMWnY
 Lpkoa505Co0Fq7DJeqmtLkCG8DYczIOnBFNqo+HAubhc7dZL9tINHB18pFgLXKf0quaLVfyFETx
 PpPVqUwP8ZH+ZJZv9jKwMDJyUo5AWz3bz6Ml3nsHB7dz0BhZ0Y5eqpvMN2HHOjInTJWMVu/2vgE
 kfEEIxgEtzkyYvsikAPowkZIWL+gqxph2XGsr0Q7Q8AgeNh5VtanuP2iQB6d2awl68cW/nvC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_04,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 mlxscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 priorityscore=1501 spamscore=0 mlxlogscore=993
 clxscore=1011 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505200082



On 2025/5/20 17:44, Krzysztof Kozlowski wrote:
> On 20/05/2025 10:56, Wenmeng Liu wrote:
>> This change enables camera driver for QCS615 ADP AIR board.
>>
>> Signed-off-by: Wenmeng Liu <quic_wenmliu@quicinc.com>
>> ---
>>   arch/arm64/boot/dts/qcom/qcs615-ride.dts | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
>> index 2b5aa3c66867676bda59ff82b902b6e4974126f8..be8b829ec508d7de7a4cd6be6d1d4e83b09734bb 100644
>> --- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
>> +++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
>> @@ -211,6 +211,13 @@ vreg_l17a: ldo17 {
>>   	};
>>   };
>>   
>> +&camss {
>> +	vdda-phy-supply = <&vreg_l5a>;
>> +	vdda-pll-supply = <&vreg_l12a>;
>> +
>> +	status = "ok";
> Standard qcom comment...
> 
> It does not look like you tested the DTS against bindings. Please run
> `make dtbs_check W=1` (see
> Documentation/devicetree/bindings/writing-schema.rst or
> https://www.linaro.org/blog/tips-and-tricks-for-validating-devicetree-sources-with-the-devicetree-schema/
> for instructions).
> Maybe you need to update your dtschema and yamllint. Don't rely on
> distro packages for dtschema and be sure you are using the latest
> released dtschema.
> 
> Best regards,
> Krzysztof

Hi Krzysztof

I only used the CAMSS dt-bindings to check the DTS. Will pay more 
attention to it next time.

Thanks,
Wenmeng



