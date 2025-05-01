Return-Path: <linux-media+bounces-31534-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A5983AA6405
	for <lists+linux-media@lfdr.de>; Thu,  1 May 2025 21:20:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D2AA198401D
	for <lists+linux-media@lfdr.de>; Thu,  1 May 2025 19:20:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D328B24677C;
	Thu,  1 May 2025 19:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="GeCcpidF"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36F4924676E;
	Thu,  1 May 2025 19:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746126978; cv=none; b=WS4gAlrAP7sgBIXrsPQgOIuIG6Ykxy9lCG/84HAQLFQLV5RRr6wEOSFuEGd1sSvhYZDKXkEvAuSV7RkH8zqQMNVUQEHDCOWomL7l90DsuIhCOiHPvJavBJQDhSS4wPPEBlCEjCoESMJplefRwpOQG4U7+5/v9x1ZRL0oMQoRmAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746126978; c=relaxed/simple;
	bh=gitygUOrRDrg0cH8IID0dZpuQImwaDaABMbl5UtVAe0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=bE9q7l7qPolcbpXtDq0AamPRwjVGox9Gl7nUaMl8uJF5nKwb7VVgYC8ff83RAxNBDFzse9eJjkT4dZI2Dv4kdZcy21/mNK6tXPsyH5MQIF/EZc0FjuSu34PP3a4M/RDkXPzAx5Qin1jtNa+Tg8FiJUgV5c8Er86cxgtziftD1bU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=GeCcpidF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 541D27XG008669;
	Thu, 1 May 2025 19:16:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W87ZxMQymfAh3KjpzE74Q9bYjnjuAe2wa43/cXTNA30=; b=GeCcpidFOu1Ak12s
	unilPW3SSXEefUJ85kzZNATCQLsQHIXnNhd/Qn/dmLzcQGeBozCeAlTP66JF8gkF
	Lg5iMKkVEoL3co0+BwUnZYvFfMmXwBHg6YllWdt7B3ENMnYk0QFlu5DAqmM0sgfg
	i4qToQU/XPyeGPQ5yDUYZyyQs5veyfROOj1aRlDmmfMNp4mw8fUAaPxE6K51xKtx
	RYwPaH1V7r6idRq6QXiiqguHwcA2qI+btBbT32S/FlCgIyJLOGaDiLbW2rGCRzXc
	k7Z++rzDgTK4OnsqSKmwvQJNIHq/4f8d3DmWl/+Uzl3MhJ117R1tITwjxcx7Q5Sl
	DobgoA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6uae3k8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 May 2025 19:16:09 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 541JG9Pv012992
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 1 May 2025 19:16:09 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 1 May 2025 12:16:03 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Fri, 2 May 2025 00:43:52 +0530
Subject: [PATCH v3 22/23] media: iris: Add internal buffer calculation for
 HEVC and VP9 decoders
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250502-qcom-iris-hevc-vp9-v3-22-552158a10a7d@quicinc.com>
References: <20250502-qcom-iris-hevc-vp9-v3-0-552158a10a7d@quicinc.com>
In-Reply-To: <20250502-qcom-iris-hevc-vp9-v3-0-552158a10a7d@quicinc.com>
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
	<dmitry.baryshkov@oss.qualcomm.com>,
        Neil Armstrong
	<neil.armstrong@linaro.org>,
        Nicolas Dufresne
	<nicolas.dufresne@collabora.com>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        <20250417-topic-sm8x50-iris-v10-v7-0-f020cb1d0e98@linaro.org>,
        <20250424-qcs8300_iris-v5-0-f118f505c300@quicinc.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746126827; l=21143;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=gitygUOrRDrg0cH8IID0dZpuQImwaDaABMbl5UtVAe0=;
 b=ii4CstNWRzAJJjTztCmS+5T2Bf2WYbiNzdz/aa8tOdbXSMlvwr6Ja936/YAAuBPjilf0OJhiz
 6w7hB2k27IQBOhLChUGo108rCsTa2GEfVwtA1ma3hEj1I3soD29fUpw
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=BNizrEQG c=1 sm=1 tr=0 ts=6813c879 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=jfhi-FcaFhKY8c-1rdoA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAxMDE0NyBTYWx0ZWRfX7CcuAbILwUGD UzauizXEc9zr9C1Rfn2iRyyYOwqGhF7+ojnx3KNgwJVchWXy/ZSr1UPSfMpgfOXG5d8tEUXa2hQ u0sxTUc/LeSUTKlJ8LIaDH1XqSDtYzQeXjwoH3xMe+Vk0Sy7itHbnF2rdZYOwxY9NEmlrrxq4HR
 rUSt13qPFXASM9HGiKFtJidvAU1JCHOcepn+CeHP6rClEc1uqCTwTqyHxwZc41DYJksNvgh6bsu GGyCJ7ix2H9QMlntLVmS5NGN6t35zJocaWpIPopINXOdNcXOB1euKkYguJo2JdBMjU1UQL2sxlr OPzNiVp0tpeaK0aV1bhD8EXPsI00wnODxFz5DTQ9a5sDQ53/L2jribkqA8m6KOtZUpwcu9aTsd2
 NLkkf2MIjARsweV9B8VU4WE/4kJlnTjh5PmKW19N08DLqhveeqKyXg8llVbcki3qtHD0QZcI
X-Proofpoint-GUID: 2ob97S7svDWn6ZLLuduTKtILUxCZy4dM
X-Proofpoint-ORIG-GUID: 2ob97S7svDWn6ZLLuduTKtILUxCZy4dM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-01_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0 adultscore=0
 phishscore=0 mlxscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505010147

Add internal buffer count and size calculations for HEVC and VP9
decoders.

Acked-by: Vikash Garodia <quic_vgarodia@quicinc.com>
Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/iris/iris_buffer.c     |   3 +
 drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 397 ++++++++++++++++++++-
 drivers/media/platform/qcom/iris/iris_vpu_buffer.h |  46 ++-
 3 files changed, 432 insertions(+), 14 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
index 7dbac74b1a8d..6425e4919e3b 100644
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


