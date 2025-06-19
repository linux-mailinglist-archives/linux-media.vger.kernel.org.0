Return-Path: <linux-media+bounces-35355-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA70AE08EB
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 16:39:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 34390189203A
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 14:39:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 903052248AB;
	Thu, 19 Jun 2025 14:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hpWRAhTO"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4000221ABB0
	for <linux-media@vger.kernel.org>; Thu, 19 Jun 2025 14:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750343927; cv=none; b=TN6s2T9F7zIv4L0Zfoag5zW8T4ip1GH0nXuBXtDhPNDWs9WUGKI6evUsAZDwc+xcH8w9cbm9IlfUI5C7JeT2zi5Y1IUHboOjJYKSbm5qdIAEGhEC8RLKix/ukRqsQKB4YQ+aSMnJHENo6wJqDwUb2CcghJJH732VmzQIeaSCg7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750343927; c=relaxed/simple;
	bh=BGP1A6f3/Dqys8p7Pn58ETLdExSqOMon07m/48hsYtM=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f4C2owCEBycnLCg5xGNgopXYBen1B02XzyMccvl+19C7ZN+JxeUjAdDhh8qkhrxuKkkhrNkW9gu3SPfzaD5ak8i/6rv1W91I6REzcMTJ02bheMQlMeOezcDHXKb0CTfy4TafTglaQ9X2q0P74wGiwj6T31WuvAjsSMReZIv5CSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hpWRAhTO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55J9PowR013681
	for <linux-media@vger.kernel.org>; Thu, 19 Jun 2025 14:38:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D6g2LQnnqCuGuYwp8e+2Z2go0IbbPglNWca9WgcobOA=; b=hpWRAhTOhrYNvd1D
	pLKHopW7D44aeOac+ScU40L0IbvN1qV/splVgdfV9n45SN2Cq+372AuD4ULQdm8O
	i+UFbrRx+9B0PrAir5P+uv7vOF5Oc7J3iCo6bvEAXF/zzzi5/x086hKwU4fgBFwt
	SMX/9kXSQoWrCSe1BvnrClSFkMun4cEBV1C11Ji7bZJAyUCxEGgUuJA3u9S4MS3O
	Wa7x4WaplWO6SoSH77wMoFvnoT2F1qRbN4BwLMy4vBdR+xYDjBSKNkJUZ68LDGuo
	kMMp5F3ubpGMf8R5NP7A4dUptPLuETimQcpIoNQEOYnmYT/YAEP5RvgCyqSrytGp
	hdJh8g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 479qp5xxcd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 19 Jun 2025 14:38:44 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d09bc05b77so146828085a.1
        for <linux-media@vger.kernel.org>; Thu, 19 Jun 2025 07:38:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750343923; x=1750948723;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D6g2LQnnqCuGuYwp8e+2Z2go0IbbPglNWca9WgcobOA=;
        b=wNHOGsMS9e0frSzAU4i4+zMZO46E30tNjo0P3kQFSi1YBCJyB80JKECU6xdEvFEcu+
         3sS3h4wAnLRBLrUrA9yKX7Dtd0IdjjlGUiIGBvdkCtXTtLVvM8ymJ+Si8cfphzNpcRJb
         Xm5ZavU3B26fj304clP/apYnXkUI3SBaWImU2XJUOdl6HTNnkunnXg3a4JH17bzpUlTx
         QRvTyblFvXLZfqnQg2f0EEduyn0R+ajmADG+ywfyEKAnU3fhhor4zFnd8j6f95bRes0u
         LQC+vRQI9ZmtZR+fqfyXvSSsTCacjlyMaihrD1lr6cA8w6JsUtMlleD5c56Nw6Nx1CF/
         Hn3g==
X-Forwarded-Encrypted: i=1; AJvYcCWLoMVGCMd1dDg9TzR9X5x+ziRlf7DxUJGmQ5KiAPWISp+/+AFrJ/X650h0kfDVVlVrWuBaZozoeP1Zyw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5J9H29WzGAh2z76TOsdfVW+Sqb8vlwlXa/6p4CIR5QlmCyvA0
	sTI8BwFzdPzxAXqjNru+RDmPBfZd4+zTmivezz+OT8juaSNWhdypUb3peDM8dSz2Q/s7JBQqEc9
	i2e6L8ETikAu7ErT5DWC1lTubC9eBDT0T20XpH56j5xxhjo9G5SByUV0xFLQquuPNsw==
X-Gm-Gg: ASbGncs+FLjPqxDmGhcsYcKmYxdan6lNkmfl0aEU/zRT/Ny0tkP5mXJ94Pv4FfnOhZa
	i4PjeDtx+f4itcxyZuJh34hlRbz95b58jBAAkmowjL2juunUcS3f6qQxyKsQKxaPDBIixqgtiVO
	76HWojra3BaiOy3Wad8WKokvECbj8BjhR16SXKE2lbmJ+k0Ij2nRkw5vzg4D0rlodKj8FGR4Gd/
	zFruC9gNvi3t83FWBkg0PCti5dbwUls77AiB6WflCHsfJkAY3DGUrfgG/vT+TKu/VX+aU2wjE4b
	LTULVSWatrKt6f4c2uomMInDmXFOq+NrBVarB/MczUP3Oc4Novjt6K7HnA==
X-Received: by 2002:a05:620a:400c:b0:7ca:f447:c676 with SMTP id af79cd13be357-7d3c6cf665fmr3325320785a.43.1750343922638;
        Thu, 19 Jun 2025 07:38:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHtbDwfaodiDTGqJBEvXdKxXmsKJ3Vx35CJzmDGhrgDBeYHWSnT/CP7FfnMC4RhtN0mIbVagg==
X-Received: by 2002:a05:620a:400c:b0:7ca:f447:c676 with SMTP id af79cd13be357-7d3c6cf665fmr3325315585a.43.1750343922045;
        Thu, 19 Jun 2025 07:38:42 -0700 (PDT)
Received: from trex (132.red-79-144-190.dynamicip.rima-tde.net. [79.144.190.132])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535e98b53esm30470755e9.17.2025.06.19.07.38.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 07:38:41 -0700 (PDT)
From: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
X-Google-Original-From: Jorge Ramirez <JorgeRamirez-Ortiz>
Date: Thu, 19 Jun 2025 16:38:35 +0200
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        quic_vgarodia@quicinc.com, quic_dikshita@quicinc.com,
        mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        stanimir.k.varbanov@gmail.com, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 0/7] media: venus: Add QCM2290 support with AR50_LITE
 core
Message-ID: <aFQg6x+FxXDY4P5m@trex>
References: <20250613140402.3619465-1-jorge.ramirez@oss.qualcomm.com>
 <20250619142012.1768981-1-jorge.ramirez@oss.qualcomm.com>
 <672b5db1-e045-4625-bad6-83224c27c07f@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <672b5db1-e045-4625-bad6-83224c27c07f@linaro.org>
X-Proofpoint-GUID: AEMxKTnun7JXfD6F0E9DUK41FUdeDuke
X-Proofpoint-ORIG-GUID: AEMxKTnun7JXfD6F0E9DUK41FUdeDuke
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE5MDEyMSBTYWx0ZWRfX20d/cXKCI5U1
 onX+vtsx0ElbDApoLcqm5sLik8W+dSsTPaVqZUJv3VednesSHPF/AhucQIZnKNY0D8B6L7Pt/K1
 /3C+ysANLoVLbzvIWLr7qOX5huQyj46Zh1nZoBkfhmug2ZNZeCDk9XIMDKvn9iwvShAErxu7/hx
 GBYCmSMUwCmypOwEPWuBuKvJMJ1rNyjg+tgJ1zuINSllVLWMfI6C1gSFFPTGq1D8C/i45NPIvCe
 ujsIaHwr0bwYTPZ2m1xL+kn8gYg8pG96aSazRgm38+Joh1rshvRdyd4vYx+aSYQvtkAOF2EdkwI
 9SVff6TvXccRHwC4Zj5ltW9zr7IVVlRaHEf1VyeriosU9plmSayoeTJcr690colA0Kt/mbk0ymI
 LkON8iuVpy6Mc4n11oCM0SNZQwN6gf4D9Z2ilr/WJhZkKgPwbISXcC7CGmpDvMq4Q6aJxOVh
X-Authority-Analysis: v=2.4 cv=fMc53Yae c=1 sm=1 tr=0 ts=685420f4 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=wjE3nLva0YkvARyJ+Gfmxg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=vaIsIKZIAAAA:8 a=atVKquzB7ZhheazsFkIA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=rh-XPM1-DYv4t-UOgbwD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-19_05,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 mlxlogscore=999 spamscore=0 lowpriorityscore=0 impostorscore=0 mlxscore=0
 priorityscore=1501 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506190121

On 19/06/25 15:29:02, Bryan O'Donoghue wrote:
> On 19/06/2025 15:20, Jorge Ramirez-Ortiz wrote:
> > Changes since v1:
> > - Add IS_HFI macro usage
> > - Move schema patch to top
> > - Fix commit messages
> > 
> > This patch series adds support for the Venus video decoder/encoder block
> > present on the Qualcomm QCM2290.
> > 
> > The QCM2290 integrates an AR50_LITE core, a low-power implementation of
> > Venus supporting H.264, HEVC (H.265), and VP9 decoding.
> > 
> > The series includes:
> >    • DT binding schema for qcom,qcm2290-venus
> >    • SoC integration via qcm2290.dtsi
> >    • Resource table definitions and frequency scaling
> >    • Platform capability registration for the AR50_LITE core
> > 
> > Decoding was verified on the QCOM RB1 platform using GStreamer with V4L2-based
> > decode plugins. The following pipelines were used for playback 1280x720 and
> > 1920x1080 H.264, HVEC and VP9 videos from https://www.elecard.com/videos.
> > 
> > [H.264]
> > gst-launch-1.0 filesrc location=videos/xxxxx.mp4 \
> >    ! qtdemux name=demux demux.video_0 ! queue ! h264parse ! v4l2h264dec \
> >    ! videoconvert ! autovideosink
> > 
> > [H.265]
> > gst-launch-1.0 filesrc location=videos/xxxxx.mp4 \
> >    ! qtdemux name=demux demux.video_0 ! queue ! h265parse ! v4l2h265dec \
> >    ! videoconvert ! autovideosink
> > 
> > [VP9]
> > gst-launch-1.0 filesrc location=videos/xxxxx.webm \
> >    ! matroskademus ! queue ! v4l2vp8dec \
> >    ! videoconvert ! autovideosink
> > 
> > ---
> > 
> > Jorge Ramirez-Ortiz (7):
> >    dt-bindings: media: venus: Add qcm2290 dt schema
> >    media: venus: helpers: add IS_VPU() and IS_HFI() macros
> >    media: venus: use IS_HFI() macro for multi-version check
> >    media: venus: vdec: AR50_LITE video core support
> >    media: venus: hfi_plat_v6_lite: Populate decode capabilities
> >    media: venus: core: Add qcm2290 DT compatible and resource data
> >    arm64: dts: qcom: qcm2290: Add venus video node
> > 
> >   .../bindings/media/qcom,qcm2290-venus.yaml    | 117 ++++++++++++++
> >   arch/arm64/boot/dts/qcom/qcm2290.dtsi         |  45 ++++++
> >   drivers/media/platform/qcom/venus/Makefile    |   2 +-
> >   drivers/media/platform/qcom/venus/core.c      |  51 +++++-
> >   drivers/media/platform/qcom/venus/core.h      |  28 +++-
> >   drivers/media/platform/qcom/venus/firmware.c  |   8 +-
> >   drivers/media/platform/qcom/venus/helpers.c   |  81 ++++++++++
> >   drivers/media/platform/qcom/venus/helpers.h   |   2 +
> >   .../media/platform/qcom/venus/hfi_helper.h    |  10 +-
> >   .../media/platform/qcom/venus/hfi_platform.c  |   2 +
> >   .../media/platform/qcom/venus/hfi_platform.h  |   1 +
> >   .../qcom/venus/hfi_platform_v6_lite.c         | 148 ++++++++++++++++++
> >   drivers/media/platform/qcom/venus/hfi_venus.c |  19 ++-
> >   .../media/platform/qcom/venus/pm_helpers.c    |   1 +
> >   drivers/media/platform/qcom/venus/vdec.c      |  17 +-
> >   15 files changed, 504 insertions(+), 28 deletions(-)
> >   create mode 100644 Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
> >   create mode 100644 drivers/media/platform/qcom/venus/hfi_platform_v6_lite.c
> > 
> 
> Please fix the following.
> 
> ~/my-environment/bin/checkset.sh
> WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
> #16:
> new file mode 100644
> 
> total: 0 errors, 1 warnings, 0 checks, 117 lines checked
> 
> NOTE: For some of the reported defects, checkpatch may be able to
>       mechanically convert to the typical style using --fix or
> --fix-inplace.
> 
> 0001-dt-bindings-media-venus-Add-qcm2290-dt-schema.patch has style problems,
> please review.
> 
> NOTE: If any of the errors are false positives, please report
>       them to the maintainer, see CHECKPATCH in MAINTAINERS.
> CHECK: Macro argument reuse 'core' - possible side-effects?
> #33: FILE: drivers/media/platform/qcom/venus/core.h:537:
> +#define MATCH_2(CMD, core, a, b) \
> +	(IS_##CMD##_MATCH(core, a) || IS_##CMD##_MATCH(core, b))
> 
> CHECK: Macro argument reuse 'core' - possible side-effects?
> #35: FILE: drivers/media/platform/qcom/venus/core.h:539:
> +#define MATCH_3(CMD, core, a, b, c) \
> +	(IS_##CMD##_MATCH(core, a) || IS_##CMD##_MATCH(core, b) || \
> +	IS_##CMD##_MATCH(core, c))
> 
> CHECK: Macro argument reuse 'core' - possible side-effects?
> #38: FILE: drivers/media/platform/qcom/venus/core.h:542:
> +#define MATCH_4(CMD, core, a, b, c, d) \
> +	(IS_##CMD##_MATCH(core, a) || IS_##CMD##_MATCH(core, b) || \
> +	IS_##CMD##_MATCH(core, c) || IS_##CMD##_MATCH(core, d))

um ok, I'll rename core, makes sense.

> 
> WARNING: Argument '_1' is not used in function-like macro
> #42: FILE: drivers/media/platform/qcom/venus/core.h:546:
> +#define GET_MACRO(_1, _2, _3, _4, NAME, ...) NAME /* _1-_4 are ignored */
> 
> WARNING: Argument '_2' is not used in function-like macro
> #42: FILE: drivers/media/platform/qcom/venus/core.h:546:
> +#define GET_MACRO(_1, _2, _3, _4, NAME, ...) NAME /* _1-_4 are ignored */
> 
> WARNING: Argument '_3' is not used in function-like macro
> #42: FILE: drivers/media/platform/qcom/venus/core.h:546:
> +#define GET_MACRO(_1, _2, _3, _4, NAME, ...) NAME /* _1-_4 are ignored */
> 
> WARNING: Argument '_4' is not used in function-like macro
> #42: FILE: drivers/media/platform/qcom/venus/core.h:546:
> +#define GET_MACRO(_1, _2, _3, _4, NAME, ...) NAME /* _1-_4 are ignored */


about the warnings there is nothing that can be done - those parameters
as per the comments are necessarily ignored - that is the way the macro
is supposed to work.

can we not live with them? otherwise I cant do it in a nice way.

> 
> total: 0 errors, 4 warnings, 3 checks, 29 lines checked
> 
> NOTE: For some of the reported defects, checkpatch may be able to
>       mechanically convert to the typical style using --fix or
> --fix-inplace.
> 
> 0002-media-venus-helpers-add-IS_VPU-and-IS_HFI-macros.patch has style
> problems, please review.
> 
> NOTE: If any of the errors are false positives, please report
>       them to the maintainer, see CHECKPATCH in MAINTAINERS.
> total: 0 errors, 0 warnings, 0 checks, 16 lines checked
> 
> 0003-media-venus-use-IS_HFI-macro-for-multi-version-check.patch has no
> obvious style problems and is ready for submission.
> CHECK: Macro argument reuse 'core' - possible side-effects?
> #79: FILE: drivers/media/platform/qcom/venus/core.h:525:
> +#define IS_V6(core)     (((core)->res->hfi_version == HFI_VERSION_6XX) || \
> +			 ((core)->res->hfi_version == HFI_VERSION_6XX_LITE))
> 
> CHECK: Blank lines aren't necessary before a close brace '}'
> #153: FILE: drivers/media/platform/qcom/venus/helpers.c:254:
> +
> +}

ok, will remove core from macros

> 
> CHECK: Unnecessary parentheses around 'buftype != HFI_BUFFER_INPUT'
> #215: FILE: drivers/media/platform/qcom/venus/helpers.c:709:
> +		if ((buftype != HFI_BUFFER_INPUT) &&
> +		    (buftype != HFI_BUFFER_OUTPUT) &&
> +		    (buftype != HFI_BUFFER_OUTPUT2))
> 
> CHECK: Unnecessary parentheses around 'buftype != HFI_BUFFER_OUTPUT'
> #215: FILE: drivers/media/platform/qcom/venus/helpers.c:709:
> +		if ((buftype != HFI_BUFFER_INPUT) &&
> +		    (buftype != HFI_BUFFER_OUTPUT) &&
> +		    (buftype != HFI_BUFFER_OUTPUT2))
> 
> CHECK: Unnecessary parentheses around 'buftype != HFI_BUFFER_OUTPUT2'
> #215: FILE: drivers/media/platform/qcom/venus/helpers.c:709:
> +		if ((buftype != HFI_BUFFER_INPUT) &&
> +		    (buftype != HFI_BUFFER_OUTPUT) &&
> +		    (buftype != HFI_BUFFER_OUTPUT2))
>

yeah, ok

> total: 0 errors, 0 warnings, 5 checks, 314 lines checked
> 
> NOTE: For some of the reported defects, checkpatch may be able to
>       mechanically convert to the typical style using --fix or
> --fix-inplace.
> 
> 0004-media-venus-vdec-AR50_LITE-video-core-support.patch has style problems,
> please review.
> 
> NOTE: If any of the errors are false positives, please report
>       them to the maintainer, see CHECKPATCH in MAINTAINERS.
> 0004-media-venus-vdec-AR50_LITE-video-core-support.patch:64: bufferes ==>
> buffers, buffered
> 0004-media-venus-vdec-AR50_LITE-video-core-support.patch:65: bufferes ==>
> buffers, buffered
> WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
> #57:
> new file mode 100644
> 
> total: 0 errors, 1 warnings, 0 checks, 171 lines checked
> 
> NOTE: For some of the reported defects, checkpatch may be able to
>       mechanically convert to the typical style using --fix or
> --fix-inplace.
> 
> 0005-media-venus-hfi_plat_v6_lite-Populate-decode-capabil.patch has style
> problems, please review.
> 
> NOTE: If any of the errors are false positives, please report
>       them to the maintainer, see CHECKPATCH in MAINTAINERS.
> total: 0 errors, 0 warnings, 0 checks, 52 lines checked
> 
> 0006-media-venus-core-Add-qcm2290-DT-compatible-and-resou.patch has no
> obvious style problems and is ready for submission.
> total: 0 errors, 0 warnings, 0 checks, 51 lines checked
> 
> 0007-arm64-dts-qcom-qcm2290-Add-venus-video-node.patch has no obvious style
> problems and is ready for submission.
>  ~/Development/worktree/merges/linux-6.17-media-platform-qcom-next
> (linux-6.17-media-platform-qcom-next*) [03:28:03]
> deckard$
>

ah thanks, was just going to ask

> deckard$ cat ~/my-environment/bin/checkset.sh
> #!/bin/sh
> if [ -z "$KERNELPATH" ]
> then
> 	echo "Setting KERNELPATH to this directory which is probably what you want"
> 	echo "Please set KERNELPATH when running this utility to over-ride";
> 	echo "KERNELPATH=`pwd` ~/my-environment/bin/checkset.sh"
> 	KERNELPATH=`pwd`
> fi
> for file in *.patch;
> do $KERNELPATH/scripts/checkpatch.pl --strict $file;
> codespell $file;
> done
> 
> ---
> bod

