Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 290AD6199CD
	for <lists+linux-media@lfdr.de>; Fri,  4 Nov 2022 15:28:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232083AbiKDO2W (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Nov 2022 10:28:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232447AbiKDO1c (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Nov 2022 10:27:32 -0400
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03B19317E7
        for <linux-media@vger.kernel.org>; Fri,  4 Nov 2022 07:25:20 -0700 (PDT)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id EB58A100012;
        Fri,  4 Nov 2022 14:25:17 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     =?UTF-8?q?Krzysztof=20Ha=C5=82asa?= <khalasa@piap.pl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>, linux-media@vger.kernel.org,
        Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v3 05/10] media: ar0521: Refuse unsupported controls
Date:   Fri,  4 Nov 2022 15:24:48 +0100
Message-Id: <20221104142452.117135-6-jacopo@jmondi.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221104142452.117135-1-jacopo@jmondi.org>
References: <20221104142452.117135-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Refuse unsupported controls by returning -EINVAL in the s_ctrl
operation. While at it, remove a the default switch case in the first
switch as it effectively is now a no-op.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 drivers/media/i2c/ar0521.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/ar0521.c b/drivers/media/i2c/ar0521.c
index d30f7a1c7651..acb9509d7708 100644
--- a/drivers/media/i2c/ar0521.c
+++ b/drivers/media/i2c/ar0521.c
@@ -514,9 +514,6 @@ static int ar0521_s_ctrl(struct v4l2_ctrl *ctrl)
 		sensor->total_height = sensor->fmt.width +
 			sensor->ctrls.vblank->val;
 		break;
-	default:
-		ret = -EINVAL;
-		break;
 	}
 
 	/* access the sensor only if it's powered up */
@@ -546,6 +543,11 @@ static int ar0521_s_ctrl(struct v4l2_ctrl *ctrl)
 		ret = ar0521_write_reg(sensor, AR0521_REG_TEST_PATTERN_MODE,
 				       ctrl->val);
 		break;
+	default:
+		dev_err(&sensor->i2c_client->dev,
+			"Unsupported control %x\n", ctrl->id);
+		ret = -EINVAL;
+		break;
 	}
 
 	pm_runtime_put(&sensor->i2c_client->dev);
-- 
2.38.1

