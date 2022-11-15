Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2AC0C629C07
	for <lists+linux-media@lfdr.de>; Tue, 15 Nov 2022 15:25:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230187AbiKOOZQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Nov 2022 09:25:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229560AbiKOOZQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Nov 2022 09:25:16 -0500
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E19842AC5;
        Tue, 15 Nov 2022 06:25:13 -0800 (PST)
Received: by mail-pl1-x631.google.com with SMTP id io19so13284629plb.8;
        Tue, 15 Nov 2022 06:25:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z3XPZFY/pLXtB3zNFspMFb/vz6kStyiJD4vRECAgWDs=;
        b=pNpRkOehclFH6pU2TTj9OWM5/r49qPTbQ83rr5V1ywZd7cQIJbKbisH3uYocGpy+nW
         LL8aB+2RLtvG9USydmMrPBhl1pcFNLRDyhpmZCloRz8qZ/lym9pqrxu8TGmvJ5Pif55p
         6domo80SR/uPkBq33c0KHRmSm5K2a7nhANNrcaAiiBQKb83lY19Ve9ItZqwfywTudBTG
         88cNFxypALetRiK6ht+NIoP4+QiC7u4DKqoJwfXhEpY0P1O5VPStUjOv6k5lb4WEdJY6
         nBnp0YfPITmi5i03ZI9gkPv4D9rBP4w2B7dN0ebXEs+4nvvpfjqiQSpJWpXEzu9D9c4N
         WNdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z3XPZFY/pLXtB3zNFspMFb/vz6kStyiJD4vRECAgWDs=;
        b=6ova/B4foFhX2T0w/hcZafil6IWVb2tQrO4qWiwIxe6/ULAKKNCEngxMov5hWipRMi
         atJz2sQfjTNBNF7N+UPam115JfolPPmb39zhZY5eWO4GK5AjM2tOVk9fRbkwAJgbi0Pb
         MIQSRNCHYapHmIkbxV4YHFwuSky9SW64kt44Z95DO6yl4AszGdscFg1n9YnwswL8N9xx
         Es8aBDMKSZfKXegUxj35L5jpL2oURP2QOYli2t44ZOzQrg4Q82Z0Ieq9vCvTJy1Ryc8O
         7fhniILOvO3lrrYlA6NJgCLH3jW8sHp/64pTfvLZVKB9zsmSWS6jf59Td4WI33Y2hypD
         TT/A==
X-Gm-Message-State: ANoB5pn338dMvIFyT+UzkRbM8fJWI5SW/+YOL6FZEtQkJ7gimt8FbZjR
        LuqtGZMopdzmZ0z8Os5JKck=
X-Google-Smtp-Source: AA0mqf5Ri5lPQfO4nfOx8v0EZAieo6sjRES3Ycd7Z2bWyZw4NPiLvqJylyVxtYQjpfsvQlJ3xTOYCw==
X-Received: by 2002:a17:902:8c8d:b0:182:6c84:7ff4 with SMTP id t13-20020a1709028c8d00b001826c847ff4mr4157023plo.25.1668522313446;
        Tue, 15 Nov 2022 06:25:13 -0800 (PST)
Received: from localhost.localdomain ([175.124.254.119])
        by smtp.gmail.com with ESMTPSA id g17-20020aa79f11000000b0056da2bf607csm8733661pfr.214.2022.11.15.06.25.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Nov 2022 06:25:13 -0800 (PST)
From:   Hyunwoo Kim <imv4bel@gmail.com>
To:     mchehab@kernel.org
Cc:     kernel@tuxforce.de, linux-media@vger.kernel.org,
        linux-usb@vger.kernel.org, cai.huoqing@linux.dev, tiwai@suse.de,
        imv4bel@gmail.com
Subject: [PATCH v2 3/4] media: dvb-core: Fix use-after-free due to race condition occurring in dvb_register_device()
Date:   Tue, 15 Nov 2022 06:23:55 -0800
Message-Id: <20221115142356.12315-4-imv4bel@gmail.com>
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

dvb_register_device() dynamically allocates fops with kmemdup()
to set the fops->owner.
And these fops are registered in 'file->f_ops' using replace_fops()
in the dvb_device_open() process, and kfree()d in dvb_free_device().

However, it is not common to use dynamically allocated fops instead
of 'static const' fops as an argument of replace_fops(),
and UAF may occur.
These UAFs can occur on any dvb type using dvb_register_device(),
such as dvb_dvr, dvb_demux, dvb_frontend, dvb_net, etc.

So, instead of kfree() the fops dynamically allocated in
dvb_register_device() in dvb_free_device() called during the
.disconnect() process, kfree() it collectively in exit_dvbdev()
called when the dvbdev.c module is removed.

Signed-off-by: Hyunwoo Kim <imv4bel@gmail.com>
---
 drivers/media/dvb-core/dvbdev.c | 83 ++++++++++++++++++++++++---------
 include/media/dvbdev.h          | 15 ++++++
 2 files changed, 77 insertions(+), 21 deletions(-)

diff --git a/drivers/media/dvb-core/dvbdev.c b/drivers/media/dvb-core/dvbdev.c
index 675d877a67b2..424cf92c068e 100644
--- a/drivers/media/dvb-core/dvbdev.c
+++ b/drivers/media/dvb-core/dvbdev.c
@@ -27,6 +27,7 @@
 #include <media/tuner.h>
 
 static DEFINE_MUTEX(dvbdev_mutex);
+static LIST_HEAD(dvbdevfops_list);
 static int dvbdev_debug;
 
 module_param(dvbdev_debug, int, 0644);
@@ -448,14 +449,15 @@ int dvb_register_device(struct dvb_adapter *adap, struct dvb_device **pdvbdev,
 			enum dvb_device_type type, int demux_sink_pads)
 {
 	struct dvb_device *dvbdev;
-	struct file_operations *dvbdevfops;
+	struct file_operations *dvbdevfops = NULL;
+	struct dvbdevfops_node *node, *new_node;
 	struct device *clsdev;
 	int minor;
 	int id, ret;
 
 	mutex_lock(&dvbdev_register_lock);
 
-	if ((id = dvbdev_get_free_id (adap, type)) < 0){
+	if ((id = dvbdev_get_free_id (adap, type)) < 0) {
 		mutex_unlock(&dvbdev_register_lock);
 		*pdvbdev = NULL;
 		pr_err("%s: couldn't find free device id\n", __func__);
@@ -463,18 +465,45 @@ int dvb_register_device(struct dvb_adapter *adap, struct dvb_device **pdvbdev,
 	}
 
 	*pdvbdev = dvbdev = kzalloc(sizeof(*dvbdev), GFP_KERNEL);
-
 	if (!dvbdev){
 		mutex_unlock(&dvbdev_register_lock);
 		return -ENOMEM;
 	}
 
-	dvbdevfops = kmemdup(template->fops, sizeof(*dvbdevfops), GFP_KERNEL);
+	/*
+	 * When a device of the same type is probe()d more than once,
+	 * the first allocated fops are used. This prevents memory leaks
+	 * that can occur when the same device is probe()d repeatedly.
+	 */
+	list_for_each_entry(node, &dvbdevfops_list, list_head) {
+		if (node->fops->owner == adap->module &&
+				node->type == type &&
+				node->template == template) {
+			dvbdevfops = node->fops;
+			break;
+		}
+	}
 
-	if (!dvbdevfops){
-		kfree (dvbdev);
-		mutex_unlock(&dvbdev_register_lock);
-		return -ENOMEM;
+	if (dvbdevfops == NULL) {
+		dvbdevfops = kmemdup(template->fops, sizeof(*dvbdevfops), GFP_KERNEL);
+		if (!dvbdevfops) {
+			kfree(dvbdev);
+			mutex_unlock(&dvbdev_register_lock);
+			return -ENOMEM;
+		}
+
+		new_node = kzalloc(sizeof(struct dvbdevfops_node), GFP_KERNEL);
+		if (!new_node) {
+			kfree(dvbdevfops);
+			kfree(dvbdev);
+			mutex_unlock(&dvbdev_register_lock);
+			return -ENOMEM;
+		}
+
+		new_node->fops = dvbdevfops;
+		new_node->type = type;
+		new_node->template = template;
+		list_add_tail (&new_node->list_head, &dvbdevfops_list);
 	}
 
 	memcpy(dvbdev, template, sizeof(struct dvb_device));
@@ -484,20 +513,20 @@ int dvb_register_device(struct dvb_adapter *adap, struct dvb_device **pdvbdev,
 	dvbdev->priv = priv;
 	dvbdev->fops = dvbdevfops;
 	init_waitqueue_head (&dvbdev->wait_queue);
-
 	dvbdevfops->owner = adap->module;
-
 	list_add_tail (&dvbdev->list_head, &adap->device_list);
-
 	down_write(&minor_rwsem);
 #ifdef CONFIG_DVB_DYNAMIC_MINORS
 	for (minor = 0; minor < MAX_DVB_MINORS; minor++)
 		if (dvb_minors[minor] == NULL)
 			break;
-
 	if (minor == MAX_DVB_MINORS) {
+		if (new_node) {
+			list_del (&new_node->list_head);
+			kfree(dvbdevfops);
+			kfree(new_node);
+		}
 		list_del (&dvbdev->list_head);
-		kfree(dvbdevfops);
 		kfree(dvbdev);
 		up_write(&minor_rwsem);
 		mutex_unlock(&dvbdev_register_lock);
@@ -506,41 +535,46 @@ int dvb_register_device(struct dvb_adapter *adap, struct dvb_device **pdvbdev,
 #else
 	minor = nums2minor(adap->num, type, id);
 #endif
-
 	dvbdev->minor = minor;
 	dvb_minors[minor] = dvbdev;
 	up_write(&minor_rwsem);
-
 	ret = dvb_register_media_device(dvbdev, type, minor, demux_sink_pads);
 	if (ret) {
 		pr_err("%s: dvb_register_media_device failed to create the mediagraph\n",
 		      __func__);
-
+		if (new_node) {
+			list_del (&new_node->list_head);
+			kfree(dvbdevfops);
+			kfree(new_node);
+		}
 		dvb_media_device_free(dvbdev);
 		list_del (&dvbdev->list_head);
-		kfree(dvbdevfops);
 		kfree(dvbdev);
 		mutex_unlock(&dvbdev_register_lock);
 		return ret;
 	}
 
-	mutex_unlock(&dvbdev_register_lock);
-
 	clsdev = device_create(dvb_class, adap->device,
 			       MKDEV(DVB_MAJOR, minor),
 			       dvbdev, "dvb%d.%s%d", adap->num, dnames[type], id);
 	if (IS_ERR(clsdev)) {
 		pr_err("%s: failed to create device dvb%d.%s%d (%ld)\n",
 		       __func__, adap->num, dnames[type], id, PTR_ERR(clsdev));
+		if (new_node) {
+			list_del (&new_node->list_head);
+			kfree(dvbdevfops);
+			kfree(new_node);
+		}
 		dvb_media_device_free(dvbdev);
 		list_del (&dvbdev->list_head);
-		kfree(dvbdevfops);
 		kfree(dvbdev);
 		return PTR_ERR(clsdev);
 	}
+
 	dprintk("DVB: register adapter%d/%s%d @ minor: %i (0x%02x)\n",
 		adap->num, dnames[type], id, minor, minor);
 
+	mutex_unlock(&dvbdev_register_lock);
 	return 0;
 }
 EXPORT_SYMBOL(dvb_register_device);
@@ -569,7 +603,6 @@ void dvb_free_device(struct dvb_device *dvbdev)
 	if (!dvbdev)
 		return;
 
-	kfree (dvbdev->fops);
 	kfree (dvbdev);
 }
 EXPORT_SYMBOL(dvb_free_device);
@@ -1061,9 +1094,17 @@ static int __init init_dvbdev(void)
 
 static void __exit exit_dvbdev(void)
 {
+	struct dvbdevfops_node *node, *next;
+
 	class_destroy(dvb_class);
 	cdev_del(&dvb_device_cdev);
 	unregister_chrdev_region(MKDEV(DVB_MAJOR, 0), MAX_DVB_MINORS);
+
+	list_for_each_entry_safe(node, next, &dvbdevfops_list, list_head) {
+		list_del (&node->list_head);
+		kfree(node->fops);
+		kfree(node);
+	}
 }
 
 subsys_initcall(init_dvbdev);
diff --git a/include/media/dvbdev.h b/include/media/dvbdev.h
index 2f6b0861322a..1e5413303705 100644
--- a/include/media/dvbdev.h
+++ b/include/media/dvbdev.h
@@ -187,6 +187,21 @@ struct dvb_device {
 	void *priv;
 };
 
+/**
+ * struct dvbdevfops_node - fops nodes registered in dvbdevfops_list
+ *
+ * @fops:		Dynamically allocated fops for ->owner registration
+ * @type:		type of dvb_device
+ * @template:		dvb_device used for registration
+ * @list_head:		list_head for dvbdevfops_list
+ */
+struct dvbdevfops_node {
+	struct file_operations *fops;
+	enum dvb_device_type type;
+	const struct dvb_device *template;
+	struct list_head list_head;
+};
+
 /**
  * dvb_register_adapter - Registers a new DVB adapter
  *
-- 
2.25.1

