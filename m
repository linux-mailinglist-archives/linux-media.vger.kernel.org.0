Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4BD5D6299EC
	for <lists+linux-media@lfdr.de>; Tue, 15 Nov 2022 14:19:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232748AbiKONTj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Nov 2022 08:19:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230293AbiKONTi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Nov 2022 08:19:38 -0500
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18382EE11;
        Tue, 15 Nov 2022 05:19:37 -0800 (PST)
Received: by mail-pl1-x630.google.com with SMTP id w23so6703611ply.12;
        Tue, 15 Nov 2022 05:19:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=znS0rqqtTDUdb8E5/+tBTInCz3XUVIVDecWR4eZBNxM=;
        b=MO3aWW9NRD17cN4leJHbToXg2sW3aSkdfndSnZ/uCzd1nN4kkclJVvBX4eLZY1QP/1
         03wGuA6/pyRIryXv7gOKPAGDY+XfIwuzoOvKS6gy9zJ5fCiZpc0P5Gn11NLdBAwAoUTv
         /iE+5TtTODL4+rrkq8+FjSTMlWhIvoLSzDDDPbifSHp+/fMXjspkxyJHVnf38pyn9OMh
         HlKnD/uZDmdgCgO6pBRw1aF/RioQN9W1TtqPxblAx1EDbbHZrMjK7SwzGtBfZjV6AO0a
         XfoCPjvxU9IrwTtilI+Czj222gpzlSFAw4a62yJH6t3/gFsmOZLkYswMxUDElZGkpANR
         qgeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=znS0rqqtTDUdb8E5/+tBTInCz3XUVIVDecWR4eZBNxM=;
        b=3q7FBn5gZ0DSO8AkdnBDYDuHaGV0GzOlsJ3vM7ZBxdxZZJVq1/FxnHI12VDSL2E+rm
         Ulu3BR+au5h+MbTfeVe8r1gYu+PaNyibGh+2HhzPRve2l+nbK0MCtNr2/r4ZZ5sphCYl
         fQGz1BgRpO5cK8vxR5flWOdHDKNtSo/u4NIuff/6S6SBjGWTTZuhk9ECQEcz3ugrjEOg
         STg1V/AJdnoeMpoOjFnE6osYXsYFtFQvnaqJjzXzvjzvFfS5+iWnouvGnTT8AnJ+GtW4
         x+jeTW+wzgWUOwFQuC8cdozwonKAzAxncv3Fg0nUlXJq/mEWpntIGG2m2U1zqv9Di7m/
         M6iQ==
X-Gm-Message-State: ANoB5pmOVTpvoPdnlYEl8DC30hHvYk8Ud8Zftk3CFiNiunAZCduFyQNN
        TlAa3wcs7rGw0AYAdEXb7CI=
X-Google-Smtp-Source: AA0mqf6q2jIldsOskDuB1kxT1FkBYpPkKIF/eil7zpgEY417WXNDorwUQmdjFMmywA6dbDWvxR4bTA==
X-Received: by 2002:a17:902:7d87:b0:176:a6fb:801a with SMTP id a7-20020a1709027d8700b00176a6fb801amr3967672plm.97.1668518377405;
        Tue, 15 Nov 2022 05:19:37 -0800 (PST)
Received: from localhost.localdomain ([175.124.254.119])
        by smtp.gmail.com with ESMTPSA id i24-20020aa796f8000000b00562784609fbsm8670937pfq.209.2022.11.15.05.19.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Nov 2022 05:19:37 -0800 (PST)
From:   imv4bel@gmail.com
To:     mchehab@kernel.org
Cc:     Hyunwoo Kim <imv4bel@gmail.com>, kernel@tuxforce.de,
        linux-media@vger.kernel.org, linux-usb@vger.kernel.org,
        cai.huoqing@linux.dev, tiwai@suse.de
Subject: [PATCH 2/4] media: dvb-core: Fix use-after-free due to race condition occurring in dvb_net
Date:   Tue, 15 Nov 2022 05:18:20 -0800
Message-Id: <20221115131822.6640-3-imv4bel@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221115131822.6640-1-imv4bel@gmail.com>
References: <20221115131822.6640-1-imv4bel@gmail.com>
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

From: Hyunwoo Kim <imv4bel@gmail.com>

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

