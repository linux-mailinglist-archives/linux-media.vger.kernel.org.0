Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63E562DD5DA
	for <lists+linux-media@lfdr.de>; Thu, 17 Dec 2020 18:15:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729159AbgLQROr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Dec 2020 12:14:47 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:49634 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728181AbgLQROr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Dec 2020 12:14:47 -0500
Received: from localhost.localdomain (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 685D7AD5;
        Thu, 17 Dec 2020 18:14:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1608225242;
        bh=/ImSyZYxlNyiSLGzTu8dM7wYitwLfCYmvp+v2iNXvIk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=WcPlPW568bUwBqFguDCgW7T+NcL052PcqhCxcw1gH0dH6R9yAeqOKgONjwCHGjww/
         TZVyA/MOMJtko4nn1YzD0UbBLhPiRgt0NwhxSUV+YchHpGIRlMr+w5y5DXinW3aItq
         OON3i2fuP+xkzOkxOAOEQnU112UnTtV45dvtmXh8=
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH 2/2] [RFC]: media: vsp1: Add support for the V3U VSPX
Date:   Thu, 17 Dec 2020 17:13:49 +0000
Message-Id: <20201217171349.1030753-3-kieran.bingham+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201217171349.1030753-1-kieran.bingham+renesas@ideasonboard.com>
References: <20201217171349.1030753-1-kieran.bingham+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The V3U provides four VSPX instances. This module brings in the IIF, to
process images through the ISP.

Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

---

We need to set the VI6_DPR_ROUTE_IIFSEL bit on the VI6_DPR_BRU_ROUTE to
enable output on the IIF.

At the moment I'm envisaging adding a new entity to keep our existing
model, and map the IIF in the media graph, but it might be that we only
need to set this one bit to output on the IIF - so there might not be a
need for such over engineering.

In this patch I've provisionally added a VSP1_HAS_IIF feature, thinking
it would be needed, but as I've moved on - I don't actually see that it
would be required, so this likely gets dropped.

We will have some Bayer specific formats to handle, but they can be
flagged based on the SoC type or a HAS_BAYER formats rather than the IIF
if needed.

Furthermore, table 32.39 (Registers VSPX supports) indicates that the
VSPX still needs to configure the WPF0 when used (and that the BRU must
be connected, which we can handle in the routing tables).

So we may have to instantiate an instance of WPF specifically to handle
the IIF, even though the IIF is actually a function of the BRU ...

Still seems a bit too early to tell - so I think this patch really is
just for potential discussions - and not destined at all for
integration.
---
 drivers/media/platform/vsp1/vsp1.h      | 2 ++
 drivers/media/platform/vsp1/vsp1_drv.c  | 8 ++++++++
 drivers/media/platform/vsp1/vsp1_regs.h | 2 ++
 3 files changed, 12 insertions(+)

diff --git a/drivers/media/platform/vsp1/vsp1.h b/drivers/media/platform/vsp1/vsp1.h
index 37cf33c7e6ca..a2fecd9392fd 100644
--- a/drivers/media/platform/vsp1/vsp1.h
+++ b/drivers/media/platform/vsp1/vsp1.h
@@ -54,12 +54,14 @@ struct vsp1_uif;
 #define VSP1_HAS_HGT		BIT(8)
 #define VSP1_HAS_BRS		BIT(9)
 #define VSP1_HAS_EXT_DL		BIT(10)
+#define VSP1_HAS_IIF		BIT(11)
 
 struct vsp1_device_info {
 	u32 version;
 	const char *model;
 	unsigned int gen;
 	unsigned int features;
+	unsigned int iif_count;
 	unsigned int lif_count;
 	unsigned int rpf_count;
 	unsigned int uds_count;
diff --git a/drivers/media/platform/vsp1/vsp1_drv.c b/drivers/media/platform/vsp1/vsp1_drv.c
index c59e865dfef2..15e327516828 100644
--- a/drivers/media/platform/vsp1/vsp1_drv.c
+++ b/drivers/media/platform/vsp1/vsp1_drv.c
@@ -795,6 +795,14 @@ static const struct vsp1_device_info vsp1_device_infos[] = {
 		.uif_count = 2,
 		.wpf_count = 1,
 		.num_bru_inputs = 5,
+	}, {
+		.version = VI6_IP_VERSION_MODEL_VSPX_V3U,
+		.model = "VSP2-X",
+		.gen = 3,
+		.features = VSP1_HAS_IIF | VSP1_HAS_BRU | VSP1_HAS_EXT_DL,
+		.iif_count = 1,
+		.rpf_count = 4,
+		.num_bru_inputs = 4,
 	},
 };
 
diff --git a/drivers/media/platform/vsp1/vsp1_regs.h b/drivers/media/platform/vsp1/vsp1_regs.h
index b378ea4451ce..700ede1241e0 100644
--- a/drivers/media/platform/vsp1/vsp1_regs.h
+++ b/drivers/media/platform/vsp1/vsp1_regs.h
@@ -364,6 +364,7 @@
 #define VI6_DPR_HST_ROUTE		0x2044
 #define VI6_DPR_HSI_ROUTE		0x2048
 #define VI6_DPR_BRU_ROUTE		0x204c
+#define VI6_DPR_ROUTE_IIFSEL		BIT(28)
 #define VI6_DPR_ILV_BRS_ROUTE		0x2050
 #define VI6_DPR_ROUTE_BRSSEL		BIT(28)
 #define VI6_DPR_ROUTE_FXA_MASK		(0xff << 16)
@@ -767,6 +768,7 @@
 #define VI6_IP_VERSION_MODEL_VSPDL_GEN3	(0x19 << 8)
 #define VI6_IP_VERSION_MODEL_VSPBS_GEN3	(0x1a << 8)
 #define VI6_IP_VERSION_MODEL_VSPD_V3U	(0x1c << 8)
+#define VI6_IP_VERSION_MODEL_VSPX_V3U	(0x1d << 8)
 
 #define VI6_IP_VERSION_SOC_MASK		(0xff << 0)
 #define VI6_IP_VERSION_SOC_H2		(0x01 << 0)
-- 
2.25.1

