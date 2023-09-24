Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CBE2A7ACA82
	for <lists+linux-media@lfdr.de>; Sun, 24 Sep 2023 17:33:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229889AbjIXPdP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 24 Sep 2023 11:33:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229873AbjIXPdO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 24 Sep 2023 11:33:14 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38BBEC2
        for <linux-media@vger.kernel.org>; Sun, 24 Sep 2023 08:33:08 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2CB691B70;
        Sun, 24 Sep 2023 17:31:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1695569485;
        bh=OeNn5NukcWCzz1esXYWU3umzAHOs+ZihiC7R8rkd6hA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=SBPVjz+dioFAViL6Be44oLirgzatltQs3Igo5JrL2r79hJhvazgmLCIkO/bmY5InL
         JolaZms0ijsP4PBMX2+pzs5yi3QEa2wDLKn0H5zTlxzaJ4+OcGqBA5uXw4k3JCHdLs
         r6XewjlBiBd2Ro2N0tyaXPKY9gIYARYg4oZvCfQ8=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v4 05/20] media: i2c: imx219: Fix test pattern window for 640x480 mode
Date:   Sun, 24 Sep 2023 18:32:54 +0300
Message-ID: <20230924153309.12423-6-laurent.pinchart@ideasonboard.com>
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
index a14de8f3dee7..cf55c59cbb7f 100644
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

