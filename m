Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BEC2D629C03
	for <lists+linux-media@lfdr.de>; Tue, 15 Nov 2022 15:25:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230058AbiKOOZN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Nov 2022 09:25:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229990AbiKOOZL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Nov 2022 09:25:11 -0500
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 170D813D68;
        Tue, 15 Nov 2022 06:25:09 -0800 (PST)
Received: by mail-pj1-x102e.google.com with SMTP id gw22so13459587pjb.3;
        Tue, 15 Nov 2022 06:25:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8WPa8f4LFDKConeqlZDv2XsPvTsZR4ro7M3jEFaX4AY=;
        b=U8hdF9/AhDCASqQaE+kLEOWt+aAJ00rjhuAR4DgGLm4zdJ+2OJrc5qj30+6GVKWH/H
         m6bjB1kVWDU57c6zLV7H7MKBFFyK9HCbeBAKQnfQ5TGYR6onqt7NfOU+JnmTpQm25MK4
         gJCt7H1fVAN1dODCyuabYnpyD5tMVy2WfkGKVodMZ5+EvCTf7fDZKeFS2qZ8XS+op3qn
         tA84RXIM59DS9KjpjSaM+j52GYcqCZVd/m+hnGUS4/DvqOjXAP2i8gyB0xtVBg/eWRal
         nd1MmGwg9n6esYnm1opMYEq/GOBBn8mRYL1EDVywsRrgvhHi7JjAhV95So/oO6Ghwmef
         v2rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8WPa8f4LFDKConeqlZDv2XsPvTsZR4ro7M3jEFaX4AY=;
        b=XKA3Xerbvg1jmC65JrKcvGHCwnUngqyPK/BOGrFa64SYmhwV4xWw+DuJ+kJbvtk0dQ
         x2Cdf+tERTmbZ5Hexl70eoPrga32lmr2+rbL71YsHWz/Y9H3SR98wfojnfuUO1eiQHu2
         0bmhfElLAQG1zQbkRfvQNndtiwjmYI7QJOrxNkzMqHHrzGWdWpI2Y+ckqEm2ALITTNxt
         ZWDIEvQbXk94/iLg23D7WB0f/vGLAnlUMlwjM99gbnmKmcjjPu42NERA84iKyDTlRPRo
         bUoUlrUz/VK0RXO8tg++H0bCb9MOlWFw1WUUClJaSP4YSxfoLef2B825IMqqZP02A2T1
         v5pQ==
X-Gm-Message-State: ANoB5pkE1WjWGZOVdlHvYl371uZ2q3WdGHU5fV6D8igsUCukBj6uU+CV
        WPDdB4qIymnBeP7bl6vJbNo=
X-Google-Smtp-Source: AA0mqf6wykEnbR3Ewv1YS/Q7KbRlGqZ1IYVx+5AV5g28c21o5q1qmukIfeAMVscJXmIAOM+gyXeGUg==
X-Received: by 2002:a17:903:120a:b0:186:9849:5c1a with SMTP id l10-20020a170903120a00b0018698495c1amr4261669plh.110.1668522308608;
        Tue, 15 Nov 2022 06:25:08 -0800 (PST)
Received: from localhost.localdomain ([175.124.254.119])
        by smtp.gmail.com with ESMTPSA id g17-20020aa79f11000000b0056da2bf607csm8733661pfr.214.2022.11.15.06.25.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Nov 2022 06:25:08 -0800 (PST)
From:   Hyunwoo Kim <imv4bel@gmail.com>
To:     mchehab@kernel.org
Cc:     kernel@tuxforce.de, linux-media@vger.kernel.org,
        linux-usb@vger.kernel.org, cai.huoqing@linux.dev, tiwai@suse.de,
        imv4bel@gmail.com
Subject: [PATCH v2 1/4] media: dvb-core: Fix use-after-free due to race condition occurring in dvb_frontend
Date:   Tue, 15 Nov 2022 06:23:53 -0800
Message-Id: <20221115142356.12315-2-imv4bel@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221115142356.12315-1-imv4bel@gmail.com>
References: <20221115142356.12315-1-imv4bel@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If the device node of dvb_frontend is open() and the device is
disconnected, many kinds of UAFs may occur when calling close()
on the device node.

The root cause of this is that wake_up() for dvbdev->wait_queue
is implemented in the dvb_frontend_release() function, but
wait_event() is not implemented in the dvb_frontend_stop() function.

So, implement wait_event() function in dvb_frontend_stop() and
add 'remove_mutex' which prevents race condition for 'fe->exit'.

Signed-off-by: Hyunwoo Kim <imv4bel@gmail.com>
---
 drivers/media/dvb-core/dvb_frontend.c | 39 +++++++++++++++++++++++----
 include/media/dvb_frontend.h          |  6 ++++-
 2 files changed, 39 insertions(+), 6 deletions(-)

diff --git a/drivers/media/dvb-core/dvb_frontend.c b/drivers/media/dvb-core/dvb_frontend.c
index 48e735cdbe6b..b3556e3580c6 100644
--- a/drivers/media/dvb-core/dvb_frontend.c
+++ b/drivers/media/dvb-core/dvb_frontend.c
@@ -809,6 +809,8 @@ static void dvb_frontend_stop(struct dvb_frontend *fe)
 
 	dev_dbg(fe->dvb->device, "%s:\n", __func__);
 
+	mutex_lock(&fe->remove_mutex);
+
 	if (fe->exit != DVB_FE_DEVICE_REMOVED)
 		fe->exit = DVB_FE_NORMAL_EXIT;
 	mb();
@@ -818,6 +820,13 @@ static void dvb_frontend_stop(struct dvb_frontend *fe)
 
 	kthread_stop(fepriv->thread);
 
+	mutex_unlock(&fe->remove_mutex);
+
+	if (fepriv->dvbdev->users < -1) {
+		wait_event(fepriv->dvbdev->wait_queue,
+				fepriv->dvbdev->users == -1);
+	}
+
 	sema_init(&fepriv->sem, 1);
 	fepriv->state = FESTATE_IDLE;
 
@@ -2750,9 +2759,13 @@ static int dvb_frontend_open(struct inode *inode, struct file *file)
 	struct dvb_adapter *adapter = fe->dvb;
 	int ret;
 
+	mutex_lock(&fe->remove_mutex);
+
 	dev_dbg(fe->dvb->device, "%s:\n", __func__);
-	if (fe->exit == DVB_FE_DEVICE_REMOVED)
+	if (fe->exit == DVB_FE_DEVICE_REMOVED) {
+		mutex_unlock(&fe->remove_mutex);
 		return -ENODEV;
+	}
 
 	if (adapter->mfe_shared) {
 		mutex_lock(&adapter->mfe_lock);
@@ -2773,8 +2786,10 @@ static int dvb_frontend_open(struct inode *inode, struct file *file)
 			while (mferetry-- && (mfedev->users != -1 ||
 					      mfepriv->thread)) {
 				if (msleep_interruptible(500)) {
-					if (signal_pending(current))
+					if (signal_pending(current)) {
+						mutex_unlock(&fe->remove_mutex);
 						return -EINTR;
+					}
 				}
 			}
 
@@ -2786,6 +2801,7 @@ static int dvb_frontend_open(struct inode *inode, struct file *file)
 				if (mfedev->users != -1 ||
 				    mfepriv->thread) {
 					mutex_unlock(&adapter->mfe_lock);
+					mutex_unlock(&fe->remove_mutex);
 					return -EBUSY;
 				}
 				adapter->mfe_dvbdev = dvbdev;
@@ -2845,6 +2861,8 @@ static int dvb_frontend_open(struct inode *inode, struct file *file)
 
 	if (adapter->mfe_shared)
 		mutex_unlock(&adapter->mfe_lock);
+
+	mutex_unlock(&fe->remove_mutex);
 	return ret;
 
 err3:
@@ -2866,6 +2884,8 @@ static int dvb_frontend_open(struct inode *inode, struct file *file)
 err0:
 	if (adapter->mfe_shared)
 		mutex_unlock(&adapter->mfe_lock);
+
+	mutex_unlock(&fe->remove_mutex);
 	return ret;
 }
 
@@ -2876,6 +2896,8 @@ static int dvb_frontend_release(struct inode *inode, struct file *file)
 	struct dvb_frontend_private *fepriv = fe->frontend_priv;
 	int ret;
 
+	mutex_lock(&fe->remove_mutex);
+
 	dev_dbg(fe->dvb->device, "%s:\n", __func__);
 
 	if ((file->f_flags & O_ACCMODE) != O_RDONLY) {
@@ -2897,11 +2919,17 @@ static int dvb_frontend_release(struct inode *inode, struct file *file)
 		}
 		mutex_unlock(&fe->dvb->mdev_lock);
 #endif
-		if (fe->exit != DVB_FE_NO_EXIT)
-			wake_up(&dvbdev->wait_queue);
 		if (fe->ops.ts_bus_ctrl)
 			fe->ops.ts_bus_ctrl(fe, 0);
-	}
+
+		if (fe->exit != DVB_FE_NO_EXIT) {
+			mutex_unlock(&fe->remove_mutex);
+			wake_up(&dvbdev->wait_queue);
+		} else
+			mutex_unlock(&fe->remove_mutex);
+
+	} else
+		mutex_unlock(&fe->remove_mutex);
 
 	dvb_frontend_put(fe);
 
@@ -3000,6 +3028,7 @@ int dvb_register_frontend(struct dvb_adapter *dvb,
 	fepriv = fe->frontend_priv;
 
 	kref_init(&fe->refcount);
+	mutex_init(&fe->remove_mutex);
 
 	/*
 	 * After initialization, there need to be two references: one
diff --git a/include/media/dvb_frontend.h b/include/media/dvb_frontend.h
index e7c44870f20d..411ec32cd8df 100644
--- a/include/media/dvb_frontend.h
+++ b/include/media/dvb_frontend.h
@@ -686,7 +686,10 @@ struct dtv_frontend_properties {
  * @id:			Frontend ID
  * @exit:		Used to inform the DVB core that the frontend
  *			thread should exit (usually, means that the hardware
- *			got disconnected.
+ *			got disconnected.)
+ * @remove_mutex:	mutex that avoids a race condition between a callback
+ *			called when the hardware is disconnected and the
+ *			file_operations of dvb_frontend
  */
 
 struct dvb_frontend {
@@ -704,6 +707,7 @@ struct dvb_frontend {
 	int (*callback)(void *adapter_priv, int component, int cmd, int arg);
 	int id;
 	unsigned int exit;
+	struct mutex remove_mutex;
 };
 
 /**
-- 
2.25.1

