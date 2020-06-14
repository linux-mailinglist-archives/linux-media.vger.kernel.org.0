Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9ABD21F8B95
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2020 02:01:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728157AbgFOABF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Jun 2020 20:01:05 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:33340 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728151AbgFOABC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Jun 2020 20:01:02 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E1A84214E;
        Mon, 15 Jun 2020 02:00:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1592179230;
        bh=RyyB3LB8r8rz2+iIBGAyuakiqEjIJtcJiR+Z1bV73c8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=KkPAhkpZXPOhQWs4bSnnNY9Gyyy5KBQvX42vTCl+ym66DaNi/V4+aq8yMFzWwNCzb
         HzYaA+NLEYM6tf+XH6Qdv3Sq2AIsNuVtcoxud41ZOv2ZVjuzN+nr7jcrKdCDPxH5jt
         tBMNtbVw6JH246Yr2Rdo3mXrDQXmXTF7Vm4xDXwk=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: [PATCH v1 044/107] media: ti-vpe: cal: Use syscon_regmap_lookup_by_phandle_args()
Date:   Mon, 15 Jun 2020 02:58:41 +0300
Message-Id: <20200614235944.17716-45-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200614235944.17716-1-laurent.pinchart@ideasonboard.com>
References: <20200614235944.17716-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use the syscon_regmap_lookup_by_phandle_args() function to replace
manual lookup of the syscon regmap offset. This simplifies the
cal_camerarx_init_regmap() implementation.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/ti-vpe/cal.c | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index d7f251b8a8a3..522b2b4b76e0 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -994,17 +994,14 @@ static int cal_camerarx_init_regmap(struct cal_dev *cal)
 {
 	struct device_node *np = cal->pdev->dev.of_node;
 	struct regmap *syscon;
-	u32 syscon_offset;
-	int ret;
+	unsigned int offset;
 
-	syscon = syscon_regmap_lookup_by_phandle(np, "ti,camerrx-control");
-	ret = of_property_read_u32_index(np, "ti,camerrx-control", 1,
-					 &syscon_offset);
-	if (IS_ERR(syscon))
-		ret = PTR_ERR(syscon);
-	if (ret) {
+	syscon = syscon_regmap_lookup_by_phandle_args(np, "ti,camerrx-control",
+						      1, &offset);
+	if (IS_ERR(syscon)) {
 		dev_warn(&cal->pdev->dev,
-			 "failed to get ti,camerrx-control: %d\n", ret);
+			 "failed to get ti,camerrx-control: %ld\n",
+			 PTR_ERR(syscon));
 
 		/*
 		 * Backward DTS compatibility.
@@ -1020,11 +1017,11 @@ static int cal_camerarx_init_regmap(struct cal_dev *cal)
 		/* In this case the base already point to the direct
 		 * CM register so no need for an offset
 		 */
-		syscon_offset = 0;
+		offset = 0;
 	}
 
 	cal->syscon_camerrx = syscon;
-	cal->syscon_camerrx_offset = syscon_offset;
+	cal->syscon_camerrx_offset = offset;
 
 	return 0;
 }
-- 
Regards,

Laurent Pinchart

