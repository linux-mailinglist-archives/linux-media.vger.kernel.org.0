Return-Path: <linux-media+bounces-17323-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 062959682E8
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2024 11:17:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 37A401C218C1
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2024 09:17:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B95F17CA1F;
	Mon,  2 Sep 2024 09:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="C9cghbs9"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CA321C68C
	for <linux-media@vger.kernel.org>; Mon,  2 Sep 2024 09:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725268627; cv=none; b=h/30nb3uO8Ya6chOj0ildQVWqD4O6P5vdvK9Om47w1eEXNfNr9r17nwa5SgjGeSv99LYhFvNbIjNAren7r4XXa4gvCM/1fIOksWEsZBnjAMDxRlyTt5ukViVIBKnq5cDGMP6mMcqieUZpk3UDBMdxHuvZM4NhnmKkqtgbJtDwG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725268627; c=relaxed/simple;
	bh=k/uYvqMGzRKX4A15SP6rwBDTP0Q8SF+/TQgOGOeXv40=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ZNMqPDq594iEzBHln7hI0lL8Qun45cPAwR3zyc7AXgPpp7OT8lmjBojjsBRDfAsLD9mt/68C+8IHnbfYg/djh01Haq5Clt+xGLGXzG/ub8DC8k/N4uArY3XZmYNu2oMnXNkSqstILdzd71MO2UA8mJz9wU4gWe9OVp9yE6eSn6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=C9cghbs9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4820eux7031298;
	Mon, 2 Sep 2024 09:17:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VaA83ENynSQETFGQWP9OqfIuEuxp7wXuVN7m+M2vOPw=; b=C9cghbs9XcBa5AUq
	4voHmS+QJahzgGWy0a2IGnfg1mUk9UaYb+vyjYKAS7t+z8n4sZ94AnUxm/Tudfv2
	WjtzcS7pSPqB5MPPS2Peceyf3pHkfsOHHqfUOnAvyxGObcYWapk4U8LPvsHR4juy
	78dwYqtq29znTp/IacaQ0aG3lumZ8Npckhv8VKRP5r5vF3u2O8dZDX6vpqGexoBl
	R40v0h9qsQcqgO1h4bxlIWbw0/OwcYbKan6LUh+3AEXfwyd2OsuTT+zIXK3tpfUa
	105caCN7wJ/DRf6zhNUZfe2OUIl6shJRwyNWT4f4XDeE+XhRjSN6TMuwb1qQKbbE
	dVw8rw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41bt4rc60j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 02 Sep 2024 09:17:04 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4829H3j6002255
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 2 Sep 2024 09:17:03 GMT
Received: from [10.204.101.50] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 2 Sep 2024
 02:17:02 -0700
Message-ID: <b881e7ac-abc7-1b63-df8a-81df32863470@quicinc.com>
Date: Mon, 2 Sep 2024 14:46:59 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 4/4] media: venus: add missing wait_prepare/finish ops
Content-Language: en-US
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, <linux-media@vger.kernel.org>
CC: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>
References: <cover.1725265884.git.hverkuil-cisco@xs4all.nl>
 <ef6958db1e5d5a9f50cf4db6056c22b49c2a1e65.1725265884.git.hverkuil-cisco@xs4all.nl>
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
In-Reply-To: <ef6958db1e5d5a9f50cf4db6056c22b49c2a1e65.1725265884.git.hverkuil-cisco@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: O9zJMlruWWMqyRCH2N-gj014Qq-cnxgc
X-Proofpoint-ORIG-GUID: O9zJMlruWWMqyRCH2N-gj014Qq-cnxgc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-09-02_02,2024-08-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 bulkscore=0 malwarescore=0 impostorscore=0 mlxlogscore=999
 priorityscore=1501 spamscore=0 mlxscore=0 clxscore=1011 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2409020076



On 9/2/2024 2:01 PM, Hans Verkuil wrote:
> Without these ops the v4l2-compliance blocking wait test will fail.
> These ops are required to ensure that when VIDIOC_DQBUF has to
> wait for buffers to arrive, the queue lock is correctly released
> and retaken. Otherwise the wait for a buffer would block all other
> queue ioctls.
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Cc: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>
> ---
>  drivers/media/platform/qcom/venus/vdec.c | 2 ++
>  drivers/media/platform/qcom/venus/venc.c | 2 ++
>  2 files changed, 4 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
> index d12089370d91..666309f684f1 100644
> --- a/drivers/media/platform/qcom/venus/vdec.c
> +++ b/drivers/media/platform/qcom/venus/vdec.c
> @@ -1390,6 +1390,8 @@ static const struct vb2_ops vdec_vb2_ops = {
>  	.buf_prepare = venus_helper_vb2_buf_prepare,
>  	.start_streaming = vdec_start_streaming,
>  	.stop_streaming = vdec_stop_streaming,
> +	.wait_prepare = vb2_ops_wait_prepare,
> +	.wait_finish = vb2_ops_wait_finish,
>  	.buf_queue = vdec_vb2_buf_queue,
>  };
>  
> diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
> index 3ec2fb8d9fab..5804a4911537 100644
> --- a/drivers/media/platform/qcom/venus/venc.c
> +++ b/drivers/media/platform/qcom/venus/venc.c
> @@ -1319,6 +1319,8 @@ static const struct vb2_ops venc_vb2_ops = {
>  	.buf_prepare = venus_helper_vb2_buf_prepare,
>  	.start_streaming = venc_start_streaming,
>  	.stop_streaming = venus_helper_vb2_stop_streaming,
> +	.wait_prepare = vb2_ops_wait_prepare,
> +	.wait_finish = vb2_ops_wait_finish,
>  	.buf_queue = venc_vb2_buf_queue,
>  };
>  
Reviewed-by: Dikshita Agarwal <quic_dikshita@quicinc.com>

