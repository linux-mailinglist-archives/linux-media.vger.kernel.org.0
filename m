Return-Path: <linux-media+bounces-38831-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 21CA2B19FD2
	for <lists+linux-media@lfdr.de>; Mon,  4 Aug 2025 12:41:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D05B03B9D91
	for <lists+linux-media@lfdr.de>; Mon,  4 Aug 2025 10:41:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1B98252292;
	Mon,  4 Aug 2025 10:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QWYMhq0K"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4035E248F78
	for <linux-media@vger.kernel.org>; Mon,  4 Aug 2025 10:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754304070; cv=none; b=NFMV6WFBXPg7M7t7rFLtJWnGslqEa0gFdYMnwaIH5UZnqsGD+2LRcpneC1Fa+TFcav0lgU2MGCO+zUPPxFOlu0rv2iCsZy4XZioXJZocp1bmlDO6EV9adLFQwD2415zUWApiUMLx893N2p7BG2iWk3sbubWN3GFrFXkAk4btCLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754304070; c=relaxed/simple;
	bh=2j5tLafg2QbR002kwGNKMmT8IatBulUi1DCOw8WM/lA=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sxsEQBuhJdh6YE9toXxKEREglcDtbpxRotQgQukJYi7PdGcUgIYwf5gJUBBEZq5+ejkPawgSckjvBWfZwJIlnbyHpR1iJYeODN6IROus4ciOx9BRYKO6/s8aXza0PTpLrtNz/v2qT2zMtwR9GRSQ1MwCM2/mgmCYfY3KMMLC4FI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QWYMhq0K; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5748kXR0021762
	for <linux-media@vger.kernel.org>; Mon, 4 Aug 2025 10:41:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=X8pHbHkY2ls5g4w8xkQLebzm
	rIQ6FLopjaH1Mu7ibFA=; b=QWYMhq0KPAL2e0kYDZm7Fu1/DeBEQ2P8FF+dje1/
	rmrLuLnZ5u9tKTkYy55x//JPrdUHhxgVUF76Pubyuuzcid/L50G9zMwENFZMn4eZ
	77qdlv+36c/iwk9mUaj+xmhbCs4anw5iqYO24gbmOvl7YOLDOEK85P/RI7NnF9xp
	TZdffRyWf7nIl6QYI2P+/0rXdZ+jfa4gIpIy8PYCiR//4ES5PyCwdZf4x3lTsXxl
	zOXnxNDfy0Uegj3MQpEV11TZy2zYTUy0r2lsxWVoqTlHxtFEkZly9IKK2hYmrhuh
	StFQjPEDxaF2/5xj9+zLjI87V1cp6a3SEHwJtX6Qh0egag==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 489byc4get-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 04 Aug 2025 10:41:05 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b06228c36aso13139291cf.1
        for <linux-media@vger.kernel.org>; Mon, 04 Aug 2025 03:41:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754304064; x=1754908864;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X8pHbHkY2ls5g4w8xkQLebzmrIQ6FLopjaH1Mu7ibFA=;
        b=krWQmrUC4BxKyYYORHjKF+CdEAnmoHWl04e5ymsJMyhAk5ckiaKMN1KYLP8+oY/TMm
         O91CvqNGHXETcMrvAXMm0/3e6LDWjICIN77rPKs5QjEFbvlenTByW8mYTphm+q6BkA/5
         zbisLeh34Izaz+cgdImyRiBWgzh2mmXVxO0klTIBwOs1RT5+J/5B/EFcXm1r8BeZYW1u
         Gi8roamSQc9wWcxr4vW0NGs0/JaNxc8n+gd2nlciv+onuc0GwJr9kCFXAcskR5kC1zQ5
         Ahg9MJCrs9HCCMGmgXj4T5xxe2CWDpQAmbiVI5iqK+PbynG1zCFLonyuNMhUe3bTbyCZ
         4IIQ==
X-Forwarded-Encrypted: i=1; AJvYcCVPfa4UZOhbyDUzzRFlTFZdwnDZDJvZVCENzqc1Lnx55QLzg6sVENBR712eiRyJGTNRQUjqXvF/LgPn1A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwVWpKlWvOrv4vIIDHMsR8axdfGfyuc3Vkj243ncTFJ0URr3yX0
	HB28+E0XcaepA4mfc7vPgrxxY4qqXQP1BCEjoBMTGw32Ek1TvV5bNW4xDO1pTt99QB83is2Gt7s
	ettDto+1nk+teEtO/NfJL4y45ox6ABv8PDCIKFTtGqpAbFdpEpKtE+pWjjQhx7E/Xqw==
X-Gm-Gg: ASbGncuVS5Ta30A0nhz7XlSs+/eiRD3Xnj6mw86jCAAkFJhoYATe5J5AIlDoPR6mX9N
	SgorlZf1iAEMaOqdMraGbsW1Ouha7Iy0zpT6LBy6c7DOnHrrX01ngeY7pwvNlkJOfLa6u48cSks
	mqapMljrWC66EFBv46qhs3+Lug7FqaSpJ2h8lW3DasRTu6nHgtu7y1p2Z2ar9jr225fR8AjGPtz
	ZKX/8nkrzlJbkCjTa0k2mudYkiAUSpNlPoexObl2SplU8Emm1rYJBy0yEiE+imb+7RUGhPoMDu+
	P2Y+2Nyeln6acN4+r61anVss/1ZSTY5ekJ3SR1UT4xFqgxCYan2GVsjEro+UjnTX8VeXnA==
X-Received: by 2002:a05:622a:4a09:b0:4b0:6ffc:e0d2 with SMTP id d75a77b69052e-4b06ffce63dmr45492101cf.44.1754304063912;
        Mon, 04 Aug 2025 03:41:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG2cZERcCCL+4lpQ9cGyZYcOSJ35Aak7AnpnOMookbNCNV87jwQBTdhgbf8Z16ratbfmE4g6w==
X-Received: by 2002:a05:622a:4a09:b0:4b0:6ffc:e0d2 with SMTP id d75a77b69052e-4b06ffce63dmr45491711cf.44.1754304063414;
        Mon, 04 Aug 2025 03:41:03 -0700 (PDT)
Received: from trex (205.red-83-60-94.dynamicip.rima-tde.net. [83.60.94.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c47ca5fsm14877080f8f.63.2025.08.04.03.41.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Aug 2025 03:41:02 -0700 (PDT)
From: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
X-Google-Original-From: Jorge Ramirez <JorgeRamirez-Ortiz>
Date: Mon, 4 Aug 2025 12:40:58 +0200
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        quic_vgarodia@quicinc.com, quic_dikshita@quicinc.com,
        krzk+dt@kernel.org, konradybcio@kernel.org, mchehab@kernel.org,
        andersson@kernel.org, conor+dt@kernel.org,
        amit.kucheria@oss.qualcomm.com, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 4/7] media: venus: hfi_plat_v4: Add capabilities for
 the 4XX lite core
Message-ID: <aJCOOtd3WC/70Sa6@trex>
References: <20250715204749.2189875-1-jorge.ramirez@oss.qualcomm.com>
 <20250715204749.2189875-5-jorge.ramirez@oss.qualcomm.com>
 <b8b80bfd-0927-4c4f-96fd-6ad1e94d3666@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b8b80bfd-0927-4c4f-96fd-6ad1e94d3666@linaro.org>
X-Proofpoint-ORIG-GUID: khrBUWtlfkIWvqL0RgA0q-7SO_E4F3j4
X-Authority-Analysis: v=2.4 cv=Y6D4sgeN c=1 sm=1 tr=0 ts=68908e41 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=Rr2dNH5/fcnoRoBmcVUeRg==:17
 a=kj9zAlcOel0A:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=eVORZBbbi8ZzfUZ-CyEA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: khrBUWtlfkIWvqL0RgA0q-7SO_E4F3j4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA0MDA1NyBTYWx0ZWRfXxKkUDWhaQiDk
 8p2Jfov4DXBfI2Y5J0jNEGuxKvoO9B8zfedP2RLmrhEmlaXGVOQNm0Pt3uCBb4GivRvwtVnYggQ
 dnB2oTbeEiBIpPY6GV7hioYZoScGIwLxyxfPhaM/tTJyQjS0UikTzBQ7JWdzCTlwVB0vwiovhLm
 7RpMtoyGhmcrxOIy0twX02zCGvi6NbRSgxMKLfecGD579Fu6cRMKRRsR73Ow+IJpn2Ze8Zo2JO6
 hYJsrewZAGEmudvgYSHfkWqo4/EAbDc6JkmYhD7RvGc+KexOeyySx88wwV+Hfd7HI9nWnNFFnps
 TP9FsBOcSJHX16S0j2atKA2H2TQijn3jGpDVKEQqjlwYH8hxOmmPhE/jWtuoZ9NgEg3jslYxfe5
 irbotr8d/NF4XUnMEFNkYBnZefsxI0ip2t82rmBzkFSA9/aH7qK5gE5EYvs5Gi19S4EvLIGP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-04_04,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=999 suspectscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 malwarescore=0 adultscore=0 spamscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508040057

On 17/07/25 10:43:48, Bryan O'Donoghue wrote:
> On 15/07/2025 21:47, Jorge Ramirez-Ortiz wrote:
> > Populate the HFI v4 lite capability set used by the AR50_LITE video
> > core.
> > 
> > These capabilities define the supported codec formats and operational
> > limits specific to this streamlined VPU variant.
> > 
> > Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> > ---
> >   .../platform/qcom/venus/hfi_platform_v4.c     | 164 +++++++++++++++---
> >   1 file changed, 143 insertions(+), 21 deletions(-)
> > 
> > diff --git a/drivers/media/platform/qcom/venus/hfi_platform_v4.c b/drivers/media/platform/qcom/venus/hfi_platform_v4.c
> > index 4ae7ed476c48..23ed5e689f5a 100644
> > --- a/drivers/media/platform/qcom/venus/hfi_platform_v4.c
> > +++ b/drivers/media/platform/qcom/venus/hfi_platform_v4.c
> > @@ -245,25 +245,145 @@ static const struct hfi_plat_caps caps[] = {
> >   	.num_fmts = 4,
> >   } };
> > +static const struct hfi_plat_caps caps_lite[] = {
> > +{
> > +	.codec = HFI_VIDEO_CODEC_H264,
> > +	.domain = VIDC_SESSION_TYPE_DEC,
> > +	.caps[0] = {HFI_CAPABILITY_FRAME_WIDTH, 128, 1920, 1},
> > +	.caps[1] = {HFI_CAPABILITY_FRAME_HEIGHT, 128, 1920, 1},
> > +	.caps[2] = {HFI_CAPABILITY_MBS_PER_FRAME, 64, 8160, 1},
> > +	.caps[3] = {HFI_CAPABILITY_BITRATE, 1, 60000000, 1 },
> > +	.caps[4] = {HFI_CAPABILITY_MBS_PER_SECOND, 64, 244800, 1},
> > +	.caps[5] = {HFI_CAPABILITY_FRAMERATE, 1, 120, 1},
> > +	.caps[6] = {HFI_CAPABILITY_MAX_VIDEOCORES, 0, 1, 1},
> > +	.num_caps = 7,
> > +	.pl[0] = { HFI_H264_PROFILE_BASELINE, HFI_H264_LEVEL_5},
> > +	.pl[1] = {HFI_H264_PROFILE_MAIN, HFI_H264_LEVEL_5},
> > +	.pl[2] = {HFI_H264_PROFILE_HIGH, HFI_H264_LEVEL_5},
> > +	.pl[3] = {HFI_H264_PROFILE_CONSTRAINED_BASE, HFI_H264_LEVEL_5},
> > +	.pl[4] = {HFI_H264_PROFILE_CONSTRAINED_HIGH, HFI_H264_LEVEL_5},
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
> > +	.caps[1] = {HFI_CAPABILITY_FRAME_HEIGHT, 128, 1920, 1},
> > +	.caps[2] = {HFI_CAPABILITY_MBS_PER_FRAME, 64, 8160, 1},
> > +	.caps[3] = {HFI_CAPABILITY_BITRATE, 1, 60000000, 1 },
> > +	.caps[4] = {HFI_CAPABILITY_MBS_PER_SECOND, 64, 244800, 1},
> > +	.caps[5] = {HFI_CAPABILITY_FRAMERATE, 1, 120, 1},
> > +	.caps[6] = {HFI_CAPABILITY_MAX_VIDEOCORES, 0, 1, 1},
> > +	.num_caps = 7,
> > +	.pl[0] = {HFI_HEVC_PROFILE_MAIN, HFI_HEVC_LEVEL_5 | HFI_HEVC_TIER_HIGH0 << 28 },
> > +	.pl[1] = {HFI_HEVC_PROFILE_MAIN10, HFI_HEVC_LEVEL_5 | HFI_HEVC_TIER_HIGH0 << 28 },
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
> > +	.caps[1] = {HFI_CAPABILITY_FRAME_HEIGHT, 128, 1920, 1},
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
> > +}, {
> > +	.codec = HFI_VIDEO_CODEC_H264,
> > +	.domain = VIDC_SESSION_TYPE_ENC,
> > +	.caps[0] = {HFI_CAPABILITY_FRAME_WIDTH, 128, 1920, 1},
> > +	.caps[1] = {HFI_CAPABILITY_FRAME_HEIGHT, 128, 1920, 1},
> > +	.caps[2] = {HFI_CAPABILITY_MBS_PER_FRAME, 64, 8160, 1},
> > +	.caps[3] = {HFI_CAPABILITY_BITRATE, 1, 60000000, 1 },
> > +	.caps[4] = {HFI_CAPABILITY_MBS_PER_SECOND, 64, 244800, 1},
> > +	.caps[5] = {HFI_CAPABILITY_FRAMERATE, 1, 120, 1},
> > +	.caps[6] = {HFI_CAPABILITY_MAX_VIDEOCORES, 0, 1, 1},
> > +	.caps[7] = {HFI_CAPABILITY_HIER_P_NUM_ENH_LAYERS, 0, 6, 1},
> > +	.caps[8] = {HFI_CAPABILITY_ENC_LTR_COUNT, 0, 4, 1},
> > +	.caps[9] = {HFI_CAPABILITY_MBS_PER_SECOND_POWERSAVE, 0, 244800, 1},
> > +	.caps[10] = {HFI_CAPABILITY_I_FRAME_QP, 0, 51, 1},
> > +	.caps[11] = {HFI_CAPABILITY_P_FRAME_QP, 0, 51, 1},
> > +	.caps[12] = {HFI_CAPABILITY_B_FRAME_QP, 0, 51, 1},
> > +	.caps[13] = {HFI_CAPABILITY_SLICE_BYTE, 1, 10, 1},
> > +	.caps[14] = {HFI_CAPABILITY_SLICE_MB, 1, 10, 1},
> > +	.num_caps = 15,
> > +	.pl[0] = {HFI_H264_PROFILE_BASELINE, HFI_H264_LEVEL_5},
> > +	.pl[1] = {HFI_H264_PROFILE_MAIN, HFI_H264_LEVEL_5},
> > +	.pl[2] = {HFI_H264_PROFILE_HIGH, HFI_H264_LEVEL_5},
> > +	.pl[3] = {HFI_H264_PROFILE_CONSTRAINED_BASE, HFI_H264_LEVEL_5},
> > +	.pl[4] = {HFI_H264_PROFILE_CONSTRAINED_HIGH, HFI_H264_LEVEL_5},
> > +	.num_pl = 5,
> > +	.fmts[0] = {HFI_BUFFER_INPUT, HFI_COLOR_FORMAT_NV12},
> > +	.fmts[1] = {HFI_BUFFER_INPUT, HFI_COLOR_FORMAT_NV12_UBWC},
> > +	.num_fmts = 2,
> > +}, {
> > +	.codec = HFI_VIDEO_CODEC_HEVC,
> > +	.domain = VIDC_SESSION_TYPE_ENC,
> > +	.caps[0] = {HFI_CAPABILITY_FRAME_WIDTH, 128, 1920, 1},
> > +	.caps[1] = {HFI_CAPABILITY_FRAME_HEIGHT, 128, 1920, 1},
> > +	.caps[2] = {HFI_CAPABILITY_MBS_PER_FRAME, 64, 8160, 1},
> > +	.caps[3] = {HFI_CAPABILITY_BITRATE, 1, 60000000, 1 },
> > +	.caps[4] = {HFI_CAPABILITY_MBS_PER_SECOND, 64, 244800, 1},
> > +	.caps[5] = {HFI_CAPABILITY_FRAMERATE, 1, 120, 1},
> > +	.caps[6] = {HFI_CAPABILITY_MAX_VIDEOCORES, 0, 1, 1},
> > +	.caps[7] = {HFI_CAPABILITY_HIER_P_NUM_ENH_LAYERS, 0, 6, 1},
> > +	.caps[8] = {HFI_CAPABILITY_ENC_LTR_COUNT, 0, 4, 1},
> > +	.caps[9] = {HFI_CAPABILITY_MBS_PER_SECOND_POWERSAVE, 0, 244800, 1},
> > +	.caps[10] = {HFI_CAPABILITY_I_FRAME_QP, 0, 51, 1},
> > +	.caps[11] = {HFI_CAPABILITY_P_FRAME_QP, 0, 51, 1},
> > +	.caps[12] = {HFI_CAPABILITY_B_FRAME_QP, 0, 51, 1},
> > +	.caps[13] = {HFI_CAPABILITY_SLICE_BYTE, 1, 10, 1},
> > +	.caps[14] = {HFI_CAPABILITY_SLICE_MB, 1, 10, 1},
> > +	.num_caps = 15,
> > +	.pl[0] = {HFI_HEVC_PROFILE_MAIN, HFI_HEVC_LEVEL_5 | HFI_HEVC_TIER_HIGH0},
> > +	.pl[1] = {HFI_HEVC_PROFILE_MAIN10, HFI_HEVC_LEVEL_5 | HFI_HEVC_TIER_HIGH0},
> > +	.num_pl = 2,
> > +	.fmts[0] = {HFI_BUFFER_INPUT, HFI_COLOR_FORMAT_NV12},
> > +	.fmts[1] = {HFI_BUFFER_INPUT, HFI_COLOR_FORMAT_NV12_UBWC},
> > +	.num_fmts = 2,
> > +} };
> > +
> >   static const struct hfi_plat_caps *get_capabilities(unsigned int *entries,
> >   						    bool lite)
> >   {
> > -	WARN_ON(lite);
> > +	*entries = lite ? ARRAY_SIZE(caps_lite) : ARRAY_SIZE(caps);
> > -	*entries = ARRAY_SIZE(caps);
> > -	return caps;
> > +	return lite ? caps_lite : caps;
> >   }
> >   static void get_codecs(u32 *enc_codecs, u32 *dec_codecs, u32 *count, bool lite)
> >   {
> > -	WARN_ON(lite);
> > -
> > -	*enc_codecs = HFI_VIDEO_CODEC_H264 | HFI_VIDEO_CODEC_HEVC |
> > -		      HFI_VIDEO_CODEC_VP8;
> > -	*dec_codecs = HFI_VIDEO_CODEC_H264 | HFI_VIDEO_CODEC_HEVC |
> > -		      HFI_VIDEO_CODEC_VP8 | HFI_VIDEO_CODEC_VP9 |
> > -		      HFI_VIDEO_CODEC_MPEG2;
> > -	*count = 8;
> > +	if (lite) {
> 
> Ok, now the WARN_ON() makes more sense, its a progressive.
> 
> > +		*enc_codecs = HFI_VIDEO_CODEC_H264 | HFI_VIDEO_CODEC_HEVC;
> > +		*dec_codecs = HFI_VIDEO_CODEC_H264 | HFI_VIDEO_CODEC_HEVC |
> > +			      HFI_VIDEO_CODEC_VP9;
> > +		*count = 5;
> > +	} else {
> > +		*enc_codecs = HFI_VIDEO_CODEC_H264 | HFI_VIDEO_CODEC_HEVC |
> > +			      HFI_VIDEO_CODEC_VP8;
> > +		*dec_codecs = HFI_VIDEO_CODEC_H264 | HFI_VIDEO_CODEC_HEVC |
> > +			      HFI_VIDEO_CODEC_VP8 | HFI_VIDEO_CODEC_VP9 |
> > +			      HFI_VIDEO_CODEC_MPEG2;
> > +		*count = 8;
> > +	}
> 
> I don't much like setting hard-coded values in functions.
> 
> It must be possible to pass these as parameters. We have all of these
> enumeration structures - it seems a shame to move some specific enumerations
> to hard-coding.
> 
> Please consider if there is a way to bury this into one of the enumeration
> params.

yep, you are right lets do that. fixed in v8

> 
> >   }
> >   static const struct hfi_platform_codec_freq_data codec_freq_data[] =  {
> > @@ -277,15 +397,23 @@ static const struct hfi_platform_codec_freq_data codec_freq_data[] =  {
> >   	{ V4L2_PIX_FMT_VP9, VIDC_SESSION_TYPE_DEC, 200, 10, 200 },
> >   };
> > +static const struct hfi_platform_codec_freq_data codec_freq_data_lite[] = {
> > +	{ V4L2_PIX_FMT_H264, VIDC_SESSION_TYPE_DEC, 440, 0, 440 },
> > +	{ V4L2_PIX_FMT_HEVC, VIDC_SESSION_TYPE_DEC, 440, 0, 440 },
> > +	{ V4L2_PIX_FMT_VP9, VIDC_SESSION_TYPE_DEC, 440, 0, 440 },
> > +	{ V4L2_PIX_FMT_H264, VIDC_SESSION_TYPE_ENC, 675, 0, 675 },
> > +	{ V4L2_PIX_FMT_HEVC, VIDC_SESSION_TYPE_ENC, 675, 0, 675 },
> > +};
> > +
> >   static const struct hfi_platform_codec_freq_data *
> >   get_codec_freq_data(u32 session_type, u32 pixfmt, bool lite)
> >   {
> > -	const struct hfi_platform_codec_freq_data *data = codec_freq_data;
> > -	unsigned int i, data_size = ARRAY_SIZE(codec_freq_data);
> > +	const struct hfi_platform_codec_freq_data *data = lite ?
> > +					codec_freq_data_lite : codec_freq_data;
> > +	unsigned int i, data_size = lite ? ARRAY_SIZE(codec_freq_data_lite) :
> > +				    ARRAY_SIZE(codec_freq_data);
> 
> I'm not a big fan anymore of ternary nor of declaring multiple things on one
> line.
> 
> And I'll preempt Konrad, reverse Christmas tree in the declaration where
> possible for preference.
> 
> >   	const struct hfi_platform_codec_freq_data *found = NULL;
> > -	WARN_ON(lite);
> > -
> >   	for (i = 0; i < data_size; i++) {
> >   		if (data[i].pixfmt == pixfmt && data[i].session_type == session_type) {
> >   			found = &data[i];
> > @@ -300,8 +428,6 @@ static unsigned long codec_vpp_freq(u32 session_type, u32 codec, bool lite)
> >   {
> >   	const struct hfi_platform_codec_freq_data *data;
> > -	WARN_ON(lite);
> > -
> >   	data = get_codec_freq_data(session_type, codec, lite);
> >   	if (data)
> >   		return data->vpp_freq;
> > @@ -313,8 +439,6 @@ static unsigned long codec_vsp_freq(u32 session_type, u32 codec, bool lite)
> >   {
> >   	const struct hfi_platform_codec_freq_data *data;
> > -	WARN_ON(lite);
> > -
> >   	data = get_codec_freq_data(session_type, codec, lite);
> >   	if (data)
> >   		return data->vsp_freq;
> > @@ -326,8 +450,6 @@ static unsigned long codec_lp_freq(u32 session_type, u32 codec, bool lite)
> >   {
> >   	const struct hfi_platform_codec_freq_data *data;
> > -	WARN_ON(lite);
> > -
> >   	data = get_codec_freq_data(session_type, codec, lite);
> >   	if (data)
> >   		return data->low_power_freq;
> 
> I suppose the hard-coded *val = 5 || *val = 8; isn't important but it would
> be _nice_ to not hard-code, up to you how much you want to implement for the
> next version.
> 
> This code all looks reasonably correct/consistent with antecedents.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> 
> ---
> bod

