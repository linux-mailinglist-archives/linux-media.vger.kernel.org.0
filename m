Return-Path: <linux-media+bounces-31135-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D1CA5A9E6AD
	for <lists+linux-media@lfdr.de>; Mon, 28 Apr 2025 05:38:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E3C073B5ED6
	for <lists+linux-media@lfdr.de>; Mon, 28 Apr 2025 03:38:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CEF11DE4C9;
	Mon, 28 Apr 2025 03:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Xn1gKjTP"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6AE41DA617;
	Mon, 28 Apr 2025 03:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745811415; cv=none; b=AB7NGljcQbH2PJu5T7MDcR9fJgzf1V9DQCue/DJNrk38ZAjoV/xzER9AmcPO4UUu7kTwOa4RNlG/9IJrIG/vRl1rdncmwMjS/8pHIY1LwMzSlYjpfbzwFlWwtfbLx+t0tA22OMak9bLKLBbABvZLt1cmmTUKHuaMv+/Lo8Ynh8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745811415; c=relaxed/simple;
	bh=+MrxUch6bxdnk9F4Z6rEd8TJ9lmxLd5+tI0u8ijYwVw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=XHaYnzaOIC819t1MOUJSzuikGmoFtCfnkgTU9jFl48nIi1Pmh2qsLnMYrqYqybXwOAap5rQbzWv2T0ipX7DbBHfhED6BrwwykkHeD/b+8o1Fp31EcMFtDE4p3pQMofsUzvaDhlXE2XQvs205IKYXu5PyjtCA+gOKso8DOM3608M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Xn1gKjTP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53RKVhTm018434;
	Mon, 28 Apr 2025 03:36:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X3sHtR4L3+uYewQZpPX0fDuHsk1ARdQgCZJ72sppER4=; b=Xn1gKjTP/ijkljil
	tHce/JJRu+YuMGSa11aOx0LTt/P6TW1Dzzk+k9F9MBmyfe0GJpbu/YgWDdsEh1H7
	hupo6PDdYDf/h2Lz+4gAF/J2+W1s4jOsqXf5GPMffPxCULqQ5qIIbUtoyy3uLYwq
	CJVhfwH6zSX9C9LNPdbOWMqUT1e3hRfzkMNNUG7T1Gin4+GDEwJmDWmS+HMwRtMb
	3gQN9NFe8Bwbqm1PBJus2TbHj/JIG0xqAgGIwPN0qaGROQBrx9AAOBP61qnYAItH
	2bVefhOBZnegRP8tQXaJl3GGNqOJ0edakNAgrfPRsu17O7dlLCDBjngj7r6fGP3f
	HSbqnA==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468r8hnksn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Apr 2025 03:36:49 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53S3amr5019166
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Apr 2025 03:36:48 GMT
Received: from [10.216.36.164] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 27 Apr
 2025 20:36:43 -0700
Message-ID: <e638949d-befc-f181-84ee-1c8062099d35@quicinc.com>
Date: Mon, 28 Apr 2025 09:06:39 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v5 4/5] arm64: dts: qcom: qcs8300: add support for video
 node
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>
CC: Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        "Konrad Dybcio" <konradybcio@kernel.org>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250424-qcs8300_iris-v5-0-f118f505c300@quicinc.com>
 <20250424-qcs8300_iris-v5-4-f118f505c300@quicinc.com>
 <47dtgkfqcpalixg36vxcurkmh5z52kdp7rbcvwl56wsyjsisdo@ylmmrvwde4nz>
 <d8db0361-b8d9-4ed5-0f92-f66f280f62e6@quicinc.com>
 <00fb511e-80b5-494b-acce-23093932c4ad@linaro.org>
 <fcf5eb3c-a2c4-41ec-8c6b-d8aee5a9f906@linaro.org>
Content-Language: en-US
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <fcf5eb3c-a2c4-41ec-8c6b-d8aee5a9f906@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 8Nk4jiXlezy56D0CCESMkHqCkA2q8bAv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI4MDAyOSBTYWx0ZWRfX4TaRoEN8TcNq a5oN5+KC4Oq4OasNBbt3Ww0LZvFCTd7Vv5Ejxf26Y16ij9IDmplPPcMgT5Kfc4rHhYfCRpJPQ2a SqGDrczwPErFP33M9zH3BLW11RjjLZ3/t70ZG168yKIPXCVrsb4mBeCSAvAPtIW+d42J7k6GvNg
 YnaLWEg9Yb2akXbt5cFrNaCWXzXsrSfWvjL0pLWh4rNpAR7TKi+jRI9eUQ++c90tPCCbwJMWpjQ Nru2kyr3Cv+5jMzzLl/I5+kk/kS/nKoZTNcBdscxuItrrbH3t3amRm2qw16ESTiKDINVbgI4L0k GtxC/qDRLe1FRlvyuO3GsI8IFN0k4ezImFPYCgnod3raE7z3oEJjJFoG4Qo+6NeWi6VfdmL83BJ
 FbrJn45cx7gsC0wnfuG6ZF0KppwSsgHj+veFiQPz6aZ1tNVlHEBSWFWfbSFyWZdU5Y10zFcq
X-Authority-Analysis: v=2.4 cv=cfzSrmDM c=1 sm=1 tr=0 ts=680ef7d1 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=njm8HryGEHwkoIhAl8AA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 8Nk4jiXlezy56D0CCESMkHqCkA2q8bAv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_01,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=786 adultscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504280029



On 4/28/2025 3:22 AM, Bryan O'Donoghue wrote:
> On 24/04/2025 13:20, Bryan O'Donoghue wrote:
>> On 24/04/2025 11:28, Vikash Garodia wrote:
>>>
>>> On 4/24/2025 2:51 PM, Dmitry Baryshkov wrote:
>>>> On Thu, Apr 24, 2025 at 02:20:48PM +0530, Vikash Garodia wrote:
>>>>> Add the IRIS video-codec node on QCS8300.
>>>>
>>>> Nit: you can not "add support for the video node". You can either add
>>>> video node or add support for video en/decoding.
>>> Makes sense. Will wait for any other comments, before resending.
>>>
>>> Regards,
>>> Vikash
>>>>
>>>>>
>>>>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>>>> Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
>>>>> ---
>>>>>   arch/arm64/boot/dts/qcom/qcs8300.dtsi | 71 +++++++++++++++++++++++
>>>>> ++++++++++++
>>>>>   1 file changed, 71 insertions(+)
>>>>>
>>>>
>>
>> Unless you get another comment, there's no need to resend.
>>
>> I can fix the commit log for you on the way in.
>>
>> ---
>> bod
> 
> Oops this is isn't one I can fix for you - dtsi.
Will send out v6.

Regards,
Vikash
> 
> ---
> bod

