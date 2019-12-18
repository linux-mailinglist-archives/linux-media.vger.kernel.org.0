Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A7F0E124907
	for <lists+linux-media@lfdr.de>; Wed, 18 Dec 2019 15:05:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727053AbfLROFy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Dec 2019 09:05:54 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:42019 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726984AbfLROFw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Dec 2019 09:05:52 -0500
Received: by mail-pg1-f195.google.com with SMTP id s64so1338431pgb.9;
        Wed, 18 Dec 2019 06:05:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=J6f5xYI4KlUAbvPOJoxwLTZuEXjHnRNlJlqnINEBy4U=;
        b=BvA2rhnV9eLXjSxjNeZ8tR4yH2wCfe3I66ybOkQBEPOkkVCH/rhBfbVRXoVj8Mp7FX
         JOVJe23q3Q7v3UgYafTUiOLTTWjLvZLoHMi3k8lZ2G/zjBWwQdU5b34WcT5ogFgzgMwD
         sJ8uJVE6P/7M1DoO9vWBCCq+zNofGV1qDczgQUII9t/jwgKZrRS7KZsBX4fLzt7d6IuC
         8R3kLP9oVfauBPESPKBs9GE1BuvzcP6s5w8To1gaFo0VdYyT1qbo6/VP1J1fPEre+viW
         ybR+9w3rFKSAbBkrrsXYCffm0NJR7y+cInv/6Nasfz1U9wv9YDZEJF1X2WV+9u17RHnW
         nBQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=J6f5xYI4KlUAbvPOJoxwLTZuEXjHnRNlJlqnINEBy4U=;
        b=Gn2QxDhRrPd+ZxbcNMR5hRNWWqPfJeiJR82Z1qHLBftmkm3ZXFYf+XYakVqNN1/oAQ
         B+vnNGMWT9M4iCwDLEcrvulodFY2VwGROgdp0p9XVPkS3Lakgki9y7s2EXUFaqtfaY84
         oVKe0DMxGoJT2/vwhlq8MByqUy/2/QeBnhQz+m9A8Vor1H1dlsbmArHkSnZwcmngA2Fg
         lOl/aJHVRwkZwqddjYwOWNpKN3rkOtvpwfMMkQ+GGOMkqIMzx3I9wth21+dNdH8KBSZR
         uOu53zcJs0magfM1StvpUqQ97pL90kcHVM7WRv0LrSrSpVBHjLJ6xoKy5wQW8lOzUWRv
         /egA==
X-Gm-Message-State: APjAAAWQVHekkykj1tkhgwtJTV5hnLi3EvTI15S2m4edjS4TveWlTFey
        mfqVyurVr6LoIZXaNa4gLWg=
X-Google-Smtp-Source: APXvYqy9mCJ0Bt2Wal/jaz9Q3BlLuXvlrMD8d29l21eB19dPiO8efKDrht+gz95REMSOMYkNn5tCng==
X-Received: by 2002:a62:4d87:: with SMTP id a129mr3209793pfb.116.1576677952011;
        Wed, 18 Dec 2019 06:05:52 -0800 (PST)
Received: from oslab.tsinghua.edu.cn ([166.111.139.172])
        by smtp.gmail.com with ESMTPSA id 17sm3611488pfv.142.2019.12.18.06.05.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2019 06:05:51 -0800 (PST)
From:   Jia-Ju Bai <baijiaju1990@gmail.com>
To:     fabien.dessenne@st.com, mchehab@kernel.org
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jia-Ju Bai <baijiaju1990@gmail.com>
Subject: [PATCH] media: sti: bdisp: fix a possible sleep-in-atomic-context bug in bdisp_device_run()
Date:   Wed, 18 Dec 2019 22:05:37 +0800
Message-Id: <20191218140537.12193-1-baijiaju1990@gmail.com>
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

To fix this bug, msleep() is replaced with mdelay().

This bug is found by a static analysis tool STCheck written by myself.

Signed-off-by: Jia-Ju Bai <baijiaju1990@gmail.com>
---
 drivers/media/platform/sti/bdisp/bdisp-hw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/sti/bdisp/bdisp-hw.c b/drivers/media/platform/sti/bdisp/bdisp-hw.c
index 4372abbb5950..1a56348805a2 100644
--- a/drivers/media/platform/sti/bdisp/bdisp-hw.c
+++ b/drivers/media/platform/sti/bdisp/bdisp-hw.c
@@ -382,7 +382,7 @@ int bdisp_hw_reset(struct bdisp_dev *bdisp)
 	for (i = 0; i < POLL_RST_MAX; i++) {
 		if (readl(bdisp->regs + BLT_STA1) & BLT_STA1_IDLE)
 			break;
-		msleep(POLL_RST_DELAY_MS);
+		mdelay(POLL_RST_DELAY_MS);
 	}
 	if (i == POLL_RST_MAX)
 		dev_err(bdisp->dev, "Reset timeout\n");
-- 
2.17.1

