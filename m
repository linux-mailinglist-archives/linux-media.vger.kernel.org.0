Return-Path: <linux-media+bounces-60957-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gHkDK7Y2/mkroAAAu9opvQ
	(envelope-from <linux-media+bounces-60957-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 08 May 2026 21:17:10 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E4BE4FB033
	for <lists+linux-media@lfdr.de>; Fri, 08 May 2026 21:17:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4B451304D266
	for <lists+linux-media@lfdr.de>; Fri,  8 May 2026 19:16:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C21C936D50D;
	Fri,  8 May 2026 19:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ClFrJTdu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M+E4UaZk"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE93233D511
	for <linux-media@vger.kernel.org>; Fri,  8 May 2026 19:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778267791; cv=none; b=FRbarNP5OKXXPyiwr3ME8le703oKGhZb6MXUaLVUcp5jcbK6MuENcU6nCWOIcQ1n1obUKrz4qMWquK47h1GqVvHU2qfBoQDyUitV5dHbFRXhyxj+ARQI4LsO/g2FnaIi1FH/tl/B/3xZvOYqd0gwxEM6bDitPWGEKneDLJmZFBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778267791; c=relaxed/simple;
	bh=8BmL+CWOecwAJ530xbi5ghoHg+OfAxe8bxaz1uRjde8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CBxuiTYS+XhxAVvAI34K2szKHMjnVAuPY7zTAbIGLt4VV+RVf1k2uMFw7b/59fF8sumOdjsrlcESRwKXw+5R/ZxRWg82cdd7DIjopEuf6UyEBFXYiIVErnxrM0KYSqlPg2GUFvOxzAlRUaxX4nAI8YKsl7CS0/UIGMqGuSR30Mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ClFrJTdu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M+E4UaZk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 648GWIt12335407
	for <linux-media@vger.kernel.org>; Fri, 8 May 2026 19:16:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=sVlipysOkBuAV8gAYceMqlYw
	RvO7SmJQFQT+Lf3VYoc=; b=ClFrJTduf/AGwgBQNiSB07zBanK5DmhZ8zKq7Ci1
	0eLDZcWPp0c0IMQexFI4rKvvTgy2YveLru9UPZkW5UTl9AVX9lZrzfJJAO2R0nGV
	GG9Z3OcuLv+ywcUuiBccd+uTYT1VSCP7JKHpOcbTysXNH97329IpUXyhoxLWhShU
	ALFCgxrZR370tZvuFOBmMQUHR63LqzzoVnRCM1l//SM0KapM33fj9mWEJfbayIr1
	qKsq8Y6ZYDuTw8s5olbA20p/muWhYyjZHMl5iOgTatOILO+y3C09HHJHMcbNQ7ZV
	GnaxW+pGi9zRgzUhpsunAOPlulejlPoHvZ8DJNxTEuA8Tw==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1keh8jeg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 08 May 2026 19:16:28 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-6313385ca1bso961086137.1
        for <linux-media@vger.kernel.org>; Fri, 08 May 2026 12:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778267788; x=1778872588; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sVlipysOkBuAV8gAYceMqlYwRvO7SmJQFQT+Lf3VYoc=;
        b=M+E4UaZkW7tL8AO0gSdaTnja1P/olKT/MNGYk8FZQfn/ujwCSLercVoUJNyHPdFZAu
         Muahr17WKLEciitjVH2ihoIR9MhIjPjWSzoCWaHn7aderSKthKETEw2k3mdnQd2VXuBa
         Pq09hBhXd855FRH55opdtb8uoA76Dpx/Fo/dpl0ljDibiuJJmZUO7dEjrYiqAc1Ku/KQ
         SdMWUnwOp7t/FUgdCJTTeUvYoY3rIi7PmiUUloyHiCrxZg6UK9S2iOCZlnSEO7dPY8rF
         Pip/N3JAOooNFOy3cRNiPwny58rsHgd0LSGEUcHuD2wX752aUsBT1/x9lO1Ko8HQ6QOA
         qd6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778267788; x=1778872588;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sVlipysOkBuAV8gAYceMqlYwRvO7SmJQFQT+Lf3VYoc=;
        b=E8Ao9mAWt7qgXRWNmCC4YmBcAGbVv16xh6pmR2oNytQ2GWqxcFocLHx88NmPUVlukC
         qbmcRyUud4sDQUU29C40R2Na0+evuoAdxaTzx6fDVqYuO2j5t5OM9Nd9ocACvszN7ohF
         PZpow9GTpR74m4EH+hi1/jzAgqUUq6F7zvp2Re7iCLxfMfzVozGWcBBgwLanyEwfT6wk
         QN3pv1aNUUgP1fKfDFQH9JDw9wkvqKdHt0YhegIeFUwx4nayJEB6ALu06MDhy1bJnRZC
         ywIJiR3W1G0FdwRbItqHOeDidOWY4/64ghMBKqnVSlSnGQQg1+cmy6uBEIj3cGj3Soz7
         /CcQ==
X-Forwarded-Encrypted: i=1; AFNElJ8M0jAtpB8aFvc2UxkhsHs/zh5FOXYnSGymNXGSFpNdvG/DOvVciTC4syPnV4oXiZUnxlM1+ThTYQlMRw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwZTW8uIUTcHsXLnbggiCKm/1Q5iEPsDNpSHk7bv4UZsTr6Xt0G
	LlTeojx3WffQQj5mF07RArWUnJySKc4lgXXeHJaSav0eAhgSGlgepbe6OXZ9+H7gBVi9gvp/lP2
	pl5XnphTBqTOX9l6u3UuGGoa32KowC+L1Y69OfFFX0QiXvuQuXLRH9rp1EZwKjbzXnw==
X-Gm-Gg: Acq92OFubzy3o620izq2U/evSLX5Vxm3wLwGWPP117e6PNjLtXQxAkRZqS95HDToy5b
	kJzVvlardj+SUZg+Z/Tz5A2jX9+XMP8Pj6kVXXY57FLcMIr0muSxad7V/jmQv1usMriONSuaSzx
	fkArA2UOrL9DOfdqsq/9Mry4HWHEuYDwDic7nEMJcGqI2uycOYxcchh3tOYpDZragxv9UUsfKUE
	3kucizFnN76x16ltn7IA0ppHTbaKwyhmRjWiY/YxQZute/gk/hIDFVYmrojsi4FOS7/2R7X/bVY
	7ft6qQoiwiLyvqp5p+v3+S0HNnhkjxtTlcYdwlGCPb85mS+/9+V4q0gl075yUWsgNKqmCaDo58m
	Ppcscl2zNv9SZSmyZpxHTMEUMwqwqyj1jI/YMDVBsMrlbUpQWPylr6x0cLhA43J55ISixvIK/GV
	aG3Uitv6bjiG/9xJ8D6MqCharjJy/FhLVnL+E=
X-Received: by 2002:a05:6102:5813:b0:62f:3713:92bd with SMTP id ada2fe7eead31-630f901b14fmr6998004137.6.1778267783562;
        Fri, 08 May 2026 12:16:23 -0700 (PDT)
X-Received: by 2002:a05:6102:5813:b0:62f:3713:92bd with SMTP id ada2fe7eead31-630f901b14fmr6997639137.6.1778267781168;
        Fri, 08 May 2026 12:16:21 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a9515444sm723771e87.9.2026.05.08.12.16.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 12:16:19 -0700 (PDT)
Date: Fri, 8 May 2026 22:16:17 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Del Regno <angelogioacchino.delregno@collabora.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, Krzysztof Kozlowski <krzk@kernel.org>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v5 01/14] media: iris: Add iris vpu bus support
Message-ID: <brt5t4b2eaudpb76rfdutfpe2p3rgjjyyrezcpsarqvuzsvvru@fgf22ttmijfs>
References: <20260509-glymur-v5-0-7fbb340c5dbd@oss.qualcomm.com>
 <20260509-glymur-v5-1-7fbb340c5dbd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260509-glymur-v5-1-7fbb340c5dbd@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=CJIamxrD c=1 sm=1 tr=0 ts=69fe368c cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=9yz3bF2usBS2VQdoGnQA:9 a=CjuIK1q_8ugA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-GUID: hVQFBIemJqRwEpoVhfjQYfPJk0k5g5Pg
X-Proofpoint-ORIG-GUID: hVQFBIemJqRwEpoVhfjQYfPJk0k5g5Pg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDE5MiBTYWx0ZWRfX1I0RVBkTESaw
 TXZ07IuqvL/HYWFs/oRMBCkJtrmPeadeV4Ok+bXm3t8d6TV0BNbbA9NdZkDwrvbiMTazw+G2ENB
 w9en3jlBBOdbaHUsiRn1TZFlPn2L2dl8lqiFFdB5NNNT377uN5TSiS72LLgzxOnUHGmNnP9RHX6
 R+NOim+b8SsX8uQEwmrh1aaNnKq6Lpe4o2MfzDc4w9F7QFESSpuanVq1QK1kWvCU6KgcQws4mFB
 APAbTCEMLoyNys7OoC1gf+AUN1lpJsRcOEezgsh4Y6v9Vbq2P/Z8T2+G/1bewV1QGX1UtacZC2E
 Zg10hITGEhVvWUHBawLgCPr/GXkYBq+9A1LRT05DiD+oCp0MYDWdmY0Pj8zytGySqJHX/LxXWrb
 jUniYj8d13swqKPraHeCAOhoqybe1G44bZ/k3uxkpvtX3LI6yEJB0PBSLkaXMbu1YpoGUs/FMhN
 B/M3siAhOcftTzmXHpA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 spamscore=0 impostorscore=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605080192
X-Rspamd-Queue-Id: 0E4BE4FB033
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60957-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Sat, May 09, 2026 at 12:29:50AM +0530, Vishnu Reddy wrote:
> From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> 
> On glymur platform, firmware loading needs a separate IOMMU mapping with
> its own stream ID. This stream ID is defined in the device tree with the
> assosiated firmware function ID in the iommu-map property. To create this
> mapping, a separate child device is needed so the firmware memory can be
> isolated in its own IOMMU context.
> 
> Introduced a new bus called iris-vpu-bus. This creates a dynamic device,
> and its dma_configure() callback calls of_dma_configure_id() with the
> function ID provided by the client to map the corresponding stream ID.
> This sets up a dedicated IOMMU context for the child device.
> 
> Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/Kconfig        |  4 ++
>  drivers/media/platform/qcom/iris/Makefile       |  1 +
>  drivers/media/platform/qcom/iris/iris_vpu_bus.c | 69 +++++++++++++++++++++++++
>  include/linux/iris_vpu_bus.h                    | 25 +++++++++
>  4 files changed, 99 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/iris/Kconfig b/drivers/media/platform/qcom/iris/Kconfig
> index 5498f48362d1..025280ef1221 100644
> --- a/drivers/media/platform/qcom/iris/Kconfig
> +++ b/drivers/media/platform/qcom/iris/Kconfig
> @@ -1,3 +1,6 @@
> +config QCOM_IRIS_VPU_BUS
> +        bool
> +
>  config VIDEO_QCOM_IRIS
>          tristate "Qualcomm iris V4L2 decoder driver"
>          depends on VIDEO_DEV
> @@ -6,6 +9,7 @@ config VIDEO_QCOM_IRIS
>          select QCOM_MDT_LOADER
>          select QCOM_SCM
>          select VIDEOBUF2_DMA_CONTIG
> +        select QCOM_IRIS_VPU_BUS
>          help
>            This is a V4L2 driver for Qualcomm iris video accelerator
>            hardware. It accelerates decoding operations on various
> diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
> index 2abbd3aeb4af..79bc67980339 100644
> --- a/drivers/media/platform/qcom/iris/Makefile
> +++ b/drivers/media/platform/qcom/iris/Makefile
> @@ -31,3 +31,4 @@ qcom-iris-objs += iris_platform_gen1.o
>  endif
>  
>  obj-$(CONFIG_VIDEO_QCOM_IRIS) += qcom-iris.o
> +obj-$(CONFIG_QCOM_IRIS_VPU_BUS) += iris_vpu_bus.o
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_bus.c b/drivers/media/platform/qcom/iris/iris_vpu_bus.c
> new file mode 100644
> index 000000000000..15ba4d9c563e
> --- /dev/null
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_bus.c
> @@ -0,0 +1,69 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#include <linux/device.h>
> +#include <linux/iris_vpu_bus.h>
> +#include <linux/of_device.h>
> +
> +static int iris_vpu_bus_dma_configure(struct device *dev)
> +{
> +	const u32 *iommu_fid = dev_get_drvdata(dev);

This should be drm_get_platdata() rather than _drvdata().

> +
> +	return of_dma_configure_id(dev, dev->parent->of_node, true, iommu_fid);
> +}
> +
> +const struct bus_type iris_vpu_bus_type = {
> +	.name = "iris-vpu-bus",
> +	.dma_configure = iris_vpu_bus_dma_configure,
> +};
> +EXPORT_SYMBOL_GPL(iris_vpu_bus_type);
> +
> +static void release_iris_vpu_bus_device(struct device *dev)
> +{
> +	kfree(dev);
> +}
> +
> +struct device *create_iris_vpu_bus_device(struct device *parent_device, const char *name,
> +					  u64 dma_mask, const u32 *iommu_fid)
> +{
> +	struct device *dev;
> +	int ret;
> +
> +	dev = kzalloc_obj(*dev);
> +	if (!dev)
> +		return ERR_PTR(-ENOMEM);
> +
> +	dev->release = release_iris_vpu_bus_device;
> +	dev->bus = &iris_vpu_bus_type;
> +	dev->parent = parent_device;
> +	dev->coherent_dma_mask = dma_mask;
> +	dev->dma_mask = &dev->coherent_dma_mask;
> +
> +	dev_set_name(dev, "%s", name);
> +	dev_set_drvdata(dev, (void *)iommu_fid);
> +
> +	ret = device_register(dev);
> +	if (ret) {
> +		put_device(dev);
> +		return ERR_PTR(ret);
> +	}
> +
> +	return dev;
> +}
> +EXPORT_SYMBOL_GPL(create_iris_vpu_bus_device);
> +
> +static int __init iris_vpu_bus_init(void)
> +{
> +	int ret;
> +
> +	ret = bus_register(&iris_vpu_bus_type);
> +	if (ret) {
> +		pr_err("iris-vpu-bus registration failed: %d\n", ret);

Just 'return bus_register();'

> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +postcore_initcall(iris_vpu_bus_init);
> diff --git a/include/linux/iris_vpu_bus.h b/include/linux/iris_vpu_bus.h
> new file mode 100644
> index 000000000000..7437a2ba411c
> --- /dev/null
> +++ b/include/linux/iris_vpu_bus.h
> @@ -0,0 +1,25 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#ifndef _LINUX_IRIS_VPU_BUS_H
> +#define _LINUX_IRIS_VPU_BUS_H
> +
> +#include <linux/device.h>
> +
> +#ifdef CONFIG_QCOM_IRIS_VPU_BUS
> +extern const struct bus_type iris_vpu_bus_type;
> +
> +struct device *create_iris_vpu_bus_device(struct device *parent_device, const char *name,
> +					  u64 dma_mask, const u32 *iommu_fid);
> +#else
> +static inline struct device *create_iris_vpu_bus_device(struct device *parent_device,

You are adding globally visible API without _any_ sensible prefix. It
should be named other way: iris_vpu_bus_create_device().

> +							const char *name, u64 dma_mask,
> +							const u32 *iommu_fid)
> +{
> +	return ERR_PTR(-ENODEV);
> +}
> +#endif
> +
> +#endif /* _LINUX_IRIS_VPU_BUS_H */
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

