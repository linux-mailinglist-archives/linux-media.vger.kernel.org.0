Return-Path: <linux-media+bounces-62325-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oDyuAXTdDWqC4QUAu9opvQ
	(envelope-from <linux-media+bounces-62325-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 18:12:36 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 364A65919D8
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 18:12:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 457E93223128
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 15:30:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E79E3D890F;
	Wed, 20 May 2026 15:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CaaeDiH+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DNiWxcWJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 940E7175A8F
	for <linux-media@vger.kernel.org>; Wed, 20 May 2026 15:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779291053; cv=none; b=c4aCdAjsijDHVLWcSAv+kqfIJnCzzHdOhly/Vs6tplwP4FQXkWsQSFLVItNsZULn1Wzg3R3FsLcdw2KmduoIMJR5w6pgBqnMxqL/dqFpdhUrMsTKbpBPh6fvzETorQkqGIVfMmssL1jEriZE0tl5fvw7b/T4s+EXQqm1uL5KoBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779291053; c=relaxed/simple;
	bh=4lArACJqYw7YV8IOeLvkC+XWDSoxl76OWhzWPcXN5N0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K/qdKwCWOdXYVocaDS5SQ1wKIq82/NLG96akCPvEbmOjax5ISeK42KzBtcXmNhm8mNDnloLfsHDR0zeGPKl2OsMRRiYNLJZvCzTjX+R+02HiBLhWEQUVwV1AjxtNwDubCGad7bnLoJ+7nYyCP3qeGih1kQ8zPSPU4H8sJEcRNps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CaaeDiH+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DNiWxcWJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K8um5L4115406
	for <linux-media@vger.kernel.org>; Wed, 20 May 2026 15:30:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kzInGs0wiHNTrVpeK113go4qVHPTqXkw2qXPs0Cr0Yk=; b=CaaeDiH+XjiPEwPj
	CXDAxMdHkeLI9sIFfmREQLTpROydEAtuqOt4i93PGG58XXl8sgTxF1wRRxnSCK6C
	IKrlmeKm2ZWcRDfbhAorJ6gR6xIxo6f87UUE5Rex3+tJXK6xdB+QoWhsEIkbMwwB
	fZZudEAaQ85JjXrlYGrLJKyZu7/o44abu7nE912qQmwnx+WlKkqhAHAPJzXaQeGI
	HyT3Z5wIFNWGaemw0ZjImI3hM2LJC7gx5gEzaHd5wzInLwO9/2RmnCc/qnRyddjT
	f9lI4qWPMw0WAB6pbHTVeclVneXQ0Z/wYGDgckyLWizFcKzJXZR1tpdWPk5cL0Uh
	5kAvIA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e99w0hg5f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 20 May 2026 15:30:50 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c828b1b7fddso2816206a12.3
        for <linux-media@vger.kernel.org>; Wed, 20 May 2026 08:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779291049; x=1779895849; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kzInGs0wiHNTrVpeK113go4qVHPTqXkw2qXPs0Cr0Yk=;
        b=DNiWxcWJMay9OUwJkGow7diH4StKe1HdwbhEtaQfw0Lc8Um0zsvlxwISk4vCNBbTE+
         KB67d1aCAqVmcq83OA2xVeSd2iQosHh0ecjdFxazN/7MxKKnOE4QUcHWLx38A9HSDZIS
         Rx+SfcNCfYosS32g8I22I20itT7mKRNmlBzGfi4XH9oK7MeIc37DV7tcPwc2tSP8fn6B
         Z5KI7ZMjwfWZQKGsUGSL5AOEhFXaj9Y2kwXtD/gDyNjeYbKi5XmzfhpriebYaViRFyWk
         PGFHORl1mA7g8PMDFum1LPU7EH16SOpyYWa+MnQlDT4opQ7T2zcJiKh/WTeKYfFh78qN
         4ZVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779291049; x=1779895849;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kzInGs0wiHNTrVpeK113go4qVHPTqXkw2qXPs0Cr0Yk=;
        b=aHHl8tltQ3dpCkzF1t+QIh0TzWthpCzjQnyKWMXi6WTOn3IcISMypF3hEo6UKwxnGM
         PrX24NHPFj8Ehm7HPOUmhwvkJGYCy9irK65znFRoCBlU+9QXR19GnhanYq/v71z1CEHJ
         cZH897CvGo6xAHeaK6sJJPaQ5Q1ip8yoyYhP/btsVtm+wBTzLyLoOSdwy7dJx0DZLvFh
         2r/8L+hSEJdeH5jYD+0V4x+ABUHbwEweGmCEqtea8uaXGq+YM6fikeZG6m/fDoGq+Uic
         cSomk0GyUmTE/GfIgAcJVCO7kXCSMObJ4uUO3PmEVB6+Oq47HXajIxrl7aTBt7A2U4PQ
         sFGg==
X-Gm-Message-State: AOJu0YwvYS2PA9EtwZAhD+jedm8wGX5FZCRhhZfEEbvuip7J+g++JzQ8
	o0rsvWLbjTLqqURQbHerrL0EGqU9ApJHq6h/y1r5EA11A13/01T7tR2IsRsIwUtaH3izEL+57sZ
	fR5XNwIv31x/fuxUI1M7aIJ/1IemWPcfVDsY988Pk5cOGGaYNGB+bk5ZbKAxxXftlRQ==
X-Gm-Gg: Acq92OF9RFBKYxIvr33cX1j8p8wNO09M1UeAOTTjPP7dQuslWtUbuaPQ/oyj4z4/JFP
	f8s5R2U91VydPtmHCW4HLCtLtRVwKEINeMGr8aOSYQjiE4pCr5en9IWKhKGg3629754N5h/tT7E
	n6OLIBSIep88QUX5/lkZcXP90NaDYUqvKU5YiUO96MjDLR/2oNBt4G130HpgWruEnjRW1ubN751
	eWeb3/wU/MDfSbLO0cgW2ArThH0sKYK423KeI9kPokqjlxTUc8RvfiAb43ymveDPMTAofS9sHEM
	5thmjRBcdKVEZjKnCEUZwKCoblzFQ9UwztY5o+/v2QThiKfdhGsoT2hhz9fhBhX8TBCgQIxcRSQ
	WbW5z9VdCoxOtjhCqak00gmIdjp6wJl7fslatKe3kDlEAedY9gfTeITs=
X-Received: by 2002:a05:6a00:1486:b0:838:3404:c2b0 with SMTP id d2e1a72fcca58-83f33b1d289mr23151507b3a.13.1779291049466;
        Wed, 20 May 2026 08:30:49 -0700 (PDT)
X-Received: by 2002:a05:6a00:1486:b0:838:3404:c2b0 with SMTP id d2e1a72fcca58-83f33b1d289mr23151465b3a.13.1779291048931;
        Wed, 20 May 2026 08:30:48 -0700 (PDT)
Received: from [10.204.101.125] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f75c0d232sm10385394b3a.17.2026.05.20.08.30.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 08:30:48 -0700 (PDT)
Message-ID: <8f708b87-92d3-47ed-8cda-1f34b512816c@oss.qualcomm.com>
Date: Wed, 20 May 2026 21:00:43 +0530
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
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <08eff436-4221-4bc2-9fac-2ac1b6a091ae@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: wb4XfhD0mwAVFsCP4d5IEFRyLPDGSRpT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDE0OSBTYWx0ZWRfXxMs21g9con7s
 JiIIZirNRgLRrV95y3XUQyQwji2DjbyqzMrg4Ym1/iZNG93/I0EzoJhdTEVZcztf1u7fm+CV5Uk
 Dac7lSx0KDXLwGSWGWgNNg0uKP9hx6kdjqLS0Neigvl0GgIVv3bS4hr/qcKJYUPdOf4D4EbmUy+
 fuoW2AzXRijHcy0Hi/Qt0wxg5qIEE7bgID6WQ6P70H9i20uihDFqiFAKhfZotuSz1PI/++CVp10
 M42Fhbe0TRdxkhvn6pzebAupWk+imlhJJXnn1j0DVFbwPxvN8qmRF1j61hdR10+OucspI5L8E5g
 OqOJuuEaPHn8saruWu9CRNXc4uJj8xAKcTaaLXkef0mhwNVHOiqHgqvTKbEndbmat9wNowZlcGn
 ONI/UIcAY4SlxTBFaqHs8i5GAgwS0y+VwRCMmwpdjPd+7RFntiJjyhE1sczIc0RXZe5gyvxL7CG
 5VVXejUWBN1HRQt8rNw==
X-Authority-Analysis: v=2.4 cv=RZigzVtv c=1 sm=1 tr=0 ts=6a0dd3aa cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=KKAkSRfTAAAA:8 a=B986JHd8bV2UN6gAnN4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: wb4XfhD0mwAVFsCP4d5IEFRyLPDGSRpT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 impostorscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200149
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62325-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 364A65919D8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 5/18/2026 1:06 PM, Neil Armstrong wrote:
> On 5/13/26 21:27, Vikash Garodia wrote:
>>
>>
>> On 5/11/2026 2:50 PM, Neil Armstrong wrote:
>>> The 10bit pixel format can be only used when the decoder identifies the
>>> stream as decoding into 10bit pixel format buffers, so update the
>>> find_format helper to filter the formats and only allow the proper
>>> formats when setting or trying a capture format.
>>>
>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>> ---
>>>   drivers/media/platform/qcom/iris/iris_platform_common.h |  1 +
>>>   drivers/media/platform/qcom/iris/iris_vdec.c            | 10 ++++++ 
>>> ++++
>>>   2 files changed, 11 insertions(+)
>>>
>>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h 
>>> b/drivers/media/platform/qcom/iris/iris_platform_common.h
>>> index 5a489917580e..cd3509da4b75 100644
>>> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
>>> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
>>> @@ -18,6 +18,7 @@ struct iris_inst;
>>>   #define REGISTER_BIT_DEPTH(luma, chroma)    ((luma) << 16 | (chroma))
>>>   #define BIT_DEPTH_8                REGISTER_BIT_DEPTH(8, 8)
>>> +#define BIT_DEPTH_10                REGISTER_BIT_DEPTH(10, 10)
>>>   #define CODED_FRAMES_PROGRESSIVE        0x0
>>>   #define DEFAULT_MAX_HOST_BUF_COUNT        64
>>>   #define DEFAULT_MAX_HOST_BURST_BUF_COUNT    256
>>> diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/ 
>>> media/platform/qcom/iris/iris_vdec.c
>>> index eea69f937147..f4d9951ed04c 100644
>>> --- a/drivers/media/platform/qcom/iris/iris_vdec.c
>>> +++ b/drivers/media/platform/qcom/iris/iris_vdec.c
>>> @@ -99,6 +99,16 @@ find_format(struct iris_inst *inst, u32 pixfmt, 
>>> u32 type)
>>>       if (i == size || fmt[i].type != type)
>>>           return NULL;
>>> +    if (type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) {
>>> +        if (iris_fmt_is_8bit(fmt[i].pixfmt) &&
>>> +            inst->fw_caps[BIT_DEPTH].value == BIT_DEPTH_10)
>>> +            return NULL;
>>> +
>>> +        if (iris_fmt_is_10bit(fmt[i].pixfmt) &&
>>> +            inst->fw_caps[BIT_DEPTH].value != BIT_DEPTH_10)
>>> +            return NULL;
>>> +    }
>>
>> similar logic would be now needed while enumerating fmt.
>>
>> VIDIOC_ENUM_FMT will now enumerate all capture formats (NV12, QC08C, 
>> QC10C..) regardless of the stream's bit depth, while VIDIOC_S_FMT will 
>> reject the wrong-depth formats.
>>
>> userspace will see formats via ENUM_FMT that it cannot successfully 
>> set with S_FMT.
> 
> So initially I did that, but I reverted since it broke decoding with 
> gstreamer when trying
> to use QC10C since it requires negociating the src/sink before sending 
> the fist buffer
> and then get the source format change to switch to 10bit.

Does that mean that src is still producing the data in Q10c, while sink 
is configured to NV12 (8bit) ?

> 
> I checked and none of the other v4l2 drivers supporting 10bit does that, 
> so it seems right
> to allow enumerating all possibly supported formats and only accept the 
> session supported
> one with S_FMT.

I was reading the documentation on this aspects, and it says to keep all 
the supported ones, instead of changing runtime and limit it to 10bit 
ones, in this case.

+ing Nico and Hans incase they would like to comment on this.

> 
>>
>>> +
>>>       return &fmt[i];
>>>   }
>>>
>>
>> Regards,
>> Vikash
>>
> 


