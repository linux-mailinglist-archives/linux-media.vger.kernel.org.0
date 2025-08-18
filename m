Return-Path: <linux-media+bounces-40056-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B04E9B29743
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 05:21:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 60C174E6518
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 03:21:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7995925DB06;
	Mon, 18 Aug 2025 03:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="nfZX7cTm"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21199286A9;
	Mon, 18 Aug 2025 03:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755487296; cv=none; b=Jfiavkfng9ApVGnu1sFugH+Acu66Xs/XNluEdd+1UfZ1efUuGJ15m8EQGeAehIDBtQHISLV+ixoSXQX4ulm5gs6ppeAJY0VKFd9dismhIo+/t6tpkjI2MFH3XJxBxznN1B8YPBAhLccGBoQHddTyBFfex/zj2DjaeqT4srV/SA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755487296; c=relaxed/simple;
	bh=Lam+b18+aAJ0X0K0z/5ZwT/uvtiZSfQ6XN6wvL93ymk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=uG45uwIsIJ0uMJuEHPcHtgIxoBUw6Z+FYUUPkCrI7FRUuepOkygxNDeFOa/lUo+xkwyTEGYnxGvKrxinRfc9XTG8Rb98GI/hmAV70CERhgyOpuf0XwGETdJAfiJ8VHn99fMpURYaS30blivvqusqeEUul7nDVnn6Y9GACs+PU7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=nfZX7cTm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57HKiFJu002599;
	Mon, 18 Aug 2025 03:21:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QVZ3Rfaeh3F8n13y9NrK45/98gi7s6jZ76dzpkml/00=; b=nfZX7cTm8JFY7G7j
	tdRQOk+P1KZRyvyNwcH+fBQ4Pai155udfbv40cTQpBypYDFA1T78aJOO2IxVRkbU
	DOiJJftTiFCU5lTYVzhFDuHxpBi6fDDOAsEFnyFa7sHF/4ZMmnW6ry8XCy8f+mqu
	YSIx+AxcQRl2KBmP2lM7zfSUjbYse66K3Pwb1yb26acqSuXKMwMlus3gmRX8Z0wb
	XGzl01JKG3Kz8a//XDo1sNWADIaezWbfHwPyKIYA1Y/U0dr2Z0aeIWY3GH5A2CvO
	+u5uzedwx15aJA+oBIq2ZOqKP+OZpqhIRgbZra3jJrBfA8M/8Hvs2+zM4NgTEtAo
	oLveRQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jjrfu2ds-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Aug 2025 03:21:23 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57I3LMPB002796
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Aug 2025 03:21:22 GMT
Received: from [10.50.13.61] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Sun, 17 Aug
 2025 20:21:18 -0700
Message-ID: <2163fa0e-68e2-32bd-8333-20894d4c1941@quicinc.com>
Date: Mon, 18 Aug 2025 08:51:14 +0530
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
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Abhinav Kumar
	<abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil
	<hverkuil@xs4all.nl>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        "Vedang
 Nagar" <quic_vnagar@quicinc.com>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Renjiang Han <quic_renjiang@quicinc.com>,
        Wangao Wang <quic_wangaow@quicinc.com>
References: <20250813-iris-video-encoder-v2-0-c725ff673078@quicinc.com>
 <20250813-iris-video-encoder-v2-12-c725ff673078@quicinc.com>
 <7f20abfe-7ff7-2f44-ab18-2ad70c8a3825@quicinc.com>
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
In-Reply-To: <7f20abfe-7ff7-2f44-ab18-2ad70c8a3825@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: gqWMhOzZlu3E-ZQoLZPCFVxgmSq-QnyI
X-Authority-Analysis: v=2.4 cv=YrsPR5YX c=1 sm=1 tr=0 ts=68a29c33 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8
 a=gf2K8GyGwraodnM4UNsA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAzOSBTYWx0ZWRfX+G11vOaboCid
 FGDfRlx6otNmiXYf6iRnZsjWy3ZLsMVdSxuTFih7ndLUPWGh0RL3j5U9UPMUwMhcxeXzVei/wgo
 yLZ2IjQ83SDPj+RJnvgqlF1ZTqwHUWa1OliSK8Kpl0cAw5Vl3Wu7NpfB1uEqDNQWPtdoRxkFLrc
 OvIbJXJYHMv8GgSNrJ9kIemzozRwuqcsbL1OSnC3IQLmcWPIDLNnf3vGVutjrSv+vlyN4k05Dkj
 ad/nqJ5a5SAmOZHljWmK8vUzr+7f+MXGvCgBGlm3uHx2DbUm1AX1DZGIJ2C6tsPnII6HvsywWDs
 vqd6zU7Qt3ugWous7VpLXhbUsJhDebJgj5YGsk8y9G0H9Nq2RjA7tDlLEgtl9YImt2U04A/timE
 vUE/c28C
X-Proofpoint-ORIG-GUID: gqWMhOzZlu3E-ZQoLZPCFVxgmSq-QnyI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-18_01,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 priorityscore=1501 phishscore=0
 adultscore=0 bulkscore=0 clxscore=1015 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508160039



On 8/14/2025 7:55 PM, Vikash Garodia wrote:
> 
> On 8/13/2025 3:08 PM, Dikshita Agarwal wrote:
>> Introduce initialization and deinitialization for internal encoder
>> instance structure with necessary hooks.
>>
>> Tested-by: Vikash Garodia <quic_vgarodia@quicinc.com> # X1E80100
>> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
>> ---
>>  drivers/media/platform/qcom/iris/Makefile          |  1 +
>>  drivers/media/platform/qcom/iris/iris_buffer.c     | 59 ++++++++++++++++----
>>  .../platform/qcom/iris/iris_hfi_gen1_command.c     |  7 ++-
>>  .../platform/qcom/iris/iris_hfi_gen1_defines.h     |  1 +
>>  drivers/media/platform/qcom/iris/iris_instance.h   |  7 +++
>>  drivers/media/platform/qcom/iris/iris_vdec.c       |  2 -
>>  drivers/media/platform/qcom/iris/iris_venc.c       | 65 ++++++++++++++++++++++
>>  drivers/media/platform/qcom/iris/iris_venc.h       | 14 +++++
>>  drivers/media/platform/qcom/iris/iris_vidc.c       | 27 ++++++++-
>>  drivers/media/platform/qcom/iris/iris_vpu_buffer.c |  5 +-
>>  10 files changed, 170 insertions(+), 18 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
>> index e86d00ee6f15dda8bae2f25f726feb0d427b7684..ec32145e081b1fc3538dfa7d5113162a76a6068c 100644
>> --- a/drivers/media/platform/qcom/iris/Makefile
>> +++ b/drivers/media/platform/qcom/iris/Makefile
>> @@ -19,6 +19,7 @@ qcom-iris-objs += \
>>               iris_vidc.o \
>>               iris_vb2.o \
>>               iris_vdec.o \
>> +             iris_venc.o \
>>               iris_vpu2.o \
>>               iris_vpu3x.o \
>>               iris_vpu_buffer.o \
>> diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
>> index 38548ee4749ea7dd1addf2c9d0677cf5217e3546..6bf9b0b35d206d51b927c824d5a5b327596251c6 100644
>> --- a/drivers/media/platform/qcom/iris/iris_buffer.c
>> +++ b/drivers/media/platform/qcom/iris/iris_buffer.c
>> @@ -63,7 +63,12 @@
>>  static u32 iris_yuv_buffer_size_nv12(struct iris_inst *inst)
>>  {
>>  	u32 y_plane, uv_plane, y_stride, uv_stride, y_scanlines, uv_scanlines;
>> -	struct v4l2_format *f = inst->fmt_dst;
>> +	struct v4l2_format *f;
>> +
>> +	if (inst->domain == DECODER)
>> +		f = inst->fmt_dst;
>> +	else
>> +		f = inst->fmt_src;
>>  
>>  	y_stride = ALIGN(f->fmt.pix_mp.width, Y_STRIDE_ALIGN);
>>  	uv_stride = ALIGN(f->fmt.pix_mp.width, UV_STRIDE_ALIGN);
>> @@ -194,7 +199,7 @@ static u32 iris_yuv_buffer_size_qc08c(struct iris_inst *inst)
>>  	return ALIGN(y_meta_plane + y_plane + uv_meta_plane + uv_plane, PIXELS_4K);
>>  }
>>  
>> -static u32 iris_bitstream_buffer_size(struct iris_inst *inst)
>> +static u32 iris_dec_bitstream_buffer_size(struct iris_inst *inst)
>>  {
>>  	struct platform_inst_caps *caps = inst->core->iris_platform_data->inst_caps;
>>  	u32 base_res_mbs = NUM_MBS_4K;
>> @@ -219,18 +224,50 @@ static u32 iris_bitstream_buffer_size(struct iris_inst *inst)
>>  	return ALIGN(frame_size, PIXELS_4K);
>>  }
>>  
>> +static u32 iris_enc_bitstream_buffer_size(struct iris_inst *inst)
>> +{
>> +	u32 aligned_width, aligned_height, bitstream_size, yuv_size;
>> +	struct v4l2_format *f;
>> +
>> +	f = inst->fmt_dst;
>> +
>> +	aligned_width = ALIGN(f->fmt.pix_mp.width, 32);
>> +	aligned_height = ALIGN(f->fmt.pix_mp.height, 32);
>> +	bitstream_size = aligned_width * aligned_height * 3;
>> +	yuv_size = (aligned_width * aligned_height * 3) >> 1;
>> +	if (aligned_width * aligned_height > (4096 * 2176))
>> +		/* bitstream_size = 0.25 * yuv_size; */
>> +		bitstream_size = (bitstream_size >> 3);
>> +	else if (aligned_width * aligned_height > (1280 * 720))
>> +		/* bitstream_size = 0.5 * yuv_size; */
>> +		bitstream_size = (bitstream_size >> 2);
>> +
>> +	return ALIGN(bitstream_size, 4096);
>> +}
>> +
>>  int iris_get_buffer_size(struct iris_inst *inst,
>>  			 enum iris_buffer_type buffer_type)
>>  {
>> -	switch (buffer_type) {
>> -	case BUF_INPUT:
>> -		return iris_bitstream_buffer_size(inst);
>> -	case BUF_OUTPUT:
>> -		return iris_yuv_buffer_size_nv12(inst);
>> -	case BUF_DPB:
>> -		return iris_yuv_buffer_size_qc08c(inst);
>> -	default:
>> -		return 0;
>> +	if (inst->domain == DECODER) {
>> +		switch (buffer_type) {
>> +		case BUF_INPUT:
>> +			return iris_dec_bitstream_buffer_size(inst);
>> +		case BUF_OUTPUT:
>> +			return iris_yuv_buffer_size_nv12(inst);
>> +		case BUF_DPB:
>> +			return iris_yuv_buffer_size_qc08c(inst);
>> +		default:
>> +			return 0;
>> +		}
>> +	} else {
>> +		switch (buffer_type) {
>> +		case BUF_INPUT:
>> +			return iris_yuv_buffer_size_nv12(inst);
>> +		case BUF_OUTPUT:
>> +			return iris_enc_bitstream_buffer_size(inst);
>> +		default:
>> +			return 0;
>> +		}
>>  	}
>>  }
>>  
>> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
>> index 5097680ee14ebba3a126213c0584161627ca47d7..eae3dc5c596d1eb6090126ac391b8e0e2c9f09eb 100644
>> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
>> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
>> @@ -109,7 +109,12 @@ static int iris_hfi_gen1_session_open(struct iris_inst *inst)
>>  	packet.shdr.hdr.size = sizeof(struct hfi_session_open_pkt);
>>  	packet.shdr.hdr.pkt_type = HFI_CMD_SYS_SESSION_INIT;
>>  	packet.shdr.session_id = inst->session_id;
>> -	packet.session_domain = HFI_SESSION_TYPE_DEC;
>> +
>> +	if (inst->domain == DECODER)
>> +		packet.session_domain = HFI_SESSION_TYPE_DEC;
>> +	else
>> +		packet.session_domain = HFI_SESSION_TYPE_ENC;
>> +
>>  	packet.session_codec = codec;
>>  
>>  	reinit_completion(&inst->completion);
>> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
>> index d4d119ca98b0cb313db351f3794bf278216bd539..5b7c641b727a16c3aa7196a6d49786133653279f 100644
>> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
>> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
>> @@ -10,6 +10,7 @@
>>  
>>  #define HFI_VIDEO_ARCH_OX				0x1
>>  
>> +#define HFI_SESSION_TYPE_ENC				1
>>  #define HFI_SESSION_TYPE_DEC				2
>>  
>>  #define HFI_VIDEO_CODEC_H264				0x00000002
>> diff --git a/drivers/media/platform/qcom/iris/iris_instance.h b/drivers/media/platform/qcom/iris/iris_instance.h
>> index 0e1f5799b72d993b25820608969e0011eabdb6bc..ff90f010f1d36690cbadeff0787b1fb7458d7f75 100644
>> --- a/drivers/media/platform/qcom/iris/iris_instance.h
>> +++ b/drivers/media/platform/qcom/iris/iris_instance.h
>> @@ -12,6 +12,9 @@
>>  #include "iris_core.h"
>>  #include "iris_utils.h"
>>  
>> +#define DEFAULT_WIDTH 320
>> +#define DEFAULT_HEIGHT 240
>> +
>>  /**
>>   * struct iris_inst - holds per video instance parameters
>>   *
>> @@ -24,7 +27,9 @@
>>   * @fmt_src: structure of v4l2_format for source
>>   * @fmt_dst: structure of v4l2_format for destination
>>   * @ctrl_handler: reference of v4l2 ctrl handler
>> + * @domain: domain type: encoder or decoder
>>   * @crop: structure of crop info
>> + * @compose: structure of compose info
>>   * @completion: structure of signal completions
>>   * @flush_completion: structure of signal completions for flush cmd
>>   * @flush_responses_pending: counter to track number of pending flush responses
>> @@ -57,7 +62,9 @@ struct iris_inst {
>>  	struct v4l2_format		*fmt_src;
>>  	struct v4l2_format		*fmt_dst;
>>  	struct v4l2_ctrl_handler	ctrl_handler;
>> +	enum domain_type		domain;
>>  	struct iris_hfi_rect_desc	crop;
>> +	struct iris_hfi_rect_desc	compose;
>>  	struct completion		completion;
>>  	struct completion		flush_completion;
>>  	u32				flush_responses_pending;
>> diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
>> index d670b51c5839d1fad54d34f373cf71d5f3973a96..3482ff3f18d2bcd592b7eb7d803bf98e29276ebb 100644
>> --- a/drivers/media/platform/qcom/iris/iris_vdec.c
>> +++ b/drivers/media/platform/qcom/iris/iris_vdec.c
>> @@ -13,8 +13,6 @@
>>  #include "iris_vdec.h"
>>  #include "iris_vpu_buffer.h"
>>  
>> -#define DEFAULT_WIDTH 320
>> -#define DEFAULT_HEIGHT 240
>>  #define DEFAULT_CODEC_ALIGNMENT 16
>>  
>>  int iris_vdec_inst_init(struct iris_inst *inst)
>> diff --git a/drivers/media/platform/qcom/iris/iris_venc.c b/drivers/media/platform/qcom/iris/iris_venc.c
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..e418d347ac111c1bc48304adafa259d697e49fed
>> --- /dev/null
>> +++ b/drivers/media/platform/qcom/iris/iris_venc.c
>> @@ -0,0 +1,65 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) 2022-2025 Qualcomm Innovation Center, Inc. All rights reserved.
>> + */
>> +
>> +#include "iris_buffer.h"
>> +#include "iris_instance.h"
>> +#include "iris_venc.h"
>> +#include "iris_vpu_buffer.h"
>> +
>> +int iris_venc_inst_init(struct iris_inst *inst)
>> +{
>> +	struct v4l2_format *f;
>> +
>> +	inst->fmt_src = kzalloc(sizeof(*inst->fmt_src), GFP_KERNEL);
>> +	inst->fmt_dst  = kzalloc(sizeof(*inst->fmt_dst), GFP_KERNEL);
>> +	if (!inst->fmt_src || !inst->fmt_dst)
>> +		return -ENOMEM;
> 
> What if inst->fmt_src succeeds while inst->fmt_dst fails, does it frees up
> inst->fmt_src ?
> 

would you prefer below?

if (!inst->fmt_src || !inst->fmt_dst) {
    kfree(inst->fmt_src);
    kfree(inst->fmt_dst);
    return -ENOMEM;
}

Thanks,
Dikshita
>> +
>> +	f = inst->fmt_dst;
>> +	f->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
>> +	f->fmt.pix_mp.width = DEFAULT_WIDTH;
>> +	f->fmt.pix_mp.height = DEFAULT_HEIGHT;
>> +	f->fmt.pix_mp.pixelformat = V4L2_PIX_FMT_H264;
>> +	inst->codec = f->fmt.pix_mp.pixelformat;
>> +	f->fmt.pix_mp.num_planes = 1;
>> +	f->fmt.pix_mp.plane_fmt[0].bytesperline = 0;
>> +	f->fmt.pix_mp.plane_fmt[0].sizeimage = iris_get_buffer_size(inst, BUF_OUTPUT);
>> +	f->fmt.pix_mp.field = V4L2_FIELD_NONE;
>> +	f->fmt.pix_mp.colorspace = V4L2_COLORSPACE_DEFAULT;
>> +	f->fmt.pix_mp.xfer_func = V4L2_XFER_FUNC_DEFAULT;
>> +	f->fmt.pix_mp.ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
>> +	f->fmt.pix_mp.quantization = V4L2_QUANTIZATION_DEFAULT;
>> +	inst->buffers[BUF_OUTPUT].min_count = iris_vpu_buf_count(inst, BUF_OUTPUT);
>> +	inst->buffers[BUF_OUTPUT].size = f->fmt.pix_mp.plane_fmt[0].sizeimage;
>> +
>> +	f = inst->fmt_src;
>> +	f->type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
>> +	f->fmt.pix_mp.pixelformat = V4L2_PIX_FMT_NV12;
>> +	f->fmt.pix_mp.width = ALIGN(DEFAULT_WIDTH, 128);
>> +	f->fmt.pix_mp.height = ALIGN(DEFAULT_HEIGHT, 32);
>> +	f->fmt.pix_mp.num_planes = 1;
>> +	f->fmt.pix_mp.plane_fmt[0].bytesperline = ALIGN(DEFAULT_WIDTH, 128);
>> +	f->fmt.pix_mp.plane_fmt[0].sizeimage = iris_get_buffer_size(inst, BUF_INPUT);
>> +	f->fmt.pix_mp.field = V4L2_FIELD_NONE;
>> +	f->fmt.pix_mp.colorspace = V4L2_COLORSPACE_DEFAULT;
>> +	f->fmt.pix_mp.xfer_func = V4L2_XFER_FUNC_DEFAULT;
>> +	f->fmt.pix_mp.ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
>> +	f->fmt.pix_mp.quantization = V4L2_QUANTIZATION_DEFAULT;
>> +	inst->buffers[BUF_INPUT].min_count = iris_vpu_buf_count(inst, BUF_INPUT);
>> +	inst->buffers[BUF_INPUT].size = f->fmt.pix_mp.plane_fmt[0].sizeimage;
>> +
>> +	inst->crop.left = 0;
>> +	inst->crop.top = 0;
>> +	inst->crop.width = f->fmt.pix_mp.width;
>> +	inst->crop.height = f->fmt.pix_mp.height;
>> +
>> +	return 0;
>> +}
>> +


