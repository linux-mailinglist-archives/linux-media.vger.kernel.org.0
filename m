Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 24C6262D27B
	for <lists+linux-media@lfdr.de>; Thu, 17 Nov 2022 06:00:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234454AbiKQFAn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Nov 2022 00:00:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234308AbiKQFAl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Nov 2022 00:00:41 -0500
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5DEE391D2;
        Wed, 16 Nov 2022 21:00:40 -0800 (PST)
Received: by mail-pf1-x42e.google.com with SMTP id b29so657193pfp.13;
        Wed, 16 Nov 2022 21:00:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bweLnmK4o5R+fzGlOkb1YfNJnWzSUbEipByr0wToMoE=;
        b=COD8ilm0acmVOPn9lztSQZCAdrs/2FKFXOdu5sFLwhajVDWHSFWh2IuQeM8pPDGGx1
         v6GlfmVl2nFNDMo5N/gcKpVpNZDVhJhXr7FWyFIZoTIHUiWzQ/zgNxCFXgiAxoa43bFt
         rBQi0PWB1hmnHyLbeorNVn6SCIJEZWZ6oX9vqwkIXCArehSfo1nyMz3lcgdAwOu+FTQ0
         mufPsUapRHzOd/aQruDeX4olx0kPeYVRH59E1Xxf1jJGLT5DLt8VMrbmuBH2hSlKaPe9
         BiZrPiaMquohHXshkJE1Goli/eKSLQLFTMekfsXt23eH0owqk2igPQjnhjzHAF8R8hbu
         cHoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bweLnmK4o5R+fzGlOkb1YfNJnWzSUbEipByr0wToMoE=;
        b=MTr+7dlJ/nWVDVYACwEvYoGeuu2AvIMFL+mIOQJmdgwm2qvZ9xJ107G9/VuVjMQYzF
         oqAb5nYJKX9BccGDTXoCBhiivFtXTYGIitbR9UIMXHHeYu0wJlZSe22SHcNsrh+s1nyn
         Cyizysilzr+FN3sytsVlOSv8LREvLuPde6uxoqW+XRJ42XaJ88AzVB7ytnh3R1p6l6vb
         NVNdHBTT1OxnT4/J+jUIm6z97SqkC8y0Xs5DMkGB03E2da86QKVqGk9eidQiQ0aSwwwh
         BF6rOToKLv/kKzqtsWavZq3gI1Zu77+P5EjE6K21TIHWAO7AbQv/H6V3P5vAH98Dq0qR
         ZAMA==
X-Gm-Message-State: ANoB5pleObJzF0G8DrAkIQ5B72N4xJHCGbTmNS+Eta22u/LbI9dV3WKX
        w7h7wVU+DrOTzte20ehL7HQ=
X-Google-Smtp-Source: AA0mqf6RFHQWsuJqFMgxYJ7jtmk7jGHisH5Icxq0oOYAy/JCVztcHqVU4i6ml5f3yHbjLr2kpa0Klw==
X-Received: by 2002:a05:6a00:4009:b0:563:2ada:30a3 with SMTP id by9-20020a056a00400900b005632ada30a3mr1405515pfb.27.1668661240385;
        Wed, 16 Nov 2022 21:00:40 -0800 (PST)
Received: from localhost.localdomain ([175.124.254.119])
        by smtp.gmail.com with ESMTPSA id y18-20020aa79af2000000b0053e468a78a8sm11911178pfp.158.2022.11.16.21.00.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 21:00:40 -0800 (PST)
From:   Hyunwoo Kim <imv4bel@gmail.com>
To:     mchehab@kernel.org
Cc:     kernel@tuxforce.de, linux-media@vger.kernel.org,
        linux-usb@vger.kernel.org, cai.huoqing@linux.dev, tiwai@suse.de,
        imv4bel@gmail.com
Subject: [PATCH v3 2/4] media: dvb-core: Fix use-after-free due to race condition occurring in dvb_net
Date:   Wed, 16 Nov 2022 20:59:23 -0800
Message-Id: <20221117045925.14297-3-imv4bel@gmail.com>
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

A race condition may occur between the .disconnect function, which
is called when the device is disconnected, and the dvb_device_open()
function, which is called when the device node is open()ed.
This results in several types of UAFs.

The root cause of this is that you use the dvb_device_open() function,
which does not implement a conditional statement
that checks 'dvbnet->exit'.

So, add 'remove_mutex` to protect 'dvbnet->exit' and use
locked_dvb_net_open() function to check 'dvbnet->exit'.

Signed-off-by: Hyunwoo Kim <imv4bel@gmail.com>
---
 drivers/media/dvb-core/dvb_net.c | 37 +++++++++++++++++++++++++++++---
 include/media/dvb_net.h          |  4 ++++
 2 files changed, 38 insertions(+), 3 deletions(-)

diff --git a/drivers/media/dvb-core/dvb_net.c b/drivers/media/dvb-core/dvb_net.c
index 8a2febf33ce2..bdfc6609cb93 100644
--- a/drivers/media/dvb-core/dvb_net.c
+++ b/drivers/media/dvb-core/dvb_net.c
@@ -1564,15 +1564,42 @@ static long dvb_net_ioctl(struct file *file,
 	return dvb_usercopy(file, cmd, arg, dvb_net_do_ioctl);
 }
 
+static int locked_dvb_net_open(struct inode *inode, struct file *file)
+{
+	struct dvb_device *dvbdev = file->private_data;
+	struct dvb_net *dvbnet = dvbdev->priv;
+	int ret;
+
+	if (mutex_lock_interruptible(&dvbnet->remove_mutex))
+		return -ERESTARTSYS;
+
+	if (dvbnet->exit) {
+		mutex_unlock(&dvbnet->remove_mutex);
+		return -ENODEV;
+	}
+
+	ret = dvb_generic_open(inode, file);
+
+	mutex_unlock(&dvbnet->remove_mutex);
+
+	return ret;
+}
+
 static int dvb_net_close(struct inode *inode, struct file *file)
 {
 	struct dvb_device *dvbdev = file->private_data;
 	struct dvb_net *dvbnet = dvbdev->priv;
 
+	mutex_lock(&dvbnet->remove_mutex);
+
 	dvb_generic_release(inode, file);
 
-	if(dvbdev->users == 1 && dvbnet->exit == 1)
+	if (dvbdev->users == 1 && dvbnet->exit == 1) {
+		mutex_unlock(&dvbnet->remove_mutex);
 		wake_up(&dvbdev->wait_queue);
+	} else
+		mutex_unlock(&dvbnet->remove_mutex);
+
 	return 0;
 }
 
@@ -1580,7 +1607,7 @@ static int dvb_net_close(struct inode *inode, struct file *file)
 static const struct file_operations dvb_net_fops = {
 	.owner = THIS_MODULE,
 	.unlocked_ioctl = dvb_net_ioctl,
-	.open =	dvb_generic_open,
+	.open =	locked_dvb_net_open,
 	.release = dvb_net_close,
 	.llseek = noop_llseek,
 };
@@ -1599,10 +1626,13 @@ void dvb_net_release (struct dvb_net *dvbnet)
 {
 	int i;
 
+	mutex_lock(&dvbnet->remove_mutex);
 	dvbnet->exit = 1;
+	mutex_unlock(&dvbnet->remove_mutex);
+
 	if (dvbnet->dvbdev->users < 1)
 		wait_event(dvbnet->dvbdev->wait_queue,
-				dvbnet->dvbdev->users==1);
+				dvbnet->dvbdev->users == 1);
 
 	dvb_unregister_device(dvbnet->dvbdev);
 
@@ -1621,6 +1651,7 @@ int dvb_net_init (struct dvb_adapter *adap, struct dvb_net *dvbnet,
 	int i;
 
 	mutex_init(&dvbnet->ioctl_mutex);
+	mutex_init(&dvbnet->remove_mutex);
 	dvbnet->demux = dmx;
 
 	for (i=0; i<DVB_NET_DEVICES_MAX; i++)
diff --git a/include/media/dvb_net.h b/include/media/dvb_net.h
index 5e31d37f25fa..3e2eee5a05e5 100644
--- a/include/media/dvb_net.h
+++ b/include/media/dvb_net.h
@@ -41,6 +41,9 @@
  * @exit:		flag to indicate when the device is being removed.
  * @demux:		pointer to &struct dmx_demux.
  * @ioctl_mutex:	protect access to this struct.
+ * @remove_mutex:	mutex that avoids a race condition between a callback
+ *			called when the hardware is disconnected and the
+ *			file_operations of dvb_net
  *
  * Currently, the core supports up to %DVB_NET_DEVICES_MAX (10) network
  * devices.
@@ -53,6 +56,7 @@ struct dvb_net {
 	unsigned int exit:1;
 	struct dmx_demux *demux;
 	struct mutex ioctl_mutex;
+	struct mutex remove_mutex;
 };
 
 /**
-- 
2.25.1

