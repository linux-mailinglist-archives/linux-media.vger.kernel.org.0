Return-Path: <linux-media+bounces-29099-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D9152A773E8
	for <lists+linux-media@lfdr.de>; Tue,  1 Apr 2025 07:29:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5AF1D188EB1D
	for <lists+linux-media@lfdr.de>; Tue,  1 Apr 2025 05:29:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CBA41DBB2E;
	Tue,  1 Apr 2025 05:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="XYPRiAET"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5715C4685;
	Tue,  1 Apr 2025 05:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743485344; cv=none; b=bVe4Q0djRZJB9rp5zmb0sNIhlmGLs3i/wYhGdnGgv7Bu/ZFV/ITutJL3GxsTHxbZGwTR7zMgy2htpvXh6Dr0sANxKv+4CSoV2GEXAkZHC02td11VBIX0ox7Z70x0sr0LnoAIW32d17n33qjmhNir8V9C7uPG3AEG73CuBckH9Fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743485344; c=relaxed/simple;
	bh=hYqPLlU7KMSD61xoOZt44TE6mPG38Z6NwAuUKeDkw+c=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=kD9zaltOY4Nu42zfr87GuAAEwBFXf2lsqCY21DVT8g+1DJWaPzkuvXAgtwgWRRfVXQkBoDMG3V0Oh676FqCyW6gYiJABdfwjAdzLcf1ncJIBJ5dPzxINoFrerjOtbsorAD/4Jr0zA9rgEvyZGHgBzRLMgutualDzklDOOu8OK+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=XYPRiAET; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52VFDAep007970;
	Tue, 1 Apr 2025 05:28:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WeeJdTUapFuVrFZqCpOxgkah9S0HZHyNmDcb+SmGcIw=; b=XYPRiAETcsWCluyL
	iq3GCJus2hxBmSe+BfI+NhkkeuYrVzIgnseOjM4bRaKzKSxprX8A5lKyckCNw5v+
	hnp7ICXc2aRiukLCnkis5Iwj3hrH5VFqRvtWvzu95vX4f3MlnjPUDbWtrO5tI8Bg
	FxbAiPoC9tFEgqtgVbos0wIt+6REZG04kBOx3vtzySPH0d1fJ7yNbxUS/UbIP80L
	Q00VBYYu69+jwGWv1xXz3XNIMsR+Cxlq3m+zLJ1+i4MjZO7glSJA9jzZfEEzxxlj
	KLx9Ghy/RNh3TN5CZsnLLGXHV0tkPfC4dbsECSqwQe45xxDoSvlMnyj8lQGbukoE
	vJPT2w==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45pa1nxfrg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Apr 2025 05:28:59 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5315SwkS028129
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 1 Apr 2025 05:28:58 GMT
Received: from [10.204.100.69] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 31 Mar
 2025 22:28:55 -0700
Message-ID: <2539ae48-d75f-bb52-3873-de0b6d9a8180@quicinc.com>
Date: Tue, 1 Apr 2025 10:58:52 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 1/2] media: MAINTAINERS: Switch from venus Reviewer to
 Maintainer
Content-Language: en-US
To: Hans Verkuil <hverkuil@xs4all.nl>, Trilok Soni <quic_tsoni@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        <stanimir.k.varbanov@gmail.com>, <quic_dikshita@quicinc.com>,
        <mchehab@kernel.org>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250329-b4-25-03-29-media-committers-venus-iris-maintainers-v1-0-0ec1007fde3c@linaro.org>
 <20250329-b4-25-03-29-media-committers-venus-iris-maintainers-v1-1-0ec1007fde3c@linaro.org>
 <93ca218a-71a2-4751-860c-025ec29b9180@quicinc.com>
 <f1d4d88f-1ca0-4be8-84cd-3ef0d224feb4@xs4all.nl>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <f1d4d88f-1ca0-4be8-84cd-3ef0d224feb4@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: g0Xd1LEpgErhnZQFBik5MdJjpaIh-flk
X-Proofpoint-GUID: g0Xd1LEpgErhnZQFBik5MdJjpaIh-flk
X-Authority-Analysis: v=2.4 cv=MPlgmNZl c=1 sm=1 tr=0 ts=67eb799b cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=pGLkceISAAAA:8 a=COk6AnOGAAAA:8
 a=VwQbUJbxAAAA:8 a=_MzvFDcTk46TyXVooDMA:9 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-01_01,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 phishscore=0 spamscore=0 clxscore=1015
 bulkscore=0 mlxlogscore=937 impostorscore=0 mlxscore=0 adultscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504010035

Hi Hans,

On 3/31/2025 12:56 PM, Hans Verkuil wrote:
> On 29/03/2025 02:38, Trilok Soni wrote:
>> On 3/28/2025 6:26 PM, Bryan O'Donoghue wrote:
>>> I'd like to volunteer my help in keeping venus maintained upstream.
>>>
>>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>> ---
>>>  MAINTAINERS | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>> index 29b4471574982bf3f8d03158cd5edcb94bc9fab9..5ccddd2030efd96324e53fcee8048120990a85d5 100644
>>> --- a/MAINTAINERS
>>> +++ b/MAINTAINERS
>>> @@ -19592,7 +19592,7 @@ F:	drivers/usb/typec/tcpm/qcom/
>>>  QUALCOMM VENUS VIDEO ACCELERATOR DRIVER
>>>  M:	Stanimir Varbanov <stanimir.k.varbanov@gmail.com>
>>
>> Is Stanimir still an active maintainer here? 
> 
> He's no longer maintaining venus.
> 
> Bryan, can you post a v2 removing Stan as maintainer? Stan, can you Ack
> that v2?
I would propose to have Dikshita in the list instead. That way we can have same
folks managing patches for both iris and venus, given that Stan is no more
sending PRs.

Regards,
Vikash
> Regards,
> 
> 	Hans
> 
>>
>>>  M:	Vikash Garodia <quic_vgarodia@quicinc.com>
>>> -R:	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>> +M:	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>>  L:	linux-media@vger.kernel.org
>>>  L:	linux-arm-msm@vger.kernel.org
>>>  S:	Maintained
>>>
>>
>>
> 

