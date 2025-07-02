Return-Path: <linux-media+bounces-36555-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F547AF14D9
	for <lists+linux-media@lfdr.de>; Wed,  2 Jul 2025 14:02:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4AAAF4E848D
	for <lists+linux-media@lfdr.de>; Wed,  2 Jul 2025 12:02:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 750F22701D0;
	Wed,  2 Jul 2025 12:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="RNJDlxxv"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 452F1267AEC;
	Wed,  2 Jul 2025 12:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751457713; cv=none; b=p/EgTjjB5dDksWAaGwQ7pjbKhm2CQ4v8wnulHGRfaPVd7wLaNaU2C8qy3beM2EkGwJWuwOj0R3GBf94t79Hr/YYxKDlp1mqNbR93LtW4ey6wZiBRRKaUdQNWzOe7X9iP60cei+uFcLe3zE65WtE2v+0P/O7OZH/E29nxv95FJG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751457713; c=relaxed/simple;
	bh=zQtNcMGzIquLCd/CHysM5N2spJz9eEDEPTNKqaoCOX8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=XO6SUk588yHPMU6fZ1upjO3ECIYyog/MYoQzDnb/x3KfWZzhmXW73HvWoaPoWYcl/60uI/wQGyWBJb63NjgAZID8rgQ1ob25pW0PP93x3w4bpWl+N9OQAI/OSTXkjUbIx2BtnhALrxD1BBgU/pXDfTpV2IW1MQ5Kd1JmuLNIpY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=RNJDlxxv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 562Asw7m020939;
	Wed, 2 Jul 2025 12:01:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FVlWhQQ+b14FmNqD30heTiW9T8Tf/brelVlSxVCs1Qk=; b=RNJDlxxvugzXhAFK
	jxvph5klDwfisgzEmkWuZ6U5kAjPBFyYd4IS6G3Q2KtSWzilDIyDL/RrsMxphZEH
	Y/7nTY9410BVQzYPhODUcDA+HV+fciuWqB5oAzyX8TpOPt2rSsEURMmogA06dGRb
	dvbnAy3of/zBpriAl/c/saq4+pF8bT58hiFQg4a1yXKMwo8gdB4qLJTosNlYkoT+
	Kfwmmvv8cgGErKr8Oy7min8M+owE6/jCh6jBbFDheZ7Tp0LtAnN12m8UCrPdhxYw
	IzR6s3OWrQrIDJN9Mv3ONC48QIiF1KNGpXBGi4Ard5zbE0T7NNGB8n/1Rp8tNstF
	YGsK4g==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47mhxn36pn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Jul 2025 12:01:45 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 562C1huq029489
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 2 Jul 2025 12:01:43 GMT
Received: from [10.50.58.161] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 2 Jul 2025
 05:01:40 -0700
Message-ID: <7b6db4fa-2f73-376d-4eb3-64c1c7e6cda3@quicinc.com>
Date: Wed, 2 Jul 2025 17:31:26 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v3 0/5] Introduce "non-pixel" sub node within iris video
 node
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
 <5f90547d-945a-4e26-b36c-75f2d8a1af97@kernel.org>
 <eab8d79f-7188-9537-9176-3e4d22f0978a@quicinc.com>
 <5ad418d9-8199-43c9-a477-1e3b939c054c@kernel.org>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <5ad418d9-8199-43c9-a477-1e3b939c054c@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDA5NyBTYWx0ZWRfX5wTPO1ebF12d
 LLun7/21txH/GjF74LohlbrKn+aaAh43brmjwfbTkKL9oxmCE8f5nm66CsqCLx9MRiCadKvxJpx
 4OVZzJnvgkUJPR8GTaRmv8i1QkXNHeE3JWimSgbQO2y7Cz/sZGJdSpId9DlMHaXlI/dj2CYUHxy
 zMB29mt03NiqizAcOPpDcT8eu5K5Bdu157yfFw8obLB62jX2r7uthnPFgDUwKw/uaMFozOF2LHA
 6dbiDAm+XO0BsgciLHr1JFSOghOt2ipUjMldqWv7WtkbKWmbX9OgD0EZLd6pPtLJyfatNVE7k6V
 GwWhkJnB5jD5T3AHACcEX+Z8EJ1BdcHWjsB4O6qLd0rLJv31X5qem9000KoGC5nkYb0ygwYAGXE
 AYbNdJudUITpMzUQQTyCUjXSkyuI2//6scSClkGKoArZXgx5Px94dLiwTukvGX76kcM5BaPA
X-Authority-Analysis: v=2.4 cv=EbvIQOmC c=1 sm=1 tr=0 ts=68651fa9 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8
 a=d-4ZcLASQ4404vAoVlQA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: RSk8M61780XpcYmvqoBldalLSZde6uSD
X-Proofpoint-GUID: RSk8M61780XpcYmvqoBldalLSZde6uSD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-02_01,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxscore=0 priorityscore=1501 mlxlogscore=999 lowpriorityscore=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507020097



On 7/2/2025 5:22 PM, Krzysztof Kozlowski wrote:
> On 02/07/2025 13:37, Vikash Garodia wrote:
>>
>> On 7/2/2025 4:48 PM, Krzysztof Kozlowski wrote:
>>> On 27/06/2025 17:48, Vikash Garodia wrote:
>>>> This series introduces a sub node "non-pixel" within iris video node.
>>>> Video driver registers this sub node as a platform device and configure 
>>>> it for DMA operations. All non pixel buffers, i.e bitstream, HFI queues 
>>>> and internal buffers related to bitstream processing, would be managed 
>>>> by this non_pixel device.
>>>>
>>>> Purpose to add this sub-node:
>>>> Iris device limits the IOVA to an addressable range of 4GiB, and even 
>>>> within that range, some of the space is used by IO registers, thereby 
>>>> limiting the available IOVA to even lesser. For certain video usecase, 
>>>> this limited range in not sufficient enough, hence it brings the need to 
>>>> extend the possibility of higher IOVA range.
>>>>
>>>> Video hardware is designed to emit different stream-ID for pixel and 
>>>> non-pixel buffers, thereby introduce a non-pixel sub node to handle 
>>>> non-pixel stream-ID into a separate platform device.
>>>> With this, both iris and non-pixel device can have IOVA range of 
>>>> approximately 0-4GiB individually for each device, thereby doubling the 
>>>> range of addressable IOVA.
>>>>
>>>> Tested on SM8550 and SA8775p hardwares.
>>>>
>>>> Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
>>>> ---
>>>> Changes in v3:
>>>> - Add info about change in iommus binding (Thanks Krzysztof)
>>>
>>> Nothing improved in commit msg. You are changing existing device and the
>>> reason for that change is not communicated at all.
>>>
>>> There was big feedback from qualcomm saying that some commit in the past
>>> received review, so future commits can repeat the same stuff. If qcom
>>> approaches that way, sorry, no you need to come with proper commit
>>> description.
>>>
>>> Please align internally how to solve it, because my response that past
>>> imperfect review is not justification for whatever future issues was not
>>> enough.
>> Sure, lets take this as an example and you can suggest to provide a better
>> commit message for this case, it would help me to compare where is the gap. I
>> have tried my best to capture and explain the limitations and how the changes
>> address those limitations. If that is not sufficient, we might have the perfect
>> message from you and compare to find the gaps and improve, I am sorry, but thats
> 
> It is not question to me: I did not want imperfectness. Qualcomm
> engineer used issues in existing commits or imperfect commit in
> discussion, so that's my solution. I don't need that perfect commit, but
> it seems if I agree to that, then I will have to defend it later. Well,
> no, I don't want it.
> 
>> how i feel at the moment.
> Sure, I feel confused now as well.
> 
> Anyway, in other messages I explained what is missing. You are changing
> existing hardware and you clearly must explain how existing hardware is
> affected, how can we reproduce it, how users are affected.
Exactly all of these i have explained in the commit message. The limitation with
existing hardware binding usage and how my new approach mitigates that limition.

Coming to usecase, i made a generic comment saying usecases which needs higher
IOVA, i can add the explicit detail about usecase like 8k or higher
concurrencies like 32 or higher concurrent sessions.
> 
> All these answers.
> 
> Best regards,
> Krzysztof

