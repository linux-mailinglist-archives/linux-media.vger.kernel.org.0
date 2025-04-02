Return-Path: <linux-media+bounces-29229-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52E56A78E6D
	for <lists+linux-media@lfdr.de>; Wed,  2 Apr 2025 14:32:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 824BE3ADB77
	for <lists+linux-media@lfdr.de>; Wed,  2 Apr 2025 12:28:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 385942376E9;
	Wed,  2 Apr 2025 12:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Lm9i3+9V"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B72623817C;
	Wed,  2 Apr 2025 12:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743596898; cv=none; b=AfkXerO/mHvhy2FDuIdRckHQoa7tE6aj7C/QfV8csUG2/Oq4jnMWrN4ituyhpM9FI5t+8yAS493kvCYNxfKJMw+3U6XC50rY/+HKA5TpUSBMEACiUc9c5qGrAc/rHW4QtMJYWVaJaHEvfHWg3SPWDlev1/H3I/U1kK5hrS75d1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743596898; c=relaxed/simple;
	bh=2mm9KFjYjNf73RC5x1w602N1nefzxhdPIiqoHpUiVo0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=SjOuEstbgbnd5Mf5UATxPHhILm8PwOBbs7+eC/4OtrCJkJTKI4Oh+Ik3KFxuMnP7FQII36KnGCUJb/Jhwh3q6imxMd4Hi3CRzVuy5NmD71ff6djmrgH0OHmBTS/2NZdrsuSBNFiH1GWBCBAsyx1mISRLSUixrMKeO48mUa8+Kno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Lm9i3+9V; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 532BA6RY014253;
	Wed, 2 Apr 2025 12:28:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dcDYKKitdpNOvO1VTTPjo/3sWBMoWldqeBnLnFSuCDY=; b=Lm9i3+9VKnXPYkuJ
	PgpybJcCo5p7IwLRYVHXtSZeGKbkLchZ2KBMr8lM4Zc3SJuS0V5zIs2z53/AbnUZ
	G0p778z8rvqrrCPu2infYOAcHloXnPi2tCLU+hqJVLToa+JUjYSbMlCK2J9TKwa/
	DjMqfG2lmKgLbG5RAjH4Mc6Iqgwsdohq41yOyI1zFlrO46ecvjYwR4OpKZrqetaQ
	bwtieOSs5VcOC7/biG30x4A+5f9U4cUxFtnjJ7GDrHqRrd7hPN0yuSBtPEx52Vpq
	+qwOV71kyU0vS4Cr4DRiDRWkYwv1S+ZdNcFmlbKudZ1iPpI7eqUjs1apSG30Gm+T
	t7B2ig==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45p7tvkd6g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Apr 2025 12:28:12 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 532CSCLc029089
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 2 Apr 2025 12:28:12 GMT
Received: from [10.50.50.175] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 2 Apr 2025
 05:28:08 -0700
Message-ID: <15220033-ef42-a1bb-6cff-931efbb5cf62@quicinc.com>
Date: Wed, 2 Apr 2025 17:58:05 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 1/2] media: MAINTAINERS: Amend venus Maintainers and
 Reviewers
Content-Language: en-US
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        <stanimir.k.varbanov@gmail.com>, <hverkuil@xs4all.nl>,
        <quic_vgarodia@quicinc.com>, <mchehab@kernel.org>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: Neil Armstrong <neil.armstrong@linaro.org>
References: <20250402-b4-25-03-29-media-committers-venus-iris-maintainers-v3-0-2b2434807ece@linaro.org>
 <20250402-b4-25-03-29-media-committers-venus-iris-maintainers-v3-1-2b2434807ece@linaro.org>
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
In-Reply-To: <20250402-b4-25-03-29-media-committers-venus-iris-maintainers-v3-1-2b2434807ece@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=OIon3TaB c=1 sm=1 tr=0 ts=67ed2d5c cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=pGLkceISAAAA:8 a=COk6AnOGAAAA:8
 a=VwQbUJbxAAAA:8 a=xuRo_m5TypiDwJUHZtcA:9 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: aCqb6TSIeyP-4Umm5I6KhXUvjTp4aaOy
X-Proofpoint-GUID: aCqb6TSIeyP-4Umm5I6KhXUvjTp4aaOy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-02_05,2025-04-01_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=999 lowpriorityscore=0 malwarescore=0 mlxscore=0 clxscore=1015
 adultscore=0 bulkscore=0 phishscore=0 suspectscore=0 impostorscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504020079



On 4/2/2025 5:54 PM, Bryan O'Donoghue wrote:
> Stan has stepped back from active venus development as a result I'd like to
> volunteer my help in keeping venus maintained upstream.
> 
> Discussing with the qcom team on this we agreed
> 
> +M for Dikshita
> +R for me
> 
> Many thanks to Stan for his hard work over the years from originating this
> driver upstream to his many years of maintenance of it too.
> 
> Acked-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 29b4471574982bf3f8d03158cd5edcb94bc9fab9..1d03530f3298703c5f3d025010511451f878f822 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -19590,8 +19590,8 @@ F:	Documentation/devicetree/bindings/usb/qcom,pmic-*.yaml
>  F:	drivers/usb/typec/tcpm/qcom/
>  
>  QUALCOMM VENUS VIDEO ACCELERATOR DRIVER
> -M:	Stanimir Varbanov <stanimir.k.varbanov@gmail.com>
>  M:	Vikash Garodia <quic_vgarodia@quicinc.com>
> +M:	Dikshita Agarwal <quic_dikshita@quicinc.com>
>  R:	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>  L:	linux-media@vger.kernel.org
>  L:	linux-arm-msm@vger.kernel.org
> 
Thanks for the patch.

Acked-by: Dikshita Agarwal <quic_dikshita@quicinc.com>

Thanks,
Dikshita

