Return-Path: <linux-media+bounces-37835-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 89981B06E4D
	for <lists+linux-media@lfdr.de>; Wed, 16 Jul 2025 08:56:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C5D931A61325
	for <lists+linux-media@lfdr.de>; Wed, 16 Jul 2025 06:56:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B622288C8E;
	Wed, 16 Jul 2025 06:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="IU8qsG1V"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F3C221FA4;
	Wed, 16 Jul 2025 06:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752648986; cv=none; b=DiMoCOU1OZNZ0F9nZlL36nWuOFHaKLs23Q9k7txulrKaLMaWcZcXQrmpW2+5Sd4xd+2Vd9fGmmBbW7LR+l6aEtWybrC4Le1LnHuP2N18elGl/cmIva03NB5EGhd9tGnCpOrYj3Dwr2wrm4QdgH8MsO5FXl79/CXBByBIBy+BafA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752648986; c=relaxed/simple;
	bh=jpneeA3a74derbfduWBkna5smASaZ7TevT31o2TEEqQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=HFRwgrrcyOBTZAdCB3OQEeBbL4asw8A2f6vsNGjubzmJ7PAfKBjr5yivMaQM0ELQzrEHjzqIScYFXnrsXGbIYz7so4qE0gHtrBYTYDTQOc4nHtMt31FXQqfPhpZrGNCL0RQTBazKH438rKhhVqOlvcvO32ij/yKLudEa+9d+w14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=IU8qsG1V; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56G6OAhI024879;
	Wed, 16 Jul 2025 06:56:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XhZuNUqhz246ekBX9zNfCXUdE44mU90ec8jfMronZx0=; b=IU8qsG1VxlWMj7GV
	CedASX2/7u1Fp6ZkbY2FFz8Nw8Aa+wfeF4QU8GMaKIRbf1Btl63HfieafO7c2efT
	6/61NnsOuMBbZZG6kmZPYCJoejUj7VnloBCiWKEdWlQ5f+5/SFOagrnCqObd+sYO
	EcBrHpD4dvpu6/MNVTSMlJ5i4oe53CqO9b6Elygkcl//ZDUO3riwy91aJBpwYbU/
	Zg5P7vJ9l29otCbOLKy2Ll9S3TGgJyKYw9hU2V0rHqQSMIu2LCHmFp0M0Wnh+JTy
	M5VqaYrTmXqI0rRx941y8QUo+tejTrW/nITrmOIFDPTgeNWOB+BOo6ETpO2s9nKh
	4eDTJQ==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47w58ynphq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Jul 2025 06:56:18 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56G6uHXY003371
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Jul 2025 06:56:17 GMT
Received: from [10.216.39.173] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 15 Jul
 2025 23:56:14 -0700
Message-ID: <4e785185-10bd-a3d1-0ed9-53dd6be33acc@quicinc.com>
Date: Wed, 16 Jul 2025 12:26:11 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 07/25] media: iris: Always destroy internal buffers on
 firmware release response
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
 <20250704-iris-video-encoder-v1-7-b6ce24e273cf@quicinc.com>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <20250704-iris-video-encoder-v1-7-b6ce24e273cf@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE2MDA2MSBTYWx0ZWRfX3a5CI3cFXjOx
 YbovIZJIX79uqvYI++E2ppH/jFTFo3GCKApfnQozWkPsdyR9DLPB7NeJSW1cq6PDo9KrsGAbvhw
 FoHMtkPAA+p3kBq3uqFa7OejxZwPYCrSuWfmj+u3Jx6BV5ywvfFkHOmtPaU9B9IrJZ5yvCUUSID
 Mqxms5FTN/hPsUvUy4ynBTNeL0HWzOTwW80NWFtcHYSP8ajsjlJdv//ryLHQvP5VGQr5bYwM4uT
 AwSRoGTIUonF4Ca+I2phpd83n+mqs7/70H+akfiWKvfuMsh6k1qMcUi9MXkTsjSdoK3/pgqy7bn
 LzdcfofO8z53yR/KtPEyQrAnMKeEwzvgRXiUDPYc2nSHtPN3dHpA95DG4+x+tidbz9lhWPRjNVq
 zwUUT2npxd+fozOV1wK5FH9c3yLQ9WQyi9Qh72peo9uX+lFwF2KMVBPZxRTAV4pgQyjRtwHC
X-Proofpoint-GUID: U1NC_975NB292FQn2VS_SZYrtks1h6oT
X-Proofpoint-ORIG-GUID: U1NC_975NB292FQn2VS_SZYrtks1h6oT
X-Authority-Analysis: v=2.4 cv=Or9Pyz/t c=1 sm=1 tr=0 ts=68774d12 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8
 a=7G9hpg6u1tZj-cTh9SYA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-16_01,2025-07-15_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0 adultscore=0 spamscore=0 phishscore=0
 priorityscore=1501 lowpriorityscore=0 mlxlogscore=999 bulkscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507160061



On 7/4/2025 1:23 PM, Dikshita Agarwal wrote:
> Currently, internal buffers are destroyed only if 'PENDING_RELEASE' flag
> is set when a release response is received from the firmware, which is
> incorrect. Internal buffers should always be destroyed when the firmware
> explicitly releases it, regardless of whether the 'PENDING_RELEASE' flag
> was set by the driver. This is specially important during force-stop
> scenarios, where the firmware may release buffers without driver marking
> them for release.
> Fix this by removing the incorrect check and ensuring all buffers are
> properly cleaned up.
> 
> Fixes: 73702f45db81 ("media: iris: allocate, initialize and queue internal buffers")
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> ---
>  drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> index a8c30fc5c0d0668cc9980f2fcfcf21072cf9ef0a..dda775d463e916f70da0b879702d96df18ea8bf7 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> @@ -424,7 +424,6 @@ static int iris_hfi_gen2_handle_release_internal_buffer(struct iris_inst *inst,
>  	struct iris_buffers *buffers = &inst->buffers[buf_type];
>  	struct iris_buffer *buf, *iter;
>  	bool found = false;
> -	int ret = 0;
>  
>  	list_for_each_entry(iter, &buffers->list, list) {
>  		if (iter->device_addr == buffer->base_address) {
> @@ -437,10 +436,8 @@ static int iris_hfi_gen2_handle_release_internal_buffer(struct iris_inst *inst,
>  		return -EINVAL;
>  
>  	buf->attr &= ~BUF_ATTR_QUEUED;
> -	if (buf->attr & BUF_ATTR_PENDING_RELEASE)
> -		ret = iris_destroy_internal_buffer(inst, buf);
>  
> -	return ret;
> +	return iris_destroy_internal_buffer(inst, buf);
>  }
>  
>  static int iris_hfi_gen2_handle_session_stop(struct iris_inst *inst,
> 

Reviewed-by: Vikash Garodia <quic_vgarodia@quicinc.com>

