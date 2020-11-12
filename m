Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A035F2B1238
	for <lists+linux-media@lfdr.de>; Thu, 12 Nov 2020 23:53:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726774AbgKLWxM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Nov 2020 17:53:12 -0500
Received: from vsp-unauthed02.binero.net ([195.74.38.227]:58862 "EHLO
        vsp-unauthed02.binero.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726102AbgKLWxM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Nov 2020 17:53:12 -0500
X-Halon-ID: 81eed9d3-2539-11eb-bcc0-005056917f90
Authorized-sender: niklas.soderlund@fsdn.se
Received: from bismarck.berto.se (p4fca2458.dip0.t-ipconnect.de [79.202.36.88])
        by bin-vsp-out-02.atm.binero.net (Halon) with ESMTPA
        id 81eed9d3-2539-11eb-bcc0-005056917f90;
        Thu, 12 Nov 2020 23:50:49 +0100 (CET)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 1/4] rcar-vin: Do not try to stop stream if not running
Date:   Thu, 12 Nov 2020 23:51:44 +0100
Message-Id: <20201112225147.1672622-2-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201112225147.1672622-1-niklas.soderlund+renesas@ragnatech.se>
References: <20201112225147.1672622-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Do not attempt to stop the streaming if the stream is not running.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/platform/rcar-vin/rcar-dma.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/platform/rcar-vin/rcar-dma.c b/drivers/media/platform/rcar-vin/rcar-dma.c
index 5a5f0e5007478c8d..eae25972ed7df2b6 100644
--- a/drivers/media/platform/rcar-vin/rcar-dma.c
+++ b/drivers/media/platform/rcar-vin/rcar-dma.c
@@ -1302,6 +1302,11 @@ void rvin_stop_streaming(struct rvin_dev *vin)
 
 	spin_lock_irqsave(&vin->qlock, flags);
 
+	if (vin->state == STOPPED) {
+		spin_unlock_irqrestore(&vin->qlock, flags);
+		return;
+	}
+
 	vin->state = STOPPING;
 
 	/* Wait until only scratch buffer is used, max 3 interrupts. */
-- 
2.29.2

