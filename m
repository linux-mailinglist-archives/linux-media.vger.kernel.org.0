Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97CA33673A6
	for <lists+linux-media@lfdr.de>; Wed, 21 Apr 2021 21:43:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245508AbhDUTo2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Apr 2021 15:44:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243378AbhDUTo1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Apr 2021 15:44:27 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3E5EC06174A;
        Wed, 21 Apr 2021 12:43:51 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id h36so14381002lfv.7;
        Wed, 21 Apr 2021 12:43:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qhjGQqRuIlFnkwTxrM8RYY1j9MhklbMal3j+ne7dpI8=;
        b=GC3JgOPUj0btLYVQvPKO0dFyV4FWQO8wRIlBpjwrduf4tf832thjJHQfECEEbKyY8d
         Ioz67ZBhkOz36ZkjzuTEnlRZp1FC+qETS1YFgXYhKo5X93ZsDtBhm71Df+I2E6R7Hy6D
         3R4HYJUXi8yHnvNV8WcRC/+e2fpvN5LlkJdR43aa7Q0Qob/8gPjblxZ91/PZ3nQpatOT
         cnpvFL+LbsioO0nLN5N+BYh6GGMUkTm2lXQ1a69p0wTmnO8Gy+2aSPZZPbhhH2/+bl8q
         njetjtulKQyxOWVIFq9phb14WtlzRkZus6DFqkTKAyZ9M9ISwBBNmlyrizgYa9+Ue9Fo
         +t4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qhjGQqRuIlFnkwTxrM8RYY1j9MhklbMal3j+ne7dpI8=;
        b=Ig7lzzO2JXSXTKF+/mQCb7bJsU/TQfVzOk+Bz6HyBYF2I/mSzm2k3Nsh98GvJPVvXx
         7fbqJ3f0iYW+I7DIWRmzAhdk2N7bQesqmqN7yBQRIu1oJvXcG3vxtf57BJSle0pC2TBp
         H2jhrglZFbmPxIBOFa6TGj7uqYBNbXu/vLkKojCFgLSei7PrhFxyPRFYDlMOwczCOBRj
         IYNsxN5QWgnrIvdzfKsvdMUkKohNxbJtZzYsyty/s+9qNkc8P9mbVVV5xZn0Yw9xCL2Y
         xk/xN/8MWgxxXWK9O1aumYGi4chYHRhFgr5K9xaXwz2dDEvNn3PIGV6+Bs5285pPyNol
         V88g==
X-Gm-Message-State: AOAM533B9mMH97hl7bwLdTRq4qCqZ9lWAQ+ULpXZFIgG8WDylKxyvkVX
        4uSWxKnVYXLThI3y9Er2H7W6X4k8yMOSEg==
X-Google-Smtp-Source: ABdhPJwEqpkQzJy8WWnBzkv6pvUxJ02s4RXYUw/bRxCDF5tppHzwrqy5NF6ee5hh83j+obp7rfSGLQ==
X-Received: by 2002:a05:6512:3056:: with SMTP id b22mr13861180lfb.601.1619034230437;
        Wed, 21 Apr 2021 12:43:50 -0700 (PDT)
Received: from localhost.localdomain ([94.103.229.147])
        by smtp.gmail.com with ESMTPSA id t2sm50228lfl.73.2021.04.21.12.43.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Apr 2021 12:43:50 -0700 (PDT)
From:   Pavel Skripkin <paskripkin@gmail.com>
To:     mchehab@kernel.org, gustavoars@kernel.org
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Pavel Skripkin <paskripkin@gmail.com>,
        syzbot+d1e69c888f0d3866ead4@syzkaller.appspotmail.com
Subject: [PATCH] media: cpia2: fix memory leak in cpia2_usb_probe
Date:   Wed, 21 Apr 2021 22:43:45 +0300
Message-Id: <20210421194345.12650-1-paskripkin@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

syzbot reported leak in cpia2 usb driver. The problem was
in invalid error handling.

v4l2_device_register() is called in cpia2_init_camera_struct(), but
all error cases after cpia2_init_camera_struct() did not call the
v4l2_device_unregister()

Reported-by: syzbot+d1e69c888f0d3866ead4@syzkaller.appspotmail.com
Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
---
 drivers/media/usb/cpia2/cpia2.h      |  1 +
 drivers/media/usb/cpia2/cpia2_core.c | 12 ++++++++++++
 drivers/media/usb/cpia2/cpia2_usb.c  | 13 +++++++------
 3 files changed, 20 insertions(+), 6 deletions(-)

diff --git a/drivers/media/usb/cpia2/cpia2.h b/drivers/media/usb/cpia2/cpia2.h
index 50835f5f7512..57b7f1ea68da 100644
--- a/drivers/media/usb/cpia2/cpia2.h
+++ b/drivers/media/usb/cpia2/cpia2.h
@@ -429,6 +429,7 @@ int cpia2_send_command(struct camera_data *cam, struct cpia2_command *cmd);
 int cpia2_do_command(struct camera_data *cam,
 		     unsigned int command,
 		     unsigned char direction, unsigned char param);
+void cpia2_deinit_camera_struct(struct camera_data *cam, struct usb_interface *intf);
 struct camera_data *cpia2_init_camera_struct(struct usb_interface *intf);
 int cpia2_init_camera(struct camera_data *cam);
 int cpia2_allocate_buffers(struct camera_data *cam);
diff --git a/drivers/media/usb/cpia2/cpia2_core.c b/drivers/media/usb/cpia2/cpia2_core.c
index e747548ab286..b5a2d06fb356 100644
--- a/drivers/media/usb/cpia2/cpia2_core.c
+++ b/drivers/media/usb/cpia2/cpia2_core.c
@@ -2163,6 +2163,18 @@ static void reset_camera_struct(struct camera_data *cam)
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
index 3ab80a7b4498..76aac06f9fb8 100644
--- a/drivers/media/usb/cpia2/cpia2_usb.c
+++ b/drivers/media/usb/cpia2/cpia2_usb.c
@@ -844,15 +844,13 @@ static int cpia2_usb_probe(struct usb_interface *intf,
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
@@ -872,11 +870,14 @@ static int cpia2_usb_probe(struct usb_interface *intf,
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
2.31.1

