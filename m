Return-Path: <linux-media+bounces-37840-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48E02B06EE8
	for <lists+linux-media@lfdr.de>; Wed, 16 Jul 2025 09:27:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7769A3A8B64
	for <lists+linux-media@lfdr.de>; Wed, 16 Jul 2025 07:26:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAFFD28AAE9;
	Wed, 16 Jul 2025 07:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="AuQvSUEZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6BEA80B;
	Wed, 16 Jul 2025 07:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752650817; cv=none; b=OvWWWdeAxaO1FnBsKjxIvJQiMWIiNwkFuIrbmGYFhFRlWoR/4fStHwgOT4Gwd1jm0xl2fCn/2SwsYrV+q+SZb/QOEPloJpTAOVJ0FcYftVox+IdmmyzDZuwE4oXnvj+g/7tbDbF5saVhW5QRXzjR9b6BHgcf7pf/r8af6lxccPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752650817; c=relaxed/simple;
	bh=r1PQD6nD4pyjJ1Pi4gRFFijXmP3ecaPtaCinH8IuMHc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=SIMQ7OgC0SMryIMeYsQWK/WpJUYJUQDvFUQMxESpTvO/0rkCP15/YhBkDUnHFmywZCe3eweE7b5blmdMQ9cyS+rPWQ3hMHfa4FLiKTw7y1Py51VoEl3MOc8Zr+05HARBRr6iq8NsBQzgLeVpALU2nrbOxA9JgPO+M2l1bO1+AM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=AuQvSUEZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56G5sBWU024588;
	Wed, 16 Jul 2025 07:26:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y+xBnG3A0ZWzm693I0w1sXLH1FieiMMxSWP430Dc1M0=; b=AuQvSUEZFczPQqwV
	BuEyrtb3ozVWWzQfZ2/bJeCMQ0JcFkbvT2MyatgYTEyOHq247gJfBjHnqZhWdNsy
	A+Me2g0Dg339liKfDhagY4qIzlGDA2oq85YXNSaupQ9w+fJ5XlWUvpUZjODK4A4g
	3vlyYzM71zgLDlZSpBTEKLQ0lzF21UcZxXXF2ZlbevEJ5pd4lM3m3KGoizC/0d6I
	sblv96dKjO0w2zTjqWQMuw6ouLW+OWB59gH4NNwYNzcoGQEaO/OPriDkzcHggI0v
	vkPKAcI6nQcsc9QO9hRJSjQwc1XvHtNEwno6UGYsSMgZAQ0SmU2VTWM51FXRxN4c
	df7Nlg==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47w5dpdurb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Jul 2025 07:26:48 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56G7Qm8O005140
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Jul 2025 07:26:48 GMT
Received: from [10.216.39.173] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 16 Jul
 2025 00:26:45 -0700
Message-ID: <1b7e724a-fa91-11b7-3ee8-d97ed930d6ad@quicinc.com>
Date: Wed, 16 Jul 2025 12:56:42 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 11/25] media: iris: Fix missing LAST flag handling during
 drain
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
        <linux-kernel@vger.kernel.org>
References: <20250704-iris-video-encoder-v1-0-b6ce24e273cf@quicinc.com>
 <20250704-iris-video-encoder-v1-11-b6ce24e273cf@quicinc.com>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <20250704-iris-video-encoder-v1-11-b6ce24e273cf@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE2MDA2NiBTYWx0ZWRfX+XbCfmZ86eh7
 nXoxS8mYe0PPpkop90INBf0Zc5Av/fZQR0jbd5unGk+HSE26jGLb2BzBcDkL4QXEln9793FcTj3
 o9FG4so2Fv28l3n9P6niv7Dm0E+no+tc8N5qshPXdPvtXbOrmwkPXxoBOQ3XkWJE7MYUJeGEACR
 9eq13aLsDPvoNgnhTGfxMsRSDJsBJ0+3qIV7J3gmNlDDvqH19DOskU6LIzBqk1HS+8nOkm+mrL5
 I9HIyRk8E9WVHuhpHHcfpddwaTfPJEFwF6a7AtrOJG/PYPjCh7iIc5OfXWcPa9X6wrjOpEZKZVt
 FbuwKZHZP2gmFHKW3v1QdqzzK98IkSwSuLzjgXJppeORUyDd0I8vbgpCcXt/dc7lvgRE/vXgG3f
 Dl3oTTMNjbiNz9Kcvl8tfoKHwp4ODiZn1pBlTe4IVvLFarAH7K9u729ALoOUxHD2VSDCMktE
X-Proofpoint-GUID: 1-tsxHVbqSsMhqwsXLitC-jWTM2UayCx
X-Proofpoint-ORIG-GUID: 1-tsxHVbqSsMhqwsXLitC-jWTM2UayCx
X-Authority-Analysis: v=2.4 cv=Y+r4sgeN c=1 sm=1 tr=0 ts=68775438 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8
 a=KpRsr4bm_Dgpwk9YamYA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-16_01,2025-07-15_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=830 phishscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 impostorscore=0 mlxscore=0 suspectscore=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507160066



On 7/4/2025 1:23 PM, Dikshita Agarwal wrote:
> Improve drain handling by ensuring the LAST flag is attached to final
> capture buffer when drain response is received from the firmware.
> 
> Previously, the driver failed to attach the V4L2_BUF_FLAG_LAST flag when
> a drain response was received from the firmware, relying on userspace to
> mark the next queued buffer as LAST. This update fixes the issue by
> checking the pending drain status, attaching the LAST flag to the
> capture buffer received from the firmware (with EOS attached), and
> returning it to the V4L2 layer correctly.
> 
> Fixes: d09100763bed ("media: iris: add support for drain sequence")
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> ---
>  drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c | 4 +---
>  drivers/media/platform/qcom/iris/iris_state.c             | 2 +-
>  drivers/media/platform/qcom/iris/iris_state.h             | 1 +
>  3 files changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
> index 8d1ce8a19a45ebb2b29457e0fef7d72c1c0d9785..2a96458833835422d30c9386d15cc1e4fb226e3d 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
> @@ -416,8 +416,6 @@ static void iris_hfi_gen1_session_ftb_done(struct iris_inst *inst, void *packet)
>  			inst->flush_responses_pending++;
>  
>  		iris_inst_sub_state_change_drain_last(inst);
> -
> -		return;
>  	}
>  
>  	if (iris_split_mode_enabled(inst) && pkt->stream_id == 0) {
> @@ -462,7 +460,7 @@ static void iris_hfi_gen1_session_ftb_done(struct iris_inst *inst, void *packet)
>  		timestamp_us = (timestamp_us << 32) | timestamp_lo;
>  	} else {
>  		if (pkt->stream_id == 1 && !inst->last_buffer_dequeued) {
> -			if (iris_drc_pending(inst)) {
> +			if (iris_drc_pending(inst) || iris_drain_pending(inst)) {
>  				flags |= V4L2_BUF_FLAG_LAST;
>  				inst->last_buffer_dequeued = true;
>  			}
> diff --git a/drivers/media/platform/qcom/iris/iris_state.c b/drivers/media/platform/qcom/iris/iris_state.c
> index a21238d2818f9606871953bd0bee25382cca0474..d1dc1a863da0b0b1af60974e9ed2ef68ea225cdd 100644
> --- a/drivers/media/platform/qcom/iris/iris_state.c
> +++ b/drivers/media/platform/qcom/iris/iris_state.c
> @@ -252,7 +252,7 @@ bool iris_drc_pending(struct iris_inst *inst)
>  		inst->sub_state & IRIS_INST_SUB_DRC_LAST;
>  }
>  
> -static inline bool iris_drain_pending(struct iris_inst *inst)
> +bool iris_drain_pending(struct iris_inst *inst)
>  {
>  	return inst->sub_state & IRIS_INST_SUB_DRAIN &&
>  		inst->sub_state & IRIS_INST_SUB_DRAIN_LAST;
> diff --git a/drivers/media/platform/qcom/iris/iris_state.h b/drivers/media/platform/qcom/iris/iris_state.h
> index e718386dbe0402417f408d8fc696a33e5c7f23b3..b09fa54cf17eeee0c9ae254588964ad959c82c80 100644
> --- a/drivers/media/platform/qcom/iris/iris_state.h
> +++ b/drivers/media/platform/qcom/iris/iris_state.h
> @@ -141,5 +141,6 @@ int iris_inst_sub_state_change_drc_last(struct iris_inst *inst);
>  int iris_inst_sub_state_change_pause(struct iris_inst *inst, u32 plane);
>  bool iris_allow_cmd(struct iris_inst *inst, u32 cmd);
>  bool iris_drc_pending(struct iris_inst *inst);
> +bool iris_drain_pending(struct iris_inst *inst);
>  
>  #endif
> 

Reviewed-by: Vikash Garodia <quic_vgarodia@quicinc.com>

