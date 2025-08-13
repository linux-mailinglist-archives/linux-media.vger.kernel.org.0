Return-Path: <linux-media+bounces-39849-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0894CB2568F
	for <lists+linux-media@lfdr.de>; Thu, 14 Aug 2025 00:22:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 664DF1B68415
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 22:23:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07AFF302773;
	Wed, 13 Aug 2025 22:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U4LVdK1L"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADAB9302757
	for <linux-media@vger.kernel.org>; Wed, 13 Aug 2025 22:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755123758; cv=none; b=T7weamMU5Ve0zQx3xgF5MDbBZswu4RVp64mt9GO+KFW1QKSkN6AqfQmsozkkWt5jZM4q+1kUFT6dEvquq6sO3YUgNKxUAJAEOpX3qaxM+7cfjMOSXui+J9jqgX9EmVyHQrjlQN7RUFNj5VopKrwF9DWfu2aRRxC6Lh75FfGLZi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755123758; c=relaxed/simple;
	bh=T/SGwaMfXrF1bXxicOlsB1ZOTMLVelVb9l2vXWgH/E0=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gffa6IVHFxr+ZvR3hdaWAcbKq97druO+3ofjrqZ9CkA/4peOlhq4xWoDlJP7EZEyG4Eq6NQLJ8PtXHNoaow4HaXF7rVSoMwz/US9F0icZKzuVmHQ5wPUVqBx11qg4Y6QzMIqmY+6JR34vHiawR0HGTy8PPbnkwCORBVfWmXkn24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U4LVdK1L; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57DBMCfs012072
	for <linux-media@vger.kernel.org>; Wed, 13 Aug 2025 22:22:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=o1cYkEieUZMmqpez32owx3YR
	yhkiCuuVSx4jJwniAO8=; b=U4LVdK1LhU06l/fL5W7/ZeCPiHvTUdLqnbwaYY6m
	XmU6LSqPakkPt+IvOUh/NAsQlHqrtSxKfvcwxoGz0nr+Wc27MKFoYKROHJr6Tna6
	FwwbzbfD6OFcmGSSPFkqaIlQrzosTVjtpRk3mz23G6YtR+6mMsmrkbVafT7qWaHE
	lJumdduIxQrjpc3dlT9zK7jBalmhi++9dpIp2Tq2jM/tI8iRzPOy0B4GhxB0SrfS
	Ja2PSD1pQWSy8Mep1PPdnwQlfziZwcsHI/XQP6NDly3rMveFsLlC2MkO+X3nhDHi
	p9o8MrdoVnegFwHId+UkGpErEJLQPQJut5nd9ZHAsOD4dQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48fjxbgkhj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 13 Aug 2025 22:22:34 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b10992cfedso7595951cf.0
        for <linux-media@vger.kernel.org>; Wed, 13 Aug 2025 15:22:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755123753; x=1755728553;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o1cYkEieUZMmqpez32owx3YRyhkiCuuVSx4jJwniAO8=;
        b=eDpkxc9y8ngBzWugCUf6mbxAFExuV2FCs/w9jAzo9GXJf+mlo/HUSRcN31e9XguCmD
         VUtayJyeqeYnwZ9nD7c6aBrNiglh+SaKbr//ALiRjbQRT4rLRF13W2Nx3FCFdZiV9w9Y
         Pg/ZTYJyknJy16NzCahwXATuVu7U2bLtUyF3LjsMBnH+Ax6jbTP/Y6+VgCKZCC0sUZbY
         Q4tFyKP3OmOAYZZVqKD5ZSMALIN0SbffYhYj7Yy8EPDHn5FmRVDlO47lV3AWV50gqC4O
         O+YMYTL55vvQdlbFCR4/t9eMf7KgqX5uFSijeDm5nqFdqVstHtFVyD+p8d7HhmMnA/+m
         R2dA==
X-Forwarded-Encrypted: i=1; AJvYcCW6sp3pkdtSvepUzizTCVvaNHxxhDRflrYXkfK2sV9eldCKjPyV3q0DeiZquJv7cuBRUtsjFS51boU/Qg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxwl3Ir7CrPBd6t+41qVIjo02qUgC4hH5ZtotYzgp22rsJHz91x
	2LemYz5dbTmFh4TBAMXd9t22xudM1At1eUIYeJVOW37tMHBZoBix5m+2pLJy7dBpth0ebqiWk4x
	+W/Hg4d9Q5ecw2lDcU1pGx0zRLpG8cfiDhDdA6cmZicbANCKBgiCVOUvlKJrTwtSWHA==
X-Gm-Gg: ASbGncuZ5wwFgl2POWRRCQ9iUfjzOaQl1+zaL2aaf9+IcMVJ7/q3eA7JJ3rKpxWmdng
	fn0Wc3IV1q+eM4GaLWtTxx4GAS0s8J0bTLPumDskEw8XPoLreKPsRI2gagckXjcoCj+Ojo4BWMT
	bmIISNKkfMz8VYDA4Z857wZBF1ET8DXfMNLrDt8D97CfufIKByDgoeP4trehS64LvPgpQei9d2w
	Y3RfmSVTBFm8u7T+CkrvIbyVyp6T0+4N8XEIf989RdMCXDL6hnn60J68cRVjRSEkoPGJShGFV2W
	wMIHWS06Imm/D39XL6P6/gOXplcSdARSmWjIa39Bt+dgPFJfRXVpKy52GMPluHoHBCQTgw==
X-Received: by 2002:a05:622a:5a94:b0:4af:1fbb:3a05 with SMTP id d75a77b69052e-4b10ab5a389mr12494211cf.58.1755123752759;
        Wed, 13 Aug 2025 15:22:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGaxPEjQyJQ6o/mgCIfbeTTRM8PU2ScmkTbSFgBElLqrY5BnMLPp015dIpOLiCTnldhIUVmXw==
X-Received: by 2002:a05:622a:5a94:b0:4af:1fbb:3a05 with SMTP id d75a77b69052e-4b10ab5a389mr12493531cf.58.1755123751953;
        Wed, 13 Aug 2025 15:22:31 -0700 (PDT)
Received: from trex (205.red-83-60-94.dynamicip.rima-tde.net. [83.60.94.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a1b7de201sm1731495e9.2.2025.08.13.15.22.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 15:22:31 -0700 (PDT)
From: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
X-Google-Original-From: Jorge Ramirez <JorgeRamirez-Ortiz>
Date: Thu, 14 Aug 2025 00:22:29 +0200
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        quic_vgarodia@quicinc.com, quic_dikshita@quicinc.com,
        krzk+dt@kernel.org, konradybcio@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, mchehab@kernel.org, robh@kernel.org,
        andersson@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 0/8] media: venus: Add QCM2290 support with AR50_LITE
 core
Message-ID: <aJ0QJVnafFf/S0EF@trex>
References: <20250808085300.1403570-1-jorge.ramirez@oss.qualcomm.com>
 <bd8a88f1-403d-4089-b174-f62ba69e188f@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bd8a88f1-403d-4089-b174-f62ba69e188f@linaro.org>
X-Authority-Analysis: v=2.4 cv=G6EcE8k5 c=1 sm=1 tr=0 ts=689d102a cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=Rr2dNH5/fcnoRoBmcVUeRg==:17
 a=kj9zAlcOel0A:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=vaIsIKZIAAAA:8 a=e5mUnYsNAAAA:8 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8
 a=QX4gbG5DAAAA:8 a=xOd6jRPJAAAA:8 a=IshgZdoXynrtvxtMmcwA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=rh-XPM1-DYv4t-UOgbwD:22 a=Vxmtnl_E_bksehYqCbjh:22
 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA5NyBTYWx0ZWRfX4iLVgADYEvDc
 0kLZFBRZjlXPp0RizxwVvmbqLRGh5P3/K5yi9wBvFKU131x48Ajy4ga/1M6ZWqKxk3oSzTKcmfY
 6nGEY08nem1/L717W6yyo2PmHvsHHB0AgvHJGV3Igytv8lq+XYS0htpvkOSpzxJpdcM585y1gL+
 alpykU8iY0L+10A/RP1IXXzPgXFdXvJTIUoS8v68jhPoxaqpweXsMc9uZQLtm8ASk34FDIWqscQ
 k3Zln/909VLzU7K2vWyMhWyMkUAoXjd0ZSMS2wV2B9LclkG1OSpDLI5pmSCREJoT4rXQjeepbIL
 xPBI7ksGLTgRj4Q1jzyi0/rPLfWFktmwSpkDu3I0ld5XZ2QltI4BGjtJuXO/QCW09cTYkrIBp0y
 d2ylW7D3
X-Proofpoint-ORIG-GUID: LqVc_N39Kg0ksiaVE2XUcmLU7s95dDq9
X-Proofpoint-GUID: LqVc_N39Kg0ksiaVE2XUcmLU7s95dDq9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 bulkscore=0 spamscore=0 phishscore=0
 malwarescore=0 adultscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508110097

On 13/08/25 23:18:04, Bryan O'Donoghue wrote:
> On 08/08/2025 09:52, Jorge Ramirez-Ortiz wrote:
> > Changes since v8:
> >    v8: https://lore.kernel.org/all/20250805064430.782201-1-jorge.ramirez@oss.qualcomm.com/
> > -  patch 1/8: Add qcm2290 dt schema
> >    - no change
> > - patch 2/8: media: venus: Define minimum valid firmware version
> >    - dev_err on failure
> > - patch 3/8: Add framework to support for AR50 LITE video core
> >    - pass core rather than the lite property to the hfi platform
> >    - remove warnings
> > - patch 4/8: HFI platform V4 capabilities
> >    -no change
> > - patch 5/8: Sort dt_match alphabetically
> >    - new
> > - patch 6/8: Add DT compatible and capabilities
> >    - sort dt_match alphabetically
> > - patch 7/8: Add Venus video node for 2290
> >    - Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> > - patch 8/8: Enable Venus on 2210 RB1 board
> >    - Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> > 
> > Changes since v7:
> >    v7: https://lore.kernel.org/all/20250715204749.2189875-1-jorge.ramirez@oss.qualcomm.com/
> > -  patch 1/7: Add qcm2290 dt schema
> >    - extend commit message to cover IOMMU order, remove iommus minItems, alphabetic order for includes
> >    - added myself as the file maintainer
> > -  patch 2/7: media: venus: Define minimum valid firmware version
> >    - Replaces previous patch that was able to distinguish encoder vs decoder firmware version support
> >    - Now it is an all or nothing implementation (the firmware either support enc and dec or it doesn't)
> > - patch 3/7: Add Support for AR50 LITE video core
> >    - remove EOS support for older firmwares since we will drop support for fw < 6.0.55
> > - patch 4/7: HFI platform V4 capabilities
> >    - remove some hardcoded values and some ternary operations
> >    - added reviewed by Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> > - patch 5/7: Add DT compatible and capabilities
> >    - only min_fw now required since we dont support encode/decode indepedently after 2/7
> >    - added reviewed by Dikshita Agarwal <quic_dikshita@quicinc.com>
> > - patch 6/7: Add Venus video node for 2290
> >    - no change
> > - patch 7/7: Enable Venus on 2210 RB1 board
> >    - fix alphabetical order
> > 
> > Changes since v6:
> >    v6: https://lore.kernel.org/all/20250708180530.1384330-1-jorge.ramirez@oss.qualcomm.com/
> > - patch 1/7: Add qcm2290 dt schema
> >    - no change
> > - patch 2/7: Conditionally register video nodes
> >    - fixed potential NULL dereference on handling firmware errors when the encoder is not present.
> > - patch 3/7: Add Support for AR50 LITE video core
> >    - applied Dikshita Agarwal review comments: do not handle no-tz case, fix WD mask
> >    - replaced EOS buffers for a work around (firmware should not access the eos buffers)
> >       renamed venus_helper_alloc_eos_buf to venus_helper_prepare_eos_data
> > - patch 4/7: HFI platform V4 capabilities
> >    - removed 10 bit encoder support as per Dikshita Agarwal review
> > - patch 5/7: Add DT compatible and capabilities
> >    - removed frequency table as per Konrad Dybcio review (driver now uses opp)
> >    - fixed bw_tables for the supported loads (remove 10 bit support)
> > - patch 6/7: Add Venus video node for 2290
> >    - no change
> > - patch 7/7: Enable Venus on 2210 RB1 board
> >    - no change
> > 
> > Changes since v5:
> >    Two additional new patches added to the set to support video encoding.
> > 
> > - patch 1/7: Add qcm2290 dt schema
> >    - added reviewed by: Bryan O'Donoghue
> >    - added reviewed by: Krzysztof Kozlowski
> > - patch 2/7: Conditionally register video nodes
> >    - new functionality required to support AR50_LITE
> > - patch 3/7: Add Support for AR50 LITE video core
> >    - completely rewritten - lite platforms are extensions of previous HFI_XXX
> > - patch 4/7: HFI platform V4 capabilities
> >    - use HFI 4XX instead of HFI 6XX as per review
> > - patch 5/7: Add DT compatible and capabilities
> >    - added reviewed by: Bryan O'Donoghue
> >    - enabled new option min_fw_version
> > - patch 6/7: Add Venus video node for 2290
> >    - added reviewed by: Konrad Dybcio
> >    - removed status property
> > - patch 7/7: Enable Venus on 2210 RB1 board
> >    - new
> > 
> > Changes since v4:
> > - patch 1/5:
> >    - added reviewed by: Krzysztof Kozlowski
> >    - updated example section
> > - patch 2/5:
> >    - added reviewed by: Bryan O'Donoghue
> >    - Fixed Co-developed-by order
> > - patch 3/5:
> > - patch 4/5:
> >   - removed encode-node (userspace exposure)
> >   - fixed Co-developed-by order
> > - patch 5/5:
> >   - fixed venus register region
> >   - power-domain-names: one per line
> >   - clock-names: one per line
> >   - fixed interconnect tags
> >   - empty line before subnode
> >   - enable the venus node
> > 
> > Changes since v3:
> > - Fixed schema commit subject.
> > 
> > Changes since v2:
> > - Removed IS_HFI/IS_VPU macros
> > - checkpatch.pl --strict fixes:
> >    - convert macro to static inline to avoid argument reuse side effect
> > 
> > Changes since v1:
> > - Added IS_HFI macro usage
> > - Moved schema patch to top
> > - Fixed commit messages
> > 
> > This patch series adds support for the Venus video decoder/encoder block
> > present on the Qualcomm QCM2290.
> > 
> > This series functionally depends on the following patch:
> > 
> >    clk: qcom: gcc-qcm2290: Set HW_CTRL_TRIGGER for video GDSC
> >    https://lore.kernel.org/all/20250613102245.782511-1-loic.poulain@oss.qualcomm.com/
> > 
> > Please ensure the above patch is applied before this series.
> > 
> > The QCM2290 integrates an AR50_LITE core, a low-power implementation of
> > Venus supporting H.264, HEVC (H.265), and VP9 decoding as well as H.264
> > and H.265 encoding.
> > 
> > The series includes:
> >    - DT binding schema for qcom,qcm2290-venus
> >    - SoC integration via qcm2290.dtsi
> >    - Resource table definitions and frequency scaling
> >    - Platform capability registration for the AR50_LITE core decoding block.
> > 
> > Limitations:
> >    - The hardware does not support concurrent operation at FullHD.
> >    - Encoding is not supported in firmware version before 6.0.54
> > 
> > Firmware:
> >    - This code has been tested with 6.0.52, 6.0.53, 6.0.54-PRERELEASE
> > 
> > Some basic Tests:
> > 
> > Decoding and Encoding were verified on the QCOM RB1 platform using
> > GStreamer with V4L2-based decode plugins.
> > 
> > The following pipelines were used for playback 1280x720 and 1920x1080
> > H.264, HEVC and VP9 videos from https://www.elecard.com/videos.
> > 
> > Decoding:
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
> >    ! matroskademux ! queue ! v4l2vp9dec \
> >    ! videoconvert ! autovideosink
> > 
> > Encoding:
> > [H.264]
> > gst-launch-1.0 videotestsrc num-buffers=30 \
> >    ! video/x-raw,width=1280,height=720,framerate=30/1 \
> >    ! v4l2h264enc ! h264parse ! mp4mux ! filesink location=/tmp/output.mp4
> > 
> > [H.265]
> > gst-launch-1.0 videotestsrc num-buffers=30 \
> >    ! video/x-raw,width=1920,height=1080,framerate=30/1 \
> >    ! v4l2h265enc ! h265parse ! mp4mux ! filesink location=/tmp/output.mp4
> > 
> > Concurrency:
> > gst-launch-1.0 -v videotestsrc num-buffers=1000 \
> >    ! video/x-raw,format=NV12,width=1280,height=720,framerate=30/1 \
> >    ! v4l2h264enc capture-io-mode=4 output-io-mode=2 ! h264parse \
> >    ! v4l2h264dec capture-io-mode=4 output-io-mode=2 ! videoconvert \
> >    ! autovideosink
> > 
> > [Fluster]
> > The H.264 decoder was also tested using the Fluster test suite
> > (version: v0.4.0-12-g33566abd0964).
> >   Target: GStreamer-H.264-V4L2-Gst1.0, Test Suite: JVT-AVC_V1
> >   Result: 126/135 tests passed
> >   Failures:
> >   FM1_BT_B, FM1_FT_E, FM2_SVA_C, BA3_SVA_C, SP1_BT_A,
> >   SP2_BT_B, MR6_BT_B, MR7_BT_B, MR8_BT_B
> > 
> > ---
> > 
> > Jorge Ramirez-Ortiz (8):
> >    media: dt-bindings: venus: Add qcm2290 dt schema
> >    media: venus: Define minimum valid firmware version
> >    media: venus: Add framework support for AR50_LITE video core
> >    media: venus: hfi_plat_v4: Add capabilities for the 4XX lite core
> >    media: venus: core: Sort dt_match alphabetically.
> >    media: venus: core: Add qcm2290 DT compatible and resource data
> >    arm64: dts: qcom: qcm2290: Add Venus video node
> >    arm64: dts: qcom: qrb2210-rb1: Enable Venus
> > 
> >   .../bindings/media/qcom,qcm2290-venus.yaml    | 130 ++++++++++++
> >   arch/arm64/boot/dts/qcom/qcm2290.dtsi         |  55 +++++
> >   arch/arm64/boot/dts/qcom/qrb2210-rb1.dts      |   4 +
> >   drivers/media/platform/qcom/venus/core.c      | 109 +++++++---
> >   drivers/media/platform/qcom/venus/core.h      |  18 +-
> >   drivers/media/platform/qcom/venus/firmware.c  |  30 +++
> >   drivers/media/platform/qcom/venus/firmware.h  |   2 +
> >   drivers/media/platform/qcom/venus/helpers.c   |  12 +-
> >   .../media/platform/qcom/venus/hfi_parser.c    |   2 +-
> >   .../media/platform/qcom/venus/hfi_platform.c  |  23 ++-
> >   .../media/platform/qcom/venus/hfi_platform.h  |  34 ++--
> >   .../platform/qcom/venus/hfi_platform_v4.c     | 188 ++++++++++++++++--
> >   .../platform/qcom/venus/hfi_platform_v6.c     |  33 ++-
> >   drivers/media/platform/qcom/venus/hfi_venus.c |  25 ++-
> >   .../media/platform/qcom/venus/hfi_venus_io.h  |   4 +
> >   .../media/platform/qcom/venus/pm_helpers.c    |   2 +-
> >   16 files changed, 582 insertions(+), 89 deletions(-)
> >   create mode 100644 Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
> > 
> 
> Trying to apply your series and getting a few or more than one splat anyway,
> on media-comitters/next
> 
> Could you fix this series and test up as a V10 ?

sure, let me rebase and retest.

FYI when I posted I applied it on top


    media: rkvdec: Unstage the driver
    
    The TODO list for unstaging being empty, the driver can now be moved to the
    main media folder.
    
    Also add myself as maintainer.
    
    Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
    Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
    Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
    Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>


> 
> https://gitlab.freedesktop.org/linux-media/users/bodonoghue/-/commits/b4/bod-media-committers-next-platform-qcom-6.17-rc1
> 
> ---
> bod
> 
> 

