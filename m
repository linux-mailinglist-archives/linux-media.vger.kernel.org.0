Return-Path: <linux-media+bounces-28431-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 80756A67821
	for <lists+linux-media@lfdr.de>; Tue, 18 Mar 2025 16:42:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4EDC7168FB8
	for <lists+linux-media@lfdr.de>; Tue, 18 Mar 2025 15:39:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0791C20F082;
	Tue, 18 Mar 2025 15:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="HYfbISoV"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E0441A01B9;
	Tue, 18 Mar 2025 15:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742312350; cv=none; b=eTOQaRuQgPztSNx6yvfdLZLIYYGm29Qm6ywzD8dJQKjGTCcj4WU+RpZfVBodGrb8CPB+tdC/Jl3DgsnAVPBvifcbt4UALAke9D+nLKD6+u5QNWzFWTtWAXvxM1iYRlu7+ff/l9nMwmZ6VDTyH9WWfe4SnvowiJJuktY77oNQaN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742312350; c=relaxed/simple;
	bh=0kemq06UaAWn160ZWm6TTiS+n+0E4GudvzSOQ/9u8V8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=lvoERlcUr0a0Qijh8EnTcbuMec4zSLE41s8QhRjvwjjN0z7UX7lfF1g16NVB21fxqe4CmfSMNUa8QQD5gsLxJ7Ykzd9Pu38CRPlHbPCGX/ve2DoS5SZy/+qhKqeBSeIk6QOIQuoFo8cX76XhPkRSKenyNnF0Jk3hVZE6JiZvcM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=HYfbISoV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52IAq2RP010333;
	Tue, 18 Mar 2025 15:39:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Z+mdXc+A/PqwsfM8/2+Rx3Sr05A2HhjCFz/lCQ7qRxI=; b=HYfbISoVbMyFiAAU
	9cdW1nbRYoOtJlMq6IIEsUTViw9FiPvZqLoXsgLEEkKKyX0nMSeO7cpMvlHJruM2
	UbMiMuO4MYOGdFeBshW5oZq80AkhlEuWsYdgbunKDaKGYvuA7mREyURcRxRGkMe4
	JIVPZbczVmls6NbuCqusy7gKfhARpSIMQMIxxvdludMk/P6ACW+4XQDgzJOsmsQy
	g6sa1KIftpJzu6e8EoHjLy89ptwfmoPV+FtKl6r0UKz1npZEpCOE6aPQwZ5maHVU
	3qnk/XlRkmYglVGl5cKr4trc1zOCzUxjuQBJBugOfXNBa73ArHS3P16XOl+kN36j
	OLj1xw==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45exx32c5r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Mar 2025 15:39:05 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52IFd4f5026010
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Mar 2025 15:39:04 GMT
Received: from [10.216.0.149] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 18 Mar
 2025 08:38:59 -0700
Message-ID: <454bd991-f610-0e9b-82a2-ab1b17498105@quicinc.com>
Date: Tue, 18 Mar 2025 21:08:56 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 3/4] arm64: dts: qcom: sa8775p: add support for video node
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dikshita Agarwal
	<quic_dikshita@quicinc.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        "Mauro Carvalho Chehab" <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250311-dtbinding-v1-0-5c807d33f7ae@quicinc.com>
 <20250311-dtbinding-v1-3-5c807d33f7ae@quicinc.com>
 <3ec71075-b1ef-4366-b595-80fe41cd1e13@oss.qualcomm.com>
 <8f7c1c08-6776-968c-530e-b640ded940b3@quicinc.com>
 <9940290b-6b97-4339-848d-ea95a365f74c@oss.qualcomm.com>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <9940290b-6b97-4339-848d-ea95a365f74c@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=b+uy4sGx c=1 sm=1 tr=0 ts=67d99399 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=MbanHTuMWJ-pqx4aQj4A:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: MoI_QtBZ8qvV0XXbs8o9obbfo6YeNN96
X-Proofpoint-GUID: MoI_QtBZ8qvV0XXbs8o9obbfo6YeNN96
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-18_07,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 phishscore=0
 bulkscore=0 clxscore=1015 mlxlogscore=999 priorityscore=1501 mlxscore=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 adultscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503180115


On 3/18/2025 8:03 PM, Konrad Dybcio wrote:
> On 3/18/25 3:24 PM, Vikash Garodia wrote:
>>
>> On 3/15/2025 7:13 PM, Konrad Dybcio wrote:
>>> On 3/11/25 1:03 PM, Vikash Garodia wrote:
>>>> Video node enables video on Qualcomm SA8775P platform.
>>>>
>>>> Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
>>>> ---
>>>>  arch/arm64/boot/dts/qcom/sa8775p.dtsi | 67 +++++++++++++++++++++++++++++++++++
>>>>  1 file changed, 67 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
>>>> index 3394ae2d13003417a15e64c9e47833725ec779e6..09db8e2eb578f1cada0f4a15e3f844dc097bd46d 100644
>>>> --- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
>>>> +++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
>>>> @@ -10,6 +10,7 @@
>>>>  #include <dt-bindings/clock/qcom,sa8775p-dispcc.h>
>>>>  #include <dt-bindings/clock/qcom,sa8775p-gcc.h>
>>>>  #include <dt-bindings/clock/qcom,sa8775p-gpucc.h>
>>>> +#include <dt-bindings/clock/qcom,sa8775p-videocc.h>
>>>>  #include <dt-bindings/dma/qcom-gpi.h>
>>>>  #include <dt-bindings/interconnect/qcom,sa8775p-rpmh.h>
>>>>  #include <dt-bindings/mailbox/qcom-ipcc.h>
>>>> @@ -3783,6 +3784,72 @@ llcc: system-cache-controller@9200000 {
>>>>  			interrupts = <GIC_SPI 580 IRQ_TYPE_LEVEL_HIGH>;
>>>>  		};
>>>>  
>>>> +		iris: video-codec@aa00000 {
>>>> +			compatible = "qcom,sa8775p-iris";
>>>> +
>>>> +			reg = <0 0x0aa00000 0 0xf0000>;
>>>> +			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
>>>> +
>>>> +			power-domains = <&videocc VIDEO_CC_MVS0C_GDSC>,
>>>> +					<&videocc VIDEO_CC_MVS0_GDSC>,
>>>> +					<&rpmhpd SA8775P_MXC>,
>>>> +					<&rpmhpd SA8775P_MMCX>;
>>>> +			power-domain-names = "venus",
>>>> +					     "vcodec0",
>>>> +					     "mx",
>>>> +					     "mmcx";
>>>> +			operating-points-v2 = <&iris_opp_table>;
>>>> +
>>>> +			clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
>>>> +				 <&videocc VIDEO_CC_MVS0C_CLK>,
>>>> +				 <&videocc VIDEO_CC_MVS0_CLK>;
>>>> +			clock-names = "iface",
>>>> +				      "core",
>>>> +				      "vcodec0_core";
>>>> +
>>>> +			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
>>>> +					&config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ALWAYS>,
>>>
>>> This path should use QCOM_ICC_TAG_ACTIVE_ONLY on both endpoints
>> What is the advantage of "ALWAYS" vs "ACTIVE_ONLY". Thinking of a possibility of
>> APSS power collapsed, while video hardware is processing a frame ?
> 
> That's totally okay, I'm requesting ACTIVE_ONLY just on the cpu-cfg path,
> which must not be used if APSS if offline anyway
Agree on the CFG path. Will update in next version.
> 
> Konrad

