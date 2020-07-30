Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A20B6232FE8
	for <lists+linux-media@lfdr.de>; Thu, 30 Jul 2020 11:54:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729507AbgG3Jyl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Jul 2020 05:54:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729478AbgG3Jyi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Jul 2020 05:54:38 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E9BEC0619D2
        for <linux-media@vger.kernel.org>; Thu, 30 Jul 2020 02:54:38 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id r4so21316579wrx.9
        for <linux-media@vger.kernel.org>; Thu, 30 Jul 2020 02:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=CDZdaQ0UzaVPAl4BrEXf3VptjqZf7e9m4ADVCxDxrwM=;
        b=aBctt9hN1SEHEjvnjyq5z/vDwrSXncytca2M31s3l66fzbVxOfEZ6K2WrM0pxShQAG
         /bDxhTI1jfWBaQdqV1DHm6tZA2Pq2AVmnh0CkhKMV+6JiqmRsNa4XUVqnc+xBLcmoyZ7
         zkWKBfaORiXExgzZErl7Lrq39Mv5kygheDtUP6dlWdR7w4go9C6b6iaqowpp8IYjHKQz
         4np2mGlKZfZltwY62qgby9+r6jIjuV4X1sJUmsssNu+Ty4nJov6ozXIwf56J7yzckley
         dDcDKNe/p9KHT2VVlRJNipdtwGtZTM/XxH7Ws+iYgbOhSLvQp/orR2PEjhz5ksYkCvkQ
         T3Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=CDZdaQ0UzaVPAl4BrEXf3VptjqZf7e9m4ADVCxDxrwM=;
        b=FJjR77tSIlyjmTQTSwtZi82926Bxyy9Fhb43uvZSKMp4bx95hX+ntmKv3BSi8h4sCP
         uL3EB40XbU/r7TSt67R8RTtrVbnLFHfU7nFyL5+qHbz/aoKCCUEj84XoowyPNfrFsgOp
         lU3z674RfRXWL0qvx3nTdfCFE9rY58klGWiSQL8cMOySA3CTWk4owleEGbkshmVv86I0
         rhEIbdAXK3iKe0fpqCJVXj/0FAM1F8YwyDbDari6YyrfKNmQ2AYyUioo1X+McgQEqvBL
         7vGUbMtFgZ5yCrNa8O42X1NCO952ljDPBTVIglk2AWcfp2g34g1neBbHlb6zLxIBtBcn
         R7/A==
X-Gm-Message-State: AOAM531U6qbPFuQYfG3zChM1ymwSzMh5MadizaND6tJ0cOODu8lZq2Ki
        xRE9Rj8XE/ZSfAnNblozavs25A==
X-Google-Smtp-Source: ABdhPJx/B/OXkKu4Gty1PyBAlg5p4CeBzcpdxJ5UJ/rubahK4WjxK5/CCwYAsAy+9vzZvVCBXCRHHA==
X-Received: by 2002:a05:6000:124c:: with SMTP id j12mr2097457wrx.83.1596102876865;
        Thu, 30 Jul 2020 02:54:36 -0700 (PDT)
Received: from localhost.localdomain ([195.24.90.54])
        by smtp.gmail.com with ESMTPSA id u1sm10623139wrb.78.2020.07.30.02.54.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2020 02:54:36 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     jim.cromie@gmail.com, Joe Perches <joe@perches.com>,
        Jason Baron <jbaron@akamai.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v5 3/3] venus: Make debug infrastructure more flexible
Date:   Thu, 30 Jul 2020 12:53:50 +0300
Message-Id: <20200730095350.13925-4-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200730095350.13925-1-stanimir.varbanov@linaro.org>
References: <20200730095350.13925-1-stanimir.varbanov@linaro.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Here we introduce debug prefixes for dev_dbg groups by level of
importance - Venus{Low,Med,High,FW} Enabling the particular level
will be done by dynamic debug.

For example to enable debug messages with low level:
echo 'format "VenusLow" +p' > debugfs/dynamic_debug/control

If you want to enable all levels:
echo 'format "Venus" +p' > debugfs/dynamic_debug/control

All the features which dynamic debugging provide are preserved.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/media/platform/qcom/venus/core.h       |  5 +++++
 drivers/media/platform/qcom/venus/helpers.c    |  2 +-
 drivers/media/platform/qcom/venus/hfi_msgs.c   | 18 +++++++++---------
 drivers/media/platform/qcom/venus/hfi_venus.c  |  4 ++--
 drivers/media/platform/qcom/venus/pm_helpers.c |  2 +-
 drivers/media/platform/qcom/venus/vdec.c       |  6 +++---
 6 files changed, 21 insertions(+), 16 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index b48782f9aa95..b1c94316a553 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -15,6 +15,11 @@
 #include "dbgfs.h"
 #include "hfi.h"
 
+#define VDBGL	"VenusLow : "
+#define VDBGM	"VenusMed : "
+#define VDBGH	"VenusHigh: "
+#define VDBGFW	"VenusFW  : "
+
 #define VIDC_CLKS_NUM_MAX		4
 #define VIDC_VCODEC_CLKS_NUM_MAX	2
 #define VIDC_PMDOMAINS_NUM_MAX		3
diff --git a/drivers/media/platform/qcom/venus/helpers.c b/drivers/media/platform/qcom/venus/helpers.c
index 0143af7822b2..7147871d9dc1 100644
--- a/drivers/media/platform/qcom/venus/helpers.c
+++ b/drivers/media/platform/qcom/venus/helpers.c
@@ -396,7 +396,7 @@ put_ts_metadata(struct venus_inst *inst, struct vb2_v4l2_buffer *vbuf)
 	}
 
 	if (slot == -1) {
-		dev_dbg(inst->core->dev, "%s: no free slot\n", __func__);
+		dev_dbg(inst->core->dev, VDBGL "no free slot\n");
 		return;
 	}
 
diff --git a/drivers/media/platform/qcom/venus/hfi_msgs.c b/drivers/media/platform/qcom/venus/hfi_msgs.c
index 279a9d6fe737..06a1908ca225 100644
--- a/drivers/media/platform/qcom/venus/hfi_msgs.c
+++ b/drivers/media/platform/qcom/venus/hfi_msgs.c
@@ -138,7 +138,7 @@ static void event_sys_error(struct venus_core *core, u32 event,
 			    struct hfi_msg_event_notify_pkt *pkt)
 {
 	if (pkt)
-		dev_dbg(core->dev,
+		dev_dbg(core->dev, VDBGH
 			"sys error (session id:%x, data1:%x, data2:%x)\n",
 			pkt->shdr.session_id, pkt->event_data1,
 			pkt->event_data2);
@@ -152,7 +152,7 @@ event_session_error(struct venus_core *core, struct venus_inst *inst,
 {
 	struct device *dev = core->dev;
 
-	dev_dbg(dev, "session error: event id:%x, session id:%x\n",
+	dev_dbg(dev, VDBGH "session error: event id:%x, session id:%x\n",
 		pkt->event_data1, pkt->shdr.session_id);
 
 	if (!inst)
@@ -247,7 +247,7 @@ sys_get_prop_image_version(struct device *dev,
 		/* bad packet */
 		return;
 
-	dev_dbg(dev, "F/W version: %s\n", (u8 *)&pkt->data[1]);
+	dev_dbg(dev, VDBGL "F/W version: %s\n", (u8 *)&pkt->data[1]);
 }
 
 static void hfi_sys_property_info(struct venus_core *core,
@@ -257,7 +257,7 @@ static void hfi_sys_property_info(struct venus_core *core,
 	struct device *dev = core->dev;
 
 	if (!pkt->num_properties) {
-		dev_dbg(dev, "%s: no properties\n", __func__);
+		dev_dbg(dev, VDBGL "no properties\n");
 		return;
 	}
 
@@ -266,7 +266,7 @@ static void hfi_sys_property_info(struct venus_core *core,
 		sys_get_prop_image_version(dev, pkt);
 		break;
 	default:
-		dev_dbg(dev, "%s: unknown property data\n", __func__);
+		dev_dbg(dev, VDBGL "unknown property data\n");
 		break;
 	}
 }
@@ -297,7 +297,7 @@ static void hfi_sys_ping_done(struct venus_core *core, struct venus_inst *inst,
 static void hfi_sys_idle_done(struct venus_core *core, struct venus_inst *inst,
 			      void *packet)
 {
-	dev_dbg(core->dev, "sys idle\n");
+	dev_dbg(core->dev, VDBGL "sys idle\n");
 }
 
 static void hfi_sys_pc_prepare_done(struct venus_core *core,
@@ -305,7 +305,8 @@ static void hfi_sys_pc_prepare_done(struct venus_core *core,
 {
 	struct hfi_msg_sys_pc_prep_done_pkt *pkt = packet;
 
-	dev_dbg(core->dev, "pc prepare done (error %x)\n", pkt->error_type);
+	dev_dbg(core->dev, VDBGL "pc prepare done (error %x)\n",
+		pkt->error_type);
 }
 
 static unsigned int
@@ -387,8 +388,7 @@ static void hfi_session_prop_info(struct venus_core *core,
 	case HFI_PROPERTY_CONFIG_VDEC_ENTROPY:
 		break;
 	default:
-		dev_dbg(dev, "%s: unknown property id:%x\n", __func__,
-			pkt->data[0]);
+		dev_dbg(dev, VDBGM "unknown property id:%x\n", pkt->data[0]);
 		return;
 	}
 
diff --git a/drivers/media/platform/qcom/venus/hfi_venus.c b/drivers/media/platform/qcom/venus/hfi_venus.c
index 450c4800c12e..cb9367254c4e 100644
--- a/drivers/media/platform/qcom/venus/hfi_venus.c
+++ b/drivers/media/platform/qcom/venus/hfi_venus.c
@@ -477,7 +477,7 @@ static u32 venus_hwversion(struct venus_hfi_device *hdev)
 	minor = minor >> WRAPPER_HW_VERSION_MINOR_VERSION_SHIFT;
 	step = ver & WRAPPER_HW_VERSION_STEP_VERSION_MASK;
 
-	dev_dbg(dev, "venus hw version %x.%x.%x\n", major, minor, step);
+	dev_dbg(dev, VDBGL "venus hw version %x.%x.%x\n", major, minor, step);
 
 	return major;
 }
@@ -906,7 +906,7 @@ static void venus_flush_debug_queue(struct venus_hfi_device *hdev)
 		if (pkt->hdr.pkt_type != HFI_MSG_SYS_COV) {
 			struct hfi_msg_sys_debug_pkt *pkt = packet;
 
-			dev_dbg(dev, "%s", pkt->msg_data);
+			dev_dbg(dev, VDBGFW "%s", pkt->msg_data);
 		}
 	}
 }
diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
index 531e7a41658f..cecf079cf0b8 100644
--- a/drivers/media/platform/qcom/venus/pm_helpers.c
+++ b/drivers/media/platform/qcom/venus/pm_helpers.c
@@ -212,7 +212,7 @@ static int load_scale_bw(struct venus_core *core)
 	}
 	mutex_unlock(&core->lock);
 
-	dev_dbg(core->dev, "total: avg_bw: %u, peak_bw: %u\n",
+	dev_dbg(core->dev, VDBGL "total: avg_bw: %u, peak_bw: %u\n",
 		total_avg, total_peak);
 
 	return icc_set_bw(core->video_path, total_avg, total_peak);
diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index 7c4c483d5438..6a71fc47273e 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -225,7 +225,7 @@ static int vdec_check_src_change(struct venus_inst *inst)
 
 	if (!(inst->codec_state == VENUS_DEC_STATE_CAPTURE_SETUP) ||
 	    !inst->reconfig)
-		dev_dbg(inst->core->dev, "%s: wrong state\n", __func__);
+		dev_dbg(inst->core->dev, VDBGH "wrong state\n");
 
 done:
 	return 0;
@@ -1310,7 +1310,7 @@ static void vdec_event_change(struct venus_inst *inst,
 	if (inst->bit_depth != ev_data->bit_depth)
 		inst->bit_depth = ev_data->bit_depth;
 
-	dev_dbg(dev, "event %s sufficient resources (%ux%u)\n",
+	dev_dbg(dev, VDBGM "event %s sufficient resources (%ux%u)\n",
 		sufficient ? "" : "not", ev_data->width, ev_data->height);
 
 	if (sufficient) {
@@ -1344,7 +1344,7 @@ static void vdec_event_change(struct venus_inst *inst,
 
 		ret = hfi_session_flush(inst, HFI_FLUSH_OUTPUT, false);
 		if (ret)
-			dev_dbg(dev, "flush output error %d\n", ret);
+			dev_dbg(dev, VDBGH "flush output error %d\n", ret);
 	}
 
 	inst->reconfig = true;
-- 
2.17.1

