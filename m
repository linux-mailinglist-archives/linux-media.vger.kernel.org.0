Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D28AC2ACFF5
	for <lists+linux-media@lfdr.de>; Tue, 10 Nov 2020 07:47:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730921AbgKJGrM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Nov 2020 01:47:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727089AbgKJGrM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Nov 2020 01:47:12 -0500
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E84A3C0613D4
        for <linux-media@vger.kernel.org>; Mon,  9 Nov 2020 22:47:11 -0800 (PST)
Received: by mail-pl1-x644.google.com with SMTP id cp9so2551971plb.1
        for <linux-media@vger.kernel.org>; Mon, 09 Nov 2020 22:47:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NBj9yf7JPcv+mdaInvqgT7nlmv+A5z96ii6RNMo5eKU=;
        b=lfYx8QpXLXcwlJ1H8XZjzDwW0T3mFB53p5B/Zc17ROZ0luPZ+mT82fy2CZRLx3dIRv
         vLGSanK4yH6gmhCA6VPSb1rc9cppbOncGbBLbSLydZvtGVVx0gv9ICgJpYD9+2Yj2dk5
         WJ/rdBShm/6F4qUakXEhX8FwLF9/W9Hnv/vXc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NBj9yf7JPcv+mdaInvqgT7nlmv+A5z96ii6RNMo5eKU=;
        b=OUN6UJf/SZeix09z6A12kDeYpT/c791bsMQTp0O5OgAqDdSJ1oR2PLnnTIr3LPamET
         80xQB0dB9Xgt9S3+zkguDFvtdi5oFWszhOqdCQQqSi/i/QN8msNyskQ482AKOSaDAKxT
         1P8J6GNXGfJ0R3qHDRwv2G4R5nJ9P6fSCw/bo4YJZKTnTRWWYcZbhoWl9eYc5EbAEPXU
         TfdlugVoHajNktf0AZmHnC8wMY88eRukxHQ9hqj7eau7ksXvfSuHkMF8rL0GV14DIav5
         PNibp+4G8M4Y6J/Bd8bzSeM+aOGA8kCfY4OKJY0xIk2JrnfvfEHrX0UqabAfxC9Jrxt0
         0iuA==
X-Gm-Message-State: AOAM531YEg3DYXKS41SBOkgnbqxGcQKYKVraZhjIlKkwSbu7LjmwosRD
        zuhW3HMv4YpTcmS+8z8qzUfY/jbGj4+y7w==
X-Google-Smtp-Source: ABdhPJxAV8xlVUXDOjuCDg61rTnmp43csAwczfv+fRz1YfWn5EI6YR5cr1871riLOy72oesLUEnoyQ==
X-Received: by 2002:a17:902:c20c:b029:d7:d13f:4172 with SMTP id 12-20020a170902c20cb02900d7d13f4172mr11454245pll.21.1604990831112;
        Mon, 09 Nov 2020 22:47:11 -0800 (PST)
Received: from localhost (56.72.82.34.bc.googleusercontent.com. [34.82.72.56])
        by smtp.gmail.com with ESMTPSA id z11sm13496771pfk.52.2020.11.09.22.47.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2020 22:47:10 -0800 (PST)
From:   Fritz Koenig <frkoenig@chromium.org>
To:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stanimir.varbanov@linaro.org,
        vgarodia@codeaurora.org, dikshita@codeaurora.org,
        acourbot@chromium.org, tfiga@chromium.org
Cc:     Fritz Koenig <frkoenig@chromium.org>
Subject: [PATCH] venus: guard load_scale
Date:   Tue, 10 Nov 2020 06:46:51 +0000
Message-Id: <20201110064650.143800-1-frkoenig@chromium.org>
X-Mailer: git-send-email 2.29.2.299.gdc1121823c-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

load_scale can only be safely called after
the encoder has been initialized.

Signed-off-by: Fritz Koenig <frkoenig@chromium.org>
---
 drivers/media/platform/qcom/venus/pm_helpers.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/pm_helpers.h b/drivers/media/platform/qcom/venus/pm_helpers.h
index aa2f6afa23544..32e27db1fa740 100644
--- a/drivers/media/platform/qcom/venus/pm_helpers.h
+++ b/drivers/media/platform/qcom/venus/pm_helpers.h
@@ -35,6 +35,10 @@ static inline int venus_pm_load_scale(struct venus_inst *inst)
 	if (!core->pm_ops || !core->pm_ops->load_scale)
 		return 0;
 
+	if (inst->session_type == VIDC_SESSION_TYPE_ENC &&
+	    inst->enc_state == VENUS_ENC_STATE_INIT)
+		return 0;
+
 	return core->pm_ops->load_scale(inst);
 }
 
-- 
2.29.2.299.gdc1121823c-goog

