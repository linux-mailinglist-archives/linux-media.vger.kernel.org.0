Return-Path: <linux-media+bounces-27721-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 04ACEA54BC0
	for <lists+linux-media@lfdr.de>; Thu,  6 Mar 2025 14:15:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 573DE1897683
	for <lists+linux-media@lfdr.de>; Thu,  6 Mar 2025 13:15:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77C4D20E328;
	Thu,  6 Mar 2025 13:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="gdpkuISm"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F2FB22331;
	Thu,  6 Mar 2025 13:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741266921; cv=none; b=PJK0UqJFOmBswCoDDWFAYHtqAb0VZRkMdMWogP+cMN5Q7Q7YwFSrLMBlHWfmuHyhxpCrBMjO3K0Li1BDYaVAy6N7J9DHe4lNavRzq8EAaMA3mhBzR5+E451kbmWdYYlYwq1zjW6XoXwmOyE+3XWZnwSr0pQwDdVF/2/TlJCZXsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741266921; c=relaxed/simple;
	bh=6g9vsWTzXPTCxUAz6B0EW+KOIOdPOMJF7xnhnoJl8Ic=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=HabNowdkTSSewu/KVw62Z2uIeIzzEW/2wzz5eN/rjtouCAfs8ieD5aAFYuTvBEZbqMtMG1oa7xNbHwQJSSPh1gjVcBT65cCPmE/z1xQE5k2va9b8CgYPv+wljR11HJv516ArwjEm3+UAnCfZP1Ws4FMKfIkWfMpyW43m93WM0oM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=gdpkuISm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 526CrBmH031234;
	Thu, 6 Mar 2025 13:15:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cUxhOdDBqjG8nS3JgsLPZmXLfIMs3zvTOkwCPFPDLuE=; b=gdpkuISmfC5CHF1j
	g2yvlBnIN15zMstMh+VFDnQqndPu9ZyQ1e160n2N/RJUwp4y9O+G65Q9gOHT3IDx
	lDZcYaGlf9/CDyWX/50hftcT3B/zOJHAeHkpkVeiLlyFEThXckR2ijojaCYYPD8N
	S0j02FIUQcHn2aV88QzVgt6LOsD99Gec4GZedzfibE/tqQL6xkS7fiHKxxcnbdoY
	kli9hGWYQy4eGpp3Q94ZIMIxaK0q9Vfntb43tzVcK7A2ALyN2KwROXQVUzW+AqHx
	cHZyoTEniA0skc5fDWB/6WsrpGltsD0vlzO+gB9R8Xn5dSPiLqYPvHOMnkT0omFQ
	y689Fg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4574ce9ht7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Mar 2025 13:15:13 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 526DFCq7002196
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 6 Mar 2025 13:15:12 GMT
Received: from [10.50.63.230] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 6 Mar 2025
 05:15:09 -0800
Message-ID: <f4f7e2a7-6878-515d-c8c4-73cd424e78fc@quicinc.com>
Date: Thu, 6 Mar 2025 18:45:06 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 5/7] media: platform: qcom/iris: rename iris_vpu3 to
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
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250305-topic-sm8x50-iris-v10-v2-0-bd65a3fc099e@linaro.org>
 <20250305-topic-sm8x50-iris-v10-v2-5-bd65a3fc099e@linaro.org>
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
In-Reply-To: <20250305-topic-sm8x50-iris-v10-v2-5-bd65a3fc099e@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: xaLxHz1dNr3lIMum4P1EJWOaxptfRYQY
X-Proofpoint-GUID: xaLxHz1dNr3lIMum4P1EJWOaxptfRYQY
X-Authority-Analysis: v=2.4 cv=bNLsIO+Z c=1 sm=1 tr=0 ts=67c99fe2 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=EFsFfAAxFMx2BpdI774A:9
 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-06_05,2025-03-06_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=964
 suspectscore=0 spamscore=0 mlxscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503060100



On 3/6/2025 12:35 AM, Neil Armstrong wrote:
> The vpu33 HW is very close to vpu3, and shares most of the
> operations, so rename file to vpu3x since we'll handle all vpu3
> variants in it.
> 
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

