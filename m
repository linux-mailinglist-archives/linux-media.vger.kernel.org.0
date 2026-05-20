Return-Path: <linux-media+bounces-62333-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MDB+IcHkDWpz4gUAu9opvQ
	(envelope-from <linux-media+bounces-62333-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 18:43:45 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DA7A059256C
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 18:43:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3C5203269E21
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 15:47:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA3B333AD9C;
	Wed, 20 May 2026 15:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P6Qru0Bt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GvngbMGl"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAE71326D45
	for <linux-media@vger.kernel.org>; Wed, 20 May 2026 15:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779292051; cv=none; b=OQQGEzNE830ArX9bmdH6smBp7tCqcpBr674VrNLmaJgLQ4MdccQg5C85waGKnoajY9791YX9yyuoT2bei+upwbeQBGQ4OFZXesVGIvSxzjs8ncgjbJLzACiPdIx/iMg01tg6Ey+HAA/uUlp2zolR5gXPDmFyP7vQqBmxprPy5E4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779292051; c=relaxed/simple;
	bh=aX52iJOLM0ejEpu/B/nOamp3CugUdDMYBvNffSuH+JA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S3XCU94DlgO36a/KmDTMhiEnnKpqdenXQkRUY2w6iMjsK6NckEQW2vMJsEjVRL5KFQFwAbfggOhphXWlNsj3NrfgasjTtIW2uAE67NJmL3LQIAwizt34I+HDGw/03INH+wWUo0nzxLGd9yo4xrV0luh5Y+R7t2DCVdH8KuTPhyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P6Qru0Bt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GvngbMGl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KE6THq118986
	for <linux-media@vger.kernel.org>; Wed, 20 May 2026 15:47:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tFF7ygQCGQvN0fdjM33Djm66AQcJsUF1kfXIpetuWWM=; b=P6Qru0BtqC+Nh+3F
	Hw443YZZVaUgkg+zOUugfpFrrORwHBzJqBJhKP8HmkXbo+xHwI5RFYm+EuyDryKE
	beHDnI80JMhMexsvKRbPPWR8cn2hXexgbDAV2BhCOn+jBrqEuLMdjkDBygaIzcQC
	PYKSzX4q9CLzQc2mxKj2QAcDbjVvZvsa8j7YqkwN0VLemKx1QRCPyxj8JMGkiNFa
	V4Phyc6xDXosTZuquN22Pi+iVpyqdjVb4WZTwujhpMtPdkNXc5qFG0jolDU7yAGc
	iz32GxJyZwWxPSxxlj+ramHX6GK2ZhQdRlcaLaVjWAp9NPapywc2Z0d7BCc1xemf
	wfeqpw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9ee88epg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 20 May 2026 15:47:28 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-837c4eb3bdfso3201240b3a.2
        for <linux-media@vger.kernel.org>; Wed, 20 May 2026 08:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779292047; x=1779896847; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tFF7ygQCGQvN0fdjM33Djm66AQcJsUF1kfXIpetuWWM=;
        b=GvngbMGlsSM9wEIBSoMhGAWfr94mQY+yx0H6D3yGkBBp50jKKOnsMgzp1tAQiHAWin
         r4eg5g+3bnWJGgCFaltYR7XbqZMPsAE3cdLG0awSrPn4vi9LgFDQuQ7pQYW3pt4HSFuI
         vSJvSIDj2ptQY6bFwUp52AkRS2GJgd5ws1YBwA2SlCDdh5laez8Viaw1+d4sNQ+1bI8B
         VdykOF3tkpBfmPzEp/tYAYSWy2Tm7rmvOYfFne+WD1yNrMER1ZWKovqUxfQVS1s8XFA4
         BA8Gj/zFCyg2q+0pEcvEWJQxW09iPvdqJlcV7M+fvta1IC1lU7jWtDd9GdlrY9qpmKkb
         opZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779292047; x=1779896847;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tFF7ygQCGQvN0fdjM33Djm66AQcJsUF1kfXIpetuWWM=;
        b=YxcVKyrl6LSJmkJluJq5IX0GAV5Z2lKaGQYW5YDvccVWiVL0zlaH0914IoxkXecp7A
         5fSqxvOszn3mHxbzubnq4BfSY+1X/4EKqRFTOLZ4B9HjYMgpNxdgjZwN3gv5zdjQwJ0X
         /GRbZLdLZ0yvY0rDL6oc5/hRooqhH0EbLSNV47NW0xLFKdzRBd6Vst5BE2BSSuC2DxlX
         CQy9IqoYRnve4Y+okEata+Jc0JyCs+pO7BDehbdsvGOjlh8wn2Yjg7DcEwJ3xdba4ala
         A8kmQI37a8I1ZgbO9M1C2nKid6y6LZEOkSCuxhTurTnCFPNCdYVGuCAMPkZcQplLk7AN
         TrQg==
X-Gm-Message-State: AOJu0Yw6CYjvw/NjDCaj/dWx0HS1B3Q6gDqt0SDNjHn046i4RxCOXm6H
	PENyVwwhAR7AqQHBmYci74pQfwBMMablcD01cpCBmRJ4Wiz/1+Xfg486vuNx89m2YWbi3A7nhfG
	fQ2aRKko+uptgRus5tj/m6EhPMpfc3fJFu9eEN2YAwDMnzEMgESpxGKwpjOjaxALEQ3pVQCldDg
	==
X-Gm-Gg: Acq92OF4APdPXBUiWcxDPQhOLqifwYwMeVy0G0vNv7hRqBsr/im+6hCfBOtUWjlhHpj
	cwLTZgBBxg9yMTP8/UFsq3M0d4n6KEJNWjXAAwkHqgTYEczu4vvIFmR0kGpD2mDxMGRkFnG0Eyx
	cO0SCVXex089Kljsq8GMUprzhqhXrdYRWTPRlNYkxXmINHqxO4QwWa++Apz7Ng3HT7GuE9W4pWI
	sqEYQZHz/umciWcWrako8t9xecGq68yNs/qkH9Ffr382n77UoofAI1KojSzyU2IrW8c7ZaeQDc9
	RI3cOeKJrkJiP+t+cCU7shP7+FlZwH2CDaqHmWWu7xBWs9tYgjPDeHgXIRUSTMvDhLj0ayom2xZ
	8cEOMkAvbKUgyoF1ngT1qRzsQd2n5V9oZ7ZBXuMF4gvhXRudEY3GtTKg=
X-Received: by 2002:a05:6a00:4403:b0:834:e882:3280 with SMTP id d2e1a72fcca58-83f33cef68amr23860620b3a.31.1779292047393;
        Wed, 20 May 2026 08:47:27 -0700 (PDT)
X-Received: by 2002:a05:6a00:4403:b0:834:e882:3280 with SMTP id d2e1a72fcca58-83f33cef68amr23860591b3a.31.1779292046897;
        Wed, 20 May 2026 08:47:26 -0700 (PDT)
Received: from [10.204.101.125] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8413ac7b2b2sm2366282b3a.14.2026.05.20.08.47.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 08:47:26 -0700 (PDT)
Message-ID: <209f8a94-957f-4362-9e17-40e74eed4d7c@oss.qualcomm.com>
Date: Wed, 20 May 2026 21:17:21 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/6] media: qcom: iris: vdec: update find_format to
 handle 8bit and 10bit formats
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        nicolas Dufresne <nicolas@ndufresne.ca>,
        Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260511-topic-sm8x50-iris-10bit-decoding-v3-0-7fc049b93042@linaro.org>
 <20260511-topic-sm8x50-iris-10bit-decoding-v3-5-7fc049b93042@linaro.org>
 <5fc62574-fae1-4bf0-b6b9-fb6fb33041f8@oss.qualcomm.com>
 <08eff436-4221-4bc2-9fac-2ac1b6a091ae@linaro.org>
 <8f708b87-92d3-47ed-8cda-1f34b512816c@oss.qualcomm.com>
 <0534f746-c776-4688-94d3-85a7d7f2d25e@linaro.org>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <0534f746-c776-4688-94d3-85a7d7f2d25e@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: sskIj2a7ZiwWOPsYQJmw3pvQHvcl8sw_
X-Authority-Analysis: v=2.4 cv=e5k2j6p/ c=1 sm=1 tr=0 ts=6a0dd790 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=KKAkSRfTAAAA:8 a=Bh_PGqYUQJUX1eTUZJIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDE1MyBTYWx0ZWRfX77P8mQdTxYTT
 qsc5UIIt9oJWPBBcfEkuZrs9Pw6/CmeRwaasZI8ooVwhCkGeLiutvmt970cxuiAIFQtko5YFcjs
 /7bk8FGScjOoZvQWjxsOQAmAnq+jVpEbxWhzggsMWu0kGY/opCE+dxdlU5qXiyegaU9jzlsxdVn
 m1qH4aazHIqyLk0ABu/sLlYG+lRi8gBx8MDSIo+GN3eVDHJGxKWTSVyseijSEMEkQPrV+L3Kuex
 AcsdEmBABf6SjooJB8dmKuX48T5uqpMNJv1bC5Q5WU2gtZRPyH+WGo/PxQJxOe5YT+VVLPwzgP/
 oBn8ZscmvnGBFUx0ipfiXsC0/sdHB4e76ZZ/M0bwk4pfd/oJIpZ8eeaz66wlFeWDZJRMpxSqCIX
 PC7STz73sCfyx1t9aKH4NB3BvzEU3ckohRJIpGJCSgm8EiIuB7UMDh3tQ2UKFQysqj6P4DEPVd+
 kic1zDIrFIWx8PozjLw==
X-Proofpoint-GUID: sskIj2a7ZiwWOPsYQJmw3pvQHvcl8sw_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 adultscore=0 suspectscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200153
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,linaro.org:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62333-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DA7A059256C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 5/20/2026 9:09 PM, Neil Armstrong wrote:
> On 5/20/26 17:30, Vikash Garodia wrote:
>>
>> On 5/18/2026 1:06 PM, Neil Armstrong wrote:
>>> On 5/13/26 21:27, Vikash Garodia wrote:
>>>>
>>>>
>>>> On 5/11/2026 2:50 PM, Neil Armstrong wrote:
>>>>> The 10bit pixel format can be only used when the decoder identifies 
>>>>> the
>>>>> stream as decoding into 10bit pixel format buffers, so update the
>>>>> find_format helper to filter the formats and only allow the proper
>>>>> formats when setting or trying a capture format.
>>>>>
>>>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>>>> ---
>>>>>   drivers/media/platform/qcom/iris/iris_platform_common.h |  1 +
>>>>>   drivers/media/platform/qcom/iris/iris_vdec.c            | 10 ++++ 
>>>>> ++ ++++
>>>>>   2 files changed, 11 insertions(+)
>>>>>
>>>>> diff --git a/drivers/media/platform/qcom/iris/ 
>>>>> iris_platform_common.h b/drivers/media/platform/qcom/iris/ 
>>>>> iris_platform_common.h
>>>>> index 5a489917580e..cd3509da4b75 100644
>>>>> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
>>>>> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
>>>>> @@ -18,6 +18,7 @@ struct iris_inst;
>>>>>   #define REGISTER_BIT_DEPTH(luma, chroma)    ((luma) << 16 | 
>>>>> (chroma))
>>>>>   #define BIT_DEPTH_8                REGISTER_BIT_DEPTH(8, 8)
>>>>> +#define BIT_DEPTH_10                REGISTER_BIT_DEPTH(10, 10)
>>>>>   #define CODED_FRAMES_PROGRESSIVE        0x0
>>>>>   #define DEFAULT_MAX_HOST_BUF_COUNT        64
>>>>>   #define DEFAULT_MAX_HOST_BURST_BUF_COUNT    256
>>>>> diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/ 
>>>>> drivers/ media/platform/qcom/iris/iris_vdec.c
>>>>> index eea69f937147..f4d9951ed04c 100644
>>>>> --- a/drivers/media/platform/qcom/iris/iris_vdec.c
>>>>> +++ b/drivers/media/platform/qcom/iris/iris_vdec.c
>>>>> @@ -99,6 +99,16 @@ find_format(struct iris_inst *inst, u32 pixfmt, 
>>>>> u32 type)
>>>>>       if (i == size || fmt[i].type != type)
>>>>>           return NULL;
>>>>> +    if (type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) {
>>>>> +        if (iris_fmt_is_8bit(fmt[i].pixfmt) &&
>>>>> +            inst->fw_caps[BIT_DEPTH].value == BIT_DEPTH_10)
>>>>> +            return NULL;
>>>>> +
>>>>> +        if (iris_fmt_is_10bit(fmt[i].pixfmt) &&
>>>>> +            inst->fw_caps[BIT_DEPTH].value != BIT_DEPTH_10)
>>>>> +            return NULL;
>>>>> +    }
>>>>
>>>> similar logic would be now needed while enumerating fmt.
>>>>
>>>> VIDIOC_ENUM_FMT will now enumerate all capture formats (NV12, QC08C, 
>>>> QC10C..) regardless of the stream's bit depth, while VIDIOC_S_FMT 
>>>> will reject the wrong-depth formats.
>>>>
>>>> userspace will see formats via ENUM_FMT that it cannot successfully 
>>>> set with S_FMT.
>>>
>>> So initially I did that, but I reverted since it broke decoding with 
>>> gstreamer when trying
>>> to use QC10C since it requires negociating the src/sink before 
>>> sending the fist buffer
>>> and then get the source format change to switch to 10bit.
>>
>> Does that mean that src is still producing the data in Q10c, while 
>> sink is configured to NV12 (8bit) ?
> 
> No, it's early src/sink negociation capabilities with the special DRM 
> DMABUF format to handle the QC10c, way before playback starts and starts 
> the v4l2 dance.
> 

How will it know its Q10c, even before the playback starts ?

>>
>>>
>>> I checked and none of the other v4l2 drivers supporting 10bit does 
>>> that, so it seems right
>>> to allow enumerating all possibly supported formats and only accept 
>>> the session supported
>>> one with S_FMT.
>>
>> I was reading the documentation on this aspects, and it says to keep 
>> all the supported ones, instead of changing runtime and limit it to 
>> 10bit ones, in this case.
> 
> Hmm, so my change is correct ?

Yes, to me.

> 
>>
>> +ing Nico and Hans incase they would like to comment on this.
>>
>>>
>>>>
>>>>> +
>>>>>       return &fmt[i];
>>>>>   }
>>>>>
>>>>
>>>> Regards,
>>>> Vikash
>>>>
>>>
>>
> 


