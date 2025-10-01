Return-Path: <linux-media+bounces-43454-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 459CEBAFAE7
	for <lists+linux-media@lfdr.de>; Wed, 01 Oct 2025 10:39:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B8491189DF1A
	for <lists+linux-media@lfdr.de>; Wed,  1 Oct 2025 08:39:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EADAD27EFFE;
	Wed,  1 Oct 2025 08:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Aa6viHzH"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5693F1E3DCF
	for <linux-media@vger.kernel.org>; Wed,  1 Oct 2025 08:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759307929; cv=none; b=CCOaLdHAqLDhbrlK3itIUaS9VJ3YhmF3/p8Iw/JREQL/lv3fie6AHyCy6luBjcPZyx3YiNXevY8HOM+bxl86F4iwjZ/68D99XwNg7ZRpM9ClXzySMnNyOL2WVljZQP7biTpjpfvmS7eMWckPB6nbMrHPXG9s4lwX4zcaaIhuDcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759307929; c=relaxed/simple;
	bh=tT14GjbSJRvFF+tIRZgJtNJsNgpoXd6VVrHo2gUtSiM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YbXwMYhz0pc/2VtgjhE/ApAOzAQk0DcD9/eilWai1O2J5qaJirsPhNi3ybwuFt0PETJNseX/iS5YNisD6I3pNtOGW3oDXzS9jgZvwWZNeXMbWERujF3/czCgNrCdQOq7BdhZ0tVQu33sS+mLXVXj+jthCP0mEhx80spomHTCBG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Aa6viHzH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58UMITw9016964
	for <linux-media@vger.kernel.org>; Wed, 1 Oct 2025 08:38:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9sz1tlLQ73dBkAxnOqxNaDvr+X6sM47eAfXet/I+ACc=; b=Aa6viHzHyHcMOn+K
	1+zRQcTvagCfELsDb6xo5lqgHYU6y9m0NlJjGVlBChiL3Zp4qOTulC4lmGmKU8Bb
	O0MbHyneFXCljjYWKIogCpv0hJLggXJ3On6U/6Nzof4I0r+sbwaRU6Snzy37aDKO
	DRM9E989oTyjAYEXNFUH4bFflSL7H5f/wMsRi+3qc56ylmi9wa/W4pVMZ7owffB3
	CQQJBCY/rwG0t8WSTaZPpRnHpSiI/BvMtR7a36NnhXRJjxVIuZlxE03bRx0ZJXUE
	VDG9XCjgYY3zWPB7gCeFDmQhMKNUlCRiTYku+SPN7o8SGYcHSwan2xrqsfJ/vBQT
	TZajCA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e93hkknr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 01 Oct 2025 08:38:46 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2697410e7f9so146336585ad.2
        for <linux-media@vger.kernel.org>; Wed, 01 Oct 2025 01:38:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759307925; x=1759912725;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9sz1tlLQ73dBkAxnOqxNaDvr+X6sM47eAfXet/I+ACc=;
        b=gjSY53vlZmopfJHUeZ1/NJES2ud+WHdoSij8S+dxzx8Bt4sSawPzhdk7daBPIfbCCO
         I/198gef+i4m4qJ3adW6AIbcMAHKoLSw1XKI6VMi2W9JtL24QqMBpgovRtmHLPyVtxcc
         ha57src6AI9y6xOonE2qFJMKkBC++qGGExaczPsBADLIs0FMuWt0ygVNQbcyvfn/Hojy
         zX+GBfNUbUJduFAIDZVBNTA9YSlCoYo7Obdvr41Pcpos8OSi++J9JffKbXH84vbecz1X
         gg2Qnj05G+ZFz2tXhG/bRNoLnO3Gf61lbDavRaoX6+Pp1DKgzfCFY2hg5smSTalVqody
         s1NA==
X-Gm-Message-State: AOJu0Yz33/JWuFDYOJkSM4fF2VRqcY/n6UKbwWLvyTmEqRjieVdvIOyn
	ajpfVkgMUKJFK1+c+W5qzT7nTeNGiEcIwuhs6Ed5JA9j9vBjfIpwZsy/nMpR+g3YiRRDly3V/po
	pVH5r4JS/idm4GMXxma/GV1QJqOT1fHdwn1rLQe2oc11cYEmXmrhxW8h3gUS68xMqpPx4CuvEyA
	==
X-Gm-Gg: ASbGncuZhowPXMaV9jScio3V3XDdM7nOQA6uJ6xvtVTFDQUduJqbOwovUL3gPUzWxg2
	/MVNKrzUDpENFmwuRHUb4sCCGtP85vGyX8WnRMnvcxlPzYvg6zaeeBHtX4Fv/ZEt0a7f0dgkbbU
	tMX/vAY63baoIpV9vBY5of9I3GcVV+ZBlH5E0plwwq9UEMUFXuo32htyZeU6hD/F2hQONK1a+MG
	dVh5HmXzzy1BlxpJmORXQhcOE95O58M0IdoQ18Ox1MMc0yIPZPt8eNu32mvZStGg1cHg+8aqntB
	MzEEaJ+TAgQfGtqn1RPEJbLSiFxHHZ3DluU60VwxnfLf+e/VigRpd6f7NPTPyqx4q1A5JzLxWR6
	Jv4Q=
X-Received: by 2002:a17:902:ce12:b0:267:a55a:8684 with SMTP id d9443c01a7336-28e7f2a12e8mr37876405ad.2.1759307925183;
        Wed, 01 Oct 2025 01:38:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEqxKH7ov1nye79QP0WmmWH0xeQOVkq2I/SI5avXaMOOsQbhEBvLKocBes9EI7crrMSnrN9PQ==
X-Received: by 2002:a17:902:ce12:b0:267:a55a:8684 with SMTP id d9443c01a7336-28e7f2a12e8mr37876115ad.2.1759307924680;
        Wed, 01 Oct 2025 01:38:44 -0700 (PDT)
Received: from [10.0.0.86] ([106.222.229.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed69bd869sm181660975ad.120.2025.10.01.01.38.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Oct 2025 01:38:44 -0700 (PDT)
Message-ID: <10bb819d-105b-5471-b3a6-774fce134eb6@oss.qualcomm.com>
Date: Wed, 1 Oct 2025 14:08:40 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/2] media: iris: Add support for QC08C format for decoder
Content-Language: en-US
To: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250919-video-iris-ubwc-enable-v1-0-000d11edafd8@oss.qualcomm.com>
 <OyMR2y907eHs6rnnO6bzy52LY_t8KXKscM-nTPu48x3NCYFU4mza-uz0HqnQlYqPg2JtDB8AhCtGAa26Cbq4PA==@protonmail.internalid>
 <20250919-video-iris-ubwc-enable-v1-1-000d11edafd8@oss.qualcomm.com>
 <27e36fdb-3107-4e7b-b402-fd72ea5c4d61@kernel.org>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <27e36fdb-3107-4e7b-b402-fd72ea5c4d61@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDA0MSBTYWx0ZWRfXxttl3n5Ce1uF
 Y2J/db70hgr5GKyzrZBEDh8srQSPgQV8+RqE/79/d+QA8g6fnHYokiuw9ah6b3Nsnc9kUvYZXDF
 AZonIaJ7Hyy8rqoYEZkXnMCMSNS9CVINbdT8qpNt/7NiHb+1cjztLSRhOH6YMnQlEo9EWog2eOf
 28snScjSSEOZQ+CyCPbQAUaC8TjQM86LYGPkNrusQ7O7PtEfXqHnDU6bVtHqQJF9S9GARZfZaRi
 fjf0O9waJT4zGGlwwvDUaQQb3ay++o1CYYrc01eGw8WkNbkjG9NB+DCVSTxCQqbxMstU7G3j62y
 fiCQL9/W5VoEYjzYxrzoiuZ0Py5BOVtsgeBZIcN8z5mZg+yLrYFFzMhm4BvtPT/LFU5PJxvKpNE
 7VqswUQuzP7FXw1hnOtFuvNeIHmXew==
X-Proofpoint-GUID: VU28auPIC2cP6QitNlm0fqJuvSQDJlp-
X-Proofpoint-ORIG-GUID: VU28auPIC2cP6QitNlm0fqJuvSQDJlp-
X-Authority-Analysis: v=2.4 cv=Rfydyltv c=1 sm=1 tr=0 ts=68dce896 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=L4UNg9I9cQSOxNpRiiGXlA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8
 a=u9E7l7EWuVC1dSZ7WYIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-01_02,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270041



On 9/24/2025 6:58 PM, Bryan O'Donoghue wrote:
> On 19/09/2025 16:47, Dikshita Agarwal wrote:
>> Introduce handling for the QC08C format in the decoder.
>> Update format checks and configuration to enable decoding of QC08C
>> streams.
> 
> Since QC08C is a Qualcomm specific pixel format, you should detail in your
> commit log exactly what the packing/ordering of pixels is.

I am just enabling support for QC08C format with this patch in iris driver
not defining it. The format is already described in v4l2 spec and the
packing is explained in detail[1]

[1]
https://elixir.bootlin.com/linux/v6.17-rc2/source/drivers/media/platform/qcom/iris/iris_buffer.c#L79

The only difference is, earlier it was enabled for interanl reference
buffers while this patch enables it for OPB (Output picture buffer) which
is used for display.

> 
> In other words tell the reader more about QC08C.
> 
>>
>> Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
>> ---
>>   drivers/media/platform/qcom/iris/iris_buffer.c     |  5 +-
>>   .../platform/qcom/iris/iris_hfi_gen1_command.c     | 12 +++--
>>   .../platform/qcom/iris/iris_hfi_gen2_command.c     | 18 ++++++-
>>   .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  1 +
>>   drivers/media/platform/qcom/iris/iris_instance.h   |  7 ++-
>>   .../media/platform/qcom/iris/iris_platform_gen2.c  |  1 +
>>   drivers/media/platform/qcom/iris/iris_utils.c      |  3 +-
>>   drivers/media/platform/qcom/iris/iris_vdec.c       | 61
>> ++++++++++++++++++----
>>   8 files changed, 89 insertions(+), 19 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c
>> b/drivers/media/platform/qcom/iris/iris_buffer.c
>> index
>> c0900038e7defccf7de3cb60e17c71e36a0e8ead..83dcf49e57ec1473bc4edd26c48ab0b247d23818 100644
>> --- a/drivers/media/platform/qcom/iris/iris_buffer.c
>> +++ b/drivers/media/platform/qcom/iris/iris_buffer.c
>> @@ -261,7 +261,10 @@ int iris_get_buffer_size(struct iris_inst *inst,
>>           case BUF_INPUT:
>>               return iris_dec_bitstream_buffer_size(inst);
>>           case BUF_OUTPUT:
>> -            return iris_yuv_buffer_size_nv12(inst);
>> +            if (inst->fmt_dst->fmt.pix_mp.pixelformat ==
>> V4L2_PIX_FMT_QC08C)
> 
> It'd be nice to get a pointer to the final level of indireciton you need
> generally, instead of these very->long->lists->of.indirections.

yeah, following the same in other parts of the code.
Here in this API, it is used only once that's why used directly.

> 
> Please consider getting a final pointer as much as possible especially in
> functions where you end up writing those long chains over and over again.
> 
>> +                return iris_yuv_buffer_size_qc08c(inst);
>> +            else
>> +                return iris_yuv_buffer_size_nv12(inst);
>>           case BUF_DPB:
>>               return iris_yuv_buffer_size_qc08c(inst);
>>           default:
>> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
>> b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
>> index
>> e1788c266bb1080921f17248fd5ee60156b3143d..e458d3349ce09aadb75d056ae84e3aab95f03078 100644
>> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
>> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
>> @@ -774,20 +774,21 @@ static int iris_hfi_gen1_set_raw_format(struct
>> iris_inst *inst, u32 plane)
>>           pixelformat = inst->fmt_dst->fmt.pix_mp.pixelformat;
>>           if (iris_split_mode_enabled(inst)) {
>>               fmt.buffer_type = HFI_BUFFER_OUTPUT;
>> -            fmt.format = pixelformat == V4L2_PIX_FMT_NV12 ?
>> -                HFI_COLOR_FORMAT_NV12_UBWC : 0;
>> +            fmt.format = HFI_COLOR_FORMAT_NV12_UBWC;
>>
>>               ret = hfi_gen1_set_property(inst, ptype, &fmt, sizeof(fmt));
>>               if (ret)
>>                   return ret;
>>
>>               fmt.buffer_type = HFI_BUFFER_OUTPUT2;
>> -            fmt.format = pixelformat == V4L2_PIX_FMT_NV12 ?
>> HFI_COLOR_FORMAT_NV12 : 0;
>> +            fmt.format = pixelformat == V4L2_PIX_FMT_NV12 ?
>> +                HFI_COLOR_FORMAT_NV12 : HFI_COLOR_FORMAT_NV12_UBWC;
>>
>>               ret = hfi_gen1_set_property(inst, ptype, &fmt, sizeof(fmt));
>>           } else {
>>               fmt.buffer_type = HFI_BUFFER_OUTPUT;
>> -            fmt.format = pixelformat == V4L2_PIX_FMT_NV12 ?
>> HFI_COLOR_FORMAT_NV12 : 0;
>> +            fmt.format = pixelformat == V4L2_PIX_FMT_NV12 ?
>> +                HFI_COLOR_FORMAT_NV12 : HFI_COLOR_FORMAT_NV12_UBWC;
>>
>>               ret = hfi_gen1_set_property(inst, ptype, &fmt, sizeof(fmt));
>>           }
>> @@ -806,6 +807,9 @@ static int
>> iris_hfi_gen1_set_format_constraints(struct iris_inst *inst, u32 plan
>>       const u32 ptype =
>> HFI_PROPERTY_PARAM_UNCOMPRESSED_PLANE_ACTUAL_CONSTRAINTS_INFO;
>>       struct hfi_uncompressed_plane_actual_constraints_info pconstraint;
>>
>> +    if (inst->fmt_dst->fmt.pix_mp.pixelformat == V4L2_PIX_FMT_QC08C)
>> +        return 0;
>> +
>>       pconstraint.buffer_type = HFI_BUFFER_OUTPUT2;
>>       pconstraint.num_planes = 2;
>>       pconstraint.plane_format[0].stride_multiples = 128;
>> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
>> b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
>> index
>> 4ce71a14250832440099e4cf3835b4aedfb749e8..5ad202d3fcdc57a2b7b43de15763a686ce0f7bd7 100644
>> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
>> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
>> @@ -422,6 +422,20 @@ static int iris_hfi_gen2_set_level(struct iris_inst
>> *inst, u32 plane)
>>                             sizeof(u32));
>>   }
>>
>> +static int iris_hfi_gen2_set_opb_enable(struct iris_inst *inst, u32 plane)
>> +{
>> +    u32 port = iris_hfi_gen2_get_port(inst, plane);
>> +    u32 opb_enable = iris_split_mode_enabled(inst);
>> +
>> +    return iris_hfi_gen2_session_set_property(inst,
>> +                          HFI_PROP_OPB_ENABLE,
>> +                          HFI_HOST_FLAGS_NONE,
>> +                          port,
>> +                          HFI_PAYLOAD_U32,
>> +                          &opb_enable,
>> +                          sizeof(u32));
>> +}
>> +
>>   static int iris_hfi_gen2_set_colorformat(struct iris_inst *inst, u32
>> plane)
>>   {
>>       u32 port = iris_hfi_gen2_get_port(inst, plane);
>> @@ -429,7 +443,8 @@ static int iris_hfi_gen2_set_colorformat(struct
>> iris_inst *inst, u32 plane)
>>
>>       if (inst->domain == DECODER) {
>>           pixelformat = inst->fmt_dst->fmt.pix_mp.pixelformat;
>> -        hfi_colorformat = pixelformat == V4L2_PIX_FMT_NV12 ?
>> HFI_COLOR_FMT_NV12 : 0;
>> +        hfi_colorformat = pixelformat == V4L2_PIX_FMT_NV12 ?
>> +            HFI_COLOR_FMT_NV12 : HFI_COLOR_FMT_NV12_UBWC;
>>       } else {
>>           pixelformat = inst->fmt_src->fmt.pix_mp.pixelformat;
>>           hfi_colorformat = pixelformat == V4L2_PIX_FMT_NV12 ?
>> HFI_COLOR_FMT_NV12 : 0;
>> @@ -527,6 +542,7 @@ static int
>> iris_hfi_gen2_session_set_config_params(struct iris_inst *inst, u32 p
>>           {HFI_PROP_SIGNAL_COLOR_INFO,         
>> iris_hfi_gen2_set_colorspace             },
>>           {HFI_PROP_PROFILE,                   
>> iris_hfi_gen2_set_profile                },
>>           {HFI_PROP_LEVEL,                     
>> iris_hfi_gen2_set_level                  },
>> +        {HFI_PROP_OPB_ENABLE,                
>> iris_hfi_gen2_set_opb_enable             },
> 
> 
> As I read this code I end up asking myself "what does OPB" mean ?
> 
> For preference the introduction of OPB would be its own patch with its own
> commit log that explains OPB as an individual thing.
> 
> You can enable your QC08C format as an additional step.
> 
> 
>>           {HFI_PROP_COLOR_FORMAT,              
>> iris_hfi_gen2_set_colorformat            },
>>           {HFI_PROP_LINEAR_STRIDE_SCANLINE,    
>> iris_hfi_gen2_set_linear_stride_scanline },
>>           {HFI_PROP_TIER,                      
>> iris_hfi_gen2_set_tier                   },
>> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
>> b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
>> index
>> aa1f795f5626c1f76a32dd650302633877ce67be..1b6a4dbac828ffea53c1be0d3624a033c283c972 100644
>> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
>> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
>> @@ -91,6 +91,7 @@ enum hfi_seq_header_mode {
>>   #define HFI_PROP_BUFFER_MARK            0x0300016c
>>   #define HFI_PROP_RAW_RESOLUTION        0x03000178
>>   #define HFI_PROP_TOTAL_PEAK_BITRATE        0x0300017C
>> +#define HFI_PROP_OPB_ENABLE            0x03000184
>>   #define HFI_PROP_COMV_BUFFER_COUNT        0x03000193
>>   #define HFI_PROP_END                0x03FFFFFF
>>
>> diff --git a/drivers/media/platform/qcom/iris/iris_instance.h
>> b/drivers/media/platform/qcom/iris/iris_instance.h
>> index
>> 5982d7adefeab80905478b32cddba7bd4651a691..11134f75c26dd1f6c92ba72fbf4e56e41a72de64 100644
>> --- a/drivers/media/platform/qcom/iris/iris_instance.h
>> +++ b/drivers/media/platform/qcom/iris/iris_instance.h
>> @@ -15,12 +15,17 @@
>>   #define DEFAULT_WIDTH 320
>>   #define DEFAULT_HEIGHT 240
>>
>> -enum iris_fmt_type {
>> +enum iris_fmt_type_out {
>>       IRIS_FMT_H264,
>>       IRIS_FMT_HEVC,
>>       IRIS_FMT_VP9,
>>   };
>>
>> +enum iris_fmt_type_cap {
>> +    IRIS_FMT_NV12,
>> +    IRIS_FMT_UBWC,
>> +};
>> +
>>   struct iris_fmt {
>>       u32 pixfmt;
>>       u32 type;
>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
>> b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
>> index
>> 36d69cc73986b74534a2912524c8553970fd862e..69c952c68e939f305f25511e2e4763487ec8e0de 100644
>> --- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
>> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
>> @@ -691,6 +691,7 @@ static const u32 sm8550_venc_input_config_params[] = {
>>   };
>>
>>   static const u32 sm8550_vdec_output_config_params[] = {
>> +    HFI_PROP_OPB_ENABLE,
>>       HFI_PROP_COLOR_FORMAT,
>>       HFI_PROP_LINEAR_STRIDE_SCANLINE,
>>   };
>> diff --git a/drivers/media/platform/qcom/iris/iris_utils.c
>> b/drivers/media/platform/qcom/iris/iris_utils.c
>> index
>> 85c70a62b1fd2c409fc18b28f64771cb0097a7fd..e2f1131de43128254d8211343771e657e425541e 100644
>> --- a/drivers/media/platform/qcom/iris/iris_utils.c
>> +++ b/drivers/media/platform/qcom/iris/iris_utils.c
>> @@ -34,7 +34,8 @@ int iris_get_mbpf(struct iris_inst *inst)
>>
>>   bool iris_split_mode_enabled(struct iris_inst *inst)
>>   {
>> -    return inst->fmt_dst->fmt.pix_mp.pixelformat == V4L2_PIX_FMT_NV12;
>> +    return inst->fmt_dst->fmt.pix_mp.pixelformat == V4L2_PIX_FMT_NV12 ||
>> +        inst->fmt_dst->fmt.pix_mp.pixelformat == V4L2_PIX_FMT_QC08C;
>>   }
>>
>>   void iris_helper_buffers_done(struct iris_inst *inst, unsigned int type,
>> diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c
>> b/drivers/media/platform/qcom/iris/iris_vdec.c
>> index
>> ae13c3e1b426bfd81a7b46dc6c3ff5eb5c4860cb..7fa745c6bf8950d192c2d2fc1770c4b6fd7b8c4c 100644
>> --- a/drivers/media/platform/qcom/iris/iris_vdec.c
>> +++ b/drivers/media/platform/qcom/iris/iris_vdec.c
>> @@ -67,7 +67,7 @@ void iris_vdec_inst_deinit(struct iris_inst *inst)
>>       kfree(inst->fmt_src);
>>   }
>>
>> -static const struct iris_fmt iris_vdec_formats[] = {
>> +static const struct iris_fmt iris_vdec_formats_out[] = {
>>       [IRIS_FMT_H264] = {
>>           .pixfmt = V4L2_PIX_FMT_H264,
>>           .type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
>> @@ -82,12 +82,35 @@ static const struct iris_fmt iris_vdec_formats[] = {
>>       },
>>   };
>>
>> +static const struct iris_fmt iris_vdec_formats_cap[] = {
>> +    [IRIS_FMT_NV12] = {
>> +        .pixfmt = V4L2_PIX_FMT_NV12,
>> +        .type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
>> +    },
>> +    [IRIS_FMT_UBWC] = {
>> +        .pixfmt = V4L2_PIX_FMT_QC08C,
>> +        .type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
>> +    },
>> +};
>> +
>>   static const struct iris_fmt *
>>   find_format(struct iris_inst *inst, u32 pixfmt, u32 type)
>>   {
>> -    unsigned int size = ARRAY_SIZE(iris_vdec_formats);
>> -    const struct iris_fmt *fmt = iris_vdec_formats;
>> +    const struct iris_fmt *fmt = NULL;
>> +    unsigned int size = 0;
>>       unsigned int i;
>> +    switch (type) {
>> +    case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
>> +        fmt = iris_vdec_formats_out;
>> +        size = ARRAY_SIZE(iris_vdec_formats_out);
>> +        break;
>> +    case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
>> +        fmt = iris_vdec_formats_cap;
>> +        size = ARRAY_SIZE(iris_vdec_formats_cap);
>> +        break;
>> +    default:
>> +        return NULL;
>> +    }
>>
>>       for (i = 0; i < size; i++) {
>>           if (fmt[i].pixfmt == pixfmt)
>> @@ -103,8 +126,21 @@ find_format(struct iris_inst *inst, u32 pixfmt, u32
>> type)
>>   static const struct iris_fmt *
>>   find_format_by_index(struct iris_inst *inst, u32 index, u32 type)
>>   {
>> -    const struct iris_fmt *fmt = iris_vdec_formats;
>> -    unsigned int size = ARRAY_SIZE(iris_vdec_formats);
>> +    const struct iris_fmt *fmt = NULL;
>> +    unsigned int size = 0;
>> +
>> +    switch (type) {
>> +    case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
>> +        fmt = iris_vdec_formats_out;
>> +        size = ARRAY_SIZE(iris_vdec_formats_out);
>> +        break;
>> +    case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
>> +        fmt = iris_vdec_formats_cap;
>> +        size = ARRAY_SIZE(iris_vdec_formats_cap);
>> +        break;
>> +    default:
>> +        return NULL;
>> +    }
>>
>>       if (index >= size || fmt[index].type != type)
>>           return NULL;
>> @@ -126,9 +162,10 @@ int iris_vdec_enum_fmt(struct iris_inst *inst,
>> struct v4l2_fmtdesc *f)
>>           f->flags = V4L2_FMT_FLAG_COMPRESSED |
>> V4L2_FMT_FLAG_DYN_RESOLUTION;
>>           break;
>>       case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
>> -        if (f->index)
>> +        fmt = find_format_by_index(inst, f->index, f->type);
>> +        if (!fmt)
>>               return -EINVAL;
>> -        f->pixelformat = V4L2_PIX_FMT_NV12;
>> +        f->pixelformat = fmt->pixfmt;
>>           break;
>>       default:
>>           return -EINVAL;
>> @@ -157,7 +194,7 @@ int iris_vdec_try_fmt(struct iris_inst *inst, struct
>> v4l2_format *f)
>>           }
>>           break;
>>       case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
>> -        if (f->fmt.pix_mp.pixelformat != V4L2_PIX_FMT_NV12) {
>> +        if (!fmt) {
>>               f_inst = inst->fmt_dst;
>>               f->fmt.pix_mp.pixelformat = f_inst->fmt.pix_mp.pixelformat;
>>               f->fmt.pix_mp.width = f_inst->fmt.pix_mp.width;
>> @@ -238,10 +275,11 @@ int iris_vdec_s_fmt(struct iris_inst *inst, struct
>> v4l2_format *f)
>>           inst->crop.height = f->fmt.pix_mp.height;
>>           break;
>>       case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
>> +        if (!(find_format(inst, f->fmt.pix_mp.pixelformat, f->type)))
>> +            return -EINVAL;
>> +
>>           fmt = inst->fmt_dst;
>>           fmt->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
>> -        if (fmt->fmt.pix_mp.pixelformat != V4L2_PIX_FMT_NV12)
>> -            return -EINVAL;
>>           fmt->fmt.pix_mp.pixelformat = f->fmt.pix_mp.pixelformat;
>>           fmt->fmt.pix_mp.width = ALIGN(f->fmt.pix_mp.width, 128);
>>           fmt->fmt.pix_mp.height = ALIGN(f->fmt.pix_mp.height, 32);
>> @@ -268,7 +306,8 @@ int iris_vdec_validate_format(struct iris_inst *inst,
>> u32 pixelformat)
>>   {
>>       const struct iris_fmt *fmt = NULL;
>>
>> -    if (pixelformat != V4L2_PIX_FMT_NV12) {
>> +    fmt = find_format(inst, pixelformat,
>> V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
>> +    if (!fmt) {
>>           fmt = find_format(inst, pixelformat,
>> V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
>>           if (!fmt)
>>               return -EINVAL;
>>
>> -- 
>> 2.34.1
>>
> 

