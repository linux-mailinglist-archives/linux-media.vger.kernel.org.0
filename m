Return-Path: <linux-media+bounces-31297-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A054AA08DC
	for <lists+linux-media@lfdr.de>; Tue, 29 Apr 2025 12:47:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 11D4C3AC630
	for <lists+linux-media@lfdr.de>; Tue, 29 Apr 2025 10:46:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7F432C108D;
	Tue, 29 Apr 2025 10:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="NulwpGXw"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3808176ADB;
	Tue, 29 Apr 2025 10:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745923621; cv=none; b=ENrz4KMpyunRO79LIIon8qneLXpsoWmLmtVVyXTdfh2QsUAfAcBVXENf6rD5fuV2ygZry4hmAgxehajlehXrVLkou8NxJboDnffUaY/dM50lh4mzkHhMNTqzh9DC9jTEaoIH8qUtFsgyUFj6upFJAs02PXprDH/LsCQjwvBN59U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745923621; c=relaxed/simple;
	bh=Ip+p8O7916rV0wPGHwihsQzqN4X5FJnPhXUEjT016aI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=LvGhwgdmDpyCY/WQTh5kRb4pHZpdVUwFFpL377zN5rYXqIkvTNbPUei3cY01o+UtHO1HyBP28tuRZHLxqcjtDDbri+2TOwEJ7/n2b6Ix/IXYXoeD4fLsg5KjPqyGyRWcdnnmQKfQS0b7CmOggTC1SzTaXGdFUU4hc25wzinh7sM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=NulwpGXw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53TAFtU0015798;
	Tue, 29 Apr 2025 10:46:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UeMi33mdR+WzE4oHOtk8LqBE6AfpDNDdTGFV/LIPOjo=; b=NulwpGXwL/skLQIx
	Yf7Jof+YTndedpANcCrW7uFPsz872FY+xFebxWLo+j06gc+d/io3727of9FZ8CEp
	XLwwVNwldLC3KkFaR8083VzUYpMYX5IrKz5e0eRAKbD2/iMep9Y/rXNdzlYjPdUL
	FiDOcpXcNck/TO9jo7oE4tq5K5ScBz02+yrhE5UNrruxyPp+3DQFC7kfg3dBUq8O
	5bOgFOQIZb4YfVKFH1MYcDOrTn/GRBwECek+Ihv773bNHtHxfCyFwWAXtDCJlA4h
	6QSEfyRXP07WcCb0VqLufM4jnc7Ds+AU86p8qiVPI3kNjbqtOMEGVGK/+eoTSreg
	Gy0ylQ==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468q3245wf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Apr 2025 10:46:54 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53TAkrR7027811
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Apr 2025 10:46:53 GMT
Received: from [10.50.27.172] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 29 Apr
 2025 03:46:47 -0700
Message-ID: <0f08867b-7724-cb76-d621-0bbe4d5fdc64@quicinc.com>
Date: Tue, 29 Apr 2025 16:16:44 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 18/23] media: iris: Fix buffer preparation failure
 during resolution change
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
 <20250428-qcom-iris-hevc-vp9-v2-18-3a6013ecb8a5@quicinc.com>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <20250428-qcom-iris-hevc-vp9-v2-18-3a6013ecb8a5@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=M7xNKzws c=1 sm=1 tr=0 ts=6810ae1f cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=cjVhqke6_UvC8fBLecYA:9
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: ukDstp8FfCRwgCVmTJQUP-0Lmp4bnL_V
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDA3OSBTYWx0ZWRfX97dKtHj/FVNe XXxHH+LyljR55itq64rzzbGmA5mZ/B4+dBYnmvfPpeASQQOxzpGCcrassrkrzm1QmNu25v2ZOlR MUjFD+wizPiR6iAQwQFW54WqMKNohkibR9naI5AmWOUDwA+CZia7gBu3kkTLd0wjU+EPnwW8MwN
 qgB8gHeP/r7LPbDbUApaP4NrISQldEDSW/CfMXCCEihH1as40+q+OFMcJIjl1x5gZrcneMq+z5h Vdrdf37TedNE5i6gjjgwkj287NvGj5urgTDOsaW7n/Ei9jRMhfW2przUv++BDJVI/4vpsHM4Bqz +H5cuZIuBc6xqscjAlizSE/HbzW1Cy3w+SiA/GCFwma3yJ1KuE5XrhGDf2faUFIDXpE5lWnW6AU
 6rPAzvqEFJveBjNla7CZO4Z8F4CbSv+vh8KHyNOrt7Pxm3YJOwcaSj+YnmoldmjAzbNRS5ia
X-Proofpoint-ORIG-GUID: ukDstp8FfCRwgCVmTJQUP-0Lmp4bnL_V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_03,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 clxscore=1015 mlxlogscore=999 spamscore=0 phishscore=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290079


On 4/28/2025 2:59 PM, Dikshita Agarwal wrote:
> When the resolution changes, the driver internally updates the width and
> height, but the client continue to queue buffers with the older
> resolution until the last flag is received. This results in a mismatch
> when the buffers are prepared, causing failure due to outdated size.
> 
> Introduce a check to prevent size validation during buffer preparation
> if a resolution reconfiguration is in progress, to handle this.
> 
> Cc: stable@vger.kernel.org
> Fixes: 17f2a485ca67 ("media: iris: implement vb2 ops for buf_queue and firmware response")
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> ---
>  drivers/media/platform/qcom/iris/iris_vb2.c | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_vb2.c b/drivers/media/platform/qcom/iris/iris_vb2.c
> index 23473cbd0b2e..7671df0e1c69 100644
> --- a/drivers/media/platform/qcom/iris/iris_vb2.c
> +++ b/drivers/media/platform/qcom/iris/iris_vb2.c
> @@ -259,13 +259,14 @@ int iris_vb2_buf_prepare(struct vb2_buffer *vb)
>  			return -EINVAL;
>  	}
>  
> -	if (vb->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE &&
> -	    vb2_plane_size(vb, 0) < iris_get_buffer_size(inst, BUF_OUTPUT))
> -		return -EINVAL;
> -	if (vb->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE &&
> -	    vb2_plane_size(vb, 0) < iris_get_buffer_size(inst, BUF_INPUT))
> -		return -EINVAL;
> -
> +	if (!inst->in_reconfig) {
Remove the flag and replace with state check. With that

Reviewed-by: Vikash Garodia <quic_vgarodia@quicinc.com>

> +		if (vb->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE &&
> +		    vb2_plane_size(vb, 0) < iris_get_buffer_size(inst, BUF_OUTPUT))
> +			return -EINVAL;
> +		if (vb->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE &&
> +		    vb2_plane_size(vb, 0) < iris_get_buffer_size(inst, BUF_INPUT))
> +			return -EINVAL;
> +	}
>  	return 0;
>  }
>  
> 

