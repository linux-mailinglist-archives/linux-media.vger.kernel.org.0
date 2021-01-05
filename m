Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A9FD2EAB93
	for <lists+linux-media@lfdr.de>; Tue,  5 Jan 2021 14:11:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729884AbhAENKm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Jan 2021 08:10:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729854AbhAENKl (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Jan 2021 08:10:41 -0500
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com [IPv6:2607:f8b0:4864:20::72a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63902C061793;
        Tue,  5 Jan 2021 05:10:16 -0800 (PST)
Received: by mail-qk1-x72a.google.com with SMTP id c7so26324265qke.1;
        Tue, 05 Jan 2021 05:10:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xWMInHwooADPJ2IZX0gau/tRDi3Ku0nsq1jMdbuuQKQ=;
        b=SdhR7VUy+XjFkEKy+ZENOGPqEwiWxcOsrKd97ZPeDuCgVYQkBIbyHfeE/J8irEsRr3
         +G20pgigqE3jjNzti2RfX0/sOrY5Zfu8PwkkinqvbdO8/cN0VncSKij7WFb3Za9dZ7L6
         MASA7Iy5Ep6k4dYJAXJNx4Rwl2Ey4E3BZNCmNL1aiEjgsZYdq8QQWgA05KyjoiM3Niif
         mOjRy9M1JX/IRdbCIW1HaaTA/XJ7bGsm8NrkZ/ADYWv8TMGPSCT7EO5hGlxjXCuxTaJr
         KYaqU72iaMPoNZwA4/gp5FIsqk2qGxBDp8HTURCD7DvLwUKM4V0vWjtBMAX3uxnofIqo
         Jazw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xWMInHwooADPJ2IZX0gau/tRDi3Ku0nsq1jMdbuuQKQ=;
        b=OCFfY5s9Yy/Y3wAkNcdn8FV/00yBPBGsOOScpoVRg9GVkifGvod0GqRPuZsR5nbMEo
         jWxHlTfY2aH5MqqenxsspdSybaraVzYevPzdrRPGnzymGktP9QnRe16I2QvMzczQOBUk
         rZPUx2YRFAHt9nJ8uHDRBcsRuQHWsVrpzZGgfkwKUDdQWKR2n1C7a0ntcX4m98++9jpe
         sSjciiSy30aZdtjOsUQaSYnc2o0BSK5bLasFFPwOqAvbVvbcp68h1K1GZyalmOl70P3o
         f8f7lxaCm0+AW9k6EhVg3Erc503enXnMkSdgyCzvgyn0UwdCNChmO817NvsUt7E4gE83
         1qsA==
X-Gm-Message-State: AOAM532abO2aGnVTlASOzOr8o2KtxPxBMV0K8hwDbbQgpnCmuwOsdnYJ
        ZF9CGIl4RjfeCnx9b8JaPR0=
X-Google-Smtp-Source: ABdhPJzNxGB1ZxuonbrbvEtm2nD0Hxg5iIdcjLEO90KcVsUW1uaNMzqeanW9pJWVLbrfHhYTLAHYQw==
X-Received: by 2002:a05:620a:13c2:: with SMTP id g2mr74182513qkl.174.1609852215608;
        Tue, 05 Jan 2021 05:10:15 -0800 (PST)
Received: from localhost.localdomain ([2804:14d:72b1:8920:77d4:6fb0:85b3:b6f7])
        by smtp.gmail.com with ESMTPSA id s14sm19877804qke.45.2021.01.05.05.10.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jan 2021 05:10:14 -0800 (PST)
From:   "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To:     mchehab@kernel.org, hverkuil@xs4all.nl
Cc:     "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] media: vidtv: Add media controller support
Date:   Tue,  5 Jan 2021 10:09:53 -0300
Message-Id: <20210105130956.1133222-2-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210105130956.1133222-1-dwlsalmeida@gmail.com>
References: <20210105130956.1133222-1-dwlsalmeida@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>

Add media controller support when CONFIG_MEDIA_CONTROLLER_DVB is set
so that, in the future, a test sequence in v4l-utils can be written
without having to know which /dev/fooX device should be used.

Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
---
 .../media/test-drivers/vidtv/vidtv_bridge.c   | 26 +++++++++++++++++++
 .../media/test-drivers/vidtv/vidtv_bridge.h   |  6 +++++
 2 files changed, 32 insertions(+)

diff --git a/drivers/media/test-drivers/vidtv/vidtv_bridge.c b/drivers/media/test-drivers/vidtv/vidtv_bridge.c
index fc64d0c8492a..4424f9585f86 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_bridge.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_bridge.c
@@ -17,6 +17,8 @@
 #include <linux/time.h>
 #include <linux/types.h>
 #include <linux/workqueue.h>
+#include <media/dvbdev.h>
+#include <media/media-device.h>
 
 #include "vidtv_bridge.h"
 #include "vidtv_common.h"
@@ -501,9 +503,28 @@ static int vidtv_bridge_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, dvb);
 
+#ifdef CONFIG_MEDIA_CONTROLLER_DVB
+	dvb->mdev.dev = &pdev->dev;
+
+	strscpy(dvb->mdev.model, "vidtv", sizeof(dvb->mdev.model));
+	strscpy(dvb->mdev.bus_info, "platform:vidtv", sizeof(dvb->mdev.bus_info));
+
+	media_device_init(&dvb->mdev);
+	ret = media_device_register(&dvb->mdev);
+	if (ret) {
+		dev_err(dvb->mdev.dev,
+			"media device register failed (err=%d)\n", ret);
+		goto err_media_device_register;
+	}
+
+	dvb_register_media_controller(&dvb->adapter, &dvb->mdev);
+#endif //CONFIG_MEDIA_CONTROLLER_DVB
+
 	dev_info(&pdev->dev, "Successfully initialized vidtv!\n");
 	return ret;
 
+err_media_device_register:
+	media_device_cleanup(&dvb->mdev);
 err_dvb:
 	kfree(dvb);
 	return ret;
@@ -516,6 +537,11 @@ static int vidtv_bridge_remove(struct platform_device *pdev)
 
 	dvb = platform_get_drvdata(pdev);
 
+#ifdef CONFIG_MEDIA_CONTROLLER_DVB
+	media_device_unregister(&dvb->mdev);
+	media_device_cleanup(&dvb->mdev);
+#endif //CONFIG_MEDIA_CONTROLLER_DVB
+
 	mutex_destroy(&dvb->feed_lock);
 
 	for (i = 0; i < NUM_FE; ++i) {
diff --git a/drivers/media/test-drivers/vidtv/vidtv_bridge.h b/drivers/media/test-drivers/vidtv/vidtv_bridge.h
index 2528adaee27d..d42899a31295 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_bridge.h
+++ b/drivers/media/test-drivers/vidtv/vidtv_bridge.h
@@ -24,6 +24,7 @@
 #include <media/dmxdev.h>
 #include <media/dvb_demux.h>
 #include <media/dvb_frontend.h>
+#include <media/media-device.h>
 
 #include "vidtv_mux.h"
 
@@ -42,6 +43,7 @@
  * @feed_lock: Protects access to the start/stop stream logic/data.
  * @streaming: Whether we are streaming now.
  * @mux: The abstraction responsible for delivering MPEG TS packets to the bridge.
+ * @mdev: The media_device struct for media controller support.
  */
 struct vidtv_dvb {
 	struct platform_device *pdev;
@@ -60,6 +62,10 @@ struct vidtv_dvb {
 	bool streaming;
 
 	struct vidtv_mux *mux;
+
+#ifdef CONFIG_MEDIA_CONTROLLER_DVB
+	struct media_device mdev;
+#endif //CONFIG_MEDIA_CONTROLLER_DVB
 };
 
 #endif // VIDTV_BRIDG_H
-- 
2.30.0

