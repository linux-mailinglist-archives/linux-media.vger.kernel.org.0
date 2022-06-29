Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D262455FDDF
	for <lists+linux-media@lfdr.de>; Wed, 29 Jun 2022 12:54:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233102AbiF2Kvu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Jun 2022 06:51:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231431AbiF2Kvs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Jun 2022 06:51:48 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B384825290;
        Wed, 29 Jun 2022 03:51:47 -0700 (PDT)
Received: from Monstersaurus.ksquared.org.uk.beta.tailscale.net (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 76AB4891;
        Wed, 29 Jun 2022 12:51:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1656499901;
        bh=tGEG7td7fs0PzSRShafiZTRBjd1yszhe+qefGIwIMww=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=sJSCRexjUNUJT4vJCJa2psWIRHDlGMaxWGj+89GNg6T2DpySHvMyl5cSs+ByVDhqi
         ImBfdUsJ6IsjPJ2y7uhwLivlWhn1mjaDJFDpAM3pxIVe36L9/t5n3P+eqgFBLlhU1c
         KXIyeRncTcPum7Z75enUOIDVTQByoo8O+UAIrHww=
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org,
        Eugeniu Rosca <erosca@de.adit-jv.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH 5/7] v4l: vsp1: Add safety mechanism registers
Date:   Wed, 29 Jun 2022 11:51:33 +0100
Message-Id: <20220629105135.2652773-6-kieran.bingham+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220629105135.2652773-1-kieran.bingham+renesas@ideasonboard.com>
References: <20220629105135.2652773-1-kieran.bingham+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Provide the Safety Mechanism registers so that they can be reported
through debugfs

Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---
 .../media/platform/renesas/vsp1/vsp1_debugfs.c |  6 ++++++
 .../media/platform/renesas/vsp1/vsp1_regs.h    | 18 ++++++++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/drivers/media/platform/renesas/vsp1/vsp1_debugfs.c b/drivers/media/platform/renesas/vsp1/vsp1_debugfs.c
index 3bae9556f38b..0340acd3209b 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_debugfs.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_debugfs.c
@@ -121,6 +121,12 @@ static const struct debugfs_reg32 vsp1_regset[] = {
 	VSP1_DBFS_REG(VI6_MRESET_ENB1),
 	VSP1_DBFS_REG(VI6_MRESET),
 
+	VSP1_DBFS_REG(VI6_WPF0_WDT),
+	VSP1_DBFS_REG(VI6_WPF0_FRCNT),
+	VSP1_DBFS_REG(VI6_ECM0_IRQ_ENB),
+	VSP1_DBFS_REG(VI6_ECM0_IRQ_STA),
+	VSP1_DBFS_REG(VI6_CTL_ERRINJ),
+
 	VSP1_DBFS_REG_DECODE(VI6_STATUS, decode_vi6_status),
 
 	VSP1_DBFS_REG_DECODE(VI6_WPF_IRQ_ENB(0), decode_vi6_wpf_enb),
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_regs.h b/drivers/media/platform/renesas/vsp1/vsp1_regs.h
index 86855b34dcaf..f90a01a21b06 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_regs.h
+++ b/drivers/media/platform/renesas/vsp1/vsp1_regs.h
@@ -70,6 +70,24 @@
 #define VI6_WPF_LINE_COUNT(n)		(0x0084 + (n) * 4)
 #define VI6_WPF_LINE_COUNT_MASK		(0x1fffff << 0)
 
+/* Safety Mechanism */
+#define VI6_WPF0_WDT			0x00c4
+#define VI6_WPF0_WDT_WDTEN		BIT(16)
+#define VI6_WPF0_TIMER_CYC_MASK		(0xffff << 0)
+
+#define VI6_WPF0_FRCNT			0x00d4
+#define VI6_WPF0_FRCNT_MASK		(0xfff << 0)
+
+#define VI6_ECM0_IRQ_ENB		0x00dc
+#define VI6_ECM0_IRQ_ENB_W0ALME		BIT(24)
+#define VI6_ECM0_IRQ_ENB_RRSP0E		BIT(0)
+
+#define VI6_ECM0_IRQ_STA		0x00e0
+#define VI6_ECM0_IRQ_STA_W0ALM		BIT(24)
+#define VI6_ECM0_IRQ_STA_RRSP0		BIT(0)
+
+#define VI6_CTL_ERRINJ			0x00e8
+
 /* -----------------------------------------------------------------------------
  * Display List Control Registers
  */
-- 
2.34.1

