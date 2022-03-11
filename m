Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5ED9B4D62B1
	for <lists+linux-media@lfdr.de>; Fri, 11 Mar 2022 14:56:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349007AbiCKN5E (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Mar 2022 08:57:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349005AbiCKN5D (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Mar 2022 08:57:03 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FD381C4B3F
        for <linux-media@vger.kernel.org>; Fri, 11 Mar 2022 05:56:00 -0800 (PST)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 97A8B48B;
        Fri, 11 Mar 2022 14:55:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1647006958;
        bh=OjUil4eeQw6myVcfMBZ3U5RtBDADD/IOJVNBa6bZYpY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ir2cn4AOeoQ60mBR33MXzDIuE14RCiW4unfW8QXPpLWt2CNtEflcN5Sa59mFY16He
         FgAFyUj62cHyQV/M0eSlTHUQ5JXJ2T7YigLtiA0KzNagMvqnSXy8ki+oQwjvjJzHEh
         avTU19d1R1zz1Bs2L9k5IfAdqFqInPiKp6Ur+Yxs=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>, kernel@pengutronix.de,
        linux-imx@nxp.com, Jacopo Mondi <jacopo@jmondi.org>,
        Paul Elder <paul.elder@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>
Subject: [PATCH 3/4] media: imx: imx-mipi-csis: Don't stop streaming at runtime suspend time
Date:   Fri, 11 Mar 2022 15:55:34 +0200
Message-Id: <20220311135535.30108-4-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220311135535.30108-1-laurent.pinchart@ideasonboard.com>
References: <20220311135535.30108-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Streaming is guaranteed to have been stopped by the time the device gets
runtime suspended, as pm_runtime_put() is called from .s_stream(0) only.
Drop the manual stop.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/imx/imx-mipi-csis.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/platform/imx/imx-mipi-csis.c b/drivers/media/platform/imx/imx-mipi-csis.c
index 3bdfe05a6c54..d656b8bfcc33 100644
--- a/drivers/media/platform/imx/imx-mipi-csis.c
+++ b/drivers/media/platform/imx/imx-mipi-csis.c
@@ -1355,7 +1355,6 @@ static int __maybe_unused mipi_csis_runtime_suspend(struct device *dev)
 
 	mutex_lock(&csis->lock);
 	if (csis->state & ST_POWERED) {
-		mipi_csis_stop_stream(csis);
 		ret = mipi_csis_phy_disable(csis);
 		if (ret)
 			goto unlock;
-- 
Regards,

Laurent Pinchart

