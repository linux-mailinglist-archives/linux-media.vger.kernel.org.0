Return-Path: <linux-media+bounces-45655-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 58567C0D834
	for <lists+linux-media@lfdr.de>; Mon, 27 Oct 2025 13:28:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id D00E334D2B2
	for <lists+linux-media@lfdr.de>; Mon, 27 Oct 2025 12:28:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A854630FC24;
	Mon, 27 Oct 2025 12:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U0trSPXy"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5222930FC0C
	for <linux-media@vger.kernel.org>; Mon, 27 Oct 2025 12:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761568042; cv=none; b=J0ZLoj9NRXlBHse7/ZyK9MrmWU1f0M/Sqcl1dzrpLRpNMyOBydsYyV8v7Du2U1uSDk+Kl5iOW2fmAMAasMLMKnhUWha9FdNkOVZK0Ytw97aphvGBrl9hm1vxgk6Ccr+Qvv72KwP4Ob4KA8HjjY3Bmm4Zi9Nw+eYwqDev1VfjRro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761568042; c=relaxed/simple;
	bh=t1CBvWMfN655XxZugDbjqKvfK7Hnxfownu0/2DhhsmY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OOkhlcJyIZyDDfypNDQ8V5BNA7RrqDxMgbwe0kNhXC/nfploafkz0wEqD6MalOVHMrZcLMz1KNJhhRRyAb7Y8kdooKIQ0g+i2E1cN3mX6gl0OA8FQGvhYLAXj95Myk13HlNxPkbB8UrpWrCL3H1b9DrbhzsCOLhozIjLh8qgVJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U0trSPXy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59R84fxf2232100
	for <linux-media@vger.kernel.org>; Mon, 27 Oct 2025 12:27:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2MpDl0eFfP/ikR3TYaMdviZ1gWtY2d9Vvp9INB/JJ+c=; b=U0trSPXyNIT0oea6
	RxK+46+sUE1EoR3OmhicughVPRFQ2o80bVtwS56vsv0/o6miDy/DS8v1S6IGeCa/
	OY3z9jzmaOgn550iqCOazknstDXPqJSUPEkBRuextQwhZlOYgR/I0sjOFvwTXIIP
	JK9XrlVA2odf/FqS2xls3s90hcIEYx5koACkTn88kKa7lyjQklX7dCLs1sC77vBh
	owzMUuggnwnxaQELCiXMaHYAgGSSngUT4+1VPqNhCPFDiXdWAWyQ7eNrpW1cGjEL
	ufdz/WuoOciPN5EwCrqYfx6K4QWt7i2eu1cuhjkE2vda2O7/VEs2W0A9yiYxy7EH
	khPGAg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a24wn8qs1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 27 Oct 2025 12:27:18 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4e899262975so145433151cf.2
        for <linux-media@vger.kernel.org>; Mon, 27 Oct 2025 05:27:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761568036; x=1762172836;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2MpDl0eFfP/ikR3TYaMdviZ1gWtY2d9Vvp9INB/JJ+c=;
        b=uziMMZFZPzCu3UX89QUmXwguUNR1TUJHaoZNVT0rdfQ0EuP8O3UfmYI5t2HHyG6MlG
         +OozZAz/vRsnQUdfTXcsSB2Ppk2VD7XraCksBgh/9HxP6El1yaOWC/pIzeR5cmQnwncF
         KPEmJ3UcZctEvEWfp3Y3UHD6rZpBCVFjfhBd3n+snCDirFOZ3KuOPwYbrf+P5x8rE0eo
         srAFo4+35i3QmpAKPjBqug95mCOstsK0ntZbL+8n1Tnt1DuCRkZl5d1F9YyYjxaK6XOf
         ndWLPWeGQGfs9kZ6kEO5zfbSVdesoCYScYCQt2eK3mbLjLpo7KK/Pr2jiaEco0eZc29j
         Jv+Q==
X-Gm-Message-State: AOJu0Yz9Q374qMeMMfCNnqSeZXJBATWFv6crHo/HsyC/iDyZngIWUdis
	mQUAC+jGE4SlOLgNldmFWMUe+168JD6bZw9c5OXL7HbyBH1kdOTSnDXgcLffSKAQaVPsS/2YfRv
	+KgBOhTdEAErbRd0qkjWa32/zgM5Ic/l+fDcvdubWwlHnd7zBwMvHu1byHjkPiWqcDA==
X-Gm-Gg: ASbGncuurBgRdXB9f4s+f0VnCI7MlmSVRPt8Pey2WP6CI6KI23IpqKD3V5p8sI9adTx
	IvSg6YRvGTBRTiWiJ4zIZgVojxnTb2uvhxkJGL++HO0RPOxEuGMx9mkSgY6W4Q4WXRMBIgfW6Mw
	Xshg9uSqJCTH5rBvJJSDfM6ObUMPX5JsORs0omxbrfikFtkjBbRNDio2OKLcsJoEpPp9vZM9ZWg
	NN9GK7gHPfgU6ilZVRAoe84FwKdJhnwIsRmqd7ijNtBmdpy88mwEa3vVbSP2prrBKettI6zrIdz
	NSJEtvElonK0pNgL56bBu56TRVY5O6bwqvAtls8jMKhSAdGZg06KUVxcbUI1xWYKxFxec9OVna6
	axKL9vT4W7X7N9bvgJH46gVJYpgAIRoMVnf6EFX4fQGQO6YxdvM6HpQJuEhz4EPaMjACdbJcWas
	71lvcPyfl4Cw2L
X-Received: by 2002:a05:622a:1a97:b0:4ec:cffb:9369 with SMTP id d75a77b69052e-4eccffb9a66mr61850621cf.82.1761568035247;
        Mon, 27 Oct 2025 05:27:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGM9qBoEHthGg53mpIEs6JgnkCRakdY1UFvr/V0amj1qqcQCJP0ugEaO0a+P4IvS1oIUmigNw==
X-Received: by 2002:a05:622a:1a97:b0:4ec:cffb:9369 with SMTP id d75a77b69052e-4eccffb9a66mr61850311cf.82.1761568034701;
        Mon, 27 Oct 2025 05:27:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59301f83cb5sm2253474e87.102.2025.10.27.05.27.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 05:27:12 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 27 Oct 2025 14:27:04 +0200
Subject: [PATCH v5 6/6] media: iris: enable support for SC7280 platform
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251027-iris-sc7280-v5-6-5eeab5670e4b@oss.qualcomm.com>
References: <20251027-iris-sc7280-v5-0-5eeab5670e4b@oss.qualcomm.com>
In-Reply-To: <20251027-iris-sc7280-v5-0-5eeab5670e4b@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=11575;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=t1CBvWMfN655XxZugDbjqKvfK7Hnxfownu0/2DhhsmY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBo/2UVHzdHaKwryTr5Ve+s9z8lc8kfVUOe//Iee
 GOD7RDTOqKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaP9lFQAKCRCLPIo+Aiko
 1cryB/4mxqclcENIP+UIykLBTJcKwI51oiN5z8igSjTvnTZGX3ChDqikhshF1VWSFzw6QMuCzfe
 AU6ZjdPiaUnmL5Grx96TAtn+gnDPH0br76315S/aq+vvtm4ReLTbBXL2NXfG76e7tAtqIsQn0Rr
 UERSekH5v8MeFdpEiXgPwtvkaSf+LFgiWOg4IlSUlsL/y0NQ8C4O8D9L+5MziZhzZKoO8bCb7rI
 73THSxHf1DS/n7jmV+WFe/HmsyHUl10lqRd621ffgFjffdDoEf8mXLAc8zuNE0+gPf4Sk3hHMon
 ck0N3HCmHPUB0w/du/oL4Tsci9S7Veyb8ray4fCH0VnpHQdv
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=XIY9iAhE c=1 sm=1 tr=0 ts=68ff6527 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=pG0Ruh8lDxDpiiRDS04A:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: sbmLnTPLRIcRuJVoPd1hvpdZ2wOtTc8O
X-Proofpoint-ORIG-GUID: sbmLnTPLRIcRuJVoPd1hvpdZ2wOtTc8O
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI3MDExNiBTYWx0ZWRfXyd6lfhIWsE2J
 KKiOD5E9SHvU3YpcoeQx2G6/6MGJrhT0Lnmq0Eangep0wWHAQNi54NT+oYI0g9lMUlWhdgrHWJs
 blRwLAsnMY9ZCFKWSp1KZgE9+r3YmEdVrItxyh7oDiykD1b3TLWu/0nKRaBgRMz3T2lF/vkgBLF
 N6D1G8VGCXN9RHlkGb5GFRa9/PvkORzFmFb1EicZmWDE/e7N8+OeKD1w4Jars0NAt84FKptSPA8
 UXy2YBPnx0hcheO9tCZ0tYwUTI72DCLEIMZtdlUZK//obqLD4g7+LNHo6BBGq0au6naFxZmp9kB
 WD7oj5jVN/eGw9cga878kopOfb+FvtYwo4AbR6FVX7hE0rc2Kxs0UbCZeeeSUFq8hICITD2W3VD
 TyCLD9Pf20ZToGHeaNTVCUpVvgcyJQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-27_05,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 clxscore=1015 impostorscore=0 adultscore=0 spamscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510020000
 definitions=main-2510270116

As a part of migrating code from the old Venus driver to the new Iris
one, add support for the SC7280 platform. It is very similar to SM8250,
but it (currently) uses no reset controls (there is an optional
GCC-generated reset, it will be added later) and no AON registers
region. Extend the VPU ops to support optional clocks and skip the AON
shutdown for this platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../platform/qcom/iris/iris_platform_common.h      |  4 ++
 .../media/platform/qcom/iris/iris_platform_gen1.c  | 53 ++++++++++++++++++++++
 .../platform/qcom/iris/iris_platform_sc7280.h      | 27 +++++++++++
 drivers/media/platform/qcom/iris/iris_probe.c      |  4 ++
 drivers/media/platform/qcom/iris/iris_resources.c  |  2 +-
 drivers/media/platform/qcom/iris/iris_vpu2.c       |  6 +++
 drivers/media/platform/qcom/iris/iris_vpu_common.c | 34 ++++++++++----
 7 files changed, 120 insertions(+), 10 deletions(-)

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
index 805179fba0c41bd7c9e3e5de365912de2b56c182..abe43557b16b3d41ea1360e7fee3e10fd13870e3 100644
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
@@ -362,3 +364,54 @@ const struct iris_platform_data sm8250_data = {
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
+	/* max spec for SC7280 is 4096x2176@60fps */
+	.max_core_mbps = (4096 * 2176 * 2 + 1920 * 1088) / 256 * 60,
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


