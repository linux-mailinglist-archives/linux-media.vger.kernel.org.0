Return-Path: <linux-media+bounces-45888-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FBFBC181A9
	for <lists+linux-media@lfdr.de>; Wed, 29 Oct 2025 03:57:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C778F1B274A7
	for <lists+linux-media@lfdr.de>; Wed, 29 Oct 2025 02:57:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F39002ECD37;
	Wed, 29 Oct 2025 02:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NqJH8JT3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g5uVpq2j"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32D0D2EA147
	for <linux-media@vger.kernel.org>; Wed, 29 Oct 2025 02:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761706621; cv=none; b=pxMXSG1hHAJsbhCIgmQfBsAwa7tuIA2dPNsRXIURHBpeA8w2rp2YoBdzyq5qv6FfeUEIhpm8qyjgrHxQ0rJzJcrnrzZvbxzfNiNV3DakAw4+ZOu1v5FkX5bJkcMFZhruEo1ZPPhRANGiy4kqmk+5ZLuRP98zuYKbn0d0WlqIdAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761706621; c=relaxed/simple;
	bh=9md1Uzr7kTavHcX3slny0w5bBbv35Mil8tgVBD2J4YE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cd7m7YK2QqlJZzsyAiATjQ/I9fOdIi3QhcvHXUMR9pcLWBCIRPBiNzfWC8cb3Es2M92MYH/S+GHc4/TiHdzzX8/cOiORP3aFVm3vZXxF1DNWi0UX5ClWHsVigIfI3KVCMc+Pa4r7nRCrD9ihBYaXk5LxHVC8E93hPdzJGrdQfVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NqJH8JT3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g5uVpq2j; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59SJlHOd2615908
	for <linux-media@vger.kernel.org>; Wed, 29 Oct 2025 02:56:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9/9oFapWEm7vhS2CAn8+I4Tp/daljkVATwiiAmLYAZI=; b=NqJH8JT3uhneaCt4
	gpQNSN6U0JhsTD5IxP9ujEwTwn0faBl0Gzmk9ZLbPI55vZCUpZjsv9tSUN0xL02l
	V/bqn4zl17ugSF4xb5BgfEh7ZAFJA6BfTJ/27QdpK48ZnbLlEr95/CQTy+oEHUX9
	wxIHGQAmcC6eNlk7bm1G3Y3Hb8O0Zwfp7UEmLlbQ6uzYdpmh8eL3vwV/L+LgY63j
	Qf1Rz0qIEmvro7ILoS0IcaS0RvvTzsxh74IZ9thH9/5EEygBQ7An+AQLOEHpI+my
	MzjlKF8gRIgM/BbymCwNHXcPWgPIBd+WH4YSoQiBtXEgQBytjzc453kYYGVPnrXJ
	+C9aQQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34a0gxef-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 29 Oct 2025 02:56:57 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b630add82d6so1422168a12.2
        for <linux-media@vger.kernel.org>; Tue, 28 Oct 2025 19:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761706617; x=1762311417; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9/9oFapWEm7vhS2CAn8+I4Tp/daljkVATwiiAmLYAZI=;
        b=g5uVpq2jd+i/9i4sEnZa7NTy0G5uTSeR9QKS11C+1E7YVBA4Kc3ji//FkhOesQPnG2
         Ud36MVkB/9yTDAkhWUQkR7ITD7ti7C8jXUknoOtKFZQD/DTCaCk0WhdSOPLcxLLbkY7X
         zC+2bYM3rnLjPHdQR0PHZwYEfenoosBjkiQ5HK0cn2E4Lbzf9pobajkHVVAaIeTAhxRw
         7L/0nEQ5VyHLQvIwQJw+NkqAs7m7NPLmuNXmYxOUROpnnBTMRivs7GPc4zTowAmaAVw5
         jmP8LBzPGO4wXZUGBaekQDmx1MJweCVp2Rkpj2+Ne48rf9n+3GfTOjzl6HYvg77wtY5/
         Z2cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761706617; x=1762311417;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9/9oFapWEm7vhS2CAn8+I4Tp/daljkVATwiiAmLYAZI=;
        b=lx2RTEAvhwpL3/IMLjpIWzrs07N8BqZ3ESP9orYLSJk3AJ8Dht+PG3Nt+QD78XbI24
         XdWJYduGKv+32IpQVzMlDAt/pWVkVRMK2/RrPuXmL5DY2WlXGH1EgBskBRsDjO4ImrGq
         XYAMCTvNMegymmWZUUB2g4cx6tDh1bs2Quv2mbZgRiSUf5xykPCiLurCJA4irPG9z5sn
         2xUokd7a8jTE+y/LQg8bcwOd4nwjxb86A1DKZUbn6vUzE019A6Eu2x7p6/86U42jjgUb
         KqbTgOW7dsWTyEdZiKoHFZoR43HeVj0vaxieI+UrjE1Z4BUDgK1Y5H+ZgNBaslh8vg57
         u92w==
X-Gm-Message-State: AOJu0Yy3NAzsYiruld/v/mVqxVcrnURN5CWkK2u8IPyfSebr2ydYh411
	NzOCKqi8ETK8MYoydV+L6MQx0F5FeoDDaOKCOc2QaYLrGLTeCF3E60Ng1btI8n8DwGwJ4k7Otd/
	XmngMSklFRWjwHJtOMarBlfc4bDIBcu3ek6UAN135e7pUpT1aPUi10Emq007YTohydg==
X-Gm-Gg: ASbGnctEOskOg2x12hPmf3SQyVYUs+Hn7efGziKaNr49L4YyZTbo3rb3Q9Ck0JR9Kui
	XDoeI8FRzlehsrRt3lJl45YPJ5mF7AMGbwxjwUsaP6y7IuupVjuF8CvvYEQo3K8koubGTYWmxHP
	eXU9sCfPc7iG3d6jb8PayiE8MdlTQ5G5a+Jh6rxFahuudNZcFnBhcLBECQXQ0MD2c4ld+5h1d5V
	ij2r08CXp2HmR3BFTplO3fgqTnrfqdt3xNL/0cze2nsTcfqYNmtQyjGfePw6dbDRRzcehL431wj
	C4LhYJTlpVrwu5CLRnxlYpK118VyT0zSBr7iEF+bu1nCdTJF5dyv7nPg5z1V+D0VHPDKJ9X5W7w
	aCOCCzaP/0MckVNtW+dfI7SM8HoweedBxyFX1CbS06jG97TpzqdW7wHmvTgJtQA==
X-Received: by 2002:a05:6a00:2daa:b0:7a2:757f:6f6b with SMTP id d2e1a72fcca58-7a4e57e4207mr843095b3a.7.1761706616964;
        Tue, 28 Oct 2025 19:56:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFbf5BxO+16nSHXaW14qJKmHt8+BvGiXFbDgsl0Eu4/6mECXc6p15tRZWj8hVR8t6WSLhNWFg==
X-Received: by 2002:a05:6a00:2daa:b0:7a2:757f:6f6b with SMTP id d2e1a72fcca58-7a4e57e4207mr843075b3a.7.1761706616383;
        Tue, 28 Oct 2025 19:56:56 -0700 (PDT)
Received: from [10.110.87.192] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a427684bddsm9990852b3a.31.2025.10.28.19.56.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Oct 2025 19:56:56 -0700 (PDT)
Message-ID: <59402591-f657-4b54-954a-4bf08d92d793@oss.qualcomm.com>
Date: Tue, 28 Oct 2025 19:56:49 -0700
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] media: iris: Add internal buffer calculation for
 AV1 decoder
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, kernel test robot <lkp@intel.com>
References: <20251017-av1_irisdecoder-v2-0-964a5478139e@oss.qualcomm.com>
 <20251017-av1_irisdecoder-v2-5-964a5478139e@oss.qualcomm.com>
 <36543c8c-5a69-56ed-7d96-a3f5d7396b89@oss.qualcomm.com>
Content-Language: en-US
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
In-Reply-To: <36543c8c-5a69-56ed-7d96-a3f5d7396b89@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=HvZ72kTS c=1 sm=1 tr=0 ts=6901827a cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=3Uohc88nFzBvfxjGL6AA:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: zVk27WEKk8EUBAMZo5lpJPVssSkONWUg
X-Proofpoint-ORIG-GUID: zVk27WEKk8EUBAMZo5lpJPVssSkONWUg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDAyMSBTYWx0ZWRfX1dIJZhLSeXJk
 9ECPykHFvSQZUGKQCJYkBLcQuo30buVID/bb3JfJUWsVUckITGmCeF9gFf9oeR6+nqXnKFMFBDx
 VsI9winYUKSBTVQlVHZ5Xy3AFmElEqszT1464xK9cw1HYDGenyaUsk8dtJGvpZdBAvTCObYE42p
 yHKWkrVpTAYF86ii1F1S9+EFS9Bjr7O2NRIqyCOcSyhwPP/63dQCcT19rQKMnCUHKq7Yikupz/M
 4321Sq/shqQLnDHAEAmqNyheEXg683OdHJU754N/cv1YxBU0QE7xy9oUQYQlG2LAYSqAWBartpu
 zTpKitHtOiDgEGX7wNhNRp/T4y/LJ/gcKQXNjcDRYSRnl+byxMar2AJ8zx173MN0jlySq3oNxfV
 Djy5yk1iwFUJhe2et/YZlULCxh0ZGA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-29_01,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510290021


On 10/27/2025 2:07 AM, Dikshita Agarwal wrote:
>
> On 10/18/2025 12:05 AM, Deepa Guthyappa Madivalara wrote:
>> Implement internal buffer count and size calculations for AV1 decoder
>> for all the buffer types required by the AV1 decoder, including BIN,
>> COMV, PERSIST, LINE, and PARTIAL.
>>
>> This ensures the hardware decoder has properly allocated memory for AV1
>> decoding operations, enabling correct AV1 video playback.
>>
>> Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
>> ---
>>   drivers/media/platform/qcom/iris/iris_buffer.h     |   1 +
>>   drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 298 ++++++++++++++++++++-
>>   drivers/media/platform/qcom/iris/iris_vpu_buffer.h | 116 ++++++++
>>   3 files changed, 411 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/iris/iris_buffer.h b/drivers/media/platform/qcom/iris/iris_buffer.h
>> index 5ef365d9236c7cbdee24a4614789b3191881968b..75bb767761824c4c02e0df9b765896cc093be333 100644
>> --- a/drivers/media/platform/qcom/iris/iris_buffer.h
>> +++ b/drivers/media/platform/qcom/iris/iris_buffer.h
>> @@ -27,6 +27,7 @@ struct iris_inst;
>>    * @BUF_SCRATCH_1: buffer to store decoding/encoding context data for HW
>>    * @BUF_SCRATCH_2: buffer to store encoding context data for HW
>>    * @BUF_VPSS: buffer to store VPSS context data for HW
>> + * @BUF_PARTIAL: buffer for AV1 IBC data
>>    * @BUF_TYPE_MAX: max buffer types
>>    */
>>   enum iris_buffer_type {
>> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
>> index 4463be05ce165adef6b152eb0c155d2e6a7b3c36..e03ae7cfc9551dd2450b27d5d19ef1d23bba4c99 100644
>> --- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
>> +++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
>> @@ -9,6 +9,17 @@
>>   #include "iris_hfi_gen2_defines.h"
>>   
> <snip>
>
>>   static u32 iris_vpu_dec_bin_size(struct iris_inst *inst)
>>   {
>>   	u32 num_vpp_pipes = inst->core->iris_platform_data->num_vpp_pipe;
>> @@ -472,6 +718,8 @@ static u32 iris_vpu_dec_bin_size(struct iris_inst *inst)
>>   		return hfi_buffer_bin_h265d(width, height, num_vpp_pipes);
>>   	else if (inst->codec == V4L2_PIX_FMT_VP9)
>>   		return hfi_buffer_bin_vp9d(width, height, num_vpp_pipes);
>> +	else if (inst->codec == V4L2_PIX_FMT_AV1)
>> +		return hfi_buffer_bin_av1d(width, height, num_vpp_pipes);
>>   
>>   	return 0;
>>   }
>> @@ -487,18 +735,33 @@ static u32 iris_vpu_dec_comv_size(struct iris_inst *inst)
>>   		return hfi_buffer_comv_h264d(width, height, num_comv);
>>   	else if (inst->codec == V4L2_PIX_FMT_HEVC)
>>   		return hfi_buffer_comv_h265d(width, height, num_comv);
>> -
>> +	else if (inst->codec == V4L2_PIX_FMT_AV1) {
>> +		if (inst->fw_caps[DRAP].value)
>> +			return 0;
>> +		else
>> +			return hfi_buffer_comv_av1d(width, height, num_comv);
>> +	}
> newline is required before return.
<ack>
>
>>   	return 0;
>>   }
>>   
> <snip>
>
>> +static u32 iris_vpu_dec_partial_size(struct iris_inst *inst)
>> +{
>> +	struct v4l2_format *f = inst->fmt_src;
>> +	u32 height = f->fmt.pix_mp.height;
>> +	u32 width = f->fmt.pix_mp.width;
>> +
>> +	return hfi_buffer_ibc_av1d(width, height);
>> +}
>> +
>>   static inline
>>   u32 hfi_buffer_comv_enc(u32 frame_width, u32 frame_height, u32 lcu_size,
>>   			u32 num_recon, u32 standard)
>> @@ -1414,7 +1688,9 @@ static int output_min_count(struct iris_inst *inst)
>>   
>>   	/* fw_min_count > 0 indicates reconfig event has already arrived */
>>   	if (inst->fw_min_count) {
>> -		if (iris_split_mode_enabled(inst) && inst->codec == V4L2_PIX_FMT_VP9)
>> +		if (iris_split_mode_enabled(inst) &&
>> +		    (inst->codec == V4L2_PIX_FMT_VP9 ||
>> +		     inst->codec == V4L2_PIX_FMT_VP9))
> This change doesn't make any sense, do you mean V4L2_PIX_FMT_AV1?
Yes, updated in v3
>
>>   			return min_t(u32, 4, inst->fw_min_count);
>>   		else
>>   			return inst->fw_min_count;
>> @@ -1422,6 +1698,8 @@ static int output_min_count(struct iris_inst *inst)
>>   
>>   	if (inst->codec == V4L2_PIX_FMT_VP9)
>>   		output_min_count = 9;
>> +	else if (inst->codec == V4L2_PIX_FMT_AV1)
>> +		output_min_count = 11;
>>   
>>   	return output_min_count;
>>   }
>> @@ -1444,6 +1722,7 @@ u32 iris_vpu_buf_size(struct iris_inst *inst, enum iris_buffer_type buffer_type)
>>   		{BUF_PERSIST,     iris_vpu_dec_persist_size         },
>>   		{BUF_DPB,         iris_vpu_dec_dpb_size             },
>>   		{BUF_SCRATCH_1,   iris_vpu_dec_scratch1_size        },
>> +		{BUF_PARTIAL,     iris_vpu_dec_partial_size         },
>>   	};
>>   

