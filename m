Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7CF4F2CA8B3
	for <lists+linux-media@lfdr.de>; Tue,  1 Dec 2020 17:49:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390517AbgLAQtm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Dec 2020 11:49:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388682AbgLAQtm (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 1 Dec 2020 11:49:42 -0500
Received: from hillosipuli.retiisi.eu (unknown [IPv6:2a01:4f9:c010:4572::e8:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7499C0613CF
        for <linux-media@vger.kernel.org>; Tue,  1 Dec 2020 08:48:01 -0800 (PST)
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 44FD6634C96;
        Tue,  1 Dec 2020 18:45:13 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, mchehab@kernel.org
Subject: [PATCH v2 12/30] ccs: The functions to get compose or crop rectangle never return NULL
Date:   Tue,  1 Dec 2020 18:42:28 +0200
Message-Id: <20201201164246.18003-13-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201201164246.18003-1-sakari.ailus@linux.intel.com>
References: <20201201164246.18003-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The NULL check is not needed as the functions do not return NULL. Remove
the check (and BUG).

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs/ccs-core.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index dec248fe7cc1..25b4c84524ff 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -1766,16 +1766,12 @@ static void ccs_get_crop_compose(struct v4l2_subdev *subdev,
 			*comps = &ssd->compose;
 	} else {
 		if (crops) {
-			for (i = 0; i < subdev->entity.num_pads; i++) {
+			for (i = 0; i < subdev->entity.num_pads; i++)
 				crops[i] = v4l2_subdev_get_try_crop(subdev, cfg, i);
-				BUG_ON(!crops[i]);
-			}
 		}
-		if (comps) {
+		if (comps)
 			*comps = v4l2_subdev_get_try_compose(subdev, cfg,
 							     CCS_PAD_SINK);
-			BUG_ON(!*comps);
-		}
 	}
 }
 
-- 
2.27.0

