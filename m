Return-Path: <linux-media+bounces-23633-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F87D9F5521
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 18:55:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4181E18916F0
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 17:50:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5FAB1FBCAD;
	Tue, 17 Dec 2024 17:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="TDmhYCYa"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D2C61FAC4D;
	Tue, 17 Dec 2024 17:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734457428; cv=none; b=IrP6VnOv3x1ULamLkdq58mOW2sn3Y9eOYkM26H6scDHIMAMe3rJchV7TLWtQcdsYJscUIwTT35arxGfu9V53QshHIyEChePxKgzsNtZeq4Gtv7N2orqHPPxri31FYX+C/pT1hAasJOvXvTpgJNCKY0cEiM/4kP6kZBoM/AQNDUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734457428; c=relaxed/simple;
	bh=FYuJu3NbEe5lSnrHntXRbXVwdwGRUBBep8WKxjSMvBw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=HeinAeqUfAryUQVKF2mYt2DOkArKz9wF+G2UfCcGi+hlh0uqMFtqIxbn/xx/onAIk9n2nyIrOX4a4sxc+KNGT2AUHqL1xl0kqmF9meQ63OJ7+TVmVcYkfbo/NRHnBUEOJsiK+hp/fZjV227i7J9UuHMIwd+T6oOBjH4E9piBDn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=TDmhYCYa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BHAlers025603;
	Tue, 17 Dec 2024 17:43:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DZQQ8RH8WAsu9/QY/AVjXNavP/iYh1Mq0GWJKtUVRsE=; b=TDmhYCYa1//TzkO9
	I2WQpUMYsB+gJuPMxLHRXlMUNbDoeX5cSedCb2/3shVvdOAqC2jZY/5BrqPRPBzB
	55kw30GoDaj0eEM95Io/MpEq4XrNqM5C8Au0AUyNxdgVBy+DeemJW9prGrNKJXVK
	wZOMnqhqjUlkcOvwvLan53zsw6yie1b+bXwq18wL3GFqlaRO9QfVM9vSALcDeWIR
	eXGilIo3kFp5ts3B2+3TumzBjiVa2P1liFjeSVDpsrTlvEGgB2Qq1f2+UZtULNO8
	KKjnLgDGEZG7HdRYtynrr2KMEUVqf88q/SNloHM6KTob27Dm6HtodEN8dIZOqiFp
	2rqyyQ==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43k7v094cm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 17:43:34 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BHHhXXU007244
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 17:43:33 GMT
Received: from [10.50.34.207] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 17 Dec
 2024 09:43:24 -0800
Message-ID: <a9f99bdf-1f77-416e-a13b-83338212186d@quicinc.com>
Date: Tue, 17 Dec 2024 23:13:21 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 1/4] media: dt-bindings: update clocks for
 sc7280-camss
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Krzysztof Kozlowski
	<krzk@kernel.org>, <rfoss@kernel.org>,
        <todor.too@gmail.com>, <mchehab@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <akapatra@quicinc.com>,
        <hariramp@quicinc.com>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <hverkuil-cisco@xs4all.nl>,
        <cros-qcom-dts-watchers@chromium.org>, <catalin.marinas@arm.com>,
        <will@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel@quicinc.com>
References: <20241217140656.965235-1-quic_vikramsa@quicinc.com>
 <20241217140656.965235-2-quic_vikramsa@quicinc.com>
 <02da691b-1f5d-41a6-847c-c7e9b8239919@kernel.org>
 <c14493b0-c9d3-4e1c-9f86-991b4cb25c98@linaro.org>
 <fe28a9bc-82ef-4fef-af50-9d9261ed9b39@kernel.org>
 <a1032d53-6f3e-48f6-a2e9-1315bb1a3232@linaro.org>
Content-Language: en-US
From: Vikram Sharma <quic_vikramsa@quicinc.com>
In-Reply-To: <a1032d53-6f3e-48f6-a2e9-1315bb1a3232@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 9EzJcUqCZyXoXPWBvCz3ppG6gkV2rKR0
X-Proofpoint-ORIG-GUID: 9EzJcUqCZyXoXPWBvCz3ppG6gkV2rKR0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 mlxlogscore=999 clxscore=1015 mlxscore=0 bulkscore=0
 impostorscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412170135


On 12/17/2024 10:00 PM, Bryan O'Donoghue wrote:
> On 17/12/2024 16:23, Krzysztof Kozlowski wrote:
>> On 17/12/2024 17:12, Bryan O'Donoghue wrote:
>>> On 17/12/2024 14:10, Krzysztof Kozlowski wrote:
>>>> On 17/12/2024 15:06, Vikram Sharma wrote:
>>>>> This patch change clock names to make it consistent with
>>>>> existing platforms as gcc_cam_hf_axi -> gcc_axi_hf.
>>>>> This also adds gcc_axi_sf and remove gcc_camera_ahb.
>>>>
>>>> Don't combine ABI changes with some less important things.
>>>>
>>>> You miss here explanation why doing the ABI change in the first place.
>>>> Without that explanation I find it rather churn. But anyway, reason 
>>>> for
>>>> ABI break and impact should be documented in commit msg.
>>>>
>>>>>
>>>>> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
>>>>> ---
>>>>
>>>> Best regards,
>>>> Krzysztof
>>>
>>> This change should be fine since we haven't committed and upstream 
>>> dtsi,
>>> so there's no ABI to break yet.
>>>
>>> Agree the cover letter should have been explicit in explaining.
>>
>> So these are recently added bindings (sc7280 is not particularly new)?
>> If so mention in the commit msg that no users are affected because of 
>> this.
>>
>> Best regards,
>> Krzysztof
>
> Agreed.
>
> The commit log should make clear that the ABI hasn't been cemented yet.
>
> 20241217140656.965235-4-quic_vikramsa@quicinc.com <- is still pending
Thanks Krzysztof and Bryan.
I will update commit text to explain why ABI is not braking with this 
change.
>
> ---
> bod

