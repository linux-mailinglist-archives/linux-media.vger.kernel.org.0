Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C8FD75E512
	for <lists+linux-media@lfdr.de>; Wed,  3 Jul 2019 15:15:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727102AbfGCNPh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Jul 2019 09:15:37 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:38976 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726574AbfGCNPh (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 3 Jul 2019 09:15:37 -0400
Received: by mail-pg1-f194.google.com with SMTP id u17so755320pgi.6;
        Wed, 03 Jul 2019 06:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=ILHmsjtfRRicWNzLnmhrIVL4UzVkveonMyetzJ32jH4=;
        b=mhOw52556w11m0noUzXUpVV693CBRe3OCMQDjJvG2mK3WBGuXFKC7DLNcLJH0Mvfyz
         KPBXnxZe9uZm11awxCxejCGsMDhdZQY/XHgc61P+qPh8N7vmizjP1Jsn05teVCOM5c6y
         xyAw4PIkvtUXS6dAR3rmH9wvmYzgUM6Hjko2ybBxOSwtP45T+85v4Y7b9JVRRuEtGd+Z
         5eA9PIIewXWe6BbdS8g2jPKScKWW5qL9tncQFBQaQY8cyVlbV3qJ7LcPyymlZUfzlxuk
         9r/3Citbr9ZVh0bWjWAAhH7DPzfp51j22VFzRnlm+5prB/y6O3SI523f1Iq2QmpLuLcX
         XP2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=ILHmsjtfRRicWNzLnmhrIVL4UzVkveonMyetzJ32jH4=;
        b=JFuXdi+FlxK2aX7pXMiKUbNwIseTqcBBHpCDB/t4t+bs0zJv4pKMEFhApdMrX7h2mX
         HbcGRwBIlD1IE6i14+Ywfh6aX8fhqfDwPcUyZzZJ2wAALWB2HI5S4N/x4CMVWMHqeZlL
         8AzQfUhm2VJ2qHmciDnh4kbZ9ydqFO1HydWV+ERu1eSLboYk6aX3JIuBns6TPnJVpbxJ
         ApCOehfVO+CwYhzAdUEDtus26B5cfHAs92YtgJNU9j/Hxu3gQyEB9UdTGAqfxTCxlwaX
         rdOt0WpyGzI2v4hEojo7Gp1AkIZYQvGsKo+YX+gZTMrlcu88T51P6GnlPp/YW2Nj7nmR
         dVjA==
X-Gm-Message-State: APjAAAX8n0GpQtg4AoaFfU0wYBMaz4FSe8yDuFouMGzmch0GnjDsbSBd
        Gspb7GMWXonbe8FHkYOr6V0=
X-Google-Smtp-Source: APXvYqyWOxDc2Kn9dSXUswi0xM6YVAKeVA/hYVvF9QVnkx15R8vTsKEGmXy90RUyiI9vV5T4i4JFDw==
X-Received: by 2002:a63:f501:: with SMTP id w1mr19642417pgh.444.1562159736917;
        Wed, 03 Jul 2019 06:15:36 -0700 (PDT)
Received: from hfq-skylake.ipads-lab.se.sjtu.edu.cn ([202.120.40.82])
        by smtp.googlemail.com with ESMTPSA id u134sm2386515pfc.19.2019.07.03.06.15.34
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 03 Jul 2019 06:15:36 -0700 (PDT)
From:   Fuqian Huang <huangfq.daxian@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Antoine Jacquet <royale@zerezo.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, Fuqian Huang <huangfq.daxian@gmail.com>
Subject: [PATCH 12/30] media/usb: Use kmemdup rather than duplicating its implementation
Date:   Wed,  3 Jul 2019 21:15:26 +0800
Message-Id: <20190703131526.25223-1-huangfq.daxian@gmail.com>
X-Mailer: git-send-email 2.11.0
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

kmemdup is introduced to duplicate a region of memory in a neat way.
Rather than kmalloc/kzalloc + memset, which the programmer needs to
write the size twice (sometimes lead to mistakes), kmemdup improves
readability, leads to smaller code and also reduce the chances of mistakes.
Suggestion to use kmemdup rather than using kmalloc/kzalloc + memset.

Signed-off-by: Fuqian Huang <huangfq.daxian@gmail.com>
---
 drivers/media/usb/em28xx/em28xx-cards.c | 3 +--
 drivers/media/usb/zr364xx/zr364xx.c     | 4 +---
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/media/usb/em28xx/em28xx-cards.c b/drivers/media/usb/em28xx/em28xx-cards.c
index 1283c7ca9ad5..6e33782c3ca6 100644
--- a/drivers/media/usb/em28xx/em28xx-cards.c
+++ b/drivers/media/usb/em28xx/em28xx-cards.c
@@ -3566,13 +3566,12 @@ static int em28xx_init_dev(struct em28xx *dev, struct usb_device *udev,
 static int em28xx_duplicate_dev(struct em28xx *dev)
 {
 	int nr;
-	struct em28xx *sec_dev = kzalloc(sizeof(*sec_dev), GFP_KERNEL);
+	struct em28xx *sec_dev = kmemdup(dev, sizeof(*sec_dev), GFP_KERNEL);
 
 	if (!sec_dev) {
 		dev->dev_next = NULL;
 		return -ENOMEM;
 	}
-	memcpy(sec_dev, dev, sizeof(*sec_dev));
 	/* Check to see next free device and mark as used */
 	do {
 		nr = find_first_zero_bit(em28xx_devused, EM28XX_MAXBOARDS);
diff --git a/drivers/media/usb/zr364xx/zr364xx.c b/drivers/media/usb/zr364xx/zr364xx.c
index 37a7992585df..39df6bfece2c 100644
--- a/drivers/media/usb/zr364xx/zr364xx.c
+++ b/drivers/media/usb/zr364xx/zr364xx.c
@@ -199,12 +199,10 @@ static int send_control_msg(struct usb_device *udev, u8 request, u16 value,
 {
 	int status;
 
-	unsigned char *transfer_buffer = kmalloc(size, GFP_KERNEL);
+	unsigned char *transfer_buffer = kmemdup(cp, size, GFP_KERNEL);
 	if (!transfer_buffer)
 		return -ENOMEM;
 
-	memcpy(transfer_buffer, cp, size);
-
 	status = usb_control_msg(udev,
 				 usb_sndctrlpipe(udev, 0),
 				 request,
-- 
2.11.0

