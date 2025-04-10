Return-Path: <linux-media+bounces-29873-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A510FA83AE2
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 09:23:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 74F0016C23D
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 07:23:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D837220C472;
	Thu, 10 Apr 2025 07:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="X9XqGRSE"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B89BD207666;
	Thu, 10 Apr 2025 07:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744269595; cv=none; b=tWK26Qy93MhSlOuheKoRZIf2uufwzRTeF43QvZs1jUy+a+A7FaqxWQI/VCI9x1jzoBIIg0/IYLK9xoj8FSaeZyqLN8bn7rKcUlZPF0pBz08caAtgu//sexGDYOGxj8Cl0ZpZzqjcME5AIEdDqX5Ckpes8MHOgjJz+KTrHLqq0cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744269595; c=relaxed/simple;
	bh=Vsi5Z74AIFb+JWP0Mz/aLhtnYJZjhLHWZyvRjDaRQm0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ALPwd9XtGxK0o3ugfrohUYTg7la1m5133vbf1TXW3N7hf4ZRptXc8dnQi8TUAuq8mumXu2r5cdpMGbd258pHSwZ1RZTexAuL/Vd/GDcKZKfe1W8zTe43RXAmdPOQZnWiQiP+enEcZbaE3jXObnhwBj3bClsf8hiGtww6jBqskos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=X9XqGRSE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53A75Jiq028846;
	Thu, 10 Apr 2025 07:19:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WWO8/7DLtOZWKZPlhQHS2sTXYNW0wRFLGR9UU5I0mnA=; b=X9XqGRSEaivaiSti
	pZoRG30PUm2rSUWKGV+ZkrfgyGOxh7631cfDZYGpRMCydG6QlFKTxxN3KxYohzcj
	zzxDDuowUQybWhzuMmgXDqUM5VGxFQ1nxv9QCCIZKnhcXbyWVA4Y0Gtp+IGfKvJl
	gu8+DZcj8tUosTceL79j4RyZjxFbo2NthRWZZKGFDA0Wl0aSw/EtlPyOt56ll3hX
	0VmSbqmGfh9tRS7LqvRgQvS5Zcu6wclFez0Z4qzY5DDpRGMNGCluJrSOmaWSOVb0
	eskeyEUV5PuVIWePyb5eOSjPufx6MepcrAbA9yPewqqlzRPSxcW3/qpU6DJpbEdT
	2RHFKQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twbup0e0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Apr 2025 07:19:45 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53A7JiFN002171
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Apr 2025 07:19:44 GMT
Received: from [10.50.31.123] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 10 Apr
 2025 00:19:41 -0700
Message-ID: <7dd3712b-c20e-5c62-332c-cb8c39ebed57@quicinc.com>
Date: Thu, 10 Apr 2025 12:49:38 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4 4/6] media: platform: qcom/iris: rename iris_vpu3 to
 iris_vpu3x
Content-Language: en-US
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Vikash Garodia
	<quic_vgarodia@quicinc.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        "Mauro Carvalho Chehab" <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "Bryan
 O'Donoghue" <bryan.odonoghue@linaro.org>
References: <20250409-topic-sm8x50-iris-v10-v4-0-40e411594285@linaro.org>
 <20250409-topic-sm8x50-iris-v10-v4-4-40e411594285@linaro.org>
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
In-Reply-To: <20250409-topic-sm8x50-iris-v10-v4-4-40e411594285@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: V_On9x4TdmT7GcYofUKhvDX65sAyHQnL
X-Proofpoint-ORIG-GUID: V_On9x4TdmT7GcYofUKhvDX65sAyHQnL
X-Authority-Analysis: v=2.4 cv=dbeA3WXe c=1 sm=1 tr=0 ts=67f77111 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=2ECtzDhs6wtSefyIrJgA:9
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_06,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 mlxlogscore=999 phishscore=0 mlxscore=0 spamscore=0
 malwarescore=0 clxscore=1015 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504100053



On 4/9/2025 8:08 PM, Neil Armstrong wrote:
> The vpu33 HW is very close to vpu3, and shares most of the
> operations, so rename file to vpu3x since we'll handle all vpu3
> variants in it.
> 
> Reviewed-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org> # x1e Dell
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  drivers/media/platform/qcom/iris/Makefile                      | 2 +-
>  drivers/media/platform/qcom/iris/{iris_vpu3.c => iris_vpu3x.c} | 0
>  2 files changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
> index 35390534534e93f4617c1036a05ca0921567ba1d..473aaf655448180ade917e642289677fc1277f99 100644
> --- a/drivers/media/platform/qcom/iris/Makefile
> +++ b/drivers/media/platform/qcom/iris/Makefile
> @@ -20,7 +20,7 @@ qcom-iris-objs += \
>               iris_vb2.o \
>               iris_vdec.o \
>               iris_vpu2.o \
> -             iris_vpu3.o \
> +             iris_vpu3x.o \
>               iris_vpu_buffer.o \
>               iris_vpu_common.o \
>  
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu3.c b/drivers/media/platform/qcom/iris/iris_vpu3x.c
> similarity index 100%
> rename from drivers/media/platform/qcom/iris/iris_vpu3.c
> rename to drivers/media/platform/qcom/iris/iris_vpu3x.c
> 
Reviewed-by: Dikshita Agarwal <quic_dikshita@quicinc.com>

