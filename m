Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02FCA1F8BAC
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2020 02:01:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728187AbgFOABZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Jun 2020 20:01:25 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:33340 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728190AbgFOABX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Jun 2020 20:01:23 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 70FD7215B;
        Mon, 15 Jun 2020 02:00:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1592179239;
        bh=e3j3v0hP1bda0RqROA5fAsmP7FEs9ylD3KdFZRzeBRw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=QgucLCfWcZcJWUEQKGpWIuRiDCDY32LzmgeRE/kwYecwhjc4l3vBf3av7YPo17Gpg
         SNBhhqNsqNKQLiMDBZouUYSJUWqX8oD1VkOVIbfK//267gB3Nv34fTSEQBeW7fBvNY
         PW/gWkWKs/u7zDlzKRGZNLLyunx4ufVf+Mrw64Nw=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: [PATCH v1 063/107] media: ti-vpe: cal: Operate on phy instances in cal_quickdump_regs()
Date:   Mon, 15 Jun 2020 02:59:00 +0300
Message-Id: <20200614235944.17716-64-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200614235944.17716-1-laurent.pinchart@ideasonboard.com>
References: <20200614235944.17716-1-laurent.pinchart@ideasonboard.com>
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
---
 drivers/media/platform/ti-vpe/cal.c | 24 +++++++++++-------------
 1 file changed, 11 insertions(+), 13 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index d551f1d9895b..d9cb7a53cb8d 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -449,26 +449,24 @@ static inline void set_field(u32 *valp, u32 field, u32 mask)
 
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

