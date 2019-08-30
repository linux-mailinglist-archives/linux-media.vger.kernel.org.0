Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AA166A34C6
	for <lists+linux-media@lfdr.de>; Fri, 30 Aug 2019 12:17:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728143AbfH3KRK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Aug 2019 06:17:10 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:38389 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728017AbfH3KQ7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Aug 2019 06:16:59 -0400
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.lab.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1i3dxa-00031p-Ox; Fri, 30 Aug 2019 12:16:50 +0200
Received: from mfe by dude02.lab.pengutronix.de with local (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1i3dxY-0003om-Dj; Fri, 30 Aug 2019 12:16:48 +0200
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     mchehab@kernel.org, sakari.ailus@linux.intel.com,
        hans.verkuil@cisco.com, jacopo+renesas@jmondi.org,
        robh+dt@kernel.org, laurent.pinchart@ideasonboard.com
Cc:     devicetree@vger.kernel.org, kernel@pengutronix.de,
        linux-media@vger.kernel.org, Jacopo Mondi <jacopo@jmondi.org>
Subject: [PATCH v10 14/14] media: tvp5150: make debug output more readable
Date:   Fri, 30 Aug 2019 12:16:46 +0200
Message-Id: <20190830101646.6530-15-m.felsch@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190830101646.6530-1-m.felsch@pengutronix.de>
References: <20190830101646.6530-1-m.felsch@pengutronix.de>
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

The debug output for tvp5150_selmux() isn't really intuitive. Register
values are printed decimal formatted and the input/output driver states
are printed as enum. Even more the "normal" output enum mapps to zero so
a active output will printing output=0 and a inactive output=1.

Change this by brinting the register values hex formatted and the states
as more readable string.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>
---
 drivers/media/i2c/tvp5150.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/tvp5150.c b/drivers/media/i2c/tvp5150.c
index da7e7fe16f89..16f777e5c1b9 100644
--- a/drivers/media/i2c/tvp5150.c
+++ b/drivers/media/i2c/tvp5150.c
@@ -300,9 +300,12 @@ static void tvp5150_selmux(struct v4l2_subdev *sd)
 		break;
 	}
 
-	dev_dbg_lvl(sd->dev, 1, debug, "Selecting video route: route input=%i, output=%i => tvp5150 input=%i, opmode=%i\n",
-			decoder->input, decoder->output,
-			input, opmode);
+	dev_dbg_lvl(sd->dev, 1, debug,
+		    "Selecting video route: route input=%s, output=%s => tvp5150 input=0x%02x, opmode=0x%02x\n",
+		    decoder->input == 0 ? "aip1a" :
+		    decoder->input == 2 ? "aip1b" : "svideo",
+		    decoder->output == 0 ? "normal" : "black-frame-gen",
+		    input, opmode);
 
 	regmap_write(decoder->regmap, TVP5150_OP_MODE_CTL, opmode);
 	regmap_write(decoder->regmap, TVP5150_VD_IN_SRC_SEL_1, input);
-- 
2.20.1

