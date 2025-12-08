Return-Path: <linux-media+bounces-48364-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB8ACABD85
	for <lists+linux-media@lfdr.de>; Mon, 08 Dec 2025 03:30:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AE74230102B3
	for <lists+linux-media@lfdr.de>; Mon,  8 Dec 2025 02:29:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A78B1254B03;
	Mon,  8 Dec 2025 02:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FlnPPFmB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j76cw5Tg"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3919B2236E9
	for <linux-media@vger.kernel.org>; Mon,  8 Dec 2025 02:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765160992; cv=none; b=KiHroaTplRIjp6AKI0sB9PInhCxxhvg8ZRsKmwz4GlOUYoyjecuBr4H+mUB/+lkd17Yba5vUpcSnNj2WvNUGJpFMjcBVdlQaQlnRxGJxV9a3ymazhOhXzI6d7YssMLOMVhY/hNG6O8Mu/zgwsOP57hU2Gibwb69VfdSxRX2JN44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765160992; c=relaxed/simple;
	bh=hzc8C19r7uH0dsdvAPpDbmQcPxhEeBMAJ7Ie42BTpJg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CggLo2pFCSjNh4frljKlJ41WJQqRXGTgLRctd/FAOpyfmxyzf9Hc3dbq7R99gQQjkpiWfSfOMQAEFE3FiGiF9+wj0N9yGupTR8ff5NryqKYqTUqAClr6gphHqwn4Dp0n5DNMUaSGk9rC+ERwSKBwSzHN7NeNv37GR1k8i4owDZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FlnPPFmB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j76cw5Tg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B7LwJP53567175
	for <linux-media@vger.kernel.org>; Mon, 8 Dec 2025 02:29:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Bmi1w9LBw44P51v6VUD3hZr1/SiIEf8YjqeuvDA6TzQ=; b=FlnPPFmB0TBzjFNC
	AQQTeuaGXqB+Dpl9mdDvUNRvbLvrEjPssBFwq3oDKIRatXk19ovX6u/EzboTPaEO
	RRnCLwbs2agAg/3FIs47HaSxOnRc7i5b2XjUcUDnvw7ro5as5S9ND+/c4wbyHrXJ
	nKJtZAHCeqoPykK2tXCslQMI9BBkW9hCsd1+lJqM5ODnnQbDAg9EqiJPCrtelBee
	A5gBAFfviWKLbeIGU8LWg9VTFLjpgMJj5cSuUA6PECInBOrggy79qIbY5GLlQm0r
	ZMyaIevV6V89wMr7KvCEeYa1kODHlgEq+ZgKEkHBSZRdCt6ARepxtzdUCFGqm93n
	Txoarg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4avc2wkcjb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 08 Dec 2025 02:29:48 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7b80de683efso6396055b3a.3
        for <linux-media@vger.kernel.org>; Sun, 07 Dec 2025 18:29:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765160988; x=1765765788; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Bmi1w9LBw44P51v6VUD3hZr1/SiIEf8YjqeuvDA6TzQ=;
        b=j76cw5TgD4TckWC9vqvGaKJA5La/y/OGdFj0G5guqPo8ybguxpRUu5w8+yMb4PoR41
         sXZ2s+Y6nafovP40bmFxQ2HRIxVLaA1iNk4WBgsEIeF1JrbW4TyHC7m181Y+R9XMmFF5
         Nvy7QlwmkaIkn7SgHgusM6W5bahH+YYqcxQRT3SLw5eWR6DXTr/9r4qfpIEJtGsAoru7
         dGToXEKfHBNRyd7FPMQm41tlo1HELcBv4vaFtTjmuE98y8AsL6f+JHznv4MSqCR10T1b
         5953SwZFWbyVd/AXjJRZRd1eswFc9ZC0xL/QRiLkz9JrYjGG7lsHaYGxrDlklR++Wcn/
         eBfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765160988; x=1765765788;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bmi1w9LBw44P51v6VUD3hZr1/SiIEf8YjqeuvDA6TzQ=;
        b=oBmRGK5XHD+6VDMbbp8322EL00KjkXqkijo/17Mb3K5XekbFmYLYJP4kF8VWjRUCkj
         VmTR+eAU6B8N8va6fza6E8EOJr8x/hfhg1um5md+xlznGsEr0ihQcDZGsa93QhtLfg0Y
         qkc/lOajOHgSJnMTeTOMjZEtq4MmHQkecr4Mc5bkZiCEwHj08pGmo91qb1WQiV+/Gpew
         bop88rePvHygRqG61OnNjFExs+tbPL8peERigLikLXfhysu7ZGc2w0YlbSly/lb18dao
         uBOvypfXhSo3cSlEYuSnAchg1BhpAnZrZ4nlycs/ZNL+d3zJGtsbvF6ciZ66ThRDsEEP
         zm3A==
X-Gm-Message-State: AOJu0Yw/CwrWB+bBOR9CiGZHPnSxrKe2w0ZphDce3QIFRc6ahJueeLNY
	xnQ/iCf0989Rx8AzX+ym9Q+DOce4hwMZ2sRfthosJN2TjS1RTmNRO+UiMhXHlD9C/LpIU2nsPZC
	eeZ5tmjg66vgPNn6Dur/YKC1E4EacfkbN968aHwknruS+xZlCdanyBNBPT2tnFq/QDA==
X-Gm-Gg: ASbGncuKi4Vu+0xq0qVWprShla10DFJqZrq8frQdDjPPkqruhA+cNhUdmHLmzFxejIy
	8qODczfHroLRzI2uOFGLtJ5ZLFd892Hf585Z+dHTeN/MnCW2CxaMnhUCXTwySxuFwKFwLMEaHz/
	xNXVnqUl7uI1uuUwTUhibAks1eBX5cPsj2lVsmoUVdmOkM9F1kEQfRzfacHwrMdWzo8+OFG6S2A
	TAwvMzEhTHA91i7UIJh/XndtzfbQbKc/FVMogMDhLWDy6Wfb93a92/ALDTlOINrlf+zK7bF8ehy
	xi9FOvK2Z/epzexl6C55dVieVKNLtXExQUMhzVI0z2OmhzRzddUMyuvrVS5aqLyTeQg0MSVwbh3
	kxGPLEMUm32quHGpqZFKfw2IoRSiik4tJ1dhyySHABRbHZpUu5Hu61aB8v5lpjVK1nxile+8k3h
	v50luOvg==
X-Received: by 2002:a05:6a00:12c6:b0:7e8:450c:61c5 with SMTP id d2e1a72fcca58-7e8c561fabdmr6053057b3a.53.1765160987596;
        Sun, 07 Dec 2025 18:29:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEvFA5MAKIrZF6hTwwV49e2Ex0RmYD0kAZYHj4bWBKUpGSCC5rnpUZc4TaQgn6L+cw1qN12KA==
X-Received: by 2002:a05:6a00:12c6:b0:7e8:450c:61c5 with SMTP id d2e1a72fcca58-7e8c561fabdmr6053038b3a.53.1765160987126;
        Sun, 07 Dec 2025 18:29:47 -0800 (PST)
Received: from [10.133.33.217] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7e801c6a1fcsm6496521b3a.4.2025.12.07.18.29.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Dec 2025 18:29:46 -0800 (PST)
Message-ID: <32bf8a1a-9e9b-438c-89c7-9fa0c88e9ca2@oss.qualcomm.com>
Date: Mon, 8 Dec 2025 10:29:41 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: venus: vdec: fix error state assignment for zero
 bytesused
To: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <3TiW-6pGFzHye29VWlJBXCdsteVQOc5LlAPyURHQMjIMusStSaLFbZE_dWv8B9GPFjM91n17iLSlulpcBpy4ow==@protonmail.internalid>
 <20251126-fix-error-state-v1-1-34f943a8b165@oss.qualcomm.com>
 <5516cc69-de15-44df-bfbf-8263e71c919a@kernel.org>
Content-Language: en-US
From: Renjiang Han <renjiang.han@oss.qualcomm.com>
In-Reply-To: <5516cc69-de15-44df-bfbf-8263e71c919a@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: uLZI4jFFVRqIdkhaT9d_9fFKgNjSgqJN
X-Proofpoint-ORIG-GUID: uLZI4jFFVRqIdkhaT9d_9fFKgNjSgqJN
X-Authority-Analysis: v=2.4 cv=d774CBjE c=1 sm=1 tr=0 ts=6936381c cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=Wn1kp30-KnWUW-RVUJoA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA4MDAxOSBTYWx0ZWRfXyKv+50kReE2G
 WtmbgtUVMkGcGrD1mbVeUJwvIU4Nc6ZH9DhvoXgGdCIHJb7Ob8Q/33pfiePmck2CxUT9LqRgGeQ
 NuNHS54gTkNZsqg5RaphypR/EOuiRdmkqg0xE95/QZfXfugC4yaFg8RbBRx1hzjTp1gMYQM0Lbx
 NRSRUiHjzqDWOPc6g1pejyUqZqffPPhqKfv1uSG3Ku52FhIt86olwokw21A8yvDFLSZdiHW1G8S
 X5hm6zngqphpqZdcBC93hNJftB/r4XLjkWwGa0QoCT9DAcxiKAEaS72/8b/Foyp5P4/J2zl4vDr
 LiNv9HEA8AE52HHOPLc3Ygyo1KoghBiWbtGjDULB1GSv6V+Z+F2hCn3R7kD6TQKL0T+JPJcUQOL
 NxQoaFr1USrfQyBpSBD2K3q1aHYp7A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-06_02,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 clxscore=1015 impostorscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512080019


On 12/7/2025 7:56 AM, Bryan O'Donoghue wrote:
> On 26/11/2025 04:23, Renjiang Han wrote:
>> Previously, the check for zero bytesused and the assignment of error
>> state was performed outside the V4L2_BUF_FLAG_LAST branch, which could
>> incorrectly set the error state during drain operations. 
>
> This deserves more elaboration.
>
> Instead of saying previously - talk about what it currently does and 
> the precise circumstances under which it goes wrong. Try to make the 
> description as plain and concise as possible.
>
> This patch
>> moves the zero-bytesused check inside the 'else' branch, ensuring that
>> the error state is only set for non-EOS buffers with zero payload.
>>
>> Additionally, the patch keeps the rest of the buffer state handling
>> logic unchanged, including handling of HFI_BUFFERFLAG_DATACORRUPT and
>> HFI_BUFFERFLAG_DROP_FRAME.
>
> I don't think you need to tell us what's not touched in your commit log.
>
> - Tell us what is wrong directly and plainly.
>   Include how the bug you are fixing can come about i.e. under what
>   circumstances we would see the error.
>
> - Then tell us how you've fixed it.
>
> - And include a Fixes: tag please.
>   Since this is a bug fix you are proposing, it needs to be backported.
sure, thanks for your comments.
>
>>
>> Signed-off-by: Renjiang Han <renjiang.han@oss.qualcomm.com>
>> ---
>> This patch refines the error state assignment logic in the Venus vdec
>> driver for Qualcomm platforms. Specifically, it ensures that the buffer
>> state is only set to VB2_BUF_STATE_ERROR for non-EOS capture buffers
>> with zero bytesused, preventing false error reporting during drain
>> operations.
>> ---
>>   drivers/media/platform/qcom/venus/vdec.c | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/venus/vdec.c 
>> b/drivers/media/platform/qcom/venus/vdec.c
>> index 
>> 4a6641fdffcf79705893be58c7ec5cf485e2fab9..d0bd2d86a31f9a18cb68b08ba66affdf8fc5092d 
>> 100644
>> --- a/drivers/media/platform/qcom/venus/vdec.c
>> +++ b/drivers/media/platform/qcom/venus/vdec.c
>> @@ -1440,10 +1440,10 @@ static void vdec_buf_done(struct venus_inst 
>> *inst, unsigned int buf_type,
>>                   inst->drain_active = false;
>>                   inst->codec_state = VENUS_DEC_STATE_STOPPED;
>>               }
>> +        } else {
>> +            if (!bytesused)
>> +                state = VB2_BUF_STATE_ERROR;
>>           }
>> -
>> -        if (!bytesused)
>> -            state = VB2_BUF_STATE_ERROR;
>>       } else {
>>           vbuf->sequence = inst->sequence_out++;
>>       }
>>
>> ---
>> base-commit: 663d0d1af3faefe673cabf4b6b077149a87ad71f
>> change-id: 20251126-fix-error-state-24183a8538cd
>>
>> Best regards,
>> -- 
>> Renjiang Han <renjiang.han@oss.qualcomm.com>
>>
>
-- 
Best regards,
Renjiang Han


