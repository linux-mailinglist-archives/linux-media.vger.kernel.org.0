Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3E4F44E08E
	for <lists+linux-media@lfdr.de>; Fri, 21 Jun 2019 08:40:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726055AbfFUGkI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 21 Jun 2019 02:40:08 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:39044 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725911AbfFUGkI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 21 Jun 2019 02:40:08 -0400
Received: by mail-pl1-f196.google.com with SMTP id b7so2503944pls.6;
        Thu, 20 Jun 2019 23:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=/1SimtDPI1dJLadUf0NpQzlpwGxTOlWps829IULnfiw=;
        b=gh0qaAbzRY/dSltwDrlfc4KjwgwWVj4oqeHdjR0QjJP+qpJToPmMTJ7rBjpE5VGlJL
         3gRZ8QrYDD2Tq3ssQbW5WY0ahTD1jn9mpmjiXTuavJbRHE7KICsc7Kfz/LT88Q7Y5HKn
         pHdE4urJbTGNpIzTCUY/EvrDGFqy/VEW/q5KyxW6j3ykgMGBeix8gqTypDMIM7A3SDJH
         CfKFFS/yl7VpvqtZwLZF+SvUS2uvQOoSaCswXtlifuK9c1GQBsrHPrspOYb45gn18+jg
         xOVeWKpXyM5TBypadtLcU/xofUVWjC78/8PXe9iliOMih8bwqwMs13ctNGCmeZV2I0cv
         PYKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=/1SimtDPI1dJLadUf0NpQzlpwGxTOlWps829IULnfiw=;
        b=Du0uV/ZRhKfXDwHq8oDJTkn9fgmZcDo9SX6jgheAwwqNs0u9DZS8qC0Z/GpQP6/+Y6
         JTaiysjAbLhJgG8yyOkBCTqTpvo69pPH6ViYu5msePT9ezvmUNko8eExVL7CfuvvCcWo
         UXFG2bZeVKnYJOLpVHynxvvhlMquAOckigPYjG3OyOh3Vy3wn7EPDeysvdEmEif2hFeY
         2jM3cGXeIvg+W8ji7BTAKq7JSzjEp+AwuRP11k7+u2c0g/qajfHkCkifAQ+Aq+BsrsRm
         1w/CQtPn0C/uzecqeQY2/3P84U4R8678ICoLoYVxdvRouSjGsZ4ZNbRBiOTOKoTGevtN
         p97Q==
X-Gm-Message-State: APjAAAVVwJz8eJVE8rYufzw+zmuEyAWPZ9fW1YiHddY0vJm5y4CrgYS5
        M7+K6qlsPZIP8jcTqKDOppc=
X-Google-Smtp-Source: APXvYqxnim4Yjzcfqh8Yo9BHZVI7KFkWIx8u0OHYiZ4zLF0NCdI1SdEhz8/HUcCKMjYManxzIWjICg==
X-Received: by 2002:a17:902:8546:: with SMTP id d6mr118697326plo.207.1561099207849;
        Thu, 20 Jun 2019 23:40:07 -0700 (PDT)
Received: from AHMCPU1978.einfochips.com ([219.65.62.52])
        by smtp.gmail.com with ESMTPSA id i14sm2327103pfk.0.2019.06.20.23.40.04
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Thu, 20 Jun 2019 23:40:07 -0700 (PDT)
From:   Aliasgar Surti <aliasgar.surti500@gmail.com>
X-Google-Original-From: Aliasgar Surti
To:     mchehab@kernel.org, gregkh@linuxfoundation.org,
        sakari.ailus@linux.intel.com, hverkuil-cisco@xs4all.nl,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org
Cc:     Aliasgar Surti <aliasgar.surti500@gmail.com>
Subject: [PATCH 1/1] staging: media: fix style problem
Date:   Fri, 21 Jun 2019 12:09:52 +0530
Message-Id: <1561099192-19638-1-git-send-email-aliasgar.surti500@gmail.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Aliasgar Surti <aliasgar.surti500@gmail.com>

checkpatch reported "WARNING: line over 80 characters".
This patch fixes the warning for file soc_camera/soc_ov5642.c

Signed-off-by: Aliasgar Surti <aliasgar.surti500@gmail.com>
---
 drivers/staging/media/soc_camera/soc_ov5642.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/soc_camera/soc_ov5642.c b/drivers/staging/media/soc_camera/soc_ov5642.c
index 94696d7..39ae24dc 100644
--- a/drivers/staging/media/soc_camera/soc_ov5642.c
+++ b/drivers/staging/media/soc_camera/soc_ov5642.c
@@ -687,7 +687,8 @@ static int reg_write16(struct i2c_client *client, u16 reg, u16 val16)
 }
 
 #ifdef CONFIG_VIDEO_ADV_DEBUG
-static int ov5642_get_register(struct v4l2_subdev *sd, struct v4l2_dbg_register *reg)
+static int ov5642_get_register(struct v4l2_subdev *sd,
+			       struct v4l2_dbg_register *reg)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
 	int ret;
@@ -705,7 +706,8 @@ static int ov5642_get_register(struct v4l2_subdev *sd, struct v4l2_dbg_register
 	return ret;
 }
 
-static int ov5642_set_register(struct v4l2_subdev *sd, const struct v4l2_dbg_register *reg)
+static int ov5642_set_register(struct v4l2_subdev *sd,
+			       const struct v4l2_dbg_register *reg)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
 
-- 
2.7.4

