Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 185313B8E99
	for <lists+linux-media@lfdr.de>; Thu,  1 Jul 2021 10:06:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235220AbhGAIIl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 1 Jul 2021 04:08:41 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:13117 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235211AbhGAIIk (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 1 Jul 2021 04:08:40 -0400
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 01 Jul 2021 01:06:10 -0700
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA; 01 Jul 2021 01:06:08 -0700
X-QCInternal: smtphost
Received: from dikshita-linux.qualcomm.com ([10.204.65.237])
  by ironmsg02-blr.qualcomm.com with ESMTP; 01 Jul 2021 13:36:08 +0530
Received: by dikshita-linux.qualcomm.com (Postfix, from userid 347544)
        id 85CBC21A36; Thu,  1 Jul 2021 13:36:07 +0530 (IST)
From:   Dikshita Agarwal <dikshita@codeaurora.org>
To:     linux-media@vger.kernel.org, stanimir.varbanov@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org, Dikshita Agarwal <dikshita@codeaurora.org>
Subject: [PATCH v2 5/7] venus: vdec: set work route to fw
Date:   Thu,  1 Jul 2021 13:35:34 +0530
Message-Id: <1625126736-16266-6-git-send-email-dikshita@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1625126736-16266-1-git-send-email-dikshita@codeaurora.org>
References: <1625126736-16266-1-git-send-email-dikshita@codeaurora.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Set work route to FW based on num of vpp pipes.

Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
---
 drivers/media/platform/qcom/venus/hfi_cmds.c   |  7 +++++++
 drivers/media/platform/qcom/venus/hfi_helper.h |  5 +++++
 drivers/media/platform/qcom/venus/vdec.c       | 22 ++++++++++++++++++++++
 3 files changed, 34 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/hfi_cmds.c b/drivers/media/platform/qcom/venus/hfi_cmds.c
index 11a8347..837fb80 100644
--- a/drivers/media/platform/qcom/venus/hfi_cmds.c
+++ b/drivers/media/platform/qcom/venus/hfi_cmds.c
@@ -1290,6 +1290,13 @@ pkt_session_set_property_6xx(struct hfi_session_set_property_pkt *pkt,
 		pkt->shdr.hdr.size += sizeof(u32) + sizeof(*color);
 		break;
 	}
+	case HFI_PROPERTY_PARAM_WORK_ROUTE: {
+		struct hfi_video_work_route *in = pdata, *wr = prop_data;
+
+		wr->video_work_route = in->video_work_route;
+		pkt->shdr.hdr.size += sizeof(u32) + sizeof(*wr);
+		break;
+	}
 	default:
 		return pkt_session_set_property_4xx(pkt, cookie, ptype, pdata);
 	}
diff --git a/drivers/media/platform/qcom/venus/hfi_helper.h b/drivers/media/platform/qcom/venus/hfi_helper.h
index 63cd347..185c302 100644
--- a/drivers/media/platform/qcom/venus/hfi_helper.h
+++ b/drivers/media/platform/qcom/venus/hfi_helper.h
@@ -451,6 +451,7 @@
 #define HFI_PROPERTY_PARAM_MVC_BUFFER_LAYOUT			0x100f
 #define HFI_PROPERTY_PARAM_MAX_SESSIONS_SUPPORTED		0x1010
 #define HFI_PROPERTY_PARAM_WORK_MODE				0x1015
+#define HFI_PROPERTY_PARAM_WORK_ROUTE				0x1017
 
 /*
  * HFI_PROPERTY_CONFIG_COMMON_START
@@ -864,6 +865,10 @@ struct hfi_video_work_mode {
 	u32 video_work_mode;
 };
 
+struct hfi_video_work_route {
+	u32 video_work_route;
+};
+
 struct hfi_h264_vui_timing_info {
 	u32 enable;
 	u32 fixed_framerate;
diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index ddb7cd3..892be8d 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -653,6 +653,24 @@ static int vdec_set_properties(struct venus_inst *inst)
 	return 0;
 }
 
+static int vdec_set_work_route(struct venus_inst *inst)
+{
+	struct hfi_video_work_route wr;
+	u32 ptype;
+	int ret;
+
+	if(!IS_V6(inst->core))
+		return 0;
+
+	wr.video_work_route = inst->core->res->num_vpp_pipes;
+
+	ptype = HFI_PROPERTY_PARAM_WORK_ROUTE;
+	ret = hfi_session_set_property(inst, ptype, &wr);
+	if (ret)
+		return ret;
+	return 0;
+}
+
 #define is_ubwc_fmt(fmt) (!!((fmt) & HFI_COLOR_FORMAT_UBWC_BASE))
 
 static int vdec_output_conf(struct venus_inst *inst)
@@ -1039,6 +1057,10 @@ static int vdec_start_output(struct venus_inst *inst)
 	if (ret)
 		return ret;
 
+	ret = vdec_set_work_route(inst);
+	if (ret)
+		return ret;
+
 	ret = vdec_output_conf(inst);
 	if (ret)
 		return ret;
-- 
2.7.4

