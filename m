Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1BD5C3F020A
	for <lists+linux-media@lfdr.de>; Wed, 18 Aug 2021 12:54:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234489AbhHRKz0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Aug 2021 06:55:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233913AbhHRKzY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Aug 2021 06:55:24 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48BEFC0613CF
        for <linux-media@vger.kernel.org>; Wed, 18 Aug 2021 03:54:48 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id f9-20020a05600c1549b029025b0f5d8c6cso4077310wmg.4
        for <linux-media@vger.kernel.org>; Wed, 18 Aug 2021 03:54:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=+kSxeYPH8CV+iqzlfochID5tK+dBNU1mNPOjXvv+41U=;
        b=RPJduCSD9q8r/Je8yCUYh7gLrcLVPGaEwhJ8PmTZI0OnLXjU5xbWA8WSkeIKMN+hL+
         ACP4+vS9QCSAWrfK9wsgw2fsEc7jfd17BQfSoFVC/TAzMu9TuDv9rW8kT91csEmMoXtl
         BLgCQtZCKGFiq94DdafvQdTbRe4RytRfgXpIyfMW1dR+KDvwNzD0stEQOnvhK0K6xjQv
         7uzRnxq+CVba+6DsrtnNmG64c1qogW4MU6nDB/pKq/D+X5Z794SgfHmJmIPqgjWmZV3N
         GcBSNHXvx4pkvsCzN2cPdm0D7d9wEem82GYnMJ3ore4H9gAOJRo8ihzAJ9/HVccpmGW+
         739w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+kSxeYPH8CV+iqzlfochID5tK+dBNU1mNPOjXvv+41U=;
        b=YlFYt7xXBMu58kO+SKYVGhI4bdP+hfIS+WlOW6Z5gOVzQ7+2IvQB+8jB1lRtkfaFGO
         QrImX0uPyfQqyTKpdmz7gSXaaMeeCorQyRWQJeuc4hZJ3egpiXUqmdUHD8nqMpTfrNFU
         93pubZV35R3U5TPdaKRTu9/zdQasEqix4gDWIFENRobZjQOmGkBNM/xH2tjxEfUXbRO4
         mBytIfZjgFwRLGII056YbdPyFqPnDuCOORJ4pF+29dbBNeb8VCnpOPChig6F7vD+YK8w
         /qhywfoB8PhKuifyGMz0tI79/XzeHdSNB0pPo2/mj30BbGTs0tpa6pmola3uZexwchCi
         yxeA==
X-Gm-Message-State: AOAM530rOpx2jvuijoPGc3reXH/NsRfHAiWX36iJmuphw+ScKl9F83jr
        fDDypfRrvpEaUMX821UPjqo=
X-Google-Smtp-Source: ABdhPJx6f9K9WsiJYEOOCqBwG5HtfeGGZLC6NrPvi/1y2P8nVp3YyMMHxAaZ03XqhpO3hMtXysKxog==
X-Received: by 2002:a7b:cb53:: with SMTP id v19mr7650538wmj.127.1629284086939;
        Wed, 18 Aug 2021 03:54:46 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id y4sm4646352wmi.22.2021.08.18.03.54.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 03:54:46 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     hridya@google.com, john.stultz@linaro.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        gustavo@padovan.org, linux-media@vger.kernel.org,
        adelva@google.com, sspatil@google.com, daniel@ffwll.ch
Subject: [PATCH 2/2] dma-buf: taint the kernel on sw_sync use
Date:   Wed, 18 Aug 2021 12:54:43 +0200
Message-Id: <20210818105443.1578-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210818105443.1578-1-christian.koenig@amd.com>
References: <20210818105443.1578-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

As we now knew allowing userspace control over dma_fence synchronization
is fundamentally broken and can cause deadlocks inside the kernel memory
management.

Because of this harden the wording for CONFIG_SW_SYNC and taint the kernel
as soon as it is used.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/Kconfig   | 5 +++--
 drivers/dma-buf/sw_sync.c | 5 ++++-
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/dma-buf/Kconfig b/drivers/dma-buf/Kconfig
index 9561e3d2d428..61e0f3c5ba8b 100644
--- a/drivers/dma-buf/Kconfig
+++ b/drivers/dma-buf/Kconfig
@@ -27,8 +27,9 @@ config SW_SYNC
 	  synchronization.  Useful when there is no hardware primitive backing
 	  the synchronization.
 
-	  WARNING: improper use of this can result in deadlocking kernel
-	  drivers from userspace. Intended for test and debug only.
+	  WARNING: improper use of this can result in deadlocking the kernel
+	  memory management from userspace. Intended for test and debug only.
+	  Use at your own risk.
 
 config UDMABUF
 	bool "userspace dmabuf misc driver"
diff --git a/drivers/dma-buf/sw_sync.c b/drivers/dma-buf/sw_sync.c
index 348b3a9170fa..c2bcb9062f51 100644
--- a/drivers/dma-buf/sw_sync.c
+++ b/drivers/dma-buf/sw_sync.c
@@ -286,7 +286,8 @@ static struct sync_pt *sync_pt_create(struct sync_timeline *obj,
 /*
  * *WARNING*
  *
- * improper use of this can result in deadlocking kernel drivers from userspace.
+ * improper use of this can result in deadlocking kernel memory management
+ * from userspace.
  */
 
 /* opening sw_sync create a new sync obj */
@@ -295,6 +296,8 @@ static int sw_sync_debugfs_open(struct inode *inode, struct file *file)
 	struct sync_timeline *obj;
 	char task_comm[TASK_COMM_LEN];
 
+	add_taint(TAINT_SOFTLOCKUP, LOCKDEP_STILL_OK);
+
 	get_task_comm(task_comm, current);
 
 	obj = sync_timeline_create(task_comm);
-- 
2.25.1

