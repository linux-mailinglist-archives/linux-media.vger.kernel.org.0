Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB4E23BB29B
	for <lists+linux-media@lfdr.de>; Mon,  5 Jul 2021 01:14:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234601AbhGDXP6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 4 Jul 2021 19:15:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:55624 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234012AbhGDXOu (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 4 Jul 2021 19:14:50 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7D421613F7;
        Sun,  4 Jul 2021 23:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1625440256;
        bh=q1PzI/JtSZ+DwqLJltd9URxv6AV7m9S86jih2iYUyKo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=SRP96hcW+BiG6HKXIsFTLtG9gOZANvr9MEoNj3hgCjFXGnOqMN7WkX0fI9dVS2aAP
         zWhp1SYDxUXoTtibYyPIu2xzBajquDSAq5X9FXi2ziS8zBgpxNjxkNcDNJpl74mzXo
         s9+PO9iZ31VaGYjKP++cmdO4DXyRjrb2426I1IBwnBW8EtF6zj06B36quhNki+8Ii7
         EPpuDRQeZuYcBCsghLStYvcWrLFkzhkLC5d2+wCIEJWxrPjJNjzFCCv15bLu6yLn1J
         LvzVZEX2GMeyV0OmPnvrWw1zQhoslNfRR/oSO97jtoUOr97dbb7oBufmmT81JcCmf2
         BjuvSko/O5eAg==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Pavel Skripkin <paskripkin@gmail.com>,
        syzbot+d1e69c888f0d3866ead4@syzkaller.appspotmail.com,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sasha Levin <sashal@kernel.org>, linux-media@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 10/31] media: cpia2: fix memory leak in cpia2_usb_probe
Date:   Sun,  4 Jul 2021 19:10:22 -0400
Message-Id: <20210704231043.1491209-10-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210704231043.1491209-1-sashal@kernel.org>
References: <20210704231043.1491209-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Pavel Skripkin <paskripkin@gmail.com>

[ Upstream commit be8656e62e9e791837b606a027802b504a945c97 ]

syzbot reported leak in cpia2 usb driver. The problem was
in invalid error handling.

v4l2_device_register() is called in cpia2_init_camera_struct(), but
all error cases after cpia2_init_camera_struct() did not call the
v4l2_device_unregister()

Reported-by: syzbot+d1e69c888f0d3866ead4@syzkaller.appspotmail.com
Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/media/usb/cpia2/cpia2.h      |  1 +
 drivers/media/usb/cpia2/cpia2_core.c | 12 ++++++++++++
 drivers/media/usb/cpia2/cpia2_usb.c  | 13 +++++++------
 3 files changed, 20 insertions(+), 6 deletions(-)

diff --git a/drivers/media/usb/cpia2/cpia2.h b/drivers/media/usb/cpia2/cpia2.h
index ab238ac8bfc0..50c952250dc9 100644
--- a/drivers/media/usb/cpia2/cpia2.h
+++ b/drivers/media/usb/cpia2/cpia2.h
@@ -438,6 +438,7 @@ int cpia2_send_command(struct camera_data *cam, struct cpia2_command *cmd);
 int cpia2_do_command(struct camera_data *cam,
 		     unsigned int command,
 		     unsigned char direction, unsigned char param);
+void cpia2_deinit_camera_struct(struct camera_data *cam, struct usb_interface *intf);
 struct camera_data *cpia2_init_camera_struct(struct usb_interface *intf);
 int cpia2_init_camera(struct camera_data *cam);
 int cpia2_allocate_buffers(struct camera_data *cam);
diff --git a/drivers/media/usb/cpia2/cpia2_core.c b/drivers/media/usb/cpia2/cpia2_core.c
index 3dfbb545c0e3..42cce7e94101 100644
--- a/drivers/media/usb/cpia2/cpia2_core.c
+++ b/drivers/media/usb/cpia2/cpia2_core.c
@@ -2172,6 +2172,18 @@ static void reset_camera_struct(struct camera_data *cam)
 	cam->height = cam->params.roi.height;
 }
 
+/******************************************************************************
+ *
+ *  cpia2_init_camera_struct
+ *
+ *  Deinitialize camera struct
+ *****************************************************************************/
+void cpia2_deinit_camera_struct(struct camera_data *cam, struct usb_interface *intf)
+{
+	v4l2_device_unregister(&cam->v4l2_dev);
+	kfree(cam);
+}
+
 /******************************************************************************
  *
  *  cpia2_init_camera_struct
diff --git a/drivers/media/usb/cpia2/cpia2_usb.c b/drivers/media/usb/cpia2/cpia2_usb.c
index 4c191fcd3a7f..839217574069 100644
--- a/drivers/media/usb/cpia2/cpia2_usb.c
+++ b/drivers/media/usb/cpia2/cpia2_usb.c
@@ -853,15 +853,13 @@ static int cpia2_usb_probe(struct usb_interface *intf,
 	ret = set_alternate(cam, USBIF_CMDONLY);
 	if (ret < 0) {
 		ERR("%s: usb_set_interface error (ret = %d)\n", __func__, ret);
-		kfree(cam);
-		return ret;
+		goto alt_err;
 	}
 
 
 	if((ret = cpia2_init_camera(cam)) < 0) {
 		ERR("%s: failed to initialize cpia2 camera (ret = %d)\n", __func__, ret);
-		kfree(cam);
-		return ret;
+		goto alt_err;
 	}
 	LOG("  CPiA Version: %d.%02d (%d.%d)\n",
 	       cam->params.version.firmware_revision_hi,
@@ -881,11 +879,14 @@ static int cpia2_usb_probe(struct usb_interface *intf,
 	ret = cpia2_register_camera(cam);
 	if (ret < 0) {
 		ERR("%s: Failed to register cpia2 camera (ret = %d)\n", __func__, ret);
-		kfree(cam);
-		return ret;
+		goto alt_err;
 	}
 
 	return 0;
+
+alt_err:
+	cpia2_deinit_camera_struct(cam, intf);
+	return ret;
 }
 
 /******************************************************************************
-- 
2.30.2

