Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1FE6254232
	for <lists+linux-media@lfdr.de>; Thu, 27 Aug 2020 11:26:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728562AbgH0JZI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Aug 2020 05:25:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728539AbgH0JZE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Aug 2020 05:25:04 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92094C061235
        for <linux-media@vger.kernel.org>; Thu, 27 Aug 2020 02:25:03 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id t14so4468707wmi.3
        for <linux-media@vger.kernel.org>; Thu, 27 Aug 2020 02:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=ar/xHvZ7fre2q/g96YzzBbat3rjeKEcI9+aXotfK6HA=;
        b=EMdk7rIdjhUA9IA1zmTHHpGjNvrIxRJE2Hu21ikf8p4SmuD8vX7FPrVLVsoMmnsba6
         CG8KPpDru2q3LSmBY9EDgnMnadak+A8LL+iaVB34vXNbwXUpO1guCOY8o/bXRi1AXfJ3
         QBhaNZ157mqSfyfCCtk8fXQ2xr80H5nkn7Us9Vecx4XZudtc0t9q/NRAlBUuHX1zeL5h
         4PqvllHj+27BXl1+oakCwAZh8+VXwjumqmdCnWxLL4sbKiLJKH0ORIbTblztFCUSs3px
         VpdYIfj+rkyN81RwTr5qE5coqYDjIjuTWZ8IxhiQ5c9zyyHtg/Z+EIeKlMFoZFRL0j+D
         M8hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=ar/xHvZ7fre2q/g96YzzBbat3rjeKEcI9+aXotfK6HA=;
        b=hT53XPXfDB5ERa4YP0E3gZObMLQBNrGpYTheNXTMvI7DmJkAuPWevhWd6JSd3NMaJ6
         NKw7+Pdg0LGq784ox5KPgFEodacFIvivdZ/jWs9hL33tArl2DbxR0VpYq+4B51Sa/CMV
         5eRblpOF+bP5t2O8EqlWsN2K/Hwe2BbBcsruH1U3QpPiZ5Kci6C0q64VqeGn0jQvpgcw
         mYMvr36ayJlxzZ/PrJOoCFvfivXPn+0iNYz43lCMd3uKOY+UJD1tqtagdRltQPslSzMM
         gCVxU1Wl5MFzMY94UrYn0u9IJ3pRidlmubhwzZEviMurTyoedRmxXzZ4o0f8OEC+scWM
         3c+Q==
X-Gm-Message-State: AOAM532CqBdr6VGi0Au2bud3JRXf94DXZhZOaKoGha2Zs73fauAZpblv
        Fcw2A//CYxAc95js44MPdYm78A==
X-Google-Smtp-Source: ABdhPJwBnpoIEHGn4JKU9xbHhPvT9vSl/91NRnQ7CM0hx5YVsNWH51s2JnEqeKYDJCWt59FsWlJ0jA==
X-Received: by 2002:a1c:6384:: with SMTP id x126mr11038621wmb.117.1598520302165;
        Thu, 27 Aug 2020 02:25:02 -0700 (PDT)
Received: from localhost.localdomain ([195.24.90.54])
        by smtp.gmail.com with ESMTPSA id z203sm4357330wmc.31.2020.08.27.02.25.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2020 02:25:01 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     Dikshita Agarwal <dikshita@codeaurora.org>,
        Vikash Garodia <vgarodia@codeaurora.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH 04/13] venus: Rename venus_caps to hfi_plat_caps
Date:   Thu, 27 Aug 2020 12:24:08 +0300
Message-Id: <20200827092417.16040-5-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200827092417.16040-1-stanimir.varbanov@linaro.org>
References: <20200827092417.16040-1-stanimir.varbanov@linaro.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Now when we have hfi platform make venus capabilities an
hfi platform capabilities.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/media/platform/qcom/venus/core.h      | 29 ++-----------------
 drivers/media/platform/qcom/venus/helpers.c   |  6 ++--
 .../media/platform/qcom/venus/hfi_parser.c    | 18 ++++++------
 .../media/platform/qcom/venus/hfi_parser.h    |  2 +-
 .../media/platform/qcom/venus/hfi_platform.h  | 24 +++++++++++++++
 5 files changed, 40 insertions(+), 39 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index ac947f1486a6..7545f004f564 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -14,6 +14,7 @@
 
 #include "dbgfs.h"
 #include "hfi.h"
+#include "hfi_platform.h"
 
 #define VDBGL	"VenusLow : "
 #define VDBGM	"VenusMed : "
@@ -80,30 +81,6 @@ struct venus_format {
 	u32 flags;
 };
 
-#define MAX_PLANES		4
-#define MAX_FMT_ENTRIES		32
-#define MAX_CAP_ENTRIES		32
-#define MAX_ALLOC_MODE_ENTRIES	16
-#define MAX_CODEC_NUM		32
-
-struct raw_formats {
-	u32 buftype;
-	u32 fmt;
-};
-
-struct venus_caps {
-	u32 codec;
-	u32 domain;
-	bool cap_bufs_mode_dynamic;
-	unsigned int num_caps;
-	struct hfi_capability caps[MAX_CAP_ENTRIES];
-	unsigned int num_pl;
-	struct hfi_profile_level pl[HFI_MAX_PROFILE_COUNT];
-	unsigned int num_fmts;
-	struct raw_formats fmts[MAX_FMT_ENTRIES];
-	bool valid;	/* used only for Venus v1xx */
-};
-
 /**
  * struct venus_core - holds core parameters valid for all instances
  *
@@ -182,7 +159,7 @@ struct venus_core {
 	void *priv;
 	const struct hfi_ops *ops;
 	struct delayed_work work;
-	struct venus_caps caps[MAX_CODEC_NUM];
+	struct hfi_plat_caps caps[MAX_CODEC_NUM];
 	unsigned int codecs_count;
 	unsigned int core0_usage_count;
 	unsigned int core1_usage_count;
@@ -414,7 +391,7 @@ static inline void *to_hfi_priv(struct venus_core *core)
 	return core->priv;
 }
 
-static inline struct venus_caps *
+static inline struct hfi_plat_caps *
 venus_caps_by_codec(struct venus_core *core, u32 codec, u32 domain)
 {
 	unsigned int c;
diff --git a/drivers/media/platform/qcom/venus/helpers.c b/drivers/media/platform/qcom/venus/helpers.c
index 15ca59583b02..cd06a6998f52 100644
--- a/drivers/media/platform/qcom/venus/helpers.c
+++ b/drivers/media/platform/qcom/venus/helpers.c
@@ -480,7 +480,7 @@ session_process_buf(struct venus_inst *inst, struct vb2_v4l2_buffer *vbuf)
 static bool is_dynamic_bufmode(struct venus_inst *inst)
 {
 	struct venus_core *core = inst->core;
-	struct venus_caps *caps;
+	struct hfi_plat_caps *caps;
 
 	/*
 	 * v4 doesn't send BUFFER_ALLOC_MODE_SUPPORTED property and supports
@@ -1294,7 +1294,7 @@ void venus_helper_init_instance(struct venus_inst *inst)
 }
 EXPORT_SYMBOL_GPL(venus_helper_init_instance);
 
-static bool find_fmt_from_caps(struct venus_caps *caps, u32 buftype, u32 fmt)
+static bool find_fmt_from_caps(struct hfi_plat_caps *caps, u32 buftype, u32 fmt)
 {
 	unsigned int i;
 
@@ -1311,7 +1311,7 @@ int venus_helper_get_out_fmts(struct venus_inst *inst, u32 v4l2_fmt,
 			      u32 *out_fmt, u32 *out2_fmt, bool ubwc)
 {
 	struct venus_core *core = inst->core;
-	struct venus_caps *caps;
+	struct hfi_plat_caps *caps;
 	u32 ubwc_fmt, fmt = to_hfi_raw_fmt(v4l2_fmt);
 	bool found, found_ubwc;
 
diff --git a/drivers/media/platform/qcom/venus/hfi_parser.c b/drivers/media/platform/qcom/venus/hfi_parser.c
index 363ee2a65453..ecf68852c680 100644
--- a/drivers/media/platform/qcom/venus/hfi_parser.c
+++ b/drivers/media/platform/qcom/venus/hfi_parser.c
@@ -11,12 +11,12 @@
 #include "hfi_helper.h"
 #include "hfi_parser.h"
 
-typedef void (*func)(struct venus_caps *cap, const void *data,
+typedef void (*func)(struct hfi_plat_caps *cap, const void *data,
 		     unsigned int size);
 
 static void init_codecs(struct venus_core *core)
 {
-	struct venus_caps *caps = core->caps, *cap;
+	struct hfi_plat_caps *caps = core->caps, *cap;
 	unsigned long bit;
 
 	for_each_set_bit(bit, &core->dec_codecs, MAX_CODEC_NUM) {
@@ -34,11 +34,11 @@ static void init_codecs(struct venus_core *core)
 	}
 }
 
-static void for_each_codec(struct venus_caps *caps, unsigned int caps_num,
+static void for_each_codec(struct hfi_plat_caps *caps, unsigned int caps_num,
 			   u32 codecs, u32 domain, func cb, void *data,
 			   unsigned int size)
 {
-	struct venus_caps *cap;
+	struct hfi_plat_caps *cap;
 	unsigned int i;
 
 	for (i = 0; i < caps_num; i++) {
@@ -51,7 +51,7 @@ static void for_each_codec(struct venus_caps *caps, unsigned int caps_num,
 }
 
 static void
-fill_buf_mode(struct venus_caps *cap, const void *data, unsigned int num)
+fill_buf_mode(struct hfi_plat_caps *cap, const void *data, unsigned int num)
 {
 	const u32 *type = data;
 
@@ -81,7 +81,7 @@ parse_alloc_mode(struct venus_core *core, u32 codecs, u32 domain, void *data)
 	}
 }
 
-static void fill_profile_level(struct venus_caps *cap, const void *data,
+static void fill_profile_level(struct hfi_plat_caps *cap, const void *data,
 			       unsigned int num)
 {
 	const struct hfi_profile_level *pl = data;
@@ -107,7 +107,7 @@ parse_profile_level(struct venus_core *core, u32 codecs, u32 domain, void *data)
 }
 
 static void
-fill_caps(struct venus_caps *cap, const void *data, unsigned int num)
+fill_caps(struct hfi_plat_caps *cap, const void *data, unsigned int num)
 {
 	const struct hfi_capability *caps = data;
 
@@ -132,7 +132,7 @@ parse_caps(struct venus_core *core, u32 codecs, u32 domain, void *data)
 		       fill_caps, caps_arr, num_caps);
 }
 
-static void fill_raw_fmts(struct venus_caps *cap, const void *fmts,
+static void fill_raw_fmts(struct hfi_plat_caps *cap, const void *fmts,
 			  unsigned int num_fmts)
 {
 	const struct raw_formats *formats = fmts;
@@ -211,7 +211,7 @@ static void parser_init(struct venus_inst *inst, u32 *codecs, u32 *domain)
 
 static void parser_fini(struct venus_inst *inst, u32 codecs, u32 domain)
 {
-	struct venus_caps *caps, *cap;
+	struct hfi_plat_caps *caps, *cap;
 	unsigned int i;
 	u32 dom;
 
diff --git a/drivers/media/platform/qcom/venus/hfi_parser.h b/drivers/media/platform/qcom/venus/hfi_parser.h
index 264e6dd2415f..7f59d82110f9 100644
--- a/drivers/media/platform/qcom/venus/hfi_parser.h
+++ b/drivers/media/platform/qcom/venus/hfi_parser.h
@@ -16,7 +16,7 @@ static inline u32 get_cap(struct venus_inst *inst, u32 type, u32 which)
 {
 	struct venus_core *core = inst->core;
 	struct hfi_capability *cap = NULL;
-	struct venus_caps *caps;
+	struct hfi_plat_caps *caps;
 	unsigned int i;
 
 	caps = venus_caps_by_codec(core, inst->hfi_codec, inst->session_type);
diff --git a/drivers/media/platform/qcom/venus/hfi_platform.h b/drivers/media/platform/qcom/venus/hfi_platform.h
index 8b07ecbb4c82..174428e97b86 100644
--- a/drivers/media/platform/qcom/venus/hfi_platform.h
+++ b/drivers/media/platform/qcom/venus/hfi_platform.h
@@ -12,6 +12,30 @@
 #include "hfi.h"
 #include "hfi_helper.h"
 
+#define MAX_PLANES		4
+#define MAX_FMT_ENTRIES		32
+#define MAX_CAP_ENTRIES		32
+#define MAX_ALLOC_MODE_ENTRIES	16
+#define MAX_CODEC_NUM		32
+
+struct raw_formats {
+	u32 buftype;
+	u32 fmt;
+};
+
+struct hfi_plat_caps {
+	u32 codec;
+	u32 domain;
+	bool cap_bufs_mode_dynamic;
+	unsigned int num_caps;
+	struct hfi_capability caps[MAX_CAP_ENTRIES];
+	unsigned int num_pl;
+	struct hfi_profile_level pl[HFI_MAX_PROFILE_COUNT];
+	unsigned int num_fmts;
+	struct raw_formats fmts[MAX_FMT_ENTRIES];
+	bool valid;	/* used only for Venus v1xx */
+};
+
 struct hfi_platform_codec_freq_data {
 	u32 pixfmt;
 	u32 session_type;
-- 
2.17.1

