Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C5ECC629C06
	for <lists+linux-media@lfdr.de>; Tue, 15 Nov 2022 15:25:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230153AbiKOOZO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Nov 2022 09:25:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229560AbiKOOZM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Nov 2022 09:25:12 -0500
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E8B02AC5;
        Tue, 15 Nov 2022 06:25:11 -0800 (PST)
Received: by mail-pl1-x632.google.com with SMTP id 4so13338136pli.0;
        Tue, 15 Nov 2022 06:25:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bweLnmK4o5R+fzGlOkb1YfNJnWzSUbEipByr0wToMoE=;
        b=l8OJV0q51yXIv79tum0jYlBuZoAKzbko8PKH1dvnAGqfspePIAUTb8msQW1mTRj9Mb
         2UtVnyzef7jLZYfUKJwSNRsrh7i/Ax5Ohume0Xi70+AllLO1QGxc807CXBOt2nutYWSn
         36tKY4IjVxuEyjl4oNnKwejpiHYuOZqDZ+Ogp8B9WqOI/RrB6YF4mnirPEL54WABIWYz
         fgmBXVebwTYHVEkgrefCWxNImxik3t3nOQ0qomBcz8+JVWKqx0vvLiheTgEf1ZLeWiND
         QY8z38ApvKZsMZ4XxNe4Phz6rYN6/vqT40221iCs9H6sPj8s1I7W13/Nrz+kxWY09TVB
         pwBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bweLnmK4o5R+fzGlOkb1YfNJnWzSUbEipByr0wToMoE=;
        b=37VKY4ZAQu2odk1g+GzonIgB4Qi+4n5eVSg/TEkr8yC3VQmKHnZrdUbhdn8fIgBK5j
         ud+P8X+Y9NvZT0kKxOEcUiKrH1aSHSDpdQCmW2qB35vNKe2dIq0iMTT8OzAoMWQ+baWK
         SeN/gXQxEeFd3GxlIhE4ufH7smMr9LvdBdWKeyZSOFKr1R4iB6CAANkZbSDvJamnodZ8
         7CovFg/pfEsZrtZdW3LL9CIe2pT/xrMtHtpajL57/WhhizQyeSoq8WJ8FPNb9bOtog2z
         CJVh/aDUZ70aYPv+0h/NiPKDmy2DsAnWtGPtlFGA4amG+UJ+SFT/DSRNYdFKrupaqcqf
         iUPA==
X-Gm-Message-State: ANoB5pn8GVFhL4YT+LAL/QLS7r+c7RyJjyDTb6sepgDX2shYoUJbV+RJ
        ZvbV4bpxFNd8PB8H5UcY0bs=
X-Google-Smtp-Source: AA0mqf4vBX1wix0wn+yVaExh0aYcxRzPbCt/K4pkCx9IG4WHPXr1vFd1jQnAjl+dY5QkxiHcIEviVA==
X-Received: by 2002:a17:90a:648c:b0:213:5de3:13e with SMTP id h12-20020a17090a648c00b002135de3013emr883996pjj.6.1668522311021;
        Tue, 15 Nov 2022 06:25:11 -0800 (PST)
Received: from localhost.localdomain ([175.124.254.119])
        by smtp.gmail.com with ESMTPSA id g17-20020aa79f11000000b0056da2bf607csm8733661pfr.214.2022.11.15.06.25.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Nov 2022 06:25:10 -0800 (PST)
From:   Hyunwoo Kim <imv4bel@gmail.com>
To:     mchehab@kernel.org
Cc:     kernel@tuxforce.de, linux-media@vger.kernel.org,
        linux-usb@vger.kernel.org, cai.huoqing@linux.dev, tiwai@suse.de,
        imv4bel@gmail.com
Subject: [PATCH v2 2/4] media: dvb-core: Fix use-after-free due to race condition occurring in dvb_net
Date:   Tue, 15 Nov 2022 06:23:54 -0800
Message-Id: <20221115142356.12315-3-imv4bel@gmail.com>
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

