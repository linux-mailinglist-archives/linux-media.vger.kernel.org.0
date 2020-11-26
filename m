Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4FF162C4DE9
	for <lists+linux-media@lfdr.de>; Thu, 26 Nov 2020 05:15:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387541AbgKZEPK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Nov 2020 23:15:10 -0500
Received: from mx2.suse.de ([195.135.220.15]:36546 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387537AbgKZEPK (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Nov 2020 23:15:10 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 0A0A0AC17;
        Thu, 26 Nov 2020 04:15:08 +0000 (UTC)
Date:   Wed, 25 Nov 2020 19:50:58 -0800
From:   Davidlohr Bueso <dave@stgolabs.net>
To:     mchehab@kernel.org
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Davidlohr Bueso <dbueso@suse.de>
Subject: Re: [PATCH] media/siano: kill pointless kmutex definitions
Message-ID: <20201126035058.znwkokxtzkayv55p@linux-p48b.lan>
References: <20201101195424.21040-1-dave@stgolabs.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20201101195424.21040-1-dave@stgolabs.net>
User-Agent: NeoMutt/20180716
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

ping

On Sun, 01 Nov 2020, Davidlohr Bueso wrote:

>Use the mutex api instead of renaming the calls for this
>driver.
>
>Signed-off-by: Davidlohr Bueso <dbueso@suse.de>
>---
>This was found while auditing mutex semantics in drivers.
>
> drivers/media/common/siano/smscoreapi.c  | 42 ++++++++++++------------
> drivers/media/common/siano/smscoreapi.h  |  5 ---
> drivers/media/common/siano/smsdvb-main.c | 14 ++++----
> 3 files changed, 28 insertions(+), 33 deletions(-)
>
>diff --git a/drivers/media/common/siano/smscoreapi.c b/drivers/media/common/siano/smscoreapi.c
>index c1511094fdc7..410cc3ac6f94 100644
>--- a/drivers/media/common/siano/smscoreapi.c
>+++ b/drivers/media/common/siano/smscoreapi.c
>@@ -429,13 +429,13 @@ static struct smscore_registry_entry_t *smscore_find_registry(char *devpath)
> 	struct smscore_registry_entry_t *entry;
> 	struct list_head *next;
>
>-	kmutex_lock(&g_smscore_registrylock);
>+	mutex_lock(&g_smscore_registrylock);
> 	for (next = g_smscore_registry.next;
> 	     next != &g_smscore_registry;
> 	     next = next->next) {
> 		entry = (struct smscore_registry_entry_t *) next;
> 		if (!strncmp(entry->devpath, devpath, sizeof(entry->devpath))) {
>-			kmutex_unlock(&g_smscore_registrylock);
>+			mutex_unlock(&g_smscore_registrylock);
> 			return entry;
> 		}
> 	}
>@@ -446,7 +446,7 @@ static struct smscore_registry_entry_t *smscore_find_registry(char *devpath)
> 		list_add(&entry->entry, &g_smscore_registry);
> 	} else
> 		pr_err("failed to create smscore_registry.\n");
>-	kmutex_unlock(&g_smscore_registrylock);
>+	mutex_unlock(&g_smscore_registrylock);
> 	return entry;
> }
>
>@@ -527,7 +527,7 @@ int smscore_register_hotplug(hotplug_t hotplug)
> 	struct list_head *next, *first;
> 	int rc = 0;
>
>-	kmutex_lock(&g_smscore_deviceslock);
>+	mutex_lock(&g_smscore_deviceslock);
> 	notifyee = kmalloc(sizeof(*notifyee), GFP_KERNEL);
> 	if (notifyee) {
> 		/* now notify callback about existing devices */
>@@ -548,7 +548,7 @@ int smscore_register_hotplug(hotplug_t hotplug)
> 	} else
> 		rc = -ENOMEM;
>
>-	kmutex_unlock(&g_smscore_deviceslock);
>+	mutex_unlock(&g_smscore_deviceslock);
>
> 	return rc;
> }
>@@ -564,7 +564,7 @@ void smscore_unregister_hotplug(hotplug_t hotplug)
> {
> 	struct list_head *next, *first;
>
>-	kmutex_lock(&g_smscore_deviceslock);
>+	mutex_lock(&g_smscore_deviceslock);
>
> 	first = &g_smscore_notifyees;
>
>@@ -579,7 +579,7 @@ void smscore_unregister_hotplug(hotplug_t hotplug)
> 		}
> 	}
>
>-	kmutex_unlock(&g_smscore_deviceslock);
>+	mutex_unlock(&g_smscore_deviceslock);
> }
> EXPORT_SYMBOL_GPL(smscore_unregister_hotplug);
>
>@@ -732,9 +732,9 @@ int smscore_register_device(struct smsdevice_params_t *params,
> 	smscore_registry_settype(dev->devpath, params->device_type);
>
> 	/* add device to devices list */
>-	kmutex_lock(&g_smscore_deviceslock);
>+	mutex_lock(&g_smscore_deviceslock);
> 	list_add(&dev->entry, &g_smscore_devices);
>-	kmutex_unlock(&g_smscore_deviceslock);
>+	mutex_unlock(&g_smscore_deviceslock);
>
> 	*coredev = dev;
>
>@@ -890,14 +890,14 @@ int smscore_start_device(struct smscore_device_t *coredev)
> 		return rc;
> 	}
>
>-	kmutex_lock(&g_smscore_deviceslock);
>+	mutex_lock(&g_smscore_deviceslock);
>
> 	rc = smscore_notify_callbacks(coredev, coredev->device, 1);
> 	smscore_init_ir(coredev);
>
> 	pr_debug("device %p started, rc %d\n", coredev, rc);
>
>-	kmutex_unlock(&g_smscore_deviceslock);
>+	mutex_unlock(&g_smscore_deviceslock);
>
> 	return rc;
> }
>@@ -1197,7 +1197,7 @@ void smscore_unregister_device(struct smscore_device_t *coredev)
> 	int num_buffers = 0;
> 	int retry = 0;
>
>-	kmutex_lock(&g_smscore_deviceslock);
>+	mutex_lock(&g_smscore_deviceslock);
>
> 	/* Release input device (IR) resources */
> 	sms_ir_exit(coredev);
>@@ -1224,9 +1224,9 @@ void smscore_unregister_device(struct smscore_device_t *coredev)
>
> 		pr_debug("waiting for %d buffer(s)\n",
> 			 coredev->num_buffers - num_buffers);
>-		kmutex_unlock(&g_smscore_deviceslock);
>+		mutex_unlock(&g_smscore_deviceslock);
> 		msleep(100);
>-		kmutex_lock(&g_smscore_deviceslock);
>+		mutex_lock(&g_smscore_deviceslock);
> 	}
>
> 	pr_debug("freed %d buffers\n", num_buffers);
>@@ -1245,7 +1245,7 @@ void smscore_unregister_device(struct smscore_device_t *coredev)
> 	list_del(&coredev->entry);
> 	kfree(coredev);
>
>-	kmutex_unlock(&g_smscore_deviceslock);
>+	mutex_unlock(&g_smscore_deviceslock);
>
> 	pr_debug("device %p destroyed\n", coredev);
> }
>@@ -2123,17 +2123,17 @@ static int __init smscore_module_init(void)
> {
> 	INIT_LIST_HEAD(&g_smscore_notifyees);
> 	INIT_LIST_HEAD(&g_smscore_devices);
>-	kmutex_init(&g_smscore_deviceslock);
>+	mutex_init(&g_smscore_deviceslock);
>
> 	INIT_LIST_HEAD(&g_smscore_registry);
>-	kmutex_init(&g_smscore_registrylock);
>+	mutex_init(&g_smscore_registrylock);
>
> 	return 0;
> }
>
> static void __exit smscore_module_exit(void)
> {
>-	kmutex_lock(&g_smscore_deviceslock);
>+	mutex_lock(&g_smscore_deviceslock);
> 	while (!list_empty(&g_smscore_notifyees)) {
> 		struct smscore_device_notifyee_t *notifyee =
> 			(struct smscore_device_notifyee_t *)
>@@ -2142,9 +2142,9 @@ static void __exit smscore_module_exit(void)
> 		list_del(&notifyee->entry);
> 		kfree(notifyee);
> 	}
>-	kmutex_unlock(&g_smscore_deviceslock);
>+	mutex_unlock(&g_smscore_deviceslock);
>
>-	kmutex_lock(&g_smscore_registrylock);
>+	mutex_lock(&g_smscore_registrylock);
> 	while (!list_empty(&g_smscore_registry)) {
> 		struct smscore_registry_entry_t *entry =
> 			(struct smscore_registry_entry_t *)
>@@ -2153,7 +2153,7 @@ static void __exit smscore_module_exit(void)
> 		list_del(&entry->entry);
> 		kfree(entry);
> 	}
>-	kmutex_unlock(&g_smscore_registrylock);
>+	mutex_unlock(&g_smscore_registrylock);
>
> 	pr_debug("\n");
> }
>diff --git a/drivers/media/common/siano/smscoreapi.h b/drivers/media/common/siano/smscoreapi.h
>index b3b793b5caf3..4a6b9f4c44ac 100644
>--- a/drivers/media/common/siano/smscoreapi.h
>+++ b/drivers/media/common/siano/smscoreapi.h
>@@ -28,11 +28,6 @@ Copyright (C) 2006-2008, Uri Shkolnik, Anatoly Greenblat
>
> #include "smsir.h"
>
>-#define kmutex_init(_p_) mutex_init(_p_)
>-#define kmutex_lock(_p_) mutex_lock(_p_)
>-#define kmutex_trylock(_p_) mutex_trylock(_p_)
>-#define kmutex_unlock(_p_) mutex_unlock(_p_)
>-
> /*
>  * Define the firmware names used by the driver.
>  * Those should match what's used at smscoreapi.c and sms-cards.c
>diff --git a/drivers/media/common/siano/smsdvb-main.c b/drivers/media/common/siano/smsdvb-main.c
>index 88f90dfd368b..633902036e30 100644
>--- a/drivers/media/common/siano/smsdvb-main.c
>+++ b/drivers/media/common/siano/smsdvb-main.c
>@@ -630,11 +630,11 @@ static void smsdvb_unregister_client(struct smsdvb_client_t *client)
>
> static void smsdvb_onremove(void *context)
> {
>-	kmutex_lock(&g_smsdvb_clientslock);
>+	mutex_lock(&g_smsdvb_clientslock);
>
> 	smsdvb_unregister_client((struct smsdvb_client_t *) context);
>
>-	kmutex_unlock(&g_smsdvb_clientslock);
>+	mutex_unlock(&g_smsdvb_clientslock);
> }
>
> static int smsdvb_start_feed(struct dvb_demux_feed *feed)
>@@ -1151,11 +1151,11 @@ static int smsdvb_hotplug(struct smscore_device_t *coredev,
> 	init_completion(&client->tune_done);
> 	init_completion(&client->stats_done);
>
>-	kmutex_lock(&g_smsdvb_clientslock);
>+	mutex_lock(&g_smsdvb_clientslock);
>
> 	list_add(&client->entry, &g_smsdvb_clients);
>
>-	kmutex_unlock(&g_smsdvb_clientslock);
>+	mutex_unlock(&g_smsdvb_clientslock);
>
> 	client->event_fe_state = -1;
> 	client->event_unc_state = -1;
>@@ -1198,7 +1198,7 @@ static int __init smsdvb_module_init(void)
> 	int rc;
>
> 	INIT_LIST_HEAD(&g_smsdvb_clients);
>-	kmutex_init(&g_smsdvb_clientslock);
>+	mutex_init(&g_smsdvb_clientslock);
>
> 	smsdvb_debugfs_register();
>
>@@ -1213,14 +1213,14 @@ static void __exit smsdvb_module_exit(void)
> {
> 	smscore_unregister_hotplug(smsdvb_hotplug);
>
>-	kmutex_lock(&g_smsdvb_clientslock);
>+	mutex_lock(&g_smsdvb_clientslock);
>
> 	while (!list_empty(&g_smsdvb_clients))
> 		smsdvb_unregister_client((struct smsdvb_client_t *)g_smsdvb_clients.next);
>
> 	smsdvb_debugfs_unregister();
>
>-	kmutex_unlock(&g_smsdvb_clientslock);
>+	mutex_unlock(&g_smsdvb_clientslock);
> }
>
> module_init(smsdvb_module_init);
>-- 
>2.26.2
>
