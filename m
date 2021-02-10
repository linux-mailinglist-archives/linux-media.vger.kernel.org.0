Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 381C8316A7A
	for <lists+linux-media@lfdr.de>; Wed, 10 Feb 2021 16:50:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230048AbhBJPtp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Feb 2021 10:49:45 -0500
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:60865 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229888AbhBJPtp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Feb 2021 10:49:45 -0500
X-Originating-IP: 93.34.118.233
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 534C34000C;
        Wed, 10 Feb 2021 15:49:00 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, linux-next@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH] media: i2c: max9271: Add MODULE_* macros
Date:   Wed, 10 Feb 2021 16:49:08 +0100
Message-Id: <20210210154908.1227203-1-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Since commit 7f03d9fefcc5 ("media: i2c: Kconfig: Make MAX9271
a module") the max9271 library is built as a module but no
MODULE_*() attributes were specified, causing a build error
due to missing license information.

ERROR: modpost: missing MODULE_LICENSE() in drivers/media/i2c/max9271.o

Fix this by adding MODULE attributes to the driver.

Fixes: 7f03d9fefcc5 ("media: i2c: Kconfig: Make MAX9271 a module")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Reported-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/media/i2c/max9271.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/i2c/max9271.c b/drivers/media/i2c/max9271.c
index c247db569bab..c495582dcff6 100644
--- a/drivers/media/i2c/max9271.c
+++ b/drivers/media/i2c/max9271.c
@@ -18,6 +18,7 @@

 #include <linux/delay.h>
 #include <linux/i2c.h>
+#include <linux/module.h>

 #include "max9271.h"

@@ -339,3 +340,7 @@ int max9271_set_translation(struct max9271_device *dev, u8 source, u8 dest)
 	return 0;
 }
 EXPORT_SYMBOL_GPL(max9271_set_translation);
+
+MODULE_DESCRIPTION("Maxim MAX9271 GMSL Serializer");
+MODULE_AUTHOR("Jacopo Mondi");
+MODULE_LICENSE("GPL v2");
--
2.30.0

