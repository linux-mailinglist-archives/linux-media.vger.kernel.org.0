Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B7CF2CEBB3
	for <lists+linux-media@lfdr.de>; Fri,  4 Dec 2020 11:05:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387870AbgLDKDa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Dec 2020 05:03:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387837AbgLDKD2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Dec 2020 05:03:28 -0500
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D873BC08C5F2
        for <linux-media@vger.kernel.org>; Fri,  4 Dec 2020 02:02:09 -0800 (PST)
Received: by mail-ed1-x543.google.com with SMTP id d18so5201142edt.7
        for <linux-media@vger.kernel.org>; Fri, 04 Dec 2020 02:02:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=LyeOql6QYmpd/1nhWP8WR5ehn5BlBeFQlh24gAVBRhU=;
        b=qgzeAQEaUfEMnYTzNM6py9Wnux2p0x09OoGjBhg6NOU+FMrXss1qgfQ2Uo9T7VGEFY
         16Bg01jAAwONWqA+zIP0xQdFQ+WuV9G5+CWhheMyc0v/q9uLo9HhQldX2zN2V6chcSSs
         NFQ4OVqUn8nKlV5wiYdOnU+C7sXxPsTFJXehDaoz0XvfMVi8MDhNjTnuqxKT6/GjUOpj
         5BipSy7smzfy9UHC2OpEr3RC/830bP9YW0DDPkivv2ZAoPd+i7x4Jbt/HrXKB6oWCXdI
         dcTHH0KTii8Jlnw61wrgR7lo7b6KuMu49VfvcBxEtQfd7RTrsAhboI0uD0dojTGwgNjp
         fDjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=LyeOql6QYmpd/1nhWP8WR5ehn5BlBeFQlh24gAVBRhU=;
        b=lE/cqxA+iJI+BX43qIoo1nvBLs1Ejdsl3rvW2mJyeMq4Gwvnie8aojtLN9U5CMaMM1
         foBxuQYYVwuP3zzDC0svbOwXhptUcBTaWNh4kAwCqsAaEbq7/qo/WDBU4Mvl0nTpm2QA
         xRXcS8ZgwxrMgdU6r5a0o8vlQgf6FvArr5Bv+5qOaj+13m/xU5wzCrXVcaOwmbBqJGiR
         iS8RrelK4ln+pWE2gn5Ym+wwbWykyonwj4bBXNEoxV/XqXgc9dYcr6opy7zeDld6bbF4
         mww9Myhs7ihy8yDQ4G4YcHbh9j8lslu1bUkGHV53S8WtdR5a091bZhdVk1dQ39j6BTJq
         xPXQ==
X-Gm-Message-State: AOAM531hpuLvrD3vjwVx+295pkrgXoefgvDCykMouruhnXBkVmPVNSr6
        Ile6QSF4wQBmdV08gy6ubiklYwCgRAGG08WV
X-Google-Smtp-Source: ABdhPJz/Sxg/WJbiIXiuRLe60U4NP4zuCBjEEmLjA7ER1WbD/7Lje9Cv0tsJd0eR4snOoctKKAK0DQ==
X-Received: by 2002:a50:b941:: with SMTP id m59mr6871336ede.371.1607076128347;
        Fri, 04 Dec 2020 02:02:08 -0800 (PST)
Received: from localhost.localdomain (hst-221-106.medicom.bg. [84.238.221.106])
        by smtp.gmail.com with ESMTPSA id p35sm3238242edd.58.2020.12.04.02.02.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Dec 2020 02:02:07 -0800 (PST)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     dikshita@codeaurora.org, Alexandre Courbot <acourbot@chromium.org>,
        Vikash Garodia <vgarodia@codeaurora.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v2 2/4] venus: Limit HFI sessions to the maximum supported
Date:   Fri,  4 Dec 2020 12:01:37 +0200
Message-Id: <20201204100139.6216-3-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201204100139.6216-1-stanimir.varbanov@linaro.org>
References: <20201204100139.6216-1-stanimir.varbanov@linaro.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Currently we rely on firmware to return error when we reach the maximum
supported number of sessions. But this errors are happened at reqbuf
time which is a bit later. The more reasonable way looks like is to
return the error on driver open.

To achieve that modify hfi_session_create to return error when we reach
maximum count of sessions and thus refuse open.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/media/platform/qcom/venus/core.h       |  1 +
 drivers/media/platform/qcom/venus/hfi.c        | 16 +++++++++++++---
 drivers/media/platform/qcom/venus/hfi_parser.c |  3 +++
 3 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index f03ed427accd..775d7bf6587d 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -96,6 +96,7 @@ struct venus_format {
 #define MAX_CAP_ENTRIES		32
 #define MAX_ALLOC_MODE_ENTRIES	16
 #define MAX_CODEC_NUM		32
+#define MAX_SESSIONS		16
 
 struct raw_formats {
 	u32 buftype;
diff --git a/drivers/media/platform/qcom/venus/hfi.c b/drivers/media/platform/qcom/venus/hfi.c
index 638ed5cfe05e..8786609d269e 100644
--- a/drivers/media/platform/qcom/venus/hfi.c
+++ b/drivers/media/platform/qcom/venus/hfi.c
@@ -175,6 +175,8 @@ static int wait_session_msg(struct venus_inst *inst)
 int hfi_session_create(struct venus_inst *inst, const struct hfi_inst_ops *ops)
 {
 	struct venus_core *core = inst->core;
+	bool max;
+	int ret;
 
 	if (!ops)
 		return -EINVAL;
@@ -184,11 +186,19 @@ int hfi_session_create(struct venus_inst *inst, const struct hfi_inst_ops *ops)
 	inst->ops = ops;
 
 	mutex_lock(&core->lock);
-	list_add_tail(&inst->list, &core->instances);
-	atomic_inc(&core->insts_count);
+
+	max = atomic_add_unless(&core->insts_count, 1,
+				core->max_sessions_supported);
+	if (!max) {
+		ret = -EAGAIN;
+	} else {
+		list_add_tail(&inst->list, &core->instances);
+		ret = 0;
+	}
+
 	mutex_unlock(&core->lock);
 
-	return 0;
+	return ret;
 }
 EXPORT_SYMBOL_GPL(hfi_session_create);
 
diff --git a/drivers/media/platform/qcom/venus/hfi_parser.c b/drivers/media/platform/qcom/venus/hfi_parser.c
index 363ee2a65453..52898633a8e6 100644
--- a/drivers/media/platform/qcom/venus/hfi_parser.c
+++ b/drivers/media/platform/qcom/venus/hfi_parser.c
@@ -276,6 +276,9 @@ u32 hfi_parser(struct venus_core *core, struct venus_inst *inst, void *buf,
 		words_count--;
 	}
 
+	if (!core->max_sessions_supported)
+		core->max_sessions_supported = MAX_SESSIONS;
+
 	parser_fini(inst, codecs, domain);
 
 	return HFI_ERR_NONE;
-- 
2.17.1

