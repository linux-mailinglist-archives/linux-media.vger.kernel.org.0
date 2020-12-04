Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 113192CEBBB
	for <lists+linux-media@lfdr.de>; Fri,  4 Dec 2020 11:05:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387983AbgLDKDi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Dec 2020 05:03:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387902AbgLDKDd (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Dec 2020 05:03:33 -0500
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC4EAC08E863
        for <linux-media@vger.kernel.org>; Fri,  4 Dec 2020 02:02:13 -0800 (PST)
Received: by mail-ej1-x642.google.com with SMTP id g20so7858857ejb.1
        for <linux-media@vger.kernel.org>; Fri, 04 Dec 2020 02:02:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=fik6fEowz12+2Ryuqjd810QUwD4ENaiIRDI49CE7Imo=;
        b=s0IPi2BAvrZXVg6MFhcozWTscLQzWG5DFcmiVlxDGmRFk0HHGu3rKsyxBoR2ctJDmS
         ybNq+4AZfWqrIOWlOwMMn9ypj6s/3xIywX/t+a5UUsOdWxhzpUNYUhXAEX4nOrMahzgl
         E2HbZZoHFdF9h0xQq7Ot8KVfRHaHcNhyfGw5gHPcN4Img0/YCjUtf2LlRFhe+ypQTA15
         B/498boF+b3BY6jxxh1TnBalh1CtYptZLZF36jb5L6n7/fNUlHZolwjUIMDfEqW+QuC1
         XZ7+YsaRBQJbZvr5SdtIoyuQXN+LxAxCAykzXM6hSWoNG7VV1IVkuB8tPfN783mK4Qyw
         zwEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=fik6fEowz12+2Ryuqjd810QUwD4ENaiIRDI49CE7Imo=;
        b=qg5eXu/lK8TF6vR8crKy3RkDERRGquzmDVib7Vvyz8+Ec55O7ZEAM9LQKHlcTHqE18
         M4NqI6kOYnHe6tgwNfxwAj4jcaz/OhfWPtR/c9hWPANHoLAA3hV9iaUQJPecIFtfV1PM
         dnNt/cUpj+RPH73n2q9tzsRldhXnPFR6sb0nAMdlGrfHo2RMc3ZItHZ+tH10NCGfjtS1
         IJshjBhGLstvhI/Ecn1ltjRoacUaS7uSnaATijp+GdNjuOgW9GaHsBvCY4zirhVV/jVx
         9tuBS1CSk7iOt2eGo1ElLs4pSoBxdqhJAeFshx7/HZ9isap1jUDAnOlbDNILxXWeu5uF
         RM2w==
X-Gm-Message-State: AOAM530ZUNfsGQfVquDFRkBx46tiCHXMgd96nVEFR6Q5405lw2WeLq6k
        QngelqrNPYaiMkxiBFWDilSFNkmdk6SjNN66
X-Google-Smtp-Source: ABdhPJx6JYmI+hOefPFTpkOizK3567s+04FShF8enu15CF/OdVhVGAL1qWVPO77wZleP+ulEo6irpw==
X-Received: by 2002:a17:906:7aca:: with SMTP id k10mr6229230ejo.215.1607076132455;
        Fri, 04 Dec 2020 02:02:12 -0800 (PST)
Received: from localhost.localdomain (hst-221-106.medicom.bg. [84.238.221.106])
        by smtp.gmail.com with ESMTPSA id p35sm3238242edd.58.2020.12.04.02.02.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Dec 2020 02:02:11 -0800 (PST)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     dikshita@codeaurora.org, Alexandre Courbot <acourbot@chromium.org>,
        Vikash Garodia <vgarodia@codeaurora.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v2 4/4] venus: hfi: Correct session init return error
Date:   Fri,  4 Dec 2020 12:01:39 +0200
Message-Id: <20201204100139.6216-5-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201204100139.6216-1-stanimir.varbanov@linaro.org>
References: <20201204100139.6216-1-stanimir.varbanov@linaro.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The hfi_session_init can be called many times and it returns
EINVAL when the session was already initialized. This error code
(EINVAL) is confusing for the callers. Change hfi_session_init to
return EALREADY error code when the session has been already
initialized.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/media/platform/qcom/venus/hfi.c  | 2 +-
 drivers/media/platform/qcom/venus/vdec.c | 2 +-
 drivers/media/platform/qcom/venus/venc.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/hfi.c b/drivers/media/platform/qcom/venus/hfi.c
index 8786609d269e..0f2482367e06 100644
--- a/drivers/media/platform/qcom/venus/hfi.c
+++ b/drivers/media/platform/qcom/venus/hfi.c
@@ -221,7 +221,7 @@ int hfi_session_init(struct venus_inst *inst, u32 pixfmt)
 	mutex_unlock(&core->lock);
 
 	if (inst->state != INST_UNINIT)
-		return -EINVAL;
+		return -EALREADY;
 
 	inst->hfi_codec = to_codec_type(pixfmt);
 	reinit_completion(&inst->done);
diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index 8488411204c3..5337387eef27 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -741,7 +741,7 @@ static int vdec_session_init(struct venus_inst *inst)
 	int ret;
 
 	ret = hfi_session_init(inst, inst->fmt_out->pixfmt);
-	if (ret == -EINVAL)
+	if (ret == -EALREADY)
 		return 0;
 	else if (ret)
 		return ret;
diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
index e0053cc1b7eb..cb8ff10e38c7 100644
--- a/drivers/media/platform/qcom/venus/venc.c
+++ b/drivers/media/platform/qcom/venus/venc.c
@@ -725,7 +725,7 @@ static int venc_init_session(struct venus_inst *inst)
 	int ret;
 
 	ret = hfi_session_init(inst, inst->fmt_cap->pixfmt);
-	if (ret == -EINVAL)
+	if (ret == -EALREADY)
 		return 0;
 	else if (ret)
 		return ret;
-- 
2.17.1

