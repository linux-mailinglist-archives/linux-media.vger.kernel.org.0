Return-Path: <linux-media+bounces-48516-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 48D40CB185B
	for <lists+linux-media@lfdr.de>; Wed, 10 Dec 2025 01:40:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4E9E830E22E7
	for <lists+linux-media@lfdr.de>; Wed, 10 Dec 2025 00:39:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2655F1DF27F;
	Wed, 10 Dec 2025 00:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Um1w8Pt+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hXf4YqZj"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AF901885A5
	for <linux-media@vger.kernel.org>; Wed, 10 Dec 2025 00:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765327183; cv=none; b=InacBnsnuRR/S7Moxws0sFf52knbBuHmEyz+EQdQwnoxLcUUTOJdr6u7ZQp6k0e3Zs6Jmb58O5idpWrVDl3bXyipk+DhIOfqaSC7h/WrhClZTu+0C9jk1nRvssrFHn/+nRss86frmnRPWvkv2uY7e6cTwj+r9WVH4PZ14VnIUaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765327183; c=relaxed/simple;
	bh=BGbxCJlmWxg+xIT8uALL3Wh6xOCMobTPgr2YpnAkwSI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=GtAg4GIEKq4oJO011ySbCjv7h7m9cz0HdeBsKTUSM3C4Q3lRNZQ7M5pawd6Ywl5mpJcFtb/AI5rsWP1Zkh0Wb3kVVfGy+vtl9fP9WzHGhp9AbNgxWljxc48OaaARVb8D0Xuq3S7kpOAnuSPIwNLfZPvkGTo4dTkjFbQ3s3YFAwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Um1w8Pt+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hXf4YqZj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BA0Oc4Y863460
	for <linux-media@vger.kernel.org>; Wed, 10 Dec 2025 00:39:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=WqNyv6hVlOMsVxijAYxgb2
	i2xC3pl6O1AWGedXx4pkU=; b=Um1w8Pt+VPj2p5zdUqYPKSPJdUYD04Dx7BnhJT
	caLUPisD7qqAqyPVAtUKwRT5jLK3Hy78FvRBdPNYY1GttuzhexEmFBy0h0tQksFG
	nzl6R9Okbp0WFgq8KL/RwcAc92pk/inURH2B9CZu/irLKb7ykwHpQBuRLOUV7Yvy
	Ul8TwPZuakoE+3iv50OnmtlbnVm5TE+HEsSobQXojvUpf9rH7Vq1KPbNogEKMaF4
	gtfvfD1WB5Ksvt3xzr6DMDrW6C4NsKZ6VW14HjUi1Z64bg3AsPQZgLdeipw2Y2D6
	MwthyhFJxq6W+lGOKKrikibJg1eR7Gh/g43bGW5fmf4Yzjmw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4axjk52fjj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 10 Dec 2025 00:39:40 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b633babe5b9so296653a12.3
        for <linux-media@vger.kernel.org>; Tue, 09 Dec 2025 16:39:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765327180; x=1765931980; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WqNyv6hVlOMsVxijAYxgb2i2xC3pl6O1AWGedXx4pkU=;
        b=hXf4YqZjTv1mUri1br6ZyrlXPUjh78V6l6PeSvgvPiw4mpdhxLlLwRpYJFSb4yQGDz
         mNPfRDYAbOtGTkWnyvEt0bOZW+W53bVvW5Bb+KB5t9Zvxebzk9Uhjf/Bpmkhg/UK4OeK
         N5pgQ9phlhyVUtLnHIc/+h0g0vKGombT3Y6MRrXc9CzXexkS5t+jIOlup4wwKedFF87D
         QiEB9K70KctV9Fhkh3IFUji96fwwzGBvJt4WiUSBXULd3q/uz35680XxqI1FdSklCjXa
         L3z8Af/c2VkDP2QIZG+1X9E3VXNtLKBLclvebFbcYKGM/8lh9FUem5DRFTmXHBZPYtdR
         yjfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765327180; x=1765931980;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WqNyv6hVlOMsVxijAYxgb2i2xC3pl6O1AWGedXx4pkU=;
        b=pe5FfhKX56yH21W5BnqX6+6/Oe5DiKztonin4VC1R/xiiCl8CQ1JiDi7MKgDMtll7r
         /2mStltiHnmRjwdehCG8rGeATN5IEEoH+Rterg1WiWt0q33JVGiBCD9qT2At3Z4RH31r
         JQ+rEoNgrtIvL1+ldn+jjrLle+WmSc1HAA1w4CqT6wXzI1ZxChNCPL2yr2yE+4fwApMs
         vRubWPvPpTxsfBA8ZIcDEt1/8YvyVycohvpjZDAvAEC2W5rr0bM1Ol5d/lWTkrOcFO9g
         /0j++TFKcLgkUyJSypFki/axIEPPNcSqwQxmHsGkgOcO+SEIshiclh5lHV65dYcm5jFb
         gM0g==
X-Gm-Message-State: AOJu0YwyG/kdj91dEUGh6zjb06JhMxAaKMNOjr3slTd4PSYIJBcnx1kc
	U3dNAH448Tc2M4z7SpkNpVn4hT8g/pNtaFAzBPtOM5R0GLVNxtgmpyWDaHLQ9Y9pL/B7ZnwV/uH
	adljS88VnlV3VZPyXCRHyOU4kqGFM5HuuVSLf25/CtEK16uYzT2hkyhKHVufmS+gCBg==
X-Gm-Gg: AY/fxX4d9Gehusiwx2Y7CGrou/vbpYPfvqOYO6c5o+gTEOvkEGaTEnOEUvXXAachaqN
	uNA+dh6qi9foiFizT2QkbqqYEod+Dufw1j/seIyC/D5BWNbp58AbmMjFDVGn9RrIZX4KTXPbIEZ
	Fa1mVJvIpHA2n9aJYDxp0Wky27oW1nVKhtlSRDssKJ1oH9z0BLFx4zcL5hy4mJshjgsKDuG08Y5
	N/dG28YBJeVNf0Hi2rf4nZeE3Jm2NTqcYPZ9gU+QEEMJNKDlpsKNC8uyMJxE6N6r4otW0K1zatT
	O+z+G1IVP4KuzcQVG1kPKMzXAMoXlijUZmAxNo6QP/uPzZ+bLEhqUwph9YVJkwbqN3b6HCqM/ck
	gv7+ks4ynuSfESlSUKrWyJCt0ynYSigeoWiYjGX4fvPz9mC3WBWFhmw9oKN9KgGGbKEFDaA==
X-Received: by 2002:a05:693c:800b:b0:2ab:ca55:8942 with SMTP id 5a478bee46e88-2ac05595d3emr236635eec.9.1765327179659;
        Tue, 09 Dec 2025 16:39:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHflFMaUjgQhIGNnlJTK13Jw3ANG8y0obPGsOUXTC2h1dVoOieZarEGfXFiHE5srdizJUD2Bg==
X-Received: by 2002:a05:693c:800b:b0:2ab:ca55:8942 with SMTP id 5a478bee46e88-2ac05595d3emr236621eec.9.1765327178807;
        Tue, 09 Dec 2025 16:39:38 -0800 (PST)
Received: from gu-dmadival-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2aba822b615sm46666784eec.0.2025.12.09.16.39.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 16:39:38 -0800 (PST)
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Subject: [PATCH v9 0/5] Enable support for AV1 stateful decoder
Date: Tue, 09 Dec 2025 16:39:33 -0800
Message-Id: <20251209-av1d_stateful_v3-v9-0-718e3b3934b1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEbBOGkC/3XQ22rDMAwG4Fcpvl5KfYrtXu09xiiKLa+GtlnjJ
 GyUvPuUbpDAHDAC/cifQA+WsUuY2XH3YB2OKaf2Ro172TF/htsHVilQz8RBaH4QroKRh1Puocc
 4XE6jrHwTXcTAOQTP6NtnhzF9Pcm399++w/tAcr+E55T7tvt+rh3lnP5tkIf/G+hRyrlVAbWIX
 r22Oe/vA1x8e73uqbDZHNXiEFRwFDlSes8RwMooNhy9dkzB0bOjea1FA8r5sOHUa6dwubEmR4F
 rAtqapmDDMSuHl+5jyHGOS+BaSudxw7GLQ6XgWHJENAosN0Y2pTtP0/QDkGedhjQCAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765327177; l=9174;
 i=deepa.madivalara@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=BGbxCJlmWxg+xIT8uALL3Wh6xOCMobTPgr2YpnAkwSI=;
 b=qaSCm+A/BiAGLNrDfXXJDgf8NhniWKfM0Y6HbRDoOtrduAzcTWmopzhlt2g3RM7my70ANVu+L
 g01+niX9UdRDYLCbjIFW03kbLYooA/3Bsu+VWx3x3iWNKviode3tf83
X-Developer-Key: i=deepa.madivalara@oss.qualcomm.com; a=ed25519;
 pk=MOEXgyokievn+bgpHdS6Ixh/KQYyS90z2mqIbQ822FQ=
X-Proofpoint-ORIG-GUID: bS4YrCA0KMnTv6nUFbr1OAGlxnfumm9f
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEwMDAwMyBTYWx0ZWRfX/alftIgbQefy
 lKxuBnX5uu3ZdPAsmucE2BkO5MmOLeVtQF5Zdt3XAKOmnoTGTZXIKmP8w4qQOVHl+ns/1iybSuu
 ZRQCfIdbM8pNP/o3O26U2W2IscHHjKem56UU8dNM6T2/Wzjl7JYuwgzNpS3VRCC73Y1pE/eFOUb
 nvhfg3iKjA+xww/10sEwUS2fSrgVB2+EtfxKLTM0QTVeo3FFYCSek2wI/MYApIXzAa2j7lrrHB0
 My8rhZ+gEkOziEOIbuZdP0D79bUoTHZFqsnunqF6drFbLuOype/ja/ORpPp3Y9fGyo8i5x/by4Y
 8z1yryIAvsHw4/xp+AueKDg6Z1R0xFSPUp+05CxrbwCrCqG1KZQJkPbRfJ411NkQ5D5VADmI0pX
 Yh8EkMdfjtEZOpLiwRBDROaxYC0HOg==
X-Proofpoint-GUID: bS4YrCA0KMnTv6nUFbr1OAGlxnfumm9f
X-Authority-Analysis: v=2.4 cv=RqvI7SmK c=1 sm=1 tr=0 ts=6938c14c cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=QyXUC8HyAAAA:8
 a=e5mUnYsNAAAA:8 a=rSFLfVtXdW1OZ3NksNsA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_05,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 suspectscore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512100003

Hi all,

This patch series adds initial support for the AV1 stateful decoder
codecs in iris decoder. Also it adds support for AV1 stateful decoder
in V4l2. The objective of this work is to extend the Iris decoder's
capabilities to handle AV1 format codec streams, including necessary
format handling and buffer management.

These patches also address the comments and feedback received from the
patches previously sent. I have made the necessary improvements
based on the community's suggestions.

Changes in v9:
- Add inst_iris_fmts tp all the platforms in gen2 (Wangao)
- Spaces to tabs (Bryan)
- Link to v8: https://lore.kernel.org/r/20251202-av1d_stateful_v3-v8-0-2f74a81773b4@oss.qualcomm.com

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
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |   9 +
 .../platform/qcom/iris/iris_hfi_gen2_response.c    |  22 ++
 drivers/media/platform/qcom/iris/iris_instance.h   |   1 +
 .../platform/qcom/iris/iris_platform_common.h      |  13 +
 .../media/platform/qcom/iris/iris_platform_gen1.c  |  20 +-
 .../media/platform/qcom/iris/iris_platform_gen2.c  | 159 +++++++++++
 drivers/media/platform/qcom/iris/iris_vdec.c       |  23 +-
 drivers/media/platform/qcom/iris/iris_vidc.c       |   1 +
 drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 299 ++++++++++++++++++++-
 drivers/media/platform/qcom/iris/iris_vpu_buffer.h | 116 ++++++++
 drivers/media/v4l2-core/v4l2-ioctl.c               |   1 +
 include/uapi/linux/videodev2.h                     |   1 +
 17 files changed, 745 insertions(+), 26 deletions(-)
---
base-commit: 1f2353f5a1af995efbf7bea44341aa0d03460b28
change-id: 20251029-av1d_stateful_v3-cbf9fed11adc

Best regards,
-- 
Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>


