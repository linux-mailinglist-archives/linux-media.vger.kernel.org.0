Return-Path: <linux-media+bounces-62447-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KHUDGRrUDmr2CQYAu9opvQ
	(envelope-from <linux-media+bounces-62447-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 11:44:58 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 077C25A2931
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 11:44:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 278CA302E1DF
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 09:44:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79C4037BE7B;
	Thu, 21 May 2026 09:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e89tlKG2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hEWE8z9e"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF1293242B8
	for <linux-media@vger.kernel.org>; Thu, 21 May 2026 09:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779356672; cv=none; b=T0htKiMC7gtegbr3Vph/j78ymwFJiuUn6G2LNavL+O8Nj8TIRmCeDD+0n4IAEa2V9rHHSmKNbiq3RlaT9TQSlA8yhWXxtVKyX4HlMBc082QXajxEn5efL7NGMyTpb03hjp6WnCWVIPFlbhjT70Y0RqZOszNTU8PjODJSNlPIE3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779356672; c=relaxed/simple;
	bh=vx8UXlor1Q+mZBEMuasnpVJ17YTJIUQy7oD2wpSPt9c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gpBaPvFmw2wRpn0l0+SlSVWLzwWB0aguMvGww5VX+6Tp6gN/6hLAk+DCCaMXksaLd4OmseybAQ8ye7dGJulil1RsvE4tTQgg12GyS81Z4soMlsRtqc3Y3DVlELyFhRt4lMkP1l12eU2YoUE/bcgyCcampwOY3QmXMMdgVpj4LUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e89tlKG2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hEWE8z9e; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L9A0952632756
	for <linux-media@vger.kernel.org>; Thu, 21 May 2026 09:44:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Pm8xPGqFT3gNqQUPfHk3ZAk/G820di6y10EGhneFd/Q=; b=e89tlKG2ldRZLMgx
	ZROd5bzhmXQ5wAsHKr99UO36vWiJIQeLI7XLkwAClZJh6MaiyUIiSL5cwfuYPa/p
	EVi4MM0L32qSmqAEFoppGGbhaTP3k7xHSmZsaDdlL2IsyQluVwKdhwb/AbT5YFWl
	u5UyLo1C4aueueP1hc0ByxH/8rwmJL1QPOYLxAAiNcbsNRSBnbBw8Xwnz0kAj4yh
	wLcLRWB5bTeoKbLvVzlU6KeuhEPEw04QFSeB+NZlywnl3OrSuQD6VDGQc7mFI7QZ
	QOkA4mIcmXPFL0Ul8y7XA4dz5XJUFbHLF3x2zRu2uLx3BAnFoGTCNt1O7gyExSNu
	YDNO/g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9ee8caxh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 21 May 2026 09:44:28 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2bc860066a6so42409095ad.0
        for <linux-media@vger.kernel.org>; Thu, 21 May 2026 02:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779356668; x=1779961468; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Pm8xPGqFT3gNqQUPfHk3ZAk/G820di6y10EGhneFd/Q=;
        b=hEWE8z9ejFXC/IgNaUGsbo0EHfTqVEKwViMW7vTp7zBL2tnE9t8D/WG9hh5DE5zhu9
         m2H6j68Q5ObBVB2Z+93aoBGSWDnAmIl2JlfBzPnMGMS0zmzdIPjLDjhXYZ4BBta38F9a
         XwUcIj50h1pAIZA1E4bdmny8IDBgXgpje7QrpBr5gzOVDx9vtJPL1QrsY+1qVg5QbaRc
         Zgxe2/nBweHGQP6rFoa++5OzFusfWpfPNK2KYZdEkXfcQTloR1f//UoBp2qbiqao+p8V
         l8Sv4IwC1KRc/nmvsKIrlwLYNwzZmGVnYBFiUV9ZR0xZlX4JaR0p//7+p+uPMFm9pifs
         sFHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779356668; x=1779961468;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pm8xPGqFT3gNqQUPfHk3ZAk/G820di6y10EGhneFd/Q=;
        b=l12PuHejvC3iNpwmTwPgP5GDdJyx2apahs5FEOjOlnLKplySJ9fZwHRpPMh/yd3xDV
         kOG5hLyyt/VY2mHslrO6hiGJ2gS3UvN2pcXphBOYqx++gp5sjzwZCL9ztdco3sMOjJU4
         GTWv/g3pp883Z4L6pkH3vADjA3075Z9p/7rrQAbpLP6FGYouHr4k4VIl2j5ZKGuLcihA
         jgKmMPcZ0wRWaFORxF0HL44fhP2CfGvTL6Pvgryu89BRJ1Q5xEEIDJnqPVFIdf6ZHoM+
         EnOS/iLIDkxEcmO/HMubH2ox8tGKq9mcFx+0fNeHACPUXDve1fPQXbXu80qs/3B42Hkw
         FSrQ==
X-Gm-Message-State: AOJu0YybOFqJA7F07mNCCJm7qYzdlJRuBsZF9Zmr/vDU1F0AQ+Ou8DPR
	ZWzJA0A7QZ5BHPvQaZuylM6UvaRg4taqdh1c/abnFZo3B7CB1+qiSD5WvhjyGPH6wPGrVdmScB4
	SEd7G+TsUeK0o5HyzV+lAseFrC6neL9eB2d+jYidSV78NVfhlj+rHKI7XlrXiEhpvig==
X-Gm-Gg: Acq92OFFgarRaBOmcq8V21XPjAYFQbtViyKGmRtyIIXNUvgL1WtdFhUaQuk4XniyUYJ
	6npg1Nttr6lhnscVNFcCo8OgrTxtr7OG1hXiXbIHaxHYYCmUh/bP/UDf4RLhWigFyFHxVGrTi+l
	+GkpM3MVPqQwO+E3LFxPJgy1SFKqbi6YvfvkGbOey5zOsJ0e10hOoZb22sHpKeF4OqoJvy7YRQ9
	KyAun/HkNnm2JMatu4vdJLs68EpAUTorIki5SkIFOX4HZNCYth5LecPIwGLv1A/E6/QzjNpAjZn
	xBh0S1cZJujF0BFRZlo8H06S+j7DrhUW56toX5qpMOTd9JdToxo4qrN2CVtBCruHeenFtIRSbgQ
	N2SfPtT5O0LmdEPPsCL+5VwRPYq54jGzmyydlhqRBgZKaZJuI0UdTNFI=
X-Received: by 2002:a17:902:f786:b0:2bd:2de3:519f with SMTP id d9443c01a7336-2bea32fd20fmr21522465ad.19.1779356667896;
        Thu, 21 May 2026 02:44:27 -0700 (PDT)
X-Received: by 2002:a17:902:f786:b0:2bd:2de3:519f with SMTP id d9443c01a7336-2bea32fd20fmr21522145ad.19.1779356667407;
        Thu, 21 May 2026 02:44:27 -0700 (PDT)
Received: from [10.204.101.125] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bea99112basm5206415ad.64.2026.05.21.02.44.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 02:44:26 -0700 (PDT)
Message-ID: <c770444d-be66-47e3-83bc-be477d4e07cd@oss.qualcomm.com>
Date: Thu, 21 May 2026 15:14:22 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/6] media: qcom: iris: gen2: add support for 10bit
 decoding
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260511-topic-sm8x50-iris-10bit-decoding-v3-0-7fc049b93042@linaro.org>
 <20260511-topic-sm8x50-iris-10bit-decoding-v3-3-7fc049b93042@linaro.org>
 <b6ab2112-c89a-4ac4-8525-e913ed0b5313@oss.qualcomm.com>
 <febaa0cf-eecf-40ea-b243-4f03646af918@linaro.org>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <febaa0cf-eecf-40ea-b243-4f03646af918@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 57NMCZ8R6qBPEizBwgUMNqKNlflQ_Bs1
X-Authority-Analysis: v=2.4 cv=e5k2j6p/ c=1 sm=1 tr=0 ts=6a0ed3fc cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=KKAkSRfTAAAA:8 a=iptcRLJNIGpdCXh1_3wA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDA5NiBTYWx0ZWRfXwRXx9tjOsW6i
 PfybkhQivt1f0+0etWyOl9u+NLfFLuoFbQxmEY0g9NQ0XzkLKGdMLnBeJEuVRCmgQ3aCKBv+RRy
 ihIO5lWdO4/p5gzRD8B6OJoet99V1zGu7/OL2vaLphwR365XVIQs14r/OO8x97LneInGraL3CfH
 4WQfeNyakXYjJpNfGwN9uzdMU9zupAPxQUTrPaICycQPepGW/dUGcv1mOX7hJJhAxPDExszqDbC
 cPiIK8OVPyIVVN3as4klSZnFNiD1XERrJBR2wOhMts7GgzJoTwEyVulESs4MgGTNbYWPm/Uk296
 5tzArTf2YtMj9XaAg6/DEXItTrTgvJvJbR5v/SmD+mq4hcax/uifgLWJELfF3K4QqiZj2CqSXqm
 WDnHPBoGXyN2Kl5Qa1vOn6HnSxGzWs/lv5nS+7j3IrAmEvutCS3T4CuEZXIFJKSiL0Yf6k7uoW5
 XywqFPuqTG6n4dhwisw==
X-Proofpoint-GUID: 57NMCZ8R6qBPEizBwgUMNqKNlflQ_Bs1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 adultscore=0 suspectscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210096
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-62447-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 077C25A2931
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 5/18/2026 1:02 PM, Neil Armstrong wrote:
> On 5/13/26 20:50, Vikash Garodia wrote:
>>
>> On 5/11/2026 2:50 PM, Neil Armstrong wrote:
>>> Add the necessary plumbing into the HFi Gen2 to signal the decoder
>>> the right 10bit pixel format and stride when in compressed mode.
>>>
>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>> ---
>>>   .../platform/qcom/iris/iris_hfi_gen2_command.c     | 75 +++++++++++ 
>>> ++++++++++-
>>>   .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  1 +
>>>   drivers/media/platform/qcom/iris/iris_utils.c      |  4 +-
>>>   3 files changed, 76 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c 
>>> b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
>>> index 30bfd90d423b..89de8c366836 100644
>>> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
>>> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
>>> @@ -481,8 +481,20 @@ static int iris_hfi_gen2_set_colorformat(struct 
>>> iris_inst *inst, u32 plane)
>>>       if (inst->domain == DECODER) {
>>>           pixelformat = inst->fmt_dst->fmt.pix_mp.pixelformat;
>>> -        hfi_colorformat = pixelformat == V4L2_PIX_FMT_NV12 ?
>>> -            HFI_COLOR_FMT_NV12 : HFI_COLOR_FMT_NV12_UBWC;
>>> +        switch (pixelformat) {
>>> +        case V4L2_PIX_FMT_NV12:
>>> +            hfi_colorformat = HFI_COLOR_FMT_NV12;
>>> +            break;
>>> +        case V4L2_PIX_FMT_QC08C:
>>> +            hfi_colorformat = HFI_COLOR_FMT_NV12_UBWC;
>>> +            break;
>>> +        case V4L2_PIX_FMT_P010:
>>> +            hfi_colorformat = HFI_COLOR_FMT_P010;
>>> +            break;
>>> +        case V4L2_PIX_FMT_QC10C:
>>> +            hfi_colorformat = HFI_COLOR_FMT_TP10_UBWC;
>>> +            break;
>>> +        };
>>
>> semicolon ?
> 
> Ack
> 
>>
>>>       } else {
>>>           pixelformat = inst->fmt_src->fmt.pix_mp.pixelformat;
>>>           hfi_colorformat = pixelformat == V4L2_PIX_FMT_NV12 ?
>>> @@ -517,7 +529,8 @@ static int 
>>> iris_hfi_gen2_set_linear_stride_scanline(struct iris_inst *inst, u32
>>>       stride_uv = stride_y;
>>>       scanline_uv = scanline_y / 2;
>>> -    if (pixelformat != V4L2_PIX_FMT_NV12)
>>> +    if (pixelformat != V4L2_PIX_FMT_NV12 &&
>>> +        pixelformat != V4L2_PIX_FMT_P010)
>>>           return 0;
>>>       payload[0] = stride_y << 16 | scanline_y;
>>> @@ -532,6 +545,61 @@ static int 
>>> iris_hfi_gen2_set_linear_stride_scanline(struct iris_inst *inst, u32
>>>                             sizeof(u64));
>>>   }
>>> +static int iris_hfi_gen2_set_ubwc_stride_scanline(struct iris_inst 
>>> *inst, u32 plane)
>>> +{
>>> +    u32 meta_stride_y, meta_scanline_y, meta_stride_uv, 
>>> meta_scanline_uv;
>>> +    u32 stride_y, scanline_y, stride_uv, scanline_uv;
>>> +    u32 port = iris_hfi_gen2_get_port(inst, plane);
>>> +    u32 pixelformat, width, height;
>>> +    u32 payload[4];
>>> +
>>> +    if (inst->domain != DECODER ||
>>> +        inst->fmt_src->fmt.pix_mp.pixelformat != V4L2_PIX_FMT_AV1)
>>
>> whats the restriction with AV1 here ?
> 
> This restriction is used in downstream driver and Dikshita reported we 
> shouldn't
> call HFI_PROP_UBWC_STRIDE_SCANLINE except for AV1.
> 
> Could you please check if it's necessary ?
> 
I discussed this with firmware folks. As per them, this interface is 
effective for AV1, and for others, it might lead to higher size due to 
host demanded alignment.

As per firmware team,
"While the documentation states it is applicable "for AV1 ONLY", sending 
it for HEVC, VP9, or H.264 will physically work—forcing the UBWC output 
buffers into the Host's fixed stride layout. However, because older 
codecs handle resolution changes natively by triggering a standard Port 
Settings Change (PSC) to reallocate buffers, using this property for 
them is largely unnecessary and will persist statically, potentially 
leading to wasted memory due to over-allocated padding"

Regards,
Vikash

