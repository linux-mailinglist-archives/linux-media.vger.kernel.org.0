Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 75D978F133
	for <lists+linux-media@lfdr.de>; Thu, 15 Aug 2019 18:48:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730248AbfHOQs1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Aug 2019 12:48:27 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:38920 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729579AbfHOQs0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Aug 2019 12:48:26 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id B9A0728CF75
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     kernel@collabora.com, Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH v2 6/6] media: v4l2-core: Remove BUG() from i2c and spi helpers
Date:   Thu, 15 Aug 2019 13:48:06 -0300
Message-Id: <20190815164806.19248-7-ezequiel@collabora.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190815164806.19248-1-ezequiel@collabora.com>
References: <20190815164806.19248-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Currently, the i2c and spi subdev creation helpers
are calling BUG() when passed a NULL v4l2_device parameter.

This makes little sense; simply returning NULL seems more
sensible.

These two helpers may already return NULL on error, so callers
should already be checking for this, or at least be prepared
for a NULL result.

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
---
Changes v2:
* New patch.
---
 drivers/media/v4l2-core/v4l2-i2c.c | 3 ++-
 drivers/media/v4l2-core/v4l2-spi.c | 4 ++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-i2c.c b/drivers/media/v4l2-core/v4l2-i2c.c
index 3d7a3081ec0b..84ccacd24573 100644
--- a/drivers/media/v4l2-core/v4l2-i2c.c
+++ b/drivers/media/v4l2-core/v4l2-i2c.c
@@ -64,7 +64,8 @@ struct v4l2_subdev *v4l2_i2c_new_subdev_board(struct v4l2_device *v4l2_dev,
 	struct v4l2_subdev *sd = NULL;
 	struct i2c_client *client;
 
-	BUG_ON(!v4l2_dev);
+	if (!v4l2_dev)
+		return NULL;
 
 	request_module(I2C_MODULE_PREFIX "%s", info->type);
 
diff --git a/drivers/media/v4l2-core/v4l2-spi.c b/drivers/media/v4l2-core/v4l2-spi.c
index 2a7e82e1412d..15162659a63b 100644
--- a/drivers/media/v4l2-core/v4l2-spi.c
+++ b/drivers/media/v4l2-core/v4l2-spi.c
@@ -39,8 +39,8 @@ struct v4l2_subdev *v4l2_spi_new_subdev(struct v4l2_device *v4l2_dev,
 	struct v4l2_subdev *sd = NULL;
 	struct spi_device *spi = NULL;
 
-	BUG_ON(!v4l2_dev);
-
+	if (!v4l2_dev)
+		return NULL;
 	if (info->modalias[0])
 		request_module(info->modalias);
 
-- 
2.22.0

