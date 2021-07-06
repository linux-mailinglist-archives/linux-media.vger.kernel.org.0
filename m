Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E9FB3BD8F8
	for <lists+linux-media@lfdr.de>; Tue,  6 Jul 2021 16:50:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232591AbhGFOxP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Jul 2021 10:53:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232564AbhGFOxO (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 6 Jul 2021 10:53:14 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE9AFC0617AB;
        Tue,  6 Jul 2021 07:50:34 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id v14so13204186lfb.4;
        Tue, 06 Jul 2021 07:50:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SwvFBRtYb9/G826Ka+AfHVChgd2wyc3iTfftqZfpyDc=;
        b=mHwEnudSs0YuOe4477jeMklBqG8VxU3U27qu+qTT/Rvl2iKaz5Tx0P1bfRhIXWiMco
         DymN6c1TBnoT199gao35Ku8N8UNJY+hu8muPi9x6+uOXhT2viTXPwDJ2sJ3JRYus19ha
         ddDTvQRL13sHPOFAX2G/W4Eqzp/mcMxpP5DENR/uMH9chjcAEDbFHQwnxnwJNQ0YPsEX
         ypVZunz8q0A9pWULeeoGuDkq+4rgUz4ctERUQWP4kujSP61nMMIYA1mVgVezKiemIPAU
         U9EMAbPliZp+aGm9FYGesFx7mqgy0wwyIq9btglXVxzNVv3ZkqTIQLPdmDAu0kfUJcDs
         wQCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SwvFBRtYb9/G826Ka+AfHVChgd2wyc3iTfftqZfpyDc=;
        b=TRGgiMmrOA1sP8ulMa0DHs26mjBGlwCye92S2dy9NqCyNKGu9raa+v6MrNsE6msiTx
         6TAMJTETQXviwN1F5F1JiSALCaDRQau6ABzKes5P8L0XBOTMfQKP/FQHaZelnJQoNmN9
         sWYjW9aFKjksQEZGAJGL9Vvs7QS4blTzyf2FzQzyqZslnJO9IUb/c5BorIgZpHYhPL/M
         pCiYIiL1LlFgAEGB7vn9oC6w2sG+U59sZPTBBglCSPXci+bLnMP5bPecgGDsvjcD8PBP
         VQTLdjf4jwtz5YFWHwqNRxCyCk6eSTZvP/wEtDMWbfw+AG3nQfQF8mMfsJpcwaGgyg8D
         /Kcg==
X-Gm-Message-State: AOAM5306qjXLO6HZ8UNDPk8QxPkOYdMloIA9VC8xWPWrLFazvEiQQa5X
        6h8aSQd1tfgQw7Fj/+4IC8kstdqJ+e3vLQ==
X-Google-Smtp-Source: ABdhPJxAoXwLAsSI4g3LBzTXL0kvHp/LjRpZBpc/VVCmCeE2tRsgJSK3oPmWPh6wQollnwDYknjYcw==
X-Received: by 2002:a19:6e43:: with SMTP id q3mr14946280lfk.265.1625583033035;
        Tue, 06 Jul 2021 07:50:33 -0700 (PDT)
Received: from localhost.localdomain ([94.103.225.155])
        by smtp.gmail.com with ESMTPSA id a15sm921337ljn.26.2021.07.06.07.50.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jul 2021 07:50:32 -0700 (PDT)
From:   Pavel Skripkin <paskripkin@gmail.com>
To:     mchehab@kernel.org
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Pavel Skripkin <paskripkin@gmail.com>,
        syzbot+a6969ef522a36d3344c9@syzkaller.appspotmail.com
Subject: [PATCH] media: em28xx: fix corrupted list
Date:   Tue,  6 Jul 2021 17:50:25 +0300
Message-Id: <20210706145025.25776-1-paskripkin@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Syzbot reported corrupted list in em28xx driver. The problem was in
non-reinitialized lists on disconnect. Since all 2 lists are global
variables and driver can be connected and disconnected many times we
should call INIT_LIST_HEAD() in .disconnect method to prevent corrupted
list entries.

Fixes: 1a23f81b7dc3 ("V4L/DVB (9979): em28xx: move usb probe code to a proper place")
Reported-by: syzbot+a6969ef522a36d3344c9@syzkaller.appspotmail.com
Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
---
 drivers/media/usb/em28xx/em28xx-cards.c | 2 ++
 drivers/media/usb/em28xx/em28xx-core.c  | 6 ++++++
 drivers/media/usb/em28xx/em28xx.h       | 1 +
 3 files changed, 9 insertions(+)

diff --git a/drivers/media/usb/em28xx/em28xx-cards.c b/drivers/media/usb/em28xx/em28xx-cards.c
index ba9292e2a587..8b1ff79c37a0 100644
--- a/drivers/media/usb/em28xx/em28xx-cards.c
+++ b/drivers/media/usb/em28xx/em28xx-cards.c
@@ -4148,6 +4148,8 @@ static void em28xx_usb_disconnect(struct usb_interface *intf)
 		dev->dev_next = NULL;
 	}
 	kref_put(&dev->ref, em28xx_free_device);
+
+	em28xx_reset_lists();
 }
 
 static int em28xx_usb_suspend(struct usb_interface *intf,
diff --git a/drivers/media/usb/em28xx/em28xx-core.c b/drivers/media/usb/em28xx/em28xx-core.c
index 584fa400cd7d..03970ed00dba 100644
--- a/drivers/media/usb/em28xx/em28xx-core.c
+++ b/drivers/media/usb/em28xx/em28xx-core.c
@@ -1131,6 +1131,12 @@ void em28xx_init_extension(struct em28xx *dev)
 	mutex_unlock(&em28xx_devlist_mutex);
 }
 
+void em28xx_reset_lists(void)
+{
+	INIT_LIST_HEAD(&em28xx_devlist);
+	INIT_LIST_HEAD(&em28xx_extension_devlist);
+}
+
 void em28xx_close_extension(struct em28xx *dev)
 {
 	const struct em28xx_ops *ops = NULL;
diff --git a/drivers/media/usb/em28xx/em28xx.h b/drivers/media/usb/em28xx/em28xx.h
index ab167cd1f400..73caaaa398d3 100644
--- a/drivers/media/usb/em28xx/em28xx.h
+++ b/drivers/media/usb/em28xx/em28xx.h
@@ -835,6 +835,7 @@ void em28xx_stop_urbs(struct em28xx *dev);
 int em28xx_set_mode(struct em28xx *dev, enum em28xx_mode set_mode);
 int em28xx_gpio_set(struct em28xx *dev, const struct em28xx_reg_seq *gpio);
 int em28xx_register_extension(struct em28xx_ops *dev);
+void em28xx_reset_lists(void);
 void em28xx_unregister_extension(struct em28xx_ops *dev);
 void em28xx_init_extension(struct em28xx *dev);
 void em28xx_close_extension(struct em28xx *dev);
-- 
2.32.0

