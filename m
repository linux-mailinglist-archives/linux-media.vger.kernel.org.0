Return-Path: <linux-media+bounces-44234-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 908D8BD1315
	for <lists+linux-media@lfdr.de>; Mon, 13 Oct 2025 04:11:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A147C4EBF09
	for <lists+linux-media@lfdr.de>; Mon, 13 Oct 2025 02:11:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCED32F7475;
	Mon, 13 Oct 2025 02:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TXUfPjkm"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B734C2F60B6
	for <linux-media@vger.kernel.org>; Mon, 13 Oct 2025 02:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760321361; cv=none; b=ng5Ka55KjANfT5xrFYRVa5jm4VtthAwgirp7VzOmwwtJf1TWobwBJsWYwqaurG4SSZBsZiWcLN3weG9u6lJmYlUVGr493DF8kKuDI2AnCRD5LqM2DXiFZ+AynLuyQ5v/ETxJcnZfL1lIBiivpS3FEWG9rfRq4bCM0gPrcbTYbw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760321361; c=relaxed/simple;
	bh=6FRZ1CpC3MU/4n9iRxLNrUmwxEaMlpAnTQZio3HCtrQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AYOe2kds4GU2pdgA2rCUsfLbGuFxuYd7KMK1QUQsyoGp0NjSC2/wfo1bRb9lZNOkkFMx4fP+tiVh6CWm60DNqo5zfDbaog8SS/RocLCAuey34iufPNcjIZwytRLRJmu+eBk9nnrD7jdlhVP9Ol+h7i+tDTjFJiXzAqMaVNjLS6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TXUfPjkm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59D0bGmG009068
	for <linux-media@vger.kernel.org>; Mon, 13 Oct 2025 02:09:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nBL4RMDsP9fvHNxUhltDF9qa+M/Bza/qq9I2lxvJDRc=; b=TXUfPjkm6dLisSMK
	I4qqGf9K4FjnrWLmDVqSHz9fHVURTSw0vzRDb8vItmSziK4i9z7sKVUAwqg92FlJ
	IJ3y8m/siEWyyAO/jOyxsHp50rD7JDuTety+cDFwuumnqpXMcZHSi7zioIyxufU6
	406Xi1nBSsSmQK51jUyznDvbnMUj1hmpQIKUjfN2pl2ot3lO0lopxpO0yDkenhu7
	uxvWnQBSfkKIJT5MMs2K7qy1YuomAYyZ/LY1UxNOujDySvYAYaTZqGCQhwyGHZCQ
	1tUNs+vk/dOmH20Tx7Q6X4cwQnNdwdQDsrjvIuvF8ni6r2KkPhjXp39ju1+dLoXQ
	TfRNZg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfd8ty7g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 13 Oct 2025 02:09:18 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-818c83e607bso106719756d6.2
        for <linux-media@vger.kernel.org>; Sun, 12 Oct 2025 19:09:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760321355; x=1760926155;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nBL4RMDsP9fvHNxUhltDF9qa+M/Bza/qq9I2lxvJDRc=;
        b=gxEcGvcMgCLBX0QwGnREhgq3KWSBU9bHf2UgC/bvOkXliWrsOPMXCay5iezNFZ5c2j
         5fcBm8SnOzCPERqxef1p86SVAG8dJdmQCUC4yuEDfgGnxYYkOHIgVFcxJg9VOWpmpLzf
         nssORCAXSRM/PuOHnKqs9QmCzLwbH1+vg7tTbMgF+ykPUx6hhWkRNTRj9TPmqev8Gect
         mmJ3p1IoC97FyKvOyO1O3YIMFM7Hk+MCOX3eZ4s90z2PRrELypF5fxDOBQ9Mn0zeU0zD
         O+SYMMv04bY3Lb/5ieLum338CSUNVOomjM6wwBfAxGxMg3gf0c2BwCZLQrHM1CKpCwmq
         LvsQ==
X-Gm-Message-State: AOJu0YxD4jhsojIsLGKmFuOUp6cbB3MqTUOO9Ts+X8mthj1nigoNZbpl
	WTdh8gI8HmjyOPj49QZbs3cz5ezqaVbJu/vPNcxLkndTG9L9pLPj6NxcTSPWDBmeYqBZtKIj1NJ
	jJwOAPwFw+P9OZWVGJjQZ+zlKhQLgcLB8Fv1EI7Jpav720zkDsTAiUZAEG6Bvr1t6eA==
X-Gm-Gg: ASbGnctoYPhfu/hn0yxxkveg7xV9QPz6EBFObyuvB8tMRULVaqRl88Ty2s9PTm/syLW
	wDrZOf9YFBmV0rHgDn3FzgCLnPVxxCnE2jN/uoWxVc9dppGoyjPXkCM470UKu8ezvp3FJTQ+GPl
	igVAGpSXuGSq+EYOvX1DAWjr4UmMYO9uoeU2IB+UpAxXoiIlDOv5WS4adtz3PBe8DJoYgaMLv74
	lew374m9HHRj2V3DGihmNAp+aIILmOdIHiHHuhdh8UiEEn8TQhtkeCltMwbq3Vnxmf7V3K8JQ2+
	9y8nta/7wvzKXUqjIIgIwSiLlBqCNg6LV56+qIufVXdYPj1D99E+4SaQZQZ0J29t1oYt6DfV6b2
	MkQSZbh7iPO6yb/cwuL+jNDDJqgaoA3RH54row+O9FaYTUJDZrv/y
X-Received: by 2002:a05:622a:1982:b0:4dc:1e47:ebe8 with SMTP id d75a77b69052e-4e702e32607mr171331211cf.61.1760321355143;
        Sun, 12 Oct 2025 19:09:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEqtvda7Z3Iqyd6KoSZZtpknRNnLsY2ZEhR4nfog4F7Zc3no+ojUZC1laU2qNnZB62byz4tZA==
X-Received: by 2002:a05:622a:1982:b0:4dc:1e47:ebe8 with SMTP id d75a77b69052e-4e702e32607mr171330961cf.61.1760321354613;
        Sun, 12 Oct 2025 19:09:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881e4f99sm3563419e87.7.2025.10.12.19.09.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 19:09:13 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 13 Oct 2025 05:09:02 +0300
Subject: [PATCH v3 8/8] media: iris: enable support for SC7280 platform
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-iris-sc7280-v3-8-f3bceb77a250@oss.qualcomm.com>
References: <20251013-iris-sc7280-v3-0-f3bceb77a250@oss.qualcomm.com>
In-Reply-To: <20251013-iris-sc7280-v3-0-f3bceb77a250@oss.qualcomm.com>
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
 bh=6FRZ1CpC3MU/4n9iRxLNrUmwxEaMlpAnTQZio3HCtrQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBo7F86nxhtV+jjO6P5EDwG5509ovKDwPSze4oD/
 JXapNb15E6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaOxfOgAKCRCLPIo+Aiko
 1VfGCACM/e3+OmeAtEEDdB19BpYFg01/Vt5gGkk1oHjd6N08T8shbRUxhnA29jMNF3dd8VRFOWa
 saq7aM+1o9ddz80lIJU/8Hva23AXB3+Blzuqf2rGsoC7ajYshvJL74OkNMv5NPPVHmeCjQjhPzz
 SKCjHavG+nvTDKQUjGb+MM/EkOFnsbqxHi4DdHXfmLCd+IWx65aOopgNf+v0R3pGFz0CP2k0oby
 ZncF0tzf1dduA7dIW3rqSRhfFTW4G72BbDXwmKd6r2BBWd6CdAzv5OSzg0h3Iq+dRmmg6Wkiiur
 4EbmzLGNxKf+JDIzX3hME6p9G4KmzoCqKNS19hXv71RvJSLw
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: XuGIKBUVtvhqp7ToP_OBDBniC3hPPRxm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX8itDzU7LX65U
 Tf4LpL60MzY4YjsxYjpWwMQiKRLOsEpyUfIx+ruJ279VZvV9GdJH3GfCD2sLJ6eUU3V+LzsW3ep
 GMQRthvwwx/YRJ8VInFmYVwxfmbCYC6RvxJ5bs+B4smvpA/NcVAFbQ0tunPeZFMaSkdsMtLhSca
 8mYWTKeRtGOBw0/g/DGCAqKcWViGhnaVtxWzj90JyVHepdmsmvaPfEbrraPQEJjTE6XlRgVahrx
 cMBdZAHbXG5smMf3wNzpdA+EKC88yzAYxasNBfk84NCldY3jAikUWLF3YL9SSkhivQa9iBrAawD
 nhcYmAqNMGceChWFwrjBqUi4+j2ldG99a/YZWvkJQgUp7c8Dlk62CRE+2K+cL/tpxpevs9VJgro
 T/AveYKjF7YqvRRnc26Afi+KzkzgUw==
X-Proofpoint-GUID: XuGIKBUVtvhqp7ToP_OBDBniC3hPPRxm
X-Authority-Analysis: v=2.4 cv=PdTyRyhd c=1 sm=1 tr=0 ts=68ec5f4e cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=pG0Ruh8lDxDpiiRDS04A:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_01,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018

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
index 104ff38219e30e6d52476d44b54338c55ef2ca7b..43cd6bf94ab600e53f983c9e11b63dc0a572e6ad 100644
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
+	IRIS_HW_AXI_CLK,
 	IRIS_AXI1_CLK,
 	IRIS_CTRL_FREERUN_CLK,
 	IRIS_HW_FREERUN_CLK,
@@ -230,6 +233,7 @@ struct iris_platform_data {
 	u32 hw_response_timeout;
 	struct ubwc_config_data *ubwc_config;
 	u32 num_vpp_pipe;
+	bool no_aon;
 	u32 max_session_count;
 	/* max number of macroblocks per frame supported */
 	u32 max_core_mbpf;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen1.c b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
index 2b3b8bd00a6096acaae928318d9231847ec89855..828864902501aef072d60935fe57019a70dcb9f4 100644
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
@@ -364,3 +366,53 @@ const struct iris_platform_data sm8250_data = {
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
+	.num_vpp_pipe = 4,
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
index 0000000000000000000000000000000000000000..f2dea77f2805f48ab00822fe9d70ffafadc47494
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
+	{IRIS_AXI_CLK,     "bus"          },
+	{IRIS_AHB_CLK,     "iface"        },
+	{IRIS_HW_CLK,      "vcodec_core"  },
+	{IRIS_HW_AXI_CLK,  "vcodec_bus"   },
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
index 2d6548e47d47967c1c110489cb8088130fb625fd..f8fd120873ccdcb5239985d0d6a8bbda144a98f6 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -179,12 +179,14 @@ int iris_vpu_power_off_controller(struct iris_core *core)
 
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
 
@@ -207,6 +209,7 @@ int iris_vpu_power_off_controller(struct iris_core *core)
 	writel(0x0, core->reg_base + WRAPPER_TZ_CTL_AXI_CLOCK_CONFIG);
 
 disable_power:
+	iris_disable_unprepare_clock(core, IRIS_AHB_CLK);
 	iris_disable_unprepare_clock(core, IRIS_CTRL_CLK);
 	iris_disable_unprepare_clock(core, IRIS_AXI_CLK);
 	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
@@ -218,6 +221,7 @@ void iris_vpu_power_off_hw(struct iris_core *core)
 {
 	dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN], false);
 	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
+	iris_disable_unprepare_clock(core, IRIS_HW_AXI_CLK);
 	iris_disable_unprepare_clock(core, IRIS_HW_CLK);
 }
 
@@ -251,11 +255,17 @@ int iris_vpu_power_on_controller(struct iris_core *core)
 
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
@@ -275,13 +285,19 @@ int iris_vpu_power_on_hw(struct iris_core *core)
 	if (ret)
 		goto err_disable_power;
 
+	ret = iris_prepare_enable_clock(core, IRIS_HW_AXI_CLK);
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
+	iris_disable_unprepare_clock(core, IRIS_HW_AXI_CLK);
+err_disable_hw_clock:
 	iris_disable_unprepare_clock(core, IRIS_HW_CLK);
 err_disable_power:
 	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);

-- 
2.47.3


