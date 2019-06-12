Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2524342BF5
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2019 18:20:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730611AbfFLQTo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 12 Jun 2019 12:19:44 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:38821 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729497AbfFLQTo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 12 Jun 2019 12:19:44 -0400
Received: by mail-lj1-f196.google.com with SMTP id o13so15648067lji.5
        for <linux-media@vger.kernel.org>; Wed, 12 Jun 2019 09:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Me1o0WCLHrdj4pGzYt4+EVkLIwsOiL3bGNYyI4+f4XA=;
        b=sbA+R1YyTeJkOtusG+mONsqLMlCgE67N74LkOXMJSVZdc1ZcUyjp7BFrdnYC9unTY0
         C2/FTSiAh8qCDuX1bUbS2ctJWPKUrL0q0fxQbblOIxqx+XWcwDW/Pw1N6PWmvhBTOw7G
         wVOUlTHalXYSy5Pu28GzpCxIM68ijW/hBlcT6k5ronpBnUi0/kmkKorTTqzQSqb3GL+x
         qa9RJ26zUAi0B9NFm8jnmODwJ268IwSL1wPMSpgAaX05fWZWwS7pG7S65CynDIZfmvkD
         Ll+aTS+sq6csZ3YKF3eCWakpmWBXhAz/Gvqf5mX4cN/KVh9hStUT2QVhfRSaRzgR/oTW
         udGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Me1o0WCLHrdj4pGzYt4+EVkLIwsOiL3bGNYyI4+f4XA=;
        b=mS2th3B6Z830BmUYKZXvwF1IoZxX5wHkmUd25eBriUF3iti+0ExL5J09jMGUw0g4bX
         lZG2jt4qtOhsnq+O9v2/df6XXq2/VmvceN8Oh74e8qDT2hwPu5iA6dOybsdIEgg+AXJI
         XxUjoENY4ljW4O2cjNqxVCymWyTFgLHP0Jx1OaE712C6aoTQFcRu6a0N8rOmd+lV/qQH
         yKgRtNm6DTD1lxIosCJ+OjKiMUZFgF4KuBpLiyUu/7qsWrD01x0lV2IC21xSIN5GMypO
         aMWqYIPr+BQU0/O39GZ+nxCZS3z5YrvafGJ6o6u1OWO+NDaXdlIp+QnpHyMLKcIlrpXM
         +jGg==
X-Gm-Message-State: APjAAAUV/BPaBk8NZPsHGcb1xA/2yjgoX4I/g8gcMLPEyir//ve/VOnW
        vbFA2a1ekY0hGMVheYh4BFpPuA==
X-Google-Smtp-Source: APXvYqwKTZnFrwVKVT7cHr8poS62teJC/BsN6HcZCHUV+1IhNdTFRvrZ7N+49ciwBs18E0+L5bZ8WQ==
X-Received: by 2002:a2e:989a:: with SMTP id b26mr15046522ljj.31.1560356382037;
        Wed, 12 Jun 2019 09:19:42 -0700 (PDT)
Received: from localhost (c-1c3670d5.07-21-73746f28.bbcust.telenor.se. [213.112.54.28])
        by smtp.gmail.com with ESMTPSA id u128sm51319lja.23.2019.06.12.09.19.41
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 12 Jun 2019 09:19:41 -0700 (PDT)
From:   Anders Roxell <anders.roxell@linaro.org>
To:     mchehab@kernel.org
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Anders Roxell <anders.roxell@linaro.org>
Subject: [PATCH v3] media: i2c: fix warning same module names
Date:   Wed, 12 Jun 2019 18:19:35 +0200
Message-Id: <20190612161935.30264-1-anders.roxell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When building with CONFIG_VIDEO_ADV7511 and CONFIG_DRM_I2C_ADV7511
enabled as loadable modules, we see the following warning:

warning: same module names found:
  drivers/gpu/drm/bridge/adv7511/adv7511.ko
  drivers/media/i2c/adv7511.ko

Rework so that the file is named adv7511-v4l2.c.

Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
---
 drivers/media/i2c/Makefile                      | 2 +-
 drivers/media/i2c/{adv7511.c => adv7511-v4l2.c} | 5 +++++
 2 files changed, 6 insertions(+), 1 deletion(-)
 rename drivers/media/i2c/{adv7511.c => adv7511-v4l2.c} (99%)

diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
index d8ad9dad495d..fd4ea86dedd5 100644
--- a/drivers/media/i2c/Makefile
+++ b/drivers/media/i2c/Makefile
@@ -35,7 +35,7 @@ obj-$(CONFIG_VIDEO_ADV748X) += adv748x/
 obj-$(CONFIG_VIDEO_ADV7604) += adv7604.o
 obj-$(CONFIG_VIDEO_ADV7842) += adv7842.o
 obj-$(CONFIG_VIDEO_AD9389B) += ad9389b.o
-obj-$(CONFIG_VIDEO_ADV7511) += adv7511.o
+obj-$(CONFIG_VIDEO_ADV7511) += adv7511-v4l2.o
 obj-$(CONFIG_VIDEO_VPX3220) += vpx3220.o
 obj-$(CONFIG_VIDEO_VS6624)  += vs6624.o
 obj-$(CONFIG_VIDEO_BT819) += bt819.o
diff --git a/drivers/media/i2c/adv7511.c b/drivers/media/i2c/adv7511-v4l2.c
similarity index 99%
rename from drivers/media/i2c/adv7511.c
rename to drivers/media/i2c/adv7511-v4l2.c
index cec5ebb1c9e6..2ad6bdf1a9fc 100644
--- a/drivers/media/i2c/adv7511.c
+++ b/drivers/media/i2c/adv7511-v4l2.c
@@ -5,6 +5,11 @@
  * Copyright 2013 Cisco Systems, Inc. and/or its affiliates. All rights reserved.
  */
 
+/*
+ * This file is named adv7511-v4l2.c so it doesn't conflict with the Analog
+ * Device ADV7511 (config fragment CONFIG_DRM_I2C_ADV7511).
+ */
+
 
 #include <linux/kernel.h>
 #include <linux/module.h>
-- 
2.20.1

