Return-Path: <linux-media+bounces-37832-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DB150B06DA7
	for <lists+linux-media@lfdr.de>; Wed, 16 Jul 2025 08:09:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E3F523B050A
	for <lists+linux-media@lfdr.de>; Wed, 16 Jul 2025 06:08:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1ACB2E8DED;
	Wed, 16 Jul 2025 06:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ZE0otUxH"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5D7228643D;
	Wed, 16 Jul 2025 06:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752646147; cv=none; b=fIIow6bhx19THDQW3o6RRaofHMdIFFZKMwqbItfAw2ax+yo4dCMU0G2rKPnWfgfjc44Ecy53sfJecNkbTzHeeCO9Wlb2NE3fOD0qUVaoZHqmbZY9x2IYgQFyACypDkMcKYrXVAYF6tSzBZ0D8VddXjRNDtU7Dg1qS9RhW3JcTJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752646147; c=relaxed/simple;
	bh=WXik5hm0YBezPzduWKdaaPdlhUv2rICd8xQLuIP16Ok=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=mu4X3SWSm/qwcyOkItO1kwb1pmh3uVLSsXjgOK++IATeHa49T8VEcvYL2k/Zg33NOX/REFLTFXJhHg/35ey35uOHHxt2VfSbcB2GjrabPQuK7yUrpZA5H/gpK3mQlCfEMf45KX/+o3Xdms0bVmVZDxMR+35fiTmDtFRmE8tkza4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ZE0otUxH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56G5oUUi014550;
	Wed, 16 Jul 2025 06:09:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sGWMYfKYXHBTO6nQiM4Oenkg/Zl+chXD+X/m7Iz33oU=; b=ZE0otUxHuyk55pOC
	qfm+q/UCrVVHk9MRFH97RHnm8fRFnLBV99jgr+7luG47Hw1z2YKaRXCXrOTh1b65
	iHWaMEZsAalsrKCDnKagEciGyydsY/NfQcBec8C+FF3WoBEbtw+I+vcuWV6AGUrl
	d9WDhzTVo1PmyH+8ZE6UsLwI9gXBG6yaDx9Xz9W6D8X4NPAV1BixR7ol5B7bzmAa
	SAeZ3DuvYYFO1iYnsYVqx6KTXRajDO/0xSJsfH0bzZbU2VTreXmEFtoVg4LIiT/9
	n0Oy2oSHh4Tm/t+LHATvXsDPowQ3aBUMcRqHWLt2CXJvWBuAvegnvsoJLXXUUWc7
	VDgyBw==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47w5dynkv5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Jul 2025 06:08:59 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56G68xTh031062
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Jul 2025 06:08:59 GMT
Received: from [10.50.25.16] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 15 Jul
 2025 23:08:56 -0700
Message-ID: <b755aa4f-0083-29f8-f846-fa9523c660b1@quicinc.com>
Date: Wed, 16 Jul 2025 11:38:52 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 04/25] media: iris: Fix buffer timestamp handling
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
 <20250704-iris-video-encoder-v1-4-b6ce24e273cf@quicinc.com>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <20250704-iris-video-encoder-v1-4-b6ce24e273cf@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Dt-EGGMuhEJZ9ZSGwpHQCKT-RfsgFqeN
X-Authority-Analysis: v=2.4 cv=RtXFLDmK c=1 sm=1 tr=0 ts=687741fb cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8
 a=sEUFuLeS8ZX_1iLzen0A:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE2MDA1MiBTYWx0ZWRfX2vsSadzaq8fc
 bRHRcytcAtQ9GDMN/ugW/x/NoKnbcoKc7elaOcUTG6v3HAjvofgJBEBzV3rdo3h/q7vTU3A34p0
 cwQgPSGwFCxIYsc9n5ztlrS3CTcKJJZZXo0OQyCvIphlR9t7m6DeInd6BDXdciwYGE8VzqjStHJ
 78BaVAdoXczkvivv+WrOQZJ6gPq5XOtoXrkr/Bqjh/wSUwqzny0qnKyff/SHOlUmeb30REPQbAf
 9xJ2RJ4vafTpsH1Rt3jib5OndchdfnAaktJPWq5EVQElAMwGjFmcXeHENzo28Dq2Zg8E2/5Uuze
 YOVYY66YrU64pq7eVrp7Zk7h3eO2TY+XEvhVPyFHA6s9nqzksmGC4tQ4pxGMjetAnrAfiiJG9fw
 xl+uKULRgh5uojL2pHoPmBjEKpnLaYRNL0CVc3eJAxouMXX3gdHprqwyPtrYUeGQJcoyLywT
X-Proofpoint-GUID: Dt-EGGMuhEJZ9ZSGwpHQCKT-RfsgFqeN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-16_01,2025-07-15_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 mlxlogscore=999
 priorityscore=1501 phishscore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507160052


On 7/4/2025 1:23 PM, Dikshita Agarwal wrote:
> The internal driver logic operates with timestamps in microseconds
> while the buffer timestamp received by vb2 is in nanosecond, this
> mismatch in units causing issue in buffer handling.
> Update the timestamp handling logic by converting the buffer timestamp
> to microseconds before using it internally in driver for all the
> timestamp assignments, comparisons, and metadata handling.
> 
> Fixes: 17f2a485ca67 ("media: iris: implement vb2 ops for buf_queue and firmware response")
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> ---
>  drivers/media/platform/qcom/iris/iris_buffer.c | 6 +++---
>  drivers/media/platform/qcom/iris/iris_vdec.c   | 1 +
>  2 files changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
> index 9f664c241149362d44d3a8fa65e2266f9c2e80e0..809ce77744f996c23dc07ef9ecb3e8e92b709850 100644
> --- a/drivers/media/platform/qcom/iris/iris_buffer.c
> +++ b/drivers/media/platform/qcom/iris/iris_buffer.c
> @@ -579,14 +579,14 @@ iris_helper_find_buf(struct iris_inst *inst, u32 type, u32 idx)
>  		return v4l2_m2m_dst_buf_remove_by_idx(m2m_ctx, idx);
>  }
>  
> -static void iris_get_ts_metadata(struct iris_inst *inst, u64 timestamp_ns,
> +static void iris_get_ts_metadata(struct iris_inst *inst, u64 timestamp_us,
>  				 struct vb2_v4l2_buffer *vbuf)
>  {
>  	u32 mask = V4L2_BUF_FLAG_TIMECODE | V4L2_BUF_FLAG_TSTAMP_SRC_MASK;
>  	u32 i;
>  
>  	for (i = 0; i < ARRAY_SIZE(inst->tss); ++i) {
> -		if (inst->tss[i].ts_ns != timestamp_ns)
> +		if (inst->tss[i].ts_us != timestamp_us)
>  			continue;
>  
>  		vbuf->flags &= ~mask;
> @@ -653,7 +653,7 @@ int iris_vb2_buffer_done(struct iris_inst *inst, struct iris_buffer *buf)
>  	}
>  
>  	state = VB2_BUF_STATE_DONE;
> -	vb2->timestamp = buf->timestamp;
> +	vb2->timestamp = buf->timestamp * NSEC_PER_USEC;
>  	v4l2_m2m_buf_done(vbuf, state);
>  
>  	return 0;
> diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
> index d670b51c5839d1fad54d34f373cf71d5f3973a96..05340e201e6538b9599387cdd57814005b904e76 100644
> --- a/drivers/media/platform/qcom/iris/iris_vdec.c
> +++ b/drivers/media/platform/qcom/iris/iris_vdec.c
> @@ -561,6 +561,7 @@ iris_vdec_vb2_buffer_to_driver(struct vb2_buffer *vb2, struct iris_buffer *buf)
>  	buf->data_size = vb2->planes[0].bytesused - vb2->planes[0].data_offset;
>  	buf->flags = vbuf->flags;
>  	buf->timestamp = vb2->timestamp;
> +	do_div(buf->timestamp, NSEC_PER_USEC);
>  	buf->attr = 0;
>  
>  	return 0;
> 

Reviewed-by: Vikash Garodia <quic_vgarodia@quicinc.com>

