Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0794A35BBA3
	for <lists+linux-media@lfdr.de>; Mon, 12 Apr 2021 10:05:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237152AbhDLIFy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Apr 2021 04:05:54 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:3401 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237144AbhDLIFw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Apr 2021 04:05:52 -0400
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
  by alexa-out.qualcomm.com with ESMTP; 12 Apr 2021 01:05:34 -0700
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg09-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 12 Apr 2021 01:05:32 -0700
X-QCInternal: smtphost
Received: from dikshita-linux.qualcomm.com ([10.204.65.237])
  by ironmsg01-blr.qualcomm.com with ESMTP; 12 Apr 2021 13:35:11 +0530
Received: by dikshita-linux.qualcomm.com (Postfix, from userid 347544)
        id 3DC3121936; Mon, 12 Apr 2021 13:35:10 +0530 (IST)
From:   Dikshita Agarwal <dikshita@codeaurora.org>
To:     linux-media@vger.kernel.org, stanimir.varbanov@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org, swboyd@chromium.org,
        bjorn.andersson@linaro.org,
        Dikshita Agarwal <dikshita@codeaurora.org>
Subject: [PATCH v5] media: venus : hfi: add venus image info into smem
Date:   Mon, 12 Apr 2021 13:35:08 +0530
Message-Id: <1618214708-28711-1-git-send-email-dikshita@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fill fw version info into smem to be printed as part of
soc info.

Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/media/platform/Kconfig               |  2 +-
 drivers/media/platform/qcom/venus/hfi_msgs.c | 20 ++++++++++++++++++--
 2 files changed, 19 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
index fd1831e..9c75e88 100644
--- a/drivers/media/platform/Kconfig
+++ b/drivers/media/platform/Kconfig
@@ -543,7 +543,7 @@ config VIDEO_TI_VPE_DEBUG
 
 config VIDEO_QCOM_VENUS
 	tristate "Qualcomm Venus V4L2 encoder/decoder driver"
-	depends on VIDEO_DEV && VIDEO_V4L2
+	depends on VIDEO_DEV && VIDEO_V4L2 && QCOM_SMEM
 	depends on (ARCH_QCOM && IOMMU_DMA) || COMPILE_TEST
 	select QCOM_MDT_LOADER if ARCH_QCOM
 	select QCOM_SCM if ARCH_QCOM
diff --git a/drivers/media/platform/qcom/venus/hfi_msgs.c b/drivers/media/platform/qcom/venus/hfi_msgs.c
index 06a1908..9f856a6 100644
--- a/drivers/media/platform/qcom/venus/hfi_msgs.c
+++ b/drivers/media/platform/qcom/venus/hfi_msgs.c
@@ -6,6 +6,7 @@
 #include <linux/hash.h>
 #include <linux/list.h>
 #include <linux/slab.h>
+#include <linux/soc/qcom/smem.h>
 #include <media/videobuf2-v4l2.h>
 
 #include "core.h"
@@ -14,6 +15,10 @@
 #include "hfi_msgs.h"
 #include "hfi_parser.h"
 
+#define SMEM_IMG_VER_TBL 469
+#define VER_STR_SZ	128
+#define SMEM_IMG_OFFSET_VENUS (14 * 128)
+
 static void event_seq_changed(struct venus_core *core, struct venus_inst *inst,
 			      struct hfi_msg_event_notify_pkt *pkt)
 {
@@ -239,15 +244,26 @@ static void
 sys_get_prop_image_version(struct device *dev,
 			   struct hfi_msg_sys_property_info_pkt *pkt)
 {
+	u8 *smem_tbl_ptr;
+	u8 *img_ver;
 	int req_bytes;
+	size_t smem_blk_sz;
 
 	req_bytes = pkt->hdr.size - sizeof(*pkt);
 
-	if (req_bytes < 128 || !pkt->data[1] || pkt->num_properties > 1)
+	if (req_bytes < VER_STR_SZ || !pkt->data[1] || pkt->num_properties > 1)
 		/* bad packet */
 		return;
 
-	dev_dbg(dev, VDBGL "F/W version: %s\n", (u8 *)&pkt->data[1]);
+	img_ver = (u8 *)&pkt->data[1];
+
+	dev_dbg(dev, VDBGL "F/W version: %s\n", img_ver);
+
+	smem_tbl_ptr = qcom_smem_get(QCOM_SMEM_HOST_ANY,
+		SMEM_IMG_VER_TBL, &smem_blk_sz);
+	if (smem_tbl_ptr && smem_blk_sz >= SMEM_IMG_OFFSET_VENUS + VER_STR_SZ)
+		memcpy(smem_tbl_ptr + SMEM_IMG_OFFSET_VENUS,
+		       img_ver, VER_STR_SZ);
 }
 
 static void hfi_sys_property_info(struct venus_core *core,
-- 
2.7.4

