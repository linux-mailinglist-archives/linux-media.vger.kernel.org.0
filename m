Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B57A2DD5D7
	for <lists+linux-media@lfdr.de>; Thu, 17 Dec 2020 18:15:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729157AbgLQROp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Dec 2020 12:14:45 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:49630 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728081AbgLQROo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Dec 2020 12:14:44 -0500
Received: from localhost.localdomain (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DE0FFA25;
        Thu, 17 Dec 2020 18:14:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1608225242;
        bh=GJa9bniVgUPByKWedW+oMjQX924g99UlZcvagQB4pUg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=eYoWpXBuvZo6YJfG3YdicIN+nSROfMrXPL5FIq4ULplQwHT9pEAlLMppRrpGdy8A8
         QTRipL965vNyLPoPD015UXnLNV8g4ExQ/uQSPO1Nhfc/KP96eyKW5ncpU6ZaDqZyh4
         rSM1IY70LksUCLPpxSUPEObEg3aFxl0gkzkKHy+M=
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH 1/2] media: vsp1: Add support for the V3U VSPD
Date:   Thu, 17 Dec 2020 17:13:48 +0000
Message-Id: <20201217171349.1030753-2-kieran.bingham+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201217171349.1030753-1-kieran.bingham+renesas@ideasonboard.com>
References: <20201217171349.1030753-1-kieran.bingham+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The V3U provides two VSPD instances, with a new update to the version
register to detect the new SoC.

Add the new version and model detection, and detail the features
available in this module.

Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---
 drivers/media/platform/vsp1/vsp1_drv.c  | 10 ++++++++++
 drivers/media/platform/vsp1/vsp1_regs.h |  3 +++
 2 files changed, 13 insertions(+)

diff --git a/drivers/media/platform/vsp1/vsp1_drv.c b/drivers/media/platform/vsp1/vsp1_drv.c
index dc62533cf32c..c59e865dfef2 100644
--- a/drivers/media/platform/vsp1/vsp1_drv.c
+++ b/drivers/media/platform/vsp1/vsp1_drv.c
@@ -785,6 +785,16 @@ static const struct vsp1_device_info vsp1_device_infos[] = {
 		.uif_count = 2,
 		.wpf_count = 2,
 		.num_bru_inputs = 5,
+	}, {
+		.version = VI6_IP_VERSION_MODEL_VSPD_V3U,
+		.model = "VSP2-D",
+		.gen = 3,
+		.features = VSP1_HAS_BRU | VSP1_HAS_CLU | VSP1_HAS_EXT_DL,
+		.lif_count = 1,
+		.rpf_count = 5,
+		.uif_count = 2,
+		.wpf_count = 1,
+		.num_bru_inputs = 5,
 	},
 };
 
diff --git a/drivers/media/platform/vsp1/vsp1_regs.h b/drivers/media/platform/vsp1/vsp1_regs.h
index fe3130db1fa2..b378ea4451ce 100644
--- a/drivers/media/platform/vsp1/vsp1_regs.h
+++ b/drivers/media/platform/vsp1/vsp1_regs.h
@@ -766,6 +766,8 @@
 #define VI6_IP_VERSION_MODEL_VSPD_V3	(0x18 << 8)
 #define VI6_IP_VERSION_MODEL_VSPDL_GEN3	(0x19 << 8)
 #define VI6_IP_VERSION_MODEL_VSPBS_GEN3	(0x1a << 8)
+#define VI6_IP_VERSION_MODEL_VSPD_V3U	(0x1c << 8)
+
 #define VI6_IP_VERSION_SOC_MASK		(0xff << 0)
 #define VI6_IP_VERSION_SOC_H2		(0x01 << 0)
 #define VI6_IP_VERSION_SOC_V2H		(0x01 << 0)
@@ -777,6 +779,7 @@
 #define VI6_IP_VERSION_SOC_D3		(0x04 << 0)
 #define VI6_IP_VERSION_SOC_M3N		(0x04 << 0)
 #define VI6_IP_VERSION_SOC_E3		(0x04 << 0)
+#define VI6_IP_VERSION_SOC_V3U		(0x05 << 0)
 
 /* -----------------------------------------------------------------------------
  * RPF CLUT Registers
-- 
2.25.1

