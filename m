Return-Path: <linux-media+bounces-46214-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F26BAC2C0F5
	for <lists+linux-media@lfdr.de>; Mon, 03 Nov 2025 14:25:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EDD9F1894A85
	for <lists+linux-media@lfdr.de>; Mon,  3 Nov 2025 13:25:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82A1D304989;
	Mon,  3 Nov 2025 13:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ar537HC4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RnghjHy0"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58B2A26D4D4
	for <linux-media@vger.kernel.org>; Mon,  3 Nov 2025 13:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762176268; cv=none; b=XJgKqUjwulDQPi3Y4rq5pkmQF4U84KtaOYwJgQuZoUmOsANpKbrrMOeX0bd2z/C7Rjfrpj2blabLCIeKZ3OmSFJd7dC26lWCuHDucqoOq3d3EGJBVBJOBNsCxjLDZXYi7mPDMX1h5USfSlQNputqmPGoLCTFR6AUb7RPp/CL/ZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762176268; c=relaxed/simple;
	bh=fTkurkuNrJZkDzeoFQ0NTL4A3MjLIBcgXI+/4voJeAQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p2SL17qTWuRVfz0Tp40Ngwor6Fpzg23MCqSjQaI4cCTTWZyfEl6th9qUzdfVyMu/OvB6vmJ3THUFkrUdUqEcJbChbsVwzD72QekI2Vuv/D8FqagBTVcs3yHMuivCz0WJYfst4sjR7A2fo+cNTW9gxGgyDffCcwsqO0rxZrqVtYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ar537HC4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RnghjHy0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A3B5rfs2906330
	for <linux-media@vger.kernel.org>; Mon, 3 Nov 2025 13:24:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cEcsYsit1dRgvZ0wf/p/8EfE3Mkov766qHMPRrIP/sY=; b=ar537HC4iaXPjT/v
	Gz8jyZUrkXJ8aRmbT2HS3nz8ERQR1jWagVnfZHWQCwXB2bTg2A4MmyHyko5OyVpM
	RYp0HVDOX+t8mGfrElT5jENHELwvRwe3s0JY9Oxxj8kVE/XTSqWXJc6cHmT5tSwh
	5SECF6XXorCZKf5LdjnptyuOLbix6cJ0d41ugWufn0tmX/tKvX3kyGzC3HS38aEI
	NtF6eXUTKwTYKnGwVBuEHqWQC70LX9TdSAIxuUiS12lGpQvNFWn8xjZbrWR4noeo
	LXmgf9KHZZvhGKRd3Su3LXudxdUcEDhiKq7h+4Yje0YG9r22fdy/+vA9/2aNvLGA
	DdJNrQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a6u7krasw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 03 Nov 2025 13:24:24 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3413ea2c342so287447a91.2
        for <linux-media@vger.kernel.org>; Mon, 03 Nov 2025 05:24:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762176264; x=1762781064; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cEcsYsit1dRgvZ0wf/p/8EfE3Mkov766qHMPRrIP/sY=;
        b=RnghjHy0Egl3lhEi5UqVU0OQaEGDkodHYs4FjXvDrIUw0mlEYMbK9BZRDlub7VY+TY
         HKeu1p6jTfsjIW54VFzvzhlDdXXRv8wVErxC+qnUI+5CRu6etcBYH/aaDyFmslQiqCHh
         2Tlbn/YLFmOB1iORWOVohbwvNRHzQ5jWL4Oj0lz+kYW9jwlw/yOBUoP9yzvEJb6Tb+WA
         ElvUO+nE1eAvM2Y9gqhloZDGmCd6jo/3dmAOpBadBHcoGh7tFyLa9JroA+jmpaZnVx6I
         jhGfEtWwz+Zl+0V2mB+9SFd+GasR7NSuuVO9bVaX3oeCIktINbTwA1gNcLO41pffPwhs
         8KLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762176264; x=1762781064;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cEcsYsit1dRgvZ0wf/p/8EfE3Mkov766qHMPRrIP/sY=;
        b=WGiw3AcF7x1fcIDELiEWTkdPuc1gCfDztXcZD30dNnLXPPjXV5ZXxkGr9RO0Jk5tWd
         HjSZyXKGWTy8MN0sTYl9HR1TJ6ovPuq14QYaAArGL345EWBmaDnhMja3h7LQZ68vqhVC
         sUZgHmtnzrWOaKeov0zEbiOtKV/wO1JutjlFbrGOoFw6aTQF8nAZH8aJPwr9STcd1NAm
         N7y5zqD4mm9dd8lhp7ZGaPRMAjzxsmF1paEjymMXiPKjdRc/SJMLdIG5ptWQs0HqedUK
         +CszIXvr9GByWYGMpB/2J46mup1EoWKW+8Lwodk3y05GKXXFyoyAM4GssgNX/TyhsYw8
         Qj9A==
X-Gm-Message-State: AOJu0YzqEplDC/0pTucYXyiTFwddrxhynXuoMZHJYzKsUcD4HA/MotE7
	SX2Lq2yEUW1o7gxR7RjwkgMw/WhTmIqBz4vWY3Pxllt/q0/wROMw0h2MLTMfVMpT877YKBm9JUp
	miAoFsu/wv7wU/FpM1m61Xp5t9wWamMsP/toEUnfKqKywuEz2ue87engSf/nR94PyOg==
X-Gm-Gg: ASbGncuKhwHlIJ2gmwbcx9mUCimpQpScwgfd+X5l9/faZ4hhaN7/RaMBasdCB4YqWID
	FbmYO6sxmPHHpeEaotuwE44r6vh6uFOAWQGO+Ij2IEXRmuo1LasYHbw79NhribZmqwOl4U58/2h
	OIdbhEWOJdUKphi2ZnY7MeaCEHKXtMZPUkCFsGH/xwWCQkTcfmHgRc4qLzk7XktKGVQpyt7aNNZ
	Us9gHHdRh22LQqZGXKRySnB2zJC/J+XbOIcQGUaNQGoFVE2IFco/tEw3Uf8RfUu+9xhUmDMfbiv
	4hgDAENpBzhdUBJnsD2TZLHD48e+0YnTUQ5B2/Qpzb8WbkF6Af/CCP4xPY/2VFkfFAg2uMD2eQ/
	jLfcjuHXVIaMLYLbIHslXg1YyffXBtkCqz9hTOpXKK74gDDSNeRLTDbNjVDE=
X-Received: by 2002:a17:90b:17ca:b0:340:e0f3:8212 with SMTP id 98e67ed59e1d1-340e0f3837amr4041185a91.8.1762176263464;
        Mon, 03 Nov 2025 05:24:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEAqLv6nmScg7UsOVb1R+BWtCu9dQsDZqFefKHsBWSLJWTPlxvSCt0URJ5DgrqDQmtpgs/dMQ==
X-Received: by 2002:a17:90b:17ca:b0:340:e0f3:8212 with SMTP id 98e67ed59e1d1-340e0f3837amr4041146a91.8.1762176262656;
        Mon, 03 Nov 2025 05:24:22 -0800 (PST)
Received: from gu-dmadival-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3407ec24330sm6614812a91.2.2025.11.03.05.24.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 05:24:22 -0800 (PST)
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Date: Mon, 03 Nov 2025 05:24:09 -0800
Subject: [PATCH v4 5/5] media: iris: Add internal buffer calculation for
 AV1 decoder
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251103-av1d_stateful_v3-v4-5-33cc1eaa83f2@oss.qualcomm.com>
References: <20251103-av1d_stateful_v3-v4-0-33cc1eaa83f2@oss.qualcomm.com>
In-Reply-To: <20251103-av1d_stateful_v3-v4-0-33cc1eaa83f2@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, kernel test robot <lkp@intel.com>,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762176256; l=23772;
 i=deepa.madivalara@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=fTkurkuNrJZkDzeoFQ0NTL4A3MjLIBcgXI+/4voJeAQ=;
 b=/18jVyQzog4wEyGemp8X0caDsZTHjnm3LbJzYavbRQQgGvaGe+bsXtO4X/zKPnpBC5c0LFfhH
 xijX+rsxZkGChfI6ltZ27+D1MP7ezspGMnaK79jS0mCUF/UBbD4uoDA
X-Developer-Key: i=deepa.madivalara@oss.qualcomm.com; a=ed25519;
 pk=MOEXgyokievn+bgpHdS6Ixh/KQYyS90z2mqIbQ822FQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAzMDEyMSBTYWx0ZWRfX3tvzjP26bZWI
 aASQXGL2XCB/iqmzXlzQAT3HD7fBoUl4MogpJMes34iRn8MX4Z0LSwUrIlBl7q9sTCWLugu34Oa
 hAivoYuw+YHIY5GfDeCcF4UjNbN06wY2SAcyNp3sOzKIHaAh4vcwR4zRkId89wOUlvwkyNfmVBj
 IJWbBD3qlWvo832bxMK+o4HUgYreCnXln1lUqPSLIsXR4kDheDE5LLVyXxDJ8K7/8J9XrGVvUNS
 jhmcirO4E/f1px7935ETOsCwxegAk4JwhHP6QWuHXeF5ng4mSoVZFdG41Pt1vYWzPLNYqspVnaK
 59quh5kxqliq/53/H2aQDXh0CE75iisp4j97VCfirsdtKvhjM8rh+pFUVs5CBxelSxU9hv2SZYt
 O3FkacXpgqrezm1Pi5x5ifDd6zDUNQ==
X-Proofpoint-ORIG-GUID: 9a9UbxtEs7n75eqdm3DifLZGpv1XDI4n
X-Proofpoint-GUID: 9a9UbxtEs7n75eqdm3DifLZGpv1XDI4n
X-Authority-Analysis: v=2.4 cv=Q9HfIo2a c=1 sm=1 tr=0 ts=6908ad08 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=3eCS73FKbHPN4UNaIXEA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-03_02,2025-11-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 suspectscore=0 bulkscore=0 adultscore=0 clxscore=1015 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511030121

Implement internal buffer count and size calculations for AV1 decoder
for all the buffer types required by the AV1 decoder, including BIN,
COMV, PERSIST, LINE, and PARTIAL.

This ensures the hardware decoder has properly allocated memory for AV1
decoding operations, enabling correct AV1 video playback.

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_buffer.h     |   1 +
 drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 299 ++++++++++++++++++++-
 drivers/media/platform/qcom/iris/iris_vpu_buffer.h | 116 ++++++++
 3 files changed, 412 insertions(+), 4 deletions(-)

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
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
index 4463be05ce165adef6b152eb0c155d2e6a7b3c36..f4985790bae4104ec5769e2de16a56727af462ba 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
@@ -9,6 +9,17 @@
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
+#define AV1D_SIZE_BSE_COL_MV_64x64 512
+#define AV1D_SIZE_BSE_COL_MV_128x128 2816
+#define UBWC_TILE_SIZE 256
 
 #ifndef SYSTEM_LAL_TILE10
 #define SYSTEM_LAL_TILE10 192
@@ -39,6 +50,31 @@ static u32 hfi_buffer_bin_h264d(u32 frame_width, u32 frame_height, u32 num_vpp_p
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
@@ -110,6 +146,26 @@ static u32 hfi_buffer_comv_h265d(u32 frame_width, u32 frame_height, u32 _comv_bu
 	return (_size * (_comv_bufcount)) + 512;
 }
 
+static u32 num_lcu(u32 frame_width, u32 frame_height, u32 lcu_size)
+{
+	return ((frame_width + lcu_size - 1) / lcu_size) *
+		((frame_height + lcu_size - 1) / lcu_size);
+}
+
+static u32 hfi_buffer_comv_av1d(u32 frame_width, u32 frame_height, u32 comv_bufcount)
+{
+	u32 size;
+
+	size =  2 * ALIGN(max(num_lcu(frame_width, frame_height, 64) *
+			  AV1D_SIZE_BSE_COL_MV_64x64,
+			  num_lcu(frame_width, frame_height, 128) *
+			  AV1D_SIZE_BSE_COL_MV_128x128),
+			  DMA_ALIGNMENT);
+	size *= comv_bufcount;
+
+	return size;
+}
+
 static u32 size_h264d_bse_cmd_buf(u32 frame_height)
 {
 	u32 height = ALIGN(frame_height, 32);
@@ -122,7 +178,7 @@ static u32 size_h265d_bse_cmd_buf(u32 frame_width, u32 frame_height)
 {
 	u32 _size = ALIGN(((ALIGN(frame_width, LCU_MAX_SIZE_PELS) / LCU_MIN_SIZE_PELS) *
 			   (ALIGN(frame_height, LCU_MAX_SIZE_PELS) / LCU_MIN_SIZE_PELS)) *
-			  NUM_HW_PIC_BUF, DMA_ALIGNMENT);
+			    NUM_HW_PIC_BUF, DMA_ALIGNMENT);
 	_size = min_t(u32, _size, H265D_MAX_SLICE + 1);
 	_size = 2 * _size * SIZE_H265D_BSE_CMD_PER_BUF;
 
@@ -174,6 +230,20 @@ static u32 hfi_buffer_persist_h264d(void)
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
@@ -459,6 +529,182 @@ static u32 hfi_buffer_line_h264d(u32 frame_width, u32 frame_height,
 	return ALIGN((size + vpss_lb_size), DMA_ALIGNMENT);
 }
 
+static u32 size_av1d_lb_opb_wr1_nv12_ubwc(u32 frame_width, u32 frame_height)
+{
+	u32 size, y_width, y_width_a = 128;
+
+	y_width = ALIGN(frame_width, y_width_a);
+
+	size = ((y_width + HFI_COLOR_FORMAT_YUV420_NV12_UBWC_Y_TILE_WIDTH - 1) /
+		 HFI_COLOR_FORMAT_YUV420_NV12_UBWC_Y_TILE_WIDTH  +
+		 (AV1D_MAX_TILE_COLS - 1));
+	return size * UBWC_TILE_SIZE;
+}
+
+static u32 size_av1d_lb_opb_wr1_tp10_ubwc(u32 frame_width, u32 frame_height)
+{
+	u32 size, y_width, y_width_a = 256;
+
+	y_width = ALIGN(frame_width, y_width_a);
+
+	size = ((y_width + HFI_COLOR_FORMAT_YUV420_TP10_UBWC_Y_TILE_WIDTH - 1) /
+		 HFI_COLOR_FORMAT_YUV420_TP10_UBWC_Y_TILE_WIDTH +
+		 (AV1D_MAX_TILE_COLS - 1));
+
+	return size * UBWC_TILE_SIZE;
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
+	opbwr8 = size_av1d_lb_opb_wr1_nv12_ubwc(frame_width, frame_height);
+	opbwr10 = size_av1d_lb_opb_wr1_tp10_ubwc(frame_width, frame_height);
+	opbwrbufsize = opbwr8 >= opbwr10 ? opbwr8 : opbwr10;
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
+static u32 hfi_yuv420_tp10_calc_y_stride(u32 frame_width, u32 stride_multiple)
+{
+	u32 stride;
+
+	stride = ALIGN(frame_width, 192);
+	stride = ALIGN(stride * 4 / 3, stride_multiple);
+
+	return stride;
+}
+
+static u32 hfi_yuv420_tp10_calc_y_bufheight(u32 frame_height, u32 min_buf_height_multiple)
+{
+	return ALIGN(frame_height, min_buf_height_multiple);
+}
+
+static u32 hfi_yuv420_tp10_calc_uv_stride(u32 frame_width, u32 stride_multiple)
+{
+	u32 stride;
+
+	stride = ALIGN(frame_width, 192);
+	stride = ALIGN(stride * 4 / 3, stride_multiple);
+
+	return stride;
+}
+
+static u32 hfi_yuv420_tp10_calc_uv_bufheight(u32 frame_height, u32 min_buf_height_multiple)
+{
+	return ALIGN(((frame_height + 1) >> 1),	min_buf_height_multiple);
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
+	y_width = hfi_yuv420_tp10_calc_y_stride(frame_width, y_width_a);
+	y_height = hfi_yuv420_tp10_calc_y_bufheight(frame_height, y_height_a);
+	uv_width = hfi_yuv420_tp10_calc_uv_stride(frame_width, uv_width_a);
+	uv_height = hfi_yuv420_tp10_calc_uv_bufheight(frame_height, uv_height_a);
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
@@ -472,6 +718,8 @@ static u32 iris_vpu_dec_bin_size(struct iris_inst *inst)
 		return hfi_buffer_bin_h265d(width, height, num_vpp_pipes);
 	else if (inst->codec == V4L2_PIX_FMT_VP9)
 		return hfi_buffer_bin_vp9d(width, height, num_vpp_pipes);
+	else if (inst->codec == V4L2_PIX_FMT_AV1)
+		return hfi_buffer_bin_av1d(width, height, num_vpp_pipes);
 
 	return 0;
 }
@@ -487,18 +735,34 @@ static u32 iris_vpu_dec_comv_size(struct iris_inst *inst)
 		return hfi_buffer_comv_h264d(width, height, num_comv);
 	else if (inst->codec == V4L2_PIX_FMT_HEVC)
 		return hfi_buffer_comv_h265d(width, height, num_comv);
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
@@ -545,6 +809,8 @@ static u32 iris_vpu_dec_line_size(struct iris_inst *inst)
 	else if (inst->codec == V4L2_PIX_FMT_VP9)
 		return hfi_buffer_line_vp9d(width, height, out_min_count, is_opb,
 			num_vpp_pipes);
+	else if (inst->codec == V4L2_PIX_FMT_AV1)
+		return hfi_buffer_line_av1d(width, height, is_opb, num_vpp_pipes);
 
 	return 0;
 }
@@ -653,6 +919,15 @@ static u32 iris_vpu_enc_bin_size(struct iris_inst *inst)
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
@@ -1414,7 +1689,9 @@ static int output_min_count(struct iris_inst *inst)
 
 	/* fw_min_count > 0 indicates reconfig event has already arrived */
 	if (inst->fw_min_count) {
-		if (iris_split_mode_enabled(inst) && inst->codec == V4L2_PIX_FMT_VP9)
+		if (iris_split_mode_enabled(inst) &&
+		    (inst->codec == V4L2_PIX_FMT_VP9 ||
+		     inst->codec == V4L2_PIX_FMT_AV1))
 			return min_t(u32, 4, inst->fw_min_count);
 		else
 			return inst->fw_min_count;
@@ -1422,6 +1699,8 @@ static int output_min_count(struct iris_inst *inst)
 
 	if (inst->codec == V4L2_PIX_FMT_VP9)
 		output_min_count = 9;
+	else if (inst->codec == V4L2_PIX_FMT_AV1)
+		output_min_count = 11;
 
 	return output_min_count;
 }
@@ -1444,6 +1723,7 @@ u32 iris_vpu_buf_size(struct iris_inst *inst, enum iris_buffer_type buffer_type)
 		{BUF_PERSIST,     iris_vpu_dec_persist_size         },
 		{BUF_DPB,         iris_vpu_dec_dpb_size             },
 		{BUF_SCRATCH_1,   iris_vpu_dec_scratch1_size        },
+		{BUF_PARTIAL,     iris_vpu_dec_partial_size         },
 	};
 
 	static const struct iris_vpu_buf_type_handle enc_internal_buf_type_handle[] = {
@@ -1510,14 +1790,20 @@ static u32 internal_buffer_count(struct iris_inst *inst,
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
@@ -1536,9 +1822,13 @@ int iris_vpu_buf_count(struct iris_inst *inst, enum iris_buffer_type buffer_type
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
@@ -1546,6 +1836,7 @@ int iris_vpu_buf_count(struct iris_inst *inst, enum iris_buffer_type buffer_type
 	case BUF_SCRATCH_2:
 	case BUF_VPSS:
 	case BUF_ARP:
+	case BUF_PARTIAL:
 		return 1; /* internal buffer count needed by firmware is 1 */
 	case BUF_DPB:
 		return iris_vpu_dpb_count(inst);
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.h b/drivers/media/platform/qcom/iris/iris_vpu_buffer.h
index 04f0b7400a1e4e1d274d690a2761b9e57778e8b7..13c7199fcf351cac5f01c0d1ca20c093b1e62234 100644
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
@@ -101,6 +118,15 @@ struct iris_inst;
 #define NUM_MBS_4K (DIV_ROUND_UP(MAX_WIDTH, 16) * DIV_ROUND_UP(MAX_HEIGHT, 16))
 #define NUM_MBS_720P	(((ALIGN(1280, 16)) >> 4) * ((ALIGN(736, 16)) >> 4))
 
+#define BITS_PER_PIX                   16
+#define NUM_LINES_LUMA                 10
+#define NUM_LINES_CHROMA               6
+#define AV1D_LCU_MAX_SIZE_PELS         128
+#define AV1D_LCU_MIN_SIZE_PELS         64
+#define AV1D_MAX_TILE_COLS             64
+#define BITS_PER_CTRL_PACK             128
+#define NUM_CTRL_PACK_LCU              10
+
 static inline u32 size_h264d_lb_fe_top_data(u32 frame_width)
 {
 	return MAX_FE_NBR_DATA_LUMA_LINE_BUFFER_SIZE * ALIGN(frame_width, 16) * 3;
@@ -146,6 +172,96 @@ static inline u32 size_h264d_qp(u32 frame_width, u32 frame_height)
 	return DIV_ROUND_UP(frame_width, 64) * DIV_ROUND_UP(frame_height, 64) * 128;
 }
 
+static inline u32 size_av1d_lb_fe_top_data(u32 frame_width, u32 frame_height)
+{
+	return (ALIGN(frame_width, AV1D_LCU_MAX_SIZE_PELS) *
+		((BITS_PER_PIX * NUM_LINES_LUMA) >> 3) +
+		  ALIGN(frame_width, AV1D_LCU_MAX_SIZE_PELS) / 2 *
+		((BITS_PER_PIX * NUM_LINES_CHROMA) >> 3) * 2);
+}
+
+static inline u32 size_av1d_lb_fe_left_data(u32 frame_width, u32 frame_height)
+{
+	return (32 * (ALIGN(frame_height, AV1D_LCU_MAX_SIZE_PELS) +
+			  ALIGN(frame_height, AV1D_LCU_MAX_SIZE_PELS) /
+			  AV1D_LCU_MIN_SIZE_PELS * 16) +
+		16 * (ALIGN(frame_height, AV1D_LCU_MAX_SIZE_PELS) / 2 +
+			  ALIGN(frame_height, AV1D_LCU_MAX_SIZE_PELS) /
+			  AV1D_LCU_MIN_SIZE_PELS * 8) * 2 +
+		24 * (ALIGN(frame_height, AV1D_LCU_MAX_SIZE_PELS) +
+			  ALIGN(frame_height, AV1D_LCU_MAX_SIZE_PELS) /
+			  AV1D_LCU_MIN_SIZE_PELS * 16) +
+		24 * (ALIGN(frame_height, AV1D_LCU_MAX_SIZE_PELS) / 2 +
+			  ALIGN(frame_height, AV1D_LCU_MAX_SIZE_PELS) /
+			  AV1D_LCU_MIN_SIZE_PELS * 12) * 2 +
+		24 * (ALIGN(frame_height, AV1D_LCU_MAX_SIZE_PELS) +
+			  ALIGN(frame_height, AV1D_LCU_MAX_SIZE_PELS) /
+			  AV1D_LCU_MIN_SIZE_PELS * 16) +
+		16 * (ALIGN(frame_height, AV1D_LCU_MAX_SIZE_PELS) +
+			  ALIGN(frame_height, AV1D_LCU_MAX_SIZE_PELS) /
+			  AV1D_LCU_MIN_SIZE_PELS * 16) +
+		16 * (ALIGN(frame_height, AV1D_LCU_MAX_SIZE_PELS) / 2 +
+			  ALIGN(frame_height, AV1D_LCU_MAX_SIZE_PELS) /
+			  AV1D_LCU_MIN_SIZE_PELS * 12) * 2);
+}
+
+static inline u32 size_av1d_lb_fe_top_ctrl(u32 frame_width, u32 frame_height)
+{
+	return (NUM_CTRL_PACK_LCU * ((frame_width + AV1D_LCU_MIN_SIZE_PELS - 1) /
+		AV1D_LCU_MIN_SIZE_PELS) * BITS_PER_CTRL_PACK / 8);
+}
+
+static inline u32 size_av1d_lb_fe_left_ctrl(u32 frame_width, u32 frame_height)
+{
+	return (16 * ((ALIGN(frame_height, AV1D_LCU_MAX_SIZE_PELS) / 16) +
+		(ALIGN(frame_height, AV1D_LCU_MAX_SIZE_PELS) /
+		 AV1D_LCU_MIN_SIZE_PELS)) +
+		 3 * 16 * (ALIGN(frame_height, AV1D_LCU_MAX_SIZE_PELS) /
+		 AV1D_LCU_MIN_SIZE_PELS));
+}
+
+static inline u32 size_av1d_lb_se_top_ctrl(u32 frame_width, u32 frame_height)
+{
+	return (((frame_width + 7) / 8) * MAX_SE_NBR_CTRL_LCU16_LINE_BUFFER_SIZE);
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
+		MAX_PE_NBR_DATA_LCU16_LINE_BUFFER_SIZE,
+		max(((frame_width + 31) / 32) *
+		MAX_PE_NBR_DATA_LCU32_LINE_BUFFER_SIZE,
+		((frame_width + 63) / 64) *
+		MAX_PE_NBR_DATA_LCU64_LINE_BUFFER_SIZE)));
+}
+
+static inline u32 size_av1d_lb_vsp_top(u32 frame_width, u32 frame_height)
+{
+	return (max(((frame_width + 63) / 64) * 1280,
+		    ((frame_width + 127) / 128) * MAX_HEIGHT));
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


