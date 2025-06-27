Return-Path: <linux-media+bounces-36103-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A7E6AEBA9A
	for <lists+linux-media@lfdr.de>; Fri, 27 Jun 2025 16:59:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B6C513AB2E1
	for <lists+linux-media@lfdr.de>; Fri, 27 Jun 2025 14:58:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E99D12E88BB;
	Fri, 27 Jun 2025 14:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="OLxcsoBe"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 861EB2E7625;
	Fri, 27 Jun 2025 14:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751036324; cv=none; b=LuHrYaxYcZDYkAdoXl4VScxDs7WZvAHv9yA6PMQT8ZjoA52ztgEsfM16QJ+REPUZ1crAlVZ9sC9U70QuMxXHXji82XVyBLXOJk6S0WCM+Rl4EbxxKZNB6Z5GMtGitGjpWTCvBAVJBDJu7zidGln1PugWYFGe08hYIDwD9lZFDGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751036324; c=relaxed/simple;
	bh=IYziUMcQc2l0WrjC52KQUdKcBdCbKEvbSAKgkqLgl0k=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=IhhiFRqAwhZLBKhKAEVsLsOiFNwZFCxFXOnI1f+CZNalS7DlFzDDjWttemiZgMRhkUGFduAoU8Vvc8gF0LyrT45830+iio76XDRrhIL761rCWsrz0PoA9fKac5eZBn0nxzsWGfRh3VcK6xvjcVtZu1HPOKFCHr/id37ZPMlb+Fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=OLxcsoBe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55RC9hO2011346;
	Fri, 27 Jun 2025 14:58:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gkweCfiBn/+1OBVWhFD+keR5SD5p17o52DoHPi+qi/o=; b=OLxcsoBeYVdb/Y/O
	+CtCVPnGX/q2dUrYIJSN7PH0dnMMrWmmUYH3O4GyGnVDiuuQgTh1ErDmwX5fwKAr
	9Gl0NRGCTY3sLiXqW2zMncXD4uN2cvBJVHkzzdRAOSNHOdRhRUrBuQmmyYqbNocK
	dJwvtBXQ9dABorfyhyfmirZ5qoNKUFAZc87gdpKbWDGzttDbVzu/sin9bUuGOLRe
	oTa81SjLfkYZOS1svyBwfyJJM/E1C5PykOjF3zgGVS8WCDlTQW5JFqRNmqCxUl77
	hHZ+c0jZtnqhFHmPk16QKbIvviiXlRrPWHnPej3geUkyrwQzI8uwrZPrwcBQfH4H
	lYN1Kw==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f3bgq5j2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Jun 2025 14:58:36 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55REwZQJ000778
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Jun 2025 14:58:35 GMT
Received: from [10.50.11.187] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 27 Jun
 2025 07:58:32 -0700
Message-ID: <2722e70a-1080-c9f3-eb56-4a6e79084bdc@quicinc.com>
Date: Fri, 27 Jun 2025 20:28:29 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v5 5/5] arm64: dts: qcom: qcm2290: Add venus video node
To: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
CC: <krzk+dt@kernel.org>, <bryan.odonoghue@linaro.org>,
        <quic_dikshita@quicinc.com>, <mchehab@kernel.org>, <robh@kernel.org>,
        <conor+dt@kernel.org>, <konradybcio@kernel.org>,
        <andersson@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250626135931.700937-1-jorge.ramirez@oss.qualcomm.com>
 <20250626135931.700937-6-jorge.ramirez@oss.qualcomm.com>
 <6e330e8f-5856-ef8e-5fe3-52bd61b59e02@quicinc.com> <aF6PqCY/E6H0Mc2/@trex>
Content-Language: en-US
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <aF6PqCY/E6H0Mc2/@trex>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: TR9uuurdnKAnQXTs1UT3iuQbljsruGFi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDEyMiBTYWx0ZWRfX4bv+H6gL7qLN
 UV8+r2XZpl77MbCuz1YnMzaLwE6dAIBv70AgVJD0OlrcteViOOjW8CQv83o+2p13JWgQmLMav3X
 AqD8TgABBGahrFBXFdeY191tUoe7ecE5xwte9MLwHWf7FEpUcwUzJjRJTeFTNAuwiAIpmHqPWvf
 +Tcj4MtLzbC6MFfkzIkg4Mmy59qFVfBjpTJkjWUNn/Nikv75NoHJIQjos1NM6fNG/w1OrRV9a0V
 gzbiviAbmNNASLd4CkYxJ+ntSKBdis60s3/YrWzSbgTJDrTH7ntMoloJcRsrGYHrSQND3HCeAo8
 DR4yrqOOAOH+sBqgutqpXIt+dP2G0mIHfd7sYHiT72g5H9jwC2DOXM0QQnNzoWE0yh8weDEHWtV
 KsErSFo5T0AhKgp+rXOHsw8apWtPCBvCZlBlVwJ2rZ31nem20nuc90e3IPFsHuxPDMcc8ny1
X-Authority-Analysis: v=2.4 cv=L4kdQ/T8 c=1 sm=1 tr=0 ts=685eb19c cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8
 a=s3_BAN2U_F-k673gM8kA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: TR9uuurdnKAnQXTs1UT3iuQbljsruGFi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_04,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 phishscore=0 mlxlogscore=999 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506270122


On 6/27/2025 6:03 PM, Jorge Ramirez wrote:
> On 27/06/25 17:40:19, Vikash Garodia wrote:
>>
>> On 6/26/2025 7:29 PM, Jorge Ramirez-Ortiz wrote:
>>> Add DT entries for the qcm2290 venus encoder/decoder.
>>>
>>> Co-developed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
>>> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
>>> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
>>> ---
>>>  arch/arm64/boot/dts/qcom/qcm2290.dtsi | 57 +++++++++++++++++++++++++++
>>>  1 file changed, 57 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/qcm2290.dtsi b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
>>> index f49ac1c1f8a3..5326c91a0ff0 100644
>>> --- a/arch/arm64/boot/dts/qcom/qcm2290.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
>>> @@ -1628,6 +1628,63 @@ adreno_smmu: iommu@59a0000 {
>>>  			#iommu-cells = <2>;
>>>  		};
>>>  
>>> +		venus: video-codec@5a00000 {
>>> +			compatible = "qcom,qcm2290-venus";
>>> +			reg = <0 0x5a00000 0 0xf0000>;
>>> +			interrupts = <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH>;
>>> +
>>> +			power-domains = <&gcc GCC_VENUS_GDSC>,
>>> +					<&gcc GCC_VCODEC0_GDSC>,
>>> +					<&rpmpd QCM2290_VDDCX>;
>>> +			power-domain-names = "venus",
>>> +					     "vcodec0",
>>> +					     "cx";
>>> +			operating-points-v2 = <&venus_opp_table>;
>>> +
>>> +			clocks = <&gcc GCC_VIDEO_VENUS_CTL_CLK>,
>>> +				 <&gcc GCC_VIDEO_AHB_CLK>,
>>> +				 <&gcc GCC_VENUS_CTL_AXI_CLK>,
>>> +				 <&gcc GCC_VIDEO_THROTTLE_CORE_CLK>,
>>> +				 <&gcc GCC_VIDEO_VCODEC0_SYS_CLK>,
>>> +				 <&gcc GCC_VCODEC0_AXI_CLK>;
>>> +			clock-names = "core",
>>> +				      "iface",
>>> +				      "bus",
>>> +				      "throttle",
>>> +				      "vcodec0_core",
>>> +				      "vcodec0_bus";
>>> +
>>> +			memory-region = <&pil_video_mem>;
>>> +			iommus = <&apps_smmu 0x860 0x0>,
>>> +				 <&apps_smmu 0x880 0x0>,
>>> +				 <&apps_smmu 0x861 0x04>,
>>> +				 <&apps_smmu 0x863 0x0>,
>>> +				 <&apps_smmu 0x804 0xe0>;
>> keep only the non secure ones.
> 
> ok
> 
>>> +
>>> +			interconnects = <&mmnrt_virt MASTER_VIDEO_P0 RPM_ALWAYS_TAG
>>> +					 &bimc SLAVE_EBI1 RPM_ALWAYS_TAG>,
>>> +					<&bimc MASTER_APPSS_PROC RPM_ACTIVE_TAG
>>> +					 &config_noc SLAVE_VENUS_CFG RPM_ACTIVE_TAG>;
>>> +			interconnect-names = "video-mem",
>>> +					     "cpu-cfg";
>>> +
>>> +			status = "okay";
>>> +
>>> +			venus_opp_table: opp-table {
>>> +				compatible = "operating-points-v2";
>>> +
>>> +				opp-133000000 {
>>> +					opp-hz = /bits/ 64 <133000000>;
>>> +					required-opps = <&rpmpd_opp_low_svs>;
>>> +				};
>> Fix the corner freq value
> 
> can you add some reference please?
> 
> I took this data from an internal document - not sure why the downstream
> driver supports different values or where those were taken from (AFAIK
> they are not supported)
Most likely you have referred incorrect downstream file. Refer scuba-vidc.dtsi.
Again, good reference for such cases would IP catalogues and if not, gcc driver
in this case which have structures defining different corners for video.
> 
> 
>>
>> Regards,
>> Vikash
>>> +
>>> +				opp-240000000 {
>>> +					opp-hz = /bits/ 64 <240000000>;
>>> +					required-opps = <&rpmpd_opp_svs>;
>>> +				};
>>> +			};
>>> +		};
>>> +
>>>  		mdss: display-subsystem@5e00000 {
>>>  			compatible = "qcom,qcm2290-mdss";
>>>  			reg = <0x0 0x05e00000 0x0 0x1000>;

