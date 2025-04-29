Return-Path: <linux-media+bounces-31289-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A6833AA086E
	for <lists+linux-media@lfdr.de>; Tue, 29 Apr 2025 12:23:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2981D841CD2
	for <lists+linux-media@lfdr.de>; Tue, 29 Apr 2025 10:23:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BA032BF3D6;
	Tue, 29 Apr 2025 10:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="GGgmhsB4"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A46D29B23E;
	Tue, 29 Apr 2025 10:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745922212; cv=none; b=W4sL4seXsv2DRSkVMA6ABtHCtlQ+l5VnHVklqiAbrYRCNrojepQMJoUyipQDdaR2DLFtfMuv1G6zePaGzzf8J9JtWbKcSG6uD1f2xwpaIbFPFq1CLXY43x6OFW6L53yUqBN6SlgvlVbquxZcciLV7MIbAHfBEG4kK64vs+/DiFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745922212; c=relaxed/simple;
	bh=PPEeSEGaX45e+jtAkOTmRmFBPa9nWtVC7p3hzMLLhiU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=AXjy+Iem/TWuReUu+Ybzy8g50GZORr09IsZlpXNKqrUEYq7jsBva+tvoyMeQkNnLjkCpDs7EPJtsxKKQFbeLJACi3yBOmHoLNnL84HiAn4B1rzA9iRdgnTjfQDhdtJCDymoL9pANEOZsx2Mj/HpnKZF4jE05aciPkmrcRysJ4v0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=GGgmhsB4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53TA9RIP023841;
	Tue, 29 Apr 2025 10:23:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ukYUbzX9sxf6BHYyfUSQGcXRkbpvnXWguUti6hUmQm0=; b=GGgmhsB40UoB6jYX
	GefQeicl3OVYevjR891Wq+jVtQgh01ib7bdmEWIVLv6z2zCqqD7joLmiGv3eqo8p
	qcggRvJrpcg25LAe7vOJ16FnTbrn7cbVethM0AlZP0UhwXyaMKpbXC9/Xjw/58Zt
	CntO0E7P/kXM3KroZNMRO8ObOh0PzXfBQ1VXB9eiH6U2COFeGwqag1poY38zHfVL
	sPZstlj4M5GkcjxqEHLI9Ml7X8mfEeQ1HjIKkZmc4OUz9p8rKo318jUcRLGXUggG
	YvM4tDIYxK2y8EeNCuhEjTCsViGitZnhes30pMCtTwXJU2BK8UkEonzjCJcwRtCq
	LK3B5w==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468muqmccu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Apr 2025 10:23:19 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53TANISA024347
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Apr 2025 10:23:18 GMT
Received: from [10.50.27.172] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 29 Apr
 2025 03:23:12 -0700
Message-ID: <3792552c-6447-4399-322b-448b1022f129@quicinc.com>
Date: Tue, 29 Apr 2025 15:53:10 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 10/23] media: iris: Prevent HFI queue writes when core
 is in deinit state
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
 <20250428-qcom-iris-hevc-vp9-v2-10-3a6013ecb8a5@quicinc.com>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <20250428-qcom-iris-hevc-vp9-v2-10-3a6013ecb8a5@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDA3NyBTYWx0ZWRfX10X+3GJFgc+a og+v3y/faEi0WQhTcSwiXuqnJ2ygttSnIFsg2+oXHXOsSdmoM+3YSOU5xWlzhF3dofV3z1gBp9Z klgpK3/4dH/wDKizNBbuExoPmO2KQo8WGmZWN7ND1aGmAP7N1bJCffAPDxX6OQbWAptZRR6X1w6
 pDZPsyK0pU0NbEPL2f+B1NEGBrq4IKmni7uXXp+trKZbfytX6zt60j804Dj8er6f7uYqtVKl2vY /Lr2KVJltcWf71MeuAp5i7uHE0mc+rEGEzOnzh5LQJ4ofxtjqCXd6GQgu9fiukjGzabhdLT0PT1 f9p/ALvn3+LRRIsuY+PydpKMw0a0mqaJgPCn4jDsSV74G11CMvkS42AoW6tF3WQq6U5WVSCk1yy
 ELJhj21wRs9PfNkXENmOEgltARCKI7HrJPvEp3323lQvUkE+8Qg8exHvND1+4zGLncsSj7Pg
X-Proofpoint-GUID: OtHAmKEeONYH1V9uksJ8qKEpEaBKHzvx
X-Proofpoint-ORIG-GUID: OtHAmKEeONYH1V9uksJ8qKEpEaBKHzvx
X-Authority-Analysis: v=2.4 cv=M/5NKzws c=1 sm=1 tr=0 ts=6810a897 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=te1TGoh6iaXk0xCdwo0A:9
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_03,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 mlxscore=0 spamscore=0 malwarescore=0 mlxlogscore=999
 adultscore=0 bulkscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290077


On 4/28/2025 2:58 PM, Dikshita Agarwal wrote:
> The current check only considers the core error state before allowing
> writes to the HFI queues. However, the core can also transition to the
> deinit state due to a system error triggered by the response thread.
> In such cases, writing to the HFI queues should not be allowed.
> 
> Fix this by adding a check for the core deinit state, ensuring that
> writes are rejected when core is not in a valid state.
> 
> Cc: stable@vger.kernel.org
> Fixes: fb583a214337 ("media: iris: introduce host firmware interface with necessary hooks")
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> ---
>  drivers/media/platform/qcom/iris/iris_hfi_queue.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_queue.c b/drivers/media/platform/qcom/iris/iris_hfi_queue.c
> index fac7df0c4d1a..221dcd09e1e1 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_queue.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_queue.c
> @@ -113,7 +113,7 @@ int iris_hfi_queue_cmd_write_locked(struct iris_core *core, void *pkt, u32 pkt_s
>  {
>  	struct iris_iface_q_info *q_info = &core->command_queue;
>  
> -	if (core->state == IRIS_CORE_ERROR)
> +	if (core->state == IRIS_CORE_ERROR || core->state == IRIS_CORE_DEINIT)
>  		return -EINVAL;
>  
>  	if (!iris_hfi_queue_write(q_info, pkt, pkt_size)) {
> 
Acked-by: Vikash Garodia <quic_vgarodia@quicinc.com>

