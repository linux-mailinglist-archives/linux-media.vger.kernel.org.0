Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E80F31CF63
	for <lists+linux-media@lfdr.de>; Tue, 16 Feb 2021 18:44:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231169AbhBPRnY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Feb 2021 12:43:24 -0500
Received: from relay12.mail.gandi.net ([217.70.178.232]:45283 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231272AbhBPRnA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Feb 2021 12:43:00 -0500
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 6CBCC20001B;
        Tue, 16 Feb 2021 17:41:55 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     kieran.bingham+renesas@ideasonboard.com,
        laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, geert@linux-m68k.org
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 16/16] media: i2c: gmsl: Use 339Kbps I2C bit-rate
Date:   Tue, 16 Feb 2021 18:41:46 +0100
Message-Id: <20210216174146.106639-17-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210216174146.106639-1-jacopo+renesas@jmondi.org>
References: <20210216174146.106639-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

With the camera modules initialization routines now running with
the noise immunity threshold enabled, it is possible to restore
the bit rate of the I2C transactions transported on the GMSL control
channel to 339 Kbps.

The 339 Kbps bit rate represents the default setting for the serializer
and the deserializer chips, and the setup/hold time and slave timeout
time in use are calibrate to support that rate.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/media/i2c/max9286.c | 2 +-
 drivers/media/i2c/rdacm20.c | 2 +-
 drivers/media/i2c/rdacm21.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
index aa01d5bb79ef..0b620f2f8c41 100644
--- a/drivers/media/i2c/max9286.c
+++ b/drivers/media/i2c/max9286.c
@@ -330,7 +330,7 @@ static int max9286_i2c_mux_init(struct max9286_priv *priv)
 static void max9286_configure_i2c(struct max9286_priv *priv, bool localack)
 {
 	u8 config = MAX9286_I2CSLVSH_469NS_234NS | MAX9286_I2CSLVTO_1024US |
-		    MAX9286_I2CMSTBT_105KBPS;
+		    MAX9286_I2CMSTBT_339KBPS;
 
 	if (localack)
 		config |= MAX9286_I2CLOCACK;
diff --git a/drivers/media/i2c/rdacm20.c b/drivers/media/i2c/rdacm20.c
index 0632ef98eea7..d45e8b0e52a0 100644
--- a/drivers/media/i2c/rdacm20.c
+++ b/drivers/media/i2c/rdacm20.c
@@ -450,7 +450,7 @@ static int rdacm20_init(struct v4l2_subdev *sd, unsigned int val)
 	ret = max9271_configure_i2c(&dev->serializer,
 				    MAX9271_I2CSLVSH_469NS_234NS |
 				    MAX9271_I2CSLVTO_1024US |
-				    MAX9271_I2CMSTBT_105KBPS);
+				    MAX9271_I2CMSTBT_339KBPS);
 	if (ret)
 		return ret;
 
diff --git a/drivers/media/i2c/rdacm21.c b/drivers/media/i2c/rdacm21.c
index 80b6f16f87a8..552985026458 100644
--- a/drivers/media/i2c/rdacm21.c
+++ b/drivers/media/i2c/rdacm21.c
@@ -442,7 +442,7 @@ static int rdacm21_init(struct v4l2_subdev *sd, unsigned int val)
 	ret = max9271_configure_i2c(&dev->serializer,
 				    MAX9271_I2CSLVSH_469NS_234NS |
 				    MAX9271_I2CSLVTO_1024US |
-				    MAX9271_I2CMSTBT_105KBPS);
+				    MAX9271_I2CMSTBT_339KBPS);
 	if (ret)
 		return ret;
 
-- 
2.30.0

