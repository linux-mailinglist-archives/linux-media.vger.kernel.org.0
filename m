Return-Path: <linux-media+bounces-33075-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B3697AC04F5
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 08:58:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 415BB9E0B7B
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 06:58:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B965221FCF;
	Thu, 22 May 2025 06:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="n8Vi2Knm"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 760BF3BBC9;
	Thu, 22 May 2025 06:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747897103; cv=none; b=GDSsck4XUTf7Ghp23Pskaa7P519XVHkTSTFmNJBmcyG8J2GHV/frK3drKNWUGcXCdSSc8lM8dJkJ+DzQYU0SRzC+gB1+uJ8F18KWSNcRb2giFK9BAqD468Ef6lugz/mOnXQJDat9fEq6RQ6hoNvcogxfbwCWeTL9ZLO1v03Nosc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747897103; c=relaxed/simple;
	bh=/Lg3si8gVwOqnameydaJqJb5vxdiX8my8fGYMgU+abM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=OmuweK1HpUYSln2Dek3xZQUKJfWD9SG9ukQUhAkDAFJE8F+DfstZ0nirYzbu/dqadGdSkyNgFGD96NOBj+1IhUnPW+/sBlDbXyRqc47BloJKARD2F2tj2YPU06gE56ybs5AFvMLyhMO3FDOnUEx1k/1ADoi2P39y5HwNQ+/onB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=n8Vi2Knm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54LILvRm020952;
	Thu, 22 May 2025 06:58:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EF4kaG9PLnD3XpqPRg88hhQWtvSeHYMCzJ0iyi62kto=; b=n8Vi2KnmCa5kW/Pf
	T3riJW+m7FD6mFaoxjzWqmCOs+KCtaXojKbKQs9i1eR9u+GJbIFiY9qUQPqaXUWf
	3SRXscFcj60dtVkSCHOWOujCGPZiF6YkBBk616rWqu5GaAryJtChiqLcqSzw2GAc
	G23p2LfnabqIyFi6Hlmcpj66pVNAUv9Q9m1t3NuFIusi0OkLI0jfEZzxtR2iNiTS
	W3pCQsnwEKJLdotlSkqz/epHut3vVXAGdHRr0ez46NsNqu/95TGjSQNu4g8mvikt
	NxbZplU7OXPTNjgSh2h0thF8+6xUjvC5X0NlONZYYmD3Ysb+yE1tJZRHbhzXezMa
	GcEIVA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf05eus-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 May 2025 06:58:15 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54M6wFCC011711
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 May 2025 06:58:15 GMT
Received: from [10.253.12.55] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 21 May
 2025 23:58:11 -0700
Message-ID: <c7497f1e-96a3-43e1-b552-64b5811dfc5d@quicinc.com>
Date: Thu, 22 May 2025 14:58:01 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: qcs615: Enable camss for
 qcs615-adp-air
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>, <todor.too@gmail.com>,
        <rfoss@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>
References: <20250520-qcs615-adp-air-camss-v1-0-ac25ca137d34@quicinc.com>
 <20250520-qcs615-adp-air-camss-v1-2-ac25ca137d34@quicinc.com>
 <b2cf41af-756d-4e78-8df0-0350198d357d@linaro.org>
Content-Language: en-US
From: Wenmeng Liu <quic_wenmliu@quicinc.com>
In-Reply-To: <b2cf41af-756d-4e78-8df0-0350198d357d@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: x3W53ueNS4uAOt32x48xwF31_I7VWQgj
X-Proofpoint-ORIG-GUID: x3W53ueNS4uAOt32x48xwF31_I7VWQgj
X-Authority-Analysis: v=2.4 cv=ZP3XmW7b c=1 sm=1 tr=0 ts=682ecb07 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8
 a=enoOy_T-X7bchgmFXmcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDA2NyBTYWx0ZWRfXxQfw2ho2BEKq
 80JZOPNrqWLzU4K/bd1OuXWJppT+ubHVsC9K2Q2PYkajPgvm7vkSPBCfiwqTc397GoGQ6VowQPb
 +UsoApnZ3euhMQb7doQ3K6R/dGdL/IrJyDw4HzhpnW/x8mpukvdDeoY74B/Cr2HCjlR1DTAflsZ
 EvBmDKrCKdiV0TJ1IoayxtXVwyyBw1oXw5gb4oVrNlgo0PheAMjxXDtIRebLdDUd/sPe0M+abYm
 QhiIb41KZqRzipQfY9qeRiXS04x8qXA1rCzOO8AfVU5yOEXv+gGmvltQtzEfbb+/xaql+z8tIuQ
 WLm+TiZBEJhmmJXtJj/tGSEEBXgWNXFemrji8Ex+vqkahfRrwxhGu3heE48mqJZsoEpdPv6DV80
 vlanZha8CoKCMGhKQ4jsD92/f2vYMnZJz/fhFlbdlG2mbOfe/XaO7vH/cUo9qPtU/eOrLy1o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_03,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 mlxlogscore=961 suspectscore=0 bulkscore=0
 impostorscore=0 phishscore=0 spamscore=0 mlxscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505220067



On 2025/5/21 21:07, Bryan O'Donoghue wrote:
> On 20/05/2025 09:56, Wenmeng Liu wrote:
>> This change enables camera driver for QCS615 ADP AIR board.
>>
>> Signed-off-by: Wenmeng Liu <quic_wenmliu@quicinc.com>
>> ---
>>   arch/arm64/boot/dts/qcom/qcs615-ride.dts | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/ 
>> boot/dts/qcom/qcs615-ride.dts
>> index 
>> 2b5aa3c66867676bda59ff82b902b6e4974126f8..be8b829ec508d7de7a4cd6be6d1d4e83b09734bb 100644
>> --- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
>> +++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
>> @@ -211,6 +211,13 @@ vreg_l17a: ldo17 {
>>       };
>>   };
>> +&camss {
>> +    vdda-phy-supply = <&vreg_l5a>;
>> +    vdda-pll-supply = <&vreg_l12a>;
>> +
>> +    status = "ok";
>> +};
>> +
>>   &gcc {
>>       clocks = <&rpmhcc RPMH_CXO_CLK>,
>>            <&rpmhcc RPMH_CXO_CLK_A>,
>>
> 
> I think there's some confusion.
> 
> I'm willing to accept CSID and VFE changes with the minimum proof of TPG 
> driving it.
> 
> But - CSIPHY in CAMSS which is only proven by TPG is obviously not a 
> proof and again I agree with the consensus here - there's little value 
> to an end-user in just having the TPG for a camera.
> 
> No sensor:
> CAMSS::CSID
> CAMSS::VFE
> 
> Just about acceptable
> 
> No sensor:
> CAMSS::CSIPHY
> DTS::CAMSS enable
> 
> Is too much of an ask.
> 
> Just publish your sensor code ! We need more sensor enablement upstream 
> anyway.
> 
> ---
> bod


Hi bryan,

I will upload the sensor code together in the next version.

Thanks,
Wenmeng


