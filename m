Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2113B5FC56
	for <lists+linux-media@lfdr.de>; Thu,  4 Jul 2019 19:16:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727454AbfGDRQX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Jul 2019 13:16:23 -0400
Received: from bin-mail-out-06.binero.net ([195.74.38.229]:10946 "EHLO
        bin-mail-out-06.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727446AbfGDRQX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 4 Jul 2019 13:16:23 -0400
X-Halon-ID: 70adcd60-9e7f-11e9-8ab4-005056917a89
Authorized-sender: niklas@soderlund.pp.se
Received: from bismarck.berto.se (unknown [145.14.112.32])
        by bin-vsp-out-01.atm.binero.net (Halon) with ESMTPA
        id 70adcd60-9e7f-11e9-8ab4-005056917a89;
        Thu, 04 Jul 2019 19:16:21 +0200 (CEST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Ulrich Hecht <uli+renesas@fpond.eu>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH v4 1/4] rcar-vin: Rename VNDMR_DTMD_ARGB1555 to VNDMR_DTMD_ARGB
Date:   Thu,  4 Jul 2019 19:15:59 +0200
Message-Id: <20190704171602.29541-2-niklas.soderlund+renesas@ragnatech.se>
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

The value have nothing to do with ARGB1555, it controls if the alpha
component should be filled in for ARGB1555 or ARGB888. Rename it to
reflect this.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Reviewed-by: Ulrich Hecht <uli+renesas@fpond.eu>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---
 drivers/media/platform/rcar-vin/rcar-dma.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/rcar-vin/rcar-dma.c b/drivers/media/platform/rcar-vin/rcar-dma.c
index 91ab064404a185af..2d146ecf93d66ad5 100644
--- a/drivers/media/platform/rcar-vin/rcar-dma.c
+++ b/drivers/media/platform/rcar-vin/rcar-dma.c
@@ -114,7 +114,7 @@
 #define VNDMR_EXRGB		(1 << 8)
 #define VNDMR_BPSM		(1 << 4)
 #define VNDMR_DTMD_YCSEP	(1 << 1)
-#define VNDMR_DTMD_ARGB1555	(1 << 0)
+#define VNDMR_DTMD_ARGB		(1 << 0)
 
 /* Video n Data Mode Register 2 bits */
 #define VNDMR2_VPS		(1 << 30)
@@ -721,7 +721,7 @@ static int rvin_setup(struct rvin_dev *vin)
 		output_is_yuv = true;
 		break;
 	case V4L2_PIX_FMT_XRGB555:
-		dmr = VNDMR_DTMD_ARGB1555;
+		dmr = VNDMR_DTMD_ARGB;
 		break;
 	case V4L2_PIX_FMT_RGB565:
 		dmr = 0;
-- 
2.21.0

