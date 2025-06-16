Return-Path: <linux-media+bounces-34892-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81331ADAE12
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 13:12:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 95C2A7A5234
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 11:11:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C8352BDC13;
	Mon, 16 Jun 2025 11:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="pw+7hxgU"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E8CD1E501C;
	Mon, 16 Jun 2025 11:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750072342; cv=none; b=Go1TMJxxocdqw4sNMKvs9evAA3rJYayEIaCZokQGRCDsmp2xzoFpYiY+RNcjVti4lUS5Q8Drlk9XL4nkwHadtRACSt1Hb0mvlNpOAi7dl7HT7vvF8gXTfx2NdW4u/FAF6Qa43pgjndEEgC4dnYGA+9GOPnyu5thNq2lY2Wse+Nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750072342; c=relaxed/simple;
	bh=WGzNGO3lIPYDloeJR3aJPRiPn403uKOywfs8xEaXtnQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=j4UxAxUcWl6osO7EQ1onSr0Myjlbzf7rEDv+aJEQuVjvRcAvUjyoUFU+lcwg4SuzuKXY1AN4TVRoGUYSzY6Nk8LuIF5kPNg8U39KjxFOpnIApmHeNNOp45krMUiULJx2q5EFOUafOIoSfOPaT5R6YoXwmc8C4sLhVqRjVZ37Pe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=pw+7hxgU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55G8RdWk011453;
	Mon, 16 Jun 2025 11:12:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	leBc6fZBIomVby0EfSV8k329aHAGzln5Z1LAo1xILA4=; b=pw+7hxgUivmXwfso
	XIH5PxM5+T+WtSzJjRmxQCl6onpdHMyNq4o8RTuI5cS4R4VnTqlqbxnHpYcGfLrF
	SudqOaW0p4LqbQJVbOdcgskzS9L/zr+scdzRTCLnHirW/yoq1AEdup+kBkmWa+NZ
	Uiqdo4kY/aTPQUvt2EZWr1XiqIDppBF5A2pO+hfeHWmUln1IA2JI5KiFkXCiMlGW
	ghEGoJDmqcZ6HlNMi2PPdyh8A/ic2O0s1GgxKx/YakgLCASpb6PdnISCG5Sopuj8
	bqXmfh7r+aSHeid7lJoy1bwmVA1lxgcNA4y75gtHVs5j5C9R8Cj6vOri0nLpQGKn
	uTAFzw==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 479qp5ju35-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Jun 2025 11:12:11 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55GBCBpT012478
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Jun 2025 11:12:11 GMT
Received: from [10.206.101.41] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 16 Jun
 2025 04:12:08 -0700
Message-ID: <330410aa-10f9-f9d5-0ace-18a9b7a51bdf@quicinc.com>
Date: Mon, 16 Jun 2025 16:42:05 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v6 3/6] media: venus: venc: Clamp parm smaller than 1fps
 and bigger than 240
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
 <20250111-fix-cocci-v6-3-1aa7842006cc@chromium.org>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <20250111-fix-cocci-v6-3-1aa7842006cc@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: oaLs5iQkdcpxOKr6Rluh-BBX6Q0Iu3Kz
X-Proofpoint-ORIG-GUID: oaLs5iQkdcpxOKr6Rluh-BBX6Q0Iu3Kz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDA2OSBTYWx0ZWRfX+ULhNGmRyI15
 do+Y4TpI7TtnQyJg7FbtnChe24KG3DV5I0zD0tohPVqEnvCHas9ZHuuKHQCRtD5b32nltK14BY9
 9kRUhQYptjgdIPgV7mhgvyDlRedYD3R6bH10sAT5UIMmk7jrPO6ytGLMdIrMUr4nnldYWAqrCFy
 ZtXHhdeh7aiwdnoQXIAfn/bMKZJvPIgu8WEhoQDtLbAnD55RfRSBfcCsnB8e6VUQQXYhdOxkfUh
 kKNQ5Pu0ROherwxAQg7mOm9j7Pvamlfue3i/PuO6gWkeCI7PVIihDFHmWSjWl+okMw93g0T2vvn
 42YZAAteEnpAvqMCZ9CyOjTLEeG/sv8+zjOJW9mGpQo9+VXRKBg86a3MzblRlS4/xa+54OfmvlH
 Iwypm9Lg6yd27dICG2ZdTcyq0ddEqHeHqOh0Ib03j7eF7fTBLd+tl0oeumlqFjsEmJIShCrV
X-Authority-Analysis: v=2.4 cv=fMc53Yae c=1 sm=1 tr=0 ts=684ffc0b cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8
 a=xOd6jRPJAAAA:8 a=cm27Pg_UAAAA:8 a=ntYLN5EW7bD8HzUpFkgA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_05,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 bulkscore=0 clxscore=1011 malwarescore=0
 mlxlogscore=999 spamscore=0 lowpriorityscore=0 impostorscore=0 mlxscore=0
 priorityscore=1501 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506160069


On 1/11/2025 3:25 PM, Ricardo Ribalda wrote:
> The driver uses "whole" fps in all its calculations (e.g. in
> load_per_instance()). Those calculation expect an fps bigger than 1, and
> not big enough to overflow.
> 
> Clamp the parm if the user provides a value that will result in an invalid
> fps.
> 
> Reported-by: Hans Verkuil <hverkuil@xs4all.nl>
> Closes: https://lore.kernel.org/linux-media/f11653a7-bc49-48cd-9cdb-1659147453e4@xs4all.nl/T/#m91cd962ac942834654f94c92206e2f85ff7d97f0
> Fixes: aaaa93eda64b ("[media] media: venus: venc: add video encoder files")
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/platform/qcom/venus/venc.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
> index c1c543535aaf..943d432b6568 100644
> --- a/drivers/media/platform/qcom/venus/venc.c
> +++ b/drivers/media/platform/qcom/venus/venc.c
> @@ -411,11 +411,10 @@ static int venc_s_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
>  	us_per_frame = timeperframe->numerator * (u64)USEC_PER_SEC;
>  	do_div(us_per_frame, timeperframe->denominator);
>  
> -	if (!us_per_frame)
> -		return -EINVAL;
> -
> +	us_per_frame = max(USEC_PER_SEC, us_per_frame);
Same comment[1] made on 2/6 patch is applicable here as well.

[1]
https://patchwork.kernel.org/project/linux-arm-msm/patch/20250111-fix-cocci-v6-2-1aa7842006cc@chromium.org/

Regards,
Vikash

>  	fps = (u64)USEC_PER_SEC;
>  	do_div(fps, us_per_frame);
> +	fps = min(VENUS_MAX_FPS, fps);
>  
>  	inst->timeperframe = *timeperframe;
>  	inst->fps = fps;
> 

