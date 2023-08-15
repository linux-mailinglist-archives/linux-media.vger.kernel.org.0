Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E6FAA77D1B9
	for <lists+linux-media@lfdr.de>; Tue, 15 Aug 2023 20:25:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239082AbjHOSYk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Aug 2023 14:24:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239065AbjHOSYd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Aug 2023 14:24:33 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 379D5E52
        for <linux-media@vger.kernel.org>; Tue, 15 Aug 2023 11:24:32 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D1D318610;
        Tue, 15 Aug 2023 20:23:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1692123798;
        bh=k8surFJKf7sxxJhRSHyl0bt4oAYHqC8iMvc+47C0L4w=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Xu3VFUAZq+CuTp+7JHZIaSYx16UiBBYV/yXAGnEyoe4RqL7u7USHPaHwfE4YhBUln
         eDgbA8vo6sB5BRDgvO5ijKZCnzl3ot0TVDp4ZBe4SVS9vipqNk9HFxEaJ5CfDbKsOh
         W3OXezoRWh1X4LDQZzP4c9pd1hfvzAfUQmP8UOI4=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v1 04/12] media: i2c: imx219: Fix test pattern window for 640x480 mode
Date:   Tue, 15 Aug 2023 21:24:23 +0300
Message-ID: <20230815182431.18409-5-laurent.pinchart@ideasonboard.com>
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
index 70a4cb4e152c..a0b746447df2 100644
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

