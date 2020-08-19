Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0572C24A58D
	for <lists+linux-media@lfdr.de>; Wed, 19 Aug 2020 20:05:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726884AbgHSSFH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Aug 2020 14:05:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726875AbgHSSFC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Aug 2020 14:05:02 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55A69C061757
        for <linux-media@vger.kernel.org>; Wed, 19 Aug 2020 11:05:02 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id mw10so1478453pjb.2
        for <linux-media@vger.kernel.org>; Wed, 19 Aug 2020 11:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=es-iitr-ac-in.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Sv87vM7p7z6RA/m4QyohJmK6RcFUCusmzqFQmHL0cjo=;
        b=arbnsihphQtZ1oi7VuwyfqLXA1f3iqIU6JchkF10yYvfiaOlgb5eOq6AkNTLRUojXw
         jQaTSQS+lkWibN1ozHgfUyLZPbpdfMFQ2Pc5PSUbnaY4iZTtpJOxfHDo2zu04mWsUjOc
         6QEpwuu3SAiLHcdAAjkSk7XTXehCMkiPeDtMJsVkTaykVsDgEYOaB0CSrMMa+6jU2MGc
         6X+Bq8XjUo0jsJhUl+JZ/Mw/L5dD4ZaWh7aNdcmz7RoPo9iVm1iCnoD5UXyj/bVQGE7U
         FpUfqNSP3rFhdeedKwbbsLBefIN3Xvl3zyn0PWwQpQm1mGwxhwCZvLxmGeswxT2xiVsu
         JOfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Sv87vM7p7z6RA/m4QyohJmK6RcFUCusmzqFQmHL0cjo=;
        b=N7isw4lqomXIvel5RkuBXhsb7Eefxpc1m9JiqHVxkMB5E6NlEmvoDf1F5RnfNsezVu
         cleEX61Km8y8+DXuNyVo5g8Ae2ligO4bOJSSZbNTnpB0fGPpbDDmEHQ5qplb+84f5P+S
         asy6fgiBLQYofq1PktNZvtqflQAwRbm3TY9WXb8pYtPqNTPR9sbZueqpGcCzKo2dIhb6
         Q3FMWTql3V4jsfr7qQLbGv9ZiWAW/nfJ29vaCiw0goxRGL42pxk2CyptKyvOogEG7d/G
         98q1Ab0wecq/TZQhY/wow+tHwv4ibeja8J3HwRuJp22T2+XeeWsKDBB2Kfi0OCIipRPG
         5lXg==
X-Gm-Message-State: AOAM530/WWgy8JLoEyoQGqd9aYe7YAagyJyGA3Tq9WppI6kAJZtd8Mrh
        VZf9CdlF3ofGn26uDN3ESU3r/Q==
X-Google-Smtp-Source: ABdhPJzUmz9dXWmWwe06ZA+v+GGxWf/45X2KDEvKLzzrJ+r6CA5w/mS3u4y7I9NrxHdahBoYb6CSJQ==
X-Received: by 2002:a17:90b:3597:: with SMTP id mm23mr4880234pjb.3.1597860301783;
        Wed, 19 Aug 2020 11:05:01 -0700 (PDT)
Received: from kaaira-HP-Pavilion-Notebook ([103.113.213.179])
        by smtp.gmail.com with ESMTPSA id d22sm29422243pfd.42.2020.08.19.11.05.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2020 11:05:01 -0700 (PDT)
From:   Kaaira Gupta <kgupta@es.iitr.ac.in>
To:     Helen Koike <helen.koike@collabora.com>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Kaaira Gupta <kgupta@es.iitr.ac.in>
Subject: [PATCH v3 1/9] media: vimc: Move get_source_entity to vimc-common
Date:   Wed, 19 Aug 2020 23:34:34 +0530
Message-Id: <20200819180442.11630-2-kgupta@es.iitr.ac.in>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200819180442.11630-1-kgupta@es.iitr.ac.in>
References: <20200819180442.11630-1-kgupta@es.iitr.ac.in>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Move the function vimc_get_source_entity() to vimc-common.c to make it
reusable.

Signed-off-by: Kaaira Gupta <kgupta@es.iitr.ac.in>
---
 drivers/media/test-drivers/vimc/vimc-common.c | 14 +++++++++++
 drivers/media/test-drivers/vimc/vimc-common.h | 12 ++++++++++
 .../media/test-drivers/vimc/vimc-streamer.c   | 24 -------------------
 3 files changed, 26 insertions(+), 24 deletions(-)

diff --git a/drivers/media/test-drivers/vimc/vimc-common.c b/drivers/media/test-drivers/vimc/vimc-common.c
index 0d97b25ce21e..91c8992bb391 100644
--- a/drivers/media/test-drivers/vimc/vimc-common.c
+++ b/drivers/media/test-drivers/vimc/vimc-common.c
@@ -417,3 +417,17 @@ int vimc_ent_sd_register(struct vimc_ent_device *ved,
 	media_entity_cleanup(&sd->entity);
 	return ret;
 }
+
+struct media_entity *vimc_get_source_entity(struct media_entity *ent)
+{
+	struct media_pad *pad;
+	int i;
+
+	for (i = 0; i < ent->num_pads; i++) {
+		if (ent->pads[i].flags & MEDIA_PAD_FL_SOURCE)
+			continue;
+		pad = media_entity_remote_pad(&ent->pads[i]);
+		return pad ? pad->entity : NULL;
+	}
+	return NULL;
+}
diff --git a/drivers/media/test-drivers/vimc/vimc-common.h b/drivers/media/test-drivers/vimc/vimc-common.h
index a289434e75ba..4c580d854007 100644
--- a/drivers/media/test-drivers/vimc/vimc-common.h
+++ b/drivers/media/test-drivers/vimc/vimc-common.h
@@ -230,4 +230,16 @@ int vimc_ent_sd_register(struct vimc_ent_device *ved,
  */
 int vimc_vdev_link_validate(struct media_link *link);
 
+/**
+ * vimc_get_source_entity - get the entity connected with the first sink pad
+ *
+ * @ent:	reference media_entity
+ *
+ * Helper function that returns the media entity containing the source pad
+ * linked with the first sink pad from the given media entity pad list.
+ *
+ * Return: The source pad or NULL, if it wasn't found.
+ */
+struct media_entity *vimc_get_source_entity(struct media_entity *ent);
+
 #endif
diff --git a/drivers/media/test-drivers/vimc/vimc-streamer.c b/drivers/media/test-drivers/vimc/vimc-streamer.c
index 451a32c0d034..4f8384246042 100644
--- a/drivers/media/test-drivers/vimc/vimc-streamer.c
+++ b/drivers/media/test-drivers/vimc/vimc-streamer.c
@@ -12,30 +12,6 @@
 
 #include "vimc-streamer.h"
 
-/**
- * vimc_get_source_entity - get the entity connected with the first sink pad
- *
- * @ent:	reference media_entity
- *
- * Helper function that returns the media entity containing the source pad
- * linked with the first sink pad from the given media entity pad list.
- *
- * Return: The source pad or NULL, if it wasn't found.
- */
-static struct media_entity *vimc_get_source_entity(struct media_entity *ent)
-{
-	struct media_pad *pad;
-	int i;
-
-	for (i = 0; i < ent->num_pads; i++) {
-		if (ent->pads[i].flags & MEDIA_PAD_FL_SOURCE)
-			continue;
-		pad = media_entity_remote_pad(&ent->pads[i]);
-		return pad ? pad->entity : NULL;
-	}
-	return NULL;
-}
-
 /**
  * vimc_streamer_pipeline_terminate - Disable stream in all ved in stream
  *
-- 
2.17.1

