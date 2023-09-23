Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 05E8D7AC31C
	for <lists+linux-media@lfdr.de>; Sat, 23 Sep 2023 17:21:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231878AbjIWPVW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 23 Sep 2023 11:21:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231815AbjIWPVU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 23 Sep 2023 11:21:20 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1DBA194
        for <linux-media@vger.kernel.org>; Sat, 23 Sep 2023 08:21:13 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A100C433C8;
        Sat, 23 Sep 2023 15:21:12 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Arnd Bergmann <arnd@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Maxime Ripard <mripard@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>
Subject: [PATCHv2 02/23] media: cadence: increase buffer size in csi2tx_get_resources()
Date:   Sat, 23 Sep 2023 17:20:46 +0200
Message-Id: <20230923152107.283289-3-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230923152107.283289-1-hverkuil-cisco@xs4all.nl>
References: <20230923152107.283289-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fixes this compiler warning:

drivers/media/platform/cadence/cdns-csi2tx.c: In function 'csi2tx_get_resources':
drivers/media/platform/cadence/cdns-csi2tx.c:485:63: warning: '%u' directive output may be truncated writing between 1 and 10 bytes into a region of size 8 [-Wformat-truncation=]
  485 |                 snprintf(clk_name, sizeof(clk_name), "pixel_if%u_clk", i);
      |                                                               ^~
drivers/media/platform/cadence/cdns-csi2tx.c:485:54: note: directive argument in the range [0, 4294967294]
  485 |                 snprintf(clk_name, sizeof(clk_name), "pixel_if%u_clk", i);
      |                                                      ^~~~~~~~~~~~~~~~
drivers/media/platform/cadence/cdns-csi2tx.c:485:17: note: 'snprintf' output between 14 and 23 bytes into a destination of size 16
  485 |                 snprintf(clk_name, sizeof(clk_name), "pixel_if%u_clk", i);
      |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Acked-by: Maxime Ripard <mripard@kernel.org>
Acked-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/media/platform/cadence/cdns-csi2tx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/cadence/cdns-csi2tx.c b/drivers/media/platform/cadence/cdns-csi2tx.c
index 1e0400b7803e..cbbb77520112 100644
--- a/drivers/media/platform/cadence/cdns-csi2tx.c
+++ b/drivers/media/platform/cadence/cdns-csi2tx.c
@@ -480,7 +480,7 @@ static int csi2tx_get_resources(struct csi2tx_priv *csi2tx,
 	csi2tx->has_internal_dphy = !!(dev_cfg & CSI2TX_DEVICE_CONFIG_HAS_DPHY);
 
 	for (i = 0; i < csi2tx->max_streams; i++) {
-		char clk_name[16];
+		char clk_name[23];
 
 		snprintf(clk_name, sizeof(clk_name), "pixel_if%u_clk", i);
 		csi2tx->pixel_clk[i] = devm_clk_get(&pdev->dev, clk_name);
-- 
2.40.1

