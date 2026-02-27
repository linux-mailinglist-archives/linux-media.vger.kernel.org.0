Return-Path: <linux-media+bounces-53769-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4A2tLYT8oWl4yAQAu9opvQ
	(envelope-from <linux-media+bounces-53769-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 21:20:20 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E92F1BD878
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 21:20:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 63A1F3079AB4
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 20:16:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A2A5477E47;
	Fri, 27 Feb 2026 20:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l46VX7Ci";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RbUiAT8w"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D30332D73BC
	for <linux-media@vger.kernel.org>; Fri, 27 Feb 2026 20:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772223300; cv=none; b=NdGpbOTHXq4cmDmRVlpLa+tJn5xQtX9CNvwtEQQVGKrNKKItHJiMFetwL4etYU3KhlM85/WjuR+dBmgwzOHCXB5PdEc8i99V6wp4u9S9BJF38TEDAn0NA6IziqxcUuzPXx3A5BG9AS5CriiMiysYmEndiw2vuW6HruWALfVMOKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772223300; c=relaxed/simple;
	bh=iucNoNEStscn+tF3OuWq/KxWs14WthoY9Q8cXGzCxVw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=APx14QC12N9COxEUTimiQFHXWupzIyJxVhABNCIMNEW2EsrRzZT7KaFfyi0qvH0FTMvb9OPLVG14cAVoaf4FfocHS+u8FBeMovyCC5IZ7HREpaFLfuY7fyurv9PRbuQ5cYU0Fi+UHRqnh8C/mFkOgN00ZbhsxsGrp/YEXF83T70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l46VX7Ci; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RbUiAT8w; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61RH0FYS1912402
	for <linux-media@vger.kernel.org>; Fri, 27 Feb 2026 20:14:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=d3qWlTlHeHHlcRziGZQh+7Eh
	dQAZWCc1/zRjvAUju5Y=; b=l46VX7CiT4zVHDcCd/GnnhhLMZLwnJdSy/NSQCL8
	K4woeRxVjr48lgLFgPd1jDHU9UiH88OgxAtrY6SGuqHktIdLSKdfPbTCo0vYn7lv
	HS0dGrwrI4rbeKM1XFTgClUN32V8EaYNG+HD+NSOossL1Pvttv/7n43eORVi01GQ
	LNtUp2Wl8GEaX0fT1OmYmoZvnYHunR1MQe7gZvApkf+WqP8j9ja/5syrSG8yOAXk
	47f7DWYt5ThDHkaufGgEbebUwtuzC2ZhExf4VUAZbodWhIys6MXdMbE0J5kQL5+y
	CKnYNPRcDFvfMQdsK8isU3XHcQm0zjjwuFAKEUQ9h4SFFw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjuur4eu6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 27 Feb 2026 20:14:57 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c70b6a5821so1718949485a.0
        for <linux-media@vger.kernel.org>; Fri, 27 Feb 2026 12:14:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772223295; x=1772828095; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=d3qWlTlHeHHlcRziGZQh+7EhdQAZWCc1/zRjvAUju5Y=;
        b=RbUiAT8wKBCa3griz4wX0QXuglSpBfM9R0Sw6IABxbwEl1u21jzI7Ob1DBsKcgwPwI
         y/uV4XmiZpUqM2JnuzSXr7ZtmMGfQP03jasJq1TduLGLqJ+J5xWiXEAzDAxGWpcL9FsB
         efh57YnbbIf+m3snHX8nxXdD4fCowhfzDMHmFjK/NC5T4RsYsK/mr70dh5+naBCW8a2U
         1oPYaTod0NGvphxZQ5iYe5+14nG54Oh60RB/kMMj77szrcMSjN2iF/3IsOLyilqP5Ywu
         84r+seTgCw1Jlf5D3E9APM3mt9UtjWTJlzW8mBUXXjIxYZQ8xbnuF4aH7wej0mw+S9Fo
         oXFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772223295; x=1772828095;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d3qWlTlHeHHlcRziGZQh+7EhdQAZWCc1/zRjvAUju5Y=;
        b=BL9AGmECtQJLo6W+svkPG52R3n/iw4+0SfAZJD0elttdcs2B/TsFClRmdvQm6xCiaH
         0lgcaHmqs2ZRPOABoQXfzwBD0FV0OmkQqyUDI7HcmtMq6/wJ/AnMN9PdcdzLm9fLGEcI
         pe8PwZgEj2Nj7N3mSXgHXHfyyaGrE1vw8+Fh2ntrk3ACuW1RvqCoelYnrEPAIkD33HtJ
         2JzoplZ56fYUgmx1KqQ2qj1aNsM1U8iEzb/Qce5A18hgOtpWYsXQCnIk1M47EkySABJR
         WpZ8VExiDMAveptp7awpVd9Gs2rHMjpiK0mslhttKYolm1SmegaKvIHLnVV83xkWaE+Y
         TjvQ==
X-Forwarded-Encrypted: i=1; AJvYcCXSdfZmQvYM81Gw3jpXhPwkJMTumKhA5NrA8+Aeku+mWN7Q5Kfixzz94SUSN+NAk6wAb2pxst5f86vC3w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwmfN0P+hzPD9xbW5722OBAY3T3u69/d3ZXnIy1thosA2HhHAYR
	KluGvsZMT6GBKhCc//rs8E6vGRuz6JBYZo3BHTFYM2ZwwASOdESQl0hDe8RFk04jVFKw4iWdSTx
	yASKMaYwn8pcfeg7nSOd/Wabm3YBw5XRJirNvQG4Ax+YVxePVfHPntEOECh7Rpt+hnQ==
X-Gm-Gg: ATEYQzwrzLqhEYIJsUrAQmcoSAxf2PrVlg0Kz7EneDb/5H0daWURq5sBRkIV2OB469n
	TyNETc4pUKFX/gLoKwrHf3dfWJFeEOSBuhE6lHxbPNMFOajPcIoqY47vRSpytXvPz+omwlb/nMZ
	yzrwovYO35j0xlgXE+p2rqOv3CgyzC30Ize8tExJZIbv2y7VfJvMRKPDaIvG0TJqM/phQX/9NEV
	PvjiIWVpvPj8vay+WpCMt7xbFGW8AwgQglxGuRtfAcNv54ONwnpDYlwtli0IwZcc1uN7o0FKdzd
	StUIyQvFitcL5AAxpoub+fjbTIyC6faBVS9ohFqY7rZ9debjDapHC0lMaqdMVIjAZPeJpYvj+XF
	QHkIcfGRY/fbQ9Ph/YWcyrHEkuicF31+tO0+qlwP+vpv8A0C+oDseBuRyqc5JEr7BF+KA+v21dr
	7NLXIRpjqQUNYDtBoSY9rXN5su3rZi7RFbT0s=
X-Received: by 2002:a05:620a:28d6:b0:8c6:a341:ac1a with SMTP id af79cd13be357-8cbc8de81famr504700585a.52.1772223295032;
        Fri, 27 Feb 2026 12:14:55 -0800 (PST)
X-Received: by 2002:a05:620a:28d6:b0:8c6:a341:ac1a with SMTP id af79cd13be357-8cbc8de81famr504697385a.52.1772223294554;
        Fri, 27 Feb 2026 12:14:54 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a116022215sm102994e87.52.2026.02.27.12.14.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 12:14:53 -0800 (PST)
Date: Fri, 27 Feb 2026 22:14:52 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH v2 3/7] media: iris: add iris vpu bus support and
 register it with iommu_buses
Message-ID: <rgglzg6kcq4xz5wtambs3mwch7foxruh7ecbabtu6gm7txr3wu@b67uwl6mk5tx>
References: <20260227-kaanapali-iris-v2-0-850043ac3933@oss.qualcomm.com>
 <20260227-kaanapali-iris-v2-3-850043ac3933@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260227-kaanapali-iris-v2-3-850043ac3933@oss.qualcomm.com>
X-Proofpoint-GUID: xg98Kt7kpnKpDVhzP7v8IihR6JyUodxG
X-Authority-Analysis: v=2.4 cv=PN8COPqC c=1 sm=1 tr=0 ts=69a1fb41 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=A7-SorSeRF4lZ4C7dWIA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDE3NyBTYWx0ZWRfX3RxBiI4jeept
 CRHqQhu6MAiUdMW7bcwcmGuWIWIGCLfLc6g53qUXYD3nhUkKBs1zvV0sEsFRb98tJdEk3Kgnz96
 macL6TVWCAy/3+h3GF9TQcUle/BoU27zAcQP/9nvJwUEMEXsqzPyF1Gej/cCQ5/yIO8rX+tUytK
 2h2jQ/8by5V3OSwlAmhLoKJm08u2OCAFcfIcfW2NaeOQZeM4+yra1WxKS6IFJKLAffUNyXLNxzz
 /i+w0B3wCM9EwuJ2lZSv3DG9BzA3MB+yWQZ4dkBBju2pg0ep8cD9VUYL62Ncx4XEXQA1PCguhCd
 DVIg7xgUtZcnOP5LohTbaZfSHNkAOYhAm+sKJAUEU7yl89dEHR/YaBliNyI/7/zyCmW6aQgPCka
 3IRM94raKobq220vRHwVjzsRk1if4zaFBAyb4A+AEqILY/hfWOegDbtccVwN5FiIaQ1zZUYrnPH
 V+aMIAgXCfze45UUg6Q==
X-Proofpoint-ORIG-GUID: xg98Kt7kpnKpDVhzP7v8IihR6JyUodxG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_04,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 spamscore=0 phishscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602270177
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-53769-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8E92F1BD878
X-Rspamd-Action: no action

On Fri, Feb 27, 2026 at 07:41:19PM +0530, Vikash Garodia wrote:
> Add iris vpu bus support and hooks the new bus into the iommu_buses
> list. Iris devices need their own bus so that each iris device can run
> its own dma_configure() logic.

What are "Iris devices"? Are there multiple en/decoders in an SoC?

> 
> Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> ---
>  drivers/iommu/iommu.c                           |  4 ++++
>  drivers/media/platform/qcom/iris/Makefile       |  4 ++++
>  drivers/media/platform/qcom/iris/iris_vpu_bus.c | 32 +++++++++++++++++++++++++
>  include/linux/iris_vpu_bus.h                    | 13 ++++++++++
>  4 files changed, 53 insertions(+)
> 
> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
> index 35db5178095404fec87cd0f18e44ea97cf354e78..fd5fb7c10da22ab548d359ca1f44504acc3d646c 100644
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
> @@ -178,6 +179,9 @@ static const struct bus_type * const iommu_buses[] = {
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
> index 2abbd3aeb4af07e52bf372a4b2f352463529c92c..6f4052b98491aeddc299669334d4c93e9a3420e4 100644
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
> index 0000000000000000000000000000000000000000..34ce78d9b0ff1feda15ba4f060a56d02749a0858
> --- /dev/null
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_bus.c
> @@ -0,0 +1,32 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2026 Qualcomm Innovation Center, Inc. All rights reserved.

Drop the year.

> + */
> +
> +#include <linux/device.h>
> +#include <linux/of_device.h>
> +
> +#include "iris_platform_common.h"
> +
> +static int iris_vpu_bus_dma_configure(struct device *dev)
> +{
> +	struct iris_context_bank *cb = dev_get_drvdata(dev);
> +
> +	if (!cb)
> +		return -ENODEV;
> +
> +	return of_dma_configure_id(dev, dev->parent->of_node, true, &cb->f_id);
> +}
> +
> +const struct bus_type iris_vpu_bus_type = {
> +	.name = "iris-bus",
> +	.dma_configure = iris_vpu_bus_dma_configure,
> +};
> +EXPORT_SYMBOL_GPL(iris_vpu_bus_type);
> +
> +static int __init iris_vpu_bus_init(void)
> +{
> +	return bus_register(&iris_vpu_bus_type);

Together with the Host1x it's the third bus having exactly the same
functionality that I've seen in the last several days (I counted the
FastRPC one). Could you please generalize Tegra code and come up with
the single bug that will work for all simple users?

> +}
> +
> +postcore_initcall(iris_vpu_bus_init);
> diff --git a/include/linux/iris_vpu_bus.h b/include/linux/iris_vpu_bus.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..8aba472fcadd269e196b7243da5660deaff31abb
> --- /dev/null
> +++ b/include/linux/iris_vpu_bus.h
> @@ -0,0 +1,13 @@
> +/* SPDX-License-Identifier: GPL-2.0-only
> + *
> + * Copyright (c) 2026 Qualcomm Innovation Center, Inc. All rights reserved.
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

