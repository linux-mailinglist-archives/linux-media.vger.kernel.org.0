Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C958D235985
	for <lists+linux-media@lfdr.de>; Sun,  2 Aug 2020 19:37:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727019AbgHBRhS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 2 Aug 2020 13:37:18 -0400
Received: from vsp-unauthed02.binero.net ([195.74.38.227]:14349 "EHLO
        vsp-unauthed02.binero.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725952AbgHBRhS (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 2 Aug 2020 13:37:18 -0400
X-Greylist: delayed 362 seconds by postgrey-1.27 at vger.kernel.org; Sun, 02 Aug 2020 13:37:18 EDT
X-Halon-ID: ef59342a-d4e5-11ea-8fb8-005056917f90
Authorized-sender: niklas@soderlund.pp.se
Received: from bismarck.berto.se (p54ac52a8.dip0.t-ipconnect.de [84.172.82.168])
        by bin-vsp-out-02.atm.binero.net (Halon) with ESMTPA
        id ef59342a-d4e5-11ea-8fb8-005056917f90;
        Sun, 02 Aug 2020 19:31:14 +0200 (CEST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH] rcar-vin: Remove redundant compatible values
Date:   Sun,  2 Aug 2020 19:30:59 +0200
Message-Id: <20200802173059.122595-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The compatible value 'renesas,rcar-gen2-vin' have always been mandatory
for all Gen2 platforms. Remove device redundant values.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/platform/rcar-vin/rcar-core.c | 16 ----------------
 1 file changed, 16 deletions(-)
---
Hi,

After the recent bindings conversion to YAML which makes it abundantly 
clear that the generic 'renesas,rcar-gen2-vin' compatibility value are 
mandatory (which is always have been) remove values that are not needed 
to reduce size.

diff --git a/drivers/media/platform/rcar-vin/rcar-core.c b/drivers/media/platform/rcar-vin/rcar-core.c
index 7440c8965d27e64f..aad8eef2ac9f641b 100644
--- a/drivers/media/platform/rcar-vin/rcar-core.c
+++ b/drivers/media/platform/rcar-vin/rcar-core.c
@@ -1228,22 +1228,6 @@ static const struct of_device_id rvin_of_id_table[] = {
 		.compatible = "renesas,vin-r8a7779",
 		.data = &rcar_info_h1,
 	},
-	{
-		.compatible = "renesas,vin-r8a7790",
-		.data = &rcar_info_gen2,
-	},
-	{
-		.compatible = "renesas,vin-r8a7791",
-		.data = &rcar_info_gen2,
-	},
-	{
-		.compatible = "renesas,vin-r8a7793",
-		.data = &rcar_info_gen2,
-	},
-	{
-		.compatible = "renesas,vin-r8a7794",
-		.data = &rcar_info_gen2,
-	},
 	{
 		.compatible = "renesas,rcar-gen2-vin",
 		.data = &rcar_info_gen2,
-- 
2.28.0

