Return-Path: <linux-media+bounces-48106-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 08D79C9D4CF
	for <lists+linux-media@lfdr.de>; Wed, 03 Dec 2025 00:12:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3A8634E5D4B
	for <lists+linux-media@lfdr.de>; Tue,  2 Dec 2025 23:09:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 101B1329E42;
	Tue,  2 Dec 2025 23:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MhdNVzHa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aKYSD/nU"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94F98327C17
	for <linux-media@vger.kernel.org>; Tue,  2 Dec 2025 23:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764716639; cv=none; b=JSfN54Bg+9zMUmiroOhfBJ7yh2TaFKNb7yA2Kig1i7lI9rMLQ3z9jce9V4BarHdsEJCUAntFsc/kmRXoY/Xn0bf1z8v3NoZRjYgNjMxgx6cdfKCbqJR9Ej5lHIhQBcH7v91eApeH9ILsLCltHofJRfoCcdJ9SoNfE+6unBXbjCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764716639; c=relaxed/simple;
	bh=cPPuWEXUIwDLIfVn0dddrEpGaIvTrVtahDka34Tv5X0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TwmS6v3CY2q3u+2Qviu3tO05sr3sUfphfVjzGQl/CJaI35RGbHSBwU9ZErw8FovMMPeQQQk/zGlYrG0bbDDHGxsXFHYiIPTBlsErAH4+b3wWqndcbFQdeYHU7pXNQU3mxHexWRH/v2wDNaNNLYuL38gv53+OCTRkA4sJR2gxqpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MhdNVzHa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aKYSD/nU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B2LsdYJ919840
	for <linux-media@vger.kernel.org>; Tue, 2 Dec 2025 23:03:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Tv8QXvnhpQxuAJ6evYOHRcQitQiPhB7Hmhcga2z2pzE=; b=MhdNVzHawGu6QLql
	yUlMUg+zFSh7Ti3KSPIt17p7KPa1N5VTCNOYlsLsnoAJWNrCV68eMmJ82uTNFloy
	PXRODvspMReHm0CkTvnF9l51h7kh9A5FuXOJOtzHcHmJzD2V4Lwq0eGthKIjDnm7
	jEF1eRbtuyNKgbheSUqXN6fSF3McoGjpN0+Azi5d8ST/G3R47nmK0e7G+o4VKvkM
	BTftgXGAG3X9DtDlCtrDLTk3nAjeD0TtB1EwHztAQJViFOQm1uT/pNgOlAXMithd
	W0aDWxeSnptjzp3ojxHW/Hmksg+MwRuXnIyiTPnULa8r3ft4eeVLZ7CxMGntaWO7
	Vo51rg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4at8eb05at-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 02 Dec 2025 23:03:55 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2964d6164bfso14047695ad.0
        for <linux-media@vger.kernel.org>; Tue, 02 Dec 2025 15:03:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764716634; x=1765321434; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tv8QXvnhpQxuAJ6evYOHRcQitQiPhB7Hmhcga2z2pzE=;
        b=aKYSD/nUlf+zRgsmGpW/3TGif3UaAKVbVbw9BC0Cs4XrwLx9GJxRVZsb/WLDAK+EDl
         PCwkPZEQc5YTT8CIYbEVrcPscL2mbkHxp0Lz3fCAAdUF/N/w/+/5SVc8hxBwemqVgH/4
         9LYjMMwlcY7KlRqh9wxZ4RiFt4F7sxFnqkXKnThs1Ba0qBOREopMyyL8E/Uex6Od7DCa
         bzOUjoUgRLUvgsM65/uOKM3Z44rBs8DhzKWRHyHuGcf+RoL4X17SB4oXZKOrCgVInQ8x
         akVb3uQH1pSxWL1toj47Cii+U0qeMZxumyoovCoEcxSJwYLsuMJFmran8Ye6x1bzu8d/
         U7jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764716634; x=1765321434;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Tv8QXvnhpQxuAJ6evYOHRcQitQiPhB7Hmhcga2z2pzE=;
        b=QalO7H4tH81nqfcK48K5vUkCi5E42+qoq52PPG2OZh4GE0VtqDTnFoaz8AJErVAtEd
         FXnwh5inCRNwL9g5sRJx0REVVlxF7nxPuDmoPPaL6t8vDEqXlQX2tU0wiP3hXhvji/4G
         gw1ZsmiejmO6iz+Ztuz+ncH6kLQcMULeHBJA5muUkd34ecauHgVERO7wxF7APKItwaid
         d1gwFk6aYOoZ3O45XUoe/QFpx8AQLF+Y7TdXkcrHUynMY+7XlSpkVn8ZN8N+lUHbIa0d
         WU29KTOKwuuxF6IFhCrnTw2igKPgEhjCK+u0XNTo617BSu4YXRALVq0PeEtq4ncILKk4
         iDsg==
X-Gm-Message-State: AOJu0YwYWwGLmk68MQQwaw/mSmlvxnvy223fWsZWonl3nd5xWdnQXaIQ
	56rB20quPDx2wnE7fNB72r/uOV1nuu769NW5VZ5nZEplRruiLFHJmADxmZncuQVWex7Qzgrmyy4
	668SOQ85hkV0KYhRv5kxIJUUL+QnW9at4evNL9L0r5GyCuME1/2sin18XJ8x80to8t51n46URGQ
	==
X-Gm-Gg: ASbGncvrzUFAkJ3xScwRayc9CxDMrtd+IzYZjs8NyOy853Nl9sQCGaYsn1W+B4mAVh3
	OvDLed4XT0K+IV42SwTh6TgSNJkP9c6Hvc2gzjl4xVGxkKOj2rrjbZaBZEjqLPdTXf4/Ts8dhbU
	D3b6G92famaBrFSIrUcZAEy5pRLk1O2G7Cyh+3VQkrhMSASUnGCES+D9iXqxuzGuSBXqr9pvlLl
	0LzhCdbX4B0fiVsiZSlGLsbn4jiZ691rncvOFaxnjRvelW8M/UcH4hbU9FvcXCtC1KrqHH4Vc7V
	ZD5Q3T4dLYEAKqNoxeqcNo7kpAd9tmjzV7uuToaGo2LBQZbTwvpJjfayzLQUI0Fr++Fcd1NDkyL
	Qxy9YWo6V4LjqRue533iJMljZs/1K00CjILHJAIEa5mE36DwQdd4/uJxzVhoo2xwywUOyGg==
X-Received: by 2002:a05:7300:ad08:b0:2a4:7ea4:3ebf with SMTP id 5a478bee46e88-2ab92f33ce8mr157705eec.3.1764716633853;
        Tue, 02 Dec 2025 15:03:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHJiNVGA7n7D8AAXdVf/hAdQ+dX1IJBqpBg+Jg2PC4XFat7VcrO/k6xviT2YRU0UEPm+QBELg==
X-Received: by 2002:a05:7300:ad08:b0:2a4:7ea4:3ebf with SMTP id 5a478bee46e88-2ab92f33ce8mr157676eec.3.1764716633156;
        Tue, 02 Dec 2025 15:03:53 -0800 (PST)
Received: from gu-dmadival-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2a965ae9d06sm59214149eec.4.2025.12.02.15.03.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 15:03:52 -0800 (PST)
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Date: Tue, 02 Dec 2025 15:03:44 -0800
Subject: [PATCH v8 3/5] media: iris: Add support for AV1 format in iris
 decoder
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251202-av1d_stateful_v3-v8-3-2f74a81773b4@oss.qualcomm.com>
References: <20251202-av1d_stateful_v3-v8-0-2f74a81773b4@oss.qualcomm.com>
In-Reply-To: <20251202-av1d_stateful_v3-v8-0-2f74a81773b4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764716630; l=8112;
 i=deepa.madivalara@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=cPPuWEXUIwDLIfVn0dddrEpGaIvTrVtahDka34Tv5X0=;
 b=xnh/2cuqlK1iF+NkqObipWcSF6l+5jnp9htWwl2zy02X2LLIxO4u3fBPGgH7fjv5W1kMjtMV5
 ZJX5/RI+226DXGifKLEbaEVoZ0zN5Xa8QJl1BwoFFS38YphOhd/nasQ
X-Developer-Key: i=deepa.madivalara@oss.qualcomm.com; a=ed25519;
 pk=MOEXgyokievn+bgpHdS6Ixh/KQYyS90z2mqIbQ822FQ=
X-Authority-Analysis: v=2.4 cv=e98LiKp/ c=1 sm=1 tr=0 ts=692f705b cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=Z_4drlmlzYXD-T4lrkMA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: ZrzhYYbtfcLlAuPoxJukq01HIg6On1oo
X-Proofpoint-GUID: ZrzhYYbtfcLlAuPoxJukq01HIg6On1oo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAyMDE4MiBTYWx0ZWRfX+wkHey8OFimM
 dxPpTJh2cFaoimfVbg64RGoTl0InQD+9r8r0RnYl3/+3uexFa6nROwaM+HIW4m7q8iGt26PqZim
 uEIr+sRZxVhxKQyptnEVac7IO6XkVGhWGCps2qkOvA2Quge0RKnQh5j/3L9v5lkfuT0RARM98lZ
 UZWUbR3s8FekbUmMkO60KmWGH3FXmlM9a9FWlZaaA5pvPGP67sH/S1czvTOXiDaUhP6qQjqk3iD
 IkF8DvoD7WYvDUVQmLX3UfncmV+R4qgyvHGQrTBIMmiRUL6QN1W2E2yTeUBY+2ZMMuX80cLRnFw
 OxXxYz8dYxUE42j/sR0G6DATjfvUvvxlanNufNhTbtnOeUwApZinoujzA2HJKYsgyy4o/BSfhay
 OXDXpAmECITcB/TSAAVQSwzciHPlpQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-01_01,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 phishscore=0 suspectscore=0 bulkscore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512020182

Extend iris decoder driver to support format V4L2_PIX_FMT_AV1.
This change updates the format enumeration (VIDIOC_ENUM_FMT)
and allows setting AV1 format via VIDIOC_S_FMT for gen2 and beyond.
Gen1 iris hardware decoder does not support AV1 format.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
---
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  1 +
 drivers/media/platform/qcom/iris/iris_instance.h   |  1 +
 .../platform/qcom/iris/iris_platform_common.h      |  2 ++
 .../media/platform/qcom/iris/iris_platform_gen1.c  | 20 ++++++++++++++++-
 .../media/platform/qcom/iris/iris_platform_gen2.c  | 25 +++++++++++++++++++++-
 drivers/media/platform/qcom/iris/iris_vdec.c       | 23 ++++----------------
 6 files changed, 51 insertions(+), 21 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
index 1b6a4dbac828ffea53c1be0d3624a033c283c972..3d56f257bc5620aacec2bb7e11253dc7c83b7db9 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
@@ -139,6 +139,7 @@ enum hfi_codec_type {
 	HFI_CODEC_DECODE_HEVC			= 3,
 	HFI_CODEC_ENCODE_HEVC			= 4,
 	HFI_CODEC_DECODE_VP9			= 5,
+	HFI_CODEC_DECODE_AV1			= 7,
 };
 
 enum hfi_picture_type {
diff --git a/drivers/media/platform/qcom/iris/iris_instance.h b/drivers/media/platform/qcom/iris/iris_instance.h
index 62fbb30691ff967212022308fa53ff221fa24ce9..7e4f5f1dd8921c57db039fbd4bc2f321891348db 100644
--- a/drivers/media/platform/qcom/iris/iris_instance.h
+++ b/drivers/media/platform/qcom/iris/iris_instance.h
@@ -19,6 +19,7 @@ enum iris_fmt_type_out {
 	IRIS_FMT_H264,
 	IRIS_FMT_HEVC,
 	IRIS_FMT_VP9,
+	IRIS_FMT_AV1,
 };
 
 enum iris_fmt_type_cap {
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 8d8cdb56a3c7722c06287d4d10feed14ba2b254c..6e8e762bd5cf704d7932536bea56d4bdfc1bc598 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -217,6 +217,8 @@ struct iris_platform_data {
 	u64 dma_mask;
 	const char *fwname;
 	u32 pas_id;
+	struct iris_fmt *inst_iris_fmts;
+	u32 inst_iris_fmts_size;
 	struct platform_inst_caps *inst_caps;
 	const struct platform_inst_fw_cap *inst_fw_caps_dec;
 	u32 inst_fw_caps_dec_size;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen1.c b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
index 34cbeb8f52e248b6aec3e0ee911e14d50df07cce..ac0a26555d2f04066ac2adef68be10bb09b8dc4c 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen1.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
@@ -11,6 +11,7 @@
 #include "iris_hfi_gen1_defines.h"
 #include "iris_vpu_buffer.h"
 #include "iris_vpu_common.h"
+#include "iris_instance.h"
 
 #include "iris_platform_sc7280.h"
 
@@ -19,7 +20,22 @@
 #define BITRATE_PEAK_DEFAULT	(BITRATE_DEFAULT * 2)
 #define BITRATE_STEP		100
 
-static const struct platform_inst_fw_cap inst_fw_cap_sm8250_dec[] = {
+static struct iris_fmt platform_fmts_sm8250_dec[] = {
+	[IRIS_FMT_H264] = {
+		.pixfmt = V4L2_PIX_FMT_H264,
+		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
+	},
+	[IRIS_FMT_HEVC] = {
+		.pixfmt = V4L2_PIX_FMT_HEVC,
+		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
+	},
+	[IRIS_FMT_VP9] = {
+		.pixfmt = V4L2_PIX_FMT_VP9,
+		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
+	},
+};
+
+static struct platform_inst_fw_cap inst_fw_cap_sm8250_dec[] = {
 	{
 		.cap_id = PIPE,
 		/* .max, .min and .value are set via platform data */
@@ -337,6 +353,8 @@ const struct iris_platform_data sm8250_data = {
 	.dma_mask = 0xe0000000 - 1,
 	.fwname = "qcom/vpu-1.0/venus.mbn",
 	.pas_id = IRIS_PAS_ID,
+	.inst_iris_fmts = platform_fmts_sm8250_dec,
+	.inst_iris_fmts_size = ARRAY_SIZE(platform_fmts_sm8250_dec),
 	.inst_caps = &platform_inst_cap_sm8250,
 	.inst_fw_caps_dec = inst_fw_cap_sm8250_dec,
 	.inst_fw_caps_dec_size = ARRAY_SIZE(inst_fw_cap_sm8250_dec),
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index c1989240c248601c34b84f508f1b72d72f81260a..d5b74082ddaa3ba731913a467f47229a49e06d2d 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -19,7 +19,26 @@
 #define VIDEO_ARCH_LX 1
 #define BITRATE_MAX				245000000
 
-static const struct platform_inst_fw_cap inst_fw_cap_sm8550_dec[] = {
+static struct iris_fmt platform_fmts_sm8550_dec[] = {
+	[IRIS_FMT_H264] = {
+		.pixfmt = V4L2_PIX_FMT_H264,
+		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
+	},
+	[IRIS_FMT_HEVC] = {
+		.pixfmt = V4L2_PIX_FMT_HEVC,
+		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
+	},
+	[IRIS_FMT_VP9] = {
+		.pixfmt = V4L2_PIX_FMT_VP9,
+		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
+	},
+	[IRIS_FMT_AV1] = {
+		.pixfmt = V4L2_PIX_FMT_AV1,
+		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
+	},
+};
+
+static struct platform_inst_fw_cap inst_fw_cap_sm8550_dec[] = {
 	{
 		.cap_id = PROFILE_H264,
 		.min = V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE,
@@ -759,6 +778,8 @@ const struct iris_platform_data sm8550_data = {
 	.dma_mask = 0xe0000000 - 1,
 	.fwname = "qcom/vpu/vpu30_p4.mbn",
 	.pas_id = IRIS_PAS_ID,
+	.inst_iris_fmts = platform_fmts_sm8550_dec,
+	.inst_iris_fmts_size = ARRAY_SIZE(platform_fmts_sm8550_dec),
 	.inst_caps = &platform_inst_cap_sm8550,
 	.inst_fw_caps_dec = inst_fw_cap_sm8550_dec,
 	.inst_fw_caps_dec_size = ARRAY_SIZE(inst_fw_cap_sm8550_dec),
@@ -851,6 +872,8 @@ const struct iris_platform_data sm8650_data = {
 	.dma_mask = 0xe0000000 - 1,
 	.fwname = "qcom/vpu/vpu33_p4.mbn",
 	.pas_id = IRIS_PAS_ID,
+	.inst_iris_fmts = platform_fmts_sm8550_dec,
+	.inst_iris_fmts_size = ARRAY_SIZE(platform_fmts_sm8550_dec),
 	.inst_caps = &platform_inst_cap_sm8550,
 	.inst_fw_caps_dec = inst_fw_cap_sm8550_dec,
 	.inst_fw_caps_dec_size = ARRAY_SIZE(inst_fw_cap_sm8550_dec),
diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
index 69ffe52590d3acf8d595f856fb1dbd81f3073721..bf7b9c621cb7255367c06f144c03c3faa69372e0 100644
--- a/drivers/media/platform/qcom/iris/iris_vdec.c
+++ b/drivers/media/platform/qcom/iris/iris_vdec.c
@@ -67,21 +67,6 @@ void iris_vdec_inst_deinit(struct iris_inst *inst)
 	kfree(inst->fmt_src);
 }
 
-static const struct iris_fmt iris_vdec_formats_out[] = {
-	[IRIS_FMT_H264] = {
-		.pixfmt = V4L2_PIX_FMT_H264,
-		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
-	},
-	[IRIS_FMT_HEVC] = {
-		.pixfmt = V4L2_PIX_FMT_HEVC,
-		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
-	},
-	[IRIS_FMT_VP9] = {
-		.pixfmt = V4L2_PIX_FMT_VP9,
-		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
-	},
-};
-
 static const struct iris_fmt iris_vdec_formats_cap[] = {
 	[IRIS_FMT_NV12] = {
 		.pixfmt = V4L2_PIX_FMT_NV12,
@@ -101,8 +86,8 @@ find_format(struct iris_inst *inst, u32 pixfmt, u32 type)
 	unsigned int i;
 	switch (type) {
 	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
-		fmt = iris_vdec_formats_out;
-		size = ARRAY_SIZE(iris_vdec_formats_out);
+		fmt = inst->core->iris_platform_data->inst_iris_fmts;
+		size = inst->core->iris_platform_data->inst_iris_fmts_size;
 		break;
 	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
 		fmt = iris_vdec_formats_cap;
@@ -131,8 +116,8 @@ find_format_by_index(struct iris_inst *inst, u32 index, u32 type)
 
 	switch (type) {
 	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
-		fmt = iris_vdec_formats_out;
-		size = ARRAY_SIZE(iris_vdec_formats_out);
+		fmt = inst->core->iris_platform_data->inst_iris_fmts;
+		size = inst->core->iris_platform_data->inst_iris_fmts_size;
 		break;
 	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
 		fmt = iris_vdec_formats_cap;

-- 
2.34.1


