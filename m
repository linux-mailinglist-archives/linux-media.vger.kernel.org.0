Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6D4742C929
	for <lists+linux-media@lfdr.de>; Wed, 13 Oct 2021 20:58:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238815AbhJMTA3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Oct 2021 15:00:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238836AbhJMTA0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Oct 2021 15:00:26 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6768C061749
        for <linux-media@vger.kernel.org>; Wed, 13 Oct 2021 11:58:22 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id e12so11626922wra.4
        for <linux-media@vger.kernel.org>; Wed, 13 Oct 2021 11:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rNu7tGzS3a9nNAG4wYt+tSxCNINIYaiwOvt4CtHF4Gs=;
        b=bQL8cJwTetQRi7wJWtinf4IweToaAa7IwT8GlJMAwUncH5Ig6a3S5/fp4xd41Ag0qv
         Ymh15/WjH0C7BdXmn2cAlMyA0a+jT4XF1hr1CScg5ub96GCYFcBQDeYcU87tOPRaFW20
         g1Yj67rsoFvIc2u5mN+fJZlnhfd5vD6kjbqww7Dsg10KmOMpfen2qQ0ggEM+06MrgU1n
         REMzYftS6Em4YqZp+bEkwR5IBTALkD2POfnL1P8yDI6ACPZuxE7AA0Zd3b8uiLygwOVT
         Vva5EaewNxnAdY8wou1TTimWIA2XYhDqs40KGQtm3BgS4Ce/hcfKaAlNyKAKLnhR/6sV
         9VyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rNu7tGzS3a9nNAG4wYt+tSxCNINIYaiwOvt4CtHF4Gs=;
        b=KaggHDQYc7I4n0clnu2gySMyDuhHR3izQasMzK3aGG09KwE+f0yYfVXudt++Cz830L
         GFnyHYp3zK/mGBi4lgKChFx5e6pwRizu2Uk8incnCRiymohzMKrxJZ2stlw8cIWJeExv
         PWLa+UuRLj58JByrl4LO42swuRzFOTu9Uzt7SnGsxAercIccOrE2ymBOiaGKwAuIFgyv
         GYnTiPleQjEIqBDCHJQTIbnRV9AK7A/R5Lz7p6g5IQRymph9GKkcFJYkkz4xy1I/WC7T
         j9UI6gPBaWRJ4JPatRKNKkjxzwM4MojtSjP2Vef2/Y6hUd8mqJBGkjwDCoLZpAbBXloW
         RGTw==
X-Gm-Message-State: AOAM533lgN262o6j7vhVFKl9OfOv1W00/LWJbw2huAbp5Ulu79qCC/jt
        +F14yeIrq3agYGqSHL7Q07337A==
X-Google-Smtp-Source: ABdhPJym/BQ+gvcyW+RLAZRdCdxHXNEUma6ef+jjFcJGlqSkU8HBxE3bmbBujd3Eh2yS6WmosQ7jbw==
X-Received: by 2002:adf:bc14:: with SMTP id s20mr1075733wrg.8.1634151501402;
        Wed, 13 Oct 2021 11:58:21 -0700 (PDT)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id e8sm573059wrg.48.2021.10.13.11.58.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Oct 2021 11:58:21 -0700 (PDT)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     mchehab@kernel.org, hverkuil@xs4all.nl, gregkh@linuxfoundation.org
Cc:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, mjpeg-users@lists.sourceforge.net,
        Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH v2 05/10] staging: media: zoran: videocode: remove procfs
Date:   Wed, 13 Oct 2021 18:58:07 +0000
Message-Id: <20211013185812.590931-6-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211013185812.590931-1-clabbe@baylibre.com>
References: <20211013185812.590931-1-clabbe@baylibre.com>
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

