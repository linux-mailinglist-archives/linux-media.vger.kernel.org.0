Return-Path: <linux-media+bounces-55995-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iPx7J4PquGmMlgEAu9opvQ
	(envelope-from <linux-media+bounces-55995-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 06:45:39 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 047B32A4131
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 06:45:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DA868302D96F
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 05:45:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1855537FF7D;
	Tue, 17 Mar 2026 05:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HfKgb32b";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J1koVKV9"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7C1A26E6F2
	for <linux-media@vger.kernel.org>; Tue, 17 Mar 2026 05:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773726324; cv=none; b=m5bpCeMZM7us47ekQzvwNVtmo66OtkU00gKpgQtS0N99na+ExyYH8JWdAEsPZRy2goPVEHuAm9fAP/wCET5zO1c/mL/ECv7VuYmvHCsPQa+neeEkUtKYeusRc3jm5gjONsUMfWhU1yhWkZdt6aLXwEl1T8VcccB94XXEeFWpGLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773726324; c=relaxed/simple;
	bh=3UjjlLmOrws+BMC+cEQS5YEnshE6vCCr3aHVk1eJ650=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pQpcwluH88aJ4a0fuAp3EZ28Peua58N8pVqLyYgVjByJoioKGqV6SHUyNKULwkFjEWC0DeyCIGE6g27HpDCMtZ06CCpv5s4Aez2VDaHGJDehWfD7pusQaOq1Xit4h3ykbTUslUThQJtdoeSs90DdPqNlhOmG57tNrA54cajmHUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HfKgb32b; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J1koVKV9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62H5dT851621856
	for <linux-media@vger.kernel.org>; Tue, 17 Mar 2026 05:45:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nuFJ6Fd38HaZU/r7AF8ceGLoWuSwKfogJdR5jcKs3MI=; b=HfKgb32bq/keMRil
	NZzKenK5Rd2DeeUpwwzPycGFfjb4ykkFskBzErg8czzZ8QBa41FkdvzrLnMVq0C5
	A3FOWFP61Lr+OLoSZf4Krb5nfZ9gtOcYzthTCheKfvafjJccWkhv3CPJPh/XL8tX
	In9GArt3P4sRUFNNTytmJXRbY21ghCawm+TOwQozQPBlpGd/3azoUp7SkL9c1dYp
	1rDsmyO+WfpDuWckC7jHtTbvlS5Y8oBQ5vRLLMorcVhAE1kdkeFsgUduitKS3A/E
	yK7Hi4WEoL/5daVsGLZSRGgYMg2xvyyokDuhH+fJBYsju6qPck4VoFdUthx7zwNg
	Z96Hdg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxhyek4eu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 17 Mar 2026 05:45:20 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35a0998a441so34124586a91.2
        for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 22:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773726320; x=1774331120; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nuFJ6Fd38HaZU/r7AF8ceGLoWuSwKfogJdR5jcKs3MI=;
        b=J1koVKV9hl5s0Mt/exfPIrobPa3hYLrBrZqeSMYUBAK1LDlyJvBq4ELSFRtqnUh8Yg
         i107vQG3X035oZ5mTM63MAM8BRnzNAUEd94uQpd1jB5U4vGxvo0VA3fgTHesbzw/D3UW
         jpgRhu8ZKypZwp+ePEwhlS0kaI0lU+5/Ipg0Bw2I8DNyrkhiXfDzUUAC6TiFmTiob1d1
         yW9miu/zqL3ylFiAURCDNM4nXRuVEUvHGxPMhYFPXKUfbmR5pqeR6YPAa2fTVfGyVt1h
         iKxEO8agCxNqyltf9rEOejUjfYSSKrjTO8j+BTwzI36Wg7DbWQTV8b+jHlD7xAyJNrLq
         X68g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773726320; x=1774331120;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nuFJ6Fd38HaZU/r7AF8ceGLoWuSwKfogJdR5jcKs3MI=;
        b=Q9VEFX+FBzU58fQxMJcDhAlbHXnq6meRVqB7Bzvh94JkS1oBNrOH5z/P6HLbeR8+4o
         e4u4WM5xtOf8vZFgOJF63rI2lpVvZ9w2jm+gxgTZ3hO+8iM1jmO/DRx3TiAecjcuGtEQ
         CHIXz29u/iqGzZ+4T+YJllHhTJchFh0wyp7JAOGmlBk0FPa9igUY9wtSgFGTGplWGFEX
         hQxzQIdSmuucqORU9ulrYumUFyrCvjcvapTLQRUq2bTQNpFwTvFKbaACksWQBTUl1r8F
         zfZjWCFvUDiKwiGXkGDk9VrqcQZGhabQjP9+02V8FmLlN+UNoaGgTZwYp+3hAmlly8+J
         tizQ==
X-Forwarded-Encrypted: i=1; AJvYcCWehlwm0XpxtvKMmclTfkpEd6dvKJr6wtRykowfem/8oP5hQ2ydgH2zblMplzthkGJcgXVRsfN6BZkfXA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzpKo99Y35p7ksUuHUbC7Vd482TjLAODOAtw4k+sMrz0bS0Jaf6
	HXR+a/kj8W//0LJU/SeEi0fLUa3neuUk287isShAADf7DtJq9WVMTWNURWtPQH5cSJRUaLgUBmd
	4AJGi8G8FTZ8n2ZCXcdE9YQxSWGguc/PGIat7sgw4oSydLWFduCcUUFB/6ZkaCzBoNA==
X-Gm-Gg: ATEYQzwVrTz8wJ8+Qpk/EcePMXMgZRaT4CZVA/wNRBiCdCwHKhQJ8+qVZGhsXdstPKC
	2hghyGk06cDJKl8l70j66joc38UYbdgW4KrCegrZMYgBkLmtsWRaRvH6jXL45bSAzT3yFuqnmsb
	Sqp1hurG0zDAkXVo/tXEvm4p8Dq/YIjbfL/ReCwlBeN+/D3iEYAuAKrGfdTtB7MXAv/gNrwwB87
	kxY+CmJF9zqQxBjpYMml41vZaQGkCj4MW8f78t9C0SIytKP09//eg779kH4ko/9tbgtacDP4NeA
	4V0z8IwG4dnDJpZ1T47sTNwuYw/2chjS1FQFhdpNXaaU1luVjGF1WH7EO6qVdLRloCEfgtzSPVa
	DPB23UFwV+hvCo7mJ8z3VJdREUqInYkSRq673HiC3+EdWy22RHkfmLQ==
X-Received: by 2002:a17:90b:1d49:b0:356:24f0:af0c with SMTP id 98e67ed59e1d1-35a22003a84mr13566417a91.17.1773726319556;
        Mon, 16 Mar 2026 22:45:19 -0700 (PDT)
X-Received: by 2002:a17:90b:1d49:b0:356:24f0:af0c with SMTP id 98e67ed59e1d1-35a22003a84mr13566386a91.17.1773726318917;
        Mon, 16 Mar 2026 22:45:18 -0700 (PDT)
Received: from [10.0.0.3] ([106.222.229.118])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35bada2bfdbsm1559715a91.3.2026.03.16.22.45.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 22:45:18 -0700 (PDT)
Message-ID: <43894ecb-711a-588d-0a5e-b4097092e162@oss.qualcomm.com>
Date: Tue, 17 Mar 2026 11:15:14 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v4 7/8] media: qcom: iris: split firmware_data from raw
 platform data
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260313-iris-platform-data-v4-0-14927df4906d@oss.qualcomm.com>
 <20260313-iris-platform-data-v4-7-14927df4906d@oss.qualcomm.com>
 <726439a7-cf5a-74e6-1768-1bc6fb907ffc@oss.qualcomm.com>
 <24oq4plyvburuufxs6vt2kt7e3mlwlis7dekszjnxson245amy@muyu5fpohhfu>
 <5a6a6979-ff3e-0885-ce88-5c9316b9bcad@oss.qualcomm.com>
 <54bfdee8-771f-8b0e-b5d1-d9eaa934b48b@oss.qualcomm.com>
 <t5mdnrtxpeylnohpb7twl2kc2ewb5hxyscemz6iuxemkvye3h6@26t56xm5ca2j>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <t5mdnrtxpeylnohpb7twl2kc2ewb5hxyscemz6iuxemkvye3h6@26t56xm5ca2j>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: neXFNsMxVsgpzYPizEqTxRTnD7X0kmuC
X-Proofpoint-ORIG-GUID: neXFNsMxVsgpzYPizEqTxRTnD7X0kmuC
X-Authority-Analysis: v=2.4 cv=KLxXzVFo c=1 sm=1 tr=0 ts=69b8ea70 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=RgczR8+8wRjDfzPIf2UjDw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=2riDMrXVtvz-PWqHk6IA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDA0NyBTYWx0ZWRfX/WnEi4fs57Ov
 OFP2s6v70wQR3XISwTs3Dqe6q14qmcyJHuCu1JNT7v4gkqgq+rPdQ2HH1/BnPpXfuFMcRJ2X7ts
 XW8PjCP6bfCbIZmBJlx+3h9XfIzpnXmDgGvZ21rBqSWTX1jAvNIsgkd5F7aMjL6hK5TPxCcRTBq
 MUcRGz4VnxMqhIXu6uI0pY0pdZCSQPYQIlWxyo47F1BWpA74Sg/2RpCiILF5qzb+um+B32qVFt1
 WRDaO2UFAxRRjxhKeC28l7Z6As7OhWwhO/+U7/cxOf1pVVRRW7SmOh9cFi5Vjm7Ph9HHQYLwGgf
 wLMP9WboGL1szUtiUgqxIL2Vo/6PljiOfifFs/RetjJi2cfVCquj9C9TQI3N3pAESMPhXJInVJR
 dgXUbKmHq1+Fm+rbavB4G1cKtRJi+2j6BTZZK/oiy5uxfARRS+kqcOeAEg/sLAQtBR/KtsYQfIm
 FU5mKlleGoWsNEuHD2A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-16_06,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 spamscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603170047
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55995-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FROM_NEQ_ENVFROM(0.00)[dikshita.agarwal@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 047B32A4131
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/17/2026 1:29 AM, Dmitry Baryshkov wrote:
> On Mon, Mar 16, 2026 at 12:01:48PM +0530, Dikshita Agarwal wrote:
>>
>>
>> On 3/13/2026 2:55 PM, Dikshita Agarwal wrote:
>>>
>>>
>>> On 3/13/2026 1:37 PM, Dmitry Baryshkov wrote:
>>>> On Fri, Mar 13, 2026 at 01:19:21PM +0530, Dikshita Agarwal wrote:
>>>>
>>>> I'm sorry, I've refreshed the series before receiving this email. I will
>>>> send new iteration after settling the discussion here.
>>>>
>>>>> On 3/13/2026 9:00 AM, Dmitry Baryshkov wrote:
>>>>>> Having firmware-related fields in platform data results in the tying
>>>>>> platform data to the HFI firmware data rather than the actual hardware.
>>>>>> For example, SM8450 uses Gen2 firmware, so currently its platform data
>>>>>> should be placed next to the other gen2 platforms, although it has the
>>>>>> VPU2.0 core, similar to the one found on SM8250 and SC7280 and so the
>>>>>> hardware-specific platform data is also close to those devices.
>>>>>>
>>>>>> Split firmware data to a separate struct, separating hardware-related
>>>>>> data from the firmware interfaces.
>>>>>>
>>>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>>>>> ---
>>>>>>  drivers/media/platform/qcom/iris/iris_buffer.c     |  84 +++----
>>>>>>  drivers/media/platform/qcom/iris/iris_core.h       |   1 +
>>>>>>  drivers/media/platform/qcom/iris/iris_ctrls.c      |   8 +-
>>>>>>  .../platform/qcom/iris/iris_hfi_gen1_command.c     |  10 +-
>>>>>>  .../platform/qcom/iris/iris_hfi_gen2_command.c     |  66 ++---
>>>>>>  .../platform/qcom/iris/iris_platform_common.h      |  79 +++---
>>>>>>  .../media/platform/qcom/iris/iris_platform_gen1.c  |  68 +++---
>>>>>>  .../media/platform/qcom/iris/iris_platform_gen2.c  | 268 +++++++--------------
>>>>>>  drivers/media/platform/qcom/iris/iris_probe.c      |   3 +-
>>>>>>  drivers/media/platform/qcom/iris/iris_vidc.c       |  10 +-
>>>>>>  10 files changed, 246 insertions(+), 351 deletions(-)
>>>>>>
>>>>>
>>>>> <snip>
>>>>>
>>>>>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
>>>>>> index d1daef2d874b..1a870fec4f31 100644
>>>>>> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
>>>>>> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
>>>>>> @@ -201,45 +201,16 @@ enum platform_pm_domain_type {
>>>>>>  	IRIS_APV_HW_POWER_DOMAIN,
>>>>>>  };
>>>>>>  
>>>>>> -struct iris_platform_data {
>>>>>> +struct iris_firmware_data {
>>>>>>  	void (*init_hfi_ops)(struct iris_core *core);
>>>>>> +
>>>>>>  	u32 (*get_vpu_buffer_size)(struct iris_inst *inst, enum iris_buffer_type buffer_type);
>>>>>
>>>>> I still don't think it's right to keep vpu_buffer_size in firmware data as
>>>>> this would change mostly for every new VPU variant.
>>>>>
>>>>> The buffer sizing logic depends on VPU generation (vpu2, vpu3, vpu33,
>>>>> vpu35) / SoC constraints, not on whether the HFI is Gen1 vs Gen2.
>>>>
>>>> Okay, so how do we solve the SC7280 Gen1 vs Gen2 situation? I can keep
>>>> the function pointer in struct iris_platform_data for now, letting you
>>>> sort it out in your series.
>>>
>>> Thanks! that is SC7280 problem, since code evolved due to additional
>>> features and other things, we might need to increase the vpu2 buffer size
>>> to accommodate both Ge1 and Gen2 requirement, I will check that and address
>>> in my series.
>>>
>>>>
>>>>>
>>>>> <snip>
>>>>>
>>>>>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
>>>>>> index 10a972f96cbe..a83f6910f8b7 100644
>>>>>> --- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
>>>>>> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
>>>>>> @@ -906,41 +906,15 @@ static const u32 sm8550_enc_op_int_buf_tbl[] = {
>>>>>>  	BUF_SCRATCH_2,
>>>>>>  };
>>>>>>  
>>>>>> -const struct iris_platform_data sm8550_data = {
>>>>>> +const struct iris_firmware_data iris_hfi_gen2_data = {
>>>>>>  	.init_hfi_ops = iris_hfi_gen2_sys_ops_init,
>>>>>>  	.get_vpu_buffer_size = iris_vpu_buf_size,
>>>>>> -	.vpu_ops = &iris_vpu3_ops,
>>>>>> -	.icc_tbl = sm8550_icc_table,
>>>>>> -	.icc_tbl_size = ARRAY_SIZE(sm8550_icc_table),
>>>>>> -	.clk_rst_tbl = sm8550_clk_reset_table,
>>>>>> -	.clk_rst_tbl_size = ARRAY_SIZE(sm8550_clk_reset_table),
>>>>>> -	.bw_tbl_dec = sm8550_bw_table_dec,
>>>>>> -	.bw_tbl_dec_size = ARRAY_SIZE(sm8550_bw_table_dec),
>>>>>> -	.pmdomain_tbl = sm8550_pmdomain_table,
>>>>>> -	.pmdomain_tbl_size = ARRAY_SIZE(sm8550_pmdomain_table),
>>>>>> -	.opp_pd_tbl = sm8550_opp_pd_table,
>>>>>> -	.opp_pd_tbl_size = ARRAY_SIZE(sm8550_opp_pd_table),
>>>>>> -	.clk_tbl = sm8550_clk_table,
>>>>>> -	.clk_tbl_size = ARRAY_SIZE(sm8550_clk_table),
>>>>>> -	.opp_clk_tbl = sm8550_opp_clk_table,
>>>>>> -	/* Upper bound of DMA address range */
>>>>>> -	.dma_mask = 0xe0000000 - 1,
>>>>>> -	.fwname = "qcom/vpu/vpu30_p4.mbn",
>>>>>
>>>>> Should fw_name be in firmware_data? as this can be change based on HFI
>>>>> versions?
>>>>
>>>> That would fail because then each device will have to gain its own
>>>> struct iris_firmware_data.
>>>>
>>>> But... Maybe we can do something as simple as:
>>>>
>>>> struct iris_firmware_desc {
>>>> 	const char *fwname;
>>>> 	u32 (*get_vpu_buffer_size)(struct iris_inst *inst, enum iris_buffer_type buffer_type);
>>>> 	bool (*checK_fw_match)(u8 *buf, size_t size);
>>>> 	const struct iris_firmware_data *data;
>>>> };
>>>>
>>>> and then
>>>>
>>>> struct iris_platform_data {
>>>> 	struct iris_firmware_desc *gen1, *gen2;
>>>> 	// .. the rest as usual;
>>>> };
>>>>
>>>>
>>>> struct iris_core {
>>>> 	u32 (*get_vpu_buffer_size)(struct iris_inst *inst, enum iris_buffer_type buffer_type);
>>>> 	const struct iris_firmware_data *data;
>>>> 	// ... the rest as expected
>>>> };
>>>>
>>>> During first open the driver will try loading firmware from DT and
>>>> identifying it using the check_fw_match() callback. If DT doesn't have
>>>> firmware-name the driver will try loading gen2 and, if not found, gen1.
>>>> When firmware loading succeeds, it will set the pointer and the callback
>>>> in iris_core, settling the interface between the driver and the
>>>> firmware.
>>>>
>>>> WDYT?
>>>
>>> This looks good to me. It handles the SC7280 Gen1 vs Gen2 buffer size
>>> differences as well.
>>
>> Do you plan to implement above design in the next version of your series?
> 
> I've sent the platform_data patchset keeping the get_vpu_buffer_size in
> place (as you suggested) because that is fine for the current supported
> usecases. I would prefer if iris_firmware_desc comes as a part of your
> Kodiak Gen1-vs-Gen2 patchset. I can send you a corresponding patch, if
> you wan, or you can implement that on your own. What would be your
> preference?
> 

If you already have something in progress, it would be helpful if you could
share it. I can base my kodiak gen2 series on top of it.

Thanks,
Dikshita

>>
>> Thanks,
>> Dikshita
>>>
>>> Thanks,
>>> Dikshita
>>>
>>>>
>>>>>> -const struct iris_platform_data sm8650_data = {
>>>>>> +const struct iris_firmware_data iris_hfi_gen2_vpu33_data = {
>>>>>
>>>>> This proves my above point.
>>>>>
>>>>> iris_hfi_gen2_data and iris_hfi_gen2_vpu33_data become identical except for
>>>>> get_vpu_buffer_size, which forces us to create multiple “firmware_data”
>>>>> variants just to carry a hardware-specific difference.
>>>>>
>>>>> Also, it will scale poorly going forward. When we introduce vpu4 /
>>>>> vpu5–based platforms, we would need to add more copies of essentially the
>>>>> same HFI Gen2 firmware_data, differing only in the buffer sizing callback.
>>>>
>>>> Yes. I'm not sure, if there is any difference between params / caps as
>>>> implremented by the firmware for those generations.
>>>>
> 

