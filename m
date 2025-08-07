Return-Path: <linux-media+bounces-39064-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D0661B1DBD4
	for <lists+linux-media@lfdr.de>; Thu,  7 Aug 2025 18:35:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B81AF1AA0BED
	for <lists+linux-media@lfdr.de>; Thu,  7 Aug 2025 16:35:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CED4B270571;
	Thu,  7 Aug 2025 16:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="kLHnHAyq"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF58C1E5207;
	Thu,  7 Aug 2025 16:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754584524; cv=none; b=lcD8VFb9YzlCXFB1qUDV6vCH5ca16RbcTsCbKfBv5OAZ8coMuq+QneiOIUpcy98fOrjHKPXf6yZMLekEXc4E897Z3jULYusbdbeFGg4XOsEXUpvtaWqDHOjLjw+exnG/Je3wta5BGJSb5dbbgeWT1uQ0+SPD1MoMXp7NfUFv8P0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754584524; c=relaxed/simple;
	bh=1YXeZwkbsUbQQIS4pl+XRsFR/nm8Kr3fHwjjCaW7Hx4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=iDYbhPN1R2dDdt56Bi6LIK+A8Vm54zEfutclPUVyTyBlWxK6UiTWTgMeOKymewFNWtqHi3cXVCJYbUX6FmnEj9tnzWShL1DtiXmulS1Lzj619flQWkU8RQMy7kGHdqz2oOSm+RaJ1q7dJuAigGfXEGymbTxZlSyDvknb6VhhRmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=kLHnHAyq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5779D95x025027;
	Thu, 7 Aug 2025 16:35:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HAWs8+OIDWnOzE9pFf4D6YkEa3OaAVYcx1FAPMCWpKc=; b=kLHnHAyqAo4T7qPi
	PxDvZUle3djHWty78wfWRScevX0YnfjEcZ5TauqtQlXlgq0Y7smv+wX9+ze0QQPC
	gEhTxHH6HIka5cxmFJTrB7w3wjtcGtEPdLGy8hMlaPRxCl1HKB++ECW/+HaNiQM+
	paLXxP3+Y2UwZeER0xcHg3pObMIROOa71d+gPypv3fwXJYgaf5qIgOjwV46X8wqA
	llNkm29Xq89JaLKAt7w37m4WnzUKYUOyC//XxwAq/ETNqg6YOPJYTsGDm7TBu7Hf
	+D+8Howqdg4ohFd8JDy6PgsfM90WUhUm8fWjfLaHP9O4UnczjLzhZ0r2/IZOX4iY
	0gXHVQ==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpw1ew8m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Aug 2025 16:35:19 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 577GZIec019219
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 7 Aug 2025 16:35:18 GMT
Received: from [10.216.27.221] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 7 Aug
 2025 09:35:13 -0700
Message-ID: <447caa6d-13d2-2e75-5f33-6df9b2fd6d69@quicinc.com>
Date: Thu, 7 Aug 2025 22:05:10 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v8 5/7] media: venus: core: Add qcm2290 DT compatible and
 resource data
Content-Language: en-US
To: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
CC: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>,
        <bryan.odonoghue@linaro.org>, <quic_dikshita@quicinc.com>,
        <konradybcio@kernel.org>, <krzk+dt@kernel.org>, <mchehab@kernel.org>,
        <conor+dt@kernel.org>, <andersson@kernel.org>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250805064430.782201-1-jorge.ramirez@oss.qualcomm.com>
 <20250805064430.782201-6-jorge.ramirez@oss.qualcomm.com>
 <4chbcvub4scnv4jxjaagbswl74tz4ygovn3vhktfodakysbgy3@kukktkwd2zsr>
 <aJHgh8mon9auOHzi@trex> <aJHqpiqvulGY2BYH@trex>
 <to2hrxml3um6iep4fcxhkq7pbibuimfnv4kfwqzlwdkh4osk5f@orjzbuawwgko>
 <aJMMhIqNupwPjCN+@trex>
 <0248afed-b82d-4555-8277-e84aacf153fd@oss.qualcomm.com>
 <aJNTigOMy1JFOxot@trex> <fcdd9534-d494-3fdb-dfa7-1d15da6f697a@quicinc.com>
 <aJSvjqfQw3kNrVVH@trex>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <aJSvjqfQw3kNrVVH@trex>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOSBTYWx0ZWRfX0r4H9fESOwFb
 o8+nkaB7lPXSNp2I5Om8PKb69mUP6Sxbr4XOTwQRdl5qh6SR+kItHS5ntANO2wk+DBAB6JUJ5N1
 r0c2gLPkjlhbQO21nAtL0P+L87bt0rONmIvQ+0X0fo70beThD++hnlFrE5qoiGAe7sat1eewtbM
 OuVcuR1tzwcRKg6WwygCMr47gcmLdEospCfu4wUYc1HE9BsV/+mKGVyLW//xL8pIACQY0oQ+lTp
 P5shfrr2N79vdFzKA8bIXHK7rLCRPauJM47Omi7P1wEHNa1NWbC5HYMtN5dOUa4290kjKH5v4tp
 YREUML6a763EBrEdXy2vJH50vkIyQ7FyBeMCluvHpHnyNRd0voT5Bz9VrHLHbodXO/kS9DAIBzN
 aeb9qcxy
X-Authority-Analysis: v=2.4 cv=Ha4UTjE8 c=1 sm=1 tr=0 ts=6894d5c7 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10
 a=kRLAlyxrhNf5nlvc8GMA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: WzKWd0tBQ-OotCHZfZvaNa3KhRfeVsEP
X-Proofpoint-GUID: WzKWd0tBQ-OotCHZfZvaNa3KhRfeVsEP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-07_03,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 phishscore=0
 bulkscore=0 adultscore=0 suspectscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508060009



On 8/7/2025 7:22 PM, Jorge Ramirez wrote:
> On 07/08/25 16:36:41, Vikash Garodia wrote:
>>
>>> It was agreed that this complexity was not necessary and that we should
>>> just drop <6.0.55 firmware support (which would in any case only include
>>> video decode).
>>>
>>> And so on v8, I removed the above.
>>>
>>> Now I have v9 ready to post it, but Dmitry is asking why cant we have
>>> the v7 functionality so I am waiting for direction.
>>
>> the issue is in firmware for both encoder and decoder. Didn't like the idea of
>> driver carrying the hack for a firmware issue. Just because, for encoder, we are
>> unable to hack it in driver, we are ok to have it enabled in a newer version of
>> the firmware, we can follow the same for decoders as well.
> 
> if that is the only reason please do explain what do you mean by hack.

I meant that the EOS handling was not needed in driver after fixing it in
firmware, isn't it ? Was trying to avoid carrying this in driver.

I tend to agree with the comment made by Dmitry in another thread to have decode
enabled with existing firmware, no option but to support the *already* published
bins.

Having said that, these limitation of having a separate EOS dummy buffer is well
sorted out in gen2 HFI which have an explicit DRAIN cmd for it. Hope this
motivates you to migrate to iris soon for AR50LITE variants :)

Regards,
Vikash

