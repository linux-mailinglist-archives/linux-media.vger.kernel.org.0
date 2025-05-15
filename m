Return-Path: <linux-media+bounces-32578-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7517AAB8365
	for <lists+linux-media@lfdr.de>; Thu, 15 May 2025 11:57:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2D3847A5364
	for <lists+linux-media@lfdr.de>; Thu, 15 May 2025 09:55:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C909C297A75;
	Thu, 15 May 2025 09:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="gSXO3jlU"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F20529615A;
	Thu, 15 May 2025 09:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747303017; cv=none; b=r9Kgj51OUvki6odJNwPFLWJm6vv1lszOT3SBVlPbP0bxJnUDAiJIlKTjEotu44MIDX+9U5iWYnvMiGKIgHcCLtvKuG7xb4KVvxgSJRHfDyPnj/1qSZrDfMSmQuFyftM7+D9vzgzhr3FRd8BJRwcn7kTTgHT3RpaGx2VDW31y70M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747303017; c=relaxed/simple;
	bh=3bVabG5wuWAuoJv+aIqIxKDBMpqwpxiNsKjVfJd0U+Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=JHv85FGd07IvnzlxFJec5oBZGVgjb2VCssaTS7AtVjGDgDAMYO47UdnJ62zid9lVBSgrQgChWxD3EF6kJdg+A8p3V3sBaqMZ+8nLgWc+o2pyEExqTgMf109EyAUKtgMqf9d5rcm7TmzwkhR/UlMu4b+U7bKXiIFtWsHHaFlp1h0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=gSXO3jlU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54F975YA002615;
	Thu, 15 May 2025 09:56:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WOOov3RS6Ydo3ngYOkahPy2c/nhvIBfF4PmFxRVZE/w=; b=gSXO3jlU0KV+m/Ru
	/Xlqg8zIKmENXelSfCkxoMvyVYVeVci5c/wuPB0a/8cQ0AqC/udup6ttQiaIXX9K
	zpTgTVfDwZMLFezVs028SOW/uklT45L8BGTjKg2uXHYKaZ6dtEFGO2vjVcd/SJGZ
	14FaYEFq0iZywPL9opYdZ2Mq+2tN+xYfLE9wQk5pSY2DIWNJkcbpuy0nuwRsZ9Pc
	2XbZL9gKGIWzF/6/65RFUnPgYa98uUBEiCRnnyvIubXFtvaG2iw++T0qTR0DlTmx
	dHhXBTIYol4uKQyIgr5QjmR+FyvvZabaK1PLXmfiL1lFe26WNxxygYkco3FKFnuk
	nqce+A==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbex5qsp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 May 2025 09:56:49 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54F9uimM009401
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 May 2025 09:56:44 GMT
Received: from [10.50.16.181] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 15 May
 2025 02:56:41 -0700
Message-ID: <0c50c24a-35fa-acfb-a807-b4ed5394506b@quicinc.com>
Date: Thu, 15 May 2025 15:26:38 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v3 1/2] media: venus: fix TOCTOU vulnerability when
 reading packets from shared memory
Content-Language: en-US
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal
	<quic_dikshita@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Hans Verkuil
	<hans.verkuil@cisco.com>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Vedang Nagar <quic_vnagar@quicinc.com>
References: <20250514-venus-fixes-v3-0-32298566011f@quicinc.com>
 <20250514-venus-fixes-v3-1-32298566011f@quicinc.com>
 <ad92cf06-636a-417a-b03b-0d90c9243446@linaro.org>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <ad92cf06-636a-417a-b03b-0d90c9243446@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE1MDA5NyBTYWx0ZWRfXxMHtXyIg6Na9
 pUQneZDdJQpGMK8W0j5pRsFH+pnxGpAQwHeYkE5uw1FSCS9+CpzFPgvbUi9ilSRZzZf3xWHgvv5
 ehXTwCOc/QCU5DAFKDquyW7QTMUADjJF4bCwg4dbvwMxNf2LaFPHXr9yQPlvR3bRGNtcBEHED7+
 GRHG50APIuGLuHtk6eUNKZ1Ycq9Iv1ZghCXTB6Z6hHY5lBqJKGe8D2AlsA+GAXG6nOm3F4ajfbS
 5GVMT11AzXPWOE9PDuVE1CQBNr7aHHAd/dQeBN5g3Wlaif/L+e3DjGDS1n558axMXc6JNfHeNoZ
 eWUF6sBEflyzgWQJiT+kQ+LfZQWqGbYRp3EpJxWw9dLD+oics2iUNjN/JcJLPTXj3PxZkIhigwJ
 ylY1wNqX3CWUINKGcAiapE9MqduM1ACTbUdwt0mVFy8m1pY1dGjdMJNK4mCAVY0kmvi/cORc
X-Proofpoint-ORIG-GUID: M6MTVWHT6bfHjPQWLyua17DViAxKSf3J
X-Proofpoint-GUID: M6MTVWHT6bfHjPQWLyua17DViAxKSf3J
X-Authority-Analysis: v=2.4 cv=IcuHWXqa c=1 sm=1 tr=0 ts=6825ba61 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8
 a=Yz-U3Qp7xdBScDdbXjEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-15_04,2025-05-14_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxscore=0 adultscore=0 mlxlogscore=999 bulkscore=0
 clxscore=1011 spamscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505150097



On 5/15/2025 2:47 PM, Bryan O'Donoghue wrote:
> On 14/05/2025 14:38, Dikshita Agarwal wrote:
>> From: Vedang Nagar <quic_vnagar@quicinc.com>
>>
>> Currently, Time-Of-Check to Time-Of-Use (TOCTOU) issue happens when
>> handling packets from firmware via shared memory.
>>
>> The problematic code pattern:
>>
>> u32 dwords = *rd_ptr >> 2;
>> if (!dwords || (dwords << 2) >  IFACEQ_VAR_HUGE_PKT_SIZE))
>>     return -EINVAL;
>>
>> memcpy(pkt, rd_ptr, dwords << 2);
>>
>> Here, *rd_ptr is used to determine the size of the packet and is
>> validated. However, since rd_ptr points to firmware-controlled memory,
>> the firmware could change the contents (e.g., embedded header fields
>> like pkt->hdr.size) after the size was validated but before or during
>> the memcpy() call.
>>
>> This opens up a race window where a malicious or buggy firmware could
>> inject inconsistent or malicious data, potentially leading to
>> information leaks, driver crashes, or undefined behavior.
>>
>> Fix this by rechecking the packet size field from shared memory
>> immediately before the memcpy() to ensure it has not beenn altered.
>>
>> Fixes: d96d3f30c0f2 ("[media] media: venus: hfi: add Venus HFI files")
>> Signed-off-by: Vedang Nagar <quic_vnagar@quicinc.com>
>> Co-developed-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
>> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
>> ---
>>   drivers/media/platform/qcom/venus/hfi_venus.c | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/media/platform/qcom/venus/hfi_venus.c
>> b/drivers/media/platform/qcom/venus/hfi_venus.c
>> index
>> b5f2ea8799507f9b83f1529e70061ea89a9cc5c8..163c8d16530bc44a84b2b21076e6189d476fe360 100644
>> --- a/drivers/media/platform/qcom/venus/hfi_venus.c
>> +++ b/drivers/media/platform/qcom/venus/hfi_venus.c
>> @@ -295,6 +295,9 @@ static int venus_read_queue(struct venus_hfi_device *hdev,
>>       new_rd_idx = rd_idx + dwords;
>>       if (((dwords << 2) <= IFACEQ_VAR_HUGE_PKT_SIZE) && rd_idx <= qsize) {
>>           if (new_rd_idx < qsize) {
>> +            if ((*rd_ptr >> 2) != dwords)
>> +                return -EINVAL;
>> +
>>               memcpy(pkt, rd_ptr, dwords << 2);
>>           } else {
>>               size_t len;
>>
> 
> Here's how this code fragment looks after the change, I'll add two "}" for
> readability and annotate
> 
> dwords = *rd_ptr >> 2; // read the value here
> if (!dwords)
>        return -EINVAL;
> 
> new_rd_idx = rd_idx + dwords;
> 
> // validate the size against a maximum value
> // this step is correct
> if (((dwords << 2) <= IFACEQ_VAR_HUGE_PKT_SIZE) && rd_idx <= qsize) {
>         if (new_rd_idx < qsize) {
>                 // Re-read the value because firmware
>                 // might have changed the value
>                 if ((*rd_ptr >> 2) != dwords)
>                         return -EINVAL;
> 
>                 // now trust dwords
>                 memcpy(pkt, rd_ptr, dwords << 2);
>         }
> }
> 
> But this is all wrong.
> 
> There is no atomicity on the APSS side between the first verification of dwords
> size and the mempcpy() the commit log itself shows that the firmware is
> free-running with respect to the instruction pipeline of the APSS, it is an AMP
> problem.
> 
> Adding another check of the dwords side right before the memcpy() doesn't
> address the problem which the commit log describes as the firmware updating the
> length field of a header in shared memory.
> 
> There are perhaps 10 assembly instructions between the first check and the
> procedure prologue of the memcpy();
> 
> Adding another length check right before the memcpy() simply reduces the number
> of CPU instructions - the effective window that the firmware can update that
> header still.
> 
> if ((*rd_ptr >> 2) != dwords) // conditional branch operation
> 
> memcpy(pkt, rd_ptr, dwords << 2);
> 
> Begins with a procedure prologue - setting up the call stack - and then is a
> series of fetch/stores to copy data from here to there
> 
> The memcpy() itself by its nature it not atomic on the front-side-bus of the
> APSS to shared DRAM with the firmware.
> 
> On a CPU and SoC architecture level this fix just doesn't work.
> 
> To be honest we are already doing the right thing in this routine.
> 
> 1. Reading the value from the packet header.
> 2. Validating the given size against the maximum size
> 3. Rejecting the memcpy() if the given size _at_the_time_we_read_ is too
>    large.
> 
> The alternative to guarantee would be something like
> 
> asm("bus master asserts bus lock to PAGE/PAGES involved");
> dwords = *rd_ptr;
> if (dwords > MAX_VALUE)
>     return -EFIRMWARE_BUG;
> memcpy(dst, src, dwords >> 2);
> 
> asm("bus master unlocks memory");
> 
> Lets say we make the change proposed in this patch, here is how it breaks:
> 
> if ((*rd_ptr >> 2) != dwords)
>     return -EINVAL;
> 
> // now trust dwords
> memcpy(pkt, rd_ptr, dwords << 2);
> 
> 
> objdump
> qlt-kernel/build/x1e80100-crd_qlt_integration/drivers/media/platform/qcom/venus/venus-core.o --disassemble=venus_read_queue.isra.0
> 
> 5c48:    540000c9     b.ls    5c60 <venus_read_queue.isra.0+0x110>  // b.plast
> 5c4c:    2a0303e2     mov    w2, w3
> 5c50:    aa0703e0     mov    x0, x7
> 5c54:    94000000     bl    0 <memcpy>
> 5c58:    52800000     mov    w0, #0x0
> 
> Your conditional jump is @ 0x5c48 your call to memcpy @ 0x5c54
> 
> Between 0x5c48 and 0x5c54 the firmware can update the value _again_
> Indeed the firmware can update the value up until the time we complete reading
> the bit of the pkt header in memcpy() so an additional few instructions for sure.
> 
> You could make some type of argument to re-verify the content of the pkt _after_
> the memcpy()
> 
> But the only verification that makes any sense _before_ the memcpy() is to
> verify the length at the point you _read_ - subsequent to the latching operation
> - were we fetch the length value from DRAM into our CPU cache, operating stack
> and/or local registers.
> 
> Once that data is fetched within the cache/stack/registers of the CPU/APSS that
> is the relevant value.
> 
> For the fix you have here to work you need this
> 
> 5c48:   MAGICOP         memorybuslock
> 5c48:    540000c9     b.ls    5c60 <venus_read_queue.isra.0+0x110>  // b.plast
> 5c4c:    2a0303e2     mov    w2, w3
> 5c50:    aa0703e0     mov    x0, x7
> 5c54:    94000000     bl    0 <memcpy>
> 5c58:    52800000     mov    w0, #0x0
> 5c5c:   MAGICUNOP       memorybusunlock
> 
> Because the firmware is free-running - with respect to the instruction pipeline
> of the above assembly.
> 
> If you really want to verify the data is still valid - it should be done _after_
> the memcpy();
> 
> But even then I'd say to you, why verify _after_ the memcpy() - and what happens
> on the instruction directly _after_ the verification - is the data considered
> more valid now ?
the patch _only_ reduces the window where data in shared queue can go wrong.
Doing it after memcpy() would be better here given the data would not be read
further from shared queue, which would avoid the case of data getting updated later.

memcpy(hfi_dev->pkt_buf, rd_ptr from shared queue, dwords..)

pkt_hdr = (struct hfi_pkt_hdr *) (hfi_dev->pkt_buf);

if ((pkt_hdr->size >> 2) != dwords)
    return -EINVAL;

Regards,
Vikash
> 
> i.e. this:
> 
> memcpy(pkt, rd_ptr, dwords << 2);
> 
> if ((*rd_ptr >> 2) != dwords)
>     return -EINVAL;
> 
> doesn't have the above described architectural race condition but it doesn't
> make the data any more trustworthy - because it doesn't have atomicity
> 
> memcpy(pkt, rd_ptr, dwords << 2);
> 
> if ((*rd_ptr >> 2) != dwords)
>     return -EINVAL;
> 
> dev_info(dev, "The value of *rd_ptr %lu!=%lu can be different now\n",
>          *rd_ptr >> 2, dwords);
> 
> Sorry this patch just can't work. It's a very hard NAK from me.
> 
> ---
> bod

