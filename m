Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6B3A34DB536
	for <lists+linux-media@lfdr.de>; Wed, 16 Mar 2022 16:47:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357360AbiCPPs2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Mar 2022 11:48:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357363AbiCPPs1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Mar 2022 11:48:27 -0400
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [IPv6:2001:4b98:dc4:8::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7F3F6D38E;
        Wed, 16 Mar 2022 08:47:12 -0700 (PDT)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 1C38D240002;
        Wed, 16 Mar 2022 15:47:09 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     niklas.soderlund@ragnatech.se, laurent.pinchart@ideasonboard.com
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        tomi.valkeinen@ideasonboard.com, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 10/10] media: rcar-vin: Support state-aware transmitters
Date:   Wed, 16 Mar 2022 16:46:41 +0100
Message-Id: <20220316154641.511667-11-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220316154641.511667-1-jacopo+renesas@jmondi.org>
References: <20220316154641.511667-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The VIN driver calls get_fmt() on the remove subdev to validate its
format. Now that the R-Car CSI-2 driver are moved to be state-aware
subdevices they need their active state when calling operations.

Use the newly introduced v4l2_subdev_call_state_active() from
v4l2-subdev-legacy.h.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/media/platform/rcar-vin/rcar-dma.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/rcar-vin/rcar-dma.c b/drivers/media/platform/rcar-vin/rcar-dma.c
index e08d4ca28725..68c192ea7cb5 100644
--- a/drivers/media/platform/rcar-vin/rcar-dma.c
+++ b/drivers/media/platform/rcar-vin/rcar-dma.c
@@ -14,6 +14,7 @@
 #include <linux/interrupt.h>
 #include <linux/pm_runtime.h>
 
+#include <media/v4l2-subdev-legacy.h>
 #include <media/videobuf2-dma-contig.h>
 
 #include "rcar-vin.h"
@@ -1140,7 +1141,7 @@ static int rvin_mc_validate_format(struct rvin_dev *vin, struct v4l2_subdev *sd,
 	};
 
 	fmt.pad = pad->index;
-	if (v4l2_subdev_call(sd, pad, get_fmt, NULL, &fmt))
+	if (v4l2_subdev_call_state_active(sd, pad, get_fmt, &fmt))
 		return -EPIPE;
 
 	switch (fmt.format.code) {
-- 
2.35.1

