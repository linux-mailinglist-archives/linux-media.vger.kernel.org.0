Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6144E35C215
	for <lists+linux-media@lfdr.de>; Mon, 12 Apr 2021 11:59:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238052AbhDLJin (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Apr 2021 05:38:43 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:48021 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241023AbhDLJgl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Apr 2021 05:36:41 -0400
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id A648D20000E;
        Mon, 12 Apr 2021 09:34:45 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     kieran.bingham+renesas@ideasonboard.com,
        laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, geert@linux-m68k.org
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v4 13/17] media: i2c: rdacm20: Report camera module name
Date:   Mon, 12 Apr 2021 11:34:47 +0200
Message-Id: <20210412093451.14198-14-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210412093451.14198-1-jacopo+renesas@jmondi.org>
References: <20210412093451.14198-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When the device is identified the driver currently reports the
names of the chips embedded in the camera module.

Report the name of the camera module itself instead.
Cosmetic change only.

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/media/i2c/rdacm20.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/rdacm20.c b/drivers/media/i2c/rdacm20.c
index 029af8fd7485..f1819bfa165d 100644
--- a/drivers/media/i2c/rdacm20.c
+++ b/drivers/media/i2c/rdacm20.c
@@ -537,7 +537,7 @@ static int rdacm20_initialize(struct rdacm20_device *dev)
 	if (ret)
 		return ret;
 
-	dev_info(dev->dev, "Identified MAX9271 + OV10635 device\n");
+	dev_info(dev->dev, "Identified RDACM20 camera module\n");
 
 	/*
 	 * Set reverse channel high threshold to increase noise immunity.
-- 
2.31.1

