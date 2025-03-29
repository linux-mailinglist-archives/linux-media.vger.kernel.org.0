Return-Path: <linux-media+bounces-28969-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 825A1A753E9
	for <lists+linux-media@lfdr.de>; Sat, 29 Mar 2025 02:38:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 271251777BC
	for <lists+linux-media@lfdr.de>; Sat, 29 Mar 2025 01:38:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A03A1DFFD;
	Sat, 29 Mar 2025 01:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="YuLUDbeQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 104FC801;
	Sat, 29 Mar 2025 01:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743212296; cv=none; b=NNkcAYOe4O+6OI3OroKq6W451s1NZxQrKcI1UuP5gTR31lVGh44qsklwIxNs9mq53rmnIZgqhaGDgyG+kQmM8j+JMta8O5NqT1bZ2I1fRcccqjpkGcJ0D2ReW5QZ+5xB+FffSEVcDanTnZaAUZS6HZicWTI4ztFNNdPF+ZnS+Z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743212296; c=relaxed/simple;
	bh=ViLgvxXs0dFjM/U4lLxIubGaPTwphfVMNa0V07ntbXc=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=ZhQhxUmKVQR7lT/01s7Tz2aO+7MHKlPrtRvJsuUyPZ2YpHIT1BYynJMr9j2tuzzpByoMzetnvHaBz4x///4BTLCwPayp5xhmERUxvLI1O7taRXGc06XA7Xx6XIXO5XEUhxvpWNsSM0W1hehEY5nXNvOJ6uhiCx+neA/DAPzE6qY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=YuLUDbeQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52SNpnm4018104;
	Sat, 29 Mar 2025 01:38:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6sdR2/NKiowrxDOl6hTJDkor5SKF+aK7B5d3HSV1/jI=; b=YuLUDbeQCyfZdIH/
	l+Qk434ZH1CmDidS3DZ++fRjoFKRkkjcYWJkuTBoHm3r0Ssl8vAH4VXrQAYK+GIX
	l8KZ4clRRI7PlQ80XbJrUmIK2Aakg97+c8S/ej7j784MCtNmegDx8smR2hEazM6Z
	uSXq27R58ZCa1lr2G6Xjn53G1u6lRgQsqYyH5bgO8oYnpuqh06io/2/nVVA/hro+
	ghMYUiSaBDAOywrqEfuxf4L8/yTyLxuDGXCH6oGik/58G50b1onzqbsq2M0cEWl3
	nn64IAe+j0n0rV+nsx9baa0S300AYmQaZF2zZeJBsWmO6cQPAFdGA6WEXe1LU/o9
	LoizaQ==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45p2yu0evr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 29 Mar 2025 01:38:10 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52T1c9T2022373
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 29 Mar 2025 01:38:09 GMT
Received: from [10.110.121.93] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 28 Mar
 2025 18:38:08 -0700
Message-ID: <93ca218a-71a2-4751-860c-025ec29b9180@quicinc.com>
Date: Fri, 28 Mar 2025 18:38:07 -0700
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] media: MAINTAINERS: Switch from venus Reviewer to
 Maintainer
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        <stanimir.k.varbanov@gmail.com>, <hverkuil@xs4all.nl>,
        <quic_vgarodia@quicinc.com>, <quic_dikshita@quicinc.com>,
        <mchehab@kernel.org>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250329-b4-25-03-29-media-committers-venus-iris-maintainers-v1-0-0ec1007fde3c@linaro.org>
 <20250329-b4-25-03-29-media-committers-venus-iris-maintainers-v1-1-0ec1007fde3c@linaro.org>
Content-Language: en-US
From: Trilok Soni <quic_tsoni@quicinc.com>
In-Reply-To: <20250329-b4-25-03-29-media-committers-venus-iris-maintainers-v1-1-0ec1007fde3c@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=d8r1yQjE c=1 sm=1 tr=0 ts=67e74f02 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=KKAkSRfTAAAA:8 a=pGLkceISAAAA:8 a=COk6AnOGAAAA:8
 a=VwQbUJbxAAAA:8 a=I9BTf0qdugiClMELNpcA:9 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: xzjM2AgMn4sf6YBTw_BgwTJV9wgGk5se
X-Proofpoint-ORIG-GUID: xzjM2AgMn4sf6YBTw_BgwTJV9wgGk5se
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-28_12,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 bulkscore=0
 spamscore=0 phishscore=0 lowpriorityscore=0 mlxscore=0 adultscore=0
 suspectscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 mlxlogscore=826 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503290010

On 3/28/2025 6:26 PM, Bryan O'Donoghue wrote:
> I'd like to volunteer my help in keeping venus maintained upstream.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 29b4471574982bf3f8d03158cd5edcb94bc9fab9..5ccddd2030efd96324e53fcee8048120990a85d5 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -19592,7 +19592,7 @@ F:	drivers/usb/typec/tcpm/qcom/
>  QUALCOMM VENUS VIDEO ACCELERATOR DRIVER
>  M:	Stanimir Varbanov <stanimir.k.varbanov@gmail.com>

Is Stanimir still an active maintainer here? 

>  M:	Vikash Garodia <quic_vgarodia@quicinc.com>
> -R:	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> +M:	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>  L:	linux-media@vger.kernel.org
>  L:	linux-arm-msm@vger.kernel.org
>  S:	Maintained
> 


-- 
---Trilok Soni

