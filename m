Return-Path: <linux-media+bounces-24871-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AD318A14B4B
	for <lists+linux-media@lfdr.de>; Fri, 17 Jan 2025 09:39:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F22EC188C297
	for <lists+linux-media@lfdr.de>; Fri, 17 Jan 2025 08:39:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1F3B1F91C3;
	Fri, 17 Jan 2025 08:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="XK0MqosS"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7181E1F8692;
	Fri, 17 Jan 2025 08:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737103179; cv=none; b=qDWLWMFOQPEy4fJTtaE3XE4hDJqZIitV7jtrqkbfxWomM2tLCClS4kgai4Z5elNFIRDXdt63KQJYFAymwjiEFQuzCFU+LWY6kfnEyEyAL6BLTYHElF7HVUaWBIiFwMRG73R6k4GfFNVnHxd/ygUKafkWL94hNXPnrOVnEEWFz0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737103179; c=relaxed/simple;
	bh=p7DckLP+Fg8l7T1TgWQDnjOz+exC98Xk9hkY2e1julI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Tzp4w2F/pKuut6wjxAp3ayeBHBLffhykhMD5Sr6IlRiNOVQjhhp4ThZNGp7pfnpZ8Bn/utUZ6diNnHF4v9WHNC7azhuB+pCJVA8GJeWPLH4dwnIE3wiiHyQvsb5G7fbXgHUBA18W35Lgh4wTg1mN//30Sc4evQzMEVnyNhGZxoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=XK0MqosS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50H2Rg48029943;
	Fri, 17 Jan 2025 08:39:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xNEKs94knG1RPhMS8Jo/Buhm+v3QjxcyZINS1daSgPs=; b=XK0MqosSy9+acaHG
	/ssbQBrTGXEj1TwDTF7PKyijK00PTP55L5yMGbKzmdLdQNTqHmttxO836BGiNbZb
	4vfUnlexSAWE+2DreBYXyW9RUMBHxCw3+tfMqR2g328a4P6zajzRK/F56fDK61X1
	ZzBOZXgn2dyK1aOD5Q/83jRYvXXUQTwuTsMIXtG8xsaX/oHKT4q8jPRycDopkTCJ
	TqKJzDpfI4EBA7l86KxjB8ycKTnlxiJWOn0BkboxlvmS2ZKIcywMD5y5KnUmpFxz
	bF4dM0O73d1m4QCxCwcyHMwxnMQYwcuA5NysYN5xB8fkbuyP2zNXxE551myMqhG0
	qBUgOg==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 447eemrs4n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Jan 2025 08:39:26 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50H8dQhF000450
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Jan 2025 08:39:26 GMT
Received: from [10.216.55.47] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 17 Jan
 2025 00:39:23 -0800
Message-ID: <13259345-02b0-47ff-94a8-530a17c50b97@quicinc.com>
Date: Fri, 17 Jan 2025 14:09:20 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] media: venus: fix OOB read issue due to double read
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Stanimir Varbanov
	<stanimir.k.varbanov@gmail.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250104-venus-security-fixes-v1-0-9d0dd4594cb4@quicinc.com>
 <20250104-venus-security-fixes-v1-1-9d0dd4594cb4@quicinc.com>
 <f18c1277-0d72-4f7c-b325-5f19cfb0ab98@linaro.org>
Content-Language: en-US
From: Vedang Nagar <quic_vnagar@quicinc.com>
In-Reply-To: <f18c1277-0d72-4f7c-b325-5f19cfb0ab98@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: gHhqHmVAjh2NaMegAkmWwhTd4fOwB54k
X-Proofpoint-ORIG-GUID: gHhqHmVAjh2NaMegAkmWwhTd4fOwB54k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-17_03,2025-01-16_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 adultscore=0
 priorityscore=1501 mlxscore=0 lowpriorityscore=0 malwarescore=0
 bulkscore=0 clxscore=1015 spamscore=0 phishscore=0 impostorscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501170068

Hi Bryan,

On 1/6/2025 5:28 AM, Bryan O'Donoghue wrote:
> On 04/01/2025 05:41, Vedang Nagar wrote:
>> During message queue read, the address is being read twice
>> from the shared memory. The first read is validated against
>> the size of the packet, however the second read is not
>> being validated.
> 
> A brief scan of this code doesn't really show the base case you assert here.
> 
> Could you be a bit more explicit.
> 
>  Therefore, it's possible for firmware to
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
>> diff --git a/drivers/media/platform/qcom/venus/hfi_venus.c b/drivers/media/platform/qcom/venus/hfi_venus.c
>> index f9437b6412b91c2483670a2b11f4fd43f3206404..64cc9e916f53e5a9c82b1ff25c4475d622ebc321 100644
>> --- a/drivers/media/platform/qcom/venus/hfi_venus.c
>> +++ b/drivers/media/platform/qcom/venus/hfi_venus.c
>> @@ -298,6 +298,7 @@ static int venus_read_queue(struct venus_hfi_device *hdev,
>>               memcpy(pkt, rd_ptr, len);
>>               memcpy(pkt + len, queue->qmem.kva, new_rd_idx << 2);
>>           }
>> +        memcpy(pkt, (u32 *)(queue->qmem.kva + (rd_idx << 2)), sizeof(u32));
> 
> I'm not entirely following your reasoning here.
> 
> Here's how the code looks after your change:
> 
> if (new_rd_idx < qsize) {
>     memcpy(pkt, rd_ptr, dwords << 2);
> } else {
>     size_t len;
>     
>     new_rd_idx -= qsize;
>     len = (dwords - new_rd_idx) << 2;
>     memcpy(pkt, rd_ptr, len);
>     memcpy(pkt + len, queue->qmem.kva, new_rd_idx << 2);
> }
> 
> memcpy(pkt, (u32 *)(queue->qmem.kva + (rd_idx << 2)), sizeof(u32));
> 
> Which of the above memcpy() operations is subject to a pointer that firmware can influence exactly ?
Below is the first read where dwords is being validated properly with the checks.
dwords = *rd_ptr >> 2;

Whereas the same address is being read for the second time:
memcpy(pkt, rd_ptr, dwords << 2);

For the second read the value is not validated which may get updated from the firmware
leading to incorrect memcpy into the packet and may lead to OOB read access while accessing
the packet.

To avoid the issue, planning to repopulate the pkt with the first read like below:
 *(u32 *)pkt = dwords << 2;
Pls ignore the original solution which seems to be not correct.
Pls let me know if it looks good, will fix it in next version.

Regards,
Vedang Nagar
> 
> Is this a real problem you've seen if so please add a backtrace to this commit log.
> 
>>       } else {
>>           /* bad packet received, dropping */
>>           new_rd_idx = qhdr->write_idx;
>>
> 
> If this is a fix it requires a Fixes: tag.
> 
> Please add.
> 
> Still finding the reasoning you are outlining here not obvious.
> 
> ---
> bod


