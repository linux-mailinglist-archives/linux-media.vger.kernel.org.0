Return-Path: <linux-media+bounces-24343-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D10FA03FAE
	for <lists+linux-media@lfdr.de>; Tue,  7 Jan 2025 13:48:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F2C1F3A4D17
	for <lists+linux-media@lfdr.de>; Tue,  7 Jan 2025 12:48:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B844D1F03EE;
	Tue,  7 Jan 2025 12:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="O6NdowBr"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00DF01EF08D;
	Tue,  7 Jan 2025 12:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736254072; cv=none; b=Bu2Hf2TTr2hQjW2LidpGiWnWl4PM8KWOLGA9LjnX+hjJRPTQKOkZDCjq/5DIgd7Cq4XsR6Fy29JnB6JHXzRtxYTxuSQcPb1fOXBSuImINGpc97DeIc/uy1qb7XqdC9BkVVZqW7A//yACk17huSsex0iIHqJPZUE9BnG4ZAff1Lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736254072; c=relaxed/simple;
	bh=LQ+Vdd7Z5kAgBsQhJ5rMrLrEbbavYFLs9RzON+vTKTs=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=bpNGuVlc5jJoecpqJ01pl1Sg8OmtJkdBM6ndjOjr62x15ayDqAYyYIE5eEYPW7mTzlqK/H7THOa8gVv6x12mh4VTjHI1rDKpSF1ocJkfEz2SzzFK9xLM+Fxihy377iqj57O9bBm58JI2rCyWp0qX1odqEf0/sTrtGmyOODZlGzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=O6NdowBr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5078bsnS011346;
	Tue, 7 Jan 2025 12:47:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R/udDLdHhcyCxkm6qe0P6CKQap5rHWoBYBtIhAwJEA4=; b=O6NdowBra/SNYVcv
	Mp7f/XA0CVX4zWiGJ8QPjg7ybzMtKmwpQIP2AfNisedK7BWSNv2zrl6a5UaNxmrc
	ezqLlqcg8bpIojkSH6MIosQ9gLbxI8PBmyhp0YZtXLoFydVzedAvNMC2qhevnbDx
	nVMMX4WKRMVOiznQ+TyeoO61YBfOFCWqB0QVtK7xjpeV2hBlIGjZPyz8CkafBj1W
	4ygowiRZ9KdyXJH2kYYd9xUEqGuZzOEux/zv54ip0lgxG+7i1YQQNu+btWxvl7nH
	omi9AEPupRwJJOWE9A09ZDoDNAag6AsLUVY5sKI6xxOBLE1njV4nQPixuiKT/nE3
	HTx2JQ==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4410x2rkqa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Jan 2025 12:47:41 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 507Clecg013456
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 7 Jan 2025 12:47:40 GMT
Received: from [10.239.97.152] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 7 Jan 2025
 04:47:34 -0800
Message-ID: <fd61c298-f271-4e21-b1e1-dee1029e978d@quicinc.com>
Date: Tue, 7 Jan 2025 20:47:31 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/16] dt-bindings: media: camss: Add qcom,sm8550-camss
 binding
To: Hans Verkuil <hverkuil@xs4all.nl>, Krzysztof Kozlowski <krzk@kernel.org>
CC: <rfoss@kernel.org>, <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>,
        <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <vladimir.zapolskiy@linaro.org>,
        <quic_eberman@quicinc.com>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel@quicinc.com>,
        Yongsheng Li
	<quic_yon@quicinc.com>
References: <20241225133523.4034820-1-quic_depengs@quicinc.com>
 <20241225133523.4034820-13-quic_depengs@quicinc.com>
 <ql3sufugcdpoxqgvs2f4clmbnx75t4jh6ts2ryneu2u5oeuwzn@yizcouuzfj2s>
 <eedaa77a-8070-41c8-a05b-b124d37ac093@quicinc.com>
 <a0eafc67-2ebf-4d2a-8213-c30c3c317a1a@xs4all.nl>
Content-Language: en-US
From: Depeng Shao <quic_depengs@quicinc.com>
In-Reply-To: <a0eafc67-2ebf-4d2a-8213-c30c3c317a1a@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: POuA7D1iMZFwM96Hr_44AveRt_5hMS8K
X-Proofpoint-ORIG-GUID: POuA7D1iMZFwM96Hr_44AveRt_5hMS8K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 mlxscore=0 malwarescore=0 clxscore=1011
 phishscore=0 adultscore=0 mlxlogscore=999 impostorscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501070106

Hi Hans,

On 1/6/2025 10:00 PM, Hans Verkuil wrote:
> On 04/01/2025 14:40, Depeng Shao wrote:
>> Hi Krzysztof,
>>
>> On 12/27/2024 5:10 PM, Krzysztof Kozlowski wrote:
>>> On Wed, Dec 25, 2024 at 07:05:19PM +0530, Depeng Shao wrote:
>>>> Add bindings for qcom,sm8550-camss in order to support the camera
>>>> subsystem for sm8550.
>>>>
>>>> Co-developed-by: Yongsheng Li <quic_yon@quicinc.com>
>>>> Signed-off-by: Yongsheng Li <quic_yon@quicinc.com>
>>>> Signed-off-by: Depeng Shao <quic_depengs@quicinc.com>
>>>> ---
>>>
>>> Is this v7 or v1? Same issue was all the time in the past, so why can't
>>> you finally fix it?
>>>
>>> Look:
>>>
>>> $ b4 diff 20241225133523.4034820-13-quic_depengs@quicinc.com
>>> Breaking thread to remove parents of 20241225133523.4034820-1-quic_depengs@quicinc.com
>>> Checking for older revisions
>>> Grabbing search results from lore.kernel.org
>>>     Added from v6: 1 patches
>>> ---
>>> Analyzing 217 messages in the thread
>>> Could not find lower series to compare against.
>>>
>>> I am not going to perform review, maybe other maintaners have spare
>>> time to deal with this submission process.
>>
>> Really sorry, I made a foolish mistake. I didn't realize that the patch
>> subject was missing the version number, which might be why the b4 diff
>> couldn't detect the old series. Thank you for pointing out this error.
>> Could you please advise whether I should resend v7 or fix it in next
>> version series?
> 
> I marked this series as 'Changes Requested' in our media patchwork because
> of this issue.
> 
> So resend it as v8 with the proper [PATCH v8 ...] subject.
> 

Thanks for the comments, I will follow your guidance to resend it.

> It's a nightmare for maintainers/reviewers if it isn't clear if a patch series
> supersedes a previous series, so it is important that you do this right.
> 
> Regards,
> 
> 	Hans
> 
>>
>> I have also found a workaround to replace "b4 diff". Last time, you
>> helped by giving a RB tag on the version 4 dt-binding. You can check the
>> differences[1] between version 4 and version 7 on the Patchew website.
>> If possible, could you please help review the diff provided by Patchew
>> once again? Sorry for wasting your time.
>>
>> Visit below website[1], then search "dt-bindings: media: camss: Add
>> qcom,sm8550-camss binding", then we can get the difference between
>> version4 and version7.
>>
>>
>> [1]
>> https://patchew.org/linux/20240812144131.369378-1-quic._5Fdepengs@quicinc.com/diff/20241225133523.4034820-1-quic._5Fdepengs@quicinc.com/
>>
>>


Thanks,
Depeng


