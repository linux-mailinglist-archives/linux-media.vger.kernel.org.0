Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5DD7E2AF3DE
	for <lists+linux-media@lfdr.de>; Wed, 11 Nov 2020 15:40:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727308AbgKKOkZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Nov 2020 09:40:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727083AbgKKOic (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Nov 2020 09:38:32 -0500
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC3A0C061A04
        for <linux-media@vger.kernel.org>; Wed, 11 Nov 2020 06:38:25 -0800 (PST)
Received: by mail-wr1-x444.google.com with SMTP id 33so2748083wrl.7
        for <linux-media@vger.kernel.org>; Wed, 11 Nov 2020 06:38:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=0wZVM3xTH0rIlT8FcnVb9p0qtohia4y51yWQ3iwO6GE=;
        b=RlEFTHP8vmaXYUOiuFwsUx3f5yXYa4g1nViurvjIWCCsjb5FcrTms+0V4N/40jOC3e
         E8h2ZGscS5N5sLWUzfPCDdbCgfKIZ9uGbS+JMjA/ekvNSYu/77CAUSx+VtEJUnMm7l7+
         9hbZdB27+ZpQID+qEcIAaue0h5c5dL4cMa7PRLI0PWZ5waoq5xLOWsJmCc8weFbpMUXQ
         qwE2AIUHP3MVGb2a6Y8OhIg7alUEkSE2IdoZWwHsSx1Qk5Wbxjbu6zrK2vKV+46N8uv4
         5v5gC4o9/Csshq31Znz4/i+Til1zX9EanBktZOG47gD8sSv7d7KD0NylmfrEkzKQO/ej
         gD9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=0wZVM3xTH0rIlT8FcnVb9p0qtohia4y51yWQ3iwO6GE=;
        b=Lpa/kdPd29OUXrXGI0pBKaTwUTDi2jhyZYQDx3ZsTVrKYU1vrgwp1mLCk5jVcQoNfu
         fB2pkkwY63Ln6WjLjIzJjPuipgr/gdZPWRWZUAAjpzY8eGcpeZ+3TiiY7pmvzdgIOeza
         XtZ+XI8ZvTC4nQVFLQoSkAr+FvohV9G/WCRnzA7FsJqIFr3zkGaBDpH3EOayhCrY6d8Q
         vZg1mVw6bZauTRyRdyQV8qcidROBPtq8qxRxC8cMRDDa0y52rXijksIzJHDzVUBJ5mJS
         BKT79cgJUiVOpvWqKQoSIBEyBgrm4sa+U9zVtOIhnrVfNepyGwleyFXL5FkTO5np4oyr
         6pwA==
X-Gm-Message-State: AOAM530TPcgeRR1Tl2qKP9aZ9MqVlksTGDse3GbrR4qJBkOV19rXMvON
        B2PseVxF/F0780c16v0bzF3ziy4EoYrLqfWX
X-Google-Smtp-Source: ABdhPJyPYETqXXhsVmRZfJ5Pt9yt3ddqGh1MaLix9oNs2HvJ1kC7q2qq4bbPe84i1UWicrakUwT0OQ==
X-Received: by 2002:a5d:42c9:: with SMTP id t9mr16483576wrr.13.1605105504516;
        Wed, 11 Nov 2020 06:38:24 -0800 (PST)
Received: from localhost.localdomain (hst-221-89.medicom.bg. [84.238.221.89])
        by smtp.gmail.com with ESMTPSA id b8sm2991405wrv.57.2020.11.11.06.38.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2020 06:38:23 -0800 (PST)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Vikash Garodia <vgarodia@codeaurora.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Fritz Koenig <frkoenig@chromium.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v2 1/8] venus: hfi: Use correct state in unload resources
Date:   Wed, 11 Nov 2020 16:37:48 +0200
Message-Id: <20201111143755.24541-2-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201111143755.24541-1-stanimir.varbanov@linaro.org>
References: <20201111143755.24541-1-stanimir.varbanov@linaro.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

INST_RELEASE_RESOURCES state is set but not used, correct this
by enter into INIT state once the unload resources is done.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/media/platform/qcom/venus/hfi.c | 2 +-
 drivers/media/platform/qcom/venus/hfi.h | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/hfi.c b/drivers/media/platform/qcom/venus/hfi.c
index 638ed5cfe05e..4c87228e8e1d 100644
--- a/drivers/media/platform/qcom/venus/hfi.c
+++ b/drivers/media/platform/qcom/venus/hfi.c
@@ -388,7 +388,7 @@ int hfi_session_unload_res(struct venus_inst *inst)
 	if (ret)
 		return ret;
 
-	inst->state = INST_RELEASE_RESOURCES;
+	inst->state = INST_INIT;
 
 	return 0;
 }
diff --git a/drivers/media/platform/qcom/venus/hfi.h b/drivers/media/platform/qcom/venus/hfi.h
index f25d412d6553..e9c944271cc1 100644
--- a/drivers/media/platform/qcom/venus/hfi.h
+++ b/drivers/media/platform/qcom/venus/hfi.h
@@ -87,7 +87,6 @@ struct hfi_event_data {
 #define INST_LOAD_RESOURCES			4
 #define INST_START				5
 #define INST_STOP				6
-#define INST_RELEASE_RESOURCES			7
 
 struct venus_core;
 struct venus_inst;
-- 
2.17.1

