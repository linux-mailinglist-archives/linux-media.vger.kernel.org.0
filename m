Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23F76459739
	for <lists+linux-media@lfdr.de>; Mon, 22 Nov 2021 23:16:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240041AbhKVWTL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Nov 2021 17:19:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231771AbhKVWTL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Nov 2021 17:19:11 -0500
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 459A8C061714
        for <linux-media@vger.kernel.org>; Mon, 22 Nov 2021 14:16:02 -0800 (PST)
Received: by mail-pj1-x1035.google.com with SMTP id nh10-20020a17090b364a00b001a69adad5ebso1121619pjb.2
        for <linux-media@vger.kernel.org>; Mon, 22 Nov 2021 14:16:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2OV23+MScTURnMhYeuk3+zM35TT9kFx77CgHKYQgzCA=;
        b=i6TqQhY8ZD3wjTveGWx1ihr1j69B07becCRLjNTkblFGFcH6InIrFdSoTO4rC7CeEX
         rMMjKJF0b6mOaoxQc//ApgjDTtEoh4Rg7SFx4MXKNWP4KXQrrd2NugXi3vukgCnSQoK2
         nNMFJAX35uyka0XzQsTfgP0flmLwX3UXFavB8T63O0yesBn91rpTmbX2X76m8SInjzZX
         hMUBk1AyDVg/nWt8qDmgn/udVd7gWqz1NPNR8OctvhAY1x2ML+FweonqQXmWIGAtrH2Q
         lqEwxyDm0Pod2/0Xm0X4gG9xGRn7hETvJk4NwP6VSn9CoblymOnXp/mphELYK/y7lRec
         QcOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2OV23+MScTURnMhYeuk3+zM35TT9kFx77CgHKYQgzCA=;
        b=mAKWGtTTMomVgvqygcZHYJ2rKTj7XTA4fF0Wa0hWl524NaS5NEbI2O2ZKXbwDZS1Lb
         qJsQo78hxXQUuW1IlplIPDk3+tfa/33JExIpdpfBHKSDlvu9JY3GKk2ea82/fcKkQHMP
         C+ntvIswelwqG+v/BSPQSPPiNEPrGg0lIrSmD+flBdEzieS+r89SW570fcJyb+Opq4HW
         EE8O2YBWPMmeW5XgViQI3aUeIclMgDz1yLRKd7hUlaDI3zEk/r9y6lBZ3E3u/GrZ+U7n
         0GAUImVRxPDkHJYGlZur2DFXpFtLmcn9XFqeWt1q9SPZPPweYlmrzBqCGefuoKmQT9tx
         ZPjg==
X-Gm-Message-State: AOAM5314A2jaPO4/5SJZMIluSo4L331rSVC+FXB6o+8i8h/YqhpmXgid
        CDW7t9nXmOfurKg2w/AuMySnsw==
X-Google-Smtp-Source: ABdhPJyOvYIGtLSIBLMipAMguqSLFYrGrnGbr2edAXGEc0SyZut7+pCav7nhK9U2LG1x79V3cIpEeA==
X-Received: by 2002:a17:90b:33c8:: with SMTP id lk8mr218438pjb.97.1637619361773;
        Mon, 22 Nov 2021 14:16:01 -0800 (PST)
Received: from localhost.localdomain ([50.39.160.154])
        by smtp.gmail.com with ESMTPSA id v13sm10338616pfu.38.2021.11.22.14.16.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Nov 2021 14:16:01 -0800 (PST)
From:   Tadeusz Struk <tadeusz.struk@linaro.org>
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        john.stultz@linaro.org, linux-kernel@vger.kernel.org,
        Tadeusz Struk <tadeusz.struk@linaro.org>
Subject: [PATCH RESEND] media: venus: Synchronize probe() between venus_core and enc/dec
Date:   Mon, 22 Nov 2021 14:15:46 -0800
Message-Id: <20211122221546.178236-1-tadeusz.struk@linaro.org>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Venus video encode/decode hardware driver consists of three modules.
The parent module venus-core, and two sub modules venus-enc and venus-dec.
The venus-core module allocates a common structure that is used by the
enc/dec modules, loads the firmware, and performs some common hardware
initialization. Since the three modules are loaded one after the other,
and their probe functions can run in parallel it is possible that
the venc_probe and vdec_probe functions can finish before the core
venus_probe function, which then can fail when, for example it
fails to load the firmware. In this case the subsequent call to venc_open
causes an Oops as it tries to dereference already uninitialized structures
through dev->parent and the system crashes in __pm_runtime_resume() as in
the trace below:

[   26.064835][  T485] Internal error: Oops: 96000006 [#1] PREEMPT SMP
[   26.270914][  T485] Hardware name: Thundercomm Dragonboard 845c (DT)
[   26.285019][  T485] pc : __pm_runtime_resume+0x34/0x178
[   26.286374][  T213] lt9611 10-003b: hdmi cable connected
[   26.290285][  T485] lr : venc_open+0xc0/0x278 [venus_enc]
[   26.290326][  T485] Call trace:
[   26.290328][  T485]  __pm_runtime_resume+0x34/0x178
[   26.290330][  T485]  venc_open+0xc0/0x278 [venus_enc]
[   26.290335][  T485]  v4l2_open+0x184/0x294
[   26.290340][  T485]  chrdev_open+0x468/0x5c8
[   26.290344][  T485]  do_dentry_open+0x260/0x54c
[   26.290349][  T485]  path_openat+0xbe8/0xd5c
[   26.290352][  T485]  do_filp_open+0xb8/0x168
[   26.290354][  T485]  do_sys_openat2+0xa4/0x1e8
[   26.290357][  T485]  __arm64_compat_sys_openat+0x70/0x9c
[   26.290359][  T485]  invoke_syscall+0x60/0x170
[   26.290363][  T485]  el0_svc_common+0xb8/0xf8
[   26.290365][  T485]  do_el0_svc_compat+0x20/0x30
[   26.290367][  T485]  el0_svc_compat+0x24/0x84
[   26.290372][  T485]  el0t_32_sync_handler+0x7c/0xbc
[   26.290374][  T485]  el0t_32_sync+0x1b8/0x1bc
[   26.290381][  T485] ---[ end trace 04ca7c088b4c1a9c ]---
[   26.290383][  T485] Kernel panic - not syncing: Oops: Fatal exception

This can be fixed by synchronizing the three probe functions and
only allowing the venc_probe() and vdec_probe() to pass when venus_probe()
returns success.

Changes in v2:
- Change locking from mutex_lock to mutex_trylock
  in venc_probe and vdec_probe to avoid potential deadlock.

Signed-off-by: Tadeusz Struk <tadeusz.struk@linaro.org>
---
 drivers/media/platform/qcom/venus/core.c |  6 ++++++
 drivers/media/platform/qcom/venus/core.h |  2 ++
 drivers/media/platform/qcom/venus/vdec.c | 24 +++++++++++++++++++++---
 drivers/media/platform/qcom/venus/venc.c | 24 +++++++++++++++++++++---
 4 files changed, 50 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index f5fa81896012..3c126755f598 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -317,6 +317,7 @@ static int venus_probe(struct platform_device *pdev)
 
 	INIT_LIST_HEAD(&core->instances);
 	mutex_init(&core->lock);
+	mutex_init(&core->sync_lock);
 	INIT_DELAYED_WORK(&core->work, venus_sys_error_handler);
 	init_waitqueue_head(&core->sys_err_done);
 
@@ -332,6 +333,8 @@ static int venus_probe(struct platform_device *pdev)
 
 	venus_assign_register_offsets(core);
 
+	mutex_lock(&core->sync_lock);
+
 	ret = v4l2_device_register(dev, &core->v4l2_dev);
 	if (ret)
 		goto err_core_deinit;
@@ -378,6 +381,7 @@ static int venus_probe(struct platform_device *pdev)
 		goto err_dev_unregister;
 	}
 
+	mutex_unlock(&core->sync_lock);
 	venus_dbgfs_init(core);
 
 	return 0;
@@ -393,6 +397,7 @@ static int venus_probe(struct platform_device *pdev)
 	hfi_destroy(core);
 err_core_deinit:
 	hfi_core_deinit(core, false);
+	mutex_unlock(&core->sync_lock);
 err_core_put:
 	if (core->pm_ops->core_put)
 		core->pm_ops->core_put(core);
@@ -429,6 +434,7 @@ static int venus_remove(struct platform_device *pdev)
 
 	mutex_destroy(&core->pm_lock);
 	mutex_destroy(&core->lock);
+	mutex_destroy(&core->sync_lock);
 	venus_dbgfs_deinit(core);
 
 	return ret;
diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index 7c3bac01cd49..80a2d2b43578 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -121,6 +121,7 @@ struct venus_format {
  * @use_tz:	a flag that suggests presence of trustzone
  * @fw:		structure of firmware parameters
  * @lock:	a lock for this strucure
+ * @sync_lock	a lock for probe sync between venus_core and venus_enc/dec
  * @instances:	a list_head of all instances
  * @insts_count:	num of instances
  * @state:	the state of the venus core
@@ -178,6 +179,7 @@ struct venus_core {
 		size_t mem_size;
 	} fw;
 	struct mutex lock;
+	struct mutex sync_lock;
 	struct list_head instances;
 	atomic_t insts_count;
 	unsigned int state;
diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index 91da3f509724..b2fb0e096b21 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -1706,17 +1706,32 @@ static int vdec_probe(struct platform_device *pdev)
 	if (!core)
 		return -EPROBE_DEFER;
 
+	/* Sync and wait on the venus core to initialize first.
+	 * If we manage to acquire the sync_lock here it means
+	 * that the venus_probe() finished running */
+	ret = mutex_trylock(&core->sync_lock);
+	if (!ret) {
+		return -EPROBE_DEFER;
+	} else {
+		if (core->state != CORE_INIT) {
+			ret = -ENODEV;
+			goto err_core_unlock;
+		}
+	}
+
 	platform_set_drvdata(pdev, core);
 
 	if (core->pm_ops->vdec_get) {
 		ret = core->pm_ops->vdec_get(dev);
 		if (ret)
-			return ret;
+			goto err_core_unlock;
 	}
 
 	vdev = video_device_alloc();
-	if (!vdev)
-		return -ENOMEM;
+	if (!vdev) {
+		ret = -ENOMEM;
+		goto err_core_unlock;
+	}
 
 	strscpy(vdev->name, "qcom-venus-decoder", sizeof(vdev->name));
 	vdev->release = video_device_release;
@@ -1737,11 +1752,14 @@ static int vdec_probe(struct platform_device *pdev)
 	pm_runtime_set_autosuspend_delay(dev, 2000);
 	pm_runtime_use_autosuspend(dev);
 	pm_runtime_enable(dev);
+	mutex_unlock(&core->sync_lock);
 
 	return 0;
 
 err_vdev_release:
 	video_device_release(vdev);
+err_core_unlock:
+	mutex_unlock(&core->sync_lock);
 	return ret;
 }
 
diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
index 84bafc3118cc..adb7ba14bc2a 100644
--- a/drivers/media/platform/qcom/venus/venc.c
+++ b/drivers/media/platform/qcom/venus/venc.c
@@ -1436,17 +1436,32 @@ static int venc_probe(struct platform_device *pdev)
 	if (!core)
 		return -EPROBE_DEFER;
 
+	/* Sync and wait on the venus core to initialize first.
+	 * If we manage to acquire the sync_lock here it means
+	 * that the venus_probe() finished running */
+	ret = mutex_trylock(&core->sync_lock);
+	if (!ret) {
+		return -EPROBE_DEFER;
+	} else {
+		if (core->state != CORE_INIT) {
+			ret = -ENODEV;
+			goto err_core_unlock;
+		}
+	}
+
 	platform_set_drvdata(pdev, core);
 
 	if (core->pm_ops->venc_get) {
 		ret = core->pm_ops->venc_get(dev);
 		if (ret)
-			return ret;
+			goto err_core_unlock;
 	}
 
 	vdev = video_device_alloc();
-	if (!vdev)
-		return -ENOMEM;
+	if (!vdev) {
+		ret = -ENOMEM;
+		goto err_core_unlock;
+	}
 
 	strscpy(vdev->name, "qcom-venus-encoder", sizeof(vdev->name));
 	vdev->release = video_device_release;
@@ -1467,11 +1482,14 @@ static int venc_probe(struct platform_device *pdev)
 	pm_runtime_set_autosuspend_delay(dev, 2000);
 	pm_runtime_use_autosuspend(dev);
 	pm_runtime_enable(dev);
+	mutex_unlock(&core->sync_lock);
 
 	return 0;
 
 err_vdev_release:
 	video_device_release(vdev);
+err_core_unlock:
+	mutex_unlock(&core->sync_lock);
 	return ret;
 }
 
-- 
2.33.1

