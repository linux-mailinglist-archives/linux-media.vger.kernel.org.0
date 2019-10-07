Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EB886CE3A9
	for <lists+linux-media@lfdr.de>; Mon,  7 Oct 2019 15:29:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728252AbfJGN3F (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Oct 2019 09:29:05 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:37107 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728111AbfJGN3E (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Oct 2019 09:29:04 -0400
Received: by mail-lj1-f193.google.com with SMTP id l21so13664584lje.4;
        Mon, 07 Oct 2019 06:29:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=B0ycQG3+LMWmEUo25NF7us/Cn/ZyGvcKYuOKAcoY2Nw=;
        b=ih8RvjSSN0e1gfuk9UFGxwtCPxmDxUUKXDR2j7kgAAXRMu4wgyGKseslzjlGxF0wnT
         WwiJnrNiatMEKK3fSmGpPg9jBY1snDSVhvdV42HvqvlypytByGBtbFSh2EO4P31k/tb2
         K/urQXA3yGwM5/V9hcoFtwF1WfkhGL8LPPifu6/5Ez6EnhGiMUFO/rRpG3GFh1xY7sqJ
         rgWCfmjMEiPthf0g3GM/5GyjYiumyFzPYIIUOt8pt6TMon6DibQbPek6IWiSkCiqgpoF
         fiJ5eMkhGNtUH6FA9Vl3TcpgvrfMY+M9IEnRsR35ea8/OO7Nn3LXBDng52zcQV/c36h0
         xQ/A==
X-Gm-Message-State: APjAAAVLXZKCI2BC5D50FfJevqxIKCCBi4O8S0Xu6js28BxpbtUR8rP8
        VByyp4U02VdzbIB/2y+oHAg=
X-Google-Smtp-Source: APXvYqwYE/qHSZrjxd+iO9pBzFs9U39Vypyg0q0Zx4khhNEmjEkbb3i4WAdrYnHnIE40X3FEVKiN4w==
X-Received: by 2002:a2e:5b9a:: with SMTP id m26mr15272472lje.90.1570454942468;
        Mon, 07 Oct 2019 06:29:02 -0700 (PDT)
Received: from neopili.qtec.com (cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
        by smtp.gmail.com with ESMTPSA id f22sm2702245lfk.56.2019.10.07.06.29.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2019 06:29:01 -0700 (PDT)
From:   Ricardo Ribalda Delgado <ribalda@kernel.org>
To:     Pavel Machek <pavel@ucw.cz>, Sakari Ailus <sakari.ailus@iki.fi>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Ricardo Ribalda Delgado <ribalda@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v8 1/6] media: ad5820: Define entity function
Date:   Mon,  7 Oct 2019 15:28:51 +0200
Message-Id: <20191007132856.27948-2-ribalda@kernel.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191007132856.27948-1-ribalda@kernel.org>
References: <20191007132856.27948-1-ribalda@kernel.org>
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

