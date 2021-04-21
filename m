Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A315E3674D8
	for <lists+linux-media@lfdr.de>; Wed, 21 Apr 2021 23:34:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244028AbhDUVer (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Apr 2021 17:34:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238736AbhDUVeq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Apr 2021 17:34:46 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23EBBC06174A
        for <linux-media@vger.kernel.org>; Wed, 21 Apr 2021 14:34:13 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id x20so38642477lfu.6
        for <linux-media@vger.kernel.org>; Wed, 21 Apr 2021 14:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=4L6Mf9V+2zmMAJUG3hWABTfHyq5q4a+i/0xcKzIIUOk=;
        b=cjLcjTm02DgrMkPlKgd3IOaDnjKWY3Vpptt9xG6VFFbCv73gtw9YLTzlQual5QOemN
         whyOTgcR3G/qlsKNFbX4G40VX8lG6vnBnvQiAe0awkGG738Q3u1lDi5GGl8L+fOTPtEl
         P0eMECxME3UTqwhRrZJGRbjfVdk7px2vn2VOrlrRO6/qkDeJpQ/cPEwdpl27ih344IL/
         LkwKYOk2Dbu7WXjVIE20a3KGfi7TSPck2jOhz9rg5K/QDH4VxW26lOh76GBsEIGMi1El
         DMM2pZ4SD6r3YNhnlKtkt8j6aTAVqNT7ro1U1u7jCLkBHTRY1AUSgqShJtV4dTj/OEDl
         5PCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=4L6Mf9V+2zmMAJUG3hWABTfHyq5q4a+i/0xcKzIIUOk=;
        b=lenksESc0lNHrjCt79ueEBirMUAXgk7AG/ZtAz1bsZr4lEBdEyEROXEKrups6DivEj
         Hpt1unvru3HzWeZPyuzoJnguBumU9auplQu+xItO8hRyqcipFw0GKSubCHRQXCqNmMbg
         8szURASLV/sJoT3sZ9kxPs+ilIXONVh3TfpsMYQSEYJ2Ez4Ih05Tc+3qrupoPMi/jJBj
         Lt2pAk+GmLk1GmiMGzxaABe8EYjmjOtU3lVrZPhEzLkxPmFmTX2kz21Odgq7UX35cQy8
         T4bCvMhNeLvgHM3iJHfj5kJ8WbJzeWGPACnkENbHcxMtjQkgyg6RK4ejJLJmyzgjSZMO
         +PZA==
X-Gm-Message-State: AOAM5323BVLsT+XrnzO2/YAJGcTLtnCNpOELZXBoHzS1I7bYNunD62kP
        EOziNjxE9TRtrSViMypUrixZH/PioMl9ZP8M
X-Google-Smtp-Source: ABdhPJxX0wHi75geNLafIXHdgv3MciVop23fLV74SJ2z/Wvkrs2648nHus6uzCAMnNDNEO8V30wWXg==
X-Received: by 2002:a05:6512:1106:: with SMTP id l6mr151855lfg.653.1619040851702;
        Wed, 21 Apr 2021 14:34:11 -0700 (PDT)
Received: from localhost.localdomain (cm-84.211.29.145.getinternet.no. [84.211.29.145])
        by smtp.gmail.com with ESMTPSA id u4sm78145lji.95.2021.04.21.14.34.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Apr 2021 14:34:11 -0700 (PDT)
From:   Bernhard Wimmer <be.wimm@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     sakari.ailus@iki.fi, Bernhard Wimmer <be.wimm@gmail.com>
Subject: [PATCH 2/2] media: ccs: Fix the op_pll_multiplier address
Date:   Wed, 21 Apr 2021 23:33:20 +0200
Message-Id: <20210421213320.4454-2-be.wimm@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210421213320.4454-1-be.wimm@gmail.com>
References: <20210421213320.4454-1-be.wimm@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

According to the CCS spec the op_pll_multiplier address is 0x030e,
not 0x031e.

Signed-off-by: Bernhard Wimmer <be.wimm@gmail.com>
---
Changes in v3:
  - split into two separate commits
Changes in v2:
  - reflow 'generated by ...' line
  - adjust commit message line break

 drivers/media/i2c/ccs/ccs-limits.c | 4 ++++
 drivers/media/i2c/ccs/ccs-limits.h | 4 ++++
 drivers/media/i2c/ccs/ccs-regs.h   | 6 +++++-
 3 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ccs/ccs-limits.c b/drivers/media/i2c/ccs/ccs-limits.c
index f5511789ac83..4969fa425317 100644
--- a/drivers/media/i2c/ccs/ccs-limits.c
+++ b/drivers/media/i2c/ccs/ccs-limits.c
@@ -1,5 +1,9 @@
 // SPDX-License-Identifier: GPL-2.0-only OR BSD-3-Clause
 /* Copyright (C) 2019--2020 Intel Corporation */
+/*
+ * Generated by Documentation/driver-api/media/drivers/ccs/mk-ccs-regs;
+ * do not modify.
+ */
 
 #include "ccs-limits.h"
 #include "ccs-regs.h"
diff --git a/drivers/media/i2c/ccs/ccs-limits.h b/drivers/media/i2c/ccs/ccs-limits.h
index 1efa43c23a2e..551d3ee9d04e 100644
--- a/drivers/media/i2c/ccs/ccs-limits.h
+++ b/drivers/media/i2c/ccs/ccs-limits.h
@@ -1,5 +1,9 @@
 /* SPDX-License-Identifier: GPL-2.0-only OR BSD-3-Clause */
 /* Copyright (C) 2019--2020 Intel Corporation */
+/*
+ * Generated by Documentation/driver-api/media/drivers/ccs/mk-ccs-regs;
+ * do not modify.
+ */
 
 #ifndef __CCS_LIMITS_H__
 #define __CCS_LIMITS_H__
diff --git a/drivers/media/i2c/ccs/ccs-regs.h b/drivers/media/i2c/ccs/ccs-regs.h
index 4b3e5df2121f..6ce84c5ecf20 100644
--- a/drivers/media/i2c/ccs/ccs-regs.h
+++ b/drivers/media/i2c/ccs/ccs-regs.h
@@ -1,5 +1,9 @@
 /* SPDX-License-Identifier: GPL-2.0-only OR BSD-3-Clause */
 /* Copyright (C) 2019--2020 Intel Corporation */
+/*
+ * Generated by Documentation/driver-api/media/drivers/ccs/mk-ccs-regs;
+ * do not modify.
+ */
 
 #ifndef __CCS_REGS_H__
 #define __CCS_REGS_H__
@@ -202,7 +206,7 @@
 #define CCS_R_OP_PIX_CLK_DIV					(0x0308 | CCS_FL_16BIT)
 #define CCS_R_OP_SYS_CLK_DIV					(0x030a | CCS_FL_16BIT)
 #define CCS_R_OP_PRE_PLL_CLK_DIV				(0x030c | CCS_FL_16BIT)
-#define CCS_R_OP_PLL_MULTIPLIER					(0x031e | CCS_FL_16BIT)
+#define CCS_R_OP_PLL_MULTIPLIER					(0x030e | CCS_FL_16BIT)
 #define CCS_R_PLL_MODE						0x0310
 #define CCS_PLL_MODE_SHIFT					0U
 #define CCS_PLL_MODE_MASK					0x1
-- 
2.17.1

