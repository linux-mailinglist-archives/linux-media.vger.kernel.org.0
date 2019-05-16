Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3995B1FD6B
	for <lists+linux-media@lfdr.de>; Thu, 16 May 2019 03:49:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727452AbfEPBqa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 May 2019 21:46:30 -0400
Received: from vsp-unauthed02.binero.net ([195.74.38.227]:22613 "EHLO
        vsp-unauthed02.binero.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726953AbfEPBPQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 May 2019 21:15:16 -0400
X-Halon-ID: 0d90662a-7778-11e9-8ab4-005056917a89
Authorized-sender: niklas@soderlund.pp.se
Received: from bismarck.berto.se (unknown [89.233.230.99])
        by bin-vsp-out-01.atm.binero.net (Halon) with ESMTPA
        id 0d90662a-7778-11e9-8ab4-005056917a89;
        Thu, 16 May 2019 03:15:12 +0200 (CEST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Ulrich Hecht <uli@fpond.eu>, linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Ulrich Hecht <uli+renesas@fpond.eu>
Subject: [PATCH v2 7/8] rcar-vin: Fold rvin_initialize_device() into rvin_open()
Date:   Thu, 16 May 2019 03:14:16 +0200
Message-Id: <20190516011417.10590-8-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190516011417.10590-1-niklas.soderlund+renesas@ragnatech.se>
References: <20190516011417.10590-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The function no longer serve a purpose as most tasks it performed have
been refactored, fold what remains of it into the only caller.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Reviewed-by: Ulrich Hecht <uli+renesas@fpond.eu>
---
 drivers/media/platform/rcar-vin/rcar-v4l2.c | 21 ++++-----------------
 1 file changed, 4 insertions(+), 17 deletions(-)

diff --git a/drivers/media/platform/rcar-vin/rcar-v4l2.c b/drivers/media/platform/rcar-vin/rcar-v4l2.c
index 7c8ba4b310706ceb..169639416121f204 100644
--- a/drivers/media/platform/rcar-vin/rcar-v4l2.c
+++ b/drivers/media/platform/rcar-vin/rcar-v4l2.c
@@ -762,20 +762,6 @@ static int rvin_power_parallel(struct rvin_dev *vin, bool on)
 	return 0;
 }
 
-static int rvin_initialize_device(struct file *file)
-{
-	struct rvin_dev *vin = video_drvdata(file);
-	int ret;
-
-	ret = rvin_power_parallel(vin, true);
-	if (ret < 0)
-		return ret;
-
-	v4l2_ctrl_handler_setup(&vin->ctrl_handler);
-
-	return 0;
-}
-
 static int rvin_open(struct file *file)
 {
 	struct rvin_dev *vin = video_drvdata(file);
@@ -796,10 +782,11 @@ static int rvin_open(struct file *file)
 		goto err_pm;
 
 	if (v4l2_fh_is_singular_file(file)) {
-		if (rvin_initialize_device(file)) {
-			ret = -ENODEV;
+		ret = rvin_power_parallel(vin, true);
+		if (ret < 0)
 			goto err_open;
-		}
+
+		v4l2_ctrl_handler_setup(&vin->ctrl_handler);
 	}
 
 	mutex_unlock(&vin->lock);
-- 
2.21.0

