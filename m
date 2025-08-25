Return-Path: <linux-media+bounces-40857-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EBE8CB335F6
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 07:51:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 183CF17A10B
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 05:51:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BE8026A1C4;
	Mon, 25 Aug 2025 05:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="C9R0lY8r"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BFAD23957D;
	Mon, 25 Aug 2025 05:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756101071; cv=none; b=LkcWpcs824uYejwwTp9YC260jQF30YjlUukX5GDREn0EAkmld3iNwBCIlIu4dKGFODO7IF/w0snhb6tO/XeeWCEqtf8A2AIFK0Ar5lYBhfq3zIVu+QSZg45S1/DhX+u9THkrcfwD7K/c1OMhsv6VmPFWiTRZngpEUT5RRZyqkjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756101071; c=relaxed/simple;
	bh=p9FkGaGt2dClTy1vfjVHjeyhcpyoBwtZvHP4S5nm8LI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=FnhZfKzpAozXC0e3dMV4ONYDy8w5gKj8rhfTktU4wT5NZLlv5TJmYv2RMbI6Ewm1zPSVhB9lkhcZ1Wzqn3PFEh6sU8/vbg/wEQTPE5WSxte1gmUvfiQgtH7uwWUhIsRAzAn/VX6BJBeMCegKlNs+/mmfL1SzLHdiDmdHLMlDrrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=C9R0lY8r; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57OMkRh8030501;
	Mon, 25 Aug 2025 05:51:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cEfU8y5W7HT8UsgICQCdUmbpKlN3r6DJ5gr7SywWICc=; b=C9R0lY8rcPp1riC8
	e6UGbgDFNT8/yTcoQPtLnG3tlzh1tmrxu5bUc6osb0WeUoZa5M2mX8m/XTRNKBIq
	P0OLMY54UShnPy+DxNVfqa1QK3IhEB8GctSf5dZiMqbtWaZBmgvaAJndqprls2ma
	RXH6vuINzhTZKD1hjBupAnHzGwwl0MqvMSiwcNF8tbR/+OBX6+mKZIYHjri6WOKC
	Se1iHRkjjl2ZGcJWgyrocdug0MwhryLduATIvsHTj2vl1T50Vu4xAqnHwRRUT9cd
	VcAj4S19+LKgk6IbJrDkGOkvITlPyexciq4JNGa0kyCdzd8RcxipLzEjs/5HY36p
	kWaWSw==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5unkv67-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Aug 2025 05:51:04 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57P5p3Fn010495
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Aug 2025 05:51:03 GMT
Received: from [10.204.100.211] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Sun, 24 Aug
 2025 22:49:59 -0700
Message-ID: <57575209-7f03-6a00-8eed-758098d424c8@quicinc.com>
Date: Mon, 25 Aug 2025 11:19:55 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v3 12/26] media: iris: Fix format check for CAPTURE plane
 in try_fmt
Content-Language: en-US
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Abhinav Kumar
	<abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stefan Schmidt
	<stefan.schmidt@linaro.org>,
        Vedang Nagar <quic_vnagar@quicinc.com>,
        "Hans
 Verkuil" <hverkuil@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Renjiang Han <quic_renjiang@quicinc.com>,
        Wangao Wang <quic_wangaow@quicinc.com>
References: <20250820-iris-video-encoder-v3-0-80ab0ba58b3d@quicinc.com>
 <20250820-iris-video-encoder-v3-12-80ab0ba58b3d@quicinc.com>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <20250820-iris-video-encoder-v3-12-80ab0ba58b3d@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: e9hvuNCYhUovEyZaFxGWWDVk7d8ytxSH
X-Proofpoint-ORIG-GUID: e9hvuNCYhUovEyZaFxGWWDVk7d8ytxSH
X-Authority-Analysis: v=2.4 cv=JJo7s9Kb c=1 sm=1 tr=0 ts=68abf9c8 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8
 a=n6QUAqEghr28x03DGVoA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMSBTYWx0ZWRfX9LilLRcZGqcd
 bbIp1wk/KyKu40zTUDtUKAuGpoD8aRWn/oYxMedNrIJx8kbzlYErJJqsDaY4fnGLnKJhpRo62a3
 d1l71ZeNaZt555e5UYKfk8Ni1JHMerHUXzKajZP+gpPItPwsafNlOCdb5WPlWXAycgMJ6pFhgAq
 BN3zAWCLv8p0xPuaBLLxOvQkSY7QlZYeTcJs8vCxIa/6Plklk0VLJ4sZ2jE1pUjQm+wzZL4wFSp
 zLS+WqIr/WkQ3QycpmnGo1DtGy/DHF/faVkr2vy6PhLYzBQQkrEfi/CNsz4d30D7sHVaNjk2TV4
 737wBUEer5trV/gcfaH0cEBIoyYsXqR2dFvPlIK/xcbOr8uy/jb+5BE4JuM362+yTej+nVfBPTr
 oyhVdF4G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_02,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230031



On 8/20/2025 2:37 PM, Dikshita Agarwal wrote:
> Previously, the format validation relied on an array of supported
> formats, which only listed formats for the OUTPUT plane. This caused
> failures when validating formats for the CAPTURE plane.
> Update the check to validate against the only supported format on the
> CAPTURE plane, which is NV12.
> 
> Fixes: fde6161d91bb ("media: iris: Add HEVC and VP9 formats for decoder")
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> ---
>  drivers/media/platform/qcom/iris/iris_vdec.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
> index d670b51c5839d1fad54d34f373cf71d5f3973a96..0f5adaac829f2263fae9ff0fa49bb17bad2edecb 100644
> --- a/drivers/media/platform/qcom/iris/iris_vdec.c
> +++ b/drivers/media/platform/qcom/iris/iris_vdec.c
> @@ -158,7 +158,7 @@ int iris_vdec_try_fmt(struct iris_inst *inst, struct v4l2_format *f)
>  		}
>  		break;
>  	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
> -		if (!fmt) {
> +		if (f->fmt.pix_mp.pixelformat != V4L2_PIX_FMT_NV12) {
>  			f_inst = inst->fmt_dst;
>  			f->fmt.pix_mp.pixelformat = f_inst->fmt.pix_mp.pixelformat;
>  			f->fmt.pix_mp.width = f_inst->fmt.pix_mp.width;
> 

Reviewed-by: Vikash Garodia <quic_vgarodia@quicinc.com>

