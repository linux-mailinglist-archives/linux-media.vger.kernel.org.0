Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 881413394DC
	for <lists+linux-media@lfdr.de>; Fri, 12 Mar 2021 18:30:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232767AbhCLR34 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Mar 2021 12:29:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232732AbhCLR32 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Mar 2021 12:29:28 -0500
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2495BC061762
        for <linux-media@vger.kernel.org>; Fri, 12 Mar 2021 09:29:28 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id r10-20020a05600c35cab029010c946c95easo15613365wmq.4
        for <linux-media@vger.kernel.org>; Fri, 12 Mar 2021 09:29:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=r3d/SgjaKruzsFsWQ/5JhNPNhUGTMpC/KOd2fT6x614=;
        b=LEi7VoAtlDIAldh4fH6ZYkeZuwxWun6tGjq1whtrDD6C5gde0ZWh1NanSc9KRgSxVn
         r+SPGWXI0jjhdfbnVNAC2STl9gWnUETkDKu9wCRaO3/AQrPayZjx2cUMXB0Ppi3ac6tk
         VVGnkTc/L/tsG85aoM0OgRZIK6Dyp+VYh6tW0TbsWoq39Xxrz16ks/erGfESCd8qsP00
         0mEJdRw1nV4i9/BC5QvcjRMToVNATL//TOMHcy3dLqIAcr3MMei8h5SkC1Oz8usd6aTG
         LWCYbFr7ig/RKxWJXbkMLkMd4pMIJtj2+cSYNewPgTu7VNqU47F7zd2C8JKEEFKqCJ9U
         HEXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=r3d/SgjaKruzsFsWQ/5JhNPNhUGTMpC/KOd2fT6x614=;
        b=c6urhcgxF8zIYuP1i3M4pdFYwwENO7oV4n7OS+K0qV1oRx7JUvSkvRZfBnCWTo1hta
         I8lr6R+GX3gP+RCli0diX6NEBigJNNvPxZT9LOdSSOqcxrWys94gs+ll74w9l6Vyms2s
         r7WQBumWM4EEIexkk30FBziLzWoAwipydjIiQhuwN9uzVMKoIaT2k7fwNkw7a9XTNwrD
         jZAGMBeq4/qMfFg7HYHO00PNvZ65WOatNhUsWw8cxssYvlZayKLEzaNC+aU0Cu92A4C1
         HweoB57wubRxpDl+s50/qWsiDh/RhaiKEJYlqxCXiYjuMJ39x2HLj3dqJH5RGHYYzPJ/
         FNvg==
X-Gm-Message-State: AOAM532lKH8Zm4MsX9AdjPMx/QpiF18bmT8PtrqwIVcp0ztQjBLR7QGl
        afPY9vinJvPtAvhxEyo2cVTFTQ==
X-Google-Smtp-Source: ABdhPJwomYFkXG4BoXBcwKMJ23P6tG24rCa3M38EIAvGOKqYQut1LvKbVCWLZaUOs/UY2Txkyn2DJQ==
X-Received: by 2002:a7b:cb89:: with SMTP id m9mr3427334wmi.27.1615570166864;
        Fri, 12 Mar 2021 09:29:26 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id 18sm2876375wmj.21.2021.03.12.09.29.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Mar 2021 09:29:26 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     stanimir.varbanov@linaro.org, agross@kernel.org,
        bjorn.andersson@linaro.org, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     bryan.odonoghue@linaro.org, dikshita@codeaurora.org,
        jonathan@marek.ca, vgarodia@codeaurora.org,
        Dikshita Agarwal <dikshita@qti.qualcomm.com>
Subject: [PATCH v2 15/25] media: venus: hfi, vdec: v6 Add IS_V6() to existing IS_V4() if locations
Date:   Fri, 12 Mar 2021 17:30:29 +0000
Message-Id: <20210312173039.1387617-16-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210312173039.1387617-1-bryan.odonoghue@linaro.org>
References: <20210312173039.1387617-1-bryan.odonoghue@linaro.org>
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

