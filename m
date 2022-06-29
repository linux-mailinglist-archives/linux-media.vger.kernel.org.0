Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 920FC55FDD3
	for <lists+linux-media@lfdr.de>; Wed, 29 Jun 2022 12:54:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232942AbiF2Kvs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Jun 2022 06:51:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233055AbiF2Kvr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Jun 2022 06:51:47 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C2C02654D;
        Wed, 29 Jun 2022 03:51:46 -0700 (PDT)
Received: from Monstersaurus.ksquared.org.uk.beta.tailscale.net (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2B062888;
        Wed, 29 Jun 2022 12:51:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1656499901;
        bh=Pu4sxu/I46S2jYGIrrul2noxPgZPxuXaE43SkZeR3kE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=pOT0wm8l3mjGPGo+84NNz+hgW6eVgbUYR51JcKHF0voYr/e1tfo1sgqK2dLf0OE+g
         sgABEfz9uGBXHMUTq8aiZyrh8+tkpJGDF50XidMU1jyCSBQ8mcwnyoIznVjiWhdAnh
         bj0sms8TP7DgtAhzLtKavKgOHwji9Y/rmuCwiWQM=
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org,
        Eugeniu Rosca <erosca@de.adit-jv.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH 4/7] v4l: vsp1: Add CLK_CTRL and MRESET register definitions
Date:   Wed, 29 Jun 2022 11:51:32 +0100
Message-Id: <20220629105135.2652773-5-kieran.bingham+renesas@ideasonboard.com>
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

Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---
 .../media/platform/renesas/vsp1/vsp1_debugfs.c   | 10 ++++++++++
 drivers/media/platform/renesas/vsp1/vsp1_regs.h  | 16 ++++++++++++++++
 2 files changed, 26 insertions(+)

diff --git a/drivers/media/platform/renesas/vsp1/vsp1_debugfs.c b/drivers/media/platform/renesas/vsp1/vsp1_debugfs.c
index 4e361fd4c445..3bae9556f38b 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_debugfs.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_debugfs.c
@@ -107,10 +107,20 @@ static const struct debugfs_reg32 vsp1_regset[] = {
 	VSP1_DBFS_REG(VI6_CMD(0)),
 	VSP1_DBFS_REG(VI6_CMD(1)),
 
+	VSP1_DBFS_REG(VI6_CLK_CTRL0),
+	VSP1_DBFS_REG(VI6_CLK_CTRL1),
+
 	VSP1_DBFS_REG(VI6_CLK_DCSWT),
 
+	VSP1_DBFS_REG(VI6_CLK_DCSM0),
+	VSP1_DBFS_REG(VI6_CLK_DCSM1),
+
 	VSP1_DBFS_REG(VI6_SRESET),
 
+	VSP1_DBFS_REG(VI6_MRESET_ENB0),
+	VSP1_DBFS_REG(VI6_MRESET_ENB1),
+	VSP1_DBFS_REG(VI6_MRESET),
+
 	VSP1_DBFS_REG_DECODE(VI6_STATUS, decode_vi6_status),
 
 	VSP1_DBFS_REG_DECODE(VI6_WPF_IRQ_ENB(0), decode_vi6_wpf_enb),
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_regs.h b/drivers/media/platform/renesas/vsp1/vsp1_regs.h
index 632c43bb4cbd..86855b34dcaf 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_regs.h
+++ b/drivers/media/platform/renesas/vsp1/vsp1_regs.h
@@ -18,15 +18,31 @@
 #define VI6_CMD_UPDHDR			BIT(4)
 #define VI6_CMD_STRCMD			BIT(0)
 
+#define VI6_CLK_CTRL0			0x0010
+#define VI6_CLK_CTRL1			0x0014
+
 #define VI6_CLK_DCSWT			0x0018
 #define VI6_CLK_DCSWT_CSTPW_MASK	(0xff << 8)
 #define VI6_CLK_DCSWT_CSTPW_SHIFT	8
 #define VI6_CLK_DCSWT_CSTRW_MASK	(0xff << 0)
 #define VI6_CLK_DCSWT_CSTRW_SHIFT	0
 
+#define VI6_CLK_DCSM0			0x001c
+#define VI6_CLK_DCSM1			0x0020
+
 #define VI6_SRESET			0x0028
 #define VI6_SRESET_SRTS(n)		BIT(n)
 
+#define VI6_MRESET_ENB0			0x002c
+#define VI6_MRESET_ENB0_RESET		0x0000001f
+#define VI6_MRESET_ENB0_RESET_BUS	0x30000f1f
+
+#define VI6_MRESET_ENB1			0x0030
+#define VI6_MRESET_ENB1_RESET		0xff00ffff
+
+#define VI6_MRESET			0x0034
+#define VI6_MRESET_MRST			BIT(0)
+
 #define VI6_STATUS			0x0038
 #define VI6_STATUS_FLD_STD(n)		BIT((n) + 28)
 #define VI6_STATUS_SYS_ACT(n)		BIT((n) + 8)
-- 
2.34.1

