Return-Path: <linux-media+bounces-35574-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A3A9AE3767
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 09:51:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A3ED518960BD
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 07:51:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE3121F8BA6;
	Mon, 23 Jun 2025 07:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JKY4DVcO"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A38381F873B
	for <linux-media@vger.kernel.org>; Mon, 23 Jun 2025 07:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750664997; cv=none; b=T6e9iBWigkWudZ1erbhGiY9ldEzYCZBMfetDYnSxWTujKNppxVmxPSuO61k0766ySL72oIiNmqdhSHi7Na8zD3JqyQcIstDzQTd3dWkmsUHfzowQiUE7LKIaAp2h6N5fmp03XaChke/WQ4ZJhywxfnN3LIhYBagXqaqJuZvlntQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750664997; c=relaxed/simple;
	bh=/4tUewPq4arMrPXztGroZtOESRJn7LuQTZ4meDBjAzo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=aRjQsdiHx4/0mVCXvHiD86Inx/nPO1qiTEt/6sHyk9eu5swtR4iw/MPjUU2FFZNczSG79ky98+nVGoi3n0aZkCYqwef0N8wIiRdj4WkBjoAvjPG7bn1tOaXNTWZT2/XAfJtYfgghSCi6FW89zb0DCj0quEiBYmnIwfOSAKVjOjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JKY4DVcO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N7fslK022529
	for <linux-media@vger.kernel.org>; Mon, 23 Jun 2025 07:49:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=sjQtsFIQnFL
	+UTCF4LxDfD4RYcCcbQjxvjxTX/zebcg=; b=JKY4DVcOiDo79FMkjrmEi24fdOw
	cddcl0jRuGo5VGnVDU3SaFb14AcuIKUFWwzb59iWAkcxQZMuxgyQgagm5QbedT8M
	B4EHWB9RhArNK3DXQSJm6MWfQMUskxJ3D3TIBCaQgqDa13uo+mvYrnHDtgyY49G9
	s5ael61F0FxBg+v1nVZeBV15uDBwWKaY4dK7sfWuv1Z8qNXR4QiSfaj8B3WKb4NY
	wzOCpwfLtq/jVlO7YnQ/DT7RXwWPbYJPEjhyf2hERkfoOneuZSvzsFY3pghuGIbZ
	tjL9INCE8n9ajYeHcRRUt1tb9Dzgt9UmlVYuHSoME3qHDRqTFoY0h7l1aGQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f2rpr0m1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 23 Jun 2025 07:49:53 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d0981315c8so299508685a.0
        for <linux-media@vger.kernel.org>; Mon, 23 Jun 2025 00:49:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750664992; x=1751269792;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sjQtsFIQnFL+UTCF4LxDfD4RYcCcbQjxvjxTX/zebcg=;
        b=OuZNI0iXlmBpuqsHKC4VZZagJtv3lNJe0N8x8DgYhFj1dIdTXWlto/C5s9BU3Vad6L
         SYQ9tO2qfaWL/Wg9p2jEqWdiJQRKo1qnIh0yzftA48fo2+SLVFc56/KvkhL/asRI5Mw1
         uOHZ7yVdP6h6PfC+eF9MbaVoaKwKyJA1dURQ2SQ+9bGRgtggpDvCK7V/ZVFVqBvekKjx
         5Ya3zHnB/bEjqCNya+g/fGjikhnSqV3784w9x0JzQbguPPGeM1UJpqOfIwuo7OotiGIi
         O+AqrSqyQC8HpjFSEj6hqlfP4VHry3X6syGpBeSSY+NVSZDYdDaQa4BXtXTP5KQ1G/Vb
         V6Ug==
X-Forwarded-Encrypted: i=1; AJvYcCWTYNskfEGAogPq6HPgTNjbDSrkw8bkcVsHqnRQVU0wvbZzGnpcGhSHsVqQPj5I5AEdVGUfqjKND0bVPA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3O8EdTyGjEsw/v4pgYCZOW5+impXYAZLL6BXGUWkkOHbdWe/a
	VBG+p2SOFUcnbpx4GNcQ10REkDhhFe7oKABdChFVaNPpZJAUFcSm1mjoIrXg1HMkhqOnlPkHrRX
	Q/ySznWvg1gLHfV7Im6911V8VZs4e/2yT0Rp44yFk+5ZxuhxHO4FQtjdDYDvBDcGV+g==
X-Gm-Gg: ASbGncuEUANBbrP/mU47ue7vLaka694WGSu6gUBVAsGv2HGqbnY40UGhpkDz3kQFAaq
	eS07Fu+6v+pcyd/tf+rb+jvuQj9Osv9OP5FZ7BZ3Q8A5jG4wcQCeI3TYzgNJJRzCagmodM6Kqsj
	tZ0ntJusdhfoVw/5ySkB3oQsFGO6OIz1ebJcJ1QcYEaZUWD2VfJjqSOBrA8+52C37xKTA/CoP3v
	Ms9Q3N+DffWPRf6qAvRN7//3F9bRSAXyVLxkFzTkT7IQqfRYVg71TcRmBL+hqANmU4Oi3koiU9+
	mQk6geV1bDumL9pD/bIXc7lDrepzl90s4N7XfDOOVGds5ihptMDAjTWfDbdbH7yYmKRPaW4SmD9
	s
X-Received: by 2002:a05:620a:410f:b0:7d3:c67f:7532 with SMTP id af79cd13be357-7d3f99327ccmr1597350285a.40.1750664992494;
        Mon, 23 Jun 2025 00:49:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHjm0ZmNinQCQIzYpoWQJiNnakjhqyBCMQR9/WOYvR5DRnCIJAduzY80go2wLw9fSekui4veA==
X-Received: by 2002:a05:620a:410f:b0:7d3:c67f:7532 with SMTP id af79cd13be357-7d3f99327ccmr1597349085a.40.1750664992073;
        Mon, 23 Jun 2025 00:49:52 -0700 (PDT)
Received: from trex.. (132.red-79-144-190.dynamicip.rima-tde.net. [79.144.190.132])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d0f17ac7sm8755313f8f.23.2025.06.23.00.49.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 00:49:51 -0700 (PDT)
From: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
To: jorge.ramirez@oss.qualcomm.com, quic_vgarodia@quicinc.com,
        quic_dikshita@quicinc.com, bryan.odonoghue@linaro.org,
        mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/5] media: venus: Add QCM2290 support with AR50_LITE core
Date: Mon, 23 Jun 2025 09:49:35 +0200
Message-Id: <20250623074940.3445115-1-jorge.ramirez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250613140402.3619465-1-jorge.ramirez@oss.qualcomm.com>
References: <20250613140402.3619465-1-jorge.ramirez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=NdDm13D4 c=1 sm=1 tr=0 ts=68590721 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=wjE3nLva0YkvARyJ+Gfmxg==:17
 a=6IFa9wvqVegA:10 a=vaIsIKZIAAAA:8 a=qk4D6dgNv6vegSoiKxYA:9
 a=IoWCM6iH3mJn3m4BftBB:22 a=rh-XPM1-DYv4t-UOgbwD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA0NSBTYWx0ZWRfX+vM6dQdicR8Q
 GhBwHjsxRWFI1kmK67U8PCX0T7qNQknIItNOPcR5uCFhDHEcrKisbUTxpjTyn+PJk8nDkw0QLFx
 iCYlrX4jU2w8SVfW7sUCVDEAXJebVRPLe0khIXU3NdNDYCSX69qIwu8IvvBwpIv3poZVfbBx29V
 eBI/qIJRD4R3+t/UBArGBqWcyPc9f2zvSqtIVL3YOrP42pdBqiYSjl9Zne1r0pXDEsaaqPy5J65
 Opdmhy170TN4N3jmjx/QaLRsKJfzPCW2ox3qjYhloukaXJgzOaJZyKzaGUWvhRf9zGOus9opyb3
 wv328ZEfBnvVaUluqXGzrQcPbDT0pnAq9SS/os7SWWQAuPMWrDCC901NpUWK4vcsRl6NXKczO8u
 9lRUxxNNV0KRbXWCuhIDsgi9j0+o6e1BIDa4JvbwGogiLXp9yxi0BDQychARQ6d/W5JWJqrI
X-Proofpoint-ORIG-GUID: -p9VshkV-GTXdCaGIB_ZJYXrPeeaEEQh
X-Proofpoint-GUID: -p9VshkV-GTXdCaGIB_ZJYXrPeeaEEQh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-23_02,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=999 adultscore=0
 clxscore=1015 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506230045

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

The QCM2290 integrates an AR50_LITE core, a low-power implementation of
Venus supporting H.264, HEVC (H.265), and VP9 decoding.

The series includes:
  - DT binding schema for qcom,qcm2290-venus
  - SoC integration via qcm2290.dtsi
  - Resource table definitions and frequency scaling
  - Platform capability registration for the AR50_LITE core

Decoding was verified on the QCOM RB1 platform using GStreamer with V4L2-based
decode plugins. The following pipelines were used for playback 1280x720 and
1920x1080 H.264, HEVC and VP9 videos from https://www.elecard.com/videos.

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

[Fluster]
The H.264 decoder was also tested using the Fluster test suite
(version: v0.4.0-12-g33566abd0964).
 Target: GStreamer-H.264-V4L2-Gst1.0, Test Suite: JVT-AVC_V1
 Result: 126/135 tests passed
 Failures:
 FM1_BT_B, FM1_FT_E, FM2_SVA_C, BA3_SVA_C, SP1_BT_A,
 SP2_BT_B, MR6_BT_B, MR7_BT_B, MR8_BT_B

---

Jorge Ramirez-Ortiz (5):
  dt-bindings: media: venus: Add qcm2290 dt schema
  media: venus: vdec: AR50_LITE video core support
  media: venus: hfi_plat_v6_lite: Populate decode capabilities
  media: venus: core: Add qcm2290 DT compatible and resource data
  arm64: dts: qcom: qcm2290: Add venus video node

 .../bindings/media/qcom,qcm2290-venus.yaml    | 117 ++++++++++++++
 arch/arm64/boot/dts/qcom/qcm2290.dtsi         |  45 ++++++
 drivers/media/platform/qcom/venus/Makefile    |   2 +-
 drivers/media/platform/qcom/venus/core.c      |  51 +++++-
 drivers/media/platform/qcom/venus/core.h      |  11 +-
 drivers/media/platform/qcom/venus/firmware.c  |   8 +-
 drivers/media/platform/qcom/venus/helpers.c   |  80 ++++++++++
 drivers/media/platform/qcom/venus/helpers.h   |   2 +
 .../media/platform/qcom/venus/hfi_helper.h    |  10 +-
 .../media/platform/qcom/venus/hfi_platform.c  |   2 +
 .../media/platform/qcom/venus/hfi_platform.h  |   1 +
 .../qcom/venus/hfi_platform_v6_lite.c         | 148 ++++++++++++++++++
 drivers/media/platform/qcom/venus/hfi_venus.c |  14 +-
 .../media/platform/qcom/venus/pm_helpers.c    |   1 +
 drivers/media/platform/qcom/venus/vdec.c      |  15 +-
 15 files changed, 482 insertions(+), 25 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
 create mode 100644 drivers/media/platform/qcom/venus/hfi_platform_v6_lite.c

--
2.34.1


