Return-Path: <linux-media+bounces-40858-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F9ECB33612
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 07:56:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 53AF117C8DB
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 05:56:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 366982798FB;
	Mon, 25 Aug 2025 05:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="A7enoq0m"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB4BC23185D;
	Mon, 25 Aug 2025 05:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756101387; cv=none; b=GX88DA3cFr90ZC7mrNKmKZ1Sh+je3RgeXRQh+efAlVCFvH+iEW3ItngFZ9QlLyObBdR93qH7Iu2Ix2mfSpWXUuJura35nVefE7dS+ESIX5pHbZ7qRkGJcGwsRhcs7kCnFTwW5rKW/UWn0b3sDocl2VALUQ3GPUQ9Ng+CFTYG3Z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756101387; c=relaxed/simple;
	bh=5EEmI1TG6FyQUUi2UbK0+jBLgU5TRw+MZ4nSFcyzxQo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=bbBocbiAHi973xN2SDRWXPUh6bZdgv9C6+A9HViMWzetrHVCrsUxpaGfznV71J7ILAyxlzJUpUNOEwRzRJW7ascgiiLmbU0lGHLCk8piPDMfMKul8fvc35g9WpPrqRjnoRILxDS7RNvCDGEkse/We6XxIv0u7wSTmwEXgfRRatQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=A7enoq0m; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57OMQ2Pb006732;
	Mon, 25 Aug 2025 05:56:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3N9qfJdQmxIc1Tygu59J40TMJlYBhOyfKdjk4BZ+NSk=; b=A7enoq0mULzBVAsC
	gGgjOGm6eJkd7108KB48z+VpqZNKLVcBuzqK+TcS0qLpmfCe+3+yJV8LMRz9KBDa
	o3swBLJV5n7mxXV0uuQZs345BcmI1xKuTASRHqRspH3a2wxDRKikieurZxe1d5+9
	7djVuDTTn1loOtlFXRFzwhIOPjHPJXb22nmhA88koSXNlkAe/1MuCelXEdHJzgHV
	bYquou/mNmQXZW33JTn2pV75kNW3zc363enhtgfXIoWsRtrty1/RSh/DyqcAhFml
	hdxeDspD31hxgJMhhZMUCcx0kM3y7XbE1LExyNHQfb9Y8Fbo2JkiVBTOZBPAXf/Y
	R6WeoA==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5um3xnr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Aug 2025 05:56:18 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57P5uIAO023682
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Aug 2025 05:56:18 GMT
Received: from [10.204.100.211] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Sun, 24 Aug
 2025 22:56:14 -0700
Message-ID: <bcfaab52-287a-7050-a26f-ab17d87c8cbb@quicinc.com>
Date: Mon, 25 Aug 2025 11:26:10 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v3 20/26] media: iris: Add support for G/S_PARM for
 encoder video device
Content-Language: en-US
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Abhinav Kumar
	<abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stefan Schmidt
	<stefan.schmidt@linaro.org>,
        Vedang Nagar <quic_vnagar@quicinc.com>,
        "Hans
 Verkuil" <hverkuil@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Renjiang Han <quic_renjiang@quicinc.com>,
        Wangao Wang <quic_wangaow@quicinc.com>
References: <20250820-iris-video-encoder-v3-0-80ab0ba58b3d@quicinc.com>
 <20250820-iris-video-encoder-v3-20-80ab0ba58b3d@quicinc.com>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <20250820-iris-video-encoder-v3-20-80ab0ba58b3d@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=VtIjA/2n c=1 sm=1 tr=0 ts=68abfb02 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8
 a=PiNe8JWR4gsEzIZyr0wA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMiBTYWx0ZWRfX0Qofe/8ypARl
 mclYL2wQRmkmoTv/ieTQ0LPLEHDDuxFy0daAxbNElf7lY2aj6XH97ENPUKUcGnLFtKKvDufcVXk
 HZNZp1Sh1Uor7NPESb3ANoQKe2bjRKFfQrSeS6Ow++2clKU/Tu/eiNfTH/AG0h9DXONJyYXWZRx
 lwE3/kd3Cis0BNsMz6qP7ANTj/CGnClP80AkT0UwdWT7b7g89fFsh9+WFIzP4ILAObLVeA2B/64
 DQNrYxD7L2Oi7Ekq6KRoouIcGgw9x/Nh6fxFBgfF9C+0fdCrokvrZouvZfPKyO5em41eiQ5B2Zy
 0VI+piyPWytSCVPTAZ0kE/DTzOsTnRXwLieY7joavjrL/p7fYz5UlEPqRQ+Rx1XfdpjWXL3Fari
 j/77rgui
X-Proofpoint-GUID: eH3i56-_F0npG3Nb22uDSp59Fj1aADNs
X-Proofpoint-ORIG-GUID: eH3i56-_F0npG3Nb22uDSp59Fj1aADNs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_03,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 adultscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508230032


On 8/20/2025 2:37 PM, Dikshita Agarwal wrote:
> Add supports for the G/S_PARM V4L2 ioctls for encoder video device with
> necessary hooks. This allows userspace to query the current streaming
> parameters such as frame intervals and set desired streaming parameters
> primarily the frame rate.
> 
> Tested-by: Vikash Garodia <quic_vgarodia@quicinc.com> # X1E80100
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> ---
>  drivers/media/platform/qcom/iris/iris_instance.h   |  5 ++
>  .../platform/qcom/iris/iris_platform_common.h      |  2 +
>  .../media/platform/qcom/iris/iris_platform_gen2.c  |  2 +
>  .../platform/qcom/iris/iris_platform_qcs8300.h     |  2 +
>  .../platform/qcom/iris/iris_platform_sm8250.c      |  2 +
>  drivers/media/platform/qcom/iris/iris_utils.c      | 36 +++++++++
>  drivers/media/platform/qcom/iris/iris_utils.h      |  2 +
>  drivers/media/platform/qcom/iris/iris_vb2.c        | 17 ----
>  drivers/media/platform/qcom/iris/iris_venc.c       | 94 ++++++++++++++++++++++
>  drivers/media/platform/qcom/iris/iris_venc.h       |  2 +
>  drivers/media/platform/qcom/iris/iris_vidc.c       | 30 +++++++
>  11 files changed, 177 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_instance.h b/drivers/media/platform/qcom/iris/iris_instance.h
> index 55cf9702111829ef24189986ba5245c7684bfe11..b75549718df3c87cd85aecfc74c873c60cd4bde5 100644
> --- a/drivers/media/platform/qcom/iris/iris_instance.h
> +++ b/drivers/media/platform/qcom/iris/iris_instance.h
> @@ -61,6 +61,9 @@ struct iris_fmt {
>   * @metadata_idx: index for metadata buffer
>   * @codec: codec type
>   * @last_buffer_dequeued: a flag to indicate that last buffer is sent by driver
> + * @frame_rate: frame rate of current instance
> + * @operating_rate: operating rate of current instance
> +
>   */
>  
>  struct iris_inst {
> @@ -96,6 +99,8 @@ struct iris_inst {
>  	u32				metadata_idx;
>  	u32				codec;
>  	bool				last_buffer_dequeued;
> +	u32				frame_rate;
> +	u32				operating_rate;
>  };
>  
>  #endif
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index 792f46e2e34fd564a1ed61523f72826fc8f74582..d0b84c93aef409b51a767ba11f91c6ce2533f27f 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -79,6 +79,8 @@ struct platform_inst_caps {
>  	u32 mb_cycles_fw;
>  	u32 mb_cycles_fw_vpp;
>  	u32 num_comv;
> +	u32 max_frame_rate;
> +	u32 max_operating_rate;
>  };
>  
>  enum platform_inst_fw_cap_type {
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> index d5f7eb904569d4e3ae9c33e1436c8151cac5355d..a245fce04b3a901cf2eb06fb35c15c0176199c11 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> @@ -209,6 +209,8 @@ static struct platform_inst_caps platform_inst_cap_sm8550 = {
>  	.mb_cycles_fw = 489583,
>  	.mb_cycles_fw_vpp = 66234,
>  	.num_comv = 0,
> +	.max_frame_rate = MAXIMUM_FPS,
> +	.max_operating_rate = MAXIMUM_FPS,
>  };
>  
>  static void iris_set_sm8550_preset_registers(struct iris_core *core)
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_qcs8300.h b/drivers/media/platform/qcom/iris/iris_platform_qcs8300.h
> index a8d66ed388a34e6bb45d4a089d981bb7d135fb50..64331b705fca541e0547afc01ec108759529c9d8 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_qcs8300.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_qcs8300.h
> @@ -197,4 +197,6 @@ static struct platform_inst_caps platform_inst_cap_qcs8300 = {
>  	.mb_cycles_fw = 326389,
>  	.mb_cycles_fw_vpp = 44156,
>  	.num_comv = 0,
> +	.max_frame_rate = MAXIMUM_FPS,
> +	.max_operating_rate = MAXIMUM_FPS,
>  };
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c b/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
> index 2a3cbe1f2d4b27d3cce9e9cdad1525801d71a041..4ff72109c6001cc47d746d366f458c0ff0a8924a 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
> @@ -40,6 +40,8 @@ static struct platform_inst_caps platform_inst_cap_sm8250 = {
>  	.max_mbpf = 138240,
>  	.mb_cycles_vsp = 25,
>  	.mb_cycles_vpp = 200,
> +	.max_frame_rate = MAXIMUM_FPS,
> +	.max_operating_rate = MAXIMUM_FPS,
>  };
>  
>  static void iris_set_sm8250_preset_registers(struct iris_core *core)
> diff --git a/drivers/media/platform/qcom/iris/iris_utils.c b/drivers/media/platform/qcom/iris/iris_utils.c
> index 83c70d6a2d9092615dcf1b7d0fc85110f0df1aa0..85c70a62b1fd2c409fc18b28f64771cb0097a7fd 100644
> --- a/drivers/media/platform/qcom/iris/iris_utils.c
> +++ b/drivers/media/platform/qcom/iris/iris_utils.c
> @@ -88,3 +88,39 @@ struct iris_inst *iris_get_instance(struct iris_core *core, u32 session_id)
>  	mutex_unlock(&core->lock);
>  	return NULL;
>  }
> +
> +int iris_check_core_mbpf(struct iris_inst *inst)
> +{
> +	struct iris_core *core = inst->core;
> +	struct iris_inst *instance;
> +	u32 total_mbpf = 0;
> +
> +	mutex_lock(&core->lock);
> +	list_for_each_entry(instance, &core->instances, list)
> +		total_mbpf += iris_get_mbpf(instance);
> +	mutex_unlock(&core->lock);
> +
> +	if (total_mbpf > core->iris_platform_data->max_core_mbpf)
> +		return -ENOMEM;
> +
> +	return 0;
> +}
> +
> +int iris_check_core_mbps(struct iris_inst *inst)
> +{
> +	struct iris_core *core = inst->core;
> +	struct iris_inst *instance;
> +	u32 total_mbps = 0, fps = 0;
> +
> +	mutex_lock(&core->lock);
> +	list_for_each_entry(instance, &core->instances, list) {
> +		fps = max(instance->frame_rate, instance->operating_rate);
> +		total_mbps += iris_get_mbpf(instance) * fps;
> +	}
> +	mutex_unlock(&core->lock);
> +
> +	if (total_mbps > core->iris_platform_data->max_core_mbps)
> +		return -ENOMEM;
> +
> +	return 0;
> +}
> diff --git a/drivers/media/platform/qcom/iris/iris_utils.h b/drivers/media/platform/qcom/iris/iris_utils.h
> index 49869cf7a376880a026f44ff3883a6b13c6fcfbb..75740181122f5bdf93d64d3f43b3a26a9fe97919 100644
> --- a/drivers/media/platform/qcom/iris/iris_utils.h
> +++ b/drivers/media/platform/qcom/iris/iris_utils.h
> @@ -49,5 +49,7 @@ struct iris_inst *iris_get_instance(struct iris_core *core, u32 session_id);
>  void iris_helper_buffers_done(struct iris_inst *inst, unsigned int type,
>  			      enum vb2_buffer_state state);
>  int iris_wait_for_session_response(struct iris_inst *inst, bool is_flush);
> +int iris_check_core_mbpf(struct iris_inst *inst);
> +int iris_check_core_mbps(struct iris_inst *inst);
>  
>  #endif
> diff --git a/drivers/media/platform/qcom/iris/iris_vb2.c b/drivers/media/platform/qcom/iris/iris_vb2.c
> index e62ed7a57df2debf0a930ad8307e6d945f589922..e32f7e1f007228a3b2b51cd76cd193d852f16080 100644
> --- a/drivers/media/platform/qcom/iris/iris_vb2.c
> +++ b/drivers/media/platform/qcom/iris/iris_vb2.c
> @@ -12,23 +12,6 @@
>  #include "iris_vdec.h"
>  #include "iris_power.h"
>  
> -static int iris_check_core_mbpf(struct iris_inst *inst)
> -{
> -	struct iris_core *core = inst->core;
> -	struct iris_inst *instance;
> -	u32 total_mbpf = 0;
> -
> -	mutex_lock(&core->lock);
> -	list_for_each_entry(instance, &core->instances, list)
> -		total_mbpf += iris_get_mbpf(instance);
> -	mutex_unlock(&core->lock);
> -
> -	if (total_mbpf > core->iris_platform_data->max_core_mbpf)
> -		return -ENOMEM;
> -
> -	return 0;
> -}
> -
>  static int iris_check_inst_mbpf(struct iris_inst *inst)
>  {
>  	struct platform_inst_caps *caps;
> diff --git a/drivers/media/platform/qcom/iris/iris_venc.c b/drivers/media/platform/qcom/iris/iris_venc.c
> index 71960a0e903d114be7a9e797089c3dee2fab2545..967db02ed27f31498e0f5c3245a37473022f4be5 100644
> --- a/drivers/media/platform/qcom/iris/iris_venc.c
> +++ b/drivers/media/platform/qcom/iris/iris_venc.c
> @@ -61,6 +61,9 @@ int iris_venc_inst_init(struct iris_inst *inst)
>  	inst->crop.width = f->fmt.pix_mp.width;
>  	inst->crop.height = f->fmt.pix_mp.height;
>  
> +	inst->operating_rate = DEFAULT_FPS;
> +	inst->frame_rate = DEFAULT_FPS;
> +
>  	return 0;
>  }
>  
> @@ -326,3 +329,94 @@ int iris_venc_s_selection(struct iris_inst *inst, struct v4l2_selection *s)
>  		return -EINVAL;
>  	}
>  }
> +
> +int iris_venc_s_param(struct iris_inst *inst, struct v4l2_streamparm *s_parm)
> +{
> +	struct platform_inst_caps *caps = inst->core->iris_platform_data->inst_caps;
> +	struct vb2_queue *src_q = v4l2_m2m_get_src_vq(inst->m2m_ctx);
> +	struct vb2_queue *dst_q = v4l2_m2m_get_dst_vq(inst->m2m_ctx);
> +	struct v4l2_fract *timeperframe = NULL;
> +	u32 default_rate = DEFAULT_FPS;
> +	bool is_frame_rate = false;
> +	u64 us_per_frame, fps;
> +	u32 max_rate;
> +
> +	int ret = 0;
> +
> +	if (s_parm->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
> +		timeperframe = &s_parm->parm.output.timeperframe;
> +		max_rate = caps->max_operating_rate;
> +		s_parm->parm.output.capability = V4L2_CAP_TIMEPERFRAME;
> +	} else {
> +		timeperframe = &s_parm->parm.capture.timeperframe;
> +		is_frame_rate = true;
> +		max_rate = caps->max_frame_rate;
> +		s_parm->parm.capture.capability = V4L2_CAP_TIMEPERFRAME;
> +	}
> +
> +	if (!timeperframe->denominator || !timeperframe->numerator) {
> +		if (!timeperframe->numerator)
> +			timeperframe->numerator = 1;
> +		if (!timeperframe->denominator)
> +			timeperframe->denominator = default_rate;
> +	}
> +
> +	us_per_frame = timeperframe->numerator * (u64)USEC_PER_SEC;
> +	do_div(us_per_frame, timeperframe->denominator);
> +
> +	if (!us_per_frame)
> +		return -EINVAL;
> +
> +	fps = (u64)USEC_PER_SEC;
> +	do_div(fps, us_per_frame);
> +	if (fps > max_rate) {
> +		ret = -ENOMEM;
> +		goto reset_rate;
> +	}
> +
> +	if (is_frame_rate)
> +		inst->frame_rate = (u32)fps;
> +	else
> +		inst->operating_rate = (u32)fps;
> +
> +	if ((s_parm->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE && vb2_is_streaming(src_q)) ||
> +	    (s_parm->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE && vb2_is_streaming(dst_q))) {
> +		ret = iris_check_core_mbpf(inst);
> +		if (ret)
> +			goto reset_rate;
> +		ret = iris_check_core_mbps(inst);
> +		if (ret)
> +			goto reset_rate;
> +	}
> +
> +	return 0;
> +
> +reset_rate:
> +	if (ret) {
> +		if (is_frame_rate)
> +			inst->frame_rate = default_rate;
> +		else
> +			inst->operating_rate = default_rate;
> +	}
> +
> +	return ret;
> +}
> +
> +int iris_venc_g_param(struct iris_inst *inst, struct v4l2_streamparm *s_parm)
> +{
> +	struct v4l2_fract *timeperframe = NULL;
> +
> +	if (s_parm->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
> +		timeperframe = &s_parm->parm.output.timeperframe;
> +		timeperframe->numerator = 1;
> +		timeperframe->denominator = inst->operating_rate;
> +		s_parm->parm.output.capability = V4L2_CAP_TIMEPERFRAME;
> +	} else {
> +		timeperframe = &s_parm->parm.capture.timeperframe;
> +		timeperframe->numerator = 1;
> +		timeperframe->denominator = inst->frame_rate;
> +		s_parm->parm.capture.capability = V4L2_CAP_TIMEPERFRAME;
> +	}
> +
> +	return 0;
> +}
> diff --git a/drivers/media/platform/qcom/iris/iris_venc.h b/drivers/media/platform/qcom/iris/iris_venc.h
> index 72c6e25d87113baa6d2219ae478b7d7df1aed7bf..0d566b7fc89b96b8fbc62a35b2ba795ca0bcf460 100644
> --- a/drivers/media/platform/qcom/iris/iris_venc.h
> +++ b/drivers/media/platform/qcom/iris/iris_venc.h
> @@ -16,5 +16,7 @@ int iris_venc_s_fmt(struct iris_inst *inst, struct v4l2_format *f);
>  int iris_venc_validate_format(struct iris_inst *inst, u32 pixelformat);
>  int iris_venc_subscribe_event(struct iris_inst *inst, const struct v4l2_event_subscription *sub);
>  int iris_venc_s_selection(struct iris_inst *inst, struct v4l2_selection *s);
> +int iris_venc_g_param(struct iris_inst *inst, struct v4l2_streamparm *s_parm);
> +int iris_venc_s_param(struct iris_inst *inst, struct v4l2_streamparm *s_parm);
>  
>  #endif
> diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
> index b134ae710d9e1d02bc52db2e9356fdc4f668a387..6e3bd02afe44534a8f36cc22d9c8cda4a53a05cd 100644
> --- a/drivers/media/platform/qcom/iris/iris_vidc.c
> +++ b/drivers/media/platform/qcom/iris/iris_vidc.c
> @@ -530,6 +530,34 @@ static int iris_subscribe_event(struct v4l2_fh *fh, const struct v4l2_event_subs
>  	return -EINVAL;
>  }
>  
> +static int iris_s_parm(struct file *filp, void *fh, struct v4l2_streamparm *a)
> +{
> +	struct iris_inst *inst = container_of(fh, struct iris_inst, fh);
> +
> +	if (a->type != V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE &&
> +	    a->type != V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
> +		return -EINVAL;
> +
> +	if (inst->domain == ENCODER)
> +		return iris_venc_s_param(inst, a);
> +	else
> +		return -EINVAL;
> +}
> +
> +static int iris_g_parm(struct file *filp, void *fh, struct v4l2_streamparm *a)
> +{
> +	struct iris_inst *inst = container_of(fh, struct iris_inst, fh);
> +
> +	if (a->type != V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE &&
> +	    a->type != V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
> +		return -EINVAL;
> +
> +	if (inst->domain == ENCODER)
> +		return iris_venc_g_param(inst, a);
> +	else
> +		return -EINVAL;
> +}
> +
>  static int iris_dec_cmd(struct file *filp, void *fh,
>  			struct v4l2_decoder_cmd *dec)
>  {
> @@ -626,6 +654,8 @@ static const struct v4l2_ioctl_ops iris_v4l2_ioctl_ops_enc = {
>  	.vidioc_unsubscribe_event       = v4l2_event_unsubscribe,
>  	.vidioc_g_selection             = iris_g_selection,
>  	.vidioc_s_selection             = iris_s_selection,
> +	.vidioc_s_parm                  = iris_s_parm,
> +	.vidioc_g_parm                  = iris_g_parm,
>  };
>  
>  void iris_init_ops(struct iris_core *core)
> 

Reviewed-by: Vikash Garodia <quic_vgarodia@quicinc.com>

