Return-Path: <linux-media+bounces-42165-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BB73B511D0
	for <lists+linux-media@lfdr.de>; Wed, 10 Sep 2025 10:52:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 667BC1B26FE1
	for <lists+linux-media@lfdr.de>; Wed, 10 Sep 2025 08:52:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE8A4311C1D;
	Wed, 10 Sep 2025 08:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="dKE0V2m9"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90777304BC6;
	Wed, 10 Sep 2025 08:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757494334; cv=none; b=HM9IQUO4kD3x8w3CIh7G/Qn5Y6xEDqrnyTokEpSgYSrZ9qRJ0EkAdqhe6/XyhfjnqjmeXGvOk0pEolrreUVo4kSukUDERB0MjPLuN13/jlt+GPC/kuzCFwgK2Zw++/tMp7J2blvv000NJ261jFITlVdp627kyGc9vJzq+sDqEFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757494334; c=relaxed/simple;
	bh=PIVojudKKyT0xUQt36OqUTDvdmtlnMQ9WVblau9a+jQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=rn23WYc3PTDIeAgPgedGWtSmKNvd71vBltm88wTn2wUl9w2PPQy34B6Wepee9BGBnrDTWu8Rw6nZVB5DUgEHjAF8LEmO7D+E4MhazmLUd4WaW3RQL5sVSlElBzA25xEFORQVMAh9O9Qhn4swY15jk18FcR+SgKxa8yfuSBoehyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=dKE0V2m9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58A7ciZu013177;
	Wed, 10 Sep 2025 08:52:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0rZKk715MphIl7qDOALZG/NuLOCsWV14GwxWgqDzjhg=; b=dKE0V2m9R2nwMVbN
	W9nbBEMIAVNN/MT7gxZmOS/yX8u/B506G4ywRCUP3zU/mWvfF4uePGNg8VShdXjm
	b3vtXWa5xPvWUnk3TXX1kRo3ObZfozujxW8iet1KSDq5sUKf8M5ElrvmWJWDa/pQ
	SUVmHu1jE/T4zvGzfH6PtQdeEho3DgiuE8kDkM1WYHxvv7O/8Zvp2N7hc4KP9Nf4
	PLtXqSMqRQnnRqitGMJHyBAwZnSb5OYGZG9HNxhCENv3SsYtx/RkfuXV/69slgV7
	v+ov7j8Vrgup3IsuN+LVRYqpipDtohTnj09Pn2ZofIgNBon8ALOElL1heHK2M+8E
	7Z7r1w==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490by9391v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Sep 2025 08:52:01 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 58A8q0Q9029592
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Sep 2025 08:52:00 GMT
Received: from [10.204.66.168] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.24; Wed, 10 Sep
 2025 01:51:55 -0700
Message-ID: <0519a8ce-9edf-4510-ada2-f8ac997142cf@quicinc.com>
Date: Wed, 10 Sep 2025 14:21:52 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/7] media: dt-bindings: Add qcom,qcs8300-camss
 compatible
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Krzysztof Kozlowski
	<krzk@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        <rfoss@kernel.org>, <todor.too@gmail.com>, <mchehab@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <andersson@kernel.org>, <konradybcio@kernel.org>,
        <hverkuil-cisco@xs4all.nl>, <cros-qcom-dts-watchers@chromium.org>,
        <catalin.marinas@arm.com>, <will@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250813053724.232494-1-quic_vikramsa@quicinc.com>
 <20250813053724.232494-2-quic_vikramsa@quicinc.com>
 <f1e3c3a9-9929-477a-b1ad-e485c059cbc2@linaro.org>
 <d16d40ab-8a35-4886-b11f-2eee15849e1c@quicinc.com>
 <8c1163ad-6e65-450b-ae44-c9a71a045333@kernel.org>
 <c7635e11-d606-4e65-b48e-d8c26ee7be1d@linaro.org>
Content-Language: en-US
From: Vikram Sharma <quic_vikramsa@quicinc.com>
In-Reply-To: <c7635e11-d606-4e65-b48e-d8c26ee7be1d@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=Yv8PR5YX c=1 sm=1 tr=0 ts=68c13c31 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8
 a=KKAkSRfTAAAA:8 a=OqfOb5s0SZ9nmLY6dkYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: fCr68L5rnFUi9sB9RN9zGByK1whVVHQy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAxOCBTYWx0ZWRfX/AZSDUi394aH
 PDhdEK863RkwanZgf9uhCl6xqFAXCruwjh5vNL8c2+Mvj2BPywdlf775yA9/XvqsNbfDN1HGLcR
 TQbHpVX5HDMrzN5cNvRKellQwSK8iavDnhaSntF7Ez3ipNmDLh8KHYtP2FVQP3XDLBvUdmGWUnV
 eCCcIsKWyDUWzzXUaf8CwJV3YvFujn1X0R03aGNxeg7NkzF3zRtXhLjvc7dwz4J2KzG8L5JIV+I
 tJEucaOa/HkM/B2Nk4d0/44+iW4pc854iSRWfzdxoVXmeF2z6tF+1a7Vk9mrNJPz/AcAs+RZ22I
 qUrn6fTeBg68i89nVUWMC0A4uQp4Ei39vD3xG7+n4Fi/npgbQCXqRbzrfrxG0aap4WGP+EVu/1O
 IU79dXkd
X-Proofpoint-ORIG-GUID: fCr68L5rnFUi9sB9RN9zGByK1whVVHQy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_03,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060018


On 9/10/2025 2:12 PM, Bryan O'Donoghue wrote:
> On 10/09/2025 08:42, Krzysztof Kozlowski wrote:
>> On 10/09/2025 09:26, Vikram Sharma wrote:
>>>
>>> On 9/10/2025 12:35 PM, Krzysztof Kozlowski wrote:
>>>> On 13/08/2025 07:37, Vikram Sharma wrote:
>>>>> Add the compatible string "qcom,qcs8300-camss" to support the
>>>>> Camera Subsystem (CAMSS) on the Qualcomm QCS8300 platform.
>>>>>
>>>>> The QCS8300 platform provides:
>>>>> - 2 x VFE (version 690), each with 3 RDI
>>>>> - 5 x VFE Lite (version 690), each with 6 RDI
>>>>> - 2 x CSID (version 690)
>>>>> - 5 x CSID Lite (version 690)
>>>>> - 3 x CSIPHY (version 690)
>>>>> - 3 x TPG
>>>>>
>>>>> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
>>>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>>> ---
>>>>>    .../bindings/media/qcom,qcs8300-camss.yaml    | 336 
>>>>> ++++++++++++++++++
>>>>>    1 file changed, 336 insertions(+)
>>>> So it turns out this code is wrong and you already sent fixes for it.
>>>
>>> Hi Krzysztof,
>>> Thanks for your comments. These bindings are tested with TPG (Test 
>>> Pattern Generator), As camera sensor testing was not possible at 
>>> that point.
>>
>> You cannot test bindings with TPG. It's impossible.
>>
>>> This is because Monaco-evk kit was not ready which can be used to 
>>> enable sensor.
>>>
>>> These Bindings are complete in its own, If someone want to use TPG.
>>
>> No. You do not understand - they are not complete if you add new
>> properties to them!
>>
>> How bindings could be complete if you add now supplies!?!?
Got it, Will post an updated version of this adding supplies and 
removing your RB.
>>
>>>
>>> My latest update in these bindings are for camera sensor enablement 
>>> which needs supplies too.
>>>
>>> Please let me know if this justification works to accept these 
>>> bindings it its current form and add supplies as a separate patch.
>>
>> NAK. Read writing bindings doc. Or internal docs.
>>
>> Best regards,
>> Krzysztof
>
> @Vikram
>
> Could you send an updated dt-bindings with the supplies included ASAP 
> as a v4 of this series ?
on it, Will Remove your RB and send v3.1 for this patch
>
> The -supplies in your email here look fine
>
> 20250909114241.840842-5-quic_vikramsa@quicinc.com
>
> Otherwise we will have to drop this binding and the associated driver 
> changes.
>
> ---
> bod

Best regards,

Vikram


