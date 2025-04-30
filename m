Return-Path: <linux-media+bounces-31431-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 067C9AA4920
	for <lists+linux-media@lfdr.de>; Wed, 30 Apr 2025 12:47:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 56B493B27C2
	for <lists+linux-media@lfdr.de>; Wed, 30 Apr 2025 10:43:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BD7E246797;
	Wed, 30 Apr 2025 10:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="XRtVLT6d"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3783AFC0B;
	Wed, 30 Apr 2025 10:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746009668; cv=none; b=kxq5sM4BnxKtiACn0HjDldckt7SxWrvrLS/LINpqK/YcC+XF8Iv3mlYjqSTtm8qLT8AAJ33GmyqAAKYigeGie1C5v0Brmt9T/5IPL5YBfPK17H2dwWFy4Dh966vSLcTf4gDjKDO3oPfI+tPBlBMIquidoK0Qj1Xvy2XIZV+YR2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746009668; c=relaxed/simple;
	bh=nlGX2ykn0eKxmQ0bTQgV+/kd8YY3fCyWOOmHd5IlM+o=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=qVWUkD5DTk+frRyhcz8p6RLsBZGKmz53b4WxcoyLGcPEk1dQeEaDysmKTvm8GWF7b2MH67X6sBEruGxJWVnu250B3Ak0ee3sP1ZSW22jmCZjXkF5PGnpFXMGuSL4Oku6X0GFsghVptzU4voJ+k0lHoOo0A0cULMlzXtVY2OOxKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=XRtVLT6d; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53U9nhG0013348;
	Wed, 30 Apr 2025 10:41:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qbaWXYkTIQQ02yEA0qb7R3EZontGifQ3CEMmYbAgnwg=; b=XRtVLT6dLZAR6w1k
	YmXDMHB6WqG3uATb9dSwpDmegsj7+PJq5UbSAP1yna6i4J9rggKsNNELZP3w/tEO
	mpbHtDA8px3FdtpIxNAplnVaT2YOOD5pEWVe/F8ergoYdGGJ+M4K6kRWOxooao9J
	N4yy2nMa0iQmUWbR10LJW50kfI3EMTddGoJ3Ygyd5Hw1+hjLloKR9HmI5hKmUF+j
	L9EWB4ab6tpf9qLARIJ8iBQbEJSeqadtUmykD2Mo3df0Adpfcu/Q/7J/WUH2NJhU
	Io6oaCgbl/osBG0druz6mYT51ssQgTJYtEMQ7sl4fQSCTZhxjhU2GKpRAIZrJlf/
	//hJfA==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6uassa2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Apr 2025 10:41:02 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53UAf18V013285
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Apr 2025 10:41:01 GMT
Received: from [10.50.41.127] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 30 Apr
 2025 03:40:50 -0700
Message-ID: <578305fc-fe93-2ef4-908a-d728a5ae6485@quicinc.com>
Date: Wed, 30 Apr 2025 16:10:44 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 17/23] media: iris: Track flush responses to prevent
 premature completion
Content-Language: en-US
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil
	<hverkuil@xs4all.nl>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>,
        Neil Armstrong
	<neil.armstrong@linaro.org>,
        Nicolas Dufresne
	<nicolas.dufresne@collabora.com>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <20250417-topic-sm8x50-iris-v10-v7-0-f020cb1d0e98@linaro.org>,
        <20250424-qcs8300_iris-v5-0-f118f505c300@quicinc.com>,
        <stable@vger.kernel.org>
References: <20250428-qcom-iris-hevc-vp9-v2-0-3a6013ecb8a5@quicinc.com>
 <20250428-qcom-iris-hevc-vp9-v2-17-3a6013ecb8a5@quicinc.com>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <20250428-qcom-iris-hevc-vp9-v2-17-3a6013ecb8a5@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: n3Swu7R2cbwe86lIlnI-9_6_6WglRggl
X-Authority-Analysis: v=2.4 cv=KtlN2XWN c=1 sm=1 tr=0 ts=6811fe3e cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=Gbu0beokyuX9P4B2CwkA:9
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: n3Swu7R2cbwe86lIlnI-9_6_6WglRggl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDMwMDA3NSBTYWx0ZWRfXyDRSTNQhYFsv kfuTl93sO9flPEownFjk3kIK3i038K7hgBBXAKlGFuK617Jdtb2f0txlFN3ul7VE7JgLo5uhaKH QSAa1JI6pAmAQht5PbllmSgJOYIDW+OmvitQO8ulvoYBYawS4wRKFxmoUliTLstJ+MyGni6IPnt
 SFqag1ODxavTSBYPJjwru10YJFrNP4ps/VVI+v09BqEeDOjf1FnRNqaJ4/n7tlJTCrhLk0jOVvX htdPdTJRywcKgFpXiegKnxknXbMJTLKdg1WhVnkGpXJIEo3+v8ATantmdoWuqdAGB/jhK6pn3nt /lKPso4VV2SzGCjoNHVSd4B9PtQ22U+jPxqfilS5kbxtKCazdYgQGWKKPLanIFISSvZ2LhzqoSd
 WXrd5a9JWI+mEsHLNvR5R6axc2KyD9D2FNWcuRkA0zp0mMYaQtcILJt/DTs2/ll4EPXayRBz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-30_03,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 mlxscore=0 bulkscore=0 mlxlogscore=999 spamscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504300075



On 4/28/2025 2:59 PM, Dikshita Agarwal wrote:
> Currently, two types of flush commands are queued to the firmware,
> the first flush queued as part of sequence change, does not wait for a
> response, while the second flush queued as part of stop, expects a
> completion response before proceeding further.
> 
> Due to timing issue, the flush response corresponding to the first
> command could arrive after the second flush is issued. This casuses the
> driver to incorrectly assume that the second flush has completed,
> leading to the premature signaling of flush_completion.
> 
> To address this, introduce a counter to track the number of pending
> flush responses and signal flush completion only when all expected
> responses are received.
> 
> Cc: stable@vger.kernel.org
> Fixes: 11712ce70f8e ("media: iris: implement vb2 streaming ops")
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> ---
>  .../media/platform/qcom/iris/iris_hfi_gen1_command.c    |  4 +++-
>  .../media/platform/qcom/iris/iris_hfi_gen1_response.c   | 17 +++++++++++------
>  drivers/media/platform/qcom/iris/iris_instance.h        |  2 ++
>  3 files changed, 16 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> index f9f3e2d2ce29..ef3ca676d2ea 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> @@ -208,8 +208,10 @@ static int iris_hfi_gen1_session_stop(struct iris_inst *inst, u32 plane)
>  		flush_pkt.flush_type = flush_type;
>  
>  		ret = iris_hfi_queue_cmd_write(core, &flush_pkt, flush_pkt.shdr.hdr.size);
> -		if (!ret)
> +		if (!ret) {
> +			inst->flush_responses_pending++;
>  			ret = iris_wait_for_session_response(inst, true);
> +		}
>  	}
>  
>  	return ret;
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
> index dfca45d85759..01338baf3788 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
> @@ -207,7 +207,8 @@ static void iris_hfi_gen1_event_seq_changed(struct iris_inst *inst,
>  		flush_pkt.shdr.hdr.pkt_type = HFI_CMD_SESSION_FLUSH;
>  		flush_pkt.shdr.session_id = inst->session_id;
>  		flush_pkt.flush_type = HFI_FLUSH_OUTPUT;
> -		iris_hfi_queue_cmd_write(inst->core, &flush_pkt, flush_pkt.shdr.hdr.size);
> +		if (!iris_hfi_queue_cmd_write(inst->core, &flush_pkt, flush_pkt.shdr.hdr.size))
> +			inst->flush_responses_pending++;
>  	}
>  
>  	iris_vdec_src_change(inst);
> @@ -408,7 +409,9 @@ static void iris_hfi_gen1_session_ftb_done(struct iris_inst *inst, void *packet)
>  		flush_pkt.shdr.hdr.pkt_type = HFI_CMD_SESSION_FLUSH;
>  		flush_pkt.shdr.session_id = inst->session_id;
>  		flush_pkt.flush_type = HFI_FLUSH_OUTPUT;
> -		iris_hfi_queue_cmd_write(core, &flush_pkt, flush_pkt.shdr.hdr.size);
> +		if (!iris_hfi_queue_cmd_write(core, &flush_pkt, flush_pkt.shdr.hdr.size))
> +			inst->flush_responses_pending++;
> +
>  		iris_inst_sub_state_change_drain_last(inst);
>  
>  		return;
> @@ -570,7 +573,6 @@ static void iris_hfi_gen1_handle_response(struct iris_core *core, void *response
>  	const struct iris_hfi_gen1_response_pkt_info *pkt_info;
>  	struct device *dev = core->dev;
>  	struct hfi_session_pkt *pkt;
> -	struct completion *done;
>  	struct iris_inst *inst;
>  	bool found = false;
>  	u32 i;
> @@ -631,9 +633,12 @@ static void iris_hfi_gen1_handle_response(struct iris_core *core, void *response
>  			if (shdr->error_type != HFI_ERR_NONE)
>  				iris_inst_change_state(inst, IRIS_INST_ERROR);
>  
> -			done = pkt_info->pkt == HFI_MSG_SESSION_FLUSH ?
> -				&inst->flush_completion : &inst->completion;
> -			complete(done);
> +			if (pkt_info->pkt == HFI_MSG_SESSION_FLUSH) {
> +				if (--inst->flush_responses_pending <= 0)
No need to check for < 0 condition as its an unsigned int. Signal when equals 0.

With above change, mark
Reviewed-by: Vikash Garodia <quic_vgarodia@quicinc.com>

> +					complete(&inst->flush_completion);
> +			} else {
> +				complete(&inst->completion);
> +			}
>  		}
>  		mutex_unlock(&inst->lock);
>  
> diff --git a/drivers/media/platform/qcom/iris/iris_instance.h b/drivers/media/platform/qcom/iris/iris_instance.h
> index 5150237f0020..9ed197799ee7 100644
> --- a/drivers/media/platform/qcom/iris/iris_instance.h
> +++ b/drivers/media/platform/qcom/iris/iris_instance.h
> @@ -27,6 +27,7 @@
>   * @crop: structure of crop info
>   * @completion: structure of signal completions
>   * @flush_completion: structure of signal completions for flush cmd
> + * @flush_responses_pending: counter to track number of pending flush responses
>   * @fw_caps: array of supported instance firmware capabilities
>   * @buffers: array of different iris buffers
>   * @fw_min_count: minimnum count of buffers needed by fw
> @@ -59,6 +60,7 @@ struct iris_inst {
>  	struct iris_hfi_rect_desc	crop;
>  	struct completion		completion;
>  	struct completion		flush_completion;
> +	u32				flush_responses_pending;
>  	struct platform_inst_fw_cap	fw_caps[INST_FW_CAP_MAX];
>  	struct iris_buffers		buffers[BUF_TYPE_MAX];
>  	u32				fw_min_count;
> 

