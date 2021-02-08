Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B44E313344
	for <lists+linux-media@lfdr.de>; Mon,  8 Feb 2021 14:29:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229822AbhBHN3K (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Feb 2021 08:29:10 -0500
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:41685 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230144AbhBHN2z (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 8 Feb 2021 08:28:55 -0500
X-Originating-IP: 93.34.118.233
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 77E4BE0014;
        Mon,  8 Feb 2021 13:28:11 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: [PATCH] media: i2c: rdamc21: Fix warning on u8 cast
Date:   Mon,  8 Feb 2021 14:27:49 +0100
Message-Id: <20210208132749.97738-1-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.30.0
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
Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/media/i2c/rdacm21.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/rdacm21.c b/drivers/media/i2c/rdacm21.c
index dcc21515e5a4..179d107f494c 100644
--- a/drivers/media/i2c/rdacm21.c
+++ b/drivers/media/i2c/rdacm21.c
@@ -345,7 +345,7 @@ static int ov10640_initialize(struct rdacm21_device *dev)
 	/* Read OV10640 ID to test communications. */
 	ov490_write_reg(dev, OV490_SCCB_SLAVE0_DIR, OV490_SCCB_SLAVE_READ);
 	ov490_write_reg(dev, OV490_SCCB_SLAVE0_ADDR_HIGH, OV10640_CHIP_ID >> 8);
-	ov490_write_reg(dev, OV490_SCCB_SLAVE0_ADDR_LOW, (u8)OV10640_CHIP_ID);
+	ov490_write_reg(dev, OV490_SCCB_SLAVE0_ADDR_LOW, OV10640_CHIP_ID & 0xff);

 	/* Trigger SCCB slave transaction and give it some time to complete. */
 	ov490_write_reg(dev, OV490_HOST_CMD, OV490_HOST_CMD_TRIGGER);
--
2.30.0

