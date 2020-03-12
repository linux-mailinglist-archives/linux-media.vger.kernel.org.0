Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B7151182DBB
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2020 11:32:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726973AbgCLKcb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Mar 2020 06:32:31 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:35737 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726967AbgCLKca (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Mar 2020 06:32:30 -0400
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.lab.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1jCL8T-0002xz-B0; Thu, 12 Mar 2020 11:32:17 +0100
Received: from mfe by dude02.lab.pengutronix.de with local (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1jCL8R-0001KV-LD; Thu, 12 Mar 2020 11:32:15 +0100
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     mchehab@kernel.org, sakari.ailus@linux.intel.com,
        hans.verkuil@cisco.com, jacopo+renesas@jmondi.org,
        robh+dt@kernel.org, laurent.pinchart@ideasonboard.com
Cc:     devicetree@vger.kernel.org, kernel@pengutronix.de,
        linux-media@vger.kernel.org,
        Michael Tretter <m.tretter@pengutronix.de>
Subject: [PATCH v13 14/21] media: tvp5150: initialize subdev before parsing device tree
Date:   Thu, 12 Mar 2020 11:31:49 +0100
Message-Id: <20200312103156.3178-15-m.felsch@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200312103156.3178-1-m.felsch@pengutronix.de>
References: <20200312103156.3178-1-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Michael Tretter <m.tretter@pengutronix.de>

There are several debug prints in the tvp5150_parse_dt() function, which
do not print the prefix, because the v4l2_subdev is not initialized, yet.

Initialize the v4l2_subdev before parsing the device tree to fix the
debug messages.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 drivers/media/i2c/tvp5150.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/tvp5150.c b/drivers/media/i2c/tvp5150.c
index bb3752078bc1..3a8998d4610d 100644
--- a/drivers/media/i2c/tvp5150.c
+++ b/drivers/media/i2c/tvp5150.c
@@ -2009,6 +2009,9 @@ static int tvp5150_probe(struct i2c_client *c)
 
 	core->regmap = map;
 	sd = &core->sd;
+	v4l2_i2c_subdev_init(sd, c, &tvp5150_ops);
+	sd->internal_ops = &tvp5150_internal_ops;
+	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
 
 	if (IS_ENABLED(CONFIG_OF) && np) {
 		res = tvp5150_parse_dt(core, np);
@@ -2021,10 +2024,6 @@ static int tvp5150_probe(struct i2c_client *c)
 		core->mbus_type = V4L2_MBUS_BT656;
 	}
 
-	v4l2_i2c_subdev_init(sd, c, &tvp5150_ops);
-	sd->internal_ops = &tvp5150_internal_ops;
-	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
-
 	res = tvp5150_mc_init(core);
 	if (res)
 		return res;
-- 
2.20.1

