Return-Path: <linux-media+bounces-45970-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B6F1C1EAAC
	for <lists+linux-media@lfdr.de>; Thu, 30 Oct 2025 08:01:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0A7E542078B
	for <lists+linux-media@lfdr.de>; Thu, 30 Oct 2025 07:01:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41C7B325710;
	Thu, 30 Oct 2025 07:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BT69XzCc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MtV8mZtW"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1E9C2D3218
	for <linux-media@vger.kernel.org>; Thu, 30 Oct 2025 07:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761807638; cv=none; b=f3w0ilv8pA91tWZcjoQsG9XbmZkDQjGvJFgwl07esbmCLe+6zaz3M9ZOz3hcY+XRo24dEw4m3PLsDW/5Nx7RYkIqcROgFlBVsJUNFDWc88H59q7SaUPS1AU/2yARUStGg//9jO2z6FdxtDnc+79m7cCU7etfpfzV4YGci7+SYjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761807638; c=relaxed/simple;
	bh=GapKOE4+busiV714F9uFp5ab/JEw0dio+e1KPd8/k0c=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=RVs0fQ0DGbuJH0yuWqeak3ulzU2TT8Mes/t6/4fQCn0H74b+GMa6Uqtgm2I1FXXk3U9fKLQZeykYPEE95qQhk6Zt5CzoD6+WZvmkI9yRI7pPmINALwQzqyBzN8zNw21iWWOIS7Q6pRqA3DcA+d9zF4hDQna/51w3GbgQ+ZATdG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BT69XzCc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MtV8mZtW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59U0d0YR811145
	for <linux-media@vger.kernel.org>; Thu, 30 Oct 2025 07:00:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Zmr4ABqTmT0fflvPe/g1GS
	ogr/M5FHC7W2ETmw+4eNI=; b=BT69XzCc7xbtHtKbVZgQuDkAXG1bUK//s1bO1t
	LoxxIeLbwzwl7nmvKMiklW+Q1QceGIlm80lSLll28Gi90S4xPzVezt3JFiTEISXT
	gx/9u/UFyEfW79dwCF1HAuS9LDrXScvNoWVvrEu/5Q9lO2YJnFrY5/NC/C1PuMSz
	yHlubqgrep7it6eLexj/HXiBWeNHBDgzQDMSNpLya6soVxF73q9oKxpxktHCJmQw
	XLZr3oZvVJyIlYYO5QBagUefu/PiVogGaTHl5RMdG8V/pYpSiWbDlsom0g98nvGX
	dneEhCfvAOAHpNrRmSR0CukYTCczdBlwpCfJx3Jw7JTcnbxw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a3mvgajw1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 30 Oct 2025 07:00:25 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-293058097c4so1757245ad.0
        for <linux-media@vger.kernel.org>; Thu, 30 Oct 2025 00:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761807625; x=1762412425; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Zmr4ABqTmT0fflvPe/g1GSogr/M5FHC7W2ETmw+4eNI=;
        b=MtV8mZtWKKljyBI1pzVI7QRN7XpjryFbHdxqMxhzLrI3RRmsS7+q1vvUZ5lApYgNYA
         DrFjBYFtVPBdxq5GHE1A2gWbhdq0LfYsouAXnamNIlzgxue8xhX/R78TK1OgfHDPFJEj
         9LCPkeo7e9mJuYVN3EjU+3wVRM/wmOzi+tBBCdbGsJSz4nbivk3wQawGnsHHz6MjrWph
         41kZ7YLZJktMSOgAIPU4luzYZw/m+az3Mt9axxaG+V9kHO3JpvU9kzGNNv/1/Fnp2+Ld
         AhLAPEercqSwdQIEee3BAyGg7QBgMtHtBa9QMvD2AwDKbj9SGC1UfqCS/A+vukM58q30
         XZhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761807625; x=1762412425;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zmr4ABqTmT0fflvPe/g1GSogr/M5FHC7W2ETmw+4eNI=;
        b=uknLctHOCpmCx5r4hII+oK+I5QwFnO9TFPG3jUoq0Al5i6OvuHmAEXhQTxJQ4PLEuQ
         ORKvwi6bbJA4AOCVTimoWkzbFlX+FbFH0oeTufm89H1XPGALqwurDjCK01Wj70luB6Ei
         t0m+4RYbxMaeVzrjTvz3UbLLli/JktlTO6mkgFIP4XCj9kz7rfOxCs2LCNRfPocD6dbq
         pFSVX4HxVeIwnzd6XpQyktHVThjpKYmklFOfUMz2uKk3rfLzzVxs9Ca7od0qPa2gSeYR
         EOkbjGl79mM0yOtmeJ+TXe9nCIIySML2Tc8YOPU0z7/nI3kBt4cfs7IhxszW++qcS2RZ
         i21g==
X-Gm-Message-State: AOJu0Yw+hjsSi0sZ+dVQ4gsshMXzTn7AP3oSgf/dU+Jp4/1MkJSFV9Me
	Rp9UDNgpXCwxPFNwSXbhsvqXliQefr8mHTAoEXJfE63FgvJ+5gNHsCqm1vbd5BZuN4HT5q0STkN
	Cqd6v8zY7KmzEXEDsLr+6R8kirF/BufaM2NLknagR2TuV3IuPljkcJzru5J7/wddvRg==
X-Gm-Gg: ASbGncvGhZpjyMtAhRBFxEDq5C/F914Ritwgz/mVE/TyF1PXVlXwbYrFyPoeCzc4X25
	tzIwHdEZ77cofpAft1lqyYF8D1wO1sB1gQQW1dHXYdrQjiy03+DWkCHF4nRkyt608EwuV+coVkQ
	H8ofbzue6G/kvz1P1eBLEe/1rc0WA579zd2lbCmvTqCw6iIOEMpDRLCuX/3yITEe6MNGENJgOOH
	+FX6rLCmgHm8ech4yxTEemhbNj/4vh49DbOga7xkfINtz7u2kEUgnEB6MDnIT7tpLuoSM6/1D9B
	M8rAXujdD5VcZMGKXCo//S4F4vqw3JZO3j8k2M2HsuSSwAYr+OmuCOSwvjtMlOy8K037h/NMyjL
	670ungGOxMaUMec4RgcB5C3nb3uwW7DmWvjuiu7x2nD6Y7gebh9HAHIrafiA=
X-Received: by 2002:a17:903:2f8d:b0:269:80e2:c5a8 with SMTP id d9443c01a7336-294deeedda7mr38933875ad.7.1761807624779;
        Thu, 30 Oct 2025 00:00:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEFxON84t/qbpslipPCnA9dvN0NK5l7PBdah00jerzc6zVXjQlMFnp0Q/202nkv4xeS+F98Vg==
X-Received: by 2002:a17:903:2f8d:b0:269:80e2:c5a8 with SMTP id d9443c01a7336-294deeedda7mr38933315ad.7.1761807624017;
        Thu, 30 Oct 2025 00:00:24 -0700 (PDT)
Received: from gu-dmadival-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498d40a73sm177671325ad.74.2025.10.30.00.00.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 00:00:23 -0700 (PDT)
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Subject: [PATCH v3 0/5] Enable support for AV1 stateful decoder
Date: Thu, 30 Oct 2025 00:00:05 -0700
Message-Id: <20251030-av1d_stateful_v3-v3-0-a1184de52fc4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPYMA2kC/0XMQW7DIBCF4atErDsSAzEYX6WKogFmWqTETsGml
 aLcvU6z6PJ/0vvuqnEt3NR0uKvKvbSyzHvYt4NKnzR/MJS8tzLaDKhNAOqYz22llWW7nLuFFCU
 IZ0TKSe23W2UpP3/k++nVlb+2XV5f4z88PVUdcIReMi9Qammwxe8EPFO8MIyeKTk5otBx6ubJR
 2oMableyzqhswH9aEPSzGRjFrbOaDFeHHoaBsneWW3U6fH4BfYjwlTqAAAA
X-Change-ID: 20251029-av1d_stateful_v3-cbf9fed11adc
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, kernel test robot <lkp@intel.com>,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761807623; l=8380;
 i=deepa.madivalara@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=GapKOE4+busiV714F9uFp5ab/JEw0dio+e1KPd8/k0c=;
 b=cbGJjSXSFdFxqeyrjIBOnvmadQVbRnj9MropCQ5BfM1R7vjg8+xJmYxyRDBzF1Oj7e9Ly4EFr
 yCTRQeFS//bDfrMEdNDEmWRT8ehF5THlZCNLKW81fwdy2vRv0lPh3Fu
X-Developer-Key: i=deepa.madivalara@oss.qualcomm.com; a=ed25519;
 pk=MOEXgyokievn+bgpHdS6Ixh/KQYyS90z2mqIbQ822FQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDA1NSBTYWx0ZWRfXxsaO72/m001b
 7bWQeVcGYSXSF9CQc7+cY2otUkLhAdDQOw57N26DUV2St0vVNGWwys1Tobw4v02mKBuuXsezwG8
 1WceeUmhQ+IDxwaMad/WYf8jdyj3npMLeCx2fM6oA6G9Da5Q77ylgqkN9nWBsRx22wk8KJXlsjm
 43mWDD+6RI7oUo6KTB3mn1zr6X83JRM3/LWJJejqQDDbXP8zlHydWbujMGZIhWRc2tfirmnlkM8
 qHSShtGQNnyS9wKBR/uNryeJ4D8bE8ljJnEI6Nk0calpI6oRreaMbMWAm6CKhLqbXiD2QXAJkxi
 izNoVZ4PlzFwKM9kbMjwmlbiMRCAJIedC2LWPrpO4lyWkBdtEZdZQJ0MvwkC6QahBpNa5UA+bGu
 oU1RL+VzE7QizjwsEDKS5GdtTX9fzw==
X-Authority-Analysis: v=2.4 cv=S8XUAYsP c=1 sm=1 tr=0 ts=69030d0a cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=QyXUC8HyAAAA:8
 a=e5mUnYsNAAAA:8 a=rSFLfVtXdW1OZ3NksNsA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: m-93uyz8IReWQzPRw7B9gxIQwNMym-W9
X-Proofpoint-ORIG-GUID: m-93uyz8IReWQzPRw7B9gxIQwNMym-W9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_01,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 spamscore=0 bulkscore=0 clxscore=1015
 phishscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2510300055

Hi all,

This patch series adds initial support for the AV1 stateful decoder
codecs in iris decoder. Also it adds support for AV1 stateful decoder
in V4l2. The objective of this work is to extend the Iris decoder's
capabilities to handle AV1 format codec streams, including necessary
format handling and buffer management.

These patches also address the comments and feedback received from the
patches previously sent. I have made the necessary improvements
based on the community's suggestions.

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
 .../platform/qcom/iris/iris_hfi_gen2_command.c     |  94 ++++++-
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  11 +-
 .../platform/qcom/iris/iris_hfi_gen2_response.c    |  22 ++
 drivers/media/platform/qcom/iris/iris_instance.h   |   1 +
 .../platform/qcom/iris/iris_platform_common.h      |  15 ++
 .../media/platform/qcom/iris/iris_platform_gen2.c  | 156 ++++++++++-
 .../platform/qcom/iris/iris_platform_sm8250.c      |  17 ++
 drivers/media/platform/qcom/iris/iris_vdec.c       |  23 +-
 drivers/media/platform/qcom/iris/iris_vidc.c       |   1 +
 drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 297 ++++++++++++++++++++-
 drivers/media/platform/qcom/iris/iris_vpu_buffer.h | 116 ++++++++
 drivers/media/v4l2-core/v4l2-ioctl.c               |   1 +
 include/uapi/linux/videodev2.h                     |   1 +
 17 files changed, 748 insertions(+), 28 deletions(-)
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


