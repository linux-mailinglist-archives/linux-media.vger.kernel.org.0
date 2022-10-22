Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 53CCF608B52
	for <lists+linux-media@lfdr.de>; Sat, 22 Oct 2022 12:13:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230163AbiJVKNI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 22 Oct 2022 06:13:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230156AbiJVKMn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 22 Oct 2022 06:12:43 -0400
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [IPv6:2001:4b98:dc4:8::240])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41E5AAE846
        for <linux-media@vger.kernel.org>; Sat, 22 Oct 2022 02:30:13 -0700 (PDT)
Received: from relay10.mail.gandi.net (unknown [217.70.178.230])
        by mslow1.mail.gandi.net (Postfix) with ESMTP id 43E1CC1861
        for <linux-media@vger.kernel.org>; Sat, 22 Oct 2022 09:21:18 +0000 (UTC)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id EFF4724000B;
        Sat, 22 Oct 2022 09:20:36 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     =?UTF-8?q?Krzysztof=20Ha=C5=82asa?= <khalasa@piap.pl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>, linux-media@vger.kernel.org
Subject: [PATCH v2 05/10] media: ar0521: Refuse unsupported controls
Date:   Sat, 22 Oct 2022 11:20:10 +0200
Message-Id: <20221022092015.208592-6-jacopo@jmondi.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221022092015.208592-1-jacopo@jmondi.org>
References: <20221022092015.208592-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Refuse unsupported controls by returning -EINVAL in the s_ctrl
operation.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 drivers/media/i2c/ar0521.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/i2c/ar0521.c b/drivers/media/i2c/ar0521.c
index e673424880ac..fcd852760750 100644
--- a/drivers/media/i2c/ar0521.c
+++ b/drivers/media/i2c/ar0521.c
@@ -547,6 +547,10 @@ static int ar0521_s_ctrl(struct v4l2_ctrl *ctrl)
 		ret = ar0521_write_reg(sensor, AR0521_REG_TEST_PATTERN_MODE,
 				       ctrl->val);
 		break;
+	default:
+		dev_err(&sensor->i2c_client->dev,
+			"Unsupported control %x\n", ctrl->id);
+		return -EINVAL;
 	}
 
 	pm_runtime_put(&sensor->i2c_client->dev);
-- 
2.37.3

