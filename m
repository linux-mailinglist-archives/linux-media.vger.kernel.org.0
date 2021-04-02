Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13D0335296B
	for <lists+linux-media@lfdr.de>; Fri,  2 Apr 2021 12:05:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234904AbhDBKFn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Apr 2021 06:05:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234901AbhDBKFg (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Apr 2021 06:05:36 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77302C0617A9
        for <linux-media@vger.kernel.org>; Fri,  2 Apr 2021 03:05:33 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id v11so4296454wro.7
        for <linux-media@vger.kernel.org>; Fri, 02 Apr 2021 03:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BBliiiy6w7709FtBAKPmWC2L64XC00IR7DOPG3X207w=;
        b=KG0MSbpvHxIrbY8EA1yY8buEVvgrlrGyIs4CiBQaFpFCsWG+u9U9U7yAmNv129NLcD
         cNwHMh64MoPgmobr+poynU16c680ESRcmbm5LQOQCuX1UUPSp1/eRC/Ll6Dv1RmTYjBF
         qCO3He1a3yYE1WJy+7SeejmIvcc2UvMWxCziYcbt9MokKBb7BrWPyjaF4x3ANn+U+xu8
         mtFd3vuy55d5cIVdcOpy7Db5spndhuMvwJIOSaKTQZodOXXbfk3q6+Ybsx0LGm1Nv2jG
         5k3e+YBOK8uHtQHiV+MUaohAB89veDvUI96i4Axwq4vMR0TXI2Hkd5ksSo61JOiaaKxe
         1ISw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BBliiiy6w7709FtBAKPmWC2L64XC00IR7DOPG3X207w=;
        b=YITvbCJUGMhPLqa0HwhbBJ3rLN+7Atyd57h6ljRRs0HqKKZZEvyzN6hpNCRGlLxGl4
         jWv+9ufp9VKnu8428MVJTUZT0Sq1ajYHg/ncW3u6fsetnJMbq4AIgVVjWy2D3wYAgolU
         w1A8DZacX3eswITRnVtq1vzhCTFgY+/ZnJvyIYDQPf7A0CAhWULOeRxGFuYFQs6zS13i
         noNSIFI6fAfXtYSUnFS/khe/Z6k2xEAiePJOztdO28zR4Bl9ziwhSPV8pX75hmZu6Ur4
         SsItPvCyz6y7V+WToq5dQvzkEZlN1erVNeWPaDGLcePlUkFNjSu7+8ENB2BsvoJM5DeO
         u2Ow==
X-Gm-Message-State: AOAM531Ah+u65ZHlTp57jl8RgOpl5wWeCnGYipzRSFDky6Ouue8CMymh
        YVqmHENRjYc4k9a7JJ9KVLZaIQ==
X-Google-Smtp-Source: ABdhPJw/VXStlt4TyQnG3hHqrPUAdTLeh3lDz5U9Cq+PJtegky2pPlshTj8IKNOtkW0ux+Bq2Bzkig==
X-Received: by 2002:a5d:6dcc:: with SMTP id d12mr14096588wrz.136.1617357932182;
        Fri, 02 Apr 2021 03:05:32 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id v18sm15466618wrf.41.2021.04.02.03.05.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Apr 2021 03:05:31 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     stanimir.varbanov@linaro.org, agross@kernel.org,
        bjorn.andersson@linaro.org, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     bryan.odonoghue@linaro.org, dikshita@codeaurora.org,
        jonathan@marek.ca, vgarodia@codeaurora.org,
        Dikshita Agarwal <dikshita@qti.qualcomm.com>
Subject: [PATCH v3 15/25] media: venus: hfi, vdec: v6 Add IS_V6() to existing IS_V4() if locations
Date:   Fri,  2 Apr 2021 11:06:38 +0100
Message-Id: <20210402100648.1815854-16-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210402100648.1815854-1-bryan.odonoghue@linaro.org>
References: <20210402100648.1815854-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In various places in the venus codebase we have if (IS_V4()) which takes
the code down paths for 4xx silicon. This logic is broadly applicable to
6xx silicon also. In this patch we add IS_V6() to various IS_V4() decision
locations.

Co-developed-by: Dikshita Agarwal <dikshita@qti.qualcomm.com>
Signed-off-by: Dikshita Agarwal <dikshita@qti.qualcomm.com>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Acked-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/media/platform/qcom/venus/helpers.c   | 5 ++---
 drivers/media/platform/qcom/venus/hfi_venus.c | 4 ++--
 drivers/media/platform/qcom/venus/vdec.c      | 6 +++---
 3 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/helpers.c b/drivers/media/platform/qcom/venus/helpers.c
index 76ece2ff8d39..2515a2225614 100644
--- a/drivers/media/platform/qcom/venus/helpers.c
+++ b/drivers/media/platform/qcom/venus/helpers.c
@@ -488,7 +488,7 @@ static bool is_dynamic_bufmode(struct venus_inst *inst)
 	 * v4 doesn't send BUFFER_ALLOC_MODE_SUPPORTED property and supports
 	 * dynamic buffer mode by default for HFI_BUFFER_OUTPUT/OUTPUT2.
 	 */
-	if (IS_V4(core))
+	if (IS_V4(core) || IS_V6(core))
 		return true;
 
 	caps = venus_caps_by_codec(core, inst->hfi_codec, inst->session_type);
@@ -1084,11 +1084,10 @@ int venus_helper_set_work_mode(struct venus_inst *inst, u32 mode)
 	const u32 ptype = HFI_PROPERTY_PARAM_WORK_MODE;
 	struct hfi_video_work_mode wm;
 
-	if (!IS_V4(inst->core))
+	if (!IS_V4(inst->core) && !IS_V6(inst->core))
 		return 0;
 
 	wm.video_work_mode = mode;
-
 	return hfi_session_set_property(inst, ptype, &wm);
 }
 EXPORT_SYMBOL_GPL(venus_helper_set_work_mode);
diff --git a/drivers/media/platform/qcom/venus/hfi_venus.c b/drivers/media/platform/qcom/venus/hfi_venus.c
index dabff8654f97..24cf20f76e7f 100644
--- a/drivers/media/platform/qcom/venus/hfi_venus.c
+++ b/drivers/media/platform/qcom/venus/hfi_venus.c
@@ -897,7 +897,7 @@ static int venus_sys_set_default_properties(struct venus_hfi_device *hdev)
 	 * enable it explicitly in order to make suspend functional by checking
 	 * WFI (wait-for-interrupt) bit.
 	 */
-	if (IS_V4(hdev->core))
+	if (IS_V4(hdev->core) || IS_V6(hdev->core))
 		venus_sys_idle_indicator = true;
 
 	ret = venus_sys_set_idle_message(hdev, venus_sys_idle_indicator);
@@ -1577,7 +1577,7 @@ static int venus_suspend_3xx(struct venus_core *core)
 
 static int venus_suspend(struct venus_core *core)
 {
-	if (IS_V3(core) || IS_V4(core))
+	if (IS_V3(core) || IS_V4(core) || IS_V6(core))
 		return venus_suspend_3xx(core);
 
 	return venus_suspend_1xx(core);
diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index c20496a14a55..5cefa396f2b5 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -670,8 +670,8 @@ static int vdec_output_conf(struct venus_inst *inst)
 	if (width > 1920 && height > ALIGN(1080, 32))
 		ubwc = true;
 
-	/* For Venus v4 UBWC format is mandatory */
-	if (IS_V4(core))
+	/* For Venus v4/v6 UBWC format is mandatory */
+	if (IS_V4(core) || IS_V6(core))
 		ubwc = true;
 
 	ret = venus_helper_get_out_fmts(inst, inst->fmt_cap->pixfmt, &out_fmt,
@@ -722,7 +722,7 @@ static int vdec_output_conf(struct venus_inst *inst)
 			return ret;
 	}
 
-	if (IS_V3(core) || IS_V4(core)) {
+	if (IS_V3(core) || IS_V4(core) || IS_V6(core)) {
 		ret = venus_helper_get_bufreq(inst, HFI_BUFFER_OUTPUT, &bufreq);
 		if (ret)
 			return ret;
-- 
2.30.1

