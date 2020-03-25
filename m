Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 593A4192803
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2020 13:16:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727547AbgCYMQ0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Mar 2020 08:16:26 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:39366 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727504AbgCYMQ0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Mar 2020 08:16:26 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02PCGNZj078573;
        Wed, 25 Mar 2020 07:16:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1585138583;
        bh=hxltfGX2tRMEGP/hcEDWm5TkAPo7noMtfChzZ+2eqrs=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=VzRMa3dv88uYC+Jwch98M5W+ZRXWEmRiKPoveMFYDhXochRY/yQYs4EOIl/X9zNB3
         x6wnfOG0dIDdHoY34leQViEsPhzFx3j1Qh69uJkaRfVdR3c03CzcbCJW/XBk+h8qax
         QMv6yWuQ0gWvcgh+JlbDZSmOo5msoREYpLj7LNAY=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02PCGNAH003813;
        Wed, 25 Mar 2020 07:16:23 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 25
 Mar 2020 07:16:23 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 25 Mar 2020 07:16:23 -0500
Received: from deskari.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02PCFm5H085323;
        Wed, 25 Mar 2020 07:16:21 -0500
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
To:     <linux-media@vger.kernel.org>, Benoit Parrot <bparrot@ti.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil@xs4all.nl>
CC:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH v3 18/19] media: ti-vpe: cal: improve wait for stop-state
Date:   Wed, 25 Mar 2020 14:15:09 +0200
Message-ID: <20200325121510.25923-19-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200325121510.25923-1-tomi.valkeinen@ti.com>
References: <20200325121510.25923-1-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Sometimes there is a timeout when waiting for the Stop-State.  Testing
shows that sometimes we need to wait more than what the current code
does. It is not clear how long this wait can be, but it is based on how
quickly the sensor provides a valid clock, and how quickly CAL syncs to
it.

Change the code to make it more obvious how long we'll wait, and set a
wider range for usleep_range. Increase the timeout to 750ms.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Tested-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Reviewed-by: Benoit Parrot <bparrot@ti.com>
---
 drivers/media/platform/ti-vpe/cal.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index eb8eeb75879d..0f90078ee8c2 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -846,14 +846,15 @@ static void csi2_wait_complexio_reset(struct cal_ctx *ctx)
 
 static void csi2_wait_stop_state(struct cal_ctx *ctx)
 {
-	int i;
+	unsigned long timeout;
 
-	for (i = 0; i < 10; i++) {
+	timeout = jiffies + msecs_to_jiffies(750);
+	while (time_before(jiffies, timeout)) {
 		if (reg_read_field(ctx->dev,
 				   CAL_CSI2_TIMING(ctx->csi2_port),
 				   CAL_CSI2_TIMING_FORCE_RX_MODE_IO1_MASK) == 0)
 			break;
-		usleep_range(1000, 1100);
+		usleep_range(500, 5000);
 	}
 
 	if (reg_read_field(ctx->dev, CAL_CSI2_TIMING(ctx->csi2_port),
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

