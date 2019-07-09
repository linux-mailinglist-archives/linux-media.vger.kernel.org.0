Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DC8FA633D0
	for <lists+linux-media@lfdr.de>; Tue,  9 Jul 2019 12:00:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726211AbfGIKAI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 9 Jul 2019 06:00:08 -0400
Received: from albert.telenet-ops.be ([195.130.137.90]:44836 "EHLO
        albert.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726091AbfGIKAI (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 9 Jul 2019 06:00:08 -0400
Received: from ramsan ([84.194.98.4])
        by albert.telenet-ops.be with bizsmtp
        id aZzu2000C05gfCL06ZzuEx; Tue, 09 Jul 2019 11:59:59 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hkmuf-00071X-OE; Tue, 09 Jul 2019 11:59:53 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hkmuf-0001U7-MN; Tue, 09 Jul 2019 11:59:53 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] media: fdp1: Reduce FCP not found message level to debug
Date:   Tue,  9 Jul 2019 11:59:52 +0200
Message-Id: <20190709095952.5666-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When support for the IPMMU is not enabled, the FDP driver may be
probe-deferred multiple times, causing several messages to be printed
like:

    rcar_fdp1 fe940000.fdp1: FCP not found (-517)
    rcar_fdp1 fe944000.fdp1: FCP not found (-517)

Fix this by reducing the message level to debug level, as is done in the
VSP1 driver.

Fixes: 4710b752e029f3f8 ("[media] v4l: Add Renesas R-Car FDP1 Driver")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
The alternative would be to add an explicit check for -EPROBE_DEFER.
---
 drivers/media/platform/rcar_fdp1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/rcar_fdp1.c b/drivers/media/platform/rcar_fdp1.c
index 43aae9b6bb20e3e8..c23ec127c2776f51 100644
--- a/drivers/media/platform/rcar_fdp1.c
+++ b/drivers/media/platform/rcar_fdp1.c
@@ -2306,7 +2306,7 @@ static int fdp1_probe(struct platform_device *pdev)
 		fdp1->fcp = rcar_fcp_get(fcp_node);
 		of_node_put(fcp_node);
 		if (IS_ERR(fdp1->fcp)) {
-			dev_err(&pdev->dev, "FCP not found (%ld)\n",
+			dev_dbg(&pdev->dev, "FCP not found (%ld)\n",
 				PTR_ERR(fdp1->fcp));
 			return PTR_ERR(fdp1->fcp);
 		}
-- 
2.17.1

