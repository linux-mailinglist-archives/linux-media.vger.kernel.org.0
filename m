Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1558F1C2FED
	for <lists+linux-media@lfdr.de>; Mon,  4 May 2020 00:18:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729177AbgECWSi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 3 May 2020 18:18:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729130AbgECWSi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 3 May 2020 18:18:38 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DB4BC061A0E
        for <linux-media@vger.kernel.org>; Sun,  3 May 2020 15:18:38 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id w14so8111714lfk.3
        for <linux-media@vger.kernel.org>; Sun, 03 May 2020 15:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2EruNgkI9g54lPjPO5ZjD8RMhUhlULuBWGD0afbvYac=;
        b=Dk/KHb1rdUtaYWmgK/egTSQEHmkQuKTeGM44KsBjogr7qFO0zfgFf6yTtWwzhiB8Lf
         29geccZMkWWL+IhxUu8VJSggDdwqfBFzhN+BABRbjkNZOlpvICttgDB4BdQKd1068JYW
         uk7BQAuaCvie2cBJ2dj5VGobTX9Lj8kH1wIx2xSheSFOTbWJsnBrLITll9ZX7QpsylEx
         KlJ0XWKcA+sbmXtynjNkRRtLTp7fLR9K9NxzzzDvcRbSuL5ORqI+VxMr4rC3a9LTiwgd
         ZdXuKfIjxlqCztyCasYvbmv/KHQywm6WROiALiI7YavElQwA4xDmS3xqFlXkxH0q5Qqo
         yedg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2EruNgkI9g54lPjPO5ZjD8RMhUhlULuBWGD0afbvYac=;
        b=AqtmtZrIU/RTAXmP9ntVtwRo9LJQTx6UXRJl5fbOKy3VchRjC3MhY2j5tFuEGIqP7z
         XlYiHVw/Oo89EAR7E2+4mQ+Vt0YEI+CnoVNosEbNAo36/ccnCmfxlF0FtaInS6csR1J7
         zw+00zmgTXLssSheThNUzv0b4V5PRQxx4/oVjQQFQ8QEmJ/c+kXt+W0kvV4Jluv7gdjT
         iDA4nnmfhc/2RBFZQZkJdeMUizzJUYlxatTilcAcob3zR1rtIdvU5BwgsndaQSWwZNo9
         924iCowVGgWxq3wNG1+kR/PliEbx5xeJNE0uNZo2v3q7kfNxKFWFbDr5kR8Vw8yvwldQ
         J0nw==
X-Gm-Message-State: AGi0Pua5Y8jni1M7kEu/34AlAqNYzJRia753txlD8bJJbdIFhRHYKVm9
        JfKZWAkYZsBh+X5Z2zV9knk=
X-Google-Smtp-Source: APiQypILv+/EG30cH5N5TNPKN+ctOwbb5o7DWdvPacdLnZAqjBp1FiOjaFoPQlZ4OiizxiTfXXpMgA==
X-Received: by 2002:ac2:530e:: with SMTP id c14mr9873505lfh.154.1588544316597;
        Sun, 03 May 2020 15:18:36 -0700 (PDT)
Received: from z50.gdansk-morena.vectranet.pl (109241122244.gdansk.vectranet.pl. [109.241.122.244])
        by smtp.gmail.com with ESMTPSA id c10sm7602900lfc.7.2020.05.03.15.18.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2020 15:18:35 -0700 (PDT)
From:   Janusz Krzysztofik <jmkrzyszt@gmail.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>
Subject: [PATCH] media: ov6650: Fix clock not released on subdev unregister
Date:   Mon,  4 May 2020 00:18:26 +0200
Message-Id: <20200503221826.28906-1-jmkrzyszt@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Commit c62b96050bee ("media: ov6650: Register with asynchronous
subdevice framework") introduced an asymmetry in master clock get/put
operations.  A reference to the clock is taken as late as on V4L2
subdevice registration but released only on I2C device removal.  If
the subdevice is ever unregistered by its parent V4L2 device and re-
registered again without the driver being unbound and rebound back to
the I2C device, the clock reference will be taken multiple times and
never released.

As a fix, implement .unregistered() subdevice internal operation and
release the reference to the master clock from there.

Fixes: c62b96050bee ("media: ov6650: Register with asynchronous subdevice framework")
Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
---
 drivers/media/i2c/ov6650.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov6650.c b/drivers/media/i2c/ov6650.c
index 91906b94f978..218c7af7a13a 100644
--- a/drivers/media/i2c/ov6650.c
+++ b/drivers/media/i2c/ov6650.c
@@ -986,8 +986,17 @@ static const struct v4l2_subdev_ops ov6650_subdev_ops = {
 	.pad	= &ov6650_pad_ops,
 };
 
+static void ov6650_unregistered(struct v4l2_subdev *sd)
+{
+	struct i2c_client *client = v4l2_get_subdevdata(sd);
+	struct ov6650 *priv = to_ov6650(client);
+
+	v4l2_clk_put(priv->clk);
+}
+
 static const struct v4l2_subdev_internal_ops ov6650_internal_ops = {
 	.registered = ov6650_video_probe,
+	.unregistered = ov6650_unregistered,
 };
 
 /*
@@ -1068,7 +1077,6 @@ static int ov6650_remove(struct i2c_client *client)
 {
 	struct ov6650 *priv = to_ov6650(client);
 
-	v4l2_clk_put(priv->clk);
 	v4l2_async_unregister_subdev(&priv->subdev);
 	v4l2_ctrl_handler_free(&priv->hdl);
 	return 0;
-- 
2.24.1

