Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 13E187835B8
	for <lists+linux-media@lfdr.de>; Tue, 22 Aug 2023 00:30:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231458AbjHUWaE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Aug 2023 18:30:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231549AbjHUWaC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Aug 2023 18:30:02 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70C77132
        for <linux-media@vger.kernel.org>; Mon, 21 Aug 2023 15:30:01 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 458AF36B0;
        Tue, 22 Aug 2023 00:28:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1692656921;
        bh=gLpAkKLKlRsuBaz/rbIeJT4jNVKcTSL4y5PTqAdewdo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=mgbsN7jg7zU5tX5AyhyTXFgNiidJ1awv3vm5o+DZrpob9Vp/WceVKhsqmZv4WYi5I
         J4gYTeX54Mz5zeA7aErjPsnNUDXsSnAR3MM3o0+zSoXFOPY8JxQHZie8RTatNyMnr+
         PvAL/nNkQeFr7uKj0bVy2/taX5CPjroYQ2WMl6eI=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v2 02/18] media: i2c: imx219: Drop unused macros
Date:   Tue, 22 Aug 2023 01:29:45 +0300
Message-ID: <20230821223001.28480-3-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230821223001.28480-1-laurent.pinchart@ideasonboard.com>
References: <20230821223001.28480-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Drop a handful of macros that are not used and don't provide any value.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/imx219.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index c5aeec50b9e8..229dfe24304b 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -72,12 +72,6 @@
 
 #define IMX219_VBLANK_MIN		4
 
-/*Frame Length Line*/
-#define IMX219_FLL_MIN			0x08a6
-#define IMX219_FLL_MAX			0xffff
-#define IMX219_FLL_STEP			1
-#define IMX219_FLL_DEFAULT		0x0c98
-
 /* HBLANK control - read only */
 #define IMX219_PPL_DEFAULT		3448
 
@@ -105,10 +99,6 @@
 #define IMX219_TESTP_COLOUR_MIN		0
 #define IMX219_TESTP_COLOUR_MAX		0x03ff
 #define IMX219_TESTP_COLOUR_STEP	1
-#define IMX219_TESTP_RED_DEFAULT	IMX219_TESTP_COLOUR_MAX
-#define IMX219_TESTP_GREENR_DEFAULT	0
-#define IMX219_TESTP_BLUE_DEFAULT	0
-#define IMX219_TESTP_GREENB_DEFAULT	0
 
 /* External clock frequency is 24.0M */
 #define IMX219_XCLK_FREQ		24000000
-- 
Regards,

Laurent Pinchart

