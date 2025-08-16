Return-Path: <linux-media+bounces-40018-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 53ADBB28D61
	for <lists+linux-media@lfdr.de>; Sat, 16 Aug 2025 13:23:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9F08F3BB870
	for <lists+linux-media@lfdr.de>; Sat, 16 Aug 2025 11:23:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AA2A2D0C6E;
	Sat, 16 Aug 2025 11:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="i1zfw+47"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF3E02C158C
	for <linux-media@vger.kernel.org>; Sat, 16 Aug 2025 11:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755343389; cv=none; b=cMZVX0taRUuiQ3+M0kEPXjcCVOxw2uowzzSiuFcIyI9ChaFFlmII24FQ++IuvekYJ9q4RbCDpmtZRbaTCpmUgZWbOW4nQbYeCetuu8vvmAB1L4WyeFcVaZirpZdrdj37UC//QTlNkkq8lbA4Yp8kDN51KkIX6t+X8XfYwuG8B7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755343389; c=relaxed/simple;
	bh=sCnfCPJ+AJ3XNcCKfHICEZEKS+IcQVYlxQK61GXGS7A=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=XVdjS0npS+ir1pf2wC87YTxMV/STRPTg4gVJ1lE80l4qws9qUVVGttdbg+IioBjGczmUtjvm5osulsr65hUCXqaRlnxyrJyxvOdBMOPw+DxJRxR5xnOeRqSJWo7jJMu+Kgyq8lbpp89cX8EvAfhcfGwzzmyhlr2eBjmskrHXOok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=i1zfw+47; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-45a1b00f187so11181865e9.0
        for <linux-media@vger.kernel.org>; Sat, 16 Aug 2025 04:23:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755343384; x=1755948184; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fN/kPn7v9HYb8ukw3PHNXWL+nDHDPYwxSE44b9byleo=;
        b=i1zfw+47xFuDscSCFonR/4b0GvOK6GpoVfbgSu0b8znTKYFD66SIlzxw+7Wj8WLpcp
         jb8+iXc3SITXsBDDcxBJvV67nimDJQSytVmynEuSkhwI9PkGPsce3p+ps6hBVrYv+cOv
         lBhHUKYKtPogAzUM6slNWU/l9lCaPbJZfNS8YPWA/1rUKPx0DJi0ukjEuswEvgOQa5rb
         E292BXtteDuL9bxllLfjzbv7UrLexDVew5YBYEFnxBqjRhSUCQVgW2PEPAlfE99DxlSp
         14mNbjrvzJIEDghst4H9JRFu0jspyM7/M4Q49/IBQx7ISARGRhp3ipz5IQdVG9SB1vQZ
         tbiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755343384; x=1755948184;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fN/kPn7v9HYb8ukw3PHNXWL+nDHDPYwxSE44b9byleo=;
        b=MnneXKFBMClDV7ekRvRL3TERpwm5dhPD9OKbd9fWJ8nQ0/rFSZfQ0enYGxoqbpRYsB
         oApEVqRwvUn9AwD6kFtpK/B1zGoaybY2k7slybIVPffUmp2nN7Zl/A/ampRzjagE+BN5
         Iy70WNcgPvGnzr6Eecbs9ME1D9q4JHjOMyO+jNo25d0NNR2Q3gWk5u09dS4myoLjUzPq
         d2n7pONO7JA63GENUqrbLRx00xVUphp+65AWaEcS4ZwD8DApouJZXqKcApc4OFUgoyd+
         UlO22hgwXjdRoc3AcCpjeWIlB9h2vNiL44CskLltGcaH2YVMfpgj9uFAP13Vz7zTYBzA
         akyg==
X-Gm-Message-State: AOJu0YzmY2mEa3Dn+eBQlcxrTpVpX8gtzXzmTVSZDdLlM/nF11OMQSMP
	MoeRQcwMAdMUd/R2iO47QQ4H32kdsoI66UGp57DPGZCVlgyUphrBkqdihzPjTYEJgvY=
X-Gm-Gg: ASbGncsEV7NFAu835YVD+pNAMpPxWZunfrYaGOMws3DnZu0K8JQRUrEZwhhqAWSNOfd
	sv1Nfac98dG0thNNnJyasSDvLndYqGXNzzeLb4WYsSMQqYAKovaDVieiyZazfl3g1qBnNjXJyqA
	1uNZzA9sCFbSvIJ+uIu/X2yrCvrDHe71yL9+qaV/WBZ5I3T1Oy279aKPRpm2G5RePR0v4e+9PPv
	Nz8Egr/kAJJRb44ffdompNFX6OvSrLQ5BeKbuzhU0G3GbzP7vMkJR0vEHG6LGEZbD0z10VTQ2Ho
	4ioWHhYqyemgmSp/SI69VB7ybW7turnuBJgfUSTW4ZRL702gmiVKeSAtvuYNNzxyKpTp+UWIjSF
	6i3nt8Mmbkmq/1DChNWs2NodPLH9akxeOSP1kojRhXUiIm3a6HLNRwLESgrB4yJt1
X-Google-Smtp-Source: AGHT+IG2i6xApbpWUDsbZRsqZKTJ8R3yr08Yx7Hw6D4k48Hg+1Wnnb5RCp5iRac7S+W0o8nQkizPKQ==
X-Received: by 2002:a05:600c:4688:b0:456:161c:3d6f with SMTP id 5b1f17b1804b1-45a281dee65mr9165315e9.11.1755343384094;
        Sat, 16 Aug 2025 04:23:04 -0700 (PDT)
Received: from [192.168.0.13] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a22321985sm51659145e9.17.2025.08.16.04.23.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 16 Aug 2025 04:23:03 -0700 (PDT)
Message-ID: <5fc1466c-b9df-4486-81bb-1e4b9a8bb05f@linaro.org>
Date: Sat, 16 Aug 2025 12:23:01 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/24] media: iris: Initialize and deinitialize encoder
 instance structure
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil
 <hverkuil@xs4all.nl>, Stefan Schmidt <stefan.schmidt@linaro.org>,
 Vedang Nagar <quic_vnagar@quicinc.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Renjiang Han <quic_renjiang@quicinc.com>,
 Wangao Wang <quic_wangaow@quicinc.com>
References: <20250813-iris-video-encoder-v2-0-c725ff673078@quicinc.com>
 <20250813-iris-video-encoder-v2-12-c725ff673078@quicinc.com>
 <8bd68dd5-6f9c-4960-9019-cffc8612b0af@linaro.org>
Content-Language: en-US
In-Reply-To: <8bd68dd5-6f9c-4960-9019-cffc8612b0af@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 16/08/2025 10:03, Bryan O'Donoghue wrote:
> On 13/08/2025 10:38, Dikshita Agarwal wrote:
>> Introduce initialization and deinitialization for internal encoder
>> instance structure with necessary hooks.
>>
>> Tested-by: Vikash Garodia <quic_vgarodia@quicinc.com> # X1E80100
>> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
>> ---
>>   drivers/media/platform/qcom/iris/Makefile          |  1 +
>>   drivers/media/platform/qcom/iris/iris_buffer.c     | 59 ++++++++++++ 
>> ++++----
>>   .../platform/qcom/iris/iris_hfi_gen1_command.c     |  7 ++-
>>   .../platform/qcom/iris/iris_hfi_gen1_defines.h     |  1 +
>>   drivers/media/platform/qcom/iris/iris_instance.h   |  7 +++
>>   drivers/media/platform/qcom/iris/iris_vdec.c       |  2 -
>>   drivers/media/platform/qcom/iris/iris_venc.c       | 65 ++++++++++++ 
>> ++++++++++
>>   drivers/media/platform/qcom/iris/iris_venc.h       | 14 +++++
>>   drivers/media/platform/qcom/iris/iris_vidc.c       | 27 ++++++++-
>>   drivers/media/platform/qcom/iris/iris_vpu_buffer.c |  5 +-
>>   10 files changed, 170 insertions(+), 18 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/ 
>> media/platform/qcom/iris/Makefile
>> index 
>> e86d00ee6f15dda8bae2f25f726feb0d427b7684..ec32145e081b1fc3538dfa7d5113162a76a6068c 100644
>> --- a/drivers/media/platform/qcom/iris/Makefile
>> +++ b/drivers/media/platform/qcom/iris/Makefile
>> @@ -19,6 +19,7 @@ qcom-iris-objs += \
>>                iris_vidc.o \
>>                iris_vb2.o \
>>                iris_vdec.o \
>> +             iris_venc.o \
>>                iris_vpu2.o \
>>                iris_vpu3x.o \
>>                iris_vpu_buffer.o \
>> diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/ 
>> media/platform/qcom/iris/iris_buffer.c
>> index 
>> 38548ee4749ea7dd1addf2c9d0677cf5217e3546..6bf9b0b35d206d51b927c824d5a5b327596251c6 100644
>> --- a/drivers/media/platform/qcom/iris/iris_buffer.c
>> +++ b/drivers/media/platform/qcom/iris/iris_buffer.c
>> @@ -63,7 +63,12 @@
>>   static u32 iris_yuv_buffer_size_nv12(struct iris_inst *inst)
>>   {
>>       u32 y_plane, uv_plane, y_stride, uv_stride, y_scanlines, 
>> uv_scanlines;
>> -    struct v4l2_format *f = inst->fmt_dst;
>> +    struct v4l2_format *f;
>> +
>> +    if (inst->domain == DECODER)
>> +        f = inst->fmt_dst;
>> +    else
>> +        f = inst->fmt_src;
>>       y_stride = ALIGN(f->fmt.pix_mp.width, Y_STRIDE_ALIGN);
>>       uv_stride = ALIGN(f->fmt.pix_mp.width, UV_STRIDE_ALIGN);
>> @@ -194,7 +199,7 @@ static u32 iris_yuv_buffer_size_qc08c(struct 
>> iris_inst *inst)
>>       return ALIGN(y_meta_plane + y_plane + uv_meta_plane + uv_plane, 
>> PIXELS_4K);
>>   }
>> -static u32 iris_bitstream_buffer_size(struct iris_inst *inst)
>> +static u32 iris_dec_bitstream_buffer_size(struct iris_inst *inst)
>>   {
>>       struct platform_inst_caps *caps = inst->core- 
>> >iris_platform_data->inst_caps;
>>       u32 base_res_mbs = NUM_MBS_4K;
>> @@ -219,18 +224,50 @@ static u32 iris_bitstream_buffer_size(struct 
>> iris_inst *inst)
>>       return ALIGN(frame_size, PIXELS_4K);
>>   }
>> +static u32 iris_enc_bitstream_buffer_size(struct iris_inst *inst)
>> +{
>> +    u32 aligned_width, aligned_height, bitstream_size, yuv_size;
>> +    struct v4l2_format *f;
>> +
>> +    f = inst->fmt_dst;
>> +
>> +    aligned_width = ALIGN(f->fmt.pix_mp.width, 32);
>> +    aligned_height = ALIGN(f->fmt.pix_mp.height, 32);
>> +    bitstream_size = aligned_width * aligned_height * 3;
>> +    yuv_size = (aligned_width * aligned_height * 3) >> 1;
>> +    if (aligned_width * aligned_height > (4096 * 2176))
>> +        /* bitstream_size = 0.25 * yuv_size; */
>> +        bitstream_size = (bitstream_size >> 3);
>> +    else if (aligned_width * aligned_height > (1280 * 720))
>> +        /* bitstream_size = 0.5 * yuv_size; */
>> +        bitstream_size = (bitstream_size >> 2);
>> +
>> +    return ALIGN(bitstream_size, 4096);
>> +}
>> +
>>   int iris_get_buffer_size(struct iris_inst *inst,
>>                enum iris_buffer_type buffer_type)
>>   {
>> -    switch (buffer_type) {
>> -    case BUF_INPUT:
>> -        return iris_bitstream_buffer_size(inst);
>> -    case BUF_OUTPUT:
>> -        return iris_yuv_buffer_size_nv12(inst);
>> -    case BUF_DPB:
>> -        return iris_yuv_buffer_size_qc08c(inst);
>> -    default:
>> -        return 0;
>> +    if (inst->domain == DECODER) {
>> +        switch (buffer_type) {
>> +        case BUF_INPUT:
>> +            return iris_dec_bitstream_buffer_size(inst);
>> +        case BUF_OUTPUT:
>> +            return iris_yuv_buffer_size_nv12(inst);
>> +        case BUF_DPB:
>> +            return iris_yuv_buffer_size_qc08c(inst);
>> +        default:
>> +            return 0;
>> +        }
>> +    } else {
>> +        switch (buffer_type) {
>> +        case BUF_INPUT:
>> +            return iris_yuv_buffer_size_nv12(inst);
>> +        case BUF_OUTPUT:
>> +            return iris_enc_bitstream_buffer_size(inst);
>> +        default:
>> +            return 0;
>> +        }
>>       }
>>   }
>> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c 
>> b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
>> index 
>> 5097680ee14ebba3a126213c0584161627ca47d7..eae3dc5c596d1eb6090126ac391b8e0e2c9f09eb 100644
>> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
>> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
>> @@ -109,7 +109,12 @@ static int iris_hfi_gen1_session_open(struct 
>> iris_inst *inst)
>>       packet.shdr.hdr.size = sizeof(struct hfi_session_open_pkt);
>>       packet.shdr.hdr.pkt_type = HFI_CMD_SYS_SESSION_INIT;
>>       packet.shdr.session_id = inst->session_id;
>> -    packet.session_domain = HFI_SESSION_TYPE_DEC;
>> +
>> +    if (inst->domain == DECODER)
>> +        packet.session_domain = HFI_SESSION_TYPE_DEC;
>> +    else
>> +        packet.session_domain = HFI_SESSION_TYPE_ENC;
>> +
>>       packet.session_codec = codec;
>>       reinit_completion(&inst->completion);
>> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h 
>> b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
>> index 
>> d4d119ca98b0cb313db351f3794bf278216bd539..5b7c641b727a16c3aa7196a6d49786133653279f 100644
>> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
>> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
>> @@ -10,6 +10,7 @@
>>   #define HFI_VIDEO_ARCH_OX                0x1
>> +#define HFI_SESSION_TYPE_ENC                1
>>   #define HFI_SESSION_TYPE_DEC                2
>>   #define HFI_VIDEO_CODEC_H264                0x00000002
>> diff --git a/drivers/media/platform/qcom/iris/iris_instance.h b/ 
>> drivers/media/platform/qcom/iris/iris_instance.h
>> index 
>> 0e1f5799b72d993b25820608969e0011eabdb6bc..ff90f010f1d36690cbadeff0787b1fb7458d7f75 100644
>> --- a/drivers/media/platform/qcom/iris/iris_instance.h
>> +++ b/drivers/media/platform/qcom/iris/iris_instance.h
>> @@ -12,6 +12,9 @@
>>   #include "iris_core.h"
>>   #include "iris_utils.h"
>> +#define DEFAULT_WIDTH 320
>> +#define DEFAULT_HEIGHT 240
>> +
>>   /**
>>    * struct iris_inst - holds per video instance parameters
>>    *
>> @@ -24,7 +27,9 @@
>>    * @fmt_src: structure of v4l2_format for source
>>    * @fmt_dst: structure of v4l2_format for destination
>>    * @ctrl_handler: reference of v4l2 ctrl handler
>> + * @domain: domain type: encoder or decoder
>>    * @crop: structure of crop info
>> + * @compose: structure of compose info
>>    * @completion: structure of signal completions
>>    * @flush_completion: structure of signal completions for flush cmd
>>    * @flush_responses_pending: counter to track number of pending 
>> flush responses
>> @@ -57,7 +62,9 @@ struct iris_inst {
>>       struct v4l2_format        *fmt_src;
>>       struct v4l2_format        *fmt_dst;
>>       struct v4l2_ctrl_handler    ctrl_handler;
>> +    enum domain_type        domain;
>>       struct iris_hfi_rect_desc    crop;
>> +    struct iris_hfi_rect_desc    compose;
>>       struct completion        completion;
>>       struct completion        flush_completion;
>>       u32                flush_responses_pending;
>> diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/ 
>> media/platform/qcom/iris/iris_vdec.c
>> index 
>> d670b51c5839d1fad54d34f373cf71d5f3973a96..3482ff3f18d2bcd592b7eb7d803bf98e29276ebb 100644
>> --- a/drivers/media/platform/qcom/iris/iris_vdec.c
>> +++ b/drivers/media/platform/qcom/iris/iris_vdec.c
>> @@ -13,8 +13,6 @@
>>   #include "iris_vdec.h"
>>   #include "iris_vpu_buffer.h"
>> -#define DEFAULT_WIDTH 320
>> -#define DEFAULT_HEIGHT 240
>>   #define DEFAULT_CODEC_ALIGNMENT 16
>>   int iris_vdec_inst_init(struct iris_inst *inst)
>> diff --git a/drivers/media/platform/qcom/iris/iris_venc.c b/drivers/ 
>> media/platform/qcom/iris/iris_venc.c
>> new file mode 100644
>> index 
>> 0000000000000000000000000000000000000000..e418d347ac111c1bc48304adafa259d697e49fed
>> --- /dev/null
>> +++ b/drivers/media/platform/qcom/iris/iris_venc.c
>> @@ -0,0 +1,65 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) 2022-2025 Qualcomm Innovation Center, Inc. All 
>> rights reserved.
>> + */
>> +
>> +#include "iris_buffer.h"
>> +#include "iris_instance.h"
>> +#include "iris_venc.h"
>> +#include "iris_vpu_buffer.h"
>> +
>> +int iris_venc_inst_init(struct iris_inst *inst)
>> +{
>> +    struct v4l2_format *f;
>> +
>> +    inst->fmt_src = kzalloc(sizeof(*inst->fmt_src), GFP_KERNEL);
>> +    inst->fmt_dst  = kzalloc(sizeof(*inst->fmt_dst), GFP_KERNEL);
>> +    if (!inst->fmt_src || !inst->fmt_dst)
>> +        return -ENOMEM;
>> +
>> +    f = inst->fmt_dst;
>> +    f->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
>> +    f->fmt.pix_mp.width = DEFAULT_WIDTH;
>> +    f->fmt.pix_mp.height = DEFAULT_HEIGHT;
>> +    f->fmt.pix_mp.pixelformat = V4L2_PIX_FMT_H264;
>> +    inst->codec = f->fmt.pix_mp.pixelformat;
>> +    f->fmt.pix_mp.num_planes = 1;
>> +    f->fmt.pix_mp.plane_fmt[0].bytesperline = 0;
>> +    f->fmt.pix_mp.plane_fmt[0].sizeimage = iris_get_buffer_size(inst, 
>> BUF_OUTPUT);
>> +    f->fmt.pix_mp.field = V4L2_FIELD_NONE;
>> +    f->fmt.pix_mp.colorspace = V4L2_COLORSPACE_DEFAULT;
>> +    f->fmt.pix_mp.xfer_func = V4L2_XFER_FUNC_DEFAULT;
>> +    f->fmt.pix_mp.ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
>> +    f->fmt.pix_mp.quantization = V4L2_QUANTIZATION_DEFAULT;
>> +    inst->buffers[BUF_OUTPUT].min_count = iris_vpu_buf_count(inst, 
>> BUF_OUTPUT);
>> +    inst->buffers[BUF_OUTPUT].size = f- 
>> >fmt.pix_mp.plane_fmt[0].sizeimage;
>> +
>> +    f = inst->fmt_src;
>> +    f->type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
>> +    f->fmt.pix_mp.pixelformat = V4L2_PIX_FMT_NV12;
>> +    f->fmt.pix_mp.width = ALIGN(DEFAULT_WIDTH, 128);
>> +    f->fmt.pix_mp.height = ALIGN(DEFAULT_HEIGHT, 32);
>> +    f->fmt.pix_mp.num_planes = 1;
>> +    f->fmt.pix_mp.plane_fmt[0].bytesperline = ALIGN(DEFAULT_WIDTH, 128);
>> +    f->fmt.pix_mp.plane_fmt[0].sizeimage = iris_get_buffer_size(inst, 
>> BUF_INPUT);
>> +    f->fmt.pix_mp.field = V4L2_FIELD_NONE;
>> +    f->fmt.pix_mp.colorspace = V4L2_COLORSPACE_DEFAULT;
>> +    f->fmt.pix_mp.xfer_func = V4L2_XFER_FUNC_DEFAULT;
>> +    f->fmt.pix_mp.ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
>> +    f->fmt.pix_mp.quantization = V4L2_QUANTIZATION_DEFAULT;
>> +    inst->buffers[BUF_INPUT].min_count = iris_vpu_buf_count(inst, 
>> BUF_INPUT);
>> +    inst->buffers[BUF_INPUT].size = f- 
>> >fmt.pix_mp.plane_fmt[0].sizeimage;
>> +
>> +    inst->crop.left = 0;
>> +    inst->crop.top = 0;
>> +    inst->crop.width = f->fmt.pix_mp.width;
>> +    inst->crop.height = f->fmt.pix_mp.height;
>> +
>> +    return 0;
>> +}
>> +
>> +void iris_venc_inst_deinit(struct iris_inst *inst)
>> +{
>> +    kfree(inst->fmt_dst);
>> +    kfree(inst->fmt_src);
>> +}
>> diff --git a/drivers/media/platform/qcom/iris/iris_venc.h b/drivers/ 
>> media/platform/qcom/iris/iris_venc.h
>> new file mode 100644
>> index 
>> 0000000000000000000000000000000000000000..8a4cbddd0114b6d0e4ea895362b01c302250c78b
>> --- /dev/null
>> +++ b/drivers/media/platform/qcom/iris/iris_venc.h
>> @@ -0,0 +1,14 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * Copyright (c) 2022-2025 Qualcomm Innovation Center, Inc. All 
>> rights reserved.
>> + */
>> +
>> +#ifndef _IRIS_VENC_H_
>> +#define _IRIS_VENC_H_
>> +
>> +struct iris_inst;
>> +
>> +int iris_venc_inst_init(struct iris_inst *inst);
>> +void iris_venc_inst_deinit(struct iris_inst *inst);
>> +
>> +#endif
>> diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/ 
>> media/platform/qcom/iris/iris_vidc.c
>> index 
>> 96313856a026efaff40da97eaaa63e847172cd57..11f27fc867dc610c18022b0942e65aa175a8567e 100644
>> --- a/drivers/media/platform/qcom/iris/iris_vidc.c
>> +++ b/drivers/media/platform/qcom/iris/iris_vidc.c
>> @@ -12,6 +12,7 @@
>>   #include "iris_vidc.h"
>>   #include "iris_instance.h"
>>   #include "iris_vdec.h"
>> +#include "iris_venc.h"
>>   #include "iris_vb2.h"
>>   #include "iris_vpu_buffer.h"
>>   #include "iris_platform_common.h"
>> @@ -23,7 +24,10 @@
>>   static void iris_v4l2_fh_init(struct iris_inst *inst)
>>   {
>> -    v4l2_fh_init(&inst->fh, inst->core->vdev_dec);
>> +    if (inst->domain == ENCODER)
>> +        v4l2_fh_init(&inst->fh, inst->core->vdev_enc);
>> +    else if (inst->domain == DECODER)
>> +        v4l2_fh_init(&inst->fh, inst->core->vdev_dec);
>>       inst->fh.ctrl_handler = &inst->ctrl_handler;
>>       v4l2_fh_add(&inst->fh);
>>   }
>> @@ -126,9 +130,19 @@ iris_m2m_queue_init(void *priv, struct vb2_queue 
>> *src_vq, struct vb2_queue *dst_
>>   int iris_open(struct file *filp)
>>   {
>>       struct iris_core *core = video_drvdata(filp);
>> +    struct video_device *vdev;
>>       struct iris_inst *inst;
>> +    u32 session_type;
>>       int ret;
>> +    vdev = video_devdata(filp);
>> +    if (strcmp(vdev->name, "qcom-iris-decoder") == 0)
>> +        session_type = DECODER;
>> +    else if (strcmp(vdev->name, "qcom-iris-encoder") == 0)
>> +        session_type = ENCODER;
>> +    else
>> +        return -EINVAL;
>> +
>>       ret = pm_runtime_resume_and_get(core->dev);
>>       if (ret < 0)
>>           return ret;
>> @@ -147,6 +161,7 @@ int iris_open(struct file *filp)
>>           return -ENOMEM;
>>       inst->core = core;
>> +    inst->domain = session_type;
>>       inst->session_id = hash32_ptr(inst);
>>       inst->state = IRIS_INST_DEINIT;
>> @@ -178,7 +193,10 @@ int iris_open(struct file *filp)
>>           goto fail_m2m_release;
>>       }
>> -    ret = iris_vdec_inst_init(inst);
>> +    if (inst->domain == DECODER)
>> +        ret = iris_vdec_inst_init(inst);
>> +    else if (inst->domain == ENCODER)
>> +        ret = iris_venc_inst_init(inst);
>>       if (ret)
>>           goto fail_m2m_ctx_release;
>> @@ -265,7 +283,10 @@ int iris_close(struct file *filp)
>>       v4l2_m2m_ctx_release(inst->m2m_ctx);
>>       v4l2_m2m_release(inst->m2m_dev);
>>       mutex_lock(&inst->lock);
>> -    iris_vdec_inst_deinit(inst);
>> +    if (inst->domain == DECODER)
>> +        iris_vdec_inst_deinit(inst);
>> +    else if (inst->domain == ENCODER)
>> +        iris_venc_inst_deinit(inst);
>>       iris_session_close(inst);
>>       iris_inst_change_state(inst, IRIS_INST_DEINIT);
>>       iris_v4l2_fh_deinit(inst);
>> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c b/ 
>> drivers/media/platform/qcom/iris/iris_vpu_buffer.c
>> index 
>> f92fd39fe310b9661f892dcf1ff036ebbc102270..06d5afc3c641f0dfca3967e55273c4fa2614fdff 100644
>> --- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
>> +++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
>> @@ -628,7 +628,10 @@ int iris_vpu_buf_count(struct iris_inst *inst, 
>> enum iris_buffer_type buffer_type
>>       case BUF_INPUT:
>>           return MIN_BUFFERS;
>>       case BUF_OUTPUT:
>> -        return output_min_count(inst);
>> +        if (inst->domain == ENCODER)
>> +            return MIN_BUFFERS;
>> +        else
>> +            return output_min_count(inst);
>>       case BUF_BIN:
>>       case BUF_COMV:
>>       case BUF_NON_COMV:
>>
> 
> Patch failed at 0012 media: iris: Initialize and deinitialize encoder 
> instance structure
> error: patch failed: drivers/media/platform/qcom/iris/iris_vidc.c:23
> error: drivers/media/platform/qcom/iris/iris_vidc.c: patch does not apply
> hint: Use 'git am --show-current-patch=diff' to see the failed patch
> 
>   git log drivers/media/platform/qcom/iris/iris_vidc.c
> commit 095ac6efdcaaa0169c5e0b4471f7835d39cd82d7
> Author: Dikshita Agarwal <quic_dikshita@quicinc.com>
> Date:   Wed Aug 13 15:07:52 2025 +0530
> 
>      media: iris: Report unreleased PERSIST buffers on session close
> 
>      Add error reporting for unreleased PERSIST internal buffers in
>      iris_check_num_queued_internal_buffers(). This ensures all buffer 
> types
>      are checked and logged if not freed during session close, helping to
>      detect memory leaks and improve driver robustness. No change to buffer
>      lifecycle or allocation logic.
> 
>      Fixes: d2abb1ff5a3c ("media: iris: Verify internal buffer release 
> on close")
>      Reviewed-by: Vikash Garodia <quic_vgarodia@quicinc.com>
>      Tested-by: Vikash Garodia <quic_vgarodia@quicinc.com> # X1E80100
>      Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> 
> commit 7c6719080cbcc1d3376385c66d456b25f85abcdc
> Author: Dikshita Agarwal <quic_dikshita@quicinc.com>
> Date:   Wed Aug 13 15:07:51 2025 +0530
> 
>      media: iris: Fix buffer count reporting in internal buffer check
> 
>      Initialize the count variable to zero before counting unreleased
>      internal buffers in iris_check_num_queued_internal_buffers().
>      This prevents stale values from previous iterations and ensures 
> accurate
>      error reporting for each buffer type. Without this initialization, the
>      count could accumulate across types, leading to incorrect log 
> messages.
> 
>      Fixes: d2abb1ff5a3c ("media: iris: Verify internal buffer release 
> on close")
>      Reviewed-by: Vikash Garodia <quic_vgarodia@quicinc.com>
>      Tested-by: Vikash Garodia <quic_vgarodia@quicinc.com> # X1E80100
>      Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>      Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> 
> commit 277966749f46bc6292c4052b4e66a554f193a78a
> Author: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Date:   Sun Aug 10 04:30:09 2025 +0300
> 
>      media: Reset file->private_data to NULL in v4l2_fh_del()
> 
> 
> https://gitlab.freedesktop.org/linux-media/users/bodonoghue/-/commits/ 
> b4/bod-media-committers-next-platform-qcom-6.17-rc1
> 
> ---
> bod

BTW the majority of the patches remaining in this series won't apply 
after this failure.

Please rebase to resolve.

---
bod

