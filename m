Return-Path: <linux-media+bounces-15998-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1705A94BEFB
	for <lists+linux-media@lfdr.de>; Thu,  8 Aug 2024 16:02:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3A0911C241F4
	for <lists+linux-media@lfdr.de>; Thu,  8 Aug 2024 14:02:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1616318E74B;
	Thu,  8 Aug 2024 14:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="UC9/u3Va"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA63863D;
	Thu,  8 Aug 2024 14:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723125754; cv=none; b=DWz8VZPRaOHIW2KtTW7bTPy1hscqTvRqGDfvAS9v/LyMgDVeikrVF3LrCLHxM8dt4+ityUEi/9BnsS7MO/lYeKlDs3doO7U0xXEGJu8U8LECQrOwW8JAXBwR43TxWz4XInYqCMtxgH8Jy6eFZmU2q5dWqDGODpPvRHSMz3q4KQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723125754; c=relaxed/simple;
	bh=GASqwo3D+klUje/Sl3EPzxYl3I0U+kkrag0CW9LeGdY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=qea+1EO0FSlgMrnTagJ2rQwqZYyVriXAswyMV1Y2VH1qAdinqflBSR5h4LwPapx4riMmoJsXaY4Ul8yJzzArOHjVvmroF53mLzkBL+yTOgXKbMyLDZZm26Sydacmy7OjldB4Qjn9qDcpK3d/ZDD4X5/CRKIPFJRbRCogHAi5yds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=UC9/u3Va; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 478CDE7s021849;
	Thu, 8 Aug 2024 14:02:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jFCWaSWOx0MGXm2eZfsafUENDd6Jr5+lgPU6lfSVOU0=; b=UC9/u3VaW4K/BR1G
	QCWWV4Rsnz/9Uzyapjrbv4Foquk+4OI/Oa/mXoOhSz4jXOYbZq7m1FLavCxLM7IP
	JDZIS+4iorBvOEbtV0mnaUxSaZnHwLImxUMrmoYDijXHrtuwNpxXzBqCteuSqeuk
	pMXf1FnBzuLDMkCUb44k06b6Xqn+IYeNb1Vsc1RQWeQ6LktTSOMHVoYmmCW3dpOL
	Q2lPQTPZIJ322+RxPgSDqA+LFyludqQ3EYHkoP+sPIdOBrunTYCbUo75afMDRW8G
	sx/RggOhCy9mAL/v3EBCsz3n5KekvhXHIRzuLX74UaWmBjSK2aHnbrAZfy+xWLRN
	g5Ctlg==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40vmc51ryv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 08 Aug 2024 14:02:26 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 478E2QOR009576
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 8 Aug 2024 14:02:26 GMT
Received: from [10.239.97.152] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 8 Aug 2024
 07:02:20 -0700
Message-ID: <3241cc15-c920-4c88-ac53-005903baf9e7@quicinc.com>
Date: Thu, 8 Aug 2024 22:02:18 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/13] media: qcom: camss: csiphy: Add an init callback to
 CSI PHY devices
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy
	<vladimir.zapolskiy@linaro.org>,
        <rfoss@kernel.org>, <todor.too@gmail.com>, <mchehab@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <quic_eberman@quicinc.com>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel@quicinc.com>
References: <20240709160656.31146-1-quic_depengs@quicinc.com>
 <20240709160656.31146-5-quic_depengs@quicinc.com>
 <6dfc2c79-fc6d-4eed-bf3f-94396130cb4f@linaro.org>
 <fafda7d5-3853-428a-b0eb-9993fc2d4f56@linaro.org>
 <4426c0e0-f877-409c-b2d2-a5aac5e8c645@linaro.org>
 <1226d080-d1fc-4e06-ac81-84e93cb314e0@quicinc.com>
 <8f935a7d-87b5-479c-a98e-c95671dbe259@linaro.org>
 <7c03280f-908d-435d-acef-b6bf4f865029@quicinc.com>
 <ff12ce12-41d6-4aa5-ab97-222b07146e36@linaro.org>
Content-Language: en-US
From: Depeng Shao <quic_depengs@quicinc.com>
In-Reply-To: <ff12ce12-41d6-4aa5-ab97-222b07146e36@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 70i7xzCDPhXxrhCIzUv5QAuDxDbAINmM
X-Proofpoint-ORIG-GUID: 70i7xzCDPhXxrhCIzUv5QAuDxDbAINmM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-08_14,2024-08-07_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0 spamscore=0
 clxscore=1015 malwarescore=0 mlxlogscore=778 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408080099

Hi Bryan,

On 8/7/2024 11:37 PM, Bryan O'Donoghue wrote:
> On 07/08/2024 16:03, Depeng Shao wrote:
>> Hi Bryan,
>>
>> On 8/7/2024 10:04 PM, Bryan O'Donoghue wrote:
>>> On 07/08/2024 14:08, Depeng Shao wrote:
>>>> Hi Vladimir,
>>>>
>>>> On 8/5/2024 5:26 AM, Vladimir Zapolskiy wrote:
>>>>> Hi Bryan,
>>>>>
>>>>> On 8/1/24 11:16, Bryan O'Donoghue wrote:
>>>>>> On 01/08/2024 00:43, Vladimir Zapolskiy wrote:
>>>>>>>> +    ret = csiphy->res->hw_ops->init(csiphy);
>>>>>>>
>>>>>>> Here.
>>>>>>
>>>>>> What name would make more sense to you ?
>>>>>
>>>>> according to the implementation the .init() call just fills some 
>>>>> data in
>>>>> memory, so I believe this could be handled at build time, if it's done
>>>>> carefully enough...
>>>>>
>>>>
>>>> This camss-csiphy-3ph-1-0.c is reused by many platforms, the old 
>>>> platforms have same CSI_COMMON_CTR register offset, their offset are 
>>>> 0x800, but some new platforms may have different CSI_COMMON_CTR 
>>>> register offset, for example, the CSI_COMMON_CTR register offset is 
>>>> 0x1000 in sm8550, then we need to add new file to support the new 
>>>> csiphy HW, e.g., camss-csiphy-3ph-2-0.c, so Bryan asked me to 
>>>> develop the CSIPHY driver based on his changes, then we just need 
>>>> few code to enable new CSIPHY.
>>>>
>>>> Regarding the hw_ops->init interface, since it fills HW register 
>>>> configurations and HW register offset, then maybe, it also can be 
>>>> called as HW operation.
>>>>
>>>> And looks like we can't move it to camss-csiphy.c since it does 
>>>> platform specific operation and it is related to the registers.
>>>>
>>>> Please feel free to share other comments if you don't agree with it. 
>>>> Thanks.
>>>>
>>>>
>>>> Thanks,
>>>> Depeng
>>>
>>> So, I agree the phy init data could be obtained via resource structs 
>>> but, rather than add yet more patches to this series, I'd say we can 
>>> make the move to a separate resource struct pointer at a later date.
>>>
>>> Lets drop this patch and @Depeng we can then do
>>>
>>
>>> +    regs->offset = 0x800;
>>>
>>> media: qcom: camss: csiphy-3ph: Use an offset variable to find common 
>>> control regs
>>>
>>
>>
>> Do you mean only drop "[PATCH 04/13] media: qcom: camss: csiphy: Add 
>> an init callback to CSI PHY devices"?
>>
>>
>> [PATCH 05/13] media: qcom: camss: csiphy-3ph: Move CSIPHY variables to 
>> data field inside csiphy struct
>> Do you mean this is still needed? Just don't move the code from 
>> csiphy_gen2_config_lanes to csiphy_init, right?
>>
>>
>> [PATCH 06/13] media: qcom: camss: csiphy-3ph: Use an offset variable 
>> to find common control regs
>> The offset change is also needed, just need to add the offset for 
>> different platform in csiphy_gen2_config_lanes .
>>
>> Please correct me if my understanding is wrong. Thanks.
> 
> Correct.
> 

I'm updating the code based on above comments, but I meet crash issue if 
I move the offset assignment to csiphy_gen2_config_lanes, since the 
csiphy->res->hw_ops->reset(csiphy) is called earlier than 
csiphy_gen2_config_lanes, so if we don't have the .init interface, we 
only can move this offset value to `struct csiphy_subdev_resources`, but 
if we add the offset to `struct csiphy_subdev_resources`, then below two 
patches are also can be dropped.


[PATCH 05/13] media: qcom: camss: csiphy-3ph: Move CSIPHY variables to 
data field inside csiphy struct
[PATCH 06/13] media: qcom: camss: csiphy-3ph: Use an offset variable to 
find common control regs


Could you please comment on if I need to add the CSI_COMMON_CTR offset 
to res directly?
Or add back the .init interface?

---
[   43.162439] Unable to handle kernel NULL pointer dereference at 
virtual address 000000000000000c

[   43.428307] Call trace:
[   43.430823]  csiphy_reset+0x28/0x60 [qcom_camss]
[   43.435572]  csiphy_set_power+0x1e8/0x2d4 [qcom_camss]
[   43.440846]  pipeline_pm_power_one+0x74/0x10c [videodev]
[   43.446306]  pipeline_pm_power+0x44/0xe0 [videodev]
[   43.451313]  v4l2_pipeline_pm_get+0x44/0x80 [videodev]
[   43.456588]  video_open+0x6c/0xc4 [qcom_camss]
[   43.461158]  v4l2_open+0xb8/0x100 [videodev]
[   43.465549]  chrdev_open+0x174/0x208
[   43.469224]  do_dentry_open+0x290/0x4b4
[   43.473164]  vfs_open+0x30/0xf0
[   43.476397]  path_openat+0xaec/0xd2c
[   43.480069]  do_filp_open+0xb4/0x158
[   43.483739]  do_sys_openat2+0x84/0xe8
[   43.487500]  __arm64_sys_openat+0x70/0x98
[   43.491619]  invoke_syscall+0x40/0xf8
[   43.495383]  el0_svc_common+0xa8/0xd8
[   43.499143]  do_el0_svc+0x1c/0x28
[   43.502545]  el0_svc+0x38/0x68
[   43.505691]  el0t_64_sync_handler+0x90/0xfc
[   43.509989]  el0t_64_sync+0x190/0x194
[   43.513751] Code: 52800028 aa0003f3 52827100 5283e801 (b9400e8a)
[   43.520010] ---[ end trace 0000000000000000 ]---
Segmentation fault

Thanks,
Depeng


