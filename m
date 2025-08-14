Return-Path: <linux-media+bounces-39873-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 83C71B25F9F
	for <lists+linux-media@lfdr.de>; Thu, 14 Aug 2025 10:53:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8C39F1CC1AB8
	for <lists+linux-media@lfdr.de>; Thu, 14 Aug 2025 08:53:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FF1C2E8E13;
	Thu, 14 Aug 2025 08:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NtUVvSi/"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B03312D321F
	for <linux-media@vger.kernel.org>; Thu, 14 Aug 2025 08:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755161577; cv=none; b=lSlisbTyOPuHSbEliua/HmD1XjJB9pkiuiszutEaewFrdJs2XWNLoDX9jfAgRbX7NYeIBo4JK812N8OWwyAcVQzIO6XD3FKQWa3If9P4zKb6Z6kajcW8LZBIn8k4bmIO0aS6E650QjCeAnLDjFd3XnE0s71ZPE2VD8d0QEYEZYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755161577; c=relaxed/simple;
	bh=rM5v1nsH5pLNHGEBVvK1f6R9IeDOm7r1Q1Ie0plQT8w=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Yut63bD6siyLNt+sk069V/LR6sw4A9h11sjgcgCcXRC/ojCt2WhuB3ViNyvePspAra7zmxj6+Q3X9p01UB1CGON+gNTjH3yVUaLJE9ldIQgUrbyKXyPlx5LxYkV5QqZiYdSErxs8Ep/3UkwCdUC8M/+zEK/EiZgdPur8JJ9dcWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NtUVvSi/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57DNfITA030062
	for <linux-media@vger.kernel.org>; Thu, 14 Aug 2025 08:52:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=JLlinyYAP0CYUG0uBlqNLvj5txKGzPu5tIS
	J8EDiJYo=; b=NtUVvSi/P+4iTEa/nRoVCEkmjodH5OCx/VIyQJQCEWstMz5rnwy
	bTYMEfC6YBVHaS4TT91cWfTVDbwSxng7lOmnKv9WClMyxS5GlGxIW5ru3zUaI6K8
	AUgEA+XgzsH4GXXE+IMu6hhrkk5G7n51jb2HqNrkBAAsLs2bo32/IOe2bm+mUVnh
	gR5We61EwG14OSrT39iCL4LIrwbC7DZAIdBlu93eTw9PvpLK6rDo73+ispW3ZFpm
	iCPDz/11vqUhGBcItZOsrXzPR4stlds9yEygV4aRYAFhHIuIHQi26wFccbFzAxh7
	I/AjrVHJ4/tiwA/Yv96MmdZO0DxZlM6+yNg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48fm3vsww9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 14 Aug 2025 08:52:54 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b109c382aaso21120231cf.3
        for <linux-media@vger.kernel.org>; Thu, 14 Aug 2025 01:52:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755161574; x=1755766374;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JLlinyYAP0CYUG0uBlqNLvj5txKGzPu5tISJ8EDiJYo=;
        b=IFi3SUj4hKlr9Hi07KXoR90GH0VOuNibdaWe/VGEF8OG4VlQQLlNvNkjAurmpAm9YF
         QY6fqYcnvX+Z8vRR6UOQJOhFsedLG8VjGLWf4BwcgDCQ2iz12Iq9OlR2P98aWHoiSIU2
         LJ0K7sAHeKojgmvcj1lDjQTdAGKg/aHJw9Z6OFsZpPYtzsuf8/ldusct3T38Qk4kQqiz
         Hj8aDYSAVlUdjIfiG/Za7Omn4MBeMRPiwOhRdN9FlZ1GzBeNKW1c/dx6Gh8uRLJkeJ/+
         ltvK4Id59icHkGqOdfQZsWbho0rhjHjc6E4zHqmWLIMwgqInvZxNytRDmQ9IRzz+Bj/b
         IDiA==
X-Gm-Message-State: AOJu0YyJBDqZWPOPDF6G/dTtdTmUq2hmcP2nBHxZyopyzddkBb5Oo2Bw
	Bw/T0KSAMWzcVdgSxjHXC2hZJaZxvtCZybmm28gmmGKy5qKYkyGHVWPCvst+bS3rNgZqttw3EmZ
	3ja1bO2qxUXIG71LBIyMbiEXpIxXQahHiI4rmnxjMfIY/+DUi6x7V0yYkUr/yF8Ogmw==
X-Gm-Gg: ASbGncs+eVvGTqmoC6tTCESzmYVQSAf7xSn1R8lP4JyL1sBsvHH6nzcUpwnR1lo8+Nd
	EXKC3/WJ1JgboN6bqvHs+d4oELK3ALHJR7/XBCdggNBY9NGZOnURRGvhj43LvJqy4b0cQ4ltoGk
	LHHTSktfAmzI0OXcmw9MWqAIXsA8dmvwMdqovSoOW+R/CegOX8ZiB/BE6EOFeBQQuim1Nn3DbTL
	gNFHeb9OB/vf0NM6PC9JM1bWH1m5Lxhdri0JCfuxwoQlXwp7HIHR1mQG9gSk1jO/CW4o8Wf2Wsb
	PbWDda3mYvTY5FuVtB3itYPrDVCqvFq2UkvbkGrVFN6KzsPcG8HNHs89MudVS39sfMOYAmtQ8pb
	KafZjFqDH6tL8
X-Received: by 2002:ac8:7f88:0:b0:4b0:7952:b33 with SMTP id d75a77b69052e-4b10a978930mr26842381cf.20.1755161573480;
        Thu, 14 Aug 2025 01:52:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHsMiIwCTtx5aGEU1Z+PdHDbE82aQSIcsUxXgqMU2GHslaeS1bVl0SuOXYkGpE8Y3qQUvjt+Q==
X-Received: by 2002:ac8:7f88:0:b0:4b0:7952:b33 with SMTP id d75a77b69052e-4b10a978930mr26842131cf.20.1755161572867;
        Thu, 14 Aug 2025 01:52:52 -0700 (PDT)
Received: from trex.. (205.red-83-60-94.dynamicip.rima-tde.net. [83.60.94.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a1c6bc93fsm13155895e9.2.2025.08.14.01.52.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 01:52:52 -0700 (PDT)
From: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
To: jorge.ramirez@oss.qualcomm.com, quic_vgarodia@quicinc.com,
        quic_dikshita@quicinc.com, bryan.odonoghue@linaro.org,
        mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v10 0/8]  media: venus: Add QCM2290 support with AR50_LITE core
Date: Thu, 14 Aug 2025 10:52:40 +0200
Message-Id: <20250814085248.2371130-1-jorge.ramirez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDEwNyBTYWx0ZWRfXwCUumbuqCX4D
 O0ELSi7bnws5B2D4EghuPD1HOigF8bLO2LRi1ABtulE6MbKdwokWEp+o48iRV6MhUjZbGTK9J2K
 3pBalnEutWqkF6eIxhKZcakMx2+v1HpGRsnsK4AzJDf7i9JE2fzgIStWly/YAMZwelBebl13eTJ
 icIBzJ/XsVpq+gRVEuTxtUwphvd8Kd+oJTVeuQn99x/Oe9L7rwswHayW4mMfACg7Qtm8X0uNTU2
 MK5OZU+bH6IzWHI8t0TPV5PZyEIGjDMVT2er1aZgZsNTs1GaFfpzzTyeUwEZJeFgsOiOMsb6tJG
 9hHYGpecUseBX+k7tRZhR6ePxsFSZjW2xZ01IMNu7MQjQsfwdgmZJg+SkW0lgdAN2AELmLeyhaX
 fksE/uWy
X-Proofpoint-GUID: UrwEkk7mpO3solWjV7RCvt4Bu7cX3GJN
X-Authority-Analysis: v=2.4 cv=A+1sP7WG c=1 sm=1 tr=0 ts=689da3e6 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=Rr2dNH5/fcnoRoBmcVUeRg==:17
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=vaIsIKZIAAAA:8
 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=WAo7cU96di-Ynu7D4fEA:9
 a=uxP6HrT_eTzRwkO_Te1X:22 a=rh-XPM1-DYv4t-UOgbwD:22 a=cvBusfyB2V15izCimMoJ:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: UrwEkk7mpO3solWjV7RCvt4Bu7cX3GJN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 phishscore=0 clxscore=1015 adultscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508110107

Changes since v9:
  v9: https://lore.kernel.org/all/20250808085300.1403570-2-jorge.ramirez@oss.qualcomm.com/#r

- Note: rebased and tested on RB1 using media-commmiters/next:
  078f1a7eb48e ("media: staging: Rename second ioctl  handlers argument to 'void *priv'")
- patch 2/8: media: venus: Define minimum valid firmware version
  core_init only synchronizes on sys_init response. If the firmware version needs to be validated
  initialization should complete on version retrieved instead (also removed reviewed-by from the
  previous patch).
- patch 3/8: Add framework to support for AR50 LITE video core
  - Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
- patch 4/8: HFI platform V4 capabilities
  - Reviewed by Dikshita Agarwal <quic_dikshita@quicinc.com>
- patch 5/8: Sort dt_match alphabetically
  - Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
  - Reviewed by Dikshita Agarwal <quic_dikshita@quicinc.com>
- patch 8/8: Enable Venus on 2210 RB1 board
  - Reviewed by Dikshita Agarwal <quic_dikshita@quicinc.com>

Changes since v8:
  v8: https://lore.kernel.org/all/20250805064430.782201-1-jorge.ramirez@oss.qualcomm.com/
-  patch 1/8: Add qcm2290 dt schema
  - no change
- patch 2/8: media: venus: Define minimum valid firmware version
  - dev_err on failure
- patch 3/8: Add framework to support for AR50 LITE video core
  - pass core rather than the lite property to the hfi platform
  - remove warnings
- patch 4/8: HFI platform V4 capabilities
  -no change
- patch 5/8: Sort dt_match alphabetically
  - new
- patch 6/8: Add DT compatible and capabilities
  - sort dt_match alphabetically
- patch 7/8: Add Venus video node for 2290
  - Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
- patch 8/8: Enable Venus on 2210 RB1 board
  - Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Changes since v7:
  v7: https://lore.kernel.org/all/20250715204749.2189875-1-jorge.ramirez@oss.qualcomm.com/
-  patch 1/7: Add qcm2290 dt schema
  - extend commit message to cover IOMMU order, remove iommus minItems, alphabetic order for includes
  - added myself as the file maintainer
-  patch 2/7: media: venus: Define minimum valid firmware version
  - Replaces previous patch that was able to distinguish encoder vs decoder firmware version support
  - Now it is an all or nothing implementation (the firmware either support enc and dec or it doesn't)
- patch 3/7: Add Support for AR50 LITE video core
  - remove EOS support for older firmwares since we will drop support for fw < 6.0.55
- patch 4/7: HFI platform V4 capabilities
  - remove some hardcoded values and some ternary operations
  - added reviewed by Bryan O'Donoghue <bryan.odonoghue@linaro.org>
- patch 5/7: Add DT compatible and capabilities
  - only min_fw now required since we dont support encode/decode indepedently after 2/7
  - added reviewed by Dikshita Agarwal <quic_dikshita@quicinc.com>
- patch 6/7: Add Venus video node for 2290
  - no change
- patch 7/7: Enable Venus on 2210 RB1 board
  - fix alphabetical order

Changes since v6:
  v6: https://lore.kernel.org/all/20250708180530.1384330-1-jorge.ramirez@oss.qualcomm.com/
- patch 1/7: Add qcm2290 dt schema
  - no change
- patch 2/7: Conditionally register video nodes
  - fixed potential NULL dereference on handling firmware errors when the encoder is not present.
- patch 3/7: Add Support for AR50 LITE video core
  - applied Dikshita Agarwal review comments: do not handle no-tz case, fix WD mask
  - replaced EOS buffers for a work around (firmware should not access the eos buffers)
     renamed venus_helper_alloc_eos_buf to venus_helper_prepare_eos_data
- patch 4/7: HFI platform V4 capabilities
  - removed 10 bit encoder support as per Dikshita Agarwal review
- patch 5/7: Add DT compatible and capabilities
  - removed frequency table as per Konrad Dybcio review (driver now uses opp)
  - fixed bw_tables for the supported loads (remove 10 bit support)
- patch 6/7: Add Venus video node for 2290
  - no change
- patch 7/7: Enable Venus on 2210 RB1 board
  - no change

Changes since v5:
  Two additional new patches added to the set to support video encoding.

- patch 1/7: Add qcm2290 dt schema
  - added reviewed by: Bryan O'Donoghue
  - added reviewed by: Krzysztof Kozlowski
- patch 2/7: Conditionally register video nodes
  - new functionality required to support AR50_LITE
- patch 3/7: Add Support for AR50 LITE video core
  - completely rewritten - lite platforms are extensions of previous HFI_XXX
- patch 4/7: HFI platform V4 capabilities
  - use HFI 4XX instead of HFI 6XX as per review
- patch 5/7: Add DT compatible and capabilities
  - added reviewed by: Bryan O'Donoghue
  - enabled new option min_fw_version
- patch 6/7: Add Venus video node for 2290
  - added reviewed by: Konrad Dybcio
  - removed status property
- patch 7/7: Enable Venus on 2210 RB1 board
  - new

Changes since v4:
- patch 1/5:
  - added reviewed by: Krzysztof Kozlowski
  - updated example section
- patch 2/5:
  - added reviewed by: Bryan O'Donoghue
  - Fixed Co-developed-by order
- patch 3/5:
- patch 4/5:
 - removed encode-node (userspace exposure)
 - fixed Co-developed-by order
- patch 5/5:
 - fixed venus register region
 - power-domain-names: one per line
 - clock-names: one per line
 - fixed interconnect tags
 - empty line before subnode
 - enable the venus node

Changes since v3:
- Fixed schema commit subject.

Changes since v2:
- Removed IS_HFI/IS_VPU macros
- checkpatch.pl --strict fixes:
  - convert macro to static inline to avoid argument reuse side effect

Changes since v1:
- Added IS_HFI macro usage
- Moved schema patch to top
- Fixed commit messages

This patch series adds support for the Venus video decoder/encoder block
present on the Qualcomm QCM2290.

This series functionally depends on the following patch:

  clk: qcom: gcc-qcm2290: Set HW_CTRL_TRIGGER for video GDSC
  https://lore.kernel.org/all/20250613102245.782511-1-loic.poulain@oss.qualcomm.com/

Please ensure the above patch is applied before this series.

The QCM2290 integrates an AR50_LITE core, a low-power implementation of
Venus supporting H.264, HEVC (H.265), and VP9 decoding as well as H.264
and H.265 encoding.

The series includes:
  - DT binding schema for qcom,qcm2290-venus
  - SoC integration via qcm2290.dtsi
  - Resource table definitions and frequency scaling
  - Platform capability registration for the AR50_LITE core decoding block.

Limitations:
  - The hardware does not support concurrent operation at FullHD.
  - Encoding is not supported in firmware version before 6.0.54

Firmware:
  - This code has been tested with 6.0.52, 6.0.53, 6.0.54-PRERELEASE

Some basic Tests:

Decoding and Encoding were verified on the QCOM RB1 platform using
GStreamer with V4L2-based decode plugins.

The following pipelines were used for playback 1280x720 and 1920x1080
H.264, HEVC and VP9 videos from https://www.elecard.com/videos.

Decoding:
[H.264]
gst-launch-1.0 filesrc location=videos/xxxxx.mp4 \
  ! qtdemux name=demux demux.video_0 ! queue ! h264parse ! v4l2h264dec \
  ! videoconvert ! autovideosink

[H.265]
gst-launch-1.0 filesrc location=videos/xxxxx.mp4 \
  ! qtdemux name=demux demux.video_0 ! queue ! h265parse ! v4l2h265dec \
  ! videoconvert ! autovideosink

[VP9]
gst-launch-1.0 filesrc location=videos/xxxxx.webm \
  ! matroskademux ! queue ! v4l2vp9dec \
  ! videoconvert ! autovideosink

Encoding:
[H.264]
gst-launch-1.0 videotestsrc num-buffers=30 \
  ! video/x-raw,width=1280,height=720,framerate=30/1 \
  ! v4l2h264enc ! h264parse ! mp4mux ! filesink location=/tmp/output.mp4

[H.265]
gst-launch-1.0 videotestsrc num-buffers=30 \
  ! video/x-raw,width=1920,height=1080,framerate=30/1 \
  ! v4l2h265enc ! h265parse ! mp4mux ! filesink location=/tmp/output.mp4

Concurrency:
gst-launch-1.0 -v videotestsrc num-buffers=1000 \
  ! video/x-raw,format=NV12,width=1280,height=720,framerate=30/1 \
  ! v4l2h264enc capture-io-mode=4 output-io-mode=2 ! h264parse \
  ! v4l2h264dec capture-io-mode=4 output-io-mode=2 ! videoconvert \
  ! autovideosink

[Fluster]
The H.264 decoder was also tested using the Fluster test suite
(version: v0.4.0-12-g33566abd0964).
 Target: GStreamer-H.264-V4L2-Gst1.0, Test Suite: JVT-AVC_V1
 Result: 126/135 tests passed
 Failures:
 FM1_BT_B, FM1_FT_E, FM2_SVA_C, BA3_SVA_C, SP1_BT_A,
 SP2_BT_B, MR6_BT_B, MR7_BT_B, MR8_BT_B

---

Jorge Ramirez-Ortiz (8):
  media: dt-bindings: venus: Add qcm2290 dt schema
  media: venus: Define minimum valid firmware version
  media: venus: Add framework support for AR50_LITE video core
  media: venus: hfi_plat_v4: Add capabilities for the 4XX lite core
  media: venus: core: Sort dt_match alphabetically.
  media: venus: core: Add qcm2290 DT compatible and resource data
  arm64: dts: qcom: qcm2290: Add Venus video node
  arm64: dts: qcom: qrb2210-rb1: Enable Venus

 .../bindings/media/qcom,qcm2290-venus.yaml    | 130 ++++++++++++
 arch/arm64/boot/dts/qcom/qcm2290.dtsi         |  55 +++++
 arch/arm64/boot/dts/qcom/qrb2210-rb1.dts      |   4 +
 drivers/media/platform/qcom/venus/core.c      | 109 +++++++---
 drivers/media/platform/qcom/venus/core.h      |  18 +-
 drivers/media/platform/qcom/venus/firmware.c  |  30 +++
 drivers/media/platform/qcom/venus/firmware.h  |   2 +
 drivers/media/platform/qcom/venus/helpers.c   |  12 +-
 drivers/media/platform/qcom/venus/hfi_msgs.c  |  11 +-
 .../media/platform/qcom/venus/hfi_parser.c    |   2 +-
 .../media/platform/qcom/venus/hfi_platform.c  |  23 ++-
 .../media/platform/qcom/venus/hfi_platform.h  |  34 ++--
 .../platform/qcom/venus/hfi_platform_v4.c     | 188 ++++++++++++++++--
 .../platform/qcom/venus/hfi_platform_v6.c     |  33 ++-
 drivers/media/platform/qcom/venus/hfi_venus.c |  25 ++-
 .../media/platform/qcom/venus/hfi_venus_io.h  |   4 +
 .../media/platform/qcom/venus/pm_helpers.c    |   2 +-
 17 files changed, 592 insertions(+), 90 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml

-- 
2.34.1


