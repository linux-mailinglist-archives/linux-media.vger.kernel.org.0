Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 71F918577E
	for <lists+linux-media@lfdr.de>; Thu,  8 Aug 2019 03:19:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389596AbfHHBTu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Aug 2019 21:19:50 -0400
Received: from bin-mail-out-05.binero.net ([195.74.38.228]:17985 "EHLO
        bin-mail-out-05.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2389592AbfHHBTu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 7 Aug 2019 21:19:50 -0400
X-Halon-ID: 97b22726-b97a-11e9-bdc3-005056917a89
Authorized-sender: niklas@soderlund.pp.se
Received: from bismarck.berto.se (unknown [145.14.112.32])
        by bin-vsp-out-01.atm.binero.net (Halon) with ESMTPA
        id 97b22726-b97a-11e9-bdc3-005056917a89;
        Thu, 08 Aug 2019 03:19:40 +0200 (CEST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2 2/6] rcar-vin: Make use of V4L2_FIELD_IS_INTERLACED() macro
Date:   Thu,  8 Aug 2019 03:18:46 +0200
Message-Id: <20190808011850.21219-3-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190808011850.21219-1-niklas.soderlund+renesas@ragnatech.se>
References: <20190808011850.21219-1-niklas.soderlund+renesas@ragnatech.se>
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
---
 drivers/media/platform/rcar-vin/rcar-dma.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/rcar-vin/rcar-dma.c b/drivers/media/platform/rcar-vin/rcar-dma.c
index f16f2966f9628b72..6be1f33d44e2170c 100644
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
2.22.0

