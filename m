Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 980E52CEBBA
	for <lists+linux-media@lfdr.de>; Fri,  4 Dec 2020 11:05:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387939AbgLDKDi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Dec 2020 05:03:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387969AbgLDKDh (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Dec 2020 05:03:37 -0500
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5761FC08E860
        for <linux-media@vger.kernel.org>; Fri,  4 Dec 2020 02:02:12 -0800 (PST)
Received: by mail-ed1-x542.google.com with SMTP id r5so5172681eda.12
        for <linux-media@vger.kernel.org>; Fri, 04 Dec 2020 02:02:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=QyipFjHgAmocE8ormLtvsmE4o3Jh7LHKovtmyPj5YlM=;
        b=ZBf9b1W6r6l4f2RQfTOX0527qxCRZgPZInel8c4Q3Gj3IbZSvLi0LqxtupwL0sXUHd
         ehbvyWp7+aGYI2XDYwTSmR99t9iAqNd9XhFBuFquRE4Gd1HFYJZnZLOdoGikFj1aXRel
         NER8UoatYNhrNWio8TbZbi9T+zBPqz+02hgOQBz6g9AaAnGsIJE3AMNFogRW4MyxYsjV
         +Y8dMGWhm5Y/2cNmXMrJ9sCpNzKdDxLJp6B46NMkzdhJjiyP9Doox6bsRM5XATY7lf0/
         bTA0u5OfG0oIUiHrJwm2VyURrlHLVlVHbA17tm8R5rEAnCUA7PmEqwKMvQgot/VxbGG+
         fosg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=QyipFjHgAmocE8ormLtvsmE4o3Jh7LHKovtmyPj5YlM=;
        b=X7XjTWgi+7r/ZnqD00Ais8/DLDuUVoXSCs5czhcJCdY1dxVwo+Roe7tu/rJE5e9vaB
         sOQH4zaSVhj4cg3+CVSont1EsBIftCzLj8dMiS3AdAtoMMpIUMhlulGoIePQILdiXMXS
         FTiEkXGcNWJ23WEJg2At38+KeM9VmyrJd6nOuk/lf2W/2eBe7/jivBO99V0x9+nMwlce
         8whvbRKCBsQyXPDjzFg+DfoUjuHyfAA3oCTQ1OUxiK5gVe5/bYt9cKJAUs2vcnyO1/mc
         QPTw106JoOyzlEHS6VHuvL++9LOta1Oyp01RlyM/yhY7BaOcsBr/s9SHYM6W+jGNUdKU
         Q0CA==
X-Gm-Message-State: AOAM533icHesqPoAptqltekbUvswYcrSF50FVQhwQBMWalsgMvJT/pus
        eGtG9XpYrpLb+0uDj2u1aTeGeYjHzLX/Q41/
X-Google-Smtp-Source: ABdhPJyYTg8kwFLyrDBUIa+TKRZpk9wxumWXzQyNxJGm+Yh/z6nP9bGPgalMXl24jQ3598vQ84NwNA==
X-Received: by 2002:a05:6402:1b1e:: with SMTP id by30mr5474668edb.75.1607076130701;
        Fri, 04 Dec 2020 02:02:10 -0800 (PST)
Received: from localhost.localdomain (hst-221-106.medicom.bg. [84.238.221.106])
        by smtp.gmail.com with ESMTPSA id p35sm3238242edd.58.2020.12.04.02.02.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Dec 2020 02:02:10 -0800 (PST)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     dikshita@codeaurora.org, Alexandre Courbot <acourbot@chromium.org>,
        Vikash Garodia <vgarodia@codeaurora.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v2 3/4] media: venus: request for interrupt from venus
Date:   Fri,  4 Dec 2020 12:01:38 +0200
Message-Id: <20201204100139.6216-4-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201204100139.6216-1-stanimir.varbanov@linaro.org>
References: <20201204100139.6216-1-stanimir.varbanov@linaro.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Vikash Garodia <vgarodia@codeaurora.org>

For synchronous commands, update the message queue variable.
This would inform video firmware to raise interrupt on host
CPU whenever there is a response for such commands.

Signed-off-by: Vikash Garodia <vgarodia@codeaurora.org>
Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/media/platform/qcom/venus/hfi_venus.c | 77 +++++++++++--------
 1 file changed, 44 insertions(+), 33 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/hfi_venus.c b/drivers/media/platform/qcom/venus/hfi_venus.c
index 4be4a75ddcb6..3d16afc461bb 100644
--- a/drivers/media/platform/qcom/venus/hfi_venus.c
+++ b/drivers/media/platform/qcom/venus/hfi_venus.c
@@ -372,7 +372,7 @@ static void venus_soft_int(struct venus_hfi_device *hdev)
 }
 
 static int venus_iface_cmdq_write_nolock(struct venus_hfi_device *hdev,
-					 void *pkt)
+					 void *pkt, bool sync)
 {
 	struct device *dev = hdev->core->dev;
 	struct hfi_pkt_hdr *cmd_packet;
@@ -394,18 +394,29 @@ static int venus_iface_cmdq_write_nolock(struct venus_hfi_device *hdev,
 		return ret;
 	}
 
+	if (sync) {
+		/*
+		 * Inform video hardware to raise interrupt for synchronous
+		 * commands
+		 */
+		queue = &hdev->queues[IFACEQ_MSG_IDX];
+		queue->qhdr->rx_req = 1;
+		/* ensure rx_req is updated in memory */
+		wmb();
+	}
+
 	if (rx_req)
 		venus_soft_int(hdev);
 
 	return 0;
 }
 
-static int venus_iface_cmdq_write(struct venus_hfi_device *hdev, void *pkt)
+static int venus_iface_cmdq_write(struct venus_hfi_device *hdev, void *pkt, bool sync)
 {
 	int ret;
 
 	mutex_lock(&hdev->lock);
-	ret = venus_iface_cmdq_write_nolock(hdev, pkt);
+	ret = venus_iface_cmdq_write_nolock(hdev, pkt, sync);
 	mutex_unlock(&hdev->lock);
 
 	return ret;
@@ -428,7 +439,7 @@ static int venus_hfi_core_set_resource(struct venus_core *core, u32 id,
 	if (ret)
 		return ret;
 
-	ret = venus_iface_cmdq_write(hdev, pkt);
+	ret = venus_iface_cmdq_write(hdev, pkt, false);
 	if (ret)
 		return ret;
 
@@ -778,7 +789,7 @@ static int venus_sys_set_debug(struct venus_hfi_device *hdev, u32 debug)
 
 	pkt_sys_debug_config(pkt, HFI_DEBUG_MODE_QUEUE, debug);
 
-	ret = venus_iface_cmdq_write(hdev, pkt);
+	ret = venus_iface_cmdq_write(hdev, pkt, false);
 	if (ret)
 		return ret;
 
@@ -795,7 +806,7 @@ static int venus_sys_set_coverage(struct venus_hfi_device *hdev, u32 mode)
 
 	pkt_sys_coverage_config(pkt, mode);
 
-	ret = venus_iface_cmdq_write(hdev, pkt);
+	ret = venus_iface_cmdq_write(hdev, pkt, false);
 	if (ret)
 		return ret;
 
@@ -816,7 +827,7 @@ static int venus_sys_set_idle_message(struct venus_hfi_device *hdev,
 
 	pkt_sys_idle_indicator(pkt, enable);
 
-	ret = venus_iface_cmdq_write(hdev, pkt);
+	ret = venus_iface_cmdq_write(hdev, pkt, false);
 	if (ret)
 		return ret;
 
@@ -834,7 +845,7 @@ static int venus_sys_set_power_control(struct venus_hfi_device *hdev,
 
 	pkt_sys_power_control(pkt, enable);
 
-	ret = venus_iface_cmdq_write(hdev, pkt);
+	ret = venus_iface_cmdq_write(hdev, pkt, false);
 	if (ret)
 		return ret;
 
@@ -885,14 +896,14 @@ static int venus_sys_set_default_properties(struct venus_hfi_device *hdev)
 	return ret;
 }
 
-static int venus_session_cmd(struct venus_inst *inst, u32 pkt_type)
+static int venus_session_cmd(struct venus_inst *inst, u32 pkt_type, bool sync)
 {
 	struct venus_hfi_device *hdev = to_hfi_priv(inst->core);
 	struct hfi_session_pkt pkt;
 
 	pkt_session_cmd(&pkt, pkt_type, inst);
 
-	return venus_iface_cmdq_write(hdev, &pkt);
+	return venus_iface_cmdq_write(hdev, &pkt, sync);
 }
 
 static void venus_flush_debug_queue(struct venus_hfi_device *hdev)
@@ -922,7 +933,7 @@ static int venus_prepare_power_collapse(struct venus_hfi_device *hdev,
 
 	pkt_sys_pc_prep(&pkt);
 
-	ret = venus_iface_cmdq_write(hdev, &pkt);
+	ret = venus_iface_cmdq_write(hdev, &pkt, false);
 	if (ret)
 		return ret;
 
@@ -1064,13 +1075,13 @@ static int venus_core_init(struct venus_core *core)
 
 	venus_set_state(hdev, VENUS_STATE_INIT);
 
-	ret = venus_iface_cmdq_write(hdev, &pkt);
+	ret = venus_iface_cmdq_write(hdev, &pkt, false);
 	if (ret)
 		return ret;
 
 	pkt_sys_image_version(&version_pkt);
 
-	ret = venus_iface_cmdq_write(hdev, &version_pkt);
+	ret = venus_iface_cmdq_write(hdev, &version_pkt, false);
 	if (ret)
 		dev_warn(dev, "failed to send image version pkt to fw\n");
 
@@ -1099,7 +1110,7 @@ static int venus_core_ping(struct venus_core *core, u32 cookie)
 
 	pkt_sys_ping(&pkt, cookie);
 
-	return venus_iface_cmdq_write(hdev, &pkt);
+	return venus_iface_cmdq_write(hdev, &pkt, false);
 }
 
 static int venus_core_trigger_ssr(struct venus_core *core, u32 trigger_type)
@@ -1112,7 +1123,7 @@ static int venus_core_trigger_ssr(struct venus_core *core, u32 trigger_type)
 	if (ret)
 		return ret;
 
-	return venus_iface_cmdq_write(hdev, &pkt);
+	return venus_iface_cmdq_write(hdev, &pkt, false);
 }
 
 static int venus_session_init(struct venus_inst *inst, u32 session_type,
@@ -1130,7 +1141,7 @@ static int venus_session_init(struct venus_inst *inst, u32 session_type,
 	if (ret)
 		goto err;
 
-	ret = venus_iface_cmdq_write(hdev, &pkt);
+	ret = venus_iface_cmdq_write(hdev, &pkt, true);
 	if (ret)
 		goto err;
 
@@ -1151,7 +1162,7 @@ static int venus_session_end(struct venus_inst *inst)
 			dev_warn(dev, "fw coverage msg ON failed\n");
 	}
 
-	return venus_session_cmd(inst, HFI_CMD_SYS_SESSION_END);
+	return venus_session_cmd(inst, HFI_CMD_SYS_SESSION_END, true);
 }
 
 static int venus_session_abort(struct venus_inst *inst)
@@ -1160,7 +1171,7 @@ static int venus_session_abort(struct venus_inst *inst)
 
 	venus_flush_debug_queue(hdev);
 
-	return venus_session_cmd(inst, HFI_CMD_SYS_SESSION_ABORT);
+	return venus_session_cmd(inst, HFI_CMD_SYS_SESSION_ABORT, true);
 }
 
 static int venus_session_flush(struct venus_inst *inst, u32 flush_mode)
@@ -1173,22 +1184,22 @@ static int venus_session_flush(struct venus_inst *inst, u32 flush_mode)
 	if (ret)
 		return ret;
 
-	return venus_iface_cmdq_write(hdev, &pkt);
+	return venus_iface_cmdq_write(hdev, &pkt, true);
 }
 
 static int venus_session_start(struct venus_inst *inst)
 {
-	return venus_session_cmd(inst, HFI_CMD_SESSION_START);
+	return venus_session_cmd(inst, HFI_CMD_SESSION_START, true);
 }
 
 static int venus_session_stop(struct venus_inst *inst)
 {
-	return venus_session_cmd(inst, HFI_CMD_SESSION_STOP);
+	return venus_session_cmd(inst, HFI_CMD_SESSION_STOP, true);
 }
 
 static int venus_session_continue(struct venus_inst *inst)
 {
-	return venus_session_cmd(inst, HFI_CMD_SESSION_CONTINUE);
+	return venus_session_cmd(inst, HFI_CMD_SESSION_CONTINUE, false);
 }
 
 static int venus_session_etb(struct venus_inst *inst,
@@ -1205,7 +1216,7 @@ static int venus_session_etb(struct venus_inst *inst,
 		if (ret)
 			return ret;
 
-		ret = venus_iface_cmdq_write(hdev, &pkt);
+		ret = venus_iface_cmdq_write(hdev, &pkt, false);
 	} else if (session_type == VIDC_SESSION_TYPE_ENC) {
 		struct hfi_session_empty_buffer_uncompressed_plane0_pkt pkt;
 
@@ -1213,7 +1224,7 @@ static int venus_session_etb(struct venus_inst *inst,
 		if (ret)
 			return ret;
 
-		ret = venus_iface_cmdq_write(hdev, &pkt);
+		ret = venus_iface_cmdq_write(hdev, &pkt, false);
 	} else {
 		ret = -EINVAL;
 	}
@@ -1232,7 +1243,7 @@ static int venus_session_ftb(struct venus_inst *inst,
 	if (ret)
 		return ret;
 
-	return venus_iface_cmdq_write(hdev, &pkt);
+	return venus_iface_cmdq_write(hdev, &pkt, false);
 }
 
 static int venus_session_set_buffers(struct venus_inst *inst,
@@ -1252,7 +1263,7 @@ static int venus_session_set_buffers(struct venus_inst *inst,
 	if (ret)
 		return ret;
 
-	return venus_iface_cmdq_write(hdev, pkt);
+	return venus_iface_cmdq_write(hdev, pkt, false);
 }
 
 static int venus_session_unset_buffers(struct venus_inst *inst,
@@ -1272,17 +1283,17 @@ static int venus_session_unset_buffers(struct venus_inst *inst,
 	if (ret)
 		return ret;
 
-	return venus_iface_cmdq_write(hdev, pkt);
+	return venus_iface_cmdq_write(hdev, pkt, true);
 }
 
 static int venus_session_load_res(struct venus_inst *inst)
 {
-	return venus_session_cmd(inst, HFI_CMD_SESSION_LOAD_RESOURCES);
+	return venus_session_cmd(inst, HFI_CMD_SESSION_LOAD_RESOURCES, true);
 }
 
 static int venus_session_release_res(struct venus_inst *inst)
 {
-	return venus_session_cmd(inst, HFI_CMD_SESSION_RELEASE_RESOURCES);
+	return venus_session_cmd(inst, HFI_CMD_SESSION_RELEASE_RESOURCES, true);
 }
 
 static int venus_session_parse_seq_hdr(struct venus_inst *inst, u32 seq_hdr,
@@ -1299,7 +1310,7 @@ static int venus_session_parse_seq_hdr(struct venus_inst *inst, u32 seq_hdr,
 	if (ret)
 		return ret;
 
-	ret = venus_iface_cmdq_write(hdev, pkt);
+	ret = venus_iface_cmdq_write(hdev, pkt, false);
 	if (ret)
 		return ret;
 
@@ -1320,7 +1331,7 @@ static int venus_session_get_seq_hdr(struct venus_inst *inst, u32 seq_hdr,
 	if (ret)
 		return ret;
 
-	return venus_iface_cmdq_write(hdev, pkt);
+	return venus_iface_cmdq_write(hdev, pkt, false);
 }
 
 static int venus_session_set_property(struct venus_inst *inst, u32 ptype,
@@ -1339,7 +1350,7 @@ static int venus_session_set_property(struct venus_inst *inst, u32 ptype,
 	if (ret)
 		return ret;
 
-	return venus_iface_cmdq_write(hdev, pkt);
+	return venus_iface_cmdq_write(hdev, pkt, false);
 }
 
 static int venus_session_get_property(struct venus_inst *inst, u32 ptype)
@@ -1352,7 +1363,7 @@ static int venus_session_get_property(struct venus_inst *inst, u32 ptype)
 	if (ret)
 		return ret;
 
-	return venus_iface_cmdq_write(hdev, &pkt);
+	return venus_iface_cmdq_write(hdev, &pkt, true);
 }
 
 static int venus_resume(struct venus_core *core)
-- 
2.17.1

