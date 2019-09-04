Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CA523A959E
	for <lists+linux-media@lfdr.de>; Wed,  4 Sep 2019 23:54:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730013AbfIDVyf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Sep 2019 17:54:35 -0400
Received: from bin-mail-out-06.binero.net ([195.74.38.229]:29763 "EHLO
        bin-mail-out-06.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729921AbfIDVyf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 4 Sep 2019 17:54:35 -0400
X-Halon-ID: 87923730-cf5e-11e9-837a-0050569116f7
Authorized-sender: niklas@soderlund.pp.se
Received: from bismarck.berto.se (unknown [84.172.84.18])
        by bin-vsp-out-03.atm.binero.net (Halon) with ESMTPA
        id 87923730-cf5e-11e9-837a-0050569116f7;
        Wed, 04 Sep 2019 23:54:12 +0200 (CEST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v3 2/6] rcar-vin: Make use of V4L2_FIELD_IS_INTERLACED() macro
Date:   Wed,  4 Sep 2019 23:54:05 +0200
Message-Id: <20190904215409.30136-3-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190904215409.30136-1-niklas.soderlund+renesas@ragnatech.se>
References: <20190904215409.30136-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The V4L2_FIELD_IS_INTERLACED() can be used to make the code more
readable, use it.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/rcar-vin/rcar-dma.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/rcar-vin/rcar-dma.c b/drivers/media/platform/rcar-vin/rcar-dma.c
index 3cb29b2e0b2b18a9..7d40d71c863265c9 100644
--- a/drivers/media/platform/rcar-vin/rcar-dma.c
+++ b/drivers/media/platform/rcar-vin/rcar-dma.c
@@ -557,16 +557,11 @@ static void rvin_crop_scale_comp_gen2(struct rvin_dev *vin)
 	rvin_write(vin, 0, VNSPPOC_REG);
 	rvin_write(vin, 0, VNSLPOC_REG);
 	rvin_write(vin, vin->format.width - 1, VNEPPOC_REG);
-	switch (vin->format.field) {
-	case V4L2_FIELD_INTERLACED:
-	case V4L2_FIELD_INTERLACED_TB:
-	case V4L2_FIELD_INTERLACED_BT:
+
+	if (V4L2_FIELD_IS_INTERLACED(vin->format.field))
 		rvin_write(vin, vin->format.height / 2 - 1, VNELPOC_REG);
-		break;
-	default:
+	else
 		rvin_write(vin, vin->format.height - 1, VNELPOC_REG);
-		break;
-	}
 
 	vin_dbg(vin,
 		"Pre-Clip: %ux%u@%u:%u YS: %d XS: %d Post-Clip: %ux%u@%u:%u\n",
-- 
2.23.0

