Return-Path: <linux-media+bounces-48572-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E079CB3CCC
	for <lists+linux-media@lfdr.de>; Wed, 10 Dec 2025 19:59:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 50AC23010E6E
	for <lists+linux-media@lfdr.de>; Wed, 10 Dec 2025 18:59:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B26B321F39;
	Wed, 10 Dec 2025 18:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qix8vXYT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KMtWz2q2"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E7503242DC
	for <linux-media@vger.kernel.org>; Wed, 10 Dec 2025 18:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765393153; cv=none; b=BBwuLfNO1hKkW99VRjNz8+Fq4hQUh1A/Ir2qN1b+Lx9Y6Wjwvf6pHfPUAxoVh97zKHH29Vyb6076pdRYZbF/nsaynu4iZXiFzgt69pXm1dIRbcYw9D8nwvzlFBA6SdZL4B1YcIqTlsso1YZcYKMip2ZSqUZWXtYPZJLXkJVUyWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765393153; c=relaxed/simple;
	bh=H9BJ7ytikiXTF5xBn3MR+b2EMzvYYPhg73hRx3Dgvi8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ouqfTxl4zwE8lKGiTv4wCLgKtbouS5xtTv2LjP1q9FsdaV4MlBPhIDBl9EiWnCTAhjj7F2FKTi6iOVsbzzhWcpovCM1AWHJDVDG19iKb5UNvkqoG+KiG5mmZRA7cX8RbLT/nybjn/ZBU5KshYa0bhp95v3ThYQ1ekZZ+IvQ3xF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qix8vXYT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KMtWz2q2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BAIRJGP4035051
	for <linux-media@vger.kernel.org>; Wed, 10 Dec 2025 18:59:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=xgeoMTAbktGdoXuloFAy1F
	O6x4MccXA5ixFI31Exa3A=; b=Qix8vXYTjNVG+wBowj5gj2x7wU0S3UbyHrCKea
	Ila7VmJ4tsMh3Te2tLjjM/0mrsWD8xw2rOdmDt83wtTvnwJfgo5MH++LNs2AhcdX
	8y6XGp6RAwFdidinUX+cPXVXEAGVrvyNBeK0XPnNpFxrVaB9bl1hWpji32JN5GX1
	detC+JUWpkyBfgli48BVvMlX9gE39oG5WrjOMR1q9qaxEwDrHYUaRRFKG4ntCiVU
	84ZyywAmEJT4e/1KqmLqo838yuaO8aNwHu2MRQr/8m+s6e3vKe8Esw9lrTqXY92n
	FdKDQ/uyo47lwM9tdhO9HelvaPg5gD0klnEyfMy3nXbB+/Qw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ay63fstux-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 10 Dec 2025 18:59:10 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3436265c11aso48138a91.1
        for <linux-media@vger.kernel.org>; Wed, 10 Dec 2025 10:59:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765393149; x=1765997949; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xgeoMTAbktGdoXuloFAy1FO6x4MccXA5ixFI31Exa3A=;
        b=KMtWz2q2gtqv+LDZx34vsBf1eOgxYqFAMqH7c92NAhwAVss1Upo/noeu7C1qzjYVKb
         XugIrWdyhsXLXCq8djeFiN3B5rHwhS5cHGls4Q535sHwedy/WFTZsbwtzRMdtPxdSR1w
         SWp1v+pesbpVAiBSbl/QheUkRxpYuYWo7EvNO/SXterx3juuRQ4i/qmgvMJhzHNq/HRb
         WSqlsQPmplVR3eICaXwr9N9gQQ12+hr9e5bQKt0oK1AJNMCtyX9A7xLDgFaYZ5cXutRr
         aA4ZvGV4EYfrxpEIz7O+DBSwDedA9hm152gqFBDKDlEntFpAhWZED0alLBHMXK4OsyV/
         qSHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765393149; x=1765997949;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xgeoMTAbktGdoXuloFAy1FO6x4MccXA5ixFI31Exa3A=;
        b=NCHHI4qPADHCC4MZ9Gm5c3S6N0WhzS4jkSs6msJyLAWmfxtxykhuJ9e6RMOwYqhFPH
         nPgZKnsxkSZKdkORIToUkH99+G0XQgjYtKIB/HdjxjbOYXNmmcmJOKRYVZ3jAnNZaKod
         XyNYDnRznVNL33x9DSg0Ejh8tDiipmvh1PDH2UaTD60W+xrdmxz0i1wKaTWPhW760yW1
         86AkHv0QP3agRmDiafjPaWHbWz3yM8sh/7IPMudgJEJt5/JpwqhO0YZkq7z/b/Auh3gl
         Kk26mEUBjGmHLRAfJZw292VfaO7xd4Y6PS03LG9B+Ks5l18RhVMrnzl3JxzEx//eoaGD
         kzIg==
X-Gm-Message-State: AOJu0YwTnWJ6difUiJfwyN+xRHqh9xm/syvRQjCDVZKiMxKE+T46t3Sw
	LJbnSCipgIvM/aUdKpdru71DP/1ViERkiJasD5PBwrgn8cd2X+3fyRGa63VIs7wdUDnP2q2NfFJ
	ML55bWB8jCiuwCzcJlgsfGnjjewH2ZROwpFIzcfjQH5TpC632fBkGgdHYZ5rXkHlvCA==
X-Gm-Gg: ASbGnctwdcvp6nE4jFa5E54sAa9sgu5m1y/XWZcRnATD6jI+oM4R3kciGu6YALRKgfr
	EvfBoLpF2s/I7QfKJWwO/CuzCvmz+taCCRyvPy8JmCAAQdPA2/+NZ7dYLC6CzddDgVKCAjHpvRC
	IJxoRz7fjFvQrOKrhOTzPy5ut/MGjANlJQPveo6FytRXJIHq6rFOpYXzLxtpl219QP3ApLoVQ25
	bxvmSl3JV2iPSP/wY5zSCZceVRpc7g/y/67LRgFLbr4MMVpRcpeFTz2p6rWiZQtCxQanWayzWZo
	v0fhiD+Pntn95GPUyUYmtbk1a7oEIxbkLS0JCa0qi1nA7Vw218+dQfCLpqFJ9JW+BN3kb5F6Z5+
	ijBhWxQoSjoFCy+GtCuLNK5jHqRbeBajSYOaEU1HHEpBV/1JpC2wClfYmAckaWm3D43gR7g==
X-Received: by 2002:a05:7022:517:b0:119:e56b:46ba with SMTP id a92af1059eb24-11f296c8ea2mr1327350c88.4.1765393148763;
        Wed, 10 Dec 2025 10:59:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEtmU6oI68eC4FY0W4VCu4/yUg9lY68cxY5JXxtWGGwhDnQ5BkyrjFF3us3HUNKYLvWiTxcPA==
X-Received: by 2002:a05:7022:517:b0:119:e56b:46ba with SMTP id a92af1059eb24-11f296c8ea2mr1327329c88.4.1765393148142;
        Wed, 10 Dec 2025 10:59:08 -0800 (PST)
Received: from gu-dmadival-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f2e1bb45csm778008c88.1.2025.12.10.10.59.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 10:59:07 -0800 (PST)
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Subject: [PATCH v10 0/5] Enable support for AV1 stateful decoder
Date: Wed, 10 Dec 2025 10:59:03 -0800
Message-Id: <20251210-av1d_stateful_v3-v10-0-cf4379a3dcff@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPfCOWkC/3XQ4WrDIBAH8Fcpfl5LztOo/bT3GKMYPddA26wxD
 Rsl775LN2hgBuTg/ujv8O4iU99SFvvNXfQ0trntLtxA9bIR4egvH7RtIwdCVlJDJd3WjxAPefA
 DpdvpMOI2NMkligA+BsHPPntK7dfDfHv/7Xu63pgenuGxzUPXfz/mjjinfxOw+j+BD6cAVkXSM
 gX12uW8u978KXTn846LmM1RPR2GCo5iBzEEIO8tJrni6KVjCo6eHQ21lo1XLsQVp146hc2NNTv
 KuyaSrfmWX3HMwoHSfgw7zgF60Igu0Ipjnw6XgmPZkckob8EYbNb27JZO6V+OHQOWsEGHqoGCM
 03TD6yk2Sp9AgAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765393147; l=9347;
 i=deepa.madivalara@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=H9BJ7ytikiXTF5xBn3MR+b2EMzvYYPhg73hRx3Dgvi8=;
 b=lEqVRjkgKgDWdk82lLcvwrLgghk30mMDqmDZWPA/qr5Xxu7b0/Fj7dBFRPTGuqZDmD3ssGL6i
 GfPAbFne0aNAGfYlUsKKuhiRmih7Y0vnxQtMPb5nSIYhEZGF/8IEmIh
X-Developer-Key: i=deepa.madivalara@oss.qualcomm.com; a=ed25519;
 pk=MOEXgyokievn+bgpHdS6Ixh/KQYyS90z2mqIbQ822FQ=
X-Proofpoint-GUID: BUi-HiwDQvHMMPeDyysRMx9_Km_xqyLr
X-Authority-Analysis: v=2.4 cv=Y6P1cxeN c=1 sm=1 tr=0 ts=6939c2fe cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=QyXUC8HyAAAA:8
 a=e5mUnYsNAAAA:8 a=PEzcy14RovJRRecV5VgA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: BUi-HiwDQvHMMPeDyysRMx9_Km_xqyLr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEwMDE1NSBTYWx0ZWRfX++LL+2bfHFG4
 zsqa363c4cRaJYpDwBIK/G3kM6ie0Lx+mmFa1sojUpm8KA0qUSUQZOOadE/VVrKCdm4lf1+FA81
 kHxSHpPzZ3pzcX/8bj8qqjunNlFVGWqvdFAMTxKTDST7OsmnOkq74B2GiC4ZeGlZ8iLvLuORjj7
 skruuasYC9GCf4yDOG7VpCS0vRnjG+LvUc5J1tuH12UvYtkNrJ3LAp/QhEvt2x0/NUUiNJyzxLs
 I3j0SMHMlWulvzVLSqlGhSJYUWL+jbcJ1+JEFPx8CgPblqBlr4trVbuLg9QasWEgnfiVM6+OenR
 zMnrl8yKs5X8AfHMM6+MH1ge54I+m14oZLeTAMNVIixm5C8WvMNoDSezW8ftpmlci44556UcpAN
 m/M0VnMA618DSx3RUBQvRea3VYaIEA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-10_02,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 suspectscore=0 clxscore=1015 phishscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512100155

Hi all,

This patch series adds initial support for the AV1 stateful decoder
codecs in iris decoder. Also it adds support for AV1 stateful decoder
in V4l2. The objective of this work is to extend the Iris decoder's
capabilities to handle AV1 format codec streams, including necessary
format handling and buffer management.

These patches also address the comments and feedback received from the
patches previously sent. I have made the necessary improvements
based on the community's suggestions.

Changes in v10:
- Add inst_iris_fmts to all the platforms in gen1 
- Link to v9: https://lore.kernel.org/r/20251209-av1d_stateful_v3-v9-0-718e3b3934b1@oss.qualcomm.com

Changes in v9:
- Add inst_iris_fmts to all the platforms in gen2 (Wangao)
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
 .../media/platform/qcom/iris/iris_platform_gen1.c  |  22 +-
 .../media/platform/qcom/iris/iris_platform_gen2.c  | 159 +++++++++++
 drivers/media/platform/qcom/iris/iris_vdec.c       |  23 +-
 drivers/media/platform/qcom/iris/iris_vidc.c       |   1 +
 drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 299 ++++++++++++++++++++-
 drivers/media/platform/qcom/iris/iris_vpu_buffer.h | 116 ++++++++
 drivers/media/v4l2-core/v4l2-ioctl.c               |   1 +
 include/uapi/linux/videodev2.h                     |   1 +
 17 files changed, 747 insertions(+), 26 deletions(-)
---
base-commit: 1f2353f5a1af995efbf7bea44341aa0d03460b28
change-id: 20251029-av1d_stateful_v3-cbf9fed11adc

Best regards,
-- 
Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>


