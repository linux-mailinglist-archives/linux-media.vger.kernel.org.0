Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 74CD74DCFAA
	for <lists+linux-media@lfdr.de>; Thu, 17 Mar 2022 21:49:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229890AbiCQUuo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Mar 2022 16:50:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229886AbiCQUun (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Mar 2022 16:50:43 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF468164D0B;
        Thu, 17 Mar 2022 13:49:26 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A570B493;
        Thu, 17 Mar 2022 21:49:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1647550164;
        bh=k1v3qSCPSue5f5NFtBEtZ92ar7pw740Jgo4xgPL+1+0=;
        h=From:To:Cc:Subject:Date:From;
        b=nd01GySwsghiSS6fESTxTNpRyUCNkrCL22OTZ1M2f2Rd2fuuJusiJcSF0c2BqiWfC
         yVGnc/pv++777cS2NHcyrhamldVqRzWqLCKRRvVIjHC56G3nZi/+QqS83kOU2qOlyh
         uIdJ5ftKvM4B2WbdNnBXZ+3OdvyT3bUvFHalKGoI=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org, Jacopo Mondi <jacopo@jmondi.org>
Subject: [PATCH] media: platform: renesas-ceu: Fix unused variable warning
Date:   Thu, 17 Mar 2022 22:49:03 +0200
Message-Id: <20220317204903.28163-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
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

The ceu_data_rz variable is unused when CONFIG_OF isn't set. This
generates a compiler warning. Fix it.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/renesas/renesas-ceu.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/renesas/renesas-ceu.c b/drivers/media/platform/renesas/renesas-ceu.c
index 2e8dbacc414e..f70f91b006b7 100644
--- a/drivers/media/platform/renesas/renesas-ceu.c
+++ b/drivers/media/platform/renesas/renesas-ceu.c
@@ -1606,15 +1606,15 @@ struct ceu_data {
 	u32 irq_mask;
 };
 
-static const struct ceu_data ceu_data_rz = {
-	.irq_mask = CEU_CETCR_ALL_IRQS_RZ,
-};
-
 static const struct ceu_data ceu_data_sh4 = {
 	.irq_mask = CEU_CETCR_ALL_IRQS_SH4,
 };
 
 #if IS_ENABLED(CONFIG_OF)
+static const struct ceu_data ceu_data_rz = {
+	.irq_mask = CEU_CETCR_ALL_IRQS_RZ,
+};
+
 static const struct of_device_id ceu_of_match[] = {
 	{ .compatible = "renesas,r7s72100-ceu", .data = &ceu_data_rz },
 	{ .compatible = "renesas,r8a7740-ceu", .data = &ceu_data_rz },

base-commit: 10ed1ec9c9cab63310038579c2e1303324bfa44a
-- 
Regards,

Laurent Pinchart

