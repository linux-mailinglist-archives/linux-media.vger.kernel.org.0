Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1478B4005A8
	for <lists+linux-media@lfdr.de>; Fri,  3 Sep 2021 21:16:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351024AbhICTRQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Sep 2021 15:17:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350692AbhICTRH (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Sep 2021 15:17:07 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21284C0617AF
        for <linux-media@vger.kernel.org>; Fri,  3 Sep 2021 12:15:58 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id v20-20020a1cf714000000b002e71f4d2026so172638wmh.1
        for <linux-media@vger.kernel.org>; Fri, 03 Sep 2021 12:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rNu7tGzS3a9nNAG4wYt+tSxCNINIYaiwOvt4CtHF4Gs=;
        b=Xap9Jdp3nzLYXuzX32nrhw5vkzT1dDYR3MNIXg7pN55dkMpHOBgILXtjoi/0CpNJUT
         63mcMP6L3e2KSvgdFo0ajFxR8H1fasMGux4Kl/9IeKCkNQPv0R2FLyFGx3OEaD9leGQf
         uEAVanoTg6Dx0vBBZx4p+zx1769Z/Cujx4m6uPosPv+Z7FoF7zP0gBjRI24O2ZHernDX
         1y4TAHtQwWRubWdxYKC3prXPHLCKqvyORE4MAYeZUikm10WRQNCRcaB/eSClVKGd7OeF
         IZ2zDxMz8nW/UDk1lXjimKbEWxVHd1yRHmIgaV0qDyJwidxEM9s2Fi2znGaueMwoJG9Z
         k/4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rNu7tGzS3a9nNAG4wYt+tSxCNINIYaiwOvt4CtHF4Gs=;
        b=cr+vRWv1Y566s7LVZL1XI6WZ4sk2IL8bwSWoSM752/hkjIjJGX3DOdkh0O7gfzSsGS
         tCY+kS6afI4mBJB5uUzGVi2mYSZn2oW2Wq2ZFASWMswrBHnk1xG4TXDSRLQlF1UIhEGp
         Tjy3FG4KexU7zpgFFveGEIK1hG+HRz0ly6+gVBF6qF/LjROnxmqG/8KxLtQImv11Dei0
         N/lyo8uSlX8BKW/0Bu4E1w92o5AIgcLWhWIdkhskdNYVefBwtI8BQNtI551CfCZlbNCZ
         PS/ZcKwtRZMp1lHFzRmC/zQyVv/NxN2Dk8+nJNt35E6je5YQywB3PTqXX3N+qrfC+8qY
         pkSA==
X-Gm-Message-State: AOAM5321UghhgkzruXQyDyXEeAaRf6+Yv8Y7nJ+U2uhlXnejC3FN9oMO
        vc3fNrIERtr9hct6BZYitgISu/hr6aCbWqnmfLI=
X-Google-Smtp-Source: ABdhPJxPYLlcKPA8eUsd93XN+XvF6EEahu/0KHEr3E3wj111ZphQbGeXblq1MpJXfQlxXxyOT4tKeA==
X-Received: by 2002:a1c:a50c:: with SMTP id o12mr273659wme.4.1630696556778;
        Fri, 03 Sep 2021 12:15:56 -0700 (PDT)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id a133sm253397wme.5.2021.09.03.12.15.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Sep 2021 12:15:56 -0700 (PDT)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     gregkh@linuxfoundation.org, mchehab@kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, mjpeg-users@lists.sourceforge.net,
        Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH 5/8] staging: media: zoran: videocode: remove procfs
Date:   Fri,  3 Sep 2021 19:15:37 +0000
Message-Id: <20210903191540.3052775-6-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210903191540.3052775-1-clabbe@baylibre.com>
References: <20210903191540.3052775-1-clabbe@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Now we have a debugfs, we can remove all PROCFS stuff.
We keep videocodec_debugfs_show(), it will be used later

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 drivers/staging/media/zoran/videocodec.c | 24 ++----------------------
 drivers/staging/media/zoran/videocodec.h |  5 +++++
 2 files changed, 7 insertions(+), 22 deletions(-)

diff --git a/drivers/staging/media/zoran/videocodec.c b/drivers/staging/media/zoran/videocodec.c
index 31019b5f377e..3d5a83a07e07 100644
--- a/drivers/staging/media/zoran/videocodec.c
+++ b/drivers/staging/media/zoran/videocodec.c
@@ -16,14 +16,6 @@
 #include <linux/types.h>
 #include <linux/slab.h>
 
-// kernel config is here (procfs flag)
-
-#ifdef CONFIG_PROC_FS
-#include <linux/proc_fs.h>
-#include <linux/seq_file.h>
-#include <linux/uaccess.h>
-#endif
-
 #include "videocodec.h"
 
 static int videocodec_debug;
@@ -265,8 +257,8 @@ int videocodec_unregister(const struct videocodec *codec)
 }
 EXPORT_SYMBOL(videocodec_unregister);
 
-#ifdef CONFIG_PROC_FS
-static int proc_videocodecs_show(struct seq_file *m, void *v)
+#ifdef CONFIG_VIDEO_ZORAN_DEBUG
+int videocodec_debugfs_show(struct seq_file *m)
 {
 	struct codec_list *h = codeclist_top;
 	struct attached_list *a;
@@ -300,25 +292,13 @@ static int proc_videocodecs_show(struct seq_file *m, void *v)
 /* ===================== */
 static int __init videocodec_init(void)
 {
-#ifdef CONFIG_PROC_FS
-	static struct proc_dir_entry *videocodec_proc_entry;
-#endif
-
 	pr_info("Linux video codec intermediate layer: %s\n", VIDEOCODEC_VERSION);
 
-#ifdef CONFIG_PROC_FS
-	videocodec_proc_entry = proc_create_single("videocodecs", 0, NULL, proc_videocodecs_show);
-	if (!videocodec_proc_entry)
-		pr_err("videocodec: can't init procfs.\n");
-#endif
 	return 0;
 }
 
 static void __exit videocodec_exit(void)
 {
-#ifdef CONFIG_PROC_FS
-	remove_proc_entry("videocodecs", NULL);
-#endif
 }
 
 module_init(videocodec_init);
diff --git a/drivers/staging/media/zoran/videocodec.h b/drivers/staging/media/zoran/videocodec.h
index 8a5003dda9f4..f2e17566795e 100644
--- a/drivers/staging/media/zoran/videocodec.h
+++ b/drivers/staging/media/zoran/videocodec.h
@@ -123,6 +123,7 @@ M                       zr36055[1] 0001 0000c001 00000000 (zr36050[1])
 #ifndef __LINUX_VIDEOCODEC_H
 #define __LINUX_VIDEOCODEC_H
 
+#include <linux/debugfs.h>
 #include <linux/videodev2.h>
 
 #define CODEC_DO_COMPRESSION 0
@@ -305,4 +306,8 @@ extern int videocodec_unregister(const struct videocodec *);
 
 /* the other calls are directly done via the videocodec structure! */
 
+#ifdef CONFIG_VIDEO_ZORAN_DEBUG
+int videocodec_debugfs_show(struct seq_file *m);
+#endif
+
 #endif				/*ifndef __LINUX_VIDEOCODEC_H */
-- 
2.32.0

