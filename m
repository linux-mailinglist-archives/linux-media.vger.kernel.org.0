Return-Path: <linux-media+bounces-34891-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15D3DADADFC
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 13:04:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B0B8917030C
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 11:04:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E25172BD584;
	Mon, 16 Jun 2025 11:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="gtJvFWmQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94F741E7C23;
	Mon, 16 Jun 2025 11:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750071857; cv=none; b=Wztl1l5xY4PdHhI0Wq5aaGprwkfwSo/0gSAfwNcnUPOgbofewYf4PNVcqs+MYS5QHwsNtJFQN6bgDAYQznJBgABuvwXGmIiYGuO+YpSv01CpaA2FeE2Sf2hBFd8fcjqmLv94sdAsZAiQPS3kBcnK4OIjQaxO7HSgXrqRqiZY0Rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750071857; c=relaxed/simple;
	bh=Jwp8Cj/zPQ4RWEW/ykeFLMMMsvvniNLODU2XcDsQxmQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=u8t/Cg2/ZaBilJ/VMXQJSRlMqNfmptWqkpOsmiigHGIeDJpXHOtCBAo1fHcsHM5F6KLTCzm/YAAKqPPNmHZFbMuUJW0igvEfLhXA6wBt5fPAZehCfE65YdOunWMRn2Qlzg5KCkYTCDlmYvKG/SnViaC3u8sEAPm1A+cWlUvhb9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=gtJvFWmQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55G8TcKe021517;
	Mon, 16 Jun 2025 11:04:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fpXXsxPhxQL6vsPElauKlyhm+eyLlFrQVxNOqFVvGJ8=; b=gtJvFWmQvzttj1mJ
	l/jyETWfE0CDUZJYDmimFLGjrfYjMV6cwlL4eSZ0mvk62L9gREEbIOvIBWuKaMaG
	UZwImKzJNiG+Q5/o7F/8UP2aDsa7YpAMA7H+iOL0DMyeMxMhGHwR1zy8fX0jlbCp
	aJZDYEWAO+i13j4wACTm+uePd3T2uK8Jz9W5vdB6E8zwtWuGLjxARRFACxjpR3HV
	G29ttICB81jo0u3tI0l2deibdWya/2s9kQL/7EaxZqHTuRsW1fGxXRkpr1aY/Rb4
	dGAt8vgIggNyK8Xswv+oA9Y2pveeraIWDPAi+FaON3q5Tonxr/0SZxfBTOdpAVoH
	XcBghg==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791enc7k8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Jun 2025 11:04:10 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55GB499x014454
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Jun 2025 11:04:09 GMT
Received: from [10.206.101.41] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 16 Jun
 2025 04:04:07 -0700
Message-ID: <41cba134-4c8c-bb6d-c68b-a7de8da0689c@quicinc.com>
Date: Mon, 16 Jun 2025 16:34:04 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v6 2/6] media: venus: vdec: Clamp parm smaller than 1fps
 and bigger than 240.
Content-Language: en-US
To: Ricardo Ribalda <ribalda@chromium.org>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Hans Verkuil
	<hverkuil@xs4all.nl>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>
References: <20250111-fix-cocci-v6-0-1aa7842006cc@chromium.org>
 <20250111-fix-cocci-v6-2-1aa7842006cc@chromium.org>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <20250111-fix-cocci-v6-2-1aa7842006cc@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: XNbSgwv2S_ebCPqChMA7VZBbBSidIG3Y
X-Authority-Analysis: v=2.4 cv=D6RHKuRj c=1 sm=1 tr=0 ts=684ffa2a cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8
 a=xOd6jRPJAAAA:8 a=cm27Pg_UAAAA:8 a=O9dv3vlXt8vYLVQyHzoA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: XNbSgwv2S_ebCPqChMA7VZBbBSidIG3Y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDA2OCBTYWx0ZWRfX3Ab9NvgPlSw3
 zZSfdUNTk/Ixb+Nuf2bxG8r/qrRjNsJ0DCDXNepfgDebNsbs3mCHK+VYhpbg1q3uyX92jO2DD6f
 AtVKjds6K5Wbgd//QRdEe4Gt6hiUnoVgqGQNISzfiR7qW7UWopFQH77knVl8etXtANIrYInTTbr
 cqxgQ3b+c40HBtFkBz38JTkgXKeSyKFhbQs5cew6rhnI75anqnRQP607xLow+utZ3ZqZqomsgXw
 RDSwUl7Wr7L6HTbJD/QQ3C9zspBh/VpQh0hWU8E5Pcd/x4sFpkB79eCpcizeTdRNSv9azWqvEwe
 jwcPKeFnEZSZfu3gDXWC9+V7HGM9Hu65ecRHZTas/egQS6roIEyryfxN9qgl3m8aPkDZYlbuLaE
 bEC6VoZEKg0QXX2JalPPnRc4+pdRiOWskGZQtFBi7Bop8Q/HC8zPs+gGQY3k/YV4SeRl6tcO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_05,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0 adultscore=0
 suspectscore=0 mlxlogscore=999 clxscore=1011 mlxscore=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506160068


On 1/11/2025 3:25 PM, Ricardo Ribalda wrote:
> The driver uses "whole" fps in all its calculations (e.g. in
> load_per_instance()). Those calculation expect an fps bigger than 1, and
> not big enough to overflow.
> 
> Clamp the value if the user provides a parm that will result in an invalid
> fps.
> 
> Reported-by: Hans Verkuil <hverkuil@xs4all.nl>
> Closes: https://lore.kernel.org/linux-media/f11653a7-bc49-48cd-9cdb-1659147453e4@xs4all.nl/T/#m91cd962ac942834654f94c92206e2f85ff7d97f0
> Fixes: 7472c1c69138 ("[media] media: venus: vdec: add video decoder files")
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/platform/qcom/venus/core.h | 2 ++
>  drivers/media/platform/qcom/venus/vdec.c | 5 ++---
>  2 files changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
> index 44f1c3bc4186..afae2b9fdaf7 100644
> --- a/drivers/media/platform/qcom/venus/core.h
> +++ b/drivers/media/platform/qcom/venus/core.h
> @@ -28,6 +28,8 @@
>  #define VIDC_RESETS_NUM_MAX		2
>  #define VIDC_MAX_HIER_CODING_LAYER 6
>  
> +#define VENUS_MAX_FPS			240
> +
>  extern int venus_fw_debug;
>  
>  struct freq_tbl {
> diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
> index 98c22b9f9372..c1d5f94e16b4 100644
> --- a/drivers/media/platform/qcom/venus/vdec.c
> +++ b/drivers/media/platform/qcom/venus/vdec.c
> @@ -481,11 +481,10 @@ static int vdec_s_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
>  	us_per_frame = timeperframe->numerator * (u64)USEC_PER_SEC;
>  	do_div(us_per_frame, timeperframe->denominator);
>  
> -	if (!us_per_frame)
> -		return -EINVAL;
> -
> +	us_per_frame = max(USEC_PER_SEC, us_per_frame);
This logic changes the actual fps from client. Consider a regular encode usecase
from client setting an fps as 30. The "max(USEC_PER_SEC, us_per_frame)" would
override it to USEC_PER_SEC and then the subsequent logic would eventually make
fps to 1.
Please make it conditional to handle the 0 fps case, i guess that the objective
in above code, something like below
if (!us_per_frame)
  us_per_frame = USEC_PER_SEC;

Regards,
Vikash
>  	fps = (u64)USEC_PER_SEC;
>  	do_div(fps, us_per_frame);
> +	fps = min(VENUS_MAX_FPS, fps);
>  
>  	inst->fps = fps;
>  	inst->timeperframe = *timeperframe;
> 

