Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F907440510
	for <lists+linux-media@lfdr.de>; Fri, 29 Oct 2021 23:48:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230355AbhJ2VvO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 29 Oct 2021 17:51:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230388AbhJ2VvO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 29 Oct 2021 17:51:14 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27326C061570
        for <linux-media@vger.kernel.org>; Fri, 29 Oct 2021 14:48:45 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id lx5-20020a17090b4b0500b001a262880e99so8215407pjb.5
        for <linux-media@vger.kernel.org>; Fri, 29 Oct 2021 14:48:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tH2VxMNE57TdLEF3kW+TiG1gJ6kup105nAHpfo4aRjQ=;
        b=TqniMd9OC92oUbuWR/g6EGqJ1CKCwfAnTa3gdJtlNqh2ifMDoy8rXHHgA1VEnsAM2u
         oXAlcL/cxzEQnM456GfsaCoopmfdW6yJPVBPuyO7i0VDbzIJrloUnClIWmT/4z10P7C4
         bZxv4OEoA1R/ajWdEAoCB/eJxYKGL6UkXsw23XPswJ7a3jCXNze3xV4dfiKZRCRc4mI0
         nWgq3pSmh56roF0tDyIQeOoepWE3dU+1cN/osj6VKO0YVljAus6C6PpKKUgaQehdoE+o
         vskLAbRM+nMF7uQHUENtcBtHmU4gnNFZ51KcBvh0jEnHHXVuIztcfaf/NgivXCg3hNh4
         7a1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tH2VxMNE57TdLEF3kW+TiG1gJ6kup105nAHpfo4aRjQ=;
        b=W1qq/PkFVgMp+0/PqARauJEvTkrWeafNm1xQjoPr/cxFihn/3ekVhJtHJhmfEEBF0/
         5ahNfsBVP2dgzwmXzBYkP6W/N8weN9OJDi4ll9MoXK1pdLU6tPUqWWA6Hbc91O4k20bv
         RgU1Ju65gnl6VMJMSSo4Dpu8yPbqMnpyN70JlMlQLz8i0QCANw69BMW8kpc6roi6leC+
         zJwDEXdTtyEoWolPLC3ihNoPdP75zWQVyDhQrhISfBVOMX2LAfMpLlFnGzDyuvT3SNvc
         aeM9pGLQnrR/1jVSUxjzLFxSRENGgBDCKaj9TXEboLwu13GJu0c8nYuziDuVIQ69VJh2
         EVbQ==
X-Gm-Message-State: AOAM5331B/R3mULilipHe1w95C2sxpFlyWGStPTOia6Wk5BJd0+2Fpze
        gOL7eKBg+2F+9uj48Tj+8yA/Pw==
X-Google-Smtp-Source: ABdhPJwCns8yC5srsgHdScGYyLEOnZYnmQHhX8VvGSb7OGvONMFiXAfMV+cS/yWveArTZ4WleLCEzg==
X-Received: by 2002:a17:90a:4b85:: with SMTP id i5mr22824096pjh.25.1635544124607;
        Fri, 29 Oct 2021 14:48:44 -0700 (PDT)
Received: from localhost.localdomain ([50.39.160.154])
        by smtp.gmail.com with ESMTPSA id om13sm12214469pjb.12.2021.10.29.14.48.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Oct 2021 14:48:44 -0700 (PDT)
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
Subject: [PATCH v2] media: venus: Synchronize probe() between venus_core and enc/dec
Date:   Fri, 29 Oct 2021 14:48:33 -0700
Message-Id: <20211029214833.2615274-1-tadeusz.struk@linaro.org>
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
index 198e47eb63f4..959e43bb6c00 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -1659,17 +1659,32 @@ static int vdec_probe(struct platform_device *pdev)
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
@@ -1690,11 +1705,14 @@ static int vdec_probe(struct platform_device *pdev)
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
index bc1c42dd53c0..11ec7bff5e3f 100644
--- a/drivers/media/platform/qcom/venus/venc.c
+++ b/drivers/media/platform/qcom/venus/venc.c
@@ -1338,17 +1338,32 @@ static int venc_probe(struct platform_device *pdev)
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
@@ -1367,11 +1382,14 @@ static int venc_probe(struct platform_device *pdev)
 
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

