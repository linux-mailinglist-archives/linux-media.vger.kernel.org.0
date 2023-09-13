Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 67CEA79EA31
	for <lists+linux-media@lfdr.de>; Wed, 13 Sep 2023 15:56:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241134AbjIMN4i (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Sep 2023 09:56:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241130AbjIMN4h (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Sep 2023 09:56:37 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 147BD19B6
        for <linux-media@vger.kernel.org>; Wed, 13 Sep 2023 06:56:33 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id EF8E52B66;
        Wed, 13 Sep 2023 15:54:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1694613300;
        bh=kYWHuhF9PRvzXOLA9l+Re4Z2+k+CWdxuX1d+lrt6Zrc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=jWruRHVvsGMiF7y+hvf84BG+IPhHu06j8gte9v5kcAmkSzWx/etZwiTf0LdAY41Ji
         NYkIK5yHuI57O/QhcWy34VoB4gZdIT+0fELWp1WTXtivH3ReipVrRIMiGvoyFejP/i
         0Jf0nKK6h91EGFNTbaQ4tTZnaMcuFsNqIEZBd5Zs=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v3 05/20] media: i2c: imx219: Fix test pattern window for 640x480 mode
Date:   Wed, 13 Sep 2023 16:56:23 +0300
Message-ID: <20230913135638.26277-6-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230913135638.26277-1-laurent.pinchart@ideasonboard.com>
References: <20230913135638.26277-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The 640x480 mode specifies incorrect values for the TP_WINDOW_WIDTH and
TP_WINDOW_HEIGHT registers, which likely got copied from the 1640x1232
mode. They should be identical to the X_OUTPUT_SIZE and Y_OUTPUT_SIZE
registers as for all the other modes, to avoid cropping the test
pattern. Fix them.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/imx219.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index d8840aa67c42..4a25f624d931 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -263,8 +263,8 @@ static const struct cci_reg_sequence mode_640_480_regs[] = {
 	{ IMX219_REG_Y_ADD_END_A, 1711 },
 	{ IMX219_REG_X_OUTPUT_SIZE, 640 },
 	{ IMX219_REG_Y_OUTPUT_SIZE, 480 },
-	{ IMX219_REG_TP_WINDOW_WIDTH, 1640 },
-	{ IMX219_REG_TP_WINDOW_HEIGHT, 1232 },
+	{ IMX219_REG_TP_WINDOW_WIDTH, 640 },
+	{ IMX219_REG_TP_WINDOW_HEIGHT, 480 },
 };
 
 static const struct cci_reg_sequence raw8_framefmt_regs[] = {
-- 
Regards,

Laurent Pinchart

