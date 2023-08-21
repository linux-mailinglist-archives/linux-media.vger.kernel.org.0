Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4ABEC7835BB
	for <lists+linux-media@lfdr.de>; Tue, 22 Aug 2023 00:30:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231550AbjHUWaM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Aug 2023 18:30:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231553AbjHUWaL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Aug 2023 18:30:11 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBB25183
        for <linux-media@vger.kernel.org>; Mon, 21 Aug 2023 15:30:05 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1F6EE87E0;
        Tue, 22 Aug 2023 00:28:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1692656924;
        bh=K0/sg/fZPdnbgAUoCBYHJTzZK4ZLijvYH9XxAZTLW24=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=UI98ll4scf7ANx/WcoJtCEjToMPwgtoZbU3JCkFwcGhfvWs8y6fMmipmKN24QrLya
         +xCWNlqS1Evpa6K4HWBrCetdczCpIkHWXqRLk43nfVc/MAyhoHrg5WjzjOr9vB4HUu
         Lfr+Zm0Mg4gBkmxb4FW147I2lBhnH4Zax2b6sO34=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v2 04/18] media: i2c: imx219: Fix test pattern window for 640x480 mode
Date:   Tue, 22 Aug 2023 01:29:47 +0300
Message-ID: <20230821223001.28480-5-laurent.pinchart@ideasonboard.com>
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

The 640x480 mode specifies incorrect values for the TP_WINDOW_WIDTH and
TP_WINDOW_HEIGHT registers, which likely got copied from the 1640x1232
mode. They should be identical to the X_OUTPUT_SIZE and Y_OUTPUT_SIZE
registers as for all the other modes, to avoid cropping the test
pattern. Fix them.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/imx219.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index 8cab0251bd6a..08011192daa6 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -264,8 +264,8 @@ static const struct cci_reg_sequence mode_640_480_regs[] = {
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

