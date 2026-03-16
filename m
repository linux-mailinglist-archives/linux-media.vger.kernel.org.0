Return-Path: <linux-media+bounces-55847-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0JzEMuujt2lTTwEAu9opvQ
	(envelope-from <linux-media+bounces-55847-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 07:32:11 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A2F7295281
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 07:32:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 47CB8301485C
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 06:32:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C4DE34B69C;
	Mon, 16 Mar 2026 06:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pyMMjOyv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cZlmfZiK"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E62E91E7660
	for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 06:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773642719; cv=none; b=q0L4M+76hCVqlESQdI6AO8/umoWNDWmGnTLYUSJi0C4RQmzYfv/Ogm3EjHREgZxghEl49SWNkSIM+hz+sFtssQJAWVhzHzt4LB1hzEmBxr7UKamkXZQCVBmgQGpPPtwiyVtem7+qFlGXPp87xceQM53UhX7TSovoy6L+tal4KAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773642719; c=relaxed/simple;
	bh=yscTG/g2iXR9YXrHTVXBT4T1cKwdu0HQ9OsZPwGLuLE=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=Fs7MWurlT9G0wL5nrfqOBmKFeGZi/eW1cMIufxbhFuYSYuwIWE+cUeGJp25z5dIlkNo+yljC2NHM8XcvrrRYOarVWt3TjBX2aC5nufh0TXQsJyjQVQ3lQDuOMZ5vKnEQxXHalROoi/J9hSJ7u9gQMA2OQiKpk/ZbOefhxZD/exs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pyMMjOyv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cZlmfZiK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62G64nS62672713
	for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 06:31:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VsivYvTUQMeamwJNsER8S2QMqiCuz4MTg+3Nvf4A8b4=; b=pyMMjOyvldAx1qAS
	iu3G6+PbeuGtSk0SoI8eFfHbs5p5aJrzi8dxkOaHnJVIyYKvZaqgKV2e0IVov8LV
	YgXCS9DHwTkPOE+rUasvsJMjMvbpcAsKHl7m3G0xnvGzkX77Vazmq1/FrWePJjAf
	FSYY24TVQjJluqf4ivaU54ALKRTyLpmfk7jEF6delxvUCBT4FyJxlojbNemANIS2
	LRcIz/O2tZpFKU9EMZwwjieS6qn+Kqn1jrMchUYeeCIySxxpNpWhSVXOgMG2Or5+
	CzhE2m7o2uhukfUxvcXxFITytyIo7grHFJUwg6hd1VEqz6h1bRPt8JDlM8rxLtCD
	lo7lMA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw03xmfgh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 06:31:55 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c738bebd53fso18661743a12.3
        for <linux-media@vger.kernel.org>; Sun, 15 Mar 2026 23:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773642715; x=1774247515; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VsivYvTUQMeamwJNsER8S2QMqiCuz4MTg+3Nvf4A8b4=;
        b=cZlmfZiKQsTyReaNH1EDGYsWt+/+f52I99xBW1T5WzL/k04vDb0cmqNjSGo5ID2rg4
         9NH0gPvL4Ag277o9+oTOsOlgFI6JV8uIjZRa+oqQ+kiUz+vmY5dLC8kpu2XuRv0Y3xvQ
         BIhHLwVbR4T0V3Nc1gYplSgBAIheqqvUqbABdeyjnEHFOKhR5Hkm7MKfbm66nxLP3LV2
         8uhbrjj7J4pd9xwzpObVqyrpG3OWiDoag4wlFJ3vtvjJCFiwdlynP7ZEvtHkTmCRTapX
         f0WUbEz2jC6r9MIAYTrxvc17UwkXHL6WtczeZn3WVcctaRiSPIJ0FP+uOV53cWJBiDVL
         /O0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773642715; x=1774247515;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VsivYvTUQMeamwJNsER8S2QMqiCuz4MTg+3Nvf4A8b4=;
        b=PFf15jQOrl3m/BButU2BXQflMeaOA2i0uGuAxVLiBPtC7MDP91H/FPxlcdoSbvF8Az
         w8GzPSDkvG/AjtvPQwk0CbwbxWPO0zWfJrG2dphj2aI3pdul5yOH2pFiEpeoIs78fizN
         zgf/07y3cbBuzS9LuUNyVuHKgdoMJ4w45JLqOdRTRqqUl6eV69Y4/TOwqMJVMMnHLLut
         6Gu4ml6m1IigTBfB/qeZvQ+FyA07zyFAcdZ2lSuGKpEWFLuBoj8OX81lpIHvnA/C6Fvr
         boMLApDlIuOMuE/dlUp+lfYc7VxcL3i7KppZpwvTq91nL49/6tdiMudUlMumZWTNq4Vt
         /bKg==
X-Forwarded-Encrypted: i=1; AJvYcCU3zhjms0M4z9BOm+3hLeVVcVDZRyGfrOO77N8M4tOgHyWzLcAAtedY6LA+q9yUbZHTPkPJZUxooqCpqw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyj9J42Xeci6Rgj45ksdhixUeJ+HQ+BhwFe+umYNMmZQjUEMbMO
	gvBFXDMMUhb30P7Cdhr+bf23gq4ah/0ZtFec/pUegggXHqo6kJzFqCS8W5gdoWxJUZa0AEaKjWv
	fm0MndlN3n6latdovVVnTEUotpa8IgbSNdpQDZPtIHFWGMXmQalp7wqsE+sa3cv0O/A==
X-Gm-Gg: ATEYQzyOiGLkSU6MlzXdMZkynF9+ICG1qx00WQSMtV+bA1x+Cq6mxGb7C1yZfmSHcvk
	d7ztwqEvayubrOnEAgKJ6jVORb+TIzBRQCaYf97pmTQ1Olowl1ckw0VZemEDgWY/qY6TsRrVOhy
	1/38PV651I+QVDZfzeT+gMVLioJpTAPIYKUyUL1jfvn2XyyIG4m1hUmgt+LYxaB7qLOVXFQw8O0
	vmhRfDfjlu1KfPwoLme1ittLx3f9oSiCvC3vCFkzAeLLm35csiw0bGvztZA6RtBxVbJOd7cF9K7
	LS+iUbM4pXYqKDDoSiedcT7oQPbB+ZKFGKTj7IrQWds7PnTodvJ2VJPY+tYt0UIuiHH0oUK9lHZ
	RyrVoaMNDHA1BWEzco/aGkkCSPF2F6eiIxYEBTSR1Hn24LyXICguN/A==
X-Received: by 2002:a05:6a00:2482:b0:81f:9b4d:e029 with SMTP id d2e1a72fcca58-82a198efa10mr8153555b3a.38.1773642714782;
        Sun, 15 Mar 2026 23:31:54 -0700 (PDT)
X-Received: by 2002:a05:6a00:2482:b0:81f:9b4d:e029 with SMTP id d2e1a72fcca58-82a198efa10mr8153539b3a.38.1773642714220;
        Sun, 15 Mar 2026 23:31:54 -0700 (PDT)
Received: from [10.0.0.3] ([106.222.229.118])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a0725bfd0sm14896007b3a.14.2026.03.15.23.31.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Mar 2026 23:31:53 -0700 (PDT)
Message-ID: <54bfdee8-771f-8b0e-b5d1-d9eaa934b48b@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 12:01:48 +0530
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
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
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
In-Reply-To: <5a6a6979-ff3e-0885-ce88-5c9316b9bcad@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA0OCBTYWx0ZWRfX18nSvm/5427J
 DFW2S4mbaQFDN4E02R2UH0OEYG9rXP5cEg9vtbkOMf5QzMnbHopFBOXdX50S3qdQeLuoqeOHiT6
 tqUt7CQd9/qQJjZXhXR4DvOHoI18SvPrxUhdnGnYobpVJ96PAZPIuyVCDOHbJxWevdLqMgmwEPV
 80gOI+0ZKtJdxm6vSLWaCBvutaJd8ax/jEhDqXLiG+NUUNGul6XTtj9TVjZ6LzC7RPQQpBGq8SI
 fQ4FX0gCMn4svZF/3qbYoNuKOaZLk0ggcNoMRkVeYUuVfpxD6hwS48CAwESinqPKVqBXWdjx0rC
 4UN/oD2kEBoh/V14VMTCPY3hD8wZFnsBLJSHK4A5pjwowKl1LhNVwo7VoC/Lh505ie1tySvneWc
 9dW2wdnlN/NWjs4DAdxYp4skx4rlvlKba8cz4tBwBWsoFUnnrIMYYPPcZxIp7IhEM0oZffCiXjZ
 PdAJYBdAGZTRhUJowFw==
X-Authority-Analysis: v=2.4 cv=YLOSCBGx c=1 sm=1 tr=0 ts=69b7a3db cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=RgczR8+8wRjDfzPIf2UjDw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=cYps8jqkEHwmtrCmuWQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: V6foSrozRsAxbgflQe39SUAMvUKF0Wd_
X-Proofpoint-GUID: V6foSrozRsAxbgflQe39SUAMvUKF0Wd_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 spamscore=0 malwarescore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160048
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55847-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
X-Rspamd-Queue-Id: 4A2F7295281
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/13/2026 2:55 PM, Dikshita Agarwal wrote:
> 
> 
> On 3/13/2026 1:37 PM, Dmitry Baryshkov wrote:
>> On Fri, Mar 13, 2026 at 01:19:21PM +0530, Dikshita Agarwal wrote:
>>
>> I'm sorry, I've refreshed the series before receiving this email. I will
>> send new iteration after settling the discussion here.
>>
>>> On 3/13/2026 9:00 AM, Dmitry Baryshkov wrote:
>>>> Having firmware-related fields in platform data results in the tying
>>>> platform data to the HFI firmware data rather than the actual hardware.
>>>> For example, SM8450 uses Gen2 firmware, so currently its platform data
>>>> should be placed next to the other gen2 platforms, although it has the
>>>> VPU2.0 core, similar to the one found on SM8250 and SC7280 and so the
>>>> hardware-specific platform data is also close to those devices.
>>>>
>>>> Split firmware data to a separate struct, separating hardware-related
>>>> data from the firmware interfaces.
>>>>
>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>>> ---
>>>>  drivers/media/platform/qcom/iris/iris_buffer.c     |  84 +++----
>>>>  drivers/media/platform/qcom/iris/iris_core.h       |   1 +
>>>>  drivers/media/platform/qcom/iris/iris_ctrls.c      |   8 +-
>>>>  .../platform/qcom/iris/iris_hfi_gen1_command.c     |  10 +-
>>>>  .../platform/qcom/iris/iris_hfi_gen2_command.c     |  66 ++---
>>>>  .../platform/qcom/iris/iris_platform_common.h      |  79 +++---
>>>>  .../media/platform/qcom/iris/iris_platform_gen1.c  |  68 +++---
>>>>  .../media/platform/qcom/iris/iris_platform_gen2.c  | 268 +++++++--------------
>>>>  drivers/media/platform/qcom/iris/iris_probe.c      |   3 +-
>>>>  drivers/media/platform/qcom/iris/iris_vidc.c       |  10 +-
>>>>  10 files changed, 246 insertions(+), 351 deletions(-)
>>>>
>>>
>>> <snip>
>>>
>>>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
>>>> index d1daef2d874b..1a870fec4f31 100644
>>>> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
>>>> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
>>>> @@ -201,45 +201,16 @@ enum platform_pm_domain_type {
>>>>  	IRIS_APV_HW_POWER_DOMAIN,
>>>>  };
>>>>  
>>>> -struct iris_platform_data {
>>>> +struct iris_firmware_data {
>>>>  	void (*init_hfi_ops)(struct iris_core *core);
>>>> +
>>>>  	u32 (*get_vpu_buffer_size)(struct iris_inst *inst, enum iris_buffer_type buffer_type);
>>>
>>> I still don't think it's right to keep vpu_buffer_size in firmware data as
>>> this would change mostly for every new VPU variant.
>>>
>>> The buffer sizing logic depends on VPU generation (vpu2, vpu3, vpu33,
>>> vpu35) / SoC constraints, not on whether the HFI is Gen1 vs Gen2.
>>
>> Okay, so how do we solve the SC7280 Gen1 vs Gen2 situation? I can keep
>> the function pointer in struct iris_platform_data for now, letting you
>> sort it out in your series.
> 
> Thanks! that is SC7280 problem, since code evolved due to additional
> features and other things, we might need to increase the vpu2 buffer size
> to accommodate both Ge1 and Gen2 requirement, I will check that and address
> in my series.
> 
>>
>>>
>>> <snip>
>>>
>>>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
>>>> index 10a972f96cbe..a83f6910f8b7 100644
>>>> --- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
>>>> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
>>>> @@ -906,41 +906,15 @@ static const u32 sm8550_enc_op_int_buf_tbl[] = {
>>>>  	BUF_SCRATCH_2,
>>>>  };
>>>>  
>>>> -const struct iris_platform_data sm8550_data = {
>>>> +const struct iris_firmware_data iris_hfi_gen2_data = {
>>>>  	.init_hfi_ops = iris_hfi_gen2_sys_ops_init,
>>>>  	.get_vpu_buffer_size = iris_vpu_buf_size,
>>>> -	.vpu_ops = &iris_vpu3_ops,
>>>> -	.icc_tbl = sm8550_icc_table,
>>>> -	.icc_tbl_size = ARRAY_SIZE(sm8550_icc_table),
>>>> -	.clk_rst_tbl = sm8550_clk_reset_table,
>>>> -	.clk_rst_tbl_size = ARRAY_SIZE(sm8550_clk_reset_table),
>>>> -	.bw_tbl_dec = sm8550_bw_table_dec,
>>>> -	.bw_tbl_dec_size = ARRAY_SIZE(sm8550_bw_table_dec),
>>>> -	.pmdomain_tbl = sm8550_pmdomain_table,
>>>> -	.pmdomain_tbl_size = ARRAY_SIZE(sm8550_pmdomain_table),
>>>> -	.opp_pd_tbl = sm8550_opp_pd_table,
>>>> -	.opp_pd_tbl_size = ARRAY_SIZE(sm8550_opp_pd_table),
>>>> -	.clk_tbl = sm8550_clk_table,
>>>> -	.clk_tbl_size = ARRAY_SIZE(sm8550_clk_table),
>>>> -	.opp_clk_tbl = sm8550_opp_clk_table,
>>>> -	/* Upper bound of DMA address range */
>>>> -	.dma_mask = 0xe0000000 - 1,
>>>> -	.fwname = "qcom/vpu/vpu30_p4.mbn",
>>>
>>> Should fw_name be in firmware_data? as this can be change based on HFI
>>> versions?
>>
>> That would fail because then each device will have to gain its own
>> struct iris_firmware_data.
>>
>> But... Maybe we can do something as simple as:
>>
>> struct iris_firmware_desc {
>> 	const char *fwname;
>> 	u32 (*get_vpu_buffer_size)(struct iris_inst *inst, enum iris_buffer_type buffer_type);
>> 	bool (*checK_fw_match)(u8 *buf, size_t size);
>> 	const struct iris_firmware_data *data;
>> };
>>
>> and then
>>
>> struct iris_platform_data {
>> 	struct iris_firmware_desc *gen1, *gen2;
>> 	// .. the rest as usual;
>> };
>>
>>
>> struct iris_core {
>> 	u32 (*get_vpu_buffer_size)(struct iris_inst *inst, enum iris_buffer_type buffer_type);
>> 	const struct iris_firmware_data *data;
>> 	// ... the rest as expected
>> };
>>
>> During first open the driver will try loading firmware from DT and
>> identifying it using the check_fw_match() callback. If DT doesn't have
>> firmware-name the driver will try loading gen2 and, if not found, gen1.
>> When firmware loading succeeds, it will set the pointer and the callback
>> in iris_core, settling the interface between the driver and the
>> firmware.
>>
>> WDYT?
> 
> This looks good to me. It handles the SC7280 Gen1 vs Gen2 buffer size
> differences as well.

Do you plan to implement above design in the next version of your series?

Thanks,
Dikshita
> 
> Thanks,
> Dikshita
> 
>>
>>>> -const struct iris_platform_data sm8650_data = {
>>>> +const struct iris_firmware_data iris_hfi_gen2_vpu33_data = {
>>>
>>> This proves my above point.
>>>
>>> iris_hfi_gen2_data and iris_hfi_gen2_vpu33_data become identical except for
>>> get_vpu_buffer_size, which forces us to create multiple “firmware_data”
>>> variants just to carry a hardware-specific difference.
>>>
>>> Also, it will scale poorly going forward. When we introduce vpu4 /
>>> vpu5–based platforms, we would need to add more copies of essentially the
>>> same HFI Gen2 firmware_data, differing only in the buffer sizing callback.
>>
>> Yes. I'm not sure, if there is any difference between params / caps as
>> implremented by the firmware for those generations.
>>

