Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 36774766F5F
	for <lists+linux-media@lfdr.de>; Fri, 28 Jul 2023 16:24:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236859AbjG1OYJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Jul 2023 10:24:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236194AbjG1OYI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Jul 2023 10:24:08 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6232D35BF;
        Fri, 28 Jul 2023 07:24:06 -0700 (PDT)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36SB80Nu023361;
        Fri, 28 Jul 2023 13:27:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=12lxi0iuh1niBROR+SGm8stvj1hc0vJCxUJta4SPFr8=;
 b=TCkajS1LTQCt7skCNBFPPEfffb6cuIplnxVmI3BhZRs3dvlcRjWuHkLtBOCLVveN/Xyr
 UFnp3UNc860BBG4+i9dZZcWf1S+blNfyKVV7ZUV9D5OhlMlVUyC2IsMm7ySjeJ27ZAqS
 PQVu0j5U6z+kiOS7Mr74+F49y6HsSS/qBJeHOoYanB0S6pA4EnosPI6/3r5ROQCwPiE6
 d3z3h7tSW6/pOANpxRHzL3IBp+iyTp1VmekyyoDTOJHG0fCEmsceMWrWAk3maAl/ZYvS
 8BWwOqVGMEGhslPJOg33O/mDdmuhBSBk15W3UYS+UkiQxNBAWs0J9KRKOOCxkvkHQ54E Tg== 
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3s3ufutb6h-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 28 Jul 2023 13:27:01 +0000
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
        by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 36SDR151003363
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 28 Jul 2023 13:27:01 GMT
Received: from hu-vgarodia-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Fri, 28 Jul 2023 06:26:57 -0700
From:   Vikash Garodia <quic_vgarodia@quicinc.com>
To:     <stanimir.k.varbanov@gmail.com>, <agross@kernel.org>,
        <andersson@kernel.org>, <konrad.dybcio@linaro.org>,
        <mchehab@kernel.org>, <hans.verkuil@cisco.com>,
        <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>
CC:     <quic_dikshita@quicinc.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>
Subject: [PATCH 32/33] iris: variant: iris3: implement logic to compute clock frequency
Date:   Fri, 28 Jul 2023 18:53:43 +0530
Message-ID: <1690550624-14642-33-git-send-email-quic_vgarodia@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1690550624-14642-1-git-send-email-quic_vgarodia@quicinc.com>
References: <1690550624-14642-1-git-send-email-quic_vgarodia@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: rozaoR9n9PQ48MGIDis5WEZpqK2QasAI
X-Proofpoint-ORIG-GUID: rozaoR9n9PQ48MGIDis5WEZpqK2QasAI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-27_10,2023-07-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 mlxlogscore=999 mlxscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307280124
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Dikshita Agarwal <quic_dikshita@quicinc.com>

This implements the logic to computer the required clock frequency
by encoder or decoder for a specific usecase. It considers the input
as various parameters configured by client for that usecase.

Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
---
 .../iris/variant/iris3/src/msm_vidc_clock_iris3.c  | 627 +++++++++++++++++++++
 1 file changed, 627 insertions(+)
 create mode 100644 drivers/media/platform/qcom/iris/variant/iris3/src/msm_vidc_clock_iris3.c

diff --git a/drivers/media/platform/qcom/iris/variant/iris3/src/msm_vidc_clock_iris3.c b/drivers/media/platform/qcom/iris/variant/iris3/src/msm_vidc_clock_iris3.c
new file mode 100644
index 0000000..6665aef
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/variant/iris3/src/msm_vidc_clock_iris3.c
@@ -0,0 +1,627 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include "msm_vidc_debug.h"
+
+#define ENABLE_FINEBITRATE_SUBUHD60 0
+#include "perf_static_model.h"
+
+/*
+ * Chipset Generation Technology: SW/FW overhead profiling
+ * need update with new numbers
+ */
+static u32 frequency_table_iris3[2][6] = {
+	/* //make lowsvs_D1 as invalid; */
+	{533, 444, 366, 338, 240, 0},
+	{800, 666, 549, 507, 360, 0},
+};
+
+ /* Tensilica cycles */
+#define DECODER_VPP_FW_OVERHEAD_IRIS3                                                  66234
+
+/* Tensilica cycles; this is measured in Lahaina 1stage with FW profiling */
+#define DECODER_VPPVSP1STAGE_FW_OVERHEAD_IRIS3                                         93000
+
+#define DECODER_VSP_FW_OVERHEAD_IRIS3 \
+	(DECODER_VPPVSP1STAGE_FW_OVERHEAD_IRIS3 - DECODER_VPP_FW_OVERHEAD_IRIS3)
+
+/* Tensilica cycles; encoder has ARP register */
+#define ENCODER_VPP_FW_OVERHEAD_IRIS3                                                  48405
+
+#define ENCODER_VPPVSP1STAGE_FW_OVERHEAD_IRIS3 \
+	(ENCODER_VPP_FW_OVERHEAD_IRIS3 + DECODER_VSP_FW_OVERHEAD_IRIS3)
+
+#define DECODER_SW_OVERHEAD_IRIS3                                                      489583
+#define ENCODER_SW_OVERHEAD_IRIS3                                                      489583
+
+/* Video IP Core Technology: pipefloor and pipe penlaty */
+static u32 decoder_vpp_target_clk_per_mb_iris3 = 200;
+
+/*
+ * These pipe penalty numbers only applies to 4 pipe
+ * For 2pipe and 1pipe, these numbers need recalibrate
+ */
+static u32 pipe_penalty_iris3[3][3] = {
+	/* NON AV1 */
+	{1059, 1059, 1059},
+	/* AV1 RECOMMENDED TILE 1080P_V2XH1, UHD_V2X2, 8KUHD_V8X2 */
+	{1410, 1248, 1226},
+	/* AV1 YOUTUBE/NETFLIX TILE 1080P_V4XH2_V4X1, UHD_V8X4_V8X1, 8KUHD_V8X8_V8X1 */
+	{2039, 2464, 1191},
+};
+
+/*
+ * Video IP Core Technology: bitrate constraint
+ * HW limit bitrate table (these values are measured end to end,
+ * fw/sw impacts are also considered)
+ * TODO Can we convert to Cycles/MB? This will remove DIVISION.
+ */
+static u32 bitrate_table_iris3_2stage_fp[4][10] = {
+	/* h264 cavlc */
+	{0, 220, 220, 220, 220, 220, 220, 220, 220, 220},
+	/* h264 cabac */
+	{0, 140, 150, 160, 175, 190, 190, 190, 190, 190},
+	/* h265 */
+	{90, 140, 160, 180, 190, 200, 200, 200, 200, 200},
+	/* vp9 */
+	{90, 90, 90, 90, 90, 90, 90, 90, 90, 90},
+};
+
+/* HW limit bitrate table (these values are measured end to end fw/sw impacts
+ * are also considered
+ */
+static u32 bitrate_table_iris3_1stage_fp[4][10] = { /* 1-stage assume IPPP */
+	/* h264 cavlc */
+	{0, 220, 220, 220, 220, 220, 220, 220, 220, 220},
+	/* h264 cabac */
+	{0, 110, 150, 150, 150, 150, 150, 150, 150, 150},
+	/* h265 */
+	{0, 140, 150, 150, 150, 150, 150, 150, 150, 150},
+	/* vp9 */
+	{0, 70, 70, 70, 70, 70, 70, 70, 70, 70},
+};
+
+static u32 input_bitrate_fp;
+
+/* 8KUHD60; UHD240; 1080p960  with B */
+static u32 fp_pixel_count_bar0 = 3840 * 2160 * 240;
+/* 8KUHD60; UHD240; 1080p960  without B */
+static u32 fp_pixel_count_bar1 = 3840 * 2160 * 240;
+/* 1080p720 */
+static u32 fp_pixel_count_bar2 = 3840 * 2160 * 180;
+/* UHD120 */
+static u32 fp_pixel_count_bar3 = 3840 * 2160 * 120;
+/* UHD90 */
+static u32 fp_pixel_count_bar4 = 3840 * 2160 * 90;
+/* UHD60 */
+static u32 fp_pixel_count_bar5 = 3840 * 2160 * 60;
+/* UHD30; FHD120; HD240 */
+static u32 fp_pixel_count_bar6 = 3840 * 2160 * 30;
+/* FHD60 */
+static u32 fp_pixel_count_bar7 = 1920 * 1080 * 60;
+/* FHD30 */
+static u32 fp_pixel_count_bar8 = 1920 * 1080 * 30;
+
+static u32 codec_encoder_gop_complexity_table_fp[8][3];
+static u32 codec_mbspersession_iris3;
+
+static u32 calculate_number_mbs_iris3(u32 width, u32 height, u32 lcu_size)
+{
+	u32 mbs_width = (width % lcu_size) ?
+		(width / lcu_size + 1) : (width / lcu_size);
+
+	u32 mbs_height = (height % lcu_size) ?
+		(height / lcu_size + 1) : (height / lcu_size);
+
+	return mbs_width * mbs_height * (lcu_size / 16) * (lcu_size / 16);
+}
+
+static int initialize_encoder_complexity_table(void)
+{
+	/* Beging Calculate Encoder GOP Complexity Table and HW Floor numbers */
+	codec_encoder_gop_complexity_table_fp
+		[CODEC_GOP_I3B4b1P][CODEC_ENCODER_GOP_Bb_ENTRY] = 70000;
+
+	codec_encoder_gop_complexity_table_fp
+		[CODEC_GOP_I3B4b1P][CODEC_ENCODER_GOP_P_ENTRY] = 10000;
+
+	codec_encoder_gop_complexity_table_fp
+		[CODEC_GOP_I3B4b1P][CODEC_ENCODER_GOP_FACTORY_ENTRY] =
+		(codec_encoder_gop_complexity_table_fp
+		[CODEC_GOP_I3B4b1P][CODEC_ENCODER_GOP_Bb_ENTRY] * 150 +
+		codec_encoder_gop_complexity_table_fp
+		[CODEC_GOP_I3B4b1P][CODEC_ENCODER_GOP_P_ENTRY] * 100);
+
+	codec_encoder_gop_complexity_table_fp
+		[CODEC_GOP_I3B4b1P][CODEC_ENCODER_GOP_FACTORY_ENTRY] =
+		codec_encoder_gop_complexity_table_fp
+		[CODEC_GOP_I3B4b1P][CODEC_ENCODER_GOP_FACTORY_ENTRY] +
+		(codec_encoder_gop_complexity_table_fp
+		[CODEC_GOP_I3B4b1P][CODEC_ENCODER_GOP_Bb_ENTRY] +
+		codec_encoder_gop_complexity_table_fp
+		[CODEC_GOP_I3B4b1P][CODEC_ENCODER_GOP_P_ENTRY] - 1);
+
+	codec_encoder_gop_complexity_table_fp
+		[CODEC_GOP_I3B4b1P][CODEC_ENCODER_GOP_FACTORY_ENTRY] =
+		codec_encoder_gop_complexity_table_fp
+		[CODEC_GOP_I3B4b1P][CODEC_ENCODER_GOP_FACTORY_ENTRY] /
+		(codec_encoder_gop_complexity_table_fp
+		[CODEC_GOP_I3B4b1P][CODEC_ENCODER_GOP_Bb_ENTRY] +
+		codec_encoder_gop_complexity_table_fp
+		[CODEC_GOP_I3B4b1P][CODEC_ENCODER_GOP_P_ENTRY]);
+
+	codec_encoder_gop_complexity_table_fp
+		[CODEC_GOP_I1B2b1P][CODEC_ENCODER_GOP_Bb_ENTRY] = 30000;
+
+	codec_encoder_gop_complexity_table_fp
+		[CODEC_GOP_I1B2b1P][CODEC_ENCODER_GOP_P_ENTRY] = 10000;
+
+	codec_encoder_gop_complexity_table_fp
+		[CODEC_GOP_I1B2b1P][CODEC_ENCODER_GOP_FACTORY_ENTRY] =
+		(codec_encoder_gop_complexity_table_fp
+		[CODEC_GOP_I1B2b1P][CODEC_ENCODER_GOP_Bb_ENTRY] * 150 +
+		codec_encoder_gop_complexity_table_fp
+		[CODEC_GOP_I1B2b1P][CODEC_ENCODER_GOP_P_ENTRY] * 100);
+
+	codec_encoder_gop_complexity_table_fp
+		[CODEC_GOP_I1B2b1P][CODEC_ENCODER_GOP_FACTORY_ENTRY] =
+		codec_encoder_gop_complexity_table_fp
+		[CODEC_GOP_I1B2b1P][CODEC_ENCODER_GOP_FACTORY_ENTRY] +
+		(codec_encoder_gop_complexity_table_fp
+		[CODEC_GOP_I1B2b1P][CODEC_ENCODER_GOP_Bb_ENTRY] +
+		codec_encoder_gop_complexity_table_fp
+		[CODEC_GOP_I1B2b1P][CODEC_ENCODER_GOP_P_ENTRY] - 1);
+
+	codec_encoder_gop_complexity_table_fp
+		[CODEC_GOP_I1B2b1P][CODEC_ENCODER_GOP_FACTORY_ENTRY] =
+		codec_encoder_gop_complexity_table_fp
+		[CODEC_GOP_I1B2b1P][CODEC_ENCODER_GOP_FACTORY_ENTRY] /
+		(codec_encoder_gop_complexity_table_fp
+		[CODEC_GOP_I1B2b1P][CODEC_ENCODER_GOP_Bb_ENTRY] +
+		codec_encoder_gop_complexity_table_fp
+		[CODEC_GOP_I1B2b1P][CODEC_ENCODER_GOP_P_ENTRY]);
+
+	codec_encoder_gop_complexity_table_fp
+		[CODEC_GOP_IbP][CODEC_ENCODER_GOP_Bb_ENTRY] = 10000;
+
+	codec_encoder_gop_complexity_table_fp
+		[CODEC_GOP_IbP][CODEC_ENCODER_GOP_P_ENTRY] = 10000;
+
+	codec_encoder_gop_complexity_table_fp
+		[CODEC_GOP_IbP][CODEC_ENCODER_GOP_FACTORY_ENTRY] =
+		(codec_encoder_gop_complexity_table_fp
+		[CODEC_GOP_IbP][CODEC_ENCODER_GOP_Bb_ENTRY] * 150 +
+		codec_encoder_gop_complexity_table_fp
+		[CODEC_GOP_IbP][CODEC_ENCODER_GOP_P_ENTRY] * 100);
+
+	codec_encoder_gop_complexity_table_fp
+		[CODEC_GOP_IbP][CODEC_ENCODER_GOP_FACTORY_ENTRY] =
+		codec_encoder_gop_complexity_table_fp
+		[CODEC_GOP_IbP][CODEC_ENCODER_GOP_FACTORY_ENTRY] +
+		(codec_encoder_gop_complexity_table_fp
+		[CODEC_GOP_IbP][CODEC_ENCODER_GOP_Bb_ENTRY] +
+		codec_encoder_gop_complexity_table_fp
+		[CODEC_GOP_IbP][CODEC_ENCODER_GOP_P_ENTRY] - 1);
+
+	codec_encoder_gop_complexity_table_fp
+		[CODEC_GOP_IbP][CODEC_ENCODER_GOP_FACTORY_ENTRY] =
+		codec_encoder_gop_complexity_table_fp
+		[CODEC_GOP_IbP][CODEC_ENCODER_GOP_FACTORY_ENTRY] /
+		(codec_encoder_gop_complexity_table_fp
+		[CODEC_GOP_IbP][CODEC_ENCODER_GOP_Bb_ENTRY] +
+		codec_encoder_gop_complexity_table_fp
+		[CODEC_GOP_IbP][CODEC_ENCODER_GOP_P_ENTRY]);
+
+	codec_encoder_gop_complexity_table_fp
+		[CODEC_GOP_IPP][CODEC_ENCODER_GOP_Bb_ENTRY] = 0;
+
+	codec_encoder_gop_complexity_table_fp
+		[CODEC_GOP_IPP][CODEC_ENCODER_GOP_P_ENTRY] = 1;
+
+	codec_encoder_gop_complexity_table_fp
+		[CODEC_GOP_IPP][CODEC_ENCODER_GOP_FACTORY_ENTRY] =
+		(codec_encoder_gop_complexity_table_fp
+		[CODEC_GOP_IPP][CODEC_ENCODER_GOP_Bb_ENTRY] * 150 +
+		codec_encoder_gop_complexity_table_fp
+		[CODEC_GOP_IPP][CODEC_ENCODER_GOP_P_ENTRY] * 100);
+
+	codec_encoder_gop_complexity_table_fp
+		[CODEC_GOP_IPP][CODEC_ENCODER_GOP_FACTORY_ENTRY] =
+		codec_encoder_gop_complexity_table_fp
+		[CODEC_GOP_IPP][CODEC_ENCODER_GOP_FACTORY_ENTRY] +
+		(codec_encoder_gop_complexity_table_fp
+		[CODEC_GOP_IPP][CODEC_ENCODER_GOP_Bb_ENTRY] +
+		codec_encoder_gop_complexity_table_fp
+		[CODEC_GOP_IPP][CODEC_ENCODER_GOP_P_ENTRY] - 1);
+
+	codec_encoder_gop_complexity_table_fp
+		[CODEC_GOP_IPP][CODEC_ENCODER_GOP_FACTORY_ENTRY] =
+		codec_encoder_gop_complexity_table_fp
+		[CODEC_GOP_IPP][CODEC_ENCODER_GOP_FACTORY_ENTRY] /
+		(codec_encoder_gop_complexity_table_fp
+		[CODEC_GOP_IPP][CODEC_ENCODER_GOP_Bb_ENTRY] +
+		codec_encoder_gop_complexity_table_fp
+		[CODEC_GOP_IPP][CODEC_ENCODER_GOP_P_ENTRY]);
+
+	return 0;
+}
+
+u32 get_bitrate_entry(u32 pixle_count)
+{
+	u32 bitrate_entry = 0;
+
+	if (pixle_count >= fp_pixel_count_bar1)
+		bitrate_entry = 1;
+	else if (pixle_count >= fp_pixel_count_bar2)
+		bitrate_entry = 2;
+	else if (pixle_count >= fp_pixel_count_bar3)
+		bitrate_entry = 3;
+	else if (pixle_count >= fp_pixel_count_bar4)
+		bitrate_entry = 4;
+	else if (pixle_count >= fp_pixel_count_bar5)
+		bitrate_entry = 5;
+	else if (pixle_count >= fp_pixel_count_bar6)
+		bitrate_entry = 6;
+	else if (pixle_count >= fp_pixel_count_bar7)
+		bitrate_entry = 7;
+	else if (pixle_count >= fp_pixel_count_bar8)
+		bitrate_entry = 8;
+	else
+		bitrate_entry = 9;
+
+	return bitrate_entry;
+}
+
+static int calculate_vsp_min_freq(struct api_calculation_input codec_input,
+				  struct api_calculation_freq_output *codec_output)
+{
+	/*
+	 * VSP calculation
+	 * different methodology from Lahaina
+	 */
+	u32 vsp_hw_min_frequency = 0;
+	/* UInt32 decoder_vsp_fw_overhead = 100 + 5; // amplified by 100x */
+	u32 fw_sw_vsp_offset = 1000 + 55;      /* amplified by 1000x */
+
+	/*
+	 * Ignore fw_sw_vsp_offset, as this is baked into the reference bitrate tables.
+	 *  As a consequence remove x1000 multiplier as well.
+	 */
+	u32 codec = codec_input.codec;
+	/* UInt32 *bitratetable; */
+	u32 pixle_count = codec_input.frame_width *
+		codec_input.frame_height * codec_input.frame_rate;
+
+	u8 bitrate_entry = get_bitrate_entry(pixle_count); /* TODO EXTRACT */
+
+	input_bitrate_fp = ((u32)(codec_input.bitrate_mbps * 100 + 99)) / 100;
+	vsp_hw_min_frequency = frequency_table_iris3[0][1] * input_bitrate_fp * 1000;
+
+	/* 8KUHD60fps with B frame */
+	if (pixle_count >= fp_pixel_count_bar0 &&
+	    codec_input.hierachical_layer != CODEC_GOP_IPP) {
+		/*
+		 *  FORMULA: VSPfreq = NOMINAL * (InputBitrate / ReferenceBitrate);
+		 *  ReferenceBitrate = 0 for,
+		 *     - 1Stage TURBO, all Codecs.
+		 *     - 2Stage TURBO, H264 & H265.
+		 *
+		 *  8KUHD60fps with B frame
+		 *     - bitrate_entry = 0
+		 *     - Clock=NOMINAL for H264 & 2Stage H265.
+		 *       Because bitrate table entry for TURBO is 0.
+		 *
+		 *  TODO : Reduce these conditions by removing the zero entries from Bitrate table.
+		 */
+		vsp_hw_min_frequency = frequency_table_iris3[0][1] *
+			input_bitrate_fp * 1000;
+
+		if (codec_input.codec == CODEC_H264 ||
+		    codec_input.codec == CODEC_H264_CAVLC ||
+		    (codec_input.codec == CODEC_HEVC &&
+		     codec_input.vsp_vpp_mode == CODEC_VSPVPP_MODE_1S)) {
+			vsp_hw_min_frequency =
+				DIV_ROUND_UP(frequency_table_iris3[0][1], fw_sw_vsp_offset);
+		} else if ((codec_input.codec == CODEC_HEVC &&
+			   codec_input.vsp_vpp_mode == CODEC_VSPVPP_MODE_2S) ||
+			   codec_input.codec == CODEC_VP9) {
+			if (codec_input.vsp_vpp_mode == CODEC_VSPVPP_MODE_2S) {
+				vsp_hw_min_frequency =
+					DIV_ROUND_UP(vsp_hw_min_frequency,
+						     (bitrate_table_iris3_2stage_fp[codec][0] *
+						      fw_sw_vsp_offset));
+			} else {
+				vsp_hw_min_frequency =
+					DIV_ROUND_UP(vsp_hw_min_frequency,
+						     (bitrate_table_iris3_1stage_fp[codec][0] *
+						      fw_sw_vsp_offset));
+			}
+		}
+	} else {
+		vsp_hw_min_frequency = frequency_table_iris3[0][1] *
+			input_bitrate_fp * 1000;
+
+		if (codec_input.codec == CODEC_H264_CAVLC &&
+		    codec_input.entropy_coding_mode == CODEC_ENTROPY_CODING_CAVLC)
+			codec = CODEC_H264_CAVLC;
+		else if (codec_input.codec == CODEC_H264 &&
+			 codec_input.entropy_coding_mode == CODEC_ENTROPY_CODING_CABAC)
+			codec = CODEC_H264;
+
+		if (codec_input.vsp_vpp_mode == CODEC_VSPVPP_MODE_2S)
+			vsp_hw_min_frequency =
+				DIV_ROUND_UP(vsp_hw_min_frequency,
+					     (bitrate_table_iris3_2stage_fp[codec][bitrate_entry]) *
+					      fw_sw_vsp_offset);
+		else
+			vsp_hw_min_frequency =
+				DIV_ROUND_UP(vsp_hw_min_frequency,
+					     (bitrate_table_iris3_1stage_fp[codec][bitrate_entry]) *
+					      fw_sw_vsp_offset);
+	}
+
+	codec_output->vsp_min_freq = vsp_hw_min_frequency;
+	return 0;
+}
+
+static u32 calculate_pipe_penalty(struct api_calculation_input codec_input)
+{
+	u32 pipe_penalty_codec = 0;
+
+	/* decoder */
+	if (codec_input.decoder_or_encoder == CODEC_DECODER)
+		pipe_penalty_codec = pipe_penalty_iris3[0][0];
+	else
+		pipe_penalty_codec = 101;
+
+	return pipe_penalty_codec;
+}
+
+static int calculate_vpp_min_freq(struct api_calculation_input codec_input,
+				  struct api_calculation_freq_output *codec_output)
+{
+	u32 vpp_hw_min_frequency = 0;
+	u32 fmin = 0;
+	u32 tensilica_min_frequency = 0;
+	u32 decoder_vsp_fw_overhead = 100 + 5; /* amplified by 100x */
+	/* UInt32 fw_sw_vsp_offset = 1000 + 55;       amplified by 1000x */
+	/* TODO from calculate_sw_vsp_min_freq */
+	u32 vsp_hw_min_frequency = codec_output->vsp_min_freq;
+	u32 pipe_penalty_codec = 0;
+	u32 fmin_fwoverhead105 = 0;
+	u32 fmin_measured_fwoverhead = 0;
+	u32 lpmode_uhd_cycle_permb = 0;
+	u32 hqmode1080p_cycle_permb = 0;
+	u32 encoder_vpp_target_clk_per_mb = 0;
+
+	codec_mbspersession_iris3 =
+		calculate_number_mbs_iris3(codec_input.frame_width,
+					   codec_input.frame_height,
+					   codec_input.lcu_size) *
+		codec_input.frame_rate;
+
+	/* Section 2. 0  VPP/VSP calculation */
+	if (codec_input.decoder_or_encoder == CODEC_DECODER) { /* decoder */
+		vpp_hw_min_frequency = ((decoder_vpp_target_clk_per_mb_iris3) *
+			(codec_mbspersession_iris3) + codec_input.pipe_num - 1) /
+			(codec_input.pipe_num);
+
+		vpp_hw_min_frequency = (vpp_hw_min_frequency + 99999) / 1000000;
+
+		if (codec_input.pipe_num > 1) {
+			pipe_penalty_codec = calculate_pipe_penalty(codec_input);
+			vpp_hw_min_frequency = (vpp_hw_min_frequency *
+				pipe_penalty_codec + 999) / 1000;
+		}
+
+		if (codec_input.vsp_vpp_mode == CODEC_VSPVPP_MODE_2S) {
+			/* FW overhead, convert FW cycles to impact to one pipe */
+			u64 decoder_vpp_fw_overhead = 0;
+
+			decoder_vpp_fw_overhead =
+				DIV_ROUND_UP((DECODER_VPP_FW_OVERHEAD_IRIS3 * 10 *
+				codec_input.frame_rate), 15);
+
+			decoder_vpp_fw_overhead =
+				DIV_ROUND_UP((decoder_vpp_fw_overhead * 1000),
+					     (codec_mbspersession_iris3 *
+					      decoder_vpp_target_clk_per_mb_iris3 /
+					      codec_input.pipe_num));
+
+			decoder_vpp_fw_overhead += 1000;
+			decoder_vpp_fw_overhead = (decoder_vpp_fw_overhead < 1050) ?
+				1050 : decoder_vpp_fw_overhead;
+
+			/* VPP HW + FW */
+			if (codec_input.linear_opb == 1 &&
+			    codec_input.bitdepth == CODEC_BITDEPTH_10)
+				/* multiply by 1.20 for 10b case */
+				decoder_vpp_fw_overhead = 1200 + decoder_vpp_fw_overhead - 1000;
+
+			vpp_hw_min_frequency = (vpp_hw_min_frequency *
+				decoder_vpp_fw_overhead + 999) / 1000;
+
+			/* VSP HW+FW */
+			vsp_hw_min_frequency =
+				(vsp_hw_min_frequency * decoder_vsp_fw_overhead + 99) / 100;
+
+			fmin = (vpp_hw_min_frequency > vsp_hw_min_frequency) ?
+				vpp_hw_min_frequency : vsp_hw_min_frequency;
+		} else {
+			/* 1-stage need SW cycles + FW cycles + HW time */
+			if (codec_input.linear_opb == 1 &&
+			    codec_input.bitdepth == CODEC_BITDEPTH_10)
+				/* multiply by 1.20 for 10b linear case */
+				vpp_hw_min_frequency =
+					(vpp_hw_min_frequency * 1200 + 999) / 1000;
+
+			/*
+			 * HW time
+			 * comment: 02/23/2021 SY: the bitrate is measured bitrate,
+			 * the overlapping effect is already considered into bitrate.
+			 * no need to add extra anymore
+			 */
+			fmin = (vpp_hw_min_frequency > vsp_hw_min_frequency) ?
+				vpp_hw_min_frequency : vsp_hw_min_frequency;
+
+			/* FW time */
+			fmin_fwoverhead105 = (fmin * 105 + 99) / 100;
+			fmin_measured_fwoverhead = fmin +
+				(((DECODER_VPPVSP1STAGE_FW_OVERHEAD_IRIS3 *
+				codec_input.frame_rate * 10 + 14) / 15 + 999) / 1000 + 999) /
+				1000;
+
+			fmin = (fmin_fwoverhead105 > fmin_measured_fwoverhead) ?
+				fmin_fwoverhead105 : fmin_measured_fwoverhead;
+		}
+
+		tensilica_min_frequency = (DECODER_SW_OVERHEAD_IRIS3 * 10 + 14) / 15;
+		tensilica_min_frequency = (tensilica_min_frequency + 999) / 1000;
+		tensilica_min_frequency = tensilica_min_frequency * codec_input.frame_rate;
+		tensilica_min_frequency = (tensilica_min_frequency + 999) / 1000;
+		fmin = (tensilica_min_frequency > fmin) ? tensilica_min_frequency : fmin;
+	} else { /* encoder */
+		/* Decide LP/HQ */
+		u8 hq_mode = 0;
+
+		if (codec_input.pipe_num > 1)
+			if (codec_input.frame_width * codec_input.frame_height <=
+				1920 * 1080)
+				if (codec_input.frame_width * codec_input.frame_height *
+					codec_input.frame_rate <= 1920 * 1080 * 60)
+					hq_mode = 1;
+
+		codec_output->enc_hqmode = hq_mode;
+
+		/* Section 1. 0 */
+		/* TODO ONETIME call, should be in another place. */
+		initialize_encoder_complexity_table();
+
+		/* End Calculate Encoder GOP Complexity Table */
+
+		/* VPP base cycle */
+		lpmode_uhd_cycle_permb = (320 *
+			codec_encoder_gop_complexity_table_fp
+			[codec_input.hierachical_layer][CODEC_ENCODER_GOP_FACTORY_ENTRY]
+			+ 99) / 100;
+
+		if (codec_input.frame_width == 1920 &&
+		    (codec_input.frame_height == 1080 ||
+		     codec_input.frame_height == 1088) &&
+		    codec_input.frame_rate >= 480)
+			lpmode_uhd_cycle_permb = (90 * 4 *
+				codec_encoder_gop_complexity_table_fp
+				[codec_input.hierachical_layer][CODEC_ENCODER_GOP_FACTORY_ENTRY]
+				+ 99) / 100;
+
+		if (codec_input.frame_width == 1280 &&
+		    (codec_input.frame_height == 720 ||
+		     codec_input.frame_height == 768) &&
+		    codec_input.frame_rate >= 960)
+			lpmode_uhd_cycle_permb = (99 * 4 *
+				codec_encoder_gop_complexity_table_fp
+				[codec_input.hierachical_layer][CODEC_ENCODER_GOP_FACTORY_ENTRY]
+				+ 99) / 100;
+
+		hqmode1080p_cycle_permb = (675 *
+			codec_encoder_gop_complexity_table_fp
+			[codec_input.hierachical_layer][CODEC_ENCODER_GOP_FACTORY_ENTRY]
+			+ 99) / 100;
+
+		encoder_vpp_target_clk_per_mb = (hq_mode) ?
+			hqmode1080p_cycle_permb : lpmode_uhd_cycle_permb;
+
+		vpp_hw_min_frequency = ((encoder_vpp_target_clk_per_mb) *
+			(codec_mbspersession_iris3) + codec_input.pipe_num - 1) /
+			(codec_input.pipe_num);
+
+		vpp_hw_min_frequency = (vpp_hw_min_frequency + 99999) / 1000000;
+
+		if (codec_input.pipe_num > 1) {
+			u32 pipe_penalty_codec = 101;
+
+			vpp_hw_min_frequency = (vpp_hw_min_frequency *
+				pipe_penalty_codec + 99) / 100;
+		}
+
+		if (codec_input.vsp_vpp_mode == CODEC_VSPVPP_MODE_2S) {
+			/* FW overhead, convert FW cycles to impact to one pipe */
+			u64 encoder_vpp_fw_overhead = 0;
+
+			encoder_vpp_fw_overhead =
+				DIV_ROUND_UP((ENCODER_VPP_FW_OVERHEAD_IRIS3 * 10 *
+				codec_input.frame_rate), 15);
+
+			encoder_vpp_fw_overhead =
+				DIV_ROUND_UP((encoder_vpp_fw_overhead * 1000),
+					     (codec_mbspersession_iris3 *
+					      encoder_vpp_target_clk_per_mb /
+					      codec_input.pipe_num));
+
+			encoder_vpp_fw_overhead += 1000;
+
+			encoder_vpp_fw_overhead = (encoder_vpp_fw_overhead < 1050) ?
+				1050 : encoder_vpp_fw_overhead;
+
+			/* VPP HW + FW */
+			vpp_hw_min_frequency = (vpp_hw_min_frequency *
+				encoder_vpp_fw_overhead + 999) / 1000;
+
+			/* TODO : decoder_vsp_fw_overhead? */
+			vsp_hw_min_frequency = (vsp_hw_min_frequency *
+				decoder_vsp_fw_overhead + 99) / 100;
+
+			fmin = (vpp_hw_min_frequency > vsp_hw_min_frequency) ?
+				vpp_hw_min_frequency : vsp_hw_min_frequency;
+		} else {
+			/* HW time */
+			fmin = (vpp_hw_min_frequency > vsp_hw_min_frequency) ?
+				vpp_hw_min_frequency : vsp_hw_min_frequency;
+
+			/* FW time */
+			fmin_fwoverhead105 = (fmin * 105 + 99) / 100;
+			fmin_measured_fwoverhead = fmin +
+				(((DECODER_VPPVSP1STAGE_FW_OVERHEAD_IRIS3 *
+				codec_input.frame_rate * 10 + 14) / 15 + 999) /
+				1000 + 999) / 1000;
+
+			fmin = (fmin_fwoverhead105 > fmin_measured_fwoverhead) ?
+				fmin_fwoverhead105 : fmin_measured_fwoverhead;
+			/* SW time */
+		}
+
+		tensilica_min_frequency = (ENCODER_SW_OVERHEAD_IRIS3 * 10 + 14) / 15;
+		tensilica_min_frequency = (tensilica_min_frequency + 999) / 1000;
+
+		tensilica_min_frequency = tensilica_min_frequency *
+			codec_input.frame_rate;
+
+		tensilica_min_frequency = (tensilica_min_frequency + 999) / 1000;
+
+		fmin = (tensilica_min_frequency > fmin) ?
+			tensilica_min_frequency : fmin;
+	}
+
+	codec_output->vpp_min_freq = vpp_hw_min_frequency;
+	codec_output->vsp_min_freq = vsp_hw_min_frequency;
+	codec_output->tensilica_min_freq = tensilica_min_frequency;
+	codec_output->hw_min_freq = fmin;
+
+	return 0;
+}
+
+int msm_vidc_calculate_frequency(struct api_calculation_input codec_input,
+				 struct api_calculation_freq_output *codec_output)
+{
+	int rc = 0;
+
+	rc = calculate_vsp_min_freq(codec_input, codec_output);
+	if (rc)
+		return rc;
+
+	rc = calculate_vpp_min_freq(codec_input, codec_output);
+
+	return rc;
+}
-- 
2.7.4

