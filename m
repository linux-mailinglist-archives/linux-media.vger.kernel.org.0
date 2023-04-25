Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F1506EE48E
	for <lists+linux-media@lfdr.de>; Tue, 25 Apr 2023 17:15:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234494AbjDYPPa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Apr 2023 11:15:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234493AbjDYPPV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Apr 2023 11:15:21 -0400
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BC8715455
        for <linux-media@vger.kernel.org>; Tue, 25 Apr 2023 08:15:15 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed30:d35a:e0ed:cfef:fc57])
        by laurent.telenet-ops.be with bizsmtp
        id p3F92900l1uNCps013F9BA; Tue, 25 Apr 2023 17:15:10 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1prKNo-000RvE-0B;
        Tue, 25 Apr 2023 17:15:09 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1prKNp-004xjO-Gu;
        Tue, 25 Apr 2023 17:15:09 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] media: renesas: fdp1: Identify R-Car Gen2 versions
Date:   Tue, 25 Apr 2023 17:15:02 +0200
Message-Id: <453e34f0eda526f79b0297952937dc0a0b5aacf8.1682435583.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On R-Car M2-W:

    rcar_fdp1 fe940000.fdp1: FDP1 Unidentifiable (0x02010101)
    rcar_fdp1 fe944000.fdp1: FDP1 Unidentifiable (0x02010101)

Although the IP Internal Data Register on R-Car Gen2 is documented to
contain all zeros, the actual register contents seem to match the FDP1
version ID of R-Car H3 ES1.*, which has just been removed.
Fortunately this version is not used for any other purposes yet.

Fix this by re-adding the ID, now using an R-Car Gen2-specific name.

Fixes: af4273b43f2bd9ee ("media: renesas: fdp1: remove R-Car H3 ES1.* handling")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Version register contents verified on R-Car H2 ES1.0, R-Car M2-W ES1.0 &
ES3.0, and R-Car E2 ES1.0.  I couldn't get hold of an R-Car M2-N.
---
 drivers/media/platform/renesas/rcar_fdp1.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/platform/renesas/rcar_fdp1.c b/drivers/media/platform/renesas/rcar_fdp1.c
index 99af68fddc9249f5..b0a694f9245cc2c6 100644
--- a/drivers/media/platform/renesas/rcar_fdp1.c
+++ b/drivers/media/platform/renesas/rcar_fdp1.c
@@ -254,6 +254,7 @@ MODULE_PARM_DESC(debug, "activate debug info");
 
 /* Internal Data (HW Version) */
 #define FD1_IP_INTDATA			0x0800
+#define FD1_IP_GEN2			0x02010101
 #define FD1_IP_M3W			0x02010202
 #define FD1_IP_H3			0x02010203
 #define FD1_IP_M3N			0x02010204
@@ -2360,6 +2361,9 @@ static int fdp1_probe(struct platform_device *pdev)
 
 	hw_version = fdp1_read(fdp1, FD1_IP_INTDATA);
 	switch (hw_version) {
+	case FD1_IP_GEN2:
+		dprintk(fdp1, "FDP1 Version R-Car Gen2\n");
+		break;
 	case FD1_IP_M3W:
 		dprintk(fdp1, "FDP1 Version R-Car M3-W\n");
 		break;
-- 
2.34.1

