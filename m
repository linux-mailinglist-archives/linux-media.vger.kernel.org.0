Return-Path: <linux-media+bounces-43507-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 56B29BB18BF
	for <lists+linux-media@lfdr.de>; Wed, 01 Oct 2025 21:00:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3C4767B0F42
	for <lists+linux-media@lfdr.de>; Wed,  1 Oct 2025 18:59:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FEDA2EE611;
	Wed,  1 Oct 2025 19:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Nixn0W5P"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D73CC2D63E5
	for <linux-media@vger.kernel.org>; Wed,  1 Oct 2025 19:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759345221; cv=none; b=YT305yZq16V4eZd8irNatK952NcXJuYzjWXCO209WMtVgMkvvPJyI6DdD7z/lK8qD72vav3G2HERXqHTLKDTEjxQhY8n8Cze6EADxW4NMmmcwyvUHJPMQgv0kbdghZDvrRBrZnBydWuFqbTOWF5TktKNG8WiJ0NWguns4nK88fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759345221; c=relaxed/simple;
	bh=5jIddfi3VJ3U3gMJ5kaxZCddqKJJIzIkKh2fX2j/PcY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H5T0oJvKAQgJxZN4Ht29C11foi0hU99UnG6IGxpVNAxp8IlkyiXBKDhpwzJxWffasmfbjY+T5OsuwAi1vdmXcyXsL1OgIkK4kjWkj/gOxEbWLMNBVmYdtxHIdjLv0imj5e6ZTi/C5hN1fCPJoaGscz84RbDXqTHwUDTdZuuufjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Nixn0W5P; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 591IcSFM024130
	for <linux-media@vger.kernel.org>; Wed, 1 Oct 2025 19:00:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1KOAZ03h/8+A3+Djsp+OivlfKdZFRb9XoRD+cQMQ2Iw=; b=Nixn0W5PpKaPWHFD
	gq9j3U1UETOEyU60Ms0I+Bcya3MztQzGq+yxDUMOu2jwo/9UaHiZBEk67+9q94TB
	t8VSvpH3nQSzUWoMEsrzKmzypKjYKh+dYcqjWLQskttfCh8gq7jEISPqiUbLPazs
	rj5ck/yDwB2HSMdphwJTU4ftIrkOzM0aYXIfHs/Dtzg2IF5hTcmA+VlvEudAqTL7
	ioBgL050MYcdoZQCB9kP9mNI264Hk4ZLh2/8WReZ9OWrHXdknBo6840OWgp6sigR
	TZrc+rSh1rib1m2+CbwUOVhRiC1CpuKHG3LqZkbWWbOb5na1HlPn7ss/+VI8wFJe
	onzIPg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e8a65n4y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 01 Oct 2025 19:00:17 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-32eadc2b473so56733a91.3
        for <linux-media@vger.kernel.org>; Wed, 01 Oct 2025 12:00:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759345216; x=1759950016;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1KOAZ03h/8+A3+Djsp+OivlfKdZFRb9XoRD+cQMQ2Iw=;
        b=hIzCeEtBEz81iCdSGFVYcnc5tqWnBgR897LfJ1rs8mi3R/6+xhKRsrAUuI3bjSQXKb
         MFhlTbUkqY3x4ImaZEOqDytXbQnWLYQOoNKWPMelnbAfnF5zLCCHqkrnoFP5r5wQyojv
         +Z85Dh/ruoGYVhXbWM1bjCWDKmJ/omVZCsY95wGBTyWPjBdpNyqHiQrViO+q4GRG9I5R
         kP0GZCWeC2RjTsh1k0XHX68Wn0SekisIHYdn8aFyFIQMcPAScZwkvfMpXumGD0u7d7aZ
         /qZjfD6lqPVxRZA1hOugAI8nHVejti3xI8RpPIjBs58BeUdyLPpCntmTGmxRJNO0ZI3h
         uJRQ==
X-Gm-Message-State: AOJu0Yxaq36wx7nEEpWOtHOHLJReyFqkZJDYjMBQft/AetVS1aB1L9ma
	buTJ14YVFSlZFjYeBiys7UmOxrsNv5jXtORP2Z3rbJe0lJ03GyQrQNRAMopPEaFNU4tkyPyhw3X
	zsfKOVxWp8TvHuyBb6uFi7yxw+OnZkd6uZFDq/hEN4SBjkUkxkQS/02xnwIDrSkJUuoe5w7R9fw
	==
X-Gm-Gg: ASbGncvFqsBdVM976F6bOIrIeSWGC4lCSpBEfNm9+cfbpVzodfPbNC+r/ScPNs8vIMH
	jx7tIG5ChLlmSaYWh5Ss+54wT3w6Y9qxujqpw+mhpTkg8qfQvHMaZSxi7S1TnNvET127ByqhdSA
	jzaO57Ys5EATXfGIssow5asCWe6FVqcmY2aOLJmgntuSQ5QFYmvCFlfMAaHpMThXULH9R+h0EPI
	jWR95TV3feAzbUIQZFO0uOx7qi9ptHaeTxR/WWqR53LgusQkmY6omnlKXSm+voCeBS7J6cpf8U2
	ZPtEgXHJcTPvIcL6fn+r+0r30R+q+Z48thO+Oo8/Zq1rh4qeAvvxSCA/iYfxYH8qIXuo9MbwV8t
	xN0MngFT9xTnX5aED/g1DZVHLp+YpOw==
X-Received: by 2002:a17:90b:33d0:b0:32b:e4ca:3e03 with SMTP id 98e67ed59e1d1-339a701232bmr2600698a91.6.1759345215843;
        Wed, 01 Oct 2025 12:00:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEueyukjr/vxi6oC66TGJ6y/uozrSiEscPYur7UGAZ/3Xdaugd8kUkU/drqOK6EWv/dUOf6CQ==
X-Received: by 2002:a17:90b:33d0:b0:32b:e4ca:3e03 with SMTP id 98e67ed59e1d1-339a701232bmr2600655a91.6.1759345215024;
        Wed, 01 Oct 2025 12:00:15 -0700 (PDT)
Received: from gu-dmadival-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-339a701cbffsm2950074a91.21.2025.10.01.12.00.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 12:00:14 -0700 (PDT)
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Date: Wed, 01 Oct 2025 12:00:08 -0700
Subject: [PATCH 5/5] media: iris: Add internal buffer calculation for AV1
 decoder
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251001-av1_irisdecoder-v1-5-9fb08f3b96a0@oss.qualcomm.com>
References: <20251001-av1_irisdecoder-v1-0-9fb08f3b96a0@oss.qualcomm.com>
In-Reply-To: <20251001-av1_irisdecoder-v1-0-9fb08f3b96a0@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759345209; l=21608;
 i=deepa.madivalara@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=5jIddfi3VJ3U3gMJ5kaxZCddqKJJIzIkKh2fX2j/PcY=;
 b=2i+jRcTmQmaLvnck4SAJ/vlPSo9H4V8neX0hjBQZTzzlU3aaHpH5RLgppboQkXipcSfmb7m88
 Cwc5j4vHxmEBY01KpNYN+frFPX0IUD0526tIG6rPbGfuDjs7AUg4eT3
X-Developer-Key: i=deepa.madivalara@oss.qualcomm.com; a=ed25519;
 pk=MOEXgyokievn+bgpHdS6Ixh/KQYyS90z2mqIbQ822FQ=
X-Authority-Analysis: v=2.4 cv=RZKdyltv c=1 sm=1 tr=0 ts=68dd7a41 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=sQh4-ETvhkXFb8uWvMAA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: Un_I7WSY4VY3-xZEGeH_54CZ3eQKKIsY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAzMyBTYWx0ZWRfX1U6VxS/n+Ucy
 mhBKBtyXtPsOPxsXKVNC2J0S6NQmp2Zu7cortJXl3FGNR+MTws57rQEOk/x/SRdZDBqUCfhXC+5
 L6EiCrnaaGcB28vNpxYikRpxnS6QHYFp40bQSdEaYyJypEiey2DAIIGSbtgQTqvf0oR7R39DGVy
 o0QhMxiMSgD/iR4Xv22bUhL/mzM+34bmjDYjdRORnp55TUIjTxpoW4RIDsK0BgHfqoMf9SJEauk
 2MABGvWOoUewYf4ha6tljqVC7VU3SP7qh5w6r6ymuOLmLEV+yvPf42FmfWr5vC8Jcr704wYJTVy
 CEWwWFk7OfLtO6gPWtXsCNHxf7qckD2UeanlRgDdid2VbeTHgtztZGNi22Gs0wHqBxJ6ZcUKyi4
 u7sXHwU+KgkM3He7vIFTzxmN/CBmEw==
X-Proofpoint-ORIG-GUID: Un_I7WSY4VY3-xZEGeH_54CZ3eQKKIsY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-01_05,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 adultscore=0 phishscore=0
 impostorscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270033

Implement internal buffer count and size calculations for AV1 decoder.

Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_buffer.h     |   1 +
 .../platform/qcom/iris/iris_hfi_gen2_command.c     |   1 -
 drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 255 ++++++++++++++++++++-
 drivers/media/platform/qcom/iris/iris_vpu_buffer.h | 105 +++++++++
 4 files changed, 357 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_buffer.h b/drivers/media/platform/qcom/iris/iris_buffer.h
index 5ef365d9236c7cbdee24a4614789b3191881968b..75bb767761824c4c02e0df9b765896cc093be333 100644
--- a/drivers/media/platform/qcom/iris/iris_buffer.h
+++ b/drivers/media/platform/qcom/iris/iris_buffer.h
@@ -27,6 +27,7 @@ struct iris_inst;
  * @BUF_SCRATCH_1: buffer to store decoding/encoding context data for HW
  * @BUF_SCRATCH_2: buffer to store encoding context data for HW
  * @BUF_VPSS: buffer to store VPSS context data for HW
+ * @BUF_PARTIAL: buffer for AV1 IBC data
  * @BUF_TYPE_MAX: max buffer types
  */
 enum iris_buffer_type {
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
index e3a8b031b3f191a6d18e1084db34804a8172439c..000bf75ba74ace5e10585910cda02975b0c34304 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
@@ -488,7 +488,6 @@ static int iris_hfi_gen2_set_linear_stride_scanline(struct iris_inst *inst, u32
 
 static int iris_hfi_gen2_set_tier(struct iris_inst *inst, u32 plane)
 {
-	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
 	u32 port = iris_hfi_gen2_get_port(inst, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
 	u32 tier = inst->fw_caps[TIER].value;
 
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
index 4463be05ce165adef6b152eb0c155d2e6a7b3c36..17d3a7ae79e994257d596906cb4c17250a11a0cb 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
@@ -9,6 +9,14 @@
 #include "iris_hfi_gen2_defines.h"
 
 #define HFI_MAX_COL_FRAME 6
+#define HFI_COLOR_FORMAT_YUV420_NV12_UBWC_Y_TILE_HEIGHT (8)
+#define HFI_COLOR_FORMAT_YUV420_NV12_UBWC_Y_TILE_WIDTH (32)
+#define HFI_COLOR_FORMAT_YUV420_NV12_UBWC_UV_TILE_HEIGHT (8)
+#define HFI_COLOR_FORMAT_YUV420_NV12_UBWC_UV_TILE_WIDTH (16)
+#define HFI_COLOR_FORMAT_YUV420_TP10_UBWC_Y_TILE_HEIGHT (4)
+#define HFI_COLOR_FORMAT_YUV420_TP10_UBWC_Y_TILE_WIDTH (48)
+#define HFI_COLOR_FORMAT_YUV420_TP10_UBWC_UV_TILE_HEIGHT (4)
+#define HFI_COLOR_FORMAT_YUV420_TP10_UBWC_UV_TILE_WIDTH (24)
 
 #ifndef SYSTEM_LAL_TILE10
 #define SYSTEM_LAL_TILE10 192
@@ -39,6 +47,31 @@ static u32 hfi_buffer_bin_h264d(u32 frame_width, u32 frame_height, u32 num_vpp_p
 	return size_h264d_hw_bin_buffer(n_aligned_w, n_aligned_h, num_vpp_pipes);
 }
 
+static u32 size_av1d_hw_bin_buffer(u32 frame_width, u32 frame_height, u32 num_vpp_pipes)
+{
+	u32 size_yuv, size_bin_hdr, size_bin_res;
+
+	size_yuv = ((frame_width * frame_height) <= BIN_BUFFER_THRESHOLD) ?
+		((BIN_BUFFER_THRESHOLD * 3) >> 1) :
+		((frame_width * frame_height * 3) >> 1);
+	size_bin_hdr = size_yuv * AV1_CABAC_HDR_RATIO_HD_TOT;
+	size_bin_res = size_yuv * AV1_CABAC_RES_RATIO_HD_TOT;
+	size_bin_hdr = ALIGN(size_bin_hdr / num_vpp_pipes,
+			     DMA_ALIGNMENT) * num_vpp_pipes;
+	size_bin_res = ALIGN(size_bin_res / num_vpp_pipes,
+			     DMA_ALIGNMENT) * num_vpp_pipes;
+
+	return size_bin_hdr + size_bin_res;
+}
+
+static u32 hfi_buffer_bin_av1d(u32 frame_width, u32 frame_height, u32 num_vpp_pipes)
+{
+	u32 n_aligned_h = ALIGN(frame_height, 16);
+	u32 n_aligned_w = ALIGN(frame_width, 16);
+
+	return size_av1d_hw_bin_buffer(n_aligned_w, n_aligned_h, num_vpp_pipes);
+}
+
 static u32 size_h265d_hw_bin_buffer(u32 frame_width, u32 frame_height, u32 num_vpp_pipes)
 {
 	u32 product = frame_width * frame_height;
@@ -110,6 +143,20 @@ static u32 hfi_buffer_comv_h265d(u32 frame_width, u32 frame_height, u32 _comv_bu
 	return (_size * (_comv_bufcount)) + 512;
 }
 
+static u32 hfi_buffer_comv_av1d(u32 frame_width, u32 frame_height, u32 comv_bufcount)
+{
+	u32 size;
+
+	size =  2 * ALIGN(MAX(((frame_width + 63) / 64) *
+		((frame_height + 63) / 64) * 512,
+		((frame_width + 127) / 128) *
+		((frame_height + 127) / 128) * 2816),
+		DMA_ALIGNMENT);
+	size *= comv_bufcount;
+
+	return size;
+}
+
 static u32 size_h264d_bse_cmd_buf(u32 frame_height)
 {
 	u32 height = ALIGN(frame_height, 32);
@@ -174,6 +221,20 @@ static u32 hfi_buffer_persist_h264d(void)
 		    DMA_ALIGNMENT);
 }
 
+static u32 hfi_buffer_persist_av1d(u32 max_width, u32 max_height, u32 total_ref_count)
+{
+	u32 comv_size, size;
+
+	comv_size =  hfi_buffer_comv_av1d(max_width, max_height, total_ref_count);
+	size = ALIGN((SIZE_AV1D_SEQUENCE_HEADER * 2 + SIZE_AV1D_METADATA +
+	AV1D_NUM_HW_PIC_BUF * (SIZE_AV1D_TILE_OFFSET + SIZE_AV1D_QM) +
+	AV1D_NUM_FRAME_HEADERS * (SIZE_AV1D_FRAME_HEADER +
+	2 * SIZE_AV1D_PROB_TABLE) + comv_size + HDR10_HIST_EXTRADATA_SIZE +
+	SIZE_AV1D_METADATA * AV1D_NUM_HW_PIC_BUF), DMA_ALIGNMENT);
+
+	return ALIGN(size, DMA_ALIGNMENT);
+}
+
 static u32 hfi_buffer_non_comv_h264d(u32 frame_width, u32 frame_height, u32 num_vpp_pipes)
 {
 	u32 size_bse = size_h264d_bse_cmd_buf(frame_height);
@@ -459,6 +520,148 @@ static u32 hfi_buffer_line_h264d(u32 frame_width, u32 frame_height,
 	return ALIGN((size + vpss_lb_size), DMA_ALIGNMENT);
 }
 
+static u32 size_av1d_lb_opb_wr1_nv12_ubwc(u32 frame_width, u32 frame_height)
+{
+	u32 y_width, y_width_a = 128;
+
+	y_width = ALIGN(frame_width, y_width_a);
+
+	return (256 * ((y_width + 31) / 32 + (AV1D_MAX_TILE_COLS - 1)));
+}
+
+static u32 size_av1d_lb_opb_wr1_tp10_ubwc(u32 frame_width, u32 frame_height)
+{
+	u32 y_width, y_width_a = 256;
+
+	y_width = ALIGN(frame_width, 192);
+	y_width = ALIGN(y_width * 4 / 3, y_width_a);
+
+	return (256 * ((y_width + 47) / 48 + (AV1D_MAX_TILE_COLS - 1)));
+}
+
+static u32 hfi_buffer_line_av1d(u32 frame_width, u32 frame_height,
+				bool is_opb, u32 num_vpp_pipes)
+{
+	u32 size, vpss_lb_size, opbwrbufsize, opbwr8, opbwr10;
+
+	size = ALIGN(size_av1d_lb_fe_top_data(frame_width, frame_height),
+		     DMA_ALIGNMENT) +
+		ALIGN(size_av1d_lb_fe_top_ctrl(frame_width, frame_height),
+		      DMA_ALIGNMENT) +
+		ALIGN(size_av1d_lb_fe_left_data(frame_width, frame_height),
+		      DMA_ALIGNMENT) * num_vpp_pipes +
+		ALIGN(size_av1d_lb_fe_left_ctrl(frame_width, frame_height),
+		      DMA_ALIGNMENT) * num_vpp_pipes +
+		ALIGN(size_av1d_lb_se_left_ctrl(frame_width, frame_height),
+		      DMA_ALIGNMENT) * num_vpp_pipes +
+		ALIGN(size_av1d_lb_se_top_ctrl(frame_width, frame_height),
+		      DMA_ALIGNMENT) +
+		ALIGN(size_av1d_lb_pe_top_data(frame_width, frame_height),
+		      DMA_ALIGNMENT) +
+		ALIGN(size_av1d_lb_vsp_top(frame_width, frame_height),
+		      DMA_ALIGNMENT) +
+		ALIGN(size_av1d_lb_recon_dma_metadata_wr
+		      (frame_width, frame_height), DMA_ALIGNMENT) * 2 +
+		ALIGN(size_av1d_qp(frame_width, frame_height), DMA_ALIGNMENT);
+		opbwr8 = size_av1d_lb_opb_wr1_nv12_ubwc(frame_width, frame_height);
+		opbwr10 = size_av1d_lb_opb_wr1_tp10_ubwc(frame_width, frame_height);
+		opbwrbufsize = opbwr8 >= opbwr10 ? opbwr8 : opbwr10;
+	size = ALIGN((size + opbwrbufsize), DMA_ALIGNMENT);
+	if (is_opb) {
+		vpss_lb_size = size_vpss_lb(frame_width, frame_height);
+		size = ALIGN((size + vpss_lb_size) * 2, DMA_ALIGNMENT);
+	}
+
+	return size;
+}
+
+static u32 size_av1d_ibc_nv12_ubwc(u32 frame_width, u32 frame_height)
+{
+	u32 size;
+	u32 y_width_a = 128, y_height_a = 32;
+	u32 uv_width_a = 128, uv_height_a = 32;
+	u32 ybufsize, uvbufsize, y_width, y_height, uv_width, uv_height;
+	u32 y_meta_width_a = 64, y_meta_height_a = 16;
+	u32 uv_meta_width_a = 64, uv_meta_height_a = 16;
+	u32 meta_height, meta_stride, meta_size;
+	u32 tile_width_y = HFI_COLOR_FORMAT_YUV420_NV12_UBWC_Y_TILE_WIDTH;
+	u32 tile_height_y = HFI_COLOR_FORMAT_YUV420_NV12_UBWC_Y_TILE_HEIGHT;
+	u32 tile_width_uv = HFI_COLOR_FORMAT_YUV420_NV12_UBWC_UV_TILE_WIDTH;
+	u32 tile_height_uv = HFI_COLOR_FORMAT_YUV420_NV12_UBWC_UV_TILE_HEIGHT;
+
+	y_width = ALIGN(frame_width, y_width_a);
+	y_height = ALIGN(frame_height, y_height_a);
+	uv_width = ALIGN(frame_width, uv_width_a);
+	uv_height = ALIGN(((frame_height + 1) >> 1), uv_height_a);
+	ybufsize = ALIGN((y_width * y_height), HFI_ALIGNMENT_4096);
+	uvbufsize = ALIGN(uv_width * uv_height, HFI_ALIGNMENT_4096);
+	size = ybufsize + uvbufsize;
+	meta_stride = ALIGN(((frame_width + (tile_width_y - 1)) / tile_width_y),
+			    y_meta_width_a);
+	meta_height = ALIGN(((frame_height + (tile_height_y - 1)) / tile_height_y),
+			    y_meta_height_a);
+	meta_size = ALIGN(meta_stride * meta_height, HFI_ALIGNMENT_4096);
+	size += meta_size;
+	meta_stride = ALIGN(((((frame_width + 1) >> 1) + (tile_width_uv - 1)) /
+				tile_width_uv),	uv_meta_width_a);
+	meta_height = ALIGN(((((frame_height + 1) >> 1) + (tile_height_uv - 1)) /
+				tile_height_uv), uv_meta_height_a);
+	meta_size = ALIGN(meta_stride * meta_height, HFI_ALIGNMENT_4096);
+	size += meta_size;
+
+	return size;
+}
+
+static u32 size_av1d_ibc_tp10_ubwc(u32 frame_width, u32 frame_height)
+{
+	u32 size;
+	u32 y_width_a = 256, y_height_a = 16,
+		uv_width_a = 256, uv_height_a = 16;
+	u32 ybufsize, uvbufsize, y_width, y_height, uv_width, uv_height;
+	u32 y_meta_width_a = 64, y_meta_height_a = 16,
+		uv_meta_width_a = 64, uv_meta_height_a = 16;
+	u32 meta_height, meta_stride, meta_size;
+	u32 tile_width_y = HFI_COLOR_FORMAT_YUV420_TP10_UBWC_Y_TILE_WIDTH;
+	u32 tile_height_y = HFI_COLOR_FORMAT_YUV420_TP10_UBWC_Y_TILE_HEIGHT;
+	u32 tile_width_uv = HFI_COLOR_FORMAT_YUV420_TP10_UBWC_UV_TILE_WIDTH;
+	u32 tile_height_uv = HFI_COLOR_FORMAT_YUV420_TP10_UBWC_UV_TILE_HEIGHT;
+
+	y_width = ALIGN(frame_width, 192);
+	y_width = ALIGN(y_width * 4 / 3, y_width_a);
+	y_height = ALIGN(frame_height, y_height_a);
+	uv_width = ALIGN(frame_width, 192);
+	uv_width = ALIGN(uv_width * 4 / 3, uv_width_a);
+	uv_height = ALIGN(((frame_height + 1) >> 1), uv_height_a);
+	ybufsize = ALIGN(y_width * y_height, HFI_ALIGNMENT_4096);
+	uvbufsize = ALIGN(uv_width * uv_height, HFI_ALIGNMENT_4096);
+	size = ybufsize + uvbufsize;
+	meta_stride = ALIGN(((frame_width + (tile_width_y - 1)) / tile_width_y),
+			    y_meta_width_a);
+	meta_height = ALIGN(((frame_height + (tile_height_y - 1)) / tile_height_y),
+			    y_meta_height_a);
+	meta_size = ALIGN(meta_stride * meta_height, HFI_ALIGNMENT_4096);
+	size += meta_size;
+	meta_stride = ALIGN(((((frame_width + 1) >> 1) + (tile_width_uv - 1)) /
+				tile_width_uv), uv_meta_width_a);
+	meta_height = ALIGN(((((frame_height + 1) >> 1) + (tile_height_uv - 1)) /
+				tile_height_uv), uv_meta_height_a);
+	meta_size = ALIGN(meta_stride * meta_height, HFI_ALIGNMENT_4096);
+	size += meta_size;
+
+	return size;
+}
+
+static u32 hfi_buffer_ibc_av1d(u32 frame_width, u32 frame_height)
+{
+	u32 size, ibc8, ibc10;
+
+	ibc8 = size_av1d_ibc_nv12_ubwc(frame_width, frame_height);
+	ibc10 = size_av1d_ibc_tp10_ubwc(frame_width, frame_height);
+	size = ibc8 >= ibc10 ? ibc8 : ibc10;
+
+	return ALIGN(size, DMA_ALIGNMENT);
+}
+
 static u32 iris_vpu_dec_bin_size(struct iris_inst *inst)
 {
 	u32 num_vpp_pipes = inst->core->iris_platform_data->num_vpp_pipe;
@@ -472,6 +675,8 @@ static u32 iris_vpu_dec_bin_size(struct iris_inst *inst)
 		return hfi_buffer_bin_h265d(width, height, num_vpp_pipes);
 	else if (inst->codec == V4L2_PIX_FMT_VP9)
 		return hfi_buffer_bin_vp9d(width, height, num_vpp_pipes);
+	else if (inst->codec == V4L2_PIX_FMT_AV1)
+		return hfi_buffer_bin_av1d(width, height, num_vpp_pipes);
 
 	return 0;
 }
@@ -487,18 +692,33 @@ static u32 iris_vpu_dec_comv_size(struct iris_inst *inst)
 		return hfi_buffer_comv_h264d(width, height, num_comv);
 	else if (inst->codec == V4L2_PIX_FMT_HEVC)
 		return hfi_buffer_comv_h265d(width, height, num_comv);
-
+	else if (inst->codec == V4L2_PIX_FMT_AV1) {
+		if (inst->fw_caps[DRAP].value)
+			return 0;
+		else
+			return hfi_buffer_comv_av1d(width, height, num_comv);
+	}
 	return 0;
 }
 
 static u32 iris_vpu_dec_persist_size(struct iris_inst *inst)
 {
+	struct platform_inst_caps *caps;
+
 	if (inst->codec == V4L2_PIX_FMT_H264)
 		return hfi_buffer_persist_h264d();
 	else if (inst->codec == V4L2_PIX_FMT_HEVC)
 		return hfi_buffer_persist_h265d(0);
 	else if (inst->codec == V4L2_PIX_FMT_VP9)
 		return hfi_buffer_persist_vp9d();
+	else if (inst->codec == V4L2_PIX_FMT_AV1) {
+		caps = inst->core->iris_platform_data->inst_caps;
+		if (inst->fw_caps[DRAP].value)
+			return hfi_buffer_persist_av1d(caps->max_frame_width,
+			caps->max_frame_height, 16);
+		else
+			return hfi_buffer_persist_av1d(0, 0, 0);
+	}
 
 	return 0;
 }
@@ -545,6 +765,8 @@ static u32 iris_vpu_dec_line_size(struct iris_inst *inst)
 	else if (inst->codec == V4L2_PIX_FMT_VP9)
 		return hfi_buffer_line_vp9d(width, height, out_min_count, is_opb,
 			num_vpp_pipes);
+	else if (inst->codec == V4L2_PIX_FMT_AV1)
+		return hfi_buffer_line_av1d(width, height, is_opb, num_vpp_pipes);
 
 	return 0;
 }
@@ -653,6 +875,15 @@ static u32 iris_vpu_enc_bin_size(struct iris_inst *inst)
 				  num_vpp_pipes, inst->hfi_rc_type);
 }
 
+static u32 iris_vpu_dec_partial_size(struct iris_inst *inst)
+{
+	struct v4l2_format *f = inst->fmt_src;
+	u32 height = f->fmt.pix_mp.height;
+	u32 width = f->fmt.pix_mp.width;
+
+	return hfi_buffer_ibc_av1d(width, height);
+}
+
 static inline
 u32 hfi_buffer_comv_enc(u32 frame_width, u32 frame_height, u32 lcu_size,
 			u32 num_recon, u32 standard)
@@ -1414,7 +1645,9 @@ static int output_min_count(struct iris_inst *inst)
 
 	/* fw_min_count > 0 indicates reconfig event has already arrived */
 	if (inst->fw_min_count) {
-		if (iris_split_mode_enabled(inst) && inst->codec == V4L2_PIX_FMT_VP9)
+		if (iris_split_mode_enabled(inst) &&
+		    (inst->codec == V4L2_PIX_FMT_VP9 ||
+		     inst->codec == V4L2_PIX_FMT_VP9))
 			return min_t(u32, 4, inst->fw_min_count);
 		else
 			return inst->fw_min_count;
@@ -1422,6 +1655,8 @@ static int output_min_count(struct iris_inst *inst)
 
 	if (inst->codec == V4L2_PIX_FMT_VP9)
 		output_min_count = 9;
+	else if (inst->codec == V4L2_PIX_FMT_AV1)
+		output_min_count = 11;
 
 	return output_min_count;
 }
@@ -1444,6 +1679,7 @@ u32 iris_vpu_buf_size(struct iris_inst *inst, enum iris_buffer_type buffer_type)
 		{BUF_PERSIST,     iris_vpu_dec_persist_size         },
 		{BUF_DPB,         iris_vpu_dec_dpb_size             },
 		{BUF_SCRATCH_1,   iris_vpu_dec_scratch1_size        },
+		{BUF_PARTIAL,     iris_vpu_dec_partial_size         },
 	};
 
 	static const struct iris_vpu_buf_type_handle enc_internal_buf_type_handle[] = {
@@ -1510,14 +1746,20 @@ static u32 internal_buffer_count(struct iris_inst *inst,
 	    buffer_type == BUF_PERSIST) {
 		return 1;
 	} else if (buffer_type == BUF_COMV || buffer_type == BUF_NON_COMV) {
-		if (inst->codec == V4L2_PIX_FMT_H264 || inst->codec == V4L2_PIX_FMT_HEVC)
+		if (inst->codec == V4L2_PIX_FMT_H264 ||
+		    inst->codec == V4L2_PIX_FMT_HEVC ||
+		    inst->codec == V4L2_PIX_FMT_AV1)
 			return 1;
 	}
+
 	return 0;
 }
 
 static inline int iris_vpu_dpb_count(struct iris_inst *inst)
 {
+	if (inst->codec == V4L2_PIX_FMT_AV1)
+		return 11;
+
 	if (iris_split_mode_enabled(inst)) {
 		return inst->fw_min_count ?
 			inst->fw_min_count : inst->buffers[BUF_OUTPUT].min_count;
@@ -1536,9 +1778,13 @@ int iris_vpu_buf_count(struct iris_inst *inst, enum iris_buffer_type buffer_type
 			return MIN_BUFFERS;
 		else
 			return output_min_count(inst);
+	case BUF_NON_COMV:
+		if (inst->codec == V4L2_PIX_FMT_AV1)
+			return 0;
+		else
+			return 1;
 	case BUF_BIN:
 	case BUF_COMV:
-	case BUF_NON_COMV:
 	case BUF_LINE:
 	case BUF_PERSIST:
 		return internal_buffer_count(inst, buffer_type);
@@ -1546,6 +1792,7 @@ int iris_vpu_buf_count(struct iris_inst *inst, enum iris_buffer_type buffer_type
 	case BUF_SCRATCH_2:
 	case BUF_VPSS:
 	case BUF_ARP:
+	case BUF_PARTIAL:
 		return 1; /* internal buffer count needed by firmware is 1 */
 	case BUF_DPB:
 		return iris_vpu_dpb_count(inst);
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.h b/drivers/media/platform/qcom/iris/iris_vpu_buffer.h
index 04f0b7400a1e4e1d274d690a2761b9e57778e8b7..0e767d425320ef1d6d74b8d92d42ad810339f53a 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.h
+++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.h
@@ -11,6 +11,7 @@ struct iris_inst;
 #define MIN_BUFFERS			4
 
 #define DMA_ALIGNMENT			256
+#define HFI_ALIGNMENT_4096      4096
 
 #define NUM_HW_PIC_BUF			32
 #define LCU_MAX_SIZE_PELS 64
@@ -81,6 +82,22 @@ struct iris_inst;
 #define MAX_PE_NBR_DATA_LCU64_LINE_BUFFER_SIZE	384
 #define MAX_FE_NBR_DATA_LUMA_LINE_BUFFER_SIZE	640
 
+#define AV1_CABAC_HDR_RATIO_HD_TOT 2
+#define AV1_CABAC_RES_RATIO_HD_TOT 2
+#define AV1D_LCU_MAX_SIZE_PELS 128
+#define AV1D_LCU_MIN_SIZE_PELS 64
+#define AV1D_MAX_TILE_COLS     64
+#define MAX_PE_NBR_DATA_LCU32_LINE_BUFFER_SIZE 192
+#define MAX_PE_NBR_DATA_LCU16_LINE_BUFFER_SIZE 96
+#define AV1D_NUM_HW_PIC_BUF    16
+#define AV1D_NUM_FRAME_HEADERS 16
+#define SIZE_AV1D_SEQUENCE_HEADER 768
+#define SIZE_AV1D_METADATA        512
+#define SIZE_AV1D_FRAME_HEADER    1280
+#define SIZE_AV1D_TILE_OFFSET     65536
+#define SIZE_AV1D_QM              3328
+#define SIZE_AV1D_PROB_TABLE      22784
+
 #define SIZE_SLICE_CMD_BUFFER (ALIGN(20480, 256))
 #define SIZE_SPS_PPS_SLICE_HDR (2048 + 4096)
 #define SIZE_BSE_SLICE_CMD_BUF ((((8192 << 2) + 7) & (~7)) * 3)
@@ -146,6 +163,94 @@ static inline u32 size_h264d_qp(u32 frame_width, u32 frame_height)
 	return DIV_ROUND_UP(frame_width, 64) * DIV_ROUND_UP(frame_height, 64) * 128;
 }
 
+static inline u32 size_av1d_lb_fe_top_data(u32 frame_width, u32 frame_height)
+{
+	return (ALIGN(frame_width, AV1D_LCU_MAX_SIZE_PELS) * ((16 * 10) >> 3) +
+	ALIGN(frame_width, AV1D_LCU_MAX_SIZE_PELS) / 2 * ((16 * 6) >> 3) * 2);
+}
+
+static inline u32 size_av1d_lb_fe_left_data(u32 frame_width, u32 frame_height)
+{
+	return (32 * (ALIGN(frame_height, AV1D_LCU_MAX_SIZE_PELS) +
+		ALIGN(frame_height, AV1D_LCU_MAX_SIZE_PELS) /
+		AV1D_LCU_MIN_SIZE_PELS * 16) +
+	16 * (ALIGN(frame_height, AV1D_LCU_MAX_SIZE_PELS) / 2 +
+		ALIGN(frame_height, AV1D_LCU_MAX_SIZE_PELS) /
+		AV1D_LCU_MIN_SIZE_PELS * 8) * 2 +
+	24 * (ALIGN(frame_height, AV1D_LCU_MAX_SIZE_PELS) +
+		ALIGN(frame_height, AV1D_LCU_MAX_SIZE_PELS) /
+		AV1D_LCU_MIN_SIZE_PELS * 16) +
+	24 * (ALIGN(frame_height, AV1D_LCU_MAX_SIZE_PELS) / 2 +
+		ALIGN(frame_height, AV1D_LCU_MAX_SIZE_PELS) /
+		AV1D_LCU_MIN_SIZE_PELS * 12) * 2 +
+	24 * (ALIGN(frame_height, AV1D_LCU_MAX_SIZE_PELS) +
+		ALIGN(frame_height, AV1D_LCU_MAX_SIZE_PELS) /
+		AV1D_LCU_MIN_SIZE_PELS * 16) +
+	16 * (ALIGN(frame_height, AV1D_LCU_MAX_SIZE_PELS) +
+		ALIGN(frame_height, AV1D_LCU_MAX_SIZE_PELS) /
+		AV1D_LCU_MIN_SIZE_PELS * 16) +
+	16 * (ALIGN(frame_height, AV1D_LCU_MAX_SIZE_PELS) / 2 +
+		ALIGN(frame_height, AV1D_LCU_MAX_SIZE_PELS) /
+		AV1D_LCU_MIN_SIZE_PELS * 12) * 2);
+}
+
+static inline u32 size_av1d_lb_fe_top_ctrl(u32 frame_width, u32 frame_height)
+{
+	return (10 * ((frame_width + AV1D_LCU_MIN_SIZE_PELS - 1) /
+		AV1D_LCU_MIN_SIZE_PELS) * 128 / 8);
+}
+
+static inline u32 size_av1d_lb_fe_left_ctrl(u32 frame_width, u32 frame_height)
+{
+	return (16 * ((ALIGN(frame_height, AV1D_LCU_MAX_SIZE_PELS) / 16) +
+	(ALIGN(frame_height, AV1D_LCU_MAX_SIZE_PELS) /
+	AV1D_LCU_MIN_SIZE_PELS)) +
+	3 * 16 * (ALIGN(frame_height, AV1D_LCU_MAX_SIZE_PELS) /
+	AV1D_LCU_MIN_SIZE_PELS));
+}
+
+static inline u32 size_av1d_lb_se_top_ctrl(u32 frame_width, u32 frame_height)
+{
+	return (((frame_width + 7) / 8) * 16);
+}
+
+static inline u32 size_av1d_lb_se_left_ctrl(u32 frame_width, u32 frame_height)
+{
+	return (max(((frame_height + 15) / 16) *
+		MAX_SE_NBR_CTRL_LCU16_LINE_BUFFER_SIZE,
+		max(((frame_height + 31) / 32) *
+		MAX_SE_NBR_CTRL_LCU32_LINE_BUFFER_SIZE,
+		((frame_height + 63) / 64) *
+		MAX_SE_NBR_CTRL_LCU64_LINE_BUFFER_SIZE)));
+}
+
+static inline u32 size_av1d_lb_pe_top_data(u32 frame_width, u32 frame_height)
+{
+	return (max(((frame_width + 15) / 16) *
+	MAX_PE_NBR_DATA_LCU16_LINE_BUFFER_SIZE,
+	max(((frame_width + 31) / 32) *
+	MAX_PE_NBR_DATA_LCU32_LINE_BUFFER_SIZE,
+	((frame_width + 63) / 64) *
+	MAX_PE_NBR_DATA_LCU64_LINE_BUFFER_SIZE)));
+}
+
+static inline u32 size_av1d_lb_vsp_top(u32 frame_width, u32 frame_height)
+{
+	return (max(((frame_width + 63) / 64) * 1280,
+		    ((frame_width + 127) / 128) * 2304));
+}
+
+static inline u32 size_av1d_lb_recon_dma_metadata_wr(u32 frame_width,
+						     u32 frame_height)
+{
+	return ((ALIGN(frame_height, 8) / (4 / 2)) * 64);
+}
+
+static inline u32 size_av1d_qp(u32 frame_width, u32 frame_height)
+{
+	return size_h264d_qp(frame_width, frame_height);
+}
+
 u32 iris_vpu_buf_size(struct iris_inst *inst, enum iris_buffer_type buffer_type);
 u32 iris_vpu33_buf_size(struct iris_inst *inst, enum iris_buffer_type buffer_type);
 int iris_vpu_buf_count(struct iris_inst *inst, enum iris_buffer_type buffer_type);

-- 
2.34.1


