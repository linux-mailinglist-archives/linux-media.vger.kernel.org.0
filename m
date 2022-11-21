Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B8456319BB
	for <lists+linux-media@lfdr.de>; Mon, 21 Nov 2022 07:33:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229698AbiKUGdU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Nov 2022 01:33:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229490AbiKUGdS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Nov 2022 01:33:18 -0500
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C70442F3A1
        for <linux-media@vger.kernel.org>; Sun, 20 Nov 2022 22:33:14 -0800 (PST)
Received: by mail-pl1-x632.google.com with SMTP id io19so9716210plb.8
        for <linux-media@vger.kernel.org>; Sun, 20 Nov 2022 22:33:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=theori.io; s=google;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rldQbVzv5ebudT94dGZh2jVY/qkQgmXwBXggpzupv6g=;
        b=FUXLpBXC985sjZvdr2/n7L886E22UrSSCgeTmKY/YRtMKh3+UNmA3BhhLhBQI+34Mn
         IJDgN5xFyBg/ALxwNwmIWJ4YZG6zrE/QOk1p2ERomztODtaBfJnQkpDTiDFj+3sdIhVc
         ZvHBg7n7Plw7Lml7AVVCzOAvHaeWN1hag9A2U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rldQbVzv5ebudT94dGZh2jVY/qkQgmXwBXggpzupv6g=;
        b=zq3CJOjkEGdYgrNeXX9nmJbmYdiM5NiXTb4rUjXlBaxCkPSMlBXTioWXRaUT3aMe0K
         NDLYjXq3LrHbY9Q/e0JBjHgwUtjnmgzYv7S7di81HixXtqwAEl2UF0MCNf5twnr0wTtz
         AO4kDb8MleC9RanlCONdymLzipIfCqgLYQjXXFSis4iuJyTKnAzeq3kMqS+4O8t+IupS
         wLufj5hqiAUNUTxl5FlQqKhZnEvtbFpl8Y/ezGvyrTu13qOclpvFEfAlA/aXMcDfd0mD
         AbrgW6Ny0sC3ZAAjGAwudZGsaipW15npcbQrYQtJzg/PFoTuq7+3x2sqdjNk/F0g8PO6
         Qb4A==
X-Gm-Message-State: ANoB5pmfOIXFLingfyy/pQG4KZyajMlsgAlezpcKyv+dUs4f/xbTgH+r
        1+Epi60z7ClUNAOlVe/MUHpNmg==
X-Google-Smtp-Source: AA0mqf66VffZbM1/0KybknJnOwPt5S0b1hE4ZfrN6xpKk4e8OzGYFNFZuL8Zo7e57awlk6ixqCTZ2A==
X-Received: by 2002:a17:90a:4886:b0:211:42a9:d132 with SMTP id b6-20020a17090a488600b0021142a9d132mr19262919pjh.8.1669012394383;
        Sun, 20 Nov 2022 22:33:14 -0800 (PST)
Received: from ubuntu ([121.133.63.188])
        by smtp.gmail.com with ESMTPSA id 143-20020a621495000000b00565b259a52asm7854502pfu.1.2022.11.20.22.33.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Nov 2022 22:33:13 -0800 (PST)
Date:   Sun, 20 Nov 2022 22:33:08 -0800
From:   Hyunwoo Kim <v4bel@theori.io>
To:     mchehab@kernel.org
Cc:     linux-media@vger.kernel.org, linux-usb@vger.kernel.org,
        tiwai@suse.de, v4bel@theori.io
Subject: [PATCH] media: dvb-core: Fix use-after-free due to race condition
 occurring in dvb_ca_en50221
Message-ID: <20221121063308.GA33821@ubuntu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If the device node of dvb_ca_en50221 is open() and the
device is disconnected, a UAF may occur when calling
close() on the device node.

The root cause is that wake_up() and wait_event() for
dvbdev->wait_queue are not implemented.

So implement wait_event() function in dvb_ca_en50221_release()
and add 'remove_mutex' which prevents race condition
for 'ca->exit'.

Signed-off-by: Hyunwoo Kim <v4bel@theori.io>
---
 drivers/media/dvb-core/dvb_ca_en50221.c | 36 ++++++++++++++++++++++++-
 1 file changed, 35 insertions(+), 1 deletion(-)

diff --git a/drivers/media/dvb-core/dvb_ca_en50221.c b/drivers/media/dvb-core/dvb_ca_en50221.c
index 15a08d8c69ef..60133a315701 100644
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
@@ -1709,12 +1715,22 @@ static int dvb_ca_en50221_io_open(struct inode *inode, struct file *file)
 
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
 
@@ -1739,6 +1755,7 @@ static int dvb_ca_en50221_io_open(struct inode *inode, struct file *file)
 
 	dvb_ca_private_get(ca);
 
+	mutex_unlock(&ca->remove_mutex);
 	return 0;
 }
 
@@ -1758,6 +1775,8 @@ static int dvb_ca_en50221_io_release(struct inode *inode, struct file *file)
 
 	dprintk("%s\n", __func__);
 
+	mutex_lock(&ca->remove_mutex);
+
 	/* mark the CA device as closed */
 	ca->open = 0;
 	dvb_ca_en50221_thread_update_delay(ca);
@@ -1768,6 +1787,12 @@ static int dvb_ca_en50221_io_release(struct inode *inode, struct file *file)
 
 	dvb_ca_private_put(ca);
 
+	if (dvbdev->users == 1 && ca->exit == 1) {
+		mutex_unlock(&ca->remove_mutex);
+		wake_up(&dvbdev->wait_queue);
+	} else
+		mutex_unlock(&ca->remove_mutex);
+
 	return err;
 }
 
@@ -1891,6 +1916,7 @@ int dvb_ca_en50221_init(struct dvb_adapter *dvb_adapter,
 	}
 
 	mutex_init(&ca->ioctl_mutex);
+	mutex_init(&ca->remove_mutex);
 
 	if (signal_pending(current)) {
 		ret = -EINTR;
@@ -1933,6 +1959,14 @@ void dvb_ca_en50221_release(struct dvb_ca_en50221 *pubca)
 
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
2.25.1


Dear,

A UAF can occur in a flow like the one below:
```
                cpu0                                                cpu1
                                                             1. dvb_usbv2_probe()
                                                                d->priv = kzalloc(d->props->size_of_priv, GFP_KERNEL);
                                                                ...
                                                                dvb_usbv2_init()
                                                                anysee_init()
                                                                anysee_ci_init()
                                                                dvb_ca_en50221_init()
                                                                ca->pub = pubca;    // pubca : &state->ci, state : d->priv
       2. open()
          dvb_device_open()
          dvb_ca_en50221_io_open()
                                                             3. dvb_usbv2_disconnect()
                                                                kfree(d->priv);
       4. close()
          dvb_ca_en50221_io_release()
          module_put(ca->pub->owner);    // UAF
```


Regards,
Hyunwoo Kim
