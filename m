Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07233254221
	for <lists+linux-media@lfdr.de>; Thu, 27 Aug 2020 11:26:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728228AbgH0JZv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Aug 2020 05:25:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728620AbgH0JZY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Aug 2020 05:25:24 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13D98C061234
        for <linux-media@vger.kernel.org>; Thu, 27 Aug 2020 02:25:24 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id o4so4668489wrn.0
        for <linux-media@vger.kernel.org>; Thu, 27 Aug 2020 02:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=IFNMyaH4C8tyb/mJTWrzTTwDqXVQt+oIKxEwk0xfFcs=;
        b=dolX/Oj/ruvZXAdY9Awn2EFLCyhybVa7noGABscD4AETJE40yPNweFzjsbch+7oNWD
         E9nAAOpcJUgp9Zeqgha+dssMpvo6RwBkMdKQr1/shKrQb0Y4cHWz0ezv+I0u83obAvvs
         bxIIDWcO3SxyVq+9yL4RT0eclQmQCeE61H2Le1JzT6LZEjHn8FIOK2vXK5RGTu9VzPcR
         WlhWpzHcuySlhhcZMMW1BJw56yMBEgmOpH8MrD85+vdLpTWukcT7HwdGUEZDK9qEuGzE
         EEvUN3FdcV2SjAR3UvcnQyjrQkSL1X9pwPfyfVrHiU1yoYtiTJg8HyGXsdwT/G9xnbHr
         KRwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=IFNMyaH4C8tyb/mJTWrzTTwDqXVQt+oIKxEwk0xfFcs=;
        b=kEvFSHMOeVLQyO592ejR+I46Eq1/iDgnNibhJnAxlIm3Fobgf6ron9DzX3L4GyyG89
         tvV9llOP77ULw4xyJ+pYi42WbhDsQHcz3+wdnNg0v6XGXc9TuVJB9kCAcqwJJkgc2RqB
         FhUnOQzamXrvbM4duFXC+RauAi//CoRyJjuwXwgJ2LvSa2zSTWPgs0CyzEoRjz+1AJ2r
         ctyWVVwKJwqpJLT8tIrErFh8LMaaUmtFuWZ6srrcOMEat9wHoWs87SMJ6pGQYfviJZdn
         ifT3ek0gk363CfJNkfssPQAvVUWY8RfTYgjZ48YCy/UALzYgeJ7CnH9/isgaca9kAnXz
         vW1w==
X-Gm-Message-State: AOAM532vtzscw5jpufdvadKWsjjR1bFZ5GIDEBew6JWnqcsP/PJUmZGm
        jy+iKby3udZA01mp27j2QUkMTQ==
X-Google-Smtp-Source: ABdhPJwT8tpl+fd43qiB4cxkLEEDXd73CQlEGtZK4m11dQ+acs5TwfsJbOHxWMvs/63SDdvUq4pcBA==
X-Received: by 2002:a5d:6505:: with SMTP id x5mr18875316wru.336.1598520322734;
        Thu, 27 Aug 2020 02:25:22 -0700 (PDT)
Received: from localhost.localdomain ([195.24.90.54])
        by smtp.gmail.com with ESMTPSA id z203sm4357330wmc.31.2020.08.27.02.25.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2020 02:25:22 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     Dikshita Agarwal <dikshita@codeaurora.org>,
        Vikash Garodia <vgarodia@codeaurora.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH 13/13] venus: helpers: Wire up hfi platform buffer requirements
Date:   Thu, 27 Aug 2020 12:24:17 +0300
Message-Id: <20200827092417.16040-14-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200827092417.16040-1-stanimir.varbanov@linaro.org>
References: <20200827092417.16040-1-stanimir.varbanov@linaro.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Now when everything is in place wire up buffer requirements
from hfi platform buffers to the buffer requirements helper.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/media/platform/qcom/venus/helpers.c   | 50 +++++++++++++++++++
 .../media/platform/qcom/venus/hfi_parser.h    |  5 ++
 2 files changed, 55 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/helpers.c b/drivers/media/platform/qcom/venus/helpers.c
index cd06a6998f52..a3e59b3791eb 100644
--- a/drivers/media/platform/qcom/venus/helpers.c
+++ b/drivers/media/platform/qcom/venus/helpers.c
@@ -15,6 +15,7 @@
 #include "hfi_helper.h"
 #include "pm_helpers.h"
 #include "hfi_platform.h"
+#include "hfi_parser.h"
 
 struct intbuf {
 	struct list_head list;
@@ -552,6 +553,51 @@ static u32 to_hfi_raw_fmt(u32 v4l2_fmt)
 	return 0;
 }
 
+static int platform_get_bufreq(struct venus_inst *inst, u32 buftype,
+			       struct hfi_buffer_requirements *req)
+{
+	enum hfi_version version = inst->core->res->hfi_version;
+	const struct hfi_platform *hfi_plat;
+	struct hfi_plat_buffers_params params;
+	bool is_dec = inst->session_type == VIDC_SESSION_TYPE_DEC;
+	struct venc_controls *enc_ctr = &inst->controls.enc;
+
+	hfi_plat = hfi_platform_get(version);
+
+	if (!hfi_plat || !hfi_plat->bufreq)
+		return -EINVAL;
+
+	params.version = version;
+	params.num_vpp_pipes = hfi_platform_num_vpp_pipes(version);
+
+	if (is_dec) {
+		params.width = inst->width;
+		params.height = inst->height;
+		params.codec = inst->fmt_out->pixfmt;
+		params.hfi_color_fmt = to_hfi_raw_fmt(inst->fmt_cap->pixfmt);
+		params.dec.max_mbs_per_frame = mbs_per_frame_max(inst);
+		params.dec.buffer_size_limit = 0;
+		params.dec.is_secondary_output =
+			inst->opb_buftype == HFI_BUFFER_OUTPUT2;
+		params.dec.is_interlaced =
+			inst->pic_struct != HFI_INTERLACE_FRAME_PROGRESSIVE ?
+				true : false;
+	} else {
+		params.width = inst->out_width;
+		params.height = inst->out_height;
+		params.codec = inst->fmt_cap->pixfmt;
+		params.hfi_color_fmt = to_hfi_raw_fmt(inst->fmt_out->pixfmt);
+		params.enc.work_mode = VIDC_WORK_MODE_2;
+		params.enc.rc_type = HFI_RATE_CONTROL_OFF;
+		if (enc_ctr->bitrate_mode == V4L2_MPEG_VIDEO_BITRATE_MODE_CQ)
+			params.enc.rc_type = HFI_RATE_CONTROL_CQ;
+		params.enc.num_b_frames = enc_ctr->num_b_frames;
+		params.enc.is_tenbit = inst->bit_depth == VIDC_BITDEPTH_10;
+	}
+
+	return hfi_plat->bufreq(&params, inst->session_type, buftype, req);
+}
+
 int venus_helper_get_bufreq(struct venus_inst *inst, u32 type,
 			    struct hfi_buffer_requirements *req)
 {
@@ -563,6 +609,10 @@ int venus_helper_get_bufreq(struct venus_inst *inst, u32 type,
 	if (req)
 		memset(req, 0, sizeof(*req));
 
+	ret = platform_get_bufreq(inst, type, req);
+	if (!ret)
+		return 0;
+
 	ret = hfi_session_get_property(inst, ptype, &hprop);
 	if (ret)
 		return ret;
diff --git a/drivers/media/platform/qcom/venus/hfi_parser.h b/drivers/media/platform/qcom/venus/hfi_parser.h
index 7f59d82110f9..5751d0140700 100644
--- a/drivers/media/platform/qcom/venus/hfi_parser.h
+++ b/drivers/media/platform/qcom/venus/hfi_parser.h
@@ -112,4 +112,9 @@ static inline u32 core_num_max(struct venus_inst *inst)
 	return cap_max(inst, HFI_CAPABILITY_MAX_VIDEOCORES);
 }
 
+static inline u32 mbs_per_frame_max(struct venus_inst *inst)
+{
+	return cap_max(inst, HFI_CAPABILITY_MBS_PER_FRAME);
+}
+
 #endif
-- 
2.17.1

