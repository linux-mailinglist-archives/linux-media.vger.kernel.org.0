Return-Path: <linux-media+bounces-56950-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0HbjIF15w2lOrAQAu9opvQ
	(envelope-from <linux-media+bounces-56950-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 06:57:49 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DE61A32004E
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 06:57:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 04D4C30AB8D3
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 05:54:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85D9A3346AF;
	Wed, 25 Mar 2026 05:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BpO0+BxY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e5N2e+V9"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9376D126F3B
	for <linux-media@vger.kernel.org>; Wed, 25 Mar 2026 05:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774418074; cv=none; b=XQ6B8DCdOdGIvOsT/b/DV0MckAPZ0PZ6C1AlKaBrtNTc/HrBcELq8QxPQ9qQmrWjc/ItGk4rkbWxkvq00OwDj2D2RvvaK4KBy7OJo49WF5gvG/oRZu0ezWa50o9GVwT+aiHuMfZS2RK5o9/sBuLfoZcFzkWytWtv15Uq9r0Ar8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774418074; c=relaxed/simple;
	bh=Bea/T/Y7afp0Q1ULsjkG5CDpOKT47GC343RynQqp7Ls=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HWMFQAaR9iRYZ64nEqM4El9Hz3NwjfZqWORVZmDfepZjnkFIBpvLYEapzW+1MVvAq2P8x65peOSsRwLSzeYEZdGWIlJnaeCTx20y/ffN8987gOAXlmpzfH37E6hX9+aAg+XIs1KY8IL2rotR4L1zO+Z2llH/DTCRDkS8h+vIF8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BpO0+BxY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e5N2e+V9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62P2JAFI3057336
	for <linux-media@vger.kernel.org>; Wed, 25 Mar 2026 05:54:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dz7ZRjXW18f4g8eA/0DUL8LUKiNBq1wH7TKFu0gmb7A=; b=BpO0+BxY4fPOP+Yn
	G1+DfofOivkSgUIuuvM1a7aGCVmQFFL/NTi5YSy6A2GZHG4mxGtqWEtMrOdC2c/d
	8qCXhTp0BOIXNFqdOuwkjnBgYiLqHFwg4hb915AH1bFH4nRTqlGSRbp5pBIigi4Z
	EKU/WkIRFdkbi31/DQbv5G44Rt5bPLQY1eZ09qL1tmf/kZxX28fWGDuTSrXfVVsw
	XTxyg9BxTgP1O3x4Nr8m6gL/LPDMS1KBF+a97vLGpbXRDFhNTTy5BwpHTrMepdFH
	VHfUi5myAXe1J1J6UMUmKNRBwYvHPWySyl/H13ZP/me6Dqr5IZlqsmlFAQDmUhQ/
	sA01Dw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d46tp0kkg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 25 Mar 2026 05:54:31 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b06395b8deso30331965ad.1
        for <linux-media@vger.kernel.org>; Tue, 24 Mar 2026 22:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774418070; x=1775022870; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dz7ZRjXW18f4g8eA/0DUL8LUKiNBq1wH7TKFu0gmb7A=;
        b=e5N2e+V93UY+3hO8l8Zp6MyUkjCFamXHy4k5w3xiczTnAiRmNcS9Qz9RmrLRQJ2TKg
         KD5F4Yt6k+d/a4bF3L9gszrQQsqZLnvaBLxUOuVvXVrk6GESjPUvO1k59Mt93D96kgXJ
         N2/3THHpoFaEzpW46+zcGQTIKCpog9Y6nv/3j28gegusJIyfutvDatGEdr/a1C5+4rVG
         DblRc5zMhlYgjB9ETgcppyTr2cPPo1Wz/11VD8k+B2q0r1kVngRNWPq52Uswy6/k9nk3
         Szi296/8ztU5GXztES2PhALO/pxY3SmYjR/T11avqsTGHtuzWTl7z2LPnkYdzEF1SUVM
         vt2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774418070; x=1775022870;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dz7ZRjXW18f4g8eA/0DUL8LUKiNBq1wH7TKFu0gmb7A=;
        b=Rk5XwsQYp7bg5EZse+Dgi3XLgzRukuvqbDDGjRc7ovesXjmx3ianahixxKPvqmiXgs
         qRbfWb4uwFEcphDxmcUwxwXHNoL1XV+UdS2C+fjT+VFXTXRYFq1mSnQcDyZ1hgXJ+TRV
         nqE6qyP6TfbkCe73GNLq09t/y4Tp31t9+VTZ6908IGXoyim9yzVvb2WmQhRFPxzrE4+X
         uCFtripAZWHSg386ENVI4KyG+cbVqgNjcrYkTLgmixJ94Prrx9vrDt8VLPWwnlq/xjrE
         KFKdiXkKM1alZHe/2BW1419sZf1sV4L3fPijizpa5JjRr7Qf5Y90PphIJE0k5rV/jeM2
         rYxw==
X-Gm-Message-State: AOJu0YxZVZnr5qQgAbAHp58/6FiUrSF7r8R8TqI1I5PhKQ7sbp5h6lVo
	ZtOza71bHryt/hsBYoiLZjzrLxoWvuv2xW0FiC8ALbHrwEvk1S3KLdo6lz86Jj3lvZMyZBNjTJe
	J9RIlGqKCkrZjfZLlANmOvcMZSX0CsOSEXnv1Ihc3CzQ8ePjDiCdV0/rAfHD30tu9CRCQdvDqOA
	==
X-Gm-Gg: ATEYQzxl5xE+4LXAAMPXtc1Hqdkjy6BMBPJiy8SS5DnYyymQRR1wJmUi5ibu702PV7O
	gTX36IoQ0RE8foTuE7IA2Q7PmwkyLLmU/OOahZUexlQhEbbHg0bWkcRlh4o3AKGT65vVoQX+WM6
	7kl35ryZac+wpdDF/zgKk5+3K/8+OkAYTpoyIlHlGSoMXtF6MaWX2o/ly08aTRm7fJc+v/jBRiq
	AGB5ljzxfqQHKnZngy+HiIN9dINWyAPBPoxlpBMQlE5y61MuMPmqf6etTkZmJ06GtqZSkwIvMWs
	d1DpBuaBQmEXVkfhGtRKDJ7cV/39vgId3+tkLWYTwgC/nIgubbfnx9PIQ2baWaCjIViyuWBMnnn
	km9vHdWUWzTRkvGlIVS2TZAWGYd4XMVvP3VtW2sxFsJ1foW1eu5UQ+g==
X-Received: by 2002:a17:902:c942:b0:2b0:66bc:22a3 with SMTP id d9443c01a7336-2b0b09a0998mr26263385ad.10.1774418070483;
        Tue, 24 Mar 2026 22:54:30 -0700 (PDT)
X-Received: by 2002:a17:902:c942:b0:2b0:66bc:22a3 with SMTP id d9443c01a7336-2b0b09a0998mr26263155ad.10.1774418069949;
        Tue, 24 Mar 2026 22:54:29 -0700 (PDT)
Received: from [10.0.0.3] ([106.222.233.113])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b08366c3f7sm213332395ad.60.2026.03.24.22.54.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 22:54:29 -0700 (PDT)
Message-ID: <80cf278c-7c58-258c-cc9c-a35ec996c102@oss.qualcomm.com>
Date: Wed, 25 Mar 2026 11:24:24 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2] media: iris: add FPS calculation and VPP FW overhead
 in frequency formula
Content-Language: en-US
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260305-update_fps_calculation-v2-1-e3b5cccb1246@oss.qualcomm.com>
 <19e9afa8-b0fa-43e1-8758-b58e6c7a095c@oss.qualcomm.com>
 <9c5da48f-4003-b46f-cfb9-0ad5f5062d69@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <9c5da48f-4003-b46f-cfb9-0ad5f5062d69@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: F30EWxYMzC3y3HbZjd4e8Ds187V7hIwn
X-Authority-Analysis: v=2.4 cv=F4lat6hN c=1 sm=1 tr=0 ts=69c37897 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=hbzS8gabZINpAvasuVNEhA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=d9WOwu6AmINKKRFf0ikA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: F30EWxYMzC3y3HbZjd4e8Ds187V7hIwn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDAzOSBTYWx0ZWRfXyLRLbd2275Ja
 y46dclrRbLb/z6aG32gFMndWSuBcfjt3BujxDN3JJyllG3iGIv8MlvIuWhQV57wXXenrs57TXY2
 SeZk4uWTq5dHtrqhN6hJFLI7zbVDXWBfDGMjF79ommMQHePFFzYviQc8UI6OggZkwhrS0EQvhXs
 EbFV4HRIbs3p1Sf36Yf4odc/+o/PLK6TEvDHGKRsVfoTrtNUdyDZwz90gbQBIV+6wqNNlI8duIR
 SEAkDEvayfxByffrupWimol66AgyA/JK1F5ZG8ORhAPBfny96b9/V+fAcjZ5OmrUi0ysiihf9Ar
 MiC2yeFQ+SWr6Hh5VIQkUuv14pCmh4s/pSeDw1PPO3KwfGpEQqb0LGOY5306SgNN3nQt9x7rwFf
 +y3AP+WSmS9NeWtXQkwFMrNNalpIiE61+mCGMDOpYU1uUTino4u+N4Y5bTZ4DPAB9W09ELWu3jN
 fKXCjciMW2En0Q0g5fg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_02,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250039
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56950-lists,linux-media=lfdr.de];
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
X-Rspamd-Queue-Id: DE61A32004E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/20/2026 12:02 PM, Vishnu Reddy wrote:
> 
> On 3/13/2026 12:54 PM, Vikash Garodia wrote:
>>
>> On 3/5/2026 7:00 PM, Vishnu Reddy wrote:
>>> The driver was using a fixed default FPS value when calculating the VPU
>>> frequency. This caused wrong frequency requests for high‑frame‑rate
>>> streams, for example 4K at 240 FPS. Because of this, the hardware was
>>> running at a lower frequency than needed.
>>>
>>> Add the FPS measurement based on the decoder input buffer arrival rate.
>>> The measured FPS is stored per instance and used in frequency calculation
>>> instead of the fixed default FPS. The value is clamped so that it does
>>> not exceed platform limits. Add a VPP firmware overhead when running in
>>> STAGE_2.
>>>
>>> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>>> ---
>>> Changes in v2:
>>> - Replaced div_u64 with mult_frac
>>> - Link to v1:
>>> https://lore.kernel.org/r/20260304-update_fps_calculation-v1-1-4eeac373a504@oss.qualcomm.com
>>> ---
>>>   drivers/media/platform/qcom/iris/iris_instance.h   |  2 ++
>>>   drivers/media/platform/qcom/iris/iris_vdec.c       | 21
>>> +++++++++++++++++++++
>>>   drivers/media/platform/qcom/iris/iris_vpu_common.c |  6 +++++-
>>>   3 files changed, 28 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/media/platform/qcom/iris/iris_instance.h
>>> b/drivers/media/platform/qcom/iris/iris_instance.h
>>> index 16965150f427..180cba36a7f2 100644
>>> --- a/drivers/media/platform/qcom/iris/iris_instance.h
>>> +++ b/drivers/media/platform/qcom/iris/iris_instance.h
>>> @@ -109,6 +109,8 @@ struct iris_inst {
>>>       u32                metadata_idx;
>>>       u32                codec;
>>>       bool                last_buffer_dequeued;
>>> +    u64                last_buf_recv_time_ns;
>>> +    u32                frame_count;
>>>       u32                frame_rate;
>>>       u32                operating_rate;
>>>       u32                hfi_rc_type;
>>> diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c
>>> b/drivers/media/platform/qcom/iris/iris_vdec.c
>>> index 719217399a30..88820060e22a 100644
>>> --- a/drivers/media/platform/qcom/iris/iris_vdec.c
>>> +++ b/drivers/media/platform/qcom/iris/iris_vdec.c
>>> @@ -369,6 +369,8 @@ int iris_vdec_streamon_input(struct iris_inst *inst)
>>>       if (ret)
>>>           return ret;
>>>   +    inst->frame_count = 0;
>>> +
>>>       return iris_process_streamon_input(inst);
>>>   }
>>>   @@ -411,6 +413,7 @@ int iris_vdec_qbuf(struct iris_inst *inst, struct
>>> vb2_v4l2_buffer *vbuf)
>>>   {
>>>       struct iris_buffer *buf = to_iris_buffer(vbuf);
>>>       struct vb2_buffer *vb2 = &vbuf->vb2_buf;
>>> +    u64 cur_buf_recv_time_ns, time_delta_ns;
>>>       struct vb2_queue *q;
>>>       int ret;
>>>   @@ -427,6 +430,24 @@ int iris_vdec_qbuf(struct iris_inst *inst, struct
>>> vb2_v4l2_buffer *vbuf)
>>>           return 0;
>>>       }
>>>   +    if (buf->type == BUF_INPUT) {
>>> +        cur_buf_recv_time_ns = ktime_get_ns();
>>> +
>>> +        if (inst->frame_count == 0) {
>>> +            inst->last_buf_recv_time_ns = cur_buf_recv_time_ns;
>>> +            inst->frame_rate = MAXIMUM_FPS;
>>> +        }
>>> +        time_delta_ns = cur_buf_recv_time_ns -
>>> inst->last_buf_recv_time_ns;
>>> +
>>> +        if (time_delta_ns >= NSEC_PER_SEC) {
>>> +            inst->frame_rate = clamp_t(u32, inst->frame_count,
>>> DEFAULT_FPS,
>>> +                           MAXIMUM_FPS);
>>> +            inst->last_buf_recv_time_ns = cur_buf_recv_time_ns;
>>> +            inst->frame_count = 0;
>>> +        }
>>> +        inst->frame_count++;
>>> +    }
>>> +
>>
>> simplifying it ?
>>
>>     u64 now_ns, delta_ns;
>>
>>     if (buf->type == BUF_INPUT) {
>>         now_ns = ktime_get_ns();
>>
>>         if (!inst->input_frame_count)
>>             inst->buf_fps_start_ts = now_ns;
> 
> Here, the actual required FPS will be found after 1 second. until that,
> the initial FPS need to set for max.

why max and not default? setting to max would over vote always in the start
of session.

- Dikshita

> 
>>
>>     inst->input_frame_count++;
> If we increment the frame_count here, once frame_count becomes zero (after
> 1 sec),
> In next buffer queue, again the above if condition will be true and FPS
> will be set to max.
> I can add the code like below, Let me know your opinion.
> 
> if (buf->type == BUF_INPUT) {
>     now_ns = ktime_get_ns();
> 
>     if (!inst->frame_count) {
>         inst->last_buf_recv_time_ns = now_ns;
>         inst->frame_rate = MAXIMUM_FPS;
>     }
>     delta_ns = now_ns - inst->buf_fps_start_ts;
> 
>     if (delta_ns >= NSEC_PER_SEC) {
>         inst->frame_rate = clamp_t(u32, inst->frame_count, DEFAULT_FPS,
> MAXIMUM_FPS);
>         inst->buf_fps_start_ts = now_ns;
>         inst->frame_count = 0;
>     }
>     inst->frame_count++;
> }
> 
> Regards,
> Vishnu Reddy
> 
>> delta_ns = now_ns - inst->buf_fps_start_ts;
>>         if (delta_ns < NSEC_PER_SEC)
>>             //skip the further logic;
>>
>>         inst->frame_rate = clamp_t(u32, input_frame_count, DEFAULT_FPS,
>> MAXIMUM_FPS);
>>        inst->input_frame_count = 0;
>>     }
>> }
>>
>>>       iris_scale_power(inst);
>>>         return iris_queue_buffer(inst, buf);
>>> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c
>>> b/drivers/media/platform/qcom/iris/iris_vpu_common.c
>>> index 548e5f1727fd..d621ccffa868 100644
>>> --- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
>>> +++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
>>> @@ -416,7 +416,7 @@ u64 iris_vpu3x_vpu4x_calculate_frequency(struct
>>> iris_inst *inst, size_t data_siz
>>>       u32 height, width, mbs_per_second, mbpf;
>>>       u64 fw_cycles, fw_vpp_cycles;
>>>       u64 vsp_cycles, vpp_cycles;
>>> -    u32 fps = DEFAULT_FPS;
>>> +    u32 fps = inst->frame_rate;
>>>         width = max(inp_f->fmt.pix_mp.width, inst->crop.width);
>>>       height = max(inp_f->fmt.pix_mp.height, inst->crop.height);
>>> @@ -435,6 +435,10 @@ u64 iris_vpu3x_vpu4x_calculate_frequency(struct
>>> iris_inst *inst, size_t data_siz
>>>       if (inst->fw_caps[PIPE].value > 1)
>>>           vpp_cycles += div_u64(vpp_cycles * 59, 1000);
>>>   +    /* 1.05 is VPP FW overhead */
>>> +    if (inst->fw_caps[STAGE].value == STAGE_2)
>>> +        vpp_cycles += mult_frac(vpp_cycles, 5, 100);
>>> +
>>>       vsp_cycles = fps * data_size * 8;
>>>       vsp_cycles = div_u64(vsp_cycles, 2);
>>>       /* VSP FW overhead 1.05 */
>>>
>>> ---
>>> base-commit: f505e978d1a0442adbbde48aed38c084ddea6d6e
>>> change-id: 20260304-update_fps_calculation-98ee7f7507b1
>>>
>>> Best regards,
>>

