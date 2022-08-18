Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0FB30598E84
	for <lists+linux-media@lfdr.de>; Thu, 18 Aug 2022 23:01:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346329AbiHRVA5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Aug 2022 17:00:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346208AbiHRVAL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Aug 2022 17:00:11 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8133CD31FC
        for <linux-media@vger.kernel.org>; Thu, 18 Aug 2022 14:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=DNFHSkc/9XD0IHp+EWFcSaSQYS0
        nS/muBE/k1ZBILf8=; b=H6uoo853Vu3QQNSs1Tt7SlUYVDfJ6r0x5E65BgTaa/7
        FaUXVhinALbmG/Yh6c5yDqWe1VGNQmJsm4Mvb4QGp6vgXhMIQxF0zhLckXw34ss8
        rNnSQxv74/kFjFlNrH2+ZqShDoFZE0BCR09E2ClmUW8luDro4NnFOEEfukAB9wZY
        =
Received: (qmail 3959804 invoked from network); 18 Aug 2022 23:00:05 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 18 Aug 2022 23:00:05 +0200
X-UD-Smtp-Session: l3s3148p1@l0sQRIrmEpQucref
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-kernel@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Gustavo Padovan <gustavo@padovan.org>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org
Subject: [PATCH] dma-buf: move from strlcpy with unused retval to strscpy
Date:   Thu, 18 Aug 2022 23:00:04 +0200
Message-Id: <20220818210005.6673-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Follow the advice of the below link and prefer 'strscpy' in this
subsystem. Conversion is 1:1 because the return value is not used.
Generated by a coccinelle script.

Link: https://lore.kernel.org/r/CAHk-=wgfRnXz0W3D37d01q3JFkr_i_uTL=V6A6G1oUZcprmknw@mail.gmail.com/
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/dma-buf/sw_sync.c   | 2 +-
 drivers/dma-buf/sync_file.c | 8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/dma-buf/sw_sync.c b/drivers/dma-buf/sw_sync.c
index 348b3a9170fa..63f0aeb66db6 100644
--- a/drivers/dma-buf/sw_sync.c
+++ b/drivers/dma-buf/sw_sync.c
@@ -85,7 +85,7 @@ static struct sync_timeline *sync_timeline_create(const char *name)
 
 	kref_init(&obj->kref);
 	obj->context = dma_fence_context_alloc(1);
-	strlcpy(obj->name, name, sizeof(obj->name));
+	strscpy(obj->name, name, sizeof(obj->name));
 
 	obj->pt_tree = RB_ROOT;
 	INIT_LIST_HEAD(&obj->pt_list);
diff --git a/drivers/dma-buf/sync_file.c b/drivers/dma-buf/sync_file.c
index 3ebec19a8e02..af57799c86ce 100644
--- a/drivers/dma-buf/sync_file.c
+++ b/drivers/dma-buf/sync_file.c
@@ -132,7 +132,7 @@ EXPORT_SYMBOL(sync_file_get_fence);
 char *sync_file_get_name(struct sync_file *sync_file, char *buf, int len)
 {
 	if (sync_file->user_name[0]) {
-		strlcpy(buf, sync_file->user_name, len);
+		strscpy(buf, sync_file->user_name, len);
 	} else {
 		struct dma_fence *fence = sync_file->fence;
 
@@ -172,7 +172,7 @@ static struct sync_file *sync_file_merge(const char *name, struct sync_file *a,
 		return NULL;
 	}
 	sync_file->fence = fence;
-	strlcpy(sync_file->user_name, name, sizeof(sync_file->user_name));
+	strscpy(sync_file->user_name, name, sizeof(sync_file->user_name));
 	return sync_file;
 }
 
@@ -262,9 +262,9 @@ static long sync_file_ioctl_merge(struct sync_file *sync_file,
 static int sync_fill_fence_info(struct dma_fence *fence,
 				 struct sync_fence_info *info)
 {
-	strlcpy(info->obj_name, fence->ops->get_timeline_name(fence),
+	strscpy(info->obj_name, fence->ops->get_timeline_name(fence),
 		sizeof(info->obj_name));
-	strlcpy(info->driver_name, fence->ops->get_driver_name(fence),
+	strscpy(info->driver_name, fence->ops->get_driver_name(fence),
 		sizeof(info->driver_name));
 
 	info->status = dma_fence_get_status(fence);
-- 
2.35.1

