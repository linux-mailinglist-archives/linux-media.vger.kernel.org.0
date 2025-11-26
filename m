Return-Path: <linux-media+bounces-47752-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D42DC891B7
	for <lists+linux-media@lfdr.de>; Wed, 26 Nov 2025 10:51:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 9908B342B68
	for <lists+linux-media@lfdr.de>; Wed, 26 Nov 2025 09:50:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15F6E2FFDF7;
	Wed, 26 Nov 2025 09:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dqfXcoAj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PIQVr1YZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 461F42FC877
	for <linux-media@vger.kernel.org>; Wed, 26 Nov 2025 09:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764150550; cv=none; b=QZNBeShQqzN0cpwa/zn/IfkYojN8DfERz0VB+F3EgsROTyXEyvsg1iVPOqNBjdJRruAJ/HixpBLsDHrIQMDbjGCK2WRk2QW/o20opcRoigr4faziCvb7+xR9Frq12+dpbifcZuef2+sLQxg1yiOvC9qRu/C6bXtukeHkzdYSTX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764150550; c=relaxed/simple;
	bh=RrWGzLsOVYWtMHzZYByIJfPoEG0XlyOMqIT4XJQf9k8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g1bvKuWrjbb7q7VHec3gc4nvwvOZkW6OvyDvumvmymprwQ03NJ4KxxaMQMic4dmDEvKpsGQr4XGEzrVgtcmP4WO1+jkZE2JH4rq8pn2ApZ1S8oZchTYqaincn+5RAoZgB/kPu0GRlGPRFAUV0LJZxhswkMTXPdlsOb++7EFa6nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dqfXcoAj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PIQVr1YZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQ6TmLx3738620
	for <linux-media@vger.kernel.org>; Wed, 26 Nov 2025 09:49:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AtsXINd6xpjA/rQCk1uW0V0mzBllHaDtYhio+xIIvfI=; b=dqfXcoAjRQWE+/AY
	N+nyzYTyXp9JVN9vpsTXDFHgrN8BFnWHBJ6fLXrikHV06/kisL/O1Tg9LVCsbUTQ
	7zjo9mcI0rh4MrEWWmNHzwN9bBDUmhVpAlV4Qo2sfbzcRNptSBjUCDutAdQYNgsZ
	3mgB3BL7AZktGceDA7tUpOTC6R+VZPHbt6A8lo+V4ttXryRuJgwI+AGOMx0a2S5O
	ElgaDtMrJuJ9n9y/pzz7AYkAns32KF7iIDh1RB+WWAvkA8jT5bknOspIW/hd0gPX
	4Wjg4dcnJQmDbUlQxWZ5Zwz+uQjeRY95Vzr8GmItjAwgC78CDDSYBl7/VeuUeLba
	o7A/BA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4anggyjc74-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 26 Nov 2025 09:49:06 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2958a134514so88801605ad.2
        for <linux-media@vger.kernel.org>; Wed, 26 Nov 2025 01:49:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764150545; x=1764755345; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AtsXINd6xpjA/rQCk1uW0V0mzBllHaDtYhio+xIIvfI=;
        b=PIQVr1YZCKfsJnweTNuO0+ERL7Aoqcs28XHmdTnDFRAMy9+ESDuQgokrJFD3hpZOFJ
         KZyZWznoVu4gL50t1zwY4PV0IsY+w+6zzjDdMboSuHbUHKcr6+EV2vXWMMizLjE/15t2
         ckOqw2ws7yf0dquRdoHyRQlFENp5+RkhwvzuCmrrasLG+9SewPh3ha/tMvBFtyc0o68V
         cq0d2uckvZLMVYzEb1jy/0AWZJ9t/Fm5/V4T57dOyTY/CgTHhD8cl3+tqzCe1bJIPhnk
         k0WIZXzmoPVcv/WigXxO8NxiAvibWVot/yW6xddoNwUxNcQldsCYkcYWbwmaqfPG8RyJ
         Vs5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764150545; x=1764755345;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AtsXINd6xpjA/rQCk1uW0V0mzBllHaDtYhio+xIIvfI=;
        b=Bj8p0JJKO1pjIfXdTlOPOppFScwM5Xpc63s3HW+V5HNYwVdmQLxHh51qVoDTeI5/7X
         hhllwIAy255tGnsU7wo00f+TDK2mYuSZrSfuSde/lBmLoFfa8U7LP1M/goRqXTMEeT2w
         i2CCWA4EZ6A3dymftMPRHTRJekLcgQPCNzYkEMrcmenEfqdfbmqikORe7j3pfFGrRGUC
         O/oacUF/PnEKkQ3pI+MoXUKX5yLoTSaFgoxhee6oVJWRsVLZY4EDi9e1uXLuX30CUYYD
         w4JjdcN2pvtVBq798dGr6tN8urtovxNwLkrFbg/uqKyHTEjHH2zPwcoMpNDZZ0eFg5/5
         fLJQ==
X-Forwarded-Encrypted: i=1; AJvYcCWP1XmmzZnwNGpynU0Wx7JEItVR1OgavaxpKWYKDF0hSYUAPeK+QpNZoCYQL4CzvBrVnz2uDbABEvN2Nw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwGExIIr8PsFSlT+pj5z77cg8khXHNRZLBhOzyfoSAw05cReCqW
	j+zgBZnrfEAaUtRkt0rh37V+AzFbieQGRCqsRT1stg5f9kVvbJOTAIJ3AR34BrgeUW35XyHXQ89
	jhNDPY+INr4bZA94b+ivHp3oqYXWtml0O7mqam0UwjuSy3H2k71SiBgILLOVPc55c+g==
X-Gm-Gg: ASbGncuc/rNYLDShE0sYp1eeXFoKLUalkID8Pxjl2UwP4gvhjQYpSVFfkgihI47XlfM
	AyvrNPwgcHVEnzdo+6YPyC+bQcURkehR2T8hsPtzl0ypvFePctoTrWIK3Jon4Xm8WxCHJKI1wSE
	wQPUKLpIw1CmvUoLTIbuCpCpYCHeDiMGmzHl8LAGNNLVL99sUsD30ZMeXi9e+F6S38eDX6z1dl3
	SefZuqNM/1e8FA9W6uEhG2i6jUKGA7S59sgnsuNcOh6VaY2dKNr8dNX1Ca6yGzWXhfRhL2gnQIp
	ZbM5bbdP1QMcHFLEz/kkeCYeozPylA3PSnfQkJScNAXu9k/oGKU/xEoT7kKyU/jDqA8oTR8ghEz
	AadVfPcjkmkQQkB6bX9FOO5jXECCqEHVvasEQSftWxQ==
X-Received: by 2002:a17:902:ef50:b0:298:34b:492c with SMTP id d9443c01a7336-29bab2de50amr68568665ad.54.1764150544997;
        Wed, 26 Nov 2025 01:49:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IECJaA6tw1taMhFN8p4Mm8c/a1cFBpcKMpzmn0A6w/0YsEfsk2WgZNXfYdsHaohN5Z2GVSXlg==
X-Received: by 2002:a17:902:ef50:b0:298:34b:492c with SMTP id d9443c01a7336-29bab2de50amr68568375ad.54.1764150544473;
        Wed, 26 Nov 2025 01:49:04 -0800 (PST)
Received: from [10.0.0.3] ([106.222.230.111])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b1075c6sm193071335ad.17.2025.11.26.01.49.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Nov 2025 01:49:04 -0800 (PST)
Message-ID: <74bcf345-06e5-413a-d8cf-d87ba769e886@oss.qualcomm.com>
Date: Wed, 26 Nov 2025 15:18:59 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2] media: venus: vdec: restrict EOS addr quirk to IRIS2
 only
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Viswanath Boma <quic_vboma@quicinc.com>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org, Mecid <mecid@mecomediagroup.de>,
        Renjiang Han <renjiang.han@oss.qualcomm.com>
References: <20251125-venus-vp9-fix-v2-1-8bfcea128b95@oss.qualcomm.com>
 <wq7kaelokxqxkxxi5cvp7sz2az5hlam4nyyt4v55zrgei3jsyo@yyefysdsw3co>
 <e2b33a10-819d-df49-0687-74f6db4c5a05@oss.qualcomm.com>
 <CAO9ioeVKDjKMh3su2XVwXPxjfZNbVSan73d099C6_vkCqjkJmA@mail.gmail.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <CAO9ioeVKDjKMh3su2XVwXPxjfZNbVSan73d099C6_vkCqjkJmA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: njRRvvJGQ2YzpEWc9wNM-5fv-iDf9EfZ
X-Proofpoint-ORIG-GUID: njRRvvJGQ2YzpEWc9wNM-5fv-iDf9EfZ
X-Authority-Analysis: v=2.4 cv=bNUb4f+Z c=1 sm=1 tr=0 ts=6926cd12 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=12FOtvgV4D2gsqRYbU+y8g==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=aT5F4DDHPNheKAiJ_O8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDA3OSBTYWx0ZWRfX7P0zj05VoYzw
 UPtu4CzNydwEdlEFAswvqmgsZV2rok0cXXyRLbpdN7Vex/SvKILxYHEq37xT5uqyMUYp8IOTEQO
 Kx7wxxrUUHx9S02jxwaHdigAYl25vU17w52JFuRwE70Try76SyOcf4hwxw9Ldlk3bRmjIcGxODP
 aECeoj/qWSoZl40aPgKJvMyKYJRKkrH4exlpaXTY238B82VB8U5iqQTGwO5Q03u1CYLAzUWAku5
 KzvVrfHwVS2ACUq1LOjkyfLHMR3jUnY+P2twLBmbW98YvqHuTPBXchehWKYl4B4VwyvnoiSwCXd
 Ktjdr0NfSD+qUup0mYoewXR9Gl/1KuyDXmUcqMlEpHRSo1VTrc2c8nC2kzLOnpcRreQ8RD2ATRQ
 hrRcEBAFpmXdLokUUPbvERyLggPJzQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511260079



On 11/26/2025 2:13 PM, Dmitry Baryshkov wrote:
> On Wed, 26 Nov 2025 at 08:02, Dikshita Agarwal
> <dikshita.agarwal@oss.qualcomm.com> wrote:
>>
>>
>>
>> On 11/26/2025 6:43 AM, Dmitry Baryshkov wrote:
>>> On Tue, Nov 25, 2025 at 11:04:19AM +0530, Dikshita Agarwal wrote:
>>>> On SM8250 (IRIS2) with firmware older than 1.0.087, the firmware could
>>>
>>> Hmm, interesting. In linux-firmware we have VIDEO.IR.1.0-00005-PROD-4
>>> for SM8250 firmware. This version wouldn't be parsed at all for SM8250
>>> (nor does it follow the format string). Why? Would you please fix
>>> version parsing for this firmware?
>>
>> Right, Seems this firmware doesn't have the proper version string, I will
>> upload a new binary with proper version string soon.
> 
> That's fine, but also we need to fix the driver to correctly work with
> the firmware we currently have in linux-firmware.
> 

The current firmware with version string VIDEO.IR.1.0-00005-PROD-4 works
correctly with this logic. Since VIDEO.IR.1.0-00005 is not a valid version,
it is parsed as 0.0.0, so the condition is not met—which is expected for
this firmware, as it supports EOS using a dummy address.

>>
>>>
>>>> not handle a dummy device address for EOS buffers, so a NULL device
>>>> address is sent instead. The existing check used IS_V6() alongside a
>>>> firmware version gate:
>>>>
>>>>     if (IS_V6(core) && is_fw_rev_or_older(core, 1, 0, 87))
>>>>         fdata.device_addr = 0;
>>>>     else
>>>>      fdata.device_addr = 0xdeadb000;
>>>>
>>>> However, SC7280 which is also V6, uses a firmware string of the form
>>>> "1.0.<commit-hash>", which the version parser translates to 1.0.0. This
>>>
>>> I still think that using commit-hash is a mistake. It doesn't allow any
>>> version checks.
>>
>> Agree, we had this discussion with firmware team sometime back and for all
>> latest firmware they are having rel version in the firmware binary, but
>> SC7280 firmware binary would still have commit hash in version string.
> 
> What prevents us from updating SC7280 firmware to also include :rel-NNN part?
> 

We are working with firmware team on this, future firmware releases for
SC7280 would have video.firmware.1.0-<rel_version_number>

Thanks,
Dikshita
>>
>> Thanks,
>> Dikshita
>>>
>>>> unintentionally satisfies the `is_fw_rev_or_older(..., 1, 0, 87)`
>>>> condition on SC7280. Combined with IS_V6() matching there as well, the
>>>> quirk is incorrectly applied to SC7280, causing VP9 decode failures.
>>>>
>>>> Constrain the check to IRIS2 (SM8250) only, which is the only platform
>>>> that needed this quirk, by replacing IS_V6() with IS_IRIS2(). This
>>>> restores correct behavior on SC7280 (no forced NULL EOS buffer address).
>>>>
>>>> Fixes: 47f867cb1b63 ("media: venus: fix EOS handling in decoder stop command")
>>>> Cc: stable@vger.kernel.org
>>>> Reported-by: Mecid <mecid@mecomediagroup.de>
>>>> Closes: https://github.com/qualcomm-linux/kernel-topics/issues/222
>>>> Co-developed-by: Renjiang Han <renjiang.han@oss.qualcomm.com>
>>>> Signed-off-by: Renjiang Han <renjiang.han@oss.qualcomm.com>
>>>> Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
>>>> ---
>>>> Changes in v2:
>>>> - Fixed email address for Mecid (Konrad)
>>>> - Added inline comment for the quirk (Konrad)
>>>> - Link to v1: https://lore.kernel.org/r/20251124-venus-vp9-fix-v1-1-2ff36d9f2374@oss.qualcomm.com
>>>> ---
>>>>  drivers/media/platform/qcom/venus/vdec.c | 8 +++++++-
>>>>  1 file changed, 7 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
>>>> index 4a6641fdffcf79705893be58c7ec5cf485e2fab9..6b3d5e59133e6902353d15c24c8bbaed4fcb6808 100644
>>>> --- a/drivers/media/platform/qcom/venus/vdec.c
>>>> +++ b/drivers/media/platform/qcom/venus/vdec.c
>>>> @@ -565,7 +565,13 @@ vdec_decoder_cmd(struct file *file, void *fh, struct v4l2_decoder_cmd *cmd)
>>>>
>>>>              fdata.buffer_type = HFI_BUFFER_INPUT;
>>>>              fdata.flags |= HFI_BUFFERFLAG_EOS;
>>>> -            if (IS_V6(inst->core) && is_fw_rev_or_older(inst->core, 1, 0, 87))
>>>> +
>>>> +            /* Send NULL EOS addr for only IRIS2 (SM8250),for firmware <= 1.0.87.
>>>> +             * SC7280 also reports "1.0.<hash>" parsed as 1.0.0; restricting to IRIS2
>>>> +             * avoids misapplying this quirk and breaking VP9 decode on SC7280.
>>>> +             */
>>>> +
>>>> +            if (IS_IRIS2(inst->core) && is_fw_rev_or_older(inst->core, 1, 0, 87))
>>>>                      fdata.device_addr = 0;
>>>>              else
>>>>                      fdata.device_addr = 0xdeadb000;
>>>>
>>>> ---
>>>> base-commit: 1f2353f5a1af995efbf7bea44341aa0d03460b28
>>>> change-id: 20251121-venus-vp9-fix-1ff602724c02
>>>>
>>>> Best regards,
>>>> --
>>>> Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
>>>>
>>>
> 
> 
> 

