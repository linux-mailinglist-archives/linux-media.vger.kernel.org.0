Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B63D2EB854
	for <lists+linux-media@lfdr.de>; Wed,  6 Jan 2021 04:07:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726418AbhAFDFZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Jan 2021 22:05:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725808AbhAFDFZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Jan 2021 22:05:25 -0500
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com [IPv6:2607:f8b0:4864:20::831])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC12BC06134D;
        Tue,  5 Jan 2021 19:04:59 -0800 (PST)
Received: by mail-qt1-x831.google.com with SMTP id 7so1317668qtp.1;
        Tue, 05 Jan 2021 19:04:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nietjLUQJU/zJ/brz+Xm6cxAQwETU/f3MDRbRdqivaY=;
        b=FgZe9rJ0EbdtbrW6IfSOoZjsTSRBbFO17agIWlrEioMAK8j9pqrasM6XTg5KTYwDun
         rZetIXS91Zd2WszjxWNrfi2aAL2AvdZDTjpXBPfCEnS/Z4lywjFCp/rCkcHDJJPHs3/0
         kzU7/4G40xhcX85gNb169iKbeDBxIcir6+QonIe9TU0yHkAicZUcPwkFJCokQ4Fz9gpJ
         f5nBrvxvjeEBotjBwdaukw/YFU75D56ajb77Ai7gVWxgGOz5G3b68nYiX7T+16Sm8xar
         XlVCaCcXFpYm77afvq4QaIMrh+q5INKGRosnsnU6o9+gWY6ePx2tb0yraVNoVBqfqnfg
         NTmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nietjLUQJU/zJ/brz+Xm6cxAQwETU/f3MDRbRdqivaY=;
        b=KMvLBF90Nj45FQPTIiBLWKVF3n7Seet01U6BCnYsj3FEjvFTFpswUGzCi8TGlsA1wZ
         9X+d1XlwODF6TI4CpY3UkbPElM1bj+hMjOfr3/uiH2yFGtPMwu73oHNwpF69LpMLhaUC
         LcOaFAITdQbm9rAQY7SFqTC6m06R7lMVR3fRu+7cWDNEuunh5l1VSMORYrD6hYQO0ZVJ
         vc9QD3rB4SYoF0H7oXKmWHamAQvcINRKCT9RZdbW18pAzCS9S3fec5WbE7WoKbcGqQxe
         Gh++R6N6OiAgk37B26VM0dZu6jA5JKodrdcrvNeK0wIEnmoYt1aELFGu3RR3ETDWEnOE
         Vspw==
X-Gm-Message-State: AOAM530iLF5MoFVYjlYTQL+vGFTYNTrrwjDYLx6RZmEqkN+p/xNMvem9
        FUMukzsxapdj7mWUjhq566I=
X-Google-Smtp-Source: ABdhPJwgB/I/Do35yimDpUpsv9P5HlI9YjYF1LUBSCekxSR7anI6XhdM6KiKkEAEYOBaDzuIXrIV8g==
X-Received: by 2002:a05:622a:303:: with SMTP id q3mr2464654qtw.24.1609902299187;
        Tue, 05 Jan 2021 19:04:59 -0800 (PST)
Received: from localhost.localdomain ([2804:14d:72b1:8920:77d4:6fb0:85b3:b6f7])
        by smtp.gmail.com with ESMTPSA id n195sm730019qke.20.2021.01.05.19.04.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jan 2021 19:04:58 -0800 (PST)
From:   "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To:     mchehab@kernel.org, hverkuil@xs4all.nl
Cc:     "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/4] media: vidtv: Add media controller support
Date:   Wed,  6 Jan 2021 00:04:46 -0300
Message-Id: <20210106030449.3223172-2-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210106030449.3223172-1-dwlsalmeida@gmail.com>
References: <20210106030449.3223172-1-dwlsalmeida@gmail.com>
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
 .../media/test-drivers/vidtv/vidtv_bridge.c   | 28 +++++++++++++++++++
 .../media/test-drivers/vidtv/vidtv_bridge.h   |  6 ++++
 2 files changed, 34 insertions(+)

diff --git a/drivers/media/test-drivers/vidtv/vidtv_bridge.c b/drivers/media/test-drivers/vidtv/vidtv_bridge.c
index fc64d0c8492a..a2fa9b58174d 100644
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
@@ -501,9 +503,30 @@ static int vidtv_bridge_probe(struct platform_device *pdev)
 
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
 
+#ifdef CONFIG_MEDIA_CONTROLLER_DVB
+err_media_device_register:
+	media_device_cleanup(&dvb->mdev);
+#endif //CONFIG_MEDIA_CONTROLLER_DVB
 err_dvb:
 	kfree(dvb);
 	return ret;
@@ -516,6 +539,11 @@ static int vidtv_bridge_remove(struct platform_device *pdev)
 
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

