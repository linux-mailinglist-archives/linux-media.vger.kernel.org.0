Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7DEE262D279
	for <lists+linux-media@lfdr.de>; Thu, 17 Nov 2022 06:00:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234311AbiKQFAm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Nov 2022 00:00:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233466AbiKQFAj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Nov 2022 00:00:39 -0500
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92887391D2;
        Wed, 16 Nov 2022 21:00:38 -0800 (PST)
Received: by mail-pj1-x1032.google.com with SMTP id q1-20020a17090a750100b002139ec1e999so914392pjk.1;
        Wed, 16 Nov 2022 21:00:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8WPa8f4LFDKConeqlZDv2XsPvTsZR4ro7M3jEFaX4AY=;
        b=lg5y8VnsWwrjUOczSSKQLttrOGSqMH6EcN1COOOou/9v2VC2hZxLXapiAMkWvK4/Vs
         txQmcL3Pih4V2FtZfqYWloIT7TyQcDmP/T+0m/onlTPp803nqhbzEcG+UdZ9oFlMx2Fs
         fEgr/QvypvOAfqT2abkAwU/uMDKTTCYEbdpYpQVA4xJTDj5P3XVE/nYgNYHQDoDoUt5k
         nk/QVU2KqLjt3LdX4Whuv8eY4qF2t4pFu/UAl1VmvHHDYpJaEzWzMYP6cemK0dg7bODT
         l2XDqcXzEGXn0eL/Z4w0+KUhHzC+YHTGhLYDowGWmIaY5Xs0mY/6TVI4S/LYI/XiUNJ2
         7SSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8WPa8f4LFDKConeqlZDv2XsPvTsZR4ro7M3jEFaX4AY=;
        b=u/ydiAY0R+1PtxQfr4zhHPoeNGVXFwCgIOxY9tSP4lhgVUp4HoNE5PUTOrPpoe+QuU
         Py0yVvcTfXun5LmrSej6tVQrSdk+WdutUezbSswRs1+TExCkJi3JFaXPDoCoADJdyolK
         X1l+oAasIWkw8CaKavJLGyysX2fNWMmh+Fs1jCg2jXq+q0rW4o8T0TuRpmFVAS5zVcAu
         bAgSbqpguP8zer10sKnP9Es8hV9Rtqn57bN8YkYlGiYeRxMDDCPv9JxHjLKeaGCK3AHL
         +eF9nTjcB0T47vyaWRsDMi6UO5NHx47gYE1D5s93f9py83kPAA7ZJxqSHxgzZma8h4fO
         YHMA==
X-Gm-Message-State: ANoB5plJWNtPPoKtgSahgElCY8wmeVhw2HJF8u5G6kceZ6rU+LnhG8nx
        o7gXEbP+FxlOu8GGZvkjM3o=
X-Google-Smtp-Source: AA0mqf5M7+DgwIWjWgoOO2siMiXYPM0bbmlmzAcBXHXlVUYid5apfqT2yMfNwCdlZQJtailigKM30Q==
X-Received: by 2002:a17:902:f641:b0:187:19c4:373a with SMTP id m1-20020a170902f64100b0018719c4373amr1007171plg.163.1668661237983;
        Wed, 16 Nov 2022 21:00:37 -0800 (PST)
Received: from localhost.localdomain ([175.124.254.119])
        by smtp.gmail.com with ESMTPSA id y18-20020aa79af2000000b0053e468a78a8sm11911178pfp.158.2022.11.16.21.00.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 21:00:37 -0800 (PST)
From:   Hyunwoo Kim <imv4bel@gmail.com>
To:     mchehab@kernel.org
Cc:     kernel@tuxforce.de, linux-media@vger.kernel.org,
        linux-usb@vger.kernel.org, cai.huoqing@linux.dev, tiwai@suse.de,
        imv4bel@gmail.com
Subject: [PATCH v3 1/4] media: dvb-core: Fix use-after-free due to race condition occurring in dvb_frontend
Date:   Wed, 16 Nov 2022 20:59:22 -0800
Message-Id: <20221117045925.14297-2-imv4bel@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221117045925.14297-1-imv4bel@gmail.com>
References: <20221117045925.14297-1-imv4bel@gmail.com>
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

