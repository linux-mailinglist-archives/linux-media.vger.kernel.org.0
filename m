Return-Path: <linux-media+bounces-29655-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CC18A81127
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 18:01:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B25F37B3908
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 16:00:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52925254AF7;
	Tue,  8 Apr 2025 15:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="hgwFy0uz"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4537025484D;
	Tue,  8 Apr 2025 15:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744127786; cv=none; b=qE5c7THASPW73IdshtpqYDPzPYl6RTeRL2sLGs6Ckup8p7RpKIF8mKgHgr7n2bC54vtg0OwJFbANdEFjWt9ZPxVQnFZL862UNSLe+TT1+aYefKKDwSobUtYTE5z+Dl2nEJ9VCbaZMRxfOrLbho+sgZzKK6k5z6vMOqxI9I+DeE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744127786; c=relaxed/simple;
	bh=XL5OpOP3dRmWzwMVbFiLgtUpI96deCoXV7VqTsJMM08=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=odk55SWrG8j8bRPN/gOveivLs8bSFAhPTGuiAqyT1qhiNIrWN1HMtikG75IrJXyowX6CRPJFw7HfERg2iPGcpcn0BJkgrRCFVDXqhSDeyzmxfmRpBMjpDRhlryCoxlJkHTXjZOaNy41h06nyk/vQtBI8oO5TgonEHVe1iMHPY4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=hgwFy0uz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 538BWTSs000841;
	Tue, 8 Apr 2025 15:56:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DAImS73WWcQuUZtFTqfCTm3c9uTVk6E5YAwYDUbwKPQ=; b=hgwFy0uzb2A2sqFO
	5GA0jpHU5MkE2NGOjDNzvhpcqGYq8LtEcDyZ7KgYLBztvC50XGpjj529iTeXlZYq
	CX2vuKSFAacJdnkfgDsM1vCVY0I7WaOBBn6k6rmsRtkYgoPyR5cXI3a4s3kDwpSn
	HiMyYB5e1gRDPOtuG9abTAEO8QdUE6nNvYv59y4Kq/kkHA0+H94Xt9m1vwYegzoq
	ZZtjUY2FjEnvtNp8ZKKExu0DEoJREfYpF7e84GGwTvuaMQ2DLFL0NVDHPOTb604Y
	fJqc/ErRcjvlxQs7OZCUNyVTYYApxItnnxhnG5KrlurqKrU3EqK+U3fk1XqQDGUJ
	dhe3bw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twbe8cq2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Apr 2025 15:56:19 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 538FuJR8003844
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 8 Apr 2025 15:56:19 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 8 Apr 2025 08:56:14 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Tue, 8 Apr 2025 21:24:33 +0530
Subject: [PATCH 19/20] media: iris: Add internal buffer calculation for
 HEVC and VP9 decoders
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250408-iris-dec-hevc-vp9-v1-19-acd258778bd6@quicinc.com>
References: <20250408-iris-dec-hevc-vp9-v1-0-acd258778bd6@quicinc.com>
In-Reply-To: <20250408-iris-dec-hevc-vp9-v1-0-acd258778bd6@quicinc.com>
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil
	<hverkuil@xs4all.nl>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        "Dikshita
 Agarwal" <quic_dikshita@quicinc.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744127674; l=21089;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=XL5OpOP3dRmWzwMVbFiLgtUpI96deCoXV7VqTsJMM08=;
 b=gyHjjg5cpZBRaGomAVmdb2RrwzJqcQ5eaU/RAR3qZ4SLHgQh6ArAFS9Xd7WVKzqDC+Uxbv2qG
 HQwf5rDC8ZSCxQZO3gXNEZLb/zbL2xhturfTc82VvkycTQLD7dFDh8U
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: W0BsP0LLVh5C-3NKmrhETcaGUQi7rmFq
X-Authority-Analysis: v=2.4 cv=T7OMT+KQ c=1 sm=1 tr=0 ts=67f54724 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=jfhi-FcaFhKY8c-1rdoA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: W0BsP0LLVh5C-3NKmrhETcaGUQi7rmFq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_06,2025-04-08_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=999 lowpriorityscore=0 adultscore=0 phishscore=0 bulkscore=0
 mlxscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504080110

Add internal buffer count and size calculations for HEVC and VP9
decoders.

Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/iris/iris_buffer.c     |   3 +
 drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 397 ++++++++++++++++++++-
 drivers/media/platform/qcom/iris/iris_vpu_buffer.h |  46 ++-
 3 files changed, 432 insertions(+), 14 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
index c091a49bd140..9e5ef7cb803a 100644
--- a/drivers/media/platform/qcom/iris/iris_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_buffer.c
@@ -205,6 +205,9 @@ static u32 iris_bitstream_buffer_size(struct iris_inst *inst)
 	if (num_mbs > NUM_MBS_4K) {
 		div_factor = 4;
 		base_res_mbs = caps->max_mbpf;
+	} else {
+		if (inst->codec == V4L2_PIX_FMT_VP9)
+			div_factor = 1;
 	}
 
 	/*
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
index dce25e410d80..13ee93356bcb 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
@@ -31,6 +31,42 @@ static u32 hfi_buffer_bin_h264d(u32 frame_width, u32 frame_height, u32 num_vpp_p
 	return size_h264d_hw_bin_buffer(n_aligned_w, n_aligned_h, num_vpp_pipes);
 }
 
+static u32 size_h265d_hw_bin_buffer(u32 frame_width, u32 frame_height, u32 num_vpp_pipes)
+{
+	u32 product = frame_width * frame_height;
+	u32 size_yuv, size_bin_hdr, size_bin_res;
+
+	size_yuv = (product <= BIN_BUFFER_THRESHOLD) ?
+		((BIN_BUFFER_THRESHOLD * 3) >> 1) : ((product * 3) >> 1);
+	size_bin_hdr = size_yuv * H265_CABAC_HDR_RATIO_HD_TOT;
+	size_bin_res = size_yuv * H265_CABAC_RES_RATIO_HD_TOT;
+	size_bin_hdr = ALIGN(size_bin_hdr / num_vpp_pipes, DMA_ALIGNMENT) * num_vpp_pipes;
+	size_bin_res = ALIGN(size_bin_res / num_vpp_pipes, DMA_ALIGNMENT) * num_vpp_pipes;
+
+	return size_bin_hdr + size_bin_res;
+}
+
+static u32 hfi_buffer_bin_vp9d(u32 frame_width, u32 frame_height, u32 num_vpp_pipes)
+{
+	u32 _size_yuv = ALIGN(frame_width, 16) * ALIGN(frame_height, 16) * 3 / 2;
+	u32 _size = ALIGN(((max_t(u32, _size_yuv, ((BIN_BUFFER_THRESHOLD * 3) >> 1)) *
+			VPX_DECODER_FRAME_BIN_HDR_BUDGET / VPX_DECODER_FRAME_BIN_DENOMINATOR *
+			VPX_DECODER_FRAME_CONCURENCY_LVL) / num_vpp_pipes), DMA_ALIGNMENT) +
+			ALIGN(((max_t(u32, _size_yuv, ((BIN_BUFFER_THRESHOLD * 3) >> 1)) *
+			VPX_DECODER_FRAME_BIN_RES_BUDGET / VPX_DECODER_FRAME_BIN_DENOMINATOR *
+			VPX_DECODER_FRAME_CONCURENCY_LVL) / num_vpp_pipes), DMA_ALIGNMENT);
+
+	return _size * num_vpp_pipes;
+}
+
+static u32 hfi_buffer_bin_h265d(u32 frame_width, u32 frame_height, u32 num_vpp_pipes)
+{
+	u32 n_aligned_w = ALIGN(frame_width, 16);
+	u32 n_aligned_h = ALIGN(frame_height, 16);
+
+	return size_h265d_hw_bin_buffer(n_aligned_w, n_aligned_h, num_vpp_pipes);
+}
+
 static u32 hfi_buffer_comv_h264d(u32 frame_width, u32 frame_height, u32 _comv_bufcount)
 {
 	u32 frame_height_in_mbs = DIV_ROUND_UP(frame_height, 16);
@@ -55,6 +91,17 @@ static u32 hfi_buffer_comv_h264d(u32 frame_width, u32 frame_height, u32 _comv_bu
 	return (size_colloc * (_comv_bufcount)) + 512;
 }
 
+static u32 hfi_buffer_comv_h265d(u32 frame_width, u32 frame_height, u32 _comv_bufcount)
+{
+	u32 frame_height_in_mbs = (frame_height + 15) >> 4;
+	u32 frame_width_in_mbs = (frame_width + 15) >> 4;
+	u32 _size;
+
+	_size = ALIGN(((frame_width_in_mbs * frame_height_in_mbs) << 8), 512);
+
+	return (_size * (_comv_bufcount)) + 512;
+}
+
 static u32 size_h264d_bse_cmd_buf(u32 frame_height)
 {
 	u32 height = ALIGN(frame_height, 32);
@@ -63,6 +110,44 @@ static u32 size_h264d_bse_cmd_buf(u32 frame_height)
 		SIZE_H264D_BSE_CMD_PER_BUF;
 }
 
+static u32 size_h265d_bse_cmd_buf(u32 frame_width, u32 frame_height)
+{
+	u32 _size = ALIGN(((ALIGN(frame_width, LCU_MAX_SIZE_PELS) / LCU_MIN_SIZE_PELS) *
+			   (ALIGN(frame_height, LCU_MAX_SIZE_PELS) / LCU_MIN_SIZE_PELS)) *
+			  NUM_HW_PIC_BUF, DMA_ALIGNMENT);
+	_size = min_t(u32, _size, H265D_MAX_SLICE + 1);
+	_size = 2 * _size * SIZE_H265D_BSE_CMD_PER_BUF;
+
+	return _size;
+}
+
+static u32 hfi_buffer_persist_h265d(u32 rpu_enabled)
+{
+	return ALIGN((SIZE_SLIST_BUF_H265 * NUM_SLIST_BUF_H265 +
+		      H265_NUM_FRM_INFO * H265_DISPLAY_BUF_SIZE +
+		      H265_NUM_TILE * sizeof(u32) +
+		      NUM_HW_PIC_BUF * SIZE_SEI_USERDATA +
+		      rpu_enabled * NUM_HW_PIC_BUF * SIZE_DOLBY_RPU_METADATA),
+		     DMA_ALIGNMENT);
+}
+
+static inline
+u32 hfi_iris3_vp9d_comv_size(void)
+{
+	return (((8192 + 63) >> 6) * ((4320 + 63) >> 6) * 8 * 8 * 2 * 8);
+}
+
+static u32 hfi_buffer_persist_vp9d(void)
+{
+	return ALIGN(VP9_NUM_PROBABILITY_TABLE_BUF * VP9_PROB_TABLE_SIZE, DMA_ALIGNMENT) +
+		ALIGN(hfi_iris3_vp9d_comv_size(), DMA_ALIGNMENT) +
+		ALIGN(MAX_SUPERFRAME_HEADER_LEN, DMA_ALIGNMENT) +
+		ALIGN(VP9_UDC_HEADER_BUF_SIZE, DMA_ALIGNMENT) +
+		ALIGN(VP9_NUM_FRAME_INFO_BUF * CCE_TILE_OFFSET_SIZE, DMA_ALIGNMENT) +
+		ALIGN(VP9_NUM_FRAME_INFO_BUF * VP9_FRAME_INFO_BUF_SIZE, DMA_ALIGNMENT) +
+		HDR10_HIST_EXTRADATA_SIZE;
+}
+
 static u32 size_h264d_vpp_cmd_buf(u32 frame_height)
 {
 	u32 size, height = ALIGN(frame_height, 32);
@@ -83,17 +168,45 @@ static u32 hfi_buffer_persist_h264d(void)
 
 static u32 hfi_buffer_non_comv_h264d(u32 frame_width, u32 frame_height, u32 num_vpp_pipes)
 {
-	u32 size_bse, size_vpp, size;
-
-	size_bse = size_h264d_bse_cmd_buf(frame_height);
-	size_vpp = size_h264d_vpp_cmd_buf(frame_height);
-	size = ALIGN(size_bse, DMA_ALIGNMENT) +
+	u32 size_bse = size_h264d_bse_cmd_buf(frame_height);
+	u32 size_vpp = size_h264d_vpp_cmd_buf(frame_height);
+	u32 size = ALIGN(size_bse, DMA_ALIGNMENT) +
 		ALIGN(size_vpp, DMA_ALIGNMENT) +
 		ALIGN(SIZE_HW_PIC(SIZE_H264D_HW_PIC_T), DMA_ALIGNMENT);
 
 	return ALIGN(size, DMA_ALIGNMENT);
 }
 
+static u32 size_h265d_vpp_cmd_buf(u32 frame_width, u32 frame_height)
+{
+	u32 _size = ALIGN(((ALIGN(frame_width, LCU_MAX_SIZE_PELS) / LCU_MIN_SIZE_PELS) *
+			   (ALIGN(frame_height, LCU_MAX_SIZE_PELS) / LCU_MIN_SIZE_PELS)) *
+			  NUM_HW_PIC_BUF, DMA_ALIGNMENT);
+	_size = min_t(u32, _size, H265D_MAX_SLICE + 1);
+	_size = ALIGN(_size, 4);
+	_size = 2 * _size * SIZE_H265D_VPP_CMD_PER_BUF;
+	if (_size > VPP_CMD_MAX_SIZE)
+		_size = VPP_CMD_MAX_SIZE;
+
+	return _size;
+}
+
+static u32 hfi_buffer_non_comv_h265d(u32 frame_width, u32 frame_height, u32 num_vpp_pipes)
+{
+	u32 _size_bse = size_h265d_bse_cmd_buf(frame_width, frame_height);
+	u32 _size_vpp = size_h265d_vpp_cmd_buf(frame_width, frame_height);
+	u32 _size = ALIGN(_size_bse, DMA_ALIGNMENT) +
+		ALIGN(_size_vpp, DMA_ALIGNMENT) +
+		ALIGN(NUM_HW_PIC_BUF * 20 * 22 * 4, DMA_ALIGNMENT) +
+		ALIGN(2 * sizeof(u16) *
+		(ALIGN(frame_width, LCU_MAX_SIZE_PELS) / LCU_MIN_SIZE_PELS) *
+		(ALIGN(frame_height, LCU_MAX_SIZE_PELS) / LCU_MIN_SIZE_PELS), DMA_ALIGNMENT) +
+		ALIGN(SIZE_HW_PIC(SIZE_H265D_HW_PIC_T), DMA_ALIGNMENT) +
+		HDR10_HIST_EXTRADATA_SIZE;
+
+	return ALIGN(_size, DMA_ALIGNMENT);
+}
+
 static u32 size_vpss_lb(u32 frame_width, u32 frame_height)
 {
 	u32 opb_lb_wr_llb_y_buffer_size, opb_lb_wr_llb_uv_buffer_size;
@@ -119,6 +232,203 @@ static u32 size_vpss_lb(u32 frame_width, u32 frame_height)
 		opb_lb_wr_llb_y_buffer_size;
 }
 
+static inline
+u32 size_h265d_lb_fe_top_data(u32 frame_width, u32 frame_height)
+{
+	return MAX_FE_NBR_DATA_LUMA_LINE_BUFFER_SIZE *
+		(ALIGN(frame_width, 64) + 8) * 2;
+}
+
+static inline
+u32 size_h265d_lb_fe_top_ctrl(u32 frame_width, u32 frame_height)
+{
+	return MAX_FE_NBR_CTRL_LCU64_LINE_BUFFER_SIZE *
+		(ALIGN(frame_width, LCU_MAX_SIZE_PELS) / LCU_MIN_SIZE_PELS);
+}
+
+static inline
+u32 size_h265d_lb_fe_left_ctrl(u32 frame_width, u32 frame_height)
+{
+	return MAX_FE_NBR_CTRL_LCU64_LINE_BUFFER_SIZE *
+		(ALIGN(frame_height, LCU_MAX_SIZE_PELS) / LCU_MIN_SIZE_PELS);
+}
+
+static inline
+u32 size_h265d_lb_se_top_ctrl(u32 frame_width, u32 frame_height)
+{
+	return (LCU_MAX_SIZE_PELS / 8 * (128 / 8)) * ((frame_width + 15) >> 4);
+}
+
+static inline
+u32 size_h265d_lb_se_left_ctrl(u32 frame_width, u32 frame_height)
+{
+	return max_t(u32, ((frame_height + 16 - 1) / 8) *
+		MAX_SE_NBR_CTRL_LCU16_LINE_BUFFER_SIZE,
+		max_t(u32, ((frame_height + 32 - 1) / 8) *
+		MAX_SE_NBR_CTRL_LCU32_LINE_BUFFER_SIZE,
+		((frame_height + 64 - 1) / 8) *
+		MAX_SE_NBR_CTRL_LCU64_LINE_BUFFER_SIZE));
+}
+
+static inline
+u32 size_h265d_lb_pe_top_data(u32 frame_width, u32 frame_height)
+{
+	return MAX_PE_NBR_DATA_LCU64_LINE_BUFFER_SIZE *
+		(ALIGN(frame_width, LCU_MIN_SIZE_PELS) / LCU_MIN_SIZE_PELS);
+}
+
+static inline
+u32 size_h265d_lb_vsp_top(u32 frame_width, u32 frame_height)
+{
+	return ((frame_width + 63) >> 6) * 128;
+}
+
+static inline
+u32 size_h265d_lb_vsp_left(u32 frame_width, u32 frame_height)
+{
+	return ((frame_height + 63) >> 6) * 128;
+}
+
+static inline
+u32 size_h265d_lb_recon_dma_metadata_wr(u32 frame_width, u32 frame_height)
+{
+	return size_h264d_lb_recon_dma_metadata_wr(frame_height);
+}
+
+static inline
+u32 size_h265d_qp(u32 frame_width, u32 frame_height)
+{
+	return size_h264d_qp(frame_width, frame_height);
+}
+
+static inline
+u32 hfi_buffer_line_h265d(u32 frame_width, u32 frame_height, bool is_opb, u32 num_vpp_pipes)
+{
+	u32 vpss_lb_size = 0, _size;
+
+	_size = ALIGN(size_h265d_lb_fe_top_data(frame_width, frame_height), DMA_ALIGNMENT) +
+		ALIGN(size_h265d_lb_fe_top_ctrl(frame_width, frame_height), DMA_ALIGNMENT) +
+		ALIGN(size_h265d_lb_fe_left_ctrl(frame_width, frame_height),
+		      DMA_ALIGNMENT) * num_vpp_pipes +
+		ALIGN(size_h265d_lb_se_left_ctrl(frame_width, frame_height),
+		      DMA_ALIGNMENT) * num_vpp_pipes +
+		ALIGN(size_h265d_lb_se_top_ctrl(frame_width, frame_height), DMA_ALIGNMENT) +
+		ALIGN(size_h265d_lb_pe_top_data(frame_width, frame_height), DMA_ALIGNMENT) +
+		ALIGN(size_h265d_lb_vsp_top(frame_width, frame_height), DMA_ALIGNMENT) +
+		ALIGN(size_h265d_lb_vsp_left(frame_width, frame_height),
+		      DMA_ALIGNMENT) * num_vpp_pipes +
+		ALIGN(size_h265d_lb_recon_dma_metadata_wr(frame_width, frame_height),
+		      DMA_ALIGNMENT) * 4 +
+		ALIGN(size_h265d_qp(frame_width, frame_height), DMA_ALIGNMENT);
+	if (is_opb)
+		vpss_lb_size = size_vpss_lb(frame_width, frame_height);
+
+	return ALIGN((_size + vpss_lb_size), DMA_ALIGNMENT);
+}
+
+static inline
+u32 size_vpxd_lb_fe_left_ctrl(u32 frame_width, u32 frame_height)
+{
+	return max_t(u32, ((frame_height + 15) >> 4) *
+		     MAX_FE_NBR_CTRL_LCU16_LINE_BUFFER_SIZE,
+		     max_t(u32, ((frame_height + 31) >> 5) *
+			   MAX_FE_NBR_CTRL_LCU32_LINE_BUFFER_SIZE,
+			   ((frame_height + 63) >> 6) *
+			   MAX_FE_NBR_CTRL_LCU64_LINE_BUFFER_SIZE));
+}
+
+static inline
+u32 size_vpxd_lb_fe_top_ctrl(u32 frame_width, u32 frame_height)
+{
+	return ((ALIGN(frame_width, 64) + 8) * 10 * 2);
+}
+
+static inline
+u32 size_vpxd_lb_se_top_ctrl(u32 frame_width, u32 frame_height)
+{
+	return ((frame_width + 15) >> 4) * MAX_FE_NBR_CTRL_LCU16_LINE_BUFFER_SIZE;
+}
+
+static inline
+u32 size_vpxd_lb_se_left_ctrl(u32 frame_width, u32 frame_height)
+{
+	return max_t(u32, ((frame_height + 15) >> 4) *
+		     MAX_SE_NBR_CTRL_LCU16_LINE_BUFFER_SIZE,
+		     max_t(u32, ((frame_height + 31) >> 5) *
+			   MAX_SE_NBR_CTRL_LCU32_LINE_BUFFER_SIZE,
+			   ((frame_height + 63) >> 6) *
+			   MAX_SE_NBR_CTRL_LCU64_LINE_BUFFER_SIZE));
+}
+
+static inline
+u32 size_vpxd_lb_recon_dma_metadata_wr(u32 frame_width, u32 frame_height)
+{
+	return ALIGN((ALIGN(frame_height, 8) / (4 / 2)) * 64,
+		BUFFER_ALIGNMENT_32_BYTES);
+}
+
+static inline
+u32 size_mp2d_lb_fe_top_data(u32 frame_width, u32 frame_height)
+{
+	return ((ALIGN(frame_width, 16) + 8) * 10 * 2);
+}
+
+static inline
+u32 size_vp9d_lb_fe_top_data(u32 frame_width, u32 frame_height)
+{
+	return (ALIGN(ALIGN(frame_width, 8), 64) + 8) * 10 * 2;
+}
+
+static inline
+u32 size_vp9d_lb_pe_top_data(u32 frame_width, u32 frame_height)
+{
+	return ((ALIGN(ALIGN(frame_width, 8), 64) >> 6) * 176);
+}
+
+static inline
+u32 size_vp9d_lb_vsp_top(u32 frame_width, u32 frame_height)
+{
+	return (((ALIGN(ALIGN(frame_width, 8), 64) >> 6) * 64 * 8) + 256);
+}
+
+static inline
+u32 size_vp9d_qp(u32 frame_width, u32 frame_height)
+{
+	return size_h264d_qp(frame_width, frame_height);
+}
+
+static inline
+u32 hfi_iris3_vp9d_lb_size(u32 frame_width, u32 frame_height, u32 num_vpp_pipes)
+{
+	return ALIGN(size_vpxd_lb_fe_left_ctrl(frame_width, frame_height), DMA_ALIGNMENT) *
+		num_vpp_pipes +
+		ALIGN(size_vpxd_lb_se_left_ctrl(frame_width, frame_height), DMA_ALIGNMENT) *
+		num_vpp_pipes +
+		ALIGN(size_vp9d_lb_vsp_top(frame_width, frame_height), DMA_ALIGNMENT) +
+		ALIGN(size_vpxd_lb_fe_top_ctrl(frame_width, frame_height), DMA_ALIGNMENT) +
+		2 * ALIGN(size_vpxd_lb_recon_dma_metadata_wr(frame_width, frame_height),
+			  DMA_ALIGNMENT) +
+		ALIGN(size_vpxd_lb_se_top_ctrl(frame_width, frame_height), DMA_ALIGNMENT) +
+		ALIGN(size_vp9d_lb_pe_top_data(frame_width, frame_height), DMA_ALIGNMENT) +
+		ALIGN(size_vp9d_lb_fe_top_data(frame_width, frame_height), DMA_ALIGNMENT) +
+		ALIGN(size_vp9d_qp(frame_width, frame_height), DMA_ALIGNMENT);
+}
+
+static inline
+u32 hfi_buffer_line_vp9d(u32 frame_width, u32 frame_height, u32 _yuv_bufcount_min, bool is_opb,
+			 u32 num_vpp_pipes)
+{
+	u32 vpss_lb_size = 0;
+	u32 _lb_size;
+
+	_lb_size = hfi_iris3_vp9d_lb_size(frame_width, frame_height, num_vpp_pipes);
+
+	if (is_opb)
+		vpss_lb_size = size_vpss_lb(frame_width, frame_height);
+
+	return _lb_size + vpss_lb_size + 4096;
+}
+
 static u32 hfi_buffer_line_h264d(u32 frame_width, u32 frame_height,
 				 bool is_opb, u32 num_vpp_pipes)
 {
@@ -148,7 +458,14 @@ static u32 iris_vpu_dec_bin_size(struct iris_inst *inst)
 	u32 height = f->fmt.pix_mp.height;
 	u32 width = f->fmt.pix_mp.width;
 
-	return hfi_buffer_bin_h264d(width, height, num_vpp_pipes);
+	if (inst->codec == V4L2_PIX_FMT_H264)
+		return hfi_buffer_bin_h264d(width, height, num_vpp_pipes);
+	else if (inst->codec == V4L2_PIX_FMT_HEVC)
+		return hfi_buffer_bin_h265d(width, height, num_vpp_pipes);
+	else if (inst->codec == V4L2_PIX_FMT_VP9)
+		return hfi_buffer_bin_vp9d(width, height, num_vpp_pipes);
+
+	return 0;
 }
 
 static u32 iris_vpu_dec_comv_size(struct iris_inst *inst)
@@ -158,12 +475,24 @@ static u32 iris_vpu_dec_comv_size(struct iris_inst *inst)
 	u32 height = f->fmt.pix_mp.height;
 	u32 width = f->fmt.pix_mp.width;
 
-	return hfi_buffer_comv_h264d(width, height, num_comv);
+	if (inst->codec == V4L2_PIX_FMT_H264)
+		return hfi_buffer_comv_h264d(width, height, num_comv);
+	else if (inst->codec == V4L2_PIX_FMT_HEVC)
+		return hfi_buffer_comv_h265d(width, height, num_comv);
+
+	return 0;
 }
 
 static u32 iris_vpu_dec_persist_size(struct iris_inst *inst)
 {
-	return hfi_buffer_persist_h264d();
+	if (inst->codec == V4L2_PIX_FMT_H264)
+		return hfi_buffer_persist_h264d();
+	else if (inst->codec == V4L2_PIX_FMT_HEVC)
+		return hfi_buffer_persist_h265d(0);
+	else if (inst->codec == V4L2_PIX_FMT_VP9)
+		return hfi_buffer_persist_vp9d();
+
+	return 0;
 }
 
 static u32 iris_vpu_dec_dpb_size(struct iris_inst *inst)
@@ -181,7 +510,12 @@ static u32 iris_vpu_dec_non_comv_size(struct iris_inst *inst)
 	u32 height = f->fmt.pix_mp.height;
 	u32 width = f->fmt.pix_mp.width;
 
-	return hfi_buffer_non_comv_h264d(width, height, num_vpp_pipes);
+	if (inst->codec == V4L2_PIX_FMT_H264)
+		return hfi_buffer_non_comv_h264d(width, height, num_vpp_pipes);
+	else if (inst->codec == V4L2_PIX_FMT_HEVC)
+		return hfi_buffer_non_comv_h265d(width, height, num_vpp_pipes);
+
+	return 0;
 }
 
 static u32 iris_vpu_dec_line_size(struct iris_inst *inst)
@@ -191,11 +525,20 @@ static u32 iris_vpu_dec_line_size(struct iris_inst *inst)
 	u32 height = f->fmt.pix_mp.height;
 	u32 width = f->fmt.pix_mp.width;
 	bool is_opb = false;
+	u32 out_min_count = inst->buffers[BUF_OUTPUT].min_count;
 
 	if (iris_split_mode_enabled(inst))
 		is_opb = true;
 
-	return hfi_buffer_line_h264d(width, height, is_opb, num_vpp_pipes);
+	if (inst->codec == V4L2_PIX_FMT_H264)
+		return hfi_buffer_line_h264d(width, height, is_opb, num_vpp_pipes);
+	else if (inst->codec == V4L2_PIX_FMT_HEVC)
+		return hfi_buffer_line_h265d(width, height, is_opb, num_vpp_pipes);
+	else if (inst->codec == V4L2_PIX_FMT_VP9)
+		return hfi_buffer_line_vp9d(width, height, out_min_count, is_opb,
+			num_vpp_pipes);
+
+	return 0;
 }
 
 static u32 iris_vpu_dec_scratch1_size(struct iris_inst *inst)
@@ -205,6 +548,24 @@ static u32 iris_vpu_dec_scratch1_size(struct iris_inst *inst)
 		iris_vpu_dec_line_size(inst);
 }
 
+static int output_min_count(struct iris_inst *inst)
+{
+	int output_min_count = 4;
+
+	/* fw_min_count > 0 indicates reconfig event has already arrived */
+	if (inst->fw_min_count) {
+		if (iris_split_mode_enabled(inst) && inst->codec == V4L2_PIX_FMT_VP9)
+			return min_t(u32, 4, inst->fw_min_count);
+		else
+			return inst->fw_min_count;
+	}
+
+	if (inst->codec == V4L2_PIX_FMT_VP9)
+		output_min_count = 9;
+
+	return output_min_count;
+}
+
 struct iris_vpu_buf_type_handle {
 	enum iris_buffer_type type;
 	u32 (*handle)(struct iris_inst *inst);
@@ -238,6 +599,19 @@ int iris_vpu_buf_size(struct iris_inst *inst, enum iris_buffer_type buffer_type)
 	return size;
 }
 
+static u32 internal_buffer_count(struct iris_inst *inst,
+				 enum iris_buffer_type buffer_type)
+{
+	if (buffer_type == BUF_BIN || buffer_type == BUF_LINE ||
+	    buffer_type == BUF_PERSIST) {
+		return 1;
+	} else if (buffer_type == BUF_COMV || buffer_type == BUF_NON_COMV) {
+		if (inst->codec == V4L2_PIX_FMT_H264 || inst->codec == V4L2_PIX_FMT_HEVC)
+			return 1;
+	}
+	return 0;
+}
+
 static inline int iris_vpu_dpb_count(struct iris_inst *inst)
 {
 	if (iris_split_mode_enabled(inst)) {
@@ -254,12 +628,13 @@ int iris_vpu_buf_count(struct iris_inst *inst, enum iris_buffer_type buffer_type
 	case BUF_INPUT:
 		return MIN_BUFFERS;
 	case BUF_OUTPUT:
-		return inst->fw_min_count;
+		return output_min_count(inst);
 	case BUF_BIN:
 	case BUF_COMV:
 	case BUF_NON_COMV:
 	case BUF_LINE:
 	case BUF_PERSIST:
+		return internal_buffer_count(inst, buffer_type);
 	case BUF_SCRATCH_1:
 		return 1; /* internal buffer count needed by firmware is 1 */
 	case BUF_DPB:
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.h b/drivers/media/platform/qcom/iris/iris_vpu_buffer.h
index 62af6ea6ba1f..2272f0c21683 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.h
+++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.h
@@ -13,6 +13,10 @@ struct iris_inst;
 #define DMA_ALIGNMENT			256
 
 #define NUM_HW_PIC_BUF			32
+#define LCU_MAX_SIZE_PELS 64
+#define LCU_MIN_SIZE_PELS 16
+#define HDR10_HIST_EXTRADATA_SIZE (4 * 1024)
+
 #define SIZE_HW_PIC(size_per_buf)	(NUM_HW_PIC_BUF * (size_per_buf))
 
 #define MAX_TILE_COLUMNS		32
@@ -28,11 +32,47 @@ struct iris_inst;
 #define SIZE_SLIST_BUF_H264		512
 #define H264_DISPLAY_BUF_SIZE		3328
 #define H264_NUM_FRM_INFO		66
-
-#define SIZE_SEI_USERDATA		4096
-
+#define H265_NUM_TILE_COL 32
+#define H265_NUM_TILE_ROW 12
+#define H265_NUM_TILE (H265_NUM_TILE_ROW * H265_NUM_TILE_COL + 1)
+#define SIZE_H265D_BSE_CMD_PER_BUF (16 * sizeof(u32))
+
+#define NUM_SLIST_BUF_H265 (80 + 20)
+#define SIZE_SLIST_BUF_H265 (BIT(10))
+#define H265_DISPLAY_BUF_SIZE (3072)
+#define H265_NUM_FRM_INFO (48)
+
+#define VP9_NUM_FRAME_INFO_BUF 32
+#define VP9_NUM_PROBABILITY_TABLE_BUF (VP9_NUM_FRAME_INFO_BUF + 4)
+#define VP9_PROB_TABLE_SIZE (3840)
+#define VP9_FRAME_INFO_BUF_SIZE (6144)
+#define BUFFER_ALIGNMENT_32_BYTES 32
+#define CCE_TILE_OFFSET_SIZE ALIGN(32 * 4 * 4, BUFFER_ALIGNMENT_32_BYTES)
+#define MAX_SUPERFRAME_HEADER_LEN (34)
+#define MAX_FE_NBR_CTRL_LCU64_LINE_BUFFER_SIZE 64
+#define MAX_FE_NBR_CTRL_LCU32_LINE_BUFFER_SIZE 64
+#define MAX_FE_NBR_CTRL_LCU16_LINE_BUFFER_SIZE 64
+#define MAX_SE_NBR_CTRL_LCU16_LINE_BUFFER_SIZE (128 / 8)
+#define MAX_SE_NBR_CTRL_LCU32_LINE_BUFFER_SIZE (128 / 8)
+#define VP9_UDC_HEADER_BUF_SIZE	(3 * 128)
+
+#define SIZE_SEI_USERDATA			4096
+#define SIZE_DOLBY_RPU_METADATA (41 * 1024)
 #define H264_CABAC_HDR_RATIO_HD_TOT	1
 #define H264_CABAC_RES_RATIO_HD_TOT	3
+#define H265D_MAX_SLICE	1200
+#define SIZE_H265D_HW_PIC_T SIZE_H264D_HW_PIC_T
+#define H265_CABAC_HDR_RATIO_HD_TOT 2
+#define H265_CABAC_RES_RATIO_HD_TOT 2
+#define SIZE_H265D_VPP_CMD_PER_BUF (256)
+
+#define VPX_DECODER_FRAME_CONCURENCY_LVL (2)
+#define VPX_DECODER_FRAME_BIN_HDR_BUDGET 1
+#define VPX_DECODER_FRAME_BIN_RES_BUDGET 3
+#define VPX_DECODER_FRAME_BIN_DENOMINATOR 2
+
+#define VPX_DECODER_FRAME_BIN_RES_BUDGET_RATIO (3 / 2)
+
 #define SIZE_H264D_HW_PIC_T		(BIT(11))
 
 #define MAX_FE_NBR_CTRL_LCU64_LINE_BUFFER_SIZE	64

-- 
2.34.1


