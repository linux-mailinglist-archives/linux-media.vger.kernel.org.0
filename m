Return-Path: <linux-media+bounces-67158-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wPDeBsegT2o+lQIAu9opvQ
	(envelope-from <linux-media+bounces-67158-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 15:23:19 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 60B35731859
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 15:23:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=OXu46jvq;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Ij2c8SBc;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67158-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67158-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8899130A65D4
	for <lists+linux-media@lfdr.de>; Thu,  9 Jul 2026 13:15:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BB1123EAA4;
	Thu,  9 Jul 2026 13:15:07 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A021523A561
	for <linux-media@vger.kernel.org>; Thu,  9 Jul 2026 13:15:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783602907; cv=none; b=Upa11bRfeps2vFY5h3S4J4nEyM9qtOv5DieXdo2FgsCLmLHrlltYNXRf+OWMHeg59bXeiSiikAEZn/nMiTl6hDo5dQtOepb2veFFdk7NLAvDoMUxQDnBoxPfIxB1ApxQLdQW3JBemVbNQgrtc83cfOhzOSQTiWkbIGpJgblfybg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783602907; c=relaxed/simple;
	bh=kxHs/fi/spj4z7RXMIsqSTpgi1AKBRAozmoZVIQW0zY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pDy+i2iOn+Ycn0bhl+lU+8qahBfYek8CZBLrHtXUhEumNpdo/Et7XiJrR5MNMYx8vtDkDkmN9CQxM0RnqWat3T7jdBvscRkR7Ks4ycnCeUpctn5ZYjdsIqlef6eRc+EN7QSLr8wi5nGS1cSgKFNmWq1xpGvx1Gx5/QS1Rz4Gpf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OXu46jvq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ij2c8SBc; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669BN7pv1537225
	for <linux-media@vger.kernel.org>; Thu, 9 Jul 2026 13:15:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=p3J+vb/d0VohjnsZg3ji4uSx
	pD8yDGTVB5E6yxUIvBo=; b=OXu46jvq4wPbLsTFXLhHI7kJAmJSfGxJAh+3/6yz
	ctSRQyiWNT0b8/uZ70rQ3YNBUCAX9soeEdCcUnJhzjPkhV5xxpR2jCYHcqXNoqnH
	Dok5BEdKtsQoxqFNTygCw9+TmA9u6/7JYU/9rS4SgO4Y7sW2DS7PXx83OU5mS4PJ
	xIZ5cOj0PgXW6jcmH+dzUWfUbAu6c5KVvrP5QkghbW+kuLOk8fvg8ksV7TnLT9dI
	f9TanEAm9z9PE7qRsyPL/spVajFm9LYKnDWtN5wTrzeOLrzRlXVmFhw7Cccgd9SN
	MR2N8PXmyQLr6Yi44ee3+x3Gce+V0FjqQX0X/mUs4UZKkw==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fa1ydtuvq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 09 Jul 2026 13:15:04 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-744e7c40512so188491137.1
        for <linux-media@vger.kernel.org>; Thu, 09 Jul 2026 06:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783602904; x=1784207704; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=p3J+vb/d0VohjnsZg3ji4uSxpD8yDGTVB5E6yxUIvBo=;
        b=Ij2c8SBcDcmD2pjKMjK++tV0ENxSzhnph4sF4sI7Ck/5hAJ8PALOL5w1gViGOd4L75
         fhZCffrj/fSSad5W6lRYC4wGGP66gcV6L6/Q+he1/N+YQtWTGQdBOYKPLalvSZABak3K
         S8HS8RhVPnVt3YHJ/ycdxg18qwLUr5URFwXTV15dwYAN6ksQ9egpE1o/O2ahGx6W110g
         ToZ9308mGyNnAWgAdk6usHHjy6y1lepW1IXDTglIOqlnrl2hnKlLaj4gjE5m+l8Q5OCw
         fUwbIELfjUK6tolu8UjvjYJNRXwRtofJUfxfNwiTuboh6di8qOW9zOn8HygCnuDOOl7l
         ukDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783602904; x=1784207704;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p3J+vb/d0VohjnsZg3ji4uSxpD8yDGTVB5E6yxUIvBo=;
        b=FHemhFxe9MwkAnwBJwr/wxWozX4xPYn7gCTYTou+ZplX+Tcgyc+iarpXGiMRjqkZAw
         G5wYkv1OWfCfaGrnzThUhDTiFHAsRAw8N46j19NM9jiNyWYUGl47Gyl9h1+Tt4mziTQw
         ss45MLjvWBvtolcpuZcIhLL1SUl7mDq7zhhbVlr36QwYRQc3JEHQsiQ4vGP73Y3XK+KU
         3Ia8XmglI4zv3qk6F4Uo12gMqR6QCMTAEkc0K/YGG3WRtBd+vG64C+HxmdDgFACVHNhh
         WqUFf5FTyciDmo0/CDHtJG2LKKo/yR81HhBukTALGldfUqq14MShp48HofJ7oRHMNyH6
         OvqQ==
X-Forwarded-Encrypted: i=1; AHgh+RroUB0fPKRVLygfjoF8D7SdVpFPG51x9X4Lde+ZcLyynBnev935kjqWJqsbZhQL1ItB2q7vQkskqgiD9w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyRe+CsGHQBrqaGaXqodp6J+0BO8p+YCXVrJ6+eTx3CtuNGHcL5
	ZtOiDLfehH6b87znRXaiQmlRS2T+1PCszCk431wtsD8VIok4gDf+nWVSW+WzJ/M2ETJiNLQwzVN
	pMNyV7JTqP6y0AkSnNB5ySSSmoW0htKmQwOU5WpZsVGoT/3V2R6IitJzlUi/H1inuAw==
X-Gm-Gg: AfdE7clj9B/ES/evf78BQCkurLO56qv6uMrW7Uesx0K9YMMREai8NIV0Vdsj1rl06jH
	QaNime1VH3IY5Qpm06RyWR2YAD03klaMhINRqs7PofU+QSd/iWPawgEFmffLaLJSYUepnYI3w9n
	5dUNPXXYHyspvhQQ1/UHuYS8qYoe7u+B3AnVVQn2QXhj2PoQMbHyKHc+UHG7SYV4nouilVJ9JK+
	SCc1UV0R3BCLJW6OB+F+gPIEpRydmdWBJksMhpdxrN3VXwp8VjFOhozL7g/7vNe3oTXcpu2F5Nx
	tST7aEDDf2ZhUBGYMVFYjayrJl1VAkfYS4ERa+LPr8srchAfEznH2UCBqEi4bVitsxSqfG8Mo9e
	sFCac+U3qy4LifArcUtuJmYDAfPFEC4NO6hWsbcEqCwXDMJvz/jR5LG2EmBUTWb3EY1akmisRAV
	h4eShsm0HsKy34oo5fb1EzbOzS
X-Received: by 2002:a05:6102:1490:b0:631:af51:7d8e with SMTP id ada2fe7eead31-744e00d15demr4015026137.17.1783602903409;
        Thu, 09 Jul 2026 06:15:03 -0700 (PDT)
X-Received: by 2002:a05:6102:1490:b0:631:af51:7d8e with SMTP id ada2fe7eead31-744e00d15demr4014993137.17.1783602902810;
        Thu, 09 Jul 2026 06:15:02 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13bbbd1sm5179015e87.44.2026.07.09.06.15.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 06:15:00 -0700 (PDT)
Date: Thu, 9 Jul 2026 16:14:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: Re: [RFC PATCH 06/11] media: iris: Add hooks for pixel and non-pixel
 context banks
Message-ID: <osurkrrhqgkxtgv6lkose2n7ll5f3ofydl2gnjenogtyxaohvm@7ccuyiaeg2nm>
References: <20260709-vpu_iommu_iova_handling-v1-0-72bb62cb2dfd@oss.qualcomm.com>
 <20260709-vpu_iommu_iova_handling-v1-6-72bb62cb2dfd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260709-vpu_iommu_iova_handling-v1-6-72bb62cb2dfd@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEyOCBTYWx0ZWRfX7HaYIbkcyTPV
 Cv0xDRmeYJqXUHJ0dztS/FY/8y94fF+7bnbheqzkYH9/cn+q6ICSlxekWlIpmh3k5vVs7o5F8Nb
 /iDYguxr4OEH3Km2jlyy3hA6tWQIy3o=
X-Proofpoint-ORIG-GUID: FAmvc_3O8qaXDWHKUQu3C02dH9vbA3cu
X-Authority-Analysis: v=2.4 cv=cOLQdFeN c=1 sm=1 tr=0 ts=6a4f9ed8 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=tcVzVmk79huRiCZlmVQA:9 a=CjuIK1q_8ugA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: FAmvc_3O8qaXDWHKUQu3C02dH9vbA3cu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEyOCBTYWx0ZWRfX0Gs1TLj7eePT
 q8c/R7Hz/jzOmw1x1xEzRASw46KULphZjIXbhRNtwzb1C6wkiNTGXsmxMdERT89E0iAgAPd0Oaj
 wXzUqO9l2zyEoEOjNBxsCsNvDuIJcAGF9vMqEU7u0ccglopCVj1cKnAVbWUqzXJxgb0ivYSySF2
 oeR8qTd+ztWPm1x0GlFkh8pmFcZkIVEGZHmQEiDIxlcRJ7sQq+78LVvesHLg8A5YqaVCsFQ34bM
 jgeO1YwGe07rrU61Gxs9VI1FnVA1+z0o0Zx4phLxjhTuivRxF+dGR/7ezoj9jkKzbg/0wfliEmy
 oDg5H7Th3PWlMfBMK8NInpvryG8mcF0KEJrNA8K4acQgZxkcKzwSwZspvXtkW6Lw0tKkD2xzsAJ
 Cbiz8MoNN0uwiNQrIOsN1hXYh+DXVgYJJ626EHlq4MndFvrIPSr5zRfNI9hiGZ27D1Ieo6EPW04
 Z2s5bgTF39Wu4dov2DQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 bulkscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090128
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-67158-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,7ccuyiaeg2nm:mid,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:busanna.reddy@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 60B35731859

On Thu, Jul 09, 2026 at 06:05:52PM +0530, Vikash Garodia wrote:
> Iris platforms use separate context-bank devices for the pixel and
> non-pixel domains. Add platform hooks to create and destroy those
> subdevices, and wire them up for the affected platforms.
> 
> Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/Makefile          |  1 +
>  .../platform/qcom/iris/iris_platform_sm8550.c      | 71 ++++++++++++++++++++++
>  .../platform/qcom/iris/iris_platform_sm8550.h      | 24 ++------
>  .../media/platform/qcom/iris/iris_platform_vpu3x.c |  4 ++
>  4 files changed, 80 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
> index 48e415cbc4390bc596f6239fefa2a2ad2cd3a2bb..fd6bfe7e786be3f8a4885296fb11ba430ded6fd1 100644
> --- a/drivers/media/platform/qcom/iris/Makefile
> +++ b/drivers/media/platform/qcom/iris/Makefile
> @@ -12,6 +12,7 @@ qcom-iris-objs += iris_buffer.o \
>               iris_hfi_gen2_packet.o \
>               iris_hfi_gen2_response.o \
>               iris_hfi_queue.o \
> +             iris_platform_sm8550.o \

No, it's not a separate platform.

>               iris_platform_vpu2.o \
>               iris_platform_vpu3x.o \
>               iris_power.o \
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8550.c b/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..bea904a9249bafe1dfa11ff39155d1930402bf7c
> --- /dev/null
> +++ b/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
> @@ -0,0 +1,71 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#include "iris_core.h"
> +#include "iris_platform_common.h"
> +#include "iris_platform_sm8550.h"
> +
> +const char * const sm8550_clk_reset_table[] = { "bus" };
> +
> +const struct platform_clk_data sm8550_clk_table[] = {
> +	{IRIS_AXI_CLK,  "iface"        },
> +	{IRIS_CTRL_CLK, "core"         },
> +	{IRIS_HW_CLK,   "vcodec0_core" },
> +};
> +
> +struct platform_inst_caps platform_inst_cap_sm8550 = {
> +	.min_frame_width = 96,
> +	.max_frame_width = 8192,
> +	.min_frame_height = 96,
> +	.max_frame_height = 8192,
> +	.max_mbpf = (8192 * 4352) / 256,
> +	.mb_cycles_vpp = 200,
> +	.mb_cycles_fw = 489583,
> +	.mb_cycles_fw_vpp = 66234,
> +	.max_frame_rate = MAXIMUM_FPS,
> +	.max_operating_rate = MAXIMUM_FPS,
> +};
> +
> +static int sm8550_init_cb_devs(struct iris_core *core)
> +{
> +	struct device *dev;
> +
> +	dev = iris_create_cb_dev(core, "non-pixel");
> +	if (IS_ERR(dev))
> +		return PTR_ERR(dev);
> +
> +	core->np_dev = dev;
> +
> +	dev = iris_create_cb_dev(core, "pixel");
> +	if (IS_ERR(dev))
> +		goto unreg_np_dev;
> +
> +	core->p_dev = dev;
> +
> +	return 0;
> +
> +unreg_np_dev:
> +	if (core->np_dev)
> +		platform_device_unregister(to_platform_device(core->np_dev));
> +	core->np_dev = NULL;
> +
> +	return PTR_ERR(dev);
> +}
> +
> +static void sm8550_deinit_cb_devs(struct iris_core *core)
> +{
> +	if (core->p_dev)
> +		platform_device_unregister(to_platform_device(core->p_dev));
> +	if (core->np_dev)
> +		platform_device_unregister(to_platform_device(core->np_dev));
> +
> +	core->p_dev = NULL;
> +	core->np_dev = NULL;
> +}
> +
> +const struct iris_context_bank_ops sm8550_cb_ops = {

For a long time I have been asking to fix name prefixes. Now you are
adding one more. No. Please write it as a rule of thumb. All new symbols
in the iris driver should start with iris_.

Moreover, there is nothing sm8550-specific in these hooks. Enable them
for all VPU3.x platforms uniformly.

> +	.init = sm8550_init_cb_devs,
> +	.deinit = sm8550_deinit_cb_devs,
> +};

-- 
With best wishes
Dmitry

