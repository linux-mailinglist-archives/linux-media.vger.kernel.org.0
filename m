Return-Path: <linux-media+bounces-39925-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 857A6B269CF
	for <lists+linux-media@lfdr.de>; Thu, 14 Aug 2025 16:43:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9CB4A5E5A20
	for <lists+linux-media@lfdr.de>; Thu, 14 Aug 2025 14:25:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB31119CCFC;
	Thu, 14 Aug 2025 14:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="d0tPp56O"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06C3B1311AC;
	Thu, 14 Aug 2025 14:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755181529; cv=none; b=lJ3QTLL1rNZuZ3a0It2l3/hUIeX1B1O6+nRS7yuILbe8ni2c4IPJ87RIy9MrDUU/PANHmoqbBLhIeQr2hij0NkY9a/0tVwWsM77lhM9SXicz7BbY/7q5M4JUvnhhhgsFa+cSFaRMBTtz7TjYuLfubS0Gofbmk1pFOHNhkLWbXUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755181529; c=relaxed/simple;
	bh=mjCS1+6Y85NkPtpCG3oTP2H2rUjFvJRk6qfOuyfgMPE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=C9JYYs362MS5WFY3EodU2emkpZKyDBOhz0bnbsOqA9bDPfu/naC4EVaA7US1VTVPRuHqVmKDvlmRen7M518eNCzEcUsrb63qA2DWM/L2XQy/8BVsv/zCKCLpZgInSvQdk5MaganoesHdTpUKsIDSD3d/R8H8Aq+uFRBU4qPVysE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=d0tPp56O; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57E95dQn002966;
	Thu, 14 Aug 2025 14:25:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LScT0bnAryOVcpkrGCq0xK+tWgXzrFihKrNpD1MDwok=; b=d0tPp56OWswTd8jq
	zypw3RDi7mYt+gGDZvpd2zv5eiJHwsWIYI10kiuedU/z1n3D1WPM0dSBEc6TucAj
	f7PbMfgmoFgRv4W4/7b8IqYfOVaTRqK8Nd842+3F5T8gFbLCnJeJtnpKl/pjgJLP
	zpR0Kg04HIW6p3LIWpnlQrBPXBeiv0iH5Qm/lHefYVBfwoqT0RSgiIguXWKS2O+5
	/5lYao1192rtYq4wNETbE/3IdODAXpfGXNK7fqnLLNll2dVcVIGvOIMoUod7vD4B
	9l3gksH++8HOexzR5hhmfDCH3p/WRmsll77AvvssNTi/9dC7qYD5m04NnBIN40iU
	zzxBPQ==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dxdv80hs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Aug 2025 14:25:20 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57EEPDcj008992
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Aug 2025 14:25:13 GMT
Received: from [10.216.25.245] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 14 Aug
 2025 07:25:08 -0700
Message-ID: <7f20abfe-7ff7-2f44-ab18-2ad70c8a3825@quicinc.com>
Date: Thu, 14 Aug 2025 19:55:04 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 12/24] media: iris: Initialize and deinitialize encoder
 instance structure
Content-Language: en-US
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
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
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <20250813-iris-video-encoder-v2-12-c725ff673078@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=IuYecK/g c=1 sm=1 tr=0 ts=689df1d0 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8
 a=aME8RP0sIr1SsRFzy8EA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: w4Ad1qe3prle3YtDdQQgex-9C7yyHFdM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAyNSBTYWx0ZWRfX6SJEoqqieaSk
 FlwpEEKsIHY44DXiO0vrv+ahd/BLcGcpPTiXt3WkkfHbY9qylLNFY+AkLjWWn2clSuNS0HgguUU
 105FjHHr0alExLjUHJdPBIS2Z7gY7YBb71zcwjTCq9lDxr7/ypPmt0nyKKIXPWkso5yAeMifCHq
 WOSgoVPwnGGTfx3nGJ0xRlizYTdxhKBjpBIVB85Nrux3MZ5UPqPN1B7GkYpH73mjJfQ58n666hb
 RG4xs8lxz6XMnF0+0wKM0UdPSQpe+JJQhmuKaNNqwXyVVW2TjCM8Bb2Xy8b9gICaTMHvenTOTM6
 1W23LMxVBiYoyhI5HTeHUthnIg+YVxtkKnc/GcLys2+DV1cmRQUvseu/ic94JmcsHPHNNuc5GVP
 Me0i6wXC
X-Proofpoint-GUID: w4Ad1qe3prle3YtDdQQgex-9C7yyHFdM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 phishscore=0 suspectscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090025


On 8/13/2025 3:08 PM, Dikshita Agarwal wrote:
> Introduce initialization and deinitialization for internal encoder
> instance structure with necessary hooks.
> 
> Tested-by: Vikash Garodia <quic_vgarodia@quicinc.com> # X1E80100
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> ---
>  drivers/media/platform/qcom/iris/Makefile          |  1 +
>  drivers/media/platform/qcom/iris/iris_buffer.c     | 59 ++++++++++++++++----
>  .../platform/qcom/iris/iris_hfi_gen1_command.c     |  7 ++-
>  .../platform/qcom/iris/iris_hfi_gen1_defines.h     |  1 +
>  drivers/media/platform/qcom/iris/iris_instance.h   |  7 +++
>  drivers/media/platform/qcom/iris/iris_vdec.c       |  2 -
>  drivers/media/platform/qcom/iris/iris_venc.c       | 65 ++++++++++++++++++++++
>  drivers/media/platform/qcom/iris/iris_venc.h       | 14 +++++
>  drivers/media/platform/qcom/iris/iris_vidc.c       | 27 ++++++++-
>  drivers/media/platform/qcom/iris/iris_vpu_buffer.c |  5 +-
>  10 files changed, 170 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
> index e86d00ee6f15dda8bae2f25f726feb0d427b7684..ec32145e081b1fc3538dfa7d5113162a76a6068c 100644
> --- a/drivers/media/platform/qcom/iris/Makefile
> +++ b/drivers/media/platform/qcom/iris/Makefile
> @@ -19,6 +19,7 @@ qcom-iris-objs += \
>               iris_vidc.o \
>               iris_vb2.o \
>               iris_vdec.o \
> +             iris_venc.o \
>               iris_vpu2.o \
>               iris_vpu3x.o \
>               iris_vpu_buffer.o \
> diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
> index 38548ee4749ea7dd1addf2c9d0677cf5217e3546..6bf9b0b35d206d51b927c824d5a5b327596251c6 100644
> --- a/drivers/media/platform/qcom/iris/iris_buffer.c
> +++ b/drivers/media/platform/qcom/iris/iris_buffer.c
> @@ -63,7 +63,12 @@
>  static u32 iris_yuv_buffer_size_nv12(struct iris_inst *inst)
>  {
>  	u32 y_plane, uv_plane, y_stride, uv_stride, y_scanlines, uv_scanlines;
> -	struct v4l2_format *f = inst->fmt_dst;
> +	struct v4l2_format *f;
> +
> +	if (inst->domain == DECODER)
> +		f = inst->fmt_dst;
> +	else
> +		f = inst->fmt_src;
>  
>  	y_stride = ALIGN(f->fmt.pix_mp.width, Y_STRIDE_ALIGN);
>  	uv_stride = ALIGN(f->fmt.pix_mp.width, UV_STRIDE_ALIGN);
> @@ -194,7 +199,7 @@ static u32 iris_yuv_buffer_size_qc08c(struct iris_inst *inst)
>  	return ALIGN(y_meta_plane + y_plane + uv_meta_plane + uv_plane, PIXELS_4K);
>  }
>  
> -static u32 iris_bitstream_buffer_size(struct iris_inst *inst)
> +static u32 iris_dec_bitstream_buffer_size(struct iris_inst *inst)
>  {
>  	struct platform_inst_caps *caps = inst->core->iris_platform_data->inst_caps;
>  	u32 base_res_mbs = NUM_MBS_4K;
> @@ -219,18 +224,50 @@ static u32 iris_bitstream_buffer_size(struct iris_inst *inst)
>  	return ALIGN(frame_size, PIXELS_4K);
>  }
>  
> +static u32 iris_enc_bitstream_buffer_size(struct iris_inst *inst)
> +{
> +	u32 aligned_width, aligned_height, bitstream_size, yuv_size;
> +	struct v4l2_format *f;
> +
> +	f = inst->fmt_dst;
> +
> +	aligned_width = ALIGN(f->fmt.pix_mp.width, 32);
> +	aligned_height = ALIGN(f->fmt.pix_mp.height, 32);
> +	bitstream_size = aligned_width * aligned_height * 3;
> +	yuv_size = (aligned_width * aligned_height * 3) >> 1;
> +	if (aligned_width * aligned_height > (4096 * 2176))
> +		/* bitstream_size = 0.25 * yuv_size; */
> +		bitstream_size = (bitstream_size >> 3);
> +	else if (aligned_width * aligned_height > (1280 * 720))
> +		/* bitstream_size = 0.5 * yuv_size; */
> +		bitstream_size = (bitstream_size >> 2);
> +
> +	return ALIGN(bitstream_size, 4096);
> +}
> +
>  int iris_get_buffer_size(struct iris_inst *inst,
>  			 enum iris_buffer_type buffer_type)
>  {
> -	switch (buffer_type) {
> -	case BUF_INPUT:
> -		return iris_bitstream_buffer_size(inst);
> -	case BUF_OUTPUT:
> -		return iris_yuv_buffer_size_nv12(inst);
> -	case BUF_DPB:
> -		return iris_yuv_buffer_size_qc08c(inst);
> -	default:
> -		return 0;
> +	if (inst->domain == DECODER) {
> +		switch (buffer_type) {
> +		case BUF_INPUT:
> +			return iris_dec_bitstream_buffer_size(inst);
> +		case BUF_OUTPUT:
> +			return iris_yuv_buffer_size_nv12(inst);
> +		case BUF_DPB:
> +			return iris_yuv_buffer_size_qc08c(inst);
> +		default:
> +			return 0;
> +		}
> +	} else {
> +		switch (buffer_type) {
> +		case BUF_INPUT:
> +			return iris_yuv_buffer_size_nv12(inst);
> +		case BUF_OUTPUT:
> +			return iris_enc_bitstream_buffer_size(inst);
> +		default:
> +			return 0;
> +		}
>  	}
>  }
>  
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> index 5097680ee14ebba3a126213c0584161627ca47d7..eae3dc5c596d1eb6090126ac391b8e0e2c9f09eb 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> @@ -109,7 +109,12 @@ static int iris_hfi_gen1_session_open(struct iris_inst *inst)
>  	packet.shdr.hdr.size = sizeof(struct hfi_session_open_pkt);
>  	packet.shdr.hdr.pkt_type = HFI_CMD_SYS_SESSION_INIT;
>  	packet.shdr.session_id = inst->session_id;
> -	packet.session_domain = HFI_SESSION_TYPE_DEC;
> +
> +	if (inst->domain == DECODER)
> +		packet.session_domain = HFI_SESSION_TYPE_DEC;
> +	else
> +		packet.session_domain = HFI_SESSION_TYPE_ENC;
> +
>  	packet.session_codec = codec;
>  
>  	reinit_completion(&inst->completion);
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
> index d4d119ca98b0cb313db351f3794bf278216bd539..5b7c641b727a16c3aa7196a6d49786133653279f 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
> @@ -10,6 +10,7 @@
>  
>  #define HFI_VIDEO_ARCH_OX				0x1
>  
> +#define HFI_SESSION_TYPE_ENC				1
>  #define HFI_SESSION_TYPE_DEC				2
>  
>  #define HFI_VIDEO_CODEC_H264				0x00000002
> diff --git a/drivers/media/platform/qcom/iris/iris_instance.h b/drivers/media/platform/qcom/iris/iris_instance.h
> index 0e1f5799b72d993b25820608969e0011eabdb6bc..ff90f010f1d36690cbadeff0787b1fb7458d7f75 100644
> --- a/drivers/media/platform/qcom/iris/iris_instance.h
> +++ b/drivers/media/platform/qcom/iris/iris_instance.h
> @@ -12,6 +12,9 @@
>  #include "iris_core.h"
>  #include "iris_utils.h"
>  
> +#define DEFAULT_WIDTH 320
> +#define DEFAULT_HEIGHT 240
> +
>  /**
>   * struct iris_inst - holds per video instance parameters
>   *
> @@ -24,7 +27,9 @@
>   * @fmt_src: structure of v4l2_format for source
>   * @fmt_dst: structure of v4l2_format for destination
>   * @ctrl_handler: reference of v4l2 ctrl handler
> + * @domain: domain type: encoder or decoder
>   * @crop: structure of crop info
> + * @compose: structure of compose info
>   * @completion: structure of signal completions
>   * @flush_completion: structure of signal completions for flush cmd
>   * @flush_responses_pending: counter to track number of pending flush responses
> @@ -57,7 +62,9 @@ struct iris_inst {
>  	struct v4l2_format		*fmt_src;
>  	struct v4l2_format		*fmt_dst;
>  	struct v4l2_ctrl_handler	ctrl_handler;
> +	enum domain_type		domain;
>  	struct iris_hfi_rect_desc	crop;
> +	struct iris_hfi_rect_desc	compose;
>  	struct completion		completion;
>  	struct completion		flush_completion;
>  	u32				flush_responses_pending;
> diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
> index d670b51c5839d1fad54d34f373cf71d5f3973a96..3482ff3f18d2bcd592b7eb7d803bf98e29276ebb 100644
> --- a/drivers/media/platform/qcom/iris/iris_vdec.c
> +++ b/drivers/media/platform/qcom/iris/iris_vdec.c
> @@ -13,8 +13,6 @@
>  #include "iris_vdec.h"
>  #include "iris_vpu_buffer.h"
>  
> -#define DEFAULT_WIDTH 320
> -#define DEFAULT_HEIGHT 240
>  #define DEFAULT_CODEC_ALIGNMENT 16
>  
>  int iris_vdec_inst_init(struct iris_inst *inst)
> diff --git a/drivers/media/platform/qcom/iris/iris_venc.c b/drivers/media/platform/qcom/iris/iris_venc.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..e418d347ac111c1bc48304adafa259d697e49fed
> --- /dev/null
> +++ b/drivers/media/platform/qcom/iris/iris_venc.c
> @@ -0,0 +1,65 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2022-2025 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#include "iris_buffer.h"
> +#include "iris_instance.h"
> +#include "iris_venc.h"
> +#include "iris_vpu_buffer.h"
> +
> +int iris_venc_inst_init(struct iris_inst *inst)
> +{
> +	struct v4l2_format *f;
> +
> +	inst->fmt_src = kzalloc(sizeof(*inst->fmt_src), GFP_KERNEL);
> +	inst->fmt_dst  = kzalloc(sizeof(*inst->fmt_dst), GFP_KERNEL);
> +	if (!inst->fmt_src || !inst->fmt_dst)
> +		return -ENOMEM;

What if inst->fmt_src succeeds while inst->fmt_dst fails, does it frees up
inst->fmt_src ?

> +
> +	f = inst->fmt_dst;
> +	f->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
> +	f->fmt.pix_mp.width = DEFAULT_WIDTH;
> +	f->fmt.pix_mp.height = DEFAULT_HEIGHT;
> +	f->fmt.pix_mp.pixelformat = V4L2_PIX_FMT_H264;
> +	inst->codec = f->fmt.pix_mp.pixelformat;
> +	f->fmt.pix_mp.num_planes = 1;
> +	f->fmt.pix_mp.plane_fmt[0].bytesperline = 0;
> +	f->fmt.pix_mp.plane_fmt[0].sizeimage = iris_get_buffer_size(inst, BUF_OUTPUT);
> +	f->fmt.pix_mp.field = V4L2_FIELD_NONE;
> +	f->fmt.pix_mp.colorspace = V4L2_COLORSPACE_DEFAULT;
> +	f->fmt.pix_mp.xfer_func = V4L2_XFER_FUNC_DEFAULT;
> +	f->fmt.pix_mp.ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
> +	f->fmt.pix_mp.quantization = V4L2_QUANTIZATION_DEFAULT;
> +	inst->buffers[BUF_OUTPUT].min_count = iris_vpu_buf_count(inst, BUF_OUTPUT);
> +	inst->buffers[BUF_OUTPUT].size = f->fmt.pix_mp.plane_fmt[0].sizeimage;
> +
> +	f = inst->fmt_src;
> +	f->type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
> +	f->fmt.pix_mp.pixelformat = V4L2_PIX_FMT_NV12;
> +	f->fmt.pix_mp.width = ALIGN(DEFAULT_WIDTH, 128);
> +	f->fmt.pix_mp.height = ALIGN(DEFAULT_HEIGHT, 32);
> +	f->fmt.pix_mp.num_planes = 1;
> +	f->fmt.pix_mp.plane_fmt[0].bytesperline = ALIGN(DEFAULT_WIDTH, 128);
> +	f->fmt.pix_mp.plane_fmt[0].sizeimage = iris_get_buffer_size(inst, BUF_INPUT);
> +	f->fmt.pix_mp.field = V4L2_FIELD_NONE;
> +	f->fmt.pix_mp.colorspace = V4L2_COLORSPACE_DEFAULT;
> +	f->fmt.pix_mp.xfer_func = V4L2_XFER_FUNC_DEFAULT;
> +	f->fmt.pix_mp.ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
> +	f->fmt.pix_mp.quantization = V4L2_QUANTIZATION_DEFAULT;
> +	inst->buffers[BUF_INPUT].min_count = iris_vpu_buf_count(inst, BUF_INPUT);
> +	inst->buffers[BUF_INPUT].size = f->fmt.pix_mp.plane_fmt[0].sizeimage;
> +
> +	inst->crop.left = 0;
> +	inst->crop.top = 0;
> +	inst->crop.width = f->fmt.pix_mp.width;
> +	inst->crop.height = f->fmt.pix_mp.height;
> +
> +	return 0;
> +}
> +
> +void iris_venc_inst_deinit(struct iris_inst *inst)
> +{
> +	kfree(inst->fmt_dst);
> +	kfree(inst->fmt_src);
> +}
> diff --git a/drivers/media/platform/qcom/iris/iris_venc.h b/drivers/media/platform/qcom/iris/iris_venc.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..8a4cbddd0114b6d0e4ea895362b01c302250c78b
> --- /dev/null
> +++ b/drivers/media/platform/qcom/iris/iris_venc.h
> @@ -0,0 +1,14 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2022-2025 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#ifndef _IRIS_VENC_H_
> +#define _IRIS_VENC_H_
> +
> +struct iris_inst;
> +
> +int iris_venc_inst_init(struct iris_inst *inst);
> +void iris_venc_inst_deinit(struct iris_inst *inst);
> +
> +#endif
> diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
> index 96313856a026efaff40da97eaaa63e847172cd57..11f27fc867dc610c18022b0942e65aa175a8567e 100644
> --- a/drivers/media/platform/qcom/iris/iris_vidc.c
> +++ b/drivers/media/platform/qcom/iris/iris_vidc.c
> @@ -12,6 +12,7 @@
>  #include "iris_vidc.h"
>  #include "iris_instance.h"
>  #include "iris_vdec.h"
> +#include "iris_venc.h"
>  #include "iris_vb2.h"
>  #include "iris_vpu_buffer.h"
>  #include "iris_platform_common.h"
> @@ -23,7 +24,10 @@
>  
>  static void iris_v4l2_fh_init(struct iris_inst *inst)
>  {
> -	v4l2_fh_init(&inst->fh, inst->core->vdev_dec);
> +	if (inst->domain == ENCODER)
> +		v4l2_fh_init(&inst->fh, inst->core->vdev_enc);
> +	else if (inst->domain == DECODER)
> +		v4l2_fh_init(&inst->fh, inst->core->vdev_dec);
>  	inst->fh.ctrl_handler = &inst->ctrl_handler;
>  	v4l2_fh_add(&inst->fh);
>  }
> @@ -126,9 +130,19 @@ iris_m2m_queue_init(void *priv, struct vb2_queue *src_vq, struct vb2_queue *dst_
>  int iris_open(struct file *filp)
>  {
>  	struct iris_core *core = video_drvdata(filp);
> +	struct video_device *vdev;
>  	struct iris_inst *inst;
> +	u32 session_type;
>  	int ret;
>  
> +	vdev = video_devdata(filp);
> +	if (strcmp(vdev->name, "qcom-iris-decoder") == 0)
> +		session_type = DECODER;
> +	else if (strcmp(vdev->name, "qcom-iris-encoder") == 0)
> +		session_type = ENCODER;
> +	else
> +		return -EINVAL;
> +
>  	ret = pm_runtime_resume_and_get(core->dev);
>  	if (ret < 0)
>  		return ret;
> @@ -147,6 +161,7 @@ int iris_open(struct file *filp)
>  		return -ENOMEM;
>  
>  	inst->core = core;
> +	inst->domain = session_type;
>  	inst->session_id = hash32_ptr(inst);
>  	inst->state = IRIS_INST_DEINIT;
>  
> @@ -178,7 +193,10 @@ int iris_open(struct file *filp)
>  		goto fail_m2m_release;
>  	}
>  
> -	ret = iris_vdec_inst_init(inst);
> +	if (inst->domain == DECODER)
> +		ret = iris_vdec_inst_init(inst);
> +	else if (inst->domain == ENCODER)
> +		ret = iris_venc_inst_init(inst);
>  	if (ret)
>  		goto fail_m2m_ctx_release;
>  
> @@ -265,7 +283,10 @@ int iris_close(struct file *filp)
>  	v4l2_m2m_ctx_release(inst->m2m_ctx);
>  	v4l2_m2m_release(inst->m2m_dev);
>  	mutex_lock(&inst->lock);
> -	iris_vdec_inst_deinit(inst);
> +	if (inst->domain == DECODER)
> +		iris_vdec_inst_deinit(inst);
> +	else if (inst->domain == ENCODER)
> +		iris_venc_inst_deinit(inst);
>  	iris_session_close(inst);
>  	iris_inst_change_state(inst, IRIS_INST_DEINIT);
>  	iris_v4l2_fh_deinit(inst);
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
> index f92fd39fe310b9661f892dcf1ff036ebbc102270..06d5afc3c641f0dfca3967e55273c4fa2614fdff 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
> @@ -628,7 +628,10 @@ int iris_vpu_buf_count(struct iris_inst *inst, enum iris_buffer_type buffer_type
>  	case BUF_INPUT:
>  		return MIN_BUFFERS;
>  	case BUF_OUTPUT:
> -		return output_min_count(inst);
> +		if (inst->domain == ENCODER)
> +			return MIN_BUFFERS;
> +		else
> +			return output_min_count(inst);
>  	case BUF_BIN:
>  	case BUF_COMV:
>  	case BUF_NON_COMV:
> 

