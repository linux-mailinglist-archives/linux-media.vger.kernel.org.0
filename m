Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3FE50CE32A
	for <lists+linux-media@lfdr.de>; Mon,  7 Oct 2019 15:21:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728123AbfJGNVH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Oct 2019 09:21:07 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:44354 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727975AbfJGNVD (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Oct 2019 09:21:03 -0400
Received: by mail-lj1-f194.google.com with SMTP id m13so13585813ljj.11;
        Mon, 07 Oct 2019 06:21:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=B0ycQG3+LMWmEUo25NF7us/Cn/ZyGvcKYuOKAcoY2Nw=;
        b=GS2Nsq39G1R7sB0t+tSqUaIV7W7sdbE4N3tN8OpEnLhtgP2hzHmXU7XAh6QDnFFfZK
         t9WLGYeABvikies+/fRDAG5Uf/6sSJERok2mDb5FQ4BWjO06TlVFYhS9fb0HLUHHq4XN
         UDxjkq9BzT3wkwW6lKhx264zg6HymXvkdIOLEXfm0ncBI2djO5lcZzhD1hxN4K+1eicj
         XhXqmq0F06sagfHg1ozY33B0anrfIlLN7aHyzoj0liKFbOtcihYvl3incWHr4rRh5T2+
         wI4KN4qoo36ApWOb8x1yqJu7YIKY+Jqo01yzhatGOIvsNzP7p1jE7QSvy6brUaC5LuGe
         sxAQ==
X-Gm-Message-State: APjAAAVGCXUh6xIZBjISAhL5UNckrt+bl205niWPWql+uIpx2FdOcp1i
        qRDERfOiaIwoEjVQ/STEkovOirziSN8=
X-Google-Smtp-Source: APXvYqwWJsk13EXlCKMT+8Lu27ZNM+D0xULgNd3naQgduLjaTCg3JOZXE4AY0I9KyuiiyFNsOzBVbA==
X-Received: by 2002:a2e:5456:: with SMTP id y22mr18216581ljd.60.1570454461036;
        Mon, 07 Oct 2019 06:21:01 -0700 (PDT)
Received: from neopili.qtec.com (cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
        by smtp.gmail.com with ESMTPSA id z14sm2687360lfh.30.2019.10.07.06.20.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2019 06:21:00 -0700 (PDT)
From:   Ricardo Ribalda Delgado <ribalda@kernel.org>
To:     Pavel Machek <pavel@ucw.cz>, Sakari Ailus <sakari.ailus@iki.fi>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Ricardo Ribalda Delgado <ribalda@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v7 1/6] media: ad5820: Define entity function
Date:   Mon,  7 Oct 2019 15:20:40 +0200
Message-Id: <20191007132050.27298-3-ribalda@kernel.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191007132050.27298-1-ribalda@kernel.org>
References: <20191007132050.27298-1-ribalda@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Without this patch, media_device_register_entity throws a warning:

dev_warn(mdev->dev,
	 "Entity type for entity %s was not initialized!\n",
	 entity->name);

Signed-off-by: Ricardo Ribalda Delgado <ribalda@kernel.org>
Acked-by: Pavel Machek <pavel@ucw.cz>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/ad5820.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/i2c/ad5820.c b/drivers/media/i2c/ad5820.c
index 925c171e7797..7a49651f4d1f 100644
--- a/drivers/media/i2c/ad5820.c
+++ b/drivers/media/i2c/ad5820.c
@@ -309,6 +309,7 @@ static int ad5820_probe(struct i2c_client *client,
 	v4l2_i2c_subdev_init(&coil->subdev, client, &ad5820_ops);
 	coil->subdev.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
 	coil->subdev.internal_ops = &ad5820_internal_ops;
+	coil->subdev.entity.function = MEDIA_ENT_F_LENS;
 	strscpy(coil->subdev.name, "ad5820 focus", sizeof(coil->subdev.name));
 
 	ret = media_entity_pads_init(&coil->subdev.entity, 0, NULL);
-- 
2.23.0

