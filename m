Return-Path: <linux-media+bounces-23292-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97DF89EE59F
	for <lists+linux-media@lfdr.de>; Thu, 12 Dec 2024 12:54:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 406BD283451
	for <lists+linux-media@lfdr.de>; Thu, 12 Dec 2024 11:54:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BA3F213E70;
	Thu, 12 Dec 2024 11:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="lswbx0QC"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 912EC2139D2;
	Thu, 12 Dec 2024 11:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734004338; cv=none; b=PgFq4PRpbaeSrRULt5PvqArDGgl6tFf9zL+jTWdmkaL1P/AkQn0MokUraCcovFYzNEYw5bgQ5c+ZSHnKY0m3a2wwS38Gn3XHfXh5Als3dpVE4/xEjx2jUBZfQfj/knlGKwWBmsVIGCX8yTCsgf2JEhVGhMorgtR1xgyZ7Z9zX2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734004338; c=relaxed/simple;
	bh=U4rLSTvaf3EQwiJNpLPb32i6+4dBk6MqB8EsHfCHjq8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=g77wUBDj4meX9EZZr4qfX+XP7fuIEuFgK2SOSYQ/jQ+OBrSxNWRXkmcu5KxRJnqlq0p0d+RAQOT2mGlMNlyfjmXuR20UkF2Cm3GLO+jc6WZHICUOEXMLgoVgd6yNA6XtkQ3P9BBQ2A3hmGWzDmdk+EMplhaH1lRwLpT6OSu8P9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=lswbx0QC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BC8N9kU015022;
	Thu, 12 Dec 2024 11:52:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QSpkp0ZMDadE2LXuEndIlwoOvM2aQk9WreK9B8eOPV0=; b=lswbx0QC4G1hzdgZ
	qV20nGosh+wDN2WiXrPSpz+38OVyvQOa/UeKtPeYXW2UHTcMXPGWG4NCCkcO8/95
	l1ZxfBS0F74PQ/N2P4jZ3g0Ro89oNDiKJdrA7Rsm1ONDoW/IPtmK+/3KqZqZgA5c
	bOSLxmMSVunA5Xh/ih6ovLpk3nKl3Uw+Qy8hjDksRkceeLOuHf5OJbefIkC9fIlj
	Sx5rOf/yJgKwyjSiijZiB8F0Vyjk3+9a0eFxFMMaWn/nsCyodyv5x5miuxqmfuk2
	KoowGht5f0U7QMqajRPqIS6Y5vTebbCOFqiTNhpygXf3+/w0CRJ9TmtuBlRbPUQy
	HhA4MQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43f7dpm1n5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Dec 2024 11:52:06 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BCBq5Qj011400
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Dec 2024 11:52:05 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 12 Dec 2024 03:51:59 -0800
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Thu, 12 Dec 2024 17:21:26 +0530
Subject: [PATCH v9 04/28] media: iris: introduce iris core state management
 with shared queues
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241212-qcom-video-iris-v9-4-e8c2c6bd4041@quicinc.com>
References: <20241212-qcom-video-iris-v9-0-e8c2c6bd4041@quicinc.com>
In-Reply-To: <20241212-qcom-video-iris-v9-0-e8c2c6bd4041@quicinc.com>
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
CC: Hans Verkuil <hverkuil@xs4all.nl>,
        Sebastian Fricke
	<sebastian.fricke@collabora.com>,
        Bryan O'Donoghue
	<bryan.odonoghue@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Nicolas Dufresne
	<nicolas@ndufresne.ca>,
        =?utf-8?q?Uwe_Kleine-K=C3=B6nig?=
	<u.kleine-koenig@baylibre.com>,
        Jianhua Lu <lujianhua000@gmail.com>,
        "Stefan
 Schmidt" <stefan.schmidt@linaro.org>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734004294; l=21085;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=U4rLSTvaf3EQwiJNpLPb32i6+4dBk6MqB8EsHfCHjq8=;
 b=fghY/LIhptVwrr+M5wbh5Yc/r0Oj+48jk4n2s7QFjLevJsRJE9rDBYtuihCVoLw1o7h+7yAce
 Oj8Wwom9K2dCpIz4NyRdpISaSb5Q0ONzaiD+bQUcxp0YgKmgu77iwih
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: GClm0hcO10PDG0iXn5peE3qTaxBL2rN7
X-Proofpoint-ORIG-GUID: GClm0hcO10PDG0iXn5peE3qTaxBL2rN7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 clxscore=1015
 mlxlogscore=999 mlxscore=0 adultscore=0 bulkscore=0 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412120085

Introduce core state management for iris driver with necessary queues
needed for host firmware communication.

There are 3 types of queues:
Command queue - driver to write any command to firmware.
Message queue - firmware to send any response to driver.
Debug queue - firmware to write debug messages.
Initialize and configire shared queues during probe.

Different states for core:
IRIS_CORE_DEINIT - default state.
IRIS_CORE_INIT - core state with core initialized. FW loaded and HW
brought out of reset, shared queues established between host driver and
firmware.
IRIS_CORE_ERROR - error state.
      -----------
           |
           V
       -----------
       | DEINIT  |
       -----------
           ^
          / \
         /   \
        /     \
       /       \
      v         v
 -----------   ----------.
 |  INIT  |-->|  ERROR  |
 -----------   ----------.

Tested-by: Stefan Schmidt <stefan.schmidt@linaro.org> # x1e80100 (Dell
Reviewed-by: Stefan Schmidt <stefan.schmidt@linaro.org>
Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/iris/Makefile          |   4 +-
 drivers/media/platform/qcom/iris/iris_core.c       |  46 ++++++
 drivers/media/platform/qcom/iris/iris_core.h       |  23 +++
 drivers/media/platform/qcom/iris/iris_hfi_queue.c  | 123 ++++++++++++++
 drivers/media/platform/qcom/iris/iris_hfi_queue.h  | 177 +++++++++++++++++++++
 .../platform/qcom/iris/iris_platform_common.h      |   1 +
 .../platform/qcom/iris/iris_platform_sm8550.c      |   1 +
 drivers/media/platform/qcom/iris/iris_probe.c      |  19 +++
 drivers/media/platform/qcom/iris/iris_state.h      |  41 +++++
 drivers/media/platform/qcom/iris/iris_vidc.c       |   6 +
 10 files changed, 440 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
index 6de584090a3a..93711f108a77 100644
--- a/drivers/media/platform/qcom/iris/Makefile
+++ b/drivers/media/platform/qcom/iris/Makefile
@@ -1,5 +1,7 @@
-iris-objs += iris_hfi_gen1_command.o \
+iris-objs += iris_core.o \
+             iris_hfi_gen1_command.o \
              iris_hfi_gen2_command.o \
+             iris_hfi_queue.o \
              iris_platform_sm8550.o \
              iris_probe.o \
              iris_vidc.o \
diff --git a/drivers/media/platform/qcom/iris/iris_core.c b/drivers/media/platform/qcom/iris/iris_core.c
new file mode 100644
index 000000000000..360a54909ef6
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_core.c
@@ -0,0 +1,46 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include "iris_core.h"
+#include "iris_state.h"
+
+void iris_core_deinit(struct iris_core *core)
+{
+	mutex_lock(&core->lock);
+	iris_hfi_queues_deinit(core);
+	core->state = IRIS_CORE_DEINIT;
+	mutex_unlock(&core->lock);
+}
+
+int iris_core_init(struct iris_core *core)
+{
+	int ret;
+
+	mutex_lock(&core->lock);
+	if (core->state == IRIS_CORE_INIT) {
+		ret = 0;
+		goto exit;
+	} else if (core->state == IRIS_CORE_ERROR) {
+		ret = -EINVAL;
+		goto error;
+	}
+
+	core->state = IRIS_CORE_INIT;
+
+	ret = iris_hfi_queues_init(core);
+	if (ret)
+		goto error;
+
+	mutex_unlock(&core->lock);
+
+	return 0;
+
+error:
+	core->state = IRIS_CORE_DEINIT;
+exit:
+	mutex_unlock(&core->lock);
+
+	return ret;
+}
diff --git a/drivers/media/platform/qcom/iris/iris_core.h b/drivers/media/platform/qcom/iris/iris_core.h
index aebb4eba7e15..516082aa58c9 100644
--- a/drivers/media/platform/qcom/iris/iris_core.h
+++ b/drivers/media/platform/qcom/iris/iris_core.h
@@ -9,7 +9,9 @@
 #include <linux/types.h>
 #include <media/v4l2-device.h>
 
+#include "iris_hfi_queue.h"
 #include "iris_platform_common.h"
+#include "iris_state.h"
 
 struct icc_info {
 	const char		*name;
@@ -34,6 +36,15 @@ struct icc_info {
  * @clk_count: count of iris clocks
  * @resets: table of iris reset clocks
  * @iris_platform_data: a structure for platform data
+ * @state: current state of core
+ * @iface_q_table_daddr: device address for interface queue table memory
+ * @sfr_daddr: device address for SFR (Sub System Failure Reason) register memory
+ * @iface_q_table_vaddr: virtual address for interface queue table memory
+ * @sfr_vaddr: virtual address for SFR (Sub System Failure Reason) register memory
+ * @command_queue: shared interface queue to send commands to firmware
+ * @message_queue: shared interface queue to receive responses from firmware
+ * @debug_queue: shared interface queue to receive debug info from firmware
+ * @lock: a lock for this strucure
  */
 
 struct iris_core {
@@ -51,6 +62,18 @@ struct iris_core {
 	u32					clk_count;
 	struct reset_control_bulk_data		*resets;
 	const struct iris_platform_data		*iris_platform_data;
+	enum iris_core_state			state;
+	dma_addr_t				iface_q_table_daddr;
+	dma_addr_t				sfr_daddr;
+	void					*iface_q_table_vaddr;
+	void					*sfr_vaddr;
+	struct iris_iface_q_info		command_queue;
+	struct iris_iface_q_info		message_queue;
+	struct iris_iface_q_info		debug_queue;
+	struct mutex				lock; /* lock for core related operations */
 };
 
+int iris_core_init(struct iris_core *core);
+void iris_core_deinit(struct iris_core *core);
+
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_queue.c b/drivers/media/platform/qcom/iris/iris_hfi_queue.c
new file mode 100644
index 000000000000..bb7e0d747f0f
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_hfi_queue.c
@@ -0,0 +1,123 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include "iris_core.h"
+#include "iris_hfi_queue.h"
+
+static void iris_hfi_queue_set_header(struct iris_core *core, u32 queue_id,
+				      struct iris_iface_q_info *iface_q)
+{
+	iface_q->qhdr->status = 0x1;
+	iface_q->qhdr->start_addr = iface_q->device_addr;
+	iface_q->qhdr->header_type = IFACEQ_DFLT_QHDR;
+	iface_q->qhdr->queue_type = queue_id;
+	iface_q->qhdr->q_size = IFACEQ_QUEUE_SIZE / sizeof(u32);
+	iface_q->qhdr->pkt_size = 0; /* variable packet size */
+	iface_q->qhdr->rx_wm = 0x1;
+	iface_q->qhdr->tx_wm = 0x1;
+	iface_q->qhdr->rx_req = 0x1;
+	iface_q->qhdr->tx_req = 0x0;
+	iface_q->qhdr->rx_irq_status = 0x0;
+	iface_q->qhdr->tx_irq_status = 0x0;
+	iface_q->qhdr->read_idx = 0x0;
+	iface_q->qhdr->write_idx = 0x0;
+
+	/*
+	 * Set receive request to zero on debug queue as there is no
+	 * need of interrupt from video hardware for debug messages
+	 */
+	if (queue_id == IFACEQ_DBGQ_ID)
+		iface_q->qhdr->rx_req = 0;
+}
+
+static void
+iris_hfi_queue_init(struct iris_core *core, u32 queue_id, struct iris_iface_q_info *iface_q)
+{
+	struct iris_hfi_queue_table_header *q_tbl_hdr = core->iface_q_table_vaddr;
+	u32 offset = sizeof(*q_tbl_hdr) + (queue_id * IFACEQ_QUEUE_SIZE);
+
+	iface_q->device_addr = core->iface_q_table_daddr + offset;
+	iface_q->kernel_vaddr =
+			(void *)((char *)core->iface_q_table_vaddr + offset);
+	iface_q->qhdr = &q_tbl_hdr->q_hdr[queue_id];
+
+	iris_hfi_queue_set_header(core, queue_id, iface_q);
+}
+
+static void iris_hfi_queue_deinit(struct iris_iface_q_info *iface_q)
+{
+	iface_q->qhdr = NULL;
+	iface_q->kernel_vaddr = NULL;
+	iface_q->device_addr = 0;
+}
+
+int iris_hfi_queues_init(struct iris_core *core)
+{
+	struct iris_hfi_queue_table_header *q_tbl_hdr;
+	u32 queue_size;
+
+	/* Iris hardware requires 4K queue alignment */
+	queue_size = ALIGN((sizeof(*q_tbl_hdr) + (IFACEQ_QUEUE_SIZE * IFACEQ_NUMQ)), SZ_4K);
+	core->iface_q_table_vaddr = dma_alloc_attrs(core->dev, queue_size,
+						    &core->iface_q_table_daddr,
+						    GFP_KERNEL, DMA_ATTR_WRITE_COMBINE);
+	if (!core->iface_q_table_vaddr) {
+		dev_err(core->dev, "queues alloc and map failed\n");
+		return -ENOMEM;
+	}
+
+	core->sfr_vaddr = dma_alloc_attrs(core->dev, SFR_SIZE,
+					  &core->sfr_daddr,
+					  GFP_KERNEL, DMA_ATTR_WRITE_COMBINE);
+	if (!core->sfr_vaddr) {
+		dev_err(core->dev, "sfr alloc and map failed\n");
+		dma_free_attrs(core->dev, sizeof(*q_tbl_hdr), core->iface_q_table_vaddr,
+			       core->iface_q_table_daddr, DMA_ATTR_WRITE_COMBINE);
+		return -ENOMEM;
+	}
+
+	iris_hfi_queue_init(core, IFACEQ_CMDQ_ID, &core->command_queue);
+	iris_hfi_queue_init(core, IFACEQ_MSGQ_ID, &core->message_queue);
+	iris_hfi_queue_init(core, IFACEQ_DBGQ_ID, &core->debug_queue);
+
+	q_tbl_hdr = (struct iris_hfi_queue_table_header *)core->iface_q_table_vaddr;
+	q_tbl_hdr->version = 0;
+	q_tbl_hdr->device_addr = (void *)core;
+	strscpy(q_tbl_hdr->name, "iris-hfi-queues", sizeof(q_tbl_hdr->name));
+	q_tbl_hdr->size = sizeof(*q_tbl_hdr);
+	q_tbl_hdr->qhdr0_offset = sizeof(*q_tbl_hdr) -
+		(IFACEQ_NUMQ * sizeof(struct iris_hfi_queue_header));
+	q_tbl_hdr->qhdr_size = sizeof(q_tbl_hdr->q_hdr[0]);
+	q_tbl_hdr->num_q = IFACEQ_NUMQ;
+	q_tbl_hdr->num_active_q = IFACEQ_NUMQ;
+
+	 /* Write sfr size in first word to be used by firmware */
+	*((u32 *)core->sfr_vaddr) = SFR_SIZE;
+
+	return 0;
+}
+
+void iris_hfi_queues_deinit(struct iris_core *core)
+{
+	if (!core->iface_q_table_vaddr)
+		return;
+
+	iris_hfi_queue_deinit(&core->debug_queue);
+	iris_hfi_queue_deinit(&core->message_queue);
+	iris_hfi_queue_deinit(&core->command_queue);
+
+	dma_free_attrs(core->dev, SFR_SIZE, core->sfr_vaddr,
+		       core->sfr_daddr, DMA_ATTR_WRITE_COMBINE);
+
+	core->sfr_vaddr = NULL;
+	core->sfr_daddr = 0;
+
+	dma_free_attrs(core->dev, sizeof(struct iris_hfi_queue_table_header),
+		       core->iface_q_table_vaddr, core->iface_q_table_daddr,
+		       DMA_ATTR_WRITE_COMBINE);
+
+	core->iface_q_table_vaddr = NULL;
+	core->iface_q_table_daddr = 0;
+}
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_queue.h b/drivers/media/platform/qcom/iris/iris_hfi_queue.h
new file mode 100644
index 000000000000..99a3b83d063f
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_hfi_queue.h
@@ -0,0 +1,177 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef __IRIS_HFI_QUEUE_H__
+#define __IRIS_HFI_QUEUE_H__
+
+struct iris_core;
+
+/*
+ * Max 64 Buffers ( 32 input buffers and 32 output buffers)
+ * can be queued by v4l2 framework at any given time.
+ */
+#define IFACEQ_MAX_BUF_COUNT		64
+/*
+ * Max session supported are 16.
+ * this value is used to calcualte the size of
+ * individual shared queue.
+ */
+#define IFACE_MAX_PARALLEL_SESSIONS	16
+#define IFACEQ_DFLT_QHDR		0x0101
+#define IFACEQ_MAX_PKT_SIZE		1024 /* Maximum size of a packet in the queue */
+
+/*
+ * SFR: Subsystem Failure Reason
+ * when hardware goes into bad state/failure, firmware fills this memory
+ * and driver will get to know the actual failure reason from this SFR buffer.
+ */
+#define SFR_SIZE			SZ_4K /* Iris hardware requires 4K queue alignment */
+
+#define IFACEQ_QUEUE_SIZE		(IFACEQ_MAX_PKT_SIZE * \
+					 IFACEQ_MAX_BUF_COUNT * IFACE_MAX_PARALLEL_SESSIONS)
+
+/*
+ * Memory layout of the shared queues:
+ *
+ *   ||=================||  ^        ^         ^
+ *   ||                 ||  |        |         |
+ *   ||    Queue Table  || 288 Bytes |         |
+ *   ||      Header     ||  |        |         |
+ *   ||                 ||  |        |         |
+ *   ||-----------------||  V        |         |
+ *   ||-----------------||  ^        |         |
+ *   ||                 ||  |        |         |
+ *   ||  Command Queue  || 56 Bytes  |         |
+ *   ||     Header      ||  |        |         |
+ *   ||                 ||  |        |         |
+ *   ||-----------------||  V       456 Bytes  |
+ *   ||-----------------||  ^        |         |
+ *   ||                 ||  |        |         |
+ *   ||  Message Queue  || 56 Bytes  |         |
+ *   ||     Header      ||  |        |         |
+ *   ||                 ||  |        |         |
+ *   ||-----------------||  V        |         Buffer size aligned to 4k
+ *   ||-----------------||  ^        |         Overall Queue Size = 2,404 KB
+ *   ||                 ||  |        |         |
+ *   ||   Debug Queue   || 56 Bytes  |         |
+ *   ||     Header      ||  |        |         |
+ *   ||                 ||  |        |         |
+ *   ||=================||  V        V         |
+ *   ||=================||           ^         |
+ *   ||                 ||           |         |
+ *   ||     Command     ||         800 KB      |
+ *   ||      Queue      ||           |         |
+ *   ||                 ||           |         |
+ *   ||=================||           V         |
+ *   ||=================||           ^         |
+ *   ||                 ||           |         |
+ *   ||     Message     ||         800 KB      |
+ *   ||      Queue      ||           |         |
+ *   ||                 ||           |         |
+ *   ||=================||           V         |
+ *   ||=================||           ^         |
+ *   ||                 ||           |         |
+ *   ||      Debug      ||         800 KB      |
+ *   ||      Queue      ||           |         |
+ *   ||                 ||           |         |
+ *   ||=================||           V         |
+ *   ||                 ||                     |
+ *   ||=================||                     V
+ */
+
+/*
+ * Shared queues are used for communication between driver and firmware.
+ * There are 3 types of queues:
+ * Command queue - driver to write any command to firmware.
+ * Message queue - firmware to send any response to driver.
+ * Debug queue - firmware to write debug message.
+ */
+
+/* Host-firmware shared queue ids */
+enum iris_iface_queue {
+	IFACEQ_CMDQ_ID,
+	IFACEQ_MSGQ_ID,
+	IFACEQ_DBGQ_ID,
+	IFACEQ_NUMQ, /* not an index */
+};
+
+/**
+ * struct iris_hfi_queue_header
+ *
+ * @status: Queue status, bits (7:0), 0x1 - active, 0x0 - inactive
+ * @start_addr: Queue start address in non cached memory
+ * @queue_type: Queue ID
+ * @header_type: Default queue header
+ * @q_size: Queue size
+ *		Number of queue packets if pkt_size is non-zero
+ *		Queue size in bytes if pkt_size is zero
+ * @pkt_size: Size of queue packet entries
+ *		0x0: variable queue packet size
+ *		non zero: size of queue packet entry, fixed
+ * @pkt_drop_cnt: Number of packets dropped by sender
+ * @rx_wm: Receiver watermark, applicable in event driven mode
+ * @tx_wm: Sender watermark, applicable in event driven mode
+ * @rx_req: Receiver sets this bit if queue is empty
+ * @tx_req: Sender sets this bit if queue is full
+ * @rx_irq_status: Receiver sets this bit and triggers an interrupt to
+ *		the sender after packets are dequeued. Sender clears this bit
+ * @tx_irq_status: Sender sets this bit and triggers an interrupt to
+ *		the receiver after packets are queued. Receiver clears this bit
+ * @read_idx: Index till where receiver has consumed the packets from the queue.
+ * @write_idx: Index till where sender has written the packets into the queue.
+ */
+struct iris_hfi_queue_header {
+	u32 status;
+	u32 start_addr;
+	u16 queue_type;
+	u16 header_type;
+	u32 q_size;
+	u32 pkt_size;
+	u32 pkt_drop_cnt;
+	u32 rx_wm;
+	u32 tx_wm;
+	u32 rx_req;
+	u32 tx_req;
+	u32 rx_irq_status;
+	u32 tx_irq_status;
+	u32 read_idx;
+	u32 write_idx;
+};
+
+/**
+ * struct iris_hfi_queue_table_header
+ *
+ * @version: Queue table version number
+ * @size: Queue table size from version to last parametr in qhdr entry
+ * @qhdr0_offset: Offset to the start of first qhdr
+ * @qhdr_size: Queue header size in bytes
+ * @num_q: Total number of queues in Queue table
+ * @num_active_q: Total number of active queues
+ * @device_addr: Device address of the queue
+ * @name: Queue name in characters
+ * @q_hdr: Array of queue headers
+ */
+struct iris_hfi_queue_table_header {
+	u32 version;
+	u32 size;
+	u32 qhdr0_offset;
+	u32 qhdr_size;
+	u32 num_q;
+	u32 num_active_q;
+	void *device_addr;
+	char name[256]; /* NUL-terminated array of characters */
+	struct iris_hfi_queue_header q_hdr[IFACEQ_NUMQ];
+};
+
+struct iris_iface_q_info {
+	struct iris_hfi_queue_header *qhdr;
+	dma_addr_t	device_addr;
+	void		*kernel_vaddr;
+};
+
+int iris_hfi_queues_init(struct iris_core *core);
+void iris_hfi_queues_deinit(struct iris_core *core);
+
+#endif
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index f82081ea135f..b4d63d6677c5 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -31,6 +31,7 @@ struct iris_platform_data {
 	unsigned int clk_tbl_size;
 	const char * const *clk_rst_tbl;
 	unsigned int clk_rst_tbl_size;
+	u64 dma_mask;
 };
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8550.c b/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
index dba8d3c22ce5..9b305b8e2110 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
@@ -36,4 +36,5 @@ struct iris_platform_data sm8550_data = {
 	.opp_pd_tbl_size = ARRAY_SIZE(sm8550_opp_pd_table),
 	.clk_tbl = sm8550_clk_table,
 	.clk_tbl_size = ARRAY_SIZE(sm8550_clk_table),
+	.dma_mask = GENMASK(31, 29) - 1,
 };
diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index ce16d894c809..3015e6cb347f 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -168,15 +168,20 @@ static void iris_remove(struct platform_device *pdev)
 	if (!core)
 		return;
 
+	iris_core_deinit(core);
+
 	video_unregister_device(core->vdev_dec);
 
 	v4l2_device_unregister(&core->v4l2_dev);
+
+	mutex_destroy(&core->lock);
 }
 
 static int iris_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct iris_core *core;
+	u64 dma_mask;
 	int ret;
 
 	core = devm_kzalloc(&pdev->dev, sizeof(*core), GFP_KERNEL);
@@ -184,6 +189,9 @@ static int iris_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	core->dev = dev;
 
+	core->state = IRIS_CORE_DEINIT;
+	mutex_init(&core->lock);
+
 	core->reg_base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(core->reg_base))
 		return PTR_ERR(core->reg_base);
@@ -209,8 +217,19 @@ static int iris_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, core);
 
+	dma_mask = core->iris_platform_data->dma_mask;
+
+	ret = dma_set_mask_and_coherent(dev, dma_mask);
+	if (ret)
+		goto err_vdev_unreg;
+
+	dma_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
+	dma_set_seg_boundary(&pdev->dev, DMA_BIT_MASK(32));
+
 	return 0;
 
+err_vdev_unreg:
+	video_unregister_device(core->vdev_dec);
 err_v4l2_unreg:
 	v4l2_device_unregister(&core->v4l2_dev);
 
diff --git a/drivers/media/platform/qcom/iris/iris_state.h b/drivers/media/platform/qcom/iris/iris_state.h
new file mode 100644
index 000000000000..1ffe6fe706bd
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_state.h
@@ -0,0 +1,41 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef __IRIS_STATE_H__
+#define __IRIS_STATE_H__
+
+/**
+ * enum iris_core_state
+ *
+ * @IRIS_CORE_DEINIT: default state.
+ * @IRIS_CORE_INIT:   core state with core initialized. FW loaded and
+ *                   HW brought out of reset, shared queues established
+ *                   between host driver and firmware.
+ * @IRIS_CORE_ERROR:  error state.
+ *
+ *        -----------
+ *             |
+ *             V
+ *        -----------
+ *   +--->| DEINIT  |<---+
+ *   |   -----------    |
+ *   |         |        |
+ *   |         v        |
+ *   |   -----------    |
+ *   |     /     \      |
+ *   |    /       \     |
+ *   |   /         \    |
+ *   |  v           v   v
+ * -----------    -----------
+ * |  INIT  |--->|  ERROR  |
+ * -----------    -----------
+ */
+enum iris_core_state {
+	IRIS_CORE_DEINIT,
+	IRIS_CORE_INIT,
+	IRIS_CORE_ERROR,
+};
+
+#endif
diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
index e91d661c6280..5dd0ccbaa2fb 100644
--- a/drivers/media/platform/qcom/iris/iris_vidc.c
+++ b/drivers/media/platform/qcom/iris/iris_vidc.c
@@ -81,6 +81,12 @@ int iris_open(struct file *filp)
 	struct iris_inst *inst;
 	int ret;
 
+	ret = iris_core_init(core);
+	if (ret) {
+		dev_err(core->dev, "core init failed\n");
+		return ret;
+	}
+
 	inst = core->iris_platform_data->get_instance();
 	if (!inst)
 		return -ENOMEM;

-- 
2.34.1


