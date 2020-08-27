Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67A2125422F
	for <lists+linux-media@lfdr.de>; Thu, 27 Aug 2020 11:26:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728490AbgH0J0R (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Aug 2020 05:26:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728568AbgH0JZT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Aug 2020 05:25:19 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE9A5C061235
        for <linux-media@vger.kernel.org>; Thu, 27 Aug 2020 02:25:15 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id x9so4470753wmi.2
        for <linux-media@vger.kernel.org>; Thu, 27 Aug 2020 02:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=OGj1U+RHEgRBo72Z19HJA/GgC9Z8W3lKprGNOAt6O6Y=;
        b=cv41kRwcoHdV3sWpRs7mbvUjJRVliv/pz4A/l0BMxj2coUR0fsCcb99/qXgJ1rLRfc
         spDcdNghukbbUcGVCIS+FWZbMgLtoe3bfOjJMkgH/1X94cXUiqqBXYG6wx/sVf8SGs0G
         AxLPdokqciOf2YJguunK9y4a6EovAvpAIMJZVjL29IvjCICbsNngK10o37zVqvuXpDMh
         TCHocPyVEJn21Po4p9Yo3JJrtE8Mqe04O4P4vBZaSIUTpdsCOopVvwmGLlxNjkC9PiTP
         iGZWmJs1ecDRV4FV4+Pyr21lKPRZYOGvwAAsoAgxnuJ/VItPqBj1o1B6OIqqyntRoULi
         dhaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=OGj1U+RHEgRBo72Z19HJA/GgC9Z8W3lKprGNOAt6O6Y=;
        b=PxADPNK0u6QQy7ELUK4NV/hL5NlH7vjkiegEK7gTdiVK9hybqvgLcVn4BAdTrZdmbO
         gdOu2qZPq/eXPB076vR0yqDAYpTpbsvSVtjWmIno4kfqTlrpKAR/TQviyv1qQ0NLvmgb
         UiNONd1a0HExz4xQ4lWYFXw3XL75fsj0/kpEqKYiUdHp5/yUHH32Hd9MjMgUqfa14TgK
         r6bxj0JbxS95GVXCJ5ryiHK0snKuVqmHWTk11fQCG4GG3Er2bfTiUOzb8gH/9AdbegPe
         YafoFwAXtukx4E1Y98ZAbl+L8+ARhHTRBV+viyhICZK7hPH24TwN94KpI+jPuvPWvlx2
         KxXw==
X-Gm-Message-State: AOAM530biH1bSFRwlS7UqboNkmudDNda6g2qsMS0pwwwVtmz11HVWbWb
        wGJdg4wBVNlD/1cfv/rQTAhvIg==
X-Google-Smtp-Source: ABdhPJw2zK/hE/ZHif/IfxVKntH0dfkmFqbVbtqhH2TIXKyoVR3Cs0kqEMJ/xYzP3kFX7ZE0+heEtQ==
X-Received: by 2002:a05:600c:21d6:: with SMTP id x22mr10386181wmj.112.1598520314503;
        Thu, 27 Aug 2020 02:25:14 -0700 (PDT)
Received: from localhost.localdomain ([195.24.90.54])
        by smtp.gmail.com with ESMTPSA id z203sm4357330wmc.31.2020.08.27.02.25.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2020 02:25:14 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     Dikshita Agarwal <dikshita@codeaurora.org>,
        Vikash Garodia <vgarodia@codeaurora.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH 09/13] venus: hfi_plat: Add hfi platform buffers ops
Date:   Thu, 27 Aug 2020 12:24:13 +0300
Message-Id: <20200827092417.16040-10-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200827092417.16040-1-stanimir.varbanov@linaro.org>
References: <20200827092417.16040-1-stanimir.varbanov@linaro.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From Venus v6 and beyond the buffer size and count have to be
calculated in the v4l2 driver instead of getting them from
firmware.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 .../media/platform/qcom/venus/hfi_plat_bufs.h | 35 +++++++++++++++++++
 .../media/platform/qcom/venus/hfi_platform.h  |  3 ++
 2 files changed, 38 insertions(+)
 create mode 100644 drivers/media/platform/qcom/venus/hfi_plat_bufs.h

diff --git a/drivers/media/platform/qcom/venus/hfi_plat_bufs.h b/drivers/media/platform/qcom/venus/hfi_plat_bufs.h
new file mode 100644
index 000000000000..6dfecaf5b0bd
--- /dev/null
+++ b/drivers/media/platform/qcom/venus/hfi_plat_bufs.h
@@ -0,0 +1,35 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2020, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef __HFI_PLATFORM_BUFFERS_H__
+#define __HFI_PLATFORM_BUFFERS_H__
+
+#include <linux/types.h>
+#include "hfi_helper.h"
+
+struct hfi_plat_buffers_params {
+	u32 width;
+	u32 height;
+	u32 codec;
+	u32 hfi_color_fmt;
+	enum hfi_version version;
+	u32 num_vpp_pipes;
+	union {
+		struct {
+			u32 max_mbs_per_frame;
+			u32 buffer_size_limit;
+			bool is_secondary_output;
+			bool is_interlaced;
+		} dec;
+		struct {
+			u32 work_mode;
+			u32 rc_type;
+			u32 num_b_frames;
+			bool is_tenbit;
+		} enc;
+	};
+};
+
+#endif
diff --git a/drivers/media/platform/qcom/venus/hfi_platform.h b/drivers/media/platform/qcom/venus/hfi_platform.h
index f5f019282eab..692152f2075d 100644
--- a/drivers/media/platform/qcom/venus/hfi_platform.h
+++ b/drivers/media/platform/qcom/venus/hfi_platform.h
@@ -10,6 +10,7 @@
 #include <linux/videodev2.h>
 
 #include "hfi.h"
+#include "hfi_plat_bufs.h"
 #include "hfi_helper.h"
 
 #define MAX_PLANES		4
@@ -49,6 +50,8 @@ struct hfi_platform {
 	void (*codecs)(u32 *enc_codecs, u32 *dec_codecs, u32 *count);
 	const struct hfi_plat_caps *(*capabilities)(unsigned int *entries);
 	u8 (*num_vpp_pipes)(void);
+	int (*bufreq)(struct hfi_plat_buffers_params *params, u32 session_type,
+		      u32 buftype, struct hfi_buffer_requirements *bufreq);
 };
 
 extern const struct hfi_platform hfi_plat_v4;
-- 
2.17.1

