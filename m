Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2EB52125F1C
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2019 11:34:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726741AbfLSKeM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Dec 2019 05:34:12 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:34430 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726656AbfLSKeM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Dec 2019 05:34:12 -0500
Received: by mail-pf1-f195.google.com with SMTP id l127so2994913pfl.1;
        Thu, 19 Dec 2019 02:34:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=BAIlE7DMaDGBVXpBNBOtzHm8RlaK5xCd8x7R/wAcGNI=;
        b=fPLIxbkSfXYkwypUHxgrQoRCFHxrEKjirZPQC18UFlxp+lgXCi3e/Ce91ydWZlshwU
         bmZnTU69j0FnT760dwJB/OI1Cfy4kgHn9m1cbcBN9G+3uGfyDFnfNFralhTltGDBnCIt
         mEhAnUf9OJGEvRCED0gfO27fylMoTwysbsUOX06tjEim2jMAni8ohICfHJ45hglCpNGm
         u3TXnLExef8+MjzV4Ga8FAZLUUgU0cqEoam1N7NfM9XWUO14n8L1pyjQrrLQ455XDjK0
         cYo9d6KifrTTL2L04lwhNuUOGRTmk/q+r1HswwtAJm0Eb5jWpqIjjCmHfyCG1c/yMINL
         GsDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=BAIlE7DMaDGBVXpBNBOtzHm8RlaK5xCd8x7R/wAcGNI=;
        b=QCDhDL4oo6f86C5vShArxSMqIQbuZkR0I+oXOr1LqMZNjdgzoqkS11NqEFY/AuP0yU
         ghJhofgTNA6zFbWUHu42TV/382ekOFBX2UYlJdIr+Y1hpa45q7uvpBAhQnzQu7u11E1V
         G2l3Ilzt+wxKcwkcv+iqEwFki1ZKTYP1mr2Suw7MmIDEZ8lEcEaNB4gSLCY0JdTK8WgR
         so27cXMTgDY1tYuttQhVZ+V8vgUPEQDoOU+U32FHHu/nAW2cdCK7kQu9SSGpQarhiBOL
         XZKa62zUEoHteA1hfZFlrBzrWCxwrwtj8Nzl4hwq9ddMf9hIYx+9dINBS5Iq6IoSbfwS
         BnAQ==
X-Gm-Message-State: APjAAAXnNNomDZgbzsD0dExT90LQzoL05hG2Agr3ab1uCDfFQsBa+fRE
        OsyYavAda8j4oPV7R7ZHz4Q=
X-Google-Smtp-Source: APXvYqxaSmxfpFZxq4SV0bc4KGc9zAFwbYtPo3wGd6OBZqZduudwqsv5TLWgLCbp41LQIElLjdq7pg==
X-Received: by 2002:a63:7705:: with SMTP id s5mr8134161pgc.379.1576751651603;
        Thu, 19 Dec 2019 02:34:11 -0800 (PST)
Received: from oslab.tsinghua.edu.cn ([166.111.139.172])
        by smtp.gmail.com with ESMTPSA id d26sm6596181pgv.66.2019.12.19.02.34.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2019 02:34:10 -0800 (PST)
From:   Jia-Ju Bai <baijiaju1990@gmail.com>
To:     fabien.dessenne@st.com, mchehab@kernel.org
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jia-Ju Bai <baijiaju1990@gmail.com>
Subject: [PATCH v2] media: sti: bdisp: fix a possible sleep-in-atomic-context bug in bdisp_device_run()
Date:   Thu, 19 Dec 2019 18:34:01 +0800
Message-Id: <20191219103401.13630-1-baijiaju1990@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The driver may sleep while holding a spinlock.
The function call path (from bottom to top) in Linux 4.19 is:

drivers/media/platform/sti/bdisp/bdisp-hw.c, 385:
    msleep in bdisp_hw_reset
drivers/media/platform/sti/bdisp/bdisp-v4l2.c, 341:
    bdisp_hw_reset in bdisp_device_run
drivers/media/platform/sti/bdisp/bdisp-v4l2.c, 317:
    _raw_spin_lock_irqsave in bdisp_device_run

To fix this bug, msleep() is replaced with udelay().

This bug is found by a static analysis tool STCheck written by myself.

Signed-off-by: Jia-Ju Bai <baijiaju1990@gmail.com>
---
v2:
* Use udelay() instead of mdelay().
  Thank Fabien for good advice.

---
 drivers/media/platform/sti/bdisp/bdisp-hw.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/sti/bdisp/bdisp-hw.c b/drivers/media/platform/sti/bdisp/bdisp-hw.c
index 4372abbb5950..a74e9fd65238 100644
--- a/drivers/media/platform/sti/bdisp/bdisp-hw.c
+++ b/drivers/media/platform/sti/bdisp/bdisp-hw.c
@@ -14,8 +14,8 @@
 #define MAX_SRC_WIDTH           2048
 
 /* Reset & boot poll config */
-#define POLL_RST_MAX            50
-#define POLL_RST_DELAY_MS       20
+#define POLL_RST_MAX            500
+#define POLL_RST_DELAY_MS       2
 
 enum bdisp_target_plan {
 	BDISP_RGB,
@@ -382,7 +382,7 @@ int bdisp_hw_reset(struct bdisp_dev *bdisp)
 	for (i = 0; i < POLL_RST_MAX; i++) {
 		if (readl(bdisp->regs + BLT_STA1) & BLT_STA1_IDLE)
 			break;
-		msleep(POLL_RST_DELAY_MS);
+		udelay(POLL_RST_DELAY_MS * 1000);
 	}
 	if (i == POLL_RST_MAX)
 		dev_err(bdisp->dev, "Reset timeout\n");
-- 
2.17.1

