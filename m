Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1BEB215E9B
	for <lists+linux-media@lfdr.de>; Mon,  6 Jul 2020 20:38:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729805AbgGFSiM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Jul 2020 14:38:12 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:45202 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729915AbgGFSiL (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Jul 2020 14:38:11 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D337A1A55;
        Mon,  6 Jul 2020 20:37:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1594060677;
        bh=uVjxxxRKWQLvU1QqfuP9Ou3ERIZBJ3R/E6wJHZ8okqQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Ipl4MCTafpvZKjtgNfRjauGcuS8owTV1oPELcuomAwM6cHqWCdxtynuZDcfJbM0bv
         oXnqo4bnuO+x3FjIhdhIxeDImn1rtGi8KqI4TVaLSwlBI1J3Jeymg/MzjE9jeY7+rB
         vXUhFRO+GF3O3Q5U7inFTMyEGZPbAX6hhBP0HatQ=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: [PATCH v2 043/108] media: ti-vpe: cal: Drop struct cal_dev v4l2_dev field
Date:   Mon,  6 Jul 2020 21:36:04 +0300
Message-Id: <20200706183709.12238-44-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200706183709.12238-1-laurent.pinchart@ideasonboard.com>
References: <20200706183709.12238-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The v4l2_dev field of the cal_dev structure is initialized but never
used. Drop it.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Reviewed-by: Benoit Parrot <bparrot@ti.com>
---
 drivers/media/platform/ti-vpe/cal.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index f92d6e49571f..feb53b862306 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -279,7 +279,6 @@ struct cal_dev {
 	void __iomem		*base;
 	struct resource		*res;
 	struct platform_device	*pdev;
-	struct v4l2_device	v4l2_dev;
 
 	const struct cal_data	*data;
 
@@ -2288,10 +2287,6 @@ static int cal_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	/* set pseudo v4l2 device name so we can use v4l2_printk */
-	strscpy(cal->v4l2_dev.name, CAL_MODULE_NAME,
-		sizeof(cal->v4l2_dev.name));
-
 	/* save pdev pointer */
 	cal->pdev = pdev;
 
-- 
Regards,

Laurent Pinchart

