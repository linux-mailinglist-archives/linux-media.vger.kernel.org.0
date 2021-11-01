Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06E4A441983
	for <lists+linux-media@lfdr.de>; Mon,  1 Nov 2021 11:10:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231777AbhKAKNE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Nov 2021 06:13:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232161AbhKAKM4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Nov 2021 06:12:56 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB976C061767;
        Mon,  1 Nov 2021 02:55:52 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id m26so15873978pff.3;
        Mon, 01 Nov 2021 02:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UVw7JpRuL3Zpasl1yKpDjtfcQv9s3AR150vJWnlV/mo=;
        b=VF7DsrQ3BN98ddp3+F0aoZvy4BRNhLGMryo/aRHLnVAqnoSq1vrpYIbem0ev3R6De+
         x0rEe7MPkW96oOhVrK/r23PyXE6tXqmlUuJspm63C2eEn3pFpiELfg4Dxo3UhZVx7iVK
         4pU7zrvgQ+zNYERog0QnsoC0iu7ZTYwZxsvbaUAcyFGs1xYraZvStZAwaqX0plP0tAIU
         5z3PS+NfJtpphVdWd3+HbFa6NPOjBTef7oB0mLT9iIFbtnxgThJtxX7+0a/HJSZg/cSv
         ruNExtDPhFKub0Iqv7cEDcjvHq+epc4EaHE6KORCLkoJJxGa8NcDoaLZxlDFnnIjAo7j
         55AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UVw7JpRuL3Zpasl1yKpDjtfcQv9s3AR150vJWnlV/mo=;
        b=rKaICKNyI+H6MDJLGnls/NBhfWKOId6vQeVM1iW+/PWJo9fHypg2XixdDCOMTjSBOo
         VOCfr8afDrqJiS1GBUhBwKu+nXWpUt80XT6eQLjE/D6WN3qEj7It+/7UmMUkSjx5PTr9
         fMS+Jo2EhSN5Zxuj3U76lu+rL6EjsYas4bPZRCIx605pXUyIGFcS9Ib3x1uu4ob+FuIh
         DVMrESqyXDwBMj/OCnEHU1rOt1kQIlzmo3NLv2qQ4F9wb92qgQnL0hUHU+ihhBb3PC42
         CdH3WARrN/5Q4ROzpkflH0jwcuZrD+i4yuvnaGIaNY6HSxmMCOFVBqKt0urCwGFPMgSL
         1RQw==
X-Gm-Message-State: AOAM530i7okk5bw5wJ+dhFZECULWFcA+Uu8V6cOPnZD9GPvl7iAYjVa/
        DL0HN7eig3g64wBFb4qphv8=
X-Google-Smtp-Source: ABdhPJwcPzEvKL6lcLx0z54E2uefZwIWW/fS4DODk3QnRyS4ZehmSIYnNsyH6uHTZl1tTAVariYdAQ==
X-Received: by 2002:a63:8842:: with SMTP id l63mr10247192pgd.280.1635760552289;
        Mon, 01 Nov 2021 02:55:52 -0700 (PDT)
Received: from localhost.localdomain ([94.177.118.117])
        by smtp.gmail.com with ESMTPSA id u11sm14727719pfk.151.2021.11.01.02.55.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Nov 2021 02:55:51 -0700 (PDT)
From:   Dongliang Mu <mudongliangabcd@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Dongliang Mu <mudongliangabcd@gmail.com>,
        Pavel Skripkin <paskripkin@gmail.com>,
        syzbot <syzkaller@googlegroups.com>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] media: em28xx: fix memory leak in em28xx_init_dev
Date:   Mon,  1 Nov 2021 17:55:39 +0800
Message-Id: <20211101095539.423246-1-mudongliangabcd@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In the em28xx_init_rev, if em28xx_audio_setup fails, this function fails
to deallocate the media_dev allocated in the em28xx_media_device_init.

Fix this by adding em28xx_unregister_media_device to free media_dev.

BTW, this patch is tested in my local syzkaller instance, and it can
prevent the memory leak from occurring again.

CC: Pavel Skripkin <paskripkin@gmail.com>
Fixes: 37ecc7b1278f ("[media] em28xx: add media controller support")
Signed-off-by: Dongliang Mu <mudongliangabcd@gmail.com>
Reported-by: syzbot <syzkaller@googlegroups.com>
---
 drivers/media/usb/em28xx/em28xx-cards.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/media/usb/em28xx/em28xx-cards.c b/drivers/media/usb/em28xx/em28xx-cards.c
index c1e0dccb7408..fca68939ca50 100644
--- a/drivers/media/usb/em28xx/em28xx-cards.c
+++ b/drivers/media/usb/em28xx/em28xx-cards.c
@@ -3625,8 +3625,10 @@ static int em28xx_init_dev(struct em28xx *dev, struct usb_device *udev,
 
 	if (dev->is_audio_only) {
 		retval = em28xx_audio_setup(dev);
-		if (retval)
-			return -ENODEV;
+		if (retval) {
+			retval = -ENODEV;
+			goto err_deinit_media;
+		}
 		em28xx_init_extension(dev);
 
 		return 0;
@@ -3645,7 +3647,7 @@ static int em28xx_init_dev(struct em28xx *dev, struct usb_device *udev,
 		dev_err(&dev->intf->dev,
 			"%s: em28xx_i2c_register bus 0 - error [%d]!\n",
 		       __func__, retval);
-		return retval;
+		goto err_deinit_media;
 	}
 
 	/* register i2c bus 1 */
@@ -3661,9 +3663,7 @@ static int em28xx_init_dev(struct em28xx *dev, struct usb_device *udev,
 				"%s: em28xx_i2c_register bus 1 - error [%d]!\n",
 				__func__, retval);
 
-			em28xx_i2c_unregister(dev, 0);
-
-			return retval;
+			goto err_unreg_i2c;
 		}
 	}
 
@@ -3671,6 +3671,13 @@ static int em28xx_init_dev(struct em28xx *dev, struct usb_device *udev,
 	em28xx_card_setup(dev);
 
 	return 0;
+
+
+err_unreg_i2c:
+	em28xx_i2c_unregister(dev, 0);
+err_deinit_media:
+	em28xx_unregister_media_device(dev);
+	return retval;
 }
 
 static int em28xx_duplicate_dev(struct em28xx *dev)
-- 
2.25.1

