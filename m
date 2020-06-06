Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CEAED1F070A
	for <lists+linux-media@lfdr.de>; Sat,  6 Jun 2020 16:39:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728750AbgFFOj3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 6 Jun 2020 10:39:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726340AbgFFOj2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 6 Jun 2020 10:39:28 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 997D7C03E96A;
        Sat,  6 Jun 2020 07:39:28 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id h95so4065228pje.4;
        Sat, 06 Jun 2020 07:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wqOstxJrjo/D8MxXyGqLeaamC5JLOgifEHoNbT411cg=;
        b=nT7hJKA5MHFwq8c41LpXMdHu3Tq1XjTubxJ3P60rld5rrdPTG31QFBE/wFG4zdjSN8
         YCzdWoOURoSsQCPwu82dFWkA7HNsAxVoxJI6JzNqLgk4FCLpaHKJMDxLlCa0AjbYevfm
         45Qi+Ka7w7Tb8n/vFSGGicNGC287JLypwG4Isk4uzYUA0RXYBENordWyVDnLnn9ZHwVw
         ukkTQXvL8K2aYEDPGxX8oCncxWp3by8yTqXFeSIxl7EottuJi+LcoNrxtwMFKZboRPXM
         Vi1TA2MZuiawcnFZ5gaX9vICAPDJY6nO235IYFajpsU6uxnC1tvCOB6G7miCRz95/qES
         hyvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wqOstxJrjo/D8MxXyGqLeaamC5JLOgifEHoNbT411cg=;
        b=hduDb2InSpJgK0VPrLL5FiAgg80PgHty31Rtg6lOZJzgf7XL/YoXHQTTLnVO4KT+kM
         okJRTSckeOliiAyDJg7xr7UqaSYGr4mbPnwNFD5hKCzJni6d9euImP4Cz2bk5msR0GTL
         Scnnxot1KwvSUMYPzZJps1vsE6ncIIASTX9QxFq+0fDo78qjoiEFstwdDhJo3vSdCRX2
         BwddpHHvUD8Hg8c3I3pSYYicpXeYR3oqCTBePj+RhGpYmij0tLwasL/397qv1YFYLBgQ
         Xmvyj35ltFXOUfautYXGuCf1P43/+H9YA/4+7g6I+EdTgwqqRpJ1D/ENnoZvS4nvii8W
         quLA==
X-Gm-Message-State: AOAM531VoJw9Nuzn2FZrSJBhoJPkaL8qlo6dICOrlJL+IlAmOE+2fgk2
        jKn4PiADjhd6OtVOOwDfzJtN1PoP5lY=
X-Google-Smtp-Source: ABdhPJwhnbejvFdJHOzwgZL6Gzjlwu5DYNJJwe1TYCeqEoQSyxjfTv/iQst5NnyJ5gpCw3x5eQdCnw==
X-Received: by 2002:a17:90a:d086:: with SMTP id k6mr7709095pju.133.1591454368085;
        Sat, 06 Jun 2020 07:39:28 -0700 (PDT)
Received: from suzukaze.ipads-lab.se.sjtu.edu.cn ([202.120.40.82])
        by smtp.gmail.com with ESMTPSA id l63sm2546999pfd.122.2020.06.06.07.39.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2020 07:39:27 -0700 (PDT)
From:   Chuhong Yuan <hslester96@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Marco Felsch <m.felsch@pengutronix.de>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Chuhong Yuan <hslester96@gmail.com>
Subject: [PATCH] media: tvp5150: Add missed media_entity_cleanup()
Date:   Sat,  6 Jun 2020 22:39:18 +0800
Message-Id: <20200606143918.2869528-1-hslester96@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This driver does not call media_entity_cleanup() in the error handler
of tvp5150_registered() and tvp5150_remove(), while it has called
media_entity_pads_init() at first.
Add the missed calls to fix it.

Fixes: 0556f1d580d4 ("media: tvp5150: add input source selection of_graph support")
Signed-off-by: Chuhong Yuan <hslester96@gmail.com>
---
 drivers/media/i2c/tvp5150.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/tvp5150.c b/drivers/media/i2c/tvp5150.c
index eb39cf5ea089..9df575238952 100644
--- a/drivers/media/i2c/tvp5150.c
+++ b/drivers/media/i2c/tvp5150.c
@@ -1664,8 +1664,10 @@ static int tvp5150_registered(struct v4l2_subdev *sd)
 	return 0;
 
 err:
-	for (i = 0; i < decoder->connectors_num; i++)
+	for (i = 0; i < decoder->connectors_num; i++) {
 		media_device_unregister_entity(&decoder->connectors[i].ent);
+		media_entity_cleanup(&decoder->connectors[i].ent);
+	}
 	return ret;
 #endif
 
@@ -2248,8 +2250,10 @@ static int tvp5150_remove(struct i2c_client *c)
 
 	for (i = 0; i < decoder->connectors_num; i++)
 		v4l2_fwnode_connector_free(&decoder->connectors[i].base);
-	for (i = 0; i < decoder->connectors_num; i++)
+	for (i = 0; i < decoder->connectors_num; i++) {
 		media_device_unregister_entity(&decoder->connectors[i].ent);
+		media_entity_cleanup(&decoder->connectors[i].ent);
+	}
 	v4l2_async_unregister_subdev(sd);
 	v4l2_ctrl_handler_free(&decoder->hdl);
 	pm_runtime_disable(&c->dev);
-- 
2.26.2

