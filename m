Return-Path: <linux-media+bounces-46212-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B554BC2C14F
	for <lists+linux-media@lfdr.de>; Mon, 03 Nov 2025 14:29:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 2CFDC4EFBC1
	for <lists+linux-media@lfdr.de>; Mon,  3 Nov 2025 13:25:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28A9A261B92;
	Mon,  3 Nov 2025 13:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aae7qM91";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NwfPHd0C"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38343469D
	for <linux-media@vger.kernel.org>; Mon,  3 Nov 2025 13:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762176265; cv=none; b=eaCjoSjRcOPe7+myvaiEDK4x7koT5fnFT6ltytYJoQQMs448WLSXgVHJOXMz+laET1sSXZ8cwHC+Kc0r/cmkZqRpCa3FLfrnGUKAO+0d7XcppUD037ZbHy5EaNMYn3yBrQwDLg6dIBFe28ZrK/qqQiWCqnvuo1pnaIBVYqgG4io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762176265; c=relaxed/simple;
	bh=IvUXgUxc+qj/ai3yZ9DYCmxbqk3ttvdY6dcBJuCnGdU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fBKZ1xtDrtLJrGSs2SBfGDrFtrlOPqNU20FalJd4D7Wlo0+KsKMaNcuZh9Q5Cj65wBVUUp4qfRx/7J5D3SGBVvYL9HF85Cdm+SlwlvUWYYOJut4XERNcvA2SpmQLiLt4x2mEgCAarUndVs/o+tcvscbgrBvWqWONqmbdMYXfAIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aae7qM91; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NwfPHd0C; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A38pJ661514946
	for <linux-media@vger.kernel.org>; Mon, 3 Nov 2025 13:24:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oSlGCETcT487njJjteSfbaPtFhdHu4yLu1wzBWenQzw=; b=aae7qM91wgqYGV/3
	qY/iG/jjCUqbEHjmSBuojfcGwBpH6QTtFUda9O0n1AHEAFUhGNed1zNhBUMDgWOU
	sQFLIHX+RYkERpltEqoe5Hne+FDKdtS13ZSrdaENbd8+IDCEFqaiEsurww/5HnAo
	mhDir9Xhtc+ruwxrNCeolsJLoxkpLKuPyHC9PiHukBSHFbKM6dk5z6DvFxJN6BQ2
	R6hZbO2RUYgdd4Y8BB+ZDIx9dQmx4ex/2ekIrUmdgl/QlfFgEupQaEERj38KC9OK
	C+rWhgZxuu8OUMkM/a65X5UuGzmkWtS0XXYbJ/FFCg8Zjf/LAjLwJAWSmr6cnsAJ
	CZWEEQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a5977ct6y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 03 Nov 2025 13:24:21 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3409a379571so991982a91.0
        for <linux-media@vger.kernel.org>; Mon, 03 Nov 2025 05:24:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762176261; x=1762781061; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oSlGCETcT487njJjteSfbaPtFhdHu4yLu1wzBWenQzw=;
        b=NwfPHd0CXcVAtspT1AvUXA9Sk5NSkJeZxIkxMIrBXa6zutt+HeWkaXDI96UCMZScsz
         86bbrpoyYBGuKUAGEN9NRzXorJtMmu6UKebjR+szUTskxr3Mgccd1jVlDjMxlOdBWxKT
         YD5wY7K0/n7y9pkOckRAlkIGjYt6O4IXbJ//ofkyuQhM5jdzvgg/5uAcPM85cbioYZiO
         /CJMCpGwKZH3mqB68vsxY4Qr/BYoYd+HC3Hm7Sf7OUJZOyAdE1eBm7OXNfDYINOCJNVC
         /vlnOf410ZiiRo0GfNwOkbTREqFCyPMiXXkpQ2eq6u8bgACcLkepr/zTvnuVZ7P61A2V
         3adw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762176261; x=1762781061;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oSlGCETcT487njJjteSfbaPtFhdHu4yLu1wzBWenQzw=;
        b=N7H0CK1tqezumC9HEz+e/LlSveNDzSob3abrhOyJi7QbwaxYI4+pqrzMItKFSUPxUG
         xjDYovLXx/cf8Oiqf/V4Ncjx3Mcm1nLaHdeRwvQ93PSN09fnKmvnP/GUhOmG2VZBUO9Z
         6V7pzDZHY/DJXfSVSZQm7uCeeN71x1Yv6UZhq8VWWhrjnw95uuBetRBHeuLTyIm847ca
         my1pF7aDPcgs3sxOTcnmovg9fTtnUE6rzjk2BrImKTSqcbfd9w5zRIwbbsSyIh6KKLmh
         VnE4aVzo158GHB0nIX3ywo0woiDHstRexsJxhyXooAoRQCfw65xgBldFgklsH9xIRFUM
         XIIg==
X-Gm-Message-State: AOJu0YzVVjnJzHkN8um5IUg+T5dhnnoVQtcFUL1Z5UBWoiIKC9VoyTJs
	vaLDxPFoudmAdcdAIiGkJmB5oxktut0TNb310nx18BekZb1oJ7/OJJqfvuB9gMXz+8U9/oViFEX
	VBZLDCpSb2eUEMXIp73Lcek3yA/OyU2GSFXK5/2EVMXrbURj2UZAEQhhdgGE5KrHxYg==
X-Gm-Gg: ASbGncsLxHaUXfBwWezyL2o8ygxMB+yEICjgaejsM2VJyGuvckaMj+cStyNqvjfyv9o
	vYzPbvtXhM3NWeY6wtOWv1pOtCYvhcB45Y+Qpj8jcgbU09QH8/RedyNxrThgnQINF88XK8jaGW6
	M+zMzBVs3RYdXaF7rtMvl8pRkOCd8JfGMand1PLe5bzC8QwgazGXeTnQ6Eh2EZdfTUv05l5Bbi2
	A/wKqFM2kaZ24YdndSR0iiVeJ9bFGOBUxlBisdPkYvAsfBfxhvtbWIscPDHgq17NU5ZsxozuFV+
	+x7nXIYhZ8/hpYJoAweyFd+01IUYPnolbQlO/JQs9CkORne5NM2KSSPNF4iP3zbvZz17cams3j1
	UUE4PtPbUqqtocYBkLcPUMCtn7bsxDp/xpWmXZkEueblli3QmoYcRXlU42oI=
X-Received: by 2002:a17:90b:1201:b0:340:aa74:c2a6 with SMTP id 98e67ed59e1d1-340aa74c546mr4994622a91.6.1762176260955;
        Mon, 03 Nov 2025 05:24:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFpjowQ2RFpxmiuSNHtpw7sSJHpjbTdnmR+CikHhHDVHvhSTd3/GZ5sQxGz8X4mvw473HMVUg==
X-Received: by 2002:a17:90b:1201:b0:340:aa74:c2a6 with SMTP id 98e67ed59e1d1-340aa74c546mr4994602a91.6.1762176260465;
        Mon, 03 Nov 2025 05:24:20 -0800 (PST)
Received: from gu-dmadival-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3407ec24330sm6614812a91.2.2025.11.03.05.24.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 05:24:20 -0800 (PST)
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Date: Mon, 03 Nov 2025 05:24:07 -0800
Subject: [PATCH v4 3/5] media: iris: Add support for AV1 format in iris
 decoder
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251103-av1d_stateful_v3-v4-3-33cc1eaa83f2@oss.qualcomm.com>
References: <20251103-av1d_stateful_v3-v4-0-33cc1eaa83f2@oss.qualcomm.com>
In-Reply-To: <20251103-av1d_stateful_v3-v4-0-33cc1eaa83f2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762176256; l=7656;
 i=deepa.madivalara@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=IvUXgUxc+qj/ai3yZ9DYCmxbqk3ttvdY6dcBJuCnGdU=;
 b=loRvA2Bd7IuEv4yRLg3aeRZZefTiAL3g0olgYEhrrN9OFMKbl1DZZMxCyhQNs5t5rsn/fyTKw
 tjd7jRbn4csBJlXQqvtLQBausg42B6dqaMapPjSGBE2LId2RDOwt9kg
X-Developer-Key: i=deepa.madivalara@oss.qualcomm.com; a=ed25519;
 pk=MOEXgyokievn+bgpHdS6Ixh/KQYyS90z2mqIbQ822FQ=
X-Proofpoint-GUID: at2tDc6nika0wJ3Kp0oDU0Yjz-48MZRz
X-Proofpoint-ORIG-GUID: at2tDc6nika0wJ3Kp0oDU0Yjz-48MZRz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAzMDEyMSBTYWx0ZWRfX5SHbdZogPOIj
 eo8W5R3j2YIREMSRkV30j688HLtyUVJtMgMio7BiL92GLb9moobqH4FauzAnl0fABwgywB60nmu
 qsXuoRqrRYpa3syV87a0G1m9fZtS7bTl4+mLVkXaw2uk66M7HtnVu6vAVHMCMP5Rr8NWJm93RJi
 0Cz+enftgKPxF4R7wW5DIaweukhsQs/l/LDT2zumsNFKnFRCf1zvNrr6mGVqllu9h1RqeMDrlxp
 8hpuIDDf4MRtOnjbsjvBX4JpcEdTNvYXBk309nwn0i8e17TEYPkLvQyInEU7c/1GcNhFxBhImSS
 zAuet4vjquToE9pJh90ZraZbp2UhQpvPfgDgYo9jYsEL8sGJjbPno6p5eDv8XDmkZ5AD3LR6x6E
 d0sCPmX9P7gbgLNuUzYP3ZtC4EUUhA==
X-Authority-Analysis: v=2.4 cv=WcABqkhX c=1 sm=1 tr=0 ts=6908ad05 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=Dfn2-qcXI_AzomQv4o8A:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-03_02,2025-11-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511030121

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
 .../media/platform/qcom/iris/iris_platform_gen2.c  | 23 ++++++++++++++++++++++
 .../platform/qcom/iris/iris_platform_sm8250.c      | 17 ++++++++++++++++
 drivers/media/platform/qcom/iris/iris_vdec.c       | 23 ++++------------------
 6 files changed, 48 insertions(+), 19 deletions(-)

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
index 58d05e0a112eed25faea027a34c719c89d6c3897..9aca70b4c0690f0d8d799e2a9976bd20d6bb8c94 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -214,6 +214,8 @@ struct iris_platform_data {
 	u64 dma_mask;
 	const char *fwname;
 	u32 pas_id;
+	struct iris_fmt *inst_iris_fmts;
+	u32 inst_iris_fmts_size;
 	struct platform_inst_caps *inst_caps;
 	struct platform_inst_fw_cap *inst_fw_caps_dec;
 	u32 inst_fw_caps_dec_size;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index 69c952c68e939f305f25511e2e4763487ec8e0de..3b61723dbf27e9ba8d427686e44cf048a0ab7c5b 100644
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
 static struct platform_inst_fw_cap inst_fw_cap_sm8550_dec[] = {
 	{
 		.cap_id = PROFILE_H264,
@@ -761,6 +780,8 @@ struct iris_platform_data sm8550_data = {
 	.dma_mask = 0xe0000000 - 1,
 	.fwname = "qcom/vpu/vpu30_p4.mbn",
 	.pas_id = IRIS_PAS_ID,
+	.inst_iris_fmts = platform_fmts_sm8550_dec,
+	.inst_iris_fmts_size = ARRAY_SIZE(platform_fmts_sm8550_dec),
 	.inst_caps = &platform_inst_cap_sm8550,
 	.inst_fw_caps_dec = inst_fw_cap_sm8550_dec,
 	.inst_fw_caps_dec_size = ARRAY_SIZE(inst_fw_cap_sm8550_dec),
@@ -853,6 +874,8 @@ struct iris_platform_data sm8650_data = {
 	.dma_mask = 0xe0000000 - 1,
 	.fwname = "qcom/vpu/vpu33_p4.mbn",
 	.pas_id = IRIS_PAS_ID,
+	.inst_iris_fmts = platform_fmts_sm8550_dec,
+	.inst_iris_fmts_size = ARRAY_SIZE(platform_fmts_sm8550_dec),
 	.inst_caps = &platform_inst_cap_sm8550,
 	.inst_fw_caps_dec = inst_fw_cap_sm8550_dec,
 	.inst_fw_caps_dec_size = ARRAY_SIZE(inst_fw_cap_sm8550_dec),
diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c b/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
index 16486284f8acccf6a95a27f6003e885226e28f4d..8342a0b6f825b385192baedfc67c50bba7661470 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
@@ -17,6 +17,21 @@
 #define BITRATE_PEAK_DEFAULT	(BITRATE_DEFAULT * 2)
 #define BITRATE_STEP		100
 
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
 static struct platform_inst_fw_cap inst_fw_cap_sm8250_dec[] = {
 	{
 		.cap_id = PIPE,
@@ -337,6 +352,8 @@ struct iris_platform_data sm8250_data = {
 	.dma_mask = 0xe0000000 - 1,
 	.fwname = "qcom/vpu-1.0/venus.mbn",
 	.pas_id = IRIS_PAS_ID,
+	.inst_iris_fmts = platform_fmts_sm8250_dec,
+	.inst_iris_fmts_size = ARRAY_SIZE(platform_fmts_sm8250_dec),
 	.inst_caps = &platform_inst_cap_sm8250,
 	.inst_fw_caps_dec = inst_fw_cap_sm8250_dec,
 	.inst_fw_caps_dec_size = ARRAY_SIZE(inst_fw_cap_sm8250_dec),
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


