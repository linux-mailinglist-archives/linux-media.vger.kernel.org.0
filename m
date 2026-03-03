Return-Path: <linux-media+bounces-54250-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oOQgFKpfpmlVOwAAu9opvQ
	(envelope-from <linux-media+bounces-54250-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 03 Mar 2026 05:12:26 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C0F091E8A62
	for <lists+linux-media@lfdr.de>; Tue, 03 Mar 2026 05:12:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2D7883020EA1
	for <lists+linux-media@lfdr.de>; Tue,  3 Mar 2026 04:12:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BCB1382293;
	Tue,  3 Mar 2026 04:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Eq3Bxdgj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jbb8a0YW"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BC0B37DEBD
	for <linux-media@vger.kernel.org>; Tue,  3 Mar 2026 04:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772511128; cv=none; b=WVenvbgm0nMuuAph7A6eCmxo6tzUGOwwdxty2AAH2f0K78moRVLVWo2m6kkYGcd5xG/wTklJRgaM3JAy8JzN+JiDwfIp2qTkNqujruECFPNlc3YNBsRYrDQWOA66pUogDUxcPbnc4AearO25DT5mYLsv16LaYWeS6pQpq6mt4cM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772511128; c=relaxed/simple;
	bh=jv0Ppc9b/nRH4DuyNAk1Qw5DVsy1zDiysYv6TXbYVNM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YYygcI6fYqr4J8aWJDBmaBx0X2MvZCrlXeJfVM9cicF1Kej8u/j2zQwptN8IdlzeA4WcvtKV1zyLZOvsIhEty26/59BsL/TRQc2Fbik7WwjskkxtXzmMUR2smmo6OT58Hsn5M/c4m+/y3aKZE3MDeo0IT0EErV32U9uEAZWug90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Eq3Bxdgj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jbb8a0YW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 622J6mCd3863256
	for <linux-media@vger.kernel.org>; Tue, 3 Mar 2026 04:11:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aAXuw4WiHJ4I5hsmz1YeLDT4X8hqfp4XZsCr46xei6E=; b=Eq3Bxdgjm/2AVxW4
	6yjXslPCJfagL15iGxk5eU6CCDkj4/USrhxGSC4flZLcwIlutiEPMzxWUvVyHdeA
	Pp7nfE+GdtpbfE/kj6bHZr4e4JFUl5gsQSKAs0yjbqGOiXgE19UA7p2PRfjMvocv
	Mmau26Uhi/SNt2UJzlgdtAumsc/CMIBM4y2uh5L6o6b41173WrLXutdPzfOyp02s
	nbucA5QDe6tBpMyWvMOJ1ViEbpA9rHDZDuFWwauw4UDWYU/gJaWujwi3lCT3GKwy
	Wc5hwyMOxFc0RGjPmQVwcqWmmD8b3EZfT2JwfkbZNCK6R2tpLqFfVx+Yv9F/te1T
	tydTow==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cn9bjk3wx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 03 Mar 2026 04:11:58 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ae3badc00dso28645955ad.3
        for <linux-media@vger.kernel.org>; Mon, 02 Mar 2026 20:11:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772511118; x=1773115918; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aAXuw4WiHJ4I5hsmz1YeLDT4X8hqfp4XZsCr46xei6E=;
        b=Jbb8a0YWLsERyvGwl9QG7Bv6yvhUUyQeog+U+zNLh8ejMdbqdINxtHKSKdoLpETR4F
         F3awFVt+T2MqOZM3lO+qJyVQizxxjsbPz5lNvQNTTySPnVtWo5PLmtNy72Q1VjqHVFKt
         vLW/oKKVmmiW8u7fLhPF7qZGQ1N6of10jbtqOReR+MB+Jl4AKD4qZeuFMTjdStjhlxeC
         B/UbRNGfqPAat0qcUsf3aCecPYYfy9uQ8UgdgBmjXMua4QTTR3GGSH+Q0jQX55m/F2wy
         CWeo0ixiKRLAw/w4CCPvD2TXzeNVhVkJYkzj8wOer2J0Cu1l1H0RjfYxYoOCddS6Ms+Z
         EaaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772511118; x=1773115918;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aAXuw4WiHJ4I5hsmz1YeLDT4X8hqfp4XZsCr46xei6E=;
        b=q0VY1EsJUZWrlHhSjCveQPFR63LSNSWHTIztUy8Uw6GZPxca8/OSbWJ29AHx7Ya+ps
         zLv5FdKAAbK4BNUEbZxJTylrWCen0/Ah4xkVIQQBnZpk+3I++KwFm+qGOuy4nYNj6/qc
         VAVo+6EZxshu2H039Nqzn+izv1sNbrpx8rz7bByeILK0a4rjkzDVQw16doL62QBg0rLI
         3fAc9cT8juLnY8mBvWooQa840YT+90yBU/hfaltCkIQ9URPX3L9WQuxfYZPnbr6YBBN4
         9ahOrOkqZRZcxkC11X+R40EL0hgIGvL1f4E2p/KjNx7iTNnB0+ZPJ3iwqLecfL05yCyh
         goYg==
X-Gm-Message-State: AOJu0YxRQ+Onislso+yY9ExWrndOzeEV/A7CRinWHDBS48DC8WfJi5gR
	2mtr0c22WcSfbva1db/itd92wA1w6soWhf44oqJ9FTCK9zN/HashXWnpfu70cxlT2gAfXad1bFG
	Q0NYos/JGjaK0/qMG8Rh09z5JvL51uDv5/CAPnvwaDIfMkYoCpCM65D/6ci6uxu9TdfpedSVr1Q
	==
X-Gm-Gg: ATEYQzx5sIbquI49bx3DEjudkv0MLix4msI3E24DrWbBS3CX//HnDIbooGtXWD+Nz1A
	oCBD68K5/NPhbfGy2MBA1ijIaYucjtIhDF1pQXGcMF5GBvh62xXyFSl0/qmk04hN1uSnXEAEYyx
	9rg8C2HEV/YTcnZZ2/KxK1pkIpFXBLAX00fBLtFW0TWaIijOBwSamLy8/z63KzsLyX31bv4nH3p
	+Sb/ZAi2jiGKoA2dgpj0OkEHullwpzHlvP2IoyfxaXJ5TCj3D1BFS5KmaHGDYHHXjW0lTeAA+xf
	vtIZh+Ty3PIvz5uFmguvNWTo6LFbkRb3nv/EqWrzcnTgJ7Ph1I5JDYvRUmuuq3AVwGTlY2mn7pQ
	RULRmnXmlPVx9rJUtS5StMm8e6UU7hBhfKgMk2Q2dvicgA41W5cN+0A==
X-Received: by 2002:a17:902:da8f:b0:2ab:2633:d981 with SMTP id d9443c01a7336-2ae2e4b0832mr169443785ad.32.1772511117499;
        Mon, 02 Mar 2026 20:11:57 -0800 (PST)
X-Received: by 2002:a17:902:da8f:b0:2ab:2633:d981 with SMTP id d9443c01a7336-2ae2e4b0832mr169443305ad.32.1772511116847;
        Mon, 02 Mar 2026 20:11:56 -0800 (PST)
Received: from [10.206.105.120] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae5e1699c9sm11570305ad.10.2026.03.02.20.11.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 20:11:56 -0800 (PST)
Message-ID: <ed94c95b-ad3a-d682-be3f-df3ba9640aa0@oss.qualcomm.com>
Date: Tue, 3 Mar 2026 09:41:51 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] media: iris: fix use-after-free of fmt_src during MBPF
 check
To: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <rUXTfoyGnkGklkQTcUpGww1LY3k1mQifzKFqJaChQkC1jTWg-_3dxJVTkYOp45jUmL45pc7DKHXZvEHaEm-Evw==@protonmail.internalid>
 <20260227-fix-use-after-free-of-fmt_src-during-mbpf-v1-1-307cdafffa2a@oss.qualcomm.com>
 <75a8b887-cbdd-4780-8262-1cc24a55bc90@kernel.org>
Content-Language: en-US
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <75a8b887-cbdd-4780-8262-1cc24a55bc90@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Pe7yRyhd c=1 sm=1 tr=0 ts=69a65f8e cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=xiCWW2qfg3M94FGKY5wA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: 1iSzqJ0VVbG2JsSJctSI9escsKxFs7_c
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDAyNCBTYWx0ZWRfX+bkJW5Fl3Ukr
 0VsFEhrfs/Ps+RPhCOxSQh+aczq/ScMMvnv/86LpgFvc5xxQ6uvsDBtV7R4nW6uw/gT2yhFda4V
 eN1NxAqvuV3uL4LbNzDgf7rVQFmzXjzheX1vj27k2rU5+eB+P+WymnZuTDj/8zNM06/4FmWRcFo
 2rkTyoQc/S7O/CpLEz4fXqPV86l0jGL/ORsiG91BdJ/JMeA4olCdnrgUoCgPJCn8rstWgu5rvkL
 9G1/FQ84dIA9GuQgKcm2QwocGl/Mhta/2OOZub4GBu4P8iV2cW4ejGwJF+wBdzj1RnD2AwLXtQ0
 w0SvHKqwx9SAA/CKHZTGdHcnD1wRjGuXQ4DEVAfSDMMR15PjQnCXSyQGe0AWG2uX5ZrvayePut0
 kui9TkX+OZ1Vu/NGPK18NfSPnQrGArKUhAPNwzaMWHWmoDfRMfZ1FRvgJMYchzVCnY1DZ4Dmq+8
 H8HgAYfhg/EjC1s29RQ==
X-Proofpoint-GUID: 1iSzqJ0VVbG2JsSJctSI9escsKxFs7_c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603030024
X-Rspamd-Queue-Id: C0F091E8A62
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54250-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action


On 2/28/2026 3:15 AM, Bryan O'Donoghue wrote:
> On 27/02/2026 17:33, Vishnu Reddy wrote:
>> A race condition was observed during concurrency testing. the core MBPF
>> check walks the list of active instances and reads fields such as 
>> fmt_src
>> height and width. 
>
> Where does that happen - you highlight iris_close() below - that's 
> good, what's the method or methods that can run concurrently with 
> iris_close() - you should state those in the commit log so that 
> reviewers like myself and people reading the commit in the future know 
> where to look.
>
> At the same time, iris_close() could free these format
>> structures before the instance was removed from core list. this 
>> creates a
>> use-after-free window where the MBPF checker access the freed memory and
>> read invalid values.
>
> Without looking at the code this description seems suspect.
>
> &inst->lock ought to protect inst && inst->thing if it doesn't, then 
> the lock isn't being used correctly.
>
During concurrency testing, multiple instances can be created in parallel.
Each instance has its own inst->lock, while the core list is protected 
by the global core->lock.

The race occurs because these two locks protect different scopes:
inst->lock protects fields within a single instance
core->lock protects the list of active instances

The MBPF checker walks the core instance list under the core->lock. 
While doing so,
it reads fields such as fmt_src->width and fmt_src->height from each 
instance.
Now consider what happens concurrently:

Instance A (MBPF check):
Acquires core->lock
Iterates over the instance list
Reads inst->fmt_src->width, inst->fmt_src->height, etc.

Instance B (iris_close() for a different instance):
Acquires inst->lock
Frees inst->fmt_src and inst->fmt_dst (At this moment, the instance is 
still in the core list.)
Releases inst->lock.
Later acquires core->lock and removes that instance from the core list

The problem is that fmt_src is freed before the instance is removed from 
the core list.
This creates a use‑after‑free window:
MBPF check (Instance A) is still walking the core list
It reaches the instance whose fmt_src has already been freed by Instance B
It dereferences a dangling pointer → use-after-free

This situation occurs because:
inst->lock only protects the instance internals
MBPF checker does not take inst->lock when reading fmt_src
It only relies on the core->lock, the instance is valid as long as it is 
in the core list

Therefore, ordering of freeing inst->fmt_src and inst->fmt_dest in 
iris_close() is incorrect.

The fix is to postpone freeing fmt_src and fmt_dst until after:
The instance has been removed from the core list, and
All teardown under the core lock is complete.
Will update commit description in v2.
>>
>> To fix this, the freeing of fmt_src and fmt_dst is moved to the end
>> of iris_close(), after the instance has been removed from the core
>> list and teardown is complete. This avoids accessing dangling pointers
>> during the MBPF check.
>>
>> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>
> Needs
>
> - Fixes:
> - Cc: stable
ACK
>
>> ---
>>   drivers/media/platform/qcom/iris/iris_vdec.c | 6 ------
>>   drivers/media/platform/qcom/iris/iris_vdec.h | 1 -
>>   drivers/media/platform/qcom/iris/iris_venc.c | 6 ------
>>   drivers/media/platform/qcom/iris/iris_venc.h | 1 -
>>   drivers/media/platform/qcom/iris/iris_vidc.c | 6 ++----
>>   5 files changed, 2 insertions(+), 18 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c 
>> b/drivers/media/platform/qcom/iris/iris_vdec.c
>> index 719217399a30..99d544e2af4f 100644
>> --- a/drivers/media/platform/qcom/iris/iris_vdec.c
>> +++ b/drivers/media/platform/qcom/iris/iris_vdec.c
>> @@ -61,12 +61,6 @@ int iris_vdec_inst_init(struct iris_inst *inst)
>>       return iris_ctrls_init(inst);
>>   }
>>
>> -void iris_vdec_inst_deinit(struct iris_inst *inst)
>> -{
>> -    kfree(inst->fmt_dst);
>> -    kfree(inst->fmt_src);
>> -}
>> -
>>   static const struct iris_fmt iris_vdec_formats_cap[] = {
>>       [IRIS_FMT_NV12] = {
>>           .pixfmt = V4L2_PIX_FMT_NV12,
>> diff --git a/drivers/media/platform/qcom/iris/iris_vdec.h 
>> b/drivers/media/platform/qcom/iris/iris_vdec.h
>> index ec1ce55d1375..5123d2a340e1 100644
>> --- a/drivers/media/platform/qcom/iris/iris_vdec.h
>> +++ b/drivers/media/platform/qcom/iris/iris_vdec.h
>> @@ -9,7 +9,6 @@
>>   struct iris_inst;
>>
>>   int iris_vdec_inst_init(struct iris_inst *inst);
>> -void iris_vdec_inst_deinit(struct iris_inst *inst);
>>   int iris_vdec_enum_fmt(struct iris_inst *inst, struct v4l2_fmtdesc 
>> *f);
>>   int iris_vdec_try_fmt(struct iris_inst *inst, struct v4l2_format *f);
>>   int iris_vdec_s_fmt(struct iris_inst *inst, struct v4l2_format *f);
>> diff --git a/drivers/media/platform/qcom/iris/iris_venc.c 
>> b/drivers/media/platform/qcom/iris/iris_venc.c
>> index aa27b22704eb..4d886769d958 100644
>> --- a/drivers/media/platform/qcom/iris/iris_venc.c
>> +++ b/drivers/media/platform/qcom/iris/iris_venc.c
>> @@ -79,12 +79,6 @@ int iris_venc_inst_init(struct iris_inst *inst)
>>       return iris_ctrls_init(inst);
>>   }
>>
>> -void iris_venc_inst_deinit(struct iris_inst *inst)
>> -{
>> -    kfree(inst->fmt_dst);
>> -    kfree(inst->fmt_src);
>> -}
>> -
>>   static const struct iris_fmt iris_venc_formats_cap[] = {
>>       [IRIS_FMT_H264] = {
>>           .pixfmt = V4L2_PIX_FMT_H264,
>> diff --git a/drivers/media/platform/qcom/iris/iris_venc.h 
>> b/drivers/media/platform/qcom/iris/iris_venc.h
>> index c4db7433da53..00c1716b2747 100644
>> --- a/drivers/media/platform/qcom/iris/iris_venc.h
>> +++ b/drivers/media/platform/qcom/iris/iris_venc.h
>> @@ -9,7 +9,6 @@
>>   struct iris_inst;
>>
>>   int iris_venc_inst_init(struct iris_inst *inst);
>> -void iris_venc_inst_deinit(struct iris_inst *inst);
>>   int iris_venc_enum_fmt(struct iris_inst *inst, struct v4l2_fmtdesc 
>> *f);
>>   int iris_venc_try_fmt(struct iris_inst *inst, struct v4l2_format *f);
>>   int iris_venc_s_fmt(struct iris_inst *inst, struct v4l2_format *f);
>> diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c 
>> b/drivers/media/platform/qcom/iris/iris_vidc.c
>> index bd38d84c9cc7..5eb1786b0737 100644
>> --- a/drivers/media/platform/qcom/iris/iris_vidc.c
>> +++ b/drivers/media/platform/qcom/iris/iris_vidc.c
>> @@ -289,10 +289,6 @@ int iris_close(struct file *filp)
>>       v4l2_m2m_ctx_release(inst->m2m_ctx);
>>       v4l2_m2m_release(inst->m2m_dev);
>>       mutex_lock(&inst->lock);
>> -    if (inst->domain == DECODER)
>> -        iris_vdec_inst_deinit(inst);
>> -    else if (inst->domain == ENCODER)
>> -        iris_venc_inst_deinit(inst);
>>       iris_session_close(inst);
>>       iris_inst_change_state(inst, IRIS_INST_DEINIT);
>>       iris_v4l2_fh_deinit(inst, filp);
>> @@ -304,6 +300,8 @@ int iris_close(struct file *filp)
>>       mutex_unlock(&inst->lock);
>>       mutex_destroy(&inst->ctx_q_lock);
>>       mutex_destroy(&inst->lock);
>> +    kfree(inst->fmt_src);
>> +    kfree(inst->fmt_dst);
>>       kfree(inst);
>
> On the face of it I like the logic of moving the kfree() after 
> destruction of the various other bits - however the description in the 
> log makes me question of the two locks we have are being used 
> correctly ..
>
> Please provide more detail.
Given details above and will update commit description in v2.
>>
>>       return 0;
>>
>> ---
>> base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
>> change-id: 
>> 20260226-fix-use-after-free-of-fmt_src-during-mbpf-abc27f573400
>>
>> Best regards,
>> -- 
>> Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>>
>
Regards,
Vishnu Reddy

