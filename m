Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 000F318AD98
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2020 08:51:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726983AbgCSHvJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Mar 2020 03:51:09 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:52710 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726905AbgCSHvI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Mar 2020 03:51:08 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02J7p5tT083789;
        Thu, 19 Mar 2020 02:51:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1584604266;
        bh=Q+QFukMwNhwDN3SHaEzSg2QOCbg9qA17WjnFw9ZuQz8=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=BszZPuDIrSxduKPFD7B1Wwasly6tL/hYVRmJ53C4VqlV04WwSkmFmvHQsZbSVhmaJ
         8+mUQ+vsPXKy0FwtVARJXrJ0rF7d0BcsjUTJ0yKZAezV2ioSQ35DFupAW9vV5yzI7+
         DYiUbw1vQp0URqMaVxlhnQPgfVfD5nm96EIOt8Wo=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 02J7p5N1036611
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 19 Mar 2020 02:51:05 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 19
 Mar 2020 02:51:05 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 19 Mar 2020 02:51:05 -0500
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02J7oXqu047151;
        Thu, 19 Mar 2020 02:51:04 -0500
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
To:     <linux-media@vger.kernel.org>, Benoit Parrot <bparrot@ti.com>
CC:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH v2 17/19] media: ti-vpe: cal: improve wait for CIO resetdone
Date:   Thu, 19 Mar 2020 09:50:21 +0200
Message-ID: <20200319075023.22151-18-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200319075023.22151-1-tomi.valkeinen@ti.com>
References: <20200319075023.22151-1-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Sometimes there is a timeout when waiting for the 'ComplexIO Reset
Done'.  Testing shows that sometimes we need to wait more than what the
current code does. It is not clear how long this wait can be, but it is
based on how quickly the sensor provides a valid clock, and how quickly
CAL syncs to it.

Change the code to make it more obvious how long we'll wait, and set a
wider range for usleep_range. Increase the timeout to 750ms.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Tested-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
---
 drivers/media/platform/ti-vpe/cal.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index ed68ad58121e..0dc7892881e7 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -825,20 +825,17 @@ static void csi2_phy_init(struct cal_ctx *ctx)
 
 static void csi2_wait_complexio_reset(struct cal_ctx *ctx)
 {
-	int i;
+	unsigned long timeout;
 
-	for (i = 0; i < 250; i++) {
+	timeout = jiffies + msecs_to_jiffies(750);
+	while (time_before(jiffies, timeout)) {
 		if (reg_read_field(ctx->dev,
 				   CAL_CSI2_COMPLEXIO_CFG(ctx->csi2_port),
 				   CAL_CSI2_COMPLEXIO_CFG_RESET_DONE_MASK) ==
 		    CAL_CSI2_COMPLEXIO_CFG_RESET_DONE_RESETCOMPLETED)
 			break;
-		usleep_range(1000, 1100);
+		usleep_range(500, 5000);
 	}
-	ctx_dbg(3, ctx, "CAL_CSI2_COMPLEXIO_CFG(%d) = 0x%08x Complex IO Reset Done (%d) %s\n",
-		ctx->csi2_port,
-		reg_read(ctx->dev, CAL_CSI2_COMPLEXIO_CFG(ctx->csi2_port)), i,
-		(i >= 250) ? "(timeout)" : "");
 
 	if (reg_read_field(ctx->dev, CAL_CSI2_COMPLEXIO_CFG(ctx->csi2_port),
 			   CAL_CSI2_COMPLEXIO_CFG_RESET_DONE_MASK) !=
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

