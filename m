Return-Path: <linux-media+bounces-48104-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A4798C9D490
	for <lists+linux-media@lfdr.de>; Wed, 03 Dec 2025 00:09:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 52EBE34AFCB
	for <lists+linux-media@lfdr.de>; Tue,  2 Dec 2025 23:09:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67F51328615;
	Tue,  2 Dec 2025 23:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OnBQQAyi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ad6OqMmG"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40DDF32693C
	for <linux-media@vger.kernel.org>; Tue,  2 Dec 2025 23:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764716636; cv=none; b=QfX4BmKZPHZVnO0WBKZNZD+1+JwUYDXuWCDPjOlZrNRooTVHdmzFdWk5zueBuA1lWmU0FJjGsEm8QJpfVpdtvNdZkd70shNJOYEDKffNV6mGy1TtKsTqDErMu5ZNAoAb0hRZ8IZ2mjzAsDyvfzXd98ZiceZhIa02M2c8Ug0XF0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764716636; c=relaxed/simple;
	bh=Sg0UQRYOEfeF2NulMfnXB8HZPTL5oNcPiExfjHyTGNc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Y3F4EuhculJqYzLdMrRpJdxhsJ/9gndwHwyStN/CmTpjX83JfNVCV3yQM1FA0Hoj35T/mK2BcGJYS6H8r+2lPJSTtHZM5UJCkk8Np0ycyVpYt6XiX9bnuGC2yoM08Jmzoy7KKKstL7bK1vREreoGsnLM9OCTBFN/qzHv2JukccI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OnBQQAyi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ad6OqMmG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B2LsZC3919832
	for <linux-media@vger.kernel.org>; Tue, 2 Dec 2025 23:03:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=/k9ymlQY2UD+2G5b4wp7nk
	FeKHb1WpYXrEUL7sCmOno=; b=OnBQQAyi8yLr4HGezGiUYqBxUHzQAioti9pUTu
	knG/rtOPUbtrSkqePp/UfC3RrnXOch4xcevbxQ7ZBmzzXyuZpCvh7Y+FVxLmH22N
	W8WezsMAOO5G/qbWJ1dgjDwNNkwOni/lZYiKTixnHYqWFPrGibJ2kNw8R/IFJhmg
	wddS37eGQdC6R9PldK9wkIJQCZW1HjEEy40ocv12D+evyaUjt6l9mIYCJfL4EiwY
	JsxUwpVAiLUDAIAqZELLNruLaz9PmG1wTyKE2Z5XS3v/5vz+Vk6Y0RHsz8bXGl/L
	I1HNbPt6+a3pqhznclmGSEYb0Tlo85wa3yflWobafdT2fSyA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4at8eb05an-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 02 Dec 2025 23:03:52 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-297f89be57aso20603935ad.2
        for <linux-media@vger.kernel.org>; Tue, 02 Dec 2025 15:03:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764716632; x=1765321432; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/k9ymlQY2UD+2G5b4wp7nkFeKHb1WpYXrEUL7sCmOno=;
        b=Ad6OqMmGK54l6eCevwmiI91I9mffEeUCl2jpGdpWM3nCg4QQKn36aoD/++oIRQEIQx
         TR3tSToavpJdmRg7wgpnuE/FJH0THYE6VgJ9ql0qO+vd6xB08ETkpCK1230D08v4hPMa
         P66BGhvTnk1JXUyLpdRkcG8qseGJlaWlk4GROfkOlVEmz+YV2O1XhSLSqsz3nyLifAqU
         dQFbUiIJuQLx/dVX+kaJLkXg3bFj0dHW8+3dIp2Hk1mUFLmhGAAXEdJ2HaVZ5ifRudPT
         MaPCvUieoVAX+7oLNHAzTWSXXFeESVl407995mREGLFFim4FvG1YKHo+FpMFAAnFucKE
         VlxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764716632; x=1765321432;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/k9ymlQY2UD+2G5b4wp7nkFeKHb1WpYXrEUL7sCmOno=;
        b=OeDIZGLd0gYfVgf86L77rceS6IUMiPjaQ3QDuJGaULsW8mXkTgV/N7LSqEWw67yhCt
         +Mcd5uzffr52Y6/jPMwQ9FrvgLHbLXXj6lnqARON5rFQSexy7Kg7XOtPfj6UKMN5aAgN
         cJMqChiFZZFywyGVwMntxqsHc6HblOpqvabzOSgmb5iLh7Y1dII2VkTqgC4K3JFOa/Cf
         IS7XJTrYlZIHypA8pgd96+zswPGh0V6ectQSM2x8TqcpV7BOm4y70hh42fetalG/Cw6X
         FzyvmxiH9YApBh9tGjE8ErwLAMP7QZzYrHy2zXSMeDJ5TOj1PfEvjN5d16vvEKL8NMEQ
         1wCg==
X-Gm-Message-State: AOJu0YyTJwOpIVt0YqC+cQ2CG8kNdIZoMdXK9ypVWf7CFtXf1l6dVvum
	KVLhWZ8yxtnfBK6xgl7juZkrLTojPUMTOD0dzhcS5HSQpSxxH2HcSMMQw4frqKKLEzw92N0z5qD
	skfmkJRup4QusKLoetSuetxPrjVTka5oBq0SMPjO5NLOiCyCvBLp+akxSJGnkPo30Ng==
X-Gm-Gg: ASbGncvByyY1H/GgKxSPOSuDBHrbnEE2FfBv81WKVDq1fSIJxs9/iPdTgkmIij871pC
	7n+PeAqkki2E5U+BhDqH9YsAMQhw0kFhGuJEZK814v1p3e8Nwlkd2WPSh6DSh1R44AsdYQVFO6j
	qSztMCvIxKQ8811S8Fqks2kQcPYpMoIsQXGnz3tLlzh2AsunDsqYm/cyaCmU6nucO7Ov5yDeSVE
	W+JgY6Jg6HmfIh71OeFVeRaq2A5GEGxNeK4dVuMjYtVH/G9aF24vdw8xtZ5w/vvFWJ3WstEEbOX
	Y5IHpTXyREFQZIKMkbooZPpR/O9FTBDaiB5iCPFtJOjPgQa8kdHhvRxkeF/h30Z9hgEdstQS0l9
	W4k9bkzSr+3b3InckNl7/Wy9+TMFYa661jVLBecFMscLhVkXFRXDDtuZ3Pg03DoyyBZnk6w==
X-Received: by 2002:a05:7300:e8a3:b0:2a4:5129:fe99 with SMTP id 5a478bee46e88-2ab92e2e3f6mr168379eec.2.1764716631379;
        Tue, 02 Dec 2025 15:03:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH+tcR3ngcEFgsgAwLo9vurKqYbJ1u7wIs22KFb2dPyBj/MESdbCafXIQz7fSQ2MsuUSEnthA==
X-Received: by 2002:a05:7300:e8a3:b0:2a4:5129:fe99 with SMTP id 5a478bee46e88-2ab92e2e3f6mr168353eec.2.1764716630699;
        Tue, 02 Dec 2025 15:03:50 -0800 (PST)
Received: from gu-dmadival-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2a965ae9d06sm59214149eec.4.2025.12.02.15.03.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 15:03:50 -0800 (PST)
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Subject: [PATCH v8 0/5] Enable support for AV1 stateful decoder
Date: Tue, 02 Dec 2025 15:03:41 -0800
Message-Id: <20251202-av1d_stateful_v3-v8-0-2f74a81773b4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAE1wL2kC/3XQ3WrDMAwF4Fcpvl5K5J8k7tXeY4yi2PJqaJs1T
 sxGybtP6QYNLAFj0MH+DuguEvWRkjjs7qKnHFPsrjw0LzvhTnj9oCJ6noUspYFS2gIz+GMacKA
 wno9ZFa4NNpAHQO8Ef/vsKcSvB/n2/jv3dBtZHp7hKaah678ftVnN6V+DKv838OEUoNGejAxOv
 3Yp7W8jnl13uez5ErOZ9dNhaMXR7CjlHBBio4LccMzSqVccMzsGKiNb1Nb5DadaOiubyxU7Gm3
 rqan4FW449cKBtf3U7FgLCsEoZR2tONM0/QDU2Q1w7AEAAA==
X-Change-ID: 20251029-av1d_stateful_v3-cbf9fed11adc
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, kernel test robot <lkp@intel.com>,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Hans Verkuil <hverkuil+cisco@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764716630; l=8968;
 i=deepa.madivalara@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=Sg0UQRYOEfeF2NulMfnXB8HZPTL5oNcPiExfjHyTGNc=;
 b=1I7JFkNFuArLTgRu/KBZdDLoQvordSqDZxAlTv1YFDEvVSfT7fHQRK0JN39sjWERQPbDMmRPj
 QjODYxscTr7CafQUadnhN+3H+Pl+QEl8Jrjf9dV52wwB4O0DlJMj2RI
X-Developer-Key: i=deepa.madivalara@oss.qualcomm.com; a=ed25519;
 pk=MOEXgyokievn+bgpHdS6Ixh/KQYyS90z2mqIbQ822FQ=
X-Authority-Analysis: v=2.4 cv=e98LiKp/ c=1 sm=1 tr=0 ts=692f7058 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=QyXUC8HyAAAA:8
 a=e5mUnYsNAAAA:8 a=rSFLfVtXdW1OZ3NksNsA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: JYtBYRVYavR6F_aX5pe7uTPGg6a7ql_x
X-Proofpoint-GUID: JYtBYRVYavR6F_aX5pe7uTPGg6a7ql_x
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAyMDE4MiBTYWx0ZWRfX+gszcgYcULN0
 8zNGrqkl20y4n4IqFvOnCQRLAjBtYTgVenPBNBjknes6jhvOo8wbhhPNsM7gleNwVWTVeN19CwK
 QdFDX9Nf1z/JQsgMnrOIZ1HyIt40GznAevoiB/OvBTfwokAhMwHfspqVv8YuhDZqtU3iT5ZLCBN
 2JOUmM2M7m9x6Vek62YhwS404kox2OsxJQgbfAEBmbwSTpPnHFbh7GyQRLUtKK+T/BiQkk5qbb3
 wnOV6HvLXLGgYNyH2/k9Twu3ueisDqmBV6gHUwSgbIlOCEir08zxdER0k/ItU6UEm+hNGwsxEHf
 GMzF2tF8fNomWdyOVfwgZhzQHFl9AVYmyuI56H/f2I9xCIa5QSTuqZ+pgDN3jrRufdXYCU1ve8I
 hne0+UT/DveNTX+34VzPYIwbDWvoQA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-01_01,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 phishscore=0 suspectscore=0 bulkscore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512020182

Hi all,

This patch series adds initial support for the AV1 stateful decoder
codecs in iris decoder. Also it adds support for AV1 stateful decoder
in V4l2. The objective of this work is to extend the Iris decoder's
capabilities to handle AV1 format codec streams, including necessary
format handling and buffer management.

These patches also address the comments and feedback received from the
patches previously sent. I have made the necessary improvements
based on the community's suggestions.

Changes in v8:
- Rebase to latest
- Link to v7: https://lore.kernel.org/r/20251110-av1d_stateful_v3-v7-0-9913a15339ce@oss.qualcomm.com

Changes in v7:
- Updated Documentation (Nicolas)
- Link to v6:
  https://lore.kernel.org/r/20251109-av1d_stateful_v3-v6-0-4a9bde86025a@oss.qualcomm.com

Changes in v6:
- Fix for kernel test robot failure
- Link to v5:
  https://lore.kernel.org/r/20251107-av1d_stateful_v3-v5-0-351652ba49cd@oss.qualcomm.com

Changes in v5:
- Updated Documentation (Hans, Nicolas)
- Link to v4:
  https://lore.kernel.org/r/20251103-av1d_stateful_v3-v4-0-33cc1eaa83f2@oss.qualcomm.com

Changes in v4:
- Reuse sm8550_vdec_output_config_params (Dikshita)
- Add definition for 256 (Bryan)
- Fix identation (Bryan)
- Link to v3:
  https://lore.kernel.org/r/20251030-av1d_stateful_v3-v3-0-a1184de52fc4@oss.qualcomm.com

Changes in v3:
- Updated fourcc could be to match the ISO specification (Nicolas)
- Addressed comments and rebased changes to resolve potential merge
  conflicts (Dikshita)
- Updated GST MR
- Link to v2:
  https://lore.kernel.org/r/20251017-av1_irisdecoder-v2-0-964a5478139e@oss.qualcomm.com

Changes in v2:
- Updated documentation to target AV1 codec, not just AV1 decoder
  (Nicolas)
- Updated description for V4L2_PIX_FMT_AV1 (Nicolas)
- Simplified buffer calculations and replaced numbers with relevant
  enums (Bryan, Nicolas)
- Improved commit text for patch 5/5
- Fix for kernel test robot failure
  Reported-by: kernel test robot <lkp@intel.com>
  Closes:
  https://lore.kernel.org/oe-kbuild-all/202510021620.4BVCZwgf-lkp@intel.com/
- Link to v1:
  https://lore.kernel.org/r/20251001-av1_irisdecoder-v1-0-9fb08f3b96a0@oss.qualcomm.com

Changes since RFC:
- Addressed CRC issues seen during fluster testing which
  are fixed with firmware fix [1]
- Added Documentation for AV1 stateful uapi [Nicholas]
- Resolved issues reported by static tool analyzers
- RFC:
  https://lore.kernel.org/linux-media/20250902-rfc_split-v1-0-47307a70c061@oss.qualcomm.com/

[1]:
https://lore.kernel.org/linux-firmware/ff27f712-a96e-4fa6-7572-a0091537d8ac@oss.qualcomm.com/

These patches are tested on SM8550 for AV1 decoder while
ensuring other codecs are not affected.

Gstreamer testing:
Gstreamer MR for enabling AV1 stateful decoder:
https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/9892

Fluster testing:
Test suite: AV1-TEST-VECTORS
The result of fluster test on SM8550:
135/242 testcases passed while testing AV1-TEST-VECTORS with
GStreamer-AV1-V4L2-Gst1.0

failing tests:
unsupported content with bitdepth 10 (66 tests)
Iris decoder supports only 8bit NV12
av1-1-b10-00-quantizer-*

Unsupported resolution (36 tests).
Iris hardware decoder supports min resolution of 96x96
av1-1-b8-01-size-*

Unsupported colorformat (1 test)
av1-1-b8-24-monochrome

Unsupported SVC tests (2tests)
av1-1-b8-22-svc-L2T1
av1-1-b8-22-svc-L2T2

Bitstream corruption issue: (2tests)
av1-1-b8-03-sizeup
av1-1-b8-03-sizedown

Testsuite: CHROMIUM-8bit-AV1-TEST-VECTORS
13/13 testcases passed while testing CHROMIUM-8bit-AV1-TEST-VECTORS with
GStreamer-AV1-V4L2-Gst1.0

Following the RFC feedback, focused on only IVF/MKV content
as AV1 parser lacks support for below content
AV1-ARGON-PROFILE0-CORE-ANNEX-B
AV1-ARGON-PROFILE0-NON-ANNEX-B
AV1-ARGON-PROFILE0-NON-ANNEX-B

Unsupported test suites:
Iris Decoder supports only PROFILE0/V4L2_MPEG_VIDEO_AV1_PROFILE_MAIN
and 8 bit, 420 only
AV1-ARGON-PROFILE1-CORE-ANNEX-B
AV1-ARGON-PROFILE1-NON-ANNEX-B
AV1-ARGON-PROFILE1-STRESS-ANNEX-B
AV1-ARGON-PROFILE2-CORE-ANNEX-B
AV1-ARGON-PROFILE2-NON-ANNEX-B
AV1-ARGON-PROFILE2-STRESS-ANNEX-B
CHROMIUM-10bit-AV1-TEST-VECTORS

Compliance test for iris_driver device /dev/video0:

Driver Info:
		Driver name      : iris_driver
		Card type        : Iris Decoder
		Bus info         : platform:aa00000.video-codec
		Driver version   : 6.17.0
		Capabilities     : 0x84204000
				Video Memory-to-Memory Multiplanar
				Streaming
				Extended Pix Format
				Device Capabilities
		Device Caps      : 0x04204000
				Video Memory-to-Memory Multiplanar
				Streaming
				Extended Pix Format
		Detected Stateful Decoder

Required ioctls:
		test VIDIOC_QUERYCAP: OK
		test invalid ioctls: OK

Allow for multiple opens:
		test second /dev/video0 open: OK
		test VIDIOC_QUERYCAP: OK
		test VIDIOC_G/S_PRIORITY: OK
		test for unlimited opens: OK

Debug ioctls:
		test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
		test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
		test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not
Supported)
		test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
		test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
		test VIDIOC_ENUMAUDIO: OK (Not Supported)
		test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
		test VIDIOC_G/S_AUDIO: OK (Not Supported)
		Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
		test VIDIOC_G/S_MODULATOR: OK (Not Supported)
		test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
		test VIDIOC_ENUMAUDOUT: OK (Not Supported)
		test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
		test VIDIOC_G/S_AUDOUT: OK (Not Supported)
		Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
		test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
		test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not
Supported)
		test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
		test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
		test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
		test VIDIOC_QUERYCTRL: OK
		test VIDIOC_G/S_CTRL: OK
		test VIDIOC_G/S/TRY_EXT_CTRLS: OK
		test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
		test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
		Standard Controls: 12 Private Controls: 0

Format ioctls:
		test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
		test VIDIOC_G/S_PARM: OK (Not Supported)
		test VIDIOC_G_FBUF: OK (Not Supported)
		test VIDIOC_G_FMT: OK
		test VIDIOC_TRY_FMT: OK
		test VIDIOC_S_FMT: OK
		test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
		test Cropping: OK
		test Composing: OK
		test Scaling: OK (Not Supported)

Codec ioctls:
		test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
		test VIDIOC_G_ENC_INDEX: OK (Not Supported)
		test VIDIOC_(TRY_)DECODER_CMD: OK

Buffer ioctls:
		test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
		test CREATE_BUFS maximum buffers: OK
		test VIDIOC_REMOVE_BUFS: OK
		test VIDIOC_EXPBUF: OK
		test Requests: OK (Not Supported)
		test blocking wait: OK

Total for iris_driver device /dev/video0: 48, Succeeded: 48, Failed: 0,
Warnings: 0

Thanks,
Deepa

Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
---
Deepa Guthyappa Madivalara (5):
      media: uapi: videodev2: Add support for AV1 stateful decoder
      media: v4l2: Add description for V4L2_PIX_FMT_AV1 in v4l_fill_fmtdesc()
      media: iris: Add support for AV1 format in iris decoder
      media: iris: Define AV1-specific platform capabilities and properties
      media: iris: Add internal buffer calculation for AV1 decoder

 .../userspace-api/media/v4l/pixfmt-compressed.rst  |   8 +
 drivers/media/platform/qcom/iris/iris_buffer.h     |   2 +
 drivers/media/platform/qcom/iris/iris_ctrls.c      |   8 +
 drivers/media/platform/qcom/iris/iris_hfi_common.h |   3 +
 .../platform/qcom/iris/iris_hfi_gen2_command.c     |  85 +++++-
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  11 +-
 .../platform/qcom/iris/iris_hfi_gen2_response.c    |  22 ++
 drivers/media/platform/qcom/iris/iris_instance.h   |   1 +
 .../platform/qcom/iris/iris_platform_common.h      |  13 +
 .../media/platform/qcom/iris/iris_platform_gen1.c  |  20 +-
 .../media/platform/qcom/iris/iris_platform_gen2.c  | 144 +++++++++-
 drivers/media/platform/qcom/iris/iris_vdec.c       |  23 +-
 drivers/media/platform/qcom/iris/iris_vidc.c       |   1 +
 drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 299 ++++++++++++++++++++-
 drivers/media/platform/qcom/iris/iris_vpu_buffer.h | 116 ++++++++
 drivers/media/v4l2-core/v4l2-ioctl.c               |   1 +
 include/uapi/linux/videodev2.h                     |   1 +
 17 files changed, 729 insertions(+), 29 deletions(-)
---
base-commit: 1f2353f5a1af995efbf7bea44341aa0d03460b28
change-id: 20251029-av1d_stateful_v3-cbf9fed11adc

Best regards,
-- 
Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>


