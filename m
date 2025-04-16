Return-Path: <linux-media+bounces-30357-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD729A90680
	for <lists+linux-media@lfdr.de>; Wed, 16 Apr 2025 16:31:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C68081629FF
	for <lists+linux-media@lfdr.de>; Wed, 16 Apr 2025 14:31:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9BC31DDC1A;
	Wed, 16 Apr 2025 14:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SrtSEdKP"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3A6417A304
	for <linux-media@vger.kernel.org>; Wed, 16 Apr 2025 14:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744813901; cv=none; b=d0Tsxb4cKZPGW0vSm4mB00JJO84iulZ6sJWcF6+UNsxW7NFdylHFkUYISzndvk5OtWYBjaSlRM0pzJ/R2IjSV5+/qs8o+S9EAkYk+ca3NGTrVdoDmRHtyG64SAr1zNhiUtluc8FqIj0M+jGIsZF+UpN9Xs45UfTNUGNVZu0OONo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744813901; c=relaxed/simple;
	bh=TPACpjjfR71KwjatzwKAVTVQ2f+EX9p3TahnvUdcHu0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LDAbz8MTSj+ZlXqSzXvzFdg4KtuDF9rG9Nh/6W2EEnmLv0s3J30AtbDA+mRYanDVmFYVO6mnRS7robDdu/qddfpGOoCXp81xYFDD55I3CnY8Ajjkl4Z7bpPOlOLurmXwMPvddmyep4mPYyyXtSvIeyIBQQ3gSrXxRbXTaKod5c4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SrtSEdKP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53G9mF0S020536
	for <linux-media@vger.kernel.org>; Wed, 16 Apr 2025 14:31:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X/qDGy2ycm6kc3mzErBzyrqXxXsu6MYaqlJOZ4io7MM=; b=SrtSEdKP2VLjiKFs
	HooC6xJXeRjeu37RMRgAD3dUHU7h8H+bghyHux36hRf2ik81OU+75EIR4U9CD4gW
	z4iCZC1LbV/RBKZ2fwlfqAw93K2BsNiA38A1IFyLxe1T1p+Fh7Idy8K7tc3dAppd
	XWKuvvr/ThqLD0hIo2enu7sVdnvZ87fc9+L3pqQXZJ4XHqz1Tk/fI5wIZKYSl5EP
	wUwiJfhbZxJo9wbNvUTdiJ1TrQGyKGcvVbJ5DJw7hOxeNmQGfQgCsSMLxQEg8i+a
	wsX/aXvYQMJ9WhisdApp0KWBAAN8xB03/3uZHIOodk3R1wK8dCR2NM2rD25Ct5MF
	xP1QAA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yhbpum80-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 16 Apr 2025 14:31:38 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6e906c7cd2bso14730236d6.3
        for <linux-media@vger.kernel.org>; Wed, 16 Apr 2025 07:31:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744813897; x=1745418697;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X/qDGy2ycm6kc3mzErBzyrqXxXsu6MYaqlJOZ4io7MM=;
        b=ZqoMGZN1J3J9BLdwWQEukpnyrpjN+xlPisewLzFcyMW7xZZPd7pIT2aAUmtd4uWKoM
         /yKpyVYvz0q87Vm+KM/1Ptz8efSrD5C5CbUXmJBR/0T6aDRAvrCZJ8YaiQ0qwAZhQ1EB
         xVPS8kQmo8CX3Sg7LEQqHwpfwMWxjLHEg5W499HfEqOCvnr4X8ZId0Q4rTpAeRYUc+gx
         QqnID7I2wxm6hSdJNORxiSlhS0TWj+10allj0neW+2Cz/smHvdRxkw0SpidaAEzD/B+c
         ZXcmYFnRhlB1aX5Zpa0MsCbuGwXM0Q9O9eDDylwQ5dwzLmpOoNJSlt+OryVkxmEIej29
         CCXQ==
X-Forwarded-Encrypted: i=1; AJvYcCUSu3Hqrv0zGkhsTB1EFoDbBxp2AEIZk5xuK5i1NcpNs0/5UhGkgUEGg91ljbEZygr4hMQAzhJV9bIENA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyOx1qraOD4uB1ZJAgtz6cjto/4N3i0ckZiKnHzcppee8uG/cwJ
	xajQ6TLjGw1SGiLe7IkeAje7UETaOEliIcwNiqWBol4h6QGZYh3L03mhjKUCuaEQ4evFM5l0067
	4QrDI6B2mLrGtnfd4WHN1XyIUgiEYPVO1J0dnc8KhWv4Pz+Ot9t5Vz0w78FeJHQ==
X-Gm-Gg: ASbGncsGmm10lteRSO7PYCjUvUdwFZ3+LkrRnLuU6nxeBPct4uJhUMGxVR1W0Tdf8fN
	71futwok73GulroBYXn05SWpbjFNfiuZpxALVa2kDlEu8FxUKY798k9DfA80pNUqpj6J/AwHny+
	xbGN/FMNfh3ASKJsKXUBT+PkLUcWn+WcP9Q3+RYZjYVOgmIs6i7/xM1cr1I+6PImNoUAdytmg8N
	mY16ceRUa10/Ytu+azTi11ArkCz8GGMnAyYAxM6SRzOsDFWIWSZMl4vucmt5/mX8tyTmChIYO1D
	UWcbvc7sLjN/dA3Go4AMt/ujM3e6o2dsS11ataJik2nPFTyBvmk/SfZs3m6uSUk8HkI=
X-Received: by 2002:a05:6214:29e7:b0:6e6:60f6:56db with SMTP id 6a1803df08f44-6f2b3029573mr9724786d6.6.1744813897355;
        Wed, 16 Apr 2025 07:31:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFwB6e/uaPkdfMVVa70tVHqNla8oVHRPsq8DlrduYG0CTy8e0RvQw7EDQnPlYw1r218WwFBsg==
X-Received: by 2002:a05:6214:29e7:b0:6e6:60f6:56db with SMTP id 6a1803df08f44-6f2b3029573mr9724666d6.6.1744813896910;
        Wed, 16 Apr 2025 07:31:36 -0700 (PDT)
Received: from [192.168.65.178] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb3d349900sm140241766b.179.2025.04.16.07.31.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Apr 2025 07:31:36 -0700 (PDT)
Message-ID: <823b3448-6c45-4595-8067-8c329203d245@oss.qualcomm.com>
Date: Wed, 16 Apr 2025 16:31:34 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] media: qcom: camss: Add support for TFE (Spectra 340)
To: Loic Poulain <loic.poulain@oss.qualcomm.com>, bryan.odonoghue@linaro.org,
        rfoss@kernel.org, konradybcio@kernel.org, andersson@kernel.org,
        krzk+dt@kernel.org, robh@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20250416120908.206873-1-loic.poulain@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250416120908.206873-1-loic.poulain@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: oVkVlagJ8GNZUkiMS4DG6dfofudKjCsR
X-Proofpoint-GUID: oVkVlagJ8GNZUkiMS4DG6dfofudKjCsR
X-Authority-Analysis: v=2.4 cv=I+plRMgg c=1 sm=1 tr=0 ts=67ffbf4a cx=c_pps a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=b2D0RaZ-bvYcWOOTphEA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-16_04,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 phishscore=0 adultscore=0 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 bulkscore=0 mlxlogscore=999 clxscore=1015 impostorscore=0 malwarescore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504160119

On 4/16/25 2:09 PM, Loic Poulain wrote:
> Add support for TFE (Thin Front End) found in QCM2290.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/camss/Makefile    |   1 +
>  .../media/platform/qcom/camss/camss-vfe-340.c | 281 ++++++++++++++++++
>  drivers/media/platform/qcom/camss/camss-vfe.h |   1 +
>  3 files changed, 283 insertions(+)
>  create mode 100644 drivers/media/platform/qcom/camss/camss-vfe-340.c
> 
> diff --git a/drivers/media/platform/qcom/camss/Makefile b/drivers/media/platform/qcom/camss/Makefile
> index d26a9c24a430..719898f5d32b 100644
> --- a/drivers/media/platform/qcom/camss/Makefile
> +++ b/drivers/media/platform/qcom/camss/Makefile
> @@ -17,6 +17,7 @@ qcom-camss-objs += \
>  		camss-vfe-4-7.o \
>  		camss-vfe-4-8.o \
>  		camss-vfe-17x.o \
> +		camss-vfe-340.o \
>  		camss-vfe-480.o \
>  		camss-vfe-680.o \
>  		camss-vfe-780.o \
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe-340.c b/drivers/media/platform/qcom/camss/camss-vfe-340.c
> new file mode 100644
> index 000000000000..fc454d66e1d2
> --- /dev/null
> +++ b/drivers/media/platform/qcom/camss/camss-vfe-340.c
> @@ -0,0 +1,281 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Qualcomm MSM Camera Subsystem - VFE (Video Front End) Module 340 (TFE)
> + *
> + * Copyright (c) 2025 Qualcomm Technologies, Inc.
> + */
> +
> +#include <linux/delay.h>
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/iopoll.h>
> +
> +#include "camss.h"
> +#include "camss-vfe.h"
> +
> +#define TFE_GLOBAL_RESET_CMD				(0x014)
> +#define		TFE_GLOBAL_RESET_CMD_CORE	BIT(0)
> +
> +#define TFE_REG_UPDATE_CMD				(0x02C)

Please uniformly use lowercase hex

> +
> +#define TFE_IRQ_CMD					(0x030)
> +#define		TFE_IRQ_CMD_CLEAR		BIT(0)
> +#define TFE_IRQ_MASK_0					(0x034)
> +#define		TFE_IRQ_MASK_0_RST_DONE		BIT(0)
> +#define		TFE_IRQ_MASK_0_BUS_WR		BIT(1)
> +#define TFE_IRQ_MASK_1					(0x038)
> +#define TFE_IRQ_MASK_2					(0x03c)
> +#define TFE_IRQ_CLEAR_0					(0x040)
> +
> +#define TFE_IRQ_STATUS_0				(0x04c)
> +
> +#define BUS_REG(a)	(0xa00 + (a))
> +
> +#define TFE_BUS_IRQ_MASK_0				BUS_REG(0x18)
> +#define		TFE_BUS_IRQ_MASK_RUP_DONE_ALL	0x000f
> +#define		TFE_BUS_IRQ_MASK_RUP_DONE(src)	BIT(src)
> +#define		TFE_BUS_IRQ_MASK_BUF_DONE_ALL	0xff00

You can use GENMASK to define the fields and FIELD_PREP(field, x) to
fill it out

[...]

> +static inline unsigned int __regupdate_iface(enum vfe_line_id line_id)
> +{
> +	switch (line_id) {
> +	case VFE_LINE_RDI0:
> +		return 1;
> +	case VFE_LINE_RDI1:
> +		return 2;
> +	case VFE_LINE_RDI2:
> +		return 3;
> +	case VFE_LINE_PIX:
> +	default:
> +		return 0;

Warning?

> +	}
> +}
> +
> +static inline unsigned int __regupdate_line(unsigned int iface)
> +{
> +	if (!iface)
> +		return VFE_LINE_PIX;
> +	if (iface < 4)
> +		return VFE_LINE_RDI0 + (iface - 1);
> +
> +	return VFE_LINE_NONE;
> +}
> +
> +static inline unsigned int __subgroup_line(unsigned int subgroup)
> +{
> +	switch (subgroup) {
> +	case 5:
> +		return VFE_LINE_RDI0;
> +	case 6:
> +		return VFE_LINE_RDI1;
> +	case 7:
> +		return VFE_LINE_RDI2;
> +	default:
> +		return VFE_LINE_PIX;
> +	}
> +
> +	return VFE_LINE_NONE;
> +}

All these translations looks a little fragile.. Not sure if it's in the
scope of this series, but adding an op to do this (or a static map)
sounds reasonable

[...]

> +static void vfe_wm_start(struct vfe_device *vfe, u8 rdi, struct vfe_line *line)
> +{
> +	struct v4l2_pix_format_mplane *pix =
> +		&line->video_out.active_fmt.fmt.pix_mp;

weird linebreak

Konrad

