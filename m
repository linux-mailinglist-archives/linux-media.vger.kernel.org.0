Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 239D335636F
	for <lists+linux-media@lfdr.de>; Wed,  7 Apr 2021 07:47:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243435AbhDGFsB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Apr 2021 01:48:01 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:20046 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229558AbhDGFr6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Apr 2021 01:47:58 -0400
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
  by alexa-out.qualcomm.com with ESMTP; 06 Apr 2021 22:47:48 -0700
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg07-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 06 Apr 2021 22:47:46 -0700
X-QCInternal: smtphost
Received: from dikshita-linux.qualcomm.com ([10.204.65.237])
  by ironmsg01-blr.qualcomm.com with ESMTP; 07 Apr 2021 11:17:26 +0530
Received: by dikshita-linux.qualcomm.com (Postfix, from userid 347544)
        id 2719F21875; Wed,  7 Apr 2021 11:17:25 +0530 (IST)
From:   Dikshita Agarwal <dikshita@codeaurora.org>
To:     linux-media@vger.kernel.org, stanimir.varbanov@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org, swboyd@chromium.org,
        bjorn.andersson@linaro.org,
        Dikshita Agarwal <dikshita@codeaurora.org>
Subject: [PATCH v3] media: venus : hfi: add venus image info into smem
Date:   Wed,  7 Apr 2021 11:17:17 +0530
Message-Id: <1617774437-31293-1-git-send-email-dikshita@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fill fw version info into smem to be printed as part of
soc info.

Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>

changes since v2:
- adressed all review comments. 
---
 drivers/media/platform/qcom/venus/hfi_msgs.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/hfi_msgs.c b/drivers/media/platform/qcom/venus/hfi_msgs.c
index 06a1908..74cfc4f 100644
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
@@ -239,15 +244,27 @@ static void
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
+	if (smem_tbl_ptr &&
+	    smem_blk_sz >= SMEM_IMG_OFFSET_VENUS + VER_STR_SZ)
+		memcpy(smem_tbl_ptr + SMEM_IMG_OFFSET_VENUS,
+		       img_ver, VER_STR_SZ);
 }
 
 static void hfi_sys_property_info(struct venus_core *core,
-- 
2.7.4

