Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 582D7215EB0
	for <lists+linux-media@lfdr.de>; Mon,  6 Jul 2020 20:38:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729965AbgGFSic (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Jul 2020 14:38:32 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:45202 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729944AbgGFSib (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Jul 2020 14:38:31 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id F0F7A217E;
        Mon,  6 Jul 2020 20:38:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1594060688;
        bh=7HL5xl08CXPxwhnvAZWSTU4HlNSdIiTvZzZmersU18c=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=KxyZ6i7CiWS3OsJxzlmOX9UlVKApCp481H4kSqFTvxLgrXMZ5J/UV1GHXnPznM+CJ
         STyBYh2pDxXcDLTxQyQv3BTiDRY4JWn9xet84a15zSwJHk+5m4saw+1DZZZQqAIXcV
         WErj2TAcMMuDa/FmZM64SOp/a19wxDm115/11u5Y=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: [PATCH v2 064/108] media: ti-vpe: cal: Operate on phy instances in cal_quickdump_regs()
Date:   Mon,  6 Jul 2020 21:36:25 +0300
Message-Id: <20200706183709.12238-65-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200706183709.12238-1-laurent.pinchart@ideasonboard.com>
References: <20200706183709.12238-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The cal_quickdump_regs() dumps registers for the two CAMERARX instances.
Retrieve those instances from the cal_dev directly instead of going
through the contexts, and simplify the code by using a loop.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Benoit Parrot <bparrot@ti.com>
---
 drivers/media/platform/ti-vpe/cal.c | 24 +++++++++++-------------
 1 file changed, 11 insertions(+), 13 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index 59fa1f8c1564..03b4d5351bfd 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -450,26 +450,24 @@ static inline void set_field(u32 *valp, u32 field, u32 mask)
 
 static void cal_quickdump_regs(struct cal_dev *cal)
 {
+	unsigned int i;
+
 	cal_info(cal, "CAL Registers @ 0x%pa:\n", &cal->res->start);
 	print_hex_dump(KERN_INFO, "", DUMP_PREFIX_OFFSET, 16, 4,
 		       (__force const void *)cal->base,
 		       resource_size(cal->res), false);
 
-	if (cal->ctx[0]) {
-		cal_info(cal, "CSI2 Core 0 Registers @ %pa:\n",
-			 &cal->ctx[0]->phy->res->start);
-		print_hex_dump(KERN_INFO, "", DUMP_PREFIX_OFFSET, 16, 4,
-			       (__force const void *)cal->ctx[0]->phy->base,
-			       resource_size(cal->ctx[0]->phy->res),
-			       false);
-	}
+	for (i = 0; i < ARRAY_SIZE(cal->phy); ++i) {
+		struct cal_camerarx *phy = cal->phy[i];
+
+		if (!phy)
+			continue;
 
-	if (cal->ctx[1]) {
-		cal_info(cal, "CSI2 Core 1 Registers @ %pa:\n",
-			 &cal->ctx[1]->phy->res->start);
+		cal_info(cal, "CSI2 Core %u Registers @ %pa:\n", i,
+			 &phy->res->start);
 		print_hex_dump(KERN_INFO, "", DUMP_PREFIX_OFFSET, 16, 4,
-			       (__force const void *)cal->ctx[1]->phy->base,
-			       resource_size(cal->ctx[1]->phy->res),
+			       (__force const void *)phy->base,
+			       resource_size(phy->res),
 			       false);
 	}
 }
-- 
Regards,

Laurent Pinchart

