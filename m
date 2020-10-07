Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7AF88285B24
	for <lists+linux-media@lfdr.de>; Wed,  7 Oct 2020 10:47:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728105AbgJGIrH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Oct 2020 04:47:07 -0400
Received: from retiisi.org.uk ([95.216.213.190]:57058 "EHLO
        hillosipuli.retiisi.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727967AbgJGIqF (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Oct 2020 04:46:05 -0400
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 558DB634CC1
        for <linux-media@vger.kernel.org>; Wed,  7 Oct 2020 11:45:18 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH v2 037/106] ccs: The functions to get compose or crop rectangle never return NULL
Date:   Wed,  7 Oct 2020 11:44:50 +0300
Message-Id: <20201007084557.25843-30-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201007084557.25843-1-sakari.ailus@linux.intel.com>
References: <20201007084505.25761-1-sakari.ailus@linux.intel.com>
 <20201007084557.25843-1-sakari.ailus@linux.intel.com>
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
index 963f945ceaf0..d19267591d33 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -1760,16 +1760,12 @@ static void ccs_get_crop_compose(struct v4l2_subdev *subdev,
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

