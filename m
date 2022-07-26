Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 023A6580958
	for <lists+linux-media@lfdr.de>; Tue, 26 Jul 2022 04:15:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231539AbiGZCPD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 Jul 2022 22:15:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231553AbiGZCPB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Jul 2022 22:15:01 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 645C128E2E
        for <linux-media@vger.kernel.org>; Mon, 25 Jul 2022 19:15:00 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id k12so558530wrm.13
        for <linux-media@vger.kernel.org>; Mon, 25 Jul 2022 19:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZueTuJk4+fWaT2N8rAp4WDmLOe4coMMuivU65OxHSr4=;
        b=sO/MbMDmlWud/lQx0VVE8LyrPrlx3/3/inI8bzFCRBlUoM6g9VIEAMZdVS3OVF1ZVu
         EXq3JSTr9y1A9axt0fVyHTVncZwVeOlbsgt82/1v9XSo538Trm3DfNYRQCp8leIMixl0
         ZvmyLAVfiQW18/8ycOPKYG91v0Huh1x+7CkMaS9TwPdB39Yw9rktaFAKcMXPHxVZbJFA
         uf+3FFWdlOdDa4yYaFwqHtUVRRJn3h+DZjXKyacYnAIA7/cjvtUFmsnr4fyDRL3LSs9o
         S1ZIRgFjKrq0lVAS0QJbKbCaiyOFC+6qffGuEBLloZ280d5k5zh0bb00fGXIeVMorsGo
         T82g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZueTuJk4+fWaT2N8rAp4WDmLOe4coMMuivU65OxHSr4=;
        b=HKoTMqPd47Byq8GwoPxepSyMw2AGNcXX69cGtHuHKbsnVbvwQgJ5w9bkPIbCn2YvL1
         SE8uqJXrzhhKXAbgtbLivi9pexbdNldbr/4n/XPYd+OZu5Il8oLRnAj+UTVHINhC6LSk
         PlZXVkt0wvYZjIyJyy5bupJhzmrtnKk3UQrv9kBDNBaYlXM6zQ70rXzZIMnuRBla7K4t
         HUUkeQriw7KDSu29Ss13inNuxJuHIiQwYMRM0LGJbbYDzH6pqDJ+eJEpPGtB1O6RGpWo
         3B6Q9FPR9Hne2NWLntkQLmPsuNma4hKHc6yHY0tXriwHUaEGMOLnVDirJb6a8f+QbZHy
         1e8w==
X-Gm-Message-State: AJIora+8eRXTQ+x8pScWyH3PKHxBkgsSBsOeF5eI6ngLCAw8vyxQm4kr
        WLDsCvszbf0P3gk8jdEpEUvBPg==
X-Google-Smtp-Source: AGRyM1v9mBpyQgUQSVGBkX3ZZ1Up1KtlzDqMjyVemFM9j38e+GPJ9/iCh9gOb0W7x15dLpAdgQZwig==
X-Received: by 2002:a05:6000:18ad:b0:21d:9aca:379 with SMTP id b13-20020a05600018ad00b0021d9aca0379mr9375146wri.312.1658801698930;
        Mon, 25 Jul 2022 19:14:58 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id r67-20020a1c2b46000000b003a308e9a192sm20005984wmr.30.2022.07.25.19.14.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jul 2022 19:14:58 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     stanimir.varbanov@linaro.org, agross@kernel.org,
        bjorn.andersson@linaro.org, konrad.dybcio@somainline.org,
        mchehab@kernel.org
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bryan.odonoghue@linaro.org
Subject: [PATCH 2/2] media: venus: Fix NV12 decoder buffer discovery on HFI_VERSION_1XX
Date:   Tue, 26 Jul 2022 03:14:55 +0100
Message-Id: <20220726021455.1814096-3-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220726021455.1814096-1-bryan.odonoghue@linaro.org>
References: <20220726021455.1814096-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

HFI_VERSION_1XX uses HFI_BUFFER_OUTPUT not HFI_BUFFER_OUTPUT2 for decoder
buffers.

venus_helper_check_format() places a constraint on an output buffer to be
of type HFI_BUFFER_OUTPUT2. HFI_1XX uses HFI_BUFFER_OUTPUT though.

Switching to the logic used in venus_helper_get_out_fmts() first checking
for HFI_BUFFER_OUTPUT and then HFI_BUFFER_OUTPUT2 resolves on HFI_1XX.

db410c before:
root@linaro-alip:~# v4l2-ctl  -d /dev/video0 --list-formats
ioctl: VIDIOC_ENUM_FMT
        Type: Video Capture Multiplanar

        [0]: 'MPG4' (MPEG-4 Part 2 ES, compressed)
        [1]: 'H263' (H.263, compressed)
        [2]: 'H264' (H.264, compressed)
        [3]: 'VP80' (VP8, compressed)

root@linaro-alip:~# v4l2-ctl  -d /dev/video1 --list-formats
ioctl: VIDIOC_ENUM_FMT
        Type: Video Capture Multiplanar

db410c after:
root@linaro-alip:~# v4l2-ctl  -d /dev/video0 --list-formats
ioctl: VIDIOC_ENUM_FMT
        Type: Video Capture Multiplanar

        [0]: 'MPG4' (MPEG-4 Part 2 ES, compressed)
        [1]: 'H263' (H.263, compressed)
        [2]: 'H264' (H.264, compressed)
        [3]: 'VP80' (VP8, compressed)

root@linaro-alip:~# v4l2-ctl  -d /dev/video1 --list-formats
ioctl: VIDIOC_ENUM_FMT
        Type: Video Capture Multiplanar

        [0]: 'NV12' (Y/CbCr 4:2:0)

Validated playback with ffplay on db410c with h264 and vp8 decoding.

Fixes: 9593126dae3e ("media: venus: Add a handling of QC08C compressed format")
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/venus/helpers.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/helpers.c b/drivers/media/platform/qcom/venus/helpers.c
index 5c1104379c491..623be6393c706 100644
--- a/drivers/media/platform/qcom/venus/helpers.c
+++ b/drivers/media/platform/qcom/venus/helpers.c
@@ -1802,7 +1802,7 @@ bool venus_helper_check_format(struct venus_inst *inst, u32 v4l2_pixfmt)
 	struct venus_core *core = inst->core;
 	u32 fmt = to_hfi_raw_fmt(v4l2_pixfmt);
 	struct hfi_plat_caps *caps;
-	u32 buftype;
+	bool found;
 
 	if (!fmt)
 		return false;
@@ -1811,12 +1811,13 @@ bool venus_helper_check_format(struct venus_inst *inst, u32 v4l2_pixfmt)
 	if (!caps)
 		return false;
 
-	if (inst->session_type == VIDC_SESSION_TYPE_DEC)
-		buftype = HFI_BUFFER_OUTPUT2;
-	else
-		buftype = HFI_BUFFER_OUTPUT;
+	found = find_fmt_from_caps(caps, HFI_BUFFER_OUTPUT, fmt);
+	if (found)
+		goto done;
 
-	return find_fmt_from_caps(caps, buftype, fmt);
+	found = find_fmt_from_caps(caps, HFI_BUFFER_OUTPUT2, fmt);
+done:
+	return found;
 }
 EXPORT_SYMBOL_GPL(venus_helper_check_format);
 
-- 
2.36.1

