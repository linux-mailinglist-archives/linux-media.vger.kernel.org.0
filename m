Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA474233132
	for <lists+linux-media@lfdr.de>; Thu, 30 Jul 2020 13:47:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727994AbgG3Lr1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Jul 2020 07:47:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727978AbgG3Lr0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Jul 2020 07:47:26 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 321BDC0619D4
        for <linux-media@vger.kernel.org>; Thu, 30 Jul 2020 04:47:25 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id k8so5935370wma.2
        for <linux-media@vger.kernel.org>; Thu, 30 Jul 2020 04:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=YqqkwlyeTqm8wK7NZ5whyaJb7lnPkkqR0DOowlryp8Y=;
        b=jzg2hwb9COuCcPenG5X/xHPyQOHLNtf2QtJlU5FLwtZ+lLCbvchX7MVPqmY9XTj1DR
         tRl3OzzMxFCFPudy4ugU7ga6eYI342MheKypEiZkx/8CSk0c/Tngm8E9MbE0dCThXxD4
         FjQqLDapoxF6GgrBJijQ0//pN/MygWlG1bwdZdl9mV6LIsCwo/0d6NrLjPw1x4GnPInl
         gxvpccHvhUKBcOTZo5VkRx+FBgtM1IdpJ3F2CYv+S7eWTiGbJVDzsGNTVllBinqruSVh
         oVxOqvPFUcEQ8mDpT9DxVg38lK1sHBL/8p++zg00HL/+Quj3n7j6qNU5Cyqj0Lakd2dI
         8m+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=YqqkwlyeTqm8wK7NZ5whyaJb7lnPkkqR0DOowlryp8Y=;
        b=b5KoVhca/ePQsBCkTgDHzJca4eog7lm3LHKGe/cJutUjpzw9lpWCvwIDPHmnH9e3+R
         UWXj3fEdF5nhkk09g58heFHaCgHi+fqEHaosYFByoDtM7xnoUlgVEUTB+KivNFzET8V/
         j4947VstYqG8zmXPViOZ+cpG2G2dWHzTZfw3+XtW2Nu1kFyCHXQCvqYX1uj/afH/Gax6
         OxpmuAS6YkRWcvhXvxp4LV+Ac8FER3Ex6fPd+jJG1M7bmBJsUkuM7gUO0y8BOgip6bIr
         udQy2aIU4XopkCcYCICBmxZirZsBKR9O040EdG2Z117YouvGKHej6gjXZfQ7y6+qs8dt
         3BsQ==
X-Gm-Message-State: AOAM532+7jRfQMTiuGskHuOlSMhtPHmkSWM4BWsOrX+EpO2hATa4svrI
        4SWI5YBfTvOqOwhh8tIRsWkqA2piJghJYg==
X-Google-Smtp-Source: ABdhPJy9g940Q1pXeQGLiZfG7tJ8qlcU4WWpYKS4Aod14FqDcb5Wep+xaCrl5hCoXwC4qbhs2S0BZw==
X-Received: by 2002:a1c:6289:: with SMTP id w131mr4902033wmb.41.1596109643689;
        Thu, 30 Jul 2020 04:47:23 -0700 (PDT)
Received: from localhost.localdomain ([195.24.90.54])
        by smtp.gmail.com with ESMTPSA id 32sm9636691wrn.86.2020.07.30.04.47.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2020 04:47:23 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH 3/3] venus: Add new interface queues reinit
Date:   Thu, 30 Jul 2020 14:46:32 +0300
Message-Id: <20200730114632.6717-4-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200730114632.6717-1-stanimir.varbanov@linaro.org>
References: <20200730114632.6717-1-stanimir.varbanov@linaro.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Presently the recovery mechanism is using two hfi functions
to destroy and create interface queues. For the purpose of
recovery we don't need to free and allocate the memory used
for interface message queues, that's why we introduce new
function which just reinit the queues.  Also this will give
to the recovery procedure one less reason to fail (if for
some reason we couldn't allocate memory).

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/media/platform/qcom/venus/core.c      |  3 +-
 drivers/media/platform/qcom/venus/hfi.c       |  5 ++
 drivers/media/platform/qcom/venus/hfi.h       |  1 +
 drivers/media/platform/qcom/venus/hfi_venus.c | 51 +++++++++++++++++++
 drivers/media/platform/qcom/venus/hfi_venus.h |  1 +
 5 files changed, 59 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 46f6e34d435a..eda8f35425df 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -72,8 +72,7 @@ static void venus_sys_error_handler(struct work_struct *work)
 	while (core->pmdomains[0] && pm_runtime_active(core->pmdomains[0]))
 		usleep_range(1000, 1500);
 
-	hfi_destroy(core);
-	ret |= hfi_create(core, &venus_core_ops);
+	hfi_reinit(core);
 
 	pm_runtime_get_sync(core->dev);
 
diff --git a/drivers/media/platform/qcom/venus/hfi.c b/drivers/media/platform/qcom/venus/hfi.c
index a211eb93e0f9..a59022adb14c 100644
--- a/drivers/media/platform/qcom/venus/hfi.c
+++ b/drivers/media/platform/qcom/venus/hfi.c
@@ -517,3 +517,8 @@ void hfi_destroy(struct venus_core *core)
 {
 	venus_hfi_destroy(core);
 }
+
+void hfi_reinit(struct venus_core *core)
+{
+	venus_hfi_queues_reinit(core);
+}
diff --git a/drivers/media/platform/qcom/venus/hfi.h b/drivers/media/platform/qcom/venus/hfi.h
index 62c315291484..f25d412d6553 100644
--- a/drivers/media/platform/qcom/venus/hfi.h
+++ b/drivers/media/platform/qcom/venus/hfi.h
@@ -145,6 +145,7 @@ struct hfi_ops {
 
 int hfi_create(struct venus_core *core, const struct hfi_core_ops *ops);
 void hfi_destroy(struct venus_core *core);
+void hfi_reinit(struct venus_core *core);
 
 int hfi_core_init(struct venus_core *core);
 int hfi_core_deinit(struct venus_core *core, bool blocking);
diff --git a/drivers/media/platform/qcom/venus/hfi_venus.c b/drivers/media/platform/qcom/venus/hfi_venus.c
index 3392fd177d22..90067cd8c892 100644
--- a/drivers/media/platform/qcom/venus/hfi_venus.c
+++ b/drivers/media/platform/qcom/venus/hfi_venus.c
@@ -1603,3 +1603,54 @@ int venus_hfi_create(struct venus_core *core)
 	core->ops = NULL;
 	return ret;
 }
+
+void venus_hfi_queues_reinit(struct venus_core *core)
+{
+	struct venus_hfi_device *hdev = to_hfi_priv(core);
+	struct hfi_queue_table_header *tbl_hdr;
+	struct iface_queue *queue;
+	struct hfi_sfr *sfr;
+	unsigned int i;
+
+	mutex_lock(&hdev->lock);
+
+	for (i = 0; i < IFACEQ_NUM; i++) {
+		queue = &hdev->queues[i];
+		queue->qhdr =
+			IFACEQ_GET_QHDR_START_ADDR(hdev->ifaceq_table.kva, i);
+
+		venus_set_qhdr_defaults(queue->qhdr);
+
+		queue->qhdr->start_addr = queue->qmem.da;
+
+		if (i == IFACEQ_CMD_IDX)
+			queue->qhdr->type |= HFI_HOST_TO_CTRL_CMD_Q;
+		else if (i == IFACEQ_MSG_IDX)
+			queue->qhdr->type |= HFI_CTRL_TO_HOST_MSG_Q;
+		else if (i == IFACEQ_DBG_IDX)
+			queue->qhdr->type |= HFI_CTRL_TO_HOST_DBG_Q;
+	}
+
+	tbl_hdr = hdev->ifaceq_table.kva;
+	tbl_hdr->version = 0;
+	tbl_hdr->size = IFACEQ_TABLE_SIZE;
+	tbl_hdr->qhdr0_offset = sizeof(struct hfi_queue_table_header);
+	tbl_hdr->qhdr_size = sizeof(struct hfi_queue_header);
+	tbl_hdr->num_q = IFACEQ_NUM;
+	tbl_hdr->num_active_q = IFACEQ_NUM;
+
+	/*
+	 * Set receive request to zero on debug queue as there is no
+	 * need of interrupt from video hardware for debug messages
+	 */
+	queue = &hdev->queues[IFACEQ_DBG_IDX];
+	queue->qhdr->rx_req = 0;
+
+	sfr = hdev->sfr.kva;
+	sfr->buf_size = ALIGNED_SFR_SIZE;
+
+	/* ensure table and queue header structs are settled in memory */
+	wmb();
+
+	mutex_unlock(&hdev->lock);
+}
diff --git a/drivers/media/platform/qcom/venus/hfi_venus.h b/drivers/media/platform/qcom/venus/hfi_venus.h
index 57154832090e..1b656ef2bf07 100644
--- a/drivers/media/platform/qcom/venus/hfi_venus.h
+++ b/drivers/media/platform/qcom/venus/hfi_venus.h
@@ -10,5 +10,6 @@ struct venus_core;
 
 void venus_hfi_destroy(struct venus_core *core);
 int venus_hfi_create(struct venus_core *core);
+void venus_hfi_queues_reinit(struct venus_core *core);
 
 #endif
-- 
2.17.1

