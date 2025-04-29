Return-Path: <linux-media+bounces-31286-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D922AA080E
	for <lists+linux-media@lfdr.de>; Tue, 29 Apr 2025 12:07:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7C7D63B9741
	for <lists+linux-media@lfdr.de>; Tue, 29 Apr 2025 10:06:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8F9C2BE7DF;
	Tue, 29 Apr 2025 10:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="LomVDNOF"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA2C11FE478;
	Tue, 29 Apr 2025 10:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745921185; cv=none; b=N1Qt+HsSRfRLRUbI32vXRBloFGPwL5DzH/aE/u3/jdZ0Vz82/iboHI0HoWWzSpRB68f2SDrvkO5XfOhZKqs2Wt62TkNPMmU4SkKVECOrnFX6fo+TBlw4SG4NnY83kIXv0Ii15lxNUg2v+0NrKbxUFxfOYI0HGmPyNDX9Oz2xooQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745921185; c=relaxed/simple;
	bh=kof4YDrJHqzs3PpRU+42B//MBn1YXsFjurvqP2NS4E0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=fOuUWUjL0Af+NLXKrFGsA7c97mCQx1RO6EPxUV8dj6dVGGnVAakpEEhVNx72Ii8qEtsZoMKFzN3/GovBwt8EEkH2B4gUCv0TSiZ6hev/cIBA/jKb+xLSNI7sDUL1qJAVBYKwLpH6q0lwm/NCX/Y+0camndEn180AqUX3XWXhyGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=LomVDNOF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53SNq2me019693;
	Tue, 29 Apr 2025 10:06:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jQEJ+g7BmU8khLOOCEFMSoGh4C8XiVcJuLiR+yxuuOI=; b=LomVDNOFn+f1cZm6
	sj3E0qbmVlT8+648qebUSbGUiCxAOyvSTa3N0MbiSgLB6iUFbFzsmasOzJkiruWm
	byQz54BvdMQraA5rntqQzAIxR/wP+WKh//E4kB6nL+qA+Gp92IOvYv0Fu/GwcEik
	1mXqEGqnW833R3BLiDVOfTI9oZ1fdfm4yoxvbdU1iQZT5/Gd59f/Gz/Sm8dDIlII
	vtxv7D6lO7W2TFoT0shXeSX6ZC6+Uig6ZpnRkbNySAyTtUyg19QUlUd6HlqKNNqs
	SETloQp/mu6Wyl0cwOO6be6yjeVcrOYylY1TDQN7gd7LX5p+yP+AnwsKKonnR+J6
	Sv2/Dg==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468n6jkdtn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Apr 2025 10:06:19 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53TA6Ivb021600
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Apr 2025 10:06:18 GMT
Received: from [10.50.27.172] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 29 Apr
 2025 03:06:12 -0700
Message-ID: <963195e9-44e1-ec84-0892-32c5efb88efa@quicinc.com>
Date: Tue, 29 Apr 2025 15:36:09 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 07/23] media: iris: Add handling for no show frames
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
        <20250424-qcs8300_iris-v5-0-f118f505c300@quicinc.com>
References: <20250428-qcom-iris-hevc-vp9-v2-0-3a6013ecb8a5@quicinc.com>
 <20250428-qcom-iris-hevc-vp9-v2-7-3a6013ecb8a5@quicinc.com>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <20250428-qcom-iris-hevc-vp9-v2-7-3a6013ecb8a5@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDA3NSBTYWx0ZWRfX5IaCucg7Vtvp QtRoradHz70RHP0Gh+9juYy/VZp/f7utrrPO1VBh28mVuxPEhaDh7j3ocU/U/Vn/CvgrTl/yMVT VtUsocDo6mG0RWMhf9M4MVn41WKGBeeb1+qU7maia+p28LCj+9ObkKR1kJFzF3reo84CEVnjC3e
 30wE676O3BJEI2D4K9+CezPjW7PTHsyqNec/VvZ4twhwFC+sayAH7FkDxzVOLiDsUrnHguaKDaT G+6KUVNqB2XGmrZSbHE7PS8hyQkfpI6lTKlZ5J84Tq8X4DQ/IHzCp7HRXaPBd0pN1f2sCb0tUC0 Lto/cRV2BEdMoS9phyNp6oMguOXMPsMW+Sx9eSI3ZxFTuT5BTvXdp9rkZp6Ah11mIaZ94Z68jT9
 VokjfqRXxcH7SYj5xkj96a/GDKpGpLokfmkrgm76WYS8dFK58WeSVLIzSZNQlhnYkRTitMpE
X-Proofpoint-GUID: ECGvXNqWQEn8ZoWoqYelCjDkVPKAj-CP
X-Proofpoint-ORIG-GUID: ECGvXNqWQEn8ZoWoqYelCjDkVPKAj-CP
X-Authority-Analysis: v=2.4 cv=C8fpyRP+ c=1 sm=1 tr=0 ts=6810a49b cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=I1LTqFYYwnHxq3ZflJIA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_03,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 mlxlogscore=999 priorityscore=1501 clxscore=1015 spamscore=0 adultscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0 mlxscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290075


On 4/28/2025 2:58 PM, Dikshita Agarwal wrote:
> Firmware sends the picture type as NO_SHOW for frames which are not
> supposed to be displayed, add handling for the same in driver to drop
> them.
> 
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> ---
>  drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h  | 1 +
>  drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c | 4 +++-
>  2 files changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
> index 806f8bb7f505..666061a612c3 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
> @@ -113,6 +113,7 @@ enum hfi_picture_type {
>  	HFI_PICTURE_I				= 0x00000008,
>  	HFI_PICTURE_CRA				= 0x00000010,
>  	HFI_PICTURE_BLA				= 0x00000020,
> +	HFI_PICTURE_NOSHOW			= 0x00000040,
>  };
>  
>  enum hfi_buffer_type {
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> index 5bb20ec0d67f..1ed798d31a3f 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> @@ -91,7 +91,9 @@ static int iris_hfi_gen2_get_driver_buffer_flags(struct iris_inst *inst, u32 hfi
>  	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
>  	u32 driver_flags = 0;
>  
> -	if (inst_hfi_gen2->hfi_frame_info.picture_type & keyframe)
> +	if (inst_hfi_gen2->hfi_frame_info.picture_type & HFI_PICTURE_NOSHOW)
> +		driver_flags |= V4L2_BUF_FLAG_ERROR;
> +	else if (inst_hfi_gen2->hfi_frame_info.picture_type & keyframe)
>  		driver_flags |= V4L2_BUF_FLAG_KEYFRAME;
>  	else if (inst_hfi_gen2->hfi_frame_info.picture_type & HFI_PICTURE_P)
>  		driver_flags |= V4L2_BUF_FLAG_PFRAME;
> 
>
Acked-by: Vikash Garodia <quic_vgarodia@quicinc.com>

