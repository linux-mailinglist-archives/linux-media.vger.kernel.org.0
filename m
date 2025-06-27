Return-Path: <linux-media+bounces-36105-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 970D3AEBB65
	for <lists+linux-media@lfdr.de>; Fri, 27 Jun 2025 17:14:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A18EF6420D5
	for <lists+linux-media@lfdr.de>; Fri, 27 Jun 2025 15:13:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F8B32E9739;
	Fri, 27 Jun 2025 15:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="VQh7FIJ4"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 395182980BF;
	Fri, 27 Jun 2025 15:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751037178; cv=none; b=sm0N1aYRX4mcTiSidnYtBnxJaBSeTkMYZTu4wFa0Xj/oLkFtmn3eVl/bdDNyZqOpmRtn1C1GFUv23p+1n1t6pXHz8jbf99Rd9Q5mC969hWIb+KIHt7NPXoDZVdDgOc0o+eiUWPg2jXeUhxOw/Sb3YvJEMggXEwW9TQAvlKC9N80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751037178; c=relaxed/simple;
	bh=PBQDnVEh68pg8Wx39Iyz6I+0qXLLvHWXrc19144FHQ8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=sDg6SnZ7+jV/iHZquU0PKDIedCWbCEq2ZLOJPHtY8tYEwdN3VB1ACRRVE0KIkNFhgiHy1uZL6g8pTex8VP7z6umxfylkKzbbaJIX0bOW2z3+08xquvZFpBzz72eu8EHPiCO6BN4yLXRy4v6h+azehdxBliFHC6K2ysoDZH4pEl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=VQh7FIJ4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55RCMXEx014502;
	Fri, 27 Jun 2025 15:12:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LkqD6Xxh7BCaccaqzNW+ID2bFBalAJw/sOg6HUq77tg=; b=VQh7FIJ4IPbpeA2/
	JnpVrwqNc5Pik+2Ggn4If3ve6xlbiD7uXlnHBvPmjqyvjIwypx3MFgwfXmtNaH++
	irky5GXWz3XML71AL39ypSIrM0spFW/94qcF43la64/rwrA4Rh2Y1hDJ+U45xOMf
	moWak/JnI0R8MuwM/IcoFAcmlMN0lWix3Czl2B8AV4U62PTtPvVNdBVv/PZCoWDn
	oaJLO7EeFrItxKbCBWmzbvVhqHE2L5rWXbuANkMaCvr2fQtSwHPHH9KgSlFKY/5X
	PNi+73f5bEuqzzCED+9pB1vL2v9Uj/FzjqMqRcKiga2Qt3ru6O+w9vz/HR5jGspM
	gPocbw==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fbm25ugx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Jun 2025 15:12:53 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55RFCq0K030940
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Jun 2025 15:12:52 GMT
Received: from [10.50.11.187] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 27 Jun
 2025 08:12:48 -0700
Message-ID: <e704535c-0004-6dbd-bc81-b4ebc7747881@quicinc.com>
Date: Fri, 27 Jun 2025 20:42:45 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v5 5/5] arm64: dts: qcom: qcm2290: Add venus video node
Content-Language: en-US
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
 <2722e70a-1080-c9f3-eb56-4a6e79084bdc@quicinc.com> <aF6z7iaicHyNXg6w@trex>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <aF6z7iaicHyNXg6w@trex>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=YYu95xRf c=1 sm=1 tr=0 ts=685eb4f5 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8
 a=yrCrEQ24UeT6_aBb1b4A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: MOgSYWTi6CH3VMzGyByGCq7T-iEAocRL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDEyNCBTYWx0ZWRfX75ybbMw5ToUl
 dO8r19G/4+wfXp8uJBbTzJcRaEY1ucFNfjjoaHKwb1bGcM/G30lwxICnAhWNydZfprr4TaSLSUm
 LN+wZIeGPhVf7/9gA3Ds2NjPWF8mlsFdOTAdm78jRNQSxRJWNkvaVRLENqr+uuV0v/0GNOgba5D
 RQUFeeI3vKlgJd9t6XnHY43S9we4aJgW6pPlMUR9sZC6ZKYw85oQtnDUJtwmhaj6ktQhlH/mTvj
 exgofmEM2u8uQvBQOYljXQ+yl8tkJGN4MehyN1RSvUJBmtRONy5VJYJUf+AQcb1MnGDg0NtZiR6
 Z52uovWLCOrqwtWFTfbI0PiFPSmpVkX2jbwwCiyuiRw03wTETEPrMa8rsRcKBLOUud42IR2qYQH
 HTemtBLt2TQM5ZDK/1JCa9SNHmcTrKgbXfWdVR0i0F7AVcbTrqnfwh+sPvGUSfpUceQl885n
X-Proofpoint-ORIG-GUID: MOgSYWTi6CH3VMzGyByGCq7T-iEAocRL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_04,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 mlxlogscore=999
 clxscore=1015 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506270124


On 6/27/2025 8:38 PM, Jorge Ramirez wrote:
> On 27/06/25 20:28:29, Vikash Garodia wrote:
>>
>> On 6/27/2025 6:03 PM, Jorge Ramirez wrote:
>>> On 27/06/25 17:40:19, Vikash Garodia wrote:
>>>>
>>>> On 6/26/2025 7:29 PM, Jorge Ramirez-Ortiz wrote:
>>>>> Add DT entries for the qcm2290 venus encoder/decoder.
>>>>>
>>>>> Co-developed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
>>>>> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
>>>>> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
>>>>> ---
>>>>>  arch/arm64/boot/dts/qcom/qcm2290.dtsi | 57 +++++++++++++++++++++++++++
>>>>>  1 file changed, 57 insertions(+)
>>>>>
>>>>> diff --git a/arch/arm64/boot/dts/qcom/qcm2290.dtsi b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
>>>>> index f49ac1c1f8a3..5326c91a0ff0 100644
>>>>> --- a/arch/arm64/boot/dts/qcom/qcm2290.dtsi
>>>>> +++ b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
>>>>> @@ -1628,6 +1628,63 @@ adreno_smmu: iommu@59a0000 {
>>>>>  			#iommu-cells = <2>;
>>>>>  		};
>>>>>  
>>>>> +		venus: video-codec@5a00000 {
>>>>> +			compatible = "qcom,qcm2290-venus";
>>>>> +			reg = <0 0x5a00000 0 0xf0000>;
>>>>> +			interrupts = <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH>;
>>>>> +
>>>>> +			power-domains = <&gcc GCC_VENUS_GDSC>,
>>>>> +					<&gcc GCC_VCODEC0_GDSC>,
>>>>> +					<&rpmpd QCM2290_VDDCX>;
>>>>> +			power-domain-names = "venus",
>>>>> +					     "vcodec0",
>>>>> +					     "cx";
>>>>> +			operating-points-v2 = <&venus_opp_table>;
>>>>> +
>>>>> +			clocks = <&gcc GCC_VIDEO_VENUS_CTL_CLK>,
>>>>> +				 <&gcc GCC_VIDEO_AHB_CLK>,
>>>>> +				 <&gcc GCC_VENUS_CTL_AXI_CLK>,
>>>>> +				 <&gcc GCC_VIDEO_THROTTLE_CORE_CLK>,
>>>>> +				 <&gcc GCC_VIDEO_VCODEC0_SYS_CLK>,
>>>>> +				 <&gcc GCC_VCODEC0_AXI_CLK>;
>>>>> +			clock-names = "core",
>>>>> +				      "iface",
>>>>> +				      "bus",
>>>>> +				      "throttle",
>>>>> +				      "vcodec0_core",
>>>>> +				      "vcodec0_bus";
>>>>> +
>>>>> +			memory-region = <&pil_video_mem>;
>>>>> +			iommus = <&apps_smmu 0x860 0x0>,
>>>>> +				 <&apps_smmu 0x880 0x0>,
>>>>> +				 <&apps_smmu 0x861 0x04>,
>>>>> +				 <&apps_smmu 0x863 0x0>,
>>>>> +				 <&apps_smmu 0x804 0xe0>;
>>>> keep only the non secure ones.
>>>
>>> ok
>>>
>>>>> +
>>>>> +			interconnects = <&mmnrt_virt MASTER_VIDEO_P0 RPM_ALWAYS_TAG
>>>>> +					 &bimc SLAVE_EBI1 RPM_ALWAYS_TAG>,
>>>>> +					<&bimc MASTER_APPSS_PROC RPM_ACTIVE_TAG
>>>>> +					 &config_noc SLAVE_VENUS_CFG RPM_ACTIVE_TAG>;
>>>>> +			interconnect-names = "video-mem",
>>>>> +					     "cpu-cfg";
>>>>> +
>>>>> +			status = "okay";
>>>>> +
>>>>> +			venus_opp_table: opp-table {
>>>>> +				compatible = "operating-points-v2";
>>>>> +
>>>>> +				opp-133000000 {
>>>>> +					opp-hz = /bits/ 64 <133000000>;
>>>>> +					required-opps = <&rpmpd_opp_low_svs>;
>>>>> +				};
>>>> Fix the corner freq value
>>>
>>> can you add some reference please?
>>>
>>> I took this data from an internal document - not sure why the downstream
>>> driver supports different values or where those were taken from (AFAIK
>>> they are not supported)
>> Most likely you have referred incorrect downstream file. Refer scuba-vidc.dtsi.
> 
> I took them from actual documents (which might or might not be obsolete,
> hard to say but they were the latest version and as such, they
> contradict the downstream dtsi).
> 
> So I'd rather not use downstream - could you point me to the reference
> you used please - I wonder if the fix is required downstream instead of here?

You can look for this file gcc-scuba.c and refer gcc_video_venus_clk_src which
is the src for different venus clocks.

> 
>> Again, good reference for such cases would IP catalogues and if not, gcc driver
>> in this case which have structures defining different corners for
>> video.
> 
> The PM document for this chip only confirms two values - the other 4 ones
> claim they are not supported on 50_LT
> 
> but we can discuss offline.
> 
>>>
>>>
>>>>
>>>> Regards,
>>>> Vikash
>>>>> +
>>>>> +				opp-240000000 {
>>>>> +					opp-hz = /bits/ 64 <240000000>;
>>>>> +					required-opps = <&rpmpd_opp_svs>;
>>>>> +				};
>>>>> +			};
>>>>> +		};
>>>>> +
>>>>>  		mdss: display-subsystem@5e00000 {
>>>>>  			compatible = "qcom,qcm2290-mdss";
>>>>>  			reg = <0x0 0x05e00000 0x0 0x1000>;

