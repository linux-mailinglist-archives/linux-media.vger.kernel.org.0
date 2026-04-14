Return-Path: <linux-media+bounces-58745-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +pg/AApd3mn7CQAAu9opvQ
	(envelope-from <linux-media+bounces-58745-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2026 17:28:10 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 89F5E3FBCE7
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2026 17:28:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 32AD4308399C
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2026 15:14:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FBCC3E959C;
	Tue, 14 Apr 2026 15:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BVigGB5D";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EhjwLadH"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 709C6218E91
	for <linux-media@vger.kernel.org>; Tue, 14 Apr 2026 15:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776179684; cv=none; b=l63TiJi2L5mCRqH90PfB12DRYEIMKF4ZsIMsJyWilnU4cIS3JJbY28EwesEUslYPjDhXJInz1pz9/SX66FDU5bH85GcOYNZ8gvW8LifZZatsRkuDTYlGiUDlsaQb1Zrr5m1mzh6AdvOf+grBo2BFMBFZ8l96US25jj7tlqY6qrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776179684; c=relaxed/simple;
	bh=kz5rVB37M5fxScKGUAVyVpMiRJhrFFk1kH1C6GoH3mM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QZtSdVauf0H+GkCQgMe7MeKBAVHKvJ0NeeSwrqBvAcDjrWC/PyMXauZgKHQH0joIPOSkeog5s3G0UvxffWH4exxyQ6ExcTcy3wm4lYTIszgqRtQGCElaku/4yGP7IvMIPLBp8FkFujooGgetpcvwRNhnqprZNlkBfybbimOO8G0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BVigGB5D; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EhjwLadH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63EBLGAB3505294
	for <linux-media@vger.kernel.org>; Tue, 14 Apr 2026 15:14:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=G4aks4H+FpBEhHapfREL4acD
	uXkNuXLZB9iHD5QRayk=; b=BVigGB5DQCUAuMqT9N8E7MhX51L6Wpm34hRvStzt
	589YH7R1IhsGrQaDAu5OSwdVorLtvYLlEhb4n+hVbo+D67SB8f1Q337qvxM/3xMA
	wqakA9SLntF3lCYj4Y84QT9nKrSSDo5/rJpSLRL7MdexfE3T9ju51Z1DbWg1I2kr
	i8LBKfG2EZJobaPtrXcnAuEm4ODWqIbmzHJ3t8/LH8Pn5zj+MeAtnmxbxVwovATY
	K0Xj8WEZSkFReiDDmGHLP16QDW/mGMArrntaV31Wlk1Y8+795ERgxnKo+HgZ6umc
	1qLUTVrMiDCjVrLvR1ZYona1CoGDvfg4I7Zz4Gr4I2dnRg==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh870kavq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 14 Apr 2026 15:14:42 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-6056898a01dso4169327137.3
        for <linux-media@vger.kernel.org>; Tue, 14 Apr 2026 08:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776179682; x=1776784482; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=G4aks4H+FpBEhHapfREL4acDuXkNuXLZB9iHD5QRayk=;
        b=EhjwLadH4PbtytNvORjJE2mZxs6F99RsfaR5q8FEWqySzPVM3PO7RWTGjCRkhozv+L
         kZpxR9eu5LQtM3A/eETpiQpufIuY/inTINT2Nmg97UPbVUsAOuObXzCHVGn/hZMnrZgj
         hNsM1J6T81dBd7yvynphxFR3tkGtO3uJFhpgmMjggOow22/ZTCPx2WtpSdJCXXdiNSuC
         u1WzSvaIoO9C7v/8rFoIdppqr0VOM/SA938YQVQmB8jgtACal3D6muusGwak1/BNbtk2
         2bzoshX8eCLfVSU+Yt+wQEXas/m1ixvzVamJ9CpO6P46orK2KILCGbmm6IjRb/bNYT7d
         s+jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776179682; x=1776784482;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G4aks4H+FpBEhHapfREL4acDuXkNuXLZB9iHD5QRayk=;
        b=BmlEqs2HOfOi3iEnYAsRZVlR4XAEuEK/VFm+Vbexz5DF03AD1iqNPp/S7t9HipPjyY
         7uCQ24anq3Po0oSZo0Xl0Oqhew8w8FD8dZykGN6yHChg3NHHcxsnJ+EfvZomVyMHEzEl
         GGrsLgGmZJMs2sDD6NlEV/rIO8JQGYbKMxAtZQFdZVRWcdQ+x6Ef+6B2oJfw5Wlxsesd
         h+uZoS33+COsxXyD20pZb00hmYMOj/W+QCwFJAQaJVnECbwfFzSEpYpC4dZ1WrJn8gAi
         pGuqxHpS001Z1cbYnmRWSVK9SqKfaYpRvr6mE4d2wB6I5079LZdkmJ1vM6gH3W9T8tXv
         19mA==
X-Forwarded-Encrypted: i=1; AFNElJ+FJwR7iSIuTW9i6J741/9R84UDUMoAc3rV7RtIc+6+nEDOy5Eeb/kGz9FoPupkKkmhe4oaTCNu+rZEow==@vger.kernel.org
X-Gm-Message-State: AOJu0YzPIl/PZt9vCNRc0ZLg8H7NvbvDVkd2tavkqoU8EdM+nFkZ1QgZ
	8mHS2AyHdFYEZyQvXKig7GtUl5MScA2J4WILnl2zkrT8e7jFsLA9KBTyoge2isUeDk/Xu/l/yqd
	i+XzMK6oT4zuUd4pWsO5yghXMf00jFudZyGhWE90Y1hQP+SrUGCQB69NZ6GTIkKFVHg==
X-Gm-Gg: AeBDievUPfdvNmBdxQFKUu/aqhNaVPaVRXpqyZeJJsi+BWkZ/jDUuv4xhnmfZTlHN8s
	SQFGdMRLaFLKSzpW7txsx2/zD7xtCCZtC0b54nePIfNG1oRqfLpifG0QSuZWhSsNE+6/XCPnGm4
	Z67CWlv0LhHoBPwUM/fdr6mB2Bg2JQ5sSwSdMKQ+XW7rRZOOyWiUbj4gs/q2M5Cl+FDcRKi1FMR
	yRN7XhpZcp3e+Ovl7KFtroVYOcipzKJJUuiOyfBTHMXFJFwgAHkKcp9jwdB9MSfvbZlh0xC+oSP
	JabG2SLyD5zTLJ6x/DTNPdbZea242y/3CVx2Ms2aQzRUR0mkw08W2JY/WRvAtuLN2s6f7wbgXkL
	CbFDtuAXYUJDNWiBk3Bf2u+HsX6p0aGvnmI0ilu9TvoVRi5zMg2njzhHd0RYPc5KMV22dPgGQjj
	7oho0HoYOvPc3AuvAIhRSh3gioC450+MoBBy4ntFrp1D3CHQ==
X-Received: by 2002:a05:6102:441b:b0:609:4d86:77b with SMTP id ada2fe7eead31-60a00f39005mr8189054137.24.1776179681602;
        Tue, 14 Apr 2026 08:14:41 -0700 (PDT)
X-Received: by 2002:a05:6102:441b:b0:609:4d86:77b with SMTP id ada2fe7eead31-60a00f39005mr8189005137.24.1776179681134;
        Tue, 14 Apr 2026 08:14:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38e492702f7sm31782441fa.9.2026.04.14.08.14.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 08:14:39 -0700 (PDT)
Date: Tue, 14 Apr 2026 18:14:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev
Subject: Re: [PATCH 02/11] media: iris: Add iris vpu bus support and register
 it with iommu_buses
Message-ID: <eqxeib5ci42ox4o7l45yjwgsjwjyhekojiigpxj6s5npjw5cwq@ggbtohqh3pip>
References: <20260414-glymur-v1-0-7d3d1cf57b16@oss.qualcomm.com>
 <20260414-glymur-v1-2-7d3d1cf57b16@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260414-glymur-v1-2-7d3d1cf57b16@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDE0MyBTYWx0ZWRfX/idOcR84DFUN
 KqudBm0KGgTYL8nddSrGi03P1Rz6/CfQ1PzlwDKQGIIqrSpdpIin8xjd6pQvclkE1+tw6kH/WUo
 5XoVPfBDHL/v+R2KUIdGCUMykTY5Xe7F7tApXmatx4e5AicmiWvPhzLviD3xZ4htkuJJ92QbjTG
 /FHNFLV5ZWCNbWp2V23ssn9EYZ6F8mh3jnCfZUHf9W28vG1aymuqmTCgdNEjKNYL5N5qdE8gBBU
 YhUnWEgz45unzcyqMUCUvfX+DdP6jSqmpBK04yJ7QGyGWqipeUTaLCBah3ekoGme6CGVYu90SBq
 FusT8MCusSQiYsWys8Vp0/RqBfUBLV8p5K7D9HDQKWFzN/hVbSQMM832prm2PutXv/8wA5DoZsE
 OBOZwJ9wXvmvnsuYnqs7ZAem7RRhcB9hf02QBqmgUpA73PKWzYbz+L0mHIE34zsDHAWqNZejtsJ
 jrlrxxE4S9IZ/ngoU7A==
X-Proofpoint-ORIG-GUID: CaEQzS_cRnlLlzcY4IIoe5VzusZsTEcm
X-Proofpoint-GUID: CaEQzS_cRnlLlzcY4IIoe5VzusZsTEcm
X-Authority-Analysis: v=2.4 cv=btZ8wkai c=1 sm=1 tr=0 ts=69de59e2 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=A7GDoH_M6FUROJucG8cA:9 a=CjuIK1q_8ugA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140143
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58745-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 89F5E3FBCE7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 14, 2026 at 10:29:58AM +0530, Vishnu Reddy wrote:
> From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> 
> Add a dedicated iris VPU bus type and register it into the iommu_buses
> list. Iris devices require their own bus so that each device can run its
> own dma_configure() logic.

This really tells nothing, unless one has full context about the Iris
needs. Start by describing the issue (that the device needs to have
multiple devices talking to describe IOMMUs / VAs for several hardware
functions), then continue by describing what is needed from the IOMMU
subsys.

> 
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---
>  drivers/iommu/iommu.c                           |  4 ++++
>  drivers/media/platform/qcom/iris/Makefile       |  4 ++++
>  drivers/media/platform/qcom/iris/iris_vpu_bus.c | 32 +++++++++++++++++++++++++
>  include/linux/iris_vpu_bus.h                    | 13 ++++++++++

How are you supposed to merge this? Through IOMMU tree? Through venus
tree? Can we add one single bus to the IOMMU code and use it for Iris,
Venus, FastRPC, host1x and all other device drivers which require
per-device DMA configuration?

Your colleagues from the FastRPC team posted a very similar code few
weeks ago and got exactly the same feedback. Is there a reason why your
teams don't sync on the IOMMU parts at all?

>  4 files changed, 53 insertions(+)
> 
> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
> index 61c12ba78206..d8ed6ef70ecd 100644
> --- a/drivers/iommu/iommu.c
> +++ b/drivers/iommu/iommu.c
> @@ -13,6 +13,7 @@
>  #include <linux/bug.h>
>  #include <linux/types.h>
>  #include <linux/init.h>
> +#include <linux/iris_vpu_bus.h>
>  #include <linux/export.h>
>  #include <linux/slab.h>
>  #include <linux/errno.h>
> @@ -179,6 +180,9 @@ static const struct bus_type * const iommu_buses[] = {
>  #ifdef CONFIG_CDX_BUS
>  	&cdx_bus_type,
>  #endif
> +#if IS_ENABLED(CONFIG_VIDEO_QCOM_IRIS)
> +	&iris_vpu_bus_type,
> +#endif
>  };
>  
>  /*
> diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
> index 2abbd3aeb4af..6f4052b98491 100644
> --- a/drivers/media/platform/qcom/iris/Makefile
> +++ b/drivers/media/platform/qcom/iris/Makefile
> @@ -31,3 +31,7 @@ qcom-iris-objs += iris_platform_gen1.o
>  endif
>  
>  obj-$(CONFIG_VIDEO_QCOM_IRIS) += qcom-iris.o
> +
> +ifdef CONFIG_VIDEO_QCOM_IRIS
> +obj-y += iris_vpu_bus.o
> +endif
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_bus.c b/drivers/media/platform/qcom/iris/iris_vpu_bus.c
> new file mode 100644
> index 000000000000..b51bb4b82b0e
> --- /dev/null
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_bus.c
> @@ -0,0 +1,32 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#include <linux/device.h>
> +#include <linux/of_device.h>
> +
> +#include "iris_platform_common.h"
> +
> +static int iris_vpu_bus_dma_configure(struct device *dev)
> +{
> +	const u32 *f_id = dev_get_drvdata(dev);
> +
> +	if (!f_id)
> +		return -ENODEV;
> +
> +	return of_dma_configure_id(dev, dev->parent->of_node, true, f_id);

I think it was discussed that this is not enough. Some of devices need
multiple function IDs.

> +}
> +
> +const struct bus_type iris_vpu_bus_type = {
> +	.name = "iris-vpu-bus",
> +	.dma_configure = iris_vpu_bus_dma_configure,
> +};
> +EXPORT_SYMBOL_GPL(iris_vpu_bus_type);
> +
> +static int __init iris_vpu_bus_init(void)
> +{
> +	return bus_register(&iris_vpu_bus_type);
> +}
> +
> +postcore_initcall(iris_vpu_bus_init);
> diff --git a/include/linux/iris_vpu_bus.h b/include/linux/iris_vpu_bus.h
> new file mode 100644
> index 000000000000..5704b226f7d6
> --- /dev/null
> +++ b/include/linux/iris_vpu_bus.h
> @@ -0,0 +1,13 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#ifndef __IRIS_VPU_BUS_H__
> +#define __IRIS_VPU_BUS_H__
> +
> +#if IS_ENABLED(CONFIG_VIDEO_QCOM_IRIS)
> +extern const struct bus_type iris_vpu_bus_type;
> +#endif
> +
> +#endif /* __IRIS_VPU_BUS_H__ */
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

