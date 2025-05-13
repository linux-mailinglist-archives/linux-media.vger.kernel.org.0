Return-Path: <linux-media+bounces-32388-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AC26AB55BD
	for <lists+linux-media@lfdr.de>; Tue, 13 May 2025 15:14:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 29B537B4A63
	for <lists+linux-media@lfdr.de>; Tue, 13 May 2025 13:13:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC11C28EA65;
	Tue, 13 May 2025 13:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="K3WTJ+B5"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8762424397A;
	Tue, 13 May 2025 13:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747142047; cv=none; b=rdIg0iToyxck8TqLa3d3YOmK/NqOoCfjrZ/ArJiivzmna90yxtMRkY4b5zkXPQBAsMkq0n/alyy2KlFKL9FkySrUrRz47XDz68hD5oQpCDr2d6T75ZuCoe1GW1JAlRw31FPQ3bTUIAt078GIChSXebHoZg1QrsA37y5uGZeIW80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747142047; c=relaxed/simple;
	bh=9qYzq2shSFDDkR3f0FiqWCgsrvJDozSPoDj5zHqfdwY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=KEVTbkriFnVCcquHC20A9WRMLNknXbxlY8jHTkY9i99svpa7Ykaysu0d+wnAMGISCYPszPkXRKmw1lG8WwQwut/XWUZb5pcIF/UKn7xn+ogTGfIFvNAGd6fkfo8tNzbkTxaX98curuifamNO2oPIKsBjiYzqb10Xz59JC232LOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=K3WTJ+B5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54D6PeRE022722;
	Tue, 13 May 2025 13:14:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jF6x9fttJR2HbAsgmsB6mkGPnwiACPSiXe3vG6c/vdk=; b=K3WTJ+B5PxbuY0ln
	t4VMVCjdRPVz0vKvcptH8IpbffceJ3M4pVskKm0Bjvc6uofAje4Vj3xSx8Wh34gR
	+xh3SNdkKWe9qmJlQHedewdL3l7TxunfNJ6tsTlk2Rz6phahFWCPByUQ2UN2Ln/h
	ReqoNhhBW2ravjdfL2QvGLHHESsEXn3AfXfNxSOYxzNXqf/ZQbQwpmje2DwbLY8D
	6LxoxfGigPWswgi6VOGofdYIzyY2ax4oWae3+yH6iYnqXUbF7o9TQ9ULd43Tsaxk
	6uFHfPOr15sYptGZUAxxyuDBlMYoHwql++tqjFkCnByUcQXZNHiwrJ2RAtZXtjqX
	u57qkQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46kdsp410g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 May 2025 13:14:00 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54DDDxl7007677
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 May 2025 13:13:59 GMT
Received: from [10.50.52.254] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 13 May
 2025 06:13:56 -0700
Message-ID: <7e6fc439-b948-6777-0a70-a8ea58b1f7bd@quicinc.com>
Date: Tue, 13 May 2025 18:43:53 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 1/2] media: venus: fix OOB read issue due to double
 read
Content-Language: en-US
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vedang Nagar
	<quic_vnagar@quicinc.com>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250215-venus-security-fixes-v2-0-cfc7e4b87168@quicinc.com>
 <20250215-venus-security-fixes-v2-1-cfc7e4b87168@quicinc.com>
 <79691e26-cddb-47d2-9112-deae3f9aaee6@linaro.org>
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
In-Reply-To: <79691e26-cddb-47d2-9112-deae3f9aaee6@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: JMjbAZVqLz-G-p7IdoGID5YPt3VsJPva
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEzMDEyNSBTYWx0ZWRfX9sd+Zxee6WqQ
 xJ0dxltk8gIBWP8tw1jbZLKAjOv74DAHc18S3x09MXNVQubWQJ6kZwFjt3whA6mBQiFuQ+USoYF
 fS3Iz7DZLMgpHaoxvAOBrmfVQefKCwXIJZ3yCuBRh3MXTy6uocda4Atel/Dj4EBlv3iswrRUKJb
 eq/igw0pidDCH8Vakkf1n1MP3jo9Y/dlkpTKa+HegO8mL1x479+L2qQoPItuH3tF9flywVr21eq
 v2pEYG5j8akKxPCKZBAAxR7se78AHIJSQf6mSzPUWuAgsngoR8NNEmdWc4cYJrrUBAq8Y1DZ9Yp
 2wykWJzZzpgPnO8Vdn1bk/qT5HFRI1xY8HbtGCGWuuoqGhre911TtqFn2Kc4RVIjzSgfGF8ojQQ
 g9CoNE1q/RCcrRslzSESMIW9BJSnWLjFvLw0v8AtaYcvXi5dBFHK8WADAG59icoaoNM2hEtP
X-Authority-Analysis: v=2.4 cv=TrfmhCXh c=1 sm=1 tr=0 ts=68234598 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=RWc0MnvpR_tpw4Xja0UA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: JMjbAZVqLz-G-p7IdoGID5YPt3VsJPva
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-13_01,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 spamscore=0 malwarescore=0 mlxlogscore=753
 suspectscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 mlxscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505130125



On 3/4/2025 7:15 PM, Bryan O'Donoghue wrote:
> On 15/02/2025 17:19, Vedang Nagar wrote:
>> During message queue read, the address is being read twice
>> from the shared memory. The first read is validated against
>> the size of the packet, however the second read is not
>> being validated. Therefore, it's possible for firmware to
>> modify the value to a bigger invalid value which can lead
>> to OOB read access issue while reading the packet.
>> Added fix to reupdate the size of the packet which was
>> read for the first time.
>>
>> Signed-off-by: Vedang Nagar <quic_vnagar@quicinc.com>
>> ---
>>   drivers/media/platform/qcom/venus/hfi_venus.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/media/platform/qcom/venus/hfi_venus.c
>> b/drivers/media/platform/qcom/venus/hfi_venus.c
>> index
>> f9437b6412b91c2483670a2b11f4fd43f3206404..c124db8ac79d18f32289a690ee82145dc93daee6 100644
>> --- a/drivers/media/platform/qcom/venus/hfi_venus.c
>> +++ b/drivers/media/platform/qcom/venus/hfi_venus.c
>> @@ -298,6 +298,7 @@ static int venus_read_queue(struct venus_hfi_device
>> *hdev,
>>               memcpy(pkt, rd_ptr, len);
>>               memcpy(pkt + len, queue->qmem.kva, new_rd_idx << 2);
>>           }
>> +        *(u32 *)pkt = dwords << 2;
>>       } else {
>>           /* bad packet received, dropping */
>>           new_rd_idx = qhdr->write_idx;
>>
> 
> This is confusing - where is the read
> 
> Your previous code
> 
> https://lore.kernel.org/lkml/20250104-venus-security-fixes-v1-1-9d0dd4594cb4@quicinc.com/
> 
> memcpy(pkt, (u32 *)(queue->qmem.kva + (rd_idx << 2)), sizeof(u32));
> 
> V1 then would have been:
> 
> if (new_rd_idx < qsize) {
>     memcpy(pkt, rd_ptr, dwords << 2);
> } else {
>     size_t len;
> 
>     new_rd_idx -= qsize;
>     len = (dwords - new_rd_idx) << 2;
>     memcpy(pkt, rd_ptr, len);
>     memcpy(pkt + len, queue->qmem.kva, new_rd_idx << 2);
> }
> 
> + memcpy(pkt, (u32 *)(queue->qmem.kva + (rd_idx << 2)), sizeof(u32));
> 
> V2 proposed:
> 
> if (new_rd_idx < qsize) {
>     memcpy(pkt, rd_ptr, dwords << 2);
> } else {
>     size_t len;
> 
>     new_rd_idx -= qsize;
>     len = (dwords - new_rd_idx) << 2;
>     memcpy(pkt, rd_ptr, len);
>     memcpy(pkt + len, queue->qmem.kva, new_rd_idx << 2);
> }
> 
> + *(u32 *)pkt = dwords << 2;
> 
> My comment wasn't about use of memcpy() it was about why we are doing this.
> 
> For example if new_rd_idx < qsize is true then we literally do
> 
> a) memcpy(pkt, rd_ptr, dwords << 2);
> b) *(u32 *)pkt = dwords << 2;
> 
> and the question is why ? That is an unambiguous cast of pkt to the value
> of dwords << 2;
> 
> What is the scope of how the data can change from a to b ?
> 
> And why is the data considered potentially invalid @ the memcpy() but valid
> subsequent the cast ?
> 
The concern here is not about the value of dword which will be fixed once
we read the *rd_ptr first time and validate it.

The concern here is, with the data contents at rd_ptr which could be
tempered with after validation, because the memory is shared by firmware

So the real problem here is:
- driver read *rd_ptr, extract dwords = *rd_ptr >> 2, and validate it, lets
say this value is 10
- then copy dwords << 2 bytes from rd_ptr to a kernel buffer (pkt).
- But: the first 4 bytes at rd_ptr (which represent the size field again)
could have changed in the meantime — now saying 40 instead of the original 10.

security concern here is:
Even though the outer dwords is correct, the copied content might claim to
be bigger than what was validated — potentially tricking the rest of the
system into processing garbage or running past buffer bounds.

This is not a TOCTOU on the dwords, but a TOCTOU on the contents at rd_ptr,
where the firmware changes the actual data after size is checked, but
before it's copied.

> Assuming rd_ptr contains the length of dwords << 2 to begin with in the
> first 4 bytes - why is it necessary to make _really_ _really_ sure by
> restuffing the data ?
> 
> For example if *(u32 *)rd_ptr != dwords << 2 - why shouldn't we just throw
> the whole frame away as containing junk data ?

Agree with returning error during mismatch instead of forcefully
overwriting the content.

Thank,
Dikshita
> 
> ---
> bod
> 

