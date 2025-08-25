Return-Path: <linux-media+bounces-40860-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AB58B33633
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 08:09:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B76AE3A1C68
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 06:09:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 417F327990E;
	Mon, 25 Aug 2025 06:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ilN7SVJv"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B31F318DF62;
	Mon, 25 Aug 2025 06:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756102161; cv=none; b=qgZYgt0HL2Ed3Kn0oUjGI4JoFsNSi5/xE0X3nyAoDLPRnlb7669SgUMxVobnOKNuD70tABOIiWFQtFy/VcuudCWAsUZZPaE7KIX3A3KdRPPQcaRxvmQvYswMuCTITjj247xgowXxGHbybE7NS2NszZt+NM6YoEkRZMcDvOfDa3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756102161; c=relaxed/simple;
	bh=YYwK4RD8N9orPdw3J0QWDXG9O3JkPech49feBL/Ei/g=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=sHoqsg7r6X1CbL/HYyJkTgT/wLrwvIdryi4aR3JVsnGDXXzsUw3/vginLNDPpF2CgJquWA/DBu1qQQjcbmwEqJ+sd5vvpHee0RtG6f2JqSiHnc9WmljvqvUu4LmS6MvmgQwzuLTJuChtObLVv05UQ8l54d9e9tQ+M+7gEq6pMb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ilN7SVJv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57OLHHR5014346;
	Mon, 25 Aug 2025 06:09:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U7BhtXnUJTvd78+gaDKQH+lN3wtc2f9gcO9bLl5xJYU=; b=ilN7SVJv/4qi9/UZ
	C/ysz00NTcI8ymoc0OnJfElX5oUMWFIfe8PPV/dl2ydFL8OXzWTSZYAqzfmSAX3y
	P0umAwxghHG32ygW3NqKot4H5MRuybzP1rDtEMrqj2aHLvFwIxTMGxV5/bcNA/Ge
	h+GPjP7V+gegWOzJKZHwIFi9kGZmO7eaPZvuZT0Kmg7UHJSfccvLuXl74gE9VKtG
	gZMEkTULsbK9YSls6g/xhUz3SXunT8pZR09oXjYn0mjH86An8rzruxDZMko+5+ha
	xJWHSgBCX+aKeUM+Qa14/L38ufV/bz6n8c88uA4adIysiaGBGwkDJgH2W7MOLkgD
	Hb5gdw==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q6thuwbd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Aug 2025 06:09:14 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57P69Ej3017631
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Aug 2025 06:09:14 GMT
Received: from [10.204.100.211] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Sun, 24 Aug
 2025 23:09:10 -0700
Message-ID: <a801464f-a73d-968e-962c-e878ab1bc2e1@quicinc.com>
Date: Mon, 25 Aug 2025 11:39:07 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v3 23/26] media: iris: Set platform capabilities to
 firmware for encoder video device
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
 <20250820-iris-video-encoder-v3-23-80ab0ba58b3d@quicinc.com>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <20250820-iris-video-encoder-v3-23-80ab0ba58b3d@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDA0MyBTYWx0ZWRfXyY1CeNQZmTYJ
 J8AImLiRt+kZ0vWoI/CksddJQzRAfcZLHDzwU5rzpVveNr1/+HtUFr5DGIbNk8ZBk99OlYqUMpH
 AtnCoEgE+jzsRnnsMDauGqjqMRM4sbFSqRXzN0LdwgUy2F1uAnGYkmUrT1SLdKjhMUr6JNxtdBZ
 jA6/oPFH+KfHi6Ly2NVbm+2idHdBQoAj2LHmuV3nu5DIYTklCZrDgKi+bv+qo5T935bZnT7D2uq
 KC1yKDUD6b5OdC2/Rl5EcLrawQqraHzgEln2mUGB+mi+mTfeteNI6ZXXVTJGw/ISoh9FMDqaoMg
 /xowvNCAI3thxrvz00OPYk1KT3jiM/gnVlsGs7pDjoc4f47OVRKA06LFNf3PExQ/DJdCHlJHH2f
 DThLmF0e
X-Proofpoint-ORIG-GUID: UG5dPZkVBS9QMERJBjnQ2KQgW73qot12
X-Proofpoint-GUID: UG5dPZkVBS9QMERJBjnQ2KQgW73qot12
X-Authority-Analysis: v=2.4 cv=W544VQWk c=1 sm=1 tr=0 ts=68abfe0a cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8
 a=TUkvoOpGiAiCObS2BQ8A:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_03,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 suspectscore=0 phishscore=0
 bulkscore=0 impostorscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230043



On 8/20/2025 2:38 PM, Dikshita Agarwal wrote:
> Initialize and configure platform-specific capabilities for the encoder
> in the firmware during stream-on, to tailor encoding behavior to the
> current session's requirements. Some of these capabilities can also be
> updated dynamically when V4L2 controls are modified by the client after
> stream-on.
> 
> Tested-by: Vikash Garodia <quic_vgarodia@quicinc.com> # X1E80100
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> ---
>  drivers/media/platform/qcom/iris/iris_buffer.c     |   8 +
>  drivers/media/platform/qcom/iris/iris_ctrls.c      | 500 ++++++++++++++++++++-
>  drivers/media/platform/qcom/iris/iris_ctrls.h      |  15 +
>  .../platform/qcom/iris/iris_hfi_gen1_command.c     | 108 +++++
>  .../platform/qcom/iris/iris_hfi_gen1_defines.h     |  47 +-
>  .../platform/qcom/iris/iris_hfi_gen1_response.c    |   8 +-
>  .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  32 +-
>  .../platform/qcom/iris/iris_hfi_gen2_response.c    |   9 +-
>  drivers/media/platform/qcom/iris/iris_instance.h   |   3 +-
>  .../media/platform/qcom/iris/iris_platform_gen2.c  |  23 +
>  .../platform/qcom/iris/iris_platform_sm8250.c      |  14 +
>  11 files changed, 737 insertions(+), 30 deletions(-)

Reviewed-by: Vikash Garodia <quic_vgarodia@quicinc.com>

