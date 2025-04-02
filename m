Return-Path: <linux-media+bounces-29204-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E5E63A78A6D
	for <lists+linux-media@lfdr.de>; Wed,  2 Apr 2025 10:58:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7D6E51893252
	for <lists+linux-media@lfdr.de>; Wed,  2 Apr 2025 08:58:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00B0F2356DF;
	Wed,  2 Apr 2025 08:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="R4SukI91"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA0122356C0;
	Wed,  2 Apr 2025 08:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743584266; cv=none; b=ZG0DsENrJ6pd2KmkJgOusIKE+nC0pXe0oOL8Ocx6ygIWwDQ4dKyu1IbKaC+Yk/AL1OTO7F1dEaqqowzlyGswqT2BlrV0p84VAigXWcCoPBM2On77ZK2PvkORCPA8jnHKikI4WMBDFju3QXCKoOljp5MtKTaGkB5OFKRaIa+dehU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743584266; c=relaxed/simple;
	bh=r1KKBgni/++fspKZySjm53OLp1tr0xYLfUnJcEQU6SE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=XQyRGlnXiCxQGaY/o3fYQAnIyl5PiJYBAAAAghAlBj55OHt77C4o+wJcRMnBvRa8MbX/JgvxB6x2h50h7XtHs4oUYHjWWYtHAlLdp85jLmWfGkGqwNMk/CPFPUVm9uOT2egHK2WzPQRHBGvOlmfABPpK+YZscijUfYfLHFA6pqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=R4SukI91; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5324YD80007487;
	Wed, 2 Apr 2025 08:57:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Fmew/SsZ9muf9NKlkX8yDqwVjDsi0uSZ4ssXK6FyxKI=; b=R4SukI91xcBy4tyP
	sNhaej6SpxRe0Tgyr10JYQmc3OrWaQQd+fu4lUz1lbvWx9i0IDcGtu6sxfMhefI9
	YDXOoeTOkEnB4Gup+Fl+08acn6t3o+KxQ0scHN4O8pok1kgZRkKWWkliUFRFCATV
	+NBN63NUkGDMu/JGBduqCeyF8WNNKvFsIlNuTwhswcEXK0rouhzMOVRqe53L4WY0
	ro2uEJn8oO6c2Hj/3WQ1wA/eM5T7CFvfN422aaS55/ceXPM3hWCP3QgL6P0wwug5
	q9qVBWD3dYQ4AJLp+9R2DnqL9s54/h58heTHD5MeVLaTMBLtZ3VZuenfcgTEFfl1
	OAv1lg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45rxb00pf7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Apr 2025 08:57:42 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5328vfSO002278
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 2 Apr 2025 08:57:41 GMT
Received: from [10.204.101.50] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 2 Apr 2025
 01:57:39 -0700
Message-ID: <261c6a30-3bdd-d09a-c3bf-a246a3b638bf@quicinc.com>
Date: Wed, 2 Apr 2025 14:27:36 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] media: venus: Fix probe error handling
Content-Language: en-US
To: Loic Poulain <loic.poulain@oss.qualcomm.com>, <quic_vgarodia@quicinc.com>,
        <stanimir.k.varbanov@gmail.com>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <bryan.odonoghue@linaro.org>
References: <20250327125304.1090805-1-loic.poulain@oss.qualcomm.com>
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
In-Reply-To: <20250327125304.1090805-1-loic.poulain@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 0zFo-C12tXp1D0Jv1SLNrrht0OFEUewy
X-Proofpoint-GUID: 0zFo-C12tXp1D0Jv1SLNrrht0OFEUewy
X-Authority-Analysis: v=2.4 cv=BavY0qt2 c=1 sm=1 tr=0 ts=67ecfc06 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=KQUAxvDtW3CbXZ-pW3sA:9
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-02_03,2025-04-01_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 phishscore=0
 impostorscore=0 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 mlxscore=0 suspectscore=0 clxscore=1011
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504020056



On 3/27/2025 6:23 PM, Loic Poulain wrote:
> Video device registering has been moved earlier in the probe function,
> but the new order has not been propagated to error handling. This means
> we can end with unreleased resources on error (e.g dangling video device
> on missing firmware probe aborting).
> 
> Fixes: 08b1cf474b7f7 ("media: venus: core, venc, vdec: Fix probe dependency error")
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/venus/core.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
> index c4438e4b2d9b..103afda799ed 100644
> --- a/drivers/media/platform/qcom/venus/core.c
> +++ b/drivers/media/platform/qcom/venus/core.c
> @@ -438,7 +438,7 @@ static int venus_probe(struct platform_device *pdev)
>  
>  	ret = v4l2_device_register(dev, &core->v4l2_dev);
>  	if (ret)
> -		goto err_core_deinit;
> +		goto err_hfi_destroy;
>  
>  	platform_set_drvdata(pdev, core);
>  
> @@ -476,24 +476,24 @@ static int venus_probe(struct platform_device *pdev)
>  
>  	ret = venus_enumerate_codecs(core, VIDC_SESSION_TYPE_DEC);
>  	if (ret)
> -		goto err_venus_shutdown;
> +		goto err_core_deinit;
>  
>  	ret = venus_enumerate_codecs(core, VIDC_SESSION_TYPE_ENC);
>  	if (ret)
> -		goto err_venus_shutdown;
> +		goto err_core_deinit;
>  
>  	ret = pm_runtime_put_sync(dev);
>  	if (ret) {
>  		pm_runtime_get_noresume(dev);
> -		goto err_dev_unregister;
> +		goto err_core_deinit;
>  	}
>  
>  	venus_dbgfs_init(core);
>  
>  	return 0;
>  
> -err_dev_unregister:
> -	v4l2_device_unregister(&core->v4l2_dev);
> +err_core_deinit:
> +	hfi_core_deinit(core, false);
>  err_venus_shutdown:
>  	venus_shutdown(core);
>  err_firmware_deinit:
> @@ -506,9 +506,9 @@ static int venus_probe(struct platform_device *pdev)
>  	pm_runtime_put_noidle(dev);
>  	pm_runtime_disable(dev);
>  	pm_runtime_set_suspended(dev);
> +	v4l2_device_unregister(&core->v4l2_dev);
> +err_hfi_destroy:
>  	hfi_destroy(core);
> -err_core_deinit:
> -	hfi_core_deinit(core, false);
>  err_core_put:
>  	if (core->pm_ops->core_put)
>  		core->pm_ops->core_put(core);

Reviewed-by: Dikshita Agarwal <quic_dikshita@quicinc.com>

