Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB919550747
	for <lists+linux-media@lfdr.de>; Sun, 19 Jun 2022 00:22:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232876AbiFRWWi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 18 Jun 2022 18:22:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230124AbiFRWWh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 18 Jun 2022 18:22:37 -0400
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F04F210FFE
        for <linux-media@vger.kernel.org>; Sat, 18 Jun 2022 15:22:36 -0700 (PDT)
Received: from tr.lan (ip-86-49-12-201.net.upcbroadband.cz [86.49.12.201])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 8E24083F6A;
        Sun, 19 Jun 2022 00:22:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1655590955;
        bh=9GDcV2pyoyiMhRhNeeZr3Zjxdw3TVaZIVVpvCXMoBrc=;
        h=From:To:Cc:Subject:Date:From;
        b=wa8K7cI8TYT8NeOEo6RxtnriVXUhMAKUc/voUKnkbk08iC1cSlE5/jBI2EqodgI2R
         BdgYdhHPmI1l872qTdrThgACd1yX9S6eVwlDob4GIOtOwMqYW7GoKMWlgIenVZMVRA
         A4RuWo7Yb/mSH6xTf4iKNWrjq0X4yw4pw5Z6uepkM4qbQTUB5h1XWafhWIcaOHD3NP
         gBxP/st7gBwMOwkeuwOziS2S46hE4MHDXdFGmmWU/RgkahnzWjFvncsYoXGySiW9IM
         5Lq8ntUw5BSwDaYA5nR+nWG8D92eLeV/Iz64iwKfeHbJuOZln1NKnGKIRrem5903v9
         fBcG8oi2wGGug==
From:   Marek Vasut <marex@denx.de>
To:     linux-media@vger.kernel.org
Cc:     Marek Vasut <marex@denx.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Stefan Riedmueller <s.riedmueller@phytec.de>
Subject: [PATCH] media: mt9p031: Check for non-null I2C ID match
Date:   Sun, 19 Jun 2022 00:22:32 +0200
Message-Id: <20220618222232.478138-1-marex@denx.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The const struct i2c_device_id *did passed to probe may be NULL e.g.
in case DT contains the following compatible string:
compatible = "aptina,mt9p006", "aptina,mt9p031";

Check the variable for non-NULL and fail gracefully instead of crashing
the kernel outright with NULL pointer dereference splat.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Stefan Riedmueller <s.riedmueller@phytec.de>
---
 drivers/media/i2c/mt9p031.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/i2c/mt9p031.c b/drivers/media/i2c/mt9p031.c
index e0f0d87d4cfe9..d0706723e493c 100644
--- a/drivers/media/i2c/mt9p031.c
+++ b/drivers/media/i2c/mt9p031.c
@@ -1106,6 +1106,11 @@ static int mt9p031_probe(struct i2c_client *client,
 		return -EINVAL;
 	}
 
+	if (did == NULL) {
+		dev_err(&client->dev, "Invalid I2C device ID\n");
+		return -EINVAL;
+	}
+
 	if (!i2c_check_functionality(adapter, I2C_FUNC_SMBUS_WORD_DATA)) {
 		dev_warn(&client->dev,
 			"I2C-Adapter doesn't support I2C_FUNC_SMBUS_WORD\n");
-- 
2.35.1

