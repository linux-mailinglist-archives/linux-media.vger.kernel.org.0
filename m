Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC5454398EA
	for <lists+linux-media@lfdr.de>; Mon, 25 Oct 2021 16:44:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233083AbhJYOqe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 Oct 2021 10:46:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232866AbhJYOqd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Oct 2021 10:46:33 -0400
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 148B1C061745
        for <linux-media@vger.kernel.org>; Mon, 25 Oct 2021 07:44:11 -0700 (PDT)
Received: by mail-pg1-x533.google.com with SMTP id s136so11157582pgs.4
        for <linux-media@vger.kernel.org>; Mon, 25 Oct 2021 07:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7nWtBZUACjwks83t/CbzMB0IKdyuj93VnZG1s4Wg6K4=;
        b=VNxJvSFI1z9qQSTztSflwy5b4APSzJ6zu0h2rpD72QkaqpDQwYSGVAeftoBVDWBoWM
         e4ugOwzxUYBaigWTGpdx8rzvA5eUA/Eb0b6O7aeO4evVs32HPPHiSzyiVHwnaCfzYhBd
         83gh6PQy/cl9OWdc1d6Y4I7BKtJKauMm3m4h+I35PqQmeGg758S9JVycxYvjW2XmcIoE
         N1oy52LRHbbE50MupYHtW+9htJvmYZIugDg3BOOFY4eqrnvy+AkTPrnW5l0tZhmijm/Z
         zJmpdV9imijlRWX8ON6ZEd9HnYd4/XiM4r2i3BxnZuyEJ+rAfx4l1SR0ViZqnJMmmlAQ
         U6lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7nWtBZUACjwks83t/CbzMB0IKdyuj93VnZG1s4Wg6K4=;
        b=Wnd12iOL+Zcpj/k41qP0O/EGJgfUY2ooojmrMCi1EhRVH2HLAg9I1HKuRojDpFuwbR
         QyQ3/jrNklJe5nA6uIMl/sWiY6qXyqxHXVjo7Dg82sJvPfYKZtUmOLY/OFNhmcn2JYAT
         i/UXRoflu/otQX4e4s7RiH6DLN6BUkoSQPLMTA82Cm7SC9QutFaqgsJGsHin7BaU9oXo
         +q/iwDu0uS9ZoruWWvUTX3jqiG8y22ZoEo9Amj7SNDkwNcUZtYhx1CkqBy/cUVrQUFlU
         Sh0ilwF4auzk56IHdcRupRGBKMO+MJQS+F4x4LXU0RpuqFcDRJFdJdpCDHBVVA6Yc21C
         ROpg==
X-Gm-Message-State: AOAM533sm8QTnWmqEvHy/T0VcPMuA2fj/8CGvdKpnFiZlbRXHyV4oEpk
        OS3q3hNN9PvnS6/Szg5NWDQe4w==
X-Google-Smtp-Source: ABdhPJyDCXbOk5f2duwNws5Luz2UQWlwQAtLGm2Utu2xjATqYpebx8rWy1uqoaThvXsLfeTc4dJgxw==
X-Received: by 2002:a63:35cd:: with SMTP id c196mr11793848pga.284.1635173050457;
        Mon, 25 Oct 2021 07:44:10 -0700 (PDT)
Received: from localhost.localdomain ([50.39.160.154])
        by smtp.gmail.com with ESMTPSA id f9sm7074977pfv.43.2021.10.25.07.44.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Oct 2021 07:44:09 -0700 (PDT)
From:   Tadeusz Struk <tadeusz.struk@linaro.org>
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Andy Gross <agross@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        John Stultz <john.stultz@linaro.org>,
        Tadeusz Struk <tadeusz.struk@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] media: venus: Synchronize probe() between venus_core and enc/dec
Date:   Mon, 25 Oct 2021 07:43:45 -0700
Message-Id: <20211025144345.267107-1-tadeusz.struk@linaro.org>
X-Mailer: git-send-email 2.31.1
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

Signed-off-by: Tadeusz Struk <tadeusz.struk@linaro.org>
---
 drivers/media/platform/qcom/venus/core.c |  6 ++++++
 drivers/media/platform/qcom/venus/core.h |  2 ++
 drivers/media/platform/qcom/venus/vdec.c | 18 +++++++++++++++---
 drivers/media/platform/qcom/venus/venc.c | 18 +++++++++++++++---
 4 files changed, 38 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 91b15842c555..18f3e3a9823f 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -317,6 +317,7 @@ static int venus_probe(struct platform_device *pdev)
 
 	INIT_LIST_HEAD(&core->instances);
 	mutex_init(&core->lock);
+	mutex_init(&core->sync_lock);
 	INIT_DELAYED_WORK(&core->work, venus_sys_error_handler);
 
 	ret = devm_request_threaded_irq(dev, core->irq, hfi_isr, hfi_isr_thread,
@@ -331,6 +332,8 @@ static int venus_probe(struct platform_device *pdev)
 
 	venus_assign_register_offsets(core);
 
+	mutex_lock(&core->sync_lock);
+
 	ret = v4l2_device_register(dev, &core->v4l2_dev);
 	if (ret)
 		goto err_core_deinit;
@@ -377,6 +380,7 @@ static int venus_probe(struct platform_device *pdev)
 		goto err_dev_unregister;
 	}
 
+	mutex_unlock(&core->sync_lock);
 	venus_dbgfs_init(core);
 
 	return 0;
@@ -392,6 +396,7 @@ static int venus_probe(struct platform_device *pdev)
 	hfi_destroy(core);
 err_core_deinit:
 	hfi_core_deinit(core, false);
+	mutex_unlock(&core->sync_lock);
 err_core_put:
 	if (core->pm_ops->core_put)
 		core->pm_ops->core_put(core);
@@ -428,6 +433,7 @@ static int venus_remove(struct platform_device *pdev)
 
 	mutex_destroy(&core->pm_lock);
 	mutex_destroy(&core->lock);
+	mutex_destroy(&core->sync_lock);
 	venus_dbgfs_deinit(core);
 
 	return ret;
diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index 5ec851115eca..3f80dc26febb 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -119,6 +119,7 @@ struct venus_format {
  * @use_tz:	a flag that suggests presence of trustzone
  * @fw:		structure of firmware parameters
  * @lock:	a lock for this strucure
+ * @sync_lock	a lock for probe sync between venus_core and venus_enc/dec
  * @instances:	a list_head of all instances
  * @insts_count:	num of instances
  * @state:	the state of the venus core
@@ -176,6 +177,7 @@ struct venus_core {
 		size_t mem_size;
 	} fw;
 	struct mutex lock;
+	struct mutex sync_lock;
 	struct list_head instances;
 	atomic_t insts_count;
 	unsigned int state;
diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index 198e47eb63f4..9dbda3d7a2d2 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -1659,17 +1659,26 @@ static int vdec_probe(struct platform_device *pdev)
 	if (!core)
 		return -EPROBE_DEFER;
 
+	mutex_lock(&core->sync_lock);
+
+	if (core->state != CORE_INIT) {
+		ret = -ENODEV;
+		goto err_core_unlock;
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
@@ -1690,11 +1699,14 @@ static int vdec_probe(struct platform_device *pdev)
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
index bc1c42dd53c0..e7439236385a 100644
--- a/drivers/media/platform/qcom/venus/venc.c
+++ b/drivers/media/platform/qcom/venus/venc.c
@@ -1338,17 +1338,26 @@ static int venc_probe(struct platform_device *pdev)
 	if (!core)
 		return -EPROBE_DEFER;
 
+	mutex_lock(&core->sync_lock);
+
+	if (core->state != CORE_INIT) {
+		ret = -ENODEV;
+		goto err_core_unlock;
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
@@ -1367,11 +1376,14 @@ static int venc_probe(struct platform_device *pdev)
 
 	video_set_drvdata(vdev, core);
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
2.31.1

