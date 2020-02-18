Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6AD811625AD
	for <lists+linux-media@lfdr.de>; Tue, 18 Feb 2020 12:44:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726422AbgBRLod (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Feb 2020 06:44:33 -0500
Received: from smtp1.de.adit-jv.com ([93.241.18.167]:32904 "EHLO
        smtp1.de.adit-jv.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726043AbgBRLod (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Feb 2020 06:44:33 -0500
Received: from localhost (smtp1.de.adit-jv.com [127.0.0.1])
        by smtp1.de.adit-jv.com (Postfix) with ESMTP id C02573C057C;
        Tue, 18 Feb 2020 12:44:30 +0100 (CET)
Received: from smtp1.de.adit-jv.com ([127.0.0.1])
        by localhost (smtp1.de.adit-jv.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id fH-QhLVjk6Dg; Tue, 18 Feb 2020 12:44:25 +0100 (CET)
Received: from HI2EXCH01.adit-jv.com (hi2exch01.adit-jv.com [10.72.92.24])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by smtp1.de.adit-jv.com (Postfix) with ESMTPS id 847193C00C5;
        Tue, 18 Feb 2020 12:44:25 +0100 (CET)
Received: from vmlxhi-121.adit-jv.com (10.72.93.65) by HI2EXCH01.adit-jv.com
 (10.72.92.24) with Microsoft SMTP Server (TLS) id 14.3.468.0; Tue, 18 Feb
 2020 12:44:24 +0100
From:   Michael Rodin <mrodin@de.adit-jv.com>
To:     <niklas.soderlund@ragnatech.se>, <mchehab@kernel.org>,
        <p.zabel@pengutronix.de>, <linux-media@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     Michael Rodin <mrodin@de.adit-jv.com>, <efriedrich@de.adit-jv.com>,
        <erosca@de.adit-jv.com>, <sudipi@jp.adit-jv.com>,
        <akiyama@nds-osk.co.jp>
Subject: [PATCH] [RFC] media: rcar-vin: don't wait for stop state on clock lane during start of CSI2
Date:   Tue, 18 Feb 2020 12:44:11 +0100
Message-ID: <1582026251-21047-1-git-send-email-mrodin@de.adit-jv.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.72.93.65]
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The chapter 7.1 "D-PHY Physical Layer Option" of the CSI2 specification
states that non-continuous clock behavior is optional, i.e. the Clock Lane
can remain in high-speed mode between the transmission of data packets.
Therefore waiting for the stop state (LP-11) on the Clock Lane is wrong and
will cause timeouts when a CSI2 transmitter with continuous clock behavior
is attached to R-Car CSI2 receiver. So wait only for the stop state on the
Data Lanes.

Signed-off-by: Michael Rodin <mrodin@de.adit-jv.com>
---
 drivers/media/platform/rcar-vin/rcar-csi2.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/platform/rcar-vin/rcar-csi2.c b/drivers/media/platform/rcar-vin/rcar-csi2.c
index faa9fb2..6d1992a 100644
--- a/drivers/media/platform/rcar-vin/rcar-csi2.c
+++ b/drivers/media/platform/rcar-vin/rcar-csi2.c
@@ -416,8 +416,7 @@ static int rcsi2_wait_phy_start(struct rcar_csi2 *priv)
 	for (timeout = 0; timeout <= 20; timeout++) {
 		const u32 lane_mask = (1 << priv->lanes) - 1;
 
-		if ((rcsi2_read(priv, PHCLM_REG) & PHCLM_STOPSTATECKL)  &&
-		    (rcsi2_read(priv, PHDLM_REG) & lane_mask) == lane_mask)
+		if ((rcsi2_read(priv, PHDLM_REG) & lane_mask) == lane_mask)
 			return 0;
 
 		usleep_range(1000, 2000);
-- 
2.7.4

