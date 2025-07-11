Return-Path: <linux-media+bounces-37469-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AECCFB018AC
	for <lists+linux-media@lfdr.de>; Fri, 11 Jul 2025 11:48:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 81358B46E63
	for <lists+linux-media@lfdr.de>; Fri, 11 Jul 2025 09:46:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 041C727F00C;
	Fri, 11 Jul 2025 09:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LBkOykTQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7467D27F758
	for <linux-media@vger.kernel.org>; Fri, 11 Jul 2025 09:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752227214; cv=none; b=knZb43UBrEed3a7yRhwts+udn8y0fuky1Z1ycQNCnv+O17fXGQsvGv885uhwxgTOYrexvNVAFJx+Hc41MTFRT98CnbD3vNeUn7DPGaey12S5PmOtxlCMaukz0HhmM7xabUlIyoqpKY65USix+OblE/xgvfTa74ejBgtqZcame2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752227214; c=relaxed/simple;
	bh=HuW2pT/0HarWrByaQEmc/Jp6pjnS4B+RKVraBlZJ3rw=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=thOVHf4iv+9NliFtdNrqyGYpjIjbv7QzPpO3uzoXA6r1oOR7eOpYhLtiz6b/+3gklhAJ+EtktCYSEVPY+6xHhpakNEobeAGavwK5A/NBfbLrTJg4RDxZ0h4ZGXXUefvju6usbV29LTEDgoRiyjz/GZOKy5eMzTams/uNhfNYjOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LBkOykTQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56B1XA0m021865
	for <linux-media@vger.kernel.org>; Fri, 11 Jul 2025 09:46:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ATZoXdNnNaxyXAtjJqDGpuE+
	oZunLIWGEwXy6GAu+YM=; b=LBkOykTQ517WtDPLynFhTBmR+cXyAjAdSSulfmQB
	wd1u3wUe6xotCGJxFa+/5dFErdV12m4tzEu+hWf2czDtUCwK1EbwHT7MaX1YlxQH
	gFhw6WUR449QVR6+DqgnczNFS9ACTZYBMZg0DI8d2pAky7Byad3XXyb57c8UFTKz
	7AvxJC7fWjrIVb9CYhAdOji1ALq1RGFPoexBGI1Wd288MRUBwTm0uZBlN8gH07NR
	4kZuAXwBdzDIeQ7IBHANLxmLGqd00wC5alSFqJ/wkjUn4E/lVBQYJfBf3QgZGMej
	Z5n+4llyCZ6NPVdDCIBMN3Ow/cTKxWYNJxzJOBaLeCfeIQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47r9b1949g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 11 Jul 2025 09:46:51 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d3d3f64739so393252385a.0
        for <linux-media@vger.kernel.org>; Fri, 11 Jul 2025 02:46:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752227210; x=1752832010;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ATZoXdNnNaxyXAtjJqDGpuE+oZunLIWGEwXy6GAu+YM=;
        b=WVtwtuj5lgBGe+Wv4Lh1mjTcIfJzopLnk+HfVZIIs2PwAYBUSB4pfBeb1pLlnqhrc5
         1NBhlmtFWEKJOPDJscMHum53Y0gCFL+TYEMFoqsxXU2WcaP04Vx0acUvXx/T6qcExcFC
         CJUzse+fW2z9vWjpJU48y05qY2KFbvHkWG1XnS/8QbM1+nbJxZlCV7cFuSZ8oJxy1Tjr
         8/QFQnxssQN/W+iRac1dDlSaX8qgWYjmRWCrUyvyFCY01tv1g5o8kxGBw0uIeZdfkUSz
         Efcvy2NrLHbhUNn5flZAxyu9XdnHMdHim3Mlx9gPJkteq1XG9jOvVUGNuchFxt0L50s6
         yjaA==
X-Forwarded-Encrypted: i=1; AJvYcCWm1cey/Y36w8Y3P8bShl/lwUb2/2LPqNM6Dsprlbhdo7Kr/Pt+3yu3wrcoRLpzGlw+OTvyzIW0/EZ/hw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwmxkryFoPdWzGmMAKXAe/Wq0rtfWNpS2MBTZ5kQZBM1qUfaEwI
	TS7aTEuS/M/wHOyFLHbHMauv3rJbyF7XlJ9SwuOpv0OxTsKUQCygqVwfUze6mNSBkbSN6UFxcFQ
	8iQPPHWGTGbSjaHrapHmZjv1K1wu7IyuWT8oul154Cg9BuEew260dM8lpJJ95Rl8kwA==
X-Gm-Gg: ASbGncuaaE87V24+rmm2Zw7UeQCxezJ0VcXAbJ1E7glgmNtRv9PuWX1QRgsUkCSWJx2
	MK2cl4SjabDQxd4cboK2lyV6LGWTko/pdaI5pCTeBNoQm8hDjPpAnRTTn8csoTk67xp02lc7AQt
	Ugs/jQaoL8JNpGLnmpGrSWiYaR/OleNvkyOXMLyO+k9O1vyRMRysYLa09ea4SgOFBrj6VoF5ATi
	QgNMoEUFELBQkO2VXCkoF+0iK/l2ZMIHrPIH/6D8prbNEhkzEcmdSHcm3z+Oy4hm1v0rog18YKR
	cXWdthMXNQHBno6yTLD7J8B+W84JrcNCO1PuVBX08yvvCqEc/qs5ZzVoBbwWF4pKv0TS3Cp04kU
	=
X-Received: by 2002:a05:620a:31a2:b0:7d0:98a1:7aba with SMTP id af79cd13be357-7ddea41d1e9mr368839485a.17.1752227210116;
        Fri, 11 Jul 2025 02:46:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG7dH4ueW7+zpcjRQZF85NJn1oiRAb/07wOYpI2qElOIbdc6wayA7eF3OJ5SuSb53AzTOBFpg==
X-Received: by 2002:a05:620a:31a2:b0:7d0:98a1:7aba with SMTP id af79cd13be357-7ddea41d1e9mr368836285a.17.1752227209637;
        Fri, 11 Jul 2025 02:46:49 -0700 (PDT)
Received: from trex (153.red-79-144-197.dynamicip.rima-tde.net. [79.144.197.153])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454dd43915dsm42327755e9.7.2025.07.11.02.46.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 02:46:49 -0700 (PDT)
From: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
X-Google-Original-From: Jorge Ramirez <JorgeRamirez-Ortiz>
Date: Fri, 11 Jul 2025 11:46:44 +0200
To: Dikshita Agarwal <quic_dikshita@quicinc.com>
Cc: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        bryan.odonoghue@linaro.org, quic_vgarodia@quicinc.com,
        krzk+dt@kernel.org, konradybcio@kernel.org, mchehab@kernel.org,
        robh@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        amit.kucheria@oss.qualcomm.com, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 4/7] media: venus: hfi_plat_v4: Add capabilities for
 the 4XX lite core
Message-ID: <aHDdhDQz+BW51a2c@trex>
References: <20250708180530.1384330-1-jorge.ramirez@oss.qualcomm.com>
 <20250708180530.1384330-5-jorge.ramirez@oss.qualcomm.com>
 <7d50318e-1189-15aa-8c26-9c522c3194c4@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7d50318e-1189-15aa-8c26-9c522c3194c4@quicinc.com>
X-Authority-Analysis: v=2.4 cv=dYuA3WXe c=1 sm=1 tr=0 ts=6870dd8b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=Ki5fnJvzvo7yLsyA0quaxQ==:17
 a=kj9zAlcOel0A:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=tNaucEZ5xaPZ5W2ib1AA:9
 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzExMDA2OCBTYWx0ZWRfX0W+knbQP6Fpm
 mN57+WcjkOq/Y3PyWvkMG+a3o8mekoo6ElngOYiyeL5NHRt0TbKZT2tyMv2eguihRbI1Gi0z+5I
 DP0dUfn/N3OduP4amjNf29lInvamhZbQZLqNuhdNAGhgMWRE71Dxe/IXFiOsu6YFQG993/iDv7a
 v1TTBCtMbvzfET1bPLOQo17N8e/rswQ2xRolL+ZblVxlt+5QpRgKLM4cWCb8+XEeeXj27l6ky6t
 xE0H796sWwvCUh+fuElwSV8l1R6NTFQoLhel+d1BU1rQZbeMruiMlDxzJFirVNzKlV9yxF1wp86
 z19Tq3MKpesAQNAj/VXPnmnCpxD67/9E4EmQnSUaRcCSc9YjbkLThS+ZzVeMfRbzj7ucgMXZfP1
 cp3uz3pfVRyehD8m75lOffZJ/uCaCizDDgIaWIaHuVouIOAixSN+lJYNoSW5y5o0HpGkErpz
X-Proofpoint-GUID: kJRyzXFQQ6WVbNf1vUn_Q5sw5xJyvFk7
X-Proofpoint-ORIG-GUID: kJRyzXFQQ6WVbNf1vUn_Q5sw5xJyvFk7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_03,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 adultscore=0 mlxlogscore=999 malwarescore=0
 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507110068

On 10/07/25 14:51:08, Dikshita Agarwal wrote:
> 
> 
> On 7/8/2025 11:35 PM, Jorge Ramirez-Ortiz wrote:
> > Populate the HFI v4 lite capability set used by the AR50_LITE video
> > core.
> > 
> > These capabilities define the supported codec formats and operational
> > limits specific to this streamlined VPU variant.
> > 
> > Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> > ---
> >  .../platform/qcom/venus/hfi_platform_v4.c     | 165 +++++++++++++++---
> >  1 file changed, 145 insertions(+), 20 deletions(-)
> > 
> > diff --git a/drivers/media/platform/qcom/venus/hfi_platform_v4.c b/drivers/media/platform/qcom/venus/hfi_platform_v4.c
> > index c8e0f8040649..4b7271468ec4 100644
> > --- a/drivers/media/platform/qcom/venus/hfi_platform_v4.c
> > +++ b/drivers/media/platform/qcom/venus/hfi_platform_v4.c
> > @@ -245,25 +245,149 @@ static const struct hfi_plat_caps caps[] = {
> >  	.num_fmts = 4,
> >  } };
> >  
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
> > +	.fmts[2] = {HFI_BUFFER_INPUT, HFI_COLOR_FORMAT_YUV420_TP10_UBWC},
> > +	.fmts[3] = {HFI_BUFFER_INPUT, HFI_COLOR_FORMAT_P010},
> 10 bit encoder is not supported on AR50 LITE.
> > +	.num_fmts = 4,
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
> > +	.fmts[2] = {HFI_BUFFER_INPUT, HFI_COLOR_FORMAT_YUV420_TP10_UBWC},
> > +	.fmts[3] = {HFI_BUFFER_INPUT, HFI_COLOR_FORMAT_P010},
> 10 bit encoder is not supported on AR50 LITE.

ok

thanks
Jorge

