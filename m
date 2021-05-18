Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FF3E387CB9
	for <lists+linux-media@lfdr.de>; Tue, 18 May 2021 17:46:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350362AbhERPro (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 May 2021 11:47:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350317AbhERPqv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 May 2021 11:46:51 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 429C3C06138C
        for <linux-media@vger.kernel.org>; Tue, 18 May 2021 08:45:27 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id l1so15320603ejb.6
        for <linux-media@vger.kernel.org>; Tue, 18 May 2021 08:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3eQT5w75rkSKr8V4Rzzvpp/1P0SvKsxN/0nHM1tgGJI=;
        b=rRhgP9UZQiEtb6v8BAdYyzo30YdvcIFku8IRRd3mkNvNFcE+EWF6QZTLqsz9OdbMU7
         GVvvDahRMVIt3nHGMgTIfO85NVc+TZIwj2mEvs4hJxiAv1cswxOu/w0dil0C5nAcDmJm
         4QS3Jzp4KbQ/P2eQPLlwfADa15l/P9Sw4WZBfHhCd4fy1CoIkuAT/B+UlloP5rTVaGSR
         WRv2YMGSOIQ20WwAiQ6yO2JKzb8ZCnBrjXq9XQ+f5yzKqZyaXadWauEQAL4FvBIzGUnL
         YGjcdJZ4d28Pt+weEaWL2rLlQsjDUNPUycz3ThX+wPIud59ceeZ5wS6mQAR81WMakib/
         E0GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3eQT5w75rkSKr8V4Rzzvpp/1P0SvKsxN/0nHM1tgGJI=;
        b=bE8O/3nzt/s7FK0QVig654wGBE3ItMLGoLa8qmhKUSREKvgmTO/wErUGg7Ab3qjTKv
         EMj+Xpd3yI6BlGRMyvuSrFctrh16WKMp9qaub7exukB3WVL86ASoi4E0D5jCc5PtOaDd
         mCO+Qyhcxc54VLyjPcH6JiLATOMTNRUPfgjgHQSv8qbeHJmi/BgTPkHBSggZjWPn1wXq
         yPTk4tDnHJRQ4aoH4xxbde/eBddaInLy9vVrvIapU0O4WOphm2w9i0nPeAc4cHQID1Hs
         j16GEsiFeuBdA5CcHkfq63k71Jti59CgQJoX+WPORTLg14/pEOlTyDboQ7HSccs/PTh2
         oD3g==
X-Gm-Message-State: AOAM5325XDyAyDkbqmfzcfJ53ralsgCn/mPJVfbPxyDqo0gnlacdk1mU
        bdApGrpps+ceFvTa96uKFL1vVpKmJCMhQW7G
X-Google-Smtp-Source: ABdhPJw5mfRC4RqCLaY7aOa1qIS00rxJ82fYMuX6Y6HHeNpienr5acBlJGILnNqzE5dPmw4MZ9IZcg==
X-Received: by 2002:a17:906:7c82:: with SMTP id w2mr6796433ejo.448.1621352725704;
        Tue, 18 May 2021 08:45:25 -0700 (PDT)
Received: from localhost.localdomain ([195.24.90.54])
        by smtp.gmail.com with ESMTPSA id n17sm13016434eds.72.2021.05.18.08.45.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 May 2021 08:45:25 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Vikash Garodia <vgarodia@codeaurora.org>,
        Mansur Alisha Shaik <mansur@codeaurora.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH 2/5] venus: Make sys_error flag an atomic bitops
Date:   Tue, 18 May 2021 18:45:06 +0300
Message-Id: <20210518154509.602137-3-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210518154509.602137-1-stanimir.varbanov@linaro.org>
References: <20210518154509.602137-1-stanimir.varbanov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Make the sys_error flag an atomic bitops in order to avoid
locking in sys_error readers.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/media/platform/qcom/venus/core.c    | 4 ++--
 drivers/media/platform/qcom/venus/core.h    | 3 ++-
 drivers/media/platform/qcom/venus/helpers.c | 2 +-
 drivers/media/platform/qcom/venus/hfi.c     | 2 +-
 drivers/media/platform/qcom/venus/vdec.c    | 2 +-
 5 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 91b15842c555..cc6195f2409c 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -65,7 +65,7 @@ static void venus_event_notify(struct venus_core *core, u32 event)
 	}
 
 	mutex_lock(&core->lock);
-	core->sys_error = true;
+	set_bit(0, &core->sys_error);
 	list_for_each_entry(inst, &core->instances, list)
 		inst->ops->event_notify(inst, EVT_SESSION_ERROR, NULL);
 	mutex_unlock(&core->lock);
@@ -161,7 +161,7 @@ static void venus_sys_error_handler(struct work_struct *work)
 	dev_warn(core->dev, "system error has occurred (recovered)\n");
 
 	mutex_lock(&core->lock);
-	core->sys_error = false;
+	clear_bit(0, &core->sys_error);
 	mutex_unlock(&core->lock);
 }
 
diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index 745f226a523f..15713209cc48 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -7,6 +7,7 @@
 #ifndef __VENUS_CORE_H_
 #define __VENUS_CORE_H_
 
+#include <linux/bitops.h>
 #include <linux/list.h>
 #include <media/videobuf2-v4l2.h>
 #include <media/v4l2-ctrls.h>
@@ -182,7 +183,7 @@ struct venus_core {
 	unsigned int state;
 	struct completion done;
 	unsigned int error;
-	bool sys_error;
+	unsigned long sys_error;
 	const struct hfi_core_ops *core_ops;
 	const struct venus_pm_ops *pm_ops;
 	struct mutex pm_lock;
diff --git a/drivers/media/platform/qcom/venus/helpers.c b/drivers/media/platform/qcom/venus/helpers.c
index b813d6dba481..de87f4c81a1c 100644
--- a/drivers/media/platform/qcom/venus/helpers.c
+++ b/drivers/media/platform/qcom/venus/helpers.c
@@ -1478,7 +1478,7 @@ void venus_helper_vb2_stop_streaming(struct vb2_queue *q)
 		ret |= venus_helper_intbufs_free(inst);
 		ret |= hfi_session_deinit(inst);
 
-		if (inst->session_error || core->sys_error)
+		if (inst->session_error || test_bit(0, &core->sys_error))
 			ret = -EIO;
 
 		if (ret)
diff --git a/drivers/media/platform/qcom/venus/hfi.c b/drivers/media/platform/qcom/venus/hfi.c
index 0f2482367e06..179b1f8b2650 100644
--- a/drivers/media/platform/qcom/venus/hfi.c
+++ b/drivers/media/platform/qcom/venus/hfi.c
@@ -214,7 +214,7 @@ int hfi_session_init(struct venus_inst *inst, u32 pixfmt)
 	 * session_init() can't pass successfully
 	 */
 	mutex_lock(&core->lock);
-	if (!core->ops || core->sys_error) {
+	if (!core->ops || test_bit(0, &inst->core->sys_error)) {
 		mutex_unlock(&core->lock);
 		return -EIO;
 	}
diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index ddb7cd39424e..132a2921902a 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -1211,7 +1211,7 @@ static void vdec_session_release(struct venus_inst *inst)
 	ret = hfi_session_deinit(inst);
 	abort = (ret && ret != -EINVAL) ? 1 : 0;
 
-	if (inst->session_error || core->sys_error)
+	if (inst->session_error || test_bit(0, &core->sys_error))
 		abort = 1;
 
 	if (abort)
-- 
2.25.1

