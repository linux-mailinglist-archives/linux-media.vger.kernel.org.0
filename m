Return-Path: <linux-media+bounces-36008-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 680F9AE9FA3
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 16:00:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DA21A17971B
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 13:59:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9973B2E7F01;
	Thu, 26 Jun 2025 13:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o5PkjtLx"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74CCB2E7625
	for <linux-media@vger.kernel.org>; Thu, 26 Jun 2025 13:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750946381; cv=none; b=Yv6i/2b53nM5f++rte2CSAPFLO4wyYzaCF0XL3Twq7zRKNUmTjZh/8QUGuQ6f1PsjQscXBmIADPPp99IzGN55uOdcxI9JCm68NEl1hIuHgH4uDaGT7XWQDWbEr6TP3CrN4hS8rcZdIvBFa0AigOkMAHw/0m3au/SgltVsC4EMxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750946381; c=relaxed/simple;
	bh=kmEGhYciyMMp4G/GxiAobkj/2CDHouIK6RTlTVRsPMA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=LkQnVgY6mVyaHtofnpGYEqptJCYEqeRr6xEdXq76hnj12EroSBwkB9Gy4RRIpGQmC+Fd7SQ3hfMnzm2C2aKNN0U+pdfpS/oUvmICNwcltc5xb4+gLgQfW2n6zBTt57FK0SEXHwQu1p5KEHAQlluCtS/Co4nR5zjq6btsMpqi2JM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o5PkjtLx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55Q9233m002567
	for <linux-media@vger.kernel.org>; Thu, 26 Jun 2025 13:59:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=5tgkYFTM5Xrw95Ff69bLBTB8QDp/Y5pR5JN
	HIoSX3ys=; b=o5PkjtLxjpIJg6ia2CjX17OQPVrTV/c0zNWZH4arCQeXVAMHqxO
	GHkuXWB4OmgpW/ZurUn0UIeJ8/UMU3dranvAhqLDGTcTBDJEwy6UBc28vpDnNgjt
	myWjX3AuMWGIvO3KlRuLh6fBBkgJrlwiemKVGf0vScr9zmpFXUprOzSE7dKgKyyd
	daJaUfcBMBUOI1cISCYltTM1IfMKf2jUdhtxtoeMR5/b2soSB+FMsm5RUHu0CkHl
	VdR1xYzHWwxaHUIbvXi1r/KlqCH6vyR/3pQtNN/YSuhCBsI0cDqU5KaayK5tXi77
	grdKvjH8QKTeeXfQo7nGkKAzuvZxWf4esYA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47emcmw8ns-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 26 Jun 2025 13:59:38 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4a7bba869dbso23053351cf.1
        for <linux-media@vger.kernel.org>; Thu, 26 Jun 2025 06:59:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750946377; x=1751551177;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5tgkYFTM5Xrw95Ff69bLBTB8QDp/Y5pR5JNHIoSX3ys=;
        b=rnlhL55h/bnC6Qji968ZqUyHqpd4Fh/vpRozuzX5gYmTlVCV9rn9FLjVgQIHQjvbIR
         aX4uAS0yyyLQGNVYrgRFVqb0AzRi6/yhOnuScjv7FBScMW90c1ybyreZ5T4xV9Le/4Ik
         CgzP1RxNp+yiKd3A0QvdbO0ZCnvtPPOwccXJZa47snO3rWcgiWE0wd1aPkZTrV5Vyn21
         4xPIsmC08I+1Ik0dbLSMzaRkjccZRaJgOFR9Vik8YCaftL0M0d1rhb4gbPcsdqhg9h3G
         Uvbr/WVN5UnTV3tETZilAvMiNjiloPzvLAKqYp7ZVCAoGbSRFd+GNdjzRfsqn+hdCIao
         L97Q==
X-Forwarded-Encrypted: i=1; AJvYcCWvCEpvTLkeNL3UTPt3gM9S4BsbTk5Sa1JVVbe7+5HTzG5Jo+Dic/zz13DoiW6YKz3TwRpfTJpv0Tf7zA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyFLs8IRj2F7SdHqQ9Sb07qYm39Oi+lEYTPYAR4mpejY34vIYED
	/ODSru02eHTOZQx8ukSL1x3cxBneJHmCMpEAvTrE3xXPgY/V1T+M/aTH3LqDSp6M4Jt7ch7Sp8k
	ue7jqGGX62rcKhxxGHE2mPyGS2r43xoMscn2js8R1nMcL9tdChECHsKFs6qriaEOTow==
X-Gm-Gg: ASbGncvJVml+k56nRgIDZKziZpT8rlSwroW3lFb/iUCE0A2t+elvPojrzQUA0P/D+CQ
	nATB24mP9U6HOqOlBYRd3MEna0n0QKh/hZmmkQ7YeC571pQBaQ6KEZOxPlLSx0lAgYk4WVxymU5
	rV+1D2Cp/r+OyGUhbwvZPm8Iw1UnK8jZU1b8xMeQJQvHrIDlnkydSFBw3ScjQacbyMqj5gnQyey
	+AIbn6ycO076X53EPOkNjJAo7VFgh8ftS1r3mdYk8fezWqycIY6dqzKkXGSAuXuIIBU6iKAAkvH
	/DjCoM0QLm+DI7nbSynFqQi56+Myp0lxkwq4A8L3VnNx53+DmfJEt/vj4aQLIU/UJgjBbSNVFGg
	B
X-Received: by 2002:a05:620a:c4e:b0:7d4:29b8:b573 with SMTP id af79cd13be357-7d429b8f1f2mr955658785a.30.1750946376570;
        Thu, 26 Jun 2025 06:59:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHa+vixNwigHwEtVGLKHaX1GvWyXjxTDO3Co4S7iTaf40s0SAmzfWX9ACUxorf8rQ9eiSSNsg==
X-Received: by 2002:a05:620a:c4e:b0:7d4:29b8:b573 with SMTP id af79cd13be357-7d429b8f1f2mr955653785a.30.1750946375894;
        Thu, 26 Jun 2025 06:59:35 -0700 (PDT)
Received: from trex.. (132.red-79-144-190.dynamicip.rima-tde.net. [79.144.190.132])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453823c57d7sm53723365e9.40.2025.06.26.06.59.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 06:59:35 -0700 (PDT)
From: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
To: jorge.ramirez@oss.qualcomm.com, krzk+dt@kernel.org,
        bryan.odonoghue@linaro.org, quic_vgarodia@quicinc.com,
        quic_dikshita@quicinc.com, mchehab@kernel.org, robh@kernel.org,
        conor+dt@kernel.org, konradybcio@kernel.org, andersson@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/5] media: venus: Add QCM2290 support with AR50_LITE core
Date: Thu, 26 Jun 2025 15:59:26 +0200
Message-Id: <20250626135931.700937-1-jorge.ramirez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: jy_ACzLgbN3q0PQQnNa2Oy_vIQUPQs91
X-Proofpoint-ORIG-GUID: jy_ACzLgbN3q0PQQnNa2Oy_vIQUPQs91
X-Authority-Analysis: v=2.4 cv=J+eq7BnS c=1 sm=1 tr=0 ts=685d524a cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=wjE3nLva0YkvARyJ+Gfmxg==:17
 a=6IFa9wvqVegA:10 a=vaIsIKZIAAAA:8 a=7WrQi52fQBeieaC-wGsA:9
 a=kacYvNCVWA4VmyqE58fU:22 a=rh-XPM1-DYv4t-UOgbwD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDExOCBTYWx0ZWRfX6y+H9qhL6bws
 zfYJImFwT/7ZwPrElnNDqmeeKkDqoOOext8O8luN6PwsU826y4wt3PuDtdux3EzdKf4cRzUCaPD
 lSGwYCaNbwOktUK+slIlVFJMB+sY7Bwf7bGl5zyVnMZuioKae+3Grs7UHWCQPplo+K92w3ukNpR
 v8tcb8o2OltR8CVI2oEtXp+gK2qX2rf1hOt+ColgJFoiX3kRIYYmYQybFsJQzSFbT94LQHuUDPI
 kIcI2q29tmhjgpoxx8f+SAtpJoYrHtKkmPtHO9fiuPNJlXgsJaNTk/jxgnz+ssy5p1wZJNnDClj
 p2rHoLEaVazJt6JzF82yFRt2dOWSn4yTQD3J8eCjSQsAfLWJNCrjb3UuYjCNKKQx+WwG6KvxQld
 WAx/d9vwtFBd1hjRtkBhL7AJbl/cR6BJU6Iois72LXZ4wAMq/GgBelZ+IIY9z8wpOyur19Mk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_06,2025-06-26_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxlogscore=999 adultscore=0 impostorscore=0 clxscore=1015
 spamscore=0 malwarescore=0 phishscore=0 priorityscore=1501 suspectscore=0
 mlxscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506260118

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

Only video decoding is supported in this set - video encoding should
follow up in the coming weeks.

The QCM2290 integrates an AR50_LITE core, a low-power implementation of
Venus supporting H.264, HEVC (H.265), and VP9 decoding.

The series includes:
  - DT binding schema for qcom,qcm2290-venus
  - SoC integration via qcm2290.dtsi
  - Resource table definitions and frequency scaling
  - Platform capability registration for the AR50_LITE core decoding block.

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
  media: dt-bindings: venus: Add qcm2290 dt schema
  media: venus: vdec: AR50_LITE video core support
  media: venus: hfi_plat_v6_lite: Populate decode capabilities
  media: venus: core: Add qcm2290 DT compatible and resource data
  arm64: dts: qcom: qcm2290: Add venus video node

 .../bindings/media/qcom,qcm2290-venus.yaml    | 127 +++++++++++++++
 arch/arm64/boot/dts/qcom/qcm2290.dtsi         |  57 +++++++
 drivers/media/platform/qcom/venus/Makefile    |   2 +-
 drivers/media/platform/qcom/venus/core.c      |  50 +++++-
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
 15 files changed, 503 insertions(+), 25 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
 create mode 100644 drivers/media/platform/qcom/venus/hfi_platform_v6_lite.c

-- 
2.34.1


