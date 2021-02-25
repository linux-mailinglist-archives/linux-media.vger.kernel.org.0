Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8052324E0B
	for <lists+linux-media@lfdr.de>; Thu, 25 Feb 2021 11:30:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229466AbhBYKXr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Feb 2021 05:23:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232365AbhBYKRM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Feb 2021 05:17:12 -0500
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 228D5C061574
        for <linux-media@vger.kernel.org>; Thu, 25 Feb 2021 02:16:32 -0800 (PST)
Received: by mail-pg1-x533.google.com with SMTP id e6so3476233pgk.5
        for <linux-media@vger.kernel.org>; Thu, 25 Feb 2021 02:16:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=s7mSN+irdwIhsF2IwhZRcQVeKmeP7JQ9ahNUIts3x4s=;
        b=VA5P4FPtqDNjUTPqvHbPbfMmrqsH/+bthZa1qtHJ5xmR0AU6RudvpkJcVgUAa4EuVs
         ZFn+G9aSx4gYOB8iqycClcB2AW96HHdAZojWASQNJB+dVurhn5zkaoiqlRcysc83MB/c
         STAeqH+KNyctpBpOrIYwiRLAeL3Ve0Yl5LOwU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=s7mSN+irdwIhsF2IwhZRcQVeKmeP7JQ9ahNUIts3x4s=;
        b=myTA/CoxVllo5mUvxFvLyhFdL8AFw68+q5gOmAmoFZ0D3o+Okqb3XP/SNqxuQ19Evp
         3cn5FfTgMMm2VMlmdvDtXLdnfpsLAhEoQWauTxCISEOQcs2n+k54gXOgdlugEgpR7Rcz
         CqyS4/OhuTdxdsnUw69KlFgTJ8LbzppB4QwydGwE6DcEHSB1R7JRpncUu5DwnV8T4em+
         BzYE81DCrfJ0yYjBsaH/YshGpMbTHCfkb7mm8S5IefKQtDDiUlmfel4ow3Yv+tqcnEZ2
         sJACay9EtegwQpcJacT0fFNoFxFT9UIMxsAUMKf0jjru/av/iR8Wkk1v4gya1ds2Lkgv
         JBjg==
X-Gm-Message-State: AOAM531Mt+Zec00iHZg+8FTA2dtpz/acw5ZLsHr06HLKD3WyhEJBVi7G
        RCU8h5rnaZUOQUqXxcOn9S5cZA==
X-Google-Smtp-Source: ABdhPJwlZgpK53Z/Lqs96ckBIaWhONyBJg+ghT63Pz7grsmKbH9NbNbSweCCB8j+N1FExWWmxODj6A==
X-Received: by 2002:aa7:8e51:0:b029:1ed:2928:18ff with SMTP id d17-20020aa78e510000b02901ed292818ffmr2537841pfr.76.1614248191668;
        Thu, 25 Feb 2021 02:16:31 -0800 (PST)
Received: from acourbot.tok.corp.google.com ([2401:fa00:8f:203:2550:3154:2c53:b6e7])
        by smtp.gmail.com with ESMTPSA id z2sm5848193pfc.8.2021.02.25.02.16.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Feb 2021 02:16:31 -0800 (PST)
From:   Alexandre Courbot <acourbot@chromium.org>
To:     Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Rob Herring <robh+dt@kernel.org>,
        Yunfei Dong <yunfei.dong@mediatek.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        Alexandre Courbot <acourbot@chromium.org>
Subject: [PATCH v2 2/8] media: mtk-vcodec: support version 2 of decoder firmware ABI
Date:   Thu, 25 Feb 2021 19:16:06 +0900
Message-Id: <20210225101612.2832444-3-acourbot@chromium.org>
X-Mailer: git-send-email 2.30.0.617.g56c4b15f3c-goog
In-Reply-To: <20210225101612.2832444-1-acourbot@chromium.org>
References: <20210225101612.2832444-1-acourbot@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add support for decoder firmware version 2, which makes the kernel
responsible for managing the VSI context and is used for stateless
codecs.

Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
---
 .../media/platform/mtk-vcodec/vdec_ipi_msg.h  | 18 +++++++++---
 .../media/platform/mtk-vcodec/vdec_vpu_if.c   | 28 +++++++++++++++----
 .../media/platform/mtk-vcodec/vdec_vpu_if.h   |  5 ++++
 3 files changed, 42 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/mtk-vcodec/vdec_ipi_msg.h b/drivers/media/platform/mtk-vcodec/vdec_ipi_msg.h
index eb66729fda63..a0e773ae3ab3 100644
--- a/drivers/media/platform/mtk-vcodec/vdec_ipi_msg.h
+++ b/drivers/media/platform/mtk-vcodec/vdec_ipi_msg.h
@@ -29,11 +29,15 @@ enum vdec_ipi_msgid {
 /**
  * struct vdec_ap_ipi_cmd - generic AP to VPU ipi command format
  * @msg_id	: vdec_ipi_msgid
- * @vpu_inst_addr	: VPU decoder instance address
+ * @vpu_inst_addr : VPU decoder instance address. Used if ABI version < 2.
+ * @inst_id     : instance ID. Used if the ABI version >= 2.
  */
 struct vdec_ap_ipi_cmd {
 	uint32_t msg_id;
-	uint32_t vpu_inst_addr;
+	union {
+		uint32_t vpu_inst_addr;
+		uint32_t inst_id;
+	};
 };
 
 /**
@@ -63,7 +67,8 @@ struct vdec_ap_ipi_init {
 /**
  * struct vdec_ap_ipi_dec_start - for AP_IPIMSG_DEC_START
  * @msg_id	: AP_IPIMSG_DEC_START
- * @vpu_inst_addr	: VPU decoder instance address
+ * @vpu_inst_addr : VPU decoder instance address. Used if ABI version < 2.
+ * @inst_id     : instance ID. Used if the ABI version >= 2.
  * @data	: Header info
  *	H264 decoder [0]:buf_sz [1]:nal_start
  *	VP8 decoder  [0]:width/height
@@ -72,7 +77,10 @@ struct vdec_ap_ipi_init {
  */
 struct vdec_ap_ipi_dec_start {
 	uint32_t msg_id;
-	uint32_t vpu_inst_addr;
+	union {
+		uint32_t vpu_inst_addr;
+		uint32_t inst_id;
+	};
 	uint32_t data[3];
 	uint32_t reserved;
 };
@@ -87,6 +95,7 @@ struct vdec_ap_ipi_dec_start {
  *			ensure that it is compatible with the firmware.
  *			This field is not valid for MT8173 and must not be
  *			accessed for this chip.
+ * @inst_id     : instance ID. Valid only if the ABI version >= 2.
  */
 struct vdec_vpu_ipi_init_ack {
 	uint32_t msg_id;
@@ -94,6 +103,7 @@ struct vdec_vpu_ipi_init_ack {
 	uint64_t ap_inst_addr;
 	uint32_t vpu_inst_addr;
 	uint32_t vdec_abi_version;
+	uint32_t inst_id;
 };
 
 #endif
diff --git a/drivers/media/platform/mtk-vcodec/vdec_vpu_if.c b/drivers/media/platform/mtk-vcodec/vdec_vpu_if.c
index 203089213e67..5dffc459a33d 100644
--- a/drivers/media/platform/mtk-vcodec/vdec_vpu_if.c
+++ b/drivers/media/platform/mtk-vcodec/vdec_vpu_if.c
@@ -25,18 +25,30 @@ static void handle_init_ack_msg(const struct vdec_vpu_ipi_init_ack *msg)
 
 	mtk_vcodec_debug(vpu, "- vpu_inst_addr = 0x%x", vpu->inst_addr);
 
+	/* Set default ABI version if dealing with unversioned firmware. */
+	vpu->fw_abi_version = 0;
+	/*
+	 * Instance ID is only used if ABI version >= 2. Initialize it with
+	 * garbage by default.
+	 */
+	vpu->inst_id = 0xdeadbeef;
+
 	/* Firmware version field does not exist on MT8173. */
 	if (vpu->ctx->dev->vdec_pdata->chip == MTK_MT8173)
 		return;
 
 	/* Check firmware version. */
-	mtk_vcodec_debug(vpu, "firmware version 0x%x\n", msg->vdec_abi_version);
-	switch (msg->vdec_abi_version) {
+	vpu->fw_abi_version = msg->vdec_abi_version;
+	mtk_vcodec_debug(vpu, "firmware version 0x%x\n", vpu->fw_abi_version);
+	switch (vpu->fw_abi_version) {
 	case 1:
 		break;
+	case 2:
+		vpu->inst_id = msg->inst_id;
+		break;
 	default:
 		mtk_vcodec_err(vpu, "unhandled firmware version 0x%x\n",
-			       msg->vdec_abi_version);
+			       vpu->fw_abi_version);
 		vpu->failure = 1;
 		break;
 	}
@@ -113,7 +125,10 @@ static int vcodec_send_ap_ipi(struct vdec_vpu_inst *vpu, unsigned int msg_id)
 
 	memset(&msg, 0, sizeof(msg));
 	msg.msg_id = msg_id;
-	msg.vpu_inst_addr = vpu->inst_addr;
+	if (vpu->fw_abi_version < 2)
+		msg.vpu_inst_addr = vpu->inst_addr;
+	else
+		msg.inst_id = vpu->inst_id;
 
 	err = vcodec_vpu_send_msg(vpu, &msg, sizeof(msg));
 	mtk_vcodec_debug(vpu, "- id=%X ret=%d", msg_id, err);
@@ -163,7 +178,10 @@ int vpu_dec_start(struct vdec_vpu_inst *vpu, uint32_t *data, unsigned int len)
 
 	memset(&msg, 0, sizeof(msg));
 	msg.msg_id = AP_IPIMSG_DEC_START;
-	msg.vpu_inst_addr = vpu->inst_addr;
+	if (vpu->fw_abi_version < 2)
+		msg.vpu_inst_addr = vpu->inst_addr;
+	else
+		msg.inst_id = vpu->inst_id;
 
 	for (i = 0; i < len; i++)
 		msg.data[i] = data[i];
diff --git a/drivers/media/platform/mtk-vcodec/vdec_vpu_if.h b/drivers/media/platform/mtk-vcodec/vdec_vpu_if.h
index 85224eb7e34b..c2ed5b6cab8b 100644
--- a/drivers/media/platform/mtk-vcodec/vdec_vpu_if.h
+++ b/drivers/media/platform/mtk-vcodec/vdec_vpu_if.h
@@ -18,6 +18,9 @@ struct mtk_vcodec_ctx;
  *                for control and info share
  * @failure     : VPU execution result status, 0: success, others: fail
  * @inst_addr	: VPU decoder instance address
+ * @fw_abi_version : ABI version of the firmware.
+ * @inst_id	: if fw_abi_version >= 2, contains the instance ID to be given
+ *                in place of inst_addr in messages.
  * @signaled    : 1 - Host has received ack message from VPU, 0 - not received
  * @ctx         : context for v4l2 layer integration
  * @dev		: platform device of VPU
@@ -29,6 +32,8 @@ struct vdec_vpu_inst {
 	void *vsi;
 	int32_t failure;
 	uint32_t inst_addr;
+	uint32_t fw_abi_version;
+	uint32_t inst_id;
 	unsigned int signaled;
 	struct mtk_vcodec_ctx *ctx;
 	wait_queue_head_t wq;
-- 
2.30.0.617.g56c4b15f3c-goog

