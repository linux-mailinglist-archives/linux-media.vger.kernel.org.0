Return-Path: <linux-media+bounces-44965-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F66BEE024
	for <lists+linux-media@lfdr.de>; Sun, 19 Oct 2025 09:59:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 53D1D4EB672
	for <lists+linux-media@lfdr.de>; Sun, 19 Oct 2025 07:58:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 160F62417DE;
	Sun, 19 Oct 2025 07:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C9gk2Q9w"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 905B923EAA6
	for <linux-media@vger.kernel.org>; Sun, 19 Oct 2025 07:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760860635; cv=none; b=lonxdtprz42UVQ7ubAsmkIVWc3TW1BVm8aljKCi3tWcS6/DbEYjgVQck3WsNfuWguzrB2jFVRRkCOseIx35SgJYy/UuSjnMwHgKit6zKqMCBxSgCJwIWZdSI1/z6gsBwMDpnftmc3ZFWJwPgVTQou9hsWMgeKWxNisISH37d/uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760860635; c=relaxed/simple;
	bh=C+tcorQ5hQe6Y69Mt0PlaH/Ulwn8QpcJFrIQfiZIazU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OKOYhza2z7ANnQ7/PwmeF2rMb4RHUOBOzHKuzR42imcI+zkt/VJWtsVUxeBZ8Q2mvTDMzhtCZNehn58NQcr1F3IEE7seoCFL11UkQ743CSXn/kUEbY2+lC0WU46Dtzd7NrzoFh5zB0BUcTXOzx1sVOtnuvt3/th9xK5DjxerA98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C9gk2Q9w; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59J4EJuJ001671
	for <linux-media@vger.kernel.org>; Sun, 19 Oct 2025 07:57:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sYG9RnU2JjgBnuLLxHsgQ90XfW5PUsP89Yd/GaNL9c0=; b=C9gk2Q9wpShKnToT
	kdoJM86cwVi+dATqypNdCq+Bq3/4sZPAJ2Lw40j8kuImWL59BPb8WU9nm0GbKmgG
	gFTnSR55S6IYmgNwgX9QHnC0ct0ovr63SXC1WGGLH+a1ZDQ9PTANhrZgx4gTwH35
	Arxvk/HT0D5yZA8PVwlkRian7+5G/+szyjalG6VEUmPoaH0wQXyvRj7FgDAFmGju
	J4auCHclu8E92aZZ0WHSA5tkW515k1KwyEw0jk/yRLsPgSG0UJERS//ACUfVxTcb
	ayKF8PavNbZRolfzSWg95hOVyuc0SRyVtuUT8BQ1+vDQLBNH9JqZfApOXMmBDeEc
	wWYpGA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v27ht4jb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sun, 19 Oct 2025 07:57:12 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-890f1090e44so553047585a.3
        for <linux-media@vger.kernel.org>; Sun, 19 Oct 2025 00:57:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760860630; x=1761465430;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sYG9RnU2JjgBnuLLxHsgQ90XfW5PUsP89Yd/GaNL9c0=;
        b=C300kxugBrVzHp92sd8esVTlXnDx20EIFx/cjq7uM23YFqsCXCcOKN7me74PiQixAg
         xAa/5pcoYGSgeTaz/Y57QV++YrMqhptg55Q/m5gvcZDhrisDXtUaokH0S1ztJXAFWeeP
         nrmu5DqPPR85NKN6wX5ZY7q0mr/EherP0iX2B5J4LNM5VgH8aN1AqpLvXpVnThjST7df
         ovhmKu+qMWuNjWQ0fIQEZR4soDglM6JPsVw3co+IsvuZGbUOvmXIvhnA0DGXvDSifeUe
         67RgEykLkNdRk34B0bgBg4U4yF+XaipWZlP9efZpsgUkBZaEh7SPHNBtwJovHb4NuhPk
         sqog==
X-Gm-Message-State: AOJu0YwqXxOGa5wI9So52GftY5rBrZsy12ac7dOtpdiJz5syK4U2fAM1
	N1daJd3qs/r9Xv1sxKJjlcpz2JYwZ7snXMiUWvtXi7XQSDD0bCmouUP6RI+2Vo9Xzdk3YVKr7MQ
	6k+qJdbfFXlajPLrTFi/MPB1HZxxQyQfMGglKxjtjkGTH/rJrRgCqaZO8Hbl8mRyOuA==
X-Gm-Gg: ASbGncsQrr8kNWtMbZ0tx6Lw5x9/5yufGfdSVnV7kbgH9Psl/Iyd+/OEIAjToiKus/r
	BMHOVCAEaDosGgiCNexwWSnfNLOzZOqa7ZLzusCKCfZ1KKXep4c49RqfQ8vatQu2sYdk985Zl4P
	Kz45DLlT1dK6+bO+yysY542RJ5wBEpAR49N77lLojyUy7J/lsLDSdINEqPxS/SwFHVVFlS/J6mA
	2HzIFqdjrtyNc8LhMeF/LVHJyeFcoMSSs7sqconaNbSSgNZeEtZf6K56h5SYyys/U4TspZvbYrJ
	e9xnmBM3U5dzFeNHlXKXEMv4exYeS2OfhK3Yns/FcWx+02+kMLhk/uMsnCK4HEow5ZAv3A4VrK3
	4p8EfLs5KFNoWICOA+PDvRgwqDnQsS4FvNxwgh85LpZyG4ZZ1DsSPi9JFNdYCs1mLto2X+aTk2L
	lKYEFBUhyswdE=
X-Received: by 2002:ac8:5a08:0:b0:4e8:a359:b786 with SMTP id d75a77b69052e-4e8a359bde3mr107281371cf.73.1760860630340;
        Sun, 19 Oct 2025 00:57:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHF4pkxWHCITjdw0m9ZOMLqjuCg5k/N7oiB6DVMVktvfzfp4MRLna+wvK4tda5kxTsa5gFqlQ==
X-Received: by 2002:ac8:5a08:0:b0:4e8:a359:b786 with SMTP id d75a77b69052e-4e8a359bde3mr107281141cf.73.1760860629861;
        Sun, 19 Oct 2025 00:57:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-591deeaf4cesm1357027e87.30.2025.10.19.00.57.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Oct 2025 00:57:08 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 19 Oct 2025 10:56:53 +0300
Subject: [PATCH v4 6/6] media: iris: enable support for SC7280 platform
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251019-iris-sc7280-v4-6-ee6dcee6e741@oss.qualcomm.com>
References: <20251019-iris-sc7280-v4-0-ee6dcee6e741@oss.qualcomm.com>
In-Reply-To: <20251019-iris-sc7280-v4-0-ee6dcee6e741@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=11511;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=C+tcorQ5hQe6Y69Mt0PlaH/Ulwn8QpcJFrIQfiZIazU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBo9JnEGtex7ObfejIPjVhrc/S8LsahQuLGrblrN
 0ORApSj+HqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaPSZxAAKCRCLPIo+Aiko
 1cPECACRiGzBg9v/l3lzQnVnEmH1ULWj1/tAwabxEuQY/M6swJfQbhkhNMq9YTMzzufWQDwv/qm
 t1a7KF9qAVwGkk5WPEUqQo7t6eekZzQLh2cAZyYyZ82b+fz8Sr+OZ2JbX8+7jIOpF7Zx4t2eE89
 Pmg3MW6p5Nv0Wh5WvzzaW/rPkZUxpl8jAv8Mt8QWd8xSP0qbfEvJloqGNBGqUaL1gwaqX1Bj6x3
 2R7UKrteJE6T9knplc5QillOFAOVzpng7Z9XqQwLXWl+gvAVE7rdpHzfM4n+qB8xr8FEom1Su6J
 Mfr9XeOcIeDEwK8v0mYpVgEETu4osMeI1dziVbfclqRUEo/M
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAxOCBTYWx0ZWRfXw3tYv/FzPXnJ
 OXda2FUA3AfBIk5S2Ij33N0bU6JjzVG/tXqKg9ty3b6qsKj3SQBSqeUszPnnQ7/ClosttUzgdCc
 ZW0CnMC1n5APp5BKtzgNJt6k3Y+RlNCMiv465J4cSirz4KiSlbUlWpRZEC3ye5/KZT/FUWXPDow
 dwXTCgidID7v09BingoerArxoEAOVHY0VhsXemS23IFI/lyuFClOotzAH1A6rEscYjGc17KrTwi
 EiWbWF3FDHW2rPnTwzuuf4Gj1UL3/vELnXyyr3q2uJRM6RbkoEjSjZ0Cv93PdV1hRjzZKm1XZru
 9+rWB7aiW+zWyl9fraU6WeF6j7SN/Ewwk1z2F/B22Sy4Ot9fz+zrbZnfrTCU4xhaPTBdohqEF9h
 glCaJpS9bKWbV6ClmbOx1on4aDUo1g==
X-Authority-Analysis: v=2.4 cv=G4UR0tk5 c=1 sm=1 tr=0 ts=68f499d8 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=pG0Ruh8lDxDpiiRDS04A:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: eY3Pj_0XxmLSNc6SB6Ea40FT4BAvpWEy
X-Proofpoint-ORIG-GUID: eY3Pj_0XxmLSNc6SB6Ea40FT4BAvpWEy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-19_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 adultscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510180018

As a part of migrating code from the old Venus driver to the new Iris
one, add support for the SC7280 platform. It is very similar to SM8250,
but it (currently) uses no reset controls (there is an optional
GCC-generated reset, it will be added later) and no AON registers
region. Extend the VPU ops to support optional clocks and skip the AON
shutdown for this platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../platform/qcom/iris/iris_platform_common.h      |  4 ++
 .../media/platform/qcom/iris/iris_platform_gen1.c  | 52 ++++++++++++++++++++++
 .../platform/qcom/iris/iris_platform_sc7280.h      | 27 +++++++++++
 drivers/media/platform/qcom/iris/iris_probe.c      |  4 ++
 drivers/media/platform/qcom/iris/iris_resources.c  |  2 +-
 drivers/media/platform/qcom/iris/iris_vpu2.c       |  6 +++
 drivers/media/platform/qcom/iris/iris_vpu_common.c | 34 ++++++++++----
 7 files changed, 119 insertions(+), 10 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 5ffc1874e8c6362b1c650e912c230e9c4e3bd160..8d8cdb56a3c7722c06287d4d10feed14ba2b254c 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -42,6 +42,7 @@ enum pipe_type {
 };
 
 extern const struct iris_platform_data qcs8300_data;
+extern const struct iris_platform_data sc7280_data;
 extern const struct iris_platform_data sm8250_data;
 extern const struct iris_platform_data sm8550_data;
 extern const struct iris_platform_data sm8650_data;
@@ -50,7 +51,9 @@ extern const struct iris_platform_data sm8750_data;
 enum platform_clk_type {
 	IRIS_AXI_CLK, /* AXI0 in case of platforms with multiple AXI clocks */
 	IRIS_CTRL_CLK,
+	IRIS_AHB_CLK,
 	IRIS_HW_CLK,
+	IRIS_HW_AHB_CLK,
 	IRIS_AXI1_CLK,
 	IRIS_CTRL_FREERUN_CLK,
 	IRIS_HW_FREERUN_CLK,
@@ -224,6 +227,7 @@ struct iris_platform_data {
 	u32 hw_response_timeout;
 	struct ubwc_config_data *ubwc_config;
 	u32 num_vpp_pipe;
+	bool no_aon;
 	u32 max_session_count;
 	/* max number of macroblocks per frame supported */
 	u32 max_core_mbpf;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen1.c b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
index 9cb9ddc86ad73daf75383b3253e851394235093d..beea8c79de34d163f113d3449fee18d33bfe5fd9 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen1.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
@@ -12,6 +12,8 @@
 #include "iris_vpu_buffer.h"
 #include "iris_vpu_common.h"
 
+#include "iris_platform_sc7280.h"
+
 #define BITRATE_MIN		32000
 #define BITRATE_MAX		160000000
 #define BITRATE_PEAK_DEFAULT	(BITRATE_DEFAULT * 2)
@@ -363,3 +365,53 @@ const struct iris_platform_data sm8250_data = {
 	.enc_ip_int_buf_tbl = sm8250_enc_ip_int_buf_tbl,
 	.enc_ip_int_buf_tbl_size = ARRAY_SIZE(sm8250_enc_ip_int_buf_tbl),
 };
+
+const struct iris_platform_data sc7280_data = {
+	.get_instance = iris_hfi_gen1_get_instance,
+	.init_hfi_command_ops = &iris_hfi_gen1_command_ops_init,
+	.init_hfi_response_ops = iris_hfi_gen1_response_ops_init,
+	.get_vpu_buffer_size = iris_vpu_buf_size,
+	.vpu_ops = &iris_vpu2_ops,
+	.set_preset_registers = iris_set_sm8250_preset_registers,
+	.icc_tbl = sm8250_icc_table,
+	.icc_tbl_size = ARRAY_SIZE(sm8250_icc_table),
+	.bw_tbl_dec = sc7280_bw_table_dec,
+	.bw_tbl_dec_size = ARRAY_SIZE(sc7280_bw_table_dec),
+	.pmdomain_tbl = sm8250_pmdomain_table,
+	.pmdomain_tbl_size = ARRAY_SIZE(sm8250_pmdomain_table),
+	.opp_pd_tbl = sc7280_opp_pd_table,
+	.opp_pd_tbl_size = ARRAY_SIZE(sc7280_opp_pd_table),
+	.clk_tbl = sc7280_clk_table,
+	.clk_tbl_size = ARRAY_SIZE(sc7280_clk_table),
+	/* Upper bound of DMA address range */
+	.dma_mask = 0xe0000000 - 1,
+	.fwname = "qcom/vpu/vpu20_p1.mbn",
+	.pas_id = IRIS_PAS_ID,
+	.inst_caps = &platform_inst_cap_sm8250,
+	.inst_fw_caps_dec = inst_fw_cap_sm8250_dec,
+	.inst_fw_caps_dec_size = ARRAY_SIZE(inst_fw_cap_sm8250_dec),
+	.inst_fw_caps_enc = inst_fw_cap_sm8250_enc,
+	.inst_fw_caps_enc_size = ARRAY_SIZE(inst_fw_cap_sm8250_enc),
+	.tz_cp_config_data = &tz_cp_config_sm8250,
+	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
+	.num_vpp_pipe = 1,
+	.no_aon = true,
+	.max_session_count = 16,
+	.max_core_mbpf = NUM_MBS_8K,
+	.max_core_mbps = ((7680 * 4320) / 256) * 60,
+	.dec_input_config_params_default =
+		sm8250_vdec_input_config_param_default,
+	.dec_input_config_params_default_size =
+		ARRAY_SIZE(sm8250_vdec_input_config_param_default),
+	.enc_input_config_params = sm8250_venc_input_config_param,
+	.enc_input_config_params_size =
+		ARRAY_SIZE(sm8250_venc_input_config_param),
+
+	.dec_ip_int_buf_tbl = sm8250_dec_ip_int_buf_tbl,
+	.dec_ip_int_buf_tbl_size = ARRAY_SIZE(sm8250_dec_ip_int_buf_tbl),
+	.dec_op_int_buf_tbl = sm8250_dec_op_int_buf_tbl,
+	.dec_op_int_buf_tbl_size = ARRAY_SIZE(sm8250_dec_op_int_buf_tbl),
+
+	.enc_ip_int_buf_tbl = sm8250_enc_ip_int_buf_tbl,
+	.enc_ip_int_buf_tbl_size = ARRAY_SIZE(sm8250_enc_ip_int_buf_tbl),
+};
diff --git a/drivers/media/platform/qcom/iris/iris_platform_sc7280.h b/drivers/media/platform/qcom/iris/iris_platform_sc7280.h
new file mode 100644
index 0000000000000000000000000000000000000000..9e8ade674ff1a8c4e42b1a05a3de3097110e5f0d
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_platform_sc7280.h
@@ -0,0 +1,27 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+
+#ifndef __IRIS_PLATFORM_SC7280_H__
+#define __IRIS_PLATFORM_SC7280_H__
+
+static const struct bw_info sc7280_bw_table_dec[] = {
+	{ ((3840 * 2160) / 256) * 60, 1896000, },
+	{ ((3840 * 2160) / 256) * 30,  968000, },
+	{ ((1920 * 1080) / 256) * 60,  618000, },
+	{ ((1920 * 1080) / 256) * 30,  318000, },
+};
+
+static const char * const sc7280_opp_pd_table[] = { "cx" };
+
+static const struct platform_clk_data sc7280_clk_table[] = {
+	{IRIS_CTRL_CLK,    "core"         },
+	{IRIS_AXI_CLK,     "iface"        },
+	{IRIS_AHB_CLK,     "bus"          },
+	{IRIS_HW_CLK,      "vcodec_core"  },
+	{IRIS_HW_AHB_CLK,  "vcodec_bus"   },
+};
+
+#endif
diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index 00e99be16e087c4098f930151fd76cd381d721ce..9bc9b34c2576581635fa8d87eed1965657eb3eb3 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -357,6 +357,10 @@ static const struct of_device_id iris_dt_match[] = {
 		.data = &qcs8300_data,
 	},
 #if (!IS_ENABLED(CONFIG_VIDEO_QCOM_VENUS))
+	{
+		.compatible = "qcom,sc7280-venus",
+		.data = &sc7280_data,
+	},
 	{
 		.compatible = "qcom,sm8250-venus",
 		.data = &sm8250_data,
diff --git a/drivers/media/platform/qcom/iris/iris_resources.c b/drivers/media/platform/qcom/iris/iris_resources.c
index cf32f268b703c1c042a9bcf146e444fff4f4990d..164490c49c95ee048670981fdab014d20436ef85 100644
--- a/drivers/media/platform/qcom/iris/iris_resources.c
+++ b/drivers/media/platform/qcom/iris/iris_resources.c
@@ -112,7 +112,7 @@ int iris_prepare_enable_clock(struct iris_core *core, enum platform_clk_type clk
 
 	clock = iris_get_clk_by_type(core, clk_type);
 	if (!clock)
-		return -EINVAL;
+		return -ENOENT;
 
 	return clk_prepare_enable(clock);
 }
diff --git a/drivers/media/platform/qcom/iris/iris_vpu2.c b/drivers/media/platform/qcom/iris/iris_vpu2.c
index de7d142316d2dc9ab0c4ad9cc8161c87ac949b4c..9c103a2e4e4eafee101a8a9b168fdc8ca76e277d 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu2.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu2.c
@@ -3,9 +3,15 @@
  * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
+#include <linux/bits.h>
+#include <linux/iopoll.h>
+#include <linux/reset.h>
+
 #include "iris_instance.h"
 #include "iris_vpu_common.h"
 
+#include "iris_vpu_register_defines.h"
+
 static u64 iris_vpu2_calc_freq(struct iris_inst *inst, size_t data_size)
 {
 	struct platform_inst_caps *caps = inst->core->iris_platform_data->inst_caps;
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index bb98950e018fadf69ac4f41b3037f7fd6ac33c5b..1460e1683025e49cfa55d1afbe281e5db5a0d898 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -222,12 +222,14 @@ int iris_vpu_power_off_controller(struct iris_core *core)
 
 	writel(MSK_SIGNAL_FROM_TENSILICA | MSK_CORE_POWER_ON, core->reg_base + CPU_CS_X2RPMH);
 
-	writel(REQ_POWER_DOWN_PREP, core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
+	if (!core->iris_platform_data->no_aon) {
+		writel(REQ_POWER_DOWN_PREP, core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
 
-	ret = readl_poll_timeout(core->reg_base + AON_WRAPPER_MVP_NOC_LPI_STATUS,
-				 val, val & BIT(0), 200, 2000);
-	if (ret)
-		goto disable_power;
+		ret = readl_poll_timeout(core->reg_base + AON_WRAPPER_MVP_NOC_LPI_STATUS,
+					 val, val & BIT(0), 200, 2000);
+		if (ret)
+			goto disable_power;
+	}
 
 	writel(REQ_POWER_DOWN_PREP, core->reg_base + WRAPPER_IRIS_CPU_NOC_LPI_CONTROL);
 
@@ -250,6 +252,7 @@ int iris_vpu_power_off_controller(struct iris_core *core)
 	writel(0x0, core->reg_base + WRAPPER_TZ_CTL_AXI_CLOCK_CONFIG);
 
 disable_power:
+	iris_disable_unprepare_clock(core, IRIS_AHB_CLK);
 	iris_disable_unprepare_clock(core, IRIS_CTRL_CLK);
 	iris_disable_unprepare_clock(core, IRIS_AXI_CLK);
 	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
@@ -261,6 +264,7 @@ void iris_vpu_power_off_hw(struct iris_core *core)
 {
 	dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN], false);
 	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
+	iris_disable_unprepare_clock(core, IRIS_HW_AHB_CLK);
 	iris_disable_unprepare_clock(core, IRIS_HW_CLK);
 }
 
@@ -294,11 +298,17 @@ int iris_vpu_power_on_controller(struct iris_core *core)
 
 	ret = iris_prepare_enable_clock(core, IRIS_CTRL_CLK);
 	if (ret)
-		goto err_disable_clock;
+		goto err_disable_axi_clock;
+
+	ret = iris_prepare_enable_clock(core, IRIS_AHB_CLK);
+	if (ret && ret != -ENOENT)
+		goto err_disable_ctrl_clock;
 
 	return 0;
 
-err_disable_clock:
+err_disable_ctrl_clock:
+	iris_disable_unprepare_clock(core, IRIS_CTRL_CLK);
+err_disable_axi_clock:
 	iris_disable_unprepare_clock(core, IRIS_AXI_CLK);
 err_disable_power:
 	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
@@ -318,13 +328,19 @@ int iris_vpu_power_on_hw(struct iris_core *core)
 	if (ret)
 		goto err_disable_power;
 
+	ret = iris_prepare_enable_clock(core, IRIS_HW_AHB_CLK);
+	if (ret && ret != -ENOENT)
+		goto err_disable_hw_clock;
+
 	ret = dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN], true);
 	if (ret)
-		goto err_disable_clock;
+		goto err_disable_hw_axi_clock;
 
 	return 0;
 
-err_disable_clock:
+err_disable_hw_axi_clock:
+	iris_disable_unprepare_clock(core, IRIS_HW_AHB_CLK);
+err_disable_hw_clock:
 	iris_disable_unprepare_clock(core, IRIS_HW_CLK);
 err_disable_power:
 	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);

-- 
2.47.3


