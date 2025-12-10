Return-Path: <linux-media+bounces-48518-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C41CB1885
	for <lists+linux-media@lfdr.de>; Wed, 10 Dec 2025 01:42:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CD9BD312F2D0
	for <lists+linux-media@lfdr.de>; Wed, 10 Dec 2025 00:39:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5FD4207A20;
	Wed, 10 Dec 2025 00:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="InAWs0EY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K+jobcZ7"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75DC11DA0E1
	for <linux-media@vger.kernel.org>; Wed, 10 Dec 2025 00:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765327187; cv=none; b=legkIJDWasn3Wx/j4NTfMdleT/2yN3zMoUo64MZk5KwSx3o4SgFYoL/tABRAWJarccs4O2CLtnhcE0MBoeD82No4IJq7Sx8ZsNkqw9suqTwZoDy1w3+ZDrU4UfF7s0HmgreonZempg1e/bOXrEK2JJIQK+KeO5Js/X/as/qpd1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765327187; c=relaxed/simple;
	bh=jlpw1Sf483iPDKQRcdbhu4PXcxWeMGMQ+D7Q5rQuOa0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=u2h7RwjHTNsG43qLIDbYWph4nXpvfPA+c6LmHeOC5X0rpepzpJOSedB12i1l0cDlFD75q8oDqrWMFq5p51kpKc25xVHNm5kD6Md+WsHVK2hSvxRXR732FTkl9YSanPyiMBNro20qku/NALlDdRVPmLCr4mVPOsvvssPEvx1akCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=InAWs0EY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K+jobcZ7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BA0OKnR1218897
	for <linux-media@vger.kernel.org>; Wed, 10 Dec 2025 00:39:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o+ojpsRNneEggBimX8iqIekYgGFo1kXeQGNlX2EmAQw=; b=InAWs0EYP2zUACNx
	07tsjgt80KkXUfBspsI4SIWQUxTOyBaIRLJY/c4E7J5YCYaUEU5xeLRr3HCPS48h
	pOVfvnPks3dpu3xZzXBoTSZXfJubhrVNd/bZhdrQCRO/yjp30EyXhKre0UVYE8G+
	WLrFa6KgH5TSH9Q6oxNxBAPORyUHouwsKlSEFdFTH0BU6NND/H8LM3Zjq13RRg+v
	r/DZcZGjcZ+haPBxiGloccwRqQMkIyTORZxwYADdQGadlqrDMzERiIUAwWs+Paam
	toeu1qi+8cMTMuTeASe19st3O3xUD507iBiyMMJLdrbpiK03BmecF6A7KBoGRhwO
	5Rie2g==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4axp5p1m9c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 10 Dec 2025 00:39:44 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b633babe5b9so296659a12.3
        for <linux-media@vger.kernel.org>; Tue, 09 Dec 2025 16:39:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765327183; x=1765931983; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o+ojpsRNneEggBimX8iqIekYgGFo1kXeQGNlX2EmAQw=;
        b=K+jobcZ7QQpgzxiE/YC/SmFXrWSJKievf93DpVea8mpPsPGKmDklFs5r52IdFQfHJn
         Hr1n3yHbJiAWoY5ZCPCRELFGsUHprJAzCAsBZb6BS0KZOw+TXFrtweClNJEPj/QRDQHL
         lXwVaWliFRCM35EbrwtEGrgmVowQqC6t9GK/flp1L+zSasw+0C3TwO+KWm4sJiGtC1hW
         6VeCKffv9CYsYu6CjCMYmSw3UR0fnn15ys1VCjrN7LDeWnTqBUIXAfX1xyRr8J8tqtfs
         noJ/sF1yIjPoaPUQTVRA+zJMgXITWOKDKd8fWMdfUinntA/O/3fMptxFXdXbFGPqBrgg
         QbEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765327183; x=1765931983;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=o+ojpsRNneEggBimX8iqIekYgGFo1kXeQGNlX2EmAQw=;
        b=q0FH7plrRuAGCNcIXRBTs5BUPtP+IfWRGdoKnZUQA1Mr7i0gpUTwxRroeXmWeiWyiy
         Fl4p6ooYylpsSvUzbQjMOQUBjoTDpy7JaF1m6Wh/Bh+JmVbPEVZxTPo+1IIprKi2IQhX
         NCMT308+zrYCm1M2jb5i66p9T9ERTqp3wO+p7Zd7/uTT/12OTFY7WfiRZQD21IEe5Axz
         tHVbiuw3miNW+Y97vUrFqtIu9jPtcy2UzoJ1H2eueCu8KxodSf4gg6HdKfAXGuV2NvO7
         wtyA/dcjvdUEbsGUqsqAvh/f79uEmcEmPpFR7uWuishzZS3AOi4oJ/1XkxL3Uk7gSWPj
         fBFA==
X-Gm-Message-State: AOJu0YxRRdBlK1BshRhnGI/rs33lFtZyaZ4L1Eir1MY6+bnpBay9wA8K
	FjiWd7SNbgB0GB6am3ql2Jc4mrg/F2/i5N6b+Yd6EMSECwgdNSF29h1HfZIZtoSoVGetF0oDk2s
	09WNnJQfPz4L78Ghnq4yZy2Q2RRp2kfNW5spVkDHQOp4y89ty87tTqTEv3ZThjPeTQw==
X-Gm-Gg: AY/fxX4dPZN6XA04Lu8rYl9JThESyOdkYKapsTbqv6hSVXIoCXPTyVh6GY4kXMv2OsN
	cvAAsM3nc0TX3Xc31VZYKMnvSXJLaGV0d0W/3CNKFxRhgBpgPaH6Y2PXK43DrXVt6Dc2+Xh1vrb
	ND13bAIW5S205TYofsPOflt2w152DObobE55cvjb4EkFEAxnQio8T6ax4FrkFyQlGvnOMbJibSK
	dxMFoBsjzpq+z+txwQpGbaKbLaoj722i37HhGrkeSeRW9fZQN+YasgMuFk1XNIfgQrP3w0zIgcH
	PqNOq7YxVyRuLwKQegeuW75xikVN9sC0behd1a7OHj8kan7EAJPq0z4lmZXukSWDy3dAUNJT1cS
	l60zfiqM0qjcUDwF/Tiw7wD6fMErEGZH1U15KmtvFDYXFRXVJ9QOuH5nv6KYiQivqQ2mhyw==
X-Received: by 2002:a05:7301:1610:b0:2ab:ca55:893d with SMTP id 5a478bee46e88-2ac0555156fmr274099eec.4.1765327182460;
        Tue, 09 Dec 2025 16:39:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGg3ya6x9KE/zPPdeVzBl+7GwLvLvptCeL1v2wKGoxOJrAXDrrA9j7quaCJyGuUT4UAuUHIRA==
X-Received: by 2002:a05:7301:1610:b0:2ab:ca55:893d with SMTP id 5a478bee46e88-2ac0555156fmr274086eec.4.1765327181870;
        Tue, 09 Dec 2025 16:39:41 -0800 (PST)
Received: from gu-dmadival-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2aba822b615sm46666784eec.0.2025.12.09.16.39.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 16:39:41 -0800 (PST)
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Date: Tue, 09 Dec 2025 16:39:36 -0800
Subject: [PATCH v9 3/5] media: iris: Add support for AV1 format in iris
 decoder
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251209-av1d_stateful_v3-v9-3-718e3b3934b1@oss.qualcomm.com>
References: <20251209-av1d_stateful_v3-v9-0-718e3b3934b1@oss.qualcomm.com>
In-Reply-To: <20251209-av1d_stateful_v3-v9-0-718e3b3934b1@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765327177; l=9266;
 i=deepa.madivalara@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=jlpw1Sf483iPDKQRcdbhu4PXcxWeMGMQ+D7Q5rQuOa0=;
 b=WGxsp+H9tCq3Zs3cKwx8fvPCRFQec0LZ9DhPP1b8hJaOz2NGaIPf56tLHMUrcTTnlafOGVcy/
 Ci94AAEREKFAedljpQshuPQMJ5kI//TjGFYGpTT1q0xWnom7YOurrDh
X-Developer-Key: i=deepa.madivalara@oss.qualcomm.com; a=ed25519;
 pk=MOEXgyokievn+bgpHdS6Ixh/KQYyS90z2mqIbQ822FQ=
X-Proofpoint-ORIG-GUID: Ir2-VxxzNCiNIhgYOizRp5wlFxTEbDJN
X-Authority-Analysis: v=2.4 cv=ZZYQ98VA c=1 sm=1 tr=0 ts=6938c150 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=bBoHIU1i-hzBuKh-O0cA:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEwMDAwMyBTYWx0ZWRfXx5isn13uE4W7
 TusvEmD3J7uT1tH9mRCtOEupcIJ/+mtKB/8iEaIDNBhx14e9/1ORFJV0ip2sGRipsbmCvleOB81
 9BfXnDfZAnedtEOQDXffM0hyhcIbdXoay8hkzEGyBg931I4zKXqS3MvjkPvhdvw1c6w8G+LWcOg
 hDfB2hi7j8PqhPJW+2bqkSk7Z+jrk1pN773xh5Qi6yDxjm/s8J2SScmSrfBs6zOE7KvHtoS8D9F
 Lo9tfJzpr5UrCHTubHWkdEAm75PQV595pNet1erS1JMlfv1YnFNHHrOh8e8mEZ6kRD+R74erAee
 ZvGUFmPel+P7wPPCn5L4+bJ9qNJKIW7/XYbrIQnSlpAf8himRIcnlG+pSPl3x0gIlmPI/yRrLZ3
 AZzItDtMxZlVYi9zlFy244YjENU89Q==
X-Proofpoint-GUID: Ir2-VxxzNCiNIhgYOizRp5wlFxTEbDJN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_05,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512100003

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
 .../media/platform/qcom/iris/iris_platform_gen1.c  | 20 +++++++++++++++-
 .../media/platform/qcom/iris/iris_platform_gen2.c  | 28 +++++++++++++++++++++-
 drivers/media/platform/qcom/iris/iris_vdec.c       | 23 ++++--------------
 6 files changed, 54 insertions(+), 21 deletions(-)

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


