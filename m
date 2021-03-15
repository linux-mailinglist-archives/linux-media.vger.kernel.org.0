Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4EE0B33B37B
	for <lists+linux-media@lfdr.de>; Mon, 15 Mar 2021 14:16:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230365AbhCONPd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Mar 2021 09:15:33 -0400
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:36461 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230158AbhCONPN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Mar 2021 09:15:13 -0400
X-Originating-IP: 79.22.58.175
Received: from uno.homenet.telecomitalia.it (host-79-22-58-175.retail.telecomitalia.it [79.22.58.175])
        (Authenticated sender: jacopo@jmondi.org)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 17633FF805;
        Mon, 15 Mar 2021 13:15:08 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     kieran.bingham+renesas@ideasonboard.com,
        laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, geert@linux-m68k.org
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v2 07/18] media: i2c: rdacm20: Check return values
Date:   Mon, 15 Mar 2021 14:15:01 +0100
Message-Id: <20210315131512.133720-8-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210315131512.133720-1-jacopo+renesas@jmondi.org>
References: <20210315131512.133720-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The camera module initialization routine does not check the return
value of a few functions. Fix that.

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/media/i2c/rdacm20.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/rdacm20.c b/drivers/media/i2c/rdacm20.c
index 85456e00ba4f..312450db958d 100644
--- a/drivers/media/i2c/rdacm20.c
+++ b/drivers/media/i2c/rdacm20.c
@@ -470,11 +470,16 @@ static int rdacm20_initialize(struct rdacm20_device *dev)
 	 *  Ensure that we have a good link configuration before attempting to
 	 *  identify the device.
 	 */
-	max9271_configure_i2c(&dev->serializer, MAX9271_I2CSLVSH_469NS_234NS |
-						MAX9271_I2CSLVTO_1024US |
-						MAX9271_I2CMSTBT_105KBPS);
+	ret = max9271_configure_i2c(&dev->serializer,
+				    MAX9271_I2CSLVSH_469NS_234NS |
+				    MAX9271_I2CSLVTO_1024US |
+				    MAX9271_I2CMSTBT_105KBPS);
+	if (ret)
+		return ret;
 
-	max9271_configure_gmsl_link(&dev->serializer);
+	ret = max9271_configure_gmsl_link(&dev->serializer);
+	if (ret)
+		return ret;
 
 	ret = max9271_verify_id(&dev->serializer);
 	if (ret < 0)
-- 
2.30.0

