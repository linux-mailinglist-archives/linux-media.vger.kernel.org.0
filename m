Return-Path: <linux-media+bounces-31275-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CA25EAA0747
	for <lists+linux-media@lfdr.de>; Tue, 29 Apr 2025 11:31:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E8F727A56D3
	for <lists+linux-media@lfdr.de>; Tue, 29 Apr 2025 09:30:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F8DA2BEC3A;
	Tue, 29 Apr 2025 09:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="TLL21DKP"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F1791F8ADB;
	Tue, 29 Apr 2025 09:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745919002; cv=none; b=cKbHBPULQ/pvBDsh7ogvjgrIngjeSRmQy9oroYX1D/wOs+gAFGYoqkuPdejYOVvcASVPSy28qNkugACNe/pAECvczIfZCxmpPhdvMaR1kjF6x/4fOaxqDFPS0Eb1Gz1M3SIdze+TIJyQr+1jVPap9KR75W3//FikYZmOklbOV3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745919002; c=relaxed/simple;
	bh=rV3fNVF+RKVHDBR8b7t97VqNHhu8U4tlBBKQxYXBgaI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=sZPRkqzugZ3sKaM/mbbaH1hLKym243Am/NDONrrnQiajDtSd0imiNW7dSOvnGLZhDGppmyEZX/Pdx3i3T9aSWya9cZIHLmvzdAWyNVDL6ky5CfphlACqn2nW7EKIWbDFs5FE4dryH59WQLkPySrZvoNYVlgF1GaHa4a82vOBHfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=TLL21DKP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53SNq4xJ006066;
	Tue, 29 Apr 2025 09:29:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tKsxwwTwrcojaoVm46oV1mFUk1zTWS6GX8b+TdqJTmM=; b=TLL21DKP6f/RsQhI
	9NSR6PH61MsqA2gz06smFXA1K/2H1+NqZRiVi3e27OpS4IL6UnzUvHVBgbROWBvj
	q1yczdjk8iHEa9r5Ic0u0UQeGXhDBrM87wYJdtClAKTTRcF2up+Np/oxjlbj+qRM
	NrN/wo/1GyfCynCWchG6qy9wxzZjPLdI0q56lGRnDkPjGD19cHY3hMSr2vmS+x4Q
	Jg+T7zNdXrjdnvUi6D1GizlOxxDF3zeJPNBVVJ2cyg3loQTc0gAB/I7IbAudj87S
	u8mx8SIEE2/4v7U8P705fiZmO/zOeAduw/zggXMgWkZ/GgIOOO9FSe7Ffak1PShm
	fwMksQ==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468ptmm0tu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Apr 2025 09:29:54 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53T9TrtC020860
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Apr 2025 09:29:53 GMT
Received: from [10.50.27.172] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 29 Apr
 2025 02:29:48 -0700
Message-ID: <a8d49fc0-ade3-6793-d7b6-aa16a7501f31@quicinc.com>
Date: Tue, 29 Apr 2025 14:59:45 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 02/23] media: iris: Update CAPTURE format info based on
 OUTPUT format
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
 <20250428-qcom-iris-hevc-vp9-v2-2-3a6013ecb8a5@quicinc.com>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <20250428-qcom-iris-hevc-vp9-v2-2-3a6013ecb8a5@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: tpEl32C9Lv8nZezt8AZHUiLbOgiMehD2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDA3MCBTYWx0ZWRfX4yhIkF4+a6D1 q8yfd+9+doEEJ2Lj2R0J33/+8Qdte224VNI4uzpF8Ow8yBQIy9GC/ol1o9/LPFOxDrmbsbkqcN0 1zIaC/HCVfk4IJHYdKSwZvSQDa13SFh0E0y5da4pHtn3rMAr0xG3TMqQdhDzpSYMEyyQm3myGNg
 YMEXPsRggQyR2Lsy9PPailKTo8u1BgCLR5jhR3QybOIM41FjnUBiehfw7U0iku+zrekWBBmBArz yi8hJQy7IMQ/MIa6o4BXmDXnPvqA3XM/vHd8+fUNNw4Z04NbQM0Ldma4o+0+X/kCiyYECRh7vQA RlORiw0tqTNJU9I+6M8lf4UaYgKH6Zd8hGfNSuER6ovpnBonBbE5132cxNJAjmQH6Lw26i0UF8O
 EU3eLnqODtSoZuGIeeGlBU8tpti0LRvxKc6ZER100p2Tllw9jxznyYx386jJNPA9IRR/QFo8
X-Proofpoint-GUID: tpEl32C9Lv8nZezt8AZHUiLbOgiMehD2
X-Authority-Analysis: v=2.4 cv=DKWP4zNb c=1 sm=1 tr=0 ts=68109c13 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8
 a=tp3-aCPLWCMtretvahIA:9 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_03,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 clxscore=1015
 priorityscore=1501 impostorscore=0 mlxscore=0 bulkscore=0 malwarescore=0
 phishscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290070



On 4/28/2025 2:58 PM, Dikshita Agarwal wrote:
> Update the width, height and buffer size of CAPTURE based on the
> resolution set to OUTPUT via VIDIOC_S_FMT. This is required to set the
> updated capture resolution to firmware when S_FMT is called only for
> OUTPUT.
> 
> Cc: stable@vger.kernel.org
> Fixes: b530b95de22c ("media: iris: implement s_fmt, g_fmt and try_fmt ioctls")
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> ---
>  drivers/media/platform/qcom/iris/iris_vdec.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
> index 2c1a7162d2da..71751365b000 100644
> --- a/drivers/media/platform/qcom/iris/iris_vdec.c
> +++ b/drivers/media/platform/qcom/iris/iris_vdec.c
> @@ -171,6 +171,11 @@ int iris_vdec_s_fmt(struct iris_inst *inst, struct v4l2_format *f)
>  		output_fmt->fmt.pix_mp.ycbcr_enc = f->fmt.pix_mp.ycbcr_enc;
>  		output_fmt->fmt.pix_mp.quantization = f->fmt.pix_mp.quantization;
>  
> +		/* Update capture format based on new ip w/h */
> +		output_fmt->fmt.pix_mp.width = ALIGN(f->fmt.pix_mp.width, 128);
> +		output_fmt->fmt.pix_mp.height = ALIGN(f->fmt.pix_mp.height, 32);
> +		inst->buffers[BUF_OUTPUT].size = iris_get_buffer_size(inst, BUF_OUTPUT);
> +
>  		inst->crop.left = 0;
>  		inst->crop.top = 0;
>  		inst->crop.width = f->fmt.pix_mp.width;
> 
Acked-by: Vikash Garodia <quic_vgarodia@quicinc.com>

