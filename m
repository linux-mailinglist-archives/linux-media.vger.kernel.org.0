Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 903413394F0
	for <lists+linux-media@lfdr.de>; Fri, 12 Mar 2021 18:30:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232901AbhCLRaC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Mar 2021 12:30:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232862AbhCLR3h (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Mar 2021 12:29:37 -0500
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13799C061761
        for <linux-media@vger.kernel.org>; Fri, 12 Mar 2021 09:29:37 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id c76-20020a1c9a4f0000b029010c94499aedso16268934wme.0
        for <linux-media@vger.kernel.org>; Fri, 12 Mar 2021 09:29:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BVZp3moArAIOtHWEMLsr048YkEnUBgpfPCCb5RcdFQg=;
        b=xop5CatnzZXYo0jvlbiGqoGG1bUO1IKZEJF+kUkbamGxnpPtBmWOXbx/4x/Z6mwmbA
         4PzTJwiobzqnB9MLmUem/IZ2TkRCnrzf6uXmhUavEubxcy1ZhXTIBhfNZbYcMgsuTbs+
         WoeCiuEwMq9wlyrw3VVCohzL7iVnwX9RsjQfwa1yDfr9jG74mud1ARG3q3xnu/SJKnE6
         KPSN5am6YexeXBqecjqVv2/NpOcX07S76nA9+0FBaSH/zqt0oVp9wOK3KdEjHMB/r1yd
         hOHOGrC8SXbz5QCrnHErxwCz//k+/Z/KCR9srfxed6PxgwrRQ+MvIG+fwDGK7MdGJAcY
         1YCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BVZp3moArAIOtHWEMLsr048YkEnUBgpfPCCb5RcdFQg=;
        b=FTSTfidjMOKabcIjbh/DbBULJzv3y9id1jOjQWBk7ubRq05zSVn1HB2AA6OImXDK2a
         281s4YwJAp05Qq8m9qBjzn/3k1V12aumgcEH6eSlSTpi5RZ6q4lz8vcKUxiQFIlClilY
         fYmns9/B6gGhIN5aiNcVDTVSO+Trj5SSOYpXJ2iz0g0pIQ89Y73GFanlxOz9uhT2n2Om
         VxjMhOZyJBSdpt3GRkg3pGsn5V/kV4/3FWxBqlTfJ0/3PauMmXlnIfrDoXFuge2/WeAJ
         nuiwYPP0GAY692p69E9dIQ6jChCVuV3XQ8Y5OuPVpCGSsb2GUbTBRxNi8Odt92dyzfCO
         kqoQ==
X-Gm-Message-State: AOAM532I2nWRnJmfMCPi7Xb+6ZHyzArQj6V5FR40HvNwCahrVwUQrShZ
        i4JHg++jLbrhuhcOh/7vTQSTqw==
X-Google-Smtp-Source: ABdhPJzdZVeM+VdKGZ+vKD7jPqcgn90Gf6eI/WHYo88FEGaiH2iOP/io9gslTbb/fo9+hKrh6fQTTg==
X-Received: by 2002:a1c:7210:: with SMTP id n16mr13784499wmc.13.1615570175776;
        Fri, 12 Mar 2021 09:29:35 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id 18sm2876375wmj.21.2021.03.12.09.29.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Mar 2021 09:29:35 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     stanimir.varbanov@linaro.org, agross@kernel.org,
        bjorn.andersson@linaro.org, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     bryan.odonoghue@linaro.org, dikshita@codeaurora.org,
        jonathan@marek.ca, vgarodia@codeaurora.org
Subject: [PATCH v2 24/25] media: venus: helper: Decide work mode
Date:   Fri, 12 Mar 2021 17:30:38 +0000
Message-Id: <20210312173039.1387617-25-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210312173039.1387617-1-bryan.odonoghue@linaro.org>
References: <20210312173039.1387617-1-bryan.odonoghue@linaro.org>
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
 drivers/media/platform/qcom/venus/helpers.c | 31 ++++++++++++++++++++-
 drivers/media/platform/qcom/venus/helpers.h |  2 +-
 drivers/media/platform/qcom/venus/vdec.c    |  2 +-
 drivers/media/platform/qcom/venus/venc.c    |  2 +-
 4 files changed, 33 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/helpers.c b/drivers/media/platform/qcom/venus/helpers.c
index 77ffb8fbb47f..dc8ef13d0c95 100644
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
@@ -1090,14 +1093,40 @@ int venus_helper_set_output_resolution(struct venus_inst *inst,
 }
 EXPORT_SYMBOL_GPL(venus_helper_set_output_resolution);
 
-int venus_helper_set_work_mode(struct venus_inst *inst, u32 mode)
+static u32 venus_helper_get_work_mode(struct venus_inst *inst)
+{
+	u32 mode;
+	u32 num_mbs;
+
+	mode = VIDC_WORK_MODE_2;
+	if (IS_V6(inst->core)) {
+		if (inst->session_type == VIDC_SESSION_TYPE_DEC) {
+			num_mbs = (ALIGN(inst->height, 16) * ALIGN(inst->width, 16)) / 256;
+			if (inst->hfi_codec == HFI_VIDEO_CODEC_MPEG2 ||
+			    inst->pic_struct != HFI_INTERLACE_FRAME_PROGRESSIVE ||
+			    num_mbs <= NUM_MBS_720P)
+				mode = VIDC_WORK_MODE_1;
+		} else {
+			num_mbs = (ALIGN(inst->out_height, 16) * ALIGN(inst->out_width, 16)) / 256;
+			if (inst->hfi_codec == HFI_VIDEO_CODEC_VP8 &&
+			    num_mbs <= NUM_MBS_4K)
+				mode = VIDC_WORK_MODE_1;
+		}
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

