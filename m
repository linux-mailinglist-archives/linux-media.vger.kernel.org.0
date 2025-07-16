Return-Path: <linux-media+bounces-37831-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E7F08B06DA0
	for <lists+linux-media@lfdr.de>; Wed, 16 Jul 2025 08:07:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0ED4B56563F
	for <lists+linux-media@lfdr.de>; Wed, 16 Jul 2025 06:07:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50D3928643D;
	Wed, 16 Jul 2025 06:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="MQA9oSd0"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9646417A2EB;
	Wed, 16 Jul 2025 06:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752646040; cv=none; b=FaKjFcPdWdBtoclsIW8pcJBYjPpN4ti3e8xvX4Ih4/P1iO+mdYgtfccI8sV3AVoKypCqQtN3Uj1YXZnzDk5wezkT9ZgSe219/ozuWu+tz2GtkLV3Eg0fKYc3eq0ta3ZFX6k4mRCi0JQCAOBPFTFP/NcdDJ0QKZsZX67gCe653zE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752646040; c=relaxed/simple;
	bh=brVT43guaUxBH9cKRv+mx2qGEqF+AA4ayarmzhm4gpk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=NZAaIfJSv4xkL8brkWrJwbcTMbcnEegkYJ0/hESBqsvJQHo6cIMX+RQIUTSWgLZg1IHrYySVQlPQIrJPfO7GUJgJwUC8twxwwzJ5yNEHrXV0xZFD5DXlqF0+sRdYyQELANd7zz0TbaNPSpWl5O61AjzxV3y11lLBnHv+ITmy6Oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=MQA9oSd0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56G5UFso025690;
	Wed, 16 Jul 2025 06:07:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Brdy5Yj1gdllVoAuZ8bVNwWA+ZXNu7kP2WNZay/H5OU=; b=MQA9oSd0mHRgNwQl
	+YCfwXLC2opMQXUk6BVwGiEg3D2Baty76Cll2YpvcamhkrGD/yX740l3uH/Bq0Ze
	srBxOhcfZSpNg+09f+Jy2Vpv7R1n4lKMTCUt5rLdZ9BzN5mM7ShobfO+cR42Iyvb
	kghhHwnE1EhzyLFX2xC83Ka7JVfKIHtzHN+p7VS/UDZdpzEQhtmIxBc1VcQ5Zqir
	Y0Neis3qqI1BXblEjyi9/++bWzKyOd2uqiVYlZRW9ioeTpV/mX9/dpOpHgJr/Z3o
	Cn7KKdYYNZ6qPgYj8MD/7x3VTcVGSamjTiq98cvX6D4/+Eh1EZuJ9F1W0AwUtrsY
	YqgXTg==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47wqsy2fpc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Jul 2025 06:07:13 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56G67CKX013513
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Jul 2025 06:07:12 GMT
Received: from [10.50.25.16] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 15 Jul
 2025 23:07:09 -0700
Message-ID: <adc18006-a0d0-e0ef-a16f-0767b6bc0a3d@quicinc.com>
Date: Wed, 16 Jul 2025 11:37:06 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 03/25] media: iris: Fix memory leak by freeing untracked
 persist buffer
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
 <20250704-iris-video-encoder-v1-3-b6ce24e273cf@quicinc.com>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <20250704-iris-video-encoder-v1-3-b6ce24e273cf@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE2MDA1MyBTYWx0ZWRfX2XycApSAncUa
 EfIqtOy7rVCipCG+F72XqpejaMWk0OIiLNFSzWpLooZcTSajAwzSm0aLCbzpLgWidRZuMbW6Y1i
 GLsYHyyUHIyg6lRqCRUr8dFileuX7WzMROt2FX01ealGe6lCLzNzGbcm7m5USgc6hlOp+y0EyMb
 3MCuuDmsWiKEZj92AqLyAVuNZ3MDi6+orkuxie2VuPbi/IOXGGjo3tvO+McLunrg1CGB7Tp9xWC
 GgP7fQvFwwSNXc86nLjbM76vYcPPbz5LKMXPQcuBBxAx8UzJRD0c/eBztLWYdo75FE+i0gW7T9+
 WkWXJ/Vxn/UWbMY+y361NNbQdaUzSnY6wKQIpZ5GrOmP9C/cgzdE8PP/ITgDgMetTwBSRO3PbIE
 9hdsHwBn8yBXtT3HoKnRV1NVkHhj/pIEGBCb5DQWAV9dSlwLPQzRkoAyU6gr4p5V2zZzIBPs
X-Proofpoint-GUID: 6sT2F3Z6hPqlfcY4Hw5hKvE23JkD8sTo
X-Proofpoint-ORIG-GUID: 6sT2F3Z6hPqlfcY4Hw5hKvE23JkD8sTo
X-Authority-Analysis: v=2.4 cv=McZsu4/f c=1 sm=1 tr=0 ts=68774191 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8
 a=k8oLQCBNWv00bTf7Y-QA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-16_01,2025-07-15_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxlogscore=999 impostorscore=0 mlxscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 spamscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507160053


On 7/4/2025 1:23 PM, Dikshita Agarwal wrote:
> One internal buffer which is allocated only once per session was not
> being freed during session close because it was not being tracked as
> part of internal buffer list which resulted in a memory leak.
> 
> Add the necessary logic to explicitly free the untracked internal buffer
> during session close to ensure all allocated memory is released
> properly.
> 
> Fixes: 73702f45db81 ("media: iris: allocate, initialize and queue internal buffers")
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> ---
>  drivers/media/platform/qcom/iris/iris_buffer.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
> index 6425e4919e3b0b849ba801ca9e01921c114144cd..9f664c241149362d44d3a8fa65e2266f9c2e80e0 100644
> --- a/drivers/media/platform/qcom/iris/iris_buffer.c
> +++ b/drivers/media/platform/qcom/iris/iris_buffer.c
> @@ -413,6 +413,16 @@ static int iris_destroy_internal_buffers(struct iris_inst *inst, u32 plane, bool
>  		}
>  	}
>  
> +	if (force) {
> +		buffers = &inst->buffers[BUF_PERSIST];
> +
> +		list_for_each_entry_safe(buf, next, &buffers->list, list) {
> +			ret = iris_destroy_internal_buffer(inst, buf);
> +			if (ret)
> +				return ret;
> +		}
> +	}
> +
>  	return 0;
>  }
>  
> 

Reviewed-by: Vikash Garodia <quic_vgarodia@quicinc.com>

