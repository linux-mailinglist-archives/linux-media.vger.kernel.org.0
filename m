Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ACFE02FCD1
	for <lists+linux-media@lfdr.de>; Thu, 30 May 2019 15:59:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727263AbfE3N7R (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 May 2019 09:59:17 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:46720 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726232AbfE3N7Q (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 May 2019 09:59:16 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 49D97609EF; Thu, 30 May 2019 13:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1559224755;
        bh=Gw03O+/PtVO6JQStq1Nny3J68DvX5BsW7lmhCePed3U=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=OG+gfv4Ni2bzOX1nNoYSy4B6FSPbFPI5Wyq+JBNQu3sGwzbLSL1r7MQpDa9EVKOzX
         98j1lDSNhY2Lm5O7vj3heoa5o6FAjY1lBP1G2bvbjNnEnasG3ImwlFLQwebed0vHqd
         V8Lq8zkx2fdKue0mX/JPvZynEWXMBzLUscZ9bAJY=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from amasule-linux.qualcomm.com (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: amasule@codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id DC96460E5D;
        Thu, 30 May 2019 13:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1559224754;
        bh=Gw03O+/PtVO6JQStq1Nny3J68DvX5BsW7lmhCePed3U=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=EXH6js2pxZoeAE+q/qRjza3UdVT++DP1m2BMWeHoZwju/eVwUInpwt8DVTZQDYuLI
         Drw1Nw0iJ2oSYfeyL4bJb0anZxhu5p9hMWiXapAcSdjKHJM77Op9mLck/hwlqGZ/oi
         wrCVG/5VMoo596Or3Pv9r3FpWxVm59bJkWkTWHk8=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org DC96460E5D
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=amasule@codeaurora.org
From:   Aniket Masule <amasule@codeaurora.org>
To:     linux-media@vger.kernel.org, stanimir.varbanov@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org, Aniket Masule <amasule@codeaurora.org>
Subject: [PATCH 4/5] media: venus: Add interface for load per core
Date:   Thu, 30 May 2019 19:28:27 +0530
Message-Id: <1559224708-6039-5-git-send-email-amasule@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1559224708-6039-1-git-send-email-amasule@codeaurora.org>
References: <1559224708-6039-1-git-send-email-amasule@codeaurora.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add and interface to calculate load per core. Also,
add an interface to get maximum cores available with
video. This interface is preparation for updating core
selection.

Signed-off-by: Aniket Masule <amasule@codeaurora.org>
---
 drivers/media/platform/qcom/venus/helpers.c    | 18 ++++++++++++++++++
 drivers/media/platform/qcom/venus/hfi_helper.h |  1 +
 drivers/media/platform/qcom/venus/hfi_parser.h |  5 +++++
 3 files changed, 24 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/helpers.c b/drivers/media/platform/qcom/venus/helpers.c
index f2470af..692ba3b 100644
--- a/drivers/media/platform/qcom/venus/helpers.c
+++ b/drivers/media/platform/qcom/venus/helpers.c
@@ -331,6 +331,24 @@ static u32 load_per_instance(struct venus_inst *inst)
 	return mbs * inst->fps;
 }
 
+static u32 load_per_core(struct venus_core *core, u32 core_id)
+{
+	struct venus_inst *inst = NULL;
+	u32 mbs_per_sec = 0, load = 0;
+
+	mutex_lock(&core->lock);
+	list_for_each_entry(inst, &core->instances, list) {
+		if (!(inst->clk_data.core_id == core_id))
+			continue;
+
+		mbs_per_sec += load_per_instance(inst);
+		load += mbs_per_sec * inst->clk_data.codec_data->vpp_cycles;
+	}
+	mutex_unlock(&core->lock);
+
+	return load;
+}
+
 static u32 load_per_type(struct venus_core *core, u32 session_type)
 {
 	struct venus_inst *inst = NULL;
diff --git a/drivers/media/platform/qcom/venus/hfi_helper.h b/drivers/media/platform/qcom/venus/hfi_helper.h
index 34ea503..3677e2e 100644
--- a/drivers/media/platform/qcom/venus/hfi_helper.h
+++ b/drivers/media/platform/qcom/venus/hfi_helper.h
@@ -559,6 +559,7 @@ struct hfi_bitrate {
 #define HFI_CAPABILITY_LCU_SIZE				0x14
 #define HFI_CAPABILITY_HIER_P_HYBRID_NUM_ENH_LAYERS	0x15
 #define HFI_CAPABILITY_MBS_PER_SECOND_POWERSAVE		0x16
+#define HFI_CAPABILITY_MAX_VIDEOCORES          0x2B
 
 struct hfi_capability {
 	u32 capability_type;
diff --git a/drivers/media/platform/qcom/venus/hfi_parser.h b/drivers/media/platform/qcom/venus/hfi_parser.h
index 3e931c7..264e6dd 100644
--- a/drivers/media/platform/qcom/venus/hfi_parser.h
+++ b/drivers/media/platform/qcom/venus/hfi_parser.h
@@ -107,4 +107,9 @@ static inline u32 frate_step(struct venus_inst *inst)
 	return cap_step(inst, HFI_CAPABILITY_FRAMERATE);
 }
 
+static inline u32 core_num_max(struct venus_inst *inst)
+{
+	return cap_max(inst, HFI_CAPABILITY_MAX_VIDEOCORES);
+}
+
 #endif
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

