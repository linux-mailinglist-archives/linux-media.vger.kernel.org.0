Return-Path: <linux-media+bounces-43122-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA636B9D39F
	for <lists+linux-media@lfdr.de>; Thu, 25 Sep 2025 04:44:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 308327A947D
	for <lists+linux-media@lfdr.de>; Thu, 25 Sep 2025 02:42:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45AF12E610F;
	Thu, 25 Sep 2025 02:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f6uoAMmI"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D237D15624D
	for <linux-media@vger.kernel.org>; Thu, 25 Sep 2025 02:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758768261; cv=none; b=pYe1b1FbiySGQ3ulgYNmYfFfpQj3fGx8vXzMbSI+WqKu+7cgD7K1A4H6BZAAue6R7vHlgg5NnzT7l46AS+OSGaOx79r+vxbYxbCesg2a/XV0Bl6iZOEdyIoqa+WevNTvINMZ8YMeXYh9hl2FAEjEZdr8mcuApVwlPeBNrCY+Yi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758768261; c=relaxed/simple;
	bh=xxwiIJd2UGyl9n3ZOnuRttXvsXNBvZwie9sS9aGy5+Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d7Lx4bq60ZjXt2UimVzQUUaHNXB8dMPZi6pF4Ygkk0tcq2nmAQjJRn0S/Vs0Usdj1KGXzbDAmNx5URUjjSjxDTMlXgjF4FYZO9U6zo3AXzJ+mYVBYouVcXQEf538mkJ66IRdz+Ee5aYRT5NuypvwFqEKEfX9cvX1p6P7OPZwRKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f6uoAMmI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P0KfYO025136
	for <linux-media@vger.kernel.org>; Thu, 25 Sep 2025 02:44:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=gG4ZVwJdIZtFtrQkoIy9gcIZ
	GIZlUOefZIQJ8wWhtWQ=; b=f6uoAMmIpOqPlF7s0G0dbbqop25b5856s1u2dVZs
	1y4FGDIOyEFQMv6b31FulNZBBfUmW2KErhO8Gro8qgMnqqmSsgdo9UCkVCybZhzW
	IS4kieW4Nhs5OuLPzi2xL5gBhD6xKFwUAKeNSMntSMWrIOuHegptWeZ0rUrY78c3
	XXZq8YPHnd4T1KvaGRI55iJ0YJImR/b534VQq2E9W/dxvriuu/B04fWoUdQPL6+/
	DskaXTu3wwrj8uTpwswlNnA4wtlQg+il9/QbVyRUi1RDtOtOVDJ5ZAzjS/OsEil6
	9hz37RlrGY+sbZ3YSjflqpUkdDNRJjuZpPBwzl6BAoDeBQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499kv16gmk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 25 Sep 2025 02:44:18 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4d1b3c6833bso12409571cf.0
        for <linux-media@vger.kernel.org>; Wed, 24 Sep 2025 19:44:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758768258; x=1759373058;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gG4ZVwJdIZtFtrQkoIy9gcIZGIZlUOefZIQJ8wWhtWQ=;
        b=bDubPNsPfCFO7Os3itGpcOfA74spAzNqe2KDM3LcEtGMmzgdueHXeBPLFBrBMSsbTO
         MbHXj+T13C1zrkAWKlBlnH140jIPH6wHMlGRlCNThmvDCx3djuakR44b4PIpP2U8qetx
         wZCzKOZ6GQ8zfz8tpfp6Ak2tL1x/9T8Hg4yPPYSyQyzdGd6MAbNQzYLiPskypD1DNuRr
         tSdtLBobSsa3aaZrt6WB6LjLYCfG+AxwrTIBnRzFDxhpAUHD0+Us4akzGeg/WWh4Os0f
         lPyHcqCgOuXe/CjfCcl82LKbYU4lyDY2Bm25k0vISp3ITWMRbK8+bP7EaDm2udpwU3BF
         hkPw==
X-Forwarded-Encrypted: i=1; AJvYcCVrDTOpQmMpfGsq2Gkx3qEN+jpkr0gq8vTQ24KjqEKposn5Z2hvcVNhagqsb/4qfBMnklut3B2JbrkPuA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzKyRrH7DpbTRwEotSffmb/o8T7ZI3HkVpN0j6Tjq80KIsQyePs
	bVk0o9s+Zhl50K4FMbgGrqvzLtPCZotj4McyxC2/RhPjwOnsN4pW2p+leid9r7w4s8Am5dUhX8m
	eI0KFicfbGvcEjwwGvDqq19bEDd6Xrph5BK1oEAw53L1UNP+fOtyIOMJ++LTUBRp5Xw==
X-Gm-Gg: ASbGncvyhxZOnielENzOpFinQPxgtbuXulIdA1VMY9k5QJHW62LNTPFbdeFVROrk/vB
	Z1RCOUDWDzX5fWC8xGFqidsI+H8n4nc0YN8xHYhaQmPMve6uLw/yxcGWkcuGCEKeyRN11F7U+IM
	1onMlBadnpI7Fvs7Mx/y2BYZt0MvpVVXEArM3eBdIwdYKDUx2Q+SGaE/hsc9VPzvJuKwePKp+GM
	NSUhMAn695aR93pxaues9Iu6cOLdmnp/nPkq9etuB2Aq06eVTkkKJeVbpIkDlmukCcPCPhdRUER
	fncWT2EFxmfuoAT6/Ca15nu/DyK/62v5hh33V/BsCbaCxbPHrsxZQU4ulwXDddVXLClDRVCfjUj
	hsGQeFvygp/53GRz3cgs2IxjrC7b1ZvH6EBQ9SRvaSpD5RCiY089S
X-Received: by 2002:a05:622a:507:b0:4b3:78ac:150d with SMTP id d75a77b69052e-4da4b42ca52mr24481011cf.40.1758768257921;
        Wed, 24 Sep 2025 19:44:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGs5aCsuoLqd0Av/XLCJxuIqTcBX9OxymgFOUfJmZ0G7j884g4RS2x98PoxZY2l5l+RhObr8A==
X-Received: by 2002:a05:622a:507:b0:4b3:78ac:150d with SMTP id d75a77b69052e-4da4b42ca52mr24480741cf.40.1758768257402;
        Wed, 24 Sep 2025 19:44:17 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-583173d0fbfsm255849e87.144.2025.09.24.19.44.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 19:44:16 -0700 (PDT)
Date: Thu, 25 Sep 2025 05:44:13 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Vishnu Reddy <quic_bvisredd@quicinc.com>
Subject: Re: [PATCH 8/8] media: iris: Add platform data for kaanapali
Message-ID: <23b56m4xjblk27rgpuu5pn5zecv25laoo2yijk7r7ns4kkvfh5@4s2ijgt4qq22>
References: <20250925-knp_video-v1-0-e323c0b3c0cd@oss.qualcomm.com>
 <20250925-knp_video-v1-8-e323c0b3c0cd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250925-knp_video-v1-8-e323c0b3c0cd@oss.qualcomm.com>
X-Proofpoint-GUID: WnMEaizOTdCA-5W4xNwvsK5iv3zsIyWA
X-Authority-Analysis: v=2.4 cv=RO2zH5i+ c=1 sm=1 tr=0 ts=68d4ac82 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=_kvchVDP8_-l7kQr3B0A:9
 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAyNSBTYWx0ZWRfX7o5SOpisDvCp
 zs2ytpvhF60PAw7FJPWOf46l3VhbNKsos/DwsI0eV+avv3DXATAkaagU2d3ctV68IpowitcAFU9
 1Je9VYDkVKUkmZ+N3Fys/ssvU1rKRU7PF2vEzsOU275v9hLa1ri/hOZ1/qZ3dv7EA27vhS3i4Xe
 9T9XsDZ7r3ZfeeTWqL7O+1dHx1ILvohCoSqs55wCSjKW2hAdM1rHMCVhiGdlEF/vuzMhPUvwm5J
 dw3bYeMt8VUQALddcaeLOkTdEI549qS72rpdlR6Zym0v5arFEbumHMAjkD1rCvn0wcGzQAylnYV
 dCdM+SiPAv+JzcLefVRTcFNHENKNaetxw2G5o2xLPr3z8RhIfc4wjieOGU04MaTQcPM/279K53t
 /YS8Ni4f
X-Proofpoint-ORIG-GUID: WnMEaizOTdCA-5W4xNwvsK5iv3zsIyWA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 adultscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200025

On Thu, Sep 25, 2025 at 04:44:46AM +0530, Vikash Garodia wrote:
> Add support for the kaanapali platform by re-using the SM8550
> definitions and using the vpu4 ops.
> Move the configurations that differs in a per-SoC platform
> header, that will contain SoC specific data.
> 
> Co-developed-by: Vishnu Reddy <quic_bvisredd@quicinc.com>
> Signed-off-by: Vishnu Reddy <quic_bvisredd@quicinc.com>
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> ---
>  .../platform/qcom/iris/iris_platform_common.h      |  1 +
>  .../media/platform/qcom/iris/iris_platform_gen2.c  | 86 ++++++++++++++++++++++
>  .../platform/qcom/iris/iris_platform_kaanapali.h   | 63 ++++++++++++++++
>  drivers/media/platform/qcom/iris/iris_probe.c      |  4 +
>  4 files changed, 154 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index d6d4a9fdfc189797f903dfeb56d931741b405ee2..465943db0c6671e9b564b40e31ce6ba2d645a84c 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -46,6 +46,7 @@ extern struct iris_platform_data sm8250_data;
>  extern struct iris_platform_data sm8550_data;
>  extern struct iris_platform_data sm8650_data;
>  extern struct iris_platform_data sm8750_data;
> +extern struct iris_platform_data kaanapali_data;

Please keep it sorted

>  
>  enum platform_clk_type {
>  	IRIS_AXI_CLK, /* AXI0 in case of platforms with multiple AXI clocks */
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> index 00c6b9021b98aac80612b1bb9734c8dac8146bd9..142b7d84ee00a9b65420158ac1f168515b56f4a3 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> @@ -15,6 +15,7 @@
>  #include "iris_platform_qcs8300.h"
>  #include "iris_platform_sm8650.h"
>  #include "iris_platform_sm8750.h"
> +#include "iris_platform_kaanapali.h"

And this

>  
>  #define VIDEO_ARCH_LX 1
>  #define BITRATE_MAX				245000000
> @@ -1095,3 +1096,88 @@ struct iris_platform_data qcs8300_data = {
>  	.enc_op_int_buf_tbl = sm8550_enc_op_int_buf_tbl,
>  	.enc_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_op_int_buf_tbl),
>  };
> +
> +struct iris_platform_data kaanapali_data = {

Hopefully can also be sorted.

> +	.get_instance = iris_hfi_gen2_get_instance,
> diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
> index ad82a62f8b923d818ffe77c131d7eb6da8c34002..9a0db65dbdb2eedf3974bcb8a2327e664b556ccd 100644
> --- a/drivers/media/platform/qcom/iris/iris_probe.c
> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
> @@ -370,6 +370,10 @@ static const struct of_device_id iris_dt_match[] = {
>  		.compatible = "qcom,sm8750-iris",
>  		.data = &sm8750_data,
>  	},
> +	{
> +		.compatible = "qcom,kaanapali-iris",
> +		.data = &kaanapali_data,
> +	},

And this one.

>  	{ },
>  };
>  MODULE_DEVICE_TABLE(of, iris_dt_match);
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

