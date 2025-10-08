Return-Path: <linux-media+bounces-43900-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC61BC3520
	for <lists+linux-media@lfdr.de>; Wed, 08 Oct 2025 06:35:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7130F19E104F
	for <lists+linux-media@lfdr.de>; Wed,  8 Oct 2025 04:35:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E0F02C21C0;
	Wed,  8 Oct 2025 04:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mDfsd34A"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FC4A2BEFF8
	for <linux-media@vger.kernel.org>; Wed,  8 Oct 2025 04:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759898014; cv=none; b=kcVyxJAJch5kTCRnNByr6+kNe2mwQU9rQP4aQTTGrsQVS8Sf7FzhdjShYPUPBmGVuc8Hn2TmuxokVL+LGCQ3GwHIVxncBjAKxsuL9WoBUNUm86ws8+oF2EIy8cDekrvQw9ZLSaPTH6SQ5QiNFWD0AyxEzmFSv3nclB1svtAOfEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759898014; c=relaxed/simple;
	bh=SI7znv4ie6w0KvvXmNwGIwdLuWepocC3U404l8kktWA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oH861Vta4tZafVUtZifVwrtrVtUgUuwkClqOq2bzwQH+RFPvjhTDzXITrYNTosIEth676BnYqX5tN5hLygrhNufQRTY1p2z7D5SDchGKdTd9lPe/ggAHRXNZSX66xcnoQfAO8b+cOAx731Yx57Zo8zc2pnIgcRAej3uorX0d2MU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mDfsd34A; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59804C3f029272
	for <linux-media@vger.kernel.org>; Wed, 8 Oct 2025 04:33:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YQX79S0/XV7XlL06YINHBYAd6O99CCZpdBNwCcOn2VE=; b=mDfsd34Atp7Czbjk
	vTgaKhzQA9PPyVMzGOUQh+Psy21wyrTp9EllAE5qJ7KWo4iZa9/YkaLxhdq7hubT
	3PalT5stlQC/lMI7ibC8f0rJ7ZObw/EK+bCyg5puVU654mvyhkKAOquETQSwRftQ
	KuyG3hCD+1eLs1al4Njov7wKEQQct/41mAm2MJAcMaG5SXRlPJ8imbO1XAbOwAV+
	UmpBHUouc8l+RYSjU3cgfDi/XIG1IuWYUgx2SyiDUGcUkBJ+ekVLRT1PrKLBIUVD
	2hHUCD9sZ8PKJa2BrFJnggk9GfRhZFUohV2V4nKQ/6dzCs25/q3orkllRhGl8Nh0
	2niBag==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49n4wkssnh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 08 Oct 2025 04:33:30 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4d91b91b6f8so93375501cf.3
        for <linux-media@vger.kernel.org>; Tue, 07 Oct 2025 21:33:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759898008; x=1760502808;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YQX79S0/XV7XlL06YINHBYAd6O99CCZpdBNwCcOn2VE=;
        b=cH4XJSv5Qdc0haJb4d4TWeD/jbplEkKsXFD327grf1S/vhhad2+6JIXGcfaCvm/Wvs
         XQW2tsGb7WUyhoBTgaDuz1/2OqwkpKyV/zPKRcRrQTq1UNpq5c2hqOuUJF5pDK9IEM6h
         kL5Gyp1LUT/sL33yUD5T+bg3Vo3FwuXE3x/NlKuyimbsotNmC8FhAAygAQsYQ7SQz3CF
         kv5FQF9k1dj5j3MorvYLEsnzTeGHU+4VOfDqT1x9nPJ+ew2U25Lc73ZQ2Y8aUbgQN/yA
         Eq3A4ox1Py7N4ULjWZCOSvs3GhHo4rs+MH1TCbbUb2u6La7Zhez2RfmfP7sQeJPBuGqn
         Jr3A==
X-Gm-Message-State: AOJu0YzFE1+gHwosYKOWPK/nuOhDWfFSDg0g/wEhVOZK0IjA35sE06Jf
	Mvepd/AGfNzePaV3cjbSFXBpQ2JlhIKaozXaAfC3NUHIgtBYHJb/Jez4SgH593pxmt84pdoWByH
	nfS9deAGptviMgNpWd2KK0NRsH7oamJrwcFXj1rAEb0O8CZibbxH9CZJX+mH1eE1RHA==
X-Gm-Gg: ASbGnctMnlH/TKYkGjYyx6dsJwE0LpzL6PUo4qNiavmd6rHNKm62EsMzPNmy/SwkU79
	SG1arKXyet9f3YJILGZyUQRRZoz5M4eJxKrm/ZGZZepU6MEkEHQajo6Gbzgx1XKLfkEw7VO7pMm
	ksy8LptW4r50uaNPrZlgQyAHuKufFMcojgTbXDBBgegFqFir94tv+LqpvYGO1VMqcjs0n48DJf/
	Y4iZQiT2UcDwvOMS8GHs3r4AUT4HtQEZBFN14c/qGFF7eWNLsm4QpxrW2MBWpUEebIme2VBs7GC
	gST5Z9NXjX/85ViEzvBHD6U7dXMCAtE1oposNifVw8KZsQOiEGaf+Nv9ZJqdZ5uULpSvsMpQOlV
	YPPKJMNg8ZVl2sTxlj7tPPSDRH9ZRLs4Y9c1tKVpJY8k4ACDz662sOF/q+w==
X-Received: by 2002:a05:622a:4243:b0:4b7:aff5:e8c2 with SMTP id d75a77b69052e-4e6ead657c4mr29496111cf.58.1759898008177;
        Tue, 07 Oct 2025 21:33:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFFjB0EZSX42DCM2xImLrjWzHZNoBAtRuDzJxkKA6B0d+m0djJECFbz+Zzfp+tpMB2fcVw44A==
X-Received: by 2002:a05:622a:4243:b0:4b7:aff5:e8c2 with SMTP id d75a77b69052e-4e6ead657c4mr29495911cf.58.1759898007700;
        Tue, 07 Oct 2025 21:33:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b0119f461sm6751107e87.107.2025.10.07.21.33.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 21:33:26 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 08 Oct 2025 07:33:06 +0300
Subject: [PATCH 8/8] media: iris: enable support for SC7280 platform
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251008-iris-sc7280-v1-8-def050ba5e1f@oss.qualcomm.com>
References: <20251008-iris-sc7280-v1-0-def050ba5e1f@oss.qualcomm.com>
In-Reply-To: <20251008-iris-sc7280-v1-0-def050ba5e1f@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=11419;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=SI7znv4ie6w0KvvXmNwGIwdLuWepocC3U404l8kktWA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBo5emDhnpYDY15w/xa+obWYsCjIkZuFkTPXV1Sg
 xsohCK3HlCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaOXpgwAKCRCLPIo+Aiko
 1X5GB/9uL8e9fHr1AE99qTBjCO3NwHOAYRhq4DNT3u4ckXhs6YjJpNEz74KoWqElvwlmTcstPfs
 73nzwxx+ke1QzuZ/HvY9EFR6Cb6CP5alREjRyG5s3pxxGejUUhHEYsL7l6g9sadazfjtkxGJoGh
 oJcRe47hENmasmngupbtXVVWGkgwSg0J8N/0XfH8WJMOaF6wt+LebtZO3Xaejy9zCs9cRkgLoMy
 EcjOVCQ6s4txD2CZLqkMSZ/8+DASG+e02ZVBYqlnuUcC9ZMRK2+3CYi2sWgnAu92ZOgQRjQYa5r
 x2UjrlxNlcxpeY4E5cDz7tQNKRRTRKoIulgN0NT3nNW6Ut2Q
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA3MDExNyBTYWx0ZWRfXzfUT1k1EpU5X
 lrK6QIlyM/nww6h94wLKOjDO5n+DGcuYz4XtUaWuBinoWriJMe59a1iqtqQ5Ohi7J9Xs45ovYUN
 0bQwptPAcrs2LNnInbqW5QqoFeZYCckevC1g4IeZgDlunGcnJLds3elKtskb/orPZwGhMHwW6aL
 P2rYuimv5baGX9cIscUPVUhNndMcVZPtXngfNeSnAQzNYjcpdYZbtosRYvBqVEzP0AwkCXk0pb0
 XY+w1pteaJlsLTfq/s+GIkYiPKHVcsWZjxzl1wGAQQpymYLkdgExxhPcN+Mu4RYbN67WyqxaL0H
 uh39SZI5mUKwcFTIfiFUVisC1/jXJJ6NaQ4Jj8OznEPZA9GDstpO6zyXr5ypF29staM+ZixRlFS
 Oe3TL2NC0xssqPrNVZk0GM/DXlw+0g==
X-Authority-Analysis: v=2.4 cv=BP2+bVQG c=1 sm=1 tr=0 ts=68e5e99a cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=pG0Ruh8lDxDpiiRDS04A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: p7D5_rbRFGN84uRFN_IdgWSe7VYdSmSR
X-Proofpoint-ORIG-GUID: p7D5_rbRFGN84uRFN_IdgWSe7VYdSmSR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-07_02,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510070117

As a part of migrating code from the old Venus driver to the new Iris
one, add support for the SC7280 platform. It is very similar to SM8250,
but it (currently) uses no reset controls (there is an optional
GCC-generated reset, it will be added later) and no AON registers
region. The Venus driver names this platform "IRIS2_1", so the ops in
the driver are also now called iris_vpu21_ops.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../platform/qcom/iris/iris_platform_common.h      |   3 +
 .../media/platform/qcom/iris/iris_platform_gen1.c  |  66 +++++++++++
 drivers/media/platform/qcom/iris/iris_probe.c      |   4 +
 drivers/media/platform/qcom/iris/iris_vpu2.c       | 130 +++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_vpu_common.h |   1 +
 5 files changed, 204 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 104ff38219e30e6d52476d44b54338c55ef2ca7b..36e33eb05a6918de590feca37b41c07a92e9c434 100644
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
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen1.c b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
index 2b3b8bd00a6096acaae928318d9231847ec89855..d5288a71a6a8289e5ecf69b6f38231500f2bf8b4 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen1.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
@@ -364,3 +364,69 @@ const struct iris_platform_data sm8250_data = {
 	.enc_ip_int_buf_tbl = sm8250_enc_ip_int_buf_tbl,
 	.enc_ip_int_buf_tbl_size = ARRAY_SIZE(sm8250_enc_ip_int_buf_tbl),
 };
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
+const struct iris_platform_data sc7280_data = {
+	.get_instance = iris_hfi_gen1_get_instance,
+	.init_hfi_command_ops = &iris_hfi_gen1_command_ops_init,
+	.init_hfi_response_ops = iris_hfi_gen1_response_ops_init,
+	.get_vpu_buffer_size = iris_vpu_buf_size,
+	.vpu_ops = &iris_vpu21_ops,
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
diff --git a/drivers/media/platform/qcom/iris/iris_vpu2.c b/drivers/media/platform/qcom/iris/iris_vpu2.c
index de7d142316d2dc9ab0c4ad9cc8161c87ac949b4c..73fae652cfea6b729d4b8f9346a345a88b068394 100644
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
@@ -32,6 +38,122 @@ static u64 iris_vpu2_calc_freq(struct iris_inst *inst, size_t data_size)
 	return max(vpp_freq, vsp_freq);
 }
 
+/* iris_vpu_power_off_hw + IRIS_HW_AXI_CLK */
+static void iris_vpu21_power_off_hw(struct iris_core *core)
+{
+	dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN], false);
+	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
+	iris_disable_unprepare_clock(core, IRIS_HW_AXI_CLK);
+	iris_disable_unprepare_clock(core, IRIS_HW_CLK);
+}
+
+/* iris_vpu_power_on_hw + IRIS_HW_AXI_CLK */
+static int iris_vpu21_power_on_hw(struct iris_core *core)
+{
+	int ret;
+
+	ret = iris_enable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
+	if (ret)
+		return ret;
+
+	ret = iris_prepare_enable_clock(core, IRIS_HW_CLK);
+	if (ret)
+		goto err_disable_power;
+
+	ret = iris_prepare_enable_clock(core, IRIS_HW_AXI_CLK);
+	if (ret)
+		goto err_disable_hw_clock;
+
+	ret = dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN], true);
+	if (ret)
+		goto err_disable_hw_axi_clock;
+
+	return 0;
+
+err_disable_hw_axi_clock:
+	iris_disable_unprepare_clock(core, IRIS_HW_AXI_CLK);
+err_disable_hw_clock:
+	iris_disable_unprepare_clock(core, IRIS_HW_CLK);
+err_disable_power:
+	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
+
+	return ret;
+}
+
+/* iris_vpu_power_on_controller + IRIS_AHB_CLK */
+static int iris_vpu21_power_on_controller(struct iris_core *core)
+{
+	int ret;
+
+	ret = iris_enable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
+	if (ret)
+		return ret;
+
+	ret = iris_prepare_enable_clock(core, IRIS_AXI_CLK);
+	if (ret)
+		goto err_disable_power;
+
+	ret = iris_prepare_enable_clock(core, IRIS_CTRL_CLK);
+	if (ret)
+		goto err_disable_axi_clock;
+
+	ret = iris_prepare_enable_clock(core, IRIS_AHB_CLK);
+	if (ret)
+		goto err_disable_ctrl_clock;
+
+	return 0;
+
+err_disable_ctrl_clock:
+	iris_disable_unprepare_clock(core, IRIS_CTRL_CLK);
+err_disable_axi_clock:
+	iris_disable_unprepare_clock(core, IRIS_AXI_CLK);
+err_disable_power:
+	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
+
+	return ret;
+}
+
+/*
+ * This is the same as iris_vpu_power_off_controller except
+ * AON_WRAPPER_MVP_NOC_LPI_CONTROL / AON_WRAPPER_MVP_NOC_LPI_STATUS programming
+ * and with added IRIS_AHB_CLK handling
+ */
+static int iris_vpu21_power_off_controller(struct iris_core *core)
+{
+	u32 val = 0;
+	int ret;
+
+	writel(MSK_SIGNAL_FROM_TENSILICA | MSK_CORE_POWER_ON, core->reg_base + CPU_CS_X2RPMH);
+
+	writel(REQ_POWER_DOWN_PREP, core->reg_base + WRAPPER_IRIS_CPU_NOC_LPI_CONTROL);
+
+	ret = readl_poll_timeout(core->reg_base + WRAPPER_IRIS_CPU_NOC_LPI_STATUS,
+				 val, val & BIT(0), 200, 2000);
+	if (ret)
+		goto disable_power;
+
+	writel(0x0, core->reg_base + WRAPPER_DEBUG_BRIDGE_LPI_CONTROL);
+
+	ret = readl_poll_timeout(core->reg_base + WRAPPER_DEBUG_BRIDGE_LPI_STATUS,
+				 val, val == 0, 200, 2000);
+	if (ret)
+		goto disable_power;
+
+	writel(CTL_AXI_CLK_HALT | CTL_CLK_HALT,
+	       core->reg_base + WRAPPER_TZ_CTL_AXI_CLOCK_CONFIG);
+	writel(RESET_HIGH, core->reg_base + WRAPPER_TZ_QNS4PDXFIFO_RESET);
+	writel(0x0, core->reg_base + WRAPPER_TZ_QNS4PDXFIFO_RESET);
+	writel(0x0, core->reg_base + WRAPPER_TZ_CTL_AXI_CLOCK_CONFIG);
+
+disable_power:
+	iris_disable_unprepare_clock(core, IRIS_AHB_CLK);
+	iris_disable_unprepare_clock(core, IRIS_CTRL_CLK);
+	iris_disable_unprepare_clock(core, IRIS_AXI_CLK);
+	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
+
+	return 0;
+}
+
 const struct vpu_ops iris_vpu2_ops = {
 	.power_off_hw = iris_vpu_power_off_hw,
 	.power_on_hw = iris_vpu_power_on_hw,
@@ -39,3 +161,11 @@ const struct vpu_ops iris_vpu2_ops = {
 	.power_on_controller = iris_vpu_power_on_controller,
 	.calc_freq = iris_vpu2_calc_freq,
 };
+
+const struct vpu_ops iris_vpu21_ops = {
+	.power_off_hw = iris_vpu21_power_off_hw,
+	.power_on_hw = iris_vpu21_power_on_hw,
+	.power_off_controller = iris_vpu21_power_off_controller,
+	.power_on_controller = iris_vpu21_power_on_controller,
+	.calc_freq = iris_vpu2_calc_freq,
+};
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.h b/drivers/media/platform/qcom/iris/iris_vpu_common.h
index d636e287457adf0c44540af5c85cfa69decbca8b..6589fecbfeeec75d21759048afeca7fb42e65492 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.h
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.h
@@ -9,6 +9,7 @@
 struct iris_core;
 
 extern const struct vpu_ops iris_vpu2_ops;
+extern const struct vpu_ops iris_vpu21_ops;
 extern const struct vpu_ops iris_vpu3_ops;
 extern const struct vpu_ops iris_vpu33_ops;
 extern const struct vpu_ops iris_vpu35_ops;

-- 
2.47.3


