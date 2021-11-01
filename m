Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E3404423E9
	for <lists+linux-media@lfdr.de>; Tue,  2 Nov 2021 00:22:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232495AbhKAXYk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Nov 2021 19:24:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232420AbhKAXYj (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Nov 2021 19:24:39 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 543E1C0613F5
        for <linux-media@vger.kernel.org>; Mon,  1 Nov 2021 16:22:05 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id b2-20020a1c8002000000b0032fb900951eso405453wmd.4
        for <linux-media@vger.kernel.org>; Mon, 01 Nov 2021 16:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/Odd1fQ29XPBzo9CndghPKhYpzwxdW9wzfFXg5zTSUA=;
        b=KKUoLlzXs2/PIowGBYk4WXmDXudn97VrsFW34ojaKX5HFMyB4tju/jo/sSWgc5UoaB
         saRKG23CQ0wyupdVBvLMEf9j7zeMrBpIXEFdt0O2evJQGczKm8VmB+Ie1RpBkIL0rlyI
         yiR14BDuBCp7bAn6OcjBWEs6I5f+LGZKsHxBK5vqoIOInsqzl2E4FWEW/Vn7zmN7t48E
         nLXuwTHLac0UFT3wYorwi7YYcWK6+bTGLsAKwd/0Xu2XMTuaaq2fQyHbmoRcIOROFMZw
         jkZsd8MwUkO1zIU6LydPOW3fZxsm+VTCPPvsrQZk1cz+L6ddN549gbHQo0DyX3Aqt1+y
         H7TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/Odd1fQ29XPBzo9CndghPKhYpzwxdW9wzfFXg5zTSUA=;
        b=oa2mqbN2fIscygaqwJOlBFBTEtT0lHiyPSM4BF3SUoOI2e1araKPowlB1hnRFbIt+2
         dYUCeP3mJ+cD2NnOK2QGbjBMrgZpDSPv4b/Onn5WRgpBYwcVkxX7RjkntEfqvfmUNNRa
         +2aEe9ntvt6kkaiC+2rx/VmQtp4XAnllwdP3Xgk6kP1WGTlTCzOrtAJYKdSFXe1otH1N
         F49M1CJnTbmP45p8SOsPgABiA8ZR6Y6kICA1DXiqAeknVbju1AaUJeUokCiULDO7vkO0
         4j1K9HsVS7DE4MSITz1tECUlTgjIsd16m70QrFJIi3bhSPAcbvNcFQDdsoZ5vLLfakmO
         UJcw==
X-Gm-Message-State: AOAM531e+Oc2ZLBmzIkBgsV0tfVL2aHK/6hTzDUHssbtESuRFupRzQ4L
        nATzqp4NqnPx/ucXoLg44GHZz2IcyhI=
X-Google-Smtp-Source: ABdhPJyEYQ6t4AXLucPaBemgqHnUgscZxWDi0BKT54VMcddpR9Pfh7vHaokZu6y34ZnmmYXuDx2jiQ==
X-Received: by 2002:a7b:c763:: with SMTP id x3mr2361245wmk.31.1635808923946;
        Mon, 01 Nov 2021 16:22:03 -0700 (PDT)
Received: from localhost.localdomain (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id l124sm763513wml.8.2021.11.01.16.22.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Nov 2021 16:22:03 -0700 (PDT)
From:   Daniel Scally <djrscally@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     sakari.ailus@linux.intel.com, andriy.shevchenko@linux.intel.com,
        laurent.pinchart@ideasonboard.com, yong.zhi@intel.com,
        bingbu.cao@intel.com, tian.shu.qiu@intel.com,
        jeanmichel.hautbois@ideasonboard.com,
        kieran.bingham@ideasonboard.com, hdegoede@redhat.com
Subject: [PATCH v5 4/5] media: i2c: ov5693: Rename ov5693_sw_standby() to ov5693_enable_streaming()
Date:   Mon,  1 Nov 2021 23:21:43 +0000
Message-Id: <20211101232144.134590-5-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211101232144.134590-1-djrscally@gmail.com>
References: <20211101232144.134590-1-djrscally@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Hans de Goede <hdegoede@redhat.com>

ov5693_sw_standby() starts/stops streaming rename it so that it is actually
named after what it does.

This also removes the weird enable inverting going on before.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/i2c/ov5693.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/media/i2c/ov5693.c b/drivers/media/i2c/ov5693.c
index 8ad51f8f88cf..2613bad49f78 100644
--- a/drivers/media/i2c/ov5693.c
+++ b/drivers/media/i2c/ov5693.c
@@ -742,13 +742,13 @@ static int ov5693_mode_configure(struct ov5693_device *ov5693)
 	return ret;
 }
 
-static int ov5693_sw_standby(struct ov5693_device *ov5693, bool standby)
+static int ov5693_enable_streaming(struct ov5693_device *ov5693, bool enable)
 {
 	int ret = 0;
 
 	ov5693_write_reg(ov5693, OV5693_SW_STREAM_REG,
-			 standby ? OV5693_STOP_STREAMING :
-				   OV5693_START_STREAMING, &ret);
+			 enable ? OV5693_STOP_STREAMING :
+				  OV5693_START_STREAMING, &ret);
 
 	return ret;
 }
@@ -784,9 +784,9 @@ static int ov5693_sensor_init(struct ov5693_device *ov5693)
 		return ret;
 	}
 
-	ret = ov5693_sw_standby(ov5693, true);
+	ret = ov5693_enable_streaming(ov5693, true);
 	if (ret)
-		dev_err(ov5693->dev, "software standby error\n");
+		dev_err(ov5693->dev, "enable streaming error\n");
 
 	return ret;
 }
@@ -1119,7 +1119,7 @@ static int ov5693_s_stream(struct v4l2_subdev *sd, int enable)
 	}
 
 	mutex_lock(&ov5693->lock);
-	ret = ov5693_sw_standby(ov5693, enable);
+	ret = ov5693_enable_streaming(ov5693, enable);
 	mutex_unlock(&ov5693->lock);
 
 	if (ret)
-- 
2.25.1

