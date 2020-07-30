Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 148E523312F
	for <lists+linux-media@lfdr.de>; Thu, 30 Jul 2020 13:47:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727976AbgG3LrY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Jul 2020 07:47:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727873AbgG3LrW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Jul 2020 07:47:22 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17367C0619D4
        for <linux-media@vger.kernel.org>; Thu, 30 Jul 2020 04:47:22 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id t14so742329wmi.3
        for <linux-media@vger.kernel.org>; Thu, 30 Jul 2020 04:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=LWt2SD9BmU5MUG0bfq/HT/GSXil7yqUtBapdyAmDpx0=;
        b=jBo2saLDBGJvI+FbAVmxTQ+JCljGmhEYfNgRnHKXdJBPSecTUcAuY9msJm2ywtehtb
         nkdQboZilXVJ4otJI5uKQa1pW7H5YHoaZOArobwcODMa5sSDKkugrbZLg6CmCdVROBgt
         UfjLzh46Ppkm/6BlneR7KNbDuvLPSQuPfGW67cBlz1/742k28f+0UO37SRyDIYDBEpfL
         NRukNVkrDj31x7ABt2WEBxz7tK06VBPmyazflTiiSPDV/r0E3x4gcwFj/4vbTSKG7OYS
         xhKaSQKfwKeqD1QOc8Rc1l3f+dvKwtnQ3orlYje6puTR1/FJmU0rbXEsvaGqwBG4HeeI
         3yDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=LWt2SD9BmU5MUG0bfq/HT/GSXil7yqUtBapdyAmDpx0=;
        b=Ib3i1s9kmcN4Cg736HXwQbB/I8Ar/dfQ8RMFh0WXcJi4vsa0zt2Yt1q+t1UGraLjR2
         8zlUDFa3uAdkl0tdpWU14tKVzWI4ehybyP6tvv3V0S1RckZT+umd2ZfBjT4FCL2R6rgI
         aRuPUOoHetTdwI5S9dtgLoQ3GLOxmrryJSFXw4EmzUqR8E5ziG8sJH5dHpENFgrweG4f
         MCFUPC97OY3A6C0qKnAq6bf/T2e3jroXqZ6Gtje/KzeW2z8qiYQf/qyyIdJxHVM+ALD8
         Ddwgro3qLaZeDLSTDLMIbiWSj6yI2rf2FkQhxp1Yq3+X/0DdRUQ0Ohygc7wnswBNRCI5
         jUGA==
X-Gm-Message-State: AOAM532CvYTT5Ooc5kNB5xUXm7HD+q0KsdmxBMwtxmD72/+9h81YByaX
        F/nWWTDFofP2WmG/U/OxggFHAOmOeMOy0Q==
X-Google-Smtp-Source: ABdhPJy39PpVFdhGdsMZUAjDwr9YE8Cu0METZPN3g0qDfmM2uQfhs+fzdOOOZgq4ZSK0k8el4r84ng==
X-Received: by 2002:a7b:c0c8:: with SMTP id s8mr13525676wmh.4.1596109640545;
        Thu, 30 Jul 2020 04:47:20 -0700 (PDT)
Received: from localhost.localdomain ([195.24.90.54])
        by smtp.gmail.com with ESMTPSA id 32sm9636691wrn.86.2020.07.30.04.47.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2020 04:47:20 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH 2/3] venus: Rework recovery mechanism
Date:   Thu, 30 Jul 2020 14:46:31 +0300
Message-Id: <20200730114632.6717-3-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200730114632.6717-1-stanimir.varbanov@linaro.org>
References: <20200730114632.6717-1-stanimir.varbanov@linaro.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

After power domains and clock restructuring the recovery for
sdm845 and v4 did not work properly. Fix that by reworking the
recovery function and the sequence.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/media/platform/qcom/venus/core.c      | 24 ++++++++++---------
 drivers/media/platform/qcom/venus/hfi_venus.c | 11 ---------
 2 files changed, 13 insertions(+), 22 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 203c6538044f..46f6e34d435a 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -6,6 +6,7 @@
 #include <linux/init.h>
 #include <linux/interconnect.h>
 #include <linux/ioctl.h>
+#include <linux/delay.h>
 #include <linux/list.h>
 #include <linux/module.h>
 #include <linux/of_device.h>
@@ -40,13 +41,7 @@ static void venus_event_notify(struct venus_core *core, u32 event)
 	mutex_unlock(&core->lock);
 
 	disable_irq_nosync(core->irq);
-
-	/*
-	 * Delay recovery to ensure venus has completed any pending cache
-	 * operations. Without this sleep, we see device reset when firmware is
-	 * unloaded after a system error.
-	 */
-	schedule_delayed_work(&core->work, msecs_to_jiffies(100));
+	schedule_delayed_work(&core->work, msecs_to_jiffies(10));
 }
 
 static const struct hfi_core_ops venus_core_ops = {
@@ -59,23 +54,30 @@ static void venus_sys_error_handler(struct work_struct *work)
 			container_of(work, struct venus_core, work.work);
 	int ret = 0;
 
-	dev_warn(core->dev, "system error has occurred, starting recovery!\n");
-
 	pm_runtime_get_sync(core->dev);
 
 	hfi_core_deinit(core, true);
-	hfi_destroy(core);
+
+	dev_warn(core->dev, "system error has occurred, starting recovery!\n");
+
 	mutex_lock(&core->lock);
+
+	while (pm_runtime_active(core->dev_dec) || pm_runtime_active(core->dev_enc))
+		msleep(10);
+
 	venus_shutdown(core);
 
 	pm_runtime_put_sync(core->dev);
 
+	while (core->pmdomains[0] && pm_runtime_active(core->pmdomains[0]))
+		usleep_range(1000, 1500);
+
+	hfi_destroy(core);
 	ret |= hfi_create(core, &venus_core_ops);
 
 	pm_runtime_get_sync(core->dev);
 
 	ret |= venus_boot(core);
-
 	ret |= hfi_core_resume(core, true);
 
 	enable_irq(core->irq);
diff --git a/drivers/media/platform/qcom/venus/hfi_venus.c b/drivers/media/platform/qcom/venus/hfi_venus.c
index 0d8855014ab3..3392fd177d22 100644
--- a/drivers/media/platform/qcom/venus/hfi_venus.c
+++ b/drivers/media/platform/qcom/venus/hfi_venus.c
@@ -986,13 +986,6 @@ static void venus_process_msg_sys_error(struct venus_hfi_device *hdev,
 
 	venus_set_state(hdev, VENUS_STATE_DEINIT);
 
-	/*
-	 * Once SYS_ERROR received from HW, it is safe to halt the AXI.
-	 * With SYS_ERROR, Venus FW may have crashed and HW might be
-	 * active and causing unnecessary transactions. Hence it is
-	 * safe to stop all AXI transactions from venus subsystem.
-	 */
-	venus_halt_axi(hdev);
 	venus_sfr_print(hdev);
 }
 
@@ -1009,10 +1002,6 @@ static irqreturn_t venus_isr_thread(struct venus_core *core)
 	res = hdev->core->res;
 	pkt = hdev->pkt_buf;
 
-	if (hdev->irq_status & WRAPPER_INTR_STATUS_A2HWD_MASK) {
-		venus_sfr_print(hdev);
-		hfi_process_watchdog_timeout(core);
-	}
 
 	while (!venus_iface_msgq_read(hdev, pkt)) {
 		msg_ret = hfi_process_msg_packet(core, pkt);
-- 
2.17.1

