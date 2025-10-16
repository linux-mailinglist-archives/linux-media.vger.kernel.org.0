Return-Path: <linux-media+bounces-44734-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BF12FBE36D8
	for <lists+linux-media@lfdr.de>; Thu, 16 Oct 2025 14:37:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E179318917A4
	for <lists+linux-media@lfdr.de>; Thu, 16 Oct 2025 12:38:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8EFB32D43B;
	Thu, 16 Oct 2025 12:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="agGh6zVC"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89ED231A7F3;
	Thu, 16 Oct 2025 12:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760618226; cv=none; b=HyjRpQmRQ8GgIapKE134VVAUBTva3gqRBure6V4QPbo/nGq/+nyxdKddX6BpNHtwjmFP4HiSm5xGMvYd8hSbeS/TOGuiD8cS0bM/JAv+iB/RETre8vigGj3qt+C5EGSOg71Tes8BpAjFjmg18uyExp1gsHzyrgXcAossmPGmWMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760618226; c=relaxed/simple;
	bh=32reTnfzHKGiXZsNdhnNtqfOXyoH6ALaiFrWM0N17mE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=B0Nb8FVJBfApPoUFjlU61yYQNUDei0mZYec46Q3FEpQLMpVcnIvR4K7NThKjtaeQqopT24ERm9/OwazbIC6mj8Ja+eBd8Cf29LY+WuAklHFkrDYZXfytg0UPlGjUfgXK3NMubfWQbdPJ8mPrvK0v/0VeZGiv4P9hbkDucdU/wD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=qualcomm.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=agGh6zVC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59G7XShe009135;
	Thu, 16 Oct 2025 12:36:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OUbGk68HIhFedVk9DouZ2frseCIS6HxhpP93qU2HLCU=; b=agGh6zVC9lvixINR
	1qQb9FhD6DVAcpQakGhgBmCx2nxFFRZ92s99jsED5wX98HuW3baoz1ExV8Qu7L/v
	AZ0xBFPX1QDXhbDbRhl8ZMQ8mJPhsC9NuruQKoc29HrEyB8boEwOTqMgrlxXUmmx
	rf2jY/bpP0G3y3asvyrweNRRF0zIrfUIMnnqwfIZs2rxqCd6EWPRfSufiCLJLyDc
	p3UyoeErxN+VzKZUq30JD42XdtRl/akO8jCljklbEqseMZsgy3nanETgabq6/NMB
	tZTXGbdlPLQI3hid/jy0qcdJqRMagk7AVwklq9p+DW9Joa5sVMwYdYkeG2dY7CNr
	34KQPA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qg0c8511-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Oct 2025 12:36:58 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 59GCavFN027012
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Oct 2025 12:36:57 GMT
Received: from [10.64.69.186] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.24; Thu, 16 Oct
 2025 05:36:51 -0700
Message-ID: <e4be125c-752e-46c9-9637-fe23cbf04b1a@qualcomm.com>
Date: Thu, 16 Oct 2025 20:36:46 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] media: qcom: camss: add support for SM6150 camss
To: Bryan O'Donoghue <bod@kernel.org>,
        Wenmeng Liu
	<wenmeng.liu@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Todor Tomov
	<todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20251016-sm6150-camss-v1-0-e7f64ac32370@oss.qualcomm.com>
 <20251016-sm6150-camss-v1-2-e7f64ac32370@oss.qualcomm.com>
 <1d4d4627-7fe9-43b2-8622-8ffc078e30a6@kernel.org>
Content-Language: en-US
From: Wenmeng Liu <quic_wenmliu@qualcomm.com>
In-Reply-To: <1d4d4627-7fe9-43b2-8622-8ffc078e30a6@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 59Z4_yJ5nTThgVnvMJ5Ts4rWNSfjVfeu
X-Proofpoint-ORIG-GUID: 59Z4_yJ5nTThgVnvMJ5Ts4rWNSfjVfeu
X-Authority-Analysis: v=2.4 cv=eaIwvrEH c=1 sm=1 tr=0 ts=68f0e6ea cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=VZAChWguhfGkLkXIxnEA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyMiBTYWx0ZWRfX5Abb0899awlN
 KG8jPTAkY3gUmW7mAUkZrvEpLpYUH9nyD4KByn4fFsF6DkcZ41AkiNZRfKpdj6/n+nMne7hOpmM
 5/Vc+tfwl0ly3TwlwoLfYkYTh28T9I/bqgHjQlnhaDhv6M/G9rrVbROEi8KCuKpIX8sHsjV/1Hm
 7YpGkW36X9keKQwegue0LaJGz3CZj2XJAijMC2GP0XJYzbngiEKtMScr63WURAwjoKbD4K8KllW
 sweTd6bM3ksFxDQ6LbhBEXZKstQIiJoqxohbcRJREiMWOCHXwZXX3QtucHh89GUW53Tlleveo/k
 9HSmBRhBDwzgZp9H/FTlKKEzIUxPDgiQ+jRhXT5gtFFaRyF/+Sh8z6DV/KqAE79clplYw2fLQA9
 w8wbEZw8afKRYXoD5YF6SYUFmQJZEw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-16_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 clxscore=1011 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110022



On 10/16/2025 6:29 PM, Bryan O'Donoghue wrote:
> On 16/10/2025 11:22, Wenmeng Liu wrote:
>> The camera subsystem for SM6150 which is based on Spectra 230.
>>
>> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
> 
> Your commit log needs more detail.
> 
> - VFE17x version what ?
> - CSID version .. gen2 so CSID 480 is it ?
> - CSIPHY process node would be nice
> 
> 

Yes, will add more detail in next version.
For SM6150, vfe and csid version is 170(vfe170, csid170),
csiphy version is csiphy-v2.0.

>> ---
>>   .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     |   2 +
>>   drivers/media/platform/qcom/camss/camss-vfe.c      |   2 +
>>   drivers/media/platform/qcom/camss/camss.c          | 186 +++++++++++ 
>> ++++++++++
>>   drivers/media/platform/qcom/camss/camss.h          |   1 +
>>   4 files changed, 191 insertions(+)
>>
>> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c 
>> b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
>> index 
>> a229ba04b158739ddfe4076bdd28167a309f13ea..7bc524a9c4bbe3a316e366868e9d636e58d5956a 100644
>> --- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
>> +++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
>> @@ -908,6 +908,7 @@ static bool csiphy_is_gen2(u32 version)
>>       switch (version) {
>>       case CAMSS_2290:
>> +    case CAMSS_6150:
>>       case CAMSS_7280:
>>       case CAMSS_8250:
>>       case CAMSS_8280XP:
>> @@ -996,6 +997,7 @@ static int csiphy_init(struct csiphy_device *csiphy)
>>           regs->lane_array_size = ARRAY_SIZE(lane_regs_sdm845);
>>           break;
>>       case CAMSS_2290:
>> +    case CAMSS_6150:
>>           regs->lane_regs = &lane_regs_qcm2290[0];
> 
> You don't need to specify the array index for that.
> 

Here I have only added "case CAMSS_6150:", then do I need to modify the 
part of "&lane_regs_qcm2290[0]"?

>>           regs->lane_array_size = ARRAY_SIZE(lane_regs_qcm2290);
>>           break;

Best regards,
Wenmeng

B

