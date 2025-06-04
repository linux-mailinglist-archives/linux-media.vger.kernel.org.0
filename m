Return-Path: <linux-media+bounces-34053-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 179E8ACDD72
	for <lists+linux-media@lfdr.de>; Wed,  4 Jun 2025 14:05:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CE3957A8A75
	for <lists+linux-media@lfdr.de>; Wed,  4 Jun 2025 12:04:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F13EF28EA79;
	Wed,  4 Jun 2025 12:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="PzoeOgct"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C82781DED6D;
	Wed,  4 Jun 2025 12:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749038738; cv=none; b=Sf85RcK7TJwwAwpG0Ksu8JkaZvB0eAv+BHKYeXwYcq5R99SYcrVCccVVFVTUvEWILHhAuO0QFNouFKTMsUwbpgHydWNUWG1xnDHtsDHcBgugs9SMw2WL3beHFBxUPxNnwBRaXxbrymqDfwLbcRxOSMUr0NmZk4MuvpXK57eYjDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749038738; c=relaxed/simple;
	bh=d0jYeINdY4WPRJM3V9B7OarlkOzj3p1nXsQ+TeFa250=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=rMl53WSp0oS6PTQpOqZUs8at5VPmdEqfye26lQkTxVhOw0hDVEIyvUKO3Z58Tgj6dio0qsYje1t5/xe1aeZo2M4ANk/LKuxEK9dVSRByUP/lhaFzXKzP3KKzCmS8yvI5zLMAG4w9TO923VKR3bWhTxYIXoGeD5hwJBBNxxmjNdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=PzoeOgct; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55480T0Y007627;
	Wed, 4 Jun 2025 12:05:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VoHrna9YP2EfxiDXuUk8V+6zFQ/YagPNUMtfU//Kwhc=; b=PzoeOgctBHZHuRb6
	BerSU/jc6H7EMrVvFCM2Bwe0iFNilzFIvvKc9CXYfiJmYucUqa4fz51mrTyrvCGA
	WYQ8BoyNXZqscaM+ehhURntjovp8TdC0NTXnLUM7zynhCkeJ6gra3j31O/vQrauw
	dLG14gmfJM/uf3vTJNlE02FWKbnU3tr1jPvuLqoQyFaF6AyTLbJIj5VZLHpxS8zE
	CpwgHTA9IYAijTnLgFeluomnkpJgRfUq/lPC6DIrMwICRbHibWm4l7Ommb66kGF/
	BU1g7ssh2kLFTratU4UAUhWsWGxhMLftlivqWFbwcB2CX/g5iwATaS3xgz9DcLZ9
	zlXozA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8swx5x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Jun 2025 12:05:32 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 554C5VEM020637
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 4 Jun 2025 12:05:31 GMT
Received: from [10.253.33.25] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 4 Jun 2025
 05:05:28 -0700
Message-ID: <9faff664-9717-4259-8b23-bc44e64f6947@quicinc.com>
Date: Wed, 4 Jun 2025 20:05:25 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/3] arm64: dts: qcom: qcs615: add venus node to
 devicetree
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Vikash Garodia
	<quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>
References: <20250527-add-venus-for-qcs615-v7-0-cca26e2768e3@quicinc.com>
 <20250527-add-venus-for-qcs615-v7-2-cca26e2768e3@quicinc.com>
 <429b4c99-b312-4015-8678-0371eac86de4@oss.qualcomm.com>
 <6a9e7daf-c0df-42db-b02d-96d9893afcde@quicinc.com>
 <idc4476ibh4geraklzpas5536jnwvbp6xhjjaajcdcwxicorrf@myh7kyz77rxy>
 <43e1f8db-5ab1-44ce-97c8-50910704788f@quicinc.com>
 <d6udpwmocodvlsm5ljqz7zbyonj2yahtlzmm2jjjveqrm2hmkz@andh5j4jgixr>
Content-Language: en-US
From: Renjiang Han <quic_renjiang@quicinc.com>
In-Reply-To: <d6udpwmocodvlsm5ljqz7zbyonj2yahtlzmm2jjjveqrm2hmkz@andh5j4jgixr>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=RMizH5i+ c=1 sm=1 tr=0 ts=6840368c cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8
 a=FDjDQU04mdZVipPL-u4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA0MDA5MSBTYWx0ZWRfXw4FHX4VDeXEI
 UEAFN33n2unu1RJWN+87P2H/nCVvK5TtWchNYgDkjCU3p8leIS9alfEAQiAZv5mt0eZZ9OhT2o5
 TJ8gH70cpuyGTgnDuNhwuyNuQJohgJAzR42lsX8Z1uQjyDMQiCSNF6SJIG3McCGtuD4tTLRrQDF
 49Qjui2+RxLyDP/oNTFztfSDbi5bnY7Jx3urPuN4P/DpX/U7opQHYeUscizulS2lexTwPCY9s5M
 iZSIyodpCRLpUJK6VutWsoVWhE5h6YhLyNzkkcEP22jKRRvKjTeVS/4CCc/dS1xgBNcIpdZnrZ6
 qfOlicK8Tha/rn/7ONQMw+MY46p5ypIlpkGkpCa2VX4xqbes0ktm99qcWSgSgLwBYtJDeDKu+Y8
 DCgibsFSR2s10eTuohawLukSwEI9E4wUryVevKKwIenjQojz9C45xxilAqgdrzZeYylR+2yn
X-Proofpoint-GUID: s_BbQRWeuHOt61K7SqsmzIvKHq3Y3IfU
X-Proofpoint-ORIG-GUID: s_BbQRWeuHOt61K7SqsmzIvKHq3Y3IfU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-04_03,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 adultscore=0 mlxlogscore=834 mlxscore=0
 clxscore=1015 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506040091


On 6/3/2025 9:21 PM, Dmitry Baryshkov wrote:
> On Thu, May 29, 2025 at 10:29:46AM +0800, Renjiang Han wrote:
>> On 5/28/2025 7:04 PM, Dmitry Baryshkov wrote:
>>> On Wed, May 28, 2025 at 05:13:06PM +0800, Renjiang Han wrote:
>>>> On 5/27/2025 9:57 PM, Konrad Dybcio wrote:
>>>>> On 5/27/25 5:32 AM, Renjiang Han wrote:
>>>>>> Add the venus node to the devicetree for the qcs615 platform to enable
>>>>>> video functionality. The qcs615 platform currently lacks video
>>>>>> functionality due to the absence of the venus node. Fallback to sc7180 due
>>>>>> to the same video core.
>>>>>>
>>>>>> Signed-off-by: Renjiang Han <quic_renjiang@quicinc.com>
>>>>>> ---
>>>>> [...]
>>>>>
>>>>>> +			interconnect-names = "video-mem",
>>>>>> +					     "cpu-cfg";
>>>>>> +
>>>>>> +			iommus = <&apps_smmu 0xe40 0x20>;
>>>>> fwiw docs mention 0xe60 0x20 (which result in the exact same resulting sid)
>>>> OK. Will update it with next version.
>>> How would you update this?
>> Thanks for your comments. I'll update it like this.
>> iommus = <&apps_smmu 0xe60 0x20>;
>>
>> This 0xe40 SID was based on a previous project. However, after rechecking
>> the documentation yesterday and confirming with colleagues, the correct
>> SID value should be 0xe60. I’ve also validated it on local device, it
>> works as expected. The reason 0xe40 seemed to work earlier is due to the
>> mask value being 0x20, which causes the effective SID derived from 0xe40
>> to be the same as 0xe60.
> Using 0xe60 would be counterintuitive, as we have a non-zero masked bits
> in the base value. It should be either <0xe60 0x0> or <0xe40 0x20>.

Hi Dmitry

Thank you for your comment.

I’ve followed up on this sid with a colleague from the kernel team,
and based on our discussion, it seems that the sid in this case should
be the result sid. The actual sid is 0xe60, and with a mask of 0x20,
the resulting sid would be 0xe40. Therefore, it should be <0xe40 0x20>.

@Konrad, I’d appreciate any thoughts or suggestions you might have on it.

>
-- 
Best Regards,
Renjiang


