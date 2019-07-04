Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2E1155FC5D
	for <lists+linux-media@lfdr.de>; Thu,  4 Jul 2019 19:16:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727455AbfGDRQ2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Jul 2019 13:16:28 -0400
Received: from bin-mail-out-05.binero.net ([195.74.38.228]:64739 "EHLO
        bin-mail-out-05.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727452AbfGDRQ1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 4 Jul 2019 13:16:27 -0400
X-Halon-ID: 73a8bd29-9e7f-11e9-8ab4-005056917a89
Authorized-sender: niklas@soderlund.pp.se
Received: from bismarck.berto.se (unknown [145.14.112.32])
        by bin-vsp-out-01.atm.binero.net (Halon) with ESMTPA
        id 73a8bd29-9e7f-11e9-8ab4-005056917a89;
        Thu, 04 Jul 2019 19:16:25 +0200 (CEST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH v4 4/4] rcar-vin: Always setup controls when opening video device
Date:   Thu,  4 Jul 2019 19:16:02 +0200
Message-Id: <20190704171602.29541-5-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190704171602.29541-1-niklas.soderlund+renesas@ragnatech.se>
References: <20190704171602.29541-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Now that both Gen2 (video device centric) and Gen3 (media device
centric) modes of the driver have controls it is required to always
setup the controls when opening the devices. Remove the check which only
calls v4l2_ctrl_handler_setup() for Gen2 and call it unconditionally.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---
 drivers/media/platform/rcar-vin/rcar-v4l2.c | 30 ++++++++++-----------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/media/platform/rcar-vin/rcar-v4l2.c b/drivers/media/platform/rcar-vin/rcar-v4l2.c
index f8b6ec4408b2f5fa..cbf5d8cd6db32d77 100644
--- a/drivers/media/platform/rcar-vin/rcar-v4l2.c
+++ b/drivers/media/platform/rcar-vin/rcar-v4l2.c
@@ -789,26 +789,26 @@ static int rvin_open(struct file *file)
 	if (ret)
 		goto err_unlock;
 
-	if (vin->info->use_mc) {
+	if (vin->info->use_mc)
 		ret = v4l2_pipeline_pm_use(&vin->vdev.entity, 1);
-		if (ret < 0)
-			goto err_open;
-	} else {
-		if (v4l2_fh_is_singular_file(file)) {
-			ret = rvin_power_parallel(vin, true);
-			if (ret < 0)
-				goto err_open;
+	else if (v4l2_fh_is_singular_file(file))
+		ret = rvin_power_parallel(vin, true);
+
+	if (ret < 0)
+		goto err_open;
+
+	ret = v4l2_ctrl_handler_setup(&vin->ctrl_handler);
+	if (ret)
+		goto err_power;
 
-			ret = v4l2_ctrl_handler_setup(&vin->ctrl_handler);
-			if (ret)
-				goto err_parallel;
-		}
-	}
 	mutex_unlock(&vin->lock);
 
 	return 0;
-err_parallel:
-	rvin_power_parallel(vin, false);
+err_power:
+	if (vin->info->use_mc)
+		v4l2_pipeline_pm_use(&vin->vdev.entity, 0);
+	else if (v4l2_fh_is_singular_file(file))
+		rvin_power_parallel(vin, false);
 err_open:
 	v4l2_fh_release(file);
 err_unlock:
-- 
2.21.0

