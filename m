Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B7122767008
	for <lists+linux-media@lfdr.de>; Fri, 28 Jul 2023 17:02:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235761AbjG1PCN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Jul 2023 11:02:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237234AbjG1PCK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Jul 2023 11:02:10 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E62864208;
        Fri, 28 Jul 2023 08:01:58 -0700 (PDT)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36SDKQch029413;
        Fri, 28 Jul 2023 13:26:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=2exeVXvA3Z3y797Y4EnhP8u5A8xSv6opsolXX3iKrRE=;
 b=L4ckU1qysP99sXfSumXULxRvTpQJ8OsEMajZemRYQYDDoHJ7df9CedavJed+EbaTS3YV
 N9V2Vvgjh/FGVoltQPABS+Wf+xlvtEGHUuerm3NX/71YuJRm637rEus+UgvQquyoH4si
 Y9Pn+ZUv+t20eqReXtcdmSeM58Y0No6yBbuO1Vmle0sTzrO+BnvZ0mgqZNSKgL8r8gKA
 6RQFuyC0yUdKvFEGWRgr+CtbASfJ5HWSelqDnFTodLa+xn1zP+lGkibUHubkoEz78E/n
 ZIHWbEwbESJHNSVWo90KwTi0EvmS1Y/4h7wv2MgN0bLGLUYxYRqebcpISX1dK5Bt9333 tg== 
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3s468qs15g-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 28 Jul 2023 13:26:48 +0000
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
        by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 36SDQlA7004143
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 28 Jul 2023 13:26:47 GMT
Received: from hu-vgarodia-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Fri, 28 Jul 2023 06:26:43 -0700
From:   Vikash Garodia <quic_vgarodia@quicinc.com>
To:     <stanimir.k.varbanov@gmail.com>, <agross@kernel.org>,
        <andersson@kernel.org>, <konrad.dybcio@linaro.org>,
        <mchehab@kernel.org>, <hans.verkuil@cisco.com>,
        <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>
CC:     <quic_dikshita@quicinc.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>
Subject: [PATCH 28/33] iris: variant: iris3: add iris3 specific ops
Date:   Fri, 28 Jul 2023 18:53:39 +0530
Message-ID: <1690550624-14642-29-git-send-email-quic_vgarodia@quicinc.com>
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
X-Proofpoint-GUID: 07wP0DGB9iOn8_7foO4enE3B5a8oKEtY
X-Proofpoint-ORIG-GUID: 07wP0DGB9iOn8_7foO4enE3B5a8oKEtY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-27_10,2023-07-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 impostorscore=0 malwarescore=0 phishscore=0 mlxlogscore=999
 mlxscore=0 bulkscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307280124
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Dikshita Agarwal <quic_dikshita@quicinc.com>

This implements iris3 specific ops for power on, power off,
boot firmware, power collapse etc.

Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
---
 .../qcom/iris/variant/iris3/inc/msm_vidc_iris3.h   |  15 +
 .../qcom/iris/variant/iris3/src/msm_vidc_iris3.c   | 954 +++++++++++++++++++++
 2 files changed, 969 insertions(+)
 create mode 100644 drivers/media/platform/qcom/iris/variant/iris3/inc/msm_vidc_iris3.h
 create mode 100644 drivers/media/platform/qcom/iris/variant/iris3/src/msm_vidc_iris3.c

diff --git a/drivers/media/platform/qcom/iris/variant/iris3/inc/msm_vidc_iris3.h b/drivers/media/platform/qcom/iris/variant/iris3/inc/msm_vidc_iris3.h
new file mode 100644
index 0000000..704367e
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/variant/iris3/inc/msm_vidc_iris3.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2020-2021, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2021-2023 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef _MSM_VIDC_IRIS3_H_
+#define _MSM_VIDC_IRIS3_H_
+
+#include "msm_vidc_core.h"
+
+int msm_vidc_init_iris3(struct msm_vidc_core *core);
+int msm_vidc_adjust_bitrate_boost_iris3(void *instance, struct v4l2_ctrl *ctrl);
+
+#endif // _MSM_VIDC_IRIS3_H_
diff --git a/drivers/media/platform/qcom/iris/variant/iris3/src/msm_vidc_iris3.c b/drivers/media/platform/qcom/iris/variant/iris3/src/msm_vidc_iris3.c
new file mode 100644
index 0000000..95dff62
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/variant/iris3/src/msm_vidc_iris3.c
@@ -0,0 +1,954 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2020-2021, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2021-2023 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include "msm_vidc_buffer.h"
+#include "msm_vidc_buffer_iris3.h"
+#include "msm_vidc_core.h"
+#include "msm_vidc_debug.h"
+#include "msm_vidc_driver.h"
+#include "msm_vidc_inst.h"
+#include "msm_vidc_internal.h"
+#include "msm_vidc_iris3.h"
+#include "msm_vidc_platform.h"
+#include "msm_vidc_power_iris3.h"
+#include "msm_vidc_state.h"
+#include "msm_vidc_variant.h"
+#include "venus_hfi.h"
+
+#define VIDEO_ARCH_LX 1
+
+#define VCODEC_BASE_OFFS_IRIS3                 0x00000000
+#define AON_MVP_NOC_RESET                      0x0001F000
+#define CPU_BASE_OFFS_IRIS3                    0x000A0000
+#define AON_BASE_OFFS			               0x000E0000
+#define CPU_CS_BASE_OFFS_IRIS3		           (CPU_BASE_OFFS_IRIS3)
+#define CPU_IC_BASE_OFFS_IRIS3		           (CPU_BASE_OFFS_IRIS3)
+
+#define CPU_CS_A2HSOFTINTCLR_IRIS3             (CPU_CS_BASE_OFFS_IRIS3 + 0x1C)
+#define CPU_CS_VCICMD_IRIS3                    (CPU_CS_BASE_OFFS_IRIS3 + 0x20)
+#define CPU_CS_VCICMDARG0_IRIS3		(CPU_CS_BASE_OFFS_IRIS3 + 0x24)
+#define CPU_CS_VCICMDARG1_IRIS3		(CPU_CS_BASE_OFFS_IRIS3 + 0x28)
+#define CPU_CS_VCICMDARG2_IRIS3		(CPU_CS_BASE_OFFS_IRIS3 + 0x2C)
+#define CPU_CS_VCICMDARG3_IRIS3		(CPU_CS_BASE_OFFS_IRIS3 + 0x30)
+#define CPU_CS_VMIMSG_IRIS3		(CPU_CS_BASE_OFFS_IRIS3 + 0x34)
+#define CPU_CS_VMIMSGAG0_IRIS3		(CPU_CS_BASE_OFFS_IRIS3 + 0x38)
+#define CPU_CS_VMIMSGAG1_IRIS3		(CPU_CS_BASE_OFFS_IRIS3 + 0x3C)
+#define CPU_CS_SCIACMD_IRIS3		(CPU_CS_BASE_OFFS_IRIS3 + 0x48)
+#define CPU_CS_H2XSOFTINTEN_IRIS3	(CPU_CS_BASE_OFFS_IRIS3 + 0x148)
+
+/* HFI_CTRL_STATUS */
+#define CPU_CS_SCIACMDARG0_IRIS3		(CPU_CS_BASE_OFFS_IRIS3 + 0x4C)
+#define CPU_CS_SCIACMDARG0_HFI_CTRL_ERROR_STATUS_BMSK_IRIS3	0xfe
+#define CPU_CS_SCIACMDARG0_HFI_CTRL_PC_READY_IRIS3           0x100
+#define CPU_CS_SCIACMDARG0_HFI_CTRL_INIT_IDLE_MSG_BMSK_IRIS3     0x40000000
+
+/* HFI_QTBL_INFO */
+#define CPU_CS_SCIACMDARG1_IRIS3		(CPU_CS_BASE_OFFS_IRIS3 + 0x50)
+
+/* HFI_QTBL_ADDR */
+#define CPU_CS_SCIACMDARG2_IRIS3		(CPU_CS_BASE_OFFS_IRIS3 + 0x54)
+
+/* HFI_VERSION_INFO */
+#define CPU_CS_SCIACMDARG3_IRIS3		(CPU_CS_BASE_OFFS_IRIS3 + 0x58)
+
+/* SFR_ADDR */
+#define CPU_CS_SCIBCMD_IRIS3		(CPU_CS_BASE_OFFS_IRIS3 + 0x5C)
+
+/* MMAP_ADDR */
+#define CPU_CS_SCIBCMDARG0_IRIS3		(CPU_CS_BASE_OFFS_IRIS3 + 0x60)
+
+/* UC_REGION_ADDR */
+#define CPU_CS_SCIBARG1_IRIS3		(CPU_CS_BASE_OFFS_IRIS3 + 0x64)
+
+/* UC_REGION_ADDR */
+#define CPU_CS_SCIBARG2_IRIS3		(CPU_CS_BASE_OFFS_IRIS3 + 0x68)
+
+#define CPU_CS_AHB_BRIDGE_SYNC_RESET            (CPU_CS_BASE_OFFS_IRIS3 + 0x160)
+#define CPU_CS_AHB_BRIDGE_SYNC_RESET_STATUS     (CPU_CS_BASE_OFFS_IRIS3 + 0x164)
+
+/* FAL10 Feature Control */
+#define CPU_CS_X2RPMH_IRIS3		(CPU_CS_BASE_OFFS_IRIS3 + 0x168)
+#define CPU_CS_X2RPMH_MASK0_BMSK_IRIS3	0x1
+#define CPU_CS_X2RPMH_MASK0_SHFT_IRIS3	0x0
+#define CPU_CS_X2RPMH_MASK1_BMSK_IRIS3	0x2
+#define CPU_CS_X2RPMH_MASK1_SHFT_IRIS3	0x1
+#define CPU_CS_X2RPMH_SWOVERRIDE_BMSK_IRIS3	0x4
+#define CPU_CS_X2RPMH_SWOVERRIDE_SHFT_IRIS3	0x3
+
+#define CPU_IC_SOFTINT_IRIS3		(CPU_IC_BASE_OFFS_IRIS3 + 0x150)
+#define CPU_IC_SOFTINT_H2A_SHFT_IRIS3	0x0
+
+/*
+ * --------------------------------------------------------------------------
+ * MODULE: AON_MVP_NOC_RESET_REGISTERS
+ * --------------------------------------------------------------------------
+ */
+#define AON_WRAPPER_MVP_NOC_RESET_REQ   (AON_MVP_NOC_RESET + 0x000)
+#define AON_WRAPPER_MVP_NOC_RESET_ACK   (AON_MVP_NOC_RESET + 0x004)
+
+/*
+ * --------------------------------------------------------------------------
+ * MODULE: wrapper
+ * --------------------------------------------------------------------------
+ */
+#define WRAPPER_BASE_OFFS_IRIS3		0x000B0000
+#define WRAPPER_INTR_STATUS_IRIS3	(WRAPPER_BASE_OFFS_IRIS3 + 0x0C)
+#define WRAPPER_INTR_STATUS_A2HWD_BMSK_IRIS3	0x8
+#define WRAPPER_INTR_STATUS_A2H_BMSK_IRIS3	0x4
+
+#define WRAPPER_INTR_MASK_IRIS3		(WRAPPER_BASE_OFFS_IRIS3 + 0x10)
+#define WRAPPER_INTR_MASK_A2HWD_BMSK_IRIS3	0x8
+#define WRAPPER_INTR_MASK_A2HCPU_BMSK_IRIS3	0x4
+
+#define WRAPPER_CPU_CLOCK_CONFIG_IRIS3	(WRAPPER_BASE_OFFS_IRIS3 + 0x2000)
+#define WRAPPER_CPU_CGC_DIS_IRIS3	(WRAPPER_BASE_OFFS_IRIS3 + 0x2010)
+#define WRAPPER_CPU_STATUS_IRIS3	(WRAPPER_BASE_OFFS_IRIS3 + 0x2014)
+
+#define WRAPPER_DEBUG_BRIDGE_LPI_CONTROL_IRIS3	(WRAPPER_BASE_OFFS_IRIS3 + 0x54)
+#define WRAPPER_DEBUG_BRIDGE_LPI_STATUS_IRIS3	(WRAPPER_BASE_OFFS_IRIS3 + 0x58)
+#define WRAPPER_IRIS_CPU_NOC_LPI_CONTROL	(WRAPPER_BASE_OFFS_IRIS3 + 0x5C)
+#define WRAPPER_IRIS_CPU_NOC_LPI_STATUS		(WRAPPER_BASE_OFFS_IRIS3 + 0x60)
+#define WRAPPER_CORE_POWER_STATUS		(WRAPPER_BASE_OFFS_IRIS3 + 0x80)
+#define WRAPPER_CORE_CLOCK_CONFIG_IRIS3		(WRAPPER_BASE_OFFS_IRIS3 + 0x88)
+
+/*
+ * --------------------------------------------------------------------------
+ * MODULE: tz_wrapper
+ * --------------------------------------------------------------------------
+ */
+#define WRAPPER_TZ_BASE_OFFS	0x000C0000
+#define WRAPPER_TZ_CPU_CLOCK_CONFIG	(WRAPPER_TZ_BASE_OFFS)
+#define WRAPPER_TZ_CPU_STATUS	(WRAPPER_TZ_BASE_OFFS + 0x10)
+#define WRAPPER_TZ_CTL_AXI_CLOCK_CONFIG	(WRAPPER_TZ_BASE_OFFS + 0x14)
+#define WRAPPER_TZ_QNS4PDXFIFO_RESET	(WRAPPER_TZ_BASE_OFFS + 0x18)
+
+#define CTRL_INIT_IRIS3		CPU_CS_SCIACMD_IRIS3
+
+#define CTRL_STATUS_IRIS3	CPU_CS_SCIACMDARG0_IRIS3
+#define CTRL_ERROR_STATUS__M_IRIS3 \
+		CPU_CS_SCIACMDARG0_HFI_CTRL_ERROR_STATUS_BMSK_IRIS3
+#define CTRL_INIT_IDLE_MSG_BMSK_IRIS3 \
+		CPU_CS_SCIACMDARG0_HFI_CTRL_INIT_IDLE_MSG_BMSK_IRIS3
+#define CTRL_STATUS_PC_READY_IRIS3 \
+		CPU_CS_SCIACMDARG0_HFI_CTRL_PC_READY_IRIS3
+
+#define QTBL_INFO_IRIS3		CPU_CS_SCIACMDARG1_IRIS3
+
+#define QTBL_ADDR_IRIS3		CPU_CS_SCIACMDARG2_IRIS3
+
+#define VERSION_INFO_IRIS3	    CPU_CS_SCIACMDARG3_IRIS3
+
+#define SFR_ADDR_IRIS3		    CPU_CS_SCIBCMD_IRIS3
+#define MMAP_ADDR_IRIS3		CPU_CS_SCIBCMDARG0_IRIS3
+#define UC_REGION_ADDR_IRIS3	CPU_CS_SCIBARG1_IRIS3
+#define UC_REGION_SIZE_IRIS3	CPU_CS_SCIBARG2_IRIS3
+
+#define AON_WRAPPER_MVP_NOC_LPI_CONTROL	(AON_BASE_OFFS)
+#define AON_WRAPPER_MVP_NOC_LPI_STATUS	(AON_BASE_OFFS + 0x4)
+
+/*
+ * --------------------------------------------------------------------------
+ * MODULE: VCODEC_SS registers
+ * --------------------------------------------------------------------------
+ */
+#define VCODEC_SS_IDLE_STATUSN           (VCODEC_BASE_OFFS_IRIS3 + 0x70)
+
+/*
+ * --------------------------------------------------------------------------
+ * MODULE: vcodec noc error log registers (iris3)
+ * --------------------------------------------------------------------------
+ */
+#define VCODEC_NOC_VIDEO_A_NOC_BASE_OFFS		0x00010000
+#define VCODEC_NOC_ERL_MAIN_SWID_LOW			0x00011200
+#define VCODEC_NOC_ERL_MAIN_SWID_HIGH			0x00011204
+#define VCODEC_NOC_ERL_MAIN_MAINCTL_LOW			0x00011208
+#define VCODEC_NOC_ERL_MAIN_ERRVLD_LOW			0x00011210
+#define VCODEC_NOC_ERL_MAIN_ERRCLR_LOW			0x00011218
+#define VCODEC_NOC_ERL_MAIN_ERRLOG0_LOW			0x00011220
+#define VCODEC_NOC_ERL_MAIN_ERRLOG0_HIGH		0x00011224
+#define VCODEC_NOC_ERL_MAIN_ERRLOG1_LOW			0x00011228
+#define VCODEC_NOC_ERL_MAIN_ERRLOG1_HIGH		0x0001122C
+#define VCODEC_NOC_ERL_MAIN_ERRLOG2_LOW			0x00011230
+#define VCODEC_NOC_ERL_MAIN_ERRLOG2_HIGH		0x00011234
+#define VCODEC_NOC_ERL_MAIN_ERRLOG3_LOW			0x00011238
+#define VCODEC_NOC_ERL_MAIN_ERRLOG3_HIGH		0x0001123C
+
+static int __interrupt_init_iris3(struct msm_vidc_core *core)
+{
+	u32 mask_val = 0;
+	int rc = 0;
+
+	/* All interrupts should be disabled initially 0x1F6 : Reset value */
+	rc = __read_register(core, WRAPPER_INTR_MASK_IRIS3, &mask_val);
+	if (rc)
+		return rc;
+
+	/* Write 0 to unmask CPU and WD interrupts */
+	mask_val &= ~(WRAPPER_INTR_MASK_A2HWD_BMSK_IRIS3 |
+			WRAPPER_INTR_MASK_A2HCPU_BMSK_IRIS3);
+	rc = __write_register(core, WRAPPER_INTR_MASK_IRIS3, mask_val);
+	if (rc)
+		return rc;
+
+	return 0;
+}
+
+static int __setup_ucregion_memory_map_iris3(struct msm_vidc_core *core)
+{
+	u32 value;
+	int rc = 0;
+
+	value = (u32)core->iface_q_table.align_device_addr;
+	rc = __write_register(core, UC_REGION_ADDR_IRIS3, value);
+	if (rc)
+		return rc;
+
+	value = SHARED_QSIZE;
+	rc = __write_register(core, UC_REGION_SIZE_IRIS3, value);
+	if (rc)
+		return rc;
+
+	value = (u32)core->iface_q_table.align_device_addr;
+	rc = __write_register(core, QTBL_ADDR_IRIS3, value);
+	if (rc)
+		return rc;
+
+	rc = __write_register(core, QTBL_INFO_IRIS3, 0x01);
+	if (rc)
+		return rc;
+
+	/* update queues vaddr for debug purpose */
+	value = (u32)((u64)core->iface_q_table.align_virtual_addr);
+	rc = __write_register(core, CPU_CS_VCICMDARG0_IRIS3, value);
+	if (rc)
+		return rc;
+
+	value = (u32)((u64)core->iface_q_table.align_virtual_addr >> 32);
+	rc = __write_register(core, CPU_CS_VCICMDARG1_IRIS3, value);
+	if (rc)
+		return rc;
+
+	if (core->sfr.align_device_addr) {
+		value = (u32)core->sfr.align_device_addr + VIDEO_ARCH_LX;
+		rc = __write_register(core, SFR_ADDR_IRIS3, value);
+		if (rc)
+			return rc;
+	}
+
+	return 0;
+}
+
+static bool is_iris3_hw_power_collapsed(struct msm_vidc_core *core)
+{
+	int rc = 0;
+	u32 value = 0, pwr_status = 0;
+
+	rc = __read_register(core, WRAPPER_CORE_POWER_STATUS, &value);
+	if (rc)
+		return false;
+
+	/* if BIT(1) is 1 then video hw power is on else off */
+	pwr_status = value & BIT(1);
+	return pwr_status ? false : true;
+}
+
+static int __power_off_iris3_hardware(struct msm_vidc_core *core)
+{
+	int rc = 0, i;
+	u32 value = 0;
+	bool pwr_collapsed = false;
+
+	/*
+	 * Incase hw power control is enabled, for both CPU WD, video
+	 * hw unresponsive cases, check for power status to decide on
+	 * executing NOC reset sequence before disabling power. If there
+	 * is no CPU WD and hw power control is enabled, fw is expected
+	 * to power collapse video hw always.
+	 */
+	if (is_core_sub_state(core, CORE_SUBSTATE_FW_PWR_CTRL)) {
+		pwr_collapsed = is_iris3_hw_power_collapsed(core);
+		if (is_core_sub_state(core, CORE_SUBSTATE_CPU_WATCHDOG) ||
+		    is_core_sub_state(core, CORE_SUBSTATE_VIDEO_UNRESPONSIVE)) {
+			if (pwr_collapsed) {
+				d_vpr_e("%s: video hw power collapsed %s\n",
+					__func__, core->sub_state_name);
+				goto disable_power;
+			} else {
+				d_vpr_e("%s: video hw is power ON %s\n",
+					__func__, core->sub_state_name);
+			}
+		} else {
+			if (!pwr_collapsed)
+				d_vpr_e("%s: video hw is not power collapsed\n", __func__);
+
+			d_vpr_h("%s: disabling hw power\n", __func__);
+			goto disable_power;
+		}
+	}
+
+	/*
+	 * check to make sure core clock branch enabled else
+	 * we cannot read vcodec top idle register
+	 */
+	rc = __read_register(core, WRAPPER_CORE_CLOCK_CONFIG_IRIS3, &value);
+	if (rc)
+		return rc;
+
+	if (value) {
+		d_vpr_h("%s: core clock config not enabled, enabling it to read vcodec registers\n",
+			__func__);
+		rc = __write_register(core, WRAPPER_CORE_CLOCK_CONFIG_IRIS3, 0);
+		if (rc)
+			return rc;
+	}
+
+	/*
+	 * add MNoC idle check before collapsing MVS0 per HPG update
+	 * poll for NoC DMA idle -> HPG 6.1.1
+	 */
+	for (i = 0; i < core->capabilities[NUM_VPP_PIPE].value; i++) {
+		rc = __read_register_with_poll_timeout(core, VCODEC_SS_IDLE_STATUSN + 4 * i,
+						       0x400000, 0x400000, 2000, 20000);
+		if (rc)
+			d_vpr_h("%s: VCODEC_SS_IDLE_STATUSN (%d) is not idle (%#x)\n",
+				__func__, i, value);
+	}
+
+	/* Apply partial reset on MSF interface and wait for ACK */
+	rc = __write_register(core, AON_WRAPPER_MVP_NOC_RESET_REQ, 0x3);
+	if (rc)
+		return rc;
+
+	rc = __read_register_with_poll_timeout(core, AON_WRAPPER_MVP_NOC_RESET_ACK,
+					       0x3, 0x3, 200, 2000);
+	if (rc)
+		d_vpr_h("%s: AON_WRAPPER_MVP_NOC_RESET assert failed\n", __func__);
+
+	/* De-assert partial reset on MSF interface and wait for ACK */
+	rc = __write_register(core, AON_WRAPPER_MVP_NOC_RESET_REQ, 0x0);
+	if (rc)
+		return rc;
+
+	rc = __read_register_with_poll_timeout(core, AON_WRAPPER_MVP_NOC_RESET_ACK,
+					       0x3, 0x0, 200, 2000);
+	if (rc)
+		d_vpr_h("%s: AON_WRAPPER_MVP_NOC_RESET de-assert failed\n", __func__);
+
+	/*
+	 * Reset both sides of 2 ahb2ahb_bridges (TZ and non-TZ)
+	 * do we need to check status register here?
+	 */
+	rc = __write_register(core, CPU_CS_AHB_BRIDGE_SYNC_RESET, 0x3);
+	if (rc)
+		return rc;
+	rc = __write_register(core, CPU_CS_AHB_BRIDGE_SYNC_RESET, 0x2);
+	if (rc)
+		return rc;
+	rc = __write_register(core, CPU_CS_AHB_BRIDGE_SYNC_RESET, 0x0);
+	if (rc)
+		return rc;
+
+disable_power:
+	/* power down process */
+	rc = call_res_op(core, gdsc_off, core, "vcodec");
+	if (rc) {
+		d_vpr_e("%s: disable regulator vcodec failed\n", __func__);
+		rc = 0;
+	}
+
+	rc = call_res_op(core, clk_disable, core, "vcodec_clk");
+	if (rc) {
+		d_vpr_e("%s: disable unprepare vcodec_clk failed\n", __func__);
+		rc = 0;
+	}
+
+	return rc;
+}
+
+static int __power_off_iris3_controller(struct msm_vidc_core *core)
+{
+	int rc = 0;
+
+	/*
+	 * mask fal10_veto QLPAC error since fal10_veto can go 1
+	 * when pwwait == 0 and clamped to 0 -> HPG 6.1.2
+	 */
+	rc = __write_register(core, CPU_CS_X2RPMH_IRIS3, 0x3);
+	if (rc)
+		return rc;
+
+	/* set MNoC to low power, set PD_NOC_QREQ (bit 0) */
+	rc = __write_register_masked(core, AON_WRAPPER_MVP_NOC_LPI_CONTROL,
+				     0x1, BIT(0));
+	if (rc)
+		return rc;
+
+	rc = __read_register_with_poll_timeout(core, AON_WRAPPER_MVP_NOC_LPI_STATUS,
+					       0x1, 0x1, 200, 2000);
+	if (rc)
+		d_vpr_h("%s: AON_WRAPPER_MVP_NOC_LPI_CONTROL failed\n", __func__);
+
+	/* Set Iris CPU NoC to Low power */
+	rc = __write_register_masked(core, WRAPPER_IRIS_CPU_NOC_LPI_CONTROL,
+				     0x1, BIT(0));
+	if (rc)
+		return rc;
+
+	rc = __read_register_with_poll_timeout(core, WRAPPER_IRIS_CPU_NOC_LPI_STATUS,
+					       0x1, 0x1, 200, 2000);
+	if (rc)
+		d_vpr_h("%s: WRAPPER_IRIS_CPU_NOC_LPI_CONTROL failed\n", __func__);
+
+	/* Debug bridge LPI release */
+	rc = __write_register(core, WRAPPER_DEBUG_BRIDGE_LPI_CONTROL_IRIS3, 0x0);
+	if (rc)
+		return rc;
+
+	rc = __read_register_with_poll_timeout(core, WRAPPER_DEBUG_BRIDGE_LPI_STATUS_IRIS3,
+					       0xffffffff, 0x0, 200, 2000);
+	if (rc)
+		d_vpr_h("%s: debug bridge release failed\n", __func__);
+
+	/* Reset MVP QNS4PDXFIFO */
+	rc = __write_register(core, WRAPPER_TZ_CTL_AXI_CLOCK_CONFIG, 0x3);
+	if (rc)
+		return rc;
+
+	rc = __write_register(core, WRAPPER_TZ_QNS4PDXFIFO_RESET, 0x1);
+	if (rc)
+		return rc;
+
+	rc = __write_register(core, WRAPPER_TZ_QNS4PDXFIFO_RESET, 0x0);
+	if (rc)
+		return rc;
+
+	rc = __write_register(core, WRAPPER_TZ_CTL_AXI_CLOCK_CONFIG, 0x0);
+	if (rc)
+		return rc;
+
+	/* Turn off MVP MVS0C core clock */
+	rc = call_res_op(core, clk_disable, core, "core_clk");
+	if (rc) {
+		d_vpr_e("%s: disable unprepare core_clk failed\n", __func__);
+		rc = 0;
+	}
+
+	/* power down process */
+	rc = call_res_op(core, gdsc_off, core, "iris-ctl");
+	if (rc) {
+		d_vpr_e("%s: disable regulator iris-ctl failed\n", __func__);
+		rc = 0;
+	}
+
+	return rc;
+}
+
+static int __power_off_iris3(struct msm_vidc_core *core)
+{
+	int rc = 0;
+
+	if (!is_core_sub_state(core, CORE_SUBSTATE_POWER_ENABLE))
+		return 0;
+
+	rc = call_res_op(core, set_clks, core, 0);
+	if (rc)
+		d_vpr_e("%s: resetting clocks failed\n", __func__);
+
+	if (__power_off_iris3_hardware(core))
+		d_vpr_e("%s: failed to power off hardware\n", __func__);
+
+	if (__power_off_iris3_controller(core))
+		d_vpr_e("%s: failed to power off controller\n", __func__);
+
+	rc = call_res_op(core, set_bw, core, 0, 0);
+	if (rc)
+		d_vpr_e("%s: failed to unvote buses\n", __func__);
+
+	if (!call_iris_op(core, watchdog, core, core->intr_status))
+		disable_irq_nosync(core->resource->irq);
+
+	msm_vidc_change_core_sub_state(core, CORE_SUBSTATE_POWER_ENABLE, 0, __func__);
+
+	return rc;
+}
+
+static int __power_on_iris3_controller(struct msm_vidc_core *core)
+{
+	int rc = 0;
+
+	rc = call_res_op(core, gdsc_on, core, "iris-ctl");
+	if (rc)
+		goto fail_regulator;
+
+	rc = call_res_op(core, reset_bridge, core);
+	if (rc)
+		goto fail_reset_ahb2axi;
+
+	rc = call_res_op(core, clk_enable, core, "gcc_video_axi0");
+	if (rc)
+		goto fail_clk_axi;
+
+	rc = call_res_op(core, clk_enable, core, "core_clk");
+	if (rc)
+		goto fail_clk_controller;
+
+	return 0;
+
+fail_clk_controller:
+	call_res_op(core, clk_disable, core, "gcc_video_axi0");
+fail_clk_axi:
+fail_reset_ahb2axi:
+	call_res_op(core, gdsc_off, core, "iris-ctl");
+fail_regulator:
+	return rc;
+}
+
+static int __power_on_iris3_hardware(struct msm_vidc_core *core)
+{
+	int rc = 0;
+
+	rc = call_res_op(core, gdsc_on, core, "vcodec");
+	if (rc)
+		goto fail_regulator;
+
+	rc = call_res_op(core, clk_enable, core, "vcodec_clk");
+	if (rc)
+		goto fail_clk_controller;
+
+	return 0;
+
+fail_clk_controller:
+	call_res_op(core, gdsc_off, core, "vcodec");
+fail_regulator:
+	return rc;
+}
+
+static int __power_on_iris3(struct msm_vidc_core *core)
+{
+	struct frequency_table *freq_tbl;
+	u32 freq = 0;
+	int rc = 0;
+
+	if (is_core_sub_state(core, CORE_SUBSTATE_POWER_ENABLE))
+		return 0;
+
+	if (!core_in_valid_state(core)) {
+		d_vpr_e("%s: invalid core state %s\n",
+			__func__, core_state_name(core->state));
+		return -EINVAL;
+	}
+
+	/* Vote for all hardware resources */
+	rc = call_res_op(core, set_bw, core, INT_MAX, INT_MAX);
+	if (rc) {
+		d_vpr_e("%s: failed to vote buses, rc %d\n", __func__, rc);
+		goto fail_vote_buses;
+	}
+
+	rc = __power_on_iris3_controller(core);
+	if (rc) {
+		d_vpr_e("%s: failed to power on iris3 controller\n", __func__);
+		goto fail_power_on_controller;
+	}
+
+	rc = __power_on_iris3_hardware(core);
+	if (rc) {
+		d_vpr_e("%s: failed to power on iris3 hardware\n", __func__);
+		goto fail_power_on_hardware;
+	}
+	/* video controller and hardware powered on successfully */
+	rc = msm_vidc_change_core_sub_state(core, 0, CORE_SUBSTATE_POWER_ENABLE, __func__);
+	if (rc)
+		goto fail_power_on_substate;
+
+	freq_tbl = core->resource->freq_set.freq_tbl;
+	freq = core->power.clk_freq ? core->power.clk_freq :
+				      freq_tbl[0].freq;
+
+	rc = call_res_op(core, set_clks, core, freq);
+	if (rc) {
+		d_vpr_e("%s: failed to scale clocks\n", __func__);
+		rc = 0;
+	}
+	/*
+	 * Re-program all of the registers that get reset as a result of
+	 * regulator_disable() and _enable()
+	 */
+	__set_registers(core);
+
+	__interrupt_init_iris3(core);
+	core->intr_status = 0;
+	enable_irq(core->resource->irq);
+
+	return rc;
+
+fail_power_on_substate:
+	__power_off_iris3_hardware(core);
+fail_power_on_hardware:
+	__power_off_iris3_controller(core);
+fail_power_on_controller:
+	call_res_op(core, set_bw, core, 0, 0);
+fail_vote_buses:
+	msm_vidc_change_core_sub_state(core, CORE_SUBSTATE_POWER_ENABLE, 0, __func__);
+	return rc;
+}
+
+static int __prepare_pc_iris3(struct msm_vidc_core *core)
+{
+	int rc = 0;
+	u32 wfi_status = 0, idle_status = 0, pc_ready = 0;
+	u32 ctrl_status = 0;
+
+	rc = __read_register(core, CTRL_STATUS_IRIS3, &ctrl_status);
+	if (rc)
+		return rc;
+
+	pc_ready = ctrl_status & CTRL_STATUS_PC_READY_IRIS3;
+	idle_status = ctrl_status & BIT(30);
+
+	if (pc_ready) {
+		d_vpr_h("Already in pc_ready state\n");
+		return 0;
+	}
+	rc = __read_register(core, WRAPPER_TZ_CPU_STATUS, &wfi_status);
+	if (rc)
+		return rc;
+
+	wfi_status &= BIT(0);
+	if (!wfi_status || !idle_status) {
+		d_vpr_e("Skipping PC, wfi status not set\n");
+		goto skip_power_off;
+	}
+
+	rc = __prepare_pc(core);
+	if (rc) {
+		d_vpr_e("Failed __prepare_pc %d\n", rc);
+		goto skip_power_off;
+	}
+
+	rc = __read_register_with_poll_timeout(core, CTRL_STATUS_IRIS3,
+					       CTRL_STATUS_PC_READY_IRIS3,
+					       CTRL_STATUS_PC_READY_IRIS3, 250, 2500);
+	if (rc) {
+		d_vpr_e("%s: Skip PC. Ctrl status not set\n", __func__);
+		goto skip_power_off;
+	}
+
+	rc = __read_register_with_poll_timeout(core, WRAPPER_TZ_CPU_STATUS,
+					       BIT(0), 0x1, 250, 2500);
+	if (rc) {
+		d_vpr_e("%s: Skip PC. Wfi status not set\n", __func__);
+		goto skip_power_off;
+	}
+	return rc;
+
+skip_power_off:
+	rc = __read_register(core, CTRL_STATUS_IRIS3, &ctrl_status);
+	if (rc)
+		return rc;
+	rc = __read_register(core, WRAPPER_TZ_CPU_STATUS, &wfi_status);
+	if (rc)
+		return rc;
+	wfi_status &= BIT(0);
+	d_vpr_e("Skip PC, wfi=%#x, idle=%#x, pcr=%#x, ctrl=%#x)\n",
+		wfi_status, idle_status, pc_ready, ctrl_status);
+	return -EAGAIN;
+}
+
+static int __raise_interrupt_iris3(struct msm_vidc_core *core)
+{
+	int rc = 0;
+
+	rc = __write_register(core, CPU_IC_SOFTINT_IRIS3, 1 << CPU_IC_SOFTINT_H2A_SHFT_IRIS3);
+	if (rc)
+		return rc;
+
+	return 0;
+}
+
+static int __watchdog_iris3(struct msm_vidc_core *core, u32 intr_status)
+{
+	int rc = 0;
+
+	if (intr_status & WRAPPER_INTR_STATUS_A2HWD_BMSK_IRIS3) {
+		d_vpr_e("%s: received watchdog interrupt\n", __func__);
+		rc = 1;
+	}
+
+	return rc;
+}
+
+static int __clear_interrupt_iris3(struct msm_vidc_core *core)
+{
+	u32 intr_status = 0, mask = 0;
+	int rc = 0;
+
+	rc = __read_register(core, WRAPPER_INTR_STATUS_IRIS3, &intr_status);
+	if (rc)
+		return rc;
+
+	mask = (WRAPPER_INTR_STATUS_A2H_BMSK_IRIS3 |
+		WRAPPER_INTR_STATUS_A2HWD_BMSK_IRIS3 |
+		CTRL_INIT_IDLE_MSG_BMSK_IRIS3);
+
+	if (intr_status & mask) {
+		core->intr_status |= intr_status;
+		core->reg_count++;
+		d_vpr_l("INTERRUPT: times: %d interrupt_status: %d\n",
+			core->reg_count, intr_status);
+	} else {
+		core->spur_count++;
+	}
+
+	rc = __write_register(core, CPU_CS_A2HSOFTINTCLR_IRIS3, 1);
+	if (rc)
+		return rc;
+
+	return 0;
+}
+
+static int __boot_firmware_iris3(struct msm_vidc_core *core)
+{
+	int rc = 0;
+	u32 ctrl_init_val = 0, ctrl_status = 0, count = 0, max_tries = 1000;
+
+	rc = __setup_ucregion_memory_map_iris3(core);
+	if (rc)
+		return rc;
+
+	ctrl_init_val = BIT(0);
+
+	rc = __write_register(core, CTRL_INIT_IRIS3, ctrl_init_val);
+	if (rc)
+		return rc;
+
+	while (!ctrl_status && count < max_tries) {
+		rc = __read_register(core, CTRL_STATUS_IRIS3, &ctrl_status);
+		if (rc)
+			return rc;
+
+		if ((ctrl_status & CTRL_ERROR_STATUS__M_IRIS3) == 0x4) {
+			d_vpr_e("invalid setting for UC_REGION\n");
+			break;
+		}
+
+		usleep_range(50, 100);
+		count++;
+	}
+
+	if (count >= max_tries) {
+		d_vpr_e("Error booting up vidc firmware\n");
+		return -ETIME;
+	}
+
+	/* Enable interrupt before sending commands to venus */
+	rc = __write_register(core, CPU_CS_H2XSOFTINTEN_IRIS3, 0x1);
+	if (rc)
+		return rc;
+
+	rc = __write_register(core, CPU_CS_X2RPMH_IRIS3, 0x0);
+
+	return rc;
+}
+
+int msm_vidc_decide_work_mode_iris3(struct msm_vidc_inst *inst)
+{
+	u32 work_mode;
+	struct v4l2_format *inp_f;
+	u32 width, height;
+	bool res_ok = false;
+
+	work_mode = MSM_VIDC_STAGE_2;
+	inp_f = &inst->fmts[INPUT_PORT];
+
+	if (is_decode_session(inst)) {
+		height = inp_f->fmt.pix_mp.height;
+		width = inp_f->fmt.pix_mp.width;
+		res_ok = res_is_less_than(width, height, 1280, 720);
+		if (inst->capabilities[CODED_FRAMES].value ==
+				CODED_FRAMES_INTERLACE || res_ok) {
+			work_mode = MSM_VIDC_STAGE_1;
+		}
+	} else if (is_encode_session(inst)) {
+		height = inst->crop.height;
+		width = inst->crop.width;
+		res_ok = !res_is_greater_than(width, height, 4096, 2160);
+		if (inst->capabilities[SLICE_MODE].value ==
+			V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_MAX_BYTES) {
+			work_mode = MSM_VIDC_STAGE_1;
+		}
+		if (inst->capabilities[LOSSLESS].value)
+			work_mode = MSM_VIDC_STAGE_2;
+
+		if (!inst->capabilities[GOP_SIZE].value)
+			work_mode = MSM_VIDC_STAGE_2;
+	} else {
+		i_vpr_e(inst, "%s: invalid session type\n", __func__);
+		return -EINVAL;
+	}
+
+	i_vpr_h(inst, "Configuring work mode = %u gop size = %u\n",
+		work_mode, inst->capabilities[GOP_SIZE].value);
+	msm_vidc_update_cap_value(inst, STAGE, work_mode, __func__);
+
+	return 0;
+}
+
+int msm_vidc_decide_work_route_iris3(struct msm_vidc_inst *inst)
+{
+	u32 work_route;
+	struct msm_vidc_core *core;
+
+	core = inst->core;
+	work_route = core->capabilities[NUM_VPP_PIPE].value;
+
+	if (is_decode_session(inst)) {
+		if (inst->capabilities[CODED_FRAMES].value ==
+				CODED_FRAMES_INTERLACE)
+			work_route = MSM_VIDC_PIPE_1;
+	} else if (is_encode_session(inst)) {
+		u32 slice_mode;
+
+		slice_mode = inst->capabilities[SLICE_MODE].value;
+
+		/*TODO Pipe=1 for legacy CBR*/
+		if (slice_mode == V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_MAX_BYTES)
+			work_route = MSM_VIDC_PIPE_1;
+
+	} else {
+		i_vpr_e(inst, "%s: invalid session type\n", __func__);
+		return -EINVAL;
+	}
+
+	i_vpr_h(inst, "Configuring work route = %u", work_route);
+	msm_vidc_update_cap_value(inst, PIPE, work_route, __func__);
+
+	return 0;
+}
+
+int msm_vidc_decide_quality_mode_iris3(struct msm_vidc_inst *inst)
+{
+	struct msm_vidc_core *core;
+	u32 mbpf, mbps, max_hq_mbpf, max_hq_mbps;
+	u32 mode = MSM_VIDC_POWER_SAVE_MODE;
+
+	if (!is_encode_session(inst))
+		return 0;
+
+	/* lossless or all intra runs at quality mode */
+	if (inst->capabilities[LOSSLESS].value ||
+	    inst->capabilities[ALL_INTRA].value) {
+		mode = MSM_VIDC_MAX_QUALITY_MODE;
+		goto decision_done;
+	}
+
+	mbpf = msm_vidc_get_mbs_per_frame(inst);
+	mbps = mbpf * msm_vidc_get_fps(inst);
+	core = inst->core;
+	max_hq_mbpf = core->capabilities[MAX_MBPF_HQ].value;
+	max_hq_mbps = core->capabilities[MAX_MBPS_HQ].value;
+
+	if (mbpf <= max_hq_mbpf && mbps <= max_hq_mbps)
+		mode = MSM_VIDC_MAX_QUALITY_MODE;
+
+decision_done:
+	msm_vidc_update_cap_value(inst, QUALITY_MODE, mode, __func__);
+
+	return 0;
+}
+
+int msm_vidc_adjust_bitrate_boost_iris3(void *instance, struct v4l2_ctrl *ctrl)
+{
+	s32 adjusted_value;
+	struct msm_vidc_inst *inst = (struct msm_vidc_inst *)instance;
+	s32 rc_type = -1;
+	u32 width, height, frame_rate;
+	struct v4l2_format *f;
+	u32 max_bitrate = 0, bitrate = 0;
+
+	adjusted_value = ctrl ? ctrl->val :
+		inst->capabilities[BITRATE_BOOST].value;
+
+	if (inst->bufq[OUTPUT_PORT].vb2q->streaming)
+		return 0;
+
+	if (msm_vidc_get_parent_value(inst, BITRATE_BOOST,
+				      BITRATE_MODE, &rc_type, __func__))
+		return -EINVAL;
+
+	/*
+	 * Bitrate Boost are supported only for VBR rc type.
+	 * Hence, do not adjust or set to firmware for non VBR rc's
+	 */
+	if (rc_type != HFI_RC_VBR_CFR) {
+		adjusted_value = 0;
+		goto adjust;
+	}
+
+	frame_rate = inst->capabilities[FRAME_RATE].value >> 16;
+	f = &inst->fmts[OUTPUT_PORT];
+	width = f->fmt.pix_mp.width;
+	height = f->fmt.pix_mp.height;
+
+	/*
+	 * honor client set bitrate boost
+	 * if client did not set, keep max bitrate boost up to 4k@60fps
+	 * and remove bitrate boost after 4k@60fps
+	 */
+	if (inst->capabilities[BITRATE_BOOST].flags & CAP_FLAG_CLIENT_SET) {
+		/* accept client set bitrate boost value as is */
+	} else {
+		if (res_is_less_than_or_equal_to(width, height, 4096, 2176) &&
+		    frame_rate <= 60)
+			adjusted_value = MAX_BITRATE_BOOST;
+		else
+			adjusted_value = 0;
+	}
+
+	max_bitrate = msm_vidc_get_max_bitrate(inst);
+	bitrate = inst->capabilities[BIT_RATE].value;
+	if (adjusted_value) {
+		if ((bitrate + bitrate / (100 / adjusted_value)) > max_bitrate) {
+			i_vpr_h(inst,
+				"%s: bitrate %d is beyond max bitrate %d, remove bitrate boost\n",
+				__func__, max_bitrate, bitrate);
+			adjusted_value = 0;
+		}
+	}
+adjust:
+	msm_vidc_update_cap_value(inst, BITRATE_BOOST, adjusted_value, __func__);
+
+	return 0;
+}
+
+static struct msm_vidc_iris_ops iris3_ops = {
+	.boot_firmware = __boot_firmware_iris3,
+	.raise_interrupt = __raise_interrupt_iris3,
+	.clear_interrupt = __clear_interrupt_iris3,
+	.power_on = __power_on_iris3,
+	.power_off = __power_off_iris3,
+	.prepare_pc = __prepare_pc_iris3,
+	.watchdog = __watchdog_iris3,
+};
+
+static struct msm_vidc_session_ops msm_session_ops = {
+	.buffer_size = msm_buffer_size_iris3,
+	.min_count = msm_buffer_min_count_iris3,
+	.extra_count = msm_buffer_extra_count_iris3,
+	.calc_freq = msm_vidc_calc_freq_iris3,
+	.calc_bw = msm_vidc_calc_bw_iris3,
+	.decide_work_route = msm_vidc_decide_work_route_iris3,
+	.decide_work_mode = msm_vidc_decide_work_mode_iris3,
+	.decide_quality_mode = msm_vidc_decide_quality_mode_iris3,
+};
+
+int msm_vidc_init_iris3(struct msm_vidc_core *core)
+{
+	core->iris_ops = &iris3_ops;
+	core->session_ops = &msm_session_ops;
+
+	return 0;
+}
-- 
2.7.4

