Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 05FE377D1C2
	for <lists+linux-media@lfdr.de>; Tue, 15 Aug 2023 20:25:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239098AbjHOSZM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Aug 2023 14:25:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239096AbjHOSYo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Aug 2023 14:24:44 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56CD91BC5
        for <linux-media@vger.kernel.org>; Tue, 15 Aug 2023 11:24:42 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8419487DD;
        Tue, 15 Aug 2023 20:23:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1692123808;
        bh=EoiwsvejL7+cuZCqkGG5Ec+xfdCM9jKMQ2xKjUvSoTM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=bQMaISrYDrv6rb4rf55Iu2qqsWYndoDXFL7m8q546lVRYIc/mF/ZbD7ceAGBSK2S9
         As0Fwlz3DX0pRt5KvU489PQlTHtEDOw4ONwkFdydHGIIForh/l79yopGDn1Qsh/0t6
         cs5xo4OYEUZ1Rorhe2rggrraem6NEUcwIyeSAnzg=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v1 12/12] media: i2c: imx219: Drop IMX219_VTS_* macros
Date:   Tue, 15 Aug 2023 21:24:31 +0300
Message-ID: <20230815182431.18409-13-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230815182431.18409-1-laurent.pinchart@ideasonboard.com>
References: <20230815182431.18409-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The IMX219_VTS_* macros define default VTS values for the modes
supported by the driver. They are used in a single place, and hinder
readability compared to using the value directly as a decimal number.
Drop them.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/imx219.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index c9c68a0f3b46..3a742716ddd6 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -71,10 +71,6 @@
 
 /* V_TIMING internal */
 #define IMX219_REG_VTS			CCI_REG16(0x0160)
-#define IMX219_VTS_15FPS		0x0dc6
-#define IMX219_VTS_30FPS_1080P		0x06e3
-#define IMX219_VTS_30FPS_BINNED		0x06e3
-#define IMX219_VTS_30FPS_640x480	0x06e3
 #define IMX219_VTS_MAX			0xffff
 
 #define IMX219_VBLANK_MIN		4
@@ -302,7 +298,7 @@ static const struct imx219_mode supported_modes[] = {
 			.width = 3280,
 			.height = 2464
 		},
-		.vts_def = IMX219_VTS_15FPS,
+		.vts_def = 3526,
 	},
 	{
 		/* 1080P 30fps cropped */
@@ -314,7 +310,7 @@ static const struct imx219_mode supported_modes[] = {
 			.width = 1920,
 			.height = 1080
 		},
-		.vts_def = IMX219_VTS_30FPS_1080P,
+		.vts_def = 1763,
 	},
 	{
 		/* 2x2 binned 30fps mode */
@@ -326,7 +322,7 @@ static const struct imx219_mode supported_modes[] = {
 			.width = 3280,
 			.height = 2464
 		},
-		.vts_def = IMX219_VTS_30FPS_BINNED,
+		.vts_def = 1763,
 	},
 	{
 		/* 640x480 30fps mode */
@@ -338,7 +334,7 @@ static const struct imx219_mode supported_modes[] = {
 			.width = 1280,
 			.height = 960
 		},
-		.vts_def = IMX219_VTS_30FPS_640x480,
+		.vts_def = 1763,
 	},
 };
 
-- 
Regards,

Laurent Pinchart

