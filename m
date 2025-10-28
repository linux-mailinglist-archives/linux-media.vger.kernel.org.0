Return-Path: <linux-media+bounces-45815-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CF9F7C14744
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 12:49:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6BE161AA779B
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 11:48:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 313E03101A5;
	Tue, 28 Oct 2025 11:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Hay0GXNj"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EC9430F954
	for <linux-media@vger.kernel.org>; Tue, 28 Oct 2025 11:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761652001; cv=none; b=TKug+Z2rw68FHzE91cDxDvUnuZ7pnkxO7TNK2EQaZNOvflWOs69ALsmyRgo5ObRCvQbkya82uLkzzmSpfrVcWhZmBI54hSOcb/l0YiZLSetferDwr7VseAUm6/pmNFwz3oBiqK37A60vqPaFq7ABjt2yByXYRzQStcvHmXPTx+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761652001; c=relaxed/simple;
	bh=oVonhQfen+ZHbigdx1wWZFOzwVWeovxs4DcfGKmAAdg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LTATgVIpwJ/Ivl13n8/FQFaQmz2QLo3J7jQPkgaezBkpA3UwDKMFTKTioDhDzQx8Dio8IVECcG56YuySmOILJyRe33j8pSS/mBtkMQckSBHhLSXT2HaaiXecvAsbkzMP2ig2Z7xHS06Tf78BLVGmIxJe3q0QlCDKw8I3vja1azQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Hay0GXNj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59SAeLjr3165428
	for <linux-media@vger.kernel.org>; Tue, 28 Oct 2025 11:46:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CgVCF+riTG6+Sd6I5NwRYnSjG5gyQQSqj7xo8ckyqe8=; b=Hay0GXNjjc6k1RMk
	EFJl/0HC0h6dT7ChswZ9zVedodjsqycfYICtdgGxAW1udG9brqiB5ancRwkREYua
	JzpcZgSg7CJOcDqQbWpC+nbpheT9OeUJO6WDF5TdaAlpjxbBjuFH5z1gVnYXYDeE
	CNU2f9+/PnUHrRYS6ThHjmOrEQd9WbLRpvfd5ezE7MS3bhla2ICiR0kn8bKUuHmA
	wFautJiuMQWGL4WQivopdFkb1Hi3O82gPurJep+7i9g+H+ZPC2z1G+ci/toM4KsG
	ZvuBnAlCqzPOqRmuIZo8E09EQIdIjgLyf0/sWeiyflV3rFRkFFA94mVSkeZyV+R/
	to81oA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a2bwx33h1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 28 Oct 2025 11:46:36 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4eb9e480c15so63422731cf.1
        for <linux-media@vger.kernel.org>; Tue, 28 Oct 2025 04:46:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761651996; x=1762256796;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CgVCF+riTG6+Sd6I5NwRYnSjG5gyQQSqj7xo8ckyqe8=;
        b=IYygcQDG0M8ic9ARff2r8pT7WW2VOP5vB58W//s5uBobdZfylYw7I6lNa9vejeCjLY
         cp657NNKDdMJ9F6Kfi4MuTadz1BgvEApeLfWLLTKni8ZgLaPT49ffm+twbiTTd4CJGUu
         GUBVm6Ycdsez19tyE/SjJqPaiV8hDX3uQkkrmKfiSYPb+vEf8gUD0MFcYvx1iaGvTUAB
         UI30qRilUkXHjn4dRs2+vjwDNpiZdgVgT/a/79XCvuV4ZxfKc28ENua5M4b81hFDX8En
         +mZGUku5H2deEZpJduhW6cedSvu++IPHPLzM6yfP9mu1/MeqrxSTmfsI7i6XuZJXgtBO
         HDXw==
X-Gm-Message-State: AOJu0Yz4q6k+pUsYEYUrRbgUwzgv4JPPliH42M45EwObUn8AI49qvQP3
	5027LVR2+QhvUdfLaXo79CVGFkcqFhnOt8mnaQZYUYl9Xo574c8vfTtsfA5yZR8j0hYs4mGB/c3
	Hs64lPlkqGyFyT/JUZic3x2HpipqeP0rDw+HduRds0PDiKnilBS5qoSKc6kugZHihaw==
X-Gm-Gg: ASbGncs+GxW1YttjMfxSB7jo7ZzJk3ZOh/Hxk296xchR2sXMQb6twITj4tZzTKNE4eL
	uL1zTX0cLtgGQlsipzaOuZJVH38F+g8mrQjmmZGuis7Jlb9LSwZeLda+1F8xBpV6w16W3c+hVcF
	xpdkIqJlBo46fCpJ9+UqT0DM5RwPaL7wvUTOj/K8/XtVzlkMVMkpN3CK6NmIdm2iYUxOU7+Sw4x
	Mjv+d0Ok5OldK+ZLAfc/5ysOxpB3UYq0J+aNY/SbavbGH9KlLAGONvf1VjypnZ4K7dz6QLVU/qv
	CQobkEydxxMw3/tdiTx9/MlfhHXxyLRTlUfEsgwunqEVyUV4o8Jb4OPrUiJ+DKPULe+PnKL+I3X
	mR6tdDMPWuPnzGyXn9/Ae+u8IJLMGDWsPX+YVmy8mngEz3CuUN6HBD985DIkCmXV78NzbSXLTRG
	YtiBB9mejMW1bV
X-Received: by 2002:a05:622a:1808:b0:4b1:103b:bb6b with SMTP id d75a77b69052e-4ed075a6412mr34074731cf.61.1761651995912;
        Tue, 28 Oct 2025 04:46:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IET4TIaKjBuRV4/9akT/0SNeWACApeoMTlo7lF3+HloQDTvxInMkDpNgAtAV/AibJDdshoHNA==
X-Received: by 2002:a05:622a:1808:b0:4b1:103b:bb6b with SMTP id d75a77b69052e-4ed075a6412mr34074501cf.61.1761651995317;
        Tue, 28 Oct 2025 04:46:35 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59301f41ce8sm3096564e87.6.2025.10.28.04.46.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 04:46:34 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 28 Oct 2025 13:46:25 +0200
Subject: [PATCH v6 6/6] media: iris: enable support for SC7280 platform
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251028-iris-sc7280-v6-6-48b1ea9169f6@oss.qualcomm.com>
References: <20251028-iris-sc7280-v6-0-48b1ea9169f6@oss.qualcomm.com>
In-Reply-To: <20251028-iris-sc7280-v6-0-48b1ea9169f6@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=11583;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=oVonhQfen+ZHbigdx1wWZFOzwVWeovxs4DcfGKmAAdg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpAK0RIDKlIBu9YtnC0d2QO0Fm1UOU4S4txxTTT
 KSd923gLxeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaQCtEQAKCRCLPIo+Aiko
 1QC6CACQwH2Z3Ecuuc+XwuafycFEcpF3wabQE9XzCHB4gR4TiAmWehL3bK+mpiM+Dpc7cHY8wyO
 BYcFkS2KYomzGsPonZgt15ZKX//VklgnMD+/BGLU4HTeOEieJAjX28OyqjCP2d+Cqf2ebMFRMVF
 H+57PchZczSzAvwmm7rn0hO2C5lRlIgpSIMkPYR0JjaPaSoGMDwzZGTBk5OpklAfltZhnpVKaP2
 QT+Dbgdcny45LUzTm1ESoO+Ew3puCwtjWLaFXlxTzV0WTQn8VeMJurXlSvjHt5b8E65iK5M2e7d
 WTbfIg65Ndfdlc0Gn4PBeQ91Qbsz7KI/PAB6zvLpY/6JKR9O
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDA5OSBTYWx0ZWRfX/Fnon1C93Sa3
 wFUp9t0rMLKztRyiIyZMih+QOruhJBRhUVG633qKVPE1+/F9U5kCtz8vd5nob+f41nr1KgQ5M0h
 x+IRi0o2AxxF0140yq8AEXVJMeL06c5RHujMbwQY+Pe7WscohUlmFsv+mGh92y/mW71LbORLqak
 qNL2QXp6DZWp5Z7aRvgJ266JQN6yuUeyTXmnSsFr0w1wDvrkKk8V3pWSQaIxU8RUADRTXvTyRXN
 xQ/I9zyawND0091JCKg+VwQpEhKM8L4ZCV504nJo3Sp0RLra7qjAlq68eiZwDYk6RWCsj1gr6lw
 FzxKOxTC9+lVynlevl7vaDZ4BtnExnIxkSIck7iXpYJDCZgyaJc5zlaSw45PPMZwsmjqKzgOqSK
 mT9zvEBzJ8nXHI4G7VEui0YQNIq8pw==
X-Proofpoint-ORIG-GUID: YG4ylOIgoBff9MAGAn0p5sMMLXn58wSu
X-Authority-Analysis: v=2.4 cv=U9WfzOru c=1 sm=1 tr=0 ts=6900ad1c cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=pG0Ruh8lDxDpiiRDS04A:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: YG4ylOIgoBff9MAGAn0p5sMMLXn58wSu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_04,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510280099

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
 .../platform/qcom/iris/iris_platform_sc7280.h      | 26 +++++++++++
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
index 805179fba0c41bd7c9e3e5de365912de2b56c182..34cbeb8f52e248b6aec3e0ee911e14d50df07cce 100644
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
+	.max_core_mbpf = 4096 * 2176 / 256 * 2 + 1920 * 1088 / 256,
+	/* max spec for SC7280 is 4096x2176@60fps */
+	.max_core_mbps = 4096 * 2176 / 256 * 60,
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
index 0000000000000000000000000000000000000000..f1bef4d4bcfe8e58e2f18cff23c3c067f25d8bc3
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_platform_sc7280.h
@@ -0,0 +1,26 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
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
index bb98950e018fadf69ac4f41b3037f7fd6ac33c5b..515dd55a3377e5d4d131e360f361a44a0a92505b 100644
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
+		goto err_disable_hw_ahb_clock;
 
 	return 0;
 
-err_disable_clock:
+err_disable_hw_ahb_clock:
+	iris_disable_unprepare_clock(core, IRIS_HW_AHB_CLK);
+err_disable_hw_clock:
 	iris_disable_unprepare_clock(core, IRIS_HW_CLK);
 err_disable_power:
 	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);

-- 
2.47.3


