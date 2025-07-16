Return-Path: <linux-media+bounces-37833-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 73686B06E34
	for <lists+linux-media@lfdr.de>; Wed, 16 Jul 2025 08:48:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AD4BB1A60C4C
	for <lists+linux-media@lfdr.de>; Wed, 16 Jul 2025 06:48:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEB19288533;
	Wed, 16 Jul 2025 06:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ZKA419sh"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE8BF218858;
	Wed, 16 Jul 2025 06:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752648503; cv=none; b=kxamjdRoVnL9k6Ll6rHHTpZUDWP3Qxsp6G6VxIAp6zYir3qSftaPBujDuS2rCBnLE0t+/rim3KgxT1PZITINJhQ9EqeSsPzWF2Mfx8nEjzAs6nVHAqY7WdswrbKLAFZzyCviel+ZVftN6hsuFcyWST7veyGpkabAUsu/18QeaWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752648503; c=relaxed/simple;
	bh=XjqcghoFE2Yqt4skKIZgvD7VX6A2KJo89xrQ6wwiIrY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=rl39wXN+tSBPKro9fPCN1hWyGSeh+XHtf4aDWSTQ6PnVzZAQ76d3WF/8Sh9rjwaTVgVmsB0xwYpwt0ymBTSGhEMQIUrsbD7wHntfRdU67GqgeLOIM/320CmAG2kPf9bRwQylwagVvRwWY7j68GFcwJA7bJmR+OD9itI47mjL2r0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ZKA419sh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56G6eNNq003467;
	Wed, 16 Jul 2025 06:48:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I2CWwloeUWebYWEF9NAI9U78YojSEXoha14qYZuw2gY=; b=ZKA419shi4ZIQIXx
	aknOLBzOclQsQ5xu0JjZTZ+wzdtBEtQ1RzxZ/tM0bjUDBZLutslOUpjeN4kSBz9f
	l5IjdfH3essnuh76fDir3EZYhDFXNga8WVF96JWR3ckfvweevD1kVLANxD2mlv3K
	uDzhitWsFwviladigTr4ngP6CJ5QNrVzCjj5Q+SqIBQnuVC/E9qqN8CBAkOKucuI
	vgPBeMekfR2Wk4fvkqcOQzdyINV6HsyGmZjxgiz1Jiq11IHvcKerAGHZZWrRwc8Y
	6cjiPaRNJ0Chuw+1uFuf88Zx0aY+uRol5shrJGIwaPXYPx+g2x+gcp678/z6oIaA
	4y2STw==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47w5drnrg3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Jul 2025 06:48:14 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56G6mDLh031279
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Jul 2025 06:48:13 GMT
Received: from [10.216.39.173] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 15 Jul
 2025 23:48:10 -0700
Message-ID: <f462ce0e-08d6-d2cd-0e24-47e9cca56abc@quicinc.com>
Date: Wed, 16 Jul 2025 12:18:07 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 05/25] media: iris: Fix port streaming handling
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
 <20250704-iris-video-encoder-v1-5-b6ce24e273cf@quicinc.com>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <20250704-iris-video-encoder-v1-5-b6ce24e273cf@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 4-_XgLYPwUAOGEm8qU9Ar-b91UunbUMK
X-Authority-Analysis: v=2.4 cv=D4xHKuRj c=1 sm=1 tr=0 ts=68774b2e cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8
 a=pdoqPo7vGqYbXQxtSqwA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 4-_XgLYPwUAOGEm8qU9Ar-b91UunbUMK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE2MDA1OSBTYWx0ZWRfX0XmSoMPxzsS/
 Esx2ctWcA9J4bm64hkyPcuSARQ5///D3g6ApsNOHB9hVkuO/rZupOdPk/aAYg20laM14xzYzgmY
 Aku/+VMY0Eg2vqnxwchmE9p0z8urNl/fdGqrjtt/8+aZCO/DGVtNQ54r/oVji081OvKC6qru8wB
 Fvc0/FWFNQOL5Q8WpYYDACcOe6uPzNXkSlpCAL2eAAzR4Q9mT4+znHQ5kIqlCQ5vz3punvMOeQp
 3mRqUPmdIVWd4cJ6+LKJt8arKkGhE3jkkjHnXihaCefBjeyB+d6P7YxYMg635T+CNR9HIN1WqZN
 o/R7n9bHbp/mI3w//fxYFixJJv9VOd5EFBRgN6MSoqnfCvAkq2eHgquW6zlx1o6s0bLWjBmEJaW
 U+4By6vWjm2BnwkymALtymJhJpGjDfv/rMF7G52lK1MmPPs8R1lrWNQJ4gD/dQM3Ltz+PlV1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-16_01,2025-07-15_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=999 impostorscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 suspectscore=0 bulkscore=0 mlxscore=0
 priorityscore=1501 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507160059


On 7/4/2025 1:23 PM, Dikshita Agarwal wrote:
> The previous check to block capture port streaming before output port
> was incorrect and caused some valid usecase to fail. While removing that
> check allows capture port to enter streaming independently, it also
> introduced firmware errors due to premature queuing of DPB buffers
> before the firmware session was fully started which happens only when
> streamon is called on output port.
> 
> Fix this by deferring DPB buffer queuing to the firmware until both
> capture and output are streaming and state is 'STREAMING'.
> 
> Fixes: 11712ce70f8e ("media: iris: implement vb2 streaming ops")
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> ---
>  drivers/media/platform/qcom/iris/iris_buffer.c | 27 ++++++++++++++++++++++++++
>  drivers/media/platform/qcom/iris/iris_buffer.h |  1 +
>  drivers/media/platform/qcom/iris/iris_vb2.c    |  8 ++++----
>  3 files changed, 32 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
> index 809ce77744f996c23dc07ef9ecb3e8e92b709850..320ebfb833331294ba5ddda8e9cd243c80633408 100644
> --- a/drivers/media/platform/qcom/iris/iris_buffer.c
> +++ b/drivers/media/platform/qcom/iris/iris_buffer.c
> @@ -334,6 +334,29 @@ int iris_queue_buffer(struct iris_inst *inst, struct iris_buffer *buf)
>  	return 0;
>  }
>  
> +int iris_queue_internal_deferred_buffers(struct iris_inst *inst, enum iris_buffer_type buffer_type)
> +{
> +	struct iris_buffer *buffer, *next;
> +	struct iris_buffers *buffers;
> +	int ret = 0;
> +
> +	buffers = &inst->buffers[buffer_type];
> +	list_for_each_entry_safe(buffer, next, &buffers->list, list) {
> +		if (buffer->attr & BUF_ATTR_PENDING_RELEASE)
> +			continue;
> +		if (buffer->attr & BUF_ATTR_QUEUED)
> +			continue;
> +
> +		if (buffer->attr & BUF_ATTR_DEFERRED) {
> +			ret = iris_queue_buffer(inst, buffer);
> +			if (ret)
> +				return ret;
> +		}
> +	}
> +
> +	return ret;
> +}
> +
>  int iris_queue_internal_buffers(struct iris_inst *inst, u32 plane)
>  {
>  	const struct iris_platform_data *platform_data = inst->core->iris_platform_data;
> @@ -358,6 +381,10 @@ int iris_queue_internal_buffers(struct iris_inst *inst, u32 plane)
>  				continue;
>  			if (buffer->attr & BUF_ATTR_QUEUED)
>  				continue;
> +			if (buffer->type == BUF_DPB && inst->state != IRIS_INST_STREAMING) {
> +				buffer->attr |= BUF_ATTR_DEFERRED;
> +				continue;
> +			}
>  			ret = iris_queue_buffer(inst, buffer);
>  			if (ret)
>  				return ret;
> diff --git a/drivers/media/platform/qcom/iris/iris_buffer.h b/drivers/media/platform/qcom/iris/iris_buffer.h
> index 00825ad2dc3a4bd1ace32d7e95d15b95276315b0..b9b011faa13ae72e08545c191cdcc2f1bcaf9e0a 100644
> --- a/drivers/media/platform/qcom/iris/iris_buffer.h
> +++ b/drivers/media/platform/qcom/iris/iris_buffer.h
> @@ -105,6 +105,7 @@ int iris_get_buffer_size(struct iris_inst *inst, enum iris_buffer_type buffer_ty
>  void iris_get_internal_buffers(struct iris_inst *inst, u32 plane);
>  int iris_create_internal_buffers(struct iris_inst *inst, u32 plane);
>  int iris_queue_internal_buffers(struct iris_inst *inst, u32 plane);
> +int iris_queue_internal_deferred_buffers(struct iris_inst *inst, enum iris_buffer_type buffer_type);
>  int iris_destroy_internal_buffer(struct iris_inst *inst, struct iris_buffer *buffer);
>  int iris_destroy_all_internal_buffers(struct iris_inst *inst, u32 plane);
>  int iris_destroy_dequeued_internal_buffers(struct iris_inst *inst, u32 plane);
> diff --git a/drivers/media/platform/qcom/iris/iris_vb2.c b/drivers/media/platform/qcom/iris/iris_vb2.c
> index 8b17c7c3948798326ed4732ca50ebd98b833401f..e62ed7a57df2debf0a930ad8307e6d945f589922 100644
> --- a/drivers/media/platform/qcom/iris/iris_vb2.c
> +++ b/drivers/media/platform/qcom/iris/iris_vb2.c
> @@ -173,9 +173,6 @@ int iris_vb2_start_streaming(struct vb2_queue *q, unsigned int count)
>  
>  	inst = vb2_get_drv_priv(q);
>  
> -	if (V4L2_TYPE_IS_CAPTURE(q->type) && inst->state == IRIS_INST_INIT)
> -		return 0;
> -
>  	mutex_lock(&inst->lock);
>  	if (inst->state == IRIS_INST_ERROR) {
>  		ret = -EBUSY;
> @@ -203,7 +200,10 @@ int iris_vb2_start_streaming(struct vb2_queue *q, unsigned int count)
>  
>  	buf_type = iris_v4l2_type_to_driver(q->type);
>  
> -	ret = iris_queue_deferred_buffers(inst, buf_type);
> +	if (inst->state == IRIS_INST_STREAMING)
> +		ret = iris_queue_internal_deferred_buffers(inst, BUF_DPB);
> +	if (!ret)
> +		ret = iris_queue_deferred_buffers(inst, buf_type);
>  	if (ret)
>  		goto error;
>  
> 

Reviewed-by: Vikash Garodia <quic_vgarodia@quicinc.com>

