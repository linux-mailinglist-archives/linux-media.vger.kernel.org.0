Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8F03A7113FC
	for <lists+linux-media@lfdr.de>; Thu, 25 May 2023 20:35:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241841AbjEYSfc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 May 2023 14:35:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241835AbjEYSew (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 May 2023 14:34:52 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6D19E4A;
        Thu, 25 May 2023 11:34:03 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D8F3C648B0;
        Thu, 25 May 2023 18:33:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 221B2C433EF;
        Thu, 25 May 2023 18:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1685039639;
        bh=Ob3qJWVV0UzBiL0Q4d/OmDcvpBKUL55xRXXAWm7zHZg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=eAU9ZDRVC4t2K6LlMf0rom86VA+zVoDktbBS6c4lKIHPpuWUu8NWRuUf2akeN8HAv
         tVlC2r1vxSrXx1kKFs/WT7WOLg5hwG24gYgV9AO2pnrGybxPFYIZ/UDYGW0oAaZzQd
         NnKrSpSYBI8AvRubZA6g5QM+cxCFIi9p35KcJm2CTv9tvhFMpPXZfgeQmOq31xan6D
         rog4asAAq9pROo6f/lHPqvr5DkCOpS8Q3U5Y/9diNJXUqOEi5JZBkS0iOuhW2AIPuE
         yb4ClCOESneXOwFlE1DDkZpOe+1gO7dVhSodZie0z6fcngrr7CzjFYTi1USOsL4vEu
         +UTZAnyDiP1kA==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Hyunwoo Kim <v4bel@theori.io>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sasha Levin <sashal@kernel.org>, yongsuyoo0215@gmail.com,
        linma@zju.edu.cn, linux-media@vger.kernel.org
Subject: [PATCH AUTOSEL 6.3 30/67] media: dvb-core: Fix use-after-free due to race condition at dvb_ca_en50221
Date:   Thu, 25 May 2023 14:31:07 -0400
Message-Id: <20230525183144.1717540-30-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230525183144.1717540-1-sashal@kernel.org>
References: <20230525183144.1717540-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Hyunwoo Kim <v4bel@theori.io>

[ Upstream commit 280a8ab81733da8bc442253c700a52c4c0886ffd ]

If the device node of dvb_ca_en50221 is open() and the
device is disconnected, a UAF may occur when calling
close() on the device node.

The root cause is that wake_up() and wait_event() for
dvbdev->wait_queue are not implemented.

So implement wait_event() function in dvb_ca_en50221_release()
and add 'remove_mutex' which prevents race condition
for 'ca->exit'.

[mchehab: fix a checkpatch warning]

Link: https://lore.kernel.org/linux-media/20221121063308.GA33821@ubuntu
Signed-off-by: Hyunwoo Kim <v4bel@theori.io>
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/media/dvb-core/dvb_ca_en50221.c | 37 ++++++++++++++++++++++++-
 1 file changed, 36 insertions(+), 1 deletion(-)

diff --git a/drivers/media/dvb-core/dvb_ca_en50221.c b/drivers/media/dvb-core/dvb_ca_en50221.c
index b6ca29dfb184a..baf64540dc00a 100644
--- a/drivers/media/dvb-core/dvb_ca_en50221.c
+++ b/drivers/media/dvb-core/dvb_ca_en50221.c
@@ -151,6 +151,12 @@ struct dvb_ca_private {
 
 	/* mutex serializing ioctls */
 	struct mutex ioctl_mutex;
+
+	/* A mutex used when a device is disconnected */
+	struct mutex remove_mutex;
+
+	/* Whether the device is disconnected */
+	int exit;
 };
 
 static void dvb_ca_private_free(struct dvb_ca_private *ca)
@@ -1711,12 +1717,22 @@ static int dvb_ca_en50221_io_open(struct inode *inode, struct file *file)
 
 	dprintk("%s\n", __func__);
 
-	if (!try_module_get(ca->pub->owner))
+	mutex_lock(&ca->remove_mutex);
+
+	if (ca->exit) {
+		mutex_unlock(&ca->remove_mutex);
+		return -ENODEV;
+	}
+
+	if (!try_module_get(ca->pub->owner)) {
+		mutex_unlock(&ca->remove_mutex);
 		return -EIO;
+	}
 
 	err = dvb_generic_open(inode, file);
 	if (err < 0) {
 		module_put(ca->pub->owner);
+		mutex_unlock(&ca->remove_mutex);
 		return err;
 	}
 
@@ -1741,6 +1757,7 @@ static int dvb_ca_en50221_io_open(struct inode *inode, struct file *file)
 
 	dvb_ca_private_get(ca);
 
+	mutex_unlock(&ca->remove_mutex);
 	return 0;
 }
 
@@ -1760,6 +1777,8 @@ static int dvb_ca_en50221_io_release(struct inode *inode, struct file *file)
 
 	dprintk("%s\n", __func__);
 
+	mutex_lock(&ca->remove_mutex);
+
 	/* mark the CA device as closed */
 	ca->open = 0;
 	dvb_ca_en50221_thread_update_delay(ca);
@@ -1770,6 +1789,13 @@ static int dvb_ca_en50221_io_release(struct inode *inode, struct file *file)
 
 	dvb_ca_private_put(ca);
 
+	if (dvbdev->users == 1 && ca->exit == 1) {
+		mutex_unlock(&ca->remove_mutex);
+		wake_up(&dvbdev->wait_queue);
+	} else {
+		mutex_unlock(&ca->remove_mutex);
+	}
+
 	return err;
 }
 
@@ -1893,6 +1919,7 @@ int dvb_ca_en50221_init(struct dvb_adapter *dvb_adapter,
 	}
 
 	mutex_init(&ca->ioctl_mutex);
+	mutex_init(&ca->remove_mutex);
 
 	if (signal_pending(current)) {
 		ret = -EINTR;
@@ -1935,6 +1962,14 @@ void dvb_ca_en50221_release(struct dvb_ca_en50221 *pubca)
 
 	dprintk("%s\n", __func__);
 
+	mutex_lock(&ca->remove_mutex);
+	ca->exit = 1;
+	mutex_unlock(&ca->remove_mutex);
+
+	if (ca->dvbdev->users < 1)
+		wait_event(ca->dvbdev->wait_queue,
+				ca->dvbdev->users == 1);
+
 	/* shutdown the thread if there was one */
 	kthread_stop(ca->thread);
 
-- 
2.39.2

