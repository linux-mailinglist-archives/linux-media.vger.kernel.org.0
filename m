Return-Path: <linux-media+bounces-39927-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52727B269EE
	for <lists+linux-media@lfdr.de>; Thu, 14 Aug 2025 16:48:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E7A2F6863FB
	for <lists+linux-media@lfdr.de>; Thu, 14 Aug 2025 14:43:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFDE21F03D5;
	Thu, 14 Aug 2025 14:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Td1ShWdI"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65700321428;
	Thu, 14 Aug 2025 14:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755182620; cv=none; b=IU7Rv5gS9aRbkkE5CEJK8s/fFRT10P15qJ2kRXn+GUYDTBxM8qJgsSDPxzgAVNBTYoZNUk6pFzpYCvYTpW59Ry2mseRE35lH9FHwqMgfbdIOBTdBisOZGqMOkAwFGAWd/zjQNJdM1dC379Oy3Cwm/pq3zMhtJqJDNdN+c84ewAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755182620; c=relaxed/simple;
	bh=m2f8i2xS2F6gXwTPl0Q6uWrEEf/MbNIU2SzsNqIeB24=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=a8jjnTX2SILFReJvoz6KAjgedSGLln/lMF69uqW+AE6gR+EwQg6PPWr4FCTz6eGq1KU/xJJDif1pbhICgFQDNZDjpHHU763FuJDSge3K1D3+70k8yrQ6m5MSq+iTzfHTgXWFuYbOAi+wk2ULdwb14l9OdTPFHgGo481QLRlQK4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Td1ShWdI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57E9CQXp013275;
	Thu, 14 Aug 2025 14:43:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RcK6OvgQ6v2PfhGkbZOzRwUntQToWcEy5gAjb4ONN+I=; b=Td1ShWdIQznwUYVL
	h5mMnrYZhnq/d60X+imC09/W1HaHYIMoTITeZjSsH1INXLy1Sn73pH/V76NjUxGb
	05ypWIUG8IohxFlPu/EuyPA1voh79P/AjDD8mvNRIkvjTFlmrH0shVlrgioXgx2F
	ufy9oIt+ys7dLv2HxIvBnnaaok+LCrPFtecha7feGUaPdvzeQaAEkAvQvT5hIEty
	RadWc5bL132PwVea3frmoOyrBOncjE+fsJuyiedMkhtzchZTJnux7Ck8DQnrFAS3
	Z66FKmmSKLKNoXTxb9me3L8C1KNkKlT4lDWNXiDWLZSQ47kMj7QX67P5cr1YbZ9E
	AgECIw==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ffq6uwjj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Aug 2025 14:43:30 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57EEhUAf017863
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Aug 2025 14:43:30 GMT
Received: from [10.216.25.245] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 14 Aug
 2025 07:43:26 -0700
Message-ID: <3954667c-5b27-38b6-f6b9-1943b29d6594@quicinc.com>
Date: Thu, 14 Aug 2025 20:13:23 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 14/24] media: iris: Add support for
 ENUM_FRAMESIZES/FRAMEINTERVALS for encoder
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
 <20250813-iris-video-encoder-v2-14-c725ff673078@quicinc.com>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <20250813-iris-video-encoder-v2-14-c725ff673078@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA3NSBTYWx0ZWRfX22MQ7jlcmBa+
 SqMhLFiIFi9K1XFkUQrZ6SFg5iLLR1/CR0RUKvoHWIZyz+duBD3HyPXfRFtI/oQ5JW6Mzi2PnPi
 +Ils5FI98IEV2fh8t5LZRKmuvjZQREz+YA7111TZHYaSDYfWzwqKFdd5/K7oj6pnCKlDL4ok67p
 zpBukqK7TWN+pWr0M+66VpCjAomZk1gWHEg/DZ0C0qe/Yf194lSdTH61wgjx+59uMDOEfA1vExb
 g+mVd8Mgs52Q5cuBFnPHhXLptcgIzf4AEPRKTJYkyKt0WvPL9V4OWLzONS67f5qRxCddxm5r7xq
 Csn37hSYsmE9VI1AErtSoAhel7HJCzu3t8tdQbD5lQw7IR/zPnFkYeZHujS6e9Aa+fjKMGkFyzk
 85qkHuhV
X-Authority-Analysis: v=2.4 cv=TLZFS0la c=1 sm=1 tr=0 ts=689df612 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8
 a=6xPJ2PTebPPjTCxbr_sA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: -OtH-xD-lzE_FQ9zD_lIIXkK3Yqi-PBe
X-Proofpoint-ORIG-GUID: -OtH-xD-lzE_FQ9zD_lIIXkK3Yqi-PBe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 bulkscore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508110075


On 8/13/2025 3:08 PM, Dikshita Agarwal wrote:
> Add support for frame size and frame interval enumeration by
> implementing ENUM_FRAMESIZES/FRAMEINTERVALS V4L2 ioctls for encoder
> video device with necessary hooks.
> 
> This allows userspace application to query encoder capabilities and
> adapt encoding configurations accordingly.
> 
> Tested-by: Vikash Garodia <quic_vgarodia@quicinc.com> # X1E80100
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> ---
>  .../platform/qcom/iris/iris_platform_common.h      |  5 +-
>  .../media/platform/qcom/iris/iris_platform_gen2.c  |  3 ++
>  .../platform/qcom/iris/iris_platform_sm8250.c      |  1 +
>  drivers/media/platform/qcom/iris/iris_vdec.c       | 13 +++++
>  drivers/media/platform/qcom/iris/iris_vdec.h       |  1 +
>  drivers/media/platform/qcom/iris/iris_venc.c       | 13 +++++
>  drivers/media/platform/qcom/iris/iris_venc.h       |  1 +
>  drivers/media/platform/qcom/iris/iris_vidc.c       | 58 ++++++++++++++++++++--
>  8 files changed, 91 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index adafdce8a856f9c661aabc5ca28f0faceaa93551..792f46e2e34fd564a1ed61523f72826fc8f74582 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -21,7 +21,8 @@ struct iris_inst;
>  #define DEFAULT_MAX_HOST_BUF_COUNT		64
>  #define DEFAULT_MAX_HOST_BURST_BUF_COUNT	256
>  #define DEFAULT_FPS				30
> -#define NUM_MBS_8K				((8192 * 4352) / 256)
> +#define MAXIMUM_FPS				480
> +#define NUM_MBS_8K                             ((8192 * 4352) / 256)
>  
>  enum stage_type {
>  	STAGE_1 = 1,
> @@ -179,6 +180,8 @@ struct iris_platform_data {
>  	u32 max_session_count;
>  	/* max number of macroblocks per frame supported */
>  	u32 max_core_mbpf;
> +	/* max number of macroblocks per second supported */
> +	u32 max_core_mbps;
>  	const u32 *input_config_params_default;
>  	unsigned int input_config_params_default_size;
>  	const u32 *input_config_params_hevc;
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> index d3026b2bcb708c7ec31f134f628df7e57b54af4f..1e2fadfe17672029b46e07ce00a8e31e0711fd58 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> @@ -354,6 +354,7 @@ struct iris_platform_data sm8550_data = {
>  	.num_vpp_pipe = 4,
>  	.max_session_count = 16,
>  	.max_core_mbpf = NUM_MBS_8K * 2,
> +	.max_core_mbps = ((7680 * 4320) / 256) * 60,
>  	.input_config_params_default =
>  		sm8550_vdec_input_config_params_default,
>  	.input_config_params_default_size =
> @@ -429,6 +430,7 @@ struct iris_platform_data sm8650_data = {
>  	.num_vpp_pipe = 4,
>  	.max_session_count = 16,
>  	.max_core_mbpf = NUM_MBS_8K * 2,
> +	.max_core_mbps = ((7680 * 4320) / 256) * 60,
>  	.input_config_params_default =
>  		sm8550_vdec_input_config_params_default,
>  	.input_config_params_default_size =
> @@ -500,6 +502,7 @@ struct iris_platform_data qcs8300_data = {
>  	.num_vpp_pipe = 2,
>  	.max_session_count = 16,
>  	.max_core_mbpf = ((4096 * 2176) / 256) * 4,
> +	.max_core_mbps = ((7680 * 4320) / 256) * 60, //TODO confirm!!

TODO ? 4k@60 is supported mbps for qcs8300

>  	.input_config_params_default =
>  		sm8550_vdec_input_config_params_default,
>  	.input_config_params_default_size =
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c b/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
> index 8d0816a67ae0b6886204ce93fa5ccafaac10392a..2a3cbe1f2d4b27d3cce9e9cdad1525801d71a041 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
> @@ -128,6 +128,7 @@ struct iris_platform_data sm8250_data = {
>  	.num_vpp_pipe = 4,
>  	.max_session_count = 16,
>  	.max_core_mbpf = NUM_MBS_8K,
> +	.max_core_mbps = ((7680 * 4320) / 256) * 60,
>  	.input_config_params_default =
>  		sm8250_vdec_input_config_param_default,
>  	.input_config_params_default_size =
> diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
> index 3482ff3f18d2bcd592b7eb7d803bf98e29276ebb..6afbd2f89260a233d75d7a0cdf3647236216c9ec 100644
> --- a/drivers/media/platform/qcom/iris/iris_vdec.c
> +++ b/drivers/media/platform/qcom/iris/iris_vdec.c
> @@ -263,6 +263,19 @@ int iris_vdec_s_fmt(struct iris_inst *inst, struct v4l2_format *f)
>  	return 0;
>  }
>  
> +int iris_vdec_validate_format(struct iris_inst *inst, u32 pixelformat)
> +{
> +	const struct iris_fmt *fmt = NULL;
> +
> +	if (pixelformat != V4L2_PIX_FMT_NV12) {
> +		fmt = find_format(inst, pixelformat, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
> +		if (!fmt)
> +			return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
>  int iris_vdec_subscribe_event(struct iris_inst *inst, const struct v4l2_event_subscription *sub)
>  {
>  	int ret = 0;
> diff --git a/drivers/media/platform/qcom/iris/iris_vdec.h b/drivers/media/platform/qcom/iris/iris_vdec.h
> index b24932dc511a65017b1cadbcb984544475bd0723..097e02bfa72b5ac4e46e66c61842df1d9dd4565b 100644
> --- a/drivers/media/platform/qcom/iris/iris_vdec.h
> +++ b/drivers/media/platform/qcom/iris/iris_vdec.h
> @@ -13,6 +13,7 @@ void iris_vdec_inst_deinit(struct iris_inst *inst);
>  int iris_vdec_enum_fmt(struct iris_inst *inst, struct v4l2_fmtdesc *f);
>  int iris_vdec_try_fmt(struct iris_inst *inst, struct v4l2_format *f);
>  int iris_vdec_s_fmt(struct iris_inst *inst, struct v4l2_format *f);
> +int iris_vdec_validate_format(struct iris_inst *inst, u32 pixelformat);
>  int iris_vdec_subscribe_event(struct iris_inst *inst, const struct v4l2_event_subscription *sub);
>  void iris_vdec_src_change(struct iris_inst *inst);
>  int iris_vdec_streamon_input(struct iris_inst *inst);
> diff --git a/drivers/media/platform/qcom/iris/iris_venc.c b/drivers/media/platform/qcom/iris/iris_venc.c
> index 6bb59ce4fc565d3dcc6185233ef25d2e4d85cb3e..301206253090962abbb4e4eac8ee88e7b359c98d 100644
> --- a/drivers/media/platform/qcom/iris/iris_venc.c
> +++ b/drivers/media/platform/qcom/iris/iris_venc.c
> @@ -270,3 +270,16 @@ int iris_venc_s_fmt(struct iris_inst *inst, struct v4l2_format *f)
>  		return -EINVAL;
>  	}
>  }
> +
> +int iris_venc_validate_format(struct iris_inst *inst, u32 pixelformat)
> +{
> +	const struct iris_fmt *fmt = NULL;
> +
> +	if (pixelformat != V4L2_PIX_FMT_NV12) {
> +		fmt = find_format(inst, pixelformat, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
> +		if (!fmt)
> +			return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> diff --git a/drivers/media/platform/qcom/iris/iris_venc.h b/drivers/media/platform/qcom/iris/iris_venc.h
> index eb26a3ecbd98b3f02dfdea0dfc41bcd3a90904b6..04fd41275547c40c359c6ea04dfe4ee31d2d0df6 100644
> --- a/drivers/media/platform/qcom/iris/iris_venc.h
> +++ b/drivers/media/platform/qcom/iris/iris_venc.h
> @@ -13,5 +13,6 @@ void iris_venc_inst_deinit(struct iris_inst *inst);
>  int iris_venc_enum_fmt(struct iris_inst *inst, struct v4l2_fmtdesc *f);
>  int iris_venc_try_fmt(struct iris_inst *inst, struct v4l2_format *f);
>  int iris_venc_s_fmt(struct iris_inst *inst, struct v4l2_format *f);
> +int iris_venc_validate_format(struct iris_inst *inst, u32 pixelformat);
>  
>  #endif
> diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
> index 06b2737c5892ebbcf43b4cff66062d85cf805c20..cb1280c0c6c82187243f0bda4d98e42370ee787c 100644
> --- a/drivers/media/platform/qcom/iris/iris_vidc.c
> +++ b/drivers/media/platform/qcom/iris/iris_vidc.c
> @@ -373,13 +373,18 @@ static int iris_enum_framesizes(struct file *filp, void *fh,
>  {
>  	struct iris_inst *inst = iris_get_inst(filp, NULL);
>  	struct platform_inst_caps *caps;
> +	int ret = 0;
>  
>  	if (fsize->index)
>  		return -EINVAL;
>  
> -	if (fsize->pixel_format != V4L2_PIX_FMT_H264 &&
> -	    fsize->pixel_format != V4L2_PIX_FMT_NV12)
> -		return -EINVAL;
> +	if (inst->domain == DECODER)
> +		ret = iris_vdec_validate_format(inst, fsize->pixel_format);
> +	else
> +		ret = iris_venc_validate_format(inst, fsize->pixel_format);
> +
> +	if (ret)
> +		return ret;
>  
>  	caps = inst->core->iris_platform_data->inst_caps;
>  
> @@ -391,6 +396,51 @@ static int iris_enum_framesizes(struct file *filp, void *fh,
>  	fsize->stepwise.max_height = caps->max_frame_height;
>  	fsize->stepwise.step_height = STEP_HEIGHT;
>  
> +	return ret;
> +}
> +
> +static int iris_enum_frameintervals(struct file *filp, void *fh,
> +				    struct v4l2_frmivalenum *fival)
> +
> +{
> +	struct iris_inst *inst = iris_get_inst(filp, NULL);
> +	struct platform_inst_caps *caps;
> +	struct iris_core *core = inst->core;
> +	u32 fps, mbpf;
> +	int ret = 0;
> +
> +	if (inst->domain == DECODER)
> +		return -ENOTTY;
> +
> +	if (fival->index)
> +		return -EINVAL;
> +
> +	ret = iris_venc_validate_format(inst, fival->pixel_format);
> +	if (ret)
> +		return ret;
> +
> +	if (!fival->width || !fival->height)
> +		return -EINVAL;
> +
> +	caps = inst->core->iris_platform_data->inst_caps;
> +	if (fival->width > caps->max_frame_width ||
> +	    fival->width < caps->min_frame_width ||
> +	    fival->height > caps->max_frame_height ||
> +	    fival->height < caps->min_frame_height)
> +		return -EINVAL;
> +
> +	mbpf = NUM_MBS_PER_FRAME(fival->height, fival->width);
> +	fps = DIV_ROUND_UP(core->iris_platform_data->max_core_mbps, mbpf);
> +
> +	fival->type = V4L2_FRMIVAL_TYPE_STEPWISE;
> +	fival->stepwise.min.numerator = 1;
> +	fival->stepwise.min.denominator =
> +			min_t(u32, fps, MAXIMUM_FPS);
> +	fival->stepwise.max.numerator = 1;
> +	fival->stepwise.max.denominator = 1;
> +	fival->stepwise.step.numerator = 1;
> +	fival->stepwise.step.denominator = MAXIMUM_FPS;
> +
>  	return 0;
>  }
>  
> @@ -525,6 +575,8 @@ static const struct v4l2_ioctl_ops iris_v4l2_ioctl_ops_enc = {
>  	.vidioc_s_fmt_vid_out_mplane    = iris_s_fmt_vid_mplane,
>  	.vidioc_g_fmt_vid_cap_mplane    = iris_g_fmt_vid_mplane,
>  	.vidioc_g_fmt_vid_out_mplane    = iris_g_fmt_vid_mplane,
> +	.vidioc_enum_framesizes         = iris_enum_framesizes,
> +	.vidioc_enum_frameintervals     = iris_enum_frameintervals,
>  };
>  
>  void iris_init_ops(struct iris_core *core)
> 

