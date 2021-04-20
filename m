Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E90F36587A
	for <lists+linux-media@lfdr.de>; Tue, 20 Apr 2021 14:06:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232260AbhDTMGF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Apr 2021 08:06:05 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:57980 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232226AbhDTMGE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Apr 2021 08:06:04 -0400
Received: from deskari.lan (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DD7FC1235;
        Tue, 20 Apr 2021 14:05:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1618920331;
        bh=miHNtt2G/RnaJ2u4ghoH+opFn0rLOQ/yJJoBzzqhv1U=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=e7P+kzGo7Bp93hin/ceiMeYoA9EQowpAO8hcwnB5v/b9jEa9UpPt0YFSU0qXpLt1G
         VgWIw9p13ovS8h1rXqUQXA9Dc8UubM2hxkZVc1XNegHXCDWzHtoVtEYoEJ6YJ4Bjzn
         NNg0nE4aBN6Ug2UR0DMaQlwnA7gtsrXLyrQL0x7k=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     Benoit Parrot <bparrot@ti.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Pratyush Yadav <p.yadav@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>, linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v2 29/35] media: ti-vpe: cal: cleanup phy iteration in cal_remove
Date:   Tue, 20 Apr 2021 15:04:27 +0300
Message-Id: <20210420120433.902394-30-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210420120433.902394-1-tomi.valkeinen@ideasonboard.com>
References: <20210420120433.902394-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Most of the driver has moved from ARRAY_SIZE(cal->phy) to
cal->data->num_csi2_phy, but we have one place left in cal_remove. Also,
checking for cal->phy[i] != NULL is not needed as we always have all the
phys instantiated.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/platform/ti-vpe/cal.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index d43972c392fc..bb99d0ce796f 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -1173,10 +1173,8 @@ static int cal_remove(struct platform_device *pdev)
 
 	cal_media_unregister(cal);
 
-	for (i = 0; i < ARRAY_SIZE(cal->phy); i++) {
-		if (cal->phy[i])
-			cal_camerarx_disable(cal->phy[i]);
-	}
+	for (i = 0; i < cal->data->num_csi2_phy; i++)
+		cal_camerarx_disable(cal->phy[i]);
 
 	cal_media_cleanup(cal);
 
-- 
2.25.1

