Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8639E2F470F
	for <lists+linux-media@lfdr.de>; Wed, 13 Jan 2021 10:08:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727359AbhAMJDT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Jan 2021 04:03:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726862AbhAMJDS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Jan 2021 04:03:18 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10DE0C061575
        for <linux-media@vger.kernel.org>; Wed, 13 Jan 2021 01:02:38 -0800 (PST)
Received: from deskari.lan (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 570EF2B3;
        Wed, 13 Jan 2021 10:02:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1610528555;
        bh=ajDXvlJVCvYo7T63SWh+Uproeoa+rxHFZ6QzmdLoNBk=;
        h=From:To:Cc:Subject:Date:From;
        b=wlHf4vxIXIMrWwzUUIb0GbF25/Y9NEIh51eyE5REGNFd7F5y6nZESu7FTnS7l2tpd
         u61pE+Q7g+G2YW3lHIGJXQFyOY6/Z+bnrR08jBXbb4ZXmg8+gC0rjrVSzPKNgyTgH/
         D9F1WLQ1Jl2TjmNdpSn1xNbYI/9x73hTMcbiV7ag=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     Benoit Parrot <bparrot@ti.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH] media: ti-vpe: cal: fix write to unallocated memory
Date:   Wed, 13 Jan 2021 11:00:27 +0200
Message-Id: <20210113090027.234403-1-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The asd allocated with v4l2_async_notifier_add_fwnode_subdev() must be
of size cal_v4l2_async_subdev, otherwise access to
cal_v4l2_async_subdev->phy will go to unallocated memory.

Fixes: 8fcb7576ad19 ("media: ti-vpe: cal: Allow multiple contexts per subdev notifier")
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/platform/ti-vpe/cal.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index 59a0266b1f39..2eef245c31a1 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -406,7 +406,7 @@ static irqreturn_t cal_irq(int irq_cal, void *data)
  */
 
 struct cal_v4l2_async_subdev {
-	struct v4l2_async_subdev asd;
+	struct v4l2_async_subdev asd; /* Must be first */
 	struct cal_camerarx *phy;
 };
 
@@ -472,7 +472,7 @@ static int cal_async_notifier_register(struct cal_dev *cal)
 		fwnode = of_fwnode_handle(phy->sensor_node);
 		asd = v4l2_async_notifier_add_fwnode_subdev(&cal->notifier,
 							    fwnode,
-							    sizeof(*asd));
+							    sizeof(*casd));
 		if (IS_ERR(asd)) {
 			phy_err(phy, "Failed to add subdev to notifier\n");
 			ret = PTR_ERR(asd);
-- 
2.25.1

