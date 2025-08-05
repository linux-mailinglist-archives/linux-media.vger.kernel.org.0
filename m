Return-Path: <linux-media+bounces-38890-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 056B8B1AE86
	for <lists+linux-media@lfdr.de>; Tue,  5 Aug 2025 08:44:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A4F3C3B27CF
	for <lists+linux-media@lfdr.de>; Tue,  5 Aug 2025 06:44:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D66F41EEA5D;
	Tue,  5 Aug 2025 06:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GHevaAxG"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CED821C19A
	for <linux-media@vger.kernel.org>; Tue,  5 Aug 2025 06:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754376280; cv=none; b=oqmTGjTDZAMU04jvWJ90UnugS8Pded5lpJ8vqirkLNw6KPbI2Tz6rXbfcsTSOQ1bFH23sqdgLy6Znh++11LTHuiDRUYypsR+oDq5NjudWg0wj4L6vZqqY8DX3ctaJKqdYjyeylBCjyxM/VnlItvPZQAYbDhl+E11Ov5ufC++4rQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754376280; c=relaxed/simple;
	bh=upeH1rNkGJYZ3uQ8gcNtcAkqF5OT4eSl/9a/WFXAo/g=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=JaLSsXRsLpzXxSOiOU23KyXgq/xdItlSaLAUB5AQ6FFJ19aCL3jtjQVeIaOuCOuypK/hYWfrIyhvdBWQ2H2zZVFHu/rBnBFIshzHozvs69UYCu5Um0vgD6XoqhWMc2oSNYoK4xYDPZ3Ke9zGuJjEYXDzvjeCa/FjNFQcyPpdLFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GHevaAxG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5756Kb3S006321
	for <linux-media@vger.kernel.org>; Tue, 5 Aug 2025 06:44:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=W1TjQhZLH5HafBhMwjoco55qAgFKAs+5S2A
	wzwSd4gc=; b=GHevaAxGOiE2mUf+Dm1FNE1KpvWVczwbxgEsdIo4ZMIqtguykTQ
	N9oLgZ50ogDYdB7IDLY5sLSz7FZ2ZHunSxAt9SzCANdRDDZLw3qXyj3RQTOrRdR8
	iEhCKeqXtHZmmsjJU2whuw53WgVHUZpD1Qi4TQINVLXnhIEznzhBNt6WygLWT5YB
	e/91YV/5ho1wJDkFAMZIBUVq9FmOFNv13x/WKRE2Dkq1PYCfSkOyZrUisMFA45Ti
	pesONZpVfROg0XRrzAu+Sdusn82OJ4drCAp2LwkJ1Jv/Mn8e0VOBANW2MQFBV4tK
	rElkhNqe3hej6byJs9lkeeBsSCJzpf3kJ+w==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 489byc7e6e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 05 Aug 2025 06:44:37 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-7073b4fb53eso96294696d6.0
        for <linux-media@vger.kernel.org>; Mon, 04 Aug 2025 23:44:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754376276; x=1754981076;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W1TjQhZLH5HafBhMwjoco55qAgFKAs+5S2AwzwSd4gc=;
        b=w7KRAYAhPIEX0VD8zw69IIK/DduReLJM3CtiPMMxFE6MYu6RxlWxtPS41LeDDurhwM
         mQbsPlTWZGciD2MO2XiMjdFWiL8HGTo0RSQBCtYoPKiEKtPgGaKpnLiMk1mn2TGQZJt7
         tsC4+6PLWC7rPJJwOaKJmCbPTewRE1L3oE1tLumhbR9aWfIB3YjMgyCKrc3YoGLxmVeu
         QU29Gj81aesvq8pCnBA5lKPn1XAieMjX6VGC/zstj+XsejNrozXa1G+PMTRGlR8OgPkO
         qNOqW3JiI6R4PQAcdlqAT7BauNj+846ks5+o79m4tOQ/8zsxuOApYaQxapR5WQZEUUwK
         oNCQ==
X-Forwarded-Encrypted: i=1; AJvYcCWI1V1n80RYhDJ6yVaBPjZU2BlneaGrmhfUo2IWiCtDAjB4CtRx7mi6hJIbuM1JKUAGd5wXdFQRAfm7EQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywm897F5ZwXlRU7Nn2jUkUWMXf7FxZ5zAq8Cc0ZEp58BorlIWB9
	hwVakz8uxh+9QyBMq0L3RD+NjvZdFUursCY5li2qnfcm7Tr9pouXkQcnDDUSPtukvmjbANgBQ9h
	LTm2F53PYj0BL35ZUild+sHfnPlPqz+2acN5nirDb4SGp+ZGtfkbaqn4BwAAudndJFA==
X-Gm-Gg: ASbGncvHGSM/O514RC+XyjQg2IBJxkE7tvqRb3BX6U4pCQoF7zPB2/dfInne7lcQfKd
	uuFwze505K+5Stt/+p5quTgKKdty+Xr8P0lDUnAhKThaeYYE+xWI8RLDZQVfPqK7I4CRC5QbmY7
	2Ba6fIi++POu8tedM5htH/84r/2ZdjcMRp4OoxjEb44bLTw8GrL6FVcaNl5JlX9SN1gVtDxoGKY
	lr/URQKeEP7XArL6EemQqC93SNA2/Ao25cfzF9H2BMQPNvZPhrqB8+Lc37zx1QlHHgCNekaaPJH
	hm4UOVNMPsrFiXozyw3KL+jQ/1TNxyKz7iKJHM47FQ2BzMdieYOgzftAifbtGaeJGaX7KfqNfN3
	YcTbpvhI2+s7b
X-Received: by 2002:ad4:5b8d:0:b0:707:16cd:8329 with SMTP id 6a1803df08f44-7093631d6ebmr181747046d6.37.1754376275829;
        Mon, 04 Aug 2025 23:44:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGHapatZgy/uleAupTqHld0gP662vrJrXDkIF37GPErzUTHHiVGSrevgMXTY6YqQ7dkjkH2uA==
X-Received: by 2002:ad4:5b8d:0:b0:707:16cd:8329 with SMTP id 6a1803df08f44-7093631d6ebmr181746746d6.37.1754376275289;
        Mon, 04 Aug 2025 23:44:35 -0700 (PDT)
Received: from trex.. (205.red-83-60-94.dynamicip.rima-tde.net. [83.60.94.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4589ee57922sm194015815e9.22.2025.08.04.23.44.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Aug 2025 23:44:34 -0700 (PDT)
From: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
To: jorge.ramirez@oss.qualcomm.com, bryan.odonoghue@linaro.org,
        quic_dikshita@quicinc.com, quic_vgarodia@quicinc.com,
        konradybcio@kernel.org, krzk+dt@kernel.org
Cc: mchehab@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v8 0/7] media: venus: Add QCM2290 support with AR50_LITE core
Date: Tue,  5 Aug 2025 08:44:23 +0200
Message-Id: <20250805064430.782201-1-jorge.ramirez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: NOw9XRqQO5cibOsSnqRfwq1AqfHJ6Z4J
X-Authority-Analysis: v=2.4 cv=Y6D4sgeN c=1 sm=1 tr=0 ts=6891a855 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=Rr2dNH5/fcnoRoBmcVUeRg==:17
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=vaIsIKZIAAAA:8
 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=fiKrxSy_4L_ZQUeM1s4A:9
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=rh-XPM1-DYv4t-UOgbwD:22 a=cvBusfyB2V15izCimMoJ:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: NOw9XRqQO5cibOsSnqRfwq1AqfHJ6Z4J
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA1MDA0NSBTYWx0ZWRfXwmt4t0V8CbuM
 rf1DIkvNm0AIKrqai9DFQg2t0oP3fsIq+tBNYXajnnmadh/nUbQMIN8DF45QFiF8diZ7o82Sa14
 ELMUyW2jGOXq2bPjzg9w//6OoyTVky2W6p+cO6GN6pJQWkvxJhLyzd/bTqU2/niJ+vsX9QqxVJd
 gDEm+P8AVQRlVVdnHZ5x/1PbIiPtewQ3d2B+0V7MBmjUg1DKMlmLwf2UokAOAlp5hhWqkEKwtuD
 JeMZ+qPvo6iN0pndYJVOTueszJPkvbpSgo0SgLdj5raR5gvre6+N0qGr1mBSvrMyHtTVuHVqhv2
 BGFV3iAjumGEWh8TTQ7WnoFsJxwEJQbvFX1SC4XE3ojqc04LWtyQ5v3NcYgc1zhbvV5l/4RCESE
 kSSxnloYT2H5/17v4VoAPz1/NxU2353gMnCA8mjllhf+2KQETUDHS7Y2YaTX1DiUMMFiJ1lN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-05_01,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=999 suspectscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 malwarescore=0 adultscore=0 spamscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508050045

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

Jorge Ramirez-Ortiz (7):
  media: dt-bindings: venus: Add qcm2290 dt schema
  media: venus: Define minimum valid firmware version
  media: venus: Add support for AR50_LITE video core
  media: venus: hfi_plat_v4: Add capabilities for the 4XX lite core
  media: venus: core: Add qcm2290 DT compatible and resource data
  arm64: dts: qcom: qcm2290: Add Venus video node
  arm64: dts: qcom: qrb2210-rb1: Enable Venus

 .../bindings/media/qcom,qcm2290-venus.yaml    | 130 +++++++++++++
 arch/arm64/boot/dts/qcom/qcm2290.dtsi         |  55 ++++++
 arch/arm64/boot/dts/qcom/qrb2210-rb1.dts      |   4 +
 drivers/media/platform/qcom/venus/core.c      | 105 ++++++++--
 drivers/media/platform/qcom/venus/core.h      |  12 ++
 drivers/media/platform/qcom/venus/firmware.c  |  23 +++
 drivers/media/platform/qcom/venus/firmware.h  |   2 +
 drivers/media/platform/qcom/venus/helpers.c   |  12 +-
 .../media/platform/qcom/venus/hfi_parser.c    |   5 +-
 .../media/platform/qcom/venus/hfi_platform.c  |  20 +-
 .../media/platform/qcom/venus/hfi_platform.h  |  25 +--
 .../platform/qcom/venus/hfi_platform_v4.c     | 183 ++++++++++++++++--
 .../platform/qcom/venus/hfi_platform_v6.c     |  32 ++-
 drivers/media/platform/qcom/venus/hfi_venus.c |  25 ++-
 .../media/platform/qcom/venus/hfi_venus_io.h  |   4 +
 .../media/platform/qcom/venus/pm_helpers.c    |   2 +-
 16 files changed, 557 insertions(+), 82 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml

-- 
2.34.1


