Return-Path: <linux-media+bounces-46209-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id F20EAC2C134
	for <lists+linux-media@lfdr.de>; Mon, 03 Nov 2025 14:28:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id BC4FE4ED19F
	for <lists+linux-media@lfdr.de>; Mon,  3 Nov 2025 13:24:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38E932609C5;
	Mon,  3 Nov 2025 13:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RWtX3PyC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kjNzHAVI"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B742725FA3B
	for <linux-media@vger.kernel.org>; Mon,  3 Nov 2025 13:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762176261; cv=none; b=liw+ilcVWn4C1hu2qkbebeOu0mqjYUc9O5Gt0XWd5xvCqytFMVsHi1EcvjcMN+aDdb7C3wUm1a+9X+qkss/dN0PHVVW5VyDMcaLGM3ODJTmrBr7ZOxqd3XLd+2a5P+ePhlUHoPV49rJSzrrjmfFTH8Usm/nz2lRUKpx8yue2T14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762176261; c=relaxed/simple;
	bh=4GiV1leOvjQf6LQXwmXmu6W51LCKiEyR5Xm/WJswbxM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=gJtxWBDi/NInUlgnbvlUVbscY1d9NcFouCCGqBaZ5+ge+iH68WYWQB8WB3FVLGlSuZtQdpmrhZWvLUYjVs3EOl03vlsSnNTULT/hOPme5IHQxa3B9zOYFArGYg9ilCs/uA0bya2dPG1bP2We4lbkSPVxrBV55VkRPfexGvNTKoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RWtX3PyC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kjNzHAVI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A38r4nb1354754
	for <linux-media@vger.kernel.org>; Mon, 3 Nov 2025 13:24:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=iJRs/EDNyyv08MDiIiSOAv
	pzehctYeiqFguWrB54Vp0=; b=RWtX3PyCwaUlOkGx+p32S4nNG9Kj8RHvrpVUqC
	QdjSJHgeaw+OgyntRyTc7B7LLfwIy53al8Ssx71F/jqVO0BGCXxuJ5fjX+JqRkFs
	i1fHj8KMSvpjam5wFuzFB72ht7Sy8TeoX0HEJHXJ9/mKvhUTRvYZ2ophQgLutQlq
	/9Qgy2FrWCYRhCr29aktxivCR7VMs07uB253iFHrWC1xmVfTTsKJCsJPf8xznj5L
	j9Z2SX3Ig76Xp3RDs+H+Kq2xQ/GruGM9hSxLaBx6X6C6Jl9Yf4t0UPNNrToS9JUk
	Wf4wwxzbAPwNhKW5Yz8dDPeLX3+XHCmwkDNIQqTq+f3pWa2w==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a5bcm4n6s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 03 Nov 2025 13:24:18 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-340886bfe01so948590a91.2
        for <linux-media@vger.kernel.org>; Mon, 03 Nov 2025 05:24:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762176258; x=1762781058; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iJRs/EDNyyv08MDiIiSOAvpzehctYeiqFguWrB54Vp0=;
        b=kjNzHAVIAgoH/5lB7Juvo4ihg1BjQNnhi4uYBUPQ4ZnrpM6XSe0GJZ5wUf1jvN+6y+
         O609Qf4HhaKwtxWnb/A7J06avZAaXnZouNF8xCNhj6RkGmenKShpqU38ajuRdULPwOHi
         b2nQ6PaBdo6piG5gLnBie3hdy1YjHZowErB2zZq7jysXgJ/uvZ84X+lVXEEAlVXwDIVZ
         /nKp0h21zc0wd1t8kJOvwamy/+wIclVfJ3l5WqlZYBHxIJugynzr19hObM+vaJ0pjUYF
         ySRlGKaGQHn1srq/M46nkPPg0gcloeX4gi1qRabjMCjDQt0NRd5FIZFJbgU+fNcRuN8q
         /Vag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762176258; x=1762781058;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iJRs/EDNyyv08MDiIiSOAvpzehctYeiqFguWrB54Vp0=;
        b=fEPS4blPeT9ngqfeTq9NUQeD6NQ7o02vruCN7hZpbO9sW1sJZoB8Lgd/1a3uD7hOLy
         ybPm0Jsy/wyjpB3D/ZiRwcrc8AyObV9SG/UbyU4dEE5hMbifWSdG+hBlXNlZFmeC9C3j
         nJKUbfz8NU4TxjosrffWOfi6a2V61jeZXQJeteGsndrNr2JFOiYWQkPLCRiBYk3v7ZEx
         0lQvtJN22d3WejhKXt1Y1tDgOJaDLgFpRGGaAmPlOoGkOMbVWbkcSmYmR40GmRo2DzFK
         myuL3e9z0eQe1agtNOeL60LVtX0ZjrUMrpOSWslDrIsLe/30wtAlc00VLZahD6UcsDW/
         WkLw==
X-Gm-Message-State: AOJu0YxVP3XDZPzQmb9jxv/ssLFKxAaPdYEtz9qUgJa+3OtJL2QK3PU4
	S5MUq5hTpOFeRW8i8Igh7QQP1NcktTGabUwinvyL4smT5JX3XPnOW1knfdDufXgltCv4OelE0Xn
	rpvFNmyBZdVAwwiUN3k47gVb55WAnJBpeqAardfRZwAybdp/05P6y4LjsrVjjb+OsNw==
X-Gm-Gg: ASbGnctLM0/Dyxke36F9GbSF+l91THJGEzuIcxPPD5mBuxH7H3ujryose4tY1tOpjtu
	m6Y4O7E2Pb+3eXq8yQFFJukAJdE44o5wZ+84jU6wgIV1ummM4fGbIc7kKdmxF9LOoYIDh/y9Uo/
	0sCEJkoosrAZIWlukMVnc70M9U32PhYH8dP/xZbb4TLhdsXoO+QnhkK5lZ34U4PDOvXekaX4lrb
	yLIgSDIss5Ooo+Kc6uR6HDsxkQRcNxPbJV0dOaM1cCAfoHZkOTMK6zgMomipowOk7zoqzeUnG9v
	qk9H1msDuLxdcfoqJYoNaO9/2fhFArHShELxg78ymAlZP2/ipA/+67Dmt1B0oh83b7ungA4XCP2
	JpYgBFnHKRa5V7fq221aLsZKYinwq2uxs1SotMXsfz1WZafPXXsmLKCCmRfc=
X-Received: by 2002:a17:90b:1644:b0:341:124f:4745 with SMTP id 98e67ed59e1d1-341124f559bmr2586276a91.6.1762176257986;
        Mon, 03 Nov 2025 05:24:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGWD1W7mBnryxkMQuODP/QY8ikkuWvdNGBhIUkx/asALxNhVx7uiUYNfLWCK7uQ6/F3E2Et+Q==
X-Received: by 2002:a17:90b:1644:b0:341:124f:4745 with SMTP id 98e67ed59e1d1-341124f559bmr2586242a91.6.1762176257270;
        Mon, 03 Nov 2025 05:24:17 -0800 (PST)
Received: from gu-dmadival-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3407ec24330sm6614812a91.2.2025.11.03.05.24.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 05:24:16 -0800 (PST)
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Subject: [PATCH v4 0/5] Enable support for AV1 stateful decoder
Date: Mon, 03 Nov 2025 05:24:04 -0800
Message-Id: <20251103-av1d_stateful_v3-v4-0-33cc1eaa83f2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPWsCGkC/2WPzWrDMBCEXyXoXAWt5P9T36OEsJZ2G4FjJ5Ktt
 gS/e2X70ENhWZiB/XbmJSIFT1F0p5cIlHz005hF8XYS9objJ0nvshZa6RKUbiUmcNc440y8DNd
 kpO25ZXIA6KzIZ49A7L935Mfl0IGeSybPh/kH7jaqaqGRyTuapA8+yqX/spJG7AeSTU1oKy6As
 eiS3vA9RpJ2ut/93EFlWqgb01pFhKZ3TKbSinXNFdRYluzqyigtthw3H+cp/OxNk9mDHKWM+l8
 qT3YBmsJRqdkW71OM5+eCw/b6nJe4rOv6C0UnrJY/AQAA
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
        Nicolas Dufresne <nicolas.dufresne@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762176256; l=8613;
 i=deepa.madivalara@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=4GiV1leOvjQf6LQXwmXmu6W51LCKiEyR5Xm/WJswbxM=;
 b=nHu+ZhjG8/wAnQ8v+hzeMpavu7CWYCS9J4/mWdhV0Gg/QQqWZ/4xgPfShDGGjsKk9SiK36I+K
 wYH0OpaAVY4AHB5k77aRAvup1+hS/y7ElR12zvL9eROVUcn8UAO9O2w
X-Developer-Key: i=deepa.madivalara@oss.qualcomm.com; a=ed25519;
 pk=MOEXgyokievn+bgpHdS6Ixh/KQYyS90z2mqIbQ822FQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAzMDEyMSBTYWx0ZWRfX2DKRtrkcX17E
 EpkIF3I9ioeCYU2jXj+9VBlHPubl9COdZ85dH0snRjt3A9qCmUcfYeV+6PjOeL8Tlld3xXgIMf3
 +kSt6IAwgOpvLJiQklvpMjWnkqT8fKfZYYf3CTrXBjaHKffHrNbLLKcIETYLKC058LTd3i2vEKQ
 +pazNY1WXyICF030F/q2QFeHoR17uTWr8xFO8bblcbnPpN0exA/YLONRaSD1KSeLizKLe3ghNE4
 kctlEcRF/ZnUTOyxwIrMiRNS+72SqSIfwcN+AG91zTrSlaUm3YiLl3CiC3qIzOcKBcYTCaWKj2U
 c3ebsTJOB9C22Orpwti1CniCdbpQTZe/wGendKziJWr3Fq3EO+f6k6cxQkRK4T9zM2iUyEUn1/x
 5UPRxYM8yqZ35qbmE6557awBmUphOw==
X-Authority-Analysis: v=2.4 cv=EszfbCcA c=1 sm=1 tr=0 ts=6908ad02 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=QyXUC8HyAAAA:8
 a=e5mUnYsNAAAA:8 a=rSFLfVtXdW1OZ3NksNsA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: 5b4Z1tScckh_67NP41s7iZf4__ip_ZNs
X-Proofpoint-ORIG-GUID: 5b4Z1tScckh_67NP41s7iZf4__ip_ZNs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-03_02,2025-11-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 priorityscore=1501 spamscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511030121

Hi all,

This patch series adds initial support for the AV1 stateful decoder
codecs in iris decoder. Also it adds support for AV1 stateful decoder
in V4l2. The objective of this work is to extend the Iris decoder's
capabilities to handle AV1 format codec streams, including necessary
format handling and buffer management.

These patches also address the comments and feedback received from the
patches previously sent. I have made the necessary improvements
based on the community's suggestions.

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
 .../media/platform/qcom/iris/iris_platform_gen2.c  | 142 +++++++++-
 .../platform/qcom/iris/iris_platform_sm8250.c      |  17 ++
 drivers/media/platform/qcom/iris/iris_vdec.c       |  23 +-
 drivers/media/platform/qcom/iris/iris_vidc.c       |   1 +
 drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 299 ++++++++++++++++++++-
 drivers/media/platform/qcom/iris/iris_vpu_buffer.h | 116 ++++++++
 drivers/media/v4l2-core/v4l2-ioctl.c               |   1 +
 include/uapi/linux/videodev2.h                     |   1 +
 17 files changed, 726 insertions(+), 27 deletions(-)
---
base-commit: 163917839c0eea3bdfe3620f27f617a55fd76302
change-id: 20251029-av1d_stateful_v3-cbf9fed11adc
prerequisite-change-id:20250918-video-iris-ubwc-enable-87eac6f41fa4:v2
prerequisite-patch-id: 11fd97eabf65d22120ff89985be5510599eb4159
prerequisite-patch-id: aea5a497f31db23a05424fe2cddedec613571f2a
prerequisite-patch-id: e3b10c34426c33432208e120a3e1239630893d88

Best regards,
-- 
Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>


