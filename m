Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 291BF321C50
	for <lists+linux-media@lfdr.de>; Mon, 22 Feb 2021 17:07:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230441AbhBVQF2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Feb 2021 11:05:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231443AbhBVQD6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Feb 2021 11:03:58 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C70EC061A2A
        for <linux-media@vger.kernel.org>; Mon, 22 Feb 2021 08:01:54 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id c7so2883533wru.8
        for <linux-media@vger.kernel.org>; Mon, 22 Feb 2021 08:01:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hdJa+phniYef0WPVqeqgesg+EPHOBsfdgAUaK1Ao5jQ=;
        b=Nh9pM/bi4jAERULtEjwCdLs93KWs+M1M7JYlTr3AkqyEiSi1m4Kp+5lyFsPtlPqDG/
         hCMPltvoLGtBUwS+tikWh/h0Eb+HFnHWr+SBVLzs9kG7W6aozAnwbjsF2vGLGmpab23V
         6Bgj+zkin05j+wxth6p/95fmHxENinhesTzPtawazD7ugodYp8vPlDKjY9+KU6QqH2rz
         8SaWhrBjc+A4OyMcy8nnxDK2GhROOcFAOg2pNaxAIL+5EVBNXmO720G13F61YJ+6ApRM
         X9RR7Nr1xPdjF1qc152C/iE3Y6QB1lYs4OrE1/CmmGoqTNfhBYNglgH6FcZu5SRDdU/r
         2ZsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hdJa+phniYef0WPVqeqgesg+EPHOBsfdgAUaK1Ao5jQ=;
        b=acgIFecxd7E3NfMle75na8QRYxUT0PjqgXcK7OHmk+coyGkfoJ4PGsuYvpRCUelmiO
         Ube4XqsmK8rx0WTj/rPEvN7X9HMG+WhDJUFx/oZsAgyW4l82KaOqouEFW3BmLO3wN0+Y
         ewRgcrApnjxC7XfeIBnpA8h6/KPX7OvkcRKd4W9hSWifGdFqzcfxAE9yy9KqLDUi85wi
         OMXbPD3p1RajYkU/cL4mwxvxpnxmFUF+STi2OpUnXe/LWMOvYwamqF0zvET/J1aOKyiL
         Cg87RUhtAtNWTafUs1VeHZA0bPIQyNlvr0X6IcDYE8/Av+OAWkjKYygO5L0DptguypDk
         Z01A==
X-Gm-Message-State: AOAM533ZmEuOKsssK1qQuP7ggGOxov7gR8KKUUvE/EGr8S1q2JRJ1oLg
        HVWb6cX4D8mwctCJwpkiVjRBVQ==
X-Google-Smtp-Source: ABdhPJxguWdw35SVar2+UsJvynf6P1GHFfV+IY/EB0FwuxzcV0xh1szU9OYZxtZVCCAFhiQ9uO8jhg==
X-Received: by 2002:a5d:4ec6:: with SMTP id s6mr5276566wrv.416.1614009713190;
        Mon, 22 Feb 2021 08:01:53 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id c3sm7373697wrw.80.2021.02.22.08.01.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Feb 2021 08:01:52 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     stanimir.varbanov@linaro.org, agross@kernel.org,
        bjorn.andersson@linaro.org, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     bryan.odonoghue@linaro.org, dikshita@codeaurora.org,
        jonathan@marek.ca, vgarodia@codeaurora.org,
        Dikshita Agarwal <dikshita@qti.qualcomm.com>
Subject: [PATCH 16/25] media: venus: hfi, vdec: v6 Add IS_V6() to existing IS_V4() if locations
Date:   Mon, 22 Feb 2021 16:02:51 +0000
Message-Id: <20210222160300.1811121-17-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210222160300.1811121-1-bryan.odonoghue@linaro.org>
References: <20210222160300.1811121-1-bryan.odonoghue@linaro.org>
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
index e4dc97f00fc3..84c16f33e01b 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -662,8 +662,8 @@ static int vdec_output_conf(struct venus_inst *inst)
 	if (width > 1920 && height > ALIGN(1080, 32))
 		ubwc = true;
 
-	/* For Venus v4 UBWC format is mandatory */
-	if (IS_V4(core))
+	/* For Venus v4/v6 UBWC format is mandatory */
+	if (IS_V4(core) || IS_V6(core))
 		ubwc = true;
 
 	ret = venus_helper_get_out_fmts(inst, inst->fmt_cap->pixfmt, &out_fmt,
@@ -714,7 +714,7 @@ static int vdec_output_conf(struct venus_inst *inst)
 			return ret;
 	}
 
-	if (IS_V3(core) || IS_V4(core)) {
+	if (IS_V3(core) || IS_V4(core) || IS_V6(core)) {
 		ret = venus_helper_get_bufreq(inst, HFI_BUFFER_OUTPUT, &bufreq);
 		if (ret)
 			return ret;
-- 
2.29.2

