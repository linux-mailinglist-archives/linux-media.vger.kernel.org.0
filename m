Return-Path: <linux-media+bounces-14965-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CFB992FB62
	for <lists+linux-media@lfdr.de>; Fri, 12 Jul 2024 15:28:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 790111C2231B
	for <lists+linux-media@lfdr.de>; Fri, 12 Jul 2024 13:28:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB3B8171086;
	Fri, 12 Jul 2024 13:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="kaV+8hUi"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5BAE16FF5A;
	Fri, 12 Jul 2024 13:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720790879; cv=none; b=RHmmiQICeYBq3UnrsRI8S4k2XbwxS+M8DqgK4s8xyeTQOmxfPVbCtffhnxGAxoGeVILw8ml6+wT25macuVCpuu9KhW3uyVXX2a36EJU1nPaBC1RA3zpFxBYrbT7cupQZQ4+aAwHe5ElHU3mrLwy6AIv9GhXcS4wSadh2QV9I0N4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720790879; c=relaxed/simple;
	bh=awq1mjxtEZBNcYP5FYGsjZu6nKv5uMZVYeF4LNvKAF4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=mluz0DUXx+dIKyltOO6Ez8a1SlqIxxgrQNFkLAUd/ErVPWhF/89FHY1umv6ktDUGyjQGKv7pFEaSC5CaKVl/e5WOYzPVUOshtAVWH+Qyzp+6YK91aAg5kXYs8ZgYNGqopeTZIJjMSCf9O2WmiU7nHE1LsHW1oZ4F3b6mtiaNh7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=kaV+8hUi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46CAtkob003356;
	Fri, 12 Jul 2024 13:27:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hBH0rX5OBvn/ClAcquAzu1NAzKIGexD61Ufx4KxHcNg=; b=kaV+8hUi7OMmDJVZ
	T/xJI6K4kDPmo0BqdkbEu19u4RsT/gDIKJANE0X/uqAiNnSOU2jluPgNt/vrRo7Z
	8E0tuBzut4xy84ls85fOcchB/WWdVK9Wq9p/uIpvZKZBMyuFYkZaKoASc4Kd1gIT
	VnoZyrucflJjKBt7ayJBL1NUIPV5LUXuWqhSFMZvNxbX/YFVmVa8nIc814mY9r/5
	2LRYkBRSPxR9ltNmkp1MBrU28vsIJlCM5jOUIqYj55fHRkH0yOlfLtu8LgOOG3t7
	bH7CjD8iisRlGt/XwW/4Mo9PCXEFHkenG4zeQNuAtUdWOiIGlNfJW9QbX1vr2nvB
	hUD0EA==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 406wgwybnv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Jul 2024 13:27:53 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46CDRqXn002091
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Jul 2024 13:27:52 GMT
Received: from [10.216.15.10] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 12 Jul
 2024 06:27:49 -0700
Message-ID: <6cffcc3e-ec36-7982-dcf1-fc5ed96a5208@quicinc.com>
Date: Fri, 12 Jul 2024 18:57:46 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 2/2] media: venus: hfi_cmds: struct
 hfi_session_release_buffer_pkt: Add __counted_by annotation
Content-Language: en-US
To: Kees Cook <kees@kernel.org>,
        Stanimir Varbanov
	<stanimir.k.varbanov@gmail.com>
CC: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-hardening@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20240710230728.work.977-kees@kernel.org>
 <20240710230914.3156277-2-kees@kernel.org>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <20240710230914.3156277-2-kees@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: P-Ny8pZ2ybFtv1k2I97r1xEguIHJBjSv
X-Proofpoint-ORIG-GUID: P-Ny8pZ2ybFtv1k2I97r1xEguIHJBjSv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-12_09,2024-07-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 mlxscore=0
 adultscore=0 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407120091



On 7/11/2024 4:39 AM, Kees Cook wrote:
> The only direct user of struct hfi_session_release_buffer_pkt is
> pkt_session_unset_buffers() which sets "num_buffers" before using it
> as a loop counter for accessing "buffer_info". Add the __counted_by
> annotation to reflect the relationship.
> 
> Signed-off-by: Kees Cook <kees@kernel.org>
> ---
> Cc: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>
> Cc: Vikash Garodia <quic_vgarodia@quicinc.com>
> Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>
> Cc: linux-media@vger.kernel.org
> Cc: linux-arm-msm@vger.kernel.org
> Cc: linux-hardening@vger.kernel.org
> ---
>  drivers/media/platform/qcom/venus/hfi_cmds.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/hfi_cmds.h b/drivers/media/platform/qcom/venus/hfi_cmds.h
> index 42825f07939d..1adf2d2ae5f2 100644
> --- a/drivers/media/platform/qcom/venus/hfi_cmds.h
> +++ b/drivers/media/platform/qcom/venus/hfi_cmds.h
> @@ -227,7 +227,7 @@ struct hfi_session_release_buffer_pkt {
>  	u32 extradata_size;
>  	u32 response_req;
>  	u32 num_buffers;
> -	u32 buffer_info[];
> +	u32 buffer_info[] __counted_by(num_buffers);
>  };
>  
>  struct hfi_session_release_resources_pkt {

Reviewed-by: Vikash Garodia <quic_vgarodia@quicinc.com>

Regards,
Vikash

