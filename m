Return-Path: <linux-media+bounces-37836-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 24790B06E50
	for <lists+linux-media@lfdr.de>; Wed, 16 Jul 2025 08:57:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 61B0117F661
	for <lists+linux-media@lfdr.de>; Wed, 16 Jul 2025 06:57:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C3D0288CB5;
	Wed, 16 Jul 2025 06:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="F/jKQFtb"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0AE8288529;
	Wed, 16 Jul 2025 06:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752649021; cv=none; b=diR7xmE7vketIKqM6tx+/eMJ8ssmQYemk8HPeQbf/wuT+HmnRZWLXF9uijpOBoHNwcCZmuO+RMRFsf89adLUyb4xHbRjGJwCgwak27Oz66MAGVgMRs82PkR1akS3FM2RmuyNntP98geKZhO61fe2mhAMxTSMS+4GxMcJiiyNeWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752649021; c=relaxed/simple;
	bh=fcY5vJ0S4zWlwt6Fh3IaXms71Iz1QaV9kWe8w+w68+Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=DgO5l5SQmcnblieGMMm3DQiGM9vA5qYs3f/fBdAzRqL8+ZQdogj0qhRyiVIkGbxd8RSpvNFp9fSP+hjmELhbVVw6NWWW91o3hRRQL6SI4TEph3r0tXo9fnCpC6w65Z9qB3xaG6xupgcO/tgYynMW27MiTytdUiGgfsGY95u9fc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=F/jKQFtb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56G66PIu029551;
	Wed, 16 Jul 2025 06:56:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sbyx4BOnzfHa7JtSrXqGBZDWqQhy0OmDr+HvzR+xytc=; b=F/jKQFtbqpmMmBaU
	Nj8ILAHIjyDFutg8ypBthwF71OC1JgHVSNYib5TGFi/dUnmD4BbJYtWBg7dLZmyd
	jfPqH2OfxEIl5xJ4RZjGYha2x7TaqN/3KbWuLVxzE9FH/cc/0PJ9MrcWbxyvEmqw
	CPakNTT7Jz92rrYB+dihTK09c7QqKcuuJ8OHD0NIIW0Fu4DGK28G538F1U1TqeGo
	aE33e9HY5yLAV4dseLqGblYFpYJxkoRzBXv0N1A/PDg7scKJgtdgUaFnXOCiAMO4
	6TTbOaQyp5K4UzVeyAEwOOz8TG8bLFKMk0eDeSFhWEzjFhWa52RGQSSdVnSYWMfy
	9GKZkQ==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufxb2wjm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Jul 2025 06:56:54 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56G6uroG003990
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Jul 2025 06:56:53 GMT
Received: from [10.216.39.173] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 15 Jul
 2025 23:56:50 -0700
Message-ID: <d641e3e3-a66b-9897-30b6-67766571d8f9@quicinc.com>
Date: Wed, 16 Jul 2025 12:26:47 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 08/25] media: iris: Update vbuf flags before
 v4l2_m2m_buf_done
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
 <20250704-iris-video-encoder-v1-8-b6ce24e273cf@quicinc.com>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <20250704-iris-video-encoder-v1-8-b6ce24e273cf@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: XRPnvpj42ITorhGrGkPMulHUxE_jM3cs
X-Proofpoint-ORIG-GUID: XRPnvpj42ITorhGrGkPMulHUxE_jM3cs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE2MDA2MSBTYWx0ZWRfX8uN6/XIcQs9F
 yVI3ObfPZM3Uw+BlQoWnMaiUP291UlrIPF79FVuqGVa1cphjqiIOj0T96SP7xHOQSKyGN1I8xxm
 7wMlDdldEVig4PiXB4jdyKDJhoRhBmClw1lcEWfpCOsfwMBI7MD6kcILFxwHX2lk8W0vKJ29kvn
 0i0F6YYB3dB9IrHKetiDvaub5dA3ZNamtsdpYki1KP9rJxF+TkxZHM/bmRnheWC9vxDEG3Jwu5C
 KEuAr5T6jSbeO3dBzGXZy5OOxqHhzSVEwBmsOrbeURI1VE1YUTrbNcbGkYVF4WdUNXU8ZQwCp2M
 Ny4uEcpQ7tQHID9pfmqgPnErqgibqZH+3lZPOXd9U6H63ni42p4d+HN/mX7vJa9FJ9xXBk03k1v
 uNhsQYSJj/q1CS2dvlrFd/P/mVQnQ3Tl73QI2DqTvKcGISxuLRT8O5hyx3wA7h4FpAELXrqO
X-Authority-Analysis: v=2.4 cv=Xc2JzJ55 c=1 sm=1 tr=0 ts=68774d36 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8
 a=p-yMKd15KcwkGxgquyQA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-16_01,2025-07-15_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0 priorityscore=1501 adultscore=0 mlxlogscore=999
 phishscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 clxscore=1015 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507160061



On 7/4/2025 1:23 PM, Dikshita Agarwal wrote:
> Update the vbuf flags appropriately in error cases before calling
> v4l2_m2m_buf_done(). Previously, the flag update was skippied in error
> scenario, which could result in incorrect state reporting for buffers.
> 
> Fixes: 17f2a485ca67 ("media: iris: implement vb2 ops for buf_queue and firmware response")
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> ---
>  drivers/media/platform/qcom/iris/iris_buffer.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
> index 320ebfb833331294ba5ddda8e9cd243c80633408..3ab533310b2dfece11ea31b30d29ecb32e0c3f87 100644
> --- a/drivers/media/platform/qcom/iris/iris_buffer.c
> +++ b/drivers/media/platform/qcom/iris/iris_buffer.c
> @@ -651,6 +651,8 @@ int iris_vb2_buffer_done(struct iris_inst *inst, struct iris_buffer *buf)
>  
>  	vb2 = &vbuf->vb2_buf;
>  
> +	vbuf->flags |= buf->flags;
> +
>  	if (buf->flags & V4L2_BUF_FLAG_ERROR) {
>  		state = VB2_BUF_STATE_ERROR;
>  		vb2_set_plane_payload(vb2, 0, 0);
> @@ -659,8 +661,6 @@ int iris_vb2_buffer_done(struct iris_inst *inst, struct iris_buffer *buf)
>  		return 0;
>  	}
>  
> -	vbuf->flags |= buf->flags;
> -
>  	if (V4L2_TYPE_IS_CAPTURE(type)) {
>  		vb2_set_plane_payload(vb2, 0, buf->data_size);
>  		vbuf->sequence = inst->sequence_cap++;
> 

Reviewed-by: Vikash Garodia <quic_vgarodia@quicinc.com>

