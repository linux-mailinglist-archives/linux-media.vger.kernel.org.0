Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7911420EE73
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2020 08:29:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730357AbgF3G2h (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Jun 2020 02:28:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730236AbgF3G1x (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Jun 2020 02:27:53 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AE32C03E979
        for <linux-media@vger.kernel.org>; Mon, 29 Jun 2020 23:27:53 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id 35so8081551ple.0
        for <linux-media@vger.kernel.org>; Mon, 29 Jun 2020 23:27:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IHSDE3MCRa+j8pKcxUh7y14LEBciAICiE97iwJ5rqDM=;
        b=J+2x/+M77MfBW8HPgwGdfrtkc3vJUvLveNcRe8PHu861Z/YU8S/AkPNT9wC+6bsHZ/
         1+JGpmnqFFkdabkpZbCQnGcsFXQiRehA2+YDSKXcfWTjo8o7SU9mIER/DNWC8DAi7W0y
         6xK29NE+PVVinquGJjTjxsWSjcoAv893gIeO0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IHSDE3MCRa+j8pKcxUh7y14LEBciAICiE97iwJ5rqDM=;
        b=AML20NQUxYL3d0Hz8gYMSdUo2uBwGWiJTQH1OttfX2GPtlSrJ1WoIvzrI4/5k5oM2w
         kfMUqv4gihVmVaP+SIt97ZsBC6RysdwIFuRbzFLJAqjM2DPTgIbsKWixo9bWyAOsf+8a
         kim7/QRLV7+P/NKxVC5MNDy+nONp98MbUXUb6jcUYXxWfbE6tEfe3p9DvxaOxIAhjXRt
         DZ1SsiJ9CPzkHefU23LUGmvG43iPsuBeVECUNeYW8mxBbrqFZTUmRqhc8CmyBKY7Y8Ye
         QQlu+2W+ltxQwwJcaK679odd+GQM+x4dPScq3+6At5KmVhCD0Dlj7fruzyi1ncoceTB3
         K4+g==
X-Gm-Message-State: AOAM532MFkdEiw1ZxSVu9N/4hdY7lHqK40fxsX3wgXxfvIdVkZmo6ui2
        180GWOa+Grpcw3hb67lPeI6dBg==
X-Google-Smtp-Source: ABdhPJxabatUBNTtvr2Hv5NoLC7MLhlWxkg/fu+mXY41IkelDvc0R4c6tp8WIOAa9KUU6JPrZayROA==
X-Received: by 2002:a17:90a:3624:: with SMTP id s33mr9581648pjb.148.1593498454259;
        Mon, 29 Jun 2020 23:27:34 -0700 (PDT)
Received: from acourbot.tok.corp.google.com ([2401:fa00:8f:203:93d9:de4d:e834:3086])
        by smtp.gmail.com with ESMTPSA id d1sm1463366pfq.113.2020.06.29.23.27.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2020 23:27:33 -0700 (PDT)
From:   Alexandre Courbot <acourbot@chromium.org>
To:     Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Rui Wang <gtk_ruiwang@mediatek.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Pi-Hsun Shih <pihsun@chromium.org>,
        Maoguang Meng <maoguang.meng@mediatek.com>
Cc:     linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Alexandre Courbot <acourbot@chromium.org>
Subject: [PATCH 2/9] media: mtk-vcodec: vdec: handle firmware version field
Date:   Tue, 30 Jun 2020 15:27:04 +0900
Message-Id: <20200630062711.4169601-3-acourbot@chromium.org>
X-Mailer: git-send-email 2.27.0.212.ge8ba1cc988-goog
In-Reply-To: <20200630062711.4169601-1-acourbot@chromium.org>
References: <20200630062711.4169601-1-acourbot@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Firmwares for decoders newer than MT8173 will include an ABI version
number in their initialization ack message. Add the capacity to manage
it and make initialization fail if the firmware ABI is of a version that
we don't support.

For MT8173, this ABI version field does not exist ; thus ignore it on
this chip. There should only be one firmware version available for it
anyway.

Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
---
 .../mtk-vcodec/mtk_vcodec_dec_stateful.c      |  1 +
 .../platform/mtk-vcodec/mtk_vcodec_drv.h      |  4 ++++
 .../media/platform/mtk-vcodec/vdec_ipi_msg.h  |  5 +++++
 .../media/platform/mtk-vcodec/vdec_vpu_if.c   | 21 +++++++++++++++++--
 4 files changed, 29 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateful.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateful.c
index 3224c8049255..b4dad8767f3c 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateful.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateful.c
@@ -619,6 +619,7 @@ static struct vb2_ops mtk_vdec_frame_vb2_ops = {
 };
 
 const struct mtk_vcodec_dec_pdata mtk_vdec_8173_pdata = {
+	.chip = MTK_MT8173,
 	.init_vdec_params = mtk_init_vdec_params,
 	.ctrls_setup = mtk_vcodec_dec_ctrls_setup,
 	.vdec_vb2_ops = &mtk_vdec_frame_vb2_ops,
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
index 388659c28603..386712f9bffc 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
@@ -322,6 +322,8 @@ enum mtk_chip {
  * @vdec_framesizes: supported video decoder frame sizes
  * @num_framesizes: count of video decoder frame sizes
  *
+ * @chip: chip this decoder is compatible with
+ *
  * @uses_stateless_api: whether the decoder uses the stateless API with requests
  */
 
@@ -341,6 +343,8 @@ struct mtk_vcodec_dec_pdata {
 	const struct mtk_codec_framesizes *vdec_framesizes;
 	const int num_framesizes;
 
+	enum mtk_chip chip;
+
 	bool uses_stateless_api;
 };
 
diff --git a/drivers/media/platform/mtk-vcodec/vdec_ipi_msg.h b/drivers/media/platform/mtk-vcodec/vdec_ipi_msg.h
index 47a1c1c0fd04..eb66729fda63 100644
--- a/drivers/media/platform/mtk-vcodec/vdec_ipi_msg.h
+++ b/drivers/media/platform/mtk-vcodec/vdec_ipi_msg.h
@@ -83,12 +83,17 @@ struct vdec_ap_ipi_dec_start {
  * @status	: VPU exeuction result
  * @ap_inst_addr	: AP vcodec_vpu_inst instance address
  * @vpu_inst_addr	: VPU decoder instance address
+ * @vdec_abi_version:	ABI version of the firmware. Kernel can use it to
+ *			ensure that it is compatible with the firmware.
+ *			This field is not valid for MT8173 and must not be
+ *			accessed for this chip.
  */
 struct vdec_vpu_ipi_init_ack {
 	uint32_t msg_id;
 	int32_t status;
 	uint64_t ap_inst_addr;
 	uint32_t vpu_inst_addr;
+	uint32_t vdec_abi_version;
 };
 
 #endif
diff --git a/drivers/media/platform/mtk-vcodec/vdec_vpu_if.c b/drivers/media/platform/mtk-vcodec/vdec_vpu_if.c
index 58b0e6fa8fd2..203089213e67 100644
--- a/drivers/media/platform/mtk-vcodec/vdec_vpu_if.c
+++ b/drivers/media/platform/mtk-vcodec/vdec_vpu_if.c
@@ -24,6 +24,22 @@ static void handle_init_ack_msg(const struct vdec_vpu_ipi_init_ack *msg)
 	vpu->inst_addr = msg->vpu_inst_addr;
 
 	mtk_vcodec_debug(vpu, "- vpu_inst_addr = 0x%x", vpu->inst_addr);
+
+	/* Firmware version field does not exist on MT8173. */
+	if (vpu->ctx->dev->vdec_pdata->chip == MTK_MT8173)
+		return;
+
+	/* Check firmware version. */
+	mtk_vcodec_debug(vpu, "firmware version 0x%x\n", msg->vdec_abi_version);
+	switch (msg->vdec_abi_version) {
+	case 1:
+		break;
+	default:
+		mtk_vcodec_err(vpu, "unhandled firmware version 0x%x\n",
+			       msg->vdec_abi_version);
+		vpu->failure = 1;
+		break;
+	}
 }
 
 /*
@@ -44,6 +60,9 @@ static void vpu_dec_ipi_handler(void *data, unsigned int len, void *priv)
 
 	mtk_vcodec_debug(vpu, "+ id=%X", msg->msg_id);
 
+	vpu->failure = msg->status;
+	vpu->signaled = 1;
+
 	if (msg->status == 0) {
 		switch (msg->msg_id) {
 		case VPU_IPIMSG_DEC_INIT_ACK:
@@ -63,8 +82,6 @@ static void vpu_dec_ipi_handler(void *data, unsigned int len, void *priv)
 	}
 
 	mtk_vcodec_debug(vpu, "- id=%X", msg->msg_id);
-	vpu->failure = msg->status;
-	vpu->signaled = 1;
 }
 
 static int vcodec_vpu_send_msg(struct vdec_vpu_inst *vpu, void *msg, int len)
-- 
2.27.0.212.ge8ba1cc988-goog

