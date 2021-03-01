Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B88B329272
	for <lists+linux-media@lfdr.de>; Mon,  1 Mar 2021 21:46:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242304AbhCAUpr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Mar 2021 15:45:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243549AbhCAUmo (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Mar 2021 15:42:44 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 664ECC061788;
        Mon,  1 Mar 2021 12:41:54 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id q25so7456661lfc.8;
        Mon, 01 Mar 2021 12:41:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=U8ckhY23O0No17m/JvuHL31BFYtBvGOi+OkwRIXziEU=;
        b=T+Vv7hKlov5Vu4PtyeJpSz5nT3nmwNG8uBUCcMyEXFKLfd1vCsS3CtZBsm26bGahIQ
         7MU5HXg9yifj+/LFUg10NhRoZ3gM9dNZZiWQ7Cqf7FdLpJz5tT3YUmiRLrS5XsgzDn28
         A049wJD6VsLsBN7igQiEO6tEFORDaGgw5T2m083gw7eTxTYw+od4hzEyCjmHFu5eOW6f
         aBdM45CBWdFk2yd/ebPhhgHjFhogoPWPxlvDSeIkIKHSrSQxR9Z5wHQDkw68eqUbNkZk
         Q3Mf82/ykuzRkY8Y3Kqdliq6crCcmS4nUEGVzG6oUzGEPXfsZaoawuwt1zMO9UhyuApm
         Ha5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=U8ckhY23O0No17m/JvuHL31BFYtBvGOi+OkwRIXziEU=;
        b=GOo3OriMJkcheEhnu5YBOy5Fuch8csQLJp+aP2W2n3m5IkprVU2kIubs9rdX6PYXMs
         3QufPQYYzYiZ/4BPa4l+BCXcZOC541PL6jUcB8kMnGJlfcwRpMHi3GaXJ+yZdpn3fjw6
         /yypdPZ10TcuN7DaBpJX6N3WzoGfL7wamrMemWM16a6Ui53F7o6PFWtwaSf/P0UWQMHe
         PAIRygvfQ8FSA8WzmVNL03N0AfUAAdblz9EZWMq2vTFphX5Of3WpjriLfnDA+6LfxsdV
         GirQ0PggBi8F7OYDcG/zUEB3XIe1aKLU4nMkjVhWYv8FyxfwWTJJr2tzQwg2TSEWICjq
         wmng==
X-Gm-Message-State: AOAM530PudgTxPnsUs4mG/EswGw5UER6Cfu0Je8hKBz85NdTBUlVQZUC
        L/O8E27RQWfQBBdV7xwSHYA=
X-Google-Smtp-Source: ABdhPJxNlsRw++jCuURHS8Ft1igh71j4HocCMoabTMh9Hk/u15uuR7zQ5SGcoC5RVWhEMxD7RNVzUA==
X-Received: by 2002:a05:6512:159:: with SMTP id m25mr3434328lfo.296.1614631312876;
        Mon, 01 Mar 2021 12:41:52 -0800 (PST)
Received: from localhost.localdomain ([94.103.235.167])
        by smtp.gmail.com with ESMTPSA id z129sm1661392lfa.127.2021.03.01.12.41.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Mar 2021 12:41:52 -0800 (PST)
From:   Pavel Skripkin <paskripkin@gmail.com>
To:     royale@zerezo.com, mchehab@kernel.org
Cc:     linux-usb@vger.kernel.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Pavel Skripkin <paskripkin@gmail.com>,
        syzbot+efe9aefc31ae1e6f7675@syzkaller.appspotmail.com
Subject: [PATCH] drivers/media/usb: fix memory leak in zr364xx_probe
Date:   Mon,  1 Mar 2021 23:38:26 +0300
Message-Id: <20210301203829.345527-1-paskripkin@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

syzbot reported memory leak in zr364xx_probe()[1].
The problem was in invalid error handling order.
All error conditions rigth after v4l2_ctrl_handler_init()
must call v4l2_ctrl_handler_free().

Reported-by: syzbot+efe9aefc31ae1e6f7675@syzkaller.appspotmail.com
Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
---
 drivers/media/usb/zr364xx/zr364xx.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/media/usb/zr364xx/zr364xx.c b/drivers/media/usb/zr364xx/zr364xx.c
index d29b861367ea..1ef611e08323 100644
--- a/drivers/media/usb/zr364xx/zr364xx.c
+++ b/drivers/media/usb/zr364xx/zr364xx.c
@@ -1430,7 +1430,7 @@ static int zr364xx_probe(struct usb_interface *intf,
 	if (hdl->error) {
 		err = hdl->error;
 		dev_err(&udev->dev, "couldn't register control\n");
-		goto unregister;
+		goto free_hdlr_and_unreg_dev;
 	}
 	/* save the init method used by this camera */
 	cam->method = id->driver_info;
@@ -1503,7 +1503,7 @@ static int zr364xx_probe(struct usb_interface *intf,
 	if (!cam->read_endpoint) {
 		err = -ENOMEM;
 		dev_err(&intf->dev, "Could not find bulk-in endpoint\n");
-		goto unregister;
+		goto free_hdlr_and_unreg_dev;
 	}
 
 	/* v4l */
@@ -1515,7 +1515,7 @@ static int zr364xx_probe(struct usb_interface *intf,
 	/* load zr364xx board specific */
 	err = zr364xx_board_init(cam);
 	if (err)
-		goto unregister;
+		goto free_hdlr_and_unreg_dev;
 	err = v4l2_ctrl_handler_setup(hdl);
 	if (err)
 		goto board_uninit;
@@ -1533,7 +1533,7 @@ static int zr364xx_probe(struct usb_interface *intf,
 	err = video_register_device(&cam->vdev, VFL_TYPE_VIDEO, -1);
 	if (err) {
 		dev_err(&udev->dev, "video_register_device failed\n");
-		goto free_handler;
+		goto board_uninit;
 	}
 	cam->v4l2_dev.release = zr364xx_release;
 
@@ -1541,11 +1541,10 @@ static int zr364xx_probe(struct usb_interface *intf,
 		 video_device_node_name(&cam->vdev));
 	return 0;
 
-free_handler:
-	v4l2_ctrl_handler_free(hdl);
 board_uninit:
 	zr364xx_board_uninit(cam);
-unregister:
+free_hdlr_and_unreg_dev:
+	v4l2_ctrl_handler_free(hdl);
 	v4l2_device_unregister(&cam->v4l2_dev);
 free_cam:
 	kfree(cam);
-- 
2.25.1

