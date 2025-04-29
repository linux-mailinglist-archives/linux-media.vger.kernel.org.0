Return-Path: <linux-media+bounces-31282-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DFA02AA07C3
	for <lists+linux-media@lfdr.de>; Tue, 29 Apr 2025 11:51:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3FA4A484B62
	for <lists+linux-media@lfdr.de>; Tue, 29 Apr 2025 09:51:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECE9A2BE110;
	Tue, 29 Apr 2025 09:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="OYvtkrIs"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB9E9279338;
	Tue, 29 Apr 2025 09:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745920276; cv=none; b=UiyXo4iexNyK+miQaV1NGlVGxzJvIY1cFV1RXnrzxZ+f2Lz1tlm74PLfqo4HoYl6Erot9m3kESKDiTSS1oX5DB9AZQSyrH4IFWuwK10wXpRkgQRAm3NRIg029eworIN/EIXAXsBwE+t0hBZSNankpGjjDo03IJEu3wag0YFeWCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745920276; c=relaxed/simple;
	bh=M9MBb3pKdEotk+CB79nNOjpS6kMb30vt0H2z3q2rGxM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=RZ0HWFRBrVsNjVECy2EwQAHJPigUPiAB6U37TIbcSy/iNTkk2YCkHQl8LV2xHOWgVF3uY+olesH8Kc5ygdFlvGLP2o5teIG1Ij6u9PalqNFthdYxttRq7XMgk6in11GyMhpsiTzLqKzDVtaOpQMTUkypY8pGUKKOwjv7w7GUWa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=OYvtkrIs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53T9l6B1024687;
	Tue, 29 Apr 2025 09:51:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m3qdYdhWDN177GJkdnYzs4mo/cOX5FSCoo5AA+lhZJY=; b=OYvtkrIsGpGm/4oy
	5wqcvEFg9N0h57hva4Y6R68Cw+qaHe4qRTynT4zt7dqRWdS+UpWlRuWM7p3U1kd1
	HW4oOlxaUYpD0KGTIGtuvMKRyz5NEdL/znovzpI0d9hWVklrHgJA0vkxjQjFWfgM
	UJhJreTC4BtLucUJHcYw3cqyUNnYoPL/NXH0QqVf/voaWfAB33XBcP6Af52vXeut
	LZ5d/Eq2zoTiJDuPOrRRcFOVKb3NLG4uUCLgmW9HGUqHUtoiJJpz6SKAgLG/TmJW
	9M6R+SfmHu2Lf+B9Gjpb3C2dDFm/7AAW/5goxkiwugYf2cSm0g9StaE1bgJ45ROb
	2xajIw==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468muqm9ev-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Apr 2025 09:51:08 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53T9p79V031920
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Apr 2025 09:51:07 GMT
Received: from [10.50.27.172] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 29 Apr
 2025 02:51:01 -0700
Message-ID: <171aa83c-3198-1c3f-ed4c-84a1aad8cdd5@quicinc.com>
Date: Tue, 29 Apr 2025 15:20:58 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 04/23] media: iris: Avoid updating frame size to
 firmware during reconfig
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
        <stable@vger.kernel.org>
References: <20250428-qcom-iris-hevc-vp9-v2-0-3a6013ecb8a5@quicinc.com>
 <20250428-qcom-iris-hevc-vp9-v2-4-3a6013ecb8a5@quicinc.com>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <20250428-qcom-iris-hevc-vp9-v2-4-3a6013ecb8a5@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDA3MyBTYWx0ZWRfX9TUGK8l3/hSu 1V7//AtaXiRy2ntW+BdagVG8MaoMJ53qhwXxw4ugoXWbHprkTyAfQULz3cCWvKW9Hc68dAjfSCC oYFSri1NvE81I6YW6hyJBASsK6kOolk3gf2DXqnjqGsTozEoYX3fEGcaBDKDqnhntWH+IH7yXQ7
 /UFf6oL43iwYkQPgQ1Bdzu5l7pPdVhyuV8dwsmF3RJ3BaxPlPTFzs1CPwu+vr07tuMhH3I4OElB VClI42Q6PEMDnWeu514GznHDweZGEjVESeuDrlVd1zuCw1NmKv3kUj6N5Y+uNHe/yZM7+OKwS9z Z6dQYsChwmor7VYHdHerp9z53pkd0GSAiiwVMkuXJl++zjrHTPkjb2VY9qKCrSRA4RMe6nbGumx
 vNb4VH79XpG/gEsWRHYM1FEf9SRfbkUiDb24s7zHkCQuw+TD1YQiIsAaLxIvzZ5DsRVOXx+9
X-Proofpoint-GUID: bVMTVRWsvzaEjZk2fDK2n36prwK1BRWe
X-Proofpoint-ORIG-GUID: bVMTVRWsvzaEjZk2fDK2n36prwK1BRWe
X-Authority-Analysis: v=2.4 cv=M/5NKzws c=1 sm=1 tr=0 ts=6810a10c cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=UpjaJJ42xbfS8UNq4PIA:9
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_03,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 mlxscore=0 spamscore=0 malwarescore=0 mlxlogscore=999
 adultscore=0 bulkscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290073



On 4/28/2025 2:58 PM, Dikshita Agarwal wrote:
> During reconfig, the firmware sends the resolution aligned to 8 bytes.
> If the driver sends the same resolution back to the firmware the resolution
> will be aligned to 16 bytes not 8.
> 
> The alignment mismatch would then subsequently cause the firmware to
> send another redundant sequence change.
change event.
> 
> Fix this by not setting the resolution property during reconfig.
> 
> Cc: stable@vger.kernel.org
> Fixes: 3a19d7b9e08b ("media: iris: implement set properties to firmware during streamon")
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> ---
>  drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c  | 15 ++++++++-------
>  drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c |  1 +
>  drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c |  1 +
>  drivers/media/platform/qcom/iris/iris_instance.h          |  2 ++
>  drivers/media/platform/qcom/iris/iris_vdec.c              |  1 +
>  5 files changed, 13 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> index 64f887d9a17d..2239708d2d7e 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> @@ -546,14 +546,15 @@ static int iris_hfi_gen1_set_resolution(struct iris_inst *inst)
>  	struct hfi_framesize fs;
>  	int ret;
>  
> -	fs.buffer_type = HFI_BUFFER_INPUT;
> -	fs.width = inst->fmt_src->fmt.pix_mp.width;
> -	fs.height = inst->fmt_src->fmt.pix_mp.height;
> -
> -	ret = hfi_gen1_set_property(inst, ptype, &fs, sizeof(fs));
> -	if (ret)
> -		return ret;
> +	if (!inst->in_reconfig) {
> +		fs.buffer_type = HFI_BUFFER_INPUT;
> +		fs.width = inst->fmt_src->fmt.pix_mp.width;
> +		fs.height = inst->fmt_src->fmt.pix_mp.height;
>  
> +		ret = hfi_gen1_set_property(inst, ptype, &fs, sizeof(fs));
> +		if (ret)
> +			return ret;
> +	}
>  	fs.buffer_type = HFI_BUFFER_OUTPUT2;
>  	fs.width = inst->fmt_dst->fmt.pix_mp.width;
>  	fs.height = inst->fmt_dst->fmt.pix_mp.height;
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
> index 91d95eed68aa..6576496fdbdf 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
> @@ -155,6 +155,7 @@ static void iris_hfi_gen1_read_changed_params(struct iris_inst *inst,
>  		inst->crop.height = event.height;
>  	}
>  
> +	inst->in_reconfig = true;
>  	inst->fw_min_count = event.buf_count;
>  	inst->buffers[BUF_OUTPUT].min_count = iris_vpu_buf_count(inst, BUF_OUTPUT);
>  	inst->buffers[BUF_OUTPUT].size = pixmp_op->plane_fmt[0].sizeimage;
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> index b75a01641d5d..0e889d07e997 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> @@ -508,6 +508,7 @@ static void iris_hfi_gen2_read_input_subcr_params(struct iris_inst *inst)
>  	struct vb2_queue *dst_q;
>  	struct v4l2_ctrl *ctrl;
>  
> +	inst->in_reconfig = true;
>  	subsc_params = inst_hfi_gen2->src_subcr_params;
>  	width = (subsc_params.bitstream_resolution &
>  		HFI_BITMASK_BITSTREAM_WIDTH) >> 16;
> diff --git a/drivers/media/platform/qcom/iris/iris_instance.h b/drivers/media/platform/qcom/iris/iris_instance.h
> index caa3c6507006..a893751766ca 100644
> --- a/drivers/media/platform/qcom/iris/iris_instance.h
> +++ b/drivers/media/platform/qcom/iris/iris_instance.h
> @@ -42,6 +42,7 @@
>   * @sequence_out: a sequence counter for output queue
>   * @tss: timestamp metadata
>   * @metadata_idx: index for metadata buffer
> + * @in_reconfig: a flag raised by decoder when the stream resolution changes
>   */
use the DRC sub-state instead of in_reconfig flag ?

Regards,
Vikash
>  
>  struct iris_inst {
> @@ -72,6 +73,7 @@ struct iris_inst {
>  	u32				sequence_out;
>  	struct iris_ts_metadata		tss[VIDEO_MAX_FRAME];
>  	u32				metadata_idx;
> +	bool				in_reconfig;
>  };
>  
>  #endif
> diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
> index 71751365b000..46abdc47420f 100644
> --- a/drivers/media/platform/qcom/iris/iris_vdec.c
> +++ b/drivers/media/platform/qcom/iris/iris_vdec.c
> @@ -487,6 +487,7 @@ static int iris_vdec_process_streamon_output(struct iris_inst *inst)
>  	if (ret)
>  		return ret;
>  
> +	inst->in_reconfig = false;
>  	return iris_inst_change_sub_state(inst, clear_sub_state, 0);
>  }
>  
> 

