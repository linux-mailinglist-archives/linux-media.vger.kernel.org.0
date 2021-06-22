Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09F373B105D
	for <lists+linux-media@lfdr.de>; Wed, 23 Jun 2021 01:09:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229751AbhFVXML (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Jun 2021 19:12:11 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:55000 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229675AbhFVXML (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Jun 2021 19:12:11 -0400
Received: from Monstersaurus.local (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4DF75A66;
        Wed, 23 Jun 2021 01:09:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1624403393;
        bh=FVRrXEVbnnPDakzLrvKGWoSG/v9VaXjCe/ZNd46XvZ4=;
        h=From:To:Cc:Subject:Date:From;
        b=CBNnbTT7l1IZx0NKuylT+hNbwYCHfCgu82zuCIWf/tgNhd5jRD3PbULYUPGUFqNgW
         bOu/TjRDdi7o2qsGrWc26t+mLhZJPrfVNFPL+TAe6fRNoHZbKS9mZ/zWp81KwwbGAU
         8MQwoVPrM/ONDFH9XoRN2G2cR5DwSgHcnRi52CdE=
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH v3] media: vsp1: Add support for the V3U VSPD
Date:   Wed, 23 Jun 2021 00:09:50 +0100
Message-Id: <20210622230950.3207047-1-kieran.bingham@ideasonboard.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

The V3U provides two VSPD instances, with a new update to the version
register to detect the new SoC.

Add the new version and model detection, and detail the features
available in this module.

Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---

Whilst it has not been possible to test this with the uapi to validate
with our VSP tests, I have now successfully used this to display an
image over the DisplayPort connector on the V3U, so I believe it is
suitable for integration.

changes since v2:
 - Removed VSP1_HAS_CLU



 drivers/media/platform/vsp1/vsp1_drv.c  | 10 ++++++++++
 drivers/media/platform/vsp1/vsp1_regs.h |  3 +++
 2 files changed, 13 insertions(+)

diff --git a/drivers/media/platform/vsp1/vsp1_drv.c b/drivers/media/platform/vsp1/vsp1_drv.c
index de442d6c9926..501b592fd6d6 100644
--- a/drivers/media/platform/vsp1/vsp1_drv.c
+++ b/drivers/media/platform/vsp1/vsp1_drv.c
@@ -777,6 +777,16 @@ static const struct vsp1_device_info vsp1_device_infos[] = {
 		.uif_count = 2,
 		.wpf_count = 2,
 		.num_bru_inputs = 5,
+	}, {
+		.version = VI6_IP_VERSION_MODEL_VSPD_V3U,
+		.model = "VSP2-D",
+		.gen = 3,
+		.features = VSP1_HAS_BRU | VSP1_HAS_EXT_DL,
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
2.30.2

