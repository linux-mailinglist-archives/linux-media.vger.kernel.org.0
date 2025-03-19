Return-Path: <linux-media+bounces-28459-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 045CEA68509
	for <lists+linux-media@lfdr.de>; Wed, 19 Mar 2025 07:25:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EB4F419C570B
	for <lists+linux-media@lfdr.de>; Wed, 19 Mar 2025 06:24:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0676212FBC;
	Wed, 19 Mar 2025 06:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="VVAsEcFl"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CFBB36B;
	Wed, 19 Mar 2025 06:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742365479; cv=none; b=QXuk6NC6gCSAMJSdj6MvPOBT3kf5xEi6X+DDejBtdp3UioChZnrk3B4hrbitGTIHWkZewwh0sNyfTcipRV2BGGf+hPXwWb/nof75dMQ7eFQMjSFCGcFRTNeh9tqiK77A3KCVHR0sX3AV8+fcIFBGXSOxwFw/47GMHmI2ZC6Vt8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742365479; c=relaxed/simple;
	bh=dxO06fqoNrqBRAmFBEuChTRfwFd/Xw7+EC+Z5k/dTpY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=kobaE1ylkCtQu57WJ0Q8AFQ0eHJ89djwFOckdJhrG9rosdTdeeaB9fKjxzndvcvnYs1nhWxOGBX1oaEbp82ZpT7EjIw0tNOIObAaq+KJAha0wHuOD3cM4EP3wnHsgOpYo6UxGdriwBQUNGD60lYgxxV+/JKiLD1YVysrYHSHXzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=VVAsEcFl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52J4lhKq020637;
	Wed, 19 Mar 2025 06:24:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DLLJeXXAeb93cHTkbet2VBd+/+6brCAnW2S98VPVpmA=; b=VVAsEcFlADwNg6ZT
	pokVD3K6Qv+r+mVmzWvS/+oCGkkQyTOA8ad+W2YFulttBMjLHN1r9+TGjG3Xxs25
	Hj27Ko7Xsb3Bz5UnRSNgeG0RL/UMwNNy7MJa/LA76L4yP01DXSyUL7toIwfunwJo
	thsLrFEZgghD/LqpPMVsE0jfNEllI1aDUM3s8kCjPgiSGbRj8kdNgOGMqNeY0lzN
	/CH16eUa2/Q9uB5tSjS5iFXIfLBYvpWTRUwUe2OtlO5HGym+H/I8ty/XSaZM+QjE
	EBmvMKfH+b36SD1sk2prRBQ5hvxxEgnAX52lB6tRBr3Shs7mRL5f0koo9yV/yGl0
	A5FXDw==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45exx34afj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Mar 2025 06:24:25 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52J6OO9X013506
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Mar 2025 06:24:24 GMT
Received: from [10.206.106.133] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 18 Mar
 2025 23:24:19 -0700
Message-ID: <a734ed32-00ed-43ca-a42f-5ac88e2a70c1@quicinc.com>
Date: Wed, 19 Mar 2025 11:54:16 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] media: dt-bindings: Add qcom,qcs8300-camss
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Krzysztof Kozlowski
	<krzk@kernel.org>
CC: <rfoss@kernel.org>, <todor.too@gmail.com>, <mchehab@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <andersson@kernel.org>, <konradybcio@kernel.org>,
        <hverkuil-cisco@xs4all.nl>, <cros-qcom-dts-watchers@chromium.org>,
        <catalin.marinas@arm.com>, <will@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250214094747.2483058-1-quic_vikramsa@quicinc.com>
 <20250214094747.2483058-2-quic_vikramsa@quicinc.com>
 <20250223-observant-auspicious-basilisk-d78ba9@krzk-bin>
 <66c35bce-c657-4c12-ad02-58c995ae385a@quicinc.com>
 <f2899540-f9ac-4013-a703-25800429f97d@kernel.org>
 <b1ea0500-595f-48d6-9358-649c25fd4ee9@linaro.org>
Content-Language: en-US
From: Vikram Sharma <quic_vikramsa@quicinc.com>
In-Reply-To: <b1ea0500-595f-48d6-9358-649c25fd4ee9@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=b+uy4sGx c=1 sm=1 tr=0 ts=67da6319 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=cXzS56WWJYi8bN41XdMA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: Gjaa4ABEb6ysyYpnEVV6WtC7v2Ig0r5P
X-Proofpoint-GUID: Gjaa4ABEb6ysyYpnEVV6WtC7v2Ig0r5P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-19_02,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 phishscore=0
 bulkscore=0 clxscore=1011 mlxlogscore=999 priorityscore=1501 mlxscore=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 adultscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503190042


On 3/19/2025 3:18 AM, Bryan O'Donoghue wrote:
> On 18/03/2025 07:16, Krzysztof Kozlowski wrote:
>> On 18/03/2025 06:52, Vikram Sharma wrote:
>>>
>>> On 2/23/2025 5:03 PM, Krzysztof Kozlowski wrote:
>>>> On Fri, Feb 14, 2025 at 03:17:46PM +0530, Vikram Sharma wrote:
>>>>> +properties:
>>>>> +  compatible:
>>>>> +    const: qcom,qcs8300-camss
>>>>> +
>>>>> +  reg:
>>>>> +    maxItems: 21
>>>>> +
>>>>> +  reg-names:
>>>>> +    items:
>>>>> +      - const: csid_wrapper
>>>> Why different order of entries than sm8550?
>>>
>>> Hi Krzysztof,
>>>
>>> Thanks for your review.
>>> I did this change to address a comment from Bryan on another series.
>>> https://lore.kernel.org/linux-arm-msm/e152ff78-caa5-493a-88da-96a6670eb2a2@linaro.org/ 
>>>
>>>
>>> Please suggest if I should keep the order same as sm8550?
>> If you chosen the same order as x1e80100 then it is fine, but that file
>> is not merged so it is your responsibility to track any differences and
>> be sure whatever you send is always in sync with x1e.
>>
>> Best regards,
>> Krzysztof
>
> My mistake, I hadn't realised/remembered what we merged for 8550.
>
> Vikram, please follow latest committed example @ 8550.

Thanks Bryan for conclusion on this. Will keep reference dts as 8550.

>
> ---
> bod
>
Best regards,
Vikram

