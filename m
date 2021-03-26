Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42BA134A1DD
	for <lists+linux-media@lfdr.de>; Fri, 26 Mar 2021 07:34:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229733AbhCZGeO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Mar 2021 02:34:14 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:32782 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229580AbhCZGdw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Mar 2021 02:33:52 -0400
Received: from ironmsg07-lv.qualcomm.com (HELO ironmsg07-lv.qulacomm.com) ([10.47.202.151])
  by alexa-out.qualcomm.com with ESMTP; 25 Mar 2021 23:33:53 -0700
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg07-lv.qulacomm.com with ESMTP/TLS/AES256-SHA; 25 Mar 2021 23:33:50 -0700
X-QCInternal: smtphost
Received: from dikshita-linux.qualcomm.com ([10.204.65.237])
  by ironmsg02-blr.qualcomm.com with ESMTP; 26 Mar 2021 12:03:34 +0530
Received: by dikshita-linux.qualcomm.com (Postfix, from userid 347544)
        id 78EC3218B5; Fri, 26 Mar 2021 12:03:33 +0530 (IST)
From:   Dikshita Agarwal <dikshita@codeaurora.org>
To:     linux-media@vger.kernel.org, stanimir.varbanov@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org, Dikshita Agarwal <dikshita@codeaurora.org>
Subject: [PATCH v2] media: venus : hfi: add venus image info into smem
Date:   Fri, 26 Mar 2021 12:03:25 +0530
Message-Id: <1616740405-5085-1-git-send-email-dikshita@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fill fw version info into smem to be printed as part of
soc info.

Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>

Changes since v1:
 adressed comments from stephen.
 removed unwanted code.
---
 drivers/media/platform/qcom/venus/hfi_msgs.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/hfi_msgs.c b/drivers/media/platform/qcom/venus/hfi_msgs.c
index 06a1908..6b6d33c9 100644
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
+#define SMEM_IMG_INDEX_VENUS 14 * 128
+
 static void event_seq_changed(struct venus_core *core, struct venus_inst *inst,
 			      struct hfi_msg_event_notify_pkt *pkt)
 {
@@ -239,15 +244,27 @@ static void
 sys_get_prop_image_version(struct device *dev,
 			   struct hfi_msg_sys_property_info_pkt *pkt)
 {
+	size_t smem_blk_sz = 0;
+	u8 *smem_tbl_ptr;
+	u8 *img_ver;
 	int req_bytes;
 
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
+				       SMEM_IMG_VER_TBL, &smem_blk_sz);
+	if ((SMEM_IMG_INDEX_VENUS + VER_STR_SZ) <= smem_blk_sz &&
+	    smem_tbl_ptr)
+		memcpy(smem_tbl_ptr + SMEM_IMG_INDEX_VENUS,
+		       img_ver, VER_STR_SZ);
 }
 
 static void hfi_sys_property_info(struct venus_core *core,
-- 
2.7.4

