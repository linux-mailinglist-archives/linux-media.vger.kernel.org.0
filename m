Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F0474423EB
	for <lists+linux-media@lfdr.de>; Tue,  2 Nov 2021 00:22:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232447AbhKAXYl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Nov 2021 19:24:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232448AbhKAXYk (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Nov 2021 19:24:40 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C86BC061714
        for <linux-media@vger.kernel.org>; Mon,  1 Nov 2021 16:22:06 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id f7-20020a1c1f07000000b0032ee11917ceso848994wmf.0
        for <linux-media@vger.kernel.org>; Mon, 01 Nov 2021 16:22:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=g/uhuGYcMXpZZ56vQBKqYhGhtoT7DaAPPzpcFp2PXYo=;
        b=b0SJpYbR3RuNwa3DoqVRX65drS6cIw1f8/5EJcj2AqSxxdq8ZSoTx1an0z+wpncWCG
         s3soW/2jQ1gf3W+XqzacRXqNmCjJn+GcKu9DxlUWU5vq+gt2uG4EYjwnSOFGGLIhdyAj
         dCLbmKjcD8HxEjFpnYDQtmI8KvMcf1jJl8qseRhqKfozUAAgCdL0ZlgS6wzzDIyvsvmA
         c4ABBH12ZKAHN8TiBExW9NS+tOz3uisTKVAevuUVwyBCuhfFIYRWgFh11c6s12f9IU8s
         sX5KX2jQNSqj5z6/u5YZS7vudYtnnGhx1wy/mc/kmPVvx4Xhgj+dtYu7cjQw/FMajy0+
         Aggg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=g/uhuGYcMXpZZ56vQBKqYhGhtoT7DaAPPzpcFp2PXYo=;
        b=i7OTokg44sFhQJcINHOL/bJ462WDrCML9mi3kKDmF49I7fwxsTrPny06onMwv7GbxY
         uE72rCxy8i/aURdqlx0rM2zYF4h+L5CvXkbIzZbDPEfsWaLyMy/h7abW9EDPS23Y1a38
         C7NsfEYOeH2CLsNI2q0xUlAnTeY4w3wTkTINXGwepN+Hknl2NmZ8g1CuQjCRQXXcg+bQ
         J8+d0Ac6aWjLVm5SvCaqkor0Fhc9tOJm7+zkWx1ploolors5t0mBuntos3CUTLjKv82Z
         pfJTsCkU7zWVfXAvL57MAhao52rWx7iYwXY1G99xUD0FYVUu7HZPiGyRvvrLV4XHFsW8
         Yt3Q==
X-Gm-Message-State: AOAM531TTu8ve+5OFW5lyf26aBAnPIz1DBeW+p9TbuOeLpNHUZ0dlN7Y
        YRbsc3HySIuMkpg0dR78lKda5TW/v5c=
X-Google-Smtp-Source: ABdhPJybfbKntubztK+maCLJUQW0yK8INrouiq3Jnf0skxeq5k4jPtv6scOygArbppKPXgov0TAruA==
X-Received: by 2002:a05:600c:22cb:: with SMTP id 11mr2218293wmg.181.1635808924791;
        Mon, 01 Nov 2021 16:22:04 -0700 (PDT)
Received: from localhost.localdomain (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id l124sm763513wml.8.2021.11.01.16.22.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Nov 2021 16:22:04 -0700 (PDT)
From:   Daniel Scally <djrscally@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     sakari.ailus@linux.intel.com, andriy.shevchenko@linux.intel.com,
        laurent.pinchart@ideasonboard.com, yong.zhi@intel.com,
        bingbu.cao@intel.com, tian.shu.qiu@intel.com,
        jeanmichel.hautbois@ideasonboard.com,
        kieran.bingham@ideasonboard.com, hdegoede@redhat.com
Subject: [PATCH v5 5/5] media: i2c: ov5693: Fix lockdep error
Date:   Mon,  1 Nov 2021 23:21:44 +0000
Message-Id: <20211101232144.134590-6-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211101232144.134590-1-djrscally@gmail.com>
References: <20211101232144.134590-1-djrscally@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Hans de Goede <hdegoede@redhat.com>

ov5693_s_stream() was calling __v4l2_ctrl_handler_setup() without first
locking ov5693->lock, triggering the "lockdep_assert_held(hdl->lock);"
check in __v4l2_ctrl_handler_setup() leading to a kernel backtrace.

ov5693_s_stream() does already take the ov5693->lock, move the
mutex_lock call up (in the enable path) so that it also protects the
__v4l2_ctrl_handler_setup() call.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/i2c/ov5693.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/media/i2c/ov5693.c b/drivers/media/i2c/ov5693.c
index 2613bad49f78..e3cd7eeba9ed 100644
--- a/drivers/media/i2c/ov5693.c
+++ b/drivers/media/i2c/ov5693.c
@@ -1113,17 +1113,23 @@ static int ov5693_s_stream(struct v4l2_subdev *sd, int enable)
 		if (ret < 0)
 			goto err_power_down;
 
+		mutex_lock(&ov5693->lock);
 		ret = __v4l2_ctrl_handler_setup(&ov5693->ctrls.handler);
-		if (ret)
+		if (ret) {
+			mutex_unlock(&ov5693->lock);
 			goto err_power_down;
-	}
-
-	mutex_lock(&ov5693->lock);
-	ret = ov5693_enable_streaming(ov5693, enable);
-	mutex_unlock(&ov5693->lock);
+		}
 
+		ret = ov5693_enable_streaming(ov5693, true);
+		mutex_unlock(&ov5693->lock);
+	} else {
+		mutex_lock(&ov5693->lock);
+		ret = ov5693_enable_streaming(ov5693, false);
+		mutex_unlock(&ov5693->lock);
+	}
 	if (ret)
 		goto err_power_down;
+
 	ov5693->streaming = !!enable;
 
 	if (!enable)
-- 
2.25.1

