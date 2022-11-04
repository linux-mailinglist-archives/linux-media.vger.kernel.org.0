Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D0EB6199C9
	for <lists+linux-media@lfdr.de>; Fri,  4 Nov 2022 15:28:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230402AbiKDO2P (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Nov 2022 10:28:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232168AbiKDO1d (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Nov 2022 10:27:33 -0400
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [IPv6:2001:4b98:dc4:8::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EED6330F5F
        for <linux-media@vger.kernel.org>; Fri,  4 Nov 2022 07:25:27 -0700 (PDT)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id CBCB6100018;
        Fri,  4 Nov 2022 14:25:24 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     =?UTF-8?q?Krzysztof=20Ha=C5=82asa?= <khalasa@piap.pl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>, linux-media@vger.kernel.org,
        Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v3 08/10] media: ar0521: Setup controls at s_stream time
Date:   Fri,  4 Nov 2022 15:24:51 +0100
Message-Id: <20221104142452.117135-9-jacopo@jmondi.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221104142452.117135-1-jacopo@jmondi.org>
References: <20221104142452.117135-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Setup all the registered controls at s_stream(1) time instead of
manually configure gains.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/ar0521.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ar0521.c b/drivers/media/i2c/ar0521.c
index 0ef4acac1bd3..323f583e2029 100644
--- a/drivers/media/i2c/ar0521.c
+++ b/drivers/media/i2c/ar0521.c
@@ -399,7 +399,7 @@ static int ar0521_set_stream(struct ar0521_dev *sensor, bool on)
 		if (ret)
 			goto err;
 
-		ret = ar0521_set_gains(sensor);
+		ret =  __v4l2_ctrl_handler_setup(&sensor->ctrls.handler);
 		if (ret)
 			goto err;
 
-- 
2.38.1

