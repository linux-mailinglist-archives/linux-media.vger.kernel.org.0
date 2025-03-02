Return-Path: <linux-media+bounces-27293-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2605CA4B158
	for <lists+linux-media@lfdr.de>; Sun,  2 Mar 2025 12:59:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B489B3B2F6A
	for <lists+linux-media@lfdr.de>; Sun,  2 Mar 2025 11:58:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2A8F1E2007;
	Sun,  2 Mar 2025 11:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="DVL1tmc2"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4CE41DC07D;
	Sun,  2 Mar 2025 11:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740916733; cv=none; b=nkmH20Fsu8YQYRVbDMDRS4uOoJSwpcgHYpFiSsbkzrj7QsScDs8apB1lp8b7yAOGt7Q9hb8VAyGYhxCup012zL4JX91puZP4M/fkSgaauwiheHVmCHFK9sb7VesfU5GT89eg2CiNvsPLn0Tg4k8PiZCtm0sQxxcipCa1ltouY7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740916733; c=relaxed/simple;
	bh=dfZhNz/vQKL0f30bzuxXzK40XE/QNdhkHWdLhAzlVgw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=r2YklqVFt8FEQP6+Ej6RQmrb+kUDua66RtID0SEzYK6ovxT3E0IoXXMIFY4P5XGCRkh03YOFIPPTnbZ2eY+HI+cWcfFARr9AouGlkX4s9smBXM2bD0l59A4PWPf5+PjEVKBazFj+3irZVqcX9aw6jiA79Lq5J6iu3Y1V8NsZ49I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=DVL1tmc2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 522Bm7XD024209;
	Sun, 2 Mar 2025 11:58:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VuML3wkEE0XvJn393R3V2Ul5uMaKfz+p2L0gk9SYgUU=; b=DVL1tmc2akgiLz2Y
	B8P2Zt+xEzghm8WOd5YQLVeZHbqCSUtz1Q+z6gLsG6ALja1tqP42P+dPKBXV6oxF
	BL2WEgq9JqTPRKv6AdRF4N/pTR2Rt/Yhvw5IKdBxTT5xIVPsPbG/RKULCyvmz7kc
	hXuwSPzjL7h2XX3L21YLzYGuu8GoGSO7kM0bQfeBimjBOWiC49F1wXRwdLimfWtR
	53SMW7ciSWVCtUX7OVnQX9kQb24SBVxGAuWIHBismESa9ACdAyI330L2kRF/LOxB
	P/JWye/DZhYyLkyDdJUTMz7mAGeIaiq/ZFe14I9r/V2ChU4LT6B74+91C4B4cNZR
	OIo6nQ==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 453t9929rd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 02 Mar 2025 11:58:34 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 522BwXg8002933
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 2 Mar 2025 11:58:33 GMT
Received: from [10.50.60.31] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 2 Mar 2025
 03:58:31 -0800
Message-ID: <7bf1aeaa-e1bd-412b-90fc-eda30b5f5b37@quicinc.com>
Date: Sun, 2 Mar 2025 17:28:28 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] venus driver fixes to avoid possible OOB read
 access
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Stanimir Varbanov
	<stanimir.k.varbanov@gmail.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250215-venus-security-fixes-v2-0-cfc7e4b87168@quicinc.com>
 <c3b27e55-f627-417c-bb62-3189f248fb99@linaro.org>
Content-Language: en-US
From: Vedang Nagar <quic_vnagar@quicinc.com>
In-Reply-To: <c3b27e55-f627-417c-bb62-3189f248fb99@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: iAoQJ-xCzA94z79URgWm-cPIoWWjTmd0
X-Proofpoint-GUID: iAoQJ-xCzA94z79URgWm-cPIoWWjTmd0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-02_03,2025-02-28_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=999
 mlxscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 clxscore=1015 spamscore=0 adultscore=0 impostorscore=0 malwarescore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2503020096

Hi Bryan,

On 2/16/2025 9:33 PM, Bryan O'Donoghue wrote:
> On 15/02/2025 17:19, Vedang Nagar wrote:
>> This series primarily adds check at relevant places in venus driver
>> where there are possible OOB accesses due to unexpected payload
>> from venus firmware. The patches describes the specific OOB possibility.
>>
>> Signed-off-by: Vedang Nagar <quic_vnagar@quicinc.com>
>> ---
>> Changes in v2:
>> - Decompose sequence change event function.
>> - Fix repopulating the packet .with the first read during read_queue.
>> - Link to v1: https://lore.kernel.org/r/20250104-venus-security-fixes- 
>> v1-0-9d0dd4594cb4@quicinc.com
>>
>> ---
>> Vedang Nagar (2):
>>        media: venus: fix OOB read issue due to double read
>>        media: venus: fix OOB access issue while reading sequence 
>> changed events
>>
>>   drivers/media/platform/qcom/venus/hfi_msgs.c  | 72 +++++++++++++++++ 
>> ++++++----
>>   drivers/media/platform/qcom/venus/hfi_venus.c |  1 +
>>   2 files changed, 63 insertions(+), 10 deletions(-)
>> ---
>> base-commit: 91e71d606356e50f238d7a87aacdee4abc427f07
>> change-id: 20241211-venus-security-fixes-50c22e2564d5
>>
>> Best regards,
> 
> Could you please address the feedback I gave you / questions posited in 
> these two messages ?
> 
> 4cfc1fe1-2fab-4256-9ce2-b4a0aad1069e@linaro.org
> 
> 0eab7323-ce86-40c7-9737-06eedcdf492d@linaro.org
> 
> The basic question : what is the lifetime of the data from RX interrupt 
> to consumption by another system agent, DSP, userspace, whatever ?
As mentioned in [1], With the regular firmware, after RX interrupt the 
data can be considered as valid until next interrupt is raised, but with 
the rouge firmware, data can get invalid during the second read and our 
intention is to avoid out of bound access read because of such issues.

[1]: 
https://lore.kernel.org/lkml/4cfc1fe1-2fab-4256-9ce2-b4a0aad1069e@linaro.org/T/#m5f1737b16e68f8b8fc1d75517356b6566d0ec619
> 
> Why is it in this small specific window that the data can change but not 
> later ? What is the mechanism the data can change and how do the changes 
> you propose here address the data lifetime problem ?
Currently this issue has been discovered by external researchers at this 
point, but if any such OOB issue is discovered at later point as well 
then we shall fix them as well.

Also, with rougue firmware we cannot fix the data lifetime problem in my 
opinion, but atleast we can fix the out of bound issues.
> 
> Without that context, I don't believe it is really possible to validate 
> an additional memcpy() here and there in the code as fixing anything.
There is no additional memcpy() now in the v2 patch, but as part of the 
fix, we are just trying to retain the length of the packet which was 
being read in the first memcpy() to avoid the OOB read access.

Please let me know if you have any other suggestions.

Regards,
Vedang Nagar
> 
> ---
> bod


