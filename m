Return-Path: <linux-media+bounces-36106-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AFAB5AEBB8A
	for <lists+linux-media@lfdr.de>; Fri, 27 Jun 2025 17:21:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0549F3AA91A
	for <lists+linux-media@lfdr.de>; Fri, 27 Jun 2025 15:20:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C4A62E8E13;
	Fri, 27 Jun 2025 15:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mH1LHRYX"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFF002D8DAF
	for <linux-media@vger.kernel.org>; Fri, 27 Jun 2025 15:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751037652; cv=none; b=pB8aMPo995rFCquZfDVbNCicncc33E8DyIcKNc9//oSWuZT7EVZmUMqBi2rL1G02PTvw+BQ1qn77lxxlRntYVhXfkKw+97DICStyoxFcY+C6NxH9TSqdF12F/vgY2JHS4M0N2NNHucDK14Ajg7o9jTMcLQNZHRCz59Eh37yzhe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751037652; c=relaxed/simple;
	bh=SmowlgYgwftaa1tGjB6GIpsGIQtJnbKf0ZX7Hg6O1Y4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aWNT8o4fFzeWKafcNcoIgiXq/axYoyqLEiYTCStfD9pCag6uSXUNngw9+TLoj5X/EQvFnvm0Q+9dPb6MwLPVAXS5Ils5D70L/HOvAG6lCxC//6qdgyzGsrn5G8Zmog3KyvjSE3oGoSC4dyzgmeob8zLEfI4ZbVHcTQz0Pj99z0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mH1LHRYX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55RC12xE014218
	for <linux-media@vger.kernel.org>; Fri, 27 Jun 2025 15:20:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mJP/7NC1EgD6Mantj/U98kyV+WF9inn7RXWXzWXfQ4E=; b=mH1LHRYXFnA6OrsN
	Ku1CNwMoOU9kr9BqAPBrGoo06RGDsg2U73MqUzC2bbhDUVRuu1pG0eNih1U2bDCD
	Ed0mnRcmgq3NfrItpyyLfaj5MfMdoLZiTMjorE8BKeE11WYEk18fqRy7zyiZ3WHs
	OMjYdRSSB55NhrP7wv5Kui1z9vKE2yluh8D8cz34WutvCpuPVFViBvWDtTFxu6xs
	Jedwe33pBMRBq0RN/woBw0zzzIVMhCcLp2Gkjp75xkcmfd/mAO7l9n/xye7ISeBm
	aRyS9l9gNh1HCPpT8xDKql1FlvxN6hH1GQiaOmb5M9vMk/uBLrpjn1XmTL/Yujrs
	J0q6eQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47emcn12rm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 27 Jun 2025 15:20:49 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d097083cc3so48637785a.3
        for <linux-media@vger.kernel.org>; Fri, 27 Jun 2025 08:20:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751037649; x=1751642449;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mJP/7NC1EgD6Mantj/U98kyV+WF9inn7RXWXzWXfQ4E=;
        b=Nkzx6CN/Bcn+yZr9ATz3LWUDOMcElOEl64an+Pg4xkZnBc+pIGOBE8k30uq+4O/jLm
         s9gQrs3Pf/sMZdn0//iNIFV5H5mNJGWGkbR+Vxd25m/OVOtMTRwa7a/CG8jRD3fJWpQx
         QMz2RCPvwtWWoDXzlH25voWN16b/lcHxGLuO5ibHkn8wlFZmIuo2rbb7CTuwsrdVIjB/
         Bt4wo52fRwmyzSj5tGY88fhkcS0G6I+Ajn16BIhpZK8EO/D6wFidXmuyRz/CYCdoO4XZ
         l7BcYJvqjJBByDD8AduVJmC4TmLUUAPFxKOjlf2t2g/BRlyQ6ZAq/e/WMB/uNJoZEwTO
         /3qw==
X-Forwarded-Encrypted: i=1; AJvYcCW91c6kpdN62qYsx9acAM6oGo2xJQOMGKMY7hWtJTNcKT+K22IeCG2Nl3nXzmvT/o2hAVHBUBfUengAxg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyMqwn/QbGNaX129FC64VQVCP+hFWt84lW2LpS0MFQpb7v5M7Vc
	1CmAKcjTbFNFWHj5lRCYl4hBOUXFS6V8P8F9tJ/Ab4uhcSavQZ7k3NDrGFnc5B//tTsTw/vjz5r
	ps1cqubkLi0Z8FiP7C+VIli0p7r3Cr6PicQt2YNc65sGia+ydvHiObD8mjmd0bOvTEw==
X-Gm-Gg: ASbGnctScDTWxhBwhmxSFODnKre4kmplT9CvKqsQStGj1T2ggM/UhJtuvcfDJP7jglC
	MqkutFsAaPcaDidwOXd8tfV1H7Wtj48iYAFowl/JqLW+3G+xw6i6MArNIYi2clNw452c9DM+9wV
	pGJVxU2B1mXBYqFVwGOrJtjpVUF2unkn2JLVIHVflBt9RgIe9y+ybbgq7D+xLVrtyvGytdbKSBB
	PkiHBcAhU92S6Y5CnB2tJBsX8tsnf526x+Xq/tGUbedS+2MdGA55mSQThEraixrGNt9ufKXoPWu
	hMtGdcbYHUhyqwG3MhVdNszda2XA6pDqgx48E3q60JopMH5JMCleqJE+mnJZVcTVUsQ2E+dFqb+
	254w=
X-Received: by 2002:a05:620a:45ac:b0:7c5:9ab7:3012 with SMTP id af79cd13be357-7d4439b767amr185725885a.11.1751037648686;
        Fri, 27 Jun 2025 08:20:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFvYr5ZAb1cByhMi5gKad8nYzi7xL26bnBk3yQVC7jOo75b6I73FUUwQBAIvCOdDq0/tcE4Hw==
X-Received: by 2002:a05:620a:45ac:b0:7c5:9ab7:3012 with SMTP id af79cd13be357-7d4439b767amr185723785a.11.1751037647943;
        Fri, 27 Jun 2025 08:20:47 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae353c01511sm137712266b.82.2025.06.27.08.20.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 08:20:47 -0700 (PDT)
Message-ID: <bac1e5e4-ed18-4e26-a883-2a41bf8468a8@oss.qualcomm.com>
Date: Fri, 27 Jun 2025 17:20:44 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/5] arm64: dts: qcom: qcm2290: Add venus video node
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
Cc: krzk+dt@kernel.org, bryan.odonoghue@linaro.org, quic_dikshita@quicinc.com,
        mchehab@kernel.org, robh@kernel.org, conor+dt@kernel.org,
        konradybcio@kernel.org, andersson@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250626135931.700937-1-jorge.ramirez@oss.qualcomm.com>
 <20250626135931.700937-6-jorge.ramirez@oss.qualcomm.com>
 <6e330e8f-5856-ef8e-5fe3-52bd61b59e02@quicinc.com> <aF6PqCY/E6H0Mc2/@trex>
 <2722e70a-1080-c9f3-eb56-4a6e79084bdc@quicinc.com> <aF6z7iaicHyNXg6w@trex>
 <e704535c-0004-6dbd-bc81-b4ebc7747881@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <e704535c-0004-6dbd-bc81-b4ebc7747881@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: jK3a9eL_bbULkz36Chn-uO6OmYwbf3s4
X-Proofpoint-ORIG-GUID: jK3a9eL_bbULkz36Chn-uO6OmYwbf3s4
X-Authority-Analysis: v=2.4 cv=J+eq7BnS c=1 sm=1 tr=0 ts=685eb6d2 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=vc-yO3o8YnYlDIzLKG0A:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDEyNSBTYWx0ZWRfX5frJPewB05Ed
 J1XmAds2vE7s2YXBzi5GYTqenX/wCgvkvx9+FsZTZV03ZvGOtoTvDygsYZD59UJxL5PRtWSByAq
 qXoxnT4D8N2YZEFJw7U7KIJ1xuABbn8sNoFaLvA895/do9v74/I+/yhVnssoz04mH1CClbuxGLG
 k05XkoPB65v7jZZ9T5wY0k3/2VBnRv/zIeKmRDB2KAf5cRPwbSX+JLhCF4LT6vixS7GUjucMhAM
 jg1/XQUAsbPELLNTjv9gEjLZItap5YF1I7zh7iTmA69MfdAq1jT9yMZx4RgxmkaiYodW2y9epuj
 tG/NEjKVKm/A7l51DkRuzc6EeOcOkl95j2lL+9qdAbWVpYLEt3TQNcnKl5H/S4cUToN5x3J4l8x
 2sepwnVBMBpgl4uc1gGgbOYZ6DTDFnWlEZn35tnmGVfHFNgHwnMrA2ojGhLXiWmTZv++LYFi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_04,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxlogscore=999 adultscore=0 impostorscore=0 clxscore=1015
 spamscore=0 malwarescore=0 phishscore=0 priorityscore=1501 suspectscore=0
 mlxscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506270125

On 6/27/25 5:12 PM, Vikash Garodia wrote:
> 
> On 6/27/2025 8:38 PM, Jorge Ramirez wrote:
>> On 27/06/25 20:28:29, Vikash Garodia wrote:
>>>
>>> On 6/27/2025 6:03 PM, Jorge Ramirez wrote:
>>>> On 27/06/25 17:40:19, Vikash Garodia wrote:
>>>>>
>>>>> On 6/26/2025 7:29 PM, Jorge Ramirez-Ortiz wrote:
>>>>>> Add DT entries for the qcm2290 venus encoder/decoder.
>>>>>>
>>>>>> Co-developed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
>>>>>> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
>>>>>> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
>>>>>> ---
>>>>>>  arch/arm64/boot/dts/qcom/qcm2290.dtsi | 57 +++++++++++++++++++++++++++
>>>>>>  1 file changed, 57 insertions(+)
>>>>>>
>>>>>> diff --git a/arch/arm64/boot/dts/qcom/qcm2290.dtsi b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
>>>>>> index f49ac1c1f8a3..5326c91a0ff0 100644
>>>>>> --- a/arch/arm64/boot/dts/qcom/qcm2290.dtsi
>>>>>> +++ b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
>>>>>> @@ -1628,6 +1628,63 @@ adreno_smmu: iommu@59a0000 {
>>>>>>  			#iommu-cells = <2>;
>>>>>>  		};
>>>>>>  
>>>>>> +		venus: video-codec@5a00000 {
>>>>>> +			compatible = "qcom,qcm2290-venus";
>>>>>> +			reg = <0 0x5a00000 0 0xf0000>;
>>>>>> +			interrupts = <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH>;
>>>>>> +
>>>>>> +			power-domains = <&gcc GCC_VENUS_GDSC>,
>>>>>> +					<&gcc GCC_VCODEC0_GDSC>,
>>>>>> +					<&rpmpd QCM2290_VDDCX>;
>>>>>> +			power-domain-names = "venus",
>>>>>> +					     "vcodec0",
>>>>>> +					     "cx";
>>>>>> +			operating-points-v2 = <&venus_opp_table>;
>>>>>> +
>>>>>> +			clocks = <&gcc GCC_VIDEO_VENUS_CTL_CLK>,
>>>>>> +				 <&gcc GCC_VIDEO_AHB_CLK>,
>>>>>> +				 <&gcc GCC_VENUS_CTL_AXI_CLK>,
>>>>>> +				 <&gcc GCC_VIDEO_THROTTLE_CORE_CLK>,
>>>>>> +				 <&gcc GCC_VIDEO_VCODEC0_SYS_CLK>,
>>>>>> +				 <&gcc GCC_VCODEC0_AXI_CLK>;
>>>>>> +			clock-names = "core",
>>>>>> +				      "iface",
>>>>>> +				      "bus",
>>>>>> +				      "throttle",
>>>>>> +				      "vcodec0_core",
>>>>>> +				      "vcodec0_bus";
>>>>>> +
>>>>>> +			memory-region = <&pil_video_mem>;
>>>>>> +			iommus = <&apps_smmu 0x860 0x0>,
>>>>>> +				 <&apps_smmu 0x880 0x0>,
>>>>>> +				 <&apps_smmu 0x861 0x04>,
>>>>>> +				 <&apps_smmu 0x863 0x0>,
>>>>>> +				 <&apps_smmu 0x804 0xe0>;
>>>>> keep only the non secure ones.
>>>>
>>>> ok
>>>>
>>>>>> +
>>>>>> +			interconnects = <&mmnrt_virt MASTER_VIDEO_P0 RPM_ALWAYS_TAG
>>>>>> +					 &bimc SLAVE_EBI1 RPM_ALWAYS_TAG>,
>>>>>> +					<&bimc MASTER_APPSS_PROC RPM_ACTIVE_TAG
>>>>>> +					 &config_noc SLAVE_VENUS_CFG RPM_ACTIVE_TAG>;
>>>>>> +			interconnect-names = "video-mem",
>>>>>> +					     "cpu-cfg";
>>>>>> +
>>>>>> +			status = "okay";
>>>>>> +
>>>>>> +			venus_opp_table: opp-table {
>>>>>> +				compatible = "operating-points-v2";
>>>>>> +
>>>>>> +				opp-133000000 {
>>>>>> +					opp-hz = /bits/ 64 <133000000>;
>>>>>> +					required-opps = <&rpmpd_opp_low_svs>;
>>>>>> +				};
>>>>> Fix the corner freq value
>>>>
>>>> can you add some reference please?
>>>>
>>>> I took this data from an internal document - not sure why the downstream
>>>> driver supports different values or where those were taken from (AFAIK
>>>> they are not supported)
>>> Most likely you have referred incorrect downstream file. Refer scuba-vidc.dtsi.
>>
>> I took them from actual documents (which might or might not be obsolete,
>> hard to say but they were the latest version and as such, they
>> contradict the downstream dtsi).
>>
>> So I'd rather not use downstream - could you point me to the reference
>> you used please - I wonder if the fix is required downstream instead of here?
> 
> You can look for this file gcc-scuba.c and refer gcc_video_venus_clk_src which
> is the src for different venus clocks.

This is not a good source in general, GCC often has more rates defined
than the consumer is supposed to finally run at (because they were deemed
power-inefficient or similar, you can pretty much set any rate you want
on the clocks fwiw)

Konrad

