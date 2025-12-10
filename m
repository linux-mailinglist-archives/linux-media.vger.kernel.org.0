Return-Path: <linux-media+bounces-48575-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C746CB3CE3
	for <lists+linux-media@lfdr.de>; Wed, 10 Dec 2025 20:00:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ED5A630CFA34
	for <lists+linux-media@lfdr.de>; Wed, 10 Dec 2025 18:59:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FACB329E64;
	Wed, 10 Dec 2025 18:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KRGmBN0a";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FLOCUImM"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D500C329390
	for <linux-media@vger.kernel.org>; Wed, 10 Dec 2025 18:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765393154; cv=none; b=JiVRAm8oua/fiVvGrlQaxAa/pcPYwc4wFGLQhfuIv0YjKktYB9fXmvO0krC+4bWfHvLQ60OEAYQK3bE/g0LgOPa3dYG7T7IPRh3w7POVs/Cz1XJ/JzGfPzROs0BshIynz5wZ8pyqkjM9/A+a9a/RqsgHhzDKApr9MrHKEuV/MR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765393154; c=relaxed/simple;
	bh=ZzLWnQqjoAVg12SIvNuW50tWkuSYyh0LEHEq8s/ae88=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oPjosdNqQuPuaJzBrHPKMXQ0HXA4GLE7cheJPAzRsBMzUlpAwCkxswq2J72eTNxf2MFdwB0vEDhHADXJ8l93VdD0phgpMds2gw7iRxJpKUYb1oJj+Ompx6WrnxITc+x4RSL0Chf+jHyCROUkle7YPUcc2rEL0XuiFQSlG1/cPoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KRGmBN0a; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FLOCUImM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BAIRVev3178151
	for <linux-media@vger.kernel.org>; Wed, 10 Dec 2025 18:59:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q3EutyLeiYCI3bG9eXMAuR5758pTs9yVzHame8NFSjg=; b=KRGmBN0agug7XPrp
	Zusw4fecQvstIyIYnAaIFMx+xCbyzCuJ0tlF0DCCwQAgOMdlku6dtW7WHZDKVJBw
	naSfMxAoX2u+ieOeYhOMNCNAUe7f7ffN+qwoORhU0DhnbDrdBfSc//Os/8ua+7JB
	HbYCAyMf8lw/BL+mtriqwEJlXdgPJ8rerwmIqUtVYgJlXGgiEjjks1nZZmU1Rodd
	Ms6NaB+z14iNTIHU2nc3gaLaorJB3dt4T0erEcQM+Hws7KZbUJmcVJOoAqLutWu6
	2tEx8hYg8P12K3tZPlRTcb7bf+ik7Jp/3fmC9k4Ad5KjxyjNOQ5R8fTnNDWl5yhc
	kwiw9Q==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ay1xp2s05-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 10 Dec 2025 18:59:11 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-295ac7012acso508475ad.2
        for <linux-media@vger.kernel.org>; Wed, 10 Dec 2025 10:59:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765393151; x=1765997951; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q3EutyLeiYCI3bG9eXMAuR5758pTs9yVzHame8NFSjg=;
        b=FLOCUImMsSZmBkjsmd7LGyed3uPV7Hr/IbGknLvJedTSS9aDuXjr+6J5NDRvsKTL4E
         bLy9k+ZGRF8UvRaraYiX/leCKCZz+wFtY57xS6vFPwPg6lJ1KudOE44g/FXAl6VLSGOy
         IF2tSAPmNLnIPhsieZWfKfwaFmvaZQP0QM7ofqvK2BpRfnyFbDpOfvBIRzr+RSyM88oy
         bgS4h2GYFAVam0Yyz94bEp2vnGmQlLVE5uS1FCJuS8hJyKSm54L9QUhdS8vOijpK862I
         UYih60SpiUmhNQl9Oc1o79qDPnr0Uz3sylKW7nvhMsyq0cm0rtqP9gq/HrIRvXzPEELx
         9QKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765393151; x=1765997951;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=q3EutyLeiYCI3bG9eXMAuR5758pTs9yVzHame8NFSjg=;
        b=mRhobnCwBnF+EV/Bu7uV7A6h9ohQ9YLYPDK8sT9QPaHRNYgo0XGcK6xQuhB9A30vd9
         YUIAYrfve7ArPvspypxDkZD1WycssY6jcszxok+cR0q3mMyba+6ScgKY8Gdp2dxc01k6
         b91kke+AVWKWoM+N3daw7J6eeJE+FIm3TnPYg21dISgejt1yvYCNIo97HMBD0eWBRdRs
         yeqmRk6SNh4Scl8HMFDBaoMzsMZcGmc1aFSGmZwxkXV7J25zns5x089TvYLCl9tEO41F
         opQqig4N4NkOewODGt6o9NPA0SUMZ2EnoH2yyH8ZgYHf3rUUERjdxiXuFPgnml/N/klz
         AWQA==
X-Gm-Message-State: AOJu0YyeoijwlhBuITfOUekL+p9AzpESmj1N97hyj1cEQ1cyRXP5dck+
	CcYc4qHsui1pJyzpBGA1g/Vv9SQA/53gzpvxJyaz3D/XvaDlqu6gGtGiYn1JkWiniEsL53Um8d/
	dwQWvZN8s6UqGnnIHAy/rx2sBnvv22nHbGRMLMepCte0JlUEQd3Z9/weV2K0jDz8CTw==
X-Gm-Gg: ASbGncugRZHeDI+wLzTAuaO3NujasMgQuUGmH/VKfDydxSwmkQUECCctM17hgrXc7Q7
	ILJpFkXnU12xOfs5V8Z2/cTOqnWQMZN5Zj6+Cb3ydi6MRA+ABzoZ8+Nyjnw3vAzxeNu+UZUoCla
	edOZHMtuhyRTrzsxbQNJy/VPiqcdBKfjfs0EzMNuvQwmN9paqDLG/mlXqCgd2tG4hfRgqzHZ3ZT
	5zvvq8Hge5qtvoHWpvX6dVy17xqOZVl9+tlHyKx+lSUhtQaqI8hG351NfGg5dQAa+K+P4kML4tT
	GNC/FYbvcJq7tZaP4J6CLribfHnsz0G3ki/v0e78qz4OL/Dv8aZvwPOgqmR/uiwjf3JioYrGlTV
	cKfALh9yR0Furw3uhSvhnZ/CuesJHgotaiUg3HQ3J/boXGKdn6FxYLyHe3HQc8r6YBeTlSg==
X-Received: by 2002:a05:7022:6292:b0:11e:3e9:3e89 with SMTP id a92af1059eb24-11f296f137cmr1453934c88.7.1765393151040;
        Wed, 10 Dec 2025 10:59:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHbxQ9s+ELF48zWl604gUsHP3kqvTJH7OXh1g8BFJ5lVqMdgh33Kglkcx5bo+5tKwPAqzWqxQ==
X-Received: by 2002:a05:7022:6292:b0:11e:3e9:3e89 with SMTP id a92af1059eb24-11f296f137cmr1453916c88.7.1765393150420;
        Wed, 10 Dec 2025 10:59:10 -0800 (PST)
Received: from gu-dmadival-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f2e1bb45csm778008c88.1.2025.12.10.10.59.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 10:59:10 -0800 (PST)
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Date: Wed, 10 Dec 2025 10:59:06 -0800
Subject: [PATCH v10 3/5] media: iris: Add support for AV1 format in iris
 decoder
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251210-av1d_stateful_v3-v10-3-cf4379a3dcff@oss.qualcomm.com>
References: <20251210-av1d_stateful_v3-v10-0-cf4379a3dcff@oss.qualcomm.com>
In-Reply-To: <20251210-av1d_stateful_v3-v10-0-cf4379a3dcff@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765393147; l=9696;
 i=deepa.madivalara@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=ZzLWnQqjoAVg12SIvNuW50tWkuSYyh0LEHEq8s/ae88=;
 b=1ImWw0ibYyPSrDyizN5tteezougkA0Gs38+PKOAPZyd1F7iXRrNNmsBl+EvVFo8XNvMMIsRqY
 5vfGq0FpGzcCLw0OWHDLEjRXV+z1jsrsFVCuuFjXECgNvgP9tgZwKIT
X-Developer-Key: i=deepa.madivalara@oss.qualcomm.com; a=ed25519;
 pk=MOEXgyokievn+bgpHdS6Ixh/KQYyS90z2mqIbQ822FQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEwMDE1NSBTYWx0ZWRfX1jXD4vNLw+IJ
 MM1w2h3rT7e3TC7zxyBkEmP22PkM1FcKsnhClnobVAXbs7i4G7tH7xqH2sX5yWsijzTq7o3Wh3w
 Bw4otwhXj/mbOalziHC8a/KX31XjcxYbEhqobTbEjzG8xeoLQpl3rKrna6gNBT0Ix+ow0f0zPB4
 fFQfYW7h3tFaHkayE0vxFcHZbXXyhmZeFqVADmkkgYAVtwH8D/e2n1jwiVzZrwfYfdFtbTgCl+n
 ohQ3eKLOgQEDd0cNhk8rYfPriwHwzzgwFNgsRZU5IYQI9sZQk18lHxKeEwW5jqwgwxDUxo2J8yv
 VBcgdvklOvuSg5t2UJY4hLR+7hvDDCVhQMasaDRTF7t8XRkx2x0GaE+2z9PV2r5paBIfsjKTZgm
 9PesnpcdWZg5M81AGTdaTV01iu34BQ==
X-Proofpoint-ORIG-GUID: wpKWNIedTVgpcbie7acD2xIJ21hx1X1X
X-Proofpoint-GUID: wpKWNIedTVgpcbie7acD2xIJ21hx1X1X
X-Authority-Analysis: v=2.4 cv=A/Zh/qWG c=1 sm=1 tr=0 ts=6939c300 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=bBoHIU1i-hzBuKh-O0cA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-10_02,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 spamscore=0 malwarescore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512100155

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
 .../media/platform/qcom/iris/iris_platform_gen1.c  | 22 ++++++++++++++++-
 .../media/platform/qcom/iris/iris_platform_gen2.c  | 28 +++++++++++++++++++++-
 drivers/media/platform/qcom/iris/iris_vdec.c       | 23 ++++--------------
 6 files changed, 56 insertions(+), 21 deletions(-)

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
index 34cbeb8f52e248b6aec3e0ee911e14d50df07cce..712515b0f32942a55f3c9f392e695a91bc2f475e 100644
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
@@ -386,6 +404,8 @@ const struct iris_platform_data sc7280_data = {
 	.dma_mask = 0xe0000000 - 1,
 	.fwname = "qcom/vpu/vpu20_p1.mbn",
 	.pas_id = IRIS_PAS_ID,
+	.inst_iris_fmts = platform_fmts_sm8250_dec,
+	.inst_iris_fmts_size = ARRAY_SIZE(platform_fmts_sm8250_dec),
 	.inst_caps = &platform_inst_cap_sm8250,
 	.inst_fw_caps_dec = inst_fw_cap_sm8250_dec,
 	.inst_fw_caps_dec_size = ARRAY_SIZE(inst_fw_cap_sm8250_dec),
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index c1989240c248601c34b84f508f1b72d72f81260a..010f6b804e0a516429ed49db7b2ed227a1e2c3be 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -19,6 +19,25 @@
 #define VIDEO_ARCH_LX 1
 #define BITRATE_MAX				245000000
 
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
 static const struct platform_inst_fw_cap inst_fw_cap_sm8550_dec[] = {
 	{
 		.cap_id = PROFILE_H264,
@@ -759,6 +778,8 @@ const struct iris_platform_data sm8550_data = {
 	.dma_mask = 0xe0000000 - 1,
 	.fwname = "qcom/vpu/vpu30_p4.mbn",
 	.pas_id = IRIS_PAS_ID,
+	.inst_iris_fmts = platform_fmts_sm8550_dec,
+	.inst_iris_fmts_size = ARRAY_SIZE(platform_fmts_sm8550_dec),
 	.inst_caps = &platform_inst_cap_sm8550,
 	.inst_fw_caps_dec = inst_fw_cap_sm8550_dec,
 	.inst_fw_caps_dec_size = ARRAY_SIZE(inst_fw_cap_sm8550_dec),
@@ -809,7 +830,6 @@ const struct iris_platform_data sm8550_data = {
 	.dec_output_prop_vp9 = sm8550_vdec_subscribe_output_properties_vp9,
 	.dec_output_prop_vp9_size =
 		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_vp9),
-
 	.dec_ip_int_buf_tbl = sm8550_dec_ip_int_buf_tbl,
 	.dec_ip_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_ip_int_buf_tbl),
 	.dec_op_int_buf_tbl = sm8550_dec_op_int_buf_tbl,
@@ -851,6 +871,8 @@ const struct iris_platform_data sm8650_data = {
 	.dma_mask = 0xe0000000 - 1,
 	.fwname = "qcom/vpu/vpu33_p4.mbn",
 	.pas_id = IRIS_PAS_ID,
+	.inst_iris_fmts = platform_fmts_sm8550_dec,
+	.inst_iris_fmts_size = ARRAY_SIZE(platform_fmts_sm8550_dec),
 	.inst_caps = &platform_inst_cap_sm8550,
 	.inst_fw_caps_dec = inst_fw_cap_sm8550_dec,
 	.inst_fw_caps_dec_size = ARRAY_SIZE(inst_fw_cap_sm8550_dec),
@@ -933,6 +955,8 @@ const struct iris_platform_data sm8750_data = {
 	.dma_mask = 0xe0000000 - 1,
 	.fwname = "qcom/vpu/vpu35_p4.mbn",
 	.pas_id = IRIS_PAS_ID,
+	.inst_iris_fmts = platform_fmts_sm8550_dec,
+	.inst_iris_fmts_size = ARRAY_SIZE(platform_fmts_sm8550_dec),
 	.inst_caps = &platform_inst_cap_sm8550,
 	.inst_fw_caps_dec = inst_fw_cap_sm8550_dec,
 	.inst_fw_caps_dec_size = ARRAY_SIZE(inst_fw_cap_sm8550_dec),
@@ -1019,6 +1043,8 @@ const struct iris_platform_data qcs8300_data = {
 	.dma_mask = 0xe0000000 - 1,
 	.fwname = "qcom/vpu/vpu30_p4_s6.mbn",
 	.pas_id = IRIS_PAS_ID,
+	.inst_iris_fmts = platform_fmts_sm8550_dec,
+	.inst_iris_fmts_size = ARRAY_SIZE(platform_fmts_sm8550_dec),
 	.inst_caps = &platform_inst_cap_qcs8300,
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


