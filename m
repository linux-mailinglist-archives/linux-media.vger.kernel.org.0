Return-Path: <linux-media+bounces-14189-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 59874918712
	for <lists+linux-media@lfdr.de>; Wed, 26 Jun 2024 18:14:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 895D31C23596
	for <lists+linux-media@lfdr.de>; Wed, 26 Jun 2024 16:14:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A460C190050;
	Wed, 26 Jun 2024 16:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Da3Nlcy7"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF596186E38;
	Wed, 26 Jun 2024 16:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719418394; cv=none; b=f5cBUoE8GkHvS/6mrHrr5UH7MbnUlcSdw5iZppNPjkneH3cw84fWSyoHBVx36Mds/8oD3WxFn4BCYmBywP5kFH/lBwuO+YZpFuZz4liMcqfMD6eL7K/mJNxc0cHItbuR0EsyuToYAq6iVMzY+zJXQFD1A/FKuB1ovzOmZJq/RuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719418394; c=relaxed/simple;
	bh=cqv8wMsZGMicMGelqOIAueCpYEuxWW3/ddi8n7JgvTI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=RS/dxmHdYl19P8curDb7hBf3FqE0HmxywAUr7gs8pOD/dCMW8xzSyyNYoElN8VE3ZQ/kdX7O82otUIpAbKoDxQgIS7RDiT2WYfYtToyyIKFbINHFIIhV0GGkzDGfpSEy9KsHrNkJLKdZ6t1/ptuRCyqpEazHMBXIzcs5THAB+dU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Da3Nlcy7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45QAfUNu018095;
	Wed, 26 Jun 2024 16:13:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OCee+xk48e8TmS+YyR/KGRCV69PaDy104CZaVduY+Sk=; b=Da3Nlcy7uWMuYl9Y
	jnpQN2JcD0C9K789jAn1JIOdfR/Ld+SaNwMOti72yNQuX7+sXnSo2kXITgOYb1dN
	D05tWWxi23EIxP6U9fIcEXaXWaBiITXGQbTcr0wCcC2LHUMzS89u5Ca7GWYjoCT1
	0CzFym4qPFbJOknvgA6751N+ixXmZoRadMrtSXv5F8azbaHttbLytozRge94fc6A
	7T1MOyshVc4ZSZY/97sCsA8zwsoAN1hc9tL0+hAYJ2yz2gVGAXpxbDwLGZvTs/y5
	oAuMjQsgFG1jMW/kL7uFSTIl/cND5Q4A8YgYnkLPv2IOnb1Fx07Nb1cmOaFO9nxh
	m91TSA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ywppv9tnk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Jun 2024 16:13:08 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45QGD7Yr004184
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Jun 2024 16:13:07 GMT
Received: from [10.48.244.230] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 26 Jun
 2024 09:13:06 -0700
Message-ID: <4f44ace3-c940-4952-8ef4-b4d220bba9d1@quicinc.com>
Date: Wed, 26 Jun 2024 09:13:06 -0700
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: ti: add missing MODULE_DESCRIPTION() macros
Content-Language: en-US
To: Benoit Parrot <bparrot@ti.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel-janitors@vger.kernel.org>
References: <20240609-md-drivers-media-platform-ti-vpe-v1-1-b9e6a85f2a10@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240609-md-drivers-media-platform-ti-vpe-v1-1-b9e6a85f2a10@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: W-DWlZfnvw7scx1Q3PguZrpQlxHW_WTS
X-Proofpoint-ORIG-GUID: W-DWlZfnvw7scx1Q3PguZrpQlxHW_WTS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-26_07,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 mlxlogscore=999 mlxscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 impostorscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2406140001
 definitions=main-2406260118

On 6/9/2024 2:32 PM, Jeff Johnson wrote:
> make allmodconfig && make W=1 C=1 reports:
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/platform/ti/vpe/ti-vpdma.o
> 
> Add the missing invocations of the MODULE_DESCRIPTION() macro.
> 
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> ---
>  drivers/media/platform/ti/vpe/vpdma.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/platform/ti/vpe/vpdma.c b/drivers/media/platform/ti/vpe/vpdma.c
> index f8998a8ad371..da90d7f03f82 100644
> --- a/drivers/media/platform/ti/vpe/vpdma.c
> +++ b/drivers/media/platform/ti/vpe/vpdma.c
> @@ -1173,4 +1173,5 @@ EXPORT_SYMBOL(vpdma_create);
>  
>  MODULE_AUTHOR("Texas Instruments Inc.");
>  MODULE_FIRMWARE(VPDMA_FIRMWARE);
> +MODULE_DESCRIPTION("TI VPDMA helper library");
>  MODULE_LICENSE("GPL v2");
> 
> ---
> base-commit: 19ca0d8a433ff37018f9429f7e7739e9f3d3d2b4
> change-id: 20240609-md-drivers-media-platform-ti-vpe-2ebb82b6182d

Following up to see if anything else is needed from me. Hoping to see this in
linux-next so I can remove it from my tracking spreadsheet :)

/jeff

