Return-Path: <linux-media+bounces-62335-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uHKRIF7bDWrE4AUAu9opvQ
	(envelope-from <linux-media+bounces-62335-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 18:03:42 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DED6591697
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 18:03:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AF1B7303514B
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 15:55:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27415339B3D;
	Wed, 20 May 2026 15:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gC+SUY9T";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IKzR4tjf"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91A3F3403FA
	for <linux-media@vger.kernel.org>; Wed, 20 May 2026 15:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779292515; cv=none; b=EaCDiLdEArUGz/dOSXw40drFuyya0Vd6fu1zkzOaVZNvGubrGw3TB51nLw+X6LZOLRPTcEJ9jvqfxbul54BTlLxsQWlnWMkwjCEtmde84HDXLhsNeBUG7oE4zJ8yCm4qwmyYhKHLETF3xIF2K/NwvGUIsBi4Qf2im2K3gx1Z4Yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779292515; c=relaxed/simple;
	bh=MydiYcdXJJMPGn73m/PQRjZzWFHIM0/ltWmmjFvlNTs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mxVt6F5mPf+bAJiR8/cGGbYdXPqaNczKjrkmGyCHRZ8u5+xfnW2M3FSOjVKB5QOQntN7W2uKqODVBFXMb0+KUJfzHq9iFFaRHOrvxaDvs6e1wXRtYSu+ZncvmgLYt8KJKKsMLo+yD5EDrSmTUa1Ccx6G8+FarGiJiGp2qfwco/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gC+SUY9T; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IKzR4tjf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K9lfUd266960
	for <linux-media@vger.kernel.org>; Wed, 20 May 2026 15:55:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qUEo38Z2UW1bOtQms5iEEXiqGfAj5J5aVFe+L1H443A=; b=gC+SUY9TytPD84Lz
	nLaz2UD3iJnhCx15pYJ5krXjDqdfFIH+mIEwZS/s+SLrOTtf3eSqZFDM9SXAVLua
	WB1gLIuPa5PMDk9TLXs9P6vwENE2ofXr90KVU117ph1CMvAYR6duFwc2oufgQNjY
	WgpWGuSKgoCzzoOXf8EZDVX47dLqNJ6jIVvwg7h2f4mygRDgzYlenbWplDTYMfcQ
	ykREZLuniKH7yDTTQY7VxhRWTXwFCilkA4+OZMvRi4eJj3qF3he+DmXaW+tATTSA
	/bDWXg6ai6o+8m8sQ+473k38WD4MpeJjGGGSBxstpxe3vzQYXe/eKa+C2iEiyGbo
	vcQF2Q==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9amxscsw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 20 May 2026 15:55:07 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-365faf6006dso5128355a91.1
        for <linux-media@vger.kernel.org>; Wed, 20 May 2026 08:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779292507; x=1779897307; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qUEo38Z2UW1bOtQms5iEEXiqGfAj5J5aVFe+L1H443A=;
        b=IKzR4tjfee9WZP4bf2suY4IM13RcajAMVn/q6vjV+k4oHBNlZYU+3n4lqAHPzTyvBT
         Ewm9bKBdGbQnK4eaORHAyrdGQeWb8l69FLJ+srjS4vxPKe+hfas/biZHWwxAIcw2LLV0
         oAfC3DRBIDVNICqxiGoLrvWPRA8XnU/x3CAsACo9tQAZPzQCrdACESNIG6aVIXF+KBV3
         HUHiix7pAwuVksMSxAON9U09kdkTyF8McWG2otGigDNZoQ1v1Bnud0Qo6vLpY9Md4132
         soO7+x5zsV8gxGXxA3zNjsvEe+s31wH+QPPmWhxfCH/AqZmNl1gPmYphvWI2BJlLSj6C
         CSHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779292507; x=1779897307;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qUEo38Z2UW1bOtQms5iEEXiqGfAj5J5aVFe+L1H443A=;
        b=GUB9HolsOmmrEt2wzuWRJcq32iHFw1s1dgKutAIzl0dNyyo5mbbKrifACYrVWGMC0N
         ZbFQRhgpF/O5Be8smBvM6Eu7XuFkM9Gm8MYnQaXOJI7pqRP7u1s70AuSHTThJ3LXlC8O
         QZLq83mz5QqeWATXuYEmtLlbMtwqDeyz3EsJTPMTY0wNIugcplIEm6MaMBg/r8hyEBJl
         A+js7jYT1vjZFt/jXldVB2m4RbOd9SvcNfhwFsuF6UW7scj0B9p8CLfE4yOclXW+nmY0
         eVi28VadmZ9BpUSfGccNOyhfJM61HNIEm676D0MTQIwLA7Vr8zF1ZcgxsV2WwrFBTe7M
         Y0rg==
X-Gm-Message-State: AOJu0YwU6dyAb1734GobqzHcbPISF7T0Pb8tIBlI820bMmqI8ueItCtF
	Lrmlgso1KrNeIW29gvULQtTWQfTYQQt098P9Lu6EYNaenMhc4F3Oe31JHnKulfu7Y2OdkhZNdyP
	w2LpOX1ZKNyITInUw+WhPpd2ukTAmtcvuVAIrEXmYvqVUaWTVy+T/xp2bAz/xSBFK5Q==
X-Gm-Gg: Acq92OGtCpN00aAJD4NKubcLmI6NSmD+keJNfhKirpVYjNNRPTyrQ4xmaYORnPLPvCC
	o1VSs1peLdUfWFVaa25BLJS+iXiK8/XqhsagJToPWTpEaS+MeOp1Yd6PIAwvYx8F2Q26kbQYfCs
	WFlaR8fzqa6EXkZeLf62v2InHjaeZKjpTr5Z+YxNqt0QURI4ERitbPpFMn/2MioMsJ/rtg8nYwh
	uO2BXJHJ+XCqz2ZiRJx0fzl5cQvQaRyi5T5rtu67eUi3exeTqFpesMlZhi4ro5wyyBekHoMJfGP
	qkM+oq5+oGT87Xft0f02IFe4O30nqTF7TLdBdxcdtu9DHN6FjgK8CRQxZtfyc7I6eSMfCzZ6zRz
	bavM+5RU6IQ4+O717zMYq3SjUafJvNIgHLWJXIdNPyV/rTPA9z0bkndWkIucJSPAUGQ==
X-Received: by 2002:a17:90b:3149:b0:35e:5051:fb18 with SMTP id 98e67ed59e1d1-36951cc9a37mr23651356a91.26.1779292506791;
        Wed, 20 May 2026 08:55:06 -0700 (PDT)
X-Received: by 2002:a17:90b:3149:b0:35e:5051:fb18 with SMTP id 98e67ed59e1d1-36951cc9a37mr23651323a91.26.1779292506292;
        Wed, 20 May 2026 08:55:06 -0700 (PDT)
Received: from [10.204.101.125] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-369f59656a9sm3939235a91.2.2026.05.20.08.55.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 08:55:05 -0700 (PDT)
Message-ID: <bdc1bd01-f9ab-4101-b9e6-5799d63ed1f6@oss.qualcomm.com>
Date: Wed, 20 May 2026 21:25:01 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/6] media: qcom: iris: vdec: allow GEN2 decoding into
 10bit format
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260511-topic-sm8x50-iris-10bit-decoding-v3-0-7fc049b93042@linaro.org>
 <20260511-topic-sm8x50-iris-10bit-decoding-v3-6-7fc049b93042@linaro.org>
 <c6789e1e-db42-4546-8a98-d75a2443747a@oss.qualcomm.com>
 <de7c6626-a1fc-4a8e-b5e6-86dadf47cdf7@linaro.org>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <de7c6626-a1fc-4a8e-b5e6-86dadf47cdf7@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: jT7CfSytrH9C5xtLT00l6oxe6CTpjZFH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDE1NCBTYWx0ZWRfX52b6HcJ06fxU
 7b1s0KJxpsUU1xm1gjHyUF1E6z9i91g4OPEV/Ej9T6PKcr1nVlYlJF5nD2NwkIY/9Z2Xq6OReLI
 Be3Xa4yjfQK3xcr+f3oYMK12DE1jZ98YhheudWv0NiqzKlPOsTKAz3ilCsOgPbGiWEO5+a5hR/a
 D391MUKSQoJZqBjYuRIa3kpD5CvR8R5k3QkcNWaRr0yoPPyK4A9SFYe405C9BymvVSvg81LcLra
 qbuDCmYoe0ZqCtJE0QpNMUKcrqKnMKQAYm/TPGc4Gy/rWuTjKPoJnhMoTf/R64jehq3+71D1fzY
 F6b/X+u2C8OmAh2v0hV2P3MPVWDVNfAOCoZCv+6T3nC/EtrKL4VrEPLb2QZ1s4sUEdls5sCC5d6
 PkVv/H6RSgbEZyOyvxCk/tfHBv+mN5QimdJJ4dp2bpeBtAU4BBo6U9mPFqaAB0QsfTDmu3gn3mu
 QAU1H+XiRhYHC1m7uew==
X-Authority-Analysis: v=2.4 cv=TO11jVla c=1 sm=1 tr=0 ts=6a0dd95b cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=KKAkSRfTAAAA:8 a=ivBWRc-cjDWwkC4WAK4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: jT7CfSytrH9C5xtLT00l6oxe6CTpjZFH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605200154
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62335-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
X-Rspamd-Queue-Id: 1DED6591697
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 5/18/2026 1:09 PM, Neil Armstrong wrote:
> On 5/13/26 21:39, Vikash Garodia wrote:
>>
>> On 5/11/2026 2:50 PM, Neil Armstrong wrote:
>>> Add the necessary bits into the gen2 platforms tables and handlers
>>> to allow decoding streams into 10bit pixel formats.
>>>
>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>> ---
>>>   .../media/platform/qcom/iris/iris_hfi_gen2_response.c    | 16 +++++ 
>>> ++++++++++-
>>>   drivers/media/platform/qcom/iris/iris_instance.h         |  2 ++
>>>   drivers/media/platform/qcom/iris/iris_platform_gen2.c    |  8 +++++---
>>>   drivers/media/platform/qcom/iris/iris_vdec.c             |  8 ++++++++
>>>   4 files changed, 30 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/media/platform/qcom/iris/ 
>>> iris_hfi_gen2_response.c b/drivers/media/platform/qcom/iris/ 
>>> iris_hfi_gen2_response.c
>>> index 0541e02d7507..b6d815c01f1d 100644
>>> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
>>> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
>>> @@ -542,6 +542,15 @@ static void 
>>> iris_hfi_gen2_read_input_subcr_params(struct iris_inst *inst)
>>>       pixmp_ip->width = width;
>>>       pixmp_ip->height = height;
>>> +    if (subsc_params.bit_depth == BIT_DEPTH_8 &&
>>> +        pixmp_op->pixelformat != V4L2_PIX_FMT_NV12 &&
>>> +        pixmp_op->pixelformat != V4L2_PIX_FMT_QC08C)
>>> +        pixmp_op->pixelformat = V4L2_PIX_FMT_NV12;
>>> +    else if (subsc_params.bit_depth == BIT_DEPTH_10 &&
>>> +         pixmp_op->pixelformat != V4L2_PIX_FMT_P010 &&
>>> +         pixmp_op->pixelformat != V4L2_PIX_FMT_QC10C)
>>> +        pixmp_op->pixelformat = V4L2_PIX_FMT_P010;
>>> +
>>>       switch (pixmp_op->pixelformat) {
>>>       case V4L2_PIX_FMT_P010:
>>>           pixmp_op->width = ALIGN(width, 128);
>>> @@ -625,7 +634,12 @@ static void 
>>> iris_hfi_gen2_read_input_subcr_params(struct iris_inst *inst)
>>>       inst->fw_caps[POC].value = subsc_params.pic_order_cnt;
>>>       inst->fw_caps[TIER].value = subsc_params.tier;
>>> -    if (subsc_params.bit_depth != BIT_DEPTH_8 ||
>>> +    if (subsc_params.bit_depth == BIT_DEPTH_8)
>>> +        inst->fw_caps[BIT_DEPTH].value = BIT_DEPTH_8;
>>> +    else
>>> +        inst->fw_caps[BIT_DEPTH].value = BIT_DEPTH_10;
>>> +
>>> +    if ((subsc_params.bit_depth != BIT_DEPTH_8 && 
>>> subsc_params.bit_depth != BIT_DEPTH_10) ||
>>>           !(subsc_params.coded_frames & 
>>> HFI_BITMASK_FRAME_MBS_ONLY_FLAG)) {
>>>           dev_err(core->dev, "unsupported content, bit depth: %x, 
>>> pic_struct = %x\n",
>>>               subsc_params.bit_depth, subsc_params.coded_frames);
>>> diff --git a/drivers/media/platform/qcom/iris/iris_instance.h b/ 
>>> drivers/media/platform/qcom/iris/iris_instance.h
>>> index 16965150f427..16424d1e94a6 100644
>>> --- a/drivers/media/platform/qcom/iris/iris_instance.h
>>> +++ b/drivers/media/platform/qcom/iris/iris_instance.h
>>> @@ -25,6 +25,8 @@ enum iris_fmt_type_out {
>>>   enum iris_fmt_type_cap {
>>>       IRIS_FMT_NV12,
>>>       IRIS_FMT_QC08C,
>>> +    IRIS_FMT_TP10,
>>> +    IRIS_FMT_QC10C,
>>>   };
>>>   struct iris_fmt {
>>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/ 
>>> drivers/media/platform/qcom/iris/iris_platform_gen2.c
>>> index 5da90d47f9c6..ceed4b5d96ca 100644
>>> --- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
>>> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
>>> @@ -56,9 +56,10 @@ static const struct platform_inst_fw_cap 
>>> inst_fw_cap_sm8550_dec[] = {
>>>       {
>>>           .cap_id = PROFILE_HEVC,
>>>           .min = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN,
>>> -        .max = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE,
>>> +        .max = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10,
>>
>> what about gen1 platforms ?
> 
> With this patchset gen platforms will reject 10bit since all the
> plumbing in the HFI response handling is missing.
> 
> Once the Gen1 HFI gets the bit_depth and calculates the buffer sizes, it
> should work. But looking at Venus, the 10bit buffer calculation seems much
> more complex in Gen1.

Is it more than accommodating higher buffer size by adding 25% extra for 
higher bits for decode scenario ?

> 
>>
>>>           .step_or_mask = BIT(V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN) |
>>> -                BIT(V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE),
>>> +                BIT(V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE) |
>>> +                BIT(V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10),
>>>           .value = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN,
>>>           .hfi_id = HFI_PROP_PROFILE,
>>>           .flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
>>> @@ -287,7 +288,7 @@ static const struct platform_inst_fw_cap 
>>> inst_fw_cap_sm8550_dec[] = {
>>>       {
>>>           .cap_id = BIT_DEPTH,
>>>           .min = BIT_DEPTH_8,
>>> -        .max = BIT_DEPTH_8,
>>> +        .max = BIT_DEPTH_10,
>>>           .step_or_mask = 1,
>>>           .value = BIT_DEPTH_8,
>>>           .hfi_id = HFI_PROP_LUMA_CHROMA_BIT_DEPTH,
>>> @@ -866,6 +867,7 @@ static const u32 
>>> sm8550_vdec_output_config_params[] = {
>>>       HFI_PROP_OPB_ENABLE,
>>>       HFI_PROP_COLOR_FORMAT,
>>>       HFI_PROP_LINEAR_STRIDE_SCANLINE,
>>> +    HFI_PROP_UBWC_STRIDE_SCANLINE,
>>>   };
>>>   static const u32 sm8550_venc_output_config_params[] = {
>>> diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/ 
>>> media/platform/qcom/iris/iris_vdec.c
>>> index f4d9951ed04c..65cf509e4aef 100644
>>> --- a/drivers/media/platform/qcom/iris/iris_vdec.c
>>> +++ b/drivers/media/platform/qcom/iris/iris_vdec.c
>>> @@ -70,6 +70,14 @@ static const struct iris_fmt 
>>> iris_vdec_formats_cap[] = {
>>>           .pixfmt = V4L2_PIX_FMT_QC08C,
>>>           .type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
>>>       },
>>> +    [IRIS_FMT_TP10] = {
>>> +        .pixfmt = V4L2_PIX_FMT_P010,
>>> +        .type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
>>> +    },
>>> +    [IRIS_FMT_QC10C] = {
>>> +        .pixfmt = V4L2_PIX_FMT_QC10C,
>>> +        .type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
>>> +    },
>>>   };
>>>   static const struct iris_fmt *
>>>
>>
>> Regards,
>> Vikash
>>
> 


