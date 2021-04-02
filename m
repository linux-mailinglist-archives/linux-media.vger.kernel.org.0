Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2112235297D
	for <lists+linux-media@lfdr.de>; Fri,  2 Apr 2021 12:06:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234879AbhDBKFs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Apr 2021 06:05:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234997AbhDBKFo (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Apr 2021 06:05:44 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9298DC06178A
        for <linux-media@vger.kernel.org>; Fri,  2 Apr 2021 03:05:42 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id x13so4293020wrs.9
        for <linux-media@vger.kernel.org>; Fri, 02 Apr 2021 03:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sHcyq6p4bV6JWtCYk8/oVqJVtf84Wh6rvRJgeAjFSgk=;
        b=ioxqiwumFisDjG9W10J1nRHr4V5Sjv0Ig7dZ8dMe5fgWudPhkAt999c1/aTEnRIBeQ
         R55XJsQqHKtb6enFV8ZTC7nL4MXH3yjWYZ6MBo/cdIyTvYkfRE0uZvwxq5NqHa4LeKzJ
         k0lbPU71c8n9HQ3L0fZCgEoY+qM+nL1T6PmpqmleObBbOytBSGVRwtqIuznEMZwTixL2
         uo5sharzYNGQf97gS+AunD9FgAwjB5n+JAyRI5kmfbjQ+Oh3Q4hAoqGfvfMZYzd4mAYy
         n3YJPppo/tp6Lwb8ZlJlvAeMQ4ftgF7h/1lsEolZXHM9Qr/4NE2lJwHGzZfDdNl9E8OD
         rrag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sHcyq6p4bV6JWtCYk8/oVqJVtf84Wh6rvRJgeAjFSgk=;
        b=bfHbHjtPXJBkW/0lGgwBYU25wuevRkViXRjGvN5p6LZJvEwTKCEgOi/Hjv8Tncvq5D
         uIqUYuZefc4TptB5vzvpNYbJhLFdq6L/zBZak8GVLvt74n0cly7rGIQ+Y3NqM6vfGzn5
         bxfsSiurbXGhsHEzMVCaCTR2whX+iY1GjJ3kXP4aBop07EcZ36J26dbxp77H0LrdpWPQ
         K5t69+Q827SyEm4zacg2TYfh17Kt0fg0FTZ4a3h+XpJiyKM9y9Qi6nBSktLHnaX9ISeX
         S6Gr75RFfccoYoRfrb2pxwiBzlciVaUyTcBTkEioFIz8iXS6bRPqEHSsKNjVqsSCnE/p
         1EPQ==
X-Gm-Message-State: AOAM533lkTfWinL+CxDF0HJEkx5uU/ZDCGQrC7WU3SgvxPO5RjADJXvv
        /5wGOoX4KR0a7SOIZmXlYdGaXQ==
X-Google-Smtp-Source: ABdhPJxm1LisJTmK6SpuM/QWYpJfJOX1NqbdF8Gsuw6LXEk1b+UOfiYumnaFW0QtuN0B446pbCIRbw==
X-Received: by 2002:a5d:6cd2:: with SMTP id c18mr14499212wrc.330.1617357941362;
        Fri, 02 Apr 2021 03:05:41 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id v18sm15466618wrf.41.2021.04.02.03.05.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Apr 2021 03:05:41 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     stanimir.varbanov@linaro.org, agross@kernel.org,
        bjorn.andersson@linaro.org, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     bryan.odonoghue@linaro.org, dikshita@codeaurora.org,
        jonathan@marek.ca, vgarodia@codeaurora.org
Subject: [PATCH v3 24/25] media: venus: helper: Decide work mode
Date:   Fri,  2 Apr 2021 11:06:47 +0100
Message-Id: <20210402100648.1815854-25-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210402100648.1815854-1-bryan.odonoghue@linaro.org>
References: <20210402100648.1815854-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Dikshita Agarwal <dikshita@codeaurora.org>

Decide work mode for encoder and decoder based on different
use-cases.

Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/venus/helpers.c | 29 ++++++++++++++++++++-
 drivers/media/platform/qcom/venus/helpers.h |  2 +-
 drivers/media/platform/qcom/venus/vdec.c    |  2 +-
 drivers/media/platform/qcom/venus/venc.c    |  2 +-
 4 files changed, 31 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/helpers.c b/drivers/media/platform/qcom/venus/helpers.c
index 77ffb8fbb47f..b813d6dba481 100644
--- a/drivers/media/platform/qcom/venus/helpers.c
+++ b/drivers/media/platform/qcom/venus/helpers.c
@@ -18,6 +18,9 @@
 #include "hfi_platform.h"
 #include "hfi_parser.h"
 
+#define NUM_MBS_720P	(((1280 + 15) >> 4) * ((720 + 15) >> 4))
+#define NUM_MBS_4K	(((4096 + 15) >> 4) * ((2304 + 15) >> 4))
+
 struct intbuf {
 	struct list_head list;
 	u32 type;
@@ -1090,14 +1093,38 @@ int venus_helper_set_output_resolution(struct venus_inst *inst,
 }
 EXPORT_SYMBOL_GPL(venus_helper_set_output_resolution);
 
-int venus_helper_set_work_mode(struct venus_inst *inst, u32 mode)
+static u32 venus_helper_get_work_mode(struct venus_inst *inst)
+{
+	u32 mode;
+	u32 num_mbs;
+
+	mode = VIDC_WORK_MODE_2;
+	if (inst->session_type == VIDC_SESSION_TYPE_DEC) {
+		num_mbs = (ALIGN(inst->height, 16) * ALIGN(inst->width, 16)) / 256;
+		if (inst->hfi_codec == HFI_VIDEO_CODEC_MPEG2 ||
+		    inst->pic_struct != HFI_INTERLACE_FRAME_PROGRESSIVE ||
+		    num_mbs <= NUM_MBS_720P)
+			mode = VIDC_WORK_MODE_1;
+	} else {
+		num_mbs = (ALIGN(inst->out_height, 16) * ALIGN(inst->out_width, 16)) / 256;
+		if (inst->hfi_codec == HFI_VIDEO_CODEC_VP8 &&
+		    num_mbs <= NUM_MBS_4K)
+			mode = VIDC_WORK_MODE_1;
+	}
+
+	return mode;
+}
+
+int venus_helper_set_work_mode(struct venus_inst *inst)
 {
 	const u32 ptype = HFI_PROPERTY_PARAM_WORK_MODE;
 	struct hfi_video_work_mode wm;
+	u32 mode;
 
 	if (!IS_V4(inst->core) && !IS_V6(inst->core))
 		return 0;
 
+	mode = venus_helper_get_work_mode(inst);
 	wm.video_work_mode = mode;
 	return hfi_session_set_property(inst, ptype, &wm);
 }
diff --git a/drivers/media/platform/qcom/venus/helpers.h b/drivers/media/platform/qcom/venus/helpers.h
index 98106e6eee85..e6269b4be3af 100644
--- a/drivers/media/platform/qcom/venus/helpers.h
+++ b/drivers/media/platform/qcom/venus/helpers.h
@@ -32,7 +32,7 @@ int venus_helper_set_input_resolution(struct venus_inst *inst,
 int venus_helper_set_output_resolution(struct venus_inst *inst,
 				       unsigned int width, unsigned int height,
 				       u32 buftype);
-int venus_helper_set_work_mode(struct venus_inst *inst, u32 mode);
+int venus_helper_set_work_mode(struct venus_inst *inst);
 int venus_helper_set_format_constraints(struct venus_inst *inst);
 int venus_helper_set_num_bufs(struct venus_inst *inst, unsigned int input_bufs,
 			      unsigned int output_bufs,
diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index fdc9984acb70..0fe4863371e2 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -655,7 +655,7 @@ static int vdec_output_conf(struct venus_inst *inst)
 	u32 ptype;
 	int ret;
 
-	ret = venus_helper_set_work_mode(inst, VIDC_WORK_MODE_2);
+	ret = venus_helper_set_work_mode(inst);
 	if (ret)
 		return ret;
 
diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
index 505d092dc433..83425fa8df2d 100644
--- a/drivers/media/platform/qcom/venus/venc.c
+++ b/drivers/media/platform/qcom/venus/venc.c
@@ -550,7 +550,7 @@ static int venc_set_properties(struct venus_inst *inst)
 	u32 profile, level;
 	int ret;
 
-	ret = venus_helper_set_work_mode(inst, VIDC_WORK_MODE_2);
+	ret = venus_helper_set_work_mode(inst);
 	if (ret)
 		return ret;
 
-- 
2.30.1

