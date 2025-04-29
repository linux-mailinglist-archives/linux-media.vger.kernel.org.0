Return-Path: <linux-media+bounces-31291-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A2165AA087B
	for <lists+linux-media@lfdr.de>; Tue, 29 Apr 2025 12:25:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 359D71B6171E
	for <lists+linux-media@lfdr.de>; Tue, 29 Apr 2025 10:25:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5EC22BEC5F;
	Tue, 29 Apr 2025 10:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="CkUBWnp+"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EA1B2746A;
	Tue, 29 Apr 2025 10:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745922312; cv=none; b=ljJAJwUN+joCNN7hEbB3i2Xuy2h8Kbe1EwpO/zH6Ri99kOmfGi/+wLcbnyOYBd4LnBvl7VqSMKw/8T2HUulAiQDX+N+ltwk6k/bmgO+OZ2qWqb7vqIJ2R1C+B2gm7WYhCWHoq62SYTBM+t/0EEofxAhi7RCsuey2SmHHTLbknw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745922312; c=relaxed/simple;
	bh=iJRLO9E8xdLshgIRzy4pVafjrnBNbzeW2xLevBaamRA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=RqRyNFXWi7WtXQ4U0pYeHXBek+le55s+AGpySgDd8URU+nOuSQ5Rn+4WV4L5uuvgEBN0OOjuT5jKx8ze8VIAeDNJIs1KGACly3SqClLQckJUBSlznZPU9bfO6QxRwhHaaeIFY8fz85rmTnipM0jN3ox1zXvPWr6N1bCiRwOtGv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=CkUBWnp+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53TA2Fs0020034;
	Tue, 29 Apr 2025 10:25:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tLz8JRx+kh9f97txZ9uQj+OkyrzqXbDZ/mlBzzndmkg=; b=CkUBWnp+YXgYTBI3
	q5VnY4KPJBTrZIQ44gZ5T0ZjXzJwGYqeRAwnyrCEGn4b7ngcv3k8Tv6bxoOHIx3D
	KuXpzYWkL2Fe4J6Ws1rcXAY70ll3+npSJnb/6JRO7us/FXMQpjPWfPy3mYNRVGG3
	ooR95XOnUVb1pTlTfKs1Uy16AzC2DvPrHgTdc0DWuzs4VZeC7M7KnGIcNPMtRddd
	bUzEG7z01PbxlKNLTbKTCFBymhztMOU0AtOw0STMDGicC7+WrWJEBR4bM4DdBSkk
	psEGedMWRTTlPlDKLYeVAmVYH3HGJiYzkTLAJsgmFcO5kSX2BDV9r/BeqZvqMOB7
	SNUb0w==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468r8hu3ue-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Apr 2025 10:25:05 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53TAP5JG023127
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Apr 2025 10:25:05 GMT
Received: from [10.50.27.172] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 29 Apr
 2025 03:24:59 -0700
Message-ID: <eddd4f29-851b-fa2a-19f6-3a09db938e69@quicinc.com>
Date: Tue, 29 Apr 2025 15:54:56 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 11/23] media: iris: Remove redundant buffer count check
 in stream off
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
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
References: <20250428-qcom-iris-hevc-vp9-v2-0-3a6013ecb8a5@quicinc.com>
 <20250428-qcom-iris-hevc-vp9-v2-11-3a6013ecb8a5@quicinc.com>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <20250428-qcom-iris-hevc-vp9-v2-11-3a6013ecb8a5@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: gKcyKpwxjnQ2d5i4Lq0v-0sl3k1DySD2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDA3NyBTYWx0ZWRfX8FIO7K7aFSQJ sZ8ZjDXFqIp5o+TfCa7AiIzyBX2Fz2EPpvB4NeoyE2O5NOfso1nNhItTlJ47f4T5AT5Gc2QNN/b hNtbiDVgzes9IIn1XZ3O7Y9gQ4spAOpZvA3WqtLOhZfjpJ9kglY8hyZcoEsQcWOarC0lSvZT4LQ
 tTvjFahm2b1SulemDPI5BEqm52HrPsai3PrmclWCa5EJSPfBPagM1Kl2GJAxk+x+v19H8qBKnhg j4eL+vbyCC7cAIofx5uMk/Xk3Vh/wW+So3acrce9YlrWtKWgmqNbsuRKjAl25iVwXiUyxakurQM itlQlghp4d6JYDiP0VHb3sBLjdtnL+MN/l6SleoyqestmntEuADa2lY7oxQVg3r9XaDg1GVtd94
 bpiwAlYlxOqi2X6/hmVxjDuEb/Rh0zsesF0x2uzSDRY4NJjJDikQwy4PXB128q9X08FzSszA
X-Authority-Analysis: v=2.4 cv=cfzSrmDM c=1 sm=1 tr=0 ts=6810a901 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=h_IFN2Usk05XYaXSUHMA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: gKcyKpwxjnQ2d5i4Lq0v-0sl3k1DySD2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_03,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=999 adultscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290077



On 4/28/2025 2:58 PM, Dikshita Agarwal wrote:
> Currently, the stream off process checks the count of buffers in
> v4l2_m2m_queues using v4l2_m2m_for_each_src_buf_safe and
> v4l2_m2m_for_each_dst_buf_safe APIs. If the count is non-zero, it
> returns an error. This check is redundant as the V4L2 framework already
> handles buffer management internally.
> 
> Remove the unnecessary buffer count check in stream off, simplifying the
> process and relying on V4L2's internal mechanisms for buffer management.
> 
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> ---
>  drivers/media/platform/qcom/iris/iris_vdec.c | 36 ----------------------------
>  1 file changed, 36 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
> index d162cc9650f5..30a9969bc368 100644
> --- a/drivers/media/platform/qcom/iris/iris_vdec.c
> +++ b/drivers/media/platform/qcom/iris/iris_vdec.c
> @@ -244,35 +244,6 @@ void iris_vdec_src_change(struct iris_inst *inst)
>  	v4l2_event_queue_fh(&inst->fh, &event);
>  }
>  
> -static int iris_vdec_get_num_queued_buffers(struct iris_inst *inst,
> -					    enum iris_buffer_type type)
> -{
> -	struct v4l2_m2m_ctx *m2m_ctx = inst->m2m_ctx;
> -	struct v4l2_m2m_buffer *buffer, *n;
> -	struct iris_buffer *buf;
> -	u32 count = 0;
> -
> -	switch (type) {
> -	case BUF_INPUT:
> -		v4l2_m2m_for_each_src_buf_safe(m2m_ctx, buffer, n) {
> -			buf = to_iris_buffer(&buffer->vb);
> -			if (!(buf->attr & BUF_ATTR_QUEUED))
> -				continue;
> -			count++;
> -		}
> -		return count;
> -	case BUF_OUTPUT:
> -		v4l2_m2m_for_each_dst_buf_safe(m2m_ctx, buffer, n) {
> -			buf = to_iris_buffer(&buffer->vb);
> -			if (!(buf->attr & BUF_ATTR_QUEUED))
> -				continue;
> -			count++;
> -		}
> -		return count;
> -	default:
> -		return count;
> -	}
> -}
>  
>  static void iris_vdec_flush_deferred_buffers(struct iris_inst *inst,
>  					     enum iris_buffer_type type)
> @@ -321,7 +292,6 @@ int iris_vdec_session_streamoff(struct iris_inst *inst, u32 plane)
>  {
>  	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
>  	enum iris_buffer_type buffer_type;
> -	u32 count;
>  	int ret;
>  
>  	switch (plane) {
> @@ -339,12 +309,6 @@ int iris_vdec_session_streamoff(struct iris_inst *inst, u32 plane)
>  	if (ret)
>  		goto error;
>  
> -	count = iris_vdec_get_num_queued_buffers(inst, buffer_type);
> -	if (count) {
> -		ret = -EINVAL;
> -		goto error;
> -	}
> -
>  	ret = iris_inst_state_change_streamoff(inst, plane);
>  	if (ret)
>  		goto error;
> 

Acked-by: Vikash Garodia <quic_vgarodia@quicinc.com>

