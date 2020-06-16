Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE2681FB0C1
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2020 14:32:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728864AbgFPMbi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Jun 2020 08:31:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728823AbgFPMbh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Jun 2020 08:31:37 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09D64C08C5C4
        for <linux-media@vger.kernel.org>; Tue, 16 Jun 2020 05:31:37 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id w7so14140833edt.1
        for <linux-media@vger.kernel.org>; Tue, 16 Jun 2020 05:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Dvi8JfbBrV+2ddKi5DN+7RJijpQ/Ouj52VNCZEqpYYk=;
        b=EdWyIPkFWo8jvAbm0kCDVrGTr5Q6GcbXhZa6ipb2GTYbO2kqpKpcEaej1jUKTaQmnl
         0gDyl4qzdAESK3p4EKf/jjCqVjEfuOmKHhuM4gmIXiHIu/3IEpoJTVVCmsl7A0YJqCEY
         ipH7mmXz0PWStcwAS4PsINSqM6yDOokLELSs+TAJ8YGZuS4m7TfLcR0TqNvbiAKhvnlB
         wO55Q/82beGzUjY5VXOFrF5WqyxqWc3LYfUrlSOs3FrFw+FdR4WsIjRioKWViEVVjD6/
         UMv7tYgEp2ocTe0DrfhA1wU4uBhsJuIF1nSMuF1LfEFZkIqpLxz08yVFUBeaQzvSR/Yp
         umjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Dvi8JfbBrV+2ddKi5DN+7RJijpQ/Ouj52VNCZEqpYYk=;
        b=m8kCvoSJ2CuDZd188ZNdEihSrvnkgBVWDQrjHkQIXC1yTmivcksEqui4WWKQjK2x9C
         a9tWXJ/qBagFOb59wp1cFcTLqsp+L3PeHPK0vapSGghKHyBE5f6bQ2FPTaCvAhU+R8pG
         RhInqwnp/HC5tRlxokMNSQtRKaxKEtH8ghJOWm/dnSUhoZ9xMybKKTbKGb28bMmzCug+
         6vrv7M3ldPvbeEOwFIZGkbiTu7QbDiCLbm6C0Nu96eIzf4S3v+jod/x1DmVqj7pNQySM
         +N0TaYFWthHKi9hNtr8BCdw41B3bV9CCZUwO+7LCYXPwcTH14Atg3Pv6hyhvI2pHEjMA
         LlqA==
X-Gm-Message-State: AOAM531L/ora7LJQAPDUNJRmtcgUpLdzrfhL7r5fHJDPpWjjhb0coUdL
        0I1XQLSSEouLQqz6I6Leu03W2yo5ODfK1g==
X-Google-Smtp-Source: ABdhPJxPeE1MSHiHilq/zwKZGg5Im1UhiJSvzd+fy4QQj4jUByZCCuMb1QVW7vOOUrp7mQyzk2NyNA==
X-Received: by 2002:a50:8d18:: with SMTP id s24mr2314905eds.303.1592310695502;
        Tue, 16 Jun 2020 05:31:35 -0700 (PDT)
Received: from localhost.localdomain (212-5-158-38.ip.btc-net.bg. [212.5.158.38])
        by smtp.gmail.com with ESMTPSA id p6sm11071983ejb.71.2020.06.16.05.31.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2020 05:31:35 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Maheshwar Ajja <majja@codeaurora.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH 2/4] venus: venc: Add support for constant quality control
Date:   Tue, 16 Jun 2020 15:29:59 +0300
Message-Id: <20200616123001.11321-3-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200616123001.11321-1-stanimir.varbanov@linaro.org>
References: <20200616123001.11321-1-stanimir.varbanov@linaro.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Adds implementation of V4L2_CID_MPEG_VIDEO_CONSTANT_QUALITY v4l
control when the bitrate mode is CQ.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/media/platform/qcom/venus/core.h      |  1 +
 drivers/media/platform/qcom/venus/hfi_cmds.c  | 49 ++++++++++++++++++-
 .../media/platform/qcom/venus/hfi_helper.h    |  4 +-
 drivers/media/platform/qcom/venus/venc.c      |  4 +-
 .../media/platform/qcom/venus/venc_ctrls.c    |  6 +++
 5 files changed, 61 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index 7118612673c9..1bac30d4cf50 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -201,6 +201,7 @@ struct venc_controls {
 	u32 bitrate;
 	u32 bitrate_peak;
 	u32 rc_enable;
+	u32 const_quality;
 
 	u32 h264_i_period;
 	u32 h264_entropy_mode;
diff --git a/drivers/media/platform/qcom/venus/hfi_cmds.c b/drivers/media/platform/qcom/venus/hfi_cmds.c
index c67e412f8201..de6660c5335d 100644
--- a/drivers/media/platform/qcom/venus/hfi_cmds.c
+++ b/drivers/media/platform/qcom/venus/hfi_cmds.c
@@ -1218,6 +1218,50 @@ pkt_session_set_property_4xx(struct hfi_session_set_property_pkt *pkt,
 	return 0;
 }
 
+static int
+pkt_session_set_property_6xx(struct hfi_session_set_property_pkt *pkt,
+			     void *cookie, u32 ptype, void *pdata)
+{
+	void *prop_data;
+
+	if (!pkt || !cookie || !pdata)
+		return -EINVAL;
+
+	prop_data = &pkt->data[1];
+
+	pkt->shdr.hdr.size = sizeof(*pkt);
+	pkt->shdr.hdr.pkt_type = HFI_CMD_SESSION_SET_PROPERTY;
+	pkt->shdr.session_id = hash32_ptr(cookie);
+	pkt->num_properties = 1;
+	pkt->data[0] = ptype;
+
+	switch (ptype) {
+	case HFI_PROPERTY_PARAM_VENC_RATE_CONTROL: {
+		u32 *in = pdata;
+
+		switch (*in) {
+		case HFI_RATE_CONTROL_OFF:
+		case HFI_RATE_CONTROL_CBR_CFR:
+		case HFI_RATE_CONTROL_CBR_VFR:
+		case HFI_RATE_CONTROL_VBR_CFR:
+		case HFI_RATE_CONTROL_VBR_VFR:
+		case HFI_RATE_CONTROL_CQ:
+			break;
+		default:
+			return -EINVAL;
+		}
+
+		pkt->data[1] = *in;
+		pkt->shdr.hdr.size += sizeof(u32) * 2;
+		break;
+	}
+	default:
+		return pkt_session_set_property_4xx(pkt, cookie, ptype, pdata);
+	}
+
+	return 0;
+}
+
 int pkt_session_get_property(struct hfi_session_get_property_pkt *pkt,
 			     void *cookie, u32 ptype)
 {
@@ -1236,7 +1280,10 @@ int pkt_session_set_property(struct hfi_session_set_property_pkt *pkt,
 	if (hfi_ver == HFI_VERSION_3XX)
 		return pkt_session_set_property_3xx(pkt, cookie, ptype, pdata);
 
-	return pkt_session_set_property_4xx(pkt, cookie, ptype, pdata);
+	if (hfi_ver == HFI_VERSION_4XX)
+		return pkt_session_set_property_4xx(pkt, cookie, ptype, pdata);
+
+	return pkt_session_set_property_6xx(pkt, cookie, ptype, pdata);
 }
 
 void pkt_set_version(enum hfi_version version)
diff --git a/drivers/media/platform/qcom/venus/hfi_helper.h b/drivers/media/platform/qcom/venus/hfi_helper.h
index f6613df1d16b..db29a6d4a293 100644
--- a/drivers/media/platform/qcom/venus/hfi_helper.h
+++ b/drivers/media/platform/qcom/venus/hfi_helper.h
@@ -231,6 +231,7 @@
 #define HFI_RATE_CONTROL_VBR_CFR		0x1000003
 #define HFI_RATE_CONTROL_CBR_VFR		0x1000004
 #define HFI_RATE_CONTROL_CBR_CFR		0x1000005
+#define HFI_RATE_CONTROL_CQ			0x1000008
 
 #define HFI_VIDEO_CODEC_H264			0x00000002
 #define HFI_VIDEO_CODEC_H263			0x00000004
@@ -520,7 +521,8 @@
 enum hfi_version {
 	HFI_VERSION_1XX,
 	HFI_VERSION_3XX,
-	HFI_VERSION_4XX
+	HFI_VERSION_4XX,
+	HFI_VERSION_6XX,
 };
 
 struct hfi_buffer_info {
diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
index feed648550d1..c70cba29387a 100644
--- a/drivers/media/platform/qcom/venus/venc.c
+++ b/drivers/media/platform/qcom/venus/venc.c
@@ -740,8 +740,10 @@ static int venc_set_properties(struct venus_inst *inst)
 		rate_control = HFI_RATE_CONTROL_OFF;
 	else if (ctr->bitrate_mode == V4L2_MPEG_VIDEO_BITRATE_MODE_VBR)
 		rate_control = HFI_RATE_CONTROL_VBR_CFR;
-	else
+	else if (ctr->bitrate_mode == V4L2_MPEG_VIDEO_BITRATE_MODE_CBR)
 		rate_control = HFI_RATE_CONTROL_CBR_CFR;
+	else if (ctr->const_quality)
+		rate_control = HFI_RATE_CONTROL_CQ;
 
 	ptype = HFI_PROPERTY_PARAM_VENC_RATE_CONTROL;
 	ret = hfi_session_set_property(inst, ptype, &rate_control);
diff --git a/drivers/media/platform/qcom/venus/venc_ctrls.c b/drivers/media/platform/qcom/venus/venc_ctrls.c
index 8362dde7949e..43c50cf3199c 100644
--- a/drivers/media/platform/qcom/venus/venc_ctrls.c
+++ b/drivers/media/platform/qcom/venus/venc_ctrls.c
@@ -202,6 +202,9 @@ static int venc_op_s_ctrl(struct v4l2_ctrl *ctrl)
 	case V4L2_CID_MPEG_VIDEO_FRAME_RC_ENABLE:
 		ctr->rc_enable = ctrl->val;
 		break;
+	case V4L2_CID_MPEG_VIDEO_CONSTANT_QUALITY:
+		ctr->const_quality = ctrl->val;
+		break;
 	default:
 		return -EINVAL;
 	}
@@ -357,6 +360,9 @@ int venc_ctrl_init(struct venus_inst *inst)
 	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
 			  V4L2_CID_MPEG_VIDEO_FRAME_RC_ENABLE, 0, 1, 1, 1);
 
+	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
+			  V4L2_CID_MPEG_VIDEO_CONSTANT_QUALITY, 0, 100, 1, 0);
+
 	ret = inst->ctrl_handler.error;
 	if (ret)
 		goto err;
-- 
2.17.1

