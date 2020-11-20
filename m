Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1F2B2BAFD7
	for <lists+linux-media@lfdr.de>; Fri, 20 Nov 2020 17:19:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728677AbgKTQPk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 20 Nov 2020 11:15:40 -0500
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:37437 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728131AbgKTQPk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 20 Nov 2020 11:15:40 -0500
X-Originating-IP: 93.34.118.233
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id C8C9840064;
        Fri, 20 Nov 2020 16:15:36 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     kieran.bingham+renesas@ideasonboard.com,
        laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, geert@linux-m68k.org
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] media: max9271: Fix GPIO enable/disable
Date:   Fri, 20 Nov 2020 17:15:28 +0100
Message-Id: <20201120161529.236447-2-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201120161529.236447-1-jacopo+renesas@jmondi.org>
References: <20201120161529.236447-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fix GPIO enable/disable operations which wrongly read the 0x0f register
to obtain the current mask of the enabled lines instead of using
the correct 0x0e register.

Also fix access to bit 0 of the register which is marked as reserved.

Fixes: 34009bffc1c6 ("media: i2c: Add RDACM20 driver")
Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/media/i2c/max9271.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/max9271.c b/drivers/media/i2c/max9271.c
index 0f6f7a092a46..c247db569bab 100644
--- a/drivers/media/i2c/max9271.c
+++ b/drivers/media/i2c/max9271.c
@@ -223,12 +223,12 @@ int max9271_enable_gpios(struct max9271_device *dev, u8 gpio_mask)
 {
 	int ret;
 
-	ret = max9271_read(dev, 0x0f);
+	ret = max9271_read(dev, 0x0e);
 	if (ret < 0)
 		return 0;
 
 	/* BIT(0) reserved: GPO is always enabled. */
-	ret |= gpio_mask | BIT(0);
+	ret |= (gpio_mask & ~BIT(0));
 	ret = max9271_write(dev, 0x0e, ret);
 	if (ret < 0) {
 		dev_err(&dev->client->dev, "Failed to enable gpio (%d)\n", ret);
@@ -245,12 +245,12 @@ int max9271_disable_gpios(struct max9271_device *dev, u8 gpio_mask)
 {
 	int ret;
 
-	ret = max9271_read(dev, 0x0f);
+	ret = max9271_read(dev, 0x0e);
 	if (ret < 0)
 		return 0;
 
 	/* BIT(0) reserved: GPO cannot be disabled */
-	ret &= (~gpio_mask | BIT(0));
+	ret &= ~(gpio_mask | BIT(0));
 	ret = max9271_write(dev, 0x0e, ret);
 	if (ret < 0) {
 		dev_err(&dev->client->dev, "Failed to disable gpio (%d)\n", ret);
-- 
2.29.1

