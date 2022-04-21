Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0130A50A29C
	for <lists+linux-media@lfdr.de>; Thu, 21 Apr 2022 16:35:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1389477AbiDUOiD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Apr 2022 10:38:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1389453AbiDUOhv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Apr 2022 10:37:51 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 830C1DD5
        for <linux-media@vger.kernel.org>; Thu, 21 Apr 2022 07:35:01 -0700 (PDT)
Received: from deskari.lan (91-156-85-209.elisa-laajakaista.fi [91.156.85.209])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 52A5C4A8;
        Thu, 21 Apr 2022 16:34:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1650551699;
        bh=0bZFhyfxcUSO7m7h10tlWfmx8i04MsRwsE1JieRuXjw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=MqNUSvL03FR5oNH1a7PmYygF8yLKm/aE+feQfkVSCKR/fR+OGA45ErYV/Bn0SgqYl
         N+Z7zUvy+4fiR4Z2oivaTCRjuMO+dR441MMGp/MtViY6ny2sNHU3sLNMgfGa6NmoKx
         9UKiKSTaAtBZk6z77Lk03nYtAbzXtsly4Xqibha4=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH 1/6] media: ti: cal: fix error paths in cal_camerarx_create()
Date:   Thu, 21 Apr 2022 17:34:44 +0300
Message-Id: <20220421143449.552312-2-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220421143449.552312-1-tomi.valkeinen@ideasonboard.com>
References: <20220421143449.552312-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The error paths are not correct: media_entity_cleanup() should not be
called unless media_entity_pads_init() has been called. Fix this.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/platform/ti/cal/cal-camerarx.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/ti/cal/cal-camerarx.c b/drivers/media/platform/ti/cal/cal-camerarx.c
index 6b43a1525b45..a41941fa819a 100644
--- a/drivers/media/platform/ti/cal/cal-camerarx.c
+++ b/drivers/media/platform/ti/cal/cal-camerarx.c
@@ -854,7 +854,7 @@ struct cal_camerarx *cal_camerarx_create(struct cal_dev *cal,
 	if (IS_ERR(phy->base)) {
 		cal_err(cal, "failed to ioremap\n");
 		ret = PTR_ERR(phy->base);
-		goto error;
+		goto err_free_phy;
 	}
 
 	cal_dbg(1, cal, "ioresource %s at %pa - %pa\n",
@@ -862,11 +862,11 @@ struct cal_camerarx *cal_camerarx_create(struct cal_dev *cal,
 
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
@@ -883,20 +883,21 @@ struct cal_camerarx *cal_camerarx_create(struct cal_dev *cal,
 	ret = media_entity_pads_init(&sd->entity, ARRAY_SIZE(phy->pads),
 				     phy->pads);
 	if (ret)
-		goto error;
+		goto err_free_phy;
 
 	ret = cal_camerarx_sd_init_cfg(sd, NULL);
 	if (ret)
-		goto error;
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

