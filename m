Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2413217DD2E
	for <lists+linux-media@lfdr.de>; Mon,  9 Mar 2020 11:15:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726680AbgCIKPB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Mar 2020 06:15:01 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:59255 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726571AbgCIKOs (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Mar 2020 06:14:48 -0400
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.lab.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1jBFQm-0003n0-Rs; Mon, 09 Mar 2020 11:14:40 +0100
Received: from mfe by dude02.lab.pengutronix.de with local (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1jBFQh-0001mX-31; Mon, 09 Mar 2020 11:14:35 +0100
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     mchehab@kernel.org, sakari.ailus@linux.intel.com,
        hans.verkuil@cisco.com, jacopo+renesas@jmondi.org,
        robh+dt@kernel.org, laurent.pinchart@ideasonboard.com
Cc:     devicetree@vger.kernel.org, kernel@pengutronix.de,
        linux-media@vger.kernel.org, Jacopo Mondi <jacopo@jmondi.org>
Subject: [PATCH v12 19/19] media: tvp5150: make debug output more readable
Date:   Mon,  9 Mar 2020 11:14:28 +0100
Message-Id: <20200309101428.15267-20-m.felsch@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200309101428.15267-1-m.felsch@pengutronix.de>
References: <20200309101428.15267-1-m.felsch@pengutronix.de>
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
index fb24581e86c1..26eaed4500d4 100644
--- a/drivers/media/i2c/tvp5150.c
+++ b/drivers/media/i2c/tvp5150.c
@@ -302,9 +302,12 @@ static void tvp5150_selmux(struct v4l2_subdev *sd)
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

