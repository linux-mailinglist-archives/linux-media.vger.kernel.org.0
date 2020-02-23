Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6A975169617
	for <lists+linux-media@lfdr.de>; Sun, 23 Feb 2020 06:37:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726023AbgBWFh2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 23 Feb 2020 00:37:28 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:40595 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725978AbgBWFh2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 23 Feb 2020 00:37:28 -0500
Received: by mail-pf1-f193.google.com with SMTP id b185so3542455pfb.7
        for <linux-media@vger.kernel.org>; Sat, 22 Feb 2020 21:37:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=Jee2SBqk+0iCdDlNnaMTYkI5LIDo4uPuFdHmJKyhq4Y=;
        b=HmabNhD8fNO6NyV59b5ZxrZ3Od8PvSWC8dfeSBv5te9BSwvwc59NUWJ4OoU+PXcrMa
         0O+U2IQBA94HFQobMUaMNlYBNQNrUE+F5US1cyQwTPbrPAo0nCBZTl89hDMBEaWdkUJi
         WnuHSU3gjbI6gi9eHWSb7lA4HwWHUX+5ZGRufCo3j1FPcNMePE2R2uwe0uLsWMwULSFM
         aSs/zsibs4X6i3C3imypwUdizSjgKIhVAcz0XS16BNcGo1yctdWEvMoGkImZxYCS8aS1
         BpmmcwMTqgTgl0icEzht/AjS8//THed3Z4tUrJFWhPH4ELz4HntUaYswph1W02k7ccYF
         PGYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=Jee2SBqk+0iCdDlNnaMTYkI5LIDo4uPuFdHmJKyhq4Y=;
        b=mSPCUkZzKPcitl0FuGHbsK24+0HaNyGeoM4iaByG92I5KR8ehCeqDvZbLFoQVprNrs
         ROVD8taU5iV0hyQi5+RlQgccVb6r+OCIcIQzHzM0St4eDvEe3IJRz8qdcTI75Wiz923f
         /EhsZWh+p7Z3bEVBbzLvLBY5h5Gwp5WCT+QBqCtCQ5Rzbpp6gnet20RIn63/qk8xiCrk
         0HvzJGPsa45IFC1JT3REU2NpG/KKQDOXvlZT98EBJzp6Z4bek4qe65+3ofcxhwnK8qhr
         ab4SV+rLZ4qkcFn54UDUjBISNhqT1Hck2Ii8fyhQNrIwYL8Ym00j0b0TTweM65CqAdc6
         TNfw==
X-Gm-Message-State: APjAAAVqqrnlbP8ifBMH/PQG0MD46gejONLnCzSrFfic1U2OMStSFK39
        E901FLuPOyXp2OLegIQAfnJpplQnmR4=
X-Google-Smtp-Source: APXvYqx7jzIVBLhwmGh1VmBYIQ/J0ZaUEYnGExuyOF/oezGiKz6+s6kEpzOVOMAXj94uFgcwFtIAHw==
X-Received: by 2002:a63:7207:: with SMTP id n7mr28082472pgc.253.1582436246780;
        Sat, 22 Feb 2020 21:37:26 -0800 (PST)
Received: from localhost ([43.224.245.179])
        by smtp.gmail.com with ESMTPSA id h13sm7679357pjc.9.2020.02.22.21.37.25
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sat, 22 Feb 2020 21:37:26 -0800 (PST)
From:   qiwuchen55@gmail.com
To:     sumit.semwal@linaro.org, gustavo@padovan.org
Cc:     linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, chenqiwu <chenqiwu@xiaomi.com>
Subject: [PATCH] dma-buf/sync_debug: convert to list_for_each_entry()
Date:   Sun, 23 Feb 2020 13:37:20 +0800
Message-Id: <1582436240-14113-1-git-send-email-qiwuchen55@gmail.com>
X-Mailer: git-send-email 1.9.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: chenqiwu <chenqiwu@xiaomi.com>

Convert list_for_each() to list_for_each_entry() to simplify code.

Signed-off-by: chenqiwu <chenqiwu@xiaomi.com>
---
 drivers/dma-buf/sync_debug.c | 19 ++++++-------------
 1 file changed, 6 insertions(+), 13 deletions(-)

diff --git a/drivers/dma-buf/sync_debug.c b/drivers/dma-buf/sync_debug.c
index 101394f..05cfeee 100644
--- a/drivers/dma-buf/sync_debug.c
+++ b/drivers/dma-buf/sync_debug.c
@@ -106,13 +106,12 @@ static void sync_print_fence(struct seq_file *s,
 
 static void sync_print_obj(struct seq_file *s, struct sync_timeline *obj)
 {
-	struct list_head *pos;
+	struct sync_pt *pt;
 
 	seq_printf(s, "%s: %d\n", obj->name, obj->value);
 
 	spin_lock_irq(&obj->lock);
-	list_for_each(pos, &obj->pt_list) {
-		struct sync_pt *pt = container_of(pos, struct sync_pt, link);
+	list_for_each_entry(pt, &obj->pt_list, link) {
 		sync_print_fence(s, &pt->base, false);
 	}
 	spin_unlock_irq(&obj->lock);
@@ -140,16 +139,13 @@ static void sync_print_sync_file(struct seq_file *s,
 
 static int sync_info_debugfs_show(struct seq_file *s, void *unused)
 {
-	struct list_head *pos;
+	struct sync_timeline *obj;
+	struct sync_file *sync_file;
 
 	seq_puts(s, "objs:\n--------------\n");
 
 	spin_lock_irq(&sync_timeline_list_lock);
-	list_for_each(pos, &sync_timeline_list_head) {
-		struct sync_timeline *obj =
-			container_of(pos, struct sync_timeline,
-				     sync_timeline_list);
-
+	list_for_each_entry(obj, &sync_timeline_list_head, sync_timeline_list) {
 		sync_print_obj(s, obj);
 		seq_putc(s, '\n');
 	}
@@ -158,10 +154,7 @@ static int sync_info_debugfs_show(struct seq_file *s, void *unused)
 	seq_puts(s, "fences:\n--------------\n");
 
 	spin_lock_irq(&sync_file_list_lock);
-	list_for_each(pos, &sync_file_list_head) {
-		struct sync_file *sync_file =
-			container_of(pos, struct sync_file, sync_file_list);
-
+	list_for_each_entry(sync_file, &sync_file_list_head, sync_file_list) {
 		sync_print_sync_file(s, sync_file);
 		seq_putc(s, '\n');
 	}
-- 
1.9.1

