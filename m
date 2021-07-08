Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 322CA3BF7D8
	for <lists+linux-media@lfdr.de>; Thu,  8 Jul 2021 11:57:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231438AbhGHJ7l (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Jul 2021 05:59:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231360AbhGHJ7k (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 8 Jul 2021 05:59:40 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11D4FC06175F
        for <linux-media@vger.kernel.org>; Thu,  8 Jul 2021 02:56:59 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id p8so6787824wrr.1
        for <linux-media@vger.kernel.org>; Thu, 08 Jul 2021 02:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RccvP9R4lUGcD44xAkhVggOj5bj+/uygz9cm0wyLvxY=;
        b=yuhX2xMjchOaG/Dj7bCgBj2+5NLMoTElZv0di4pM9dSZAV5URM/WrRSdH3VB5OAo9Y
         wKGoIC+AylKR1bwJHeiH2R2Akg+UdhMdt9tVPuR+t2E8He96nmO49KNkmj7Vwlkuy442
         qWwsYarsdfdBq65zRzfsG3CalqboGgl3THbpSBRhcaz9iHxadWn/S2OFBY5pYKgjTV3j
         i5GzUjjpZYAAjESDkikpLEU6V6hFcB1OZoxiaCVmMVXu89kzwlwjbamlCyyG27pii+XY
         PezHqSYDlVwPvOChokoPRcji3DyFnt3xbUrjhI7ziTMP+q2j/rhdNSZJlFqHi1wNOEj6
         yVYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RccvP9R4lUGcD44xAkhVggOj5bj+/uygz9cm0wyLvxY=;
        b=kVOHoo+jh5jtmAlvF3AJFpc2UC1pfpr48z4jro0mCgKzOaAD3P1vTC4+jR38kANw+d
         CYdAoqG41qPLcgJUODj3ZPh25M2YVKLfMeUwas87R7uUU4TpUcv3FbgGduviMm1f/xLy
         6P/USX47g8q9anvw3UoQx5PUUuFpcG4gyitFZTcr+zd1U5imyMwzCTRYkZnU6vO1zkUz
         u9PUk35i9NmF38Ixd3oQHekhPMVtileGzX+Z4VXbrHb/gDwvVgMMa7drVpzsCV3vZVZY
         163m5K+ohe1HshTv2LdcaYFeLursZ4kLKLHBa8VmYsyEfWhjrJfJwv+JmzzydxDS4Efn
         VDiw==
X-Gm-Message-State: AOAM531lDOYaLCysHeLBNw+BCTLRjV5aRTKWQYj3MqKcWObedu7Ru10H
        DGJai16ZR6C4vuU7eH4y+qPTBEdVquPRw5nM
X-Google-Smtp-Source: ABdhPJzrURB31XIYI2GavF3TUaoiqk1rmifOg0cvqNhp6BVyQMTpULBZthlkQmY7qpeftrnnZ57QkA==
X-Received: by 2002:adf:e841:: with SMTP id d1mr34974961wrn.62.1625738217682;
        Thu, 08 Jul 2021 02:56:57 -0700 (PDT)
Received: from bismarck.berto.se (p4fca2710.dip0.t-ipconnect.de. [79.202.39.16])
        by smtp.googlemail.com with ESMTPSA id b7sm1624849wri.96.2021.07.08.02.56.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jul 2021 02:56:57 -0700 (PDT)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH] media: i2c: max9286: Remove unneeded mutex for get_fmt and set_fmt
Date:   Thu,  8 Jul 2021 11:55:50 +0200
Message-Id: <20210708095550.682465-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There is no need to protect 'cfg_fmt' in get_fmt() and set_fmt() as the
core protects these callbacks. As this is the only usage of the mutex it
can be removed.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/i2c/max9286.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
index 1aa2c58fd38c5d2b..b1d11a50d6e53ecc 100644
--- a/drivers/media/i2c/max9286.c
+++ b/drivers/media/i2c/max9286.c
@@ -18,7 +18,6 @@
 #include <linux/i2c.h>
 #include <linux/i2c-mux.h>
 #include <linux/module.h>
-#include <linux/mutex.h>
 #include <linux/of_graph.h>
 #include <linux/regulator/consumer.h>
 #include <linux/slab.h>
@@ -173,9 +172,6 @@ struct max9286_priv {
 
 	struct v4l2_mbus_framefmt fmt[MAX9286_N_SINKS];
 
-	/* Protects controls and fmt structures */
-	struct mutex mutex;
-
 	unsigned int nsources;
 	unsigned int source_mask;
 	unsigned int route_mask;
@@ -768,9 +764,7 @@ static int max9286_set_fmt(struct v4l2_subdev *sd,
 	if (!cfg_fmt)
 		return -EINVAL;
 
-	mutex_lock(&priv->mutex);
 	*cfg_fmt = format->format;
-	mutex_unlock(&priv->mutex);
 
 	return 0;
 }
@@ -796,9 +790,7 @@ static int max9286_get_fmt(struct v4l2_subdev *sd,
 	if (!cfg_fmt)
 		return -EINVAL;
 
-	mutex_lock(&priv->mutex);
 	format->format = *cfg_fmt;
-	mutex_unlock(&priv->mutex);
 
 	return 0;
 }
@@ -1259,8 +1251,6 @@ static int max9286_probe(struct i2c_client *client)
 	if (!priv)
 		return -ENOMEM;
 
-	mutex_init(&priv->mutex);
-
 	priv->client = client;
 	i2c_set_clientdata(client, priv);
 
-- 
2.32.0

