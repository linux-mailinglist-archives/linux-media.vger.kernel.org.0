Return-Path: <linux-media+bounces-40059-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 06B13B2975B
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 05:28:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6E52E189E389
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 03:28:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E16825F973;
	Mon, 18 Aug 2025 03:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="VdGmW5EG"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EF61253356;
	Mon, 18 Aug 2025 03:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755487677; cv=none; b=UpFp8qBWcnoD1pehAlag2OTL65ra3l03DdQ1w+QKFKdy60+h1PoAJSvqu4UzUwhBkSYz81iu5KvRXOVayLttB0CeYWt+DoJJ9vbVz0QXSSkgnT+Tua6dBOC7/kUjJVlwSxnhOeU5gEKADjiUdYpQRpl9DK2o5FKZ5RTAFHkh70g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755487677; c=relaxed/simple;
	bh=KuIkXQPxxn6fdjTbuI1XmCQG95jCovgB8bgSUM6F8eY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=M/CDGUUgzDygKzJOtidK70MtmksoYQFKQ3rmEVTHKsUf8mTuR23YfR/4qUAbIOYASfkGKjRxXES46zg+yxs7NfKNh1pT4PPDDpwZ2JCOVMxh/hSI4nWwxsZmHqIBq5tXIMtdZgcoCI6yzNnOdLlgdH2rVEK9zob3U8oDt5laSZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=VdGmW5EG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57I0BSFn026215;
	Mon, 18 Aug 2025 03:27:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Oj5LBK49QiOeq0DKjgt4EhSdBkY9tqZq0eSCxTe0oVY=; b=VdGmW5EGchZZsQXH
	jCgZqcuyyLdRoTm5lK9D8mLoih3elbKymzhqvdHkA4Y6+dg8w2lWTc74Vm326oqR
	cZQ9/nip7DAR4x6tWW4jSifQR5Tq7AJhqH69+MtajZ8M0CfYftQF38WDWjDZIKzL
	ihiQN2SVM87ZkDNSsunYD6Xo7ukapWcoRLcbq52pzOCEYJv7O0nafnS4G+JTtEDK
	EKOLws9wm84bFg+OKUj3SX/P+G3JQL5iyTOqH8tndX45i2B99Q3fYXEYE9bHBTUZ
	bp1HxnM7RK477DGgAljhg9JbZIZB3gHj24b1y4tWWw0vMV7go/OebfyMHCWLdTVM
	QiyqXw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jh0734yp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Aug 2025 03:27:49 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57I3RmBm011367
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Aug 2025 03:27:48 GMT
Received: from [10.50.13.61] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Sun, 17 Aug
 2025 20:27:43 -0700
Message-ID: <c29ea4f3-68be-aba4-88b6-a78848ce032a@quicinc.com>
Date: Mon, 18 Aug 2025 08:57:40 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 12/24] media: iris: Initialize and deinitialize encoder
 instance structure
Content-Language: en-US
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vikash Garodia
	<quic_vgarodia@quicinc.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        "Mauro
 Carvalho Chehab" <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Vedang Nagar
	<quic_vnagar@quicinc.com>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Renjiang Han <quic_renjiang@quicinc.com>,
        Wangao Wang <quic_wangaow@quicinc.com>
References: <20250813-iris-video-encoder-v2-0-c725ff673078@quicinc.com>
 <20250813-iris-video-encoder-v2-12-c725ff673078@quicinc.com>
 <8bd68dd5-6f9c-4960-9019-cffc8612b0af@linaro.org>
 <5fc1466c-b9df-4486-81bb-1e4b9a8bb05f@linaro.org>
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
In-Reply-To: <5fc1466c-b9df-4486-81bb-1e4b9a8bb05f@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 1D3omO8zu97Agro6jNAYH0KO2KtFnT_Y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAyMCBTYWx0ZWRfX4U2jh/+6XZDW
 w5BMZG+lXM7eYM3jSByjDQmH0SVRuCrkJE/y+27QjGZAwrE1twWEOC3PuIQ6U2HaAmeVBddiCHO
 44cswiTZX7VBNWwwnyOPvhEObIZAWda81utGJ/iKkk7Te7ezrt+9AZmRLP8GuLS6J0ZHkHNAEAP
 pi49PlucdJCXLggHToQOHcgWw+3ypnfoPi08C5aYVhbVVXP/U5pMT6ciU+ZfYFSUv44ymzmAGnW
 0aM7uFomx40Y/BYewOcb4JAsp+Q/s2nMaD9vaanI+WXcMuODu62tjC0wnHuSMBN/fbt+vAyBg4s
 7PEW9rjEti8SC1tZktUN14B2HOj2RNPY1VZ/uUJsOFCMn4BXRcz/4IPKK3SYRIf/t3xRgk0Nk0T
 MaD/ALHa
X-Authority-Analysis: v=2.4 cv=a+Mw9VSF c=1 sm=1 tr=0 ts=68a29db5 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=e5mUnYsNAAAA:8
 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=P1BnusSwAAAA:8 a=aKGRB6apzxDQOV3pk4QA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=Vxmtnl_E_bksehYqCbjh:22
 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22 a=D0XLA9XvdZm18NrgonBM:22
X-Proofpoint-GUID: 1D3omO8zu97Agro6jNAYH0KO2KtFnT_Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-18_01,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 suspectscore=0 impostorscore=0 phishscore=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508160020



On 8/16/2025 4:53 PM, Bryan O'Donoghue wrote:
> On 16/08/2025 10:03, Bryan O'Donoghue wrote:
>> On 13/08/2025 10:38, Dikshita Agarwal wrote:
>>> Introduce initialization and deinitialization for internal encoder
>>> instance structure with necessary hooks.
>>>
>>> Tested-by: Vikash Garodia <quic_vgarodia@quicinc.com> # X1E80100
>>> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
>>> ---
>>>   drivers/media/platform/qcom/iris/Makefile          |  1 +
>>>   drivers/media/platform/qcom/iris/iris_buffer.c     | 59 ++++++++++++
>>> ++++----
>>>   .../platform/qcom/iris/iris_hfi_gen1_command.c     |  7 ++-
>>>   .../platform/qcom/iris/iris_hfi_gen1_defines.h     |  1 +
>>>   drivers/media/platform/qcom/iris/iris_instance.h   |  7 +++
>>>   drivers/media/platform/qcom/iris/iris_vdec.c       |  2 -
>>>   drivers/media/platform/qcom/iris/iris_venc.c       | 65 ++++++++++++
>>> ++++++++++
>>>   drivers/media/platform/qcom/iris/iris_venc.h       | 14 +++++
>>>   drivers/media/platform/qcom/iris/iris_vidc.c       | 27 ++++++++-
>>>   drivers/media/platform/qcom/iris/iris_vpu_buffer.c |  5 +-
>>>   10 files changed, 170 insertions(+), 18 deletions(-)
>>>
>>> diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/
>>> media/platform/qcom/iris/Makefile
>>> index
>>> e86d00ee6f15dda8bae2f25f726feb0d427b7684..ec32145e081b1fc3538dfa7d5113162a76a6068c 100644
>>> --- a/drivers/media/platform/qcom/iris/Makefile
>>> +++ b/drivers/media/platform/qcom/iris/Makefile
>>> @@ -19,6 +19,7 @@ qcom-iris-objs += \
>>>                iris_vidc.o \
>>>                iris_vb2.o \
>>>                iris_vdec.o \
>>> +             iris_venc.o \
>>>                iris_vpu2.o \
>>>                iris_vpu3x.o \
>>>                iris_vpu_buffer.o \
>>> diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/
>>> media/platform/qcom/iris/iris_buffer.c
>>> index
>>> 38548ee4749ea7dd1addf2c9d0677cf5217e3546..6bf9b0b35d206d51b927c824d5a5b327596251c6 100644
>>> --- a/drivers/media/platform/qcom/iris/iris_buffer.c
>>> +++ b/drivers/media/platform/qcom/iris/iris_buffer.c
>>> @@ -63,7 +63,12 @@
>>>   static u32 iris_yuv_buffer_size_nv12(struct iris_inst *inst)
>>>   {
>>>       u32 y_plane, uv_plane, y_stride, uv_stride, y_scanlines,
>>> uv_scanlines;
>>> -    struct v4l2_format *f = inst->fmt_dst;
>>> +    struct v4l2_format *f;
>>> +
>>> +    if (inst->domain == DECODER)
>>> +        f = inst->fmt_dst;
>>> +    else
>>> +        f = inst->fmt_src;
>>>       y_stride = ALIGN(f->fmt.pix_mp.width, Y_STRIDE_ALIGN);
>>>       uv_stride = ALIGN(f->fmt.pix_mp.width, UV_STRIDE_ALIGN);
>>> @@ -194,7 +199,7 @@ static u32 iris_yuv_buffer_size_qc08c(struct
>>> iris_inst *inst)
>>>       return ALIGN(y_meta_plane + y_plane + uv_meta_plane + uv_plane,
>>> PIXELS_4K);
>>>   }
>>> -static u32 iris_bitstream_buffer_size(struct iris_inst *inst)
>>> +static u32 iris_dec_bitstream_buffer_size(struct iris_inst *inst)
>>>   {
>>>       struct platform_inst_caps *caps = inst->core-
>>> >iris_platform_data->inst_caps;
>>>       u32 base_res_mbs = NUM_MBS_4K;
>>> @@ -219,18 +224,50 @@ static u32 iris_bitstream_buffer_size(struct
>>> iris_inst *inst)
>>>       return ALIGN(frame_size, PIXELS_4K);
>>>   }
>>> +static u32 iris_enc_bitstream_buffer_size(struct iris_inst *inst)
>>> +{
>>> +    u32 aligned_width, aligned_height, bitstream_size, yuv_size;
>>> +    struct v4l2_format *f;
>>> +
>>> +    f = inst->fmt_dst;
>>> +
>>> +    aligned_width = ALIGN(f->fmt.pix_mp.width, 32);
>>> +    aligned_height = ALIGN(f->fmt.pix_mp.height, 32);
>>> +    bitstream_size = aligned_width * aligned_height * 3;
>>> +    yuv_size = (aligned_width * aligned_height * 3) >> 1;
>>> +    if (aligned_width * aligned_height > (4096 * 2176))
>>> +        /* bitstream_size = 0.25 * yuv_size; */
>>> +        bitstream_size = (bitstream_size >> 3);
>>> +    else if (aligned_width * aligned_height > (1280 * 720))
>>> +        /* bitstream_size = 0.5 * yuv_size; */
>>> +        bitstream_size = (bitstream_size >> 2);
>>> +
>>> +    return ALIGN(bitstream_size, 4096);
>>> +}
>>> +
>>>   int iris_get_buffer_size(struct iris_inst *inst,
>>>                enum iris_buffer_type buffer_type)
>>>   {
>>> -    switch (buffer_type) {
>>> -    case BUF_INPUT:
>>> -        return iris_bitstream_buffer_size(inst);
>>> -    case BUF_OUTPUT:
>>> -        return iris_yuv_buffer_size_nv12(inst);
>>> -    case BUF_DPB:
>>> -        return iris_yuv_buffer_size_qc08c(inst);
>>> -    default:
>>> -        return 0;
>>> +    if (inst->domain == DECODER) {
>>> +        switch (buffer_type) {
>>> +        case BUF_INPUT:
>>> +            return iris_dec_bitstream_buffer_size(inst);
>>> +        case BUF_OUTPUT:
>>> +            return iris_yuv_buffer_size_nv12(inst);
>>> +        case BUF_DPB:
>>> +            return iris_yuv_buffer_size_qc08c(inst);
>>> +        default:
>>> +            return 0;
>>> +        }
>>> +    } else {
>>> +        switch (buffer_type) {
>>> +        case BUF_INPUT:
>>> +            return iris_yuv_buffer_size_nv12(inst);
>>> +        case BUF_OUTPUT:
>>> +            return iris_enc_bitstream_buffer_size(inst);
>>> +        default:
>>> +            return 0;
>>> +        }
>>>       }
>>>   }
>>> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
>>> b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
>>> index
>>> 5097680ee14ebba3a126213c0584161627ca47d7..eae3dc5c596d1eb6090126ac391b8e0e2c9f09eb 100644
>>> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
>>> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
>>> @@ -109,7 +109,12 @@ static int iris_hfi_gen1_session_open(struct
>>> iris_inst *inst)
>>>       packet.shdr.hdr.size = sizeof(struct hfi_session_open_pkt);
>>>       packet.shdr.hdr.pkt_type = HFI_CMD_SYS_SESSION_INIT;
>>>       packet.shdr.session_id = inst->session_id;
>>> -    packet.session_domain = HFI_SESSION_TYPE_DEC;
>>> +
>>> +    if (inst->domain == DECODER)
>>> +        packet.session_domain = HFI_SESSION_TYPE_DEC;
>>> +    else
>>> +        packet.session_domain = HFI_SESSION_TYPE_ENC;
>>> +
>>>       packet.session_codec = codec;
>>>       reinit_completion(&inst->completion);
>>> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
>>> b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
>>> index
>>> d4d119ca98b0cb313db351f3794bf278216bd539..5b7c641b727a16c3aa7196a6d49786133653279f 100644
>>> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
>>> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
>>> @@ -10,6 +10,7 @@
>>>   #define HFI_VIDEO_ARCH_OX                0x1
>>> +#define HFI_SESSION_TYPE_ENC                1
>>>   #define HFI_SESSION_TYPE_DEC                2
>>>   #define HFI_VIDEO_CODEC_H264                0x00000002
>>> diff --git a/drivers/media/platform/qcom/iris/iris_instance.h b/
>>> drivers/media/platform/qcom/iris/iris_instance.h
>>> index
>>> 0e1f5799b72d993b25820608969e0011eabdb6bc..ff90f010f1d36690cbadeff0787b1fb7458d7f75 100644
>>> --- a/drivers/media/platform/qcom/iris/iris_instance.h
>>> +++ b/drivers/media/platform/qcom/iris/iris_instance.h
>>> @@ -12,6 +12,9 @@
>>>   #include "iris_core.h"
>>>   #include "iris_utils.h"
>>> +#define DEFAULT_WIDTH 320
>>> +#define DEFAULT_HEIGHT 240
>>> +
>>>   /**
>>>    * struct iris_inst - holds per video instance parameters
>>>    *
>>> @@ -24,7 +27,9 @@
>>>    * @fmt_src: structure of v4l2_format for source
>>>    * @fmt_dst: structure of v4l2_format for destination
>>>    * @ctrl_handler: reference of v4l2 ctrl handler
>>> + * @domain: domain type: encoder or decoder
>>>    * @crop: structure of crop info
>>> + * @compose: structure of compose info
>>>    * @completion: structure of signal completions
>>>    * @flush_completion: structure of signal completions for flush cmd
>>>    * @flush_responses_pending: counter to track number of pending flush
>>> responses
>>> @@ -57,7 +62,9 @@ struct iris_inst {
>>>       struct v4l2_format        *fmt_src;
>>>       struct v4l2_format        *fmt_dst;
>>>       struct v4l2_ctrl_handler    ctrl_handler;
>>> +    enum domain_type        domain;
>>>       struct iris_hfi_rect_desc    crop;
>>> +    struct iris_hfi_rect_desc    compose;
>>>       struct completion        completion;
>>>       struct completion        flush_completion;
>>>       u32                flush_responses_pending;
>>> diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/
>>> media/platform/qcom/iris/iris_vdec.c
>>> index
>>> d670b51c5839d1fad54d34f373cf71d5f3973a96..3482ff3f18d2bcd592b7eb7d803bf98e29276ebb 100644
>>> --- a/drivers/media/platform/qcom/iris/iris_vdec.c
>>> +++ b/drivers/media/platform/qcom/iris/iris_vdec.c
>>> @@ -13,8 +13,6 @@
>>>   #include "iris_vdec.h"
>>>   #include "iris_vpu_buffer.h"
>>> -#define DEFAULT_WIDTH 320
>>> -#define DEFAULT_HEIGHT 240
>>>   #define DEFAULT_CODEC_ALIGNMENT 16
>>>   int iris_vdec_inst_init(struct iris_inst *inst)
>>> diff --git a/drivers/media/platform/qcom/iris/iris_venc.c b/drivers/
>>> media/platform/qcom/iris/iris_venc.c
>>> new file mode 100644
>>> index
>>> 0000000000000000000000000000000000000000..e418d347ac111c1bc48304adafa259d697e49fed
>>> --- /dev/null
>>> +++ b/drivers/media/platform/qcom/iris/iris_venc.c
>>> @@ -0,0 +1,65 @@
>>> +// SPDX-License-Identifier: GPL-2.0-only
>>> +/*
>>> + * Copyright (c) 2022-2025 Qualcomm Innovation Center, Inc. All rights
>>> reserved.
>>> + */
>>> +
>>> +#include "iris_buffer.h"
>>> +#include "iris_instance.h"
>>> +#include "iris_venc.h"
>>> +#include "iris_vpu_buffer.h"
>>> +
>>> +int iris_venc_inst_init(struct iris_inst *inst)
>>> +{
>>> +    struct v4l2_format *f;
>>> +
>>> +    inst->fmt_src = kzalloc(sizeof(*inst->fmt_src), GFP_KERNEL);
>>> +    inst->fmt_dst  = kzalloc(sizeof(*inst->fmt_dst), GFP_KERNEL);
>>> +    if (!inst->fmt_src || !inst->fmt_dst)
>>> +        return -ENOMEM;
>>> +
>>> +    f = inst->fmt_dst;
>>> +    f->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
>>> +    f->fmt.pix_mp.width = DEFAULT_WIDTH;
>>> +    f->fmt.pix_mp.height = DEFAULT_HEIGHT;
>>> +    f->fmt.pix_mp.pixelformat = V4L2_PIX_FMT_H264;
>>> +    inst->codec = f->fmt.pix_mp.pixelformat;
>>> +    f->fmt.pix_mp.num_planes = 1;
>>> +    f->fmt.pix_mp.plane_fmt[0].bytesperline = 0;
>>> +    f->fmt.pix_mp.plane_fmt[0].sizeimage = iris_get_buffer_size(inst,
>>> BUF_OUTPUT);
>>> +    f->fmt.pix_mp.field = V4L2_FIELD_NONE;
>>> +    f->fmt.pix_mp.colorspace = V4L2_COLORSPACE_DEFAULT;
>>> +    f->fmt.pix_mp.xfer_func = V4L2_XFER_FUNC_DEFAULT;
>>> +    f->fmt.pix_mp.ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
>>> +    f->fmt.pix_mp.quantization = V4L2_QUANTIZATION_DEFAULT;
>>> +    inst->buffers[BUF_OUTPUT].min_count = iris_vpu_buf_count(inst,
>>> BUF_OUTPUT);
>>> +    inst->buffers[BUF_OUTPUT].size = f-
>>> >fmt.pix_mp.plane_fmt[0].sizeimage;
>>> +
>>> +    f = inst->fmt_src;
>>> +    f->type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
>>> +    f->fmt.pix_mp.pixelformat = V4L2_PIX_FMT_NV12;
>>> +    f->fmt.pix_mp.width = ALIGN(DEFAULT_WIDTH, 128);
>>> +    f->fmt.pix_mp.height = ALIGN(DEFAULT_HEIGHT, 32);
>>> +    f->fmt.pix_mp.num_planes = 1;
>>> +    f->fmt.pix_mp.plane_fmt[0].bytesperline = ALIGN(DEFAULT_WIDTH, 128);
>>> +    f->fmt.pix_mp.plane_fmt[0].sizeimage = iris_get_buffer_size(inst,
>>> BUF_INPUT);
>>> +    f->fmt.pix_mp.field = V4L2_FIELD_NONE;
>>> +    f->fmt.pix_mp.colorspace = V4L2_COLORSPACE_DEFAULT;
>>> +    f->fmt.pix_mp.xfer_func = V4L2_XFER_FUNC_DEFAULT;
>>> +    f->fmt.pix_mp.ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
>>> +    f->fmt.pix_mp.quantization = V4L2_QUANTIZATION_DEFAULT;
>>> +    inst->buffers[BUF_INPUT].min_count = iris_vpu_buf_count(inst,
>>> BUF_INPUT);
>>> +    inst->buffers[BUF_INPUT].size = f- >fmt.pix_mp.plane_fmt[0].sizeimage;
>>> +
>>> +    inst->crop.left = 0;
>>> +    inst->crop.top = 0;
>>> +    inst->crop.width = f->fmt.pix_mp.width;
>>> +    inst->crop.height = f->fmt.pix_mp.height;
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +void iris_venc_inst_deinit(struct iris_inst *inst)
>>> +{
>>> +    kfree(inst->fmt_dst);
>>> +    kfree(inst->fmt_src);
>>> +}
>>> diff --git a/drivers/media/platform/qcom/iris/iris_venc.h b/drivers/
>>> media/platform/qcom/iris/iris_venc.h
>>> new file mode 100644
>>> index
>>> 0000000000000000000000000000000000000000..8a4cbddd0114b6d0e4ea895362b01c302250c78b
>>> --- /dev/null
>>> +++ b/drivers/media/platform/qcom/iris/iris_venc.h
>>> @@ -0,0 +1,14 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>> +/*
>>> + * Copyright (c) 2022-2025 Qualcomm Innovation Center, Inc. All rights
>>> reserved.
>>> + */
>>> +
>>> +#ifndef _IRIS_VENC_H_
>>> +#define _IRIS_VENC_H_
>>> +
>>> +struct iris_inst;
>>> +
>>> +int iris_venc_inst_init(struct iris_inst *inst);
>>> +void iris_venc_inst_deinit(struct iris_inst *inst);
>>> +
>>> +#endif
>>> diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/
>>> media/platform/qcom/iris/iris_vidc.c
>>> index
>>> 96313856a026efaff40da97eaaa63e847172cd57..11f27fc867dc610c18022b0942e65aa175a8567e 100644
>>> --- a/drivers/media/platform/qcom/iris/iris_vidc.c
>>> +++ b/drivers/media/platform/qcom/iris/iris_vidc.c
>>> @@ -12,6 +12,7 @@
>>>   #include "iris_vidc.h"
>>>   #include "iris_instance.h"
>>>   #include "iris_vdec.h"
>>> +#include "iris_venc.h"
>>>   #include "iris_vb2.h"
>>>   #include "iris_vpu_buffer.h"
>>>   #include "iris_platform_common.h"
>>> @@ -23,7 +24,10 @@
>>>   static void iris_v4l2_fh_init(struct iris_inst *inst)
>>>   {
>>> -    v4l2_fh_init(&inst->fh, inst->core->vdev_dec);
>>> +    if (inst->domain == ENCODER)
>>> +        v4l2_fh_init(&inst->fh, inst->core->vdev_enc);
>>> +    else if (inst->domain == DECODER)
>>> +        v4l2_fh_init(&inst->fh, inst->core->vdev_dec);
>>>       inst->fh.ctrl_handler = &inst->ctrl_handler;
>>>       v4l2_fh_add(&inst->fh);
>>>   }
>>> @@ -126,9 +130,19 @@ iris_m2m_queue_init(void *priv, struct vb2_queue
>>> *src_vq, struct vb2_queue *dst_
>>>   int iris_open(struct file *filp)
>>>   {
>>>       struct iris_core *core = video_drvdata(filp);
>>> +    struct video_device *vdev;
>>>       struct iris_inst *inst;
>>> +    u32 session_type;
>>>       int ret;
>>> +    vdev = video_devdata(filp);
>>> +    if (strcmp(vdev->name, "qcom-iris-decoder") == 0)
>>> +        session_type = DECODER;
>>> +    else if (strcmp(vdev->name, "qcom-iris-encoder") == 0)
>>> +        session_type = ENCODER;
>>> +    else
>>> +        return -EINVAL;
>>> +
>>>       ret = pm_runtime_resume_and_get(core->dev);
>>>       if (ret < 0)
>>>           return ret;
>>> @@ -147,6 +161,7 @@ int iris_open(struct file *filp)
>>>           return -ENOMEM;
>>>       inst->core = core;
>>> +    inst->domain = session_type;
>>>       inst->session_id = hash32_ptr(inst);
>>>       inst->state = IRIS_INST_DEINIT;
>>> @@ -178,7 +193,10 @@ int iris_open(struct file *filp)
>>>           goto fail_m2m_release;
>>>       }
>>> -    ret = iris_vdec_inst_init(inst);
>>> +    if (inst->domain == DECODER)
>>> +        ret = iris_vdec_inst_init(inst);
>>> +    else if (inst->domain == ENCODER)
>>> +        ret = iris_venc_inst_init(inst);
>>>       if (ret)
>>>           goto fail_m2m_ctx_release;
>>> @@ -265,7 +283,10 @@ int iris_close(struct file *filp)
>>>       v4l2_m2m_ctx_release(inst->m2m_ctx);
>>>       v4l2_m2m_release(inst->m2m_dev);
>>>       mutex_lock(&inst->lock);
>>> -    iris_vdec_inst_deinit(inst);
>>> +    if (inst->domain == DECODER)
>>> +        iris_vdec_inst_deinit(inst);
>>> +    else if (inst->domain == ENCODER)
>>> +        iris_venc_inst_deinit(inst);
>>>       iris_session_close(inst);
>>>       iris_inst_change_state(inst, IRIS_INST_DEINIT);
>>>       iris_v4l2_fh_deinit(inst);
>>> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c b/
>>> drivers/media/platform/qcom/iris/iris_vpu_buffer.c
>>> index
>>> f92fd39fe310b9661f892dcf1ff036ebbc102270..06d5afc3c641f0dfca3967e55273c4fa2614fdff 100644
>>> --- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
>>> +++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
>>> @@ -628,7 +628,10 @@ int iris_vpu_buf_count(struct iris_inst *inst, enum
>>> iris_buffer_type buffer_type
>>>       case BUF_INPUT:
>>>           return MIN_BUFFERS;
>>>       case BUF_OUTPUT:
>>> -        return output_min_count(inst);
>>> +        if (inst->domain == ENCODER)
>>> +            return MIN_BUFFERS;
>>> +        else
>>> +            return output_min_count(inst);
>>>       case BUF_BIN:
>>>       case BUF_COMV:
>>>       case BUF_NON_COMV:
>>>
>>
>> Patch failed at 0012 media: iris: Initialize and deinitialize encoder
>> instance structure
>> error: patch failed: drivers/media/platform/qcom/iris/iris_vidc.c:23
>> error: drivers/media/platform/qcom/iris/iris_vidc.c: patch does not apply
>> hint: Use 'git am --show-current-patch=diff' to see the failed patch
>>
>>   git log drivers/media/platform/qcom/iris/iris_vidc.c
>> commit 095ac6efdcaaa0169c5e0b4471f7835d39cd82d7
>> Author: Dikshita Agarwal <quic_dikshita@quicinc.com>
>> Date:   Wed Aug 13 15:07:52 2025 +0530
>>
>>      media: iris: Report unreleased PERSIST buffers on session close
>>
>>      Add error reporting for unreleased PERSIST internal buffers in
>>      iris_check_num_queued_internal_buffers(). This ensures all buffer types
>>      are checked and logged if not freed during session close, helping to
>>      detect memory leaks and improve driver robustness. No change to buffer
>>      lifecycle or allocation logic.
>>
>>      Fixes: d2abb1ff5a3c ("media: iris: Verify internal buffer release on
>> close")
>>      Reviewed-by: Vikash Garodia <quic_vgarodia@quicinc.com>
>>      Tested-by: Vikash Garodia <quic_vgarodia@quicinc.com> # X1E80100
>>      Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
>>
>> commit 7c6719080cbcc1d3376385c66d456b25f85abcdc
>> Author: Dikshita Agarwal <quic_dikshita@quicinc.com>
>> Date:   Wed Aug 13 15:07:51 2025 +0530
>>
>>      media: iris: Fix buffer count reporting in internal buffer check
>>
>>      Initialize the count variable to zero before counting unreleased
>>      internal buffers in iris_check_num_queued_internal_buffers().
>>      This prevents stale values from previous iterations and ensures
>> accurate
>>      error reporting for each buffer type. Without this initialization, the
>>      count could accumulate across types, leading to incorrect log messages.
>>
>>      Fixes: d2abb1ff5a3c ("media: iris: Verify internal buffer release on
>> close")
>>      Reviewed-by: Vikash Garodia <quic_vgarodia@quicinc.com>
>>      Tested-by: Vikash Garodia <quic_vgarodia@quicinc.com> # X1E80100
>>      Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>      Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
>>
>> commit 277966749f46bc6292c4052b4e66a554f193a78a
>> Author: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
>> Date:   Sun Aug 10 04:30:09 2025 +0300
>>
>>      media: Reset file->private_data to NULL in v4l2_fh_del()
>>
>>
>> https://gitlab.freedesktop.org/linux-media/users/bodonoghue/-/commits/
>> b4/bod-media-committers-next-platform-qcom-6.17-rc1
>>
>> ---
>> bod
> 
> BTW the majority of the patches remaining in this series won't apply after
> this failure.
> 
> Please rebase to resolve.

Sure, will rebase the next revision on latest linux-media.

> 
> ---
> bod

