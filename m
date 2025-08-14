Return-Path: <linux-media+bounces-39928-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 60FE0B26A1A
	for <lists+linux-media@lfdr.de>; Thu, 14 Aug 2025 16:54:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8E8B0624A50
	for <lists+linux-media@lfdr.de>; Thu, 14 Aug 2025 14:46:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80EE61FCFF1;
	Thu, 14 Aug 2025 14:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="JSPKVamS"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 616F31E7C34;
	Thu, 14 Aug 2025 14:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755182801; cv=none; b=exjP4h3m7SwAZAJZAzyLu7zstRaJvNjO6dM6u4Ewlz27BSIRme96SNEUtrORDaWueYwn7FsYOUtGuF4a0wZF2cZlXY1ySQZQPirMGeokoXVN76gjHrJjWUgMgrPWw4tUPEXCtcdiLolaKFdpCvdmNIc50f7UB/gpLHwuUMtWcE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755182801; c=relaxed/simple;
	bh=MItsxOZkBc4Mg4/BsR8EwS7YoP7JHMjVkoHc3xHnjGE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=EsrdHh8yPLLfhcwuvK07Za22xLJrbb4Xzoxv7FukpI+qdN3SI0E58PHFMJVxLgFeV8rRfVh/4WDwt0KeLqwqC8Kq5Nkba2hWqacXqPXfG3DkGX8A+BuOhyvdvO3sy1I44peuz1pwkxHiN9t0a9AITeQnd9for9OAuKaWfueIkUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=JSPKVamS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57E8rMWu031371;
	Thu, 14 Aug 2025 14:46:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WUE9emBSfD2Eo0Ilbd5YqiBLkogqSMNHU8RSdJa3aHw=; b=JSPKVamSWKL6mGc3
	+xAWnIXq1uXZRzt8/AMnTAZJ9NrI8td8Ud5jevBxCdncGMV9SCRsT5WZ+9uM0Gvd
	lCq8EcQisA5sAWZyn6lY3oAUT27s2J8p55GXcEcvCbOw8MOyZZP6kDTQVczeqUsX
	ftVOHX/wwTFlWjwXxyXfwxF6kCWu5xIsdRpRcw72M+YdRDBeTkNKBtbTt7XHaWki
	ORpuDs2rTXyLpGoMYvEcUudS+xgvDVOviqX+Ioj8Nfz1uLnYqxsBt+FU22Gmnuu4
	T8S0yyBrVWSguO7rJYyYhEvtLbRB+SI33WUGLx2tW5a2bJ7xoJmGLBEgLmj0Yjtg
	qKX2DA==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48fm3vtxme-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Aug 2025 14:46:19 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57EEkIgI007893
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Aug 2025 14:46:18 GMT
Received: from [10.216.25.245] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 14 Aug
 2025 07:46:14 -0700
Message-ID: <a54af278-6c99-9420-72ed-f4abab519216@quicinc.com>
Date: Thu, 14 Aug 2025 20:16:11 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 15/24] media: iris: Add support for VIDIOC_QUERYCAP for
 encoder video device
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
        <linux-kernel@vger.kernel.org>,
        Renjiang Han <quic_renjiang@quicinc.com>,
        Wangao Wang <quic_wangaow@quicinc.com>
References: <20250813-iris-video-encoder-v2-0-c725ff673078@quicinc.com>
 <20250813-iris-video-encoder-v2-15-c725ff673078@quicinc.com>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <20250813-iris-video-encoder-v2-15-c725ff673078@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDEwNyBTYWx0ZWRfX1RsGbbfsAfco
 XFy1kE1bgG+yRWvyx0KZ82E4u8uACm8sLMjMzCMHp54h7Lm9+Yf6kTPK/U5Nk/uhK2NwH8b454/
 V7HGe/xyIG68rrL6ZSJc/2EXLQnwxuheWFciTmDlLEX8dCfW1Ly8xrMbGJ80tQes/46JLsZZzbk
 rRaZhbLN6dsRfmvaizegBhDMnMajnycyzKlWejkjkcu9/Qqdslk5fwxptplhmKgMTBsDO8xoQ/Y
 eyCUItBdK63+6PZ1G4m9F+GteVe4vb5d0Si5K1WKre31TfuzgL2rAYX4qTiLcLcKHTwiq9Q97JM
 EJy6qQ/LbcrQxGBMV6wnYC9G7rxCsoYmqahv78Kylm9SAZgAWxyDegyAaoYZrohX08w7f2md0oP
 oEZWzj8G
X-Proofpoint-GUID: g4xDhT7oYRpZeetOpq6Y_8-uHsYGi0VG
X-Authority-Analysis: v=2.4 cv=A+1sP7WG c=1 sm=1 tr=0 ts=689df6bb cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8
 a=fGGGzhI3d3vBg4KMZH8A:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: g4xDhT7oYRpZeetOpq6Y_8-uHsYGi0VG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 phishscore=0 clxscore=1015 adultscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508110107


On 8/13/2025 3:08 PM, Dikshita Agarwal wrote:
> Add support for the VIDIOC_QUERYCAP V4L2 iocts for the encoder video
> device to report core driver capabilities.
> 
> Tested-by: Vikash Garodia <quic_vgarodia@quicinc.com> # X1E80100
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> ---
>  drivers/media/platform/qcom/iris/iris_vidc.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
> index cb1280c0c6c82187243f0bda4d98e42370ee787c..458773a2ed7f5e16d5bd5e79dba2f5c029036505 100644
> --- a/drivers/media/platform/qcom/iris/iris_vidc.c
> +++ b/drivers/media/platform/qcom/iris/iris_vidc.c
> @@ -446,8 +446,14 @@ static int iris_enum_frameintervals(struct file *filp, void *fh,
>  
>  static int iris_querycap(struct file *filp, void *fh, struct v4l2_capability *cap)
>  {
> +	struct iris_inst *inst = iris_get_inst(filp, NULL);
> +
>  	strscpy(cap->driver, IRIS_DRV_NAME, sizeof(cap->driver));
> -	strscpy(cap->card, "Iris Decoder", sizeof(cap->card));
> +
> +	if (inst->domain == DECODER)
> +		strscpy(cap->card, "Iris Decoder", sizeof(cap->card));
> +	else
> +		strscpy(cap->card, "Iris Encoder", sizeof(cap->card));
>  
>  	return 0;
>  }
> @@ -577,6 +583,7 @@ static const struct v4l2_ioctl_ops iris_v4l2_ioctl_ops_enc = {
>  	.vidioc_g_fmt_vid_out_mplane    = iris_g_fmt_vid_mplane,
>  	.vidioc_enum_framesizes         = iris_enum_framesizes,
>  	.vidioc_enum_frameintervals     = iris_enum_frameintervals,
> +	.vidioc_querycap                = iris_querycap,
>  };
>  
>  void iris_init_ops(struct iris_core *core)
> 

Reviewed-by: Vikash Garodia <quic_vgarodia@quicinc.com>

