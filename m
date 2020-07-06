Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5E93215E99
	for <lists+linux-media@lfdr.de>; Mon,  6 Jul 2020 20:38:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729920AbgGFSiK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Jul 2020 14:38:10 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:45198 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729779AbgGFSiK (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Jul 2020 14:38:10 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6C2F71972;
        Mon,  6 Jul 2020 20:37:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1594060676;
        bh=cR7sC0HM7fuf/L39RM5X0B2XCWrqz5cwYZCnwY17HsE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=C0xaPZWBFyQDlVCCFrxEDD8pExlDt+0AKyUuPh7a8bdb/PPocgoF0sA/RxS8EW15I
         mFwQuAWNbzwgsbjNWqJEQRlnsGP1aFuYEev3PMivO0Mfq9MQyc6qS/Wn1KuFps0vnC
         +lMC2kPCrRc9u1l3fiYu4XsU0IgRET6ceeMZ7LGw=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: [PATCH v2 042/108] media: ti-vpe: cal: Use a loop to create CAMERARX and context instances
Date:   Mon,  6 Jul 2020 21:36:03 +0300
Message-Id: <20200706183709.12238-43-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200706183709.12238-1-laurent.pinchart@ideasonboard.com>
References: <20200706183709.12238-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Replace a manually unrolled loop with an explicit for loop to increase
readability when creating the CAMERARX and context instances. The
explicit NULL initialization of cal->phy[] and cal->ctx[] is removed, as
the cal structure is zeroed when allocated.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Reviewed-by: Benoit Parrot <bparrot@ti.com>
---
 drivers/media/platform/ti-vpe/cal.c | 21 ++++++---------------
 1 file changed, 6 insertions(+), 15 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index b55c8fb369a0..f92d6e49571f 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -2348,24 +2348,15 @@ static int cal_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, cal);
 
-	cal->phy[0] = cal_camerarx_create(cal, 0);
-	if (IS_ERR(cal->phy[0]))
-		return PTR_ERR(cal->phy[0]);
-
-	if (cal->data->num_csi2_phy > 1) {
-		cal->phy[1] = cal_camerarx_create(cal, 1);
-		if (IS_ERR(cal->phy[1]))
-			return PTR_ERR(cal->phy[1]);
-	} else {
-		cal->phy[1] = NULL;
+	for (i = 0; i < cal->data->num_csi2_phy; ++i) {
+		cal->phy[i] = cal_camerarx_create(cal, i);
+		if (IS_ERR(cal->phy[i]))
+			return PTR_ERR(cal->phy[i]);
 	}
 
-	cal->ctx[0] = NULL;
-	cal->ctx[1] = NULL;
+	for (i = 0; i < cal->data->num_csi2_phy; ++i)
+		cal->ctx[i] = cal_create_instance(cal, i);
 
-	cal->ctx[0] = cal_create_instance(cal, 0);
-	if (cal->data->num_csi2_phy > 1)
-		cal->ctx[1] = cal_create_instance(cal, 1);
 	if (!cal->ctx[0] && !cal->ctx[1]) {
 		cal_err(cal, "Neither port is configured, no point in staying up\n");
 		return -ENODEV;
-- 
Regards,

Laurent Pinchart

