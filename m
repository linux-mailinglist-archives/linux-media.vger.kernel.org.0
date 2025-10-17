Return-Path: <linux-media+bounces-44913-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B5C3BE928D
	for <lists+linux-media@lfdr.de>; Fri, 17 Oct 2025 16:21:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B49945692E8
	for <lists+linux-media@lfdr.de>; Fri, 17 Oct 2025 14:18:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E176132E14A;
	Fri, 17 Oct 2025 14:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Bfga0AP1"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25D6F393DFD
	for <linux-media@vger.kernel.org>; Fri, 17 Oct 2025 14:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760710651; cv=none; b=RaPOOKD9MstRIp03GVMeQTT/YoHHwjGyGZIwwIR7CCn9Sw9H9EW3oTHvg4sK4nlfRlODLZVBWhiNPMelWIc9Hish3J1cZDchVRYwTY43mYvZzJSy7iox8/9ol/2gq/iQhLuASf6QJxWazY554b8IZspaVYUQ+K13I5d2EfXHVDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760710651; c=relaxed/simple;
	bh=QUCzrQ27jWi4zu3mz4a5d4iizr3a4+2aOvcFaEdgCmI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MPmkHqWfNvBJP3+3btPJUop4YxlidxbAukgxgZSKOG/Hos4uaJSiK31SfG4c5TQeFFcc1hS/F+9y4Zd6gWVp3JYa1GNNqOQSRxgtraFgzxo5FK6kkJCRCLrvAttWVZoIdBW+AqRxd33xwzX3HDFCFdBHdYn69O+LA52Tynisiec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Bfga0AP1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59H87S2i006554
	for <linux-media@vger.kernel.org>; Fri, 17 Oct 2025 14:17:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p8SSPCNuUvsxVPD7C7eu+wivyoPxKDv1UCAhhnoPljM=; b=Bfga0AP1rudXbDsP
	EzfeXCiX3DqWqOFoQOSZ8Dx8mLHb+Ji5Q1lJHE7euKo0C74pZl/mRyDqGAwpZdRo
	6UtKgLdOzKxtpLhaSRhoPNjhd4kM2ITqtJTVechhx0xpopb0eeBAhrsf6d/pOp6X
	eqYpqIkdIfv84wUhErOY0WGMcMB9tT3tB+phr4NkdIJJ5ePGKC9G+t/lzs1hHWji
	5wWRqBmrIqzcMdAqE2kbIHSq2voeQyLkZwVUKt52KDO4r8ZsdZ7Ap3b5EuxfQcOZ
	txr874TKfb2tWgjpH33INgixXgnbXzOU2q5r4IrT5zmEGhP7LNsU89+Msg0ZXbI/
	riPuUQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qff14ev7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 17 Oct 2025 14:17:28 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-78102ba5966so2051994b3a.2
        for <linux-media@vger.kernel.org>; Fri, 17 Oct 2025 07:17:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760710647; x=1761315447;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p8SSPCNuUvsxVPD7C7eu+wivyoPxKDv1UCAhhnoPljM=;
        b=dck7IXWeV13sgxIdDyjJQUjjGaz9gyRG5ilscDCqY6mNbCd9G9ceOhbtbFDRxKECJu
         zsq32nvCy6ndirEL0E0/kfkWKFBF/QMAxhoBL6aHJS1cQ/qir2hrP8E4fMa+M9m+1s9v
         IBGSuDOgGzx3niAqgBwmImtgG4dnZZYPrEhlTCefLjnxnGSLuVAelJQBgk2x4Sddn0c+
         atg8az8vJkiAvomxMM/boiBxzXY/5O7vBWiVQzHrMBx0wPYkPGZZuX3+LiXqu2GLgdAe
         DGfAOcX20IJb+9SYtuQ3XoTG7oMYbfiog29BJD71HPutEUc6W3WWB/l6h7yLybxdrv7f
         msUQ==
X-Forwarded-Encrypted: i=1; AJvYcCWYbVSwXFpIMkUXWmRchHkaSihvYFRRoEs1zNZ2D07Y1aTdSJ46GkonhT77Elviuzf1D4FsTIe6O2UPjA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzuysrWZrc8qcLTu6mX1uMCEx45EtXXzwyHx0+7j2WTGiJWvZRV
	+SRLxjD3HwHRcBBHn1Ds8vUTuq+12z7cE8uXbk0SzDxxd1xd1/jyuH6e6A73sxZq2aSaHeRIMwF
	lpIWMuhAym4FI2eDER6whkoYtjqJ75ryihyCUomOypRNqdr+D6O8M5LMc5YPtufG7JvSUbIitJw
	==
X-Gm-Gg: ASbGnctMK+X6B4lMd6xb1o9ch3ZRSpRP9FCAJeC5FTCeEAT+7Z0DfQKSvwS6Gh6DDcx
	v7HK3pRZZ2RxZOnnL8Sa4irwl/U+w+oOy3iQiazz6mXVv3quOLH/qPC8tDauulL7qji+C8E87+U
	FK+p80OpoFLG78PZbca36yhYMjeF5+KCO97pqiIjDfk1glSdAjBKtL57m4Yxg6gTMAqsEk05kp8
	YfrBNRyjlPqmzehJLw+prces4Fa9cnq9OewvIPQegKI9xxSOGg1gnkaEIsFcskKtmP2ZLS9pnPN
	S4S5tphfm2PpGmCNjbCawRMwqdG1sRLcydT1d0D+ERP1OVO9GhLjmfOfWyAMzcVxDnlHzmBj5Ed
	zicKJLzfk8Ep6fMmovpbGepFnOi+eUR/UJg==
X-Received: by 2002:a05:6a00:1911:b0:78c:97fa:6170 with SMTP id d2e1a72fcca58-7a220b10732mr5221895b3a.17.1760710647049;
        Fri, 17 Oct 2025 07:17:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGvyCAohehHJDVOVN0iZeGAsZf0UHakRxKtJsk8yoISo7GKWPbIiZed8kVj6CE7hAJIXFAXcA==
X-Received: by 2002:a05:6a00:1911:b0:78c:97fa:6170 with SMTP id d2e1a72fcca58-7a220b10732mr5221824b3a.17.1760710646387;
        Fri, 17 Oct 2025 07:17:26 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d0966d7sm25895826b3a.40.2025.10.17.07.17.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 07:17:25 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Fri, 17 Oct 2025 19:46:25 +0530
Subject: [PATCH v2 4/8] media: iris: Introduce buffer size calculations for
 vpu4
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251017-knp_video-v2-4-f568ce1a4be3@oss.qualcomm.com>
References: <20251017-knp_video-v2-0-f568ce1a4be3@oss.qualcomm.com>
In-Reply-To: <20251017-knp_video-v2-0-f568ce1a4be3@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vishnu Reddy <quic_bvisredd@quicinc.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760710621; l=19297;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=QUCzrQ27jWi4zu3mz4a5d4iizr3a4+2aOvcFaEdgCmI=;
 b=eTkbvfThChqSxdWxxDjVnYxnzgbHc96WXIv9/oEjvlqiS1V3uABW3ZpD8F5YrS7wcyCsQ6jwj
 yd4CDYOimyCBpYmUHxNzfbFjm7YuBwc8Zj+gc8XjbIUoqEr8XNYzuZ5
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX4L3lguVGta/G
 Jd+/mlQodijLEPQ5xqN31xj8E/TU0Z7JNfb/Iu+klqU/1+VALKQu9OG4F3xj1bPYpJJ1aBkmavm
 Z0ZXWbQuWrbWXVrBNtUI92XsA6qDJoLt7KAaoHdWp8xek9EZmPewyN1hjrPtH1TIZhl9VfeIVwR
 et+dN232WyprVAgJ1+OVZsg9XA4IvaABmrogGjxY7G1a8xt4DoRFgU0Oesn7rx+L75Vh6otd6sw
 vknqDy2lojBeCLqwXSuvQdtqEHQvtmM+RTYMLBZ3F/K/FXh4QNEcLVgQVWHV5stpzrOifwEhJ0j
 8fkyNNhfd1wfk9OIdmSiTkZs6zxW+X0hmy3dwDWEQ==
X-Proofpoint-GUID: -1c0OcBuy6vCieDMLoOnqPGSkX9A5v_y
X-Authority-Analysis: v=2.4 cv=PriergM3 c=1 sm=1 tr=0 ts=68f24ff8 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=BpuH9DVPwUbd3VYPi08A:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: -1c0OcBuy6vCieDMLoOnqPGSkX9A5v_y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-17_05,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018

Introduces vp4 buffer size calculation for both encoder and decoder.
Reuse the buffer size calculation which are common, while adding the
vpu4 ones separately.

Co-developed-by: Vishnu Reddy <quic_bvisredd@quicinc.com>
Signed-off-by: Vishnu Reddy <quic_bvisredd@quicinc.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 345 +++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_vpu_buffer.h |  15 +
 2 files changed, 360 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
index 4463be05ce165adef6b152eb0c155d2e6a7b3c36..8cc52d7aba3ffb968191519c1a1a10e326403205 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
@@ -1408,6 +1408,307 @@ static u32 iris_vpu_enc_vpss_size(struct iris_inst *inst)
 	return hfi_buffer_vpss_enc(width, height, ds_enable, 0, 0);
 }
 
+static inline u32 size_dpb_opb(u32 height, u32 lcu_size)
+{
+	u32 max_tile_height = ((height + lcu_size - 1) / lcu_size) * lcu_size + 8;
+	u32 dpb_opb = 3 * ((max_tile_height >> 3) * DMA_ALIGNMENT);
+	u32 num_luma_chrome_plane = 2;
+
+	return dpb_opb = num_luma_chrome_plane * ALIGN(dpb_opb, DMA_ALIGNMENT);
+}
+
+static u32 hfi_vpu4x_vp9d_lb_size(u32 frame_width, u32 frame_height, u32 num_vpp_pipes)
+{
+	u32 vp9_top_lb, vp9_fe_left_lb, vp9_se_left_lb, dpb_opb, vp9d_qp, num_lcu_per_pipe;
+	u32 lcu_size = 64, fe_top_ctrl_line_numbers = 3, fe_top_data_luma_line_numbers = 2,
+	    fe_top_data_chroma_line_numbers = 3, fe_lft_ctrl_line_numbers = 4,
+	    fe_lft_db_data_line_numbers = 2, fe_lft_lr_data_line_numbers = 4;
+
+	vp9_top_lb = ALIGN(size_vp9d_lb_vsp_top(frame_width, frame_height), DMA_ALIGNMENT);
+	vp9_top_lb += ALIGN(size_vpxd_lb_se_top_ctrl(frame_width, frame_height), DMA_ALIGNMENT);
+	vp9_top_lb += max3(DIV_ROUND_UP(frame_width, BUFFER_ALIGNMENT_16_BYTES) *
+			   MAX_PE_NBR_DATA_LCU16_LINE_BUFFER_SIZE,
+			   DIV_ROUND_UP(frame_width, BUFFER_ALIGNMENT_32_BYTES) *
+			   MAX_PE_NBR_DATA_LCU32_LINE_BUFFER_SIZE,
+			   DIV_ROUND_UP(frame_width, BUFFER_ALIGNMENT_64_BYTES) *
+			   MAX_PE_NBR_DATA_LCU64_LINE_BUFFER_SIZE);
+	vp9_top_lb = ALIGN(vp9_top_lb, DMA_ALIGNMENT);
+	vp9_top_lb += ALIGN((DMA_ALIGNMENT * DIV_ROUND_UP(frame_width, lcu_size)),
+			    DMA_ALIGNMENT) * fe_top_ctrl_line_numbers;
+	vp9_top_lb += ALIGN(DMA_ALIGNMENT * 8 * DIV_ROUND_UP(frame_width, lcu_size),
+			    DMA_ALIGNMENT) * (fe_top_data_luma_line_numbers +
+			    fe_top_data_chroma_line_numbers);
+
+	num_lcu_per_pipe = (DIV_ROUND_UP(frame_height, lcu_size) / num_vpp_pipes) +
+			      (DIV_ROUND_UP(frame_height, lcu_size) % num_vpp_pipes);
+	vp9_fe_left_lb = ALIGN((DMA_ALIGNMENT * num_lcu_per_pipe), DMA_ALIGNMENT) *
+				fe_lft_ctrl_line_numbers;
+	vp9_fe_left_lb += ((ALIGN((DMA_ALIGNMENT * 8 * num_lcu_per_pipe), DMA_ALIGNMENT) *
+				fe_lft_db_data_line_numbers) +
+				ALIGN((DMA_ALIGNMENT * 3 * num_lcu_per_pipe), DMA_ALIGNMENT) +
+				ALIGN((DMA_ALIGNMENT * 4 * num_lcu_per_pipe), DMA_ALIGNMENT) +
+				(ALIGN((DMA_ALIGNMENT * 24 * num_lcu_per_pipe), DMA_ALIGNMENT) *
+				fe_lft_lr_data_line_numbers));
+	vp9_fe_left_lb = vp9_fe_left_lb * num_vpp_pipes;
+
+	vp9_se_left_lb = ALIGN(size_vpxd_lb_se_left_ctrl(frame_width, frame_height),
+			       DMA_ALIGNMENT);
+	dpb_opb = size_dpb_opb(frame_height, lcu_size);
+	vp9d_qp = ALIGN(size_vp9d_qp(frame_width, frame_height), DMA_ALIGNMENT);
+
+	return vp9_top_lb + vp9_fe_left_lb + (vp9_se_left_lb * num_vpp_pipes) +
+			(dpb_opb * num_vpp_pipes) + vp9d_qp;
+}
+
+static u32 hfi_vpu4x_buffer_line_vp9d(u32 frame_width, u32 frame_height, u32 _yuv_bufcount_min,
+				      bool is_opb, u32 num_vpp_pipes)
+{
+	u32 lb_size = hfi_vpu4x_vp9d_lb_size(frame_width, frame_height, num_vpp_pipes);
+	u32 dpb_obp_size = 0, lcu_size = 64;
+
+	if (is_opb)
+		dpb_obp_size = size_dpb_opb(frame_height, lcu_size) * num_vpp_pipes;
+
+	return lb_size + dpb_obp_size;
+}
+
+static u32 iris_vpu4x_dec_line_size(struct iris_inst *inst)
+{
+	u32 num_vpp_pipes = inst->core->iris_platform_data->num_vpp_pipe;
+	u32 out_min_count = inst->buffers[BUF_OUTPUT].min_count;
+	struct v4l2_format *f = inst->fmt_src;
+	u32 height = f->fmt.pix_mp.height;
+	u32 width = f->fmt.pix_mp.width;
+	bool is_opb = false;
+
+	if (iris_split_mode_enabled(inst))
+		is_opb = true;
+
+	if (inst->codec == V4L2_PIX_FMT_H264)
+		return hfi_buffer_line_h264d(width, height, is_opb, num_vpp_pipes);
+	else if (inst->codec == V4L2_PIX_FMT_HEVC)
+		return hfi_buffer_line_h265d(width, height, is_opb, num_vpp_pipes);
+	else if (inst->codec == V4L2_PIX_FMT_VP9)
+		return hfi_vpu4x_buffer_line_vp9d(width, height, out_min_count, is_opb,
+						  num_vpp_pipes);
+
+	return 0;
+}
+
+static u32 hfi_vpu4x_buffer_persist_h265d(u32 rpu_enabled)
+{
+	return ALIGN((SIZE_SLIST_BUF_H265 * NUM_SLIST_BUF_H265 + H265_NUM_FRM_INFO *
+		H265_DISPLAY_BUF_SIZE + (H265_NUM_TILE * sizeof(u32)) + (NUM_HW_PIC_BUF *
+		(SIZE_SEI_USERDATA + SIZE_H265D_ARP + SIZE_THREE_DIMENSION_USERDATA)) +
+		rpu_enabled * NUM_HW_PIC_BUF * SIZE_DOLBY_RPU_METADATA), DMA_ALIGNMENT);
+}
+
+static u32 hfi_vpu4x_buffer_persist_vp9d(void)
+{
+	return ALIGN(VP9_NUM_PROBABILITY_TABLE_BUF * VP9_PROB_TABLE_SIZE, DMA_ALIGNMENT) +
+		(ALIGN(hfi_iris3_vp9d_comv_size(), DMA_ALIGNMENT) * 2) +
+		ALIGN(MAX_SUPERFRAME_HEADER_LEN, DMA_ALIGNMENT) +
+		ALIGN(VP9_UDC_HEADER_BUF_SIZE, DMA_ALIGNMENT) +
+		ALIGN(VP9_NUM_FRAME_INFO_BUF * CCE_TILE_OFFSET_SIZE, DMA_ALIGNMENT) +
+		ALIGN(VP9_NUM_FRAME_INFO_BUF * VP9_FRAME_INFO_BUF_SIZE_VPU4X, DMA_ALIGNMENT) +
+		HDR10_HIST_EXTRADATA_SIZE;
+}
+
+static u32 iris_vpu4x_dec_persist_size(struct iris_inst *inst)
+{
+	if (inst->codec == V4L2_PIX_FMT_H264)
+		return hfi_buffer_persist_h264d();
+	else if (inst->codec == V4L2_PIX_FMT_HEVC)
+		return hfi_vpu4x_buffer_persist_h265d(0);
+	else if (inst->codec == V4L2_PIX_FMT_VP9)
+		return hfi_vpu4x_buffer_persist_vp9d();
+
+	return 0;
+}
+
+static u32 size_se_lb(u32 standard, u32 num_vpp_pipes_enc,
+		      u32 frame_width_coded, u32 frame_height_coded)
+{
+	u32 se_tlb_size = ALIGN(frame_width_coded, DMA_ALIGNMENT);
+	u32 se_llb_size = (standard == HFI_CODEC_ENCODE_HEVC) ?
+			   ((frame_height_coded + BUFFER_ALIGNMENT_32_BYTES - 1) /
+			    BUFFER_ALIGNMENT_32_BYTES) * LOG2_16 * LLB_UNIT_SIZE :
+			   ((frame_height_coded + BUFFER_ALIGNMENT_16_BYTES - 1) /
+			    BUFFER_ALIGNMENT_16_BYTES) * LOG2_32 * LLB_UNIT_SIZE;
+
+	se_llb_size = ALIGN(se_llb_size, BUFFER_ALIGNMENT_32_BYTES);
+
+	if (num_vpp_pipes_enc > 1)
+		se_llb_size = ALIGN(se_llb_size + BUFFER_ALIGNMENT_512_BYTES,
+				    DMA_ALIGNMENT) * num_vpp_pipes_enc;
+
+	return ALIGN(se_tlb_size + se_llb_size, DMA_ALIGNMENT);
+}
+
+static u32 size_te_lb(bool is_ten_bit, u32 num_vpp_pipes_enc, u32 width_in_lcus,
+		      u32 frame_height_coded, u32 frame_width_coded)
+{
+	u32 num_pixel_10_bit = 3, num_pixel_8_bit = 2, num_pixel_te_llb = 3;
+	u32 te_llb_col_rc_size = ALIGN(32 * width_in_lcus / num_vpp_pipes_enc,
+				       DMA_ALIGNMENT) * num_vpp_pipes_enc;
+	u32 te_tlb_recon_data_size = ALIGN((is_ten_bit ? num_pixel_10_bit : num_pixel_8_bit) *
+					frame_width_coded, DMA_ALIGNMENT);
+	u32 te_llb_recon_data_size = ((1 + is_ten_bit) * num_pixel_te_llb * frame_height_coded +
+				      num_vpp_pipes_enc - 1) / num_vpp_pipes_enc;
+	te_llb_recon_data_size = ALIGN(te_llb_recon_data_size, DMA_ALIGNMENT) * num_vpp_pipes_enc;
+
+	return ALIGN(te_llb_recon_data_size + te_llb_col_rc_size + te_tlb_recon_data_size,
+		     DMA_ALIGNMENT);
+}
+
+static inline u32 calc_fe_tlb_size(u32 size_per_lcu, bool is_ten_bit)
+{
+	u32 num_pixels_fe_tlb_10_bit = 128, num_pixels_fe_tlb_8_bit = 64;
+
+	return is_ten_bit ? (num_pixels_fe_tlb_10_bit * (size_per_lcu + 1)) :
+			(size_per_lcu * num_pixels_fe_tlb_8_bit);
+}
+
+static u32 size_fe_lb(bool is_ten_bit, u32 standard, u32 num_vpp_pipes_enc,
+		      u32 frame_height_coded, u32 frame_width_coded)
+{
+	u32 log2_lcu_size, num_cu_in_height_pipe, num_cu_in_width,
+	    fb_llb_db_ctrl_size, fb_llb_db_luma_size, fb_llb_db_chroma_size,
+	    fb_tlb_db_ctrl_size, fb_tlb_db_luma_size, fb_tlb_db_chroma_size,
+	    fb_llb_sao_ctrl_size, fb_llb_sao_luma_size, fb_llb_sao_chroma_size,
+	    fb_tlb_sao_ctrl_size, fb_tlb_sao_luma_size, fb_tlb_sao_chroma_size,
+	    fb_lb_top_sdc_size, fb_lb_se_ctrl_size, fe_tlb_size, size_per_lcu;
+	u32 fe_sdc_data_per_block = 16, se_ctrl_data_per_block = 2020;
+
+	log2_lcu_size = (standard == HFI_CODEC_ENCODE_HEVC) ? 5 : 4;
+	num_cu_in_height_pipe = ((frame_height_coded >> log2_lcu_size) + num_vpp_pipes_enc - 1) /
+				 num_vpp_pipes_enc;
+	num_cu_in_width = frame_width_coded >> log2_lcu_size;
+
+	size_per_lcu = 2;
+	fe_tlb_size = calc_fe_tlb_size(size_per_lcu, 1);
+	fb_llb_db_ctrl_size = ALIGN(fe_tlb_size, DMA_ALIGNMENT) * num_cu_in_height_pipe;
+	fb_llb_db_ctrl_size = ALIGN(fb_llb_db_ctrl_size, DMA_ALIGNMENT) * num_vpp_pipes_enc;
+
+	size_per_lcu = (1 << (log2_lcu_size - 3));
+	fe_tlb_size = calc_fe_tlb_size(size_per_lcu, is_ten_bit);
+	fb_llb_db_luma_size = ALIGN(fe_tlb_size, DMA_ALIGNMENT) * num_cu_in_height_pipe;
+	fb_llb_db_luma_size = ALIGN(fb_llb_db_luma_size, DMA_ALIGNMENT) * num_vpp_pipes_enc;
+
+	size_per_lcu = ((1 << (log2_lcu_size - 4)) * 2);
+	fe_tlb_size = calc_fe_tlb_size(size_per_lcu, is_ten_bit);
+	fb_llb_db_chroma_size = ALIGN(fe_tlb_size, DMA_ALIGNMENT) * num_cu_in_height_pipe;
+	fb_llb_db_chroma_size = ALIGN(fb_llb_db_chroma_size, DMA_ALIGNMENT) * num_vpp_pipes_enc;
+
+	size_per_lcu = 1;
+	fe_tlb_size = calc_fe_tlb_size(size_per_lcu, 1);
+	fb_tlb_db_ctrl_size = ALIGN(fe_tlb_size, DMA_ALIGNMENT) * num_cu_in_width;
+	fb_llb_sao_ctrl_size = ALIGN(fe_tlb_size, DMA_ALIGNMENT) * num_cu_in_height_pipe;
+	fb_llb_sao_ctrl_size = fb_llb_sao_ctrl_size * num_vpp_pipes_enc;
+	fb_tlb_sao_ctrl_size = ALIGN(fe_tlb_size, DMA_ALIGNMENT) * num_cu_in_width;
+
+	size_per_lcu = ((1 << (log2_lcu_size - 3)) + 1);
+	fe_tlb_size = calc_fe_tlb_size(size_per_lcu, is_ten_bit);
+	fb_tlb_db_luma_size = ALIGN(fe_tlb_size, DMA_ALIGNMENT) * num_cu_in_width;
+
+	size_per_lcu = (2 * ((1 << (log2_lcu_size - 4)) + 1));
+	fe_tlb_size = calc_fe_tlb_size(size_per_lcu, is_ten_bit);
+	fb_tlb_db_chroma_size = ALIGN(fe_tlb_size, DMA_ALIGNMENT) * num_cu_in_width;
+
+	fb_llb_sao_luma_size = BUFFER_ALIGNMENT_256_BYTES * num_vpp_pipes_enc;
+	fb_llb_sao_chroma_size = BUFFER_ALIGNMENT_256_BYTES * num_vpp_pipes_enc;
+	fb_tlb_sao_luma_size = BUFFER_ALIGNMENT_256_BYTES;
+	fb_tlb_sao_chroma_size = BUFFER_ALIGNMENT_256_BYTES;
+	fb_lb_top_sdc_size = ALIGN((fe_sdc_data_per_block * (frame_width_coded >> 5)),
+				   DMA_ALIGNMENT);
+	fb_lb_se_ctrl_size = ALIGN((se_ctrl_data_per_block * (frame_width_coded >> 5)),
+				   DMA_ALIGNMENT);
+
+	return fb_llb_db_ctrl_size + fb_llb_db_luma_size + fb_llb_db_chroma_size +
+		fb_tlb_db_ctrl_size + fb_tlb_db_luma_size + fb_tlb_db_chroma_size +
+		fb_llb_sao_ctrl_size + fb_llb_sao_luma_size + fb_llb_sao_chroma_size +
+		fb_tlb_sao_ctrl_size + fb_tlb_sao_luma_size + fb_tlb_sao_chroma_size +
+		fb_lb_top_sdc_size + fb_lb_se_ctrl_size;
+}
+
+static u32 size_md_lb(u32 standard, u32 frame_width_coded,
+		      u32 frame_height_coded, u32 num_vpp_pipes_enc)
+{
+	u32 md_tlb_size = ALIGN(frame_width_coded, DMA_ALIGNMENT);
+	u32 md_llb_size = (standard == HFI_CODEC_ENCODE_HEVC) ?
+			   ((frame_height_coded + BUFFER_ALIGNMENT_32_BYTES - 1) /
+			    BUFFER_ALIGNMENT_32_BYTES) * LOG2_16 * LLB_UNIT_SIZE :
+			   ((frame_height_coded + BUFFER_ALIGNMENT_16_BYTES - 1) /
+			    BUFFER_ALIGNMENT_16_BYTES) * LOG2_32 * LLB_UNIT_SIZE;
+
+	md_llb_size = ALIGN(md_llb_size, BUFFER_ALIGNMENT_32_BYTES);
+
+	if (num_vpp_pipes_enc > 1)
+		md_llb_size = ALIGN(md_llb_size + BUFFER_ALIGNMENT_512_BYTES,
+				    DMA_ALIGNMENT) * num_vpp_pipes_enc;
+
+	md_llb_size = ALIGN(md_llb_size, DMA_ALIGNMENT);
+
+	return ALIGN(md_tlb_size + md_llb_size, DMA_ALIGNMENT);
+}
+
+static u32 size_dma_opb_lb(u32 num_vpp_pipes_enc, u32 frame_width_coded,
+			   u32 frame_height_coded)
+{
+	u32 opb_packet_bytes = 128, opb_bpp = 128, opb_size_per_row = 6;
+	u32 dma_opb_wr_tlb_y_size = DIV_ROUND_UP(frame_width_coded, 16) * opb_packet_bytes;
+	u32 dma_opb_wr_tlb_uv_size = DIV_ROUND_UP(frame_width_coded, 16) * opb_packet_bytes;
+	u32 dma_opb_wr2_tlb_y_size = ALIGN((opb_bpp * opb_size_per_row * frame_height_coded / 8),
+					   DMA_ALIGNMENT) * num_vpp_pipes_enc;
+	u32 dma_opb_wr2_tlb_uv_size = ALIGN((opb_bpp * opb_size_per_row * frame_height_coded / 8),
+					    DMA_ALIGNMENT) * num_vpp_pipes_enc;
+
+	dma_opb_wr2_tlb_y_size = max(dma_opb_wr2_tlb_y_size, dma_opb_wr_tlb_y_size << 1);
+	dma_opb_wr2_tlb_uv_size = max(dma_opb_wr2_tlb_uv_size, dma_opb_wr_tlb_uv_size << 1);
+
+	return ALIGN(dma_opb_wr_tlb_y_size + dma_opb_wr_tlb_uv_size + dma_opb_wr2_tlb_y_size +
+		     dma_opb_wr2_tlb_uv_size, DMA_ALIGNMENT);
+}
+
+static u32 hfi_vpu4x_buffer_line_enc(u32 frame_width, u32 frame_height,
+				     bool is_ten_bit, u32 num_vpp_pipes_enc,
+				     u32 lcu_size, u32 standard)
+{
+	u32 width_in_lcus = (frame_width + lcu_size - 1) / lcu_size;
+	u32 height_in_lcus = (frame_height + lcu_size - 1) / lcu_size;
+	u32 frame_width_coded = width_in_lcus * lcu_size;
+	u32 frame_height_coded = height_in_lcus * lcu_size;
+
+	u32 se_lb_size = size_se_lb(standard, num_vpp_pipes_enc, frame_width_coded,
+				    frame_height_coded);
+	u32 te_lb_size = size_te_lb(is_ten_bit, num_vpp_pipes_enc, width_in_lcus,
+				    frame_height_coded, frame_width_coded);
+	u32 fe_lb_size = size_fe_lb(is_ten_bit, standard, num_vpp_pipes_enc, frame_height_coded,
+				    frame_width_coded);
+	u32 md_lb_size = size_md_lb(standard, frame_width_coded, frame_height_coded,
+				    num_vpp_pipes_enc);
+	u32 dma_opb_lb_size = size_dma_opb_lb(num_vpp_pipes_enc, frame_width_coded,
+					      frame_height_coded);
+	u32 dse_lb_size = ALIGN((256 + (16 * (frame_width_coded >> 4))), DMA_ALIGNMENT);
+	u32 size_vpss_lb_enc = size_vpss_line_buf_vpu33(num_vpp_pipes_enc, frame_width_coded,
+							frame_height_coded);
+
+	return se_lb_size + te_lb_size + fe_lb_size + md_lb_size + dma_opb_lb_size +
+		dse_lb_size + size_vpss_lb_enc;
+}
+
+static u32 iris_vpu4x_enc_line_size(struct iris_inst *inst)
+{
+	u32 num_vpp_pipes = inst->core->iris_platform_data->num_vpp_pipe;
+	u32 lcu_size = inst->codec == V4L2_PIX_FMT_HEVC ? 32 : 16;
+	struct v4l2_format *f = inst->fmt_dst;
+	u32 height = f->fmt.pix_mp.height;
+	u32 width = f->fmt.pix_mp.width;
+
+	return hfi_vpu4x_buffer_line_enc(width, height, 0, num_vpp_pipes,
+					 lcu_size, inst->codec);
+}
+
 static int output_min_count(struct iris_inst *inst)
 {
 	int output_min_count = 4;
@@ -1503,6 +1804,50 @@ u32 iris_vpu33_buf_size(struct iris_inst *inst, enum iris_buffer_type buffer_typ
 	return size;
 }
 
+u32 iris_vpu4x_buf_size(struct iris_inst *inst, enum iris_buffer_type buffer_type)
+{
+	const struct iris_vpu_buf_type_handle *buf_type_handle_arr = NULL;
+	u32 size = 0, buf_type_handle_size = 0, i;
+
+	static const struct iris_vpu_buf_type_handle dec_internal_buf_type_handle[] = {
+		{BUF_BIN,         iris_vpu_dec_bin_size         },
+		{BUF_COMV,        iris_vpu_dec_comv_size        },
+		{BUF_NON_COMV,    iris_vpu_dec_non_comv_size    },
+		{BUF_LINE,        iris_vpu4x_dec_line_size      },
+		{BUF_PERSIST,     iris_vpu4x_dec_persist_size   },
+		{BUF_DPB,         iris_vpu_dec_dpb_size         },
+		{BUF_SCRATCH_1,   iris_vpu_dec_scratch1_size    },
+	};
+
+	static const struct iris_vpu_buf_type_handle enc_internal_buf_type_handle[] = {
+		{BUF_BIN,         iris_vpu_enc_bin_size         },
+		{BUF_COMV,        iris_vpu_enc_comv_size        },
+		{BUF_NON_COMV,    iris_vpu_enc_non_comv_size    },
+		{BUF_LINE,        iris_vpu4x_enc_line_size      },
+		{BUF_ARP,         iris_vpu_enc_arp_size         },
+		{BUF_VPSS,        iris_vpu_enc_vpss_size        },
+		{BUF_SCRATCH_1,   iris_vpu_enc_scratch1_size    },
+		{BUF_SCRATCH_2,   iris_vpu_enc_scratch2_size    },
+	};
+
+	if (inst->domain == DECODER) {
+		buf_type_handle_size = ARRAY_SIZE(dec_internal_buf_type_handle);
+		buf_type_handle_arr = dec_internal_buf_type_handle;
+	} else if (inst->domain == ENCODER) {
+		buf_type_handle_size = ARRAY_SIZE(enc_internal_buf_type_handle);
+		buf_type_handle_arr = enc_internal_buf_type_handle;
+	}
+
+	for (i = 0; i < buf_type_handle_size; i++) {
+		if (buf_type_handle_arr[i].type == buffer_type) {
+			size = buf_type_handle_arr[i].handle(inst);
+			break;
+		}
+	}
+
+	return size;
+}
+
 static u32 internal_buffer_count(struct iris_inst *inst,
 				 enum iris_buffer_type buffer_type)
 {
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.h b/drivers/media/platform/qcom/iris/iris_vpu_buffer.h
index 04f0b7400a1e4e1d274d690a2761b9e57778e8b7..15037e99914afc19de9f0d38eb778ef63363463b 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.h
+++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.h
@@ -47,7 +47,12 @@ struct iris_inst;
 #define VP9_NUM_PROBABILITY_TABLE_BUF (VP9_NUM_FRAME_INFO_BUF + 4)
 #define VP9_PROB_TABLE_SIZE (3840)
 #define VP9_FRAME_INFO_BUF_SIZE (6144)
+#define VP9_FRAME_INFO_BUF_SIZE_VPU4X (6400)
+#define BUFFER_ALIGNMENT_16_BYTES 16
 #define BUFFER_ALIGNMENT_32_BYTES 32
+#define BUFFER_ALIGNMENT_64_BYTES 64
+#define BUFFER_ALIGNMENT_256_BYTES 256
+#define BUFFER_ALIGNMENT_512_BYTES 512
 #define CCE_TILE_OFFSET_SIZE ALIGN(32 * 4 * 4, BUFFER_ALIGNMENT_32_BYTES)
 #define MAX_SUPERFRAME_HEADER_LEN (34)
 #define MAX_FE_NBR_CTRL_LCU64_LINE_BUFFER_SIZE 64
@@ -66,6 +71,8 @@ struct iris_inst;
 #define H265_CABAC_HDR_RATIO_HD_TOT 2
 #define H265_CABAC_RES_RATIO_HD_TOT 2
 #define SIZE_H265D_VPP_CMD_PER_BUF (256)
+#define SIZE_THREE_DIMENSION_USERDATA 768
+#define SIZE_H265D_ARP 9728
 
 #define VPX_DECODER_FRAME_CONCURENCY_LVL (2)
 #define VPX_DECODER_FRAME_BIN_HDR_BUDGET 1
@@ -76,6 +83,9 @@ struct iris_inst;
 
 #define SIZE_H264D_HW_PIC_T		(BIT(11))
 
+#define MAX_PE_NBR_DATA_LCU16_LINE_BUFFER_SIZE 96
+#define MAX_PE_NBR_DATA_LCU32_LINE_BUFFER_SIZE 192
+
 #define MAX_FE_NBR_CTRL_LCU64_LINE_BUFFER_SIZE	64
 #define MAX_SE_NBR_CTRL_LCU64_LINE_BUFFER_SIZE	16
 #define MAX_PE_NBR_DATA_LCU64_LINE_BUFFER_SIZE	384
@@ -96,6 +106,10 @@ struct iris_inst;
 
 #define HFI_BUFFER_ARP_ENC 204800
 
+#define LOG2_16 4
+#define LOG2_32 5
+#define LLB_UNIT_SIZE 16
+
 #define MAX_WIDTH 4096
 #define MAX_HEIGHT 2304
 #define NUM_MBS_4K (DIV_ROUND_UP(MAX_WIDTH, 16) * DIV_ROUND_UP(MAX_HEIGHT, 16))
@@ -148,6 +162,7 @@ static inline u32 size_h264d_qp(u32 frame_width, u32 frame_height)
 
 u32 iris_vpu_buf_size(struct iris_inst *inst, enum iris_buffer_type buffer_type);
 u32 iris_vpu33_buf_size(struct iris_inst *inst, enum iris_buffer_type buffer_type);
+u32 iris_vpu4x_buf_size(struct iris_inst *inst, enum iris_buffer_type buffer_type);
 int iris_vpu_buf_count(struct iris_inst *inst, enum iris_buffer_type buffer_type);
 
 #endif

-- 
2.34.1


