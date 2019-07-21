Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 61CE36F4DD
	for <lists+linux-media@lfdr.de>; Sun, 21 Jul 2019 21:04:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727448AbfGUTEx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 21 Jul 2019 15:04:53 -0400
Received: from smtp10.smtpout.orange.fr ([80.12.242.132]:36972 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727421AbfGUTEx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 21 Jul 2019 15:04:53 -0400
Received: from localhost.localdomain ([92.140.204.221])
        by mwinf5d45 with ME
        id fX4n2000F4n7eLC03X4oXd; Sun, 21 Jul 2019 21:04:48 +0200
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 21 Jul 2019 21:04:48 +0200
X-ME-IP: 92.140.204.221
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     rmfrfs@gmail.com, mchehab@kernel.org
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] media: ov2680: fix a typo in a function name
Date:   Sun, 21 Jul 2019 21:04:23 +0200
Message-Id: <20190721190423.9534-1-christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

All functions in this file starts with 'ov2680_', except ov2860_parse_dt().

This is likely a typo.
rename it to 'ov2680_parse_dt()' (6 and 8)

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/media/i2c/ov2680.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ov2680.c b/drivers/media/i2c/ov2680.c
index b10bcfabaeeb..c59c9e51c380 100644
--- a/drivers/media/i2c/ov2680.c
+++ b/drivers/media/i2c/ov2680.c
@@ -1023,7 +1023,7 @@ static int ov2680_check_id(struct ov2680_dev *sensor)
 	return 0;
 }
 
-static int ov2860_parse_dt(struct ov2680_dev *sensor)
+static int ov2680_parse_dt(struct ov2680_dev *sensor)
 {
 	struct device *dev = ov2680_to_dev(sensor);
 	int ret;
@@ -1064,7 +1064,7 @@ static int ov2680_probe(struct i2c_client *client)
 
 	sensor->i2c_client = client;
 
-	ret = ov2860_parse_dt(sensor);
+	ret = ov2680_parse_dt(sensor);
 	if (ret < 0)
 		return -EINVAL;
 
-- 
2.20.1

