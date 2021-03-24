Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FDD334712B
	for <lists+linux-media@lfdr.de>; Wed, 24 Mar 2021 06:41:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232940AbhCXFl0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Mar 2021 01:41:26 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:53270 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232830AbhCXFlS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Mar 2021 01:41:18 -0400
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
  by alexa-out.qualcomm.com with ESMTP; 23 Mar 2021 22:41:17 -0700
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg08-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 23 Mar 2021 22:41:16 -0700
X-QCInternal: smtphost
Received: from dikshita-linux.qualcomm.com ([10.204.65.237])
  by ironmsg02-blr.qualcomm.com with ESMTP; 24 Mar 2021 11:10:59 +0530
Received: by dikshita-linux.qualcomm.com (Postfix, from userid 347544)
        id BC4E4216A6; Wed, 24 Mar 2021 11:10:58 +0530 (IST)
From:   Dikshita Agarwal <dikshita@codeaurora.org>
To:     linux-media@vger.kernel.org, stanimir.varbanov@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org, Dikshita Agarwal <dikshita@codeaurora.org>
Subject: [PATCH] media: venus : hfi: add venus image info into smem
Date:   Wed, 24 Mar 2021 11:10:57 +0530
Message-Id: <1616564457-25221-1-git-send-email-dikshita@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

fill fw version info into smem to be printed as part of
soc info.

Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
---
 drivers/media/platform/qcom/venus/hfi_msgs.c | 36 ++++++++++++++++++++++++++--
 1 file changed, 34 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/hfi_msgs.c b/drivers/media/platform/qcom/venus/hfi_msgs.c
index 06a1908..0e94921 100644
--- a/drivers/media/platform/qcom/venus/hfi_msgs.c
+++ b/drivers/media/platform/qcom/venus/hfi_msgs.c
@@ -6,6 +6,7 @@
 #include <linux/hash.h>
 #include <linux/list.h>
 #include <linux/slab.h>
+#include <linux/soc/qcom/smem.h>
 #include <media/videobuf2-v4l2.h>
 
 #include "core.h"
@@ -14,6 +15,8 @@
 #include "hfi_msgs.h"
 #include "hfi_parser.h"
 
+#define SMEM_IMAGE_VERSION_TABLE 469
+
 static void event_seq_changed(struct venus_core *core, struct venus_inst *inst,
 			      struct hfi_msg_event_notify_pkt *pkt)
 {
@@ -239,15 +242,44 @@ static void
 sys_get_prop_image_version(struct device *dev,
 			   struct hfi_msg_sys_property_info_pkt *pkt)
 {
+	u32 i = 0;
+	size_t smem_block_size = 0;
+	u8 *smem_table_ptr;
+	char version[256];
+	const u32 version_string_size = 128;
+	const u32 smem_image_index_venus = 14 * 128;
+	u8 *str_image_version;
 	int req_bytes;
 
 	req_bytes = pkt->hdr.size - sizeof(*pkt);
 
-	if (req_bytes < 128 || !pkt->data[1] || pkt->num_properties > 1)
+	if (req_bytes < version_string_size || !pkt->data[1] || pkt->num_properties > 1)
 		/* bad packet */
 		return;
 
-	dev_dbg(dev, VDBGL "F/W version: %s\n", (u8 *)&pkt->data[1]);
+	str_image_version = (u8 *)&pkt->data[1];
+
+	/*
+	 * The version string returned by firmware includes null
+	 * characters at the start and in between. Replace the null
+	 * characters with space, to print the version info.
+	 */
+	for (i = 0; i < version_string_size; i++) {
+		if (str_image_version[i] != '\0')
+			version[i] = str_image_version[i];
+		else
+			version[i] = ' ';
+	}
+
+	version[i] = '\0';
+	dev_dbg(dev, VDBGL "F/W version: %s\n", version);
+
+	smem_table_ptr = qcom_smem_get(QCOM_SMEM_HOST_ANY,
+				       SMEM_IMAGE_VERSION_TABLE, &smem_block_size);
+	if ((smem_image_index_venus + version_string_size) <= smem_block_size &&
+	    smem_table_ptr)
+		memcpy(smem_table_ptr + smem_image_index_venus,
+		       str_image_version, version_string_size);
 }
 
 static void hfi_sys_property_info(struct venus_core *core,
-- 
2.7.4

