Return-Path: <linux-media+bounces-36964-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D7215AFAF49
	for <lists+linux-media@lfdr.de>; Mon,  7 Jul 2025 11:13:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D88A417F30E
	for <lists+linux-media@lfdr.de>; Mon,  7 Jul 2025 09:13:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27A6928CF68;
	Mon,  7 Jul 2025 09:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kuQ/ec3y"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED6B528C5D3
	for <linux-media@vger.kernel.org>; Mon,  7 Jul 2025 09:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751879598; cv=none; b=OGIucQlcAsKL24PrdHF5CkU5YwLIqu8TZGTUqjWytSaLsOM5sbYOvv8m+DCbNbCEQw1KFy4P+7QgdHNZh/XXSyGpBLIaPq5GAT4alGnv+uptnIOUQtFZuHwDdtNCfqUEKYt7Gd0ZDfaVsOrxDiLG4UlQiwFzYrGQJPZA7HzVzls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751879598; c=relaxed/simple;
	bh=9e/j/TisrlOj1sag55zujCuH8hWns0AKFl54gX2S1nI=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BonbCX0/EiB0WG/0lLJUiQQYIyg52tmiCxOLhhWaAMH9fV0beUoZUvRStWRudj+dKtIkYLh5mvpO39UP5A1HZCLgIB2+gKkEgwyWLcZb18cV+3Ov0HIoqTLtrJK/8N4RJ3hDtmlqhiKJgALgzyh0YsZ2Hpqo9B021UJN0VPJKuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kuQ/ec3y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56792m3g007353
	for <linux-media@vger.kernel.org>; Mon, 7 Jul 2025 09:13:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0ToO/s6QUGdOhjPrMVyWmlZz
	BvPNufyts6PWBcHykjY=; b=kuQ/ec3yxvLyAJ/kMeVyzb0NQzGRo/iOFnVFIG1k
	ArgaQIIsVWVWKyfiNA0gcbLRHvhOBZ+mT8y1S+nK6x97WoTtt9LMGrNJO0fX3sRW
	x4WS6u4Pj+41raEhgKrUT9Cpup9cwMlmINuXEQtbc9c+SUghUzDoYD2Q0UFy4ZcJ
	+cie/3ays9tMcF1T37nK/wTqYh1Sc+fsrQ+CBEUKSBQpQKdymmIK1nYVTSh1WXBv
	vdNtf3RKlGv47vG2ydu+R/kFGH/+K5DAwBvh/W+Uw3XptbujXxtjLRs5ECiHvOAN
	lqM7v7yeKK35hHZlmAm7FALiqGjsx+mblGPrRwNqmp7emg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pun2bted-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 07 Jul 2025 09:13:15 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d44ff55c98so598642785a.0
        for <linux-media@vger.kernel.org>; Mon, 07 Jul 2025 02:13:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751879594; x=1752484394;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0ToO/s6QUGdOhjPrMVyWmlZzBvPNufyts6PWBcHykjY=;
        b=rGY4qEcoaDogdMF3wQof30bxZ+EWHI54gYp159+4gDtIidPpAEif0s4TgEezfmGISf
         JxHSI3NUh0W6/4CxHmAYaRvMNOM1zbP6LSrQFBnk1GCEJW85z1HPNT9At2/Q9rYf8Te5
         hMP1+ws5oLR9qY3WvcKDEtbq4RLqJP/cnirmx2XKWEKdkfjarqDI/AtxUmCBWMy5A7B1
         8M14s1If6CdkCXZQTNriJQ1ERcJDfmM5eP7WHlm4hb8ogjdURBVpsxvPMWvkkZzpsUI3
         sJOv4N7gKkMlqMtQ5orCGVQ+Zrxy0LHUE7xeHE+kvRSd51KpuWpN5o/eNJTAhgoDri8D
         Sh3w==
X-Forwarded-Encrypted: i=1; AJvYcCXaNOj0WqlJ7jxloYZAq0NlWdq0Q+qvpDji8PczLWa2hhhQfB/sP5WPGV9pBf+lW9VqMsFKPjXZdhJlxA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxs8rb/x6Y9kCof68Qa8VL2tGDhZB0wgCGQyKqhDHwIa6OG+a25
	wE2ERsdLUqyb/1iqgDljsU8kmG/O5mMTz7d85jGd6VygpghnDBNNvLAx6bDBYRGEHDos5S5CGqV
	IdCdjDzWd/5sYyM570rRak+7NOf8giADXri1LKqO3e6yfDRFjSeE5WdpL8nLrMLhEZw==
X-Gm-Gg: ASbGncuLVfszJ94iyB4ETfzvvWyRDqkU5b8UrVupYbGq3QNlNDvwRungIXjb58Wa5bf
	vTknLUntB3gngcOrY9W1+qyPkZbSct+WyOeX/WafYeO7e/Xp0257bbDb0C74EqI0X8MWnm1357w
	zYNW2+ReqAl4ABEHd8nyKLmP2ufaQ7rZ4V0OK7y5PH7tOcM1pmC4EmaA1MFiaAbcH9TvcdU7Zv0
	7p2e9fGiiVUldoqja9z3muorLsADIgIkFKcb7FL2ZuXoSYJeoJkRbj00vmYFKPEfntlF6rEaog8
	4d203rgaDpFBlyjt53HgjuK+qKPG02+PRJy+8WLt3vESe/lk+DGZb64=
X-Received: by 2002:a05:620a:468c:b0:7cd:4b5b:a1fc with SMTP id af79cd13be357-7d5df0ccfe3mr1619156585a.7.1751879594429;
        Mon, 07 Jul 2025 02:13:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEAFe4T5tQYs9PjuLRj+UZEMUkkXmUbbWQsMax8XLLrVdvN7NAhevIHROXyKYcWrOl7ui+sRQ==
X-Received: by 2002:a05:620a:468c:b0:7cd:4b5b:a1fc with SMTP id af79cd13be357-7d5df0ccfe3mr1619152285a.7.1751879593840;
        Mon, 07 Jul 2025 02:13:13 -0700 (PDT)
Received: from trex (97.red-79-144-186.dynamicip.rima-tde.net. [79.144.186.97])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b4708d0af7sm9802520f8f.35.2025.07.07.02.13.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 02:13:13 -0700 (PDT)
From: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
X-Google-Original-From: Jorge Ramirez <JorgeRamirez-Ortiz>
Date: Mon, 7 Jul 2025 11:13:11 +0200
To: Dikshita Agarwal <quic_dikshita@quicinc.com>
Cc: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>, krzk+dt@kernel.org,
        bryan.odonoghue@linaro.org, quic_vgarodia@quicinc.com,
        mchehab@kernel.org, robh@kernel.org, conor+dt@kernel.org,
        konradybcio@kernel.org, andersson@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 3/5] media: venus: hfi_plat_v6_lite: Populate decode
 capabilities
Message-ID: <aGuPpzU0VCg45Plg@trex>
References: <20250626135931.700937-1-jorge.ramirez@oss.qualcomm.com>
 <20250626135931.700937-4-jorge.ramirez@oss.qualcomm.com>
 <bac6a881-90b6-4f33-d9a8-61aa8daea330@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bac6a881-90b6-4f33-d9a8-61aa8daea330@quicinc.com>
X-Proofpoint-GUID: m4NIroWbI8aoxOBfRxr_N_sYl-FszDEj
X-Authority-Analysis: v=2.4 cv=GdUXnRXL c=1 sm=1 tr=0 ts=686b8fab cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=oX6B8lV6/A+qF9mARCc04Q==:17
 a=kj9zAlcOel0A:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=BJ39GPuVWatAwBIpdsYA:9
 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: m4NIroWbI8aoxOBfRxr_N_sYl-FszDEj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA3MDA1MiBTYWx0ZWRfX5aGLruTaTD0g
 8vcodDuEIf14Z9rdZ4DHbCAXjV6PYW3z3MCv21WmQk91VF+y5UYAwrNAQzXEVCksHq7FStujyPz
 ceL2RJa0HZTuAxd+B7OeK32xQapqJjv/LSjHHTL+8GZFfVCudoewRLhBUzlfXGZn93dVv1gNrh5
 NkpCEN91yzPDdp0ZYKnwEc7CrMot4tPjuEHqCJCYtqLVk2EWMeDmg6IBXDyhT1uZSwE9WZQrnpV
 Wscc+0OlKLG9/I6RGRdGe1kGwl5lvzRosCDMo2nauTvLR1hidPVfZAnlVnJFoWVnLIL1CNr9qXw
 blHWRmGvoQC/XbOZPwyXhxsG1v8v6Yv+9gH7NIdaq24zTZy43FdG27QXfNsbwunPwijvXQisv33
 0SwXV/074CdYUgpDxM+eJXgTQr2+8S9SawR/1zzIrGY6n6x2f0IP5Vd+d/ffb7JDsdA1SWZR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-07_01,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015
 malwarescore=0 mlxscore=0 phishscore=0 impostorscore=0 suspectscore=0
 mlxlogscore=999 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507070052

On 27/06/25 19:02:13, Dikshita Agarwal wrote:
> 
> 
> On 6/26/2025 7:29 PM, Jorge Ramirez-Ortiz wrote:
> > Add hfi platform file with decoding capabilities for hfi v6_lite.
> > 
> > Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> > ---
> >  drivers/media/platform/qcom/venus/Makefile    |   2 +-
> >  .../media/platform/qcom/venus/hfi_platform.c  |   2 +
> >  .../media/platform/qcom/venus/hfi_platform.h  |   1 +
> >  .../qcom/venus/hfi_platform_v6_lite.c         | 148 ++++++++++++++++++
> >  4 files changed, 152 insertions(+), 1 deletion(-)
> >  create mode 100644 drivers/media/platform/qcom/venus/hfi_platform_v6_lite.c
> > 
> > diff --git a/drivers/media/platform/qcom/venus/Makefile b/drivers/media/platform/qcom/venus/Makefile
> > index 91ee6be10292..4a6a942db58b 100644
> > --- a/drivers/media/platform/qcom/venus/Makefile
> > +++ b/drivers/media/platform/qcom/venus/Makefile
> > @@ -5,7 +5,7 @@ venus-core-objs += core.o helpers.o firmware.o \
> >  		   hfi_venus.o hfi_msgs.o hfi_cmds.o hfi.o \
> >  		   hfi_parser.o pm_helpers.o dbgfs.o \
> >  		   hfi_platform.o hfi_platform_v4.o \
> > -		   hfi_platform_v6.o hfi_plat_bufs_v6.o \
> > +		   hfi_platform_v6.o hfi_plat_bufs_v6.o hfi_platform_v6_lite.o \
> s/hfi_platform_v6_lite/hfi_platform_v4_lite

will remove, will use platform_v4 instead

> >  
> >  venus-dec-objs += vdec.o vdec_ctrls.o
> >  venus-enc-objs += venc.o venc_ctrls.o
> > diff --git a/drivers/media/platform/qcom/venus/hfi_platform.c b/drivers/media/platform/qcom/venus/hfi_platform.c
> > index 643e5aa138f5..f56b8f9946d7 100644
> > --- a/drivers/media/platform/qcom/venus/hfi_platform.c
> > +++ b/drivers/media/platform/qcom/venus/hfi_platform.c
> > @@ -13,6 +13,8 @@ const struct hfi_platform *hfi_platform_get(enum hfi_version version)
> >  		return &hfi_plat_v4;
> >  	case HFI_VERSION_6XX:
> >  		return &hfi_plat_v6;
> > +	case HFI_VERSION_6XX_LITE:
> > +		return &hfi_plat_v6_lite;
> update here as well.

yes, this function wont get changed

> >  	default:
> >  		break;
> >  	}
> > diff --git a/drivers/media/platform/qcom/venus/hfi_platform.h b/drivers/media/platform/qcom/venus/hfi_platform.h
> > index ec89a90a8129..6356e4bd0de2 100644
> > --- a/drivers/media/platform/qcom/venus/hfi_platform.h
> > +++ b/drivers/media/platform/qcom/venus/hfi_platform.h
> > @@ -58,6 +58,7 @@ struct hfi_platform {
> >  
> >  extern const struct hfi_platform hfi_plat_v4;
> >  extern const struct hfi_platform hfi_plat_v6;
> > +extern const struct hfi_platform hfi_plat_v6_lite;
> ditto

neither this one

> >  
> >  const struct hfi_platform *hfi_platform_get(enum hfi_version version);
> >  unsigned long hfi_platform_get_codec_vpp_freq(enum hfi_version version, u32 codec,
> > diff --git a/drivers/media/platform/qcom/venus/hfi_platform_v6_lite.c b/drivers/media/platform/qcom/venus/hfi_platform_v6_lite.c
> > new file mode 100644
> > index 000000000000..41958a3e353b
> > --- /dev/null
> > +++ b/drivers/media/platform/qcom/venus/hfi_platform_v6_lite.c
> > @@ -0,0 +1,148 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Copyright (c) 2025, The Linux Foundation. All rights reserved.
> > + */
> > +#include "hfi_platform.h"
> > +
> > +static const struct hfi_plat_caps caps[] = {
> > +{
> > +	.codec = HFI_VIDEO_CODEC_H264,
> > +	.domain = VIDC_SESSION_TYPE_DEC,
> > +	.caps[0] = {HFI_CAPABILITY_FRAME_WIDTH, 128, 1920, 1},
> > +	.caps[1] = {HFI_CAPABILITY_FRAME_HEIGHT, 128, 1080, 1},
> > +	.caps[2] = {HFI_CAPABILITY_MBS_PER_FRAME, 64, 8160, 1},
> > +	.caps[3] = {HFI_CAPABILITY_BITRATE, 1, 60000000, 1 },
> > +	.caps[4] = {HFI_CAPABILITY_MBS_PER_SECOND, 64, 244800, 1},
> > +	.caps[5] = {HFI_CAPABILITY_FRAMERATE, 1, 120, 1},
> > +	.caps[6] = {HFI_CAPABILITY_MAX_VIDEOCORES, 0, 1, 1},
> > +	.num_caps = 7,
> > +	.pl[0] = {HFI_H264_PROFILE_BASELINE, HFI_H264_LEVEL_1},
> > +	.pl[1] = {HFI_H264_PROFILE_MAIN, HFI_H264_LEVEL_41},
> > +	.pl[2] = {HFI_H264_PROFILE_HIGH, HFI_H264_LEVEL_5},
> > +	.pl[3] = {HFI_H264_PROFILE_CONSTRAINED_BASE, HFI_H264_LEVEL_41},
> > +	.pl[4] = {HFI_H264_PROFILE_CONSTRAINED_HIGH, HFI_H264_LEVEL_41},
> what is the reference for these values?

what do you mean? what should be the reference? I didnt see a downstream
equivalente to base on so based on the 4XX settings these seem
consistent.

IS there any internal document that you can point me to please?


> > +	.num_pl = 5,
> > +	.fmts[0] = {HFI_BUFFER_OUTPUT, HFI_COLOR_FORMAT_NV12_UBWC},
> > +	.fmts[1] = {HFI_BUFFER_OUTPUT2, HFI_COLOR_FORMAT_NV12_UBWC},
> > +	.fmts[2] = {HFI_BUFFER_OUTPUT2, HFI_COLOR_FORMAT_NV12},
> > +	.fmts[3] = {HFI_BUFFER_OUTPUT2, HFI_COLOR_FORMAT_NV21},
> > +	.num_fmts = 4,
> > +}, {
> > +	.codec = HFI_VIDEO_CODEC_HEVC,
> > +	.domain = VIDC_SESSION_TYPE_DEC,
> > +	.caps[0] = {HFI_CAPABILITY_FRAME_WIDTH, 128, 1920, 1},
> > +	.caps[1] = {HFI_CAPABILITY_FRAME_HEIGHT, 128, 1080, 1},
> > +	.caps[2] = {HFI_CAPABILITY_MBS_PER_FRAME, 64, 8160, 1},
> > +	.caps[3] = {HFI_CAPABILITY_BITRATE, 1, 60000000, 1 },
> > +	.caps[4] = {HFI_CAPABILITY_MBS_PER_SECOND, 64, 244800, 1},
> > +	.caps[5] = {HFI_CAPABILITY_FRAMERATE, 1, 120, 1},
> > +	.caps[6] = {HFI_CAPABILITY_MAX_VIDEOCORES, 0, 1, 1},
> > +	.num_caps = 7,
> > +	.pl[0] = {HFI_HEVC_PROFILE_MAIN, HFI_HEVC_LEVEL_5 | HFI_HEVC_TIER_MAIN},
> > +	.pl[1] = {HFI_HEVC_PROFILE_MAIN10, HFI_HEVC_LEVEL_5 | HFI_HEVC_TIER_MAIN},
> what is the reference for these values?

same as above.

what internal documents do you typically reference to? Havent seen these
references in previous commits.

could you clarify please?


> > +	.num_pl = 2,
> > +	.fmts[0] = {HFI_BUFFER_OUTPUT, HFI_COLOR_FORMAT_NV12_UBWC},
> > +	.fmts[1] = {HFI_BUFFER_OUTPUT2, HFI_COLOR_FORMAT_NV12_UBWC},
> > +	.fmts[2] = {HFI_BUFFER_OUTPUT2, HFI_COLOR_FORMAT_NV12},
> > +	.fmts[3] = {HFI_BUFFER_OUTPUT2, HFI_COLOR_FORMAT_NV21},
> > +	.num_fmts = 4,
> > +}, {
> > +	.codec = HFI_VIDEO_CODEC_VP9,
> > +	.domain = VIDC_SESSION_TYPE_DEC,
> > +	.caps[0] = {HFI_CAPABILITY_FRAME_WIDTH, 128, 1920, 1},
> > +	.caps[1] = {HFI_CAPABILITY_FRAME_HEIGHT, 128, 1080, 1},
> > +	.caps[2] = {HFI_CAPABILITY_MBS_PER_FRAME, 64, 8160, 1},
> > +	.caps[3] = {HFI_CAPABILITY_BITRATE, 1, 60000000, 1 },
> > +	.caps[4] = {HFI_CAPABILITY_MBS_PER_SECOND, 64, 244800, 1},
> > +	.caps[5] = {HFI_CAPABILITY_FRAMERATE, 1, 120, 1},
> > +	.caps[6] = {HFI_CAPABILITY_MAX_VIDEOCORES, 0, 1, 1},
> > +	.num_caps = 7,
> > +	.pl[0] = {HFI_VP9_PROFILE_P0, 200},
> > +	.pl[1] = {HFI_VP9_PROFILE_P2_10B, 200},
> > +	.num_pl = 2,
> > +	.fmts[0] = {HFI_BUFFER_OUTPUT, HFI_COLOR_FORMAT_NV12_UBWC},
> > +	.fmts[1] = {HFI_BUFFER_OUTPUT2, HFI_COLOR_FORMAT_NV12_UBWC},
> > +	.fmts[2] = {HFI_BUFFER_OUTPUT2, HFI_COLOR_FORMAT_NV12},
> > +	.fmts[3] = {HFI_BUFFER_OUTPUT2, HFI_COLOR_FORMAT_NV21},
> > +	.num_fmts = 4,
> > +} };
> > +
> > +static const struct hfi_plat_caps *get_capabilities(unsigned int *entries)
> > +{
> > +	*entries = ARRAY_SIZE(caps);
> > +	return caps;
> > +}
> > +
> > +static void get_codecs(u32 *enc_codecs, u32 *dec_codecs, u32 *count)
> > +{
> > +	*enc_codecs = 0x0;
> > +	*dec_codecs = HFI_VIDEO_CODEC_H264 | HFI_VIDEO_CODEC_HEVC |
> > +		      HFI_VIDEO_CODEC_VP9;
> > +	*count = 3;
> > +}
> > +
> > +static const struct hfi_platform_codec_freq_data codec_freq_data[] = {
> > +	{ V4L2_PIX_FMT_H264, VIDC_SESSION_TYPE_DEC, 440, 0, 440 },
> > +	{ V4L2_PIX_FMT_HEVC, VIDC_SESSION_TYPE_DEC, 440, 0, 440 },
> > +	{ V4L2_PIX_FMT_VP9, VIDC_SESSION_TYPE_DEC, 440, 0, 440 },
> > +};
> > +
> > +static const struct hfi_platform_codec_freq_data *
> > +get_codec_freq_data(u32 session_type, u32 pixfmt)
> > +{
> > +	const struct hfi_platform_codec_freq_data *data = codec_freq_data;
> > +	unsigned int i, data_size = ARRAY_SIZE(codec_freq_data);
> > +	const struct hfi_platform_codec_freq_data *found = NULL;
> > +
> > +	for (i = 0; i < data_size; i++) {
> > +		if (data[i].pixfmt == pixfmt &&
> > +		    data[i].session_type == session_type) {
> > +			found = &data[i];
> > +			break;
> > +		}
> > +	}
> > +
> > +	return found;
> > +}
> > +
> > +static unsigned long codec_vpp_freq(u32 session_type, u32 codec)
> > +{
> > +	const struct hfi_platform_codec_freq_data *data;
> > +
> > +	data = get_codec_freq_data(session_type, codec);
> > +	if (data)
> > +		return data->vpp_freq;
> > +
> > +	return 0;
> > +}
> > +
> > +static unsigned long codec_vsp_freq(u32 session_type, u32 codec)
> > +{
> > +	const struct hfi_platform_codec_freq_data *data;
> > +
> > +	data = get_codec_freq_data(session_type, codec);
> > +	if (data)
> > +		return data->vsp_freq;
> > +
> > +	return 0;
> > +}
> > +
> > +static unsigned long codec_lp_freq(u32 session_type, u32 codec)
> > +{
> > +	const struct hfi_platform_codec_freq_data *data;
> > +
> > +	data = get_codec_freq_data(session_type, codec);
> > +	if (data)
> > +		return data->low_power_freq;
> > +
> > +	return 0;
> > +}
> > +
> > +const struct hfi_platform hfi_plat_v6_lite = {
> > +	.codec_vpp_freq = codec_vpp_freq,
> > +	.codec_vsp_freq = codec_vsp_freq,
> > +	.codec_lp_freq = codec_lp_freq,
> > +	.codecs = get_codecs,
> > +	.capabilities = get_capabilities,
> > +	.bufreq = hfi_plat_bufreq_v6,
> buffer requirement should come from firmware, pls drop.

yes, this will be hfi_plat_v4 only

> > +};
> 
> lot of code duplication here, pls see the possibility to commonize the
> > code.

this file is no longer needed

> 
> Thanks,
> Dikshita

