Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7FBC277D1B4
	for <lists+linux-media@lfdr.de>; Tue, 15 Aug 2023 20:25:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239056AbjHOSYj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Aug 2023 14:24:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239061AbjHOSY3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Aug 2023 14:24:29 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC26319AF
        for <linux-media@vger.kernel.org>; Tue, 15 Aug 2023 11:24:28 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2C1E83B3C;
        Tue, 15 Aug 2023 20:23:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1692123795;
        bh=SXJlWJ3OBEisHVX6tN0rr/fZsIOnKuANOFgZZGol1ZM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=h4lGLLAuMiqFEbUgOHiUkzokUqULsEvpghwlV1/yOOhvjiMte/GZoR6RofY9JId+Y
         wX44Tnys1EYfI+qk+JjT+OWpnANesQG/b/Ax46vZNr1Yxlz4zJ5BTRHR7KzZhOxMg+
         7jST1kEPOqU2JQ9rN3u1ZTTASYvHmUawF3hJ9cX8=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v1 02/12] media: i2c: imx219: Drop unused macros
Date:   Tue, 15 Aug 2023 21:24:21 +0300
Message-ID: <20230815182431.18409-3-laurent.pinchart@ideasonboard.com>
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

Drop a handful of macros that are not used and don't provide any value.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/imx219.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index 39695b0e6537..26ee33c09e6a 100644
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

