Return-Path: <linux-media+bounces-45098-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 50782BF3CB1
	for <lists+linux-media@lfdr.de>; Mon, 20 Oct 2025 23:56:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0531E18A6C51
	for <lists+linux-media@lfdr.de>; Mon, 20 Oct 2025 21:56:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B3482EFDBB;
	Mon, 20 Oct 2025 21:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aICfjdvc"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C83A226D16
	for <linux-media@vger.kernel.org>; Mon, 20 Oct 2025 21:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760997352; cv=none; b=X2Di1UxTtE+mmB8WwV6s/m0R9LXJ/FHdJHHpdYZEw2kcMeyAHljOKRgVK7ifNoKpQQKKsUo0QGRSZx2Wd4HDNDIhcMQVeg2DjdJDAlRawZRD+KsiCC98QlDIOH/OI5rf+2mxg+1l9rJ3EwvQG6V/mwwYjbqPYFBt7Qh5IkHy3aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760997352; c=relaxed/simple;
	bh=QyyuSoIUps09NFB1QyIEgzMdVDw/VR5SVVKBK6Ln8Fo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VPIfviKd7hN1Q9whnLlV+8Gv6IfD3hl02Yu5HKZEo9qOBHc26AfqTfljIPloFb4mVDd52ygdkfKLFf52nOBlkeRgbolnQEpFlPA6Fu82SGhQlVQEdvug33IV+xxy5pA6iBKY5Xvh2dcLm6Pr4E0OjqOtI2Ee3xlGRX6IHf2YCwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aICfjdvc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59KL0w5R010900
	for <linux-media@vger.kernel.org>; Mon, 20 Oct 2025 21:55:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X6eZpH/FR58J5vUSu8ZZ59QOVhzv+a1WRxrcUgHUIgI=; b=aICfjdvct/4nzh6c
	pY2LE+HGE2kPr1O0ILvXxjBvKBv3iOtECMJDusr/KIkCfXcyUpT3noTIUzldAmq0
	tvggGl9t02cDWQE8eadE1gKM1iZLrQECgr0a9aXsXOYrvXA2it3PxhtWW7cuVqgI
	3mVdQcr2AZmdw32rV50gXhTJafZVWzwlZRhNvNy/AEAIo+C7AeF5OOzpZqMBjUzx
	OhwDF39wtAuyphT9d+ybYajjFyJ6ObrC4E4tdzNrs6iL9qX7BIjpguczcAn+A1UY
	oz2HlXWhEJ7A7B1CxRbBIA3tRkhFVAIxQYImYkjGHgiaU97ndydOsDNN3TBG3uFj
	hp4QTg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49wtgere8r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 20 Oct 2025 21:55:48 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-32eadc2b473so1381309a91.3
        for <linux-media@vger.kernel.org>; Mon, 20 Oct 2025 14:55:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760997347; x=1761602147;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X6eZpH/FR58J5vUSu8ZZ59QOVhzv+a1WRxrcUgHUIgI=;
        b=g9VYg/LyR2pIX/hi/EfCtJxGVoyFSKb3uzPvt3eV8abMmnc4bRwOFFdL98nBK8dxne
         +Ps2g9EzR4srDmfA2qMlSii4SLbDVBKr03GQEyS0H1758DTttCxDJ7q0qtrhWvnKHq9q
         pFXYu0bh+mVXlsV3qkZLQH/73REuAGs1WQtLjBVGfq+eq9y4KxwP2Z0sW/oEzD6SAg/y
         5BhaHk6rLI70Wn3UL8ZUPaMv4+4Ik9Es+QqfBgWtelOj9vuITMltDB8J7eN1E/jRLfFx
         RBhU6hDVjh/HRNJpqFJYvnVfmNVMbR6P32B1iIPL7qCiaJyZbB1zyerxgwmrjhmxolNq
         wM6A==
X-Gm-Message-State: AOJu0YxfrlqsAZXy41qChTBnJ4tV4GD6tz9HXDfI+vPIWafAEoJFT80G
	AeGojMM4enu0UyyXYbEvDhBvPaJptFIHAcbUtEJsS6agop9pf+Bq6V4Vt0NhaQHY2Bc+ISeRe+3
	6Qw0xCrMui2lkMHXCHw52+CypFoEQ0Hl0z6GUtR+nLmMQxkTJ4z8Amj8lAFd0ALUCgg==
X-Gm-Gg: ASbGnct2h0s4IAKFs/1kpH5COvebeBHx+Jpum5aGj8EcmgJWSVyYGDCgcHJM++Zu/Wm
	7oQkqb5PcNfSUFt1Eg+oDzFXNNXP5306awfKw5wxuAlU849CkHCNt2jZ8GlKa5ZZZSIL0BAyl3k
	QIfwHiTACFFKvoBmC0UNsN5jlPfZwbWGj9/IwbeHw38sBpRtzrJJp/DexeaTc9ARUvEiZsVTzYH
	62ay1xBxsVlR7OY8wRLqv2GcMyqMP5hCcT2qiISsItS9ieHxxyT+byrIin/k8sODGpMIGEahdl5
	AXBvQG36izO2I3MPxO456PV6iDqzlD3LxuRKZmDmRCz2lW/GDJ7jjgWlKU85B2cC964j/AXg50P
	WAwSBLuQlH52fjgShzPRbT8ov8Txq9npXH2x+hoGv/VKUDxJJ7MQf2Q3mkJr/tg==
X-Received: by 2002:a17:90b:38d1:b0:32d:e413:964b with SMTP id 98e67ed59e1d1-33dfab602f8mr565636a91.2.1760997346848;
        Mon, 20 Oct 2025 14:55:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG3W8Ie9iEu+45g+BeKR4BDDKLBi8tJatteuLKjPwvcOVNUAFnYWCI0NWqGb5XXgmHpMWmX0w==
X-Received: by 2002:a17:90b:38d1:b0:32d:e413:964b with SMTP id 98e67ed59e1d1-33dfab602f8mr565613a91.2.1760997346320;
        Mon, 20 Oct 2025 14:55:46 -0700 (PDT)
Received: from [10.110.25.117] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33d5df5c0e3sm9120257a91.12.2025.10.20.14.55.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 14:55:45 -0700 (PDT)
Message-ID: <81d32471-0611-4653-bc87-1885d2939230@oss.qualcomm.com>
Date: Mon, 20 Oct 2025 14:55:44 -0700
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] media: uapi: videodev2: Add support for AV1
 stateful decoder
To: Nicolas Dufresne <nicolas@ndufresne.ca>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, kernel test robot <lkp@intel.com>
References: <20251017-av1_irisdecoder-v2-0-964a5478139e@oss.qualcomm.com>
 <20251017-av1_irisdecoder-v2-1-964a5478139e@oss.qualcomm.com>
 <c2acbc028d014ca9eccefc070e50e40a1022f90c.camel@ndufresne.ca>
Content-Language: en-US
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
In-Reply-To: <c2acbc028d014ca9eccefc070e50e40a1022f90c.camel@ndufresne.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: YGAP_zPLDnNG2w3V1wutF_k_VBXyUyEP
X-Authority-Analysis: v=2.4 cv=JeaxbEKV c=1 sm=1 tr=0 ts=68f6afe4 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=pP9GeRwLAAAA:8 a=EUspDBNiAAAA:8 a=QX4gbG5DAAAA:8 a=KIgxDb2ibSJr1G8uLA8A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
 a=f-NqBn8Q0oy_k3NxdD5f:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-GUID: YGAP_zPLDnNG2w3V1wutF_k_VBXyUyEP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIwMDE1NCBTYWx0ZWRfX4+8QyzH8T5j7
 G1v2DOmxiJ+WADRNcKgC80JQlJpNlq+7h/IoqweJ6mMNDpMxYXKSs3Bp5oTunkHXhuJU05lkVvx
 MkClxvyXzLb1jYPU9oJhDy261AbuhC1V0PURJHocr0XD3G4yMGcuuzNRSbWWdYW9MUrap9aBwrH
 v3yx/SqigMA4728XOj8LNK4+ULhYKY6O3iZQfl02AyJLZAaTXznG5gO4p9ccX9eqY7C34wl1Skn
 JP0eqvBqxr5QPYdad2hukVHsfqcw/7DIk6l9/YUEaF2cyE9FIEwSS9CSN8dW2ukCTs4tJF0zg+a
 b/FNP2oaInEMOIi5/Meta2Q/9KgUIYDiI4x63tIukwWS0PzAYrmYbEPJB0Un6sb92dMA44nAkdq
 Cu224bjy9GXPTQkBUmPz3UbM+bCjWw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-20_06,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 impostorscore=0 spamscore=0
 bulkscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510200154


On 10/17/2025 1:01 PM, Nicolas Dufresne wrote:
> Le vendredi 17 octobre 2025 à 11:35 -0700, Deepa Guthyappa Madivalara a écrit :
>> Introduce a new pixel format, V4L2_PIX_FMT_AV1, to the
>> Video4Linux2(V4L2) API. This format is intended for AV1
>> bitstreams in stateful decoding/encoding workflows.
>> The fourcc code 'AV10' is used to distinguish
>> this format from the existing V4L2_PIX_FMT_AV1_FRAME,
>> which is used for stateless AV1 decoder implementation.
>>
>> Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
>> ---
>>   Documentation/userspace-api/media/v4l/pixfmt-compressed.rst | 8 ++++++++
>>   include/uapi/linux/videodev2.h                              | 1 +
>>   2 files changed, 9 insertions(+)
>>
>> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst b/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst
>> index 806ed73ac474ce0e6df00f902850db9fd0db240e..d82557a6ac30851b4fd432a5ceab969abaed2e25 100644
>> --- a/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst
>> +++ b/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst
>> @@ -274,6 +274,14 @@ Compressed Formats
>>           of macroblocks to decode a full corresponding frame to the matching
>>           capture buffer.
>>   
>> +    * .. _V4L2-PIX-FMT-AV1:
>> +
>> +      - ``V4L2_PIX_FMT_AV1``
>> +      - 'AV10'
>> +      - AV1 compressed video frame. This format is adapted for implementing AV1
>> +        pipeline. The decoder implements stateful video decoder and expects one
>> +        Temporal Unit per buffer from OBU-stream or AnnexB.
>> +        The encoder generates one Temporal Unit per buffer.
>>   .. raw:: latex
>>   
>>       \normalsize
>> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
>> index becd08fdbddb857f8f2bf205d2164dc6e20e80b2..e03cfe0a5ae830595f0bf69b951ca16beaedab72 100644
>> --- a/include/uapi/linux/videodev2.h
>> +++ b/include/uapi/linux/videodev2.h
>> @@ -775,6 +775,7 @@ struct v4l2_pix_format {
>>   #define V4L2_PIX_FMT_H264_SLICE v4l2_fourcc('S', '2', '6', '4') /* H264 parsed slices */
>>   #define V4L2_PIX_FMT_HEVC_SLICE v4l2_fourcc('S', '2', '6', '5') /* HEVC parsed slices */
>>   #define V4L2_PIX_FMT_AV1_FRAME v4l2_fourcc('A', 'V', '1', 'F') /* AV1 parsed frame */
>> +#define V4L2_PIX_FMT_AV1      v4l2_fourcc('A', 'V', '1', '0') /* AV1 */
> An alternative fourcc could be to match the one used in the ISO specification,
> which is also what browsers and Android uses. It would be "av01", link to the
> spec:
>
> http://downloads.aomedia.org/assets/pdf/AV1-ISO-Base-Media-File-Format-Binding-Specification.pdf
>
> Though, we never had any requirement in this direction, its just an idea. With
> or without, I'm happy with the definition.

"av01" sounds good. It would keep it consistent with the spec.
I will update it in v3.

> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
>
> cheers,
> Nicolas
>
>>   #define V4L2_PIX_FMT_SPK      v4l2_fourcc('S', 'P', 'K', '0') /* Sorenson Spark */
>>   #define V4L2_PIX_FMT_RV30     v4l2_fourcc('R', 'V', '3', '0') /* RealVideo 8 */
>>   #define V4L2_PIX_FMT_RV40     v4l2_fourcc('R', 'V', '4', '0') /* RealVideo 9 & 10 */

