Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3E89018E86D
	for <lists+linux-media@lfdr.de>; Sun, 22 Mar 2020 12:39:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726976AbgCVLjA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 22 Mar 2020 07:39:00 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:33678 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726896AbgCVLjA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 22 Mar 2020 07:39:00 -0400
Received: by mail-pf1-f196.google.com with SMTP id j1so3291883pfe.0;
        Sun, 22 Mar 2020 04:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=Z+r+Ca5wy4wGRgdBd/D74jqqWNbUOBR9cUPVfMcIPhI=;
        b=uxOB2o16Ee1fduqLQBOWbIJFB2t8k9yyl73bpylT+j6pX6Tqeo1mZYo6j30lEej0dh
         2af30A9uzLyBWK75QZGafmoz17qdAbIDNBJ0YLBZBEb4tby2g16/FsrUGeQqMVIWQAqk
         C7GjnohnYNd6zToIT2Q3HGmL3tdoxN7xN0+GRCgM4qf3eWylyVnlftmOX4zBwgqvlp/z
         22mWqBWTIakkr1YK2nKYNda3k21hqfJa7U0JeA5gdpPkoT4pOyBu38SokPQNFpVDqtwu
         BoTYEQz57MVJCvHbl71TtpAQ7jpf8CLr5mOqdiUpjW+UIUHy9Y+iuqajdETkw3fVQo96
         G/UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=Z+r+Ca5wy4wGRgdBd/D74jqqWNbUOBR9cUPVfMcIPhI=;
        b=adImztvhmKQItfNtIWb1CXv9q9OG5tyRbUNPCZ/XSxrZghXZQG/HuBa1JRUmO6E63H
         MttRg6GLIuwiwt1BtAIgvy5rDt3WJlg4NiELVExACy7NzWr5YuUaVFZqDPQlAZsf5zi4
         dfX6xhMvlGHPsxERUBHV2w87GJDzT2tXhQCmjKxZ2yAcvEMpLwgmeFAQARmKUY3yMC8Q
         Nx1Y7Hlzcq0toCJh9rpoMXevFrEq08NX1pLlRadfD8OsaypcvwPC1+0wx7QO/gWiZamX
         j8I/EMmoAlCxGIU0EhqkhQjXmsGt1ExNf8kFb0rG5mdO+eRPGNL0uA7Uqj5xupVmf0Kh
         lwxw==
X-Gm-Message-State: ANhLgQ09iPFLNcb+I/prs8KBLB83kXE7vx4mopv7HcQumQz43QWtISA8
        3yre+DZ8aK0TqaNN0bwTk1HsVfex2QI=
X-Google-Smtp-Source: ADFU+vs7NwrhSo9TcVfHDTikYxjPBNlGMHUU1LCMZhjEcqLlxHVm2YdFqJYnLbwaUBw+97Gb+1QP9A==
X-Received: by 2002:a63:b60:: with SMTP id a32mr17655841pgl.417.1584877138268;
        Sun, 22 Mar 2020 04:38:58 -0700 (PDT)
Received: from localhost.localdomain ([203.109.114.220])
        by smtp.gmail.com with ESMTPSA id w19sm9902111pgm.27.2020.03.22.04.38.55
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Sun, 22 Mar 2020 04:38:57 -0700 (PDT)
From:   Raag Jadav <raagjadav@gmail.com>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     mchehab@kernel.org, wenyou.yang@microchip.com,
        Raag Jadav <raagjadav@gmail.com>
Subject: [PATCH] media: ov7740: use SCCB regmap
Date:   Sun, 22 Mar 2020 17:08:11 +0530
Message-Id: <1584877091-16838-1-git-send-email-raagjadav@gmail.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Make use of SCCB APIs for regmap operations.

Signed-off-by: Raag Jadav <raagjadav@gmail.com>
---
 drivers/media/i2c/ov7740.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/media/i2c/ov7740.c b/drivers/media/i2c/ov7740.c
index 732655f..5832461 100644
--- a/drivers/media/i2c/ov7740.c
+++ b/drivers/media/i2c/ov7740.c
@@ -1068,13 +1068,6 @@ static int ov7740_probe(struct i2c_client *client)
 	struct v4l2_subdev *sd;
 	int ret;
 
-	if (!i2c_check_functionality(client->adapter,
-				     I2C_FUNC_SMBUS_BYTE_DATA)) {
-		dev_err(&client->dev,
-			"OV7740: I2C-Adapter doesn't support SMBUS\n");
-		return -EIO;
-	}
-
 	ov7740 = devm_kzalloc(&client->dev, sizeof(*ov7740), GFP_KERNEL);
 	if (!ov7740)
 		return -ENOMEM;
@@ -1091,7 +1084,7 @@ static int ov7740_probe(struct i2c_client *client)
 	if (ret)
 		return ret;
 
-	ov7740->regmap = devm_regmap_init_i2c(client, &ov7740_regmap_config);
+	ov7740->regmap = devm_regmap_init_sccb(client, &ov7740_regmap_config);
 	if (IS_ERR(ov7740->regmap)) {
 		ret = PTR_ERR(ov7740->regmap);
 		dev_err(&client->dev, "Failed to allocate register map: %d\n",
@@ -1100,7 +1093,6 @@ static int ov7740_probe(struct i2c_client *client)
 	}
 
 	sd = &ov7740->subdev;
-	client->flags |= I2C_CLIENT_SCCB;
 	v4l2_i2c_subdev_init(sd, client, &ov7740_subdev_ops);
 
 #ifdef CONFIG_VIDEO_V4L2_SUBDEV_API
-- 
2.7.4

