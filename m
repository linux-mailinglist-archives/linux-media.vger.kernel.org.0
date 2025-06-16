Return-Path: <linux-media+bounces-34893-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42EFFADAE5B
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 13:26:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5AA173B4814
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 11:25:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08F382E2EE6;
	Mon, 16 Jun 2025 11:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="TZ51Uq5U"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C82D92D9EF3;
	Mon, 16 Jun 2025 11:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750073087; cv=none; b=qvIu7OuLn+prPzHF4EKhVr7R3Mz6T1XMMAfTv2xWopX6KbaS21TlqEpWClhQedYKhCsr6XaA+YSMcUBt8jADRN0DAcE1z2jXsWO2jneGZOLqgAhFh3tI46KybpF2aPTgjleUaELtRhXZTSJWYJDONOsRfXln+qjpgbfr0XIob2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750073087; c=relaxed/simple;
	bh=A6fCN+B+o0aTfpO62uKpsN8hWMmVZtragG/UVQzxDEs=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=XNc6RCgMp2eNPlTvmL+ZDDjlVWWQK6/aaTgYWPoxfJkdj3VJ6MtON17Vh0dr8OBCOT+/+act1idVGd5uLrYFvAyI7bzbBSatRTgO04LlUcnWGX77KOeLdTWu7ES47c3d1Nqispq7ykJq44IWB/9V6V+HFCFkI7QqvQMOos+ZiKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=TZ51Uq5U; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55G8TcMp021517;
	Mon, 16 Jun 2025 11:24:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SwuGGFRXCJLEwHFailagHHQ4m3tE1lWaTLymw4iknCQ=; b=TZ51Uq5UD8fkXTYx
	DAGq9iJL3Uu9moBK5ZQHhB6eyCENdc4M57Xy1Sep4BN1xKqbLEuDSa3v6m+/6GiN
	NViSVBgr0SqQ5AAdf4RJoOE/I4B3uAToymaH1RRh1iulfUJ2/s8BvU2a9aNkw8KL
	+6rHj3B+0JxVcZg5MTGxvlrWJyOqtc84zhECOYPYKceW/hFSN9bw+WCQDQe2M2U5
	ywpiwk1CYtCr4bneZnOWRerWFb/CKS0MMMlZc9nYQDuwBzn3oGrG7uHWitQuiwBd
	/sRL0cFLw0ez1VejjwRwKzjMnHauBiFs+CePgo6kRawxwWsXBS7uzIcbbanw927t
	phx/GQ==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791enc978-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Jun 2025 11:24:40 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55GBOdna029212
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Jun 2025 11:24:39 GMT
Received: from [10.206.101.41] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 16 Jun
 2025 04:24:36 -0700
Message-ID: <4588c8d9-7c0b-a3da-fa8b-c5de69d735e4@quicinc.com>
Date: Mon, 16 Jun 2025 16:54:33 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v6 4/6] media: venus: Remove timeperframe from inst
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
 <20250111-fix-cocci-v6-4-1aa7842006cc@chromium.org>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <20250111-fix-cocci-v6-4-1aa7842006cc@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: KNnmFnhswaJnAq81k7CdkoNLMyAxnqY0
X-Authority-Analysis: v=2.4 cv=D6RHKuRj c=1 sm=1 tr=0 ts=684ffef8 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=cm27Pg_UAAAA:8
 a=COk6AnOGAAAA:8 a=gSDlCWdsjdzrJQ1bRZ0A:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: KNnmFnhswaJnAq81k7CdkoNLMyAxnqY0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDA3MCBTYWx0ZWRfXzFBdj9ALxYBo
 9z4n2ANgB4krSTldIw4LGzaIjABndIHEKsv9ozIPTULhAKu3QWjNJCYNpsSGTyfvAo7K+x+74DS
 L83EPXZirW/LrJbv+jjCVqqENyqXRVWMXSTDtjVXEZyE0riUKD1m99Y0XDA3Wzh7rmF9/SCo77t
 1jZjQ7CFURvhtJpVZwYKiOPAmV4F0T6KTBthsMDNBFCGbAKNNl1jAhRZp2Ftb1rBN/k6wmGS4HM
 MOT2UBKM3UjandpAqYW/P0YRaO1IWCK0s6fLgBnbeFtxTHQBy4MpJreSKF34jHkiHAdc4D5FnXS
 RYMq2/rYY61b+/G2zVsf3uGWG8fuPum2mB2GvLkg/hqd1TsIzZoAX4q4oA8S3LGXB96arRv9fD6
 4Pazl68NJuYQP2pX04U/EZfu4/CbZBwO1XpbP1OdKe942t1zADltAHsxjDHjRMhDYN1XkiWf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_05,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0 adultscore=0
 suspectscore=0 mlxlogscore=999 clxscore=1015 mlxscore=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506160070


On 1/11/2025 3:25 PM, Ricardo Ribalda wrote:
> The driver only cares about whole fps. We can infer the timeperframe
> from the fps field. Remove the redundant field.
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/platform/qcom/venus/core.h |  2 --
>  drivers/media/platform/qcom/venus/vdec.c | 15 ++++++++-------
>  drivers/media/platform/qcom/venus/venc.c | 16 ++++++++--------
>  3 files changed, 16 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
> index afae2b9fdaf7..1d4fd5cc75d9 100644
> --- a/drivers/media/platform/qcom/venus/core.h
> +++ b/drivers/media/platform/qcom/venus/core.h
> @@ -407,7 +407,6 @@ enum venus_inst_modes {
>   * @tss:		timestamp metadata
>   * @payloads:		cache plane payload to use it for clock/BW scaling
>   * @fps:		holds current FPS
> - * @timeperframe:	holds current time per frame structure
>   * @fmt_out:	a reference to output format structure
>   * @fmt_cap:	a reference to capture format structure
>   * @num_input_bufs:	holds number of input buffers
> @@ -478,7 +477,6 @@ struct venus_inst {
>  	struct venus_ts_metadata tss[VIDEO_MAX_FRAME];
>  	unsigned long payloads[VIDEO_MAX_FRAME];
>  	u64 fps;
> -	struct v4l2_fract timeperframe;
>  	const struct venus_format *fmt_out;
>  	const struct venus_format *fmt_cap;
>  	unsigned int num_input_bufs;
> diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
> index c1d5f94e16b4..e160a5508154 100644
> --- a/drivers/media/platform/qcom/venus/vdec.c
> +++ b/drivers/media/platform/qcom/venus/vdec.c
> @@ -471,10 +471,12 @@ static int vdec_s_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
>  		return -EINVAL;
>  
>  	memset(cap->reserved, 0, sizeof(cap->reserved));
> -	if (!timeperframe->denominator)
> -		timeperframe->denominator = inst->timeperframe.denominator;
> -	if (!timeperframe->numerator)
> -		timeperframe->numerator = inst->timeperframe.numerator;
> +
> +	if (!timeperframe->numerator || !timeperframe->denominator) {
> +		timeperframe->numerator = 1;
> +		timeperframe->denominator = inst->fps;
> +	}
> +
>  	cap->readbuffers = 0;
>  	cap->extendedmode = 0;
>  	cap->capability = V4L2_CAP_TIMEPERFRAME;
> @@ -487,7 +489,8 @@ static int vdec_s_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
>  	fps = min(VENUS_MAX_FPS, fps);
>  
>  	inst->fps = fps;
> -	inst->timeperframe = *timeperframe;
> +	timeperframe->numerator = 1;
> +	timeperframe->denominator = inst->fps;
>  
>  	return 0;
>  }
> @@ -1612,8 +1615,6 @@ static void vdec_inst_init(struct venus_inst *inst)
>  	inst->out_width = frame_width_min(inst);
>  	inst->out_height = frame_height_min(inst);
>  	inst->fps = 30;
> -	inst->timeperframe.numerator = 1;
> -	inst->timeperframe.denominator = 30;
>  	inst->opb_buftype = HFI_BUFFER_OUTPUT;
>  }
>  
> diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
> index 943d432b6568..17bec44c9825 100644
> --- a/drivers/media/platform/qcom/venus/venc.c
> +++ b/drivers/media/platform/qcom/venus/venc.c
> @@ -401,10 +401,10 @@ static int venc_s_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
>  
>  	memset(out->reserved, 0, sizeof(out->reserved));
>  
> -	if (!timeperframe->denominator)
> -		timeperframe->denominator = inst->timeperframe.denominator;
> -	if (!timeperframe->numerator)
> -		timeperframe->numerator = inst->timeperframe.numerator;
> +	if (!timeperframe->numerator || !timeperframe->denominator) {
> +		timeperframe->numerator = 1;
> +		timeperframe->denominator = inst->fps;
> +	}
>  
>  	out->capability = V4L2_CAP_TIMEPERFRAME;
>  
> @@ -416,8 +416,9 @@ static int venc_s_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
>  	do_div(fps, us_per_frame);
>  	fps = min(VENUS_MAX_FPS, fps);
>  
> -	inst->timeperframe = *timeperframe;
>  	inst->fps = fps;
> +	timeperframe->numerator = 1;
> +	timeperframe->denominator = inst->fps;
>  
>  	return 0;
>  }
> @@ -431,7 +432,8 @@ static int venc_g_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
>  		return -EINVAL;
>  
>  	a->parm.output.capability |= V4L2_CAP_TIMEPERFRAME;
> -	a->parm.output.timeperframe = inst->timeperframe;
> +	a->parm.output.timeperframe.numerator = 1;
> +	a->parm.output.timeperframe.denominator = inst->fps;
>  
>  	return 0;
>  }
> @@ -1454,8 +1456,6 @@ static void venc_inst_init(struct venus_inst *inst)
>  	inst->out_width = 1280;
>  	inst->out_height = 720;
>  	inst->fps = 15;
> -	inst->timeperframe.numerator = 1;
> -	inst->timeperframe.denominator = 15;
>  	inst->hfi_codec = HFI_VIDEO_CODEC_H264;
>  }
>  
> 
Reviewed-by: Vikash Garodia <quic_vgarodia@quicinc.com>

