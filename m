Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78C363F994F
	for <lists+linux-media@lfdr.de>; Fri, 27 Aug 2021 15:02:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245082AbhH0NC5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Aug 2021 09:02:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231271AbhH0NC4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Aug 2021 09:02:56 -0400
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com [IPv6:2607:f8b0:4864:20::f31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCD69C061757
        for <linux-media@vger.kernel.org>; Fri, 27 Aug 2021 06:02:07 -0700 (PDT)
Received: by mail-qv1-xf31.google.com with SMTP id a5so3968698qvq.0
        for <linux-media@vger.kernel.org>; Fri, 27 Aug 2021 06:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4Ae8tyBS3KayLakZimXmbRvK7esUJ0JfQs4VESpzB6c=;
        b=qQyi4jUXIlbzkXcEUou/3luwiYraJSRWYLxzpco8+W5LO/DqJdYevGGQ3XKrC/JVWt
         CXz2u0LQp41m1wmb5m0hF86aKy5SginUPfgRyTQdU/wYRl0tLdiLgxJ6ODpTxCOPNfUU
         gq04CSjKRCZ0alqYqXpQNfshPhNWTfa3KNOgo9og44Y9JNzJasKAt9nd6wV9RFvbcBdM
         XFFbaZRYiKQZ35TkPDXJ/HtBC9N0smYHMtY3PrnKHgTOU3tE0VjhTVnqbBASvNdekmsr
         dB+8uz9ehqtqS6fvE9j9979dkWtE+RrcQWKoghcpamEUaSinkB31qCYP4o/9mYNvA7+B
         bsQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4Ae8tyBS3KayLakZimXmbRvK7esUJ0JfQs4VESpzB6c=;
        b=T7vVk2Gms03FnGm88Sl4dMIBW05/2lMw4NfKzDKF7Gm+QW9GXQVPdQ+xR8Hf35nas4
         Ps+ciSKyUteP8IE7CSjkeQwewk0wOzK3C/ffqwyKDV+yFt/se632Fpj8G2KzrgOGS5FK
         nLcdfxOj+uuwYKhX5YaqXK6WonM0/J21MNaYowKLOTpk2K23kZbi0a15EctuNn84Z2fy
         RaLCsSYGeGfAffxWjV5JVudaqjNeVhACv851JkP6C/Em+rWHImG46dO2h3qverzbMaRV
         PBWQLukB4ldAlwlQDPxMYRLOEzkUoGzlzFu8Fc1hjV6UE7qHSV7fcc0j/DDEG+yr/try
         JiHQ==
X-Gm-Message-State: AOAM531vDcD/QgT16M0h6/khbuLN7VHVxfPgXp9VaJvdcP+uwOIN56p9
        GHvJDM1vnHlvsm5Vzhlmj3M=
X-Google-Smtp-Source: ABdhPJwYAAsyoHk/lk7kysDKFCLXR37au+4brVbaJHtLhEsLCG4fETxmlqZ1rElZ36w7rvuEoPSphA==
X-Received: by 2002:a0c:e9c3:: with SMTP id q3mr9164339qvo.42.1630069326962;
        Fri, 27 Aug 2021 06:02:06 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:485:504a:a04e:f46c:17c2:7e75])
        by smtp.gmail.com with ESMTPSA id v14sm4676346qkb.88.2021.08.27.06.02.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Aug 2021 06:02:06 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     laurent.pinchart@ideasonboard.com
Cc:     hverkuil-cisco@xs4all.nl, linux-media@vger.kernel.org,
        jacopo+renesas@jmondi.org, morimoto.kuninori@renesas.com,
        Fabio Estevam <festevam@gmail.com>
Subject: [RFC 3/3] media: tw9910: Initialize the entity type
Date:   Fri, 27 Aug 2021 10:01:50 -0300
Message-Id: <20210827130150.909695-3-festevam@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210827130150.909695-1-festevam@gmail.com>
References: <20210827130150.909695-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Currently the following warning is seen:

imx7-csi 2214000.csi: Entity type for entity tw9910 2-0044 was not initialized!

Initialize the entity type accordingly.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 drivers/media/i2c/tw9910.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/tw9910.c b/drivers/media/i2c/tw9910.c
index 0411b8ea9bda..ad4149073ba4 100644
--- a/drivers/media/i2c/tw9910.c
+++ b/drivers/media/i2c/tw9910.c
@@ -228,6 +228,7 @@ struct tw9910_scale_ctrl {
 
 struct tw9910_priv {
 	struct v4l2_subdev		subdev;
+	struct media_pad		pad;
 	struct clk			*clk;
 	struct tw9910_video_info	*info;
 	struct gpio_desc		*pdn_gpio;
@@ -948,6 +949,7 @@ static int tw9910_probe(struct i2c_client *client,
 {
 	struct tw9910_priv		*priv;
 	struct i2c_adapter		*adapter = client->adapter;
+	struct v4l2_subdev *sd;
 	int ret;
 
 	if (!i2c_check_functionality(adapter, I2C_FUNC_SMBUS_BYTE_DATA)) {
@@ -973,14 +975,22 @@ static int tw9910_probe(struct i2c_client *client,
 		return -ENODEV;
 	}
 
-	v4l2_i2c_subdev_init(&priv->subdev, client, &tw9910_subdev_ops);
+	sd = &priv->subdev;
+	v4l2_i2c_subdev_init(sd, client, &tw9910_subdev_ops);
+	priv->pad.flags = MEDIA_PAD_FL_SOURCE;
+	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_HAS_EVENTS;
+	sd->entity.function = MEDIA_ENT_F_ATV_DECODER;
+	ret = media_entity_pads_init(&sd->entity, 1, &priv->pad);
+	if (ret)
+		return ret;
 
 	priv->clk = clk_get(&client->dev, "xti");
 	if (PTR_ERR(priv->clk) == -ENOENT) {
 		priv->clk = NULL;
 	} else if (IS_ERR(priv->clk)) {
 		dev_err(&client->dev, "Unable to get xti clock\n");
-		return PTR_ERR(priv->clk);
+		ret = PTR_ERR(priv->clk);
+		goto media_entity_cleanup;
 	}
 
 	priv->pdn_gpio = gpiod_get_optional(&client->dev, "pdn",
@@ -1006,7 +1016,9 @@ static int tw9910_probe(struct i2c_client *client,
 		gpiod_put(priv->pdn_gpio);
 error_clk_put:
 	clk_put(priv->clk);
-
+	
+media_entity_cleanup:
+	media_entity_cleanup(&sd->entity);
 	return ret;
 }
 
-- 
2.25.1

