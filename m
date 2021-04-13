Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B09035E5EC
	for <lists+linux-media@lfdr.de>; Tue, 13 Apr 2021 20:04:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347522AbhDMSEj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Apr 2021 14:04:39 -0400
Received: from bin-mail-out-05.binero.net ([195.74.38.228]:27736 "EHLO
        bin-mail-out-05.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1347520AbhDMSEa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Apr 2021 14:04:30 -0400
X-Halon-ID: a452fb5c-9c82-11eb-aed0-005056917f90
Authorized-sender: niklas.soderlund@fsdn.se
Received: from bismarck.berto.se (p54ac5521.dip0.t-ipconnect.de [84.172.85.33])
        by bin-vsp-out-02.atm.binero.net (Halon) with ESMTPA
        id a452fb5c-9c82-11eb-aed0-005056917f90;
        Tue, 13 Apr 2021 20:04:08 +0200 (CEST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 09/11] rcar-vin: Specify media device ops at group creation time
Date:   Tue, 13 Apr 2021 20:02:51 +0200
Message-Id: <20210413180253.2575451-10-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210413180253.2575451-1-niklas.soderlund+renesas@ragnatech.se>
References: <20210413180253.2575451-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The media device operations structure will be different deepening on
what media graph layout is used. Instead of hard-coding the R-Car CSI-2
layout allow the operations to be passed as an argument.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/platform/rcar-vin/rcar-core.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/rcar-vin/rcar-core.c b/drivers/media/platform/rcar-vin/rcar-core.c
index d03ecd443b01c2b3..28bf9e8f19a1a27b 100644
--- a/drivers/media/platform/rcar-vin/rcar-core.c
+++ b/drivers/media/platform/rcar-vin/rcar-core.c
@@ -248,7 +248,8 @@ static void rvin_group_cleanup(struct rvin_group *group)
 }
 
 static int rvin_group_init(struct rvin_group *group, struct rvin_dev *vin,
-			   void (*link_setup)(struct rvin_dev *))
+			   void (*link_setup)(struct rvin_dev *),
+			   const struct media_device_ops *ops)
 {
 	struct media_device *mdev = &group->mdev;
 	const struct of_device_id *match;
@@ -267,7 +268,7 @@ static int rvin_group_init(struct rvin_group *group, struct rvin_dev *vin,
 	group->link_setup = link_setup;
 
 	mdev->dev = vin->dev;
-	mdev->ops = &rvin_media_ops;
+	mdev->ops = ops;
 
 	match = of_match_node(vin->dev->driver->of_match_table,
 			      vin->dev->of_node);
@@ -299,7 +300,8 @@ static void rvin_group_release(struct kref *kref)
 }
 
 static int rvin_group_get(struct rvin_dev *vin,
-			  void (*link_setup)(struct rvin_dev *))
+			  void (*link_setup)(struct rvin_dev *),
+			  const struct media_device_ops *ops)
 {
 	struct rvin_group *group;
 	u32 id;
@@ -331,7 +333,7 @@ static int rvin_group_get(struct rvin_dev *vin,
 			goto err_group;
 		}
 
-		ret = rvin_group_init(group, vin, link_setup);
+		ret = rvin_group_init(group, vin, link_setup, ops);
 		if (ret) {
 			kfree(group);
 			vin_err(vin, "Failed to initialize group\n");
@@ -984,7 +986,7 @@ static int rvin_csi2_init(struct rvin_dev *vin)
 	if (ret < 0)
 		return ret;
 
-	ret = rvin_group_get(vin, rvin_csi2_setup_links);
+	ret = rvin_group_get(vin, rvin_csi2_setup_links, &rvin_media_ops);
 	if (ret)
 		goto err_controls;
 
-- 
2.31.1

