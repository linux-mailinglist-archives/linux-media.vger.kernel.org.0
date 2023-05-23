Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C366370E107
	for <lists+linux-media@lfdr.de>; Tue, 23 May 2023 17:52:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237645AbjEWPwN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 May 2023 11:52:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237651AbjEWPwK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 May 2023 11:52:10 -0400
X-Greylist: delayed 518 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 23 May 2023 08:52:08 PDT
Received: from gauss.telenet-ops.be (gauss.telenet-ops.be [IPv6:2a02:1800:120:4::f00:11])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEB0DC2
        for <linux-media@vger.kernel.org>; Tue, 23 May 2023 08:52:08 -0700 (PDT)
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by gauss.telenet-ops.be (Postfix) with ESMTPS id 4QQdrY00nsz4wyk2
        for <linux-media@vger.kernel.org>; Tue, 23 May 2023 17:43:25 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed30:b0ac:7afd:272:4cff])
        by andre.telenet-ops.be with bizsmtp
        id 0FiN2A00R0Jkz7G01FiNDk; Tue, 23 May 2023 17:42:24 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1q1U9I-002t5J-7V;
        Tue, 23 May 2023 17:42:22 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1q1U9W-00Ckk7-KA;
        Tue, 23 May 2023 17:42:22 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH v3] media: renesas: fdp1: Identify R-Car Gen2 versions
Date:   Tue, 23 May 2023 17:42:21 +0200
Message-Id: <3d6cbf2cd4398f29379d8d7287b93e8b8ec6c147.1684856457.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
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
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
---
Version register contents verified on R-Car H2 ES1.0, R-Car M2-W ES1.0 &
ES3.0, and R-Car E2 ES1.0.  I couldn't get hold of an R-Car M2-N.

v3:
  - Add Reviewed-by,

v2:
  - Add Reviewed-by,
  - Add comment.
---
 drivers/media/platform/renesas/rcar_fdp1.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/platform/renesas/rcar_fdp1.c b/drivers/media/platform/renesas/rcar_fdp1.c
index f43e458590b8cada..ab39cd2201c85d84 100644
--- a/drivers/media/platform/renesas/rcar_fdp1.c
+++ b/drivers/media/platform/renesas/rcar_fdp1.c
@@ -254,6 +254,8 @@ MODULE_PARM_DESC(debug, "activate debug info");
 
 /* Internal Data (HW Version) */
 #define FD1_IP_INTDATA			0x0800
+/* R-Car Gen2 HW manual says zero, but actual value matches R-Car H3 ES1.x */
+#define FD1_IP_GEN2			0x02010101
 #define FD1_IP_M3W			0x02010202
 #define FD1_IP_H3			0x02010203
 #define FD1_IP_M3N			0x02010204
@@ -2360,6 +2362,9 @@ static int fdp1_probe(struct platform_device *pdev)
 
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

