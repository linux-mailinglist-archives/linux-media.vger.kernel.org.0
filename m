Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F1F8C7ACA83
	for <lists+linux-media@lfdr.de>; Sun, 24 Sep 2023 17:33:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229782AbjIXPdK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 24 Sep 2023 11:33:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbjIXPdJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 24 Sep 2023 11:33:09 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C157C2
        for <linux-media@vger.kernel.org>; Sun, 24 Sep 2023 08:33:03 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1F9B81AB9;
        Sun, 24 Sep 2023 17:31:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1695569481;
        bh=NUHx8c49rKZHcVUOd49DBsrnROsFehPcSS2Dr9QsVgQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=T8jiBIomivlxrEtB5WpZ2TEz2kgfbo5z1OzsDdJyfCxuz//sLTW4TBQZy2OZH6Axl
         OQ1cFbN8OOixX+cb3MqZUrSSCpbTisHW5RRUgmj4gwc68+Vfa/faVXPCkhtFrrzIA/
         OhW0/xqL0UM/o1XAuGrHgm+zTg2mtyhl5+yAlW3A=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v4 02/20] media: i2c: imx219: Drop unused macros
Date:   Sun, 24 Sep 2023 18:32:51 +0300
Message-ID: <20230924153309.12423-3-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230924153309.12423-1-laurent.pinchart@ideasonboard.com>
References: <20230924153309.12423-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Drop a handful of macros that are not used and don't provide any value.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/imx219.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index 9d84f09bcced..a9f929fc58b0 100644
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

