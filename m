Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1604342239
	for <lists+linux-media@lfdr.de>; Fri, 19 Mar 2021 17:42:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230368AbhCSQmV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 19 Mar 2021 12:42:21 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:59209 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230235AbhCSQmF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 19 Mar 2021 12:42:05 -0400
X-Originating-IP: 5.92.35.220
Received: from uno.localdomain (mob-5-92-35-220.net.vodafone.it [5.92.35.220])
        (Authenticated sender: jacopo@jmondi.org)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id D9C04C0007;
        Fri, 19 Mar 2021 16:42:00 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     kieran.bingham+renesas@ideasonboard.com,
        laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, geert@linux-m68k.org
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v3 10/19] media: i2c: rdamc21: Fix warning on u8 cast
Date:   Fri, 19 Mar 2021 17:41:39 +0100
Message-Id: <20210319164148.199192-11-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210319164148.199192-1-jacopo+renesas@jmondi.org>
References: <20210319164148.199192-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Sparse reports a warning on a cast to u8 of a 16 bits constant.

drivers/media/i2c/rdacm21.c:348:62: warning: cast truncates bits
from constant value (300a becomes a)

Even if the behaviour is intended, silence the sparse warning replacing
the cast with a bitwise & operation.

Fixes: a59f853b3b4b ("media: i2c: Add driver for RDACM21 camera module")
Reported-by: Hans Verkuil <hverkuil@xs4all.nl>
Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/media/i2c/rdacm21.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/rdacm21.c b/drivers/media/i2c/rdacm21.c
index 1706a59bfd58..babd14b21252 100644
--- a/drivers/media/i2c/rdacm21.c
+++ b/drivers/media/i2c/rdacm21.c
@@ -330,7 +330,7 @@ static int ov10640_initialize(struct rdacm21_device *dev)
 	/* Read OV10640 ID to test communications. */
 	ov490_write_reg(dev, OV490_SCCB_SLAVE0_DIR, OV490_SCCB_SLAVE_READ);
 	ov490_write_reg(dev, OV490_SCCB_SLAVE0_ADDR_HIGH, OV10640_CHIP_ID >> 8);
-	ov490_write_reg(dev, OV490_SCCB_SLAVE0_ADDR_LOW, (u8)OV10640_CHIP_ID);
+	ov490_write_reg(dev, OV490_SCCB_SLAVE0_ADDR_LOW, OV10640_CHIP_ID & 0xff);
 
 	/* Trigger SCCB slave transaction and give it some time to complete. */
 	ov490_write_reg(dev, OV490_HOST_CMD, OV490_HOST_CMD_TRIGGER);
-- 
2.30.0

