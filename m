Return-Path: <linux-media+bounces-55629-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YAOSN4DZs2mzbgAAu9opvQ
	(envelope-from <linux-media+bounces-55629-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 10:31:44 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D3FA28087E
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 10:31:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7DE9C3108B5F
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 09:25:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DE94389111;
	Fri, 13 Mar 2026 09:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="btpg47S4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AL/n5HR1"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A84C0387377
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 09:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773393952; cv=none; b=R+USQ6XTKqvV1PYFlpY/ZEyxK3gcCFLEVKOamO1N9I8ji7wUJOkRsw79ToeZuGTQrzyHVai3GVdjRqzLW/FKLdIYF8rGmxse7Ykla8Ql728kwHfEoUblEB2UzFyTR+aoIY+0EC11v9YimBYHa0cpRIY1YEqOg9ItTaKhVeuYQ4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773393952; c=relaxed/simple;
	bh=WslZKkKjX2fmc6FtOrAk0+WHsAO7sI5wt/oehGYntps=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pU5tjoGB+QHkW/j/k3X41l9RgviGDA173RRoqAvQd5tTJg0sRJwRa31Q1bMsSPPDn4Y2bDmGVxg6qgQb1eyHpzgNu+pPexTFvmeMMTcB7YKAsft2B+pmKUIq4aqObD0UCS6iBDMsjjW/qH2OPf2P0thzFH3gM2/Qha1mlnalfuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=btpg47S4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AL/n5HR1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D5tYxV3229725
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 09:25:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cjq4klxHx55B+VrcBTReIOP0ofQpmNCVPNUdh1XeIWc=; b=btpg47S4VA0xSBvA
	fNYqoM1Aw2UyZkGPoMNd22fB5nkg2y2/j4jv3bnSdaj/01aG1v+7s6ZrIWYQUTMw
	D3wm3/ElQ4oDpXuNURy+SrGwEChVdZ79Aa2HjkGDBhDQgFOThDr4rCkqMiPCb6kB
	OJap9+WR9pAvx1a/ujYDwS9xSLmIh3wTuKAI/cGxYEQn6JIc84R7Tzs9UNK3I5k3
	K1ljtGXzuNM6vwzQFATXDkbv6h2uqtR4d8dRmdeKjtA9hwoWD/SH9obY2nXYK7i/
	KPy+vKZ1dFwEJMe+WLUgxHBk1DCRLRhcGU88uZc/Tp1gt2BwJs0MSBr2GL2sGTfz
	WUGVEg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cv8n7hgyj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 09:25:49 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82a17153ee9so426667b3a.1
        for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 02:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773393949; x=1773998749; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cjq4klxHx55B+VrcBTReIOP0ofQpmNCVPNUdh1XeIWc=;
        b=AL/n5HR1iMn6sImsZMXLSxqmqCjJlqX3OautQ4NahXuY9jN8GzRDS3ngiXIKTgqKEO
         t+ZkXhY0vLsCz67JfoKvXGVKOgDZYh/x2kPVpd4scl/Bn82iI6nR+VrTdoMGEJ6KnO5R
         ABIU0nGqfXYfoNX+sT2pv8j71ndoBe31xZRogeKYx/Z9wPD2J5lZtc8h8oAREdH52uLW
         RaQ5HCGOhoApCUmzpytOMlkxNNdLiGqmzirnfOZ7wRn7JEVgGO3F6ZcueB6wR5UWoi06
         PPz5JhDEvWJH7nHXyEkvUHUyLPFklPxXPd9nMaJCgj1HSIArC4w8wEB/v6sGW3kY69aV
         gYWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773393949; x=1773998749;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cjq4klxHx55B+VrcBTReIOP0ofQpmNCVPNUdh1XeIWc=;
        b=DyR7/mh0cP7somIZNpiUsV//KvlOfjF4HaqRI/euzb4S1uKsCzaq5dAKc6QeLOY0Ij
         LTghvzG1RHBjzfV3hxfZeRmvDgy8XD9mtFs8Y21IXfMTYOXo8ntZUjc6ALXCtaNl3keC
         MVO4PN0RpOW6SC9ffw12T8n6tRzVsZtlJOnhkerAYiM23DZY+QSwn9u4MXZgDXF8oN99
         i7Kp4Ozf8Dibu31HqzDu2nzfuE3zxqxZvEl2Kt5OTayY2oBOTzVndQnN6BJtOT4C1Wfp
         SU/Gc2AHhjvir57re4thTNqt92fn8QUq71kp9ksVBXslhcudO3u2EKcjVld2MZ3gSjqR
         Co+w==
X-Forwarded-Encrypted: i=1; AJvYcCXauFQmEcX9pp5/DLSmClKI+vEZmb2d7mAQAixWEGiPumHi7WDw5T/LkG07Wti/uYQSjgG1Q5kzEzo/jw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyaR0jv5YxwOt2oRXBLe1pemcV2qt9J8LXtCceIvM6vzn6NObrU
	1FMR56K9fiyKjmxiYlUcE29sN5duKBLAmOZAhPptbzCM/jtkhBqG9R5D1RlNX53XnAEt4Z51eSb
	sotigUyhaYEwOTGP1UCRF6lpJzdaX8Fzegi9pU+KguVbZKnVqD01FEu2hhGFgmpPAag==
X-Gm-Gg: ATEYQzz9CeNi4F6V1hwNlnsBHEba2VbUnGmEysZ9wGSUdE4Z1+e8fDfeuzuYkhaTizd
	LudQ0DoLfNCE/xrMH5PYJvBlwM5G6lk6fvq1WDle7a4X9Y1jcGpAHySaM5spESBImi7xzh+G+eL
	D4peSur7JVqrf+o3AADA/RmNTPbPwkbJ0KYHQeM4hUO07CJGN2tSwUl+zeRMhdcZtiwyeTMVx8O
	3atuU2b+1Avh4c/uWwLwSROWcxYZeUb3qR5ZpNM1sHg2JjUWjRIKyEy2lp2XNx3oCO1Zcx7gi/r
	7iuZq7Upk8EDaLcB4YwYSulB7qei1u9hyIGqWIPygDRT7nzO6u3Oa7/piAGJBifntz8+kizxT98
	u9uvRCVEoryepzKhdHE5Gb+9SJPSNwBn2Idlll5iKSIWP6UxZ85VY
X-Received: by 2002:a05:6a00:4189:b0:824:9451:c1f4 with SMTP id d2e1a72fcca58-82a198ce735mr2086217b3a.55.1773393949091;
        Fri, 13 Mar 2026 02:25:49 -0700 (PDT)
X-Received: by 2002:a05:6a00:4189:b0:824:9451:c1f4 with SMTP id d2e1a72fcca58-82a198ce735mr2086183b3a.55.1773393948499;
        Fri, 13 Mar 2026 02:25:48 -0700 (PDT)
Received: from [10.0.0.3] ([106.222.229.52])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a0734199csm5520997b3a.36.2026.03.13.02.25.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2026 02:25:48 -0700 (PDT)
Message-ID: <5a6a6979-ff3e-0885-ce88-5c9316b9bcad@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 14:55:43 +0530
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
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <24oq4plyvburuufxs6vt2kt7e3mlwlis7dekszjnxson245amy@muyu5fpohhfu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: jtq46bBu8Ef49Sv-ngxqaygH1hNoMB-U
X-Proofpoint-GUID: jtq46bBu8Ef49Sv-ngxqaygH1hNoMB-U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA3MiBTYWx0ZWRfX0TUGd+RY53YH
 2/DunNSBTimSM+jXfKYEYoPYu6AZRMaV/ogFX9+azYsvHXlj/va2yi2QD++qMVb0gY72NB040VC
 IoNWbK1N4iU8XlUK/3LGnWsmGYbxYd97MQ8uR7+LG5OK+mzN2S2FEjyXM366MPeeCIh8Xlh+M2W
 ydN+d+MDcOYFbZSxJnqp7fqbUyfhyzit8zUdzDOLJX8F0N9kdzwYLYFMuOSo0Qg1xR+veuJeXQW
 tUGZJM8CtAv/CPOuJm+o26j6GgJHdue3sD4U5uDQOibsz8RFW5FaWfLKmFhWJ60DOstAGp22uN4
 DejfSrmrJ8bExHmSUOBjcXaycU0cbpG4Os4WY4Clekr17rx8cI0xOHs49vpVQH/lxB+CHHU8rlx
 F8oBOkX1SPy3ASJR8kCOVabzu8ScBjk0gA+81HwatfOlaP7tMtChNVaAdho93doAMGIqdeRWNxv
 zvE2AjRyqRQa+MWVpnQ==
X-Authority-Analysis: v=2.4 cv=CpCys34D c=1 sm=1 tr=0 ts=69b3d81d cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ndT/fs+coltRyMHftQWjTw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=smf9p1qIHa2bQNuakXcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_01,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130072
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55629-lists,linux-media=lfdr.de];
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
X-Rspamd-Queue-Id: 5D3FA28087E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/13/2026 1:37 PM, Dmitry Baryshkov wrote:
> On Fri, Mar 13, 2026 at 01:19:21PM +0530, Dikshita Agarwal wrote:
> 
> I'm sorry, I've refreshed the series before receiving this email. I will
> send new iteration after settling the discussion here.
> 
>> On 3/13/2026 9:00 AM, Dmitry Baryshkov wrote:
>>> Having firmware-related fields in platform data results in the tying
>>> platform data to the HFI firmware data rather than the actual hardware.
>>> For example, SM8450 uses Gen2 firmware, so currently its platform data
>>> should be placed next to the other gen2 platforms, although it has the
>>> VPU2.0 core, similar to the one found on SM8250 and SC7280 and so the
>>> hardware-specific platform data is also close to those devices.
>>>
>>> Split firmware data to a separate struct, separating hardware-related
>>> data from the firmware interfaces.
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>> ---
>>>  drivers/media/platform/qcom/iris/iris_buffer.c     |  84 +++----
>>>  drivers/media/platform/qcom/iris/iris_core.h       |   1 +
>>>  drivers/media/platform/qcom/iris/iris_ctrls.c      |   8 +-
>>>  .../platform/qcom/iris/iris_hfi_gen1_command.c     |  10 +-
>>>  .../platform/qcom/iris/iris_hfi_gen2_command.c     |  66 ++---
>>>  .../platform/qcom/iris/iris_platform_common.h      |  79 +++---
>>>  .../media/platform/qcom/iris/iris_platform_gen1.c  |  68 +++---
>>>  .../media/platform/qcom/iris/iris_platform_gen2.c  | 268 +++++++--------------
>>>  drivers/media/platform/qcom/iris/iris_probe.c      |   3 +-
>>>  drivers/media/platform/qcom/iris/iris_vidc.c       |  10 +-
>>>  10 files changed, 246 insertions(+), 351 deletions(-)
>>>
>>
>> <snip>
>>
>>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
>>> index d1daef2d874b..1a870fec4f31 100644
>>> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
>>> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
>>> @@ -201,45 +201,16 @@ enum platform_pm_domain_type {
>>>  	IRIS_APV_HW_POWER_DOMAIN,
>>>  };
>>>  
>>> -struct iris_platform_data {
>>> +struct iris_firmware_data {
>>>  	void (*init_hfi_ops)(struct iris_core *core);
>>> +
>>>  	u32 (*get_vpu_buffer_size)(struct iris_inst *inst, enum iris_buffer_type buffer_type);
>>
>> I still don't think it's right to keep vpu_buffer_size in firmware data as
>> this would change mostly for every new VPU variant.
>>
>> The buffer sizing logic depends on VPU generation (vpu2, vpu3, vpu33,
>> vpu35) / SoC constraints, not on whether the HFI is Gen1 vs Gen2.
> 
> Okay, so how do we solve the SC7280 Gen1 vs Gen2 situation? I can keep
> the function pointer in struct iris_platform_data for now, letting you
> sort it out in your series.

Thanks! that is SC7280 problem, since code evolved due to additional
features and other things, we might need to increase the vpu2 buffer size
to accommodate both Ge1 and Gen2 requirement, I will check that and address
in my series.

> 
>>
>> <snip>
>>
>>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
>>> index 10a972f96cbe..a83f6910f8b7 100644
>>> --- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
>>> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
>>> @@ -906,41 +906,15 @@ static const u32 sm8550_enc_op_int_buf_tbl[] = {
>>>  	BUF_SCRATCH_2,
>>>  };
>>>  
>>> -const struct iris_platform_data sm8550_data = {
>>> +const struct iris_firmware_data iris_hfi_gen2_data = {
>>>  	.init_hfi_ops = iris_hfi_gen2_sys_ops_init,
>>>  	.get_vpu_buffer_size = iris_vpu_buf_size,
>>> -	.vpu_ops = &iris_vpu3_ops,
>>> -	.icc_tbl = sm8550_icc_table,
>>> -	.icc_tbl_size = ARRAY_SIZE(sm8550_icc_table),
>>> -	.clk_rst_tbl = sm8550_clk_reset_table,
>>> -	.clk_rst_tbl_size = ARRAY_SIZE(sm8550_clk_reset_table),
>>> -	.bw_tbl_dec = sm8550_bw_table_dec,
>>> -	.bw_tbl_dec_size = ARRAY_SIZE(sm8550_bw_table_dec),
>>> -	.pmdomain_tbl = sm8550_pmdomain_table,
>>> -	.pmdomain_tbl_size = ARRAY_SIZE(sm8550_pmdomain_table),
>>> -	.opp_pd_tbl = sm8550_opp_pd_table,
>>> -	.opp_pd_tbl_size = ARRAY_SIZE(sm8550_opp_pd_table),
>>> -	.clk_tbl = sm8550_clk_table,
>>> -	.clk_tbl_size = ARRAY_SIZE(sm8550_clk_table),
>>> -	.opp_clk_tbl = sm8550_opp_clk_table,
>>> -	/* Upper bound of DMA address range */
>>> -	.dma_mask = 0xe0000000 - 1,
>>> -	.fwname = "qcom/vpu/vpu30_p4.mbn",
>>
>> Should fw_name be in firmware_data? as this can be change based on HFI
>> versions?
> 
> That would fail because then each device will have to gain its own
> struct iris_firmware_data.
> 
> But... Maybe we can do something as simple as:
> 
> struct iris_firmware_desc {
> 	const char *fwname;
> 	u32 (*get_vpu_buffer_size)(struct iris_inst *inst, enum iris_buffer_type buffer_type);
> 	bool (*checK_fw_match)(u8 *buf, size_t size);
> 	const struct iris_firmware_data *data;
> };
> 
> and then
> 
> struct iris_platform_data {
> 	struct iris_firmware_desc *gen1, *gen2;
> 	// .. the rest as usual;
> };
> 
> 
> struct iris_core {
> 	u32 (*get_vpu_buffer_size)(struct iris_inst *inst, enum iris_buffer_type buffer_type);
> 	const struct iris_firmware_data *data;
> 	// ... the rest as expected
> };
> 
> During first open the driver will try loading firmware from DT and
> identifying it using the check_fw_match() callback. If DT doesn't have
> firmware-name the driver will try loading gen2 and, if not found, gen1.
> When firmware loading succeeds, it will set the pointer and the callback
> in iris_core, settling the interface between the driver and the
> firmware.
> 
> WDYT?

This looks good to me. It handles the SC7280 Gen1 vs Gen2 buffer size
differences as well.

Thanks,
Dikshita

> 
>>> -const struct iris_platform_data sm8650_data = {
>>> +const struct iris_firmware_data iris_hfi_gen2_vpu33_data = {
>>
>> This proves my above point.
>>
>> iris_hfi_gen2_data and iris_hfi_gen2_vpu33_data become identical except for
>> get_vpu_buffer_size, which forces us to create multiple “firmware_data”
>> variants just to carry a hardware-specific difference.
>>
>> Also, it will scale poorly going forward. When we introduce vpu4 /
>> vpu5–based platforms, we would need to add more copies of essentially the
>> same HFI Gen2 firmware_data, differing only in the buffer sizing callback.
> 
> Yes. I'm not sure, if there is any difference between params / caps as
> implremented by the firmware for those generations.
> 

