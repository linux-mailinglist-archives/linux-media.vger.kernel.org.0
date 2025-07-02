Return-Path: <linux-media+bounces-36559-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB1CDAF1508
	for <lists+linux-media@lfdr.de>; Wed,  2 Jul 2025 14:08:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 78DFD3B16BC
	for <lists+linux-media@lfdr.de>; Wed,  2 Jul 2025 12:08:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65B7426D4FB;
	Wed,  2 Jul 2025 12:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="EAlsEvaf"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E8791624F7;
	Wed,  2 Jul 2025 12:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751458121; cv=none; b=O83lKpuzsyTI6MM8KfLlDwS60OZIFsA6C/UYhQ5Dyqnz8hQsoMQtWRe3IKVaW2dBi6nNLEYoCBAKn5+dWv5wf1qoQqMYK3XD7ozZHPGAf/1tFCWw88rXnwELF3yOnGqcQResQN4KXp1HmseWQ5nCAqjFSZURA9oi/mvnr1tDEog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751458121; c=relaxed/simple;
	bh=3vbzMSWGrM1IsM82wSUE9N2Euh4gG5Fkzv7YzCiDhcs=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=fg1yRdgwkcS4GTGZsSIQNfu14hM+mDA7iFNdEZNZCCVwGXqarS8ysYHsLhxtcbQpxDvuCl59yur54zcFhdtYije+408WRqogzx9A/AsmHOI3RE6EH+mtzRUIO9ov7gs5lp5I5xTcSZ0hBcESBAosOk2gyNzpZY9PMsVoNdf9ys8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=EAlsEvaf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5627ah9o018798;
	Wed, 2 Jul 2025 12:08:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oEFqsMO38/rbtY274FEzDRC8zOV2tBwKXGLbUJZ3YLk=; b=EAlsEvafmBU0SrYe
	YOjzYV13iim8M3dkHZzYLCtutwksKzFO09GqouZuXtUxu8gfiv+4SP4vqCY5bVvd
	El6QKcQNuUuHryXt+r6tik1VANJ2UpWKnWcgHbVS4OqE/yDRlbuSitg7IWC5gl5O
	ymlB39BWZpySexCiPglaobYijoCjYK56YeRQ6eV8DCWrkHlbEbm+qoH9C4TTk6D5
	UiyF9RTh+JPg95iOh085OoG0/nBH6NADL77Gcg5ZjRurjQ8NpWwFH87F5qY+Vw19
	w8WtFSdoNUZjfzBnikzjt760A35tQiU+ZB1IrmIWEdWxaZMxpnkzMU2tumr7p8rU
	1jFLBg==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47n0h8gvvv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Jul 2025 12:08:34 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 562C8Y6w008595
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 2 Jul 2025 12:08:34 GMT
Received: from [10.50.58.161] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 2 Jul 2025
 05:08:30 -0700
Message-ID: <87d0795e-82d5-3274-4909-dd795d082295@quicinc.com>
Date: Wed, 2 Jul 2025 17:38:16 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v3 1/5] media: dt-bindings: add non-pixel property in iris
 schema
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Dikshita Agarwal
	<quic_dikshita@quicinc.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        "Bryan
 O'Donoghue" <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250627-video_cb-v3-0-51e18c0ffbce@quicinc.com>
 <20250627-video_cb-v3-1-51e18c0ffbce@quicinc.com>
 <6fd3fa34-69e1-484f-ad6f-8caa852f1a6c@kernel.org>
 <dc6e82a1-82be-b8b8-31c3-8b85447d4e43@quicinc.com>
 <8b88cea4-b9f2-4365-829c-2a255aed6c69@kernel.org>
 <ae23ebae-3101-4a73-2bbd-0dabb4efaba1@quicinc.com>
 <45fdf98c-32f7-4b5f-889c-6d2f1fa5fbd6@kernel.org>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <45fdf98c-32f7-4b5f-889c-6d2f1fa5fbd6@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDA5OCBTYWx0ZWRfX2VJVTobYMkTf
 iDScy1c4eBeUbUaEUlDW36XpsCCXX+EtTmEuVNuuEiCDPxAkXi+xD9TWyv9N7d49HJH5D0pzO79
 xwM8XcFzyjlirM5i404vuGQAGmxve4xmcwFuV0q6uC9rRrhsEfU6uQDjUcHuUv3pPhce9j7hG0h
 ZkJH9/TzZiyFg39+//kH23Q0VkY7Mg/RlJDG42tBL9wOCu5C7SXMvdHC4Hxv84xfeJw4Ygq6vME
 reY5XrN9ZOt9dRT6Jmby4vhBGM5pTEHoKGmuhAFE0uh20mod58d7vzGYqKgVnQnfD/AsdHObP29
 s3owfxw5WH768lC0ql+2+fL7MMmsRLIW5IlfdizKsXo4UhlAzI/gB1nxBouCl06Vi3Yu+4K4Isj
 jH2BLsbsM/AVfNluJU27Cjq+VZSQUa5F7Yv4/UNBRIpZUNE287+9H+akGwe5fblkxI54TzG3
X-Proofpoint-ORIG-GUID: tCHFoBE4Ir2DAcQ1ctw1_XQrinWzNf35
X-Authority-Analysis: v=2.4 cv=L4odQ/T8 c=1 sm=1 tr=0 ts=68652142 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10
 a=zSgUOyzFFViYIMMuxZIA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: tCHFoBE4Ir2DAcQ1ctw1_XQrinWzNf35
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-02_01,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0 mlxlogscore=999 suspectscore=0 adultscore=0
 malwarescore=0 spamscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 phishscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507020098


On 7/2/2025 5:28 PM, Krzysztof Kozlowski wrote:
> On 02/07/2025 13:55, Vikash Garodia wrote:
>>
>>
>> On 7/2/2025 5:17 PM, Krzysztof Kozlowski wrote:
>>> On 02/07/2025 13:45, Vikash Garodia wrote:
>>>>
>>>> On 7/2/2025 4:53 PM, Krzysztof Kozlowski wrote:
>>>>> On 27/06/2025 17:48, Vikash Garodia wrote:
>>>>>> +
>>>>>>      video-codec@aa00000 {
>>>>>>          compatible = "qcom,sm8550-iris";
>>>>>>          reg = <0x0aa00000 0xf0000>;
>>>>>> @@ -144,12 +176,16 @@ examples:
>>>>>>          resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>;
>>>>>>          reset-names = "bus";
>>>>>>  
>>>>>> -        iommus = <&apps_smmu 0x1940 0x0000>,
>>>>>> -                 <&apps_smmu 0x1947 0x0000>;
>>>>>> +        iommus = <&apps_smmu 0x1947 0x0000>;
>>>>>
>>>>> I missed, that's technically ABI break and nothing in commit msg
>>>>> explains that. You need to clearly explain the reasons and impact.
>>>> No, it is not. Interface works well with old or new approach.
>>>
>>>
>>> You changed the order of IOMMUs, so yes it is. Which interface works
>>> well - FreeBSD? Or other? You are changing ABI for every user.
>> Why do i need to change, when without changing would work as well ?
> ? I don't understand. I made a statement, not a question. You are doing
> this - you are changing the ABI.
> 
> Which item was the first IOMMU before and which was second?
> 
> Which item is the first IOMMU now?
Old approach - max 2 iommus interface - <SID-A, SID-B>
New approach - min 1/max 2, iommu interface - <SID-B>, child - <SID-A>

If both works, how is interchanging impacting any existing hardware OR breaking
ABI ?

> 
> Best regards,
> Krzysztof

