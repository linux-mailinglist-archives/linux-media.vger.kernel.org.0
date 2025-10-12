Return-Path: <linux-media+bounces-44213-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D20BD07B8
	for <lists+linux-media@lfdr.de>; Sun, 12 Oct 2025 18:28:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 470E04F3E75
	for <lists+linux-media@lfdr.de>; Sun, 12 Oct 2025 16:24:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B73302F363E;
	Sun, 12 Oct 2025 16:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GwXl+PEc"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 618652F0C49
	for <linux-media@vger.kernel.org>; Sun, 12 Oct 2025 16:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760286248; cv=none; b=OjJKbp6bSpOQM1jOnw74xYIwgUjBRbjzfaA68HkeGNF4MSWAbPgl0GKETSZER2Xj/MfFecKMfhCY2ef64cFcbgbFMo4hfx2rEBFcLOSKnpmZtgdREl/BMTDOW5DBqF17OmUabLL6LzrtynxunkxiRYLQM7azmcosZuMkWRznfeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760286248; c=relaxed/simple;
	bh=2L4dIKk6ZY/FJ9FIa3pJYnA0sfqUGLbJJFlrdXMdCOU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GhMi883zOAxYjvnmX7vPQXTC6UOlYBv0FRebaEmDNrE03fX1tgIW643aCRmR9HCSSbEVAyEjc5s6huIyLzg0FlBdJ+/RkMzkNZCWxvWV/UPUBCf3AMvfwGqyrMOJbsotYPnqQJPIjlLM/ILOcMidVh+OVqLJ84Nti7X8F3GQ43I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GwXl+PEc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59CCYaYV028328
	for <linux-media@vger.kernel.org>; Sun, 12 Oct 2025 16:23:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tWabY8gftkzC9JrOZ4Ek/4oJxm6WnV5RvqX/3ANhZGs=; b=GwXl+PEcEJAhO/22
	6IN7Qz/2hKct4OuaVhg7qdrfuUHsyOjxtJVpp5J/QzRUorBm++8TbyhWMbio1wS0
	auXhSpOJ3Y5EIGGGFu0hmyhs6ySX2Vk07jYmHgRxQwtH4Vf50sv7BQ7ZEnRmtM9q
	hpSAmFn+NlqbBwnBxRsxZCzNX11YvTSNmOzXiky64q/ppzZR29zR0xFl8GgGXnFZ
	K09guX3vKc5ivPeqzQhbHHTWJhWYZ3Z9jrV/7RCwnsSJiRZyh9LK0/Ddv1zP9jPt
	I28uqf+XSkUHP0mKGVLT60Z0diG/b82mAkGllcN5qRW5bwvJkopq6aVo5H5vWsSy
	z1Xj8g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qg0bt73y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sun, 12 Oct 2025 16:23:52 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-829080582b4so2046849385a.0
        for <linux-media@vger.kernel.org>; Sun, 12 Oct 2025 09:23:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760286230; x=1760891030;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tWabY8gftkzC9JrOZ4Ek/4oJxm6WnV5RvqX/3ANhZGs=;
        b=IaH+KGKI3ouKsJ+lQ2/KfIW0V/csfoRrzxBjjbkCJjkz3Euu7ZGvMqWpFZzli6FJQY
         LkTaRWFWwAzo2S8rTfZNToPOse5BrYVu9T6xlQPaLuFAdmtA2iyQNyqmbPwzLteKrVWB
         i9/V2UAnZm8ThDWq1JbL3vGl43Yt/eGj8WO50UiiDye7twNJ/wK4uqMaH1c/2YdDcavL
         FsssLHQKcgyDn4M7KW2G4b/jWoPkBWlmOKFSDHMP+rGkLmBr8DIfb9boahMHRc5aPzt7
         EbdnaOvNPY/MnAtYD5ETJ/CXSz71T57zwjYjPhV38WGRRo+BMIs+uc5QIDkZLPZwzaIf
         XfLg==
X-Gm-Message-State: AOJu0YzuGPCiYSVVHyDpXSChfaJbX5x3jyDQhcTbL+ubV2K/PCrKMOtI
	hUei/2kNdzrU/36wsvHXkk3jQuGK9AQjFcHA1sfo70pPHzjfDAOXhC+mVZPGuRNAvtgU5a9BG4z
	G4l7aoeaeXrDEslPawZ1zn+8NGgnFNL5FRL6d/bqGOIDiQe+Kc4iWMjy2ut26I7U8dg==
X-Gm-Gg: ASbGncs3m2E9Tj7WuZ1rbeN8lBclha79xOrwO8rfJuSlWbQLeJpTpgVAW0Upy7mwj/Q
	rXSSOhmYPiRXcVK7MXk/lImHUFsj9iAvPHGOxaSwqMasrj8FA7Mk9M9mYIINvAF84TbM3cm+iiY
	xhnsFCpFtF9YnKSKKuOCnABtomwl4tlRCLBG7lMrpAiOa2pl7WMOm7d7QtbHe/eCv5y3J93aHN/
	t921YaGKauYNzPas+3awc/+5+Z5eWfbe55qmoHnac+GxCcchSi4REHR6J6difYDoCUWYFB37/4k
	o5l/upXQ1cyDKYVRMbFvjaQGJcYpKAqhdoP77YK2dukNtkR0ql8UHdGAOG/LRhnVRWc8myys2TV
	KaYJ0hfMzaErqmh3b7Ix7uxzvnQ2bJ0wUw+HhddELUnpBHfgM4fVJ
X-Received: by 2002:a05:620a:f0e:b0:850:222a:817d with SMTP id af79cd13be357-88350f578camr2390384685a.37.1760286229406;
        Sun, 12 Oct 2025 09:23:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFgdeRrEX0yLdgYYQ8HSehyJ8d5qNPjcgLygT+LVvxqCHcYKm3OAktK/rV05nQTDX1XGIfGnQ==
X-Received: by 2002:a05:620a:f0e:b0:850:222a:817d with SMTP id af79cd13be357-88350f578camr2390380885a.37.1760286228799;
        Sun, 12 Oct 2025 09:23:48 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881fe5besm3112637e87.50.2025.10.12.09.23.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 09:23:48 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 12 Oct 2025 19:23:35 +0300
Subject: [PATCH v2 8/8] media: iris: enable support for SC7280 platform
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251012-iris-sc7280-v2-8-d53a1a4056c3@oss.qualcomm.com>
References: <20251012-iris-sc7280-v2-0-d53a1a4056c3@oss.qualcomm.com>
In-Reply-To: <20251012-iris-sc7280-v2-0-d53a1a4056c3@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=10303;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=2L4dIKk6ZY/FJ9FIa3pJYnA0sfqUGLbJJFlrdXMdCOU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBo69YE1I7MKbUtgytMB1QBmrtLRktoKRifhEjEB
 hT6H7bWLs+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaOvWBAAKCRCLPIo+Aiko
 1cQYB/4iJ2DhE/kLf6VGQH3aW6IkH2RKhsXPvmDjbY5NFy/80lvgn/RC5hqiQVxYLI671mqxe8a
 fmJVubPZOEtJJEWgHgpB10EdGplr7Gtl5Jzh/Vj4VAsHqFwu/A6R6/3pmH5l/XYPOH2DyZ+B3kE
 Hs+DnUNL6I3d+8QJ3Yt5JQ0mLnjlijhBV45mpBu65aC/16UyVosaBE/Mq5qlhFElG5Bbk+8Rl6D
 /GzmgIzKTlHchVtSBmaq9URtvFVcnpbNTxg6T3D22pFsS26YrZkE86QfWeAmHX/XrLnstQybRQ/
 4tcNqz6xeOTtdt7iWFsAF5uM3KspbtEaQg4VNzmpmaAQcbRu
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: yEpjRBkM8Bx0SWtkHWO3sN8SwNG_afoP
X-Proofpoint-ORIG-GUID: yEpjRBkM8Bx0SWtkHWO3sN8SwNG_afoP
X-Authority-Analysis: v=2.4 cv=eaIwvrEH c=1 sm=1 tr=0 ts=68ebd618 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=5iJXzg3vIJBiWc8SjKUA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyMiBTYWx0ZWRfX8iRxfBPNMPVG
 Yzla9qz7PcETtzmdeF+mo3fkChSTp0NaFGw33k80/bFd2ygJ4b5XCrZzb/W1BOsMa3Z+pxK1Ckj
 j73PofWxDBB3MimyUtPVqZPTaVmD98LUPsReAFg+LFcbSdlyiK1QmxxF30i8V/ueVudWAzgG5D6
 jn9qYu0R2wJeUZx0hnn9hjLA9tnebLwWfp/mk5gIaSQFHT328r94O/NtQn9i2cdtXKokAIWWazC
 ipzkmpFZ32/f0IkmDPIz52i9G1FG/eDw4AntoVHCsDnqNCzcLdGQts4JhTYmDB5jYfB7kss3otE
 22Ciurgydjgqumf+noIcFFCeQxDtq9trqquoH+OpCrErnlTwINkMAKklWiecKdCEDC4Sygtr1gn
 XuNIy6A1ZXdBzLjSny+Xmx84w8MZ4w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-12_06,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110022

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
 drivers/media/platform/qcom/iris/iris_probe.c      |  4 ++
 drivers/media/platform/qcom/iris/iris_resources.c  |  2 +-
 drivers/media/platform/qcom/iris/iris_vpu2.c       |  6 +++
 drivers/media/platform/qcom/iris/iris_vpu_common.c | 34 ++++++++++----
 6 files changed, 92 insertions(+), 10 deletions(-)

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


