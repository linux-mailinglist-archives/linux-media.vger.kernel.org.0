Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 607DC3A9ACD
	for <lists+linux-media@lfdr.de>; Wed, 16 Jun 2021 14:46:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232939AbhFPMsJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Jun 2021 08:48:09 -0400
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:42707 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232927AbhFPMsD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Jun 2021 08:48:03 -0400
Received: (Authenticated sender: jacopo@jmondi.org)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 5A65B1C0009;
        Wed, 16 Jun 2021 12:45:54 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        kieran.bingham+renesas@ideasonboard.com,
        laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, geert@linux-m68k.org
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v5 08/15] media: i2c: rdacm21: Add delay after OV490 reset
Date:   Wed, 16 Jun 2021 14:46:09 +0200
Message-Id: <20210616124616.49249-9-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210616124616.49249-1-jacopo+renesas@jmondi.org>
References: <20210616124616.49249-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add a delay after the OV490 chip is put in reset state. The reset
signal shall be held low for at least 250 useconds.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---
 drivers/media/i2c/rdacm21.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/rdacm21.c b/drivers/media/i2c/rdacm21.c
index 553e3f03752b..6be8ce130e78 100644
--- a/drivers/media/i2c/rdacm21.c
+++ b/drivers/media/i2c/rdacm21.c
@@ -469,7 +469,10 @@ static int rdacm21_initialize(struct rdacm21_device *dev)
 	if (ret)
 		return ret;
 
-	/* Enable GPIO1 and hold OV490 in reset during max9271 configuration. */
+	/*
+	 * Enable GPIO1 and hold OV490 in reset during max9271 configuration.
+	 * The reset signal has to be asserted for at least 250 useconds.
+	 */
 	ret = max9271_enable_gpios(&dev->serializer, MAX9271_GPIO1OUT);
 	if (ret)
 		return ret;
@@ -477,6 +480,7 @@ static int rdacm21_initialize(struct rdacm21_device *dev)
 	ret = max9271_clear_gpios(&dev->serializer, MAX9271_GPIO1OUT);
 	if (ret)
 		return ret;
+	usleep_range(250, 500);
 
 	ret = max9271_configure_gmsl_link(&dev->serializer);
 	if (ret)
-- 
2.31.1

