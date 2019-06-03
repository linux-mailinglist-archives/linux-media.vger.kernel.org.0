Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 91FFA33975
	for <lists+linux-media@lfdr.de>; Mon,  3 Jun 2019 22:02:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726694AbfFCUCc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Jun 2019 16:02:32 -0400
Received: from smtp08.smtpout.orange.fr ([80.12.242.130]:57815 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726057AbfFCUCc (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Jun 2019 16:02:32 -0400
Received: from belgarion.home ([90.76.40.119])
        by mwinf5d15 with ME
        id LL2R200052aFDoA03L2WMb; Mon, 03 Jun 2019 22:02:30 +0200
X-ME-Helo: belgarion.home
X-ME-Auth: amFyem1pay5yb2JlcnRAb3JhbmdlLmZy
X-ME-Date: Mon, 03 Jun 2019 22:02:30 +0200
X-ME-IP: 90.76.40.119
From:   Robert Jarzmik <robert.jarzmik@free.fr>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Robert Jarzmik <robert.jarzmik@free.fr>
Subject: [PATCH] media: mt9m111: fix fw-node refactoring
Date:   Mon,  3 Jun 2019 22:01:55 +0200
Message-Id: <20190603200155.24358-1-robert.jarzmik@free.fr>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In the patch refactoring the fw-node, the mt9m111 was broken for all
platform_data based platforms, which were the first aim of this
driver. Only the devicetree platform are still functional, probably
because the testing was done on these.

The result is that -EINVAL is systematically return for such platforms,
what this patch fixes.

Fixes: 98480d65c48c ("media: mt9m111: allow to setup pixclk polarity")
Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>
---
 drivers/media/i2c/mt9m111.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/mt9m111.c b/drivers/media/i2c/mt9m111.c
index 168a5c74f368..d65c23301498 100644
--- a/drivers/media/i2c/mt9m111.c
+++ b/drivers/media/i2c/mt9m111.c
@@ -1209,7 +1209,7 @@ static int mt9m111_probe(struct i2c_client *client,
 {
 	struct mt9m111 *mt9m111;
 	struct i2c_adapter *adapter = to_i2c_adapter(client->dev.parent);
-	int ret;
+	int ret = 0;
 
 	if (!i2c_check_functionality(adapter, I2C_FUNC_SMBUS_WORD_DATA)) {
 		dev_warn(&adapter->dev,
@@ -1221,7 +1221,8 @@ static int mt9m111_probe(struct i2c_client *client,
 	if (!mt9m111)
 		return -ENOMEM;
 
-	ret = mt9m111_probe_fw(client, mt9m111);
+	if (client->dev.of_node)
+		ret = mt9m111_probe_fw(client, mt9m111);
 	if (ret)
 		return ret;
 
-- 
2.20.1

