Return-Path: <linux-media+bounces-40091-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A2983B29ACF
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 09:30:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7139E3B3A52
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 07:30:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86E2927A133;
	Mon, 18 Aug 2025 07:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="H+F9JeHG"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E215A279DBA;
	Mon, 18 Aug 2025 07:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755502197; cv=none; b=XYIw8tW1B5n2fDpTei7PNICc7B12p2CUhZfrgifFZMMLoyzhtxPLqXJmJmFD7eKd2wB0ppbRWXs237VskIT3JNtVr/SRtfVYHoacGKGi24vqRIBS8F2i00If8q4T9wL0CRSeDDm7EQezGuYpC3kbh04kZyNi4zwQ2GMHw7qE0xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755502197; c=relaxed/simple;
	bh=wJFS4S/TOR29gkl2awyWaaQTuGdRlcKyf8EI+FLlivU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=hT5YmDVmiWMVrwKY7Ndk7DuI2nYAAwoRfnLRmGI2XdgBjkjSrZaQFyoeOeRcM1FgRHz4YpOLAa9t4234dXQARZczH1qqzrX/DqdTuGycUAwnbTCBp+0tZS/lT+NnaU95BewtROBwALxhHf7ob2o7Lk7x+sRWq2k/l0R++eEPoXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=H+F9JeHG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57HLRpst026183;
	Mon, 18 Aug 2025 07:29:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LUgDCCkLJ162afkuuWts48UDmR6F1bbCtyL4Yg5oMn4=; b=H+F9JeHG5EKiut32
	j3we+5Z3/lEl2lGFKJAEwCELQK9ySOHdvOA3os8rF/M/f9Mfy7qn/imNbJpjI/t/
	rTws1sCkk2u791q2FC4lUf8qP5+j951ZCtY0LkzfOQPLgggBcAWryinbqZpYbzi7
	403EyMBYr2nO9dxrV3S0fA6YDUWw4oUtu0RYr3vxKE+Q+Y86d6Os1OC5cB6XHPSk
	zZ90kklwrq76Dq/kCphe4cRMhKXtOqmuVyMj3n6/FYZ85GTJKsGZWuZFdgCOOmrw
	eSdHnEAwQH7Z+aeC4S7xkEcv6u9jc/6mao3/kub7FVOLkD5tnUhD0b0DUkCg8uTR
	taMidg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jk5mbn45-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Aug 2025 07:29:48 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57I7TmY3025881
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Aug 2025 07:29:48 GMT
Received: from [10.206.107.210] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Mon, 18 Aug
 2025 00:29:43 -0700
Message-ID: <307aabe2-cfef-8660-02b3-1892b61d5dc3@quicinc.com>
Date: Mon, 18 Aug 2025 12:59:40 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 18/24] media: iris: Add support for G/S_PARM for
 encoder video device
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
 <20250813-iris-video-encoder-v2-18-c725ff673078@quicinc.com>
 <0bf7716e-38db-b101-408e-7bf293fe7593@quicinc.com>
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
In-Reply-To: <0bf7716e-38db-b101-408e-7bf293fe7593@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=Sdn3duRu c=1 sm=1 tr=0 ts=68a2d66c cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8
 a=ELNb0ozSVsX_xPt1p1cA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: PqdtI6TEpPKglMKQMjQXe-y-Dl-949QT
X-Proofpoint-GUID: PqdtI6TEpPKglMKQMjQXe-y-Dl-949QT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDA0MiBTYWx0ZWRfX+NXRE076+0L8
 Tx6hrCkofXZ7RhfVmH/MaBVo3F1FXYZoyi8MOOPp1q0qeoLllXvSBsIe9z184V16VjXRgGc1llE
 GJEbPY54sda5ymUwRCoqZNJp/r+1PgJHUpaMKhwXP/qmyEHj4/MDCsGaUxRdcfmsXEtQvNB1s0P
 OBhS0SrTmLk+yPXbxorsJ5ijEoGYa4XIhkDtRLesF2j7kpWZ38stPSJa9Um4cyeGrqW3Ol7Jzea
 iWd6dkWUZsoNZK/6/CR1k3TlDx4qJV2m48pO6zrr7UFjtqB3J+seNGNm/ZC1sm88fXv5y/C+gDM
 GdCF54cD6DPXDtKvuXaP0E+YTLFvlmiBHTNmr797tMdQmX1e6jqnt9+K5Te27DIuCm3/5/l4h20
 iaO/QSw4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-18_03,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 spamscore=0
 adultscore=0 malwarescore=0 bulkscore=0 phishscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508160042



On 8/14/2025 8:31 PM, Vikash Garodia wrote:
> 
> 
> On 8/13/2025 3:08 PM, Dikshita Agarwal wrote:
>> Add supports for the G/S_PARM V4L2 ioctls for encoder video device with
>> necessary hooks. This allows userspace to query the current streaming
>> parameters such as frame intervals and set desired streaming parameters
>> primarily the frame rate.
>>
>> Tested-by: Vikash Garodia <quic_vgarodia@quicinc.com> # X1E80100
>> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
>> ---
>>  drivers/media/platform/qcom/iris/iris_instance.h   |  5 ++
>>  .../platform/qcom/iris/iris_platform_common.h      |  2 +
>>  .../media/platform/qcom/iris/iris_platform_gen2.c  |  4 +-
>>  .../platform/qcom/iris/iris_platform_qcs8300.h     |  2 +
>>  .../platform/qcom/iris/iris_platform_sm8250.c      |  2 +
>>  drivers/media/platform/qcom/iris/iris_utils.c      | 36 ++++++++
>>  drivers/media/platform/qcom/iris/iris_utils.h      |  2 +
>>  drivers/media/platform/qcom/iris/iris_vb2.c        | 17 ----
>>  drivers/media/platform/qcom/iris/iris_venc.c       | 95 ++++++++++++++++++++++
>>  drivers/media/platform/qcom/iris/iris_venc.h       |  2 +
>>  drivers/media/platform/qcom/iris/iris_vidc.c       | 30 +++++++
>>  11 files changed, 179 insertions(+), 18 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/iris/iris_instance.h b/drivers/media/platform/qcom/iris/iris_instance.h
>> index 55cf9702111829ef24189986ba5245c7684bfe11..b75549718df3c87cd85aecfc74c873c60cd4bde5 100644
>> --- a/drivers/media/platform/qcom/iris/iris_instance.h
>> +++ b/drivers/media/platform/qcom/iris/iris_instance.h
>> @@ -61,6 +61,9 @@ struct iris_fmt {
>>   * @metadata_idx: index for metadata buffer
>>   * @codec: codec type
>>   * @last_buffer_dequeued: a flag to indicate that last buffer is sent by driver
>> + * @frame_rate: frame rate of current instance
>> + * @operating_rate: operating rate of current instance
>> +
>>   */
>>  
>>  struct iris_inst {
>> @@ -96,6 +99,8 @@ struct iris_inst {
>>  	u32				metadata_idx;
>>  	u32				codec;
>>  	bool				last_buffer_dequeued;
>> +	u32				frame_rate;
>> +	u32				operating_rate;
>>  };
>>  
>>  #endif
>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
>> index 792f46e2e34fd564a1ed61523f72826fc8f74582..d0b84c93aef409b51a767ba11f91c6ce2533f27f 100644
>> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
>> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
>> @@ -79,6 +79,8 @@ struct platform_inst_caps {
>>  	u32 mb_cycles_fw;
>>  	u32 mb_cycles_fw_vpp;
>>  	u32 num_comv;
>> +	u32 max_frame_rate;
>> +	u32 max_operating_rate;
>>  };
>>  
>>  enum platform_inst_fw_cap_type {
>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
>> index 1e2fadfe17672029b46e07ce00a8e31e0711fd58..e047fb75a99a6372dac4ad029baea16034cac633 100644
>> --- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
>> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
>> @@ -209,6 +209,8 @@ static struct platform_inst_caps platform_inst_cap_sm8550 = {
>>  	.mb_cycles_fw = 489583,
>>  	.mb_cycles_fw_vpp = 66234,
>>  	.num_comv = 0,
>> +	.max_frame_rate = MAXIMUM_FPS << 16,
>> +	.max_operating_rate = MAXIMUM_FPS << 16,
>>  };
>>  
>>  static void iris_set_sm8550_preset_registers(struct iris_core *core)
>> @@ -502,7 +504,7 @@ struct iris_platform_data qcs8300_data = {
>>  	.num_vpp_pipe = 2,
>>  	.max_session_count = 16,
>>  	.max_core_mbpf = ((4096 * 2176) / 256) * 4,
>> -	.max_core_mbps = ((7680 * 4320) / 256) * 60, //TODO confirm!!
>> +	.max_core_mbps = (((3840 * 2176) / 256) * 120),
>>  	.input_config_params_default =
>>  		sm8550_vdec_input_config_params_default,
>>  	.input_config_params_default_size =
>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_qcs8300.h b/drivers/media/platform/qcom/iris/iris_platform_qcs8300.h
>> index a8d66ed388a34e6bb45d4a089d981bb7d135fb50..22e485b0b2ae8f110d2f3b817e202d1aa7d227fd 100644
>> --- a/drivers/media/platform/qcom/iris/iris_platform_qcs8300.h
>> +++ b/drivers/media/platform/qcom/iris/iris_platform_qcs8300.h
>> @@ -197,4 +197,6 @@ static struct platform_inst_caps platform_inst_cap_qcs8300 = {
>>  	.mb_cycles_fw = 326389,
>>  	.mb_cycles_fw_vpp = 44156,
>>  	.num_comv = 0,
>> +	.max_frame_rate = MAXIMUM_FPS << 16,
>> +	.max_operating_rate = MAXIMUM_FPS << 16,
>>  };
>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c b/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
>> index 2a3cbe1f2d4b27d3cce9e9cdad1525801d71a041..5d59a5a3172a510b3a38f7c9c29dffd919fafce7 100644
>> --- a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
>> +++ b/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
>> @@ -40,6 +40,8 @@ static struct platform_inst_caps platform_inst_cap_sm8250 = {
>>  	.max_mbpf = 138240,
>>  	.mb_cycles_vsp = 25,
>>  	.mb_cycles_vpp = 200,
>> +	.max_frame_rate = MAXIMUM_FPS << 16,
>> +	.max_operating_rate = MAXIMUM_FPS << 16,
>>  };
>>  
>>  static void iris_set_sm8250_preset_registers(struct iris_core *core)
>> diff --git a/drivers/media/platform/qcom/iris/iris_utils.c b/drivers/media/platform/qcom/iris/iris_utils.c
>> index 83c70d6a2d9092615dcf1b7d0fc85110f0df1aa0..f0af926879d5d90c56222aa8d48998a34be1c636 100644
>> --- a/drivers/media/platform/qcom/iris/iris_utils.c
>> +++ b/drivers/media/platform/qcom/iris/iris_utils.c
>> @@ -88,3 +88,39 @@ struct iris_inst *iris_get_instance(struct iris_core *core, u32 session_id)
>>  	mutex_unlock(&core->lock);
>>  	return NULL;
>>  }
>> +
>> +int iris_check_core_mbpf(struct iris_inst *inst)
>> +{
>> +	struct iris_core *core = inst->core;
>> +	struct iris_inst *instance;
>> +	u32 total_mbpf = 0;
>> +
>> +	mutex_lock(&core->lock);
>> +	list_for_each_entry(instance, &core->instances, list)
>> +		total_mbpf += iris_get_mbpf(instance);
>> +	mutex_unlock(&core->lock);
>> +
>> +	if (total_mbpf > core->iris_platform_data->max_core_mbpf)
>> +		return -ENOMEM;
>> +
>> +	return 0;
>> +}
>> +
>> +int iris_check_core_mbps(struct iris_inst *inst)
>> +{
>> +	struct iris_core *core = inst->core;
>> +	struct iris_inst *instance;
>> +	u32 total_mbps = 0, fps = 0;
>> +
>> +	mutex_lock(&core->lock);
>> +	list_for_each_entry(instance, &core->instances, list) {
>> +		fps = max(instance->frame_rate >> 16, instance->operating_rate >> 16);
>> +		total_mbps += iris_get_mbpf(instance) * fps;
>> +	}
>> +	mutex_unlock(&core->lock);
>> +
>> +	if (total_mbps > core->iris_platform_data->max_core_mbps)
>> +		return -ENOMEM;
>> +
>> +	return 0;
>> +}
>> diff --git a/drivers/media/platform/qcom/iris/iris_utils.h b/drivers/media/platform/qcom/iris/iris_utils.h
>> index 49869cf7a376880a026f44ff3883a6b13c6fcfbb..75740181122f5bdf93d64d3f43b3a26a9fe97919 100644
>> --- a/drivers/media/platform/qcom/iris/iris_utils.h
>> +++ b/drivers/media/platform/qcom/iris/iris_utils.h
>> @@ -49,5 +49,7 @@ struct iris_inst *iris_get_instance(struct iris_core *core, u32 session_id);
>>  void iris_helper_buffers_done(struct iris_inst *inst, unsigned int type,
>>  			      enum vb2_buffer_state state);
>>  int iris_wait_for_session_response(struct iris_inst *inst, bool is_flush);
>> +int iris_check_core_mbpf(struct iris_inst *inst);
>> +int iris_check_core_mbps(struct iris_inst *inst);
>>  
>>  #endif
>> diff --git a/drivers/media/platform/qcom/iris/iris_vb2.c b/drivers/media/platform/qcom/iris/iris_vb2.c
>> index e62ed7a57df2debf0a930ad8307e6d945f589922..e32f7e1f007228a3b2b51cd76cd193d852f16080 100644
>> --- a/drivers/media/platform/qcom/iris/iris_vb2.c
>> +++ b/drivers/media/platform/qcom/iris/iris_vb2.c
>> @@ -12,23 +12,6 @@
>>  #include "iris_vdec.h"
>>  #include "iris_power.h"
>>  
>> -static int iris_check_core_mbpf(struct iris_inst *inst)
>> -{
>> -	struct iris_core *core = inst->core;
>> -	struct iris_inst *instance;
>> -	u32 total_mbpf = 0;
>> -
>> -	mutex_lock(&core->lock);
>> -	list_for_each_entry(instance, &core->instances, list)
>> -		total_mbpf += iris_get_mbpf(instance);
>> -	mutex_unlock(&core->lock);
>> -
>> -	if (total_mbpf > core->iris_platform_data->max_core_mbpf)
>> -		return -ENOMEM;
>> -
>> -	return 0;
>> -}
>> -
>>  static int iris_check_inst_mbpf(struct iris_inst *inst)
>>  {
>>  	struct platform_inst_caps *caps;
>> diff --git a/drivers/media/platform/qcom/iris/iris_venc.c b/drivers/media/platform/qcom/iris/iris_venc.c
>> index 930f5afe9489d01be193f1dbe429d33f5401b468..11666f40a4d1c34e1b6eca0b5e40e0f09eeb2b67 100644
>> --- a/drivers/media/platform/qcom/iris/iris_venc.c
>> +++ b/drivers/media/platform/qcom/iris/iris_venc.c
>> @@ -58,6 +58,9 @@ int iris_venc_inst_init(struct iris_inst *inst)
>>  	inst->crop.width = f->fmt.pix_mp.width;
>>  	inst->crop.height = f->fmt.pix_mp.height;
>>  
>> +	inst->operating_rate = DEFAULT_FPS << 16;
>> +	inst->frame_rate = DEFAULT_FPS << 16;
> 
> I understand that firmware expects the rate in Q16 format, but does driver needs
> to keep it in that format ? I see most of the time in calculations, it is right
> shifted to bring it back to normal one and then back n forth.
> 

Currently in driver inst->frame_rate is in Q16 format everywhere, no
inconsistency.

do you prefer to keep it in non Q16 format and convert to Q16 when setting
to firmware?

>> +
>>  	return 0;
>>  }
>>  
>> @@ -325,3 +328,95 @@ int iris_venc_s_selection(struct iris_inst *inst, struct v4l2_selection *s)
>>  
>>  	return 0;
>>  }
>> +
>> +int iris_venc_s_param(struct iris_inst *inst, struct v4l2_streamparm *s_parm)
>> +{
>> +	struct platform_inst_caps *caps = inst->core->iris_platform_data->inst_caps;
>> +	struct vb2_queue *src_q = v4l2_m2m_get_src_vq(inst->m2m_ctx);
>> +	struct vb2_queue *dst_q = v4l2_m2m_get_dst_vq(inst->m2m_ctx);
>> +	struct v4l2_fract *timeperframe = NULL;
>> +	u32 default_rate = DEFAULT_FPS;
>> +	bool is_frame_rate = false;
>> +	u32 q16_rate, max_rate;
>> +	u64 us_per_frame, fps;
>> +	int ret = 0;
>> +
>> +	if (s_parm->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
>> +		timeperframe = &s_parm->parm.output.timeperframe;
>> +		max_rate = caps->max_operating_rate >> 16;
>> +		s_parm->parm.output.capability = V4L2_CAP_TIMEPERFRAME;
>> +	} else {
>> +		timeperframe = &s_parm->parm.capture.timeperframe;
>> +		is_frame_rate = true;
>> +		max_rate = caps->max_frame_rate >> 16;
>> +		s_parm->parm.capture.capability = V4L2_CAP_TIMEPERFRAME;
>> +	}
>> +
>> +	if (!timeperframe->denominator || !timeperframe->numerator) {
>> +		if (!timeperframe->numerator)
>> +			timeperframe->numerator = 1;
>> +		if (!timeperframe->denominator)
>> +			timeperframe->denominator = default_rate;
>> +	}
>> +
>> +	us_per_frame = timeperframe->numerator * (u64)USEC_PER_SEC;
>> +	do_div(us_per_frame, timeperframe->denominator);
>> +
>> +	if (!us_per_frame)
>> +		return -EINVAL;
>> +
>> +	fps = (u64)USEC_PER_SEC;
>> +	do_div(fps, us_per_frame);
>> +	ret = fps > max_rate;
>> +	if (ret) {
> 
> if (fps > max_rate)

Sure.

> 
>> +		ret = -ENOMEM;
>> +		goto reset_rate;
>> +	}
>> +
>> +	q16_rate = (u32)fps << 16;
>> +	if (is_frame_rate)
>> +		inst->frame_rate = q16_rate;
>> +	else
>> +		inst->operating_rate = q16_rate;
>> +
>> +	if ((s_parm->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE && vb2_is_streaming(src_q)) ||
>> +	    (s_parm->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE && vb2_is_streaming(dst_q))) {
>> +		ret = iris_check_core_mbpf(inst);
>> +		if (ret)
>> +			goto reset_rate;
>> +		ret = iris_check_core_mbps(inst);
>> +		if (ret)
>> +			goto reset_rate;
>> +	}
>> +
>> +	return 0;
>> +
>> +reset_rate:
>> +	if (ret) {
>> +		if (is_frame_rate)
>> +			inst->frame_rate = default_rate << 16;
>> +		else
>> +			inst->operating_rate = default_rate << 16;
>> +	}
>> +
>> +	return ret;
>> +}
>> +
>> +int iris_venc_g_param(struct iris_inst *inst, struct v4l2_streamparm *s_parm)
>> +{
>> +	struct v4l2_fract *timeperframe = NULL;
>> +
>> +	if (s_parm->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
>> +		timeperframe = &s_parm->parm.output.timeperframe;
>> +		timeperframe->numerator = 1;
>> +		timeperframe->denominator = inst->operating_rate >> 16;
>> +		s_parm->parm.output.capability = V4L2_CAP_TIMEPERFRAME;
>> +	} else {
>> +		timeperframe = &s_parm->parm.capture.timeperframe;
>> +		timeperframe->numerator = 1;
>> +		timeperframe->denominator = inst->frame_rate >> 16;
>> +		s_parm->parm.capture.capability = V4L2_CAP_TIMEPERFRAME;
>> +	}
>> +
>> +	return 0;
>> +}
>> diff --git a/drivers/media/platform/qcom/iris/iris_venc.h b/drivers/media/platform/qcom/iris/iris_venc.h
>> index 72c6e25d87113baa6d2219ae478b7d7df1aed7bf..0d566b7fc89b96b8fbc62a35b2ba795ca0bcf460 100644
>> --- a/drivers/media/platform/qcom/iris/iris_venc.h
>> +++ b/drivers/media/platform/qcom/iris/iris_venc.h
>> @@ -16,5 +16,7 @@ int iris_venc_s_fmt(struct iris_inst *inst, struct v4l2_format *f);
>>  int iris_venc_validate_format(struct iris_inst *inst, u32 pixelformat);
>>  int iris_venc_subscribe_event(struct iris_inst *inst, const struct v4l2_event_subscription *sub);
>>  int iris_venc_s_selection(struct iris_inst *inst, struct v4l2_selection *s);
>> +int iris_venc_g_param(struct iris_inst *inst, struct v4l2_streamparm *s_parm);
>> +int iris_venc_s_param(struct iris_inst *inst, struct v4l2_streamparm *s_parm);
>>  
>>  #endif
>> diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
>> index 2074682a35fd1c4c9f5d29fdaee3392d98bf8923..4c11cdac19f97d08a9e6242eea74649aad0242cf 100644
>> --- a/drivers/media/platform/qcom/iris/iris_vidc.c
>> +++ b/drivers/media/platform/qcom/iris/iris_vidc.c
>> @@ -532,6 +532,34 @@ static int iris_subscribe_event(struct v4l2_fh *fh, const struct v4l2_event_subs
>>  	return -EINVAL;
>>  }
>>  
>> +static int iris_s_parm(struct file *filp, void *fh, struct v4l2_streamparm *a)
>> +{
>> +	struct iris_inst *inst = container_of(fh, struct iris_inst, fh);
>> +
>> +	if (a->type != V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE &&
>> +	    a->type != V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
>> +		return -EINVAL;
>> +
>> +	if (inst->domain == ENCODER)
>> +		return iris_venc_s_param(inst, a);
>> +	else
>> +		return -EINVAL;
>> +}
>> +
>> +static int iris_g_parm(struct file *filp, void *fh, struct v4l2_streamparm *a)
>> +{
>> +	struct iris_inst *inst = container_of(fh, struct iris_inst, fh);
>> +
>> +	if (a->type != V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE &&
>> +	    a->type != V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
>> +		return -EINVAL;
>> +
>> +	if (inst->domain == ENCODER)
>> +		return iris_venc_g_param(inst, a);
>> +	else
>> +		return -EINVAL;
>> +}
>> +
>>  static int iris_dec_cmd(struct file *filp, void *fh,
>>  			struct v4l2_decoder_cmd *dec)
>>  {
>> @@ -628,6 +656,8 @@ static const struct v4l2_ioctl_ops iris_v4l2_ioctl_ops_enc = {
>>  	.vidioc_unsubscribe_event       = v4l2_event_unsubscribe,
>>  	.vidioc_g_selection             = iris_g_selection,
>>  	.vidioc_s_selection             = iris_s_selection,
>> +	.vidioc_s_parm                  = iris_s_parm,
>> +	.vidioc_g_parm                  = iris_g_parm,
>>  };
>>  
>>  void iris_init_ops(struct iris_core *core)
>>

