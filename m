Return-Path: <linux-media+bounces-59291-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iEveEUZ96GmsKwIAu9opvQ
	(envelope-from <linux-media+bounces-59291-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 09:48:22 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A0D564431E0
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 09:48:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CB8D3303FF92
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 07:42:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4068336C5AC;
	Wed, 22 Apr 2026 07:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cliodgs8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NZhvYuNP"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DB0929D26E
	for <linux-media@vger.kernel.org>; Wed, 22 Apr 2026 07:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776843757; cv=none; b=MjGjouG8L8tSUJFUi0o0goVsCJdTvQE55ZD4FJtOar9mgI8R6y420vCFoQKbWgy3fiPhxeivPrMk7RUWu2TqmnIbwua1MwCwgI5Vhhk/76X7LjgrGjImIKMeIM0SAJmAg472EE52WiD/pl12g5JvDA3mVAgHwlgf0qAucUcyi9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776843757; c=relaxed/simple;
	bh=Uzvz/FmS9kN7VxQy+5FxQU8H0DpWsgvzzvLgjxDQKMk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DZFzLfc7M1gvTI7psuFdkvxbgVSd4bzl87vyUZ5NULY6pMyTy4Q6rMMAB5vRcd8l9XZ1sKN2xOV73XpgU50j+MP4Z5m0+djPNoHYDVM1EwMP1sE+tBRvocWD460HXSgGeB7NMV288reF1gle1+EIhlQOoMJqFsyf4dKDJ8Aaexg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cliodgs8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NZhvYuNP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63M5JfRo2002000
	for <linux-media@vger.kernel.org>; Wed, 22 Apr 2026 07:42:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ryfcJEToa6giZGDLLJr7ejuqA33i73uojsM9FLivb04=; b=cliodgs8+Hp0tYud
	buQQ4tEHZG2NTCVLhsqYI4XB5TVIypC6w9bwEGWHheLq7QTgc0UXaaPVu0aqvNCv
	IcfVEU/I4pqI70QXguMekzxvCBYd1JMYEGs6KPdJbNJV0cjgG1/7ZSkOK37AIvJZ
	POTul+uVjeUvrNHMX/8SLeEc1MxgSfsBXloFDCslyQujW6EYzLuGgpYUPwpnf2JO
	/ZZIKOCH/OdbbC1ZciWZJf1TT7UCp2QTg+4g0z5cVxG6Vanxo9bfy5EVoMhNnBXQ
	RLlWtClleSRl/6T1Q+NlhRqmu5Lq3WDOF31fnHD1qxLfMbGGrguLF/UgRCLbwi+Z
	GA5Y4Q==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpenfac71-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 22 Apr 2026 07:42:35 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35d99c2908cso5010521a91.0
        for <linux-media@vger.kernel.org>; Wed, 22 Apr 2026 00:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776843755; x=1777448555; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ryfcJEToa6giZGDLLJr7ejuqA33i73uojsM9FLivb04=;
        b=NZhvYuNPl43V+kwEE3150HtQvjGTgkHvPVIehD0oct4MrktvUZSBaed+gamoNF3n6P
         bVem4MOn7jpZKhiCXX0h49pKJfo/7J/T91c9TH+y1JxIyBnTIXWkG8VydS8MK4EHg1RD
         kPAlBrNdOI6UFaT4bMAefBplpeD4KPBV1C47W+EiQ2a0Oki0qBOsJtGbKh0W7j6CTrFi
         OCkNu5qcKOwFxS/7ZKSKHg0k7KAqTHLs5gh8prFO0xv1Xbr1/rH6ncuHUV05VsFAjZDb
         IZzxq7ajpjXe/skdlYBJAiQxoyJqstfhvatSx48NvK3w5TNX9Mcmh85kvOkWHUbRfIhG
         NINw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776843755; x=1777448555;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ryfcJEToa6giZGDLLJr7ejuqA33i73uojsM9FLivb04=;
        b=HOCk4Uq7yaa7OTj+dgpJE1OgOnmWva4TKG4DaKcLIjzmLonMyazlRJAE9elZBPndyf
         bhP3U7/wVwcox6tkrF6/N/8tR3VMXdMeyd/xoa90ls2ZcawLzu3pZKQKaY+HvjLqHu4+
         V7X2X7NYnVHfgrCz3MNlIFxQGuoxz0d20cfNZ8AgZmh0uVi23z/7KEqlSle2tWbWkjEO
         QLtUm2X29keLyiZc3xAnj2LHFk2QAgRaE/4Zc9uehL+LU/JjBeENvcouMETfU0jiM8K9
         7cDW3xp/XEIBnc0d8L3GNK5OgzxNw5zo3gkh6oi1vrFfiaQ1nxbYbafzOEowlj7s1zk7
         H6Qw==
X-Gm-Message-State: AOJu0YxDtBd17DSvWt9a1hMLQOajJYxoyflaFGQiDe3VDdqhl1MtbuMc
	eayHIweh+eqv0YY7Whsemh9DCsfkk3Y11Lzlebr4xIyyj42WWfh7BiwNFVvCbU9lyGyD8TPHpmk
	XDL+t6G0jXueZyGrT9Z5IFSyE+wSFbwOjHRPnHV7+7MTksmePXlwyZlD+aBprNCL95g==
X-Gm-Gg: AeBDievUJhjzovlD0ZF4AgcFWVIjtKO4Xwa0RaMlrIlcW4U8/XlrP345IL22jB081HW
	kmO/frriWtOyaRbRhMfB6uEEvZHUpFiEJWjUqOvZ94JO5D6SHrWkihwi61x8XgtNxqv/Lj2/vVl
	h8Jy9MXo86V1nIRmO5PmgSlMzhDt7092y2IuSiSPRljQtLsqOVh/iexwLp1OPVjY2kLhVsqQdOo
	hBaPxm8V6Rh7z4YdXHG1gNox8k34Zuh7WjosI8PGZdrY8E6XIlonjBet+RZ9sWD6qMzkPxDBosY
	OpoRWNud1NuHNRbAfATfG6r7wKIkGcPrk68xw1SNc3OXHKLpQ2mvIRptE4HrUDqvw6TY01gCB0N
	XqP4MSSBimPeeABc19kM8hw/o/YmSLD+sDxK/T+FlLCffKdXJ3FyzcLgrj4hFqkgR
X-Received: by 2002:a17:90b:1dc6:b0:35b:e51b:1935 with SMTP id 98e67ed59e1d1-36140462ab5mr19671287a91.17.1776843754934;
        Wed, 22 Apr 2026 00:42:34 -0700 (PDT)
X-Received: by 2002:a17:90b:1dc6:b0:35b:e51b:1935 with SMTP id 98e67ed59e1d1-36140462ab5mr19671263a91.17.1776843754421;
        Wed, 22 Apr 2026 00:42:34 -0700 (PDT)
Received: from [10.206.101.19] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-361410b998fsm16131288a91.13.2026.04.22.00.42.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 00:42:33 -0700 (PDT)
Message-ID: <899e0575-6de3-4ab7-b817-7a51c6b45787@oss.qualcomm.com>
Date: Wed, 22 Apr 2026 13:12:17 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: iris: optimize COMV buffer allocation for VPU3x
 and VPU4x
To: Bryan O'Donoghue <bod@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <lWwJ9pbXoZXg350L9fA8Sx-qznLud6KXnJlBTFNBLZQXEwKZeI50KGzJPDq43FO2QtbisF9pyxxeVTXX-WvN0Q==@protonmail.internalid>
 <20260421-optimize_comv_buffer-v1-1-7c9a24da3ad3@oss.qualcomm.com>
 <c0a23200-e3f3-46ad-9057-4ee8723d2f43@kernel.org>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <c0a23200-e3f3-46ad-9057-4ee8723d2f43@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: GmGu_snqo6_QEDi9GRZT_z4jtBPXdhHf
X-Authority-Analysis: v=2.4 cv=fozsol4f c=1 sm=1 tr=0 ts=69e87beb cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=sxecAc6Fdml7H7xBZ-gA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDA3MiBTYWx0ZWRfX0LThN68OXNNk
 q0mnlVCGIMKhxe+GN2rVKNvU7WOxIIq4Xpmr3go16j8FzQjYtRK+wVZr3H3nNKEoIM045rvqmHE
 mMXgVFw5el5pwIjzexcKdE3Kc5MsOooV+bvlUaCHvO3XIwMFltFhSomYXlEu6R9eu7HV0Yh+X5K
 1NW8mhXBkW6J8dnDeqEQT6nbT8ENcFjOH2R3gYxbVqRTWU0wSTk9+35UvCtFTJA1hhY7K/yg9hZ
 8v0h9MJIdUHp7FqSJfHY9vXxUhx8Nl3jHPu5z1Kj3MLiNY3P9ucWvtHd5VRrjIiMc4CD0BjG0/h
 JEjYWCSpmdbXg680p+JHnJ6yB+p4z+Ff/fGrbPz3b2DZSNwTh4/Z8vdMqhJPH0JtdV+acOKZ8Ak
 Rrmc3w4q3A4p8bfWAXlVgajtcOtiAFQ8Mw1SboA734l9PG0ruA9pVqQz105qnbI538HVlmb2qp5
 sT0jIzKTWCd7sqF7x9Q==
X-Proofpoint-GUID: GmGu_snqo6_QEDi9GRZT_z4jtBPXdhHf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 adultscore=0 impostorscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220072
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bootlin.com:url];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59291-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A0D564431E0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/21/2026 2:31 PM, Bryan O'Donoghue wrote:
> On 21/04/2026 07:41, Vishnu Reddy wrote:
>> The existing iris_vpu_dec_comv_size() used VIDEO_MAX_FRAME (32) as
>> num_comv count unconditionally when calculating the COMV buffer size.
>> This resulted in an oversized COMV buffer allocation throughout decode
>> session, wasting memory regardless of actual number of buffers required.
> 
> You should define what a COMV buffer is before talking about how you are 
> changing it, i.e. define the term Co-located Motion Vector (CMOV) and 
> then use the abbreviation CMOV liberally as you wish.
> 
>> For VPU3x and VPU4x platforms, introduce iris_vpu3x_4x_dec_comv_size() to
>> replace iris_vpu_dec_comv_size(). It derives num_comv dynamically, it
> 
> "These derive num_cmove dynamically"
> 
>> uses inst->fw_min_count once the firmware has reported its minimum buffer
>> requirements, and fallback to inst->buffers[BUF_OUTPUT].min_count during
>> initialization before firmware has communicated its requirements. This
>> aligns the COMV buffer size to the actual count needed rather than always
>> allocating with fixed VIDEO_MAX_FRAME value.
>>
>> Additionally, during iris_vdec_inst_init(), fw_min_count was initialized
>> to MIN_BUFFERS instead of 0. This masked the fallback logic and caused 
>> the
>> COMV size calculation to use MIN_BUFFERS even before firmware had 
>> reported
>> its actual requirements. Fix this by initializing fw_min_count to 0.
>>
>> During testing of 1080p AVC, it reduces the COMV buffer size from 32.89MB
>> to 6.16MB per decode session, significantly reducing memory consumption.
> 
> Cool nice fix.
> 

Indeed, a good saving.

>>
>> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>> ---
>>   drivers/media/platform/qcom/iris/iris_vdec.c       |  2 +-
>>   drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 24 ++++++++++++ 
>> +++++++---
>>   drivers/media/platform/qcom/iris/iris_vpu_buffer.h |  1 +
>>   3 files changed, 23 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/ 
>> media/platform/qcom/iris/iris_vdec.c
>> index 719217399a30..f433065e08b2 100644
>> --- a/drivers/media/platform/qcom/iris/iris_vdec.c
>> +++ b/drivers/media/platform/qcom/iris/iris_vdec.c
>> @@ -24,7 +24,7 @@ int iris_vdec_inst_init(struct iris_inst *inst)
>>       inst->fmt_src = kzalloc_obj(*inst->fmt_src);
>>       inst->fmt_dst = kzalloc_obj(*inst->fmt_dst);
>>
>> -    inst->fw_min_count = MIN_BUFFERS;
>> +    inst->fw_min_count = 0;
>>
>>       f = inst->fmt_src;
>>       f->type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
>> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c b/ 
>> drivers/media/platform/qcom/iris/iris_vpu_buffer.c
>> index 9270422c1601..57237543b229 100644
>> --- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
>> +++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
>> @@ -731,6 +731,23 @@ static u32 iris_vpu_dec_comv_size(struct 
>> iris_inst *inst)
>>       u32 height = f->fmt.pix_mp.height;
>>       u32 width = f->fmt.pix_mp.width;
>>
>> +    if (inst->codec == V4L2_PIX_FMT_H264)
>> +        return hfi_buffer_comv_h264d(width, height, num_comv);
>> +    else if (inst->codec == V4L2_PIX_FMT_HEVC)
>> +        return hfi_buffer_comv_h265d(width, height, num_comv);
>> +
>> +    return 0;
>> +}
>> +
>> +static u32 iris_vpu3x_4x_dec_comv_size(struct iris_inst *inst)
>> +{
>> +    struct v4l2_format *f = inst->fmt_src;
>> +    u32 height = f->fmt.pix_mp.height;
>> +    u32 width = f->fmt.pix_mp.width;
>> +    u32 num_comv;
>> +
>> +    num_comv = inst->fw_min_count ? inst->fw_min_count : inst- 
>> >buffers[BUF_OUTPUT].min_count;
> 
> Please just if/else this though its far easier to read/understand that way.
> 
>> +
>>       if (inst->codec == V4L2_PIX_FMT_H264)
>>           return hfi_buffer_comv_h264d(width, height, num_comv);
>>       else if (inst->codec == V4L2_PIX_FMT_HEVC)
>> @@ -739,7 +756,8 @@ static u32 iris_vpu_dec_comv_size(struct iris_inst 
>> *inst)
>>           if (inst->fw_caps[DRAP].value)
>>               return 0;
>>           else
>> -            return hfi_buffer_comv_av1d(width, height, num_comv);
>> +            return hfi_buffer_comv_av1d(width, height,
>> +                            num_comv + AV1D_COMV_BUFFER_OVERHEAD);
>>       }
>>
>>       return 0;
>> @@ -2025,7 +2043,7 @@ u32 iris_vpu_buf_size(struct iris_inst *inst, 
>> enum iris_buffer_type buffer_type)
>>
>>       static const struct iris_vpu_buf_type_handle 
>> dec_internal_buf_type_handle[] = {
>>           {BUF_BIN,         iris_vpu_dec_bin_size             },
>> -        {BUF_COMV,        iris_vpu_dec_comv_size            },
>> +        {BUF_COMV,        iris_vpu3x_4x_dec_comv_size       },
>>           {BUF_NON_COMV,    iris_vpu_dec_non_comv_size        },
>>           {BUF_LINE,        iris_vpu_dec_line_size            },
>>           {BUF_PERSIST,     iris_vpu_dec_persist_size         },
>> @@ -2098,7 +2116,7 @@ u32 iris_vpu4x_buf_size(struct iris_inst *inst, 
>> enum iris_buffer_type buffer_typ
>>
>>       static const struct iris_vpu_buf_type_handle 
>> dec_internal_buf_type_handle[] = {
>>           {BUF_BIN,         iris_vpu_dec_bin_size         },
>> -        {BUF_COMV,        iris_vpu_dec_comv_size        },
>> +        {BUF_COMV,        iris_vpu3x_4x_dec_comv_size   },
>>           {BUF_NON_COMV,    iris_vpu_dec_non_comv_size    },
>>           {BUF_LINE,        iris_vpu4x_dec_line_size      },
>>           {BUF_PERSIST,     iris_vpu4x_dec_persist_size   },
>> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.h b/ 
>> drivers/media/platform/qcom/iris/iris_vpu_buffer.h
>> index 12640eb5ed8c..7a9cc1c92da3 100644
>> --- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.h
>> +++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.h
>> @@ -110,6 +110,7 @@ struct iris_inst;
>>   #define MAX_PE_NBR_DATA_LCU16_LINE_BUFFER_SIZE 96
>>   #define AV1D_NUM_HW_PIC_BUF    16
>>   #define AV1D_NUM_FRAME_HEADERS 16
>> +#define AV1D_COMV_BUFFER_OVERHEAD 7
> 
> Whats this ? Why is there a new seven byte overhead ? Does it represent 
> a header, an alignment ?

Vishnu, pls check if we need to add this as initial count was 18 [1] ? 
What if initial count was 11 [2], and post DRC, fw_min_count would be 11 
too for AV1d, so the overhead can be avoided.

[1] 
https://elixir.bootlin.com/linux/v7.0-rc7/source/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c#L1220

[2] 
https://elixir.bootlin.com/linux/v7.0-rc7/source/drivers/media/platform/qcom/iris/iris_vpu_buffer.c#L2157

Regards,
Vikash
> 
> An overhead can mean anything.
> 
>>   #define SIZE_AV1D_SEQUENCE_HEADER 768
>>   #define SIZE_AV1D_METADATA        512
>>   #define SIZE_AV1D_FRAME_HEADER    1280
>>
>> ---
>> base-commit: 4fbeef21f5387234111b5d52924e77757626faa5
>> change-id: 20260421-optimize_comv_buffer-ae7107673609
>>
>> Best regards,
>> -- 
>> Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>>
> 
> 


