Return-Path: <linux-media+bounces-31287-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A2B1AA084E
	for <lists+linux-media@lfdr.de>; Tue, 29 Apr 2025 12:17:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B8C9148221B
	for <lists+linux-media@lfdr.de>; Tue, 29 Apr 2025 10:17:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 317A92BE7D2;
	Tue, 29 Apr 2025 10:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="inpv0rod"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27E086AD3;
	Tue, 29 Apr 2025 10:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745921841; cv=none; b=AocLdxut6cKITqhpLSl8/YqghDVhS6MgYRGkVnczK0W+ib9wF7fi8dBn4iD/ruF6tJ/BK/3Hxe29InS+BExZ3UTmOyFI+64KfQ7ypoh5Eh565lsyvKZLEHIH0dm4mWA57ceFGr9TlmEAxC/w9HmE+sucPY7nLA8NEUWKlL7h30c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745921841; c=relaxed/simple;
	bh=H4MmEbyY/jiOfkIYlzrd+ludq11Kkit70ljgH5o/Fqw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Jnmk4qMtM6vHUCU14zsD+/kJMZ047OImWag0bOs/uBPqtdb9ILwzDEBoGEqwRFEjCtnDKrJLxMXKGwylxTocKqzxx16ZtsvxgxgAyeYnKTG4O7nGQlG+S0d/j5z7nD1semvP3zBBULxxgvWOg45BLPqHk7UuRyb6/dM+SgBpAuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=inpv0rod; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53SNqkfb031124;
	Tue, 29 Apr 2025 10:17:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RjyrndxGVTYkWrgBBuzCLpgawA525e/x3v/XDyUOzP8=; b=inpv0rodmrFz9YYz
	siIiIsq9Q38AFC1f64z6pEehf4t4G/o4osRz3ze4ALOJBi+XBEevPRb7TMAuh5Cf
	CyTpGTURoIqRV5lpUCqHLX0mWYc8Cf3dANBuyk9VqCLcOYlfnanFt08ZAvQGdQd/
	cOlhknYuvhTY0F+FPj1kZf5GpCrtmZHKvJ4zCMYY8afHOfdiurXD+mykXimNCF8O
	WUFGzzU16vioO6u7NWYe96fepUJzjjaIsT3hNxo7A9466RhDmHQtIIQDbsDx04Pc
	kyEItQw0XaIOF/wxwjlbiag+uvjzHVILyqYNyS3wzd6UWCx530FBTQIRUo9cq8LE
	+V850g==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468pevk8w7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Apr 2025 10:17:13 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53TAHC0h020430
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Apr 2025 10:17:12 GMT
Received: from [10.50.27.172] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 29 Apr
 2025 03:17:06 -0700
Message-ID: <f1e1c566-3c2e-55b3-fd82-d61244a9250d@quicinc.com>
Date: Tue, 29 Apr 2025 15:47:03 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 08/23] media: iris: Improve last flag handling
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
        <20250424-qcs8300_iris-v5-0-f118f505c300@quicinc.com>
References: <20250428-qcom-iris-hevc-vp9-v2-0-3a6013ecb8a5@quicinc.com>
 <20250428-qcom-iris-hevc-vp9-v2-8-3a6013ecb8a5@quicinc.com>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <20250428-qcom-iris-hevc-vp9-v2-8-3a6013ecb8a5@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: UeK2i8OPxRzo_Cowh0mur5V8M2B2_Rw1
X-Authority-Analysis: v=2.4 cv=aeBhnQot c=1 sm=1 tr=0 ts=6810a729 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=v0wsS4GN24NjwHUmcC4A:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: UeK2i8OPxRzo_Cowh0mur5V8M2B2_Rw1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDA3NiBTYWx0ZWRfX7MrUXlbnac6L VzPQVp6E+hnmCAsRoc4oV31F34Vl2ugJ0xzRVfLGGpy5zZVgtzXxSNoXhOVZ4VJJo5OErXaXOji ATHmlp7oW130AAAoJ8pMVeJ7ENBrbd8ArlEneALImrhlK1/j61WSi2X/0ra3G9sHQ+/GlceqazK
 q+U0jrcqdLULg2stg8tqeU3GEEDsTM7oisycBkyaLynpYOSRi4UcLkYgcARXrQpTR3+7sgYH6vO 8+U4j5PWY7v6J4TUZiewZW8ss4RUzVVbFWTYpJuNg6W6Hf3msFjhccbXq7dQ1x26QOTLI2hEH9o ZXQI44jZZk/o1BzCXfv+rFVWBPZIpuRRf7KZrc0gYqBO7TOZM8xgofpLUK7HUPJu+mnNRMnzz1M
 WYqrSzEbuFgOuUWvjxwRg5BqxKeLRLVlGbc01SycRbL6uMLPeRF85q7TpkZV5UA5nWMGQpa2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_03,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 mlxlogscore=999 phishscore=0 suspectscore=0 lowpriorityscore=0 mlxscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290076


On 4/28/2025 2:58 PM, Dikshita Agarwal wrote:
> Improve the handling of the V4L2_BUF_FLAG_LAST flag in the driver:
> - Ensure that the last flag is not sent multiple times.
> - Attach the last flag to the first capture buffer returned during
>   flush, triggered by a sequence change, addressing cases where the
>   firmware does not set the last flag.
> 
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> ---
>  drivers/media/platform/qcom/iris/iris_buffer.c            | 1 +
>  drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c | 8 +++++++-
>  drivers/media/platform/qcom/iris/iris_instance.h          | 2 ++
>  drivers/media/platform/qcom/iris/iris_vb2.c               | 3 ++-
>  drivers/media/platform/qcom/iris/iris_vdec.c              | 2 ++
>  5 files changed, 14 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
> index 3691b68ea294..9f7d890262c2 100644
> --- a/drivers/media/platform/qcom/iris/iris_buffer.c
> +++ b/drivers/media/platform/qcom/iris/iris_buffer.c
> @@ -653,6 +653,7 @@ int iris_vb2_buffer_done(struct iris_inst *inst, struct iris_buffer *buf)
>  			v4l2_event_queue_fh(&inst->fh, &ev);
>  			v4l2_m2m_mark_stopped(m2m_ctx);
>  		}
> +		inst->last_buffer_dequeued = true;
>  	}
>  
>  	state = VB2_BUF_STATE_DONE;
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
> index 6576496fdbdf..ba858abab336 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
> @@ -456,7 +456,13 @@ static void iris_hfi_gen1_session_ftb_done(struct iris_inst *inst, void *packet)
>  		timestamp_us = timestamp_hi;
>  		timestamp_us = (timestamp_us << 32) | timestamp_lo;
>  	} else {
> -		flags |= V4L2_BUF_FLAG_LAST;
> +		if (pkt->stream_id == 1 && !inst->last_buffer_dequeued) {
> +			if (inst->sub_state & IRIS_INST_SUB_DRC &&
> +			    inst->sub_state & IRIS_INST_SUB_DRC_LAST) {
use iris_drc_pending().

With this added, mark it
Reviewed-by: Vikash Garodia <quic_vgarodia@quicinc.com>


> +				flags |= V4L2_BUF_FLAG_LAST;
> +				inst->last_buffer_dequeued = true;
> +			}
> +		}
>  	}
>  	buf->timestamp = timestamp_us;
>  
> diff --git a/drivers/media/platform/qcom/iris/iris_instance.h b/drivers/media/platform/qcom/iris/iris_instance.h
> index a893751766ca..5150237f0020 100644
> --- a/drivers/media/platform/qcom/iris/iris_instance.h
> +++ b/drivers/media/platform/qcom/iris/iris_instance.h
> @@ -43,6 +43,7 @@
>   * @tss: timestamp metadata
>   * @metadata_idx: index for metadata buffer
>   * @in_reconfig: a flag raised by decoder when the stream resolution changes
> + * @last_buffer_dequeued: a flag to indicate that last buffer is sent by driver
>   */
>  
>  struct iris_inst {
> @@ -74,6 +75,7 @@ struct iris_inst {
>  	struct iris_ts_metadata		tss[VIDEO_MAX_FRAME];
>  	u32				metadata_idx;
>  	bool				in_reconfig;
> +	bool				last_buffer_dequeued;
>  };
>  
>  #endif
> diff --git a/drivers/media/platform/qcom/iris/iris_vb2.c b/drivers/media/platform/qcom/iris/iris_vb2.c
> index cdf11feb590b..23473cbd0b2e 100644
> --- a/drivers/media/platform/qcom/iris/iris_vb2.c
> +++ b/drivers/media/platform/qcom/iris/iris_vb2.c
> @@ -304,7 +304,7 @@ void iris_vb2_buf_queue(struct vb2_buffer *vb2)
>  		goto exit;
>  	}
>  
> -	if (V4L2_TYPE_IS_CAPTURE(vb2->vb2_queue->type)) {
> +	if (!inst->last_buffer_dequeued && V4L2_TYPE_IS_CAPTURE(vb2->vb2_queue->type)) {
>  		if ((inst->sub_state & IRIS_INST_SUB_DRC &&
>  		     inst->sub_state & IRIS_INST_SUB_DRC_LAST) ||
>  		    (inst->sub_state & IRIS_INST_SUB_DRAIN &&
> @@ -318,6 +318,7 @@ void iris_vb2_buf_queue(struct vb2_buffer *vb2)
>  				v4l2_event_queue_fh(&inst->fh, &eos);
>  				v4l2_m2m_mark_stopped(m2m_ctx);
>  			}
> +			inst->last_buffer_dequeued = true;
>  			goto exit;
>  		}
>  	}
> diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
> index 46abdc47420f..d162cc9650f5 100644
> --- a/drivers/media/platform/qcom/iris/iris_vdec.c
> +++ b/drivers/media/platform/qcom/iris/iris_vdec.c
> @@ -488,6 +488,8 @@ static int iris_vdec_process_streamon_output(struct iris_inst *inst)
>  		return ret;
>  
>  	inst->in_reconfig = false;
> +	inst->last_buffer_dequeued = false;
> +
>  	return iris_inst_change_sub_state(inst, clear_sub_state, 0);
>  }
>  
> 

