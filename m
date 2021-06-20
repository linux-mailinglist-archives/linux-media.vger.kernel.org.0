Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5DE893AE018
	for <lists+linux-media@lfdr.de>; Sun, 20 Jun 2021 21:45:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230028AbhFTTrw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 20 Jun 2021 15:47:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229872AbhFTTrw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 20 Jun 2021 15:47:52 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72446C061574;
        Sun, 20 Jun 2021 12:45:39 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id d16so18996427lfn.3;
        Sun, 20 Jun 2021 12:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+W/O6gOP6IW6u1NkP1013U+G2XvQ//6bD4DQBNJYUMU=;
        b=tUz4xde1JRGigviwrH3tb3lX2Ricb55oLB+6TE6UCbW235XiKNhsH/LZyKtclCGPK3
         Dr8hfK5rWAZGzdEjtm7gVKbEEmxYFhxK246MN1CmSFuGaziDINBipKXnX0mdz/0BtI/D
         dj7IXWX6EI9iODePoDwNQrbH2VZeXo3YIDnigt1am7Ur2XdsvP583KFrznmlxySW3c1U
         4ltSEXw9nF6d9SAKM+D/zjUUjUFazCVY/gIgGedbeYm9uJisc1zrgt9Bzf12A3CMoxtP
         /+1ST49RA4fdtSmWqlYF6M4m/lX6ayYGh+uzSgVVpkrDLXAWtiddDesSmtX9O4iFw+h3
         +ipA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+W/O6gOP6IW6u1NkP1013U+G2XvQ//6bD4DQBNJYUMU=;
        b=jOUTQ/qN5ikIbwfx35NPBOEFCbRE1omLx9YwyfeLmgybJujFSO2lcqJ8knkx2OSloS
         wOLrU7SpeWMBsdJQuTRHvutFQxdwUEJBtkKffSeJmoyRrD6fWQ8cMemiJZ8DLbY0dLZF
         Rz/buepHgiOy1uw2alAsghemLGHNaoR3oOzmzddcTQOrxuWzJBVh/Kckvjpl86mO1Ygu
         6fnqSkYjoerGPwNdOs4sTMOAZzZa2c3tiFulK6ZmPgqQ8IMthUztk1VO3JYWHgb6/LYd
         Ti2Sa/L/d4nor2jAaTwfADLAh7ZgkqcMmQj3ZaEZPSlQ2lS+LSj6VFBxxhr4m1FDbr83
         i6zQ==
X-Gm-Message-State: AOAM530RIfqKwp5uRTEfgzW3WzQNo4JInFDe2kLHyYPxUvo9FJPLmrqN
        zZlmTi7q8jDIvJHDyjmYm1Y=
X-Google-Smtp-Source: ABdhPJxMf0lULcoAzc5DdX2YIKkaMEj1RP7S5PCazPu7TPz+KtwbMVAtsfmdHip+xoPolH8NnDtbKw==
X-Received: by 2002:ac2:46c2:: with SMTP id p2mr2008492lfo.125.1624218337822;
        Sun, 20 Jun 2021 12:45:37 -0700 (PDT)
Received: from localhost.localdomain ([94.103.229.24])
        by smtp.gmail.com with ESMTPSA id f8sm1928330ljj.110.2021.06.20.12.45.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Jun 2021 12:45:37 -0700 (PDT)
From:   Pavel Skripkin <paskripkin@gmail.com>
To:     hverkuil-cisco@xs4all.nl, mchehab@kernel.org, oneukum@suse.com,
        gregkh@suse.de
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        Pavel Skripkin <paskripkin@gmail.com>
Subject: [PATCH 1/2] media: go7007: fix memory leak in go7007_usb_probe
Date:   Sun, 20 Jun 2021 22:45:02 +0300
Message-Id: <fd632c9a289eb28ded37b573e999a8f4e7402ca3.1624217907.git.paskripkin@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1624217907.git.paskripkin@gmail.com>
References: <cover.1624217907.git.paskripkin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In commit 137641287eb4 ("go7007: add sanity checking for endpoints")
endpoint sanity check was introduced, but if check fails it simply
returns with leaked pointers.

Cutted log from my local syzbot instance:

BUG: memory leak
unreferenced object 0xffff8880209f0000 (size 8192):
  comm "kworker/0:4", pid 4916, jiffies 4295263583 (age 29.310s)
  hex dump (first 32 bytes):
    30 b0 27 22 80 88 ff ff 75 73 62 2d 64 75 6d 6d  0.'"....usb-dumm
    79 5f 68 63 64 2e 33 2d 31 00 00 00 00 00 00 00  y_hcd.3-1.......
  backtrace:
    [<ffffffff860ca856>] kmalloc include/linux/slab.h:556 [inline]
    [<ffffffff860ca856>] kzalloc include/linux/slab.h:686 [inline]
    [<ffffffff860ca856>] go7007_alloc+0x46/0xb40 drivers/media/usb/go7007/go7007-driver.c:696
    [<ffffffff860de74e>] go7007_usb_probe+0x13e/0x2200 drivers/media/usb/go7007/go7007-usb.c:1114
    [<ffffffff854a5f74>] usb_probe_interface+0x314/0x7f0 drivers/usb/core/driver.c:396
    [<ffffffff845a7151>] really_probe+0x291/0xf60 drivers/base/dd.c:576

BUG: memory leak
unreferenced object 0xffff88801e2f2800 (size 512):
  comm "kworker/0:4", pid 4916, jiffies 4295263583 (age 29.310s)
  hex dump (first 32 bytes):
    00 87 40 8a ff ff ff ff 00 00 00 00 00 00 00 00  ..@.............
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
  backtrace:
    [<ffffffff860de794>] kmalloc include/linux/slab.h:556 [inline]
    [<ffffffff860de794>] kzalloc include/linux/slab.h:686 [inline]
    [<ffffffff860de794>] go7007_usb_probe+0x184/0x2200 drivers/media/usb/go7007/go7007-usb.c:1118
    [<ffffffff854a5f74>] usb_probe_interface+0x314/0x7f0 drivers/usb/core/driver.c:396
    [<ffffffff845a7151>] really_probe+0x291/0xf60 drivers/base/dd.c:576

Fixes: 137641287eb4 ("go7007: add sanity checking for endpoints")
Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
---
 drivers/media/usb/go7007/go7007-usb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/go7007/go7007-usb.c b/drivers/media/usb/go7007/go7007-usb.c
index dbf0455d5d50..eeb85981e02b 100644
--- a/drivers/media/usb/go7007/go7007-usb.c
+++ b/drivers/media/usb/go7007/go7007-usb.c
@@ -1134,7 +1134,7 @@ static int go7007_usb_probe(struct usb_interface *intf,
 
 	ep = usb->usbdev->ep_in[4];
 	if (!ep)
-		return -ENODEV;
+		goto allocfail;
 
 	/* Allocate the URB and buffer for receiving incoming interrupts */
 	usb->intr_urb = usb_alloc_urb(0, GFP_KERNEL);
-- 
2.32.0

