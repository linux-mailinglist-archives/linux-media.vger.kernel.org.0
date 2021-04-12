Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA56935C541
	for <lists+linux-media@lfdr.de>; Mon, 12 Apr 2021 13:35:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240388AbhDLLfb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Apr 2021 07:35:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240007AbhDLLfb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Apr 2021 07:35:31 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22730C061574
        for <linux-media@vger.kernel.org>; Mon, 12 Apr 2021 04:35:13 -0700 (PDT)
Received: from deskari.lan (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C3541DBC;
        Mon, 12 Apr 2021 13:35:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1618227311;
        bh=TnJjRTKtPzYjEEeUoMQB+ywQs1L46joJFJQCMPRFh08=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=wom23JZduFoD6TbBWq5k0GK903w4FwTVNxL1b+/CPWLDJOmzwklobIU6wblt0eSLF
         BV+FjEfPi9RP5AgCDaGwSLuTR1McRuQk9DI7MBQhT0hq4VWZmLRbPKcGPTGtDO0MNf
         2bhh4PU8nrtkEFM4k8UX15RkpxRDJiLc977mogD0=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     Benoit Parrot <bparrot@ti.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Pratyush Yadav <p.yadav@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>, linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH 02/28] media: ti-vpe: cal: fix error handling in cal_camerarx_create
Date:   Mon, 12 Apr 2021 14:34:31 +0300
Message-Id: <20210412113457.328012-3-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210412113457.328012-1-tomi.valkeinen@ideasonboard.com>
References: <20210412113457.328012-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

cal_camerarx_create() doesn't handle error returned from
cal_camerarx_sd_init_cfg() and it always runs all the cleanup/free
functions in the error code path. The latter doesn't cause any issues at
the moment as media_entity_cleanup() is an empty function.

Fix the error handling.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/platform/ti-vpe/cal-camerarx.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal-camerarx.c b/drivers/media/platform/ti-vpe/cal-camerarx.c
index cbe6114908de..820fb483c402 100644
--- a/drivers/media/platform/ti-vpe/cal-camerarx.c
+++ b/drivers/media/platform/ti-vpe/cal-camerarx.c
@@ -812,7 +812,7 @@ struct cal_camerarx *cal_camerarx_create(struct cal_dev *cal,
 	if (IS_ERR(phy->base)) {
 		cal_err(cal, "failed to ioremap\n");
 		ret = PTR_ERR(phy->base);
-		goto error;
+		goto err_free_phy;
 	}
 
 	cal_dbg(1, cal, "ioresource %s at %pa - %pa\n",
@@ -820,11 +820,11 @@ struct cal_camerarx *cal_camerarx_create(struct cal_dev *cal,
 
 	ret = cal_camerarx_regmap_init(cal, phy);
 	if (ret)
-		goto error;
+		goto err_free_phy;
 
 	ret = cal_camerarx_parse_dt(phy);
 	if (ret)
-		goto error;
+		goto err_free_phy;
 
 	/* Initialize the V4L2 subdev and media entity. */
 	sd = &phy->subdev;
@@ -840,18 +840,21 @@ struct cal_camerarx *cal_camerarx_create(struct cal_dev *cal,
 	ret = media_entity_pads_init(&sd->entity, ARRAY_SIZE(phy->pads),
 				     phy->pads);
 	if (ret)
-		goto error;
+		goto err_entity_cleanup;
 
-	cal_camerarx_sd_init_cfg(sd, NULL);
+	ret = cal_camerarx_sd_init_cfg(sd, NULL);
+	if (ret)
+		goto err_entity_cleanup;
 
 	ret = v4l2_device_register_subdev(&cal->v4l2_dev, sd);
 	if (ret)
-		goto error;
+		goto err_entity_cleanup;
 
 	return phy;
 
-error:
+err_entity_cleanup:
 	media_entity_cleanup(&phy->subdev.entity);
+err_free_phy:
 	kfree(phy);
 	return ERR_PTR(ret);
 }
-- 
2.25.1

